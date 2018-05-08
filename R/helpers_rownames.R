#' @importFrom stringr str_match
#' @export
rownames_with <- function(pattern) {

  matching_rows <-
    !is.na(
      stringr::str_match(
        string = rowname,
        pattern = pattern) %>%
        as.character())

  matching_rows %>% which()
}
