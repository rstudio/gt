#' Get the HTML content of a \pkg{gt} table
#'
#' Get the HTML content from a \code{gt_tbl} object as a single-element
#' character vector. By default, the generated HTML will have inlined styles,
#' where CSS styles (that were previously contained in CSS rule sets external to
#' the \code{<table> element}) are included as \code{style} attributes in the
#' HTML table's tags. This option is preferable when using the output HTML table
#' in an emailing context.
#' @param data a table object that is created using the \code{\link{gt}()}
#'   function.
#' @param inline_css an option to supply styles to table elements as inlined CSS
#'   styles.
#' @examples
#' # Use `gtcars` to create a gt table;
#' # add a header and then export as
#' # HTML code with CSS inlined
#' tab_html <-
#'   gtcars %>%
#'   dplyr::select(mfr, model, msrp) %>%
#'   dplyr::slice(1:5) %>%
#'   gt() %>%
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   ) %>%
#'   as_raw_html()
#'
#' # `tab_html` is a single-element vector
#' # containing inlined HTML for the table;
#' # it has only the `<table>...</table>` part
#' # so it's not a complete HTML document but
#' # rather an HTML fragment
#' tab_html %>%
#'   substr(1, 700) %>%
#'   cat()
#'
#' @family table export functions
#' @export
as_raw_html <- function(data,
                        inline_css = TRUE) {

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
