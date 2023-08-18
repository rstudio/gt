#------------------------------------------------------------------------------#
#
#                /$$
#               | $$
#     /$$$$$$  /$$$$$$
#    /$$__  $$|_  $$_/
#   | $$  \ $$  | $$
#   | $$  | $$  | $$ /$$
#   |  $$$$$$$  |  $$$$/
#    \____  $$   \___/
#    /$$  \ $$
#   |  $$$$$$/
#    \______/
#
#  This file is part of the 'rstudio/gt' project.
#
#  Copyright (c) 2018-2023 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


#' Determine whether an object is a `gt_tbl`
#'
#' @param data A table object that is created using the [gt()] function.
#' @noRd
is_gt_tbl <- function(data) {
  inherits(data, "gt_tbl")
}

#' Determine whether an object is a `gt_group`
#'
#' @param data A table object that is created using the [gt_group()] function.
#' @noRd
is_gt_group <- function(data) {
  inherits(data, "gt_group")
}

#' Determine whether an object inherits from `gt_tbl` or `gt_group`
#'
#' @param data A table object that is created either using the [gt()] or
#' [gt_group()] functions.
#' @noRd
is_gt_tbl_or_group <- function(data) {
  inherits(data, "gt_tbl") || inherits(data, "gt_group")
}

is_gt_tbl_empty <- function(data) {
  data_tbl <- dt_data_get(data = data)
  ncol(data_tbl) == 0 && nrow(data_tbl) == 0
}

is_gt_tbl_empty_w_cols <- function(data) {
  data_tbl <- dt_data_get(data = data)
  ncol(data_tbl) > 0 && nrow(data_tbl) == 0
}

# Adjustments for a completely empty table (no columns and no rows)
adjust_gt_tbl_empty <- function(data) {

  # Get the table's locale
  tbl_locale <- dt_locale_get_value(data = data)

  no_table_data_text <- get_locale_no_table_data_text(locale = tbl_locale)

  data <- cols_add(data, no_data = no_table_data_text)
  data <- tab_options(data, column_labels.hidden = TRUE)
  data <- cols_align(data, align = "center", columns = no_data)
  data <- cols_width(data, no_data ~ px(500))

  data
}

#' Determines whether a character vector is non-empty
#'
#' @param x A character vector.
#' @noRd
is_nonempty_string <- function(x) {
  length(x) > 0 && any(grepl("\\S", x))
}

#' Stop any function if object is not a `gt_tbl` object
#'
#' @param data The input `data` object that is to be validated.
#'
#' @noRd
stop_if_not_gt_tbl <- function(data) {
  if (!is_gt_tbl(data = data)) {
    cli::cli_abort(
      "The `data` provided is not a `gt_tbl` object."
    )
  }
}

#' Stop any function if object is not a `gt_group` object
#'
#' @param data The input `data` object that is to be validated.
#'
#' @noRd
stop_if_not_gt_group <- function(data) {
  if (!is_gt_group(data = data)) {
    cli::cli_abort(
      "The `data` provided is not a `gt_group` object."
    )
  }
}

#' Stop any function if object is neither `gt_tbl` nor `gt_group`
#'
#' @param data The input `data` object that is to be validated.
#'
#' @noRd
stop_if_not_gt_tbl_or_group <- function(data) {
  if (!is_gt_tbl(data = data) && !is_gt_group(data = data)) {
    cli::cli_abort(
      "The `data` provided is neither a `gt_tbl` nor a `gt_group` object."
    )
  }
}

#' Does an object have the `html` class?
#'
#' @noRd
is_html <- function(x) {
  inherits(x, "html") && isTRUE(attr(x, "html"))
}

#' Does an object have the `rtf_text` class?
#'
#' @noRd
is_rtf <- function(x) {
  inherits(x, "rtf_text")
}

#' Get a tibble containing date formats
#'
#' @noRd
date_formats <- function() {
  dplyr::tribble(
    ~format_number, ~format_name,           ~format_code,       ~flexible,
    "1",	          "iso",                  "y-MM-dd",          FALSE,
    "2",	          "wday_month_day_year",  "EEEE, MMMM d, y",  FALSE,
    "3",	          "wd_m_day_year",        "EEE, MMM d, y",    FALSE,
    "4",	          "wday_day_month_year",  "EEEE d MMMM y",    FALSE,
    "5",	          "month_day_year",       "MMMM d, y",        FALSE,
    "6",	          "m_day_year",           "MMM d, y",         FALSE,
    "7",	          "day_m_year",           "d MMM y",          FALSE,
    "8",	          "day_month_year",       "d MMMM y",         FALSE,
    "9",	          "day_month",            "d MMMM",           FALSE,
    "10",	          "day_m",                "d MMM",            FALSE,
    "11",	          "year",                 "y",                FALSE,
    "12",	          "month",                "MMMM",             FALSE,
    "13",	          "day",                  "dd",               FALSE,
    "14",	          "year.mn.day",          "y/MM/dd",          FALSE,
    "15",	          "y.mn.day",             "yy/MM/dd",         FALSE,
    "16",           "year_week",            "y-'W'ww",          FALSE,
    "17",           "year_quarter",         "y-'Q'Q",           FALSE,
    "18",           "yMd",                  NA_character_,      TRUE,
    "19",           "yMEd",                 NA_character_,      TRUE,
    "20",           "yMMM",                 NA_character_,      TRUE,
    "21",           "yMMMM",                NA_character_,      TRUE,
    "22",           "yMMMd",                NA_character_,      TRUE,
    "23",           "yMMMEd",               NA_character_,      TRUE,
    "24",           "GyMd",                 NA_character_,      TRUE,
    "25",           "GyMMMd",               NA_character_,      TRUE,
    "26",           "GyMMMEd",              NA_character_,      TRUE,
    "27",           "yM",                   NA_character_,      TRUE,
    "28",           "Md",                   NA_character_,      TRUE,
    "29",           "MEd",                  NA_character_,      TRUE,
    "30",           "MMMd",                 NA_character_,      TRUE,
    "31",           "MMMEd",                NA_character_,      TRUE,
    "32",           "MMMMd",                NA_character_,      TRUE,
    "33",           "GyMMM",                NA_character_,      TRUE,
    "34",           "yQQQ",                 NA_character_,      TRUE,
    "35",           "yQQQQ",                NA_character_,      TRUE,
    "36",           "Gy",                   NA_character_,      TRUE,
    "37",           "y",                    NA_character_,      TRUE,
    "38",           "M",                    NA_character_,      TRUE,
    "39",           "MMM",                  NA_character_,      TRUE,
    "40",           "d",                    NA_character_,      TRUE,
    "41",           "Ed",                   NA_character_,      TRUE
  )
}

#' Get a tibble containing time formats
#'
#' @noRd
time_formats <- function() {
  dplyr::tribble(
    ~format_number,  ~format_name,  ~format_code,    ~time_type,    ~flexible,
    "1",	           "iso",         "HH:mm:ss",      "24h",         FALSE,
    "2",	           "iso-short",   "HH:mm",         "24h",         FALSE,
    "3",	           "h_m_s_p",     "h:mm:ss a",     "12h",         FALSE,
    "4",	           "h_m_p",       "h:mm a",        "12h",         FALSE,
    "5",	           "h_p",         "h a",           "12h",         FALSE,
    "6",             "Hms",         NA_character_,   "24h",         TRUE,
    "7",             "Hm",          NA_character_,   "24h",         TRUE,
    "8",             "H",           NA_character_,   "24h",         TRUE,
    "9",             "EHm",         NA_character_,   "24h",         TRUE,
    "10",            "EHms",        NA_character_,   "24h",         TRUE,
    "11",            "Hmsv",        NA_character_,   "24h",         TRUE,
    "12",            "Hmv",         NA_character_,   "24h",         TRUE,
    "13",            "hms",         NA_character_,   "12h",         TRUE,
    "14",            "hm",          NA_character_,   "12h",         TRUE,
    "15",            "h",           NA_character_,   "12h",         TRUE,
    "16",            "Ehm",         NA_character_,   "12h",         TRUE,
    "17",            "Ehms",        NA_character_,   "12h",         TRUE,
    "18",            "EBhms",       NA_character_,   "12h",         TRUE,
    "19",            "Bhms",        NA_character_,   "12h",         TRUE,
    "20",            "EBhm",        NA_character_,   "12h",         TRUE,
    "21",            "Bhm",         NA_character_,   "12h",         TRUE,
    "22",            "Bh",          NA_character_,   "12h",         TRUE,
    "23",            "hmsv",        NA_character_,   "12h",         TRUE,
    "24",            "hmv",         NA_character_,   "12h",         TRUE,
    "25",            "ms",          NA_character_,   NA_character_, TRUE
  )
}

