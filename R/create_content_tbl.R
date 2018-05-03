#' Create a rowwise table that's is used for
#' application of scaling factors and string/
#' number formatting for cell content
#' @param html_tbl an HTML table object that
#' is created using the \code{tab_create()} function.
#' @importFrom purrr map_chr
#' @importFrom dplyr tibble pull mutate bind_rows arrange
#' @noRd
create_content_tbl <- function(html_tbl) {

  # Get the row series from `tbl`
  row_series <- seq(nrow(html_tbl[["modified_tbl"]]))

  # Get the column series from `tbl`
  column_series <- seq(ncol(html_tbl[["modified_tbl"]]))

  # Get the column names in `tbl`
  tbl_colnames <- colnames(html_tbl[["modified_tbl"]])

  # Get the column types in `tbl`
  tbl_coltypes <-
    seq(ncol(html_tbl[["modified_tbl"]])) %>%
    purrr::map_chr(
      .f = function(x) html_tbl[["modified_tbl"]][[x]] %>% class())

  # Get a tibble with rowwise content
  for (i in seq(ncol(html_tbl[["modified_tbl"]]))) {

    if (i == 1) {

      content_tbl <-
        dplyr::tibble(
          content = html_tbl[["modified_tbl"]][, i] %>%
            dplyr::pull() %>%
            as.character()) %>%
        dplyr::mutate(
          row = row_series,
          col = column_series[i],
          row_type = "data",
          column_name = tbl_colnames[i],
          column_type = tbl_coltypes[i])


    } else {

      content_tbl_set <-
        dplyr::tibble(
          content = html_tbl[["modified_tbl"]][, i] %>%
            dplyr::pull() %>%
            as.character()) %>%
        dplyr::mutate(
          row = row_series,
          col = column_series[i],
          row_type = "data",
          column_name = tbl_colnames[i],
          column_type = tbl_coltypes[i])

      content_tbl <-
        dplyr::bind_rows(content_tbl, content_tbl_set)
    }
  }

  content_tbl <-
    content_tbl %>%
    dplyr::mutate(scaling_factor = ifelse(
      column_type %in% c("numeric", "integer"),
      1., NA_real_)) %>%
    dplyr::mutate(
      digits = NA_integer_,
      scientific = FALSE,
      flag = "",
      big.mark = "",
      big.interval = 3L,
      small.mark = "",
      small.interval = 5L,
      decimal.mark = getOption("OutDec"),
      drop0trailing = FALSE,
      negative_style = "signed",
      date_format = NA_character_,
      time_format = NA_character_,
      prepend = NA_character_,
      append = NA_character_) %>%
    dplyr::arrange(row, col)

  html_tbl[["content_tbl"]] <- content_tbl
  html_tbl
}

