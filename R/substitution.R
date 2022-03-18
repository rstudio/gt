#' Substitute missing values in the table body
#'
#' @description
#' Wherever there is missing data (i.e., `NA` values) customizable content may
#' present better than the standard `NA` text that would otherwise appear. The
#' `sub_missing()` function allows for this replacement through its
#' `missing_text` argument (where an em dash serves as the default).
#'
#' @details
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @inheritParams fmt_number
#' @param missing_text The text to be used in place of `NA` values in the
#'   rendered table.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table;
#' # NA values in different columns will
#' # be given replacement text
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(-row, -group) %>%
#'   gt() %>%
#'   sub_missing(
#'     columns = 1:2,
#'     missing_text = "missing"
#'   ) %>%
#'   sub_missing(
#'     columns = 4:7,
#'     missing_text = "nothing"
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_missing_1.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-15
#'
#' @import rlang
#' @export
sub_missing <- function(
    data,
    columns = everything(),
    rows = everything(),
    missing_text = "---"
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions (as a function list) to `sub_x()`
  sub_x(
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
#' @import rlang
#' @keywords internal
#' @export
fmt_missing <- function(
    data,
    columns = everything(),
    rows = everything(),
    missing_text = "---"
) {

  warning(
    "The `fmt_missing()` function is deprecated and will soon be removed\n",
    "* Use the `sub_missing()` function instead",
    call. = FALSE
  )

  sub_missing(
    data = data,
    columns = columns,
    rows = rows,
    missing_text = missing_text
  )
}

#' Substitute zero values in the table body
#'
#' @description
#' Wherever there is numerical data that are zero in value, replacement text may
#' be better for explanatory purposes. The `sub_zero()` function allows for this
#' replacement through its `zero_text` argument.
#'
#' @details
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @inheritParams fmt_number
#' @param zero_text The text to be used in place of zero values in the rendered
#'   table.
#'
#' @return An object of class `gt_tbl`.
#'
#' @family Format Data
#' @section Function ID:
#' 3-16
#'
#' @import rlang
#' @export
sub_zero <- function(
    data,
    columns = everything(),
    rows = everything(),
    zero_text = "nil"
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions (as a function list) to `sub_x()`
  sub_x(
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
        ifelse(is.numeric(x) & x == 0, zero_text, NA_character_)
      }
    )
  )
}

#' Substitute small values in the table body
#'
#' @description
#' Wherever there is numerical data that are very small in value, replacement
#' text may be better for explanatory purposes. The `sub_small_vals()` function
#' allows for this replacement through specification of a `threshold`, a
#' `small_pattern`, and the sign of the values to be considered.
#'
#' @details
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @inheritParams fmt_number
#' @param threshold The threshold value with which values should be considered
#'   small enough for replacement.
#' @param small_pattern The pattern text to be used in place of the suitably
#'   small values in the rendered table.
#' @param sign The sign of the numbers to be considered in the replacement. By
#'   default, we only consider positive values (`"+"`). The other option (`"-"`)
#'   can be used to consider only negative values.
#'
#' @return An object of class `gt_tbl`.
#'
#' @family Format Data
#' @section Function ID:
#' 3-17
#'
#' @import rlang
#' @export
sub_small_vals <- function(
    data,
    columns = everything(),
    rows = everything(),
    threshold = 0.01,
    small_pattern = "<{x}",
    sign = "+"
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Check that the `sign` value is an acceptable value
  check_sub_fn_sign(sign = sign)

  if (sign == "+") {
    op_fn_threshold <- `<`
    op_fn_zero_away <- `>`
  } else {
    op_fn_threshold <- `>=`
    op_fn_zero_away <- `<`
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions (as a function list) to `sub_x()`
  sub_x(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      # Any values of `x` that are below the threshold will be processed
      # according to the `small_pattern`, the `threshold` value (interacts with
      # the `small_pattern`, and the sign (changes the default `small_pattern`))
      html = function(x) {
        ifelse(
          is.numeric(x) &
            !is.na(x) &
            x != 0 &
            op_fn_threshold(x, abs(threshold) * ifelse(sign == "-", -1, 1)) &
            op_fn_zero_away(x, 0),
          process_text(
            context_small_vals_text(
              threshold = threshold,
              small_pattern = small_pattern,
              sign = sign
            ),
            context = "html"
          )
            ,
          NA_character_
        )
      },
      rtf = function(x) {
        ifelse(
          is.numeric(x) &
            !is.na(x) &
            x != 0 &
            op_fn_threshold(x, abs(threshold) * ifelse(sign == "-", -1, 1)) &
            op_fn_zero_away(x, 0),
          context_small_vals_text(
            threshold = threshold,
            small_pattern = small_pattern,
            sign = sign
          ),
          NA_character_
        )
      },
      latex = function(x) {
        ifelse(
          is.numeric(x) &
            !is.na(x) &
            x != 0 &
            op_fn_threshold(x, abs(threshold) * ifelse(sign == "-", -1, 1)) &
            op_fn_zero_away(x, 0),
          context_small_vals_text(
            threshold = threshold,
            small_pattern = small_pattern,
            sign = sign
          ),
          NA_character_
        )
      },
      default = function(x) {
        ifelse(
          is.numeric(x) &
            !is.na(x) &
            x != 0 &
            op_fn_threshold(x, abs(threshold) * ifelse(sign == "-", -1, 1)) &
            op_fn_zero_away(x, 0),
          context_small_vals_text(
            threshold = threshold,
            small_pattern = small_pattern,
            sign = sign
          ),
          NA_character_
        )
      }
    )
  )
}

