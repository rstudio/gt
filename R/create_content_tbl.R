#' Create a rowwise table that's is used for
#' application of scaling factors and string/
#' number formatting for cell content.
#' @param tbl the internal table called
#' \code{modified_tbl}.
#' @importFrom purrr map_df
#' @importFrom dplyr tibble as_tibble mutate
#' @noRd
create_content_tbl <- function(tbl) {

  # Get a tibble with rowwise content
  content_tbl <-
    suppressWarnings(
      seq(nrow(tbl)) %>%
        purrr::map_df(.f = function(x) {

          seq(ncol(tbl)) %>%
            purrr::map_df(.f = function(y) {

              dplyr::tibble(
                row = x,
                col = y,
                column_name = (tbl %>% dplyr::as_tibble())[, y] %>% colnames(),
                column_type = (tbl %>% as.data.frame())[x, y] %>% class(),
                content = (tbl %>% as.data.frame())[x, y] %>% as.character())
            })
        }))

  content_tbl <-
    content_tbl %>%
    dplyr::mutate(scaling_factor = ifelse(
      column_type %in% c("numeric", "integer"),
      1., NA_real_)) %>%
    dplyr::mutate(digits = NA_integer_) %>%
    dplyr::mutate(flag = "") %>%
    dplyr::mutate(big.mark = "") %>%
    dplyr::mutate(big.interval = 3L) %>%
    dplyr::mutate(small.mark = "") %>%
    dplyr::mutate(small.interval = 5L) %>%
    dplyr::mutate(decimal.mark = getOption("OutDec")) %>%
    dplyr::mutate(drop0trailing = FALSE) %>%
    dplyr::mutate(prepend = NA_character_) %>%
    dplyr::mutate(append = NA_character_)

  content_tbl
}


#' Process the rowwise internal table called
#' \code{content_tbl}.
#' @param tbl the internal table called
#' \code{content_tbl}.
#' @importFrom dplyr mutate case_when select
#' @noRd
process_content_tbl <- function(tbl) {

  content_tbl <-
    suppressWarnings(
      tbl %>%
        dplyr::mutate(content_1 = case_when(
          column_type == "numeric" ~
            ((content %>% as.numeric()) * scaling_factor) %>% as.character(),
          column_type == "integer" ~
            ((content %>% as.integer()) * scaling_factor) %>% as.character(),
          TRUE ~ content)) %>%
        dplyr::mutate(content_formatted = case_when(
          !is.na(format_str) ~ sprintf(format_str, content_1),
          TRUE ~ content_1))) %>%
    dplyr::select(-content_1)

  content_tbl
}