#' Transform a `date_style` to a `date_format`
#'
#' @noRd
get_date_format <- function(date_style) {

  date_format_tbl <- date_formats()
  date_format_num_range <- seq_len(nrow((date_format_tbl)))

  # In the rare instance that `date_style` consists of a character-based
  # number in the valid range of numbers, cast the value as a number
  if (
    is.character(date_style) &&
    date_style %in% as.character(date_format_num_range)
  ) {
    date_style <- as.numeric(date_style)
  }

  # Stop function if a numeric `date_style` value is invalid
  if (is.numeric(date_style)) {

    if (!(date_style %in% date_format_num_range)) {

      cli::cli_abort(c(
        "If using a numeric value for a `date_style`, it must be ",
        "between `1` and `{nrow(date_format_tbl)}`.",
        "*" = "Use `info_date_style()` for a useful visual reference."
      ))
    }
  }

  # Stop function if a character-based `date_style` value is invalid
  if (is.character(date_style)) {

    if (!(date_style %in% date_format_tbl$format_name)) {
      cli::cli_abort(c(
        "If using a `date_style` name, it must be in the valid set.",
        "*" = "Use `info_date_style()` for a useful visual reference."
      ))
    }

    # Normalize `date_style` to be a numeric index value
    date_style <- which(date_format_tbl$format_name == date_style)
  }

  # Obtain the correct date format directive
  date_format_tbl_i <- date_format_tbl[date_style, ]

  if (date_format_tbl_i[["flexible"]]) {
    return(bigD::flex_d_lst[[date_format_tbl_i[["format_name"]]]])
  } else {
    return(date_format_tbl_i[["format_code"]])
  }
}

#' Transform a `time_style` to a `time_format`
#'
#' @noRd
get_time_format <- function(time_style) {

  time_format_tbl <- time_formats()
  time_format_num_range <- seq_len(nrow((time_format_tbl)))

  # In the rare instance that `time_style` consists of a character-based
  # number in the valid range of numbers, cast the value as a number
  if (
    is.character(time_style) &&
    time_style %in% as.character(time_format_num_range)
  ) {
    time_style <- as.numeric(time_style)
  }

  # Stop function if a numeric `time_style` value is invalid
  if (is.numeric(time_style)) {

    if (!(time_style %in% time_format_num_range)) {
      cli::cli_abort(c(
        "If using a numeric value for a `time_style`, it must be
        between `1` and `{nrow((time_format_tbl))}`.",
        "*" = "Use `info_time_style()` for a useful visual reference."
      ))
    }
  }

  # Stop function if a character-based `time_style` value is invalid
  if (is.character(time_style)) {

    if (!(time_style %in% time_format_tbl$format_name)) {
      cli::cli_abort(c(
        "If using a `time_style` name, it must be in the valid set.",
        "*" = "Use `info_time_style()` for a useful visual reference."
      ))
    }

    # Normalize `time_style` to be a numeric index value
    time_style <- which(time_format_tbl$format_name == time_style)
  }

  # Obtain the correct time format directive
  time_format_tbl_i <- time_format_tbl[time_style, ]

  if (time_format_tbl_i[["flexible"]]) {

    if (
      !is.na(time_format_tbl_i[["time_type"]]) &&
      time_format_tbl_i[["time_type"]] == "12h"
    ) {
      return(bigD::flex_t12_lst[[time_format_tbl_i[["format_name"]]]])
    } else {
      return(bigD::flex_t24_lst[[time_format_tbl_i[["format_name"]]]])
    }

  } else {
    return(time_format_tbl_i[["format_code"]])
  }
}

#' Are string values 24 hour times?
#'
#' Determine whether string values are representative of ISO 8601 time parts
#' (in 24 hour time). Valid strings can be in the following formats: `hh::mm`,
#' `hh::mm:ss`, and `hh::mm:ss.sss`.
#'
#' @noRd
is_string_time <- function(x) {

  is.character(x) & grepl("^\\d{1,2}:\\d{2}(:\\d{2}(\\.\\d+)?)?$", x)
}

check_format_code <- function(format) {

  if (!is.character(format) || length(format) != 1) {
    cli::cli_abort(
      "The `format` code must be a character string of length 1."
    )
  }
}

#' Transform a `currency` code to a currency string
#'
#' @noRd
get_currency_str <- function(
    currency,
    fallback_to_code = FALSE
) {

  # Create bindings for specific variables
  curr_symbol <- symbol <- curr_code <- curr_number <- NULL

  if (currency[1] %in% currency_symbols$curr_symbol) {

    return(dplyr::filter(currency_symbols, curr_symbol == currency)$symbol)

  } else if (currency[1] %in% currencies$curr_code) {

    currency_symbol <- dplyr::filter(currencies, curr_code == currency)$symbol

    if (fallback_to_code && grepl("&#", currency_symbol)) {
      currency_symbol <- dplyr::filter(currencies, curr_code == currency)$curr_code
    }

    return(currency_symbol)

  } else if (currency[1] %in% currencies$curr_number) {

    currency_symbol <- dplyr::filter(currencies, curr_number == currency)$symbol

    if (fallback_to_code && grepl("&#", currency_symbol)) {
      currency_symbol <- dplyr::filter(currencies, curr_number == currency)$curr_code
    }

    return(currency_symbol)

  } else {
    return(currency)
  }
}

resolve_footnote_placement <- function(
    data,
    colname,
    rownum,
    input_placement,
    cell_content,
    context
) {

  if (input_placement %in% c("left", "right")) {
    return(input_placement)
  }

  cell_alignment <-
    get_alignment_at_body_cell(
      data = data,
      colname = colname,
      rownum = rownum,
      context = context
    )

  if (cell_alignment == "right") {
    return("left")
  } else {
    return("right")
  }
}

