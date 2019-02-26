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
        dplyr::filter(curr_number == currency) %>%
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
#' @importFrom dplyr filter pull
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
#' @importFrom dplyr filter pull
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
# text has the class `html` (applied by `html()` helper function), then
# the text will be seen as HTML and it won't undergo sanitization
#' @importFrom stringr str_replace_all
#' @importFrom htmltools htmlEscape
#' @importFrom commonmark markdown_html
#' @noRd
process_text <- function(text,
                         context = "html") {

  # If text is marked `AsIs` (by using `I()`) then just
  # return the text unchanged
  if (inherits(text, "AsIs")) {
    return(text)
  }

  if (context == "html") {

    # Text processing for HTML output

    if (inherits(text, "from_markdown")) {

      text <-
        text %>%
        as.character() %>%
        htmltools::htmlEscape() %>%
        commonmark::markdown_html() %>%
        stringr::str_replace_all("^<p>|</p>|\n", "")

      return(text)

    } else if (is.html(text)) {

      text <- text %>% as.character()

      return(text)

    } else {

      text <- text %>%
        as.character() %>%
        htmltools::htmlEscape()

      return(text)
    }
  } else if (context == "latex") {

    # Text processing for LaTeX output

    if (inherits(text, "from_markdown")) {

      text <- text %>%
        markdown_to_latex()

      return(text)

    } else if (is.html(text)) {

      text <- text %>% as.character()

      return(text)

    } else {

      text <- text %>% escape_latex()

      return(text)
    }
  } else {

    # Text processing in the default case

    if (inherits(text, "from_markdown")) {

      text <- text %>%
        markdown_to_text()

      return(text)

    } else if (is.html(text)) {

      text <- text %>% as.character()

      return(text)

    } else {

      text <- text %>%
        as.character() %>%
        htmltools::htmlEscape()

      return(text)
    }
  }
}

# Find common HTML entities resulting from HTML escaping and
# restore them back to ascii characters
unescape_html <- function(text) {

  text %>%
    tidy_gsub("&lt;", "<") %>%
    tidy_gsub("&gt;", ">") %>%
    tidy_gsub("&amp;", "&")
}

#' Transform Markdown text to HTML; also performs HTML escaping
#' @importFrom commonmark markdown_html
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

# Transform Markdown text to LaTeX; also escapes ASCII
# characters with special meaning in LaTeX
#' @importFrom commonmark markdown_latex
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

# Transform Markdown text to plain text
#' @importFrom commonmark markdown_text
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

# Get prepending and appending text based on a simple pattern
get_pre_post_txt <- function(pattern) {

  prefix <- strsplit(pattern, "\\{x\\}")[[1]][1]
  suffix <- strsplit(pattern, "\\{x\\}")[[1]][2]

  prefix <- ifelse(is.na(prefix), "", prefix)
  suffix <- ifelse(is.na(suffix), "", suffix)

  c(prefix, suffix)
}

