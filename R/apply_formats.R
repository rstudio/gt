#' Format numeric values
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns an option specify which columns
#' are to be formatted.
#' @param decimals an option to specify exactly
#' the number of decimal places to use.
#' @param use_big_mark a logical value that
#' allows for inclusion of a number grouping
#' separator for larger numbers.
#' @param drop_trailing_zeros a logical value that
#' allows for removal of trailing zeros (those
#' redundant zeros after the decimal mark).
#' @param negative_style the formatting to use
#' for negative numbers. With \code{signed},
#' negative numbers will be shown with a negative
#' sign. Using \code{parens} will show the
#' negative value in parentheses. The \code{red}
#' option will display the number in red.
#' Finally, \code{parens-red} will display
#' negative numbers as red and enclosed in
#' parentheses.
#' @return an object of class \code{html_table}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and format specified
#' # numeric columns to display values to
#' # two decimal places
#' tab_create(tbl = mtcars) %>%
#'   theme_striped() %>%
#'   fmt_number(
#'     columns = c("drat", "wt", "qsec"),
#'     decimals = 2
#'     )
#' @importFrom tibble add_row
#' @importFrom dplyr bind_rows
#' @export
fmt_number <- function(html_tbl,
                       columns = NULL,
                       decimals = NULL,
                       use_big_mark = FALSE,
                       drop_trailing_zeros = FALSE,
                       negative_style = "signed") {

  index <- get_next_index(tbl = html_tbl[["formats"]])

  if (is.null(columns)) {
    columns <- NA_character_
  }

  if (is.null(decimals)) {
    decimals <- NA_integer_
  }

  # Add to `formats` tbl
  html_tbl[["formats"]] <-
    dplyr::bind_rows(
      html_tbl[["formats"]],
      empty_formats_tbl() %>%
        tibble::add_row(
          index = index %>% as.integer(),
          format_type = "as_number",
          columns = columns,
          decimals = decimals %>% as.integer(),
          drop_trailing_zeros = drop_trailing_zeros,
          use_big_mark = use_big_mark,
          negative_style = negative_style))

  html_tbl
}

#' Format values to scientific notation
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns an option specify which columns
#' are to be formatted.
#' @param decimals an option to specify exactly
#' the number of decimal places to use.
#' @param drop_trailing_zeros a logical value that
#' allows for removal of trailing zeros (those
#' redundant zeros after the decimal mark).
#' @param negative_style the formatting to use
#' for negative numbers. With \code{signed},
#' negative numbers will be shown with a negative
#' sign. Using \code{parens} will show the
#' negative value in parentheses. The \code{red}
#' option will display the number in red.
#' Finally, \code{parens-red} will display
#' negative numbers as red and enclosed in
#' parentheses.
#' @return an object of class \code{html_table}.
#' @examples
#' # Create a table object using the
#' # `pressure` dataset and format a
#' # numeric column to display values in
#' # scientific notation to two decimal places
#' tab_create(tbl = pressure) %>%
#'   theme_striped() %>%
#'   fmt_scientific(
#'     columns = "pressure",
#'     decimals = 2
#'   )
#' @importFrom tibble add_row
#' @importFrom dplyr bind_rows
#' @export
fmt_scientific <- function(html_tbl,
                           columns = NULL,
                           decimals = NULL,
                           drop_trailing_zeros = FALSE,
                           negative_style = "signed") {

  index <- get_next_index(tbl = html_tbl[["formats"]])

  if (is.null(columns)) {
    columns <- NA_character_
  }

  if (is.null(decimals)) {
    decimals <- NA_integer_
  }

  # Add to `formats` tbl
  html_tbl[["formats"]] <-
    dplyr::bind_rows(
      html_tbl[["formats"]],
      empty_formats_tbl() %>%
        tibble::add_row(
          index = index %>% as.integer(),
          format_type = "as_scientific",
          columns = columns,
          decimals = decimals %>% as.integer(),
          drop_trailing_zeros = drop_trailing_zeros,
          negative_style = negative_style))

  html_tbl
}

