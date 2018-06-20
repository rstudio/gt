#' Provide a directive to get rows that fit a
#' naming pattern
#' @param pattern a matching pattern for
#' targeting rownames.
#' @export
rownames_with <- function(pattern) {

  paste0("::rownames_with::", pattern)
}

#' Get rownames that fit a naming pattern
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param directive a string-based directive supplied
#' by the \code{rownames_with} helper function.
#' @importFrom stringr str_match
#' @importFrom dplyr pull
#' @noRd
get_rownames_with <- function(html_tbl, directive) {

  # Create bindings for specific variables
  rowname <- NULL

  # Extract the matching pattern
  pattern <- gsub("::rownames_with::", "", directive)

  # Get the matching rows
  matching_rows <-
    !is.na(
      stringr::str_match(
        string = html_tbl[["modified_tbl"]] %>% dplyr::pull(rowname),
        pattern = pattern) %>%
        as.character())

  matching_rows %>% which()
}
