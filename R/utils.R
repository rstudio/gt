#' @importFrom purrr map_chr
#' @importFrom dplyr mutate select everything bind_rows tibble
#' @noRd
encase_tbl <- function(data,
                       data_types = NULL) {

  n_col <- ncol(data)

  if (is.null(data_types)) {
    data_types <-
      seq(ncol(data)) %>%
      purrr::map_chr(.f = function(x) class(data[[x]]))
  }

  data <- data %>%
    dplyr::mutate(`:row_number:` = 1:nrow(data)) %>%
    dplyr::mutate(`:group_name:` = NA_character_) %>%
    dplyr::mutate(`:row_name:` = NA_character_) %>%
    dplyr::select(`:row_number:`, `:group_name:`, `:row_name:`, everything())

  if ("rowname" %in% colnames(data)) {

    rowname_col <- which(colnames(data[, -1:-3]) == "rowname")
    data_types <- data_types[-rowname_col]
    n_col <- n_col - 1

    data <- data %>%
      dplyr::mutate(`:row_name:` = rowname) %>%
      dplyr::select(-rowname)
  }

  data <-
    dplyr::bind_rows(
      dplyr::tibble(
        `:row_number:` = NA_integer_,
        `:group_name:` = "column_number",
        `:row_name:` = NA_character_),
      dplyr::tibble(
        `:row_number:` = NA_integer_,
        `:group_name:` = "column_type"),
      dplyr::tibble(
        `:row_number:` = NA_integer_,
        `:group_name:` = "column_align"),
      dplyr::tibble(
        `:row_number:` = NA_integer_,
        `:group_name:` = "spanner_name"),
      data) %>%
    as.data.frame(stringsAsFactors = FALSE)

  data[, 1:length(names(data))] <-
    as.character(unlist(data[, 1:length(names(data))]))

  for (i in 4:(3 + n_col)) {
    data[1, i] <- i - 3
    data[2, i] <- data_types[i - 3]
    data[3, i] <- "center"
  }

  data[1, 3] <- "0"
  data[2, 3] <- "character"
  data[3, 3] <- "right"
  data[4, 3] <- NA_character_

  data
}

#' Apply data types to data frame columns
#' @noRd
apply_data_types <- function(data, types){

  for (i in 1:length(data)){
    FUN <-
      switch(
        types[i],
        character = as.character,
        numeric = as.numeric)

    data[,i] <- FUN(data[,i])
  }
  data
}

#' Extract an encased data table
#' @noRd
get_working_tbl <- function(data,
                            apply_original_types = FALSE,
                            data_types = NULL) {

  if (apply_original_types) {
    original_types <-
      data[2, -1:-3] %>%
      t() %>%
      as.character()
  }

  # The data is in the unencased portion of
  # the table; here, the casement is removed
  data <- data[-1:-4, -1:-3]

  # Reset the official rownames for the table
  rownames(data) <- NULL

  data
}

#' Get the original data types
#' @noRd
get_orig_types <- function(data) {
  data[2, -1:-3] %>% t() %>% as.character()
}

#' Reverse percentages back to the original value
#' @noRd
reverse_percent <- function(x) {
  if (!is.numeric(x) && any(grepl("::percent", x))) {

    # Set aside extra formats
    formats <- gsub("([0-9,-\\.]*?::percent)(.*)", "\\2", x)
    base <- gsub("([0-9,-\\.]*?::percent)(.*)", "\\1", x)

    return(paste0(as.numeric(gsub("(::percent|,)", "", base)) / 100, formats))
  } else {
    return(x)
  }
}

#' Extract a value from a cell that is free
#' of any attached formatting directives
#' @noRd
extract_value <- function(x) {
  # Extract value from a string that may
  # contain format directives
  values <- c()
  for (i in seq(x)) {
    if (grepl("::percent", x[i])) {
      values <- c(values, gsub("(.*?)(::.*)", "\\1", x[i]))
      values[i] <- paste0(values[i], "::percent")
    } else {
      values <- c(values, gsub("(.*?)(::.*)", "\\1", x[i]))
    }
  }
  values
}

