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
#  Copyright (c) 2018-2026 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


# sub_missing() ----------------------------------------------------------------
#' Substitute missing values in the table body
#'
#' @description
#'
#' Wherever there is missing data (i.e., `NA` values) customizable content may
#' present better than the standard `NA` text that would otherwise appear.
#' `sub_missing()` allows for this replacement through its `missing_text`
#' argument (where an em dash serves as the default).
#'
#' @inheritParams fmt_number
#'
#' @param columns *Columns to target*
#'
#'   [`<column-targeting expression>`][rows-columns] // *default:* `everything()`
#'
#'   The columns to which substitution operations are constrained. Can either
#'   be a series of column names provided in `c()`, a vector of column indices,
#'   or a select helper function (e.g. [starts_with()], [ends_with()],
#'   [contains()], [matches()], [num_range()], and [everything()]).
#'
#' @param rows *Rows to target*
#'
#'   [`<row-targeting expression>`][rows-columns] // *default:* `everything()`
#'
#'   In conjunction with `columns`, we can specify which of their rows should
#'   form a constraint for targeting operations. The default [everything()]
#'   results in all rows in `columns` being formatted. Alternatively, we can
#'   supply a vector of row IDs within `c()`, a vector of row indices, or a
#'   select helper function (e.g. [starts_with()], [ends_with()], [contains()],
#'   [matches()], [num_range()], and [everything()]). We can also use
#'   expressions to filter down to the rows we need
#'   (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @param missing_text *Replacement text for `NA` values*
#'
#'   `scalar<character>` // *default:* `"---"`
#'
#'   The text to be used in place of `NA` values in the rendered table. We can
#'   optionally use [md()] or [html()] to style the text as Markdown or to
#'   retain HTML elements in the text.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use select columns from the [`exibble`] dataset to create a **gt** table. The
#' `NA` values in different columns (here, we are using column indices in
#' `columns`) will be given two variations of replacement text with two separate
#' calls of `sub_missing()`.
#'
#' ```r
#' exibble |>
#'   dplyr::select(-row, -group) |>
#'   gt() |>
#'   sub_missing(
#'     columns = 1:2,
#'     missing_text = "missing"
#'   ) |>
#'   sub_missing(
#'     columns = 4:7,
#'     missing_text = "nothing"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_sub_missing_1.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-32
#'
#' @section Function Introduced:
#' `v0.6.0` (May 24, 2022)
#'
#' @export
sub_missing <- function(
    data,
    columns = everything(),
    rows = everything(),
    missing_text = "---"
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions (as a function list) to `subst()`
  subst(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      # Any values of `x` that are `NA` get `missing_text` as output; any values
      # that are not missing get `NA` as their output (meaning, the existing
      # output for that value, if it exists, should be inherited)
      html = function(x) {

        missing_text <-
          context_missing_text(
            missing_text = missing_text,
            context = "html"
          )
        ifelse(is.na(x), missing_text, NA_character_)
      },
      latex = function(x) {

        missing_text <-
          context_missing_text(
            missing_text = missing_text,
            context = "latex"
          )
        ifelse(is.na(x), missing_text, NA_character_)
      },
      rtf = function(x) {

        missing_text <-
          context_missing_text(
            missing_text = missing_text,
            context = "rtf"
          )
        ifelse(is.na(x), missing_text, NA_character_)
      },
      default = function(x) {
        ifelse(is.na(x), missing_text, NA_character_)
      }
    )
  )
}

#' Format missing values (deprecated)
#'
#' @inheritParams fmt_number
#' @param missing_text The text to be used in place of `NA` values in the
#'   rendered table.
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @keywords internal
#' @export
fmt_missing <- function(
    data,
    columns = everything(),
    rows = everything(),
    missing_text = "---"
) {

  cli::cli_warn(c(
    "Since gt v0.6.0  {.fn fmt_missing} is deprecated and will
    soon be removed.",
    "i" = "Use {.fn sub_missing} instead."
  ),
  .frequency = "regularly",
  .frequency_id = "fmt_missing_fn_deprecation"
  )

  sub_missing(
    data = data,
    columns = columns,
    rows = rows,
    missing_text = missing_text
  )
}

