#' Obtain rownames that fit a naming pattern
#' @param pattern a matching pattern for
#' targeting rownames.
#' @importFrom stringr str_match
#' @export
rownames_with <- function(pattern) {

  # Create bindings for specific variables
  #rowname <- NULL

  matching_rows <-
    !is.na(
      stringr::str_match(
        string = rowname,
        pattern = pattern) %>%
        as.character())

  matching_rows %>% which()
}
