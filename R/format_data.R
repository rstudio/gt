#' Format numeric values
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to format.
#' @param rows optional rows to format. Not providing any
#' value results in all rows in \code{columns} being formatted.
#' @param decimals an option to specify the exact number
#' of decimal places to use. The default number of decimal
#' places is \code{4}.
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
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   fmt_number(
#'     columns = c("drat", "wt", "qsec"),
#'     decimals = 2)
#' @importFrom rlang enquo get_expr flatten_chr
#' @importFrom stringr str_trim
#' @export
fmt_number <- function(data,
                       columns,
                       rows = NULL,
                       decimals = 4,
                       sep_mark = "",
                       dec_mark = ".",
                       drop0trailing = FALSE,
                       negative_style = "signed") {

  # If nothing is provided for rows, assume
  # that all rows are in the selection
  if (is.null(rows)) {
    rows <- TRUE
  }

  # Get the requested `columns`
  columns <-
    rlang::enquo(columns) %>%
    rlang::get_expr() %>%
    as.character() %>%
    strsplit(split = " & ") %>%
    rlang::flatten_chr() %>%
    stringr::str_trim()

  columns <- columns[columns != "&"]

  # Resolve the columns to be targeted
  columns <- resolve_columns(data = data, columns = columns)

  # Resolve the rows to be targeted
  rows <- resolve_rows(data = data, rows = rows)

  # Return data if there are no rows or columns to format
  if (length(rows) == 0 | length(columns) == 0) {
    return(data)
  }

  # Set the format
  data <-
    set_fmt(
      data = data,
      columns = columns,
      rows = rows,
      formatter = function(x) {
        formatC(
          x = x,
          digits = decimals,
          mode = "double",
          big.mark = sep_mark,
          decimal.mark = dec_mark,
          format = "f",
          drop0trailing = drop0trailing)
      }
    )

  data
}

#' Format values to scientific notation
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to format.
#' @param rows optional rows to format. Not providing any
#' value results in all rows in \code{columns} being formatted.
#' @param decimals an option to specify the exact number
#' of decimal places to use. The default number of decimal
#' places is \code{4}.
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
#' @importFrom rlang enquo get_expr flatten_chr
#' @importFrom stringr str_trim
#' @export
fmt_scientific <- function(data,
                           columns,
                           rows = NULL,
                           decimals = 4,
                           sep_mark = "",
                           dec_mark = ".",
                           negative_style = "signed",
                           drop0trailing = FALSE) {

  # If nothing is provided for rows, assume
  # that all rows are in the selection
  if (is.null(rows)) {
    rows <- TRUE
  }

  # Get the requested `columns`
  columns <-
    rlang::enquo(columns) %>%
    rlang::get_expr() %>%
    as.character() %>%
    strsplit(split = " & ") %>%
    rlang::flatten_chr() %>%
    stringr::str_trim()

  columns <- columns[columns != "&"]

  # Resolve the columns to be targeted
  columns <- resolve_columns(data = data, columns = columns)

  # Resolve the rows to be targeted
  rows <- resolve_rows(data = data, rows = rows)

  # Return data if there are no rows or columns to format
  if (length(rows) == 0 | length(columns) == 0) {
    return(data)
  }

  data <-
    set_fmt(
      data = data,
      columns = columns,
      rows = rows,
      formatter = function(x) {
        formatC(
          x = x,
          digits = decimals,
          mode = "double",
          big.mark = sep_mark,
          decimal.mark = dec_mark,
          format = "e",
          drop0trailing = drop0trailing)
      })

  data
}

#' Format values as a percentage
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to format.
#' @param rows optional rows to format. Not providing any
#' value results in all rows in \code{columns} being formatted.
#' @param decimals an option to specify the exact number
#' of decimal places to use. The default number of decimal
#' places is \code{2}.
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
#' @importFrom rlang enquo get_expr flatten_chr
#' @importFrom stringr str_trim
#' @export
fmt_percent <- function(data,
                        columns,
                        rows = NULL,
                        decimals = 2,
                        sep_mark = "",
                        dec_mark = ".",
                        negative_style = "signed",
                        drop0trailing = FALSE) {

  # If nothing is provided for rows, assume
  # that all rows are in the selection
  if (is.null(rows)) {
    rows <- TRUE
  }

  # Get the requested `columns`
  columns <-
    rlang::enquo(columns) %>%
    rlang::get_expr() %>%
    as.character() %>%
    strsplit(split = " & ") %>%
    rlang::flatten_chr() %>%
    stringr::str_trim()

  columns <- columns[columns != "&"]

  # Resolve the columns to be targeted
  columns <- resolve_columns(data = data, columns = columns)

  # Resolve the rows to be targeted
  rows <- resolve_rows(data = data, rows = rows)

  # Return data if there are no rows or columns to format
  if (length(rows) == 0 | length(columns) == 0) {
    return(data)
  }

  # Set the format
  data <-
    set_fmt(
      data = data,
      columns = columns,
      rows = rows,
      formatter = function(x) {
        formatC(
          x = as.numeric(x) * 100.0,
          digits = decimals,
          mode = "double",
          big.mark = sep_mark,
          decimal.mark = dec_mark,
          format = "f",
          drop0trailing = drop0trailing)
      }
    )

  # Set the decorator
  data <-
    set_decorator(
      data = data,
      columns = columns,
      rows = rows,
      decorator = function(x) {
        "::percent"
      })

  data
}

#' Format values as currencies
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to format.
#' @param rows optional rows to format. Not providing any
#' value results in all rows in \code{columns} being formatted.
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
#' @importFrom rlang enquo get_expr flatten_chr
#' @importFrom stringr str_trim
#' @export
fmt_currency <- function(data,
                         columns,
                         rows = NULL,
                         currency,
                         use_subunits = TRUE,
                         decimals = NULL,
                         sep_mark = "",
                         dec_mark = ".",
                         placement = "left",
                         negative_style = "signed") {

  # If nothing is provided for rows, assume
  # that all rows are in the selection
  if (is.null(rows)) {
    rows <- TRUE
  }

  if (placement == "left") {
    placement <- "l"
  } else if (placement == "right") {
    placement <- "r"
  } else {
    placement <- "l"
  }

  # Get the requested `columns`
  columns <-
    rlang::enquo(columns) %>%
    rlang::get_expr() %>%
    as.character() %>%
    strsplit(split = " & ") %>%
    rlang::flatten_chr() %>%
    stringr::str_trim()

  columns <- columns[columns != "&"]

  # Resolve the columns to be targeted
  columns <- resolve_columns(data = data, columns = columns)

  # Resolve the rows to be targeted
  rows <- resolve_rows(data = data, rows = rows)

  # Return data if there are no rows or columns to format
  if (length(rows) == 0 | length(columns) == 0) {
    return(data)
  }

  # Return data if `currency` does not have a valid value
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
      decimals <- 2
    } else {
      decimals <- get_currency_exponent(currency = currency)
    }
  } else if (is.null(decimals) & use_subunits == FALSE) {
    decimals <- 0
  }

  # Set the format
  data <-
    set_fmt(
      data = data,
      columns = columns,
      rows = rows,
      formatter = function(x) {
        formatC(
          x = x,
          digits = decimals,
          mode = "double",
          big.mark = sep_mark,
          decimal.mark = dec_mark,
          format = "f",
          drop0trailing = FALSE)
      }
    )

  # Set the decorator
  data <-
    set_decorator(
      data = data,
      columns = columns,
      rows = rows,
      decorator = function(x) {
        paste0("::curr_", placement, "_", currency_str)
      })

  data
}

