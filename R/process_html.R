#' @export
process_html <- function(tbl) {

  # Determine if there is a stub
  if (!all(is.na(tbl$data$`:row_name:`)) ||
      !all(is.na(tbl$data$`:group_name:`))) {
    stub_available <- TRUE
  } else {
    stub_available <- FALSE
  }

  # Determine if there are any spanners present
  if (!all(is.na(tbl$data[4, c(-1, -2, -3)] %>% t() %>% as.vector()))) {
    spanners_present <- TRUE
  } else {
    spanners_present <- FALSE
  }

  if (stub_available) {

    stub_components <- c()

    if (any(!is.na(tbl$data$`:row_name:`))) {
      stub_components <- c(stub_components, "row_name")
    }

    if (any(!is.na(tbl$data$`:group_name:`[c(-1, -2, -3, -4)]))) {
      stub_components <- c(stub_components, "group_name")
    }
  }

  # Extract the table (case of table with no stub)
  if (stub_available == FALSE) {
    extracted <- tbl$data[c(-1, -2, -3, -4), c(-1, -2, -3)]
    col_alignment <- tbl$data[3, c(-1, -2, -3)] %>% t() %>% as.vector()
  }

  # Extract the table (case of table with a stub w/ only row names)
  if (stub_available & all(stub_components == "row_name")) {
    extracted <- tbl$data[c(-1, -2, -3, -4), c(-1, -2)]
    col_alignment <- tbl$data[3, c(-1, -2)] %>% t() %>% as.vector()
  }

  # Extract the table (case of table with a stub w/ only group names)
  if (stub_available & all(stub_components == "group_name")) {
    extracted <- tbl$data[c(-1, -2, -3, -4), c(-1, -3)]
    col_alignment <- tbl$data[3, c(-1, -2, -3)] %>% t() %>% as.vector()
  }

  # Extract the table (case of table with a stub of row and group names)
  if (stub_available & all(stub_components == c("row_name", "group_name"))) {
    extracted <- tbl$data[c(-1, -2, -3, -4), -1]
    col_alignment <- tbl$data[3, c(-1, -2)] %>% t() %>% as.vector()
  }

  # Reset the rownames for the extracted content
  rownames(extracted) <- NULL

  # Get the number of rows and columns in `extracted`
  n_rows <- nrow(extracted)
  n_cols <- ncol(extracted)

  # Extract the body content as a vector
  body_content <- as.vector(t(extracted))

  # Extract footnote references and place into separate list
  list_footnotes <-
    stringr::str_extract_all(
      string = body_content,
      pattern = "::foot_\\d+?")

  for (i in seq(list_footnotes)) {
    if (length(list_footnotes[[i]]) == 0) {
      list_footnotes[[i]] <- NA
    } else {
      list_footnotes[[i]] <- gsub("::foot_", "", list_footnotes[[i]])
    }
  }

  # Remove the footnote references from `body_content`
  body_content <- gsub("::foot_\\d+?", "", body_content)

  # Replace percent sign markers
  body_content <- gsub("::percent", "%", body_content)

  # Replace values in scientific notation
  body_content[which(grepl("[eE](\\+|-)\\d+?", body_content))] <-
    paste0(
      (stringr::str_split(body_content[which(grepl("[eE](\\+|-)\\d+?", body_content))], "e") %>%
         unlist())[1],
      " &times; 10<sup class='gt_super'>",
      as.numeric(stringr::str_split(body_content[which(grepl("[eE](\\+|-)\\d+?", body_content))], "e") %>%
                   unlist())[2],
      "</sup>")

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
              c(glyphs_footnotes, setNames(footnote_text, footnote_indices[j]))
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
        "<tr>\n<th colspan='", n_cols, "'></th>\n</tr>\n"))

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

    body_rows <-
      c(body_rows,
        paste0(
          "<tr>\n",
          paste0(
            "<td class='row ", col_alignment, "'>",
            row_splits[i][[1]], "</td>", collapse = "\n"),
          "\n</tr>\n")
      )
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
    spanners <- tbl$data[4, c(-1, -2, -3)] %>% t() %>% as.vector()

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

    second_set <-
      paste0(
        "<th class='col_heading' rowspan='1' colspan='1'>",
        base::setdiff(headings, headings_stack), "</th>",
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
