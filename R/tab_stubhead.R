#' Add label text to the stubhead
#'
#' Add a label to the stubhead of a **gt** table. The stubhead is the lone
#' element that is positioned left of the column labels, and above the stub. If
#' a stub does not exist, then there is no stubhead (so no change will be made
#' when using this function in that case). We have the flexibility to use
#' Markdown formatting for the stubhead label. Furthermore, if the table is
#' intended for HTML output, we can use HTML for the stubhead label.
#'
#' @inheritParams fmt_number
#' @param label The text to be used as the stubhead label We can optionally use
#'   the [md()] and [html()] functions to style the text as Markdown or to
#'   retain HTML elements in the text.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `gtcars` to create a gt table; add
#' # a stubhead label to describe what is
#' # in the stub
#' tab_1 <-
#'   gtcars %>%
#'   dplyr::select(model, year, hp, trq) %>%
#'   dplyr::slice(1:5) %>%
#'   gt(rowname_col = "model") %>%
#'   tab_stubhead(label = "car")
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_stubhead_1.svg}{options: width=100\%}}
#'
#' @family Create or Modify Parts
#'
#' @export
tab_stubhead <- function(data,
                         label) {

  data %>% dt_stubhead_label(label = label)
}
