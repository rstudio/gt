#' @noRd
resolve_rows <- function(data, rows) {

  if (inherits(rows, "rownames_with")) {

    rows <-
      which(
        grepl(paste(rows$pattern, collapse = "|"),
              attr(data, "stub_df", exact = TRUE)[["rowname"]]))

  } else if (is.numeric(rows)) {

    rows <- rows[rows %in% 1:nrow(data)]

  } else if (is.character(rows) &&
             all(!is.na(attr(data, "stub_df")[["rowname"]]))) {

    rows <- which(attr(data, "stub_df")[["rowname"]] %in% rows)
  }

  rows
}

#' @noRd
resolve_columns <- function(data, columns) {

  if (inherits(columns, "quosures")) {
    columns <- columns %>% lapply(`[[`, 2) %>% as.character()
  }

  if (inherits(columns, "columns_with")) {

    columns <- colnames(data)[
      which(grepl(paste(columns$pattern, collapse = "|"), colnames(data)))]

  } else if (is.numeric(columns)) {

    columns <- colnames(data)[columns]

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

#' Get the `sep_mark` value from a locale
#' @noRd
get_locale_sep_mark <- function(locale) {

  sep_mark <-
    locales %>%
    dplyr::filter(base_locale_id == locale) %>%
    dplyr::pull(group_sep)

  sep_mark <- ifelse(sep_mark == "", " ", sep_mark)

  sep_mark
}

#' Get the `dec_mark` value from a locale
#' @noRd
get_locale_dec_mark <- function(locale) {

  dec_mark <-
    locales %>%
    dplyr::filter(base_locale_id == locale) %>%
    dplyr::pull(dec_sep)

  dec_mark
}

#' Get the monetary `dec_mark` value from a locale
#' @noRd
get_locale_monetary_dec_mark <- function(locale) {

  dec_mark <-
    locales %>%
    dplyr::filter(base_locale_id == locale) %>%
    dplyr::pull(monetary_dec_sep)

  dec_mark
}

#' Get a data frame of the `mean` summary stat per group in the input data table
#' @importFrom dplyr group_by summarize_at ungroup mutate select funs
#' @noRd
get_mean_df <- function(data) {

  data %>%
    dplyr::group_by(groupname) %>%
    dplyr::summarize_at(.vars = 3:ncol(data), .funs = funs(mean)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(rowname = "Summary: Mean", type = "mean") %>%
    dplyr::select(groupname, rowname, everything())
}

#' Get a data frame of the `min` summary stat per group in the input data table
#' @importFrom dplyr group_by summarize_at ungroup mutate select funs
#' @noRd
get_min_df <- function(data) {

  data %>%
    dplyr::group_by(groupname) %>%
    dplyr::summarize_at(.vars = 3:ncol(data), .funs = funs(min)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(rowname = "Summary: Min", type = "min") %>%
    dplyr::select(groupname, rowname, everything())
}

#' Get a data frame of the `max` summary stat per group in the input data table
#' @importFrom dplyr group_by summarize_at ungroup mutate select funs
#' @noRd
get_max_df <- function(data) {

  data %>%
    dplyr::group_by(groupname) %>%
    dplyr::summarize_at(.vars = 3:ncol(data), .funs = funs(max)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(rowname = "Summary: Max", type = "max") %>%
    dplyr::select(groupname, rowname, everything())
}

#' Get a data frame of the `median` summary stat per group in the input data
#' table
#' @importFrom dplyr group_by summarize_at ungroup mutate select funs
#' @noRd
get_median_df <- function(data) {

  data %>%
    dplyr::group_by(groupname) %>%
    dplyr::summarize_at(.vars = 3:ncol(data), .funs = funs(median)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(rowname = "Summary: Median", type = "median") %>%
    dplyr::select(groupname, rowname, everything())
}

#' Get a data frame of the `sd` summary stat per group in the input data table
#' @importFrom dplyr group_by summarize_at ungroup mutate select funs
#' @noRd
get_sd_df <- function(data) {

  data %>%
    dplyr::group_by(groupname) %>%
    dplyr::summarize_at(.vars = 3:ncol(data), .funs = funs(sd)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(rowname = "Summary: S.D.", type = "sd") %>%
    dplyr::select(groupname, rowname, everything())
}

#' Get a data frame of the `n` summary stat per group in the input data table
#' @importFrom dplyr group_by summarize_at ungroup mutate select funs
#' @noRd
get_sum_df <- function(data) {

  data %>%
    dplyr::group_by(groupname) %>%
    dplyr::summarize_at(.vars = 3:ncol(data), .funs = funs(sum)) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(rowname = "Summary: Sum", type = "sum") %>%
    dplyr::select(groupname, rowname, everything())
}

#' Get a data frame of the `n` summary stat per group in the input data table
#' @importFrom dplyr group_by summarize_at ungroup mutate select funs
#' @noRd
get_n_df <- function(data) {

  data %>%
    dplyr::group_by(groupname) %>%
    dplyr::summarize_at(.vars = 3:ncol(data), .funs = funs(n())) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(rowname = "Summary: N", type = "n") %>%
    dplyr::select(groupname, rowname, everything())
}

#' Get a data frame of summary lines for all summary types automatically handled
#' in the package in the input data table
#' @importFrom dplyr bind_rows
#' @noRd
get_all_summaries <- function(df) {

  dplyr::bind_rows(
    get_mean_df(df),
    get_min_df(df),
    get_max_df(df),
    get_median_df(df),
    get_sd_df(df),
    get_sum_df(df),
    get_n_df(df))
}

#' Create a vector of CSS color tints
#' @noRd
color_tints <- function() {
  c("yellow", "blue", "pink", "green", "sand")
}

#' Process input text
#'
#' This processes input text based on the class. If incoming text has the class
#' \code{from_markdown} (applied by the \code{md()} helper function), then the
#' text will be sanitized and transformed to HTML from Markdown. If the incoming
#' text has the class \code{preserve_html} (applied by \code{html()} helper
#' function), then the text will be seen as HTML and it won't undergo
#' sanitization.
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

#' Render any formatting directives
#' @noRd
render_formats <- function(data,
                           context) {

  output_df <- data %>% as.data.frame(stringsAsFactors = FALSE)
  output_df[] <- NA_character_

  # Render input data to output data where formatting
  # is specified
  for (i in seq(attr(data, "formats")))  {

    # Determine if the formatter has a function relevant
    # to the context; if not, use the `default` function
    # (which should always be present)
    if (context %in% names(attr(data, "formats")[[i]]$func)) {
      eval_func <- context
    } else {
      eval_func <- "default"
    }

    for (col in attr(data, "formats")[[i]][["cols"]]) {

      # Perform rendering but only do so if the column is present
      if (col %in% colnames(data)) {

        output_df[[col]][attr(data, "formats")[[i]]$rows] <-
          attr(data, "formats")[[i]]$func[[eval_func]](
            data[[col]][attr(data, "formats")[[i]]$rows])
      }
    }
  }

  output_df
}

#' Move input data cells to `output_df` that didn't have any rendering applied
#' during `render_formats()`
#' @noRd
migrate_unformatted_to_output <- function(data, output_df) {

  for (colname in colnames(output_df)) {

    row_index <- is.na(output_df[[colname]])
    output_df[[colname]][row_index] <- as.character(data[[colname]][row_index])
  }

  output_df
}

#' Apply column names to column labels for any of those column labels not
#' explicitly set
#' @noRd
migrate_colnames_to_labels <- function(boxh_df) {

  for (colname in colnames(boxh_df)) {
    if (is.na(boxh_df[2, colname])) {
      boxh_df[2, colname] <- colname
    }
  }

  boxh_df
}

#' Assign center alignment for all columns that haven't had alignment
#' explicitly set
#' @noRd
set_default_alignments <- function(boxh_df) {

  for (colname in colnames(boxh_df)) {
    if (is.na(boxh_df[3, colname])) {
      boxh_df[3, colname] <- "center"
    }
  }

  boxh_df
}

#' Is there any defined elements of a stub present?
#' @noRd
is_stub_available <- function(stub_df) {

  if (!all(is.na((stub_df)[["rowname"]])) ||
      !all(is.na((stub_df)[["groupname"]]))) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

#' Is there any group names defined in the stub?
#' @noRd
are_groups_present <- function(stub_df) {

  if (!all(is.na((stub_df)[["groupname"]]))) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

#' Are there any spanners present?
#' @noRd
are_spanners_present <- function(boxh_df) {

  if (!all(is.na((boxh_df)[1,] %>% t() %>% as.vector()))) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

#' Get the stub components that are available
#' @noRd
get_stub_components <- function(stub_df) {

  stub_components <- c()

  if (any(!is.na(stub_df[["rowname"]]))) {
    stub_components <- c(stub_components, "row_name")
  }

  if (any(!is.na(stub_df[["groupname"]]))) {
    stub_components <- c(stub_components, "group_name")
  }

  stub_components
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
    readLines(system_file(file = paste0("css/", css_file)))

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


is_equal_to <- function(x, y) {
  vapply(x, function(a, b) isTRUE(all.equal(a, b)), logical(1), y)
}

split_scientific_notn <- function(x_str) {

  exp_parts <- strsplit(x_str, "e|E")
  num_part <- exp_parts %>% vapply(`[[`, character(1), 1)
  exp_part <- exp_parts %>% vapply(`[[`, character(1), 2) %>% as.numeric()

  list(num = num_part, exp = exp_part)
}
