#' Add a source note citation
#'
#' Add a source note to the footer part of the \pkg{gt} table. A source note is
#' useful for citing the data included in the table. Several can be added to the
#' footer, simply use multiple calls of `tab_source_note()` and they will be
#' inserted in the order provided. We can use Markdown formatting for the note,
#' or, if the table is intended for HTML output, we can include HTML formatting.
#' @inheritParams fmt_number
#' @param source_note Text to be used in the source note. We can optionally use
#'   the [md()] and [html()] functions to style the text as Markdown or to
#'   retain HTML elements in the text.
#' @return An object of class `gt_tbl`.
#' @examples
#' # Use `gtcars` to create a gt table;
#' # add a source note to the table
#' # footer that cites the data source
#' tab_1 <-
#'   gtcars %>%
#'   dplyr::select(mfr, model, msrp) %>%
#'   dplyr::slice(1:5) %>%
#'   gt() %>%
#'   tab_source_note(
#'     source_note = "From edmunds.com"
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_source_note_1.svg}{options: width=100\%}}
#'
#' @family table-part creation/modification functions
#' @export
tab_source_note <- function(data,
                            source_note) {

  data %>% dt_source_notes_add(source_note = source_note)
}