#' Format values as a percentage
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns an option specify which columns
#' are to be formatted.
#' @param decimals an option to specify exactly
#' the number of decimal places to use.
#' @param use_big_mark a logical value that
#' allows for inclusion of a number grouping
#' separator for larger numbers.
#' @param drop_trailing_zeros a logical value that
#' allows for removal of trailing zeros (those
#' redundant zeros after the decimal mark).
#' @param negative_style the formatting to use
#' for negative numbers. With \code{signed},
#' negative numbers will be shown with a negative
#' sign. Using \code{parens} will show the
#' negative value in parentheses. The \code{red}
#' option will display the number in red.
#' Finally, \code{parens-red} will display
#' negative numbers as red and enclosed in
#' parentheses.
#' @return an object of class \code{html_table}.
#' @importFrom tibble add_row
#' @importFrom dplyr bind_rows
#' @export
fmt_percent <- function(html_tbl,
                        columns = NULL,
                        decimals = NULL,
                        use_big_mark = FALSE,
                        drop_trailing_zeros = FALSE,
                        negative_style = "signed") {

  index <- get_next_index(tbl = html_tbl[["formats"]])

  if (is.null(columns)) {
    columns <- NA_character_
  }

  if (is.null(decimals)) {
    decimals <- NA_integer_
  }

  # Add to `formats` tbl
  html_tbl[["formats"]] <-
    dplyr::bind_rows(
      html_tbl[["formats"]],
      empty_formats_tbl() %>%
        tibble::add_row(
          index = index %>% as.integer(),
          format_type = "as_percent",
          columns = columns,
          decimals = decimals %>% as.integer(),
          drop_trailing_zeros = drop_trailing_zeros,
          use_big_mark = use_big_mark,
          negative_style = negative_style))

  html_tbl
}

#' Format values to fractions
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns an option specify which columns
#' are to be formatted.
#' @param accuracy an option to specify the
#' accuracy of the transformation from decimal
#' values to fractional values. Options are
#' \code{1}, \code{2}, or \code{3} for
#' accuracies with up to 1, 2, or 3 digits in
#' the denominator. Other options are \code{halves},
#' \code{quarters}, \code{eigths}, \code{sixteenths},
#' \code{tenths}, and \code{hundreths}, where all
#' of these round fractions to the nearest namesake
#' value.
#' @return an object of class \code{html_table}.
#' @importFrom tibble add_row
#' @importFrom dplyr bind_rows
#' @export
fmt_fraction <- function(html_tbl,
                         columns = NULL,
                         accuracy = 3) {

  index <- get_next_index(tbl = html_tbl[["formats"]])

  if (is.null(columns)) {
    columns <- NA_character_
  }

  if (is.null(decimals)) {
    decimals <- NA_integer_
  }

  # Add to `formats` tbl
  html_tbl[["formats"]] <-
    dplyr::bind_rows(
      html_tbl[["formats"]],
      empty_formats_tbl() %>%
        tibble::add_row(
          index = index %>% as.integer(),
          format_type = "as_fraction",
          columns = columns,
          decimals = NA_integer_,
          drop_trailing_zeros = FALSE,
          accuracy = accuracy %>% as.character()))

  html_tbl
}

#' Format values as dates
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns an option specify which columns
#' are to be formatted.
#' @param date_style the formatting style to use
#' for dates.
#' @return an object of class \code{html_table}.
#' @importFrom tibble add_row
#' @importFrom dplyr bind_rows
#' @export
fmt_date <- function(html_tbl,
                     columns = NULL,
                     date_style = NULL) {

  # If no `date_style` provided, use `iso`
  if (is.null(date_style)) {
    date_style <- "iso"
  }

  # Return early if `date_style` does not have a valid value
  if (!is_date_style_valid(date_style = date_style)) {

    message("The value supplied for `date_style` is not valid.")
    return(html_tbl)
  }

  index <- get_next_index(tbl = html_tbl[["formats"]])

  if (is.null(columns)) {
    columns <- NA_character_
  }

  # Add to `formats` tbl
  html_tbl[["formats"]] <-
    dplyr::bind_rows(
      html_tbl[["formats"]],
      empty_formats_tbl() %>%
        tibble::add_row(
          index = index %>% as.integer(),
          format_type = "as_date",
          columns = columns,
          date_style = date_style %>% as.character()))

  html_tbl
}

