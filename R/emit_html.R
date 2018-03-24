#' Transform an HTML table object to an HTML fragment
#'
#' Take a suitably styled HTML table object and
#' transform it to an HTML fragment. This is the
#' final step in the \code{build_html_table()} ->
#' \code{add_..._style()} -> \code{emit_html()}
#' pattern.
#' @param html_tbl an HTML table object that is
#' created using the \code{build_html_table()}
#' function.
#' @return a character object with an HTML fragment.
#' @examples
#' # Create an html table object using the
#' # iris dataset
#' html_table <- build_html_table(iris)
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
#' @importFrom dplyr pull mutate filter case_when
#' @importFrom glue glue
#' @importFrom tidyr unite
#' @importFrom purrr map
#' @importFrom rlang squash_chr
#' @importFrom knitr asis_output
#' @export
emit_html <- function(html_tbl) {

  # # Build heading part if there is content available
  # if (html_tbl[["html_heading"]] %>%
  #     dplyr::filter(t_subpart == "title") %>%
  #     dplyr::pull(content) != "") {
  #
  #   html_heading <- html_tbl[["html_heading"]]
  #
  #   col_begin_styles <- 8
  #
  #   if (ncol(html_heading) >= col_begin_styles) {
  #
  #     for (i in col_begin_styles:ncol(html_heading)) {
  #
  #       if (i == col_begin_styles) {
  #         style_names <- colnames(html_heading)[col_begin_styles:ncol(html_heading)]
  #       }
  #
  #       for (j in 1:nrow(html_heading)) {
  #
  #         if (is.na(html_heading[j, i])) {
  #
  #           html_heading[j, i] <- ""
  #
  #         } else {
  #
  #           html_heading[j, i] <-
  #             paste0(colnames(html_heading)[i], ":", html_heading[j, i] %>% dplyr::pull(), ";")
  #         }
  #       }
  #     }
  #   }
  #
  #   if (ncol(html_heading) >= col_begin_styles) {
  #
  #     table_content_styles <-
  #       html_heading %>%
  #       tidyr::unite(col = style_attrs, col_begin_styles:ncol(html_heading), sep = "")
  #
  #   } else {
  #
  #     table_content_styles <-
  #       html_heading %>%
  #       dplyr::mutate(style_attrs = "")
  #   }
  #
  #   table_content_styles <-
  #     table_content_styles %>%
  #     dplyr::mutate(style_attrs = case_when(
  #       style_attrs != "" ~ glue::glue("<td style=\"{style_attrs}\">{content}</td>") %>% as.character(),
  #       style_attrs == "" ~ glue::glue("<td>{content}</td>") %>% as.character()))
  # }

  # Build HTML component with `stub`, `boxhead`,
  # and `field` table parts
  html_tbl <- html_tbl[["html_table"]]

  col_begin_styles <- 8

  if (ncol(html_tbl) >= col_begin_styles) {

    for (i in col_begin_styles:ncol(html_tbl)) {

      if (i == col_begin_styles) {
        style_names <- colnames(html_tbl)[col_begin_styles:ncol(html_tbl)]
      }

      for (j in 1:nrow(html_tbl)) {

        if (is.na(html_tbl[j, i])) {

          html_tbl[j, i] <- ""

        } else {

          html_tbl[j, i] <-
            paste0(colnames(html_tbl)[i], ":", html_tbl[j, i] %>% dplyr::pull(), ";")
        }
      }
    }
  }

  if (ncol(html_tbl) >= col_begin_styles) {

    table_content_styles <-
      html_tbl %>%
      tidyr::unite(col = style_attrs, col_begin_styles:ncol(html_tbl), sep = "")

  } else {

    table_content_styles <-
      html_tbl %>%
      dplyr::mutate(style_attrs = "")
  }

  table_content_styles <-
    table_content_styles %>%
    dplyr::mutate(style_attrs = case_when(
      row %in% c(-1, -2, -3) & style_attrs != "" ~ style_attrs,
      row %in% c(-1, -2, -3) & style_attrs == "" ~ "",
      row ==  0 & style_attrs != "" ~ glue::glue("<th style=\"{style_attrs}\">{content}</th>") %>% as.character(),
      row ==  0 & style_attrs == "" ~ glue::glue("<th>{content}</th>") %>% as.character(),
      row  >  0 & style_attrs != "" ~ glue::glue("<td style=\"{style_attrs}\">{content}</td>") %>% as.character(),
      row  >  0 & style_attrs == "" ~ glue::glue("<td>{content}</td>") %>% as.character()))

  # TODO: row pertaining to the <table> style will
  # be moved into separate list component; this
  # statement will be affected
  style_attrs_table <-
    table_content_styles %>%
    dplyr::filter(column_name == "_table_") %>%
    dplyr::select(style_attrs) %>%
    dplyr::pull()

  # TODO: row pertaining to the <thead> style will
  # be moved into separate list component; this
  # statement will be affected
  style_attrs_thead <-
    table_content_styles %>%
    dplyr::filter(column_name == "_thead_") %>%
    dplyr::select(style_attrs) %>%
    dplyr::pull()

  # TODO: row pertaining to the <tbody> style will
  # be moved into separate list component; this
  # statement will be affected
  style_attrs_tbody <-
    table_content_styles %>%
    dplyr::filter(column_name == "_tbody_") %>%
    dplyr::select(style_attrs) %>%
    dplyr::pull()

  # Construct the `<table>` tag
  table_component <-
    ifelse(style_attrs_table == "", "<table>\n",
           glue::glue("<table style=\"{style_attrs_table}\">\n") %>%
             as.character())

  # Construct the `<thead>` tag
  thead_component <-
    ifelse(style_attrs_thead == "", " <thead>\n   <tr>\n",
           glue::glue("<thead style=\"{style_attrs_thead}\">\n   <tr>\n") %>%
             as.character())

  # Build the table heading component
  table_heading_component <-
    table_content_styles %>%
    dplyr::filter(row == 0) %>%
    dplyr::pull(style_attrs) %>%
    paste("   ", ., "\n", collapse = "")

  # Define the thead closing component
  thead_closing_component <- " </thead>\n"

  tbody_component <-
    ifelse(style_attrs_tbody == "", " <tbody>\n",
           glue::glue(" <tbody style=\"{style_attrs_tbody}\">\n") %>%
             as.character())

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

  # Define the table closing component
  table_closing_component <- "</tbody>\n</table>\n"

  paste(
    "<!--html_preserve-->\n",
    table_component,
    thead_component,
    table_heading_component,
    thead_closing_component,
    tbody_component,
    table_body_component,
    table_closing_component, "<br />",
    "<!--/html_preserve-->\n",
    collapse = "") %>%
    knitr::asis_output()
}