#' Format values as dates
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to format.
#' @param rows optional rows to format. Not providing any
#' value results in all rows in \code{columns} being formatted.
#' @param date_style the date style to use.
#' @return an object of class \code{gt_tbl}.
#' @importFrom rlang enquo get_expr flatten_chr
#' @importFrom stringr str_trim str_replace_all
#' @export
fmt_date <- function(data,
                     columns,
                     rows = NULL,
                     date_style = NULL) {

  # If nothing is provided for rows, assume
  # that all rows are in the selection
  if (is.null(rows)) {
    rows <- TRUE
  }

  # Get the requested `columns`
  columns <-
    rlang::enquo(columns) %>%
    rlang::get_expr() %>%
    as.character() %>%
    strsplit(split = " & ") %>%
    rlang::flatten_chr() %>%
    stringr::str_trim()

  columns <- columns[columns != "&"]

  # Resolve the columns to be targeted
  columns <- resolve_columns(data = data, columns = columns)

  # Resolve the rows to be targeted
  rows <- resolve_rows(data = data, rows = rows)

  # Return data if there are no rows or columns to format
  if (length(rows) == 0 | length(columns) == 0) {
    return(data)
  }

  # Transform `date_style` to `date_format_str`
  date_format_str <- get_date_format(date_style = date_style)

  # Set the format
  data <-
    set_fmt(
      data = data,
      columns = columns,
      rows = rows,
      formatter = function(x) {

        ifelse(grepl("^[0-9]*?\\:[0-9]*?", x), paste("1970-01-01", x), x) %>%
          strftime(format = date_format_str) %>%
          stringr::str_replace_all("^0", "") %>%
          stringr::str_replace_all(" 0([0-9])", " \\1") %>%
          stringr::str_replace_all("pm$", "PM") %>%
          stringr::str_replace_all("am$", "AM")
      }
    )

  data
}

