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
#' @param text the text to be used as the stubhead.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr pull mutate case_when
#' @export
add_stubhead_caption <- function(html_tbl,
                                 text) {

  # TODO: Move all of this to an unexported transform function
  if ("stubhead" %in% (html_tbl[["html_table"]] %>% dplyr::pull(t_subpart))) {

    html_tbl[["html_table"]] <-
      html_tbl[["html_table"]] %>%
      dplyr::mutate(content = case_when(
        t_subpart == "stubhead" ~ text,
        is.character(t_subpart) ~ content))

  } else {
    message("There is no stub in the table, so, no stubhead caption can be added.")
  }

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
