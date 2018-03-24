#' Add caption text to the stubhead
#'
#' Add a caption to the stubhead of a table. If
#' a stub does not exist, no change will be made
#' but a message to this effect will be emitted.
#' @param html_tbl an HTML table object that is
#' created using the \code{build_html_table()}
#' function.
#' @param text the text to be used as the stubhead.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr pull mutate case_when
#' @export
add_stub_head_caption <- function(html_tbl,
                                  text) {

 if ("stub_head" %in% (html_tbl[["html_table"]] %>% dplyr::pull(t_subpart))) {

  html_tbl[["html_table"]] <-
   html_tbl[["html_table"]] %>%
   dplyr:::mutate(content = case_when(
    t_subpart == "stub_head" ~ text,
    is.character(t_subpart) ~ content))

 } else {
  message("There is no stub in the table, so, no stubhead caption can be added.")
 }

 html_tbl
}

