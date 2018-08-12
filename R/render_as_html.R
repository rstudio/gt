#' Transform a gt table object to an HTML table
#'
#' Take a \code{gt_tbl} table object and transform it to an HTML table.
#' @param data a table object that is created using the \code{gt()} function.
#' @return a character object with an HTML table
#' @importFrom dplyr mutate group_by summarize ungroup rename arrange
#' @importFrom stringr str_extract_all str_replace
#' @importFrom stats setNames
#' @family table export functions
#' @noRd
render_as_html <- function(data) {

  # Extract all attributes
  data_attr <- attributes(data)

  # Create `output_df` with rendered values
  data_attr$output_df <- render_formats(data = data, context = "html")

  # Move input data cells to `output_df` that didn't have
  # any rendering applied during `render_formats()`
  data_attr$output_df <-
    migrate_unformatted_to_output(
      data = data,
      output_df = data_attr$output_df)

  # Move original data frame to `data_attr$data_df`
  data_attr$data_df <- as.data.frame(data)

  # Get the available property names
  property_names <-
    base::setdiff(
      names(data_attr),
      c("row.names", "class", "names", "boxh_df", "stub_df",
        "fmts_df", "foot_df", "output_df", "data_df", "formats"))

  # Integrate any summary lines available
  if ("summary_auto" %in% property_names) {
    data_attr <- integrate_summary_lines(data_attr)
  }

  # Perform any necessary column merge operations
  if ("col_merge" %in% property_names) {
    data_attr <- perform_col_merge(data_attr)
  }

  # Apply column names to column labels for any of
  # those column labels not explicitly set
  data_attr$boxh_df <- migrate_colnames_to_labels(boxh_df = data_attr$boxh_df)

  # Assign center alignment for all columns
  # that haven't had alignment explicitly set
  data_attr$boxh_df <- set_default_alignments(boxh_df = data_attr$boxh_df)

  # Determine if there is a populated stub
  stub_available <- is_stub_available(stub_df = data_attr$stub_df)

  # Determine if there are any groups present
  groups_present <- are_groups_present(stub_df = data_attr$stub_df)

  # Determine if there are any spanners present
  spanners_present <- are_spanners_present(boxh_df = data_attr$boxh_df)

  # Get the available stub components, if any
  stub_components <- get_stub_components(stub_df = data_attr$stub_df)

  # Extract the table (case of table with no stub)
  if (is.null(stub_components)) {

    extracted <- data_attr$output_df
    col_alignment <- data_attr$boxh_df[3, ] %>% unlist() %>% unname()
    groups_rows <- NULL
  }

  # Extract the table (case of table with a stub w/ only row names)
  if (!is.null(stub_components) && identical(stub_components, "row_name")) {

    colnames(stub_df)[2] <- ":row_name:"
    extracted <- cbind(data_attr$stub_df, data_attr$output_df)[, -1]
    col_alignment <- c("right", data_attr$boxh_df[3, ] %>% unlist() %>% unname())
    groups_rows <- NULL
  }

  # Extract the table (case of table with a stub w/ only group names)
  if (!is.null(stub_components) && identical(stub_components, "group_name")) {

    colnames(data_attr$stub_df)[1] <- ":group_name:"
    extracted <- cbind(data_attr$stub_df, data_attr$output_df)[, -2]
    col_alignment <- c("right", data_attr$boxh_df[3, ] %>% unlist() %>% unname())
    groups_rows <- NULL
  }

  # Extract the table (case of table with a stub of row and group names)
  if (!is.null(stub_components) &&
      identical(stub_components, c("row_name", "group_name"))) {

    colnames(data_attr$stub_df) <- c(":group_name:", ":row_name:")

    # Combine stub with output table to form `extracted`
    extracted <- cbind(data_attr$stub_df, data_attr$output_df)

    # Replace NA values in the `:group_name:` column
    if ("others_group" %in% property_names) {
      extracted[which(is.na(extracted[, 1])), 1] <- data_attr$others_group[[1]]
    } else {
      extracted[which(is.na(extracted[, 1])), 1] <- "Others"
    }

    if ("arrange_groups" %in% property_names) {

      ordering <- data_attr$arrange_groups$groups

      all_groups <- unique(extracted[, 1])

      ordering <- c(ordering, base::setdiff(all_groups, ordering))

      data_attr$fmts_df <- cbind(extracted[, 1:2], data_attr$fmts_df)
      data_attr$foot_df <- cbind(extracted[, 1:2], data_attr$foot_df)

      extracted_reorder <- fmts_df_reorder <- foot_df_reorder <- extracted[0, ]

      for (i in seq(ordering)) {

        extracted_reorder <-
          rbind(
            extracted_reorder,
            subset(extracted, `:group_name:` == ordering[i]))

        fmts_df_reorder <-
          rbind(
            fmts_df_reorder,
            subset(data_attr$fmts_df, `:group_name:` == ordering[i]))

        foot_df_reorder <-
          rbind(
            foot_df_reorder,
            subset(data_attr$foot_df, `:group_name:` == ordering[i]))
      }

      rownames(extracted_reorder) <- NULL
      rownames(fmts_df_reorder) <- NULL
      rownames(foot_df_reorder) <- NULL

      data_attr$fmts_df <- fmts_df_reorder[, -c(1:2)]
      data_attr$foot_df <- foot_df_reorder[, -c(1:2)]
      extracted <- extracted_reorder
    }

    groups_rows <-
      data.frame(
        group = rep(NA_character_, length(ordering)),
        row = rep(NA_integer_, length(ordering)),
        stringsAsFactors = FALSE)

    for (i in seq(ordering)) {
      the_match <- match(ordering[i], extracted[, 1])
      groups_rows[i, 1] <- ordering[i]
      groups_rows[i, 2] <- the_match
    }

    extracted <- extracted[, -1]
    col_alignment <- c("right", data_attr$boxh_df[3, ] %>% unlist() %>% unname())
  }

  # Reset the rownames for the extracted content
  rownames(extracted) <- NULL

  # Get the number of rows and columns in `extracted`
  n_rows <- nrow(extracted)
  n_cols <- ncol(extracted)

  # Extract footnote references and place into a separate list
  list_footnotes <-
    stringr::str_extract_all(
      string = as.vector(t(cbind(data_attr$stub_df, data_attr$foot_df)[, -1])),
      pattern = "::foot_\\d+?")

  for (i in seq(list_footnotes)) {
    if (length(list_footnotes[[i]]) == 0) {
      list_footnotes[[i]] <- NA
    } else {
      list_footnotes[[i]] <- gsub("::foot_", "", list_footnotes[[i]])
    }
  }

  # Extract the body content as a vector
  body_content <- as.vector(t(extracted))

  # Handle any available footnotes
  if ("footnote" %in% property_names) {

    glyphs_footnotes <- c()

    for (i in seq(list_footnotes)) {

      if (any(!is.na(list_footnotes[[i]]))) {

        footnote_glyph <- c()
        footnote_indices <- list_footnotes[[i]]

        for (j in seq(footnote_indices)) {

          footnote_text <-
            data_attr$footnote[[1]][
              which(names(data_attr$footnote[[1]]) == footnote_indices[j])] %>%
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
        "<tfoot data-type='table_footnotes'>\n",
        "<tr data-type='table_footnote'>\n<td colspan='", n_cols,
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
  if ("heading" %in% property_names) {

    heading_component <-
      paste0(
        "<thead>\n<tr data-type='table_headings'>\n",
        "<th data-type='table_heading' class='heading title font_normal center' colspan='",
        n_cols, "'>", data_attr$heading$title ,"</th>\n</tr>\n")

    if ("headnote" %in% names(data_attr$heading)) {

      heading_component <-
        paste0(
          heading_component,
          paste0(
            "<tr data-type='table_headings'>\n",
            "<th data-type='table_headnote' ",
            "class='heading headnote font_normal center bottom_border' colspan='",
            n_cols, "'>", data_attr$heading$headnote ,"</th>\n</tr>\n"))
    }

  } else {
    heading_component <- c()
  }

  heading_component <-
    paste0(
      heading_component,
      paste0(
        "<tr>\n<th class='spacer' colspan='", n_cols, "'></th>\n</tr>\n"))

  if ("source_note" %in% property_names) {

    # Create a source note
    source_note_rows <-
      paste0(
        "<tfoot data-type='source_notes'>\n",
        paste0(
          "<tr>\n<td colspan='", n_cols + 1 ,
          "' class='sourcenote'>", data_attr$source_note[[1]],
          "</td>\n</tr>\n",
          collapse = ""),
        "</tfoot>\n")
  } else {
    source_note_rows <- ""
  }

  # Split the body_content by slices of rows
  row_splits <- split(body_content, ceiling(seq_along(body_content)/n_cols))

  body_rows <- c()
  for (i in 1:n_rows) {

    if (!is.null(groups_rows) && i %in% groups_rows$row) {
      body_rows <-
        c(body_rows,
          paste0(
            "<tr>\n",
            "<td data-type='stub_group' class='stub_heading font_bold'>",
            groups_rows[which(groups_rows$row %in% i), 1][[1]],
            "</td>\n<td class='stub_heading_field' colspan='",
            n_cols - 1, "'></td>\n</tr>\n"))
    }

    if (grepl("Summary: ", row_splits[i][[1]][[1]])) {

      if (grepl(paste0("__", color_tints(), "$", collapse = "|"),
                row_splits[i][[1]][[1]])) {

        # Extract the tint from the string
        tint <- gsub("^.*?__", "", row_splits[i][[1]][[1]])

        # Remove the tint indicator from the string
        row_splits[i][[1]][[1]] <-
          gsub(
            paste0("__", color_tints(), "$", collapse = "|"),
            "", row_splits[i][[1]][[1]])

      } else {
        tint <- ""
      }

      body_rows <-
        c(body_rows,
          paste0(
            "<tr data-type='summary' data-row='", i,"'>\n",
            paste0(
              "<td class='row summary_row ", tint, " ", col_alignment, "'>",
              row_splits[i][[1]], "</td>", collapse = "\n"),
            "\n</tr>\n"))

    } else {

      body_rows <-
        c(body_rows,
          paste0(
            "<tr data-type='data' data-row='", i,"'>\n",
            paste0(
              "<td class='row ", col_alignment, "'>",
              row_splits[i][[1]], "</td>", collapse = "\n"),
            "\n</tr>\n")
        )
    }
  }

  body_rows <- body_rows %>% paste(collapse = "")

  table_body <-
    paste0(
      "<tbody class='table_body striped'>\n",
      body_rows,
      "</tbody>\n")

  # Compose the HTML heading
  headings <- names(extracted)

  # Merge the heading labels
  headings_rev <- headings %>% rev()
  labels_rev <- data_attr$boxh_df[2, ] %>% unname() %>% unlist() %>% rev()

  for (i in seq(labels_rev)) {
    headings_rev[i] <- labels_rev[i]
  }
  headings <- rev(headings_rev)

  # If `stub_available` == TRUE, then replace with a set stubhead
  # caption or nothing
  if (stub_available &&
      "stubhead_caption" %in% property_names &&
      ":row_name:" %in% headings) {

    headings[which(headings == ":row_name:")] <-
      attr(data, "stubhead_caption")[[1]]

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
    spanners <- data_attr$boxh_df[1, ] %>% unlist() %>% unname()

    first_set <- c()
    second_set <- c()
    headings_stack <- c()

    if (stub_available) {
      first_set <-
        c(first_set,
          paste0(
            "<th data-type='column_heading' class='col_heading' rowspan='2' colspan='1'>",
            headings[1], "</th>"))

      headings <- headings[-1]
    }

    for (i in seq(headings)) {

      if (is.na(spanners[i])) {

        first_set <-
          c(first_set,
            paste0(
              "<th data-type='column_heading' class='col_heading' rowspan='2' colspan='1'>",
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
                "<th data-type='column_heading' class='col_heading ",
                class, "' rowspan='1' colspan='",
                colspan, "'>", spanners[i], "</th>"))
        }
      }
    }

    first_set <- paste(first_set, collapse = "\n")

    remaining_headings <- headings[!(headings %in% headings_stack)]

    second_set <-
      paste0(
        "<th data-type='column_heading' class='col_heading' rowspan='1' colspan='1'>",
        remaining_headings, "</th>",
        collapse = "\n")

    table_col_headings <-
      paste0(
        "<tr>\n",
        first_set, "\n</tr>\n<tr>\n",
        second_set, "\n</tr>\n")
  }

  # Create an HTML fragment for the start of the table
  table_start <-
    paste0(
      "<!--gt table start-->\n",
      "<table ",
      "data-nrow='", n_rows, "' ",
      "data-ncol='", n_cols, "' ",
      "data-ngroup='", get_n_groups(groups_rows), "' ",
      "class='gt_table'>\n")

  # Create an HTML fragment for the end of the table
  table_end <- "</table>\n<!--gt table end-->\n"

  # Compose the HTML table
  html_table <-
    paste0(
      table_start,
      heading_component,
      table_col_headings,
      table_body,
      source_note_rows,
      footnote_component,
      table_end,
      collapse = "")

  html_table
}
