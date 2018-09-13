# Create a tibble containing date formats
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

# Create a tibble containing time formats
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

# Transform `date_style` to `date_format`
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

# Transform `time_style` to `time_format`
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

# Determine if a provided `currency` type is valid
#' @noRd
is_currency_valid <- function(currency) {

  ifelse(
    as.character(currency) %in% currency_symbols$curr_symbol |
      as.character(currency) %in% currencies$curr_code |
      as.character(currency) %in% currencies$curr_number,
    TRUE, FALSE)
}

# Transform `currency` to currency string
#' @importFrom dplyr filter pull
#' @noRd
get_currency_str <- function(currency,
                             fallback_to_code = FALSE) {

  # Create bindings for specific variables
  curr_symbol <- symbol <- curr_code <- curr_number <- NULL

  if (currency[1] %in% currency_symbols$curr_symbol) {

    return(
      currency_symbols %>%
        dplyr::filter(curr_symbol == currency) %>%
        dplyr::pull(symbol))

  } else if (currency[1] %in% currencies$curr_code) {

    currency_symbol <-
      currencies %>%
      dplyr::filter(curr_code == currency) %>%
      dplyr::pull(symbol)

    if (fallback_to_code && grepl("&#", currency_symbol)) {

      currency_symbol <-
        currencies %>%
        dplyr::filter(curr_code == currency) %>%
        dplyr::pull(curr_code)
    }

    return(currency_symbol)

  } else if (currency[1] %in% currencies$curr_number) {

    currency_symbol <-
      currencies %>%
      dplyr::filter(curr_number == currency) %>%
      dplyr::pull(symbol)

    if (fallback_to_code && grepl("&#", currency_symbol)) {

      currency_symbol <-
        currencies %>%
        dplyr::filter(curr_code == currency) %>%
        dplyr::pull(curr_code)
    }

    return(currency_symbol)

  } else {
    return(NA)
  }
}

# Transform `currency` to a currency exponent
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

# Get the `sep_mark` value from a locale
#' @noRd
get_locale_sep_mark <- function(locale) {

  sep_mark <-
    locales %>%
    dplyr::filter(base_locale_id == locale) %>%
    dplyr::pull(group_sep)

  sep_mark <- ifelse(sep_mark == "", " ", sep_mark)

  sep_mark
}

# Get the `dec_mark` value from a locale
#' @noRd
get_locale_dec_mark <- function(locale) {

  dec_mark <-
    locales %>%
    dplyr::filter(base_locale_id == locale) %>%
    dplyr::pull(dec_sep)

  dec_mark
}

# This function processes input text based on the class; if incoming text has
# the class `from_markdown` (applied by the `md()` helper function), then the
# text will be sanitized and transformed to HTML from Markdown. If the incoming
# text has the class `preserve_html` (applied by `html()` helper function), then
# the text will be seen as HTML and it won't undergo sanitization
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

# Get prepending and appending text based on a simple pattern
get_pre_post_txt <- function(pattern) {

  prefix <- strsplit(pattern, "\\{x\\}")[[1]][1]
  suffix <- strsplit(pattern, "\\{x\\}")[[1]][2]

  prefix <- ifelse(is.na(prefix), "", prefix)
  suffix <- ifelse(is.na(suffix), "", suffix)

  c(prefix, suffix)
}

# This function is a conveient wrapper for `system.file()` where the `package`
# refers to this package
system_file <- function(file) {
  system.file(file, package = "gt")
}

# This function removes entire HTML tags from input text
remove_html <- function(text) {
  gsub("<.+?>", "", text)
}

# This function transforms a CSS stylesheet to a tibble representation
#' @importFrom dplyr bind_rows tibble filter mutate case_when select
#' @importFrom stringr str_remove str_extract str_trim str_detect
#' @noRd
get_css_tbl <- function(data) {

  raw_css_vec <-
    compile_scss(data) %>%
    as.character() %>%
    strsplit("\n") %>%
    unlist()

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

# Create an inlined style block from a CSS tibble
#' @importFrom dplyr filter select distinct mutate pull
#' @importFrom stringr str_split
#' @noRd
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

# Create an inlined style block from a CSS tibble
#' @importFrom stringr str_extract str_replace
#' @noRd
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

is_equal_to <- function(x, y) {
  vapply(x, function(a, b) isTRUE(all.equal(a, b)), logical(1), y)
}

split_scientific_notn <- function(x_str) {

  exp_parts <- strsplit(x_str, "e|E")
  num_part <- exp_parts %>% vapply(`[[`, character(1), 1)
  exp_part <- exp_parts %>% vapply(`[[`, character(1), 2) %>% as.numeric()

  list(num = num_part, exp = exp_part)
}

# Obtain a line number from a vector of HTML lines by use of a pattern
get_html_line <- function(html_lines, pattern) {

  lines <- grepl(pattern, html_lines)

  if (all(lines == FALSE)) {
    return(NA_integer_)
  } else {
    return(which(lines))
  }
}

# This function is wrapper for `gsub()` that uses default argument values and
# rearranges first three arguments for better pipelining
tidy_gsub <- function(x, pattern, replacement) {

  gsub(pattern, replacement, x)
}

# Options setter for the `opts_df` data frame
opts_df_set <- function(opts_df, option, value) {

  opts_df[which(opts_df$parameter == option), 3] <- value

  opts_df
}

# Options getter for the `opts_df` data frame
opts_df_get <- function(opts_df, option) {

  opts_df[which(opts_df$parameter == option), 3]
}

# Upgrade `cells_*()` to a list() if a single instance provided
as_locations <- function(locations) {

  if (!inherits(locations, "location_cells")) {

    if (!is.list(locations) &&
        any(!vapply(locations, inherits, logical(1), "location_cells"))) {

      stop("The `locations` object should be a list of `cells_*()`.",
           .call = FALSE)
    }
  } else {
    locations <- list(locations)
  }

  locations
}