# sub_zero() -------------------------------------------------------------------
#' Substitute zero values in the table body
#'
#' @description
#'
#' Wherever there is numerical data that are zero in value, replacement text may
#' be better for explanatory purposes. `sub_zero()` allows for this replacement
#' through its `zero_text` argument.
#'
#' @inheritParams sub_missing
#'
#' @param zero_text *Replacement text for zero values*
#'
#'   `scalar<character>` // *default:* `"nil"`
#'
#'   The text to be used in place of zero values in the rendered table. We can
#'   optionally use [md()] or [html()] to style the text as
#'   Markdown or to retain HTML elements in the text.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Let's generate a simple, single-column tibble that contains an assortment of
#' values that could potentially undergo some substitution.
#'
#' ```{r}
#' tbl <- dplyr::tibble(num = c(10^(-1:2), 0, 0, 10^(4:6)))
#'
#' tbl
#' ```
#'
#' With this table, the zero values in will be given replacement text with a
#' single call of `sub_zero()`.
#'
#' ```r
#' tbl |>
#'   gt() |>
#'   fmt_number(columns = num) |>
#'   sub_zero()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_sub_zero_1.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-33
#'
#' @section Function Introduced:
#' `v0.6.0` (May 24, 2022)
#'
#' @export
sub_zero <- function(
    data,
    columns = everything(),
    rows = everything(),
    zero_text = "nil"
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions (as a function list) to `subst()`
  subst(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      # Any values of `x` that are exactly 0 get `zero_text` as output;
      # any values that aren't 0 won't be affected
      html = function(x) {
        zero_text <- process_text(zero_text, context = "html")
        ifelse(is.numeric(x) & x == 0, zero_text, NA_character_)
      },
      rtf = function(x) {
        zero_text <- process_text(zero_text, context = "rtf")
        ifelse(is.numeric(x) & x == 0, zero_text, NA_character_)
      },
      latex = function(x) {
        zero_text <- process_text(zero_text, context = "latex")
        ifelse(is.numeric(x) & x == 0, zero_text, NA_character_)
      },
      default = function(x) {
        zero_text <- process_text(zero_text, context = "default")
        ifelse(is.numeric(x) & x == 0, zero_text, NA_character_)
      }
    )
  )
}

