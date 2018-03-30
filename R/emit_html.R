#' Transform an HTML table object to an HTML fragment
#'
#' Take a suitably styled HTML table object and
#' transform it to an HTML fragment. This is the
#' final step in the \code{gt()} -> ... ->
#' \code{emit_html()} pattern.
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @return a character object with an HTML fragment.
#' @examples
#' # Create an html table object using the
#' # iris dataset
#' html_table <- gt(tbl = iris)
#'
#' # The resulting object can be used
#' # in transformations
#' html_table_transformed <-
#'   html_table %>%
#'   add_column_style(
#'     columns = 1,
#'     property = "color",
#'     values = "blue")
#'
#' # We can extract the HTML from the
#' # HTML table object using `emit_html()`
#' html_table_transformed %>%
#'   emit_html()
#' @importFrom dplyr pull mutate filter case_when inner_join bind_rows
#' @importFrom dplyr group_by summarize arrange select
#' @importFrom glue glue
#' @importFrom rlang squash_chr
#' @importFrom knitr asis_output
#' @importFrom purrr map
#' @export
emit_html <- function(html_tbl) {

  # Apply transformations ---------------------------------------------------

  # Get table of transformation options
  transform_opts <- html_tbl[["transform_opts"]]

  # Apply theme if any theme setting is applied
  if ("theme" %in% transform_opts$type) {

    theme_name <-
      transform_opts %>%
      dplyr::filter(type == "theme") %>%
      dplyr::pull(transform)

    if (theme_name == "striped") {
      html_tbl <- htt_theme_striped(html_tbl = html_tbl)
    }
  }

  # Apply center alignment if any such transformations are applied
  if ("alignment_center" %in% transform_opts$type) {

    transforms <-
      transform_opts %>%
      dplyr::filter(type == "alignment_center") %>%
      dplyr::pull(transform)

    html_tbl <-
      htt_alignment(
        html_tbl = html_tbl,
        transform = transforms[1],
        align_type = "center")
  }

  # Apply left alignment if any such transformations are applied
  if ("alignment_left" %in% transform_opts$type) {

    transforms <-
      transform_opts %>%
      dplyr::filter(type == "alignment_left") %>%
      dplyr::pull(transform)

    html_tbl <-
      htt_alignment(
        html_tbl = html_tbl,
        transform = transforms[1],
        align_type = "left")
  }

  # Apply right alignment if any such transformations are applied
  if ("alignment_right" %in% transform_opts$type) {

    transforms <-
      transform_opts %>%
      dplyr::filter(type == "alignment_right") %>%
      dplyr::pull(transform)

    html_tbl <-
      htt_alignment(
        html_tbl = html_tbl,
        transform = transforms[1],
        align_type = "right")
  }

  # Extract object components -----------------------------------------------

  heading <- html_tbl[["heading"]]
  source_note <- html_tbl[["source_note"]]
  stubhead_caption <- html_tbl[["stubhead_caption"]]

  boxhead_panel <- html_tbl[["boxhead_panel"]]

  html_head <- html_tbl[["html_head"]]
  html_table <- html_tbl[["html_table"]]

  # Table Part: Spanner Headings --------------------------------------------

  # Generate the spanner headings
  if (nrow(boxhead_panel) > 0) {

    html_tbl <- modify_spanner_headings(html_tbl = html_tbl)

    html_table <- html_tbl[["html_table"]]
  }


  # Process `html_table` heading --------------------------------------------

  # A method to merge cells with the same content value and
  # generate row_span and col_span values

  table_heading_styles <-
    gt:::transmute_style_attrs(html_table_component = html_table) %>%
    dplyr::filter(row <= 0) %>%
    dplyr::mutate(style_attrs = case_when(
      row <= 0 & style_attrs != "" ~ glue::glue("style=\"{style_attrs}\"") %>% as.character(),
      row <= 0 & style_attrs == "" ~ glue::glue("") %>% as.character()))

  table_heading_styles_row_column <-
    table_heading_styles %>% select(content, row, column) %>%
    mutate(rowspan = 1L, colspan = 1L)

  # Move column-wise (sort by row then column)
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
              rowspan = min(rowspan) %>% as.integer(),
              colspan = sum(colspan)),
          table_heading_styles_row_column[-c(i - 1, i), ])
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
    dplyr::select(-rowspan, -colspan) %>%
    dplyr::mutate(heading_tag = glue::glue("<th {style_attrs} {rowspan_attrs} {colspan_attrs}>{content}</th>"))

  # Process `html_table` content --------------------------------------------

  table_content_styles <-
    gt:::transmute_style_attrs(html_table_component = html_table) %>%
    dplyr::filter(row > 0) %>%
    dplyr::mutate(style_attrs = case_when(
      style_attrs != "" ~ glue::glue("<td style=\"{style_attrs}\">{content}</td>") %>% as.character(),
      style_attrs == "" ~ glue::glue("<td>{content}</td>") %>% as.character()))


  # Create `table_heading_component` ----------------------------------------

  table_head_styles <-
    gt:::transmute_style_attrs(html_table_component = html_head) %>%
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
        border_bottom = NULL)

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

  } else {
    source_note_component <- ""
  }


  # Compose the HTML Table --------------------------------------------------

  paste(
    "<!--html_preserve-->\n",
    table_component,
    table_caption_component,
    thead_component,
    table_heading_component,
    thead_closing_component,
    tbody_component,
    table_body_component,
    tbody_closing_component,
    source_note_component,
    table_closing_component,
    "<!--/html_preserve-->\n",
    collapse = "") %>%
    knitr::asis_output()
}