#' Format values as times
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns an option specify which columns
#' are to be formatted.
#' @param time_style the formatting style to use
#' for times.
#' @return an object of class \code{html_table}.
#' @importFrom tibble add_row
#' @importFrom dplyr bind_rows
#' @export
fmt_time <- function(html_tbl,
                     columns = NULL,
                     time_style = NULL) {

  # If no `time_style` provided, use `hms`
  if (is.null(time_style)) {
    time_style <- "hms"
  }

  # Return early if `time_style` does not have a valid value
  if (!is_time_style_valid(time_style = time_style)) {

    message("The value supplied for `time_style` is not valid.")
    return(html_tbl)
  }

  index <- get_next_index(tbl = html_tbl[["formats"]])

  if (is.null(columns)) {
    columns <- NA_character_
  }

  # Add to `formats` tbl
  html_tbl[["formats"]] <-
    dplyr::bind_rows(
      html_tbl[["formats"]],
      empty_formats_tbl() %>%
        tibble::add_row(
          index = index %>% as.integer(),
          format_type = "as_time",
          columns = columns,
          time_style = time_style %>% as.character()))

  html_tbl
}

#' Format values as date-times
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns an option specify which columns
#' are to be formatted.
#' @param date_style the formatting style to use
#' for dates.
#' @param time_style the formatting style to use
#' for times.
#' @return an object of class \code{html_table}.
#' @importFrom tibble add_row
#' @importFrom dplyr bind_rows
#' @export
fmt_datetime <- function(html_tbl,
                         columns = NULL,
                         date_style = NULL,
                         time_style = NULL) {

  index <- get_next_index(tbl = html_tbl[["formats"]])

  if (is.null(columns)) {
    columns <- NA_character_
  }

  # Add to `formats` tbl
  html_tbl[["formats"]] <-
    dplyr::bind_rows(
      html_tbl[["formats"]],
      empty_formats_tbl() %>%
        tibble::add_row(
          index = index %>% as.integer(),
          format_type = "as_datetime",
          columns = columns,
          date_style = date_style,
          time_style = time_style))

  html_tbl
}

#' Format values as currencies
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns an option specify which columns
#' are to be formatted.
#' @param currency the currency to use for the
#' numeric value.
#' @param use_subunits an option for whether the
#' subunits portion of a currency value should be
#' displayed.
#' @param decimals an option to specify exactly
#' the number of decimal places to use.
#' @param use_big_mark a logical value that
#' allows for inclusion of a number grouping
#' separator for larger numbers.
#' @param negative_style the formatting to use
#' for negative numbers. With \code{signed},
#' negative numbers will be shown with a negative
#' sign. Using \code{parens} will show the
#' negative value in parentheses. The \code{red}
#' option will display the number in red.
#' Finally, \code{parens-red} will display
#' negative numbers as red and enclosed in
#' parentheses.
#' @return an object of class \code{html_table}.
#' @importFrom tibble add_row
#' @importFrom dplyr bind_rows
#' @export
fmt_currency <- function(html_tbl,
                         columns = NULL,
                         currency,
                         use_subunits = TRUE,
                         decimals = NULL,
                         use_big_mark = FALSE,
                         negative_style = "signed") {

  # Return early if `currency` does not have a valid value
  if (!is_currency_valid(currency = currency)) {

    message("The value supplied for `currency` is not valid.")
    return(html_tbl)
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

  index <- get_next_index(tbl = html_tbl[["formats"]])

  if (is.null(columns)) {
    columns <- NA_character_
  }

  # Add to `formats` tbl
  html_tbl[["formats"]] <-
    dplyr::bind_rows(
      html_tbl[["formats"]],
      empty_formats_tbl() %>%
        tibble::add_row(
          index = index %>% as.integer(),
          format_type = "as_currency",
          columns = columns,
          decimals = decimals,
          use_big_mark = use_big_mark,
          negative_style = negative_style,
          currency = currency_str))

  html_tbl
}