#' Format values as times
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to format.
#' @param rows optional rows to format. Not providing any
#' value results in all rows in \code{columns} being formatted.
#' @param time_style the time style to use.
#' @importFrom rlang enquo get_expr flatten_chr
#' @importFrom stringr str_trim str_replace_all
#' @export
fmt_time <- function(data,
                     columns,
                     rows = NULL,
                     time_style = NULL) {

  # If nothing is provided for rows, assume
  # that all rows are in the selection
  if (is.null(rows)) {
    rows <- TRUE
  }

  # Get the requested `columns`
  columns <-
    rlang::enquo(columns) %>%
    rlang::get_expr() %>%
    as.character() %>%
    strsplit(split = " & ") %>%
    rlang::flatten_chr() %>%
    stringr::str_trim()

  columns <- columns[columns != "&"]

  # Resolve the columns to be targeted
  columns <- resolve_columns(data = data, columns = columns)

  # Resolve the rows to be targeted
  rows <- resolve_rows(data = data, rows = rows)

  # Return data if there are no rows or columns to format
  if (length(rows) == 0 | length(columns) == 0) {
    return(data)
  }

  # Transform `time_style` to `time_format_str`
  time_format_str <- get_time_format(time_style = time_style)

  # Set the format
  data <-
    set_fmt(
      data = data,
      columns = columns,
      rows = rows,
      formatter = function(x) {

        ifelse(grepl("^[0-9]*?\\:[0-9]*?", x), paste("1970-01-01", x), x) %>%
          strftime(format = time_format_str) %>%
          stringr::str_replace_all("^0", "") %>%
          stringr::str_replace_all(" 0([0-9])", " \\1") %>%
          stringr::str_replace_all("pm$", "PM") %>%
          stringr::str_replace_all("am$", "AM")
      }
    )

  data
}

#' Format values as date-times
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to format.
#' @param rows optional rows to format. Not providing any
#' value results in all rows in \code{columns} being formatted.
#' @param date_style the date style to use.
#' @param time_style the time style to use.
#' @return an object of class \code{gt_tbl}.
#' @importFrom rlang enquo get_expr flatten_chr
#' @importFrom stringr str_trim str_replace_all
#' @export
fmt_datetime <- function(data,
                         columns,
                         rows = NULL,
                         date_style = NULL,
                         time_style = NULL) {

  # If nothing is provided for rows, assume
  # that all rows are in the selection
  if (is.null(rows)) {
    rows <- TRUE
  }

  # Get the requested `columns`
  columns <-
    rlang::enquo(columns) %>%
    rlang::get_expr() %>%
    as.character() %>%
    strsplit(split = " & ") %>%
    rlang::flatten_chr() %>%
    stringr::str_trim()

  columns <- columns[columns != "&"]

  # Resolve the columns to be targeted
  columns <- resolve_columns(data = data, columns = columns)

  # Resolve the rows to be targeted
  rows <- resolve_rows(data = data, rows = rows)

  # Return data if there are no rows or columns to format
  if (length(rows) == 0 | length(columns) == 0) {
    return(data)
  }

  # Transform `date_style` to `date_format`
  date_format <- get_date_format(date_style = date_style)

  # Transform `time_style` to `time_format`
  time_format <- get_time_format(time_style = time_style)

  # Combine into a single datetime format string
  date_time_format_str <-
    paste0(date_format, " ", time_format)

  # Set the format
  data <-
    set_fmt(
      data = data,
      columns = columns,
      rows = rows,
      formatter = function(x) {

        ifelse(grepl("^[0-9]*?\\:[0-9]*?", x), paste("1970-01-01", x), x) %>%
          strftime(format = date_time_format_str) %>%
          stringr::str_replace_all("^0", "") %>%
          stringr::str_replace_all(" 0([0-9])", " \\1") %>%
          stringr::str_replace_all("pm$", "PM") %>%
          stringr::str_replace_all("am$", "AM")
      }
    )

  data
}

#' Set a column format with a formatter function
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the specification for which columns are to
#' be formatted.
#' @param rows an optional specification for which rows are
#' to be formatted.
#' @param formatter a formatting function.
#' @return an object of class \code{gt_tbl}.
#' @noRd
set_fmt <- function(data,
                    columns,
                    rows = TRUE,
                    formatter) {

  a_list <- list(
    func = formatter,
    cols = columns,
    rows = rows)

  next_index <- length(attr(data, "formats", exact = TRUE)) + 1

  attr(data, "formats", exact = TRUE)[[next_index]] <- a_list

  data
}

#' Add a standardized mark for missing data
#'
#' Wherever there is missing data (i.e., \code{NA} values)
#' a customizable mark may present better than the
#' standard `NA` text that would otherwise appear.
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param missing_mark the text to be used in place
#' of \code{NA} values in the rendered table.
#' @return an object of class \code{gt_tbl}.
#' @export
fmt_missing <- function(data,
                        missing_mark = "---") {

  if (missing_mark == "---") {
    missing_mark <- "&mdash;"
  } else if (missing_mark == "--") {
    missing_mark <- "&ndash;"
  }

  attr(data, "missing_mark", exact = TRUE) <-
    list(missing_mark = missing_mark)

  data
}

#' Set a column format with a formatter function
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the specification for which columns are to
#' be formatted.
#' @param rows an optional specification for which rows are
#' to be formatted.
#' @param decorator a decorator function.
#' @return an object of class \code{gt_tbl}.
#' @noRd
set_decorator <- function(data,
                          columns,
                          rows = TRUE,
                          decorator) {

  a_list <- list(
    func = decorator,
    cols = columns,
    rows = rows)

  next_index <- length(attr(data, "decorators", exact = TRUE)) + 1

  attr(data, "decorators", exact = TRUE)[[next_index]] <- a_list

  data
}
