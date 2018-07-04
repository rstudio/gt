#' Format numeric values
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to format.
#' @param decimals an option to specify the exact number
#' of decimal places to use.
#' @param sep_mark the mark to use as a separator between
#' groups of digits.
#' @param dec_mark the character to use as a decimal mark.
#' @param drop0trailing a logical value that allows for
#' removal of trailing zeros (those redundant zeros after
#' the decimal mark).
#' @param negative_style the formatting to use
#' for negative numbers. With \code{signed} (the default),
#' negative numbers will be shown with a negative sign.
#' Using \code{parens} will show the negative value in
#' parentheses. The \code{red} option will display the
#' number in red. Finally, \code{parens-red} will display
#' negative numbers as red and enclosed in parentheses.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and format specified
#' # numeric columns to display values to
#' # two decimal places
#' gt(tbl = mtcars) %>%
#'   fmt_number(
#'     columns = c("drat", "wt", "qsec"),
#'     decimals = 2)
#' @export
fmt_number <- function(data,
                       columns,
                       decimals,
                       sep_mark = "",
                       dec_mark = ".",
                       drop0trailing = TRUE,
                       negative_style = "signed") {

  if (is.null(decimals)) decimals <- 4

  data %>%
    set_fmt(
      columns = columns,
      formatter = function(x) {

        # Uncouple formats from the base value
        formats <- x %>% gt:::extract_formats()
        x <- x %>%
          extract_value() %>%
          reverse_percent()

        x <- as.numeric(x)

        x <- formatC(
          x = x,
          digits = decimals,
          mode = "double",
          big.mark = sep_mark,
          decimal.mark = dec_mark,
          format = "f",
          drop0trailing = drop0trailing)

        x <- recombine_formats(x = x, formats = formats)
        x
      }
    )
}

#' Format values to scientific notation
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to format.
#' @param decimals an option to specify the exact number
#' of decimal places to use.
#' @param sep_mark the mark to use as a separator between
#' groups of digits.
#' @param dec_mark the character to use as a decimal mark.
#' @param drop0trailing a logical value that allows for
#' removal of trailing zeros (those redundant zeros after
#' the decimal mark).
#' @param negative_style the formatting to use
#' for negative numbers. With \code{signed} (the default),
#' negative numbers will be shown with a negative sign.
#' Using \code{parens} will show the negative value in
#' parentheses. The \code{red} option will display the
#' number in red. Finally, \code{parens-red} will display
#' negative numbers as red and enclosed in parentheses.
#' @return an object of class \code{gt_tbl}.
#' @export
fmt_scientific <- function(data,
                           columns,
                           decimals,
                           sep_mark = "",
                           dec_mark = ".",
                           negative_style = "signed",
                           drop0trailing = TRUE) {

  if (is.null(decimals)) decimals <- 4

  data %>%
    set_fmt(
      columns = columns,
      formatter = function(x) {

        # Uncouple formats from the base value
        formats <- x %>% extract_formats()
        x <- x %>%
          extract_value() %>%
          reverse_percent()

        x <- as.numeric(x)

        x <- formatC(
          x = x,
          digits = decimals,
          mode = "double",
          big.mark = sep_mark,
          decimal.mark = dec_mark,
          format = "e",
          drop0trailing = drop0trailing)

        x <- recombine_formats(x = x, formats = formats)
        x
      })
}