get_alignment_at_body_cell <- function(
    data,
    colname,
    rownum,
    context
) {

  column_alignment <-
    dt_boxhead_get_alignment_by_var(
      data = data,
      var = colname
    )

  if (context != "html") {
    return(column_alignment)
  }

  stub_layout <- get_stub_layout(data = data)

  if (colname %in% stub_layout) {
    column_alignment <- "right"
  }

  # Get cell alignment set by `tab_style`
  styles_tbl <- dt_styles_get(data = data)

  if (nrow(styles_tbl) < 1) {
    return(column_alignment)
  }

  #
  # Check HTML styles to determine whether column alignment is
  # set there (this has higher specificity)
  #

  styles_filtered_tbl <-
    dplyr::filter(
      styles_tbl,
      locname == "data" & colname == .env$colname & rownum == .env$rownum
    )

  if (nrow(styles_tbl) < 1) {
    return(column_alignment)
  }

  # Extract the list of styles from the table
  cell_styles_list <- styles_filtered_tbl$styles

  if (length(cell_styles_list) < 1) {
    return(column_alignment)
  }

  # Get the `align` property in `cell_styles_list` (element may not be present)
  cell_text_align <- cell_styles_list[[1]]$cell_text$align

  # Get the `cell_style` property in `cell_styles_list` (may not be present)
  # This is a user-defined string with CSS style rules that should look
  # something like this: "text-align: right; background: green;"
  cell_style <- cell_styles_list[[1]]$cell_style

  # Return the value of the last `text-align` property, if present
  if (!is.null(cell_style) && grepl("text-align", cell_style)) {

    m <- regexec_gt("(?:^|;)\\s*text-align\\s*:\\s*([\\w-]+)\\s*(!important)?", cell_style, perl = TRUE)

    cell_style_match_mat <- regmatches(cell_style, m)[[1]]

    is_important <- grepl("!important", cell_style_match_mat[1, ], fixed = TRUE)

    # Pick last '!important', or if no '!important', then last anything
    if (any(is_important)) {
      cell_alignment <- cell_style_match_mat[2, max(which(is_important))]
    } else {
      cell_alignment <- cell_style_match_mat[2, ncol(cell_style_match_mat)]
    }

    return(cell_alignment)
  }

  # Return the value of the `cell_text$align` property, if present
  if (!is.null(cell_text_align)) {
    return(cell_text_align)
  }

  column_alignment
}

#' Get a currency exponent from a currency code
#'
#' @noRd
get_currency_exponent <- function(currency) {

  # Create bindings for specific variables
  curr_code <- curr_number <- NULL

  if (currency[1] %in% currencies$curr_code) {

    exponent <- dplyr::filter(currencies, curr_code == currency)$exponent

  } else if (currency[1] %in% currencies$curr_number) {

    exponent <- dplyr::filter(currencies, curr_number == currency)$exponent
  }

  if (is.na(exponent)) {
    return(0L)
  } else {
    return(as.integer(exponent))
  }
}

get_markdown_engine_fn <- function(
    md_engine_pref,
    context = c("html", "latex")
) {

  context <- match.arg(context)

  md_engine_fn <-
    switch(
      md_engine_pref,
      markdown = markdown::mark,
      commonmark = if (context == "html") {
        commonmark::markdown_html
      } else {
        commonmark::markdown_latex
      }
    )

  md_engine_fn <- c(md_engine_fn)
  names(md_engine_fn) <- md_engine_pref
  md_engine_fn
}

#' Process text based on rendering context any applied classes
#'
#' If the incoming text has the class `from_markdown` (applied by the `md()`
#' helper function), then the text will be sanitized and transformed to HTML
#' from Markdown. If the incoming text has the class `html` (applied by `html()`
#' helper function), then the text will be seen as HTML and it won't undergo
#' sanitization.
#' @noRd
process_text <- function(text, context = "html") {

  # When processing text globally (outside of the `fmt_markdown()`
  # function) we will use the 'markdown' package if it is available,
  # otherwise the 'commonmark' package
  if (utils::packageVersion("markdown") >= "1.5") {
    md_engine <- "markdown"
  } else {
    md_engine <- "commonmark"
  }

  # If text is marked `AsIs` (by using `I()`) then just
  # return the text unchanged
  if (inherits(text, "AsIs")) {
    return(text)
  }

  if (is.list(text)) {
    if (context %in% names(text)) {
     return(process_text(text = text[[context]], context = context))
    }
  }

  if (context == "html") {

    # Text processing for HTML output

    if (inherits(text, "from_markdown")) {

      md_engine_fn <-
        get_markdown_engine_fn(
          md_engine_pref = md_engine,
          context = "html"
        )

      text <-
        vapply(
          as.character(text),
          FUN.VALUE = character(1),
          USE.NAMES = FALSE,
          FUN = function(x) {
            md_engine_fn[[1]](text = x)
          }
        )

      text <- gsub("^<p>|</p>\n$", "", text)

      return(text)

    } else if (
      is_html(text) ||
      inherits(text, "shiny.tag") ||
      inherits(text, "shiny.tag.list")
    ) {

      text <- as.character(text)

      return(text)

    } else {

      text <- htmltools::htmlEscape(as.character(text))

      return(text)
    }

  } else if (context == "latex") {

    # Text processing for LaTeX output

    if (inherits(text, "from_markdown")) {

      text <- markdown_to_latex(text = text, md_engine = md_engine)

      return(text)

    } else if (is_html(text)) {

      text <- as.character(text)

      return(text)

    } else {

      text <- escape_latex(text = text)

      return(text)
    }
  } else if (context == "rtf") {

    # Text processing for RTF output

    if (inherits(text, "from_markdown")) {

      return(markdown_to_rtf(text))

    } else if (inherits(text, "rtf_text")) {

      text <- as.character(text)

      return(text)

    } else {

      text <- escape_rtf(text)

      return(text)
    }

  } else if (context == "word") {

    # Text processing for Word output

    if (inherits(text, "from_markdown")) {

      text <- markdown_to_xml(text)
    }else{
      text <- as.character(text)
    }

    return(text)

  } else {

    # Text processing in the default case

    if (inherits(text, "from_markdown")) {

      text <- markdown_to_text(text = text)

      return(text)

    } else if (is_html(text)) {

      text <- as.character(text)

      return(text)

    } else {

      text <- htmltools::htmlEscape(as.character(text))

      return(text)
    }
  }
}

#' Reverse HTML escaping
#'
#' Find common HTML entities resulting from HTML escaping and restore them back
#' to ASCII characters.
#' @noRd
unescape_html <- function(text) {

  text <- tidy_gsub(text, "&lt;", "<")
  text <- tidy_gsub(text, "&gt;", ">")
  text <- tidy_gsub(text, "&amp;", "&")
  text
}

#' Transform Markdown text to HTML and also perform HTML escaping
#'
#' @noRd
md_to_html <- function(x, md_engine) {

  md_engine_fn <-
    get_markdown_engine_fn(
      md_engine_pref = md_engine,
      context = "html"
    )

  if (!check_quarto()) {

    non_na_x <-
      vapply(
        as.character(x[!is.na(x)]),
        FUN.VALUE = character(1),
        USE.NAMES = FALSE,
        FUN = function(x) {
          md_engine_fn[[1]](text = x)
        }
      )

    non_na_x <- tidy_gsub(non_na_x, "^", "<div class='gt_from_md'>")
    non_na_x <- tidy_gsub(non_na_x, "$", "</div>")

  } else {

    #nocov start

    non_na_x <- x[!is.na(x)]

    non_na_x <- tidy_gsub(non_na_x, "^", "<span data-qmd=\"")
    non_na_x <- tidy_gsub(non_na_x, "$", "\"></span>")

    #nocov end
  }

  x[!is.na(x)] <- non_na_x
  x
}

#' Transform Markdown text to LaTeX
#'
#' In addition to the Markdown-to-LaTeX text transformation,
#' `markdown_to_latex()` also escapes ASCII characters with special meaning in
#' LaTeX.
#' @noRd
markdown_to_latex <- function(text, md_engine) {

  md_engine_fn <-
    get_markdown_engine_fn(
      md_engine_pref = md_engine,
      context = "latex"
    )

  # Vectorize `commonmark::markdown_latex` and modify output
  # behavior to pass through NAs
  unname(
    unlist(
      lapply(
        text,
        FUN = function(x) {

          if (is.na(x)) {
            return(NA_character_)
          }

          if (isTRUE(getOption("gt.html_tag_check", TRUE))) {

            if (grepl("<[a-zA-Z\\/][^>]*>", x)) {
              cli::cli_warn(c(
                "HTML tags found, and they will be removed.",
                "*" = "Set `options(gt.html_tag_check = FALSE)` to disable this check."
              ))
            }
          }

          if (names(md_engine_fn) == "commonmark") {
            tidy_gsub(md_engine_fn[[1]](text = x), "\\n$", "")
          } else {
            tidy_gsub(md_engine_fn[[1]](text = x, format = "latex"), "\\n$", "")
          }
        }
      )
    )
  )
}