#' Process the rowwise internal table called
#' \code{content_tbl}.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @importFrom dplyr mutate
#' @importFrom stringr str_split str_detect
#' @importFrom purrr map_df
#' @noRd
process_content_tbl <- function(html_tbl) {

  # Initialize the `content_1` column
  content_tbl <-
    html_tbl[["content_tbl"]] %>%
    dplyr::mutate(content_1 = content)

  # Initialize the `content_formatted` column
  content_tbl <-
    content_tbl %>%
    dplyr::mutate(content_formatted = NA_character_)

  content_1_col <-
    which(colnames(content_tbl) == "content_1")

  # Get the row indices for any `numeric`
  # columns with a scaling factor other than 1.
  rows_numeric <-
    which(
      content_tbl$column_type == "numeric" &
        content_tbl$scaling_factor != 1)

  # Get the row indices for any `integer`
  # columns with a scaling factor other than 1.
  rows_integer <-
    which(
      content_tbl$column_type == "integer" &
        content_tbl$scaling_factor != 1)

  # Scale the necessary numeric values
  if (length(rows_numeric) > 0) {
    content_tbl[rows_numeric, content_1_col] <-
      ((content_tbl[rows_numeric, ]$content %>% as.numeric()) *
         content_tbl[rows_numeric, ]$scaling_factor) %>% as.character()
  }

  # Scale the necessary integer values
  if (length(rows_integer) > 0) {
    content_tbl[rows_integer, content_1_col] <-
      ((content_tbl[rows_integer, ]$content %>% as.integer()) *
         content_tbl[rows_integer, ]$scaling_factor) %>% as.character()
  }

  # Tag `content_tbl` rows with the appropriate
  # `format` values
  # `f`: numeric float value
  # `d`: numeric integer value
  # `e`: numeric exponent value
  # `s`: string value
  content_tbl <-
    content_tbl %>%
    dplyr::mutate(format = case_when(
      column_type == "numeric" & scientific == FALSE ~ "f",
      column_type == "integer" & scientific == FALSE ~ "d",
      column_type %in% c("numeric", "integer") & scientific == TRUE ~ "e",
      TRUE ~ "s"))

  #
  # Apply numeric formatting to non-character rows
  #
  rows_num_format_def_w_digits <-
    which(
      content_tbl$format %in% c("d", "e", "f") &
        !is.na(content_tbl$digits))

  rows_num_format_e_na_digits <-
    which(
      content_tbl$format == "e" &
        is.na(content_tbl$digits))

  rows_num_format_df_na_digits <-
    which(
      content_tbl$format %in% c("d", "f") &
        is.na(content_tbl$digits))

  rows_str_format <- which(content_tbl$format == "s")


  if (length(rows_num_format_def_w_digits) > 0) {

    for (i in rows_num_format_def_w_digits) {

      content_tbl[i, ]$content_formatted <-
        formatC(
          x = as.numeric(content_tbl[i, ]$content_1),
          digits = content_tbl[i, ]$digits,
          format = content_tbl[i, ]$format,
          big.mark = content_tbl[i, ]$big.mark,
          big.interval = content_tbl[i, ]$big.interval,
          small.mark = content_tbl[i, ]$small.mark,
          small.interval = content_tbl[i, ]$small_interval,
          decimal.mark = content_tbl[i, ]$decimal.mark,
          drop0trailing = content_tbl[i, ]$drop0trailing)
    }
  }

  if (length(rows_num_format_e_na_digits) > 0) {

    for (i in rows_num_format_e_na_digits) {

      content_tbl[i, ]$content_formatted <-
        formatC(
          x = as.numeric(content_tbl[i, ]$content_1),
          format = content_tbl[i, ]$format,
          big.mark = content_tbl[i, ]$big.mark,
          big.interval = content_tbl[i, ]$big.interval,
          small.mark = content_tbl[i, ]$small.mark,
          small.interval = content_tbl[i, ]$small_interval,
          decimal.mark = content_tbl[i, ]$decimal.mark,
          drop0trailing = content_tbl[i, ]$drop0trailing)
    }
  }

  if (length(rows_num_format_df_na_digits) > 0) {
    for (i in rows_num_format_df_na_digits) {
      content_tbl[i, ]$content_formatted <-
        content_tbl[i, ]$content_1
    }
  }

  if (length(rows_str_format) > 0) {
    for (i in rows_str_format) {
      content_tbl[i, ]$content_formatted <-
        content_tbl[i, ]$content_1
    }
  }

  #
  # Format to scientific notation
  #

  rows_num_format_e <- which(content_tbl$format == "e")

  if (length(rows_num_format_e) > 0) {

    for (i in rows_num_format_e) {

      # Get the `m` and `n` parts as a vector
      #content_tbl[i, ]$content_formatted
      m_n_parts <-
        (content_tbl[i, ]$content_formatted %>%
           stringr::str_split(pattern = "e") %>%
           unlist()) %>% as.numeric()

      if (m_n_parts[2] != 0) {

        content_tbl[i, ]$content_formatted <-
          paste0(m_n_parts[1], " &times; 10<sup>", as.integer(m_n_parts[2]), "</sup>")

      } else {
        content_tbl[i, ]$content_formatted <- m_n_parts[1] %>% as.character()
      }
    }
  }

  #
  # Format to dates/times
  #

  rows_dates_times <-
    which(!is.na(content_tbl$date_format) |
            !is.na(content_tbl$time_format))

  if (length(rows_dates_times) > 0) {

    for (i in rows_dates_times) {

      date_time_format_str <-
        gt:::concat_date_time_formats(
          date_format = content_tbl[i, ]$date_format,
          time_format = content_tbl[i, ]$time_format)

      # Format date, time, or date-time using `strftime()`
      if (stringr::str_detect(
        string = content_tbl[i, ]$content_formatted,
        pattern = "^[0-9]*?\\:[0-9]*?")) {

        content_tbl[i, ]$content_formatted <-
          paste("1970-01-01", content_tbl[i, ]$content_formatted) %>%
          strftime(format = date_time_format_str) %>%
          gsub("^0", "", .) %>%
          gsub(" 0([0-9])", " \\1", .) %>%
          gsub("pm$", "PM", .) %>%
          gsub("am$", "AM", .)

      } else {

        content_tbl[i, ]$content_formatted <-
          content_tbl[i, ]$content_formatted %>%
          strftime(format = date_time_format_str) %>%
          gsub(" 0([0-9])", " \\1", .) %>%
          gsub(" 0([0-9])", " \\1", .) %>%
          gsub("pm$", "PM", .) %>%
          gsub("am$", "AM", .)
      }
    }
  }

  # Prepend text to the formatted value if a `prepend`
  # string is available
  rows_prepend <- which(!is.na(content_tbl$prepend))

  if (length(rows_prepend) > 0) {

    for (i in rows_prepend) {

      content_tbl[i, ]$content_formatted <-
        paste0(content_tbl[i, ]$prepend, content_tbl[i, ]$content_formatted)
    }
  }

  # Append text to the formatted value if a `append`
  # string is available
  rows_append <- which(!is.na(content_tbl$append))

  if (length(rows_append) > 0) {

    for (i in rows_append) {

      content_tbl[i, ]$content_formatted <-
        paste0(content_tbl[i, ]$content_formatted, content_tbl[i, ]$append)
    }
  }

  # Format negative values when the option is chosen
  # to use parentheses for negative values
  rows_parens <-
    which(
      content_tbl$column_type != "character" &
        content_tbl$negative_style == "parens")

  if (length(rows_parens) > 0) {

    for (i in rows_parens) {

      if (as.numeric(content_tbl[i, ]$content_formatted) < 0) {
        content_tbl[i, ]$content_formatted <-
          paste0(
            "(",
            gsub(
              pattern = "&minus;|-",
              replacement = "",
              content_tbl[i, ]$content_formatted),
            ")")
      }
    }
  }

  # Replace hyphens with minus signs
  content_tbl$content_formatted <-
    gsub(
      pattern = "-",
      replacement = "&minus;",
      x = content_tbl$content_formatted)

  # Replace NA values if the option is
  # taken to do so
  if ("replace_missing" %in% html_tbl[["aesthetics"]]$type) {

    replace_directives <-
      html_tbl[["aesthetics"]] %>%
      dplyr::filter(type == "replace_missing")


    replace_values_in_content_tbl <- function(content_tbl,
                                              replace_directives) {

      columns <- replace_directives$columns
      types <- replace_directives$types
      replacement <- replace_directives$replacement

      for (i in seq(nrow(replace_directives))) {

        if (is.na(columns) & is.na(types)) {

          content_tbl <-
            content_tbl %>%
            dplyr::mutate(content_formatted = ifelse(
              is.na(content), replacement[i], content_formatted))

        } else if (!is.na(column)) {

          content_tbl <-
            content_tbl %>%
            dplyr::mutate(content_formatted = case_when(
              column_name %in% columns[i] & is.na(content) ~ replacement[i],
              TRUE ~ content_formatted))

        } else if (!is.na(types)) {
          content_tbl <-
            content_tbl %>%
            dplyr::mutate(content_formatted = case_when(
              column_type %in% types[i] & is.na(content) ~ replacement[i],
              TRUE ~ content_formatted))
        }
      }

      content_tbl
    }

    content_tbl <-
      replace_values_in_content_tbl(
        content_tbl = content_tbl,
        replace_directives = replace_directives)
  }

  html_tbl[["content_tbl"]] <- content_tbl
  html_tbl
}
