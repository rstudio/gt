#' Add a table header
#'
#' We can add a table header to the \pkg{gt} table with a title and even a
#' subtitle. A table header is an optional table part that is positioned above
#' the column labels. We have the flexibility to use Markdown formatting for the
#' header's title and subtitle. Furthermore, if the table is intended for HTML
#' output, we can use HTML in either of the title or subtitle.
#' @inheritParams fmt_number
#' @param title,subtitle Text to be used in the table title and, optionally, for
#'   the table subtitle. We can elect to use the [md()] and [html()] helper
#'   functions to style the text as Markdown or to retain HTML elements in the
#'   text.
#' @return An object of class `gt_tbl`.
#' @examples
#' # Use `gtcars` to create a gt table;
#' # add a header part to contain a title
#' # and subtitle
#' tab_1 <-
#'   gtcars %>%
#'   dplyr::select(mfr, model, msrp) %>%
#'   dplyr::slice(1:5) %>%
#'   gt() %>%
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_header_1.svg}{options: width=100\%}}
#'
#' @family table-part creation/modification functions
#' @export
tab_header <- function(data,
                       title,
                       subtitle = NULL) {

  data %>% dt_heading_title_subtitle(title = title, subtitle = subtitle)
}