#' Format values as a percentage
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to format.
#' @param decimals an option to specify the exact number
#' of decimal places to use.
#' @param sep_mark the mark to use as a separator between
#' groups of digits.
#' @param dec_mark the character to use as a decimal mark.
#' @param drop0trailing a logical value that allows for
#' removal of trailing zeros (those redundant zeros after
#' the decimal mark).
#' @param negative_style the formatting to use
#' for negative numbers. With \code{signed} (the default),
#' negative numbers will be shown with a negative sign.
#' Using \code{parens} will show the negative value in
#' parentheses. The \code{red} option will display the
#' number in red. Finally, \code{parens-red} will display
#' negative numbers as red and enclosed in parentheses.
#' @return an object of class \code{gt_tbl}.
#' @export
fmt_percent <- function(data,
                        columns,
                        decimals = NULL,
                        sep_mark = "",
                        dec_mark = ".",
                        negative_style = "signed",
                        drop0trailing = TRUE) {

  if (is.null(decimals)) decimals <- 4

  data %>%
    set_fmt(
      columns = columns,
      formatter = function(x) {

        # Uncouple formats from the base value
        formats <- x %>% extract_formats()
        x <- x %>%
          extract_value() %>%
          reverse_percent()

        # Transform the number by multiplying
        # it by 100
        x <- as.numeric(x) * 100

        x <-
          paste0(
            formatC(
              x = x,
              digits = decimals,
              mode = "double",
              big.mark = sep_mark,
              decimal.mark = dec_mark,
              format = "f",
              drop0trailing = drop0trailing), "::percent")

        x <- recombine_formats(x = x, formats = formats)
        x
      }
    )
}

#' Format values as currencies
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to format.
#' @param currency the currency to use for the numeric value.
#' @param use_subunits an option for whether the subunits
#' portion of a currency value should be displayed.
#' @param decimals an option to specify the exact number
#' of decimal places to use.
#' @param sep_mark the mark to use as a separator between
#' groups of digits.
#' @param dec_mark the character to use as a decimal mark.
#' @param placement the placement of the currency symbol.
#' This can be either be \code{left} (the default) or
#' \code{right}.
#' @param negative_style the formatting to use
#' for negative numbers. With \code{signed} (the default),
#' negative numbers will be shown with a negative sign.
#' Using \code{parens} will show the negative value in
#' parentheses. The \code{red} option will display the
#' number in red. Finally, \code{parens-red} will display
#' negative numbers as red and enclosed in parentheses.
#' @return an object of class \code{gt_tbl}.
#' @export
fmt_currency <- function(data,
                         columns,
                         currency,
                         use_subunits = TRUE,
                         decimals = NULL,
                         sep_mark = "",
                         dec_mark = ".",
                         placement = "left",
                         negative_style = "signed") {

  if (is.null(decimals)) decimals <- 2

  if (placement == "left") {
    placement <- "l"
  } else if (placement == "right") {
    placement <- "r"
  } else {
    placement <- "l"
  }

  # Return early if `currency` does not have a valid value
  if (!is_currency_valid(currency = currency)) {

    message("The value supplied for `currency` is not valid.")
    return(data)
  }

  # Get the currency string
  currency_str <- get_currency_str(currency = currency)

  # Get the number of decimal places
  if (is.null(decimals) & use_subunits) {

    # Get decimal places using `get_currency_exponent()` fcn
    if (currency %in% currency_symbols$curr_symbol) {
      decimals <- 2L
    } else {
      decimals <- get_currency_exponent(currency = currency)
    }

  } else if (is.null(decimals) & use_subunits == FALSE) {
    decimals <- NA_integer_
  }

  data %>%
    set_fmt(
      columns = columns,
      formatter = function(x) {

        # Uncouple formats from the base value
        formats <- x %>% extract_formats()
        x <- x %>%
          extract_value() %>%
          reverse_percent()

        x <- as.numeric(x)

        x <-
          paste0(
            formatC(
              x = x,
              digits = decimals,
              mode = "double",
              big.mark = sep_mark,
              decimal.mark = dec_mark,
              format = "f",
              drop0trailing = FALSE),
            paste0(
              "::curr_", placement, "_", currency_str))

        x <- recombine_formats(x = x, formats = formats)
        x
      }
    )
}