#' Transform Markdown text to ooxml
#'
#' @noRd
#'
#' @importFrom xml2 read_xml xml_name xml_children xml_type xml_contents
markdown_to_xml <- function(text) {

  text %>%
    as.character() %>%
    vapply(
      FUN.VALUE = character(1),
      USE.NAMES = FALSE,
      FUN = commonmark::markdown_xml
    ) %>%
    vapply(
      FUN.VALUE = character(1),
      USE.NAMES = FALSE,
      FUN = function(cmark) {

        x <- xml2::read_xml(cmark)

        if (!identical(xml2::xml_name(x), "document")) {
          stop("Unexpected result from markdown parsing: `document` element not found")
        }

        children <- xml2::xml_children(x)

        apply_rules <- function(x, ...) {

          if (inherits(x, "xml_nodeset")) {

            results <- lapply( x, apply_rules)
            do.call( 'paste0',c(results,collapse = "\n"))

          } else {

            output <- if (xml2::xml_type(x) == "element") {

              rule <- cmark_rules_xml[[xml2::xml_name(x)]]

              if (is.null(rule)) {

                rlang::warn(
                  paste0("Unknown commonmark element encountered: ", xml2::xml_name(x)),
                  .frequency = "once",
                  .frequency_id = "gt_commonmark_unknown_element"
                )

                apply_rules(xml2::xml_children(x))

              } else if (is.function(rule)) {

                rule(x, apply_rules, ...)

              }
            }

          paste0(output, collapse = "")
         }
        }

        lapply(children, apply_rules) %>%
          vapply(FUN = as.character,
                 FUN.VALUE = character(1)) %>%
          paste0(collapse = "") %>%
          paste0("<md_container>", ., "</md_container>")
      }
    )

}


cmark_rules_xml <- list(

  ## default ordering
  text = function(x, process, ...) {
    xml_r(xml_rPr(),
          xml_t(
            enc2utf8(as.character(htmltools::htmlEscape(xml2::xml_text(x)))),
            xml_space = "preserve")
    ) %>% as.character()
  },
  paragraph = function(x, process, ...) {
    runs <- lapply(xml2::xml_children(x), process)
    xml_p(
      xml_pPr(),
      paste0(
        vapply(
          runs, FUN = paste, FUN.VALUE = character(1)
        ),
        collapse = ""
      )
    ) %>% as.character()
  },
  ## basic styling
  strong = function(x, process, ...) {
    x <- process(xml2::xml_children(x))
    add_text_style(x, style = xml_b())
  },
  emph = function(x, process, ...) {
    x <- process(xml2::xml_children(x))
    add_text_style(x, style = xml_i())
  },

  ## Complex styling
  heading = function(x, process, ...) {
    heading_sizes <- c(36, 32, 28, 24, 20, 16)
    fs <- heading_sizes[as.numeric(xml2::xml_attr(x, attr = "level"))]
    x <- process(xml2::xml_children(x))
    add_text_style(x, style = xml_sz(val = fs)) %>%
      xml_p(xml_pPr(),.) %>%
      as.character()
  },
  thematic_break = function(x, process, ...) {
    xml_p(
      xml_pPr(
        xml_keepNext(),
        xml_pBdr(
          xml_border(dir = "bottom", type = "single", size = 6, space = 1, color = "auto")
        ),
        xml_spacing(after = 60)
      )
    ) %>% as.character()
  },
  list = function(x, process, ..., indent_level = 0, type = "bullet") {

    type <- xml2::xml_attr(x, attr = "type")
    children <- xml2::xml_children(x)

    # NOTE: `start`, `delim`, and `tight` attrs are ignored; we also
    # assume there is only `type` values of "ordered" and "bullet" (unordered)

    paste(
        lapply(
          seq_along(children),
          FUN = function(child_idx) {

            child <- children[[child_idx]]

            li_content <- process(child, indent_level = indent_level + 1, type = type) %>%
              as_xml_node(create_ns = TRUE)

            ## get first pPr tag
            paragraph_style <- li_content %>% xml_find_first(".//w:pPr") %>% .[[1]]

            ## check
            list_style_format <- xml_pStyle(val = "ListParagraph") %>%
              as_xml_node() %>%
              .[[1]]

            paragraph_style %>%
              xml_add_child(
                list_style_format
              )

            list_bullet_style <- xml_numPr(
              xml_ilvl(val = indent_level)#,
              # ifelse(type == "ordered", xml_numId(val = 2), xml_numId(val = 1))
            ) %>%
              as_xml_node() %>%
              .[[1]]

            paragraph_style %>%
              xml_add_child(
                list_bullet_style
              )


            list_symbol <- ifelse(type == "bullet", "-", paste0( child_idx, "."))

              bullet_insert <- xml_r(
                  xml_t(xml_space = "preserve", paste(c(rep("\t", times = indent_level),list_symbol,"\t"), collapse = ""))
                ) %>%
                as_xml_node() %>%
                .[[1]]

              ## must be nodes not nodesets
              paragraph_style %>%
                xml_add_sibling(
                  bullet_insert,
                  .where = "after"
              )

            paste0(li_content, collapse = "")

          }
        ),
        collapse = ""
    )
  },
  item = function(x, process, ...) {

    item_contents <- lapply(
        xml2::xml_children(x),
        process,
        ...
      )

    unlist(item_contents)

  },

  ## code sections
  code = function(x, process, ...) {
    xml_r(xml_rPr(xml_rStyle(val = "Macro Text")),
          xml_t(xml2::xml_text(x), xml_space = "preserve")) %>%
      as.character()

  },
  code_block = function(x, process, ...) {
    ##split text up by new line
    text <- strsplit(xml2::xml_text(x),split = "\n")[[1]]
    code_text <- lapply(text, function(line){
      xml_t(line, xml_space = "preserve")
    })
    xml_p(xml_pPr(xml_pStyle(val = "Macro Text")),
          xml_r(xml_rPr(),
                paste0(
                  vapply(code_text,
                         FUN = paste,
                         FUN.VALUE = character(1)),
                  collapse = "<w:br/>"
                ))) %>%
      as.character()
  },

  ## line breaks
  softbreak = function(x, process, ...) {
    xml_br(clear = "right")
  },
  linebreak = function(x, process, ...) {
    xml_br()
  },

  html_inline = function(x, process, ...) {

    tag <- xml2::xml_text(x)

    match <- str_get_match(tag, pattern = "^<(/?)([a-zA-Z0-9\\-]+)")

    if (!is.na(match[1, 1])) {

      span_map <-
        c(
          sup = "super",
          sub = "sub",
          strong = "b",
          b = "b",
          em = "i",
          i = "i",
          code = "f1"
        )

      key_map <- c(br = "line")

      is_closing <- match[1, 2] == "/"
      tag_name <- match[1, 3]

      if (!is_closing) {

        if (tag_name %in% names(key_map)) {

          return(rtf_key(key_map[tag_name], space = TRUE))

        } else if (tag_name %in% names(span_map)) {

          return(
            rtf_paste0(
              rtf_raw("{"),
              rtf_key(span_map[tag_name], space = TRUE)
            )
          )
        }

      } else {

        if (tag_name %in% names(span_map)) {
          return(rtf_raw("}"))
        }
      }
    }

    # Any unrecognized HTML tags are stripped, returning nothing
    return(rtf_raw(""))
  },

  html_block = function(x, process, ...){
    xml_p(
      xml_pPr(),
      xml_r(xml_rPr(),
            xml_t(
              enc2utf8(as.character(xml2::xml_text(x))),
              xml_space = "preserve")
      )
    ) %>%
      as.character()
  },

  link = function(x, process, ...) {
    # NOTE: Links are difficult to insert in OOXML documents because
    # a relationship must be provided in the 'document.xml.rels' file
    xml_hyperlink(
      url = xml_attr(x, "destination"),
      xml_r(xml_rPr(xml_rStyle(val = "Hyperlink")), xml_t(xml2::xml_text(x)))
    ) %>% as.character()
  },

  block_quote = function(x, process, ...) {
    # TODO: Implement
    process(xml2::xml_children(x))
  }
)

