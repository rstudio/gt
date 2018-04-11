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
format_as_number <- function(html_tbl,
                             columns = NULL,
                             decimals = NULL,
                             thousands_sep = FALSE,
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
          thousands_sep = thousands_sep,
          negative_style = negative_style))

  ## [1] Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  ## [2] Creation of the content table
  html_tbl[["content_tbl"]] <-
    create_content_tbl(tbl = html_tbl[["modified_tbl"]])

  ## [2.5] Modification of the content table
  html_tbl <-
    all_tbl_format_steps(
      html_tbl = html_tbl)

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



#' Format values to scientific notation
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
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
#' @importFrom tibble add_row
#' @importFrom dplyr bind_rows
#' @export
format_as_scientific <- function(html_tbl,
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

  ## [1] Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  ## [2] Creation of the content table
  html_tbl[["content_tbl"]] <-
    create_content_tbl(tbl = html_tbl[["modified_tbl"]])

  ## [2.5] Modification of the content table
  html_tbl <-
    all_tbl_format_steps(
      html_tbl = html_tbl)

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
format_as_percentage <- function(html_tbl,
                                 columns = NULL,
                                 decimals = NULL,
                                 thousands_sep = FALSE,
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
          format_type = "as_percentage",
          columns = columns,
          decimals = decimals %>% as.integer(),
          drop_trailing_zeros = drop_trailing_zeros,
          thousands_sep = thousands_sep,
          negative_style = negative_style))

  ## [1] Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  ## [2] Creation of the content table
  html_tbl[["content_tbl"]] <-
    create_content_tbl(tbl = html_tbl[["modified_tbl"]])

  ## [2.5] Modification of the content table
  html_tbl <-
    all_tbl_format_steps(
      html_tbl = html_tbl)

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
          decimals = NA_integer_,
          drop_trailing_zeros = FALSE,
          accuracy = accuracy %>% as.character()))

  ## [1] Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  ## [2] Creation of the content table
  html_tbl[["content_tbl"]] <-
    create_content_tbl(tbl = html_tbl[["modified_tbl"]])

  ## [2.5] Modification of the content table
  html_tbl <-
    all_tbl_format_steps(
      html_tbl = html_tbl)

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


#' Format values as dates
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @param columns an option specify which columns
#' are to be formatted.
#' @param date_style the formatting style to use
#' for dates.
#' @return an object of class \code{html_table}.
#' @importFrom tibble add_row
#' @importFrom dplyr bind_rows
#' @export
format_as_date <- function(html_tbl,
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

  ## [1] Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  ## [2] Creation of the content table
  html_tbl[["content_tbl"]] <-
    create_content_tbl(tbl = html_tbl[["modified_tbl"]])

  ## [2.5] Modification of the content table
  html_tbl <-
    all_tbl_format_steps(
      html_tbl = html_tbl)

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



#' Format values as times
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @param columns an option specify which columns
#' are to be formatted.
#' @param time_style the formatting style to use
#' for times.
#' @return an object of class \code{html_table}.
#' @importFrom tibble add_row
#' @importFrom dplyr bind_rows
#' @export
format_as_time <- function(html_tbl,
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

  index <- gt:::get_next_index(tbl = html_tbl[["formats"]])

  if (is.null(columns)) {
    columns <- NA_character_
  }

  # Add to `formats` tbl
  html_tbl[["formats"]] <-
    dplyr::bind_rows(
      html_tbl[["formats"]],
      gt:::empty_formats_tbl() %>%
        tibble::add_row(
          index = index %>% as.integer(),
          format_type = "as_time",
          columns = columns,
          time_style = time_style %>% as.character()))

  ## [1] Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  ## [2] Creation of the content table
  html_tbl[["content_tbl"]] <-
    create_content_tbl(tbl = html_tbl[["modified_tbl"]])

  ## [2.5] Modification of the content table
  html_tbl <-
    all_tbl_format_steps(
      html_tbl = html_tbl)

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



#' Format values as date-times
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
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
format_as_datetime <- function(html_tbl,
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

  ## [1] Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  ## [2] Creation of the content table
  html_tbl[["content_tbl"]] <-
    create_content_tbl(tbl = html_tbl[["modified_tbl"]])

  ## [2.5] Modification of the content table
  html_tbl <-
    all_tbl_format_steps(
      html_tbl = html_tbl)

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



#' Format values as date-times
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
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
format_as_datetime <- function(html_tbl,
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
          decimals = NA_integer_,
          drop_trailing_zeros = FALSE,
          thousands_sep = FALSE,
          negative_style = NA_character_,
          currency = NA_character_,
          accuracy = NA_character_,
          date_style = date_style,
          time_style = time_style))

  ## [1] Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  ## [2] Creation of the content table
  html_tbl[["content_tbl"]] <-
    create_content_tbl(tbl = html_tbl[["modified_tbl"]])

  ## [2.5] Modification of the content table
  html_tbl <-
    all_tbl_format_steps(
      html_tbl = html_tbl)

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
