#' Transform an HTML table object to an HTML fragment
#'
#' Take a suitably styled HTML table object and
#' transform it to an HTML fragment.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @return a character object with an HTML fragment.
#' @importFrom dplyr pull mutate filter case_when inner_join bind_rows
#' @importFrom dplyr group_by summarize arrange select
#' @importFrom glue glue
#' @importFrom rlang squash_chr
#' @importFrom htmltools HTML
#' @importFrom purrr map
create_html <- function(html_tbl) {

  # Extract object components -----------------------------------------------

  fonts <- html_tbl[["fonts"]]
  aesthetics <- html_tbl[["aesthetics"]]

  heading <- html_tbl[["heading"]]
  source_note <- html_tbl[["source_note"]]
  footnote <- html_tbl[["footnote"]]
  stubhead_caption <- html_tbl[["stubhead_caption"]]

  boxhead_panel <- html_tbl[["boxhead_panel"]]

  html_head <- html_tbl[["html_head"]]
  html_table <- html_tbl[["html_table"]]


  # Determine which default fonts to use for each table part ----------------

  # Obtain default fonts for the heading
  if ("heading" %in% fonts$type) {
    fonts_heading <-
      fonts %>% dplyr::filter(type == "heading") %>%
      dplyr::select(-type) %>%
      unlist() %>% unname()
  } else {
    fonts_heading <-
      fonts %>% dplyr::filter(type == "all") %>%
      dplyr::select(-type) %>%
      unlist() %>% unname()
  }

  # Obtain default fonts for source notes
  if ("source_note" %in% fonts$type) {
    fonts_source_note <-
      fonts %>% dplyr::filter(type == "source_note") %>%
      dplyr::select(-type) %>%
      unlist() %>% unname()
  } else {
    fonts_source_note <-
      fonts %>% dplyr::filter(type == "all") %>%
      dplyr::select(-type) %>%
      unlist() %>% unname()
  }

  # Table Part: Spanner Headings --------------------------------------------

  # Generate the spanner headings
  if (nrow(boxhead_panel) > 0) {

    html_tbl <- modify_spanner_headings(html_tbl = html_tbl)
    html_table <- html_tbl[["html_table"]]
  }

  # Table Part: Stubhead Caption --------------------------------------------

  if ("stubhead" %in% (html_table %>% dplyr::pull(t_subpart)) &
      nrow(stubhead_caption) == 1) {

    html_table <-
      htt_tab_stubhead_caption(
        html_table_component = html_table,
        caption_text = stubhead_caption$caption_text,
        alignment = stubhead_caption$alignment)
  }

  # Process `html_table` heading --------------------------------------------

  # A method to merge cells with the same content value and
  # generate row_span and col_span values

  # Combine all style attributes into a
  # single column [`style_attrs`]
  table_heading_styles <-
    transmute_style_attrs(html_table_component = html_table) %>%
    dplyr::filter(row <= 0) %>%
    dplyr::mutate(style_attrs = case_when(
      row <= 0 & style_attrs != "" ~ glue::glue("style=\"{style_attrs}\"") %>%
        as.character(),
      row <= 0 & style_attrs == "" ~ glue::glue("") %>% as.character()))

  table_heading_styles_row_column <-
    table_heading_styles %>%
    dplyr::select(content, row, column) %>%
    dplyr::mutate(rowspan = 1L, colspan = 1L)

  # Move column-wise (sort by row then column)
  for (i in 1:nrow(table_heading_styles_row_column)) {

    if (i == nrow(table_heading_styles_row_column)) break

    if (table_heading_styles_row_column[c(i + 1, i), ]$content %>%
        unique() %>%
        length() == 1) {

      # Determine the number of columns of spanning
      for (j in seq(1, nrow(table_heading_styles_row_column))) {

        does_span <-
          table_heading_styles_row_column[seq(i, i + j), ]$content %>%
          unique() %>%
          length() == 1

        if (does_span == FALSE) {
          span_width <- j
          rows_affected <- seq(i, i + j - 1)
          break
        }
      }

      table_heading_styles_row_column <-
        dplyr::bind_rows(
          table_heading_styles_row_column[rows_affected, ] %>%
            dplyr::group_by(content) %>%
            dplyr::summarize(
              row = min(row) %>% as.integer(),
              column = min(column) %>% as.integer(),
              rowspan = min(rowspan) %>% as.integer(),
              colspan = span_width),
          table_heading_styles_row_column[-rows_affected, ])
    }
  }

  table_heading_styles_row_column <-
    table_heading_styles_row_column %>% filter(!is.na(content)) %>%
    arrange(column, row)

  # Move row-wise (sort by row then column)
  for (i in 2:nrow(table_heading_styles_row_column)) {

    if (table_heading_styles_row_column[c(i - 1, i), ]$content %>%
        unique() %>%
        length() == 1) {

      table_heading_styles_row_column <-
        dplyr::bind_rows(
          table_heading_styles_row_column[c(i - 1, i), ] %>%
            dplyr::group_by(content) %>%
            dplyr::summarize(
              row = min(row) %>% as.integer(),
              column = min(column) %>% as.integer(),
              rowspan = sum(rowspan),
              colspan = min(colspan) %>% as.integer()),
          table_heading_styles_row_column[-c(i - 1, i), ])
    }
  }

  table_heading_styles_row_column <-
    table_heading_styles_row_column %>% filter(!is.na(content)) %>%
    dplyr::arrange(row, column)

  table_heading_styles <-
    table_heading_styles %>%
    dplyr::inner_join(
      table_heading_styles_row_column,
      by = c("content", "row", "column")) %>%
    dplyr::mutate(rowspan_attrs = glue::glue("rowspan=\"{rowspan}\"") %>% as.character()) %>%
    dplyr::mutate(colspan_attrs = glue::glue("colspan=\"{colspan}\"") %>% as.character()) %>%
    dplyr::select(-rowspan, -colspan)

  # Rename `column_name` values if there are
  # any entries in `aesthetics`
  if ("cols_rename" %in% aesthetics$type) {

    replace_directives <-
      aesthetics %>%
      dplyr::filter(type == "cols_rename")

    columns <- replace_directives$columns
    renamed <- replace_directives$renamed

    for (i in seq(columns)) {

      table_heading_styles <-
        table_heading_styles %>%
        dplyr::mutate(content = case_when(
          column > 0 & row == 0 & column_name == columns[i] ~ renamed[i],
          column == 0 ~ content,
          TRUE ~ content))
    }
  }

  table_heading_styles <-
    table_heading_styles %>%
    dplyr::mutate(heading_tag = glue::glue("<th {style_attrs} {rowspan_attrs} {colspan_attrs}>{content}</th>"))

  # Process `html_table` content --------------------------------------------

  table_content_styles <-
    transmute_style_attrs(html_table_component = html_table) %>%
    dplyr::filter(row > 0) %>%
    dplyr::mutate(style_attrs = case_when(
      style_attrs != "" ~ glue::glue("<td style=\"{style_attrs}\">{content}</td>") %>% as.character(),
      style_attrs == "" ~ glue::glue("<td>{content}</td>") %>% as.character()))

  # Create `table_heading_component` ----------------------------------------

  table_head_styles <-
    transmute_style_attrs(html_table_component = html_head) %>%
    dplyr::mutate(style_attrs = case_when(
      column_name == "_table_" &
        style_attrs != "" ~ glue::glue("<table style=\"{style_attrs}\">\n") %>% as.character(),
      column_name == "_table_" &
        style_attrs == "" ~ "<table>\n",
      column_name == "_thead_" &
        style_attrs != "" ~ glue::glue("<thead style=\"{style_attrs}\">\n   <tr>\n") %>% as.character(),
      column_name == "_thead_" &
        style_attrs == "" ~ "<thead>\n   <tr>\n",
      column_name == "_tbody_" &
        style_attrs != "" ~ glue::glue("<tbody style=\"{style_attrs}\">\n") %>% as.character(),
      column_name == "_tbody_" &
        style_attrs == "" ~ "<tbody>\n"))

  # Get the `<table>` opening and closing tags
  table_component <- table_head_styles$style_attrs[1]
  table_closing_component <- "</table>\n"

  # Get the `<thead>` opening and closing tags
  thead_component <- table_head_styles$style_attrs[2]
  thead_closing_component <- " </thead>\n"

  # Get the `<tbody>` opening and closing tags
  tbody_component <- table_head_styles$style_attrs[3]
  tbody_closing_component <- "</tbody>\n"

  # Build the table heading component
  for (i in table_heading_styles$row %>% unique()) {

    if (i == (table_heading_styles$row %>% unique())[1]) {
      table_heading_component <- vector(mode = "character")
    }

    table_heading_component <-
      c(table_heading_component,
        table_heading_styles %>%
          dplyr::filter(row == i) %>%
          dplyr::pull(heading_tag) %>%
          paste(collapse = "\n") %>%
          paste0("<tr>\n", ., "</tr>\n"))
  }

  table_heading_component <-
    table_heading_component %>%
    paste(collapse = "\n")


  # Create `table_body_component` -------------------------------------------

  # Build the table body component
  table_body_component <-
    table_content_styles %>%
    dplyr::filter(row > 0) %>%
    dplyr::pull(row) %>%
    unique() %>%
    purrr::map(.f = function(x) {

      table_content_styles %>%
        dplyr::filter(row == x) %>%
        dplyr::pull(style_attrs) %>%
        paste("   ", ., collapse = "\n") %>%
        paste0("  <tr>\n", ., "\n  </tr>\n")
    }) %>%
    rlang::squash_chr() %>%
    paste(collapse = "")

  # Get the number of rows and columns in the table
  n_rows <- table_content_styles$row %>% unique() %>% length()
  n_columns <- table_content_styles$column %>% unique() %>% length()

  # Table Part: Caption -----------------------------------------------------

  # Generate the table caption as an HTML fragment
  if (nrow(heading) > 0) {

    table_caption_component <-
      to_html_table_caption(
        tbl = heading,
        font = fonts_heading)

  } else {
    table_caption_component <- ""
  }

  # Table Part: Source Note -------------------------------------------------

  # Generate the source note as an HTML fragment
  if (nrow(source_note) > 0) {

    source_note_component <-
      to_html_source_notes(
        tbl = source_note,
        span_amount = n_columns)

    source_note_rows <- nrow(source_note)

  } else {
    source_note_component <- ""
    source_note_rows <- 0
  }

  # Table Part: Footnotes ---------------------------------------------------

  # Generate the footnotes as an HTML fragment
  if (nrow(footnote) > 0) {

    footnote_component <-
      to_html_footnotes(
        tbl = footnote,
        span_amount = n_columns + source_note_rows)

  } else {
    footnote_component <- ""
  }

  # Compose the HTML Table --------------------------------------------------

  paste(
    table_component,
    table_caption_component,
    thead_component,
    table_heading_component,
    thead_closing_component,
    tbody_component,
    table_body_component,
    tbody_closing_component,
    source_note_component,
    footnote_component,
    table_closing_component,
    collapse = "") %>%
    htmltools::HTML()
}
