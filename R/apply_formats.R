

#' Format values as a number
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @param columns an option specify which columns
#' are to be formatted.
#' @param decimals an option to specify exactly
#' the number of decimal places to use.
#' @param thousands_sep a logical value that
#' allows for inclusion of a separator at every
#' three digits.
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
format_as_number <- function(html_tbl,
                             columns = NULL,
                             decimals = NULL,
                             thousands_sep = FALSE,
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
          thousands_sep = thousands_sep,
          negative_style = negative_style))

  ## [1] Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  ## [2] Creation of the content table
  html_tbl[["content_tbl"]] <-
    create_content_tbl(tbl = html_tbl[["modified_tbl"]])

  ## [3] Processing of the content table
  html_tbl[["content_tbl"]] <-
    process_content_tbl(
      tbl = html_tbl[["content_tbl"]])

  ## [4] Creation of the HTML table
  html_tbl[["html_table"]] <-
    create_html_table_tbl(
      tbl = html_tbl[["modified_tbl"]])

  ## [5] Join in formatted content
  html_tbl[["html_table"]] <-
    use_html_content(
      html_tbl = html_tbl[["html_table"]],
      content_tbl = html_tbl[["content_tbl"]])

  ## [6] Apply HTML aesthetics
  html_tbl <-
    use_html_aesthetics(
      html_tbl = html_tbl,
      aesthetics_tbl = html_tbl[["aesthetics"]])

  html_tbl
}



#' Format values as currency amounts
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @param columns an option specify which columns
#' are to be formatted.
#' @param decimals an option to specify exactly
#' the number of decimal places to use.
#' @param currency the currency symbol to use.
#' @param thousands_sep a logical value that
#' allows for inclusion of a separator at every
#' three digits.
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
format_as_currency <- function(html_tbl,
                               columns = NULL,
                               decimals = NULL,
                               currency = "dollar",
                               thousands_sep = FALSE,
                               accounting_style = FALSE,
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
          format_type = "as_currency",
          columns = columns,
          decimals = decimals %>% as.integer(),
          thousands_sep = thousands_sep,
          currency = currency))

  ## [1] Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  ## [2] Creation of the content table
  html_tbl[["content_tbl"]] <-
    create_content_tbl(tbl = html_tbl[["modified_tbl"]])

  ## [3] Processing of the content table
  html_tbl[["content_tbl"]] <-
    process_content_tbl(
      tbl = html_tbl[["content_tbl"]])

  ## [4] Creation of the HTML table
  html_tbl[["html_table"]] <-
    create_html_table_tbl(
      tbl = html_tbl[["modified_tbl"]])

  ## [5] Join in formatted content
  html_tbl[["html_table"]] <-
    use_html_content(
      html_tbl = html_tbl[["html_table"]],
      content_tbl = html_tbl[["content_tbl"]])

  ## [6] Apply HTML aesthetics
  html_tbl <-
    use_html_aesthetics(
      html_tbl = html_tbl,
      aesthetics_tbl = html_tbl[["aesthetics"]])

  html_tbl
}


#' Format values as a percentage
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @param columns an option specify which columns
#' are to be formatted.
#' @param decimals an option to specify exactly
#' the number of decimal places to use.
#' @param thousands_sep a logical value that
#' allows for inclusion of a separator at every
#' three digits.
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
format_as_percentage <- function(html_tbl,
                                 columns = NULL,
                                 decimals = NULL,
                                 thousands_sep = FALSE,
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
          thousands_sep = thousands_sep,
          negative_style = negative_style))

  # TODO: add scaling factor of 100. to targeted rows

  ## [1] Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  ## [2] Creation of the content table
  html_tbl[["content_tbl"]] <-
    create_content_tbl(tbl = html_tbl[["modified_tbl"]])

  ## [3] Processing of the content table
  html_tbl[["content_tbl"]] <-
    process_content_tbl(
      tbl = html_tbl[["content_tbl"]])

  ## [4] Creation of the HTML table
  html_tbl[["html_table"]] <-
    create_html_table_tbl(
      tbl = html_tbl[["modified_tbl"]])

  ## [5] Join in formatted content
  html_tbl[["html_table"]] <-
    use_html_content(
      html_tbl = html_tbl[["html_table"]],
      content_tbl = html_tbl[["content_tbl"]])

  ## [6] Apply HTML aesthetics
  html_tbl <-
    use_html_aesthetics(
      html_tbl = html_tbl,
      aesthetics_tbl = html_tbl[["aesthetics"]])

  html_tbl
}



#' Format values as a fraction
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
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
format_as_fraction <- function(html_tbl,
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
          format_type = "as_number",
          columns = columns,
          accuracy = accuracy %>% as.character()))

  ## [1] Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  ## [2] Creation of the content table
  html_tbl[["content_tbl"]] <-
    create_content_tbl(tbl = html_tbl[["modified_tbl"]])

  ## [3] Processing of the content table
  html_tbl[["content_tbl"]] <-
    process_content_tbl(
      tbl = html_tbl[["content_tbl"]])

  ## [4] Creation of the HTML table
  html_tbl[["html_table"]] <-
    create_html_table_tbl(
      tbl = html_tbl[["modified_tbl"]])

  ## [5] Join in formatted content
  html_tbl[["html_table"]] <-
    use_html_content(
      html_tbl = html_tbl[["html_table"]],
      content_tbl = html_tbl[["content_tbl"]])

  ## [6] Apply HTML aesthetics
  html_tbl <-
    use_html_aesthetics(
      html_tbl = html_tbl,
      aesthetics_tbl = html_tbl[["aesthetics"]])

  html_tbl
}