cmark_rules_rtf <- list(

  heading = function(x, process) {

    heading_sizes <- c(36, 32, 28, 24, 20, 16)
    fs <- heading_sizes[as.numeric(xml2::xml_attr(x, attr = "level"))]

    rtf_paste0(
      rtf_raw("{\\ql \\f0 \\sa180 \\b \\fs"),
      rtf_raw(fs),
      rtf_raw(" "),
      process(xml2::xml_children(x)),
      rtf_raw("}")
    )
  },
  thematic_break = function(x, process) {
    rtf_raw("{\\qc \\f0 \\sa180 \\emdash\\emdash\\emdash\\emdash\\emdash}")
  },
  link = function(x, process) {
    # NOTE: RTF doesn't handle the `title` attr (Pandoc also ignores)
    destination <- xml2::xml_attr(x, attr = "destination")
    text <- process(xml2::xml_children(x))
    if (text == "") text <- destination
    rtf_raw("{\\field{\\*\\fldinst{HYPERLINK \"", destination, "\"}}{\\fldrslt{\\ul ", text, "}}}")
  },
  list = function(x, process) {

    type <- xml2::xml_attr(x, attr = "type")
    n_items <- length(xml2::xml_children(x))

    # NOTE: `start`, `delim`, and `tight` attrs are ignored; we also
    # assume there is only `type` values of "ordered" and "bullet" (unordered)
    rtf_raw(
      paste(
        "\\pard\\intbl\\itap1\\li300\\fi-300",
        paste(
          vapply(
            seq_len(n_items),
            FUN.VALUE = character(1),
            USE.NAMES = FALSE,
            FUN = function(n) {

              paste0(
                ifelse(n == 1, "\\ls1\\ilvl0\\cf0 \n", ""),
                "{\\listtext\t}",
                ifelse(type == "bullet", "\\u8226  ", ""),
                process(xml2::xml_children(x)[n]),
                "\\",
                "\n"
              )
            }
          ),
          collapse = ""
        ),
        collapse = ""
      )
    )
  },
  item = function(x, process) {
    # TODO: probably needs something like process_children()
    escape_rtf(xml2::xml_text(x))
  },
  code_block = function(x, process) {
    rtf_paste0(rtf_raw("{\\f1 "), xml2::xml_text(x), rtf_raw("}"))
  },
  html_inline = function(x, process) {

    tag <- xml2::xml_text(x)

    match <- str_get_match(tag, pattern = "^<(/?)([a-zA-Z0-9\\-]+)")

    if (!is.na(match[1, 1])) {

      span_map <-
        c(
          sup = "super",
          sub = "sub",
          strong = "b",
          b = "b",
          em = "i",
          i = "i",
          code = "f1"
        )

      key_map <- c(br = "line")

      is_closing <- match[1, 2] == "/"
      tag_name <- match[1, 3]

      if (!is_closing) {

        if (tag_name %in% names(key_map)) {

          return(rtf_key(key_map[tag_name], space = TRUE))

        } else if (tag_name %in% names(span_map)) {

          return(
            rtf_paste0(
              rtf_raw("{"),
              rtf_key(span_map[tag_name], space = TRUE)
            )
          )
        }

      } else {

        if (tag_name %in% names(span_map)) {
          return(rtf_raw("}"))
        }
      }
    }

    # Any unrecognized HTML tags are stripped, returning nothing
    return(rtf_raw(""))
  },
  softbreak = function(x, process) {
    rtf_raw("\n ")
  },
  linebreak = function(x, process) {
    rtf_raw("\\line ")
  },
  block_quote = function(x, process) {
    # TODO: Implement
    process(xml2::xml_children(x))
  },
  code = function(x, process) {
    rtf_paste0(rtf_raw("{\\f1 "), xml2::xml_text(x), rtf_raw("}"))
  },
  strong = function(x, process) {
    rtf_raw("{\\b ", process(xml2::xml_children(x)), rtf_raw("}"))
  },
  emph = function(x, process) {
    rtf_raw("{\\i ", process(xml2::xml_children(x)), rtf_raw("}"))
  },
  text = function(x, process) {
    escape_rtf(xml2::xml_text(x))
  },
  paragraph = function(x, process) {

    rtf_paste0(
      rtf_raw("{"),
      process(xml2::xml_children(x)),
      #if (!is_last(x)) rtf_raw("\\par"),
      rtf_raw("}")
    )
  }
)

#nocov start

is_last <- function(x) {
  children <- xml2::xml_children(xml2::xml_parent(x))
  last <- children[[xml2::xml_length(xml2::xml_parent(x))]]
  identical(last, x)
}

#nocov end

markdown_to_rtf <- function(text) {

  text <-
    vapply(
      as.character(text),
      FUN.VALUE = character(1),
      USE.NAMES = FALSE,
      FUN = commonmark::markdown_xml
    )

  text <-
    vapply(
      text,
      FUN.VALUE = character(1),
      USE.NAMES = FALSE,
      FUN = function(cmark) {

        x <- xml2::read_xml(cmark)

        if (!identical(xml2::xml_name(x), "document")) {
          cli::cli_abort(c(
            "Unexpected result from markdown parsing.",
            "*" = "`document` element not found."
          ))
        }

        children <- xml2::xml_children(x)

        if (
          length(children) == 1 &&
          xml2::xml_type(children[[1]]) == "element" &&
          xml2::xml_name(children[[1]]) == "paragraph"
        ) {
          children <- xml2::xml_children(children[[1]])
        }

        apply_rules <- function(x) {

          if (inherits(x, "xml_nodeset")) {

            len <- length(x)
            results <- character(len)

            for (i in seq_len(len)) {
              results[[i]] <- apply_rules(x[[i]])
            }

            # TODO: Is `collapse = ""` correct here?
            rtf_raw(paste0("", results, collapse = ""))

          } else {

            output <- if (xml2::xml_type(x) == "element") {

              rule <- cmark_rules_rtf[[xml2::xml_name(x)]]

              if (is.null(rule)) {

                #nocov start

                rlang::warn(
                  paste0("Unknown commonmark element encountered: ", xml2::xml_name(x)),
                  .frequency = "once",
                  .frequency_id = "gt_commonmark_unknown_element"
                )

                #nocov end

                apply_rules(xml2::xml_contents(x))

              } else if (is.character(rule)) {

                rtf_wrap(rule, x, apply_rules)

              } else if (is.function(rule)) {

                rule(x, apply_rules)
              }
            }

            if (!is_rtf(output)) {
              cli::cli_warn("Rule for {xml2::xml_name(x)} did not return RTF.")
            }

            # TODO: Is `collapse = ""` correct here?
            rtf_raw(paste0("", output, collapse = ""))
          }
        }

        apply_rules(children)
      }
    )

  text
}

#nocov start

rtf_wrap <- function(control, x, process) {
  content <- paste0("", process(xml2::xml_contents(x))) # coerce even NULL to string
  paste0("\\", control, " ", content, "\\", control, "0 ")
}