#' Format values as dates
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to format.
#' @param date_style the date style to use.
#' @return an object of class \code{gt_tbl}.
#' @export
fmt_date <- function(data,
                     columns = NULL,
                     date_style = NULL) {

  data %>%
    set_fmt(
      columns = columns,
      formatter = function(x) {

        # Uncouple formats from the base value
        formats <- x %>% extract_formats()
        x <- x %>%
          extract_value() %>%
          reverse_percent()

        # Transform `date_style` to `date_format_str`
        date_format_str <- get_date_format(date_style = date_style)

        x <-
          ifelse(grepl("^[0-9]*?\\:[0-9]*?", x), paste("1970-01-01", x), x) %>%
          strftime(format = date_format_str) %>%
          stringr::str_replace_all("^0", "") %>%
          stringr::str_replace_all(" 0([0-9])", " \\1") %>%
          stringr::str_replace_all("pm$", "PM") %>%
          stringr::str_replace_all("am$", "AM")

        x <- recombine_formats(x = x, formats = formats)
        x
      }
    )
}

#' Format values as times
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to format.
#' @param time_style the time style to use.
#' @export
fmt_time <- function(data,
                     columns = NULL,
                     time_style = NULL) {

  data %>%
    set_fmt(
      columns = columns,
      formatter = function(x) {

        # Uncouple formats from the base value
        formats <- x %>% extract_formats()
        x <- x %>%
          extract_value() %>%
          reverse_percent()

        # Transform `time_style` to `time_format_str`
        time_format_str <- get_time_format(time_style = time_style)

        x <-
          ifelse(grepl("^[0-9]*?\\:[0-9]*?", x), paste("1970-01-01", x), x) %>%
          strftime(format = time_format_str) %>%
          stringr::str_replace_all("^0", "") %>%
          stringr::str_replace_all(" 0([0-9])", " \\1") %>%
          stringr::str_replace_all("pm$", "PM") %>%
          stringr::str_replace_all("am$", "AM")

        x <- recombine_formats(x = x, formats = formats)
        x
      }
    )
}

#' Format values as date-times
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to format.
#' @param date_style the date style to use.
#' @param time_style the time style to use.
#' @return an object of class \code{gt_tbl}.
#' @export
fmt_datetime <- function(data,
                         columns = NULL,
                         date_style = NULL,
                         time_style = NULL) {

  data %>%
    set_fmt(
      columns = columns,
      formatter = function(x) {

        # Uncouple formats from the base value
        formats <- x %>% extract_formats()
        x <- x %>%
          extract_value() %>%
          reverse_percent()

        # Transform `date_style` to `date_format`
        date_format <- get_date_format(date_style = date_style)

        # Transform `time_style` to `time_format`
        time_format <- get_time_format(time_style = time_style)

        # Combine into a single datetime format string
        date_time_format_str <-
          paste0(date_format, " ", time_format)

        x <-
          ifelse(grepl("^[0-9]*?\\:[0-9]*?", x), paste("1970-01-01", x), x) %>%
          strftime(format = date_time_format_str) %>%
          stringr::str_replace_all("^0", "") %>%
          stringr::str_replace_all(" 0([0-9])", " \\1") %>%
          stringr::str_replace_all("pm$", "PM") %>%
          stringr::str_replace_all("am$", "AM")

        x <- recombine_formats(x = x, formats = formats)
        x
      }
    )
}

#' Set a column format with a formatter function
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an option specify which columns are to be
#' formatted.
#' @param formatter a formatting function.
#' @return an object of class \code{gt_tbl}.
#' @export
set_fmt <- function(data,
                    columns,
                    formatter) {

  for (i in columns) {
    data$formats[[i]] <- formatter
  }

  data %>% render_format()
}

#' Render the table using the formatting options
#' @noRd
render_format <- function(data) {

  orig_types <- get_orig_types(data$data)

  row_names <- data$data$`:row_name:`
  group_names <- data$data$`:group_name:`
  column_align <- data$data[3, ]
  spanner_name <- data$data[4, ]

  formatted_tbl <- data$data %>% get_working_tbl(apply_original_types = TRUE)

  for (colname in names(data$formats)) {
    formatted_tbl[, colname] <- data$formats[[colname]](formatted_tbl[[colname]])
  }

  data$data <- formatted_tbl %>% encase_tbl(data_types = orig_types)
  data$data$`:row_name:` <- row_names
  data$data$`:group_name:` <- group_names
  data$data[3, ] <- column_align
  data$data[4, ] <- spanner_name
  data$formats <- list()
  data
}