#' @importFrom utils head
#' @noRd
non_na_index <- function(values, index, default_value = NA) {

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

# This function operates on a vector of numerical
# values and returns a tibble where each row
# represents a scaled values for `x` and the
# correct suffix to use during x's character-based
# formatting
#' @importFrom dplyr tibble
#' @noRd
num_suffix <- function(x,
                       suffixes = c("K", "M", "B", "T"),
                       base = 1000) {

  # If `suffixes` is a zero-length vector, we
  # provide a tibble that will ultimately not
  # scale value or apply any suffixes
  if (length(suffixes) == 0) {

    return(
      dplyr::tibble(
        scale_by = rep_len(1, length(x)),
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

# Create an `isFALSE`-based helper function that
# works with earlier versions of R (the `isFALSE()`
# function was introduced in R 3.5.0)
is_false = function(x) {

  is.logical(x) && length(x) == 1L && !is.na(x) && !x
}

# This function normalizes the `suffixing` input to a
# character vector which is later appended to scaled
# numerical values; the input can either be a single
# logical value or a character vector
normalize_suffixing_inputs <- function(suffixing) {

  if (is_false(suffixing)) {

    # If `suffixing` is FALSE, then return `NULL`;
    # this will be used to signal there is nothing
    # to be done in terms of scaling/suffixing
    return(NULL)

  } else if (isTRUE(suffixing)) {

    # If `suffixing` is TRUE, return the default
    # set of suffixes
    return(c("K", "M", "B", "T"))

  } else if (is.character(suffixing)) {

    # In the case that a character vector is provided
    # to `suffixing`, we first want to check if there
    # are any names provided

    # TODO: found that the conditional below seems
    # better than other solutions to determine whether
    # the vector is even partially named
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

# Derive a label based on a formula or a function name
#' @import rlang
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

# This function is a conveient wrapper for `system.file()` where the `package`
# refers to this package
system_file <- function(file) {
  system.file(file, package = "gt")
}

#nocov end

# This function removes entire HTML tags from input text
remove_html <- function(text) {
  gsub("<.+?>", "", text)
}

# This function transforms a CSS stylesheet to a tibble representation
#' @importFrom dplyr bind_rows tibble filter mutate case_when select pull
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
            stringr::str_trim()) %>%
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
      !stringr::str_detect(selector, "^\\.") ~ NA_character_)) %>%
    dplyr::select(selector, type, property, value)

  # Stop function if any NA values found while inspecting the
  # selector names (e.g., not determined to be class selectors)
  if (any(is.na(css_tbl %>% dplyr::pull(type)))) {
    stop("All selectors must be class selectors", call. = FALSE)
  }

  css_tbl
}

# Create an inlined style block from a CSS tibble
#' @importFrom dplyr filter select distinct mutate pull
#' @importFrom stringr str_split
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
      dplyr::mutate(property_value = paste0(property, ":", value, ";")) %>%
      dplyr::pull(property_value) %>%
      paste(collapse = ""),
    extra_style,
    "\"")
}

# Transform HTML to inlined HTML using a CSS tibble
#' @importFrom stringr str_extract str_replace str_match
#' @noRd
inline_html_styles <- function(html, css_tbl) {

  cls_sty_pattern <- "class=\\'(.*?)\\'\\s+style=\\\"(.*?)\\\""

  repeat {

    matching_css_style <-
      html %>%
      stringr::str_extract(
        pattern = cls_sty_pattern)

    if (is.na(matching_css_style)) {
      break
    }

    class_names <-
      matching_css_style %>%
      stringr::str_extract("(?<=\\').*(?=\\')")

    existing_style <-
      matching_css_style %>%
      stringr::str_match(
        pattern = "style=\\\"(.*?)\\\"") %>%
      magrittr::extract(1, 2)

    inline_styles <-
      create_inline_styles(
        class_names = class_names, css_tbl, extra_style = existing_style)

    html <-
      html %>%
      stringr::str_replace(
        pattern = cls_sty_pattern,
        replacement = inline_styles)
  }

  cls_pattern <- "class=\\'(.*?)\\'"

  repeat {

    class_names <-
      html %>%
      stringr::str_extract(
        pattern = cls_pattern) %>%
      stringr::str_extract("(?<=\\').*(?=\\')")

    if (is.na(class_names)) {
      break
    }

    inline_styles <-
      create_inline_styles(
        class_names = class_names, css_tbl)

    html <-
      html %>%
      stringr::str_replace(
        pattern = cls_pattern,
        replacement = inline_styles)
  }

  html
}

split_scientific_notn <- function(x_str) {

  exp_parts <- strsplit(x_str, "e|E")
  num_part <- exp_parts %>% vapply(`[[`, character(1), 1)
  exp_part <- exp_parts %>% vapply(`[[`, character(1), 2) %>% as.numeric()

  list(num = num_part, exp = exp_part)
}

# This function is wrapper for `gsub()` that uses default argument values and
# rearranges first three arguments for better pipelining
tidy_gsub <- function(x, pattern, replacement) {

  gsub(pattern, replacement, x)
}

# Options setter for the `opts_df` data frame
opts_df_set <- function(opts_df, option, value) {

  opts_df[which(opts_df$parameter == option), "value"] <- value

  opts_df
}

# Options getter for the `opts_df` data frame
opts_df_get <- function(opts_df, option) {

  opts_df[which(opts_df$parameter == option), "value"]
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

footnote_glyphs <- function(x,
                            glyphs) {

  glyphs <- strsplit(glyphs, ",") %>% unlist()

  if (identical(glyphs, "numbers")) {
    return(as.character(x))
  }

  if (identical(glyphs, "LETTERS")) {
    glyphs <- LETTERS
  }

  if (identical(glyphs, "letters")) {
    glyphs <- letters
  }

  glyphs_rep <- floor((x - 1) / length(glyphs)) + 1

  glyphs_val <- glyphs[(x - 1) %% length(glyphs) + 1]

  mapply(
    glyphs_val, glyphs_rep,
    FUN = function(val_i, rep_i) {
      paste(rep(val_i, rep_i), collapse = "")}
  ) %>% unname()
}

#' @importFrom checkmate test_class
#' @noRd
is_gt <- function(data) {

  checkmate::test_class(data, "gt_tbl")
}

stop_if_not_gt <- function(data) {

  if (!is_gt(data)) {
    stop("The object to `data` is not a `gt_tbl` object.", call. = FALSE)
  }
}