#' Transform Markdown text to plain text
#'
#' @noRd
markdown_to_text <- function(text) {

  # Vectorize `commonmark::markdown_text` and modify output
  # behavior to pass through NAs
  unname(
    unlist(
      lapply(
        text,
        FUN = function(x) {

          if (is.na(x)) {
            return(NA_character_)
          }

          if (isTRUE(getOption("gt.html_tag_check", TRUE))) {

            if (grepl("<[a-zA-Z\\/][^>]*>", x)) {

              cli::cli_warn(c(
                "HTML tags found, and they will be removed.",
                "*" = "Set `options(gt.html_tag_check = FALSE)` to disable this check."
              ))
            }

          }

          tidy_gsub(commonmark::markdown_text(x), "\\n$", "")
        }
      )
    )
  )
}

#nocov end

#' Handle formatting of a pattern in a `fmt_*()` function
#'
#' Within the context of a `fmt_*()`` function, we always have the single-length
#' character vector of `pattern` available to describe a final decoration of the
#' formatted values. We use glue's semantics here and reserve `x` to be the
#' formatted values, and, we can use `x` multiple times in the pattern.
#' @param values The values (as a character vector) that are formatted within
#'   the `fmt_*()` function.
#' @param pattern A formatting pattern that allows for decoration of the
#'   formatted value (defined here as `x`).
#' @noRd
apply_pattern_fmt_x <- function(values, pattern) {

  vapply(
    values,
    FUN.VALUE = character(1),
    USE.NAMES = FALSE,
    FUN = function(x) tidy_gsub(x = pattern, "{x}", x, fixed = TRUE)
  )
}

#' Get a vector of indices for large-number suffixing
#'
#' @noRd
non_na_index <- function(
    values,
    index,
    default_value = NA
) {

  stopifnot(is.integer(index) || is.numeric(index))
  stopifnot(all(index >= 1 | is.na(index)))
  stopifnot(all(length(values) >= index | is.na(index)))

  # Get a vector of suffixes, which may include NA values
  res <- values[index]

  # If there are no NA values to reconcile, return
  # the index
  if (!any(is.na(res))) {
    return(index)
  }

  # Create a vector of positions (`seq_along(values)`),
  # but anywhere the `values` vector has an NA, use
  # `-Inf`; (it's important that `values` not have `-Inf`
  # as one of its elements)
  positions <- ifelse(!is.na(values), seq_along(values), -Inf)

  # Use rle (run-length encoding) to collapse multiple
  # instances of `-Inf` into single instances. This
  # makes it easy for us to replace them with their
  # nearest (lower) neighbor in a single step, instead of
  # having to iterate; for some reason, `rle()` doesn't
  # know how to encode NAs, so that's why we use -Inf
  # (seems like a bug)
  encoded <- rle(positions)

  # Replace each -Inf with its closest neighbor; basically,
  # we do this by shifting a copy of the values to the
  # right, and then using the original vector of (run-length
  # encoded) values as a mask over it
  encoded$values <-
    ifelse(
      encoded$values == -Inf,
      c(default_value, utils::head(encoded$values, -1)),
      encoded$values
    )

  # Now convert back from run-length encoded
  positions <- inverse.rle(encoded)

  # positions[index] gives you the new index
  positions[index]
}

#' Get a tibble of scaling values and suffixes
#'
#' The `num_suffix()` function operates on a vector of numerical values and
#' returns a tibble where each row represents a scaled value for `x` and the
#' correct suffix to use during `x`'s character-based formatting.
#' @noRd
num_suffix <- function(
    x,
    suffixes = c("K", "M", "B", "T"),
    base = 1000,
    scale_by
) {

  # If `suffixes` is a zero-length vector, we
  # provide a tibble that will ultimately not
  # scale value or apply any suffixes
  if (length(suffixes) == 0) {

    return(
      dplyr::tibble(
        scale_by = rep_len(scale_by, length(x)),
        suffix = rep_len("", length(x))
      )
    )
  }

  # Obtain a vector of index values that places
  # each value of `x` (either positive or negative)
  # in the correct scale category, according to
  # the base value (defaulting to 1000); this works
  # in tandem with the `suffixes` vector, where each
  # index position (starting from 1) represents the
  # index here
  i <- floor(log(abs(x), base = base))
  i <- pmin(i, length(suffixes))
  i <- pmax(i, 0)

  # Replace any -Inf, Inf, or zero values
  # with NA (required for the `non_na_index()`
  # function)
  i[is.infinite(i) | i == 0] <- NA_integer_

  # Using the `non_na_index()` function on the
  # vector of index values (`i`) is required
  # to enable inheritance of scalars/suffixes
  # to ranges where the user prefers the last
  # suffix given (e.g, [K, M, `NA`, T] -->
  # [K, M, M, T])
  suffix_index <-
    non_na_index(
      values = suffixes,
      index = i,
      default_value = 0
    )

  # Replace any zero values in `suffix_index`
  # with NA values
  suffix_index[suffix_index == 0] <- NA_integer_

  # Get a vector of suffix labels; this vector
  # is to be applied to the scaled values
  suffix_labels <- suffixes[suffix_index]

  # Replace any NAs in `suffix_labels` with an
  # empty string
  suffix_labels[is.na(suffix_labels)] <- ""

  # Replace any NAs in `suffix_index` with zeros
  suffix_index[is.na(suffix_index)] <- 0

  # Create and return a tibble with `scale_by`
  # and `suffix` values
  dplyr::tibble(
    scale_by = 1 / base^suffix_index,
    suffix = suffix_labels
  )
}

#' Get a tibble of scaling values and suffixes for the Indian numbering system
#'
#' The `num_suffix()` function operates on a vector of numerical values and
#' returns a tibble where each row represents a scaled value for `x` and the
#' correct suffix to use during `x`'s character-based formatting.
#' @noRd
num_suffix_ind <- function(
    x,
    suffixes = c(NA, "L", "Cr"),
    scale_by
) {

  # If `suffixes` is a zero-length vector, we
  # provide a tibble that will ultimately not
  # scale value or apply any suffixes
  if (length(suffixes) == 0) {

    return(
      dplyr::tibble(
        scale_by = rep_len(scale_by, length(x)),
        suffix = rep_len("", length(x))
      )
    )
  }

  # Obtain a vector of index values that places
  # each value of `x` (either positive or negative)
  # in the correct scale category, according to
  # the base value; this works in tandem with the
  # `suffixes` vector, where each index position
  # (starting from 1) represents the index here
  exponent <- log(abs(x), base = 10)

  # Transform the `exponent` vector to a vector of
  # indices (each index represents the suffix in the
  # Indian numbering system); replace any `0` values
  # in `i` (represents values less than 1000) with NA
  # (this is required for the `non_na_index()` function)
  i <- pmin(length(suffixes), pmax(0, ceiling(floor(exponent) / 2) - 1))
  i[i == 0] <- NA_integer_

  # Using the `non_na_index()` function on the
  # vector of index values (`i`) is required
  # to enable inheritance of scalars/suffixes
  # to ranges where the user prefers the last
  # suffix given
  suffix_index <-
    non_na_index(
      values = suffixes,
      index = i,
      default_value = 0
    )

  # Replace any zero values in `suffix_index`
  # with NA values
  suffix_index[suffix_index == 0] <- NA_integer_

  # Get a vector of suffix labels; this vector
  # is to be applied to the scaled values
  suffix_labels <- suffixes[suffix_index]

  # Replace any NAs in `suffix_labels` with an
  # empty string
  suffix_labels[is.na(suffix_labels)] <- ""

  # Replace any NAs in `suffix_index` with zeros
  suffix_index[is.na(suffix_index)] <- 0

  # Add a leading space to all non-empty suffix labels
  suffix_labels[suffix_labels != ""] <-
    paste0(" ", suffix_labels[suffix_labels != ""])

  # Create and return a tibble with `scale_by`
  # and `suffix` values
  dplyr::tibble(
    scale_by = 10^(-ifelse(suffix_index == 0, 0, (suffix_index * 2) + 1)),
    suffix = suffix_labels
  )
}

