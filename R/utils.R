
#' Create an empty `transforms` tbl
#' @importFrom dplyr tibble
#' @noRd
empty_transforms_tbl <- function() {

  dplyr::tibble(
    index = NA_integer_,
    transform_type = NA_character_,
    transform_v1 = NA_character_,
    transform_v2 = NA_character_,
    transform_v3 = NA_character_,
    transform_v4 = NA_character_)[-1, ]
}

#' Create an empty `formats` tbl
#' @importFrom dplyr tibble
#' @noRd
empty_formats_tbl <- function() {

  dplyr::tibble(
    index = NA_integer_,
    format_type = NA_character_,
    columns = NA_character_,
    decimals = NA_integer_,
    drop_trailing_zeros = NA,
    thousands_sep = NA,
    negative_style = NA_character_,
    currency = NA_character_,
    accuracy = NA_character_,
    date_style = NA_character_,
    time_style = NA_character_)[-1, ]
}

#' Create an empty `aesthetics` tbl
#' @importFrom dplyr tibble
#' @noRd
empty_aesthetics_tbl <- function() {

  dplyr::tibble(
    type = NA_character_,
    options = NA_character_)[-1, ]
}

#' Create an empty `heading` tbl
#' @importFrom dplyr tibble
#' @noRd
empty_heading_tbl <- function() {

  dplyr::tibble(
    title = NA_character_,
    headnote = NA_character_,
    table_number = NA_character_)[-1, ]
}

#' Create an empty `footnote` tbl
#' @importFrom dplyr tibble
#' @noRd
empty_footnote_tbl <- function() {

  dplyr::tibble(
    index = NA_integer_,
    marker = NA_character_,
    footnote = NA_character_)[-1, ]
}

#' Create an empty `source_note` tbl
#' @importFrom dplyr tibble
#' @noRd
empty_source_note_tbl <- function() {

  dplyr::tibble(
    index = NA_integer_,
    lead_in = NA_character_,
    source_note = NA_character_)[-1, ]
}

#' Create an empty `stubhead_caption` tbl
#' @importFrom dplyr tibble
#' @noRd
empty_stubhead_caption_tbl <- function() {

  dplyr::tibble(
    caption_text = NA_character_,
    alignment = NA_character_)[-1, ]
}

#' Create an empty `boxhead_panel` tbl
#' @importFrom dplyr tibble
#' @noRd
empty_boxhead_panel_tbl <- function() {

  dplyr::tibble(
    column_name = NA_character_,
    spanner_heading = NA_character_,
    column_heading = NA_character_)[-1, ]
}

#' Get the next logical index integer in
#' a table object that has an index column
#' @param tbl a table object that contains
#' an integer-based column called \code{index}
#' @noRd
get_next_index <- function(tbl) {

  if (nrow(tbl) < 1) {
    return(1L)
  } else {
    return((tbl$index %>% max()) + 1L)
  }
}