#' Extract formatting directives from a cell
#' value so that we may recombine them later
#' @noRd
extract_formats <- function(x) {
  # Extract formats from a string
  formats <- c()
  for (i in seq(x)) {
    if (grepl("::", x[i])) {
      formats <- c(formats, gsub("(.*?)(::.*)", "\\2", x[i]))
      formats[i] <- gsub("::percent", "", formats[i])
    } else {
      formats <- c(formats, "")
    }
  }
  formats
}

#' Recombine the value (`x`) and the formats;
#' this is usually after some operation has
#' been done to `x` and we'd like to restore
#' the association between value and the
#' previously-set formatting directives
#' @noRd
recombine_formats <- function(x, formats) {
  # Combine the format-free value with
  # the `formats` string
  paste0(x, formats)
}

#' Create a tibble containing date formats
#' @importFrom dplyr tribble
#' @noRd
date_formats <- function() {

  dplyr::tribble(
    ~format_number, ~format_name,           ~format_code,
    "1",	          "iso",                  "%F",
    "2",	          "wday_month_day_year",  "%A, %B %d, %Y",
    "3",	          "wd_m_day_year",        "%a, %b %d, %Y",
    "4",	          "wday_day_month_year",  "%A %d %B %Y",
    "5",	          "month_day_year",       "%B %d, %Y",
    "6",	          "m_day_year",           "%b %d, %Y",
    "7",	          "day_m_year",           "%d %b %Y",
    "8",	          "day_month_year",       "%d %B %Y",
    "9",	          "day_month",            "%d %B",
    "10",	          "year",                 "%Y",
    "11",	          "month",                "%B",
    "12",	          "day",                  "%d",
    "13",	          "year.mn.day",          "%Y/%m/%d",
    "14",	          "y.mn.day",             "%y/%m/%d")
}

#' Create a vector of date format names
#' @noRd
date_format_names <- function() {
  c("iso", "wday_month_day_year", "wd_m_day_year", "wday_day_month_year",
    "month_day_year", "m_day_year", "day_m_year", "day_month_year",
    "day_month", "year", "month", "day", "year.mn.day", "y.mn.day")
}

#' Determine if `date_style` has a valid value
#' @noRd
is_date_style_valid <- function(date_style) {

  ifelse(
    as.character(date_style) %in% as.character(1:14) |
      as.character(date_style) %in% date_format_names(),
    TRUE, FALSE)
}

#' Create a tibble containing time formats
#' @importFrom dplyr tribble
#' @noRd
time_formats <- function() {

  dplyr::tribble(
    ~format_number, ~format_name, ~format_code,
    "1",	          "hms",        "%H:%M:%S",
    "2",	          "hm",         "%H:%M",
    "3",	          "hms_p",      "%I:%M:%S %P",
    "4",	          "hm_p",       "%I:%M %P",
    "5",	          "h_p",        "%I %P")
}

#' Create a vector of time format names
#' @noRd
time_format_names <- function() {
  c("hms", "hm", "hms_p", "hm_p", "h_p")
}

#' Determine if `time_style` has a valid value
#' @noRd
is_time_style_valid <- function(time_style) {

  ifelse(
    as.character(time_style) %in% as.character(1:5) |
      as.character(time_style) %in% time_format_names(),
    TRUE, FALSE)
}

#' Transform `date_style` to `date_format`
#' @importFrom dplyr filter pull
#' @noRd
get_date_format <- function(date_style) {

  # Create bindings for specific variables
  format_number <- format_code <- format_name <- NULL

  if (date_style %in% 1:14 | date_style %in% as.character(1:14)) {

    return(
      date_formats() %>%
        dplyr::filter(format_number == as.character(date_style)) %>%
        dplyr::pull(format_code))
  }

  if (date_style %in% date_formats()$format_name) {
    return(
      date_formats() %>%
        dplyr::filter(format_name == date_style) %>%
        dplyr::pull(format_code))
  }
}