# sub_small_vals() -------------------------------------------------------------
#' Substitute small values in the table body
#'
#' @description
#'
#' Wherever there is numerical data that are very small in value, replacement
#' text may be better for explanatory purposes. `sub_small_vals()` allows for
#' this replacement through specification of a `threshold`, a `small_pattern`,
#' and the sign of the values to be considered. The substitution will occur for
#' those values found to be between `0` and the threshold value. This is
#' possible for small positive and small negative values (this can be explicitly
#' set by the `sign` option). Note that the interval does not include the `0` or
#' the `threshold` value. Should you need to include zero values, use
#' [sub_zero()].
#'
#' @inheritParams sub_missing
#'
#' @param threshold *Threshold value*
#'
#'   `scalar<numeric|integer>` // *default:* `0.01`
#'
#'   The threshold value with which values should be considered small enough for
#'   replacement.
#'
#' @param small_pattern *Pattern specification for small values*
#'
#'   `scalar<character>` // *default:* `if (sign == "+") "<{x}" else md("<*abs*(-{x})")`
#'
#'   The pattern text to be used in place of the suitably small values in the
#'   rendered table.
#'
#' @param sign *Consider positive or negative values?*
#'
#'   `scalar<character>` // *default:* `"+"`
#'
#'   The sign of the numbers to be considered in the replacement. By default, we
#'   only consider positive values (`"+"`). The other option (`"-"`) can be used
#'   to consider only negative values.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Let's generate a simple, single-column tibble that contains an assortment of
#' values that could potentially undergo some substitution.
#'
#' ```{r}
#' tbl <- dplyr::tibble(num = c(10^(-4:2), 0, NA))
#'
#' tbl
#' ```
#'
#' The `tbl` contains a variety of smaller numbers and some might be small
#' enough to reformat with a threshold value. With `sub_small_vals()` we can
#' do just that:
#'
#' ```r
#' tbl |>
#'   gt() |>
#'   fmt_number(columns = num) |>
#'   sub_small_vals()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_sub_small_vals_1.png")`
#' }}
#'
#' Small and negative values can also be handled but they are handled specially
#' by the `sign` parameter. Setting that to `"-"` will format only the small,
#' negative values.
#'
#' ```r
#' tbl |>
#'   dplyr::mutate(num = -num) |>
#'   gt() |>
#'   fmt_number(columns = num) |>
#'   sub_small_vals(sign = "-")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_sub_small_vals_2.png")`
#' }}
#'
#' You don't have to settle with the default `threshold` value or the default
#' replacement pattern (in `small_pattern`). This can be changed and the
#' `"{x}"` in `small_pattern` (which uses the `threshold` value) can even be
#' omitted.
#'
#' ```r
#' tbl |>
#'   gt() |>
#'   fmt_number(columns = num) |>
#'   sub_small_vals(
#'     threshold = 0.0005,
#'     small_pattern = "smol"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_sub_small_vals_3.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-34
#'
#' @section Function Introduced:
#' `v0.6.0` (May 24, 2022)
#'
#' @export
sub_small_vals <- function(
    data,
    columns = everything(),
    rows = everything(),
    threshold = 0.01,
    small_pattern = if (sign == "+") "<{x}" else md("<*abs*(-{x})"),
    sign = "+"
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Check that the `sign` value is an acceptable value
  check_sub_fn_sign(sign = sign)

  if (sign == "+") {
    op_fn_threshold <- `<`
    op_fn_zero_away <- `>`
  } else {
    op_fn_threshold <- `>`
    op_fn_zero_away <- `<`
  }

  # Ensure threshold is a single number and get its absolute value
  check_number_decimal(threshold)
  threshold <- abs(threshold)

  sub_replace_small_vals <- function(
    x,
    threshold,
    sign,
    small_pattern,
    context
  ) {

    if (!is.numeric(x)) {
      return(rep_len(NA_character_, length(x)))
    }

    ifelse(
      !is.na(x) &
        x != 0 &
        op_fn_threshold(x, threshold * ifelse(sign == "-", -1, 1)) &
        op_fn_zero_away(x, 0),
      process_text(
        resolve_small_vals_text(
          threshold = threshold,
          small_pattern = small_pattern
        ),
        context = context
      ),
      NA_character_
    )
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions (as a function list) to `subst()`
  subst(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      # Any values of `x` that are below the threshold will be processed
      # according to the `small_pattern`, the `threshold` value (interacts with
      # the `small_pattern`, and the sign (changes the default `small_pattern`))
      html = function(x) {

        sub_replace_small_vals(
          x,
          threshold = threshold,
          sign = sign,
          small_pattern = small_pattern,
          context = "html"
        )
      },
      rtf = function(x) {

        sub_replace_small_vals(
          x,
          threshold = threshold,
          sign = sign,
          small_pattern = small_pattern,
          context = "rtf"
        )
      },
      latex = function(x) {

        sub_replace_small_vals(
          x,
          threshold = threshold,
          sign = sign,
          small_pattern = small_pattern,
          context = "latex"
        )
      },
      grid = function(x) {

        sub_replace_small_vals(
          x,
          threshold = threshold,
          sign = sign,
          small_pattern = small_pattern,
          context = "grid"
        )
      },
      word = function(x) {

        sub_replace_small_vals(
          x,
          threshold = threshold,
          sign = sign,
          small_pattern = small_pattern,
          context = "word"
        )
      },
      default = function(x) {

        sub_replace_small_vals(
          x,
          threshold = threshold,
          sign = sign,
          small_pattern = small_pattern,
          context = "default"
        )
      }
    )
  )
}

