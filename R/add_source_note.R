#' Add a source note citation
#'
#' Add a source note citation to the source note
#' part of the table.
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @param source_note text to be used in the
#' source note.
#' @param lead_in a lead in word or phrase
#' indicating the citation as the source of the
#' tabulated data.
#' @return an object of class \code{html_table}.
#' @importFrom tibble add_row
#' @export
add_source_note <- function(html_tbl,
                            source_note,
                            lead_in = NULL) {

 source_note_str <- source_note %>% as.character()

 if (!is.null(lead_in)) {
  lead_in_str <- lead_in %>% as.character()
 } else {
  lead_in_str <- ""
 }

 html_tbl[["source_note"]] <-
  html_tbl[["source_note"]] %>%
  tibble::add_row(
   source_note = source_note_str,
   lead_in = lead_in_str,
   index = (nrow(.) + 1L))

 html_tbl
}
