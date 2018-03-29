#' Apply spanner headings
#'
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr tibble
#' @importFrom stringr str_detect str_replace
#' @export
apply_spanner_headings <- function(html_tbl) {

  # Get column names and determine groupings
  # via format of `[group].[column_name]`
  group_cols <-
    html_tbl[["source_tbl"]] %>%
    colnames() %>%
    stringr::str_detect(pattern = ".*?\\..*?") %>%
    which()

  # Create `boxhead_panel_tbl` object
  boxhead_panel_tbl <-
    dplyr::tibble(
      column_name = (html_tbl[["source_tbl"]] %>%
                     colnames())[group_cols],
      spanner_heading = (html_tbl[["source_tbl"]] %>%
                        colnames())[group_cols] %>%
        str_replace(
          pattern = "(.*?)\\.(.*)",
          replacement = "\\1"),
      column_heading = (html_tbl[["source_tbl"]] %>%
                       colnames())[group_cols] %>%
        str_replace(
          pattern = "(.*?)\\.(.*)",
          replacement = "\\2"))

  # Replace `boxhead_panel` component with
  # `boxhead_panel_tbl` table
  html_tbl[["boxhead_panel"]] <- boxhead_panel_tbl

  html_tbl
}
