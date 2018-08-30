#' Get the HTML content of a gt table
#'
#' Get the HTML content string from a \code{gt_tbl} object as a single-length
#'   character vector. There is also the option to transform the HTML such that
#'   CSS styles are inlined. This option is preferable when using the output
#'   HTML table in an emailing context.
#' @param data a table object that is created using the \code{gt()} function.
#' @param inline_css an option to supply styles to table elements as inlined
#'   CSS styles.
#' @export
as_raw_html <- function(data, inline_css = TRUE) {

  # Generation of the HTML table
  html_table <- render_as_html(data = data)

  if (inline_css) {

    # Create inline styles
    html_table <-
      html_table %>%
      inline_html_styles(css_tbl = get_css_tbl(data))
  }

  html_table
}
