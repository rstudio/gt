#' Transform a gt table object to an HTML table
#'
#' Take a \code{gt_tbl} table object and transform
#' it to an HTML table.
#' @param tbl a \code{gt_tbl} object that is
#' created using the \code{gt()} function.
#' @return a character object with an HTML table
#' @importFrom dplyr mutate group_by summarize ungroup rename arrange
#' @importFrom stringr str_extract_all str_split
#' @importFrom stats setNames
#' @noRd
render_as_html <- function(tbl) {

  # Determine if there is a populated stub
  if (!all(is.na(tbl$stub_df$rowname)) ||
      !all(is.na(tbl$stub_df$groupname))) {
    stub_available <- TRUE
  } else {
    stub_available <- FALSE
  }

  # Determine if there are any groups present
  if (!all(is.na(tbl$stub_df$groupname))) {
    groups_present <- TRUE
  } else {
    groups_present <- FALSE
  }

  # Determine if there are any spanners present
  if (!all(is.na(tbl$boxh_df[1,] %>% t() %>% as.vector()))) {
    spanners_present <- TRUE
  } else {
    spanners_present <- FALSE
  }

  if (stub_available) {

    stub_components <- c()

    if (any(!is.na(tbl$stub_df$rowname))) {
      stub_components <- c(stub_components, "row_name")
    }

    if (any(!is.na(tbl$stub_df$groupname))) {
      stub_components <- c(stub_components, "group_name")
    }
  }

  # Extract the table (case of table with no stub)
  if (stub_available == FALSE) {
    extracted <- tbl$output_df
    col_alignment <- tbl$boxh_df[3, ] %>% t() %>% as.vector()
  }

  # Extract the table (case of table with a stub w/ only row names)
  if (stub_available && all(stub_components == "row_name")) {
    stub_df <- tbl$stub_df
    colnames(stub_df)[2] <- ":row_name:"
    extracted <- cbind(stub_df, tbl$output_df)[, -1]
    col_alignment <- c("right", tbl$boxh_df[3, ] %>% t() %>% as.vector())
  }

  # Extract the table (case of table with a stub w/ only group names)
  if (stub_available && all(stub_components == "group_name")) {
    stub_df <- tbl$stub_df
    colnames(stub_df)[1] <- ":group_name:"
    extracted <- cbind(stub_df, tbl$output_df)[, -2]
    col_alignment <- c("right", tbl$boxh_df[3, ] %>% t() %>% as.vector())
  }

  # Extract the table (case of table with a stub of row and group names)
  if (stub_available && all(stub_components == c("row_name", "group_name"))) {

    stub_df <- tbl$stub_df
    colnames(stub_df) <- c(":group_name:", ":row_name:")

    # Combine stub with output table
    extracted <- cbind(stub_df, tbl$output_df)

    # Replace NA values in the `:group_name:` column
    if ("others_group" %in% names(tbl)) {
      extracted[which(is.na(extracted[, 1])), 1] <- tbl$others_group[[1]]
    } else {
      extracted[which(is.na(extracted[, 1])), 1] <- "Others"
    }

    if ("arrange_groups" %in% names(tbl)) {

      ordering <- tbl$arrange_groups$groups

      all_groups <- unique(extracted[, 1])

      ordering <- c(ordering, base::setdiff(all_groups, ordering))


      fmts_df <- cbind(extracted[, 1:2], tbl$fmts_df)
      foot_df <- cbind(extracted[, 1:2], tbl$foot_df)


      extracted_reorder <- fmts_df_reorder <- foot_df_reorder <- extracted[0, ]

      for (i in seq(ordering)) {

        extracted_reorder <-
          rbind(
            extracted_reorder,
            subset(extracted, `:group_name:` == ordering[i]))

        fmts_df_reorder <-
          rbind(
            fmts_df_reorder,
            subset(fmts_df, `:group_name:` == ordering[i]))

        foot_df_reorder <-
          rbind(
            foot_df_reorder,
            subset(foot_df, `:group_name:` == ordering[i]))
      }

      rownames(extracted_reorder) <- NULL
      rownames(fmts_df_reorder) <- NULL
      rownames(foot_df_reorder) <- NULL

      tbl$fmts_df <- fmts_df_reorder[, -c(1:2)]
      tbl$foot_df <- foot_df_reorder[, -c(1:2)]
      extracted <- extracted_reorder
    }

    groups_rows <-
      extracted %>%
      dplyr::mutate(`:row_number:` = 1:nrow(extracted)) %>%
      dplyr::group_by(`:group_name:`) %>%
      dplyr::summarize(row = min(`:row_number:`)) %>%
      dplyr::ungroup() %>%
      dplyr::rename(group = `:group_name:`) %>%
      dplyr::arrange(row)

    extracted <- extracted[, -1]
    col_alignment <- c("right", tbl$boxh_df[3, ] %>% t() %>% as.vector())
  }

  # Reset the rownames for the extracted content
  rownames(extracted) <- NULL

  # Get the number of rows and columns in `extracted`
  n_rows <- nrow(extracted)
  n_cols <- ncol(extracted)

  # Replace percent sign markers
  for (colname in colnames(tbl$fmts_df)) {
    for (row in 1:nrow(tbl$fmts_df)) {
      if (grepl("::percent", tbl$fmts_df[row, colname])) {
        extracted[row, colname] <- paste0(extracted[row, colname], "%")
      }
    }
  }

  # Replace currency values
  for (colname in colnames(tbl$fmts_df)) {
    for (row in 1:nrow(tbl$fmts_df)) {
      if (grepl("::curr.*", tbl$fmts_df[row, colname])) {

        pos <- substring(tbl$fmts_df[row, colname], 8, 8)
        symbol <- gsub("::curr_._", "", tbl$fmts_df[row, colname])

        if (pos == "l") {
          extracted[row, colname] <- paste0(symbol, extracted[row, colname])
        } else {
          extracted[row, colname] <- paste0(extracted[row, colname], symbol)
        }
      }
    }
  }

  # Extract the body content as a vector
  body_content <- as.vector(t(extracted))

  # Extract footnote references and place into separate list
  list_footnotes <-
    stringr::str_extract_all(
      string = as.vector(t(cbind(tbl$stub_df, tbl$foot_df)[, -1])),
      pattern = "::foot_\\d+?")

  for (i in seq(list_footnotes)) {
    if (length(list_footnotes[[i]]) == 0) {
      list_footnotes[[i]] <- NA
    } else {
      list_footnotes[[i]] <- gsub("::foot_", "", list_footnotes[[i]])
    }
  }

  # Replace values in scientific notation
  for (i in seq(body_content)) {
    if (grepl("[eE](\\+|-)\\d+?", body_content[i])) {
      body_content[i] <-
        ifelse(
          as.numeric(body_content[i]) >= 1 & as.numeric(body_content[i]) < 10,
          (stringr::str_split(body_content[i][which(grepl("[eE](\\+|-)\\d+?", body_content[i]))], "e") %>%
             unlist())[1],
          paste0(
            (stringr::str_split(body_content[i][which(grepl("[eE](\\+|-)\\d+?", body_content[i]))], "e") %>%
               unlist())[1],
            " &times; 10<sup class='gt_super'>",
            as.numeric(stringr::str_split(body_content[i][which(grepl("[eE](\\+|-)\\d+?", body_content[i]))], "e") %>%
                         unlist())[2],
            "</sup>"))
    }
  }

  # Replace any NA values
  if ("missing_mark" %in% names(tbl)) {

    for (i in seq(body_content)) {
      if (is.na(body_content[i])) {
        body_content[i] <- tbl$missing_mark[[1]]
      }
    }
  }

  # Handle any available footnotes
  if ("footnote" %in% names(tbl)) {

    glyphs_footnotes <- c()

    for (i in seq(list_footnotes)) {

      if (any(!is.na(list_footnotes[[i]]))) {

        footnote_glyph <- c()
        footnote_indices <- list_footnotes[[i]]

        for (j in seq(footnote_indices)) {

          footnote_text <-
            tbl$footnote[[1]][
              which(names(tbl$footnote[[1]]) == footnote_indices[j])] %>%
            unname()

          # Check if the footnote text has been seen before
          if (!(footnote_text %in% glyphs_footnotes)) {
            glyphs_footnotes <-
              c(glyphs_footnotes, stats::setNames(footnote_text, footnote_indices[j]))
          }

          footnote_glyph <-
            c(footnote_glyph, unname(which(glyphs_footnotes == footnote_text)))
        }

        body_content[i] <-
          paste0(
            body_content[i],
            ifelse(grepl("</sup>$", body_content[i]), " ", ""),
            "<sup class='gt_super font_italic'>",
            paste(footnote_glyph, collapse = ","),
            "</sup>")
      }
    }

    # Create the footnotes block
    footnote_component <-
      paste0(
        "<tfoot>\n<tr>\n<td colspan='", n_cols,
        "' class='footnote'>",
        paste0(
          "<sup class='gt_super'><em>", seq(glyphs_footnotes),
          "</em></sup> ", unname(glyphs_footnotes),
          collapse = "<br />"),
        "</td>\n</tr>\n</tfoot>")
  } else {
    footnote_component <- ""
  }

  # Create a heading
  if ("heading" %in% names(tbl)) {

    heading_component <-
      paste0(
        "<thead>\n<tr>\n<th class='heading title font_normal center' colspan='",
        n_cols, "'>", tbl$heading$title ,"</th>\n</tr>\n")

    if ("headnote" %in% names(tbl$heading)) {

      heading_component <-
        paste0(
          heading_component,
          paste0(
            "<tr>\n<th class='heading headnote font_normal center bottom_border' colspan='",
            n_cols, "'>", tbl$heading$headnote ,"</th>\n</tr>\n"))
    }
  } else {
    heading_component <- c()
  }

  heading_component <-
    paste0(
      heading_component,
      paste0(
        "<tr>\n<th class='spacer' colspan='", n_cols, "'></th>\n</tr>\n"))

  if ("source_note" %in% names(tbl)) {

    # Create a source note
    source_note_rows <-
      paste0(
        "<tfoot>\n",
        paste0(
          "<tr>\n<td colspan='", n_cols + 1 ,
          "' class='sourcenote'>", tbl$source_note[[1]],
          "</td>\n</tr>\n",
          collapse = ""),
        "</tfoot>\n")
  } else {
    source_note_rows <- ""
  }

  # Split the body_content by slices of rows
  row_splits <-
    split(body_content, ceiling(seq_along(body_content)/n_cols))

  body_rows <- c()
  for (i in 1:n_rows) {

    if (exists("groups_rows") && i %in% groups_rows$row) {
      body_rows <-
        c(body_rows,
          paste0(
            "<tr>\n<td class='stub_heading font_bold'>",
            groups_rows[which(groups_rows$row %in% i), 1][[1]],
            "</td>\n<td class='stub_heading_field' colspan='",
            n_cols - 1, "'></td>\n</tr>\n"))
    }

    body_rows <-
      c(body_rows,
        paste0(
          "<tr>\n",
          paste0(
            "<td class='row ", col_alignment, "'>",
            row_splits[i][[1]], "</td>", collapse = "\n"),
          "\n</tr>\n"))
  }

  body_rows <- body_rows %>% paste(collapse = "")

  table_body <-
    paste0(
      "<tbody class='table_body striped'>\n",
      body_rows,
      "</tbody>\n")

  table_start <- "<!--gt table start-->\n<table class='gt_table'>\n"

  # Compose the HTML heading
  headings <- names(extracted)

  # Merge the heading labels
  headings_rev <- headings %>% rev()
  labels_rev <- tbl$boxh_df[2, ] %>% unname() %>% t() %>% as.vector() %>% rev()

  for (i in seq(labels_rev)) {
    headings_rev[i] <- labels_rev[i]
  }
  headings <- rev(headings_rev)

  # If `stub_available` == TRUE, then replace with a set stubhead
  # caption or nothing
  if (stub_available &&
      "stubhead_caption" %in% names(tbl) &&
      ":row_name:" %in% headings) {
    headings[which(headings == ":row_name:")] <-
      tbl$stubhead_caption[[1]]
  } else if (":row_name:" %in% headings) {
    headings[which(headings == ":row_name:")] <- ""
  }

  if (spanners_present == FALSE) {

    table_col_headings <-
      paste0(
        "<tr>\n",
        paste0(
          "<th class='col_heading' rowspan='1' colspan='1'>",
          headings, "</th>", collapse = "\n"),
        "\n</tr>\n")

  } else {

    # spanners
    spanners <- tbl$boxh_df[1, ] %>% t() %>% as.vector()

    first_set <- c()
    second_set <- c()
    headings_stack <- c()

    if (stub_available) {
      first_set <-
        c(first_set,
          paste0(
            "<th class='col_heading' rowspan='2' colspan='1'>",
            headings[1], "</th>"))

      headings <- headings[-1]
    }

    for (i in seq(headings)) {

      if (is.na(spanners[i])) {

        first_set <-
          c(first_set,
            paste0(
              "<th class='col_heading' rowspan='2' colspan='1'>",
              headings[i], "</th>"))

        headings_stack <- c(headings_stack, headings[i])

      } else if (!is.na(spanners[i])) {

        if (i > 1) {
          if (is.na(spanners[i - 1])) {
            same_spanner <- FALSE
          } else if (spanners[i] == spanners[i - 1]) {
            same_spanner <- TRUE
          } else {
            same_spanner <- FALSE
          }
        } else {
          same_spanner <- FALSE
        }

        if (!same_spanner) {

          class <- "column_spanner"

          colspan <- 1L
          for (j in 1:length(spanners)) {

            if (is.na(spanners[i + j])) {
              spanner_adjacent <- FALSE
              break
            } else if (duplicated(spanners)[i + j]) {
              colspan <- colspan + 1L
            } else {
              spanner_adjacent <- ifelse(!is.na(spanners[i + j]), TRUE, FALSE)
              break
            }
          }

          if (spanner_adjacent) class <- paste0(class, " sep_right")

          first_set <-
            c(first_set,
              paste0(
                "<th class='col_heading ",
                class, "' rowspan='1' colspan='",
                colspan, "'>", spanners[i], "</th>"))
        }
      }
    }

    first_set <- paste(first_set, collapse = "\n")

    remaining_headings <-
      headings[!(headings %in% headings_stack)]

    second_set <-
      paste0(
        "<th class='col_heading' rowspan='1' colspan='1'>",
        remaining_headings, "</th>",
        collapse = "\n")

    table_col_headings <-
      paste0(
        "<tr>\n",
        first_set, "\n</tr>\n<tr>\n",
        second_set, "\n</tr>\n")
  }

  # Compose the HTML table
  html_table <-
    paste0(
      table_start,
      heading_component,
      table_col_headings,
      table_body,
      source_note_rows,
      footnote_component,
      collapse = "")

  html_table
}