#' Substitute large values in the table body
#'
#' @description
#' Wherever there is numerical data that are very large in value, replacement
#' text may be better for explanatory purposes. The `sub_large_vals()` function
#' allows for this replacement through specification of a `threshold`, a
#' `large_pattern`, and the sign of the values to be considered.
#'
#' @details
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @inheritParams fmt_number
#' @inheritParams sub_small_vals
#' @param threshold The threshold value with which values should be considered
#'   large enough for replacement.
#' @param large_pattern The pattern text to be used in place of the suitably
#'   large values in the rendered table.
#'
#' @return An object of class `gt_tbl`.
#'
#' @family Format Data
#' @section Function ID:
#' 3-18
#'
#' @import rlang
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
  stop_if_not_gt(data = data)

  # Check that the `sign` value is an acceptable value
  check_sub_fn_sign(sign = sign)

  if (sign == "+") {
    op_fn <- `>=`
  } else {
    op_fn <- `<`
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions (as a function list) to `sub_x()`
  sub_x(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      # Any values of `x` that are above the threshold will be processed
      # according to the `large_pattern`, the `threshold` value (interacts with
      # the `large_pattern`, and the sign (changes the default `large_pattern`))
      html = function(x) {
        ifelse(
          is.numeric(x) &
            op_fn(x, abs(threshold) * ifelse(sign == "-", -1, 1)),
          process_text(
            context_large_vals_text(
              threshold = threshold,
              large_pattern = large_pattern,
              sign = sign,
              context = "html"
            ),
            context = "html"
          ),
          NA_character_
        )
      },
      rtf = function(x) {
        ifelse(
          is.numeric(x) &
            op_fn(x, abs(threshold) * ifelse(sign == "-", -1, 1)),
          context_large_vals_text(
            threshold = threshold,
            large_pattern = large_pattern,
            sign = sign,
            context = "rtf"
          ),
          NA_character_
        )
      },
      latex = function(x) {
        ifelse(
          is.numeric(x) &
            op_fn(x, abs(threshold) * ifelse(sign == "-", -1, 1)),
          context_large_vals_text(
            threshold = threshold,
            large_pattern = large_pattern,
            sign = sign,
            context = "latex"
          ),
          NA_character_
        )
      },
      default = function(x) {
        ifelse(
          is.numeric(x) & op_fn(x, abs(threshold) * ifelse(sign == "-", -1, 1)),
          context_large_vals_text(
            threshold = threshold,
            large_pattern = large_pattern,
            sign = sign,
            context = "default"
          ),
          NA_character_
        )
      }
    )
  )
}

check_sub_fn_sign <- function(sign) {

  if (!(sign %in% c("+", "-"))) {
    stop(
      "The `sign` option should either be `\"+\"` or `\"-\"`:\n",
      "* With `\"+\"`, we consider only positive large values\n",
      "* Using `\"-\"` means that the focus is on negative values\n",
      call. = FALSE
    )
  }
}

#' Set a substitution scheme with custom functions
#'
#' @description
#' The `sub_x()` function provides a way to execute custom substitution
#' functionality with raw data values in a way that can consider all output
#' contexts.
#'
#' Along with the `columns` and `rows` arguments that provide some
#' precision in targeting data cells, the `fns` argument allows you to define
#' one or more functions for manipulating the raw data.
#'
#' If providing a single function to `fns`, the recommended format is in the
#' form: `fns = function(x) ...`. This single function will format the targeted
#' data cells the same way regardless of the output format (e.g., HTML, LaTeX,
#' RTF).
#'
#' If you require formatting of `x` that depends on the output format, a list of
#' functions can be provided for the `html`, `latex`, and `default` contexts.
#' This can be in the form of `fns = list(html = function(x) ..., latex =
#' function(x) ..., default = function(x) ...)`. In this multiple-function case,
#' we recommended including the `default` function as a fallback if all contexts
#' aren't provided.
#'
#' @details
#' As with all of the `sub_*()` functions, targeting of values is done through
#' `columns` and additionally by `rows` (if nothing is provided for `rows` then
#' entire columns are selected). Conditional substitution is possible by
#' providing a conditional expression to the `rows` argument. See the
#' *Arguments* section for more information on this.
#'
#' @inheritParams fmt_number
#' @param fns Either a single substitution function or a named list of
#'   functions.
#'
#' @return An object of class `gt_tbl`.
#'
#' @family Format Data
#' @section Function ID:
#' 3-19
#'
#' @import rlang
#' @export
sub_x <- function(
    data,
    columns = everything(),
    rows = everything(),
    fns
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Get the `stub_df` and `data_tbl` tables from `data`
  stub_df <- dt_stub_df_get(data = data)
  data_tbl <- dt_data_get(data = data)

  #
  # Resolution of columns and rows as character vectors
  #

  resolved_columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data
    )

  resolved_rows_idx <-
    resolve_rows_i(
      expr = {{ rows }},
      data = data
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
