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
    dplyr::mutate(scientific = FALSE) %>%
    dplyr::mutate(flag = "") %>%
    dplyr::mutate(big.mark = "") %>%
    dplyr::mutate(big.interval = 3L) %>%
    dplyr::mutate(small.mark = "") %>%
    dplyr::mutate(small.interval = 5L) %>%
    dplyr::mutate(decimal.mark = getOption("OutDec")) %>%
    dplyr::mutate(drop0trailing = FALSE) %>%
    dplyr::mutate(negative_style = "signed") %>%
    dplyr::mutate(date_format = NA_character_) %>%
    dplyr::mutate(time_format = NA_character_) %>%
    dplyr::mutate(prepend = NA_character_) %>%
    dplyr::mutate(append = NA_character_)

  content_tbl
}


#' Process the rowwise internal table called
#' \code{content_tbl}.
#' @param tbl the internal table called
#' \code{content_tbl}.
#' @importFrom dplyr mutate case_when
#' @importFrom stringr str_split str_detect
#' @importFrom purrr map_df
#' @noRd
process_content_tbl <- function(tbl) {

  suppressWarnings(
    content_tbl <-
      tbl %>%
      dplyr::mutate(content_1 = case_when(
        column_type == "numeric" ~
          ((content %>% as.numeric()) * scaling_factor) %>%
          as.character(),
        column_type == "integer" ~
          ((content %>% as.integer()) * scaling_factor) %>%
          as.character(),
        column_type == "character" ~ content))
  )

  suppressWarnings(
    content_tbl <-
      seq(nrow(content_tbl)) %>%
      purrr::map_df(.f = function(x) {

        if (content_tbl[x, ]$column_type == "numeric" &
            content_tbl[x, ]$scientific == FALSE) {
          format <- "f"
        } else if (content_tbl[x, ]$column_type == "integer" &
                   content_tbl[x, ]$scientific == FALSE) {
          format <- "d"
        } else if (
          content_tbl[x, ]$column_type %in% c("numeric", "integer") &
          content_tbl[x, ]$scientific == TRUE) {
          format <- "e"
        } else if (content_tbl[x, ]$column_type == "character") {
          format <- "s"
        } else {
          format <- "s"
        }

        if (content_tbl[x, ]$column_type != "character" &
            !is.na(content_tbl[x, ]$digits)) {

          formatted_value <-
            formatC(
              x = content_tbl[x, ]$content_1 %>% as.numeric(),
              digits = content_tbl[x, ]$digits,
              format = format,
              big.mark = content_tbl[x, ]$big.mark,
              big.interval = content_tbl[x, ]$big.interval,
              small.mark = content_tbl[x, ]$small.mark,
              small.interval = content_tbl[x, ]$small_interval,
              decimal.mark = content_tbl[x, ]$decimal.mark,
              drop0trailing = content_tbl[x, ]$drop0trailing)

        } else if (content_tbl[x, ]$column_type != "character" &
                   format == "e" & is.na(content_tbl[x, ]$digits)) {

          formatted_value <-
            formatC(
              x = content_tbl[x, ]$content_1 %>% as.numeric(),
              format = format,
              big.mark = content_tbl[x, ]$big.mark,
              big.interval = content_tbl[x, ]$big.interval,
              small.mark = content_tbl[x, ]$small.mark,
              small.interval = content_tbl[x, ]$small_interval,
              decimal.mark = content_tbl[x, ]$decimal.mark,
              drop0trailing = content_tbl[x, ]$drop0trailing)

        } else {

          formatted_value <- content_tbl[x, ]$content_1
        }

        # Format to scientific notation
        if (format == "e") {

          if (formatted_value %>%
              stringr::str_detect(pattern = ".e.")) {

            m_part <-
              (formatted_value %>%
                 stringr::str_split(pattern = "e") %>%
                 unlist())[1]

            n_part <-
              (formatted_value %>%
                 stringr::str_split(pattern = "e") %>%
                 unlist())[2] %>%
              as.integer()

            if (n_part != 0) {

              formatted_value <-
                paste0(m_part, " &times; 10<sup>", n_part, "</sup>")

            } else {
              formatted_value <- m_part
            }
          }
        }

        # Format dates/times
        if (!is.na(content_tbl[x, ]$date_format) |
            !is.na(content_tbl[x, ]$time_format)) {

          # Concatenate date and time formats to form a
          # single date-time formatting string
          date_time_format_str <-
            concat_date_time_formats(
              date_format = content_tbl[x, ]$date_format,
              time_format = content_tbl[x, ]$time_format)

          # Format date, time, or date-time using `strftime()`
          if (stringr::str_detect(
            string = content_tbl[x, ]$content_1,
            pattern = "^[0-9]*?\\:[0-9]*?")) {

            formatted_value <-
              paste("1970-01-01", content_tbl[x, ]$content_1) %>%
              strftime(format = date_time_format_str) %>%
              #toupper() %>%
              gsub("^0", "", .) %>%
              gsub(" 0([0-9])", " \\1", .) %>%
              gsub("pm$", "PM", .) %>%
              gsub("am$", "AM", .)

          } else {

            formatted_value <-
              content_tbl[x, ]$content_1 %>%
              strftime(format = date_time_format_str) %>%
              gsub(" 0([0-9])", " \\1", .) %>%
              gsub(" 0([0-9])", " \\1", .) %>%
              gsub("pm$", "PM", .) %>%
              gsub("am$", "AM", .)
          }
        }

        # Replace hyphens with minus signs
        if (content_tbl[x, ]$column_type != "character") {

          formatted_value <-
            gsub(
              pattern = "-",
              replacement = "&minus;",
              x = formatted_value)
        }

        # Prepend text to the formatted value if a `prepend`
        # string is available
        if (!is.na(content_tbl[x, ]$prepend)) {

          formatted_value <-
            paste0(content_tbl[x, ]$prepend, formatted_value)
        }

        # Append text to the formatted value if an `append`
        # string is available
        if (!is.na(content_tbl[x, ]$append)) {

          formatted_value <-
            paste0(formatted_value, content_tbl[x, ]$append)
        }

        # Format negative values when the option is chosen
        # to use parentheses for negative values
        if (content_tbl[x, ]$column_type != "character") {

          if (content_tbl[x, ]$content_1 %>% as.numeric() < 0 &
              content_tbl[x, ]$negative_style == "parens") {

            formatted_value <-
              paste0(
                "(",
                gsub(
                  pattern = "&minus;",
                  replacement = "",
                  formatted_value),
                ")"
              )
          }
        }

        # Add the `formatted_value` string as a value in
        # the column `content_formatted`
        content_tbl[x, ] %>%
          dplyr::mutate(content_formatted = formatted_value %>% as.character())
      })
  )

  content_tbl
}