#' Create a tibble containing date formats
#' @importFrom tibble tribble
#' @noRd
date_formats <- function() {

  tibble::tribble(
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
#' @importFrom tibble tribble
#' @noRd
time_formats <- function() {

  tibble::tribble(
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
    as.character(currency) %in% gt:::currency_symbols$curr_symbol |
      as.character(currency) %in% gt:::currencies$curr_code |
      as.character(currency) %in% gt:::currencies$curr_number,
    TRUE, FALSE)
}

#' Transform `currency` to currency string
#' @importFrom dplyr filter pull
#' @noRd
get_currency_str <- function(currency) {

  if (currency[1] %in% gt:::currency_symbols$curr_symbol) {

    return(
      gt:::currency_symbols %>%
        dplyr::filter(curr_symbol == currency) %>%
        dplyr::pull(symbol))

  } else if (currency[1] %in% gt:::currencies$curr_code) {

    return(
      gt:::currencies %>%
        dplyr::filter(curr_code == currency) %>%
        dplyr::pull(symbol))

  } else if (currency[1] %in% gt:::currencies$curr_number) {

    return(
      gt:::currencies %>%
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

  if (currency[1] %in% gt:::currencies$curr_code) {

    exponent <-
      gt:::currencies %>%
      dplyr::filter(curr_code == currency) %>%
      dplyr::pull(exponent)

  } else if (currency[1] %in% gt:::currencies$curr_number) {

    exponent <-
      gt:::currencies %>%
      dplyr::filter(curr_number == currency) %>%
      dplyr::pull(exponent)
  }

  if (is.na(exponent)) {
    return(0L)
  } else {
    return(exponent %>% as.integer())
  }
}

#' Collapse all styles provided as individual columns
#' to a single `style_attrs` column with a style information
#' for each table cell
#' @param html_table_component the HTML table
#' component that contains style attribute columns.
#' @importFrom dplyr mutate
#' @importFrom tidyr unite
#' @noRd
transmute_style_attrs <- function(html_table_component) {

  col_begin_styles <- 8

  if (ncol(html_table_component) >= col_begin_styles) {

    for (i in col_begin_styles:ncol(html_table_component)) {

      if (i == col_begin_styles) {
        style_names <-
          colnames(html_table_component)[
            col_begin_styles:ncol(html_table_component)]
      }

      for (j in 1:nrow(html_table_component)) {

        if (is.na(html_table_component[j, i])) {

          html_table_component[j, i] <- ""

        } else {

          html_table_component[j, i] <-
            paste0(
              colnames(html_table_component)[i], ":",
              html_table_component[j, i] %>% dplyr::pull(), ";")
        }
      }
    }
  }

  if (ncol(html_table_component) >= col_begin_styles) {

    table_content_styles <-
      html_table_component %>%
      tidyr::unite(
        col = style_attrs,
        col_begin_styles:ncol(html_table_component),
        sep = "")

  } else {

    table_content_styles <-
      html_table_component %>%
      dplyr::mutate(style_attrs = "")
  }

  table_content_styles
}

#' Decode the transform related to column names
#' and column types
#' @return a named character vector.
#' @importFrom stringr str_replace str_split
#' @noRd
decode_col_type_transform <- function(transform_text) {

  if (stringr::str_detect(
    string = transform_text,
    pattern = "^columns:.*")) {

    columns <-
      transform_text %>%
      stringr::str_replace("^columns:(.*)", "\\1") %>%
      stringr::str_split(pattern = ";") %>%
      unlist()

    names(columns) <- rep("column", length(columns))

    return(columns)
  }

  if (stringr::str_detect(
    string = transform_text,
    pattern = "^types:.*")) {

    types <-
      transform_text %>%
      stringr::str_replace("^types:(.*)", "\\1") %>%
      stringr::str_split(pattern = ";") %>%
      unlist()

    names(types) <- rep("type", length(types))

    return(types)
  }
}

#' Modify the `html_table` to incorporate spanner headings
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @importFrom dplyr filter mutate full_join select case_when bind_rows
#' @noRd
modify_spanner_headings <- function(html_tbl) {

  column_spanner_subpart <-
    html_tbl[["html_table"]] %>%
    dplyr::filter(t_subpart == "col_heading") %>%
    dplyr::mutate(row = -1L) %>%
    dplyr::full_join(
      html_tbl[["boxhead_panel"]] %>% dplyr::select(column_name, spanner_heading),
      by = "column_name") %>%
    dplyr::mutate(t_subpart = "spanner_heading") %>%
    dplyr::mutate(content = case_when(
      !is.na(spanner_heading) ~ spanner_heading,
      is.na(spanner_heading) ~ content)) %>%
    dplyr::select(-spanner_heading)

  column_heading_subpart <-
    html_tbl[["html_table"]] %>%
    dplyr::filter(t_subpart == "col_heading") %>%
    dplyr::full_join(
      html_tbl[["boxhead_panel"]] %>% dplyr::select(column_name, column_heading),
      by = "column_name") %>%
    dplyr::mutate(content = case_when(
      !is.na(column_heading) ~ column_heading,
      is.na(column_heading) ~ content)) %>%
    dplyr::select(-column_heading)

  html_tbl[["html_table"]] <-
    dplyr::bind_rows(
      column_spanner_subpart,
      column_heading_subpart,
      html_tbl[["html_table"]] %>%
        dplyr::filter(t_subpart != "col_heading" | is.na(t_subpart)))

  html_tbl
}