#' An `isFALSE`-based helper function
#'
#' The `is_false()` function is similar to the `isFALSE()` function that was
#' introduced in R 3.5.0 except that this implementation works with earlier
#' versions of R.
#' @param x The single value to test for whether it is `FALSE`.
#' @noRd
is_false = function(x) {
  is.logical(x) && length(x) == 1L && !is.na(x) && !x
}

#' Normalize all suffixing input values
#'
#' This function normalizes the `suffixing` input to a character vector which is
#' later appended to scaled numerical values; the input can either be a single
#' logical value or a character vector.
#' @param suffixing,scale_by The `suffixing` and `scale_by` options in some
#'   `fmt_*()` functions.
#' @noRd
normalize_suffixing_inputs <- function(
    suffixing,
    scale_by,
    system
) {

  if (is_false(suffixing)) {

    # If `suffixing` is FALSE, then return `NULL`;
    # this will be used to signal there is nothing
    # to be done in terms of scaling/suffixing
    return(NULL)

  } else if (isTRUE(suffixing)) {

    # Issue a warning if `scale_by` is not 1.0 (the default)
    warn_on_scale_by_input(scale_by)

    # If `suffixing` is TRUE, return the default
    # set of suffixes depending on the `system`
    if (system == "intl") {
      return(c("K", "M", "B", "T"))
    } else {
      return(c(NA, "Lac", "Cr"))
    }

  } else if (is.character(suffixing)) {

    # Issue a warning if `scale_by` is not 1.0 (the default)
    warn_on_scale_by_input(scale_by)

    # In the case that a character vector is provided
    # to `suffixing`, we first want to check if there
    # are any names provided
    if (!is.null(names(suffixing))) {
      cli::cli_abort(
        "The character vector supplied to `suffixed` cannot contain names."
      )
    }

    # We can now return the character vector, having
    # adequately tested for improper cases
    return(suffixing)

  } else {

    # Stop function if the input to `suffixing` isn't
    # valid (i.e., isn't logical and isn't a valid
    # character vector)
    cli::cli_abort(c(
      "The value provided to `suffixing` must either be:",
      "*" = "`TRUE` or `FALSE` (the default), or",
      "*" = "A character vector with suffixing labels."
    ))
  }
}

#' If performing large-number suffixing, warn on `scale_by` != 1
#'
#' @param scale_by The `scale_by` option in some `fmt_*()` functions.
#' @noRd
warn_on_scale_by_input <- function(scale_by) {

  if (scale_by != 1) {
    cli::cli_warn(c(
      "The value for `scale_by` cannot be changed if `suffixing` is
      anything other than `FALSE`.",
      "*" = "The value provided to `scale_by` will be ignored."
    ))
  }
}

#nocov start

#' A `system.file()` replacement specific to this package
#'
#' This is a conveient wrapper for `system.file()` where the `package` refers to
#' this package.
#' @noRd
system_file <- function(file) {
  system.file(file, package = "gt")
}

#nocov end

#' Remove all HTML tags from input text
#'
#' @noRd
remove_html <- function(text) {
  gsub("<.+?>", "", text)
}

any_labeled_columns_in_data_tbl <- function(data) {

  data_tbl <- dt_data_get(data = data)

  any(
    vapply(
      seq_len(ncol(data_tbl)),
      FUN.VALUE = logical(1),
      USE.NAMES = FALSE,
      FUN = function(x) {
        "label" %in% names(attributes(data_tbl[[x]]))
      }
    )
  )
}

get_columns_labels_from_attrs <- function(data) {

  data_tbl <- dt_data_get(data = data)

  # Initialize vector of column labels
  var_labels <- colnames(data_tbl)

  # Overwrite `var_labels` wherever a column contains a `label` attribute value
  for (i in seq_along(var_labels)) {
    if ("label" %in% names(attributes(data_tbl[[i]]))) {
      var_labels[i] <- attr(data_tbl[[i]], which = "label")
    }
  }

  var_labels
}

#' Split any strings that are values in scientific notation
#'
#' @param x_str The input character vector of values formatted in scientific
#'   notation.
#' @noRd
split_scientific_notn <- function(x_str) {

  exp_parts <- strsplit(x_str, "e|E")
  num_part <- vapply(exp_parts, FUN.VALUE = character(1), `[[`, 1)
  exp_part <- as.numeric(vapply(exp_parts, FUN.VALUE = character(1), `[[`, 2))

  list(num = num_part, exp = exp_part)
}

#nocov start

#' Wrapper for `gsub()` where `x` is the first argument
#'
#' This function is wrapper for `gsub()` that uses default argument values and
#' rearranges first three arguments for better pipelining
#' @param x,pattern,replacement,fixed Select arguments from the `gsub()`
#'   function.
#' @noRd
tidy_gsub <- function(x, pattern, replacement, fixed = FALSE) {

  if (!utf8_aware_sub) {

    # See variable definition for utf8_aware_sub for more info
    x <- enc2utf8(as.character(x))
    replacement <- enc2utf8(as.character(replacement))

    res <- gsub(pattern, replacement, x, fixed = fixed)
    Encoding(res) <- "UTF-8"
    res

  } else {
    gsub(pattern, replacement, x, fixed = fixed)
  }
}

tidy_sub <- function(x, pattern, replacement, fixed = FALSE) {

  if (!utf8_aware_sub) {
    # See variable definition for utf8_aware_sub for more info
    x <- enc2utf8(as.character(x))
    replacement <- enc2utf8(as.character(replacement))

    res <- sub(pattern, replacement, x, fixed = fixed)
    Encoding(res) <- "UTF-8"
    res
  } else {
    sub(pattern, replacement, x, fixed = fixed)
  }
}

tidy_grepl <- function(x, pattern) {

  vapply(
    pattern,
    FUN = function(pattern) {
      grepl(pattern = pattern, x = x)
    },
    FUN.VALUE = logical(1),
    USE.NAMES = FALSE
  )
}

#nocov end

#' Create a vector of marks to use for footnotes
#'
#' @noRd
process_footnote_marks <- function(x, marks) {

  if (identical(marks, "numbers")) {
    return(as.character(x))
  }

  if (identical(marks, "LETTERS")) {
    marks <- LETTERS
  } else if (identical(marks, "letters")) {
    marks <- letters
  } else if (identical(marks, "standard")) {
    # (1) Asterisk, (2) Dagger, (3) Double Dagger, (4) Section Sign
    marks <- c("\U0002A", "\U02020", "\U02021", "\U000A7")
  } else if (identical(marks, "extended")) {
    marks <- c(
      # (1) Asterisk, (2) Dagger, (3) Double Dagger, (4) Section Sign
      "\U0002A", "\U02020", "\U02021", "\U000A7",
      # (5) Double Vertical Line, (6) Paragraph Sign
      "\U02016", "\U000B6"
    )
  }

  marks_rep <- floor((x - 1) / length(marks)) + 1

  marks_val <- marks[(x - 1) %% length(marks) + 1]

  unname(
    mapply(
      marks_val, marks_rep,
      FUN = function(val_i, rep_i) {
        paste(rep(val_i, rep_i), collapse = "")}
    )
  )
}

