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
    use_big_mark = NA,
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

#' Create an empty `fonts` tbl
#' @importFrom dplyr tibble
#' @noRd
empty_fonts_tbl <- function() {

  dplyr::tibble(
    type = NA_character_,
    color = NA_character_,
    font_1 = NA_character_,
    font_2 = NA_character_,
    font_3 = NA_character_,
    font_4 = NA_character_)[-1, ]
}

#' Create an empty `heading` tbl
#' @importFrom dplyr tibble
#' @noRd
empty_heading_tbl <- function() {

  dplyr::tibble(
    title = NA_character_,
    headnote = NA_character_,
    table_number = NA_character_,
    font = NA_character_)[-1, ]
}

#' Create an empty `footnote` tbl
#' @importFrom dplyr tibble
#' @noRd
empty_footnote_tbl <- function() {

  dplyr::tibble(
    index = NA_integer_,
    type = NA_character_,
    glyph = NA_character_,
    row = NA_integer_,
    column = NA_integer_,
    footnote = NA_character_)[-1, ]
}

#' Create an empty `source_note` tbl
#' @importFrom dplyr tibble
#' @noRd
empty_source_note_tbl <- function() {

  dplyr::tibble(
    index = NA_integer_,
    source_note = NA_character_,
    font = NA_character_)[-1, ]
}

#' Create an empty `stubhead_caption` tbl
#' @importFrom dplyr tibble
#' @noRd
empty_stubhead_caption_tbl <- function() {

  dplyr::tibble(
    caption_text = NA_character_,
    alignment = NA_character_)[-1, ]
}

#' Create an empty `stub_block` tbl
#' @importFrom dplyr tibble
#' @noRd
empty_stub_block_tbl <- function() {

  dplyr::tibble(
    stub_heading = NA_character_,
    row_number = NA_integer_)[-1, ]
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

#' Define the first default font
#' @noRd
default_font_1 <- function() {
  "Helvetica"
}

#' Define the second default font
#' @noRd
default_font_2 <- function() {
  "Segoe UI"
}

#' Define the third default font
#' @noRd
default_font_3 <- function() {
  "Arial"
}

#' Define the fourth default font
#' @noRd
default_font_4 <- function() {
  "Sans-Serif"
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
#' @importFrom stringr str_detect str_replace str_split
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
#' created using the \code{tab_create()} function.
#' @importFrom dplyr filter mutate full_join select
#' @importFrom dplyr case_when bind_rows distinct
#' @noRd
modify_spanner_headings <- function(html_tbl) {

  # Create bindings for specific variables
  t_subpart <- column_name <- spanner_heading <- column_heading <- NULL

  # Use `boxhead_panel` entries to create a row `-1`,
  # which is the spanner row above the heading row (row `0`)
  # TODO: only include `border-right` line if there is a
  #       colspan to the immediate right
  column_spanner_subpart <-
    html_tbl[["html_table"]] %>%
    dplyr::filter(t_subpart %in% c("col_heading", "stubhead")) %>%
    dplyr::mutate(row = -1L) %>%
    dplyr::full_join(
      html_tbl[["boxhead_panel"]] %>% dplyr::select(column_name, spanner_heading),
      by = "column_name") %>%
    dplyr::mutate(t_subpart = "spanner_heading") %>%
    dplyr::mutate(content = case_when(
      !is.na(spanner_heading) ~ spanner_heading,
      is.na(spanner_heading) ~ content)) %>%
    dplyr::mutate(`border-right` = ifelse(
      !is.na(spanner_heading), "5px solid white", NA_character_)) %>%
    dplyr::mutate(`border-bottom` = ifelse(
      !is.na(spanner_heading), "2px solid #A8A8A8", NA_character_)) %>%
    dplyr::select(-spanner_heading)

  # Use the `boxhead_panel` entries to modify the
  # heading row (row `0`)
  column_heading_subpart <-
    html_tbl[["html_table"]] %>%
    dplyr::filter(t_subpart %in% c("col_heading", "stubhead")) %>%
    dplyr::full_join(
      html_tbl[["boxhead_panel"]] %>% dplyr::select(column_name, column_heading),
      by = "column_name") %>%
    dplyr::mutate(content = case_when(
      !is.na(column_heading) ~ column_heading,
      is.na(column_heading) ~ content)) %>%
    dplyr::select(-column_heading)

  # Recombine the `spanner`, `heading`, and the
  # remainder of the `html_table`
  html_tbl[["html_table"]] <-
    dplyr::bind_rows(
      column_spanner_subpart,
      column_heading_subpart,
      html_tbl[["html_table"]] %>%
        dplyr::filter(
          t_subpart != "col_heading" |
            t_subpart != "stubhead" |
            is.na(t_subpart))) %>%
    dplyr::distinct()

  html_tbl
}