# sub_large_vals() -------------------------------------------------------------
#' Substitute large values in the table body
#'
#' @description
#'
#' Wherever there are numerical data that are very large in value, replacement
#' text may be better for explanatory purposes. `sub_large_vals()` allows for
#' this replacement through specification of a `threshold`, a `large_pattern`,
#' and the sign (positive or negative) of the values to be considered.
#'
#' @inheritParams sub_missing
#'
#' @param threshold *Threshold value*
#'
#'   `scalar<numeric|integer>` // *default:* `1E12`
#'
#'   The threshold value with which values should be considered large enough for
#'   replacement.
#'
#' @param large_pattern *Pattern specification for large values*
#'
#'   `scalar<character>` // *default:* `">={x}"`
#'
#'   The pattern text to be used in place of the suitably large values in the
#'   rendered table.
#'
#' @param sign *Consider positive or negative values?*
#'
#'   `scalar<character>` // *default:* `"+"`
#'
#'   The sign of the numbers to be considered in the replacement. By default, we
#'   only consider positive values (`"+"`). The other option (`"-"`) can be used
#'   to consider only negative values.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Let's generate a simple, single-column tibble that contains an assortment of
#' values that could potentially undergo some substitution.
#'
#' ```{r}
#' tbl <- dplyr::tibble(num = c(0, NA, 10^(8:14)))
#'
#' tbl
#' ```
#'
#' The `tbl` object contains a variety of larger numbers and some might be
#' larger enough to reformat with a threshold value. With `sub_large_vals()` we
#' can do just that:
#'
#' ```r
#' tbl |>
#'   gt() |>
#'   fmt_number(columns = num) |>
#'   sub_large_vals()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_sub_large_vals_1.png")`
#' }}
#'
#' Large negative values can also be handled but they are handled specially by
#' the `sign` parameter. Setting that to `"-"` will format only the large values
#' that are negative. Notice that with the default `large_pattern` value of
#' `">={x}"` the `">="` is automatically changed to `"<="`.
#'
#' ```r
#' tbl |>
#'   dplyr::mutate(num = -num) |>
#'   gt() |>
#'   fmt_number(columns = num) |>
#'   sub_large_vals(sign = "-")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_sub_large_vals_2.png")`
#' }}
#'
#' You don't have to settle with the default `threshold` value or the default
#' replacement pattern (in `large_pattern`). This can be changed and the
#' `"{x}"` in `large_pattern` (which uses the `threshold` value) can even be
#' omitted.
#'
#' ```r
#' tbl |>
#'   gt() |>
#'   fmt_number(columns = num) |>
#'   sub_large_vals(
#'     threshold = 5E10,
#'     large_pattern = "hugemongous"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_sub_large_vals_3.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-35
#'
#' @section Function Introduced:
#' `v0.6.0` (May 24, 2022)
#'
#' @export
sub_large_vals <- function(
    data,
    columns = everything(),
    rows = everything(),
    threshold = 1E12,
    large_pattern = ">={x}",
    sign = "+"
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Check that the `sign` value is an acceptable value
  check_sub_fn_sign(sign = sign)

  if (sign == "+") {
    op_fn <- `>=`
  } else {
    op_fn <- `<=`
  }

  # Ensure threshold is a single number and get its absolute value
  check_number_decimal(threshold)
  threshold <- abs(threshold)

  sub_replace_large_vals <- function(
    x,
    threshold,
    large_pattern,
    sign,
    context
  ) {

    if (!is.numeric(x)) {
      return(rep_len(NA_character_, length(x)))
    }

    ifelse(
      !is.na(x) &
        op_fn(x, threshold * ifelse(sign == "-", -1, 1)),
      process_text(
        context_large_vals_text(
          threshold = threshold,
          large_pattern = large_pattern,
          sign = sign,
          context = context
        ),
        context = context
      ),
      NA_character_
    )
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions (as a function list) to `subst()`
  subst(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      # Any values of `x` that are above the threshold will be processed
      # according to the `large_pattern`, the `threshold` value (interacts with
      # the `large_pattern`, and the sign (changes the default `large_pattern`))
      html = function(x) {

        sub_replace_large_vals(
          x,
          threshold = threshold,
          sign = sign,
          large_pattern = large_pattern,
          context = "html"
        )
      },
      rtf = function(x) {

        sub_replace_large_vals(
          x,
          threshold = threshold,
          sign = sign,
          large_pattern = large_pattern,
          context = "rtf"
        )
      },
      latex = function(x) {

        sub_replace_large_vals(
          x,
          threshold = threshold,
          sign = sign,
          large_pattern = large_pattern,
          context = "latex"
        )
      },
      grid = function(x) {

        sub_replace_large_vals(
          x,
          threshold = threshold,
          sign = sign,
          large_pattern = large_pattern,
          context = "grid"
        )
      },
      word = function(x) {

        sub_replace_large_vals(
          x,
          threshold = threshold,
          sign = sign,
          large_pattern = large_pattern,
          context = "word"
        )
      },
      default = function(x) {

        sub_replace_large_vals(
          x,
          threshold = threshold,
          sign = sign,
          large_pattern = large_pattern,
          context = "default"
        )
      }
    )
  )
}

