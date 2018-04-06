
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
#' @export
format_as_number <- function(html_tbl,
                             columns = NULL,
                             decimals = NULL,
                             thousands_sep = FALSE,
                             negative_style = "signed") {

  index <- get_next_index(tbl = html_tbl[["formats"]])

  if (is.null(columns)) {
    columns <- NA_character_
  } else {
    columns <- paste0("columns:", columns %>% paste(collapse = ","))
  }

  if (is.null(decimals)) {
    decimals <- NA_character_
  } else {
    decimals <- paste0("decimals:", decimals[1] %>% as.integer())
  }

  thousands_sep <- paste0("thousands_sep:", as.character(thousands_sep))

  negative_style <- paste0("negative_style:", as.character(negative_style))

  # Add to `formats` tbl
  html_tbl[["formats"]] <-
    html_tbl[["formats"]] %>%
    tibble::add_row(
      index = index %>% as.integer(),
      format_type = "as_number",
      format_v1 = columns,
      format_v2 = decimals,
      format_v3 = thousands_sep,
      format_v4 = negative_style)

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
  } else {
    columns <- paste0("columns:", columns %>% paste(collapse = ","))
  }

  if (is.null(decimals)) {
    decimals <- NA_character_
  } else {
    decimals <- paste0("decimals:", decimals[1] %>% as.integer())
  }

  currency <- paste0("currency:", as.character(currency))

  thousands_sep <- paste0("thousands_sep:", as.character(thousands_sep))

  accounting_style <- paste0("accounting_style:", as.character(accounting_style))

  negative_style <- paste0("negative_style:", as.character(negative_style))

  # Add to `formats` tbl
  html_tbl[["formats"]] <-
    html_tbl[["formats"]] %>%
    tibble::add_row(
      index = index %>% as.integer(),
      format_type = "as_currency",
      format_v1 = columns,
      format_v2 = decimals,
      format_v3 = currency,
      format_v4 = thousands_sep,
      format_v5 = accounting_style,
      format_v6 = negative_style)

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
#' @export
format_as_percentage <- function(html_tbl,
                                 columns = NULL,
                                 decimals = NULL,
                                 thousands_sep = FALSE,
                                 negative_style = "signed") {

  index <- get_next_index(tbl = html_tbl[["formats"]])

  if (is.null(columns)) {
    columns <- NA_character_
  } else {
    columns <- paste0("columns:", columns %>% paste(collapse = ","))
  }

  if (is.null(decimals)) {
    decimals <- NA_character_
  } else {
    decimals <- paste0("decimals:", decimals[1] %>% as.integer())
  }

  thousands_sep <- paste0("thousands_sep:", as.character(thousands_sep))

  negative_style <- paste0("negative_style:", as.character(negative_style))

  # Add to `formats` tbl
  html_tbl[["formats"]] <-
    html_tbl[["formats"]] %>%
    tibble::add_row(
      index = index %>% as.integer(),
      format_type = "as_percentage",
      format_v1 = columns,
      format_v2 = decimals,
      format_v3 = thousands_sep,
      format_v4 = negative_style)

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
#' @export
format_as_fraction <- function(html_tbl,
                               columns = NULL,
                               accuracy = 3) {

  index <- get_next_index(tbl = html_tbl[["formats"]])

  if (is.null(columns)) {
    columns <- NA_character_
  } else {
    columns <- paste0("columns:", columns %>% paste(collapse = ","))
  }

  accuracy <- paste0("accuracy:", as.character(accuracy))

  # Add to `formats` tbl
  html_tbl[["formats"]] <-
    html_tbl[["formats"]] %>%
    tibble::add_row(
      index = index %>% as.integer(),
      format_type = "as_fraction",
      format_v1 = columns,
      format_v2 = accuracy)

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
