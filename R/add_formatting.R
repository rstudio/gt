# Transform an internal table's column to
# a stub column
#' @param tbl the internal table called
#' \code{content_tbl}.
#' @param formats the internal \code{formats} table.
#' @param index the \code{index} value in
#' the internal \code{formats} table.
#' @importFrom dplyr pull
#' @importFrom purrr map_df
#' @noRd
tbl_format_step <- function(tbl,
                            formats,
                            index) {

  index_ <- index

  format_type <- formats$format_type[index_]

  # Detect the type of formatting in the index step -------------------------

  # `format_as_number` formatting
  if (format_type == "as_number") {

    columns <- formats[index_, ] %>% dplyr::pull(columns)
    decimals <- formats[index_, ] %>% dplyr::pull(decimals) %>% as.integer()
    drop_trailing_zeros <- formats[index_, ] %>% dplyr::pull(drop_trailing_zeros)
    thousands_sep <- formats[index_, ] %>% dplyr::pull(thousands_sep)
    negative_style <- formats[index_, ] %>% dplyr::pull(negative_style)


    if (!is.na(decimals)) {
      digits_ <- decimals
    } else {
      digits_ <- NA_integer_
    }

    tbl <-
      seq(nrow(tbl)) %>%
      purrr::map_df(.f = function(x) {

        if (tbl[x, ]$column_name %in% columns) {

          tbl[x, ]$digits <- digits_
          tbl[x, ]$drop0trailing <- drop_trailing_zeros
          tbl[x, ]$negative_style <- negative_style

          if (thousands_sep) {
            tbl[x, ]$big.mark <- ","
          }
        }

        tbl[x, ]
      })

    return(tbl)
  }

  # `format_as_scientific` formatting
  if (format_type == "as_scientific") {

    columns <- formats[index_, ] %>% dplyr::pull(columns)
    decimals <- formats[index_, ] %>% dplyr::pull(decimals) %>% as.integer()
    scientific <- TRUE
    drop_trailing_zeros <- formats[index_, ] %>% dplyr::pull(drop_trailing_zeros)
    negative_style <- formats[index_, ] %>% dplyr::pull(negative_style)


    if (!is.na(decimals)) {
      digits_ <- decimals
    } else {
      digits_ <- NA_integer_
    }

    tbl <-
      seq(nrow(tbl)) %>%
      purrr::map_df(.f = function(x) {

        if (tbl[x, ]$column_name %in% columns) {

          tbl[x, ]$digits <- digits_
          tbl[x, ]$scientific <- scientific
          tbl[x, ]$drop0trailing <- drop_trailing_zeros
          tbl[x, ]$negative_style <- negative_style
        }

        tbl[x, ]
      })

    return(tbl)
  }

  # `format_as_percentage` formatting
  if (format_type == "as_percentage") {

    columns <- formats[index_, ] %>% dplyr::pull(columns)
    decimals <- formats[index_, ] %>% dplyr::pull(decimals) %>% as.integer()
    drop_trailing_zeros <- formats[index_, ] %>% dplyr::pull(drop_trailing_zeros)
    thousands_sep <- formats[index_, ] %>% dplyr::pull(thousands_sep)
    negative_style <- formats[index_, ] %>% dplyr::pull(negative_style)


    if (!is.na(decimals)) {
      digits_ <- decimals
    } else {
      digits_ <- NA_integer_
    }

    tbl <-
      seq(nrow(tbl)) %>%
      purrr::map_df(.f = function(x) {

        if (tbl[x, ]$column_name %in% columns) {

          tbl[x, ]$digits <- digits_
          tbl[x, ]$drop0trailing <- drop_trailing_zeros
          tbl[x, ]$scaling_factor <- 100.
          tbl[x, ]$negative_style <- negative_style
          tbl[x, ]$append <- "%"

          if (thousands_sep) {
            tbl[x, ]$big.mark <- ","
          }
        }

        tbl[x, ]
      })
  }

  tbl
}



#' Perform all tbl format steps
#' @param html_tbl an html table object
#' @importFrom dplyr pull as_tibble
#' @importFrom purrr map
#' @noRd
all_tbl_format_steps <- function(html_tbl) {

  all_formats <- html_tbl[["formats"]]

  if (nrow(all_formats) > 0) {

    indices <- all_formats %>% dplyr::pull(index)

    for (i in seq(indices)) {

      if (i == 1) {

        formatted_tbl <-
          tbl_format_step(
            tbl = html_tbl[["content_tbl"]],
            formats = all_formats,
            index = i)
      }

      if (i != 1) {

        formatted_tbl <-
          tbl_format_step(
            tbl = formatted_tbl,
            formats = all_formats,
            index = i)
      }
    }

    html_tbl[["content_tbl"]] <- formatted_tbl
  }

  html_tbl
}