#' Transform `time_style` to `time_format`
#' @importFrom dplyr filter pull
#' @noRd
get_time_format <- function(time_style) {

  # Create bindings for specific variables
  format_number <- format_code <- format_name <- NULL

  if (time_style %in% 1:5 | time_style %in% as.character(1:5)) {

    return(
      time_formats() %>%
        dplyr::filter(format_number == as.character(time_style)) %>%
        dplyr::pull(format_code))
  }

  if (time_style %in% time_formats()$format_name) {
    return(
      time_formats() %>%
        dplyr::filter(format_name == time_style) %>%
        dplyr::pull(format_code))
  }
}

#' Concatenate date and time formats to form a
#' single date-time formatting string
#' @noRd
concat_date_time_formats <- function(date_format, time_format) {

  if (is.na(date_format)) {
    return(time_format)
  } else if (is.na(time_format)) {
    return(date_format)
  } else if (!is.na(date_format) & !is.na(time_format)) {
    return(paste(date_format, time_format))
  } else {
    return(NA_character_)
  }
}

#' Determine if a provided `currency` type is valid
#' @noRd
is_currency_valid <- function(currency) {

  ifelse(
    as.character(currency) %in% currency_symbols$curr_symbol |
      as.character(currency) %in% currencies$curr_code |
      as.character(currency) %in% currencies$curr_number,
    TRUE, FALSE)
}

#' Transform `currency` to currency string
#' @importFrom dplyr filter pull
#' @noRd
get_currency_str <- function(currency) {

  # Create bindings for specific variables
  curr_symbol <- symbol <- curr_code <- curr_number <- NULL

  if (currency[1] %in% currency_symbols$curr_symbol) {

    return(
      currency_symbols %>%
        dplyr::filter(curr_symbol == currency) %>%
        dplyr::pull(symbol))

  } else if (currency[1] %in% currencies$curr_code) {

    return(
      currencies %>%
        dplyr::filter(curr_code == currency) %>%
        dplyr::pull(symbol))

  } else if (currency[1] %in% currencies$curr_number) {

    return(
      currencies %>%
        dplyr::filter(curr_number == currency) %>%
        dplyr::pull(symbol))

  } else {
    return(NA)
  }
}


#' Transform `currency` to a currency exponent
#' @importFrom dplyr filter pull
#' @noRd
get_currency_exponent <- function(currency) {

  # Create bindings for specific variables
  curr_code <- curr_number <- NULL

  if (currency[1] %in% currencies$curr_code) {

    exponent <-
      currencies %>%
      dplyr::filter(curr_code == currency) %>%
      dplyr::pull(exponent)

  } else if (currency[1] %in% currencies$curr_number) {

    exponent <-
      currencies %>%
      dplyr::filter(curr_number == currency) %>%
      dplyr::pull(exponent)
  }

  if (is.na(exponent)) {
    return(0L)
  } else {
    return(exponent %>% as.integer())
  }
}

#' Process input text
#' This processes input text based on the class. If
#' incoming text has the class \code{from_markdown}
#' (applied by the \code{md()} helper function), then
#' the text will be sanitized and transformed to HTML
#' from Markdown. If the incoming text has the class
#' \code{preserve_html} (applied by \code{html()}
#' helper function), then the text will be seen as
#' HTML and it won't undergo sanitization
#' @param text the text to be sanitized.
#' @importFrom stringr str_replace_all
#' @importFrom htmltools htmlEscape
#' @importFrom commonmark markdown_html
#' @noRd
process_text <- function(text) {

  # TODO: implement as S3 generic (good for extension of method)
  # TODO: consider changing name to something more specific

  if (inherits(text, "from_markdown")) {

    text <-
      text %>%
      as.character() %>%
      htmltools::htmlEscape() %>%
      commonmark::markdown_html() %>%
      stringr::str_replace_all("^<p>|</p>|\n", "")

    return(text)

  } else if (inherits(text, "preserve_html")) {

    text <- text %>% as.character()

    return(text)

  } else {

    text <- text %>%
      as.character() %>%
      htmltools::htmlEscape()

    return(text)
  }
}





#' A wrapper for `system.file()`
#' @noRd
system_file <- function(file) {
  system.file(file, package = "gt")
}
