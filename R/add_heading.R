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
#' @importFrom dplyr mutate
#' @export
add_heading <- function(html_tbl,
                        title = NULL,
                        headnote = NULL,
                        table_number = NULL) {


  if (!is.null(title)) {

    title_str <- title %>% as.character()

    html_tbl[["heading"]] <-
      html_tbl[["heading"]] %>%
      dplyr::mutate(title = title_str)
  }

  if (!is.null(headnote)) {

    headnote_str <- headnote %>% as.character()

    html_tbl[["heading"]] <-
      html_tbl[["heading"]] %>%
      dplyr::mutate(headnote = headnote_str)
  }

  if (!is.null(table_number)) {

    table_number_str <- table_number %>% as.character()

    html_tbl[["heading"]] <-
      html_tbl[["heading"]] %>%
      dplyr::mutate(table_number = table_number_str)
  }

  html_tbl
}