#' Resolve the selection of border elements for a table cell
#'
#' @noRd
resolve_border_side <- function(side) {

  switch(
    side,
    l = "left",
    left = "left",
    r = "right",
    right = "right",
    t = "top",
    top = "top",
    b = "bottom",
    bottom = "bottom",
    a = "all",
    everything = "all",
    all = "all"
  )
}

#' Expand a path using fs::path_expand
#'
#' @noRd
path_expand <- function(file) {
  fs::path_expand(file)
}

# TODO: the `get_file_ext()` function overlaps greatly with `gtsave_file_ext()`;
#       both are not vectorized

#' Get a file's extension
#'
#' @noRd
get_file_ext <- function(file) {
  pos <- regexpr("\\.([[:alnum:]]+)$", file)
  ifelse(pos > -1L, substring(file, pos + 1L), "")
}

validate_marks <- function(marks) {

  if (is.null(marks)) {
    cli::cli_abort("The value for `marks` must not be `NULL`.")
  }
  if (!is.character(marks)) {
    cli::cli_abort("The value for `marks` must be a character vector.")
  }
  if (length(marks) == 0) {
    cli::cli_abort("The length of `marks` must not be zero.")
  }

  marks_keywords <- c("numbers", "letters", "LETTERS", "standard", "extended")

  if (length(marks) == 1 && !any(marks_keywords %in% marks)) {

    #nocov start

    cli::cli_abort(c(
      "The `marks` keyword provided (\"{marks}\") is not valid.",
      "*" = "Either of \"numbers\", \"letters\", \"LETTERS\", \"standard\",
      or \"extended\" can be used."
    ))

    #nocov end
  }
}

validate_style_in <- function(
    style_vals,
    style_names,
    arg_name,
    in_vector,
    with_pattern = NULL
) {

  if (arg_name %in% style_names) {

    arg_value <- style_vals[[arg_name]]

    # There is positive validation if a regex pattern is specified
    # in `with_pattern` and the pattern matches
    if (!is.null(with_pattern) && grepl(with_pattern, arg_value)) {
        return()
    }

    if (!(arg_value %in% in_vector)) {

      cli::cli_abort(c(
        "The provided `{arg_name}` value cannot be `{arg_value}`.",
        "*" = "It can only be either of the following:
        {str_catalog(in_vector, conj = 'or')}."
      ))
    }
  }
}

check_spanner_id_unique <- function(data, spanner_id) {

  existing_column_ids <- dt_boxhead_get_vars(data = data)
  existing_spanner_ids <- dt_spanners_get_ids(data = data)

  all_existing_ids <- c(existing_column_ids, existing_spanner_ids)

  if (spanner_id %in% all_existing_ids) {

    cli::cli_abort(c(
      "The spanner `id` provided (\"{spanner_id}\") is not unique.",
      "*" = "The `id` must be unique across existing spanner and column IDs.",
      "*" = "Provide a unique ID value for this spanner."
    ))
  }
}

check_row_group_id_unique <- function(data, row_group_id) {

  stub_df <- dt_stub_df_get(data = data)

  existing_ids <- stub_df$group_id

  if (row_group_id %in% existing_ids) {

    cli::cli_abort(c(
      "The row group `id` provided (\"{row_group_id}\") is not unique.",
      "*" = "Provide a unique ID value for this row group"
    ))
  }
}

flatten_list <- function(x) {
  unlist(x, recursive = FALSE)
}

#' Prepend a vector
#'
#' @inheritParams append
#' @noRd
prepend_vec <- function(x, values, after = 0) {
  append(x, values, after = after)
}

validate_length_one <- function(x, name) {
  if (length(x) != 1) {
    cli::cli_abort("The value for `{name}` should have a length of one.")
  }
}

validate_table_id <- function(id) {

  if (is.null(id)) {
    return()
  }

  if (length(id) != 1) {
    cli::cli_abort("The length of `id` must be `1`.")
  }
  if (is.na(id)) {
    cli::cli_abort("The value for `id` must not be `NA`.")
  }
  if (!is.character(id)) {
    cli::cli_abort("Any input for `id` must be of the `character` class.")
  }
}

validate_n_sigfig <- function(n_sigfig) {

  if (length(n_sigfig) != 1) {
    cli::cli_abort("The length of `n_sigfig` must be 1.")
  }
  if (is.na(n_sigfig)) {
    cli::cli_abort("The value for `n_sigfig` must not be `NA`.")
  }
  if (!is.numeric(n_sigfig)) {
    cli::cli_abort("Any input for `n_sigfig` must be numeric.")
  }
  if (n_sigfig < 1) {
    cli::cli_abort("The value for `n_sigfig` must be greater than or equal to `1`.")
  }
}

validate_css_lengths <- function(x) {

  # Don't include empty strings in the validation; these lengths
  # should be handled downstream (i.e., using `htmltools::css()`,
  # where empty strings and NULL values don't create rules at all)
  x_units_non_empty <- x[!(x == "")]

  # While this returns a vector of corrected CSS units, we
  # primarily want to verify that the vector of provided values
  # don't contain any invalid suffixes; this throws if that's the
  # case and returns `TRUE` otherwise
  is.character(
    vapply(
      x_units_non_empty,
      FUN = htmltools::validateCssUnit,
      FUN.VALUE = character(1),
      USE.NAMES = FALSE
    )
  )
}

column_classes_are_valid <- function(data, columns, valid_classes) {

  resolved <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data
    )

  table_data <- dt_data_get(data = data)
  table_data <- dplyr::select(table_data, dplyr::all_of(resolved))

  all(
    vapply(
      table_data,
      FUN.VALUE = logical(1),
      USE.NAMES = FALSE,
      FUN = function(x) any(class(x) %in% valid_classes)
    )
  )
}

# print8 <- function(x) {
#   force(x)
#
#   old_ctype <- Sys.getlocale("LC_CTYPE")
#   Sys.setlocale("LC_CTYPE", "en_CA.UTF-8")
#   on.exit(Sys.setlocale("LC_CTYPE", old_ctype), add = TRUE)
#
#   print(x)
# }

get_footnote_spec_by_location <- function(
    data,
    location
) {

  if (location == "ref") {
    spec <- dt_options_get_value(data = data, option = "footnotes_spec_ref")
  } else {
    spec <- dt_options_get_value(data = data, option = "footnotes_spec_ftr")
  }

  spec
}

#nocov start

man_get_image_tag <- function(file, dir = "images") {

  repo_url <- "https://raw.githubusercontent.com/rstudio/gt/master"

  function_name <- paste0(gsub("man_(.*)_[1-9].png", "\\1", file), "()")
  example_code_idx <- gsub("man_.*?([1-9]).png", "\\1", file)

  ordinal_idx <-
    switch(
      example_code_idx,
      `1` = "first",
      `2` = "second",
      `3` = "third",
      `4` = "fourth",
      `5` = "fifth",
      `6` = "sixth",
      `7` = "seventh",
      `8` = "eighth",
      `9` = "ninth",
      "above"
    )

  alt_text <-
    paste0(
      "This image of a table was generated from the ", ordinal_idx,
      " code example in the `", function_name, "` help file."
    )

  image_url <- file.path(repo_url, dir, file)

  paste0(
    "<img ",
    "src=\"", image_url, "\" ",
    "alt=\"", alt_text, "\" ",
    "style=\"width:100\\%;\">"
  )
}

data_get_image_tag <- function(file, dir = "images") {

  repo_url <- "https://raw.githubusercontent.com/rstudio/gt/master"

  alt_text <- "This image of that of a dataset badge."

  image_url <- file.path(repo_url, dir, file)

  paste0(
    "<div style=\"text-align:center;\">",
    "<img ",
    "src=\"", image_url, "\" ",
    "alt=\"", alt_text, "\" ",
    "style=\"width:50\\%;padding-bottom:20px;\">",
    "</div>"
  )
}

#nocov end
