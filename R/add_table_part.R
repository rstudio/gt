#' Add content to the heading part of the table
#'
#' Add a title, headnote, and table number
#' information to the heading part of the table.
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @param title text to be used in the table title.
#' @param headnote text to be used as the table's
#' headnote.
#' @param table_number a number to use as the
#' table number.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr tibble
#' @export
add_heading <- function(html_tbl,
                        title,
                        headnote = NULL,
                        table_number = NULL) {


  html_tbl[["heading"]] <-
    dplyr::tibble(
      title = title,
      headnote = ifelse(is.null(headnote), "", headnote %>% as.character()),
      table_number = ifelse(is.null(table_number), "", table_number %>% as.character()))

  html_tbl
}



#' Add caption text to the stubhead
#'
#' Add a caption to the stubhead of a table. If
#' a stub does not exist, no change will be made
#' but a message to this effect will be emitted.
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @param caption the text to be used as the
#' stubhead caption.
#' @param alignment an option to modify the
#' alignment of the stubhead caption. By
#' default this is \code{left}. Other options
#' are \code{center} and \code{right}.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr pull mutate case_when
#' @export
add_stubhead_caption <- function(html_tbl,
                                 caption,
                                 alignment = NULL) {

  if (is.null(alignment) || !(alignment %in% c("left", "center", "right"))) {
    alignment <- "left"
  }

  html_tbl[["stubhead_caption"]] <-
    dplyr::tibble(
      caption_text = caption,
      alignment = alignment)

  html_tbl
}



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