check_sub_fn_sign <- function(sign, call = rlang::caller_env()) {

  if (!(sign %in% c("+", "-"))) {
    cli::cli_abort(c(
      "The `sign` option should either be \"+\" or \"-\".",
      "*" = "With \"+\", we consider only positive large values.",
      "*" = "Using \"-\" means that the focus is on negative values."
      ),
      call = call
    )
  }
}

# sub_values() -----------------------------------------------------------------
#' Substitute targeted values in the table body
#'
#' @description
#'
#' Should you need to replace specific cell values with custom text,
#' `sub_values()` can be good choice. We can target cells for replacement
#' through value, regex, and custom matching rules.
#'
#' @inheritParams sub_missing
#'
#' @param values *Values to match on*
#'
#'   `scalar<character|numeric|integer>` // *default:* `NULL` (`optional`)
#'
#'   The specific value or values that should be replaced with a `replacement`
#'   value. If `pattern` is also supplied then `values` will be ignored.
#'
#' @param pattern *Regex pattern to match with*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   A regex pattern that can target solely those values in `character`-based
#'   columns. If `values` is also supplied, `pattern` will take precedence.
#'
#' @param fn *Function to return logical values*
#'
#'   `<function>` // *default:* `NULL` (`optional`)
#'
#'   A supplied function that operates on `x` (the data in a column) and should
#'   return a logical vector that matches the length of `x` (i.e., number of
#'   rows in the input table). If either of `values` or `pattern` is also
#'   supplied, `fn` will take precedence.
#'
#' @param replacement *Replacement value for matches*
#'
#'   `scalar<character|numeric|integer>` // *default:* `NULL` (`optional`)
#'
#'   The replacement value for any cell values matched by either `values` or
#'   `pattern`. Must be a character or numeric vector of length 1.
#'
#' @param escape *Text escaping*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   An option to escape replacement text according to the final output format
#'   of the table. For example, if a LaTeX table is to be generated then LaTeX
#'   escaping would be performed on the replacements during rendering. By
#'   default this is set to `TRUE` but setting to `FALSE` would be useful in the
#'   case where replacement text is crafted for a specific output format in
#'   mind.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Let's create an input table with three columns. This contains an assortment
#' of values that could potentially undergo some substitution via
#' `sub_values()`.
#'
#' ```{r}
#' tbl <-
#'   dplyr::tibble(
#'     num_1 = c(-0.01, 74, NA, 0, 500, 0.001, 84.3),
#'     int_1 = c(1L, -100000L, 800L, 5L, NA, 1L, -32L),
#'     lett = LETTERS[1:7]
#'   )
#'
#' tbl
#' ```
#'
#' Values in the table body cells can be replaced by specifying which values
#' should be replaced (in `values`) and what the replacement value should be.
#' It's okay to search for numerical or character values across all columns and
#' the replacement value can also be of the `numeric` or `character` types.
#'
#' ```r
#' tbl |>
#'   gt() |>
#'   sub_values(values = c(74, 500), replacement = 150) |>
#'   sub_values(values = "B", replacement = "Bee") |>
#'   sub_values(values = 800, replacement = "Eight hundred")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_sub_values_1.png")`
#' }}
#'
#' We can also use the `pattern` argument to target cell values for replacement
#' in `character`-based columns.
#'
#' ```r
#' tbl |>
#'   gt() |>
#'   sub_values(pattern = "A|C|E", replacement = "Ace")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_sub_values_2.png")`
#' }}
#'
#' For the most flexibility, it's best to use the `fn` argument. With that you
#' need to ensure that the function you provide will return a logical vector
#' when invoked on a column of cell values, taken as `x` (and, the length of
#' that vector must match the length of `x`).
#'
#' ```r
#' tbl |>
#'   gt() |>
#'   sub_values(
#'     fn = function(x) x >= 0 & x < 50,
#'     replacement = "Between 0 and 50"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_sub_values_3.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-36
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @export
sub_values <- function(
    data,
    columns = everything(),
    rows = everything(),
    values = NULL,
    pattern = NULL,
    fn = NULL,
    replacement = NULL,
    escape = TRUE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  if (is.null(values) && is.null(pattern) && is.null(fn)) {
    cli::cli_abort(
      "One of `values`, `pattern`, or `fn` must be supplied to {.fn sub_value}."
    )
  }

  # Validate that the `fn` object is a function
  if (!is.null(fn) && !rlang::is_function(fn)) {
    cli::cli_abort(
      "A function must be provided to the `fn` argument."
    )
  }

  if (is.numeric(replacement)) {
    check_number_decimal(replacement)
  } else if (is.character(replacement)) {
    check_string(replacement)
  } else {
    cli::cli_abort("{.arg replacement} must be a number, or a string,
                   not {.obj_type_friendly {replacement}}.")
  }

  sub_replace_value <- function(
    x,
    values,
    pattern,
    replacement,
    context
  ) {

    if (!is.null(fn)) {

      # Invoke the function on the `x` vector
      vec_logical <- fn(x)

      # Validate that the returned value is a logical vector
      if (is.null(vec_logical) || !is.logical(vec_logical)) {
        cli::cli_abort(
          "The value returned by invoking `fn` must be a logical vector."
        )
      }

      # Validate that the logical vector is of the correct length
      if (length(vec_logical) != length(x)) {
        cli::cli_abort(
          "The vector returned by invoking `fn` must be the same as `x`."
        )
      }

      # TODO: create the `repl_values` object using the logical vector
      vec_logical[which(is.na(vec_logical))] <- FALSE

      x[vec_logical] <- as.character(replacement)
      x[!vec_logical] <- NA_character_

      repl_values <- x

    } else if (!is.null(pattern)) {

      repl_values <-
        ifelse(
          !is.na(x) & is.character(x) & str_has_match(x, pattern = pattern),
          replacement,
          NA_character_
        )

    } else {

      repl_values <-
        ifelse(
          !is.na(x) & x %in% values,
          replacement,
          NA_character_
        )
    }

    if (escape) {
      repl_values <- process_text(text = repl_values, context = context)
    }

    repl_values
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions (as a function list) to `subst()`
  subst(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      html = function(x) {

        sub_replace_value(
          x,
          values = values,
          pattern = pattern,
          replacement = replacement,
          context = "html"
        )
      },
      rtf = function(x) {

        sub_replace_value(
          x,
          values = values,
          pattern = pattern,
          replacement = replacement,
          context = "rtf"
        )
      },
      latex = function(x) {

        sub_replace_value(
          x,
          values = values,
          pattern = pattern,
          replacement = replacement,
          context = "latex"
        )
      },
      default = function(x) {

        sub_replace_value(
          x,
          values = values,
          pattern = pattern,
          replacement = replacement,
          context = "default"
        )
      }
    )
  )
}

subst <- function(
    data,
    columns = everything(),
    rows = everything(),
    fns,
    call = rlang::caller_env()
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Resolution of columns and rows as character vectors
  #

  resolved_columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data,
      excl_stub = FALSE,
      call = call
    )

  resolved_rows_idx <-
    resolve_rows_i(
      expr = {{ rows }},
      data = data,
      call = call
    )

  # If a single function is supplied to `fns` then
  # repackage that into a list as the `default` function
  if (is.function(fns)) {
    fns <- list(default = fns)
  }

  # Create the `subst_list`, which is a bundle of
  # substitution functions for specific columns and rows
  subst_list <-
    list(
      func = fns,
      cols = resolved_columns,
      rows = resolved_rows_idx
    )

  dt_substitutions_add(data = data, substitutions = subst_list)
}
