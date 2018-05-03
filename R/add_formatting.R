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
    use_big_mark <- formats[index_, ] %>% dplyr::pull(use_big_mark)
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

          if (use_big_mark) {
            tbl[x, ]$big.mark <- ","
          }
        }

        tbl[x, ]
      })

    return(tbl)
  }

  # `fmt_scientific` formatting
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

  # `fmt_percentage` formatting
  if (format_type == "as_percent") {

    columns <- formats[index_, ] %>% dplyr::pull(columns)
    decimals <- formats[index_, ] %>% dplyr::pull(decimals) %>% as.integer()
    drop_trailing_zeros <- formats[index_, ] %>% dplyr::pull(drop_trailing_zeros)
    use_big_mark <- formats[index_, ] %>% dplyr::pull(use_big_mark)
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

          if (use_big_mark) {
            tbl[x, ]$big.mark <- ","
          }
        }

        tbl[x, ]
      })

    return(tbl)
  }

  # `fmt_date` formatting
  if (format_type == "as_date") {

    columns <- formats[index_, ] %>% dplyr::pull(columns)

    date_style <- formats[index_, ] %>% dplyr::pull(date_style)

    # transform `date_style` to `date_format`
    date_format <- get_date_format(date_style = date_style)

    tbl <-
      seq(nrow(tbl)) %>%
      purrr::map_df(.f = function(x) {

        if (tbl[x, ]$column_name %in% columns) {
          tbl[x, ]$date_format <- date_format
        }

        tbl[x, ]
      })

    return(tbl)
  }

  # `fmt_time` formatting
  if (format_type == "as_time") {

    columns <- formats[index_, ] %>% dplyr::pull(columns)
    time_style <- formats[index_, ] %>% dplyr::pull(time_style)

    # transform `time_style` to `time_format`
    time_format <- get_time_format(time_style = time_style)

    tbl <-
      seq(nrow(tbl)) %>%
      purrr::map_df(.f = function(x) {

        if (tbl[x, ]$column_name %in% columns) {
          tbl[x, ]$time_format <- time_format
        }

        tbl[x, ]
      })

    return(tbl)
  }

  # `fmt_datetime` formatting
  if (format_type == "as_datetime") {

    columns <- formats[index_, ] %>% dplyr::pull(columns)
    date_style <- formats[index_, ] %>% dplyr::pull(date_style)
    time_style <- formats[index_, ] %>% dplyr::pull(time_style)

    # transform `date_style` to `date_format`
    date_format <- get_date_format(date_style = date_style)

    # transform `time_style` to `time_format`
    time_format <- get_time_format(time_style = time_style)

    tbl <-
      seq(nrow(tbl)) %>%
      purrr::map_df(.f = function(x) {

        if (tbl[x, ]$column_name %in% columns) {
          tbl[x, ]$date_format <- date_format
          tbl[x, ]$time_format <- time_format
        }

        tbl[x, ]
      })

    return(tbl)
  }

  # `fmt_time` formatting
  if (format_type == "as_currency") {

    columns <- formats[index_, ] %>% dplyr::pull(columns)
    decimals <- formats[index_, ] %>% dplyr::pull(decimals) %>% as.integer()
    use_big_mark <- formats[index_, ] %>% dplyr::pull(use_big_mark)
    negative_style <- formats[index_, ] %>% dplyr::pull(negative_style)
    currency_str <- formats[index_, ] %>% dplyr::pull(currency)

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
          tbl[x, ]$negative_style <- negative_style
          tbl[x, ]$prepend <- currency_str

          if (use_big_mark) {
            tbl[x, ]$big.mark <- ","
          }
        }

        tbl[x, ]
      })

    return(tbl)
  }
}



#' Perform all tbl format steps
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
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
