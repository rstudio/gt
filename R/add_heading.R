#' Add content to the heading part of the table
#'
#' Add a title, headnote, and table number
#' information to the heading part of the table.
#' @param html_tbl an HTML table object that is
#' created using the \code{build_html_table()}
#' function.
#' @param title text to be used in the table title.
#' @param headnote text to be used as the table's
#' headnote.
#' @param table_number a number to use as the
#' table number.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr mutate case_when
#' @export
add_heading <- function(html_tbl,
                        title = NULL,
                        headnote = NULL,
                        table_number = NULL) {


 if (!is.null(title)) {

  title <- title %>% as.character()

  html_tbl[["html_heading"]] <-
   html_tbl[["html_heading"]] %>%
   dplyr::mutate(content = case_when(
    t_subpart == "title" ~ title,
    is.character(t_subpart) ~ content))
 }

 if (!is.null(headnote)) {

  headnote <- headnote %>% as.character()

  html_tbl[["html_heading"]] <-
   html_tbl[["html_heading"]] %>%
   dplyr::mutate(content = case_when(
    t_subpart == "headnote" ~ headnote,
    is.character(t_subpart) ~ content))
 }

 html_tbl
}
