#' Create a tibble containing date formats
#'
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

#' Create a tibble containing time formats
#'
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

#' Transform a `date_style` to a `date_format`
#'
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

#' Transform a `time_style` to a `time_format`
#'
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

#' Transform a `currency` code to a currency string
#'
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
        dplyr::filter(curr_number == currency) %>%
        dplyr::pull(curr_code)
    }

    return(currency_symbol)

  } else {
    return(currency)
  }
}

#' Get a currency exponent from a currency code
#'
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

#' Process text based on rendering context any applied classes
#'
#' If the incoming text has the class `from_markdown` (applied by the `md()`
#' helper function), then the text will be sanitized and transformed to HTML
#' from Markdown. If the incoming text has the class `html` (applied by `html()`
#' helper function), then the text will be seen as HTML and it won't undergo
#' sanitization.
#' @noRd
process_text <- function(text,
                         context = "html") {

  # If text is marked `AsIs` (by using `I()`) then just
  # return the text unchanged
  if (inherits(text, "AsIs")) {
    return(text)
  }

  if (is.list(text)) {
    if (context %in% names(text)) {
     return(process_text(text[[context]], context))
    }
  }

  if (context == "html") {

    # Text processing for HTML output

    if (inherits(text, "from_markdown")) {

      text <-
        text %>%
        as.character() %>%
        vapply(commonmark::markdown_html, character(1)) %>%
        stringr::str_replace_all(c("^<p>" = "", "</p>\n$" = ""))

      return(text)

    } else if (is_html(text)) {

      text <- text %>% as.character()

      return(text)

    } else {

      text <-
        text %>%
        as.character() %>%
        htmltools::htmlEscape()

      return(text)
    }
  } else if (context == "latex") {

    # Text processing for LaTeX output

    if (inherits(text, "from_markdown")) {

      text <- text %>% markdown_to_latex()

      return(text)

    } else if (is_html(text)) {

      text <- text %>% as.character()

      return(text)

    } else {

      text <- text %>% escape_latex()

      return(text)
    }
  } else {

    # Text processing in the default case

    if (inherits(text, "from_markdown")) {

      text <- text %>% markdown_to_text()

      return(text)

    } else if (is_html(text)) {

      text <- text %>% as.character()

      return(text)

    } else {

      text <-
        text %>%
        as.character() %>%
        htmltools::htmlEscape()

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

  text %>%
    tidy_gsub("&lt;", "<") %>%
    tidy_gsub("&gt;", ">") %>%
    tidy_gsub("&amp;", "&")
}

#' Transform Markdown text to HTML and also perform HTML escaping
#'
#' @noRd
md_to_html <- function(x) {

  non_na_x <-
    x[!is.na(x)] %>%
    as.character() %>%
    vapply(commonmark::markdown_html, character(1), USE.NAMES = FALSE) %>%
    tidy_gsub("^", "<div class='gt_from_md'>") %>%
    tidy_gsub("$", "</div>")

  x[!is.na(x)] <- non_na_x
  x
}

#' Transform Markdown text to LaTeX
#'
#' In addition to the Markdown-to-LaTeX text transformation,
#' `markdown_to_latex()` also escapes ASCII characters with special meaning in
#' LaTeX.
#' @noRd
markdown_to_latex <- function(text) {

  # Vectorize `commonmark::markdown_latex` and modify output
  # behavior to passthrough NAs
  lapply(text, function(x) {

    if (is.na(x)) {
      return(NA_character_)
    }

    if (isTRUE(getOption("gt.html_tag_check", TRUE))) {

      if (grepl("<[a-zA-Z\\/][^>]*>", x)) {
        warning("HTML tags found, and they will be removed.\n",
                " * set `options(gt.html_tag_check = FALSE)` to disable this check",
                call. = FALSE)
      }
    }

    commonmark::markdown_latex(x) %>% tidy_gsub("\\n$", "")
  }) %>%
    unlist() %>%
    unname()
}

#' Transform Markdown text to plain text
#'
#' @noRd
markdown_to_text <- function(text) {

  # Vectorize `commonmark::markdown_text` and modify output
  # behavior to passthrough NAs
  lapply(text, function(x) {

    if (is.na(x)) {
      return(NA_character_)
    }

    if (isTRUE(getOption("gt.html_tag_check", TRUE))) {

      if (grepl("<[a-zA-Z\\/][^>]*>", x)) {
        warning("HTML tags found, and they will be removed.\n",
                " * set `options(gt.html_tag_check = FALSE)` to disable this check",
                call. = FALSE)
      }
    }

    commonmark::markdown_text(x) %>% tidy_gsub("\\n$", "")
  }) %>%
    unlist() %>%
    unname()
}

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
apply_pattern_fmt_x <- function(values,
                                pattern) {

  vapply(
    values,
    function(x) tidy_gsub(x = pattern, "{x}", x, fixed = TRUE),
    FUN.VALUE = character(1),
    USE.NAMES = FALSE
  )
}

#' Get a vector of indices for large-number suffixing
#'
#' @noRd
non_na_index <- function(values,
                         index,
                         default_value = NA) {

  if (is.logical(index)) {
    index <- is.integer(index)
  }

  stopifnot(is.integer(index) || is.numeric(index))

  # The algorithm requires `-Inf` not being present
  stopifnot(!any(is.infinite(values) & values < 0))

  # Get a vector of suffixes, which may include
  # NA values
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
num_suffix <- function(x,
                       suffixes = c("K", "M", "B", "T"),
                       base = 1000,
                       scale_by) {

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
  # each value of `x` (either postive or negative)
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
normalize_suffixing_inputs <- function(suffixing,
                                       scale_by) {

  if (is_false(suffixing)) {

    # If `suffixing` is FALSE, then return `NULL`;
    # this will be used to signal there is nothing
    # to be done in terms of scaling/suffixing
    return(NULL)

  } else if (isTRUE(suffixing)) {

    # Issue a warning if `scale_by` is not 1.0 (the default)
    warn_on_scale_by_input(scale_by)

    # If `suffixing` is TRUE, return the default
    # set of suffixes
    return(c("K", "M", "B", "T"))

  } else if (is.character(suffixing)) {

    # Issue a warning if `scale_by` is not 1.0 (the default)
    warn_on_scale_by_input(scale_by)

    # In the case that a character vector is provided
    # to `suffixing`, we first want to check if there
    # are any names provided
    if (!is.null(names(suffixing))) {
      stop("The character vector supplied to `suffixed` cannot contain names.",
           call. = FALSE)
    }

    # We can now return the character vector, having
    # adequately tested for improper cases
    return(suffixing)

  } else {

    # Stop function if the input to `suffixing` isn't
    # valid (i.e., isn't logical and isn't a valid
    # character vector)
    stop("The value provided to `suffixing` must either be:\n",
         " * `TRUE` or `FALSE` (the default)\n",
         " * a character vector with suffixing labels",
         call. = FALSE)
  }
}

#' If performing large-number suffixing, warn on `scale_by` != 1
#'
#' @param scale_by The `scale_by` option in some `fmt_*()` functions.
#' @noRd
warn_on_scale_by_input <- function(scale_by) {

  if (scale_by != 1) {
    warning("The value for `scale_by` cannot be changed if `suffixing` is ",
            "anything other than `FALSE`. The value provided to `scale_by` ",
            "will be ignored.",
            call. = FALSE)
  }
}

#' Derive a label based on a formula or a function name
#'
#' @noRd
derive_summary_label <- function(fn) {

  if (is.function(fn)) {

    # Stop the function if any functions provided
    # as bare names (e.g., `mean`) don't have
    # names provided
    stop("All functions provided as bare names in `fns` need a label.",
         call. = FALSE)

  } else if (inherits(fn, "formula")) {

    (fn %>% rlang::f_rhs())[[1]] %>%
      as.character()

  } else {
    fn %>% as.character()
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

#' Transform a CSS stylesheet to a tibble representation
#'
#' @noRd
get_css_tbl <- function(data) {

  raw_css_vec <-
    compile_scss(data) %>%
    as.character() %>%
    strsplit("\n") %>%
    unlist()

  ruleset_start <- which(grepl("\\{\\s*", raw_css_vec))
  ruleset_end <- which(grepl("\\s*\\}\\s*", raw_css_vec))

  css_tbl <- dplyr::tibble()

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
            stringr::str_trim()
        ) %>%
          dplyr::filter(!is.na(property))
      )
  }

  # Add a column that has the selector type for each row
  # For anything other than a class selector, the class type
  # will entered as NA
  css_tbl <-
    css_tbl %>%
    dplyr::mutate(type = dplyr::case_when(
      stringr::str_detect(selector, "^\\.") ~ "class",
      !stringr::str_detect(selector, "^\\.") ~ NA_character_)
    ) %>%
    dplyr::select(selector, type, property, value)

  # Stop function if any NA values found while inspecting the
  # selector names (e.g., not determined to be class selectors)
  if (any(is.na(css_tbl %>% dplyr::pull(type)))) {
    stop("All selectors must be class selectors", call. = FALSE)
  }

  css_tbl
}

#' Create an inlined style block from a CSS tibble
#'
#' @noRd
create_inline_styles <- function(class_names,
                                 css_tbl,
                                 extra_style = "") {

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
      dplyr::mutate(property_value = paste0(property, ": ", value, "; ")) %>%
      dplyr::pull(property_value) %>%
      paste(collapse = ""),
    extra_style,
    "\"") %>%
    tidy_gsub(" \\\"$", "\\\"")
}

#' Transform HTML to inlined HTML using a CSS tibble
#'
#' @noRd
inline_html_styles <- function(html, css_tbl) {

  cls_sty_pattern <- "class=\\\"(.*?)\\\"\\s+style=\\\"(.*?)\\\""

  repeat {

    matching_css_style <- html %>% stringr::str_extract(cls_sty_pattern)

    if (is.na(matching_css_style)) {
      break
    }

    class_names <-
      matching_css_style %>%
      stringr::str_extract("(?<=\\\").*?(?=\\\")")

    existing_style <-
      matching_css_style %>%
      stringr::str_match("style=\\\"(.*?)\\\"") %>%
      magrittr::extract(1, 2)

    inline_styles <-
      create_inline_styles(
        class_names = class_names,
        css_tbl = css_tbl,
        extra_style = existing_style
      )

    html <-
      html %>%
      stringr::str_replace(
        pattern = cls_sty_pattern,
        replacement = inline_styles
      )
  }

  cls_pattern <- "class=\\\"(.*?)\\\""

  repeat {

    class_names <-
      html %>%
      stringr::str_extract(pattern = cls_pattern) %>%
      stringr::str_extract("(?<=\\\").*?(?=\\\")")

    if (is.na(class_names)) {
      break
    }

    inline_styles <- create_inline_styles(class_names = class_names, css_tbl)

    html <-
      html %>%
      stringr::str_replace(
        pattern = cls_pattern,
        replacement = inline_styles
      )
  }

  html
}

#' Split any strings that are values in scientific notation
#'
#' @param x_str The input character vector of values formatted in scientific
#'   notation.
#' @noRd
split_scientific_notn <- function(x_str) {

  exp_parts <- strsplit(x_str, "e|E")
  num_part <- exp_parts %>% vapply(`[[`, character(1), 1)
  exp_part <- exp_parts %>% vapply(`[[`, character(1), 2) %>% as.numeric()

  list(num = num_part, exp = exp_part)
}

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

#' Create a vector of marks to use for footnotes
#'
#' @noRd
process_footnote_marks <- function(x,
                                   marks) {

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

  mapply(
    marks_val, marks_rep,
    FUN = function(val_i, rep_i) {
      paste(rep(val_i, rep_i), collapse = "")}
  ) %>%
    unname()
}


#' Determine whether an object is a `gt_tbl`
#'
#' @param data A table object that is created using the [gt()] function.
#' @noRd
is_gt <- function(data) {

  checkmate::test_class(data, "gt_tbl")
}

#' Stop any function if object is not a `gt_tbl` object
#'
#' @param data The input `data` object that is to be validated.
#'
#' @noRd
stop_if_not_gt <- function(data) {

  if (!is_gt(data)) {
    stop("The object to `data` is not a `gt_tbl` object.", call. = FALSE)
  }
}

#' Resolve the selection of border elements for a table cell
#'
#' @noRd
resolve_border_side <- function(side) {

  switch(side,
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
         all = "all")
}

#' Expand a path using fs::path_ex
#' @noRd
path_expand <- function(file) {

  fs::path_expand(file)
}

validate_marks <- function(marks) {

  if (is.null(marks)) {
    stop("The value for `marks` must not be `NULL`.", call. = FALSE)
  }
  if (!is.character(marks)) {
    stop("The value for `marks` must be a character vector.", call. = FALSE)
  }
  if (length(marks) == 0) {
    stop("The length of `marks` must not be zero.", call. = FALSE)
  }

  marks_keywords <- c("numbers", "letters", "LETTERS", "standard", "extended")

  if (length(marks) == 1 && !any(marks_keywords %in% marks)) {
    stop("The `marks` keyword provided (\"", marks, "\") is not valid\n",
         " * \"numbers\", \"letters\", \"LETTERS\", \"standard\", or \"extended\" can be used",
         call. = FALSE)
  }
}

validate_style_in <- function(style_vals,
                              style_names,
                              arg_name,
                              in_vector,
                              with_pattern = NULL) {

  if (arg_name %in% style_names) {

    arg_value <- style_vals[[arg_name]]

    # There is positive validation if a regex pattern is specified
    # in `with_pattern` and the pattern matches
    if (!is.null(with_pattern) && grepl(with_pattern, arg_value)) {
        return()
    }

    if (!(arg_value %in% in_vector)) {
      stop("The provided `", arg_name, "` value cannot be `",
           arg_value, "`; it can only be either of the following:\n",
           " * ", str_catalog(in_vector, conj = "or"),
           call. = FALSE)
    }
  }
}

flatten_list <- function(x) {
  x %>% unlist(recursive = FALSE)
}

#' Prepend a vector
#'
#' @inheritParams append
#' @noRd
prepend_vec <- function(x,
                        values,
                        after = 0) {

  append(x, values, after = after)
}

#' Convert a single-length vector to a repeating list of lists
#'
#' @noRd
rep_vec_as_list <- function(x, length_out) {

  rep_len(list(x), length_out)
}

validate_length_one <- function(x, name) {
  if (length(x) != 1) {
    stop("The value for `", name, "` should have a length of one",
         call. = FALSE)
  }
}

validate_table_id <- function(id) {

  if (is.null(id)) {
    return()
  }

  if (length(id) != 1) {
    stop("The length of `id` must be 1", call. = FALSE)
  }
  if (is.na(id)) {
    stop("The value for `id` must not be `NA`", call. = FALSE)
  }
  if (!is.character(id)) {
    stop("Any input for `id` must be of the `character` class", call. = FALSE)
  }
}

validate_n_sigfig <- function(n_sigfig) {

  if (length(n_sigfig) != 1) {
    stop("The length of `n_sigfig` must be 1.", call. = FALSE)
  }
  if (is.na(n_sigfig)) {
    stop("The value for `n_sigfig` must not be `NA`.", call. = FALSE)
  }
  if (!is.numeric(n_sigfig)) {
    stop("Any input for `n_sigfig` must be numeric.", call. = FALSE)
  }
  if (n_sigfig < 1) {
    stop("The value for `n_sigfig` must be greater than or equal to 1.", call. = FALSE)
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
  vapply(
    x_units_non_empty,
    FUN = htmltools::validateCssUnit,
    FUN.VALUE = character(1),
    USE.NAMES = FALSE
  ) %>%
    is.character()
}

column_classes_are_valid <- function(data, columns, valid_classes) {

  dt_data_get(data = data) %>%
    dplyr::select(resolve_vars(var_expr = {{columns}}, data = data)) %>%
    vapply(
      FUN.VALUE = logical(1), USE.NAMES = FALSE,
      FUN = function(x) any(class(x) %in% valid_classes)
    ) %>%
    all()
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
