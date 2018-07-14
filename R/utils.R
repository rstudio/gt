#' @noRd
resolve_rows <- function(data, rows) {

  if (inherits(rows, "rownames_with")) {
    rows <- which(grepl(paste(rows$pattern, collapse = "|"), attr(data, "stub_df")[["rowname"]]))
  } else if (is.numeric(rows)) {
    rows <- rows[rows %in% 1:nrow(data)]
  } else if (is.character(rows) && all(!is.na(attr(data, "stub_df")[["rowname"]]))) {
    rows <- which(attr(data, "stub_df")[["rowname"]] %in% rows)
  }

  rows
}

#' @noRd
resolve_columns <- function(data, columns) {

  if (inherits(columns, "columns_with")) {
    columns <- colnames(data)[
      which(grepl(paste(columns$pattern, collapse = "|"), colnames(data)))]
  } else if (is.numeric(columns)) {
    columns <- colnames(data)[columns[columns %in% 1:ncol(data)]]
  } else if (is.character(columns)) {
    columns <- colnames(data)[which(colnames(data) %in% columns)]
  }

  columns
}

#' @noRd
is_target_in_table <- function(data, location) {

  if (is.numeric(location$row) &&
      !(location$row %in% 1:nrow(data))) {
    return(FALSE)
  }
  if (is.character(location$row) &&
      !(location$row %in% attr(data, "stub_df")[["rowname"]])) {
    return(FALSE)
  }
  if (is.numeric(location$column) &&
      !(location$column %in% 1:ncol(data))) {
    return(FALSE)
  }
  if (is.character(location$column) &&
      !(location$column %in% colnames(data))) {
    return(FALSE)
  } else {
    return(TRUE)
  }
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

#' Remove HTML tags from input text
#' @noRd
remove_html <- function(text) {
  gsub("<.+?>", "", text)
}

#' Transform a CSS stylesheet to a tibble
#' @noRd
#' @importFrom dplyr bind_rows tibble filter mutate case_when select
#' @importFrom stringr str_remove str_extract str_trim str_detect
get_css_tbl <- function(css_file = "gt.css") {

  raw_css_vec <-
    system_file(file = paste0("css/", css_file)) %>% read_lines()

  ruleset_start <- which(grepl("\\{\\s*", raw_css_vec))
  ruleset_end <- which(grepl("\\s*\\}\\s*", raw_css_vec))

  css_tbl <- tibble()
  for (i in seq(ruleset_start)) {

    css_tbl <-
      dplyr::bind_rows(
        css_tbl,
        dplyr::tibble(
          selector = rep(
            stringr::str_remove(raw_css_vec[ruleset_start[i]], "\\s*\\{\\s*$"),
            (ruleset_end[i] - ruleset_start[i] - 1)),
          property = raw_css_vec[(ruleset_start[i] + 1):(ruleset_end[i] - 1)] %>%
            stringr::str_extract("[a-zA-z-]*?(?=:)") %>%
            stringr::str_trim(),
          value = raw_css_vec[(ruleset_start[i] + 1):(ruleset_end[i] - 1)] %>%
            stringr::str_extract("(?<=:).*") %>%
            stringr::str_remove(pattern = ";\\s*") %>%
            stringr::str_remove(pattern = "\\/\\*.*") %>%
            stringr::str_trim()) %>%
          dplyr::filter(!is.na(property))
      )
  }

  css_tbl <- css_tbl %>%
    dplyr::mutate(type = case_when(
      stringr::str_detect(selector, "^[a-z]") ~ "element",
      stringr::str_detect(selector, "^#") ~ "id",
      stringr::str_detect(selector, "^\\.") ~ "class")) %>%
    dplyr::select(selector, type, property, value)

  css_tbl
}

#' Create an inlined style block from a CSS tibble
#' @noRd
#' @param class_names the literal class names used within
#' an HTML class attribute.
#' @param css_tbl a CSS tibble that can be created using the
#' \code{get_css_tbl} function.
#' @importFrom dplyr filter select distinct mutate pull
#' @importFrom stringr str_split
create_inline_styles <- function(class_names, css_tbl) {

  class_names <-
    class_names %>%
    stringr::str_split("\\s+") %>%
    unlist()

  paste0(
    "style=\"",
    css_tbl %>%
      dplyr::filter(selector %in% paste0(".", class_names)) %>%
      dplyr::select(property, value) %>%
      dplyr::distinct() %>%
      dplyr::mutate(property_value = paste0(property, ":", value, ";")) %>%
      dplyr::pull(property_value) %>%
      paste(collapse = ""),
    "\"")
}


#' Create an inlined style block from a CSS tibble
#' @noRd
#' @importFrom stringr str_extract str_replace
inline_html_styles <- function(html, css_tbl) {

  repeat {
    if (grepl("class=\\'(.*?)\\'", html)) {

      class_names <-
        html %>%
        stringr::str_extract(
          pattern = "class=\\'(.*?)\\'") %>%
        stringr::str_extract("(?<=\\').*(?=\\')")

      inline_styles <-
        create_inline_styles(
          class_names = class_names, css_tbl)

      html <- html %>%
        str_replace(
          pattern = "class=\\'(.*?)\\'",
          replacement = inline_styles)
    } else {
      break
    }
  }

  html
}
