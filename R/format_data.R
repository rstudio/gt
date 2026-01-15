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


# fmt_scientific() -------------------------------------------------------------
#' Format values to scientific notation
#'
#' @description
#'
#' With numeric values in a **gt** table, we can perform formatting so that the
#' targeted values are rendered in scientific notation, where extremely large or
#' very small numbers can be expressed in a more practical fashion. Here,
#' numbers are written in the form of a mantissa (`m`) and an exponent (`n`)
#' with the construction *m* x 10^*n* or *m*E*n*. The mantissa component is a
#' number between `1` and `10`. For instance, `2.5 x 10^9` can be used to
#' represent the value 2,500,000,000 in scientific notation. In a similar way,
#' 0.00000012 can be expressed as `1.2 x 10^-7`. Due to its ability to describe
#' numbers more succinctly and its ease of calculation, scientific notation is
#' widely employed in scientific and technical domains.
#'
#' We have fine control over the formatting task, with the following options:
#'
#' - decimals: choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' - scaling: we can choose to scale targeted values by a multiplier value
#' - pattern: option to use a text pattern for decoration of the formatted
#' values
#' - locale-based formatting: providing a locale ID will result in
#' formatting specific to the chosen locale
#'
#' @inheritParams fmt_number
#'
#' @param scale_by *Scale values by a fixed multiplier*
#'
#'   `scalar<numeric|integer>` // *default:* `1`
#'
#'   All numeric values will be multiplied by the `scale_by` value before
#'   undergoing formatting. Since the `default` value is `1`, no values will be
#'   changed unless a different multiplier value is supplied.
#'
#' @param exp_style *Style declaration for exponent formatting*
#'
#'   `scalar<character>` // *default:* `"x10n"`
#'
#'   Style of formatting to use for the scientific notation formatting. By
#'   default this is `"x10n"` but other options include using a single letter
#'   (e.g., `"e"`, `"E"`, etc.), a letter followed by a `"1"` to signal a
#'   minimum digit width of one, or `"low-ten"` for using a stylized `"10"`
#'   marker.
#'
#' @param force_sign_m,force_sign_n *Forcing the display of a positive sign*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   Should the plus sign be shown for positive values of the mantissa (first
#'   component, `force_sign_m`) or the exponent (`force_sign_n`)? This would
#'   effectively show a sign for all values except zero on either of those
#'   numeric components of the notation. If so, use `TRUE` for either one of
#'   these options. The default for both is `FALSE`, where only negative numbers
#'   will display a sign.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_scientific()` is compatible with body cells that are of the `"numeric"`
#' or `"integer"` types. Any other types of body cells are ignored during
#' formatting. This is to say that cells of incompatible data types may be
#' targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_scientific()` to
#' obtain varying parameter values from a specified column within the table.
#' This means that each row could be formatted a little bit differently. These
#' arguments provide support for [from_column()]:
#'
#' - `decimals`
#' - `drop_trailing_zeros`
#' - `drop_trailing_dec_mark`
#' - `scale_by`
#' - `exp_style`
#' - `pattern`
#' - `sep_mark`
#' - `dec_mark`
#' - `force_sign_m`
#' - `force_sign_n`
#' - `locale`
#'
#' Please note that for all of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Adapting output to a specific `locale`:
#'
#' This formatting function can adapt outputs according to a provided `locale`
#' value. Examples include `"en"` for English (United States) and `"fr"` for
#' French (France). The use of a valid locale ID here means separator and
#' decimal marks will be correct for the given locale. Should any values be
#' provided in `sep_mark` or `dec_mark`, they will be overridden by the locale's
#' preferred values.
#'
#' Note that a `locale` value provided here will override any global locale
#' setting performed in [gt()]'s own `locale` argument (it is settable there as
#' a value received by all other functions that have a `locale` argument). As a
#' useful reference on which locales are supported, we can call [info_locales()]
#' to view an info table.
#'
#' @section Examples:
#'
#' Let's define a data frame that contains two columns of values (one `small`
#' and one `large`). After creating a simple **gt** table from `small_large_tbl`
#' we'll call `fmt_scientific()` on both columns.
#'
#' ```r
#' small_large_tbl <-
#'   dplyr::tibble(
#'     small = 10^(-12:-1),
#'     large = 10^(1:12)
#'   )
#'
#' small_large_tbl |>
#'   gt() |>
#'   fmt_scientific()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_scientific_1.png")`
#' }}
#'
#' The default method of styling the notation uses the '*m* x 10^*n*'
#' construction but this can be changed to a '*m*E*n*' style via the `exp_style`
#' argument. We can supply any single letter here and optionally affix a `"1"`
#' to indicate there should not be any zero-padding of the *n* value. Two calls
#' of `fmt_scientific()` are used here to show different options for styling
#' in scientific notation.
#'
#' ```r
#' small_large_tbl |>
#'   gt() |>
#'   fmt_scientific(
#'     columns = small,
#'     exp_style = "E"
#'   ) |>
#'   fmt_scientific(
#'     columns = large,
#'     exp_style = "e1",
#'     force_sign_n = TRUE
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_scientific_2.png")`
#' }}
#'
#' Taking a portion of the [`reactions`] dataset, we can create a **gt** table
#' that contains reaction rate constants that should be expressed in scientific
#' notation. All of the numeric values in the filtered table require that
#' type of formatting so `fmt_scientific()` can be called without requiring any
#' specification of column names in the `columns` argument. By default, the
#' number of decimal places is fixed to `2`, which is fine for this table.
#'
#' ```r
#' reactions |>
#'   dplyr::filter(cmpd_type == "mercaptan") |>
#'   dplyr::select(cmpd_name, cmpd_formula, OH_k298, Cl_k298, NO3_k298) |>
#'   gt(rowname_col = "cmpd_name") |>
#'   tab_header(title = "Gas-phase reactions of selected mercaptan compounds") |>
#'   tab_spanner(
#'     label = md("Reaction Rate Constant (298 K),<br>{{cm^3 molecules^-1 s^-1}}"),
#'     columns = ends_with("k298")
#'   ) |>
#'   fmt_chem(columns = cmpd_formula) |>
#'   fmt_scientific() |>
#'   sub_missing() |>
#'   cols_label(
#'     cmpd_formula = "",
#'     OH_k298 = "OH",
#'     NO3_k298 = "{{%NO3%}}",
#'     Cl_k298 = "Cl"
#'   ) |>
#'   opt_stylize() |>
#'   opt_horizontal_padding(scale = 3) |>
#'   opt_table_font(font = google_font("IBM Plex Sans")) |>
#'   tab_options(stub.font.weight = "500")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_scientific_3.png")`
#' }}
#'
#' The [`constants`] table contains a plethora of data on the fundamental
#' physical constants and values range from very small to very large, warranting
#' the use of figures in scientific notation. Because the values differ in the
#' degree of measurement precision, the dataset has columns (`sf_value` and
#' `sf_uncert`) that include the number of significant figures for each
#' measurement value and for the associated uncertainty. We can use the
#' `n_sigfig` argument of `fmt_scientific()` in conjunction with the
#' [from_column()] helper to format each value and its uncertainty to the proper
#' number of significant digits.
#'
#' ```r
#' constants |>
#'   dplyr::filter(grepl("Planck", name)) |>
#'   gt() |>
#'   fmt_scientific(
#'     columns = value,
#'     n_sigfig = from_column(column = "sf_value")
#'   ) |>
#'   fmt_scientific(
#'     columns = uncert,
#'     n_sigfig = from_column(column = "sf_uncert")
#'   ) |>
#'   cols_hide(columns = starts_with("sf")) |>
#'   fmt_units(columns = units) |>
#'   sub_missing(missing_text = "")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_scientific_4.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-3
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @seealso The vector-formatting version of this function:
#'   [vec_fmt_scientific()].
#'
#' @export
fmt_scientific <- function(
    data,
    columns = everything(),
    rows = everything(),
    decimals = 2,
    n_sigfig = NULL,
    drop_trailing_zeros = FALSE,
    drop_trailing_dec_mark = TRUE,
    scale_by = 1.0,
    exp_style = "x10n",
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign_m = FALSE,
    force_sign_n = FALSE,
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - decimals
  # - n_sigfig
  # - drop_trailing_zeros
  # - drop_trailing_dec_mark
  # - scale_by
  # - exp_style
  # - pattern
  # - sep_mark
  # - dec_mark
  # - force_sign_m
  # - force_sign_n
  # - locale

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_scientific",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_scientific(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          decimals = p_i$decimals %||% decimals,
          n_sigfig = p_i$n_sigfig %||% n_sigfig,
          drop_trailing_zeros = p_i$drop_trailing_zeros %||% drop_trailing_zeros,
          drop_trailing_dec_mark = p_i$drop_trailing_dec_mark %||% drop_trailing_dec_mark,
          scale_by = p_i$scale_by %||% scale_by,
          exp_style = p_i$exp_style %||% exp_style,
          pattern = p_i$pattern %||% pattern,
          sep_mark = p_i$sep_mark %||% sep_mark,
          dec_mark = p_i$dec_mark %||% dec_mark,
          force_sign_m = p_i$force_sign_m %||% force_sign_m,
          force_sign_n = p_i$force_sign_n %||% force_sign_n,
          locale = p_i$locale %||% locale
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Stop function if `locale` does not have a valid value; normalize locale
  # and resolve one that might be set globally
  validate_locale(locale = locale)
  locale <- normalize_locale(locale = locale)
  locale <- resolve_locale(data = data, locale = locale)

  # Set default values
  suffixing <- FALSE
  use_seps <- TRUE

  # Use locale-based marks if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)
  dec_mark <- get_locale_dec_mark(locale, dec_mark)

  # Normalize the `suffixing` input to either return a character vector
  # of suffix labels, or NULL (the case where `suffixing` is FALSE)
  suffix_labels <- normalize_suffixing_inputs(suffixing, scale_by, system = "intl")

  valid_class <- c("numeric", "integer", "integer64")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  # If `n_sigfig` is defined (and not `NA`) modify the number of
  # decimal places and keep all trailing zeros
  if (!is.null(n_sigfig) && !is.na(n_sigfig[1])) {

    # Stop function if `n_sigfig` does not have a valid value
    validate_n_sigfig(n_sigfig = n_sigfig)

    decimals <- n_sigfig - 1
    drop_trailing_zeros <- FALSE
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = valid_class,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      format_fn = function(x, context) {

        # Handle Inf values by preserving them as "Inf" strings
        x_is_inf <- is.infinite(x)
        x_is_finite <- !x_is_inf

        # Initialize result vector
        x_str <- character(length(x))

        # Define the marks by context (needed for both finite and Inf values)
        exp_marks <- context_exp_marks(context = context)
        minus_mark <- context_minus_mark(context = context)

        # Define the `replace_minus()` function
        replace_minus <- function(x) {
           gsub("-", minus_mark, x, fixed = TRUE)
        }

        # Only process finite values
        if (any(x_is_finite)) {

          # Create the `suffix_df` object
          suffix_df <-
            create_suffix_df(
              x[x_is_finite],
              decimals = decimals,
              suffix_labels = suffix_labels,
              scale_by = scale_by,
              system = "intl"
            )

          # Determine whether `scale_by` is supplied as a function; if it isn't
          # the only other pathway involves getting the vector of values produced
          # by the `create_suffix_df()` function
          if (rlang::is_function(scale_by)) {
            to_scale_by <- scale_by
          } else {
            to_scale_by <- suffix_df$scale_by
          }

          # Scale the `x` values using `to_scale_by` (either a function or
          # a numeric vector)
          x_finite <- scale_x_values(x[x_is_finite], scale_by = suffix_df$scale_by)

          x_str_finite <-
            format_num_to_str(
              x_finite,
              context = context,
              decimals = decimals,
              n_sigfig = NULL,
              sep_mark = sep_mark,
              dec_mark = dec_mark,
              drop_trailing_zeros = FALSE,
              drop_trailing_dec_mark = FALSE,
              format = "e",
              replace_minus_mark = FALSE
            )

          if (exp_style == "x10n") {

            # Determine which values don't require the (x 10^n)
            # for scientific formatting since their order would be zero
            small_pos <- has_order_zero(x_finite)

            # For any numbers that shouldn't have an exponent, remove
            # that portion from the character version
            x_str_finite[small_pos] <- replace_minus(gsub("(e|E).*", "", x_str_finite[small_pos]))

            # For any non-NA numbers that do have an exponent, format
            # those according to the output context
            sci_parts <- split_scientific_notn(x_str = x_str_finite[!small_pos])

            m_part <- sci_parts[["num"]]
            n_part <- sci_parts[["exp"]]

            if (force_sign_n) {

              n_part <-
                vapply(
                  n_part,
                  FUN.VALUE = character(1),
                  USE.NAMES = FALSE,
                  FUN = function(x) {
                    if (x > 0) gsub("^", "+", x) else as.character(x)
                  }
                )
            }

            if (drop_trailing_zeros) {
              m_part <- sub("0+$", "", m_part)
              x_str_finite[small_pos] <- sub("0+$", "", x_str_finite[small_pos])
            }

            if (drop_trailing_dec_mark) {
              m_part <- sub("\\.$", "", m_part)
              x_str_finite[small_pos] <- sub("\\.$", "", x_str_finite[small_pos])
            }

            m_part <- replace_minus(m_part)
            n_part <- replace_minus(n_part)

            x_str_finite[!small_pos] <-
              paste0(m_part, exp_marks[1L], n_part, exp_marks[2L])

          } else {

            exp_str <- context_exp_str(exp_style = exp_style, context = context)

            if (grepl("^[a-zA-Z]{1}1$", exp_style)) {
              n_min_width <- 1
            } else {
              n_min_width <- 2
            }

            # The `n_part` will be extracted here and it must be padded to
            # the defined minimum number of decimal places
            n_part <-
              vapply(
                x_str_finite,
                FUN.VALUE = character(1L),
                USE.NAMES = FALSE,
                FUN = function(x) {

                  if (!grepl("e(\\+|-)[0-9]{2,}", x)) return("")

                  x <- unlist(strsplit(x, "e", fixed = TRUE))[2L]

                  if (grepl("-", x, fixed = TRUE)) {
                    x <- gsub("-", "", x, fixed = TRUE)
                    x <- formatC(as.numeric(x), width = n_min_width, flag = "0")
                    x <- paste0("-", x)
                  } else {
                    x <- formatC(as.numeric(x), width = n_min_width, flag = "0")
                  }

                  x
                }
              )

            # Generate `x_str_left` using `x_str_finite` here
            x_str_left <-
              vapply(
                x_str_finite,
                FUN.VALUE = character(1L),
                USE.NAMES = FALSE,
                FUN = function(x) {
                  if (!grepl("e(\\+|-)[0-9]{2,}", x)) return("")
                  unlist(strsplit(x, "e", fixed = TRUE))[1]
                }
              )

            if (force_sign_n) {

              n_part <-
                vapply(
                  seq_along(n_part),
                  FUN.VALUE = character(1L),
                  USE.NAMES = FALSE,
                  FUN = function(i) {
                    if (!grepl("-", n_part[i])) {
                      out <- gsub("^", "+", n_part[i])
                    } else {
                      out <- n_part[i]
                    }
                    out
                  }
                )
            }

            x_str_finite <-
              paste0(x_str_left, exp_str, replace_minus(n_part))

            x_str_finite <- replace_minus(x_str_finite)
          }

          # Force a positive sign on certain values if the option is taken
          if (force_sign_m) {

            positive_x <- !is.na(x_finite) & x_finite > 0
            x_str_finite[positive_x] <- paste_left(x_str_finite[positive_x], x_left = "+")
          }

          # Assign formatted finite values to their positions in result vector
          x_str[x_is_finite] <- x_str_finite
        }

        # Preserve Inf values as "Inf" in the result (preserving sign and applying minus mark)
        x_str[x_is_inf] <- replace_minus(as.character(x[x_is_inf]))

        x_str
      }
    )
  )
}

# fmt_engineering() ------------------------------------------------------------
#' Format values to engineering notation
#'
#' @description
#'
#' With numeric values in a **gt** table, we can perform formatting so that the
#' targeted values are rendered in engineering notation, where numbers are
#' written in the form of a mantissa (`m`) and an exponent (`n`). When combined
#' the construction is either of the form *m* x 10^*n* or *m*E*n*. The mantissa
#' is a number between `1` and `1000` and the exponent is a multiple of `3`. For
#' example, the number 0.0000345 can be written in engineering notation as
#' `34.50 x 10^-6`. This notation helps to simplify calculations and make it
#' easier to compare numbers that are on very different scales.
#'
#' We have fine control over the formatting task, with the following options:
#'
#' - decimals: choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' - scaling: we can choose to scale targeted values by a multiplier value
#' - pattern: option to use a text pattern for decoration of the formatted
#' values
#' - locale-based formatting: providing a locale ID will result in
#' formatting specific to the chosen locale
#'
#' @inheritParams fmt_number
#'
#' @param scale_by *Scale values by a fixed multiplier*
#'
#'   `scalar<numeric|integer>` // *default:* `1`
#'
#'   All numeric values will be multiplied by the `scale_by` value before
#'   undergoing formatting. Since the `default` value is `1`, no values will be
#'   changed unless a different multiplier value is supplied.
#'
#' @param exp_style *Style declaration for exponent formatting*
#'
#'   `scalar<character>` // *default:* `"x10n"`
#'
#'   Style of formatting to use for the scientific notation formatting. By
#'   default this is `"x10n"` but other options include using a single letter
#'   (e.g., `"e"`, `"E"`, etc.), a letter followed by a `"1"` to signal a
#'   minimum digit width of one, or `"low-ten"` for using a stylized `"10"`
#'   marker.
#'
#' @param force_sign_m,force_sign_n *Forcing the display of a positive sign*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   Should the plus sign be shown for positive values of the mantissa (first
#'   component, `force_sign_m`) or the exponent (`force_sign_n`)? This would
#'   effectively show a sign for all values except zero on either of those
#'   numeric components of the notation. If so, use `TRUE` for either one of
#'   these options. The default for both is `FALSE`, where only negative numbers
#'   will display a sign.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_engineering()` is compatible with body cells that are of the
#' `"numeric"` or `"integer"` types. Any other types of body cells are ignored
#' during formatting. This is to say that cells of incompatible data types may
#' be targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_engineering()` to
#' obtain varying parameter values from a specified column within the table.
#' This means that each row could be formatted a little bit differently. These
#' arguments provide support for [from_column()]:
#'
#' - `decimals`
#' - `drop_trailing_zeros`
#' - `drop_trailing_dec_mark`
#' - `scale_by`
#' - `exp_style`
#' - `pattern`
#' - `sep_mark`
#' - `dec_mark`
#' - `force_sign_m`
#' - `force_sign_n`
#' - `locale`
#'
#' Please note that for all of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Adapting output to a specific `locale`:
#'
#' This formatting function can adapt outputs according to a provided `locale`
#' value. Examples include `"en"` for English (United States) and `"fr"` for
#' French (France). The use of a valid locale ID here means separator and
#' decimal marks will be correct for the given locale. Should any values be
#' provided in `sep_mark` or `dec_mark`, they will be overridden by the locale's
#' preferred values.
#'
#' Note that a `locale` value provided here will override any global locale
#' setting performed in [gt()]'s own `locale` argument (it is settable there as
#' a value received by all other functions that have a `locale` argument). As a
#' useful reference on which locales are supported, we can call [info_locales()]
#' to view an info table.
#'
#' @section Examples:
#'
#' Let's define a data frame that contains two columns of values (one `small`
#' and one `large`). After creating a simple **gt** table from `small_large_tbl`
#' we'll call `fmt_engineering()` on both columns.
#'
#' ```r
#' small_large_tbl <-
#'   dplyr::tibble(
#'     small = 10^(-12:-1),
#'     large = 10^(1:12)
#'   )
#'
#' small_large_tbl |>
#'   gt() |>
#'   fmt_engineering()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_engineering_1.png")`
#' }}
#'
#' Notice that within the form of *m* x 10^*n*, the *n* values move in steps of
#' 3 (away from `0`), and *m* values can have 1-3 digits before the decimal.
#' Further to this, any values where *n* is `0` results in a display of only *m*
#' (the first two values in the `large` column demonstrates this).
#'
#' Engineering notation expresses values so that they are align to certain SI
#' prefixes. Here is a table that compares select SI prefixes and their symbols
#' to decimal and engineering-notation representations of the key numbers.
#'
#' ```r
#' prefixes_tbl <-
#'   dplyr::tibble(
#'     name = c(
#'       "peta", "tera", "giga", "mega", "kilo",
#'       NA,
#'       "milli", "micro", "nano", "pico", "femto"
#'     ),
#'     symbol = c(
#'       "P", "T", "G", "M", "k",
#'       NA,
#'       "m", ":micro:", "n", "p", "f"
#'     ),
#'     decimal = c(10^(seq(15, -15, -3))),
#'     engineering = decimal
#'   )
#'
#' prefixes_tbl |>
#'   gt() |>
#'   fmt_number(columns = decimal, n_sigfig = 1) |>
#'   fmt_engineering(columns = engineering) |>
#'   fmt_units(columns = symbol) |>
#'   sub_missing()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_engineering_2.png")`
#' }}
#'
#' The default method of styling the notation uses the '*m* x 10^*n*'
#' construction but this can be changed to a '*m*E*n*' style via the `exp_style`
#' argument. We can supply any single letter here and optionally affix a `"1"`
#' to indicate there should not be any zero-padding of the *n* value. Two calls
#' of `fmt_engineering()` are used here to show different options for styling
#' in engineering notation.
#'
#' ```r
#' small_large_tbl |>
#'   gt() |>
#'   fmt_engineering(
#'     columns = small,
#'     exp_style = "E"
#'   ) |>
#'   fmt_engineering(
#'     columns = large,
#'     exp_style = "e1",
#'     force_sign_n = TRUE
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_engineering_3.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-4
#'
#' @section Function Introduced:
#' `v0.3.1` (August 9, 2021)
#'
#' @seealso The vector-formatting version of this function:
#'   [vec_fmt_engineering()].
#'
#' @export
fmt_engineering <- function(
    data,
    columns = everything(),
    rows = everything(),
    decimals = 2,
    drop_trailing_zeros = FALSE,
    drop_trailing_dec_mark = TRUE,
    scale_by = 1.0,
    exp_style = "x10n",
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign_m = FALSE,
    force_sign_n = FALSE,
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - decimals
  # - drop_trailing_zeros
  # - drop_trailing_dec_mark
  # - scale_by
  # - exp_style
  # - pattern
  # - sep_mark
  # - dec_mark
  # - force_sign_m
  # - force_sign_n
  # - locale

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_engineering",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_engineering(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          decimals = p_i$decimals %||% decimals,
          drop_trailing_zeros = p_i$drop_trailing_zeros %||% drop_trailing_zeros,
          drop_trailing_dec_mark = p_i$drop_trailing_dec_mark %||% drop_trailing_dec_mark,
          scale_by = p_i$scale_by %||% scale_by,
          exp_style = p_i$exp_style %||% exp_style,
          pattern = p_i$pattern %||% pattern,
          sep_mark = p_i$sep_mark %||% sep_mark,
          dec_mark = p_i$dec_mark %||% dec_mark,
          force_sign_m = p_i$force_sign_m %||% force_sign_m,
          force_sign_n = p_i$force_sign_n %||% force_sign_n,
          locale = p_i$locale %||% locale
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Stop function if `locale` does not have a valid value; normalize locale
  # and resolve one that might be set globally
  validate_locale(locale = locale)
  locale <- normalize_locale(locale = locale)
  locale <- resolve_locale(data = data, locale = locale)

  # Set default values
  suffixing <- FALSE
  use_seps <- TRUE

  # Use locale-based marks if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)
  dec_mark <- get_locale_dec_mark(locale, dec_mark)

  # Normalize the `suffixing` input to either return a character vector
  # of suffix labels, or NULL (the case where `suffixing` is FALSE)
  suffix_labels <- normalize_suffixing_inputs(suffixing, scale_by, system = "intl")

  valid_class <- c("numeric", "integer", "integer64")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = valid_class,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      format_fn = function(x, context) {

        # Define the marks by context
        exp_marks <- context_exp_marks(context = context)
        minus_mark <- context_minus_mark(context = context)

        # Define the `replace_minus()` function
        replace_minus <- function(x) {
          gsub("-", minus_mark, x, fixed = TRUE)
        }

        # Create the `suffix_df` object
        suffix_df <-
          create_suffix_df(
            x,
            decimals = decimals,
            suffix_labels = suffix_labels,
            scale_by = scale_by,
            system = "intl"
          )

        # Determine whether `scale_by` is supplied as a function; if it isn't
        # the only other pathway involves getting the vector of values produced
        # by the `create_suffix_df()` function
        if (rlang::is_function(scale_by)) {
          to_scale_by <- scale_by
        } else {
          to_scale_by <- suffix_df$scale_by
        }

        # Scale the `x` values using `to_scale_by` (either a function or
        # a numeric vector)
        x <- scale_x_values(x, suffix_df$scale_by)

        zero_x <- x == 0
        negative_x <- x < 0
        x_str_left <- x_str_right <- x_str <- character(length = length(x))

        # Powers in engineering notation always in steps of 3; this
        # calculation gets, for every value, the effective power value
        power_3 <- floor(log(abs(x), base = 1000)) * 3

        # Any zero values will return Inf from the previous calculation
        # so we must replace these with a `0`
        power_3[is.infinite(power_3)] <- 0L

        # The numbers on the LHS must be scaled to correspond to the
        # RHS 10^`power_level` values (i.e., `<LHS> x 10^(n * 3)`)
        x <- x / 10^(power_3)

        # With the scaled values for the LHS, format these according
        # to the options set by the user
        x_str_left <-
          format_num_to_str(
            x,
            context = context,
            decimals = decimals,
            n_sigfig = NULL,
            sep_mark = sep_mark,
            dec_mark = dec_mark,
            drop_trailing_zeros = drop_trailing_zeros,
            drop_trailing_dec_mark = drop_trailing_dec_mark,
            format = "f",
            replace_minus_mark = FALSE
          )

        x_str_left <- replace_minus(x_str_left)

        n_part <-
          vapply(
            power_3,
            FUN.VALUE = character(1L),
            USE.NAMES = FALSE,
            FUN = function(x) {
              if (x > 0 && force_sign_n) {
                out <- gsub("^", "+", x)
              } else {
                out <- as.character(x)
              }
              out
            }
          )

        if (exp_style == "x10n") {

          # Generate the RHS of the formatted value (i.e., the `x 10^(n * 3)`)
          x_str_right <-
            paste0(
              exp_marks[1],
              replace_minus(n_part),
              exp_marks[2]
            )

          # Replace elements from `x_str_right` where exponent values
          # are zero with empty strings
          x_str_right[power_3 == 0] <- ""

          # Paste the LHS and RHS components to generate the formatted values
          x_str <- paste0(x_str_left, x_str_right)

        } else {

          exp_str <- context_exp_str(exp_style = exp_style, context = context)

          if (grepl("^[a-zA-Z]{1}1$", exp_style)) {
            n_min_width <- 1
          } else {
            n_min_width <- 2
          }

          # `power_3` must be padded to two decimal places
          n_part <-
            vapply(
              power_3,
              FUN.VALUE = character(1L),
              USE.NAMES = FALSE,
              FUN = function(x) {
                if (grepl("-", x)) {
                  x <- gsub("-", "", x)
                  x <- formatC(as.numeric(x), width = n_min_width, flag = "0")
                  x <- paste0("-", x)
                } else {
                  x <- formatC(as.numeric(x), width = n_min_width, flag = "0")
                }
                x
              }
            )

          if (force_sign_n) {

            n_part <-
              vapply(
                seq_along(n_part),
                FUN.VALUE = character(1L),
                USE.NAMES = FALSE,
                FUN = function(i) {
                  if (power_3[i] >= 0) {
                    out <- gsub("^", "+", n_part[i])
                  } else {
                    out <- n_part[i]
                  }
                  out
                }
              )
          }

          x_str[!is.infinite(x)] <-
            paste0(x_str_left[!is.infinite(x)], exp_str, replace_minus(n_part[!is.infinite(x)]))

          x_str[is.infinite(x)] <- as.character(x[is.infinite(x)])

          x_str <- replace_minus(x_str)
        }

        # Force a positive sign on certain values if the option is taken
        if (force_sign_m) {

          positive_x <- !is.na(x) & x > 0
          x_str[positive_x] <- paste_left(x_str[positive_x], x_left = "+")
        }

        x_str
      }
    )
  )
}

# fmt_number_si() --------------------------------------------------------------
#' Format numbers with SI prefixes
#'
#' @description
#'
#' Format numeric values with SI (International System of Units) prefixes,
#' automatically selecting the appropriate prefix to keep the mantissa in a
#' readable range. SI prefixes range from quetta (Q, 10^30) to quecto
#' (q, 10^-30) and are commonly used in scientific and engineering contexts to
#' represent very large or very small quantities with units (e.g., "5.2 kW",
#' "3.8 ng", "1.2 GHz", etc.).
#'
#' This function provides fine control over SI prefix formatting with the
#' following options:
#'
#' - unit specification: define a fixed unit or use per-row units from a column
#' - prefix selection: choose between all SI prefixes or only engineering
#' prefixes (powers of 1000)
#' - precision control: specify decimal places or significant figures
#' - spacing: customize the separator between number, prefix, and unit
#' - locale-based formatting: use locale-specific decimal and thousands separators
#'
#' @param data *The gt table data object*
#'
#'   `obj:<gt_tbl>` // **required**
#'
#'   This is the **gt** table object that is commonly created through use of the
#'   [gt()] function.
#'
#' @param columns *Columns to target*
#'
#'   [`<column-targeting expression>`][`rows-columns`] // *default:* `everything()`
#'
#'   Can either be a series of column names provided in `c()`, a vector of
#'   column indices, or a select helper function (e.g. [starts_with()],
#'   [ends_with()], [contains()], [matches()], [num_range()] and [everything()]).
#'
#' @param rows *Rows to target*
#'
#'   [`<row-targeting expression>`][`rows-columns`] // *default:* `everything()`
#'
#'   In conjunction with `columns`, we can specify which of their rows should
#'   undergo formatting. The default [everything()] results in all rows in
#'   `columns` being formatted. Alternatively, we can supply a vector of row
#'   captions within `c()`, a vector of row indices, or a select helper
#'   function (e.g. [starts_with()], [ends_with()], [contains()], [matches()],
#'   [num_range()], and [everything()]). We can also use expressions to filter
#'   down to the rows we need (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @param unit *Unit to append to formatted values*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   A character string specifying the unit to append after the SI prefix
#'   (e.g., `"g"` for grams, `"W"` for watts, `"Hz"` for hertz, `"m"` for meters).
#'   If `NULL`, only the prefix will be shown. The unit can also be dynamically
#'   specified per row using [from_column()].
#'
#' @param prefix_mode *Type of SI prefixes to use*
#'
#'   `singl-kw:[engineering|decimal]` // *default:* `"engineering"`
#'
#'   The type of SI prefixes to use. Options are `"engineering"` (powers of
#'   1000 only) or `"decimal"` (all SI prefixes including powers of 10 and 100).
#'   See the *SI Prefix Modes* section for details.
#'
#' @param decimals *Number of decimal places*
#'
#'   `scalar<numeric|integer>(val>=0)` // *default:* `2`
#'
#'   The exact number of decimal places to display in the mantissa. If both
#'   `decimals` and `n_sigfig` are provided, `n_sigfig` takes precedence.
#'
#' @param n_sigfig *Number of significant figures*
#'
#'   `scalar<numeric|integer>(val>=1)` // *default:* `NULL` (`optional`)
#'
#'   Format numbers to *n* significant figures. This is often preferred in
#'   scientific contexts to maintain consistent precision across different
#'   magnitudes. When specified, the `decimals` argument is ignored.
#'
#' @param drop_trailing_zeros *Drop trailing zeros*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   Remove trailing zeros after the decimal point (e.g., "1.50" becomes "1.5").
#'
#' @param drop_trailing_dec_mark *Drop trailing decimal mark*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   Remove the decimal mark if all decimal places are zero (e.g., "1." becomes
#'   "1").
#'
#' @param use_seps *Use digit group separators*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   Enable or disable the use of digit separators (e.g., thousands separators).
#'
#' @param scale_by *Scale values by a fixed multiplier*
#'
#'   `scalar<numeric|integer>` // *default:* `1`
#'
#'   All numeric values will be multiplied by the `scale_by` value before
#'   undergoing formatting. Since the `default` value is `1`, no values will be
#'   changed unless a different multiplier value is supplied. This is useful
#'   for unit conversions, such as using [`unit_conversion()`] to convert
#'   horsepower to watts before formatting with SI prefixes.
#'
#' @param pattern *Decoration pattern*
#'
#'   `scalar<character>` // *default:* `"{x}"`
#'
#'   A formatting pattern for decorating values. Use `{x}` to represent the
#'   formatted value (including prefix and unit).
#'
#' @param sep_mark *Thousands separator*
#'
#'   `scalar<character>` // *default:* `","`
#'
#'   The character to use as the thousands separator. Overridden if `locale` is
#'   provided.
#'
#' @param dec_mark *Decimal mark*
#'
#'   `scalar<character>` // *default:* `"."`
#'
#'   The character to use as the decimal point. Overridden if `locale` is
#'   provided.
#'
#' @param force_sign *Force positive sign*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   Force the display of a plus sign for positive values.
#'
#' @param incl_space *Include a space between the value and the unit symbol*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   An option for whether to include a space between the numerical value and
#'   the SI prefix + unit (e.g., `TRUE` for "1.5 kW", `FALSE` for "1.5kW"). Per
#'   SI convention, there should be a space between the value and the unit
#'   symbol.
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier for locale-specific number formatting.
#'   When provided, overrides `sep_mark` and `dec_mark` with locale-appropriate
#'   values.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section SI Prefix Modes:
#'
#' The `prefix_mode` argument controls which SI prefixes are used:
#'
#' - `"engineering"`: Uses only prefixes for powers of 1000. This includes:
#'   - greater than 1: k (kilo), M (mega), G (giga), T (tera), P (peta),
#'     E (exa), Z (zetta), Y (yotta), R (ronna), Q (quetta)
#'   - less than 1: m (milli), u (micro), n (nano), p (pico), f (femto),
#'     a (atto), z (zepto), y (yocto), r (ronto), q (quecto)
#'   - this is the most common convention in scientific and engineering
#'   contexts.
#'
#' - `"decimal"`: Uses all SI prefixes including those for powers of 10 and 100:
#'   - Additional prefixes for greater-than-1 values: da (deca), h (hecto)
#'   - Additional prefixes for less-than-1 values: d (deci), c (centi)
#'   - This mode is less commonly used but follows the complete SI standard.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_number_si()` is compatible with body cells that are of the `"numeric"`
#' or `"integer"` types. Any other types of body cells are ignored during
#' formatting. This is to say that cells of incompatible data types may be
#' targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [`from_column()`] can be used with certain arguments of `fmt_number_si()` to
#' obtain varying parameter values from a specified column within the table.
#' This means that each row could be formatted a little bit differently. These
#' arguments provide support for [`from_column()`]:
#'
#' - `unit`: The unit can be specified with a column name in quotes.
#' - `decimals`: Each row's number formatting could use a different number of
#'   decimal places.
#' - `n_sigfig`: Each row could have a different number of significant figures.
#' - `drop_trailing_zeros`: The option to drop trailing zeros can be controlled
#'   per row.
#' - `drop_trailing_dec_mark`: The option to drop trailing decimal marks can be
#'   controlled per row.
#' - `use_seps`: The use of digit separators can be enabled or disabled on a
#'   per-row basis.
#' - `scale_by`: The scale multiplier can be different for each row.
#' - `pattern`: The formatting pattern can be specified per row.
#' - `sep_mark`: The thousands separator mark can be set per row.
#' - `dec_mark`: The decimal mark can be set per row.
#' - `force_sign`: Whether to force a plus sign can be controlled per row.
#' - `incl_space`: Whether to include a space between number and unit can vary
#'   per row.
#' - `locale`: The locale can be specified per row.
#'
#' Please note that for all of the aforementioned arguments, a [`from_column()`]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [`cols_add()`] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [`cols_hide()`].
#' Finally, there is no limitation to how many arguments the [`from_column()`]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Adapting output to a specific `locale`:
#'
#' This formatting function can adapt outputs according to a provided `locale`
#' value. Examples include `"en"` for English (United States) and `"fr"` for
#' French (France). The use of a valid locale ID here means separator and
#' decimal marks will be correct for the given locale. Should any values be
#' provided in `sep_mark` or `dec_mark`, they will be overridden by the locale's
#' preferred values.
#'
#' Note that a `locale` value provided here will override any global locale
#' setting performed in [gt()]'s own `locale` argument (it is settable there as
#' a value received by all other functions that have a `locale` argument). As a
#' useful reference on which locales are supported, we can call [info_locales()]
#' to view an info table.
#'
#' @section Examples:
#'
#' Create a table showing the masses of obelisks located in Rome. The masses are
#' initially in metric tons, which we'll convert to grams using
#' [`unit_conversion()`] in the `scale_by` argument. The resulting values are
#' then formatted with SI prefixes, which are all here as `M` (*mega*).
#'
#' ```r
#' dplyr::tibble(
#'   obelisk = c(
#'     "Lateran Obelisk",
#'     "Vatican Obelisk",
#'     "Flaminio Obelisk",
#'     "Pantheon Obelisk"
#'   ),
#'   mass_ton = c(455, 331, 235, 30)
#' ) |>
#'   gt() |>
#'   fmt_number_si(
#'     columns = mass_ton,
#'     unit = "g",
#'     decimals = 0,
#'     scale_by = unit_conversion(
#'       from = "mass.metric-ton",
#'       to = "mass.gram"
#'     )
#'   ) |>
#'   cols_label(
#'     obelisk = "Obelisk",
#'     mass_ton = "Mass"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_number_si_1.png")`
#' }}
#'
#' Create a table showing measurements of different substances with varying
#' units. The `unit` column contains different units per row (grams and liters),
#' which are used with [from_column()] to apply appropriate SI prefixes.
#'
#' ```r
#' dplyr::tibble(
#'   substance = c("Glucose", "Vitamin C", "Caffeine", "Water"),
#'   amount = c(0.0051, 0.000075, 0.0002, 0.250),
#'   unit = c("g", "g", "g", "L")
#' ) |>
#'   gt() |>
#'   fmt_number_si(
#'     columns = amount,
#'     unit = from_column("unit"),
#'     n_sigfig = 2
#'   ) |>
#'   cols_hide(columns = unit)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_number_si_2.png")`
#' }}
#'
#' You can combine `fmt_number_si()` with [fmt_units()] and [cols_merge()] to
#' format measurements with SI prefixes on units that need special typesetting.
#' In this example, `fmt_number_si()` handles both the SI prefix and the unit
#' with proper spacing, while [fmt_units()] creates a separate column with
#' additional unit information (like "per hour") that gets merged in.
#'
#' ```r
#' dplyr::tibble(
#'   measurement = c("Power", "Resistance", "Energy", "Fall Velocity"),
#'   value = c(1500, 2400000, 3600000,0.033),
#'   unit = c("W", ":ohm:", "J", "m /s")
#' ) |>
#'   gt() |>
#'   fmt_number_si(columns = value, decimals = 1) |>
#'   fmt_units(columns = unit) |>
#'   cols_merge(columns = c(value, unit), pattern = "{1}{2}")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_number_si_3.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-5
#'
#' @section Function Introduced:
#' `v1.2.0` (December 16, 2025)
#'
#' @seealso The vector-formatting version of this function:
#'   [vec_fmt_number_si()].
#'
#' @export
fmt_number_si <- function(
    data,
    columns = everything(),
    rows = everything(),
    unit = NULL,
    prefix_mode = c("engineering", "decimal"),
    decimals = 2,
    n_sigfig = NULL,
    drop_trailing_zeros = FALSE,
    drop_trailing_dec_mark = TRUE,
    use_seps = TRUE,
    scale_by = 1,
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign = FALSE,
    incl_space = TRUE,
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Match the prefix_mode argument
  prefix_mode <- rlang::arg_match0(prefix_mode, values = c("engineering", "decimal"))

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  # - unit
  # - decimals
  # - n_sigfig
  # - drop_trailing_zeros
  # - drop_trailing_dec_mark
  # - use_seps
  # - scale_by
  # - pattern
  # - sep_mark
  # - dec_mark
  # - force_sign
  # - incl_space
  # - locale

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_number_si",
        all_args_except = c("data", "columns", "rows", "prefix_mode")
      )
    )

  fn_call <- call("fmt_number_si")

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_rows_i()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data,
        call = fn_call
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_number_si(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          unit = p_i$unit %||% unit,
          prefix_mode = prefix_mode,
          decimals = p_i$decimals %||% decimals,
          n_sigfig = p_i$n_sigfig %||% n_sigfig,
          drop_trailing_zeros = p_i$drop_trailing_zeros %||% drop_trailing_zeros,
          drop_trailing_dec_mark = p_i$drop_trailing_dec_mark %||% drop_trailing_dec_mark,
          use_seps = p_i$use_seps %||% use_seps,
          scale_by = p_i$scale_by %||% scale_by,
          pattern = p_i$pattern %||% pattern,
          sep_mark = p_i$sep_mark %||% sep_mark,
          dec_mark = p_i$dec_mark %||% dec_mark,
          force_sign = p_i$force_sign %||% force_sign,
          incl_space = p_i$incl_space %||% incl_space,
          locale = p_i$locale %||% locale
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Determine if we're using significant figures or decimal places
  if (!is.null(n_sigfig)) {
    formatC_format <- "fg"
  } else {
    formatC_format <- "f"
  }

  # Get the SI prefix labels based on prefix_mode
  si_labels <- get_si_labels(prefix_mode = prefix_mode)

  # Use locale-based marks if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)
  dec_mark <- get_locale_dec_mark(locale, dec_mark)

  valid_class <- c("numeric", "integer", "integer64")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = valid_class,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      format_fn = function(x, context) {

        # Apply scale_by multiplier first (e.g., for unit conversion)
        x <- x * scale_by

        # Define the marks by context
        minus_mark <- context_minus_mark(context = context)

        # Create the `si_prefix_df` object
        si_prefix_df <-
          create_si_prefix_df(
            x,
            decimals = decimals,
            si_labels = si_labels
          )

        # Scale the `x` values by the SI prefix scale factors
        x <- x * si_prefix_df$scale_by

        # Format numeric values to character-based numbers
        x_str <-
          format_num_to_str(
            x,
            context = context,
            decimals = decimals,
            n_sigfig = n_sigfig,
            sep_mark = sep_mark,
            dec_mark = dec_mark,
            drop_trailing_zeros = drop_trailing_zeros,
            drop_trailing_dec_mark = drop_trailing_dec_mark,
            format = formatC_format,
            system = "intl"
          )

        # Additional cleanup: ensure trailing decimal marks are removed if requested
        # (format_num_to_str doesn't always handle this when sep_mark is non-empty)
        if (drop_trailing_dec_mark && nzchar(dec_mark)) {
          x_str <- gsub(paste0("\\", dec_mark, "$"), "", x_str)
        }

        # Add space between number and prefix+unit based on incl_space parameter
        # The space should come before the prefix, not between prefix and unit
        # Space is added if incl_space is TRUE and there's a prefix or unit
        space_before_unit <- ifelse(
          incl_space & (nzchar(si_prefix_df$prefix) | (!is.null(unit) && nzchar(unit))),
          " ",
          ""
        )

        # Add unit if unit exists
        if (!is.null(unit) && nzchar(unit)) {
          # Combine: number + space + prefix + unit
          x_str <- paste0(x_str, space_before_unit, si_prefix_df$prefix, unit)
        } else {
          # Just combine number with SI prefix (with space if incl_space is TRUE and prefix exists)
          x_str <- paste0(x_str, space_before_unit, si_prefix_df$prefix)
        }

        # Replace minus signs with the context-appropriate minus mark
        x_str <- gsub("-", minus_mark, x_str, fixed = TRUE)

        # Force a positive sign on certain values if the option is taken
        if (force_sign) {
          positive_x <- !is.na(x) & x > 0
          x_str[positive_x] <- paste0("+", x_str[positive_x])
        }

        x_str
      }
    )
  )
}


#' Get SI prefix labels
#'
#' Returns the appropriate set of SI prefix labels based on the mode.
#' @param prefix_mode Either "engineering" or "decimal"
#' @noRd
get_si_labels <- function(prefix_mode) {

  if (prefix_mode == "engineering") {
    # Engineering notation: powers of 1000 only
    # Positive: 10^3, 10^6, 10^9, 10^12, 10^15, 10^18, 10^21, 10^24, 10^27, 10^30
    # Negative: 10^-3, 10^-6, 10^-9, 10^-12, 10^-15, 10^-18, 10^-21, 10^-24, 10^-27, 10^-30
    list(
      exponents = c(
        -30, -27, -24, -21, -18, -15, -12, -9, -6, -3,
        3, 6, 9, 12, 15, 18, 21, 24, 27, 30
      ),
      symbols = c(
        "q", "r", "y", "z", "a", "f", "p", "n", "\u00b5", "m",
        "k", "M", "G", "T", "P", "E", "Z", "Y", "R", "Q"
      )
    )
  } else {
    # Decimal notation: all SI prefixes
    list(
      exponents = c(
        -30, -27, -24, -21, -18, -15, -12, -9, -6, -3, -2, -1,
        1, 2, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30
      ),
      symbols = c(
        "q", "r", "y", "z", "a", "f", "p", "n", "\u00b5", "m", "c", "d",
        "da", "h", "k", "M", "G", "T", "P", "E", "Z", "Y", "R", "Q"
      )
    )
  }
}


#' Create a data frame with SI prefix information
#'
#' For each value in `x`, determine the appropriate SI prefix and scale factor.
#' @param x Numeric vector
#' @param decimals Number of decimal places (used for rounding in selection)
#' @param si_labels List with exponents and symbols
#' @noRd
create_si_prefix_df <- function(x, decimals, si_labels) {

  n <- length(x)
  scale_by <- numeric(n)
  prefix <- character(n)

  for (i in seq_len(n)) {

    if (is.na(x[i]) || is.infinite(x[i]) || x[i] == 0) {
      # For NA, Inf, or zero values, no prefix
      scale_by[i] <- 1
      prefix[i] <- ""
    } else {
      # Find the best matching SI prefix
      # We want the mantissa to be in the range [1, 1000) for engineering mode
      # or [1, 10) for decimal mode with powers of 10
      best_exp <- 0
      best_idx <- NA

      for (j in seq_along(si_labels$exponents)) {
        exp_j <- si_labels$exponents[j]

        # Check if this exponent would give us a mantissa in [1, 1000)
        mantissa <- abs(x[i]) * 10^(-exp_j)

        if (mantissa >= 1 && mantissa < 1000) {
          # Prefer the largest exponent that keeps mantissa in range
          if (is.na(best_idx) || exp_j > best_exp) {
            best_exp <- exp_j
            best_idx <- j
          }
        }
      }

      if (is.na(best_idx)) {
        # No suitable prefix found, use no prefix
        scale_by[i] <- 1
        prefix[i] <- ""
      } else {
        scale_by[i] <- 10^(-best_exp)
        prefix[i] <- si_labels$symbols[best_idx]
      }
    }
  }

  vctrs::data_frame(
    scale_by = scale_by,
    prefix = prefix
  )
}


#' Format values to take a predefined symbol
#'
#' @inheritParams fmt_number
#' @inheritParams fmt_currency
#' @return An object of class `gt_tbl`.
#' @noRd
fmt_symbol <- function(
    data,
    columns,
    rows,
    symbol = "*",
    accounting = FALSE,
    decimals = NULL,
    drop_trailing_zeros = FALSE,
    drop_trailing_dec_mark = TRUE,
    use_seps = TRUE,
    min_sep_threshold = 1,
    scale_by = 1.0,
    suffixing = FALSE,
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign = FALSE,
    placement = "left",
    incl_space = FALSE,
    system = c("intl", "ind"),
    locale = NULL
) {

  # Ensure that arguments are matched
  system <- rlang::arg_match0(system, values = c("intl", "ind"))

  # Use locale-based marks if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)
  dec_mark <- get_locale_dec_mark(locale, dec_mark)

  # Normalize the `suffixing` input to either return a character vector
  # of suffix labels, or NULL (the case where `suffixing` is FALSE)
  suffix_labels <- normalize_suffixing_inputs(suffixing, scale_by, system = system)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = c("numeric", "integer"),
    fns = num_fmt_factory_multi(
      pattern = pattern,
      format_fn = function(x, context) {

        # Create the `x_str` vector
        x_str <- character(length(x))

        # Create the `suffix_df` object
        suffix_df <-
          create_suffix_df(
            x,
            decimals = decimals,
            suffix_labels = suffix_labels,
            scale_by = scale_by,
            system = system
          )

        # Determine whether `scale_by` is supplied as a function; if it isn't
        # the only other pathway involves getting the vector of values produced
        # by the `create_suffix_df()` function
        if (rlang::is_function(scale_by)) {
          to_scale_by <- scale_by
        } else {
          to_scale_by <- suffix_df$scale_by
        }

        # Scale the `x` values using `to_scale_by` (either a function or
        # a numeric vector)
        x <- scale_x_values(x, suffix_df$scale_by)

        is_negative_x <- x < 0
        is_not_negative_x <- !is_negative_x

        if (any(is_not_negative_x)) {

          # Format numeric values to character-based numbers
          x_str[is_not_negative_x] <-
            format_num_to_str_c(
              x[is_not_negative_x],
              context = context,
              decimals = decimals,
              n_sigfig = NULL,
              sep_mark = sep_mark,
              dec_mark = dec_mark,
              drop_trailing_zeros = drop_trailing_zeros,
              drop_trailing_dec_mark = drop_trailing_dec_mark,
              min_sep_threshold = min_sep_threshold,
              system = system
            )
        }

        x_abs_str <- x_str

        if (any(is_negative_x)) {

          # Format numeric values to character-based numbers
          x_abs_str[is_negative_x] <-
            format_num_to_str_c(
              abs(x[is_negative_x]),
              context = context,
              decimals = decimals,
              n_sigfig = NULL,
              sep_mark = sep_mark,
              dec_mark = dec_mark,
              drop_trailing_zeros = drop_trailing_zeros,
              drop_trailing_dec_mark = drop_trailing_dec_mark,
              min_sep_threshold = min_sep_threshold,
              system = system
            )
        }

        # If we supply a per mille or per myriad keyword as
        # `symbol` (possible inputs in `fmt_partsper()`),
        # get the contextually correct mark
        if (is.character(symbol)) {
          if (symbol == "per-mille") {
            symbol <- I(context_permille_mark(context = context))
          } else if (symbol == "per-myriad") {
            symbol <- I(context_permyriad_mark(context = context))
          }
        }

        # Format values with a symbol string
        x_str <-
          format_symbol_str(
            x_abs_str = x_abs_str,
            x = x,
            context = context,
            symbol = symbol,
            incl_space = incl_space,
            placement = placement
          )

        # Format values in accounting notation (if `accounting = TRUE`)
        x_str <-
          format_as_accounting(
            x_str,
            x = x,
            context = context,
            accounting = accounting
          )

        # Paste the vector of suffixes to the right of the values
        x_str <- paste_right(x_str, x_right = suffix_df$suffix)

        # Force a positive sign on certain values if the option is taken
        if (!accounting && force_sign) {

          positive_x <- !is.na(x) & x > 0
          x_str[positive_x] <- paste_left(x_str[positive_x], x_left = "+")
        }

        x_str
      }
    )
  )
}

# fmt_percent() ----------------------------------------------------------------
#' Format values as a percentage
#'
#' @description
#'
#' With numeric values in a **gt** table, we can perform percentage-based
#' formatting. It is assumed the input numeric values are proportional values
#' and, in this case, the values will be automatically multiplied by `100`
#' before decorating with a percent sign (the other case is accommodated through
#' setting `scale_values = FALSE`). For more control over percentage
#' formatting, we can use the following options:
#'
#' - percent sign placement: the percent sign can be placed after or
#' before the values and a space can be inserted between the symbol and the
#' value.
#' - decimals: choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' - digit grouping separators: options to enable/disable digit separators
#' and provide a choice of separator symbol
#' - value scaling toggle: choose to disable automatic value scaling in the
#' situation that values are already scaled coming in (and just require the
#' percent symbol)
#' - pattern: option to use a text pattern for decoration of the formatted
#' values
#' - locale-based formatting: providing a locale ID will result in number
#' formatting specific to the chosen locale
#'
#' @inheritParams fmt_number
#'
#' @param scale_values *Multiply input values by 100*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   Should the values be scaled through multiplication by 100? By default this
#'   scaling is performed since the expectation is that incoming values are
#'   usually proportional. Setting to `FALSE` signifies that the values are
#'   already scaled and require only the percent sign when formatted.
#'
#' @param placement *Percent sign placement*
#'
#'   `singl-kw:[right|left]` // *default:* `"right"`
#'
#'   This option governs the placement of the percent sign. This can be either
#'   be `"right"` (the default) or `"left"`.
#'
#' @param incl_space *Include a space between the value and the % sign*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   An option for whether to include a space between the value and the percent
#'   sign. The default is to not introduce a space character.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_percent()` is compatible with body cells that are of the `"numeric"` or
#' `"integer"` types. Any other types of body cells are ignored during
#' formatting. This is to say that cells of incompatible data types may be
#' targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_percent()` to
#' obtain varying parameter values from a specified column within the table.
#' This means that each row could be formatted a little bit differently. These
#' arguments provide support for [from_column()]:
#'
#' - `decimals`
#' - `drop_trailing_zeros`
#' - `drop_trailing_dec_mark`
#' - `scale_values`
#' - `use_seps`
#' - `accounting`
#' - `pattern`
#' - `sep_mark`
#' - `dec_mark`
#' - `force_sign`
#' - `incl_space`
#' - `placement`
#' - `system`
#' - `locale`
#'
#' Please note that for all of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Adapting output to a specific `locale`:
#'
#' This formatting function can adapt outputs according to a provided `locale`
#' value. Examples include `"en"` for English (United States) and `"fr"` for
#' French (France). The use of a valid locale ID here means separator and
#' decimal marks will be correct for the given locale. Should any values be
#' provided in `sep_mark` or `dec_mark`, they will be overridden by the locale's
#' preferred values.
#'
#' Note that a `locale` value provided here will override any global locale
#' setting performed in [gt()]'s own `locale` argument (it is settable there as
#' a value received by all other functions that have a `locale` argument). As a
#' useful reference on which locales are supported, we can call[info_locales()]
#' to view an info table.
#'
#' @section Examples:
#'
#' Use a summarized version of the [`pizzaplace`] dataset to create a **gt**
#' table. With `fmt_percent()`, we can format the `frac_of_quota` column to
#' display values as percentages (to one decimal place).
#'
#' ```r
#' pizzaplace |>
#'   dplyr::mutate(month = as.numeric(substr(date, 6, 7))) |>
#'   dplyr::count(month, name = "pizzas_sold") |>
#'   dplyr::mutate(frac_of_quota = pizzas_sold / 4000) |>
#'   gt(rowname_col = "month") |>
#'   fmt_percent(
#'     columns = frac_of_quota,
#'     decimals = 1
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_percent_1.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-6
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @seealso The vector-formatting version of this function: [vec_fmt_percent()].
#'
#' @export
fmt_percent <- function(
    data,
    columns = everything(),
    rows = everything(),
    decimals = 2,
    drop_trailing_zeros = FALSE,
    drop_trailing_dec_mark = TRUE,
    scale_values = TRUE,
    use_seps = TRUE,
    min_sep_threshold = 1,
    accounting = FALSE,
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign = FALSE,
    placement = "right",
    incl_space = FALSE,
    system = c("intl", "ind"),
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - decimals
  # - drop_trailing_zeros
  # - drop_trailing_dec_mark
  # - scale_values
  # - use_seps
  # - min_sep_threshold
  # - accounting
  # - pattern
  # - sep_mark
  # - dec_mark
  # - force_sign
  # - incl_space
  # - placement
  # - system
  # - locale

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_percent",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_percent(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          decimals = p_i$decimals %||% decimals,
          drop_trailing_zeros = p_i$drop_trailing_zeros %||% drop_trailing_zeros,
          drop_trailing_dec_mark = p_i$drop_trailing_dec_mark %||% drop_trailing_dec_mark,
          scale_values = p_i$scale_values %||% scale_values,
          use_seps = p_i$use_seps %||% use_seps,
          min_sep_threshold = p_i$min_sep_threshold %||% min_sep_threshold,
          accounting = p_i$accounting %||% accounting,
          pattern = p_i$pattern %||% pattern,
          sep_mark = p_i$sep_mark %||% sep_mark,
          dec_mark = p_i$dec_mark %||% dec_mark,
          force_sign = p_i$force_sign %||% force_sign,
          incl_space = p_i$incl_space %||% incl_space,
          placement = p_i$placement %||% placement,
          system = p_i$system %||% system,
          locale = p_i$locale %||% locale
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Ensure that arguments are matched
  system <- rlang::arg_match0(system, values = c("intl", "ind"))

  # Stop function if `locale` does not have a valid value; normalize locale
  # and resolve one that might be set globally
  validate_locale(locale = locale)
  locale <- normalize_locale(locale = locale)
  locale <- resolve_locale(data = data, locale = locale)

  valid_class <- c("numeric", "integer", "integer64")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  if (scale_values) {
    scale_by <- 100
  } else {
    scale_by <- 1.0
  }

  # Use locale-based min_sep_threshold if a locale ID is provided
  min_sep_threshold <- get_locale_min_sep_threshold(locale, min_sep_threshold)

  # Pass `data`, `columns`, `rows`, and other options to `fmt_symbol()`
  fmt_symbol(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    symbol = "%",
    accounting = accounting,
    decimals = decimals,
    drop_trailing_zeros = drop_trailing_zeros,
    drop_trailing_dec_mark = drop_trailing_dec_mark,
    use_seps = use_seps,
    min_sep_threshold = min_sep_threshold,
    scale_by = scale_by,
    suffixing = FALSE,
    pattern = pattern,
    sep_mark = sep_mark,
    dec_mark = dec_mark,
    force_sign = force_sign,
    placement = placement,
    incl_space = incl_space,
    system = system,
    locale = locale
  )
}

# fmt_partsper() ---------------------------------------------------------------
#' Format values as parts-per quantities
#'
#' @description
#'
#' With numeric values in a **gt** table we can format the values so that they
#' are rendered as *per mille*, *ppm*, *ppb*, etc., quantities. The following
#' list of keywords (with associated naming and scaling factors) is available to
#' use within `fmt_partsper()`:
#'
#' - `"per-mille"`: Per mille, (1 part in `1,000`)
#' - `"per-myriad"`: Per myriad, (1 part in `10,000`)
#' - `"pcm"`: Per cent mille (1 part in `100,000`)
#' - `"ppm"`: Parts per million, (1 part in `1,000,000`)
#' - `"ppb"`: Parts per billion, (1 part in `1,000,000,000`)
#' - `"ppt"`: Parts per trillion, (1 part in `1,000,000,000,000`)
#' - `"ppq"`: Parts per quadrillion, (1 part in `1,000,000,000,000,000`)
#'
#' The function provides a lot of formatting control and we can use the
#' following options:
#'
#' - custom symbol/units: we can override the automatic symbol or units display
#' with our own choice as the situation warrants
#' - decimals: choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' - digit grouping separators: options to enable/disable digit separators
#' and provide a choice of separator symbol
#' - value scaling toggle: choose to disable automatic value scaling in the
#' situation that values are already scaled coming in (and just require the
#' appropriate symbol or unit display)
#' - pattern: option to use a text pattern for decoration of the formatted
#' values
#' - locale-based formatting: providing a locale ID will result in number
#' formatting specific to the chosen locale
#'
#' @inheritParams fmt_number
#'
#' @param to_units *Output Quantity*
#'
#'   `singl-kw:[per-mille|per-myriad|pcm|ppm|ppb|ppt|ppq]` // *default:* `"per-mille"`
#'
#'   A keyword that signifies the desired output quantity. This can be any from
#'   the following set: `"per-mille"`, `"per-myriad"`, `"pcm"`, `"ppm"`,
#'   `"ppb"`, `"ppt"`, or `"ppq"`.
#'
#' @param symbol *Symbol or units to use in output display*
#'
#'   `scalar<character>` // *default:* `"auto"`
#'
#'   The symbol/units to use for the quantity. By default, this is set to
#'   `"auto"` and **gt** will choose the appropriate symbol based on the
#'   `to_units` keyword and the output context. However, this can be changed by
#'   supplying a string (e.g, using `symbol = "ppbV"` when `to_units = "ppb"`).
#'
#' @param scale_values *Scale input values accordingly*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   Should the values be scaled through multiplication according to the keyword
#'   set in `to_units`? By default this is `TRUE` since the expectation is that
#'   normally values are proportions. Setting to `FALSE` signifies that the
#'   values are already scaled and require only the appropriate symbol/units
#'   when formatted.
#'
#' @param incl_space *Include a space between the value and the symbol/units*
#'
#'   `scalar<character>|scalar<logical>` // *default:* `"auto"`
#'
#'   An option for whether to include a space between the value and the
#'   symbol/units. The default is `"auto"` which provides spacing dependent on
#'   the mark itself. This can be directly controlled by using either `TRUE` or
#'   `FALSE`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_partsper()` is compatible with body cells that are of the `"numeric"` or
#' `"integer"` types. Any other types of body cells are ignored during
#' formatting. This is to say that cells of incompatible data types may be
#' targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_partsper()` to
#' obtain varying parameter values from a specified column within the table.
#' This means that each row could be formatted a little bit differently. These
#' arguments provide support for [from_column()]:
#'
#' - `to_units`
#' - `symbol`
#' - `decimals`
#' - `drop_trailing_zeros`
#' - `drop_trailing_dec_mark`
#' - `scale_values`
#' - `use_seps`
#' - `pattern`
#' - `sep_mark`
#' - `dec_mark`
#' - `force_sign`
#' - `incl_space`
#' - `system`
#' - `locale`
#'
#' Please note that for all of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Adapting output to a specific `locale`:
#'
#' This formatting function can adapt outputs according to a provided `locale`
#' value. Examples include `"en"` for English (United States) and `"fr"` for
#' French (France). The use of a valid locale ID here means separator and
#' decimal marks will be correct for the given locale. Should any values be
#' provided in `sep_mark` or `dec_mark`, they will be overridden by the locale's
#' preferred values.
#'
#' Note that a `locale` value provided here will override any global locale
#' setting performed in [gt()]'s own `locale` argument (it is settable there as
#' a value received by all other functions that have a `locale` argument). As a
#' useful reference on which locales are supported, we can call [info_locales()]
#' to view an info table.
#'
#' @section Examples:
#'
#' Create a tibble of small numeric values and generate a **gt** table. Format
#' the `a` column to appear in scientific notation with [fmt_scientific()] and
#' format the `b` column as *per mille* values with `fmt_partsper()`.
#'
#' ```r
#' dplyr::tibble(x = 0:-5, a = 10^(0:-5), b = a) |>
#'   gt(rowname_col = "x") |>
#'   fmt_scientific(a, decimals = 0) |>
#'   fmt_partsper(
#'     columns = b,
#'     to_units = "per-mille"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_partsper_1.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-7
#'
#' @section Function Introduced:
#' `v0.6.0` (May 24, 2022)
#'
#' @seealso The vector-formatting version of this function:
#'   [vec_fmt_partsper()].
#'
#' @export
fmt_partsper <- function(
    data,
    columns = everything(),
    rows = everything(),
    to_units = c("per-mille", "per-myriad", "pcm", "ppm", "ppb", "ppt", "ppq"),
    symbol = "auto",
    decimals = 2,
    drop_trailing_zeros = FALSE,
    drop_trailing_dec_mark = TRUE,
    scale_values = TRUE,
    use_seps = TRUE,
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign = FALSE,
    incl_space = "auto",
    system = c("intl", "ind"),
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - to_units
  # - symbol
  # - decimals
  # - drop_trailing_zeros
  # - drop_trailing_dec_mark
  # - scale_values
  # - use_seps
  # - pattern
  # - sep_mark
  # - dec_mark
  # - force_sign
  # - incl_space
  # - system
  # - locale

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_partsper",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_partsper(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          to_units = p_i$to_units %||% to_units,
          symbol = p_i$symbol %||% symbol,
          decimals = p_i$decimals %||% decimals,
          drop_trailing_zeros = p_i$drop_trailing_zeros %||% drop_trailing_zeros,
          drop_trailing_dec_mark = p_i$drop_trailing_dec_mark %||% drop_trailing_dec_mark,
          scale_values = p_i$scale_values %||% scale_values,
          use_seps = p_i$use_seps %||% use_seps,
          pattern = p_i$pattern %||% pattern,
          sep_mark = p_i$sep_mark %||% sep_mark,
          dec_mark = p_i$dec_mark %||% dec_mark,
          force_sign = p_i$force_sign %||% force_sign,
          incl_space = p_i$incl_space %||% incl_space,
          system = p_i$system %||% system,
          locale = p_i$locale %||% locale
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Ensure that arguments are matched
  to_units <-
    rlang::arg_match0(
      to_units,
      values = c("per-mille", "per-myriad", "pcm", "ppm", "ppb", "ppt", "ppq")
    )
  system <- rlang::arg_match0(system, values = c("intl", "ind"))

  # Stop function if `locale` does not have a valid value; normalize locale
  # and resolve one that might be set globally
  validate_locale(locale = locale)
  locale <- normalize_locale(locale = locale)
  locale <- resolve_locale(data = data, locale = locale)

  valid_class <- c("numeric", "integer", "integer64")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  # Scale values according to `to_units` value
  if (scale_values) {

    scale_by <-
      switch(
        to_units,
        `per-mille` = 1E3,
        `per-myriad` = 1E4,
        pcm = 1E5,
        ppm = 1E6,
        ppb = 1E9,
        ppt = 1E12,
        ppq = 1E15,
      )

  } else {
    scale_by <- 1.0
  }

  if (symbol == "auto") {

    symbol <-
      switch(
        to_units,
        `per-mille` = "per-mille",
        `per-myriad` = "per-myriad",
        pcm = "pcm",
        ppm = "ppm",
        ppb = "ppb",
        ppt = "ppt",
        ppq = "ppq"
      )
  }

  if (incl_space == "auto") {

    incl_space <-
      switch(
        to_units,
        `per-mille` = ,
        `per-myriad` = FALSE,
        pcm = ,
        ppm = ,
        ppb = ,
        ppt = ,
        ppq = TRUE
      )
  }

  # Pass `data`, `columns`, `rows`, and other options to `fmt_symbol()`
  fmt_symbol(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    symbol = symbol,
    accounting = FALSE,
    decimals = decimals,
    drop_trailing_zeros = drop_trailing_zeros,
    drop_trailing_dec_mark = drop_trailing_dec_mark,
    use_seps = use_seps,
    scale_by = scale_by,
    suffixing = FALSE,
    pattern = pattern,
    sep_mark = sep_mark,
    dec_mark = dec_mark,
    force_sign = force_sign,
    placement = "right",
    incl_space = incl_space,
    system = system,
    locale = locale
  )
}

# fmt_fraction() ---------------------------------------------------------------
#' Format values as mixed fractions
#'
#' @description
#'
#' With numeric values in a **gt** table, we can perform mixed-fraction-based
#' formatting. There are several options for setting the accuracy of the
#' fractions. Furthermore, there is an option for choosing a layout (i.e.,
#' typesetting style) for the mixed-fraction output.
#'
#' The following options are available for controlling this type of formatting:
#'
#' - accuracy: how to express the fractional part of the mixed fractions; there
#' are three keyword options for this and an allowance for arbitrary denominator
#' settings
#' - simplification: an option to simplify fractions whenever possible
#' - layout: We can choose to output values with diagonal or inline fractions
#' - digit grouping separators: options to enable/disable digit separators
#' and provide a choice of separator symbol for the whole number portion
#' - pattern: option to use a text pattern for decoration of the formatted
#' mixed fractions
#' - locale-based formatting: providing a locale ID will result in number
#' formatting specific to the chosen locale
#'
#' @inheritParams fmt_number
#'
#' @param accuracy *Accuracy of fractions*
#'
#'   `singl-kw:[low|med|high]|scalar<numeric|integer>(val>=1)` // *default:* `"low"`
#'
#'   The type of fractions to generate. This can either be one of the keywords
#'   `"low"`, `"med"`, or `"high"` (to generate fractions with denominators of
#'   up to 1, 2, or 3 digits, respectively) or an integer value greater than
#'   zero to obtain fractions with a fixed denominator (`2` yields halves, `3`
#'   is for thirds, `4` is quarters, etc.). For the latter option, using
#'   `simplify = TRUE` will simplify fractions where possible (e.g., `2/4` will
#'   be simplified as `1/2`). By default, the `"low"` option is used.
#'
#' @param simplify *Simplify the fraction*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   If choosing to provide a numeric value for `accuracy`, the option to
#'   simplify the fraction (where possible) can be taken with `TRUE` (the
#'   default). With `FALSE`, denominators in fractions will be fixed to the
#'   value provided in `accuracy`.
#'
#' @param layout *Layout of fractions in HTML output*
#'
#'   `singl-kw:[inline|diagonal]` // *default:* `"inline"`
#'
#'   For HTML output, the `"inline"` layout is the default. This layout places
#'   the numerals of the fraction on the baseline and uses a standard slash
#'   character. The `"diagonal"` layout will generate fractions that are typeset
#'   with raised/lowered numerals and a virgule.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_fraction()` is compatible with body cells that are of the `"numeric"` or
#' `"integer"` types. Any other types of body cells are ignored during
#' formatting. This is to say that cells of incompatible data types may be
#' targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_fraction()` to
#' obtain varying parameter values from a specified column within the table.
#' This means that each row could be formatted a little bit ifferently. These
#' arguments provide support for [from_column()]:
#'
#' - `accuracy`
#' - `simplify`
#' - `layout`
#' - `use_seps`
#' - `pattern`
#' - `sep_mark`
#' - `system`
#' - `locale`
#'
#' Please note that for all of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Adapting output to a specific `locale`:
#'
#' This formatting function can adapt outputs according to a provided `locale`
#' value. Examples include `"en"` for English (United States) and `"fr"` for
#' French (France). The use of a valid locale ID here means separator and
#' decimal marks will be correct for the given locale. Should any value be
#' provided in `sep_mark`, it will be overridden by the locale's preferred
#' values.
#'
#' Note that a `locale` value provided here will override any global locale
#' setting performed in [gt()]'s own `locale` argument (it is settable there as
#' a value received by all other functions that have a `locale` argument). As a
#' useful reference on which locales are supported, we can call [info_locales()]
#' to view an info table.
#'
#' @section Examples:
#'
#' Using a summarized version of the [`pizzaplace`] dataset, let's create a
#' **gt** table. With `fmt_fraction()` we can format the `f_sold` and `f_income`
#' columns to display fractions. As for how the fractions are represented, we
#' are electing to use `accuracy = 10`. This gives all fractions as tenths.
#' We won't simplify the fractions (by using `simplify = FALSE`) and this means
#' that a fraction like `5/10` won't become `1/2`. With `layout ="diagonal"`,
#' we get a diagonal display of all fractions.
#'
#' ```r
#' pizzaplace |>
#'   dplyr::group_by(type, size) |>
#'   dplyr::summarize(
#'     sold = dplyr::n(),
#'     income = sum(price),
#'     .groups = "drop_last"
#'   ) |>
#'   dplyr::group_by(type) |>
#'   dplyr::mutate(
#'     f_sold = sold / sum(sold),
#'     f_income = income / sum(income),
#'   ) |>
#'   dplyr::arrange(type, dplyr::desc(income)) |>
#'   gt(rowname_col = "size") |>
#'   tab_header(
#'     title = "Pizzas Sold in 2015",
#'     subtitle = "Fraction of Sell Count and Revenue by Size per Type"
#'   ) |>
#'   fmt_integer(columns = sold) |>
#'   fmt_currency(columns = income) |>
#'   fmt_fraction(
#'     columns = starts_with("f_"),
#'     accuracy = 10,
#'     simplify = FALSE,
#'     layout = "diagonal"
#'   ) |>
#'   sub_missing(missing_text = "") |>
#'   tab_spanner(
#'     label = "Sold",
#'     columns = contains("sold")
#'   ) |>
#'   tab_spanner(
#'     label = "Revenue",
#'     columns = contains("income")
#'   ) |>
#'   text_transform(
#'     locations = cells_body(),
#'     fn = function(x) {
#'       dplyr::case_when(
#'         x == 0 ~ "<em>nil</em>",
#'         x != 0 ~ x
#'       )
#'     }
#'   ) |>
#'   cols_label(
#'     sold = "Amount",
#'     income = "Amount",
#'     f_sold = md("_f_"),
#'     f_income = md("_f_")
#'   ) |>
#'   cols_align(align = "center", columns = starts_with("f")) |>
#'   tab_options(
#'     table.width = px(400),
#'     row_group.as_column = TRUE
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_fraction_1.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-8
#'
#' @section Function Introduced:
#' `v0.4.0` (February 15, 2022)
#'
#' @seealso The vector-formatting version of this function:
#'   [vec_fmt_fraction()].
#'
#' @export
fmt_fraction <- function(
    data,
    columns = everything(),
    rows = everything(),
    accuracy = NULL,
    simplify = TRUE,
    layout = c("inline", "diagonal"),
    use_seps = TRUE,
    pattern = "{x}",
    sep_mark = ",",
    system = c("intl", "ind"),
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - accuracy
  # - simplify
  # - layout
  # - use_seps
  # - pattern
  # - sep_mark
  # - system
  # - locale

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_fraction",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_fraction(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          accuracy = p_i$accuracy %||% accuracy,
          simplify = p_i$simplify %||% simplify,
          layout = p_i$layout %||% layout,
          use_seps = p_i$use_seps %||% use_seps,
          pattern = p_i$pattern %||% pattern,
          sep_mark = p_i$sep_mark %||% sep_mark,
          system = p_i$system %||% system,
          locale = p_i$locale %||% locale
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Ensure that arguments are matched
  system <- rlang::arg_match0(system, values = c("intl", "ind"))
  layout <- rlang::arg_match0(layout, values = c("inline", "diagonal"))

  # Stop function if `locale` does not have a valid value; normalize locale
  # and resolve one that might be set globally
  validate_locale(locale = locale)
  locale <- normalize_locale(locale = locale)
  locale <- resolve_locale(data = data, locale = locale)

  # Use "low" as default for accuracy
  accuracy <- accuracy %||% "low"

  if (is.character(accuracy)) {

    rlang::arg_match0(accuracy, c("low", "med", "high"))

  } else if (is.numeric(accuracy)) {

    check_number_whole(accuracy, min = 1, allow_infinite = FALSE)
  } else {

    cli::cli_abort(c(
      "The input for `accuracy` is invalid.",
      "*" = "Must be a keyword \"low\", \"med\", or \"high\", or",
      "*" = "Must be an integer value greater than zero."
    ))
  }

  valid_class <- c("numeric", "integer", "integer64")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  # Use locale-based `sep_mark` if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = valid_class,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      format_fn = function(x, context) {

        # Get the correct minus mark based on the output context
        minus_mark <- context_minus_mark(context = context)

        # Generate a vector of empty strings that will eventually contain
        # all of the fractional parts of the finalized numbers
        fraction_x <- rep_len("", length(x))

        # Round all values of x to 3 digits with the R-H-U method of
        # rounding (for reproducibility purposes)
        x <- round_gt(x, 3)

        # Determine which of `x` are finite values
        x_is_a_number <- is.finite(x)

        # Divide the `x` values in 'big' and 'small' components; delay the
        # formatting of `big_x` until it is appropriately rounded on the
        # basis of the fractions obtained at the desired accuracy
        big_x <- trunc(x)
        small_x <- abs(x - big_x)

        if (is.numeric(accuracy)) {

          fraction_x[x_is_a_number] <-
            make_frac(
              x[x_is_a_number],
              denom = accuracy,
              simplify = simplify
            )

        } else {

          # Format the 'small' portion of the numeric values
          # to character-based numbers with exactly 3 decimal places
          small_x_str <- as.character(small_x)
          small_x_str[x_is_a_number] <-
            format_num_to_str(
              small_x[x_is_a_number],
              context = context, decimals = 3, n_sigfig = NULL,
              sep_mark = ",", dec_mark = ".",
              drop_trailing_zeros = FALSE,
              drop_trailing_dec_mark = TRUE,
              format = "f"
            )

          # For every `small_x` value that corresponds to a number
          # (i.e., not Inf), get the fractional part from the `fractions`
          # lookup table
          fraction_x[x_is_a_number] <-
            fractions[(as.numeric(small_x_str[x_is_a_number]) * 1000) + 1, accuracy, drop = TRUE]
        }

        # Round up or down the `big_x` values when necessary; values
        # of exactly "1" indicate a requirement for rounding and this
        # is a two-pass operation to handle positive and then negative
        # values of `big_x`
        big_x[big_x >= 0 & fraction_x == "1"] <-
          big_x[big_x >= 0 & fraction_x == "1"] + 1

        big_x[big_x <= 0 & fraction_x == "1"] <-
          big_x[big_x <= 0 & fraction_x == "1"] - 1

        # Remove whole number values from `fraction_x`; they were only
        # needed for rounding guidance and they signal the lack of a
        # fractional part
        fraction_x[fraction_x %in% c("0", "1")] <- ""

        # Format the 'big' portion of the numeric values
        # to character-based numbers
        big_x <-
          format_num_to_str(
            big_x,
            context = context,
            decimals = 0,
            n_sigfig = NULL,
            sep_mark = sep_mark,
            dec_mark = "",
            drop_trailing_zeros = TRUE,
            drop_trailing_dec_mark = TRUE,
            format = "f",
            system = system
          )

        # Initialize a vector that will contain the finalized strings
        x_str <- character(length(x))

        # Generate the mixed fractions by pasting `big_x` and `small_x`
        # while ensuring there is a single space between these components
        x_str[x_is_a_number] <-
          paste(
            big_x[x_is_a_number],
            fraction_x[x_is_a_number],
            sep = " "
          )

        # Trim any whitespace
        x_str <- gsub("(^ | $)", "", x_str)

        # Eliminate the display of leading zeros in mixed fractions
        x_str <- gsub("^0\\s+?", "", x_str)

        # There are situations where small fractions (not mixed) require
        # a minus mark; these conditions are specific so we need to ascertain
        # which values in `x_str` require this and then apply the mark to
        # the targets
        x_is_negative <- x < 0
        x_is_zero <- x_str == "0"
        x_has_minus_mark <- grepl(minus_mark, big_x)
        x_needs_minus_mark <- x_is_negative & !x_is_zero & !x_has_minus_mark

        x_str[x_needs_minus_mark] <- paste0(minus_mark, x_str[x_needs_minus_mark])

        # Generate diagonal fractions if the `layout = "diagonal"` option was chosen
        if (layout == "diagonal") {

          has_a_fraction <- grepl("/", x_str, fixed = TRUE)

          non_fraction_part <- gsub("^(.*?)[0-9]*/[0-9]*", "\\1", x_str[has_a_fraction])

          fraction_part <- gsub("^(.*?)([0-9]*/[0-9]*)", "\\2", x_str[has_a_fraction])

          num_vec <- unlist(lapply(strsplit(fraction_part, "/", fixed = TRUE), `[[`, 1))
          denom_vec <- unlist(lapply(strsplit(fraction_part, "/", fixed = TRUE), `[[`, 2))

          if (context == "html") {

            narrow_no_break_space_char <- "\U0202F"
            slash_mark_char <- "\U02044"

            num_vec <-
              paste0(
                "<span style=\"",
                "font-size:0.6em;",
                "line-height:0.6em;",
                "vertical-align:0.45em;",
                "\">",
                num_vec,
                "</span>"
              )

            denom_vec <-
              paste0(
                "<span style=\"",
                "font-size:0.6em;",
                "line-height:0.6em;",
                "vertical-align:-0.05em;",
                "\">",
                denom_vec,
                "</span>"
              )

            slash_mark <-
              paste0(
                "<span style=\"",
                "font-size:0.7em;",
                "line-height:0.7em;",
                "vertical-align:0.15em;",
                "\">",
                slash_mark_char,
                "</span>"
              )

            x_str[has_a_fraction] <-
              paste0(
                gsub(" ", narrow_no_break_space_char, non_fraction_part),
                num_vec, slash_mark, denom_vec
              )

          } else if (context == "latex") {

            x_str[has_a_fraction] <-
              paste0(
                gsub(" ", "", non_fraction_part),
                paste0("\\textsuperscript{", num_vec, "}\\!/\\textsubscript{", denom_vec, "}")
              )

          } else if (context == "rtf") {

            x_str[has_a_fraction] <-
              paste0(
                gsub(" ", "", non_fraction_part),
                paste0("{\\super ", num_vec, "}/{\\sub ", denom_vec, "}")
              )
          }
        }

        # For the `layout = "inline"` option, LaTeX outputs in math mode
        # disregard space characters so the `\ ` spacing command must used
        if (layout == "inline" && context == "latex") {
          x_str <- gsub(" ", "\\\\ ", x_str)
        }

        # In rare cases that Inf or -Inf appear, ensure that these
        # special values are printed correctly
        x_str[is.infinite(x)] <- x[is.infinite(x)]

        x_str
      }
    )
  )
}

gcd <- function(x,y) {
  r <- x %% y
  ifelse(r, gcd(y, r), y)
}

make_frac <- function(x, denom, simplify = TRUE) {

  big_x <- trunc(x)
  small_x <- abs(x - big_x)

  numer <- round_gt(small_x * denom)

  if (simplify) {
    denom <- rep_len(denom, length(x))
    factor <- gcd(numer, denom)
    numer <- numer / factor
    denom <- denom / factor
  }

  ifelse(
    numer == denom, "1",
    ifelse(
      numer == 0, "0",
      paste0(
        format_num_to_str(
          numer,
          context = "plain",
          decimals = 0,
          n_sigfig = NULL,
          sep_mark = "",
          dec_mark = ".",
          drop_trailing_zeros = TRUE,
          drop_trailing_dec_mark = TRUE,
          format = "f"
        ),
        "/",
        format_num_to_str(
          denom,
          context = "plain",
          decimals = 0,
          n_sigfig = NULL,
          sep_mark = "",
          dec_mark = ".",
          drop_trailing_zeros = TRUE,
          drop_trailing_dec_mark = TRUE,
          format = "f"
        )
      )
    )
  )
}

# The `round_gt()` function is used in gt over `base::round()` for consistency
# in rounding across R versions; it uses the 'Round-Half-Up' (R-H-U) algorithm,
# which is *not* used in R >= 4.0
round_gt <- function(x, digits = 0) {

  x_sign <- sign(x)
  z <- abs(x) * 10^digits
  z <- 0.5 + z + sqrt(.Machine$double.eps)
  z <- trunc(z)
  z <- z / 10^digits
  z * x_sign
}

# fmt_currency() ---------------------------------------------------------------
#' Format values as currencies
#'
#' @description
#'
#' With numeric values in a **gt** table, we can perform currency-based
#' formatting with `fmt_currency()`. The function supports both
#' automatic formatting with either a three-letter or a numeric currency code.
#' We can also specify a custom currency that is formatted according to one or
#' more output contexts with the [currency()] helper function. We have fine
#' control over the conversion from numeric values to currency values, where we
#' could take advantage of the following options:
#'
#' - the currency: providing a currency code or common currency name will
#' procure the correct currency symbol and number of currency subunits; we could
#' also use the [currency()] helper function to specify a custom currency
#' - currency symbol placement: the currency symbol can be placed before
#' or after the values
#' - decimals/subunits: choice of the number of decimal places, and a
#' choice of the decimal symbol, and an option on whether to include or exclude
#' the currency subunits (the decimal portion)
#' - negative values: choice of a negative sign or parentheses for values
#' less than zero
#' - digit grouping separators: options to enable/disable digit separators
#' and provide a choice of separator symbol
#' - scaling: we can choose to scale targeted values by a multiplier value
#' - large-number suffixing: larger figures (thousands, millions, etc.) can
#' be autoscaled and decorated with the appropriate suffixes
#' - pattern: option to use a text pattern for decoration of the formatted
#' currency values
#' - locale-based formatting: providing a locale ID will result in currency
#' formatting specific to the chosen locale; it will also retrieve the locale's
#' currency if none is explicitly given
#'
#' We can call [info_currencies()] for a useful reference on all of the valid
#' inputs to the `currency` argument.
#'
#' @inheritParams fmt_number
#'
#' @param currency *Currency to use*
#'
#'   `scalar<character>|obj:<gt_currency>` // *default:* `NULL` (`optional`)
#'
#'   The currency to use for the numeric value. This input can be
#'   supplied as a 3-letter currency code (e.g., `"USD"` for U.S. Dollars,
#'   `"EUR"` for the Euro currency). Use [info_currencies()] to get an
#'   information table with all of the valid currency codes and examples of
#'   each. Alternatively, we can provide a general currency type (e.g.,
#'   `"dollar"`, `"pound"`, `"yen"`, etc.) to simplify the process. Use
#'   [info_currencies()] with the `type == "symbol"` option to view an
#'   information table with all of the supported currency symbol names along
#'   with examples.
#'
#'   We can also use the [currency()] helper function to specify a custom
#'   currency, where the string could vary across output contexts. For example,
#'   using `currency(html = "&fnof;", default = "f")` would give us a suitable
#'   glyph for the Dutch guilder in an HTML output table, and it would simply be
#'   the letter "f" in all other output contexts). Please note that `decimals`
#'   will default to `2` when using the [currency()] helper function.
#'
#'   If nothing is provided here but a `locale` value has been set (either in
#'   this function call or as part of the initial [gt()] call), the currency
#'   will be obtained from that locale. Virtually all locales are linked to a
#'   territory that is a country (use [info_locales()] for details on all
#'   locales used in this package), so, the in-use (or *de facto*) currency will
#'   be obtained. As the default locale is `"en"`, the `"USD"` currency will be
#'   used if neither a `locale` nor a `currency` value is given.
#'
#' @param use_subunits *Show or hide currency subunits*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   An option for whether the subunits portion of a currency value should be
#'   displayed. For example, with an input value of `273.81`, the default
#'   formatting will produce `"$273.81"`. Removing the subunits (with
#'   `use_subunits = FALSE`) will give us `"$273"`.
#'
#' @param decimals *Number of decimal places*
#'
#'   `scalar<numeric|integer>(val>=0)` // *default:* `NULL` (`optional`)
#'
#'   The `decimals` values corresponds to the exact number of decimal places to
#'   use. This value is optional as a currency has an intrinsic number of
#'   decimal places (i.e., the subunits). A value such as `2.34` can, for
#'   example, be formatted with `0` decimal places and if the currency used is
#'   `"USD"` it would result in `"$2"`. With `4` decimal places, the formatted
#'   value becomes `"$2.3400"`.
#'
#' @param drop_trailing_dec_mark *Drop the trailing decimal mark*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   A logical value that determines whether decimal marks should always appear
#'   even if there are no decimal digits to display after formatting. For
#'   example, when `use_subunits = FALSE` or `decimals = 0` a formatted value
#'   such as `"$23"` can be fashioned as `"$23."` by setting
#'   `drop_trailing_dec_mark = FALSE`.
#'
#' @param placement *Currency symbol placement*
#'
#'   `singl-kw:[left|right]` // *default:* `"left"`
#'
#'   The placement of the currency symbol. This can be either be `"left"` (as
#'   in `"$450"`) or `"right"` (which yields `"450$"`).
#'
#' @param incl_space *Include a space between the value and the currency symbol*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   An option for whether to include a space between the value and the currency
#'   symbol. The default is to not introduce a space character.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_currency()` is compatible with body cells that are of the `"numeric"`,
#' `"integer"`, or `"integer64"` types. Any other types of body cells are
#' ignored during formatting. This is to say that cells of incompatible data
#' types may be targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_currency()` to
#' obtain varying parameter values from a specified column within the table.
#' This means that each row could be formatted a little bit differently. These
#' arguments provide support for [from_column()]:
#'
#' - `currency`
#' - `use_subunits`
#' - `decimals`
#' - `drop_trailing_dec_mark`
#' - `use_seps`
#' - `accounting`
#' - `scale_by`
#' - `suffixing`
#' - `pattern`
#' - `sep_mark`
#' - `dec_mark`
#' - `force_sign`
#' - `placement`
#' - `incl_space`
#' - `system`
#' - `locale`
#'
#' Please note that for all of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Adapting output to a specific `locale`:
#'
#' This formatting function can adapt outputs according to a provided `locale`
#' value. Examples include `"en"` for English (United States) and `"fr"` for
#' French (France). The use of a locale ID here means separator and
#' decimal marks will be correct for the given locale. Should any values be
#' provided in `sep_mark` or `dec_mark`, they will be overridden by the locale's
#' preferred values. In addition to number formatting, providing a `locale`
#' value and not providing a `currency` allows **gt** to obtain the currency
#' code from the locale's territory.
#'
#' Note that a `locale` value provided here will override any global locale
#' setting performed in [gt()]'s own `locale` argument (it is settable there as
#' a value received by all other functions that have a `locale` argument). As a
#' useful reference on which locales are supported, we can call [info_locales()]
#' to view an info table.
#'
#' @section Examples:
#'
#' Let's make a simple **gt** table from the [`exibble`] dataset. We'll keep
#' only the `num` and `currency`, columns, then, format those columns using
#' `fmt_currency()` (with the `"JPY"` and `"GBP"` currencies).
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, currency) |>
#'   gt() |>
#'   fmt_currency(
#'     columns = num,
#'     currency = "JPY"
#'   ) |>
#'   fmt_currency(
#'     columns = currency,
#'     currency = "GBP"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_currency_1.png")`
#' }}
#'
#' Let's take a single column from [`exibble`] (`currency`) and format it with a
#' currency name (this differs from the 3-letter currency code). In this case,
#' we'll use the `"euro"` currency and set the placement of the symbol to the
#' right of any value. Additionally, the currency symbol will separated from the
#' value with a single space character (using `incl_space = TRUE`).
#'
#' ```r
#' exibble |>
#'   dplyr::select(currency) |>
#'   gt() |>
#'   fmt_currency(
#'     currency = "euro",
#'     placement = "right",
#'     incl_space = TRUE
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_currency_2.png")`
#' }}
#'
#' With the [`pizzaplace`] dataset, let's make a summary table that gets the
#' number of `"hawaiian"` pizzas sold (and revenue generated) by month. In the
#' **gt** table, we'll format only the `revenue` column. The `currency` value is
#' automatically U.S. Dollars when don't supply either a currency code or a
#' locale. We'll also create a grand summary with [grand_summary_rows()]. Within
#' that summary row, the total revenue needs to be formatted with
#' `fmt_currency()` and we can do that within the `fmt` argument.
#'
#' ```r
#' pizzaplace |>
#'   dplyr::filter(name == "hawaiian") |>
#'   dplyr::mutate(month = lubridate::month(date, label = TRUE, abbr = TRUE)) |>
#'   dplyr::select(month, price) |>
#'   dplyr::group_by(month) |>
#'   dplyr::summarize(
#'     `number sold` = dplyr::n(),
#'     revenue = sum(price)
#'   ) |>
#'   gt(rowname_col = "month") |>
#'   tab_header(title = "Summary of Hawaiian Pizzas Sold by Month") |>
#'   fmt_currency(columns = revenue) |>
#'   grand_summary_rows(
#'     fns = list(label = "Totals:", id = "totals", fn = "sum"),
#'     fmt = ~ fmt_currency(., columns = revenue),
#'   ) |>
#'   opt_all_caps()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_currency_3.png")`
#' }}
#'
#' If supplying a `locale` value to `fmt_currency()`, we can opt use the
#' locale's assumed currency and not have to supply a `currency` value (doing so
#' would override the locale's default currency). With a column of locale
#' values, we can format currency values on a row-by-row basis through the use
#' of [from_column()]. Here, we'll reference the `locale` column in the argument
#' of the same name.
#'
#' ```r
#' dplyr::tibble(
#'   amount = rep(50.84, 5),
#'   currency = c("JPY", "USD", "GHS", "KRW", "CNY"),
#'   locale = c("ja", "en", "ee", "ko", "zh"),
#' ) |>
#'   gt() |>
#'   fmt_currency(
#'     columns = amount,
#'     locale = from_column(column = "locale")
#'   ) |>
#'   cols_hide(columns = locale)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_currency_4.png")`
#' }}
#'
#' We can similarly use [from_column()] to reference a column that has currency
#' code values. Here's an example of how to create a simple currency conversion
#' table. The `curr` column contains the 3-letter currency codes, and that
#' column is referenced via [from_column()] in the `currency` argument of
#' `fmt_currency()`.
#'
#' ```r
#' dplyr::tibble(
#'   flag = c("EU", "GB", "CA", "AU", "JP", "IN"),
#'   curr = c("EUR", "GBP", "CAD", "AUD", "JPY", "INR"),
#'   conv = c(
#'     0.912952, 0.787687, 1.34411,
#'     1.53927, 144.751, 82.9551
#'   )
#' ) |>
#'   gt() |>
#'   fmt_currency(
#'     columns = conv,
#'     currency = from_column(column = "curr")
#'   ) |>
#'   fmt_flag(columns = flag) |>
#'   cols_merge(columns = c(flag, curr)) |>
#'   cols_label(
#'     flag = "Currency",
#'     conv = "Amount"
#'   ) |>
#'   tab_header(
#'     title = "Conversion of 1 USD to Six Other Currencies",
#'     subtitle = md("Conversion rates obtained on **Aug 13, 2023**")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_currency_5.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-9
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @seealso The vector-formatting version of this function:
#'   [vec_fmt_currency()].
#'
#' @export
fmt_currency <- function(
    data,
    columns = everything(),
    rows = everything(),
    currency = NULL,
    use_subunits = TRUE,
    decimals = NULL,
    drop_trailing_dec_mark = TRUE,
    use_seps = TRUE,
    min_sep_threshold = 1,
    accounting = FALSE,
    scale_by = 1.0,
    suffixing = FALSE,
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign = FALSE,
    placement = "left",
    incl_space = FALSE,
    system = c("intl", "ind"),
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - currency
  # - use_subunits
  # - decimals
  # - drop_trailing_dec_mark
  # - use_seps
  # - min_sep_threshold
  # - accounting
  # - scale_by
  # - suffixing
  # - pattern
  # - sep_mark
  # - dec_mark
  # - force_sign
  # - placement
  # - incl_space
  # - system
  # - locale

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_currency",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_currency(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          currency = p_i$currency %||% currency,
          use_subunits = p_i$use_subunits %||% use_subunits,
          decimals = p_i$decimals %||% decimals,
          drop_trailing_dec_mark = p_i$drop_trailing_dec_mark %||% drop_trailing_dec_mark,
          use_seps = p_i$use_seps %||% use_seps,
          min_sep_threshold = p_i$min_sep_threshold %||% min_sep_threshold,
          accounting = p_i$accounting %||% accounting,
          scale_by = p_i$scale_by %||% scale_by,
          suffixing = p_i$suffixing %||% suffixing,
          pattern = p_i$pattern %||% pattern,
          sep_mark = p_i$sep_mark %||% sep_mark,
          dec_mark = p_i$dec_mark %||% dec_mark,
          force_sign = p_i$force_sign %||% force_sign,
          placement = p_i$placement %||% placement,
          incl_space = p_i$incl_space %||% incl_space,
          system = p_i$system %||% system,
          locale = p_i$locale %||% locale
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Ensure that arguments are matched
  system <- rlang::arg_match0(system, values = c("intl", "ind"))

  # Stop function if `locale` does not have a valid value; normalize locale
  # and resolve one that might be set globally
  validate_locale(locale = locale)
  locale <- normalize_locale(locale = locale)
  locale <- resolve_locale(data = data, locale = locale)

  valid_class <- c("numeric", "integer", "integer64")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  # Resolve the currency either from direct input in `currency` or
  # through a locale
  currency <- currency %||% get_locale_currency_code(locale = locale)

  # Stop function if `currency` does not have a valid value
  validate_currency(currency = currency)

  # Get the number of decimal places
  decimals <-
    get_currency_decimals(
      currency = currency,
      decimals = decimals,
      use_subunits = use_subunits
    )

  # Use locale-based min_sep_threshold if a locale ID is provided
  min_sep_threshold <- get_locale_min_sep_threshold(locale, min_sep_threshold)

  # Pass `data`, `columns`, `rows`, and other options to `fmt_symbol()`
  fmt_symbol(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    symbol = currency,
    accounting = accounting,
    decimals = decimals,
    drop_trailing_zeros = FALSE,
    drop_trailing_dec_mark = drop_trailing_dec_mark,
    use_seps = use_seps,
    min_sep_threshold = min_sep_threshold,
    scale_by = scale_by,
    suffixing = suffixing,
    pattern = pattern,
    sep_mark = sep_mark,
    dec_mark = dec_mark,
    force_sign = force_sign,
    placement = placement,
    incl_space = incl_space,
    system = system,
    locale = locale
  )
}

# fmt_roman() ------------------------------------------------------------------
#' Format values as Roman numerals
#'
#' @description
#'
#' With numeric values in a **gt** table we can transform those to Roman
#' numerals, rounding values as necessary.
#'
#' @inheritParams fmt_number
#'
#' @param case *Use uppercase or lowercase letters*
#'
#'   `singl-kw:[upper|lower]` // *default:* `"upper"`
#'
#'   Should Roman numerals should be rendered as uppercase (`"upper"`) or
#'   lowercase (`"lower"`) letters? By default, this is set to `"upper"`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_roman()` is compatible with body cells that are of the `"numeric"` or
#' `"integer"` types. Any other types of body cells are ignored during
#' formatting. This is to say that cells of incompatible data types may be
#' targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_roman()` to obtain
#' varying parameter values from a specified column within the table. This means
#' that each row could be formatted a little bit differently. These arguments
#' provide support for [from_column()]:
#'
#' - `case`
#' - `pattern`
#'
#' Please note that for both of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Examples:
#'
#' Create a tibble of small numeric values and generate a **gt** table. Format
#' the `roman` column to appear as Roman numerals with `fmt_roman()`.
#'
#' ```r
#' dplyr::tibble(arabic = c(1, 8, 24, 85), roman = arabic) |>
#'   gt(rowname_col = "arabic") |>
#'   fmt_roman(columns = roman)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_roman_1.png")`
#' }}
#'
#' Formatting values to Roman numerals can be very useful when combining such
#' output with row labels (usually through [cols_merge()]). Here's an example
#' where we take a portion of the [`illness`] dataset and generate some row
#' labels that combine (1) a row number (in lowercase Roman numerals), (2) the
#' name of the test, and (3) the measurement units for the test (nicely
#' formatted by way of [fmt_units()]):
#'
#' ```r
#' illness |>
#'   dplyr::slice_head(n = 6) |>
#'   gt(rowname_col = "test") |>
#'   fmt_units(columns = units) |>
#'   cols_hide(columns = starts_with("day")) |>
#'   sub_missing(missing_text = "") |>
#'   cols_merge_range(col_begin = norm_l, col_end = norm_u) |>
#'   cols_add(i = 1:6) |>
#'   fmt_roman(columns = i, case = "lower", pattern = "{x}.") |>
#'   cols_merge(columns = c(test, i, units), pattern = "{2} {1} ({3})") |>
#'   cols_label(norm_l = "Normal Range") |>
#'   tab_stubhead(label = "Test")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_roman_2.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-10
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @seealso The vector-formatting version of this function: [vec_fmt_roman()].
#'
#' @export
fmt_roman <- function(
    data,
    columns = everything(),
    rows = everything(),
    case = c("upper", "lower"),
    pattern = "{x}"
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - case
  # - pattern

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_roman",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_roman(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          case = p_i$case %||% case,
          pattern = p_i$pattern %||% pattern
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Ensure that arguments are matched
  case <- rlang::arg_match0(case, values = c("upper", "lower"))

  valid_class <- c("numeric", "integer", "integer64")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = valid_class,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      use_latex_math_mode = FALSE,
      format_fn = function(x, context) {

        # Generate a vector of empty strings that will eventually contain
        # all of the roman numerals
        x_str <- character(length(x))

        # Round all values of x to 3 digits with the R-H-U method of
        # rounding (for reproducibility purposes)
        x <- round_gt(x, 0)

        # Determine which of `x` are finite values
        x_is_a_number <- is.finite(x)
        x[x_is_a_number] <- abs(x[x_is_a_number])

        x_is_in_range <- x > 0 & x < 3900

        x_str[x_is_a_number & x_is_in_range] <-
          as.character(utils::as.roman(x[x_is_a_number & x_is_in_range]))

        x_str[x_is_a_number & x == 0] <- if (case == "lower") "n" else "N"

        if (case == "lower") {
          x_str[x_is_in_range] <- tolower(x_str[x_is_in_range])
        }

        # In rare cases that Inf or -Inf appear, ensure that these
        # special values are printed correctly
        x_str[is.infinite(x)] <- x[is.infinite(x)]

        x_str[x_is_a_number & x != 0 & !x_is_in_range] <- "ex terminis"

        x_str
      }
    )
  )
}

# fmt_index() ------------------------------------------------------------------
#' Format values to indexed characters
#'
#' @description
#'
#' With numeric values in a **gt** table we can transform those to index values,
#' usually based on letters. These characters can be derived from a specified
#' locale and they are intended for ordering (often leaving out characters with
#' diacritical marks).
#'
#' @inheritParams fmt_number
#'
#' @param case *Use uppercase or lowercase letters*
#'
#'   `singl-kw:[upper|lower]` // *default:* `"upper"`
#'
#'   Should the resulting index characters be rendered as uppercase (`"upper"`)
#'   or lowercase (`"lower"`) letters? By default, this is set to `"upper"`.
#'
#' @param index_algo *Indexing algorithm*
#'
#'   `singl-kw:[repeat|excel]` // *default:* `"repeat"`
#'
#'   The indexing algorithm handles the recycling of the index character set. By
#'   default, the `"repeat"` option is used where characters are doubled,
#'   tripled, and so on, when moving past the character set limit. The
#'   alternative is the `"excel"` option, where Excel-based column naming is
#'   adapted and used here (e.g., `[..., Y, Z, AA, AB, ...]`).
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_index()` is compatible with body cells that are of the `"numeric"` or
#' `"integer"` types. Any other types of body cells are ignored during
#' formatting. This is to say that cells of incompatible data types may be
#' targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_index()` to obtain
#' varying parameter values from a specified column within the table. This means
#' that each row could be formatted a little bit differently. These arguments
#' provide support for [from_column()]:
#'
#' - `case`
#' - `index_algo`
#' - `pattern`
#' - `locale`
#'
#' Please note that for all of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Examples:
#'
#' Using a summarized version of the [`towny`] dataset, let's create a **gt**
#' table. Here, `fmt_index()` is used to transform incremental
#' integer values into capitalized letters (in the `ranking` column). With
#' [cols_merge()] that formatted column of `"A"` to `"E"` values is merged with
#' the `census_div` column to create an indexed listing of census subdivisions,
#' here ordered by increasing total municipal population.
#'
#' ```r
#' towny |>
#'   dplyr::select(name, csd_type, census_div, population_2021) |>
#'   dplyr::group_by(census_div) |>
#'   dplyr::summarize(
#'     population = sum(population_2021),
#'     .groups = "drop_last"
#'   ) |>
#'   dplyr::slice_min(population, n = 5) |>
#'   dplyr::mutate(ranking = dplyr::row_number(), .before = 0) |>
#'   gt() |>
#'   fmt_integer() |>
#'   fmt_index(columns = ranking, pattern = "{x}.") |>
#'   cols_merge(columns = c(ranking, census_div)) |>
#'   cols_align(align = "left", columns = ranking) |>
#'   cols_label(
#'     ranking = md("Census  \nSubdivision"),
#'     population = md("Population  \nin 2021")
#'   ) |>
#'   tab_header(title = md("The smallest  \ncensus subdivisions")) |>
#'   tab_options(table.width = px(325))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_index_1.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-11
#'
#' @section Function Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
#' @seealso The vector-formatting version of this function: [vec_fmt_index()].
#'
#' @export
fmt_index <- function(
    data,
    columns = everything(),
    rows = everything(),
    case = c("upper", "lower"),
    index_algo = c("repeat", "excel"),
    pattern = "{x}",
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - case
  # - index_algo
  # - pattern
  # - locale

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_index",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_index(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          case = p_i$case %||% case,
          index_algo = p_i$index_algo %||% index_algo,
          pattern = p_i$pattern %||% pattern,
          locale = p_i$locale %||% locale
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Ensure that arguments are matched
  case <- rlang::arg_match0(case, values = c("upper", "lower"))
  index_algo <- rlang::arg_match0(index_algo, values = c("repeat", "excel"))

  # Stop function if `locale` does not have a valid value; normalize locale
  # and resolve one that might be set globally
  validate_locale(locale = locale)
  locale <- normalize_locale(locale = locale)
  locale <- resolve_locale(data = data, locale = locale)

  # Use locale-based `idx_set` if a locale ID is provided
  idx_set <- get_locale_idx_set(locale)

  valid_class <- c("numeric", "integer", "integer64")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = valid_class,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      use_latex_math_mode = FALSE,
      format_fn = function(x, context) {

        # Generate a vector of empty strings that will eventually contain
        # all of the roman numerals
        x_str <- character(length(x))

        # Round all values of x to 3 digits with the R-H-U method of
        # rounding (for reproducibility purposes)
        x <- round_gt(x, 0)

        # Determine which of `x` are finite values
        x_is_a_number <- is.finite(x)
        x[x_is_a_number] <- abs(x[x_is_a_number])

        # Select the correct indexing function
        if (index_algo == "repeat") {
          index_fn <- index_repeat
        } else {
          index_fn <- index_excel
        }

        x_str[x_is_a_number] <-
          vapply(
            x[x_is_a_number],
            FUN.VALUE = character(1L),
            USE.NAMES = FALSE,
            FUN = function(x) index_fn(x, set = idx_set)
          )

        x_str[x_is_a_number & x == 0] <- ""

        if (case == "lower") {
          x_str <- tolower(x_str)
        }

        # In rare cases that Inf or -Inf appear, ensure that these
        # special values are printed correctly
        x_str[is.infinite(x)] <- x[is.infinite(x)]

        x_str
      }
    )
  )
}

index_repeat <- function(x, set) {

  marks_rep <- floor((x - 1) / length(set)) + 1

  marks_val <- set[(x - 1) %% length(set) + 1]

  unname(
    mapply(
      marks_val, marks_rep,
      FUN = function(val_i, rep_i) {
        paste(rep(val_i, rep_i), collapse = "")}
    )
  )
}

index_excel <- function(num, set) {

  result <-
    vapply(
      num,
      FUN.VALUE = character(1L),
      USE.NAMES = FALSE,
      FUN = function(x) {
        get_letters_from_div(x, set = set)
      }
    )

  ifelse(result == "", NA_character_, result)
}

get_letters_from_div <- function(x, set) {

  if (is.na(x)) {
    return(NA_character_)
  }

  result <- integer()

  while (x > 0) {
    remainder <- ((x - 1) %% 26) + 1
    result <- c(remainder, result)
    x <- (x - remainder) %/% 26
  }

  paste(set[result], collapse = "")
}

# fmt_spelled_num() ------------------------------------------------------------
#' Format values to spelled-out numbers
#'
#' @description
#'
#' With numeric values in a **gt** table we can transform those to numbers that
#' are spelled out with `fmt_spelled_num()`. Any values from `0` to `100` can be
#' spelled out so, for example, the value `23` will be formatted as
#' `"twenty-three"`. Providing a locale ID will result in the number spelled out
#' in the locale's language rules. For example, should a Swedish locale (`"sv"`)
#' be provided, the value `23` will yield `"tjugotre"`. In addition to this, we
#' can optionally use the `pattern` argument for decoration of the formatted
#' values.
#'
#' @inheritParams fmt_number
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_spelled_num()` is compatible with body cells that are of the `"numeric"`
#' or `"integer"` types. Any other types of body cells are ignored during
#' formatting. This is to say that cells of incompatible data types may be
#' targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_spelled_num()` to
#' obtain varying parameter values from a specified column within the table.
#' This means that each row could be formatted a little bit differently. These
#' arguments provide support for [from_column()]:
#'
#' - `pattern`
#' - `locale`
#'
#' Please note that for both of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Supported locales:
#'
#' The following 80 locales are supported in the `locale` argument of
#' `fmt_spelled_num()`: `"af"` (Afrikaans), `"ak"` (Akan), `"am"` (Amharic),
#' `"ar"` (Arabic), `"az"` (Azerbaijani), `"be"` (Belarusian), `"bg"`
#' (Bulgarian), `"bs"` (Bosnian), `"ca"` (Catalan), `"ccp"` (Chakma), `"chr"`
#' (Cherokee), `"cs"` (Czech), `"cy"` (Welsh), `"da"` (Danish), `"de"` (German),
#' `"de-CH"` (German (Switzerland)), `"ee"` (Ewe), `"el"` (Greek), `"en"`
#' (English), `"eo"` (Esperanto), `"es"` (Spanish), `"et"` (Estonian), `"fa"`
#' (Persian), `"ff"` (Fulah), `"fi"` (Finnish), `"fil"` (Filipino), `"fo"`
#' (Faroese), `"fr"` (French), `"fr-BE"` (French (Belgium)), `"fr-CH"` (French
#' (Switzerland)), `"ga"` (Irish), `"he"` (Hebrew), `"hi"` (Hindi), `"hr"`
#' (Croatian), `"hu"` (Hungarian), `"hy"` (Armenian), `"id"` (Indonesian),
#' `"is"` (Icelandic), `"it"` (Italian), `"ja"` (Japanese), `"ka"` (Georgian),
#' `"kk"` (Kazakh), `"kl"` (Kalaallisut), `"km"` (Khmer), `"ko"` (Korean),
#' `"ky"` (Kyrgyz), `"lb"` (Luxembourgish), `"lo"` (Lao), `"lrc"` (Northern
#' Luri), `"lt"` (Lithuanian), `"lv"` (Latvian), `"mk"` (Macedonian), `"ms"`
#' (Malay), `"mt"` (Maltese), `"my"` (Burmese), `"ne"` (Nepali), `"nl"` (Dutch),
#' `"nn"` (Norwegian Nynorsk), `"no"` (Norwegian), `"pl"` (Polish), `"pt"`
#' (Portuguese), `"qu"` (Quechua), `"ro"` (Romanian), `"ru"` (Russian), `"se"`
#' (Northern Sami), `"sk"` (Slovak), `"sl"` (Slovenian), `"sq"` (Albanian),
#' `"sr"` (Serbian), `"sr-Latn"` (Serbian (Latin)), `"su"` (Sundanese), `"sv"`
#' (Swedish), `"sw"` (Swahili), `"ta"` (Tamil), `"th"` (Thai), `"tr"` (Turkish),
#' `"uk"` (Ukrainian), `"vi"` (Vietnamese), `"yue"` (Cantonese), and `"zh"`
#' (Chinese).
#'
#' @section Examples:
#'
#' Let's use a summarized version of the [`gtcars`] dataset to create a
#' **gt** table. `fmt_spelled_num()` is used to transform
#' integer values into spelled-out numbering (in the `n` column). That formatted
#' column of numbers-as-words is given cell background colors via [data_color()]
#' (the underlying numerical values are always available).
#'
#' ```r
#' gtcars |>
#'   dplyr::count(mfr, ctry_origin) |>
#'   dplyr::arrange(ctry_origin) |>
#'   gt(rowname_col = "mfr", groupname_col = "ctry_origin") |>
#'   cols_label(n = "No. of Entries") |>
#'   fmt_spelled_num() |>
#'   tab_stub_indent(rows = everything(), indent = 2) |>
#'   data_color(
#'     columns = n,
#'     method = "numeric",
#'     palette = "viridis",
#'     alpha = 0.8
#'   ) |>
#'   opt_all_caps() |>
#'   opt_vertical_padding(scale = 0.5) |>
#'   cols_align(align = "center", columns = n)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_spelled_num_1.png")`
#' }}
#'
#' With a considerable amount of **dplyr** and **tidyr** work done to the
#' [`pizzaplace`] dataset, we can create a new **gt** table. `fmt_spelled_num()`
#' will be used here to transform the integer values in the `rank` column.
#' We'll do so with a special `pattern` that puts the word 'Number' in front of
#' every spelled-out number.
#'
#' ```r
#' pizzaplace |>
#'   dplyr::mutate(month = lubridate::month(date, label = TRUE)) |>
#'   dplyr::filter(month %in% month.abb[1:6]) |>
#'   dplyr::group_by(name, month) |>
#'   dplyr::summarize(sum = sum(price), .groups = "drop") |>
#'   dplyr::arrange(month, desc(sum)) |>
#'   dplyr::group_by(month) |>
#'   dplyr::slice_head(n = 5) |>
#'   dplyr::mutate(rank = dplyr::row_number()) |>
#'   dplyr::ungroup() |>
#'   dplyr::select(-sum) |>
#'   tidyr::pivot_wider(names_from = month, values_from = c(name)) |>
#'   gt() |>
#'   fmt_spelled_num(columns = rank, pattern = "Number {x}") |>
#'   opt_all_caps() |>
#'   cols_align(columns = -rank, align = "center") |>
#'   cols_width(
#'     rank ~ px(120),
#'     everything() ~ px(100)
#'   ) |>
#'   opt_table_font(stack = "rounded-sans") |>
#'   tab_options(table.font.size = px(14))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_spelled_num_2.png")`
#' }}
#'
#' Let's make a table that compares how the numbers from `1` to `10` are spelled
#' across a small selection of languages. Here we use `fmt_spelled_num()` with
#' each column, ensuring that the `locale` value matches that of the column
#' name.
#'
#' ```r
#' dplyr::tibble(
#'   num = 1:10,
#'   en = num,
#'   fr = num,
#'   de = num,
#'   es = num,
#'   pl = num,
#'   bg = num,
#'   ko = num,
#'   zh = num
#' ) |>
#'   gt(rowname_col = "num") |>
#'   fmt_spelled_num(columns = en, locale = "en") |>
#'   fmt_spelled_num(columns = fr, locale = "fr") |>
#'   fmt_spelled_num(columns = de, locale = "de") |>
#'   fmt_spelled_num(columns = es, locale = "es") |>
#'   fmt_spelled_num(columns = pl, locale = "pl") |>
#'   fmt_spelled_num(columns = bg, locale = "bg") |>
#'   fmt_spelled_num(columns = ko, locale = "ko") |>
#'   fmt_spelled_num(columns = zh, locale = "zh") |>
#'   cols_label_with(fn = function(x) md(paste0("`", x, "`"))) |>
#'   tab_spanner(
#'     label = "Numbers in the specified locale",
#'     columns = everything()
#'   ) |>
#'   cols_align(align = "left", columns = everything()) |>
#'   cols_width(
#'     c(en, fr, de, es, pl, bg) ~ px(100),
#'     c(ko, zh) ~ px(50)
#'   ) |>
#'   opt_horizontal_padding(scale = 2) |>
#'   opt_vertical_padding(scale = 0.5)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_spelled_num_3.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-12
#'
#' @section Function Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
#' @seealso The vector-formatting version of this function:
#'   [vec_fmt_spelled_num()].
#'
#' @export
fmt_spelled_num <- function(
    data,
    columns = everything(),
    rows = everything(),
    pattern = "{x}",
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - pattern
  # - locale

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_spelled_num",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_spelled_num(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          pattern = p_i$pattern %||% pattern,
          locale = p_i$locale %||% locale
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Stop function if `locale` does not have a valid value; normalize locale
  # and resolve one that might be set globally
  validate_locale(locale = locale)
  locale <- normalize_locale(locale = locale)
  locale <- resolve_locale(data = data, locale = locale)

  # Obtain a locale-based `num_spellout_set` vector
  num_spellout_set <- get_locale_num_spellout(locale = locale)

  valid_class <- c("numeric", "integer", "integer64")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = valid_class,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      use_latex_math_mode = FALSE,
      format_fn = function(x, context) {

        # Generate a vector of empty strings that will eventually contain
        # all of the roman numerals
        x_str <- character(length(x))

        # Round all values of x to 3 digits with the R-H-U method of
        # rounding (for reproducibility purposes)
        x <- floor(x)

        # Determine which of `x` are finite values
        x_is_a_number <- is.finite(x)
        # x[x_is_a_number] <- abs(x[x_is_a_number])

        # The allowed range of numbers that can be spelled out
        # is `0` to `100`
        x_is_in_range <- x >= 0 & x <= 100

        # The `num_spellout_set` vector should always contain 101
        # elements; it contains zero then the numbers from 1 to 100
        x_str[x_is_a_number & x_is_in_range] <-
          num_spellout_set[x[x_is_a_number & x_is_in_range] + 1]

        # Ensure that numbers not in range are included as
        # floored numeric values
        x_str[x_is_a_number & !x_is_in_range] <-
          x[x_is_a_number & !x_is_in_range]

        # In rare cases that Inf or -Inf appear, ensure that these
        # special values are printed correctly
        x_str[is.infinite(x)] <- x[is.infinite(x)]

        x_str
      }
    )
  )
}

# fmt_bytes() ------------------------------------------------------------------
#' Format values as bytes
#'
#' @description
#'
#' With numeric values in a **gt** table, we can transform those to values of
#' bytes with human readable units. `fmt_bytes()` allows for the
#' formatting of byte sizes to either of two common representations: (1) with
#' decimal units (powers of 1000, examples being `"kB"` and `"MB"`), and (2)
#' with binary units (powers of 1024, examples being `"KiB"` and `"MiB"`).
#'
#' It is assumed the input numeric values represent the number of bytes and
#' automatic truncation of values will occur. The numeric values will be scaled
#' to be in the range of 1 to <1000 and then decorated with the correct unit
#' symbol according to the standard chosen. For more control over the formatting
#' of byte sizes, we can use the following options:
#'
#' - decimals: choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' - digit grouping separators: options to enable/disable digit separators
#' and provide a choice of separator symbol
#' - pattern: option to use a text pattern for decoration of the formatted
#' values
#' - locale-based formatting: providing a locale ID will result in number
#' formatting specific to the chosen locale
#'
#' @inheritParams fmt_number
#'
#' @param standard *Standard used to express byte sizes*
#'
#'   `singl-kw:[decimal|binary]` // *default:* `"decimal"`
#'
#'   The form of expressing large byte sizes is divided between: (1) decimal
#'   units (powers of 1000; e.g., `"kB"` and `"MB"`), and (2) binary units
#'   (powers of 1024; e.g., `"KiB"` and `"MiB"`).
#'
#' @param decimals *Number of decimal places*
#'
#'   `scalar<numeric|integer>(val>=0)` // *default:* `1`
#'
#'   This corresponds to the exact number of decimal places to use. A value
#'   such as `2.34` can, for example, be formatted with `0` decimal places and
#'   it would result in `"2"`. With `4` decimal places, the formatted value
#'   becomes `"2.3400"`. The trailing zeros can be removed with
#'   `drop_trailing_zeros = TRUE`.
#'
#' @param force_sign *Forcing the display of a positive sign*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   Should the positive sign be shown for positive numbers (effectively showing
#'   a sign for all numbers except zero)? If so, use `TRUE` for this option. The
#'   default is `FALSE`, where only negative numbers will display a minus sign.
#'
#' @param incl_space *Include a space between the value and the units*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   An option for whether to include a space between the value and the units.
#'   The default is to use a space character for separation.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_bytes()` is compatible with body cells that are of the `"numeric"` or
#' `"integer"` types. Any other types of body cells are ignored during
#' formatting. This is to say that cells of incompatible data types may be
#' targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_bytes()` to obtain
#' varying parameter values from a specified column within the table. This means
#' that each row could be formatted a little bit differently. These arguments
#' provide support for [from_column()]:
#'
#' - `standard`
#' - `decimals`
#' - `n_sigfig`
#' - `drop_trailing_zeros`
#' - `drop_trailing_dec_mark`
#' - `use_seps`
#' - `pattern`
#' - `sep_mark`
#' - `dec_mark`
#' - `force_sign`
#' - `incl_space`
#' - `locale`
#'
#' Please note that for each of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Adapting output to a specific `locale`:
#'
#' This formatting function can adapt outputs according to a provided `locale`
#' value. Examples include `"en"` for English (United States) and `"fr"` for
#' French (France). The use of a valid locale ID here means separator and
#' decimal marks will be correct for the given locale. Should any values be
#' provided in `sep_mark` or `dec_mark`, they will be overridden by the locale's
#' preferred values.
#'
#' Note that a `locale` value provided here will override any global locale
#' setting performed in [gt()]'s own `locale` argument (it is settable there as
#' a value received by all other functions that have a `locale` argument). As a
#' useful reference on which locales are supported, we can call [info_locales()]
#' to view an info table.
#'
#' @section Examples:
#'
#' Use a single column from the [`exibble`] dataset and create a simple **gt**
#' table. We'll use `fmt_bytes()` to format the `num` column to display as byte
#' sizes in the decimal standard.
#'
#' ```r
#' exibble |>
#'   dplyr::select(num) |>
#'   gt() |>
#'   fmt_bytes()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_bytes_1.png")`
#' }}
#'
#' Let's create an analogous table again by using `fmt_bytes()`,
#' this time showing byte sizes as binary values by using `standard = "binary"`.
#'
#' ```r
#' exibble |>
#'   dplyr::select(num) |>
#'   gt() |>
#'   fmt_bytes(standard = "binary")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_bytes_2.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-13
#'
#' @section Function Introduced:
#' `v0.3.0` (May 12, 2021)
#'
#' @seealso The vector-formatting version of this function: [vec_fmt_bytes()].
#'
#' @export
fmt_bytes <- function(
    data,
    columns = everything(),
    rows = everything(),
    standard = c("decimal", "binary"),
    decimals = 1,
    n_sigfig = NULL,
    drop_trailing_zeros = TRUE,
    drop_trailing_dec_mark = TRUE,
    use_seps = TRUE,
    min_sep_threshold = 1,
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign = FALSE,
    incl_space = TRUE,
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - standard
  # - decimals
  # - n_sigfig
  # - drop_trailing_zeros
  # - drop_trailing_dec_mark
  # - use_seps
  # - min_sep_threshold
  # - pattern
  # - sep_mark
  # - dec_mark
  # - force_sign
  # - incl_space
  # - locale

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_bytes",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_bytes(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          standard = p_i$standard %||% standard,
          decimals = p_i$decimals %||% decimals,
          n_sigfig = p_i$n_sigfig %||% n_sigfig,
          drop_trailing_zeros = p_i$drop_trailing_zeros %||% drop_trailing_zeros,
          drop_trailing_dec_mark = p_i$drop_trailing_dec_mark %||% drop_trailing_dec_mark,
          use_seps = p_i$use_seps %||% use_seps,
          min_sep_threshold = p_i$min_sep_threshold %||% min_sep_threshold,
          pattern = p_i$pattern %||% pattern,
          sep_mark = p_i$sep_mark %||% sep_mark,
          dec_mark = p_i$dec_mark %||% dec_mark,
          force_sign = p_i$force_sign %||% force_sign,
          incl_space = p_i$incl_space %||% incl_space,
          locale = p_i$locale %||% locale
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Ensure that arguments are matched
  standard <- rlang::arg_match0(standard, values = c("decimal", "binary"))

  # Stop function if `locale` does not have a valid value; normalize locale
  # and resolve one that might be set globally
  validate_locale(locale = locale)
  locale <- normalize_locale(locale = locale)
  locale <- resolve_locale(data = data, locale = locale)

  valid_class <- c("numeric", "integer", "integer64")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  # Use locale-based marks if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)
  dec_mark <- get_locale_dec_mark(locale, dec_mark)
  min_sep_threshold <- get_locale_min_sep_threshold(locale, min_sep_threshold)

  # Set the `formatC_format` option according to whether number
  # formatting with significant figures is to be performed
  if (!is.null(n_sigfig)) {

    # Stop function if `n_sigfig` does not have a valid value
    validate_n_sigfig(n_sigfig = n_sigfig)

    formatC_format <- "fg"

  } else {
    formatC_format <- "f"
  }

  if (standard == "decimal") {

    base <- 1000
    byte_units <- c("B", "kB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB")

  } else {

    base <- 1024
    byte_units <- c("B", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB")
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = valid_class,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      format_fn = function(x, context) {

        # Truncate all byte values
        x <- trunc(x)

        num_power_idx <- floor(log(abs(x), base = base)) + 1
        num_power_idx <- pmax(1, pmin(length(byte_units), num_power_idx))

        units_str <- byte_units[num_power_idx]
        x <- x / base^(num_power_idx - 1)

        # Format numeric values to character-based numbers
        x_str <-
          format_num_to_str(
            x,
            context = context,
            decimals = decimals,
            n_sigfig = n_sigfig,
            sep_mark = sep_mark,
            dec_mark = dec_mark,
            drop_trailing_zeros = drop_trailing_zeros,
            drop_trailing_dec_mark = drop_trailing_dec_mark,
            min_sep_threshold = min_sep_threshold,
            format = formatC_format
          )

        x_str <-
          paste_right(x_str, x_right = paste0(if (incl_space) " ", units_str))

        # Force a positive sign on certain values if the option is taken
        if (force_sign) {

          positive_x <- !is.na(x) & x > 0
          x_str[positive_x] <- paste_left(x_str[positive_x], x_left = "+")
        }

        x_str
      }
    )
  )
}

# fmt_duration() ---------------------------------------------------------------
#' Format numeric or duration values as styled time duration strings
#'
#' @description
#'
#' Format input values to time duration values whether those input values are
#' numbers or of the `difftime` class. We can specify which time units any
#' numeric input values have (as weeks, days, hours, minutes, or seconds) and
#' the output can be customized with a duration style (corresponding to narrow,
#' wide, colon-separated, and ISO forms) and a choice of output units ranging
#' from weeks to seconds.
#'
#' @section Output units for the colon-separated duration style:
#'
#' The colon-separated duration style (enabled when
#' `duration_style = "colon-sep"`) is essentially a clock-based output format
#' which uses the display logic of chronograph watch functionality. It will, by
#' default, display duration values in the `(D/)HH:MM:SS` format. Any duration
#' values greater than or equal to 24 hours will have the number of days
#' prepended with an adjoining slash mark. While this output format is
#' versatile, it can be changed somewhat with the `output_units` option. The
#' following combinations of output units are permitted:
#'
#' - `c("minutes", "seconds")` -> `MM:SS`
#' - `c("hours", "minutes")` -> `HH:MM`
#' - `c("hours", "minutes", "seconds")` -> `HH:MM:SS`
#' - `c("days", "hours", "minutes")` -> `(D/)HH:MM`
#'
#' Any other specialized combinations will result in the default set being used,
#' which is `c("days", "hours", "minutes", "seconds")`
#'
#' @inheritParams fmt_number
#'
#' @param input_units *Declaration of duration units for numerical values*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   If one or more selected columns contains numeric values (not `difftime`
#'   values, which contain the duration units), a keyword must be provided for
#'   `input_units` for **gt** to determine how those values are to be
#'   interpreted in terms of duration. The accepted units are: `"seconds"`,
#'   `"minutes"`, `"hours"`, `"days"`, and `"weeks"`.
#'
#' @param output_units *Choice of output units*
#'
#'   `mult-kw:[weeks|days|hours|minutes|seconds]` // *default:* `NULL` (`optional`)
#'
#'   Controls the output time units. The default, `NULL`, means that **gt** will
#'   automatically choose time units based on the input duration value. To
#'   control which time units are to be considered for output (before trimming
#'   with `trim_zero_units`) we can specify a vector of one or more of the
#'   following keywords: `"weeks"`, `"days"`, `"hours"`, `"minutes"`, or
#'   `"seconds"`.
#'
#' @param duration_style *Style for representing duration values*
#'
#'   `singl-kw:[narrow|wide|colon-sep|iso]` // *default:* `"narrow"`
#'
#'   A choice of four formatting styles for the output duration values. With
#'   `"narrow"` (the default style), duration values will be formatted with
#'   single letter time-part units (e.g., 1.35 days will be styled as
#'   `"1d 8h 24m"`). With `"wide"`, this example value will be expanded to
#'   `"1 day 8 hours 24 minutes"` after formatting. The `"colon-sep"` style will
#'   put days, hours, minutes, and seconds in the `"([D]/)[HH]:[MM]:[SS]"`
#'   format. The `"iso"` style will produce a value that conforms to the ISO
#'   8601 rules for duration values (e.g., 1.35 days will become `"P1DT8H24M"`).
#'
#' @param trim_zero_units *Trimming of zero values*
#'
#'   `scalar<logical>|mult-kw:[leading|trailing|internal]` // *default:* `TRUE`
#'
#'   Provides methods to remove output time units that have zero values. By
#'   default this is `TRUE` and duration values that might otherwise be
#'   formatted as `"0w 1d 0h 4m 19s"` with `trim_zero_units = FALSE` are instead
#'   displayed as `"1d 4m 19s"`. Aside from using `TRUE`/`FALSE` we could
#'   provide a vector of keywords for more precise control. These keywords are:
#'   (1) `"leading"`, to omit all leading zero-value time units (e.g., `"0w 1d"`
#'   -> `"1d"`), (2) `"trailing"`, to omit all trailing zero-value time units
#'   (e.g., `"3d 5h 0s"` -> `"3d 5h"`), and `"internal"`, which removes all
#'   internal zero-value time units (e.g., `"5d 0h 33m"` -> `"5d 33m"`).
#'
#' @param max_output_units *Maximum number of time units to display*
#'
#'   `scalar<numeric|integer>(val>=1)` // *default:* `NULL` (`optional`)
#'
#'   If `output_units` is `NULL`, where the output time units are unspecified
#'   and left to **gt** to handle, a numeric value provided for
#'   `max_output_units` will be taken as the maximum number of time units to
#'   display in all output time duration values. By default, this is `NULL` and
#'   all possible time units will be displayed. This option has no effect when
#'   `duration_style = "colon-sep"` (only `output_units` can be used to
#'   customize that type of duration output).
#'
#' @param force_sign *Forcing the display of a positive sign*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   Should the positive sign be shown for positive values (effectively showing
#'   a sign for all values except zero)? If so, use `TRUE` for this option. By
#'   default only negative values will display a minus sign.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_duration()` is compatible with body cells that are of the `"numeric"`,
#' `"integer"`, or `"difftime"` types. Any other types of body cells are ignored
#' during formatting. This is to say that cells of incompatible data types may
#' be targeted, but there will be no attempt to format them.
#'
#' @section Examples:
#'
#' Use part of the `sp500` table to create a **gt** table. Create a
#' `difftime`-based column and format the duration values to be displayed as the
#' number of days since March 30, 2020.
#'
#' ```r
#' sp500 |>
#'   dplyr::slice_head(n = 10) |>
#'   dplyr::mutate(
#'     time_point = lubridate::ymd("2020-03-30"),
#'     time_passed = difftime(time_point, date)
#'   ) |>
#'   dplyr::select(time_passed, open, close) |>
#'   gt(rowname_col = "month") |>
#'   fmt_duration(
#'     columns = time_passed,
#'     output_units = "days",
#'     duration_style = "wide"
#'   ) |>
#'   fmt_currency(columns = c(open, close))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_duration_1.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-17
#'
#' @section Function Introduced:
#' `v0.7.0` (Aug 25, 2022)
#'
#' @seealso The vector-formatting version of this function:
#'   [vec_fmt_duration()].
#'
#' @export
fmt_duration <- function(
    data,
    columns = everything(),
    rows = everything(),
    input_units = NULL,
    output_units = NULL,
    duration_style = c("narrow", "wide", "colon-sep", "iso"),
    trim_zero_units = TRUE,
    max_output_units = NULL,
    pattern = "{x}",
    use_seps = TRUE,
    sep_mark = ",",
    force_sign = FALSE,
    system = c("intl", "ind"),
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Ensure that arguments are matched
  duration_style <-
    rlang::arg_match0(
      duration_style,
      values = c("narrow", "wide", "colon-sep", "iso")
    )
  system <- rlang::arg_match0(system, values = c("intl", "ind"))

  check_chr_has_length(output_units, allow_null = TRUE, allow_0 = FALSE)
  check_chr_has_length(input_units, allow_null = TRUE, allow_0 = FALSE)
  # Stop function if `locale` does not have a valid value; normalize locale
  # and resolve one that might be set globally
  validate_locale(locale = locale)
  locale <- normalize_locale(locale = locale)
  locale <- resolve_locale(data = data, locale = locale)

  # Duration values will never have decimal marks
  dec_mark <- "unused"

  # Use locale-based marks if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)

  if (isTRUE(trim_zero_units)) {
    trim_zero_units <- c("leading", "trailing", "internal")
  } else if (isFALSE(trim_zero_units)) {
    trim_zero_units <- NULL
  } else if (is.character(trim_zero_units) && length(trim_zero_units) > 0) {
    # Validate that `trim_zero_units` contains only the allowed keywords
    rlang::arg_match(trim_zero_units, c("leading", "trailing", "internal"), multiple = TRUE)
  } else {
    cli::cli_abort(c(
      "The value provided for `trim_zero_units` is invalid. Either use:",
      "*" = "`TRUE` or `FALSE`, or",
      "*" = "A vector with any of the keywords \"leading\", \"trailing\", or \"internal\"."
    ))
  }

  check_number_whole(max_output_units, min = 1, allow_null = TRUE, allow_infinite = TRUE)

  valid_class <- c("numeric", "integer", "difftime")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  # Stop function if any columns have numeric data and `input_units` is NULL
  if (
    is.null(input_units) &&
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = "difftime"
    )
  ) {
    cli::cli_abort(c(
      "{.arg input_units} must be supplied when there are numeric columns to format.",
      "i" = "Use one of \"seconds\", \"minutes\", \"hours\", \"days\", or \"weeks\"."
    ))
  }

  # Initialize `colon_sep_params` list
  colon_sep_params <- list()

  # Resolve input units
  if (!is.null(input_units)) {

    # Stop function if `input_units` isn't a character vector, isn't of
    # the right length (1 or greater), and does not contain valid values
    validate_duration_input_units(input_units = input_units)

    # Normalize the valid set of provided `input_units`
    input_units <- normalize_duration_input_units(input_units = input_units)
  }

  # Resolve output units
  output_units <- output_units %||% c("weeks", "days", "hours", "minutes", "seconds")
  # Stop function if `output_units` isn't a character vector, isn't of
  # the right length (1 or greater), and does not contain valid values
  output_units <- rlang::arg_match(
    output_units,
    values = c("weeks", "days", "hours", "mins", "minutes", "secs", "seconds"),
    # Error message will naturally improve as r-lib/rlang#1682 is fixed
    multiple = TRUE
  )

  # Normalize the valid set of provided `output_units`
  output_units <- normalize_duration_output_units(output_units = output_units)

  # If `duration_style` is of the "iso" or "colon-sep" types, then
  # some options need to be overridden

  if (duration_style == "iso") {
    output_units <- c("days", "hours", "minutes", "seconds")
    max_output_units <- NULL
    trim_zero_units <- c("leading", "trailing")
  }

  if (duration_style == "colon-sep") {

    if (
      any(
        identical(output_units, c("minutes", "seconds")),
        identical(output_units, c("hours", "minutes")),
        identical(output_units, c("hours", "minutes", "seconds")),
        identical(output_units, c("days", "hours", "minutes"))
      )
    ) {
      colon_sep_output_units <- output_units
    } else {
      colon_sep_output_units <- c("days", "hours", "minutes", "seconds")
    }

    output_units <- c("days", "hours", "minutes", "seconds")

    if (identical(trim_zero_units, "leading")) {
      colon_sep_trim_zero_units <- "leading"
    } else {
      colon_sep_trim_zero_units <- FALSE
    }

    colon_sep_params <-
      list(
        output_units = colon_sep_output_units,
        trim_zero_units = colon_sep_trim_zero_units
      )

    trim_zero_units <- FALSE
    max_output_units <- NULL
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = valid_class,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      use_latex_math_mode = FALSE,
      format_fn = function(x, context) {

        if (duration_style %in% c("narrow", "wide")) {

          patterns <-
            get_localized_duration_patterns(
              value = x,
              type = duration_style,
              locale = locale
            )

        } else {
          patterns <- NULL
        }

        x_str <-
          values_to_durations(
            x,
            in_units = input_units,
            out_units = output_units,
            out_style = duration_style,
            trim_zero_units = trim_zero_units,
            max_output_units = max_output_units,
            colon_sep_params = colon_sep_params,
            sep_mark = sep_mark,
            dec_mark = dec_mark,
            system = system,
            locale = locale,
            patterns = patterns
          )

        #
        # Prefix with plus and minus signs where necessary
        #

        x_str[x < 0 & !is.infinite(x)] <-
          paste0(
            context_minus_mark(context = context),
            x_str[x < 0 & !is.infinite(x)]
          )

        if (force_sign) {
          x_str[x > 0 & !is.infinite(x)] <-
            paste0("+", x_str[x > 0 & !is.infinite(x)])
        }

        x_str
      }
    )
  )
}

validate_duration_input_units <- function(input_units, call = rlang::caller_env()) {

  if (is.null(input_units)) {
    return(NULL)
  }
  time_parts_vec <- c("weeks", "days", "hours", "mins", "minutes", "secs", "seconds")
  rlang::arg_match0(
    input_units,
    time_parts_vec,
    error_call = call
  )
}

normalize_duration_input_units <- function(input_units) {

  # Ensure that key transforms occur
  input_units <- sub("secs", "seconds", input_units, fixed = TRUE)
  input_units <- sub("mins", "minutes", input_units, fixed = TRUE)
  input_units
}

normalize_duration_output_units <- function(output_units) {

  # Ensure that key transforms occur and that the output units are a unique set
  output_units <- sub("secs", "seconds", output_units, fixed = TRUE)
  output_units <- sub("mins", "minutes", output_units, fixed = TRUE)
  output_units <- unique(output_units)

  # Ensure that the order of output units is from greatest to smallest
  time_parts <- c("weeks", "days", "hours", "minutes", "seconds")
  output_units[order(match(output_units, time_parts))]
}

values_to_durations <- function(
    x,
    in_units,
    out_units,
    out_style,
    trim_zero_units,
    max_output_units,
    colon_sep_params,
    sep_mark,
    dec_mark,
    system,
    locale,
    patterns
) {

  # Obtain the units of `x` if it is of the difftime class (and
  # drop difftime attrs with `as.numeric()`)
  if (inherits(x, "difftime")) {
    in_units <- units(x)
    x <- as.numeric(x)
  }

  if (inherits(x, "integer")) {
    x <- as.numeric(x)
  }

  if (in_units == "mins") {
    in_units <- "minutes"
  }
  if (in_units == "secs") {
    in_units <- "seconds"
  }

  second_conversion_factor <-
    c(
      weeks = 604800L,
      days = 86400L,
      hours = 3600L,
      minutes = 60L,
      seconds = 1L
    )

  # Should `in_units` be anything other than seconds then
  # convert all `x` values to seconds
  if (in_units != "seconds") {
    x <- x * second_conversion_factor[[in_units]]
  }

  x_str <- character(length(x))

  for (i in seq_along(x)) {

    x_df_i <-
      dplyr::tibble(
        value = NA_integer_,
        time_part = out_units,
        formatted = NA_character_
      )

    x_rem_i <- abs(x[[i]])

    for (j in seq_along(out_units)) {

      factor <- second_conversion_factor[[out_units[[j]]]]

      x_df_i$value[[j]] <- floor(x_rem_i / factor)

      x_rem_i <- x_rem_i %% factor
    }

    # Remove time parts according to keywords in `trim_zero_units`
    total_time_units <- nrow(x_df_i)

    first_non_zero_unit_idx <- utils::head(which(x_df_i$value != 0), 1)
    last_non_zero_unit_idx <- utils::tail(which(x_df_i$value != 0), 1)

    remove_idx <- NULL

    # Possibly add leading zero time parts to `remove_idx`
    if (
      "leading" %in% trim_zero_units &&
      length(first_non_zero_unit_idx) > 0 &&
      first_non_zero_unit_idx > 1
    ) {
      remove_idx <- c(remove_idx, seq(1, first_non_zero_unit_idx - 1))
    }

    # Possibly add trailing zero time parts to `remove_idx`
    if (
      "trailing" %in% trim_zero_units &&
      length(last_non_zero_unit_idx) > 0 &&
      last_non_zero_unit_idx < total_time_units
    ) {
      remove_idx <- c(remove_idx, seq(last_non_zero_unit_idx + 1, total_time_units))
    }

    # Possibly add internal zero time parts to `remove_idx`
    if (
      "internal" %in% trim_zero_units &&
      length(first_non_zero_unit_idx) > 0
    ) {
      internal_idx <- first_non_zero_unit_idx:last_non_zero_unit_idx
      remove_idx <- c(remove_idx, base::intersect(internal_idx, which(x_df_i$value == 0)))
    }

    # Remove rows from `x_df_i`
    if (length(remove_idx) > 0) {
      x_df_i <- x_df_i[-remove_idx, ]
    }

    if (all(x_df_i$value == 0) && length(trim_zero_units) > 0) {
      # Remove all but the final row
      x_df_i <- utils::tail(x_df_i, n = 1)
    }

    # Remove units that exceed a maximum number according to `max_output_units`
    if (!is.null(max_output_units) && nrow(x_df_i) > max_output_units) {
      x_df_i <- x_df_i[seq_len(max_output_units), ]
    }

    for (j in seq_len(nrow(x_df_i))) {

      pattern <-
        extract_duration_pattern(
          value = x_df_i$value[j],
          time_p = x_df_i$time_part[j],
          patterns = patterns
        )

      x_df_i[j, "formatted"] <-
        format_time_part(
          x = x_df_i$value[j],
          time_part = x_df_i$time_part[j],
          out_style = out_style,
          sep_mark = sep_mark,
          dec_mark = dec_mark,
          locale = locale,
          system = system,
          pattern = pattern
        )
    }

    # Handle edge cases where duration is smaller
    # than the smallest unit in `out_units`
    if (all(x_df_i$value == 0)) {

      # Obtain the smallest time unit; `normalize_duration_output_units()`
      # ensures that `out_units` is sorted from largest to smallest so the
      # last component will always be needed here
      time_p <- out_units[length(out_units)]

      # If the time duration is zero then use `0` as the value,
      # otherwise, use `1` and indicate that the value is less than that
      pattern <-
        extract_duration_pattern(
          value = if (x_rem_i == 0) 0 else 1,
          time_p = time_p,
          patterns = patterns
        )

      x_df_i[nrow(x_df_i), "formatted"] <-
        format_time_part(
          x = if (x_rem_i == 0) 0 else 1,
          time_part = time_p,
          out_style = out_style,
          sep_mark = sep_mark,
          dec_mark = dec_mark,
          locale = locale,
          system = system,
          pattern = pattern
        )

      if (x_rem_i != 0) {
        x_df_i[1, "formatted"] <- paste0("<", x_df_i[1, "formatted"])
      }
    }

    if (out_style == "colon-sep") {

      colon_sep_output_units <- colon_sep_params$output_units
      colon_sep_trim_zero_units <- colon_sep_params$trim_zero_units

      # Filter to only the output units needed
      x_df_i <- vctrs::vec_slice(x_df_i, x_df_i$time_part %in% colon_sep_output_units)

      # If days has a zero value, remove that entry unconditionally
      if ("days" %in% x_df_i$time_part && x_df_i[[1, "value"]] == 0) {
        x_df_i <- vctrs::vec_slice(x_df_i, x_df_i$time_part != "days")
      }

      if (colon_sep_trim_zero_units == "leading") {
        if (
          identical(x_df_i$time_part, c("hours", "minutes", "seconds")) &&
          x_df_i[[1, "value"]] == 0
        ) {
          x_df_i <- vctrs::vec_slice(x_df_i, x_df_i$time_part != "hours")
        }
      }

      # Assemble the remaining time parts
      hms_part <-
        x_df_i[x_df_i$time_part %in% c("hours", "minutes", "seconds"), "formatted", drop = TRUE]
      hms_part <- paste(hms_part, collapse = ":")

      d_part <-
        ifelse("days" %in% x_df_i$time_part, paste0(x_df_i$formatted[1], "/"), "")

      x_str[i] <- paste0(d_part, hms_part)

    } else if (out_style == "iso") {

      x_str[i] <- paste0("P", paste0(x_df_i$formatted, collapse = ""))
      x_str[i] <- sub("D", "DT", x_str[i], fixed = TRUE)

    } else {
      x_str[i] <- paste0(x_df_i$formatted, collapse = " ")
    }
  }

  x_str
}

format_time_part <- function(
    x,
    time_part,
    out_style,
    sep_mark,
    dec_mark,
    locale,
    system,
    pattern
) {

  x_val <-
    format_num_to_str(
      x,
      context = "plain",
      decimals = 0,
      n_sigfig = NULL,
      sep_mark = if (out_style != "iso") sep_mark else "",
      dec_mark = dec_mark,
      drop_trailing_zeros = TRUE,
      drop_trailing_dec_mark = TRUE,
      format = "f",
      system = system
    )

  if (out_style %in% c("narrow", "wide")) {
    out <- gsub("{0}", x_val, pattern, fixed = TRUE)
  } else if (out_style == "iso") {
    out <- paste0(x_val, toupper(substr(time_part, 1, 1)))
  } else {
    if (time_part %in% c("hours", "minutes", "seconds") && x < 10) {
      out <- paste0("0", x_val)
    } else {
      out <- as.character(x_val)
    }
  }

  out
}

get_localized_duration_patterns <- function(
    value,
    type,
    locale
) {

  locale <- locale %||% "en"

  if (type == "wide") type <- "long"

  pattern_tbl <-
    durations[
      durations$locale == locale,
      grepl(
        "^duration-(week|day|hour|minute|second).unitPattern-count-(zero|one|other)$",
        colnames(durations)
      ) |
        grepl("type", colnames(durations), fixed = TRUE)
    ]
  pattern_tbl <- pattern_tbl[pattern_tbl$type == type, , drop = FALSE]
  pattern_tbl$type <- NULL

  colnames(pattern_tbl) <- gsub("(duration|-|unitPattern-count)", "", colnames(pattern_tbl))

  as.list(pattern_tbl)
}

extract_duration_pattern <- function(
    value,
    time_p,
    patterns
) {

  x_val_i_type <-
    dplyr::case_match(
      value,
      1 ~ "one",
      0 ~ "zero",
      .default = "other"
    )

  pattern <- patterns[grepl(paste0(sub("s$", "", time_p), ".*?.", x_val_i_type), names(patterns))][[1]]
  if (!is.null(pattern) && is.na(pattern)) {
    pattern <- patterns[grepl(paste0(sub("s$", "", time_p), ".*?.other"), names(patterns))][[1]]
  }

  pattern
}

# fmt_bins() -------------------------------------------------------------------
#' Format column data containing bin/interval information
#'
#' @description
#'
#' When using `cut()` (or other functions that use it in some way)
#' you get bins that can look like this: `"(0,10]"`, `"(10,15]"`, `"(15,20]"`,
#' `"(20,40]"`. This interval notation expresses the lower and upper limits of
#' each range. The square or round brackets define whether each of the endpoints
#' are included in the range (`[`/`]` for inclusion, `(`/`)` for exclusion).
#' Should bins of this sort be present in a table, the `fmt_bins()` function can
#' be used to format that syntax to a form that presents better in a display
#' table. It's possible to format the values of the intervals with the `fmt`
#' argument, and, the separator can be modified with the `sep` argument.
#'
#' @inheritParams fmt_number
#'
#' @param sep *Separator between values*
#'
#'   `scalar<character>` // *default:* `"--"`
#'
#'   The separator text that indicates the values are ranged. The default value
#'   of `"--"` indicates that an en dash will be used for the range separator.
#'   Using `"---"` will be taken to mean that an em dash should be used. Should
#'   you want these special symbols to be taken literally, they can be supplied
#'   within [base::I()].
#'
#' @param fmt *Formatting expressions*
#'
#'   `<single expression>` // *default:* `NULL` (`optional`)
#'
#'   An optional formatting expression in formula form. If used, the RHS of `~`
#'   should contain a formatting call (e.g.,
#'   `~ fmt_number(., decimals = 3, use_seps = FALSE`).
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_bins()` is compatible with body cells that are  of the `"character"` or
#' `"factor"` types. Any other types of body cells are ignored during formatting.
#' This is to say that cells of incompatible data types may be targeted, but
#' there will be no attempt to format them.
#'
#' @section Formatting expressions for `fmt`:
#'
#' We can supply a one-sided (RHS only) expression to `fmt`, and, several can be
#' provided in a list. The expression uses a formatting function (e.g.,
#' [fmt_number()], [fmt_currency()], etc.) and it must contain an initial `.`
#' that stands for the data object. If performing numeric formatting it might
#' look something like this:
#'
#' `fmt = ~ fmt_number(., decimals = 1, use_seps = FALSE)`
#'
#' @section Examples:
#'
#' Use the [`countrypops`] dataset to create a **gt** table. Before even getting
#' to the [gt()] call, we use `cut()` in conjunction with [scales::breaks_log()]
#' to create some highly customized bins. Consequently each country's population
#' in the 2021 year is assigned to a bin. These bins have a characteristic type
#' of formatting that can be used as input to `fmt_bins()`, and using that
#' formatting function allows us to customize the presentation of those ranges.
#' For instance, here we are formatting the left and right values of the ranges
#' with [fmt_integer()] (using formula syntax).
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(year == 2021) |>
#'   dplyr::select(country_code_2, population) |>
#'   dplyr::mutate(population_class = cut(
#'     population,
#'     breaks = scales::breaks_log(n = 20)(population)
#'     )
#'   ) |>
#'   dplyr::group_by(population_class) |>
#'   dplyr::summarize(
#'     count = dplyr::n(),
#'     countries = paste0(country_code_2, collapse = ",")
#'   ) |>
#'   dplyr::arrange(desc(population_class)) |>
#'   gt() |>
#'   fmt_flag(columns = countries) |>
#'   fmt_bins(
#'     columns = population_class,
#'     fmt = ~ fmt_integer(., suffixing = TRUE)
#'   ) |>
#'   cols_label(
#'     population_class = "Population Range",
#'     count = "",
#'     countries = "Countries"
#'   ) |>
#'   cols_width(
#'     population_class ~ px(150),
#'     count ~ px(50)
#'   ) |>
#'   tab_style(
#'     style = cell_text(style = "italic"),
#'     locations = cells_body(columns = count)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_bins_1.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-18
#'
#' @section Function Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
#' @export
fmt_bins <- function(
    data,
    columns = everything(),
    rows = everything(),
    sep = "--",
    fmt = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  valid_class <- c("character", "factor")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      html = function(x) {
        format_bins_by_context(x, sep = sep, fmt = fmt, context = "html")
      },
      latex = function(x) {
        format_bins_by_context(x, sep = sep, fmt = fmt, context = "latex")
      },
      rtf = function(x) {
        format_bins_by_context(x, sep = sep, fmt = fmt, context = "rtf")
      },
      word = function(x) {
        format_bins_by_context(x, sep = sep, fmt = fmt, context = "word")
      },
      default = function(x) {
        format_bins_by_context(x, sep = sep, fmt = fmt, context = "plain")
      }
    )
  )
}

format_bins_by_context <- function(x, sep, fmt, context) {

  # Format `sep` for output context
  if (context != "plain") {
    sep <- context_dash_mark(sep, context = context)
  }

  # Generate a vector of empty strings that will eventually
  # contain all of the ranged value text
  x_str <- character(length(x))

  x_str_non_missing <- x[!is.na(x)]

  x_str_non_missing <- as.character(x_str_non_missing)

  x_str_is_bin <-
    grepl("^(\\(|\\[]).*?,.*?(\\)|\\])$", x_str_non_missing)

  x_str_lhs <-
    gsub(
      "^(\\(|\\[])(.*?),(.*?)(\\)|\\])$",
      "\\2",
      x_str_non_missing[x_str_is_bin]
    )

  x_str_rhs <-
    gsub(
      "^(\\(|\\[])(.*?),(.*?)(\\)|\\])$",
      "\\3",
      x_str_non_missing[x_str_is_bin]
    )

  if (!is.null(fmt)) {

    # Format the LHS and RHS values
    val_tbl <-
      vctrs::data_frame(
        left = as.numeric(x_str_lhs),
        right = as.numeric(x_str_rhs)
      )

    val_tbl_gt <- gt(val_tbl, groupname_col = NULL)

    # Ensure that the expression (a RHS formula) is made a closure
    format_fn <- rlang::as_closure(fmt)

    # Perform the formatting on this gt table with closure
    val_tbl_gt <- format_fn(val_tbl_gt)

    #
    # Extract the columns of formatted data
    #

    x_val_lhs_fmt <-
      extract_cells(val_tbl_gt, columns = "left", output = context)

    x_val_rhs_fmt <-
      extract_cells(val_tbl_gt, columns = "right", output = context)

  } else {

    x_val_lhs_fmt <- x_str_lhs
    x_val_rhs_fmt <- x_str_rhs
  }

  x_str_non_missing[x_str_is_bin] <-
    paste0(x_val_lhs_fmt, sep, x_val_rhs_fmt)

  x_str[!is.na(x)] <- x_str_non_missing
  x_str[is.na(x)] <- NA_character_
  x_str
}

# fmt_tf() ---------------------------------------------------------------------
#' Format `TRUE` and `FALSE` values
#'
#' @description
#'
#' There can be times where logical values are useful in a **gt** table. You
#' might want to express a 'yes' or 'no', a 'true' or 'false', or, perhaps use
#' pairings of complementary symbols that make sense in a table. The `fmt_tf()`
#' function has a set of `tf_style` presets that can be used to quickly map
#' `TRUE`/`FALSE` values to strings (which are automatically translated
#' according to a given `locale` value), or, symbols like up/down or left/right
#' arrows and open/closed shapes.
#'
#' While the presets are nice, you can provide your own mappings through the
#' `true_val` and `false_val` arguments. With those you could provide text
#' (perhaps a Unicode symbol?) or even a **fontawesome** icon by using
#' `fontawesome::fa("<icon name>")`. The function will automatically handle
#' alignment when `auto_align = TRUE` and try to give you the best look
#' depending on the options chosen. For extra customization, you can also apply
#' color to the individual `TRUE`, `FALSE`, and `NA` mappings. Just supply
#' a vector of colors (up to a length of 3) to the `colors` argument.
#'
#' @inheritParams fmt_number
#'
#' @param tf_style *Predefined style for `TRUE`/`FALSE` formatting*
#'
#'   `scalar<character>|scalar<numeric|integer>(1<=val<=10)` // *default:* `"true-false"`
#'
#'   The `TRUE`/`FALSE` mapping style to use. By default this is the short name
#'   `"true-false"` which corresponds to the words 'true' and 'false'. Two other
#'   `tf_style` values produce words: `"yes-no"` and `"up-down"`. All three of
#'   these options for `tf_style` are locale-aware through the `locale` option,
#'   so, a `"yes"` value will instead be `"ja"` when `locale = "de"`. Options
#'   4 through to 10 involve pairs of symbols (e.g., `"check-mark"` displays
#'   a check mark for `TRUE` and an X symbol for `FALSE`).
#'
#' @param true_val *Text to use for `TRUE` values*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   While the choice of a `tf_style` will typically supply the `true_val` and
#'   `false_val` text, we could override this and supply text for any `TRUE`
#'   values.  This doesn't need to be used in conjunction with `false_val`.
#'
#' @param false_val *Text to use for `FALSE` values*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   While the choice of a `tf_style` will typically supply the `true_val` and
#'   `false_val` text, we could override this and supply text for any `FALSE`
#'   values. This doesn't need to be used in conjunction with `true_val`.
#'
#' @param na_val *Text to use for `NA` values*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   None of the `tf_style` presets will replace any missing values encountered
#'   in the targeted cells. While we always have the option to use
#'   [sub_missing()] for `NA` replacement, we have the opportunity to do that
#'   here with the `na_val` option. This is useful because we also have the
#'   means to add color to the `na_val` text or symbol and doing that requires
#'   that a replacement value for `NA`s is specified here.
#'
#' @param colors *Colors to use for the resulting strings or symbols*
#'
#'   `vector<character>` // *default:* `NULL` (`optional`)
#'
#'   Providing a vector of color values to `colors` will progressively add color
#'   to the formatted result depending on the number of colors provided. With a
#'   single color, all formatted values will be in that color. Giving two colors
#'   results in `TRUE` values being the first color, and `FALSE` values
#'   receiving the second. With the three color option, the final color will be
#'   given to any `NA` values replaced through `na_val`.
#'
#' @param auto_align *Automatic alignment of the formatted column*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   The input values may have resulted in an alignment that is not as suitable
#'   once formatting has occurred. With `auto_align = TRUE`, the formatted
#'   values will be inspected and this may result in a favorable change in
#'   alignment. Typically, symbols will be center aligned whereas words will
#'   receive a left alignment (for words in LTR languages).
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_tf()` is compatible with body cells that are of the `"logical"`
#' (preferred) or `"numeric"` types. Any other types of body cells are ignored
#' during formatting. This is to say that cells of incompatible data types may
#' be targeted, but there will be no attempt to format them.
#'
#' There is a special caveat when attempting to format numerical values: the
#' values must either be exactly `1` (the analogue for `TRUE`) or exactly `0`
#' (the analogue for `FALSE`). Any other numerical values will be disregarded
#' and left as is. Because of these restrictions, it is recommended that only
#' logical values undergo formatting.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_tf()` to obtain
#' varying parameter values from a specified column within the table. This means
#' that each row could be formatted a little bit differently. These arguments
#' provide support for [from_column()]:
#'
#' - `tf_style`
#' - `pattern`
#' - `true_val`
#' - `false_val`
#' - `na_val`
#' - `locale`
#'
#' Please note that for each of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Formatting with the `tf_style` argument:
#'
#' We can supply a preset `TRUE`/`FALSE` style to the `tf_style` argument to
#' handle the formatting of logical values. There are several such styles and
#' the first three of them can handle localization to any supported locale
#' (i.e., the pairs of words for each style will be translated to the language
#' of the `locale`) value.
#'
#' The following table provides a listing of all valid `tf_style` values and a
#' description of their output values. The output from styles `4` to `10` are
#' described in terms of the Unicode character names used for the `TRUE` and
#' `FALSE` values.
#'
#' |    | TF Style      | Output (for `TRUE` and `FALSE`)                 |
#' |----|---------------|-------------------------------------------------|
#' | 1  | `"true-false"`| `"true"`, `"false"` (`locale`-aware)            |
#' | 2  | `"yes-no"`    | `"yes"`, `"no"` (`locale`-aware)                |
#' | 3  | `"up-down"`   | `"up"`, `"down"` (`locale`-aware)               |
#' | 4  | `"check-mark"`| `<Heavy Check Mark>`, `<Heavy Ballot X>`        |
#' | 5  | `"circles"`   | `<Black Circle>`, `<Heavy Circle>`              |
#' | 6  | `"squares"`   | `<Black Square>`,  `<White Square>`             |
#' | 7  | `"diamonds"`  | `<Black Diamond>`, `<White Diamond>`            |
#' | 8  | `"arrows"`    | `<Upwards Arrow>`, `<Downwards Arrow>`          |
#' | 9  | `"triangles"` | `<Black Up-Pointing Triangle>`, `<Black Down-Pointing Triangle>`|
#' | 10 | `"triangles-lr"`| `<Heavy Check Mark>`, `<Heavy Ballot X>`      |
#'
#' @section Adapting output to a specific `locale`:
#'
#' This formatting function can adapt outputs according to a provided `locale`
#' value. Examples include `"en"` for English (United States) and `"fr"` for
#' French (France). Note that a `locale` value provided here will override any
#' global locale setting performed in [gt()]'s own `locale` argument (it is
#' settable there as a value received by all other functions that have a
#' `locale` argument). As a useful reference on which locales are supported, we
#' can call [info_locales()] to view an info table.
#'
#' @section Examples:
#'
#' Let's use a subset of the [`sp500`] dataset to create a small **gt** table
#' containing opening and closing price data for a week in 2013. We can add
#' a logical column (`dir`) with [cols_add()]; the expression used determines
#' whether the `close` value is greater than the `open` value. That new column
#' is inserted between `open` and `close`. Then, we use `fmt_tf()` to generate
#' up and down arrows in the `dir` column. We elect to use green upward arrows
#' and red downward arrows (through the `colors` option). With a little numeric
#' formatting and changes to the column labels, the table becomes more presentable.
#'
#' ```r
#' sp500 |>
#'   dplyr::filter(date >= "2013-01-07" & date <= "2013-01-12") |>
#'   dplyr::arrange(date) |>
#'   dplyr::select(-c(adj_close, volume, high, low)) |>
#'   gt(rowname_col = "date") |>
#'   cols_add(dir = close > open, .after = open) |>
#'   fmt_tf(
#'     columns = dir,
#'     tf_style = "arrows",
#'     colors = c("green", "red")
#'   ) |>
#'   fmt_currency(columns = c(open, close)) |>
#'   cols_label(
#'     open = "Opening",
#'     close = "Closing",
#'     dir = ""
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_tf_1.png")`
#' }}
#'
#' The [`reactions`] dataset contains chemical kinetic information on a wide
#' variety of atmospherically-relevant compounds. It might be interesting to get
#' a summary (for a small subset of compounds) for which rate constants are
#' available for the selected compounds. We first start by selecting the
#' relevant rows and columns. Then we generate logical columns for each of the
#' reaction types (i.e., if a value is `NA` then there's no measurement, so
#' that's `FALSE`). Once the **gt** table has been created, we can use
#' `fmt_tf()` to provide open and filled circles to indicate whether a
#' particular reaction has been measured and presented in the literature.
#'
#' ```r
#' reactions |>
#'   dplyr::filter(cmpd_type %in% c("carboxylic acid", "alkyne", "allene")) |>
#'   dplyr::select(cmpd_name, cmpd_type, ends_with("k298")) |>
#'   dplyr::mutate(across(ends_with("k298"), is.na)) |>
#'   gt(rowname_col = "cmpd_name", groupname_col = "cmpd_type") |>
#'   tab_spanner(
#'     label = "Has a measured rate constant",
#'     columns = ends_with("k298")
#'   ) |>
#'   tab_stub_indent(
#'     rows = everything(),
#'     indent = 2
#'   ) |>
#'   fmt_tf(
#'     columns = ends_with("k298"),
#'     tf_style = "circles"
#'   ) |>
#'   cols_label(
#'     OH_k298 = "OH",
#'     O3_k298 = "Ozone",
#'     NO3_k298 = "Nitrate",
#'     Cl_k298 = "Chlorine"
#'   ) |>
#'   cols_width(
#'     stub() ~ px(200),
#'     ends_with("k298") ~ px(80)
#'   ) |>
#'   opt_vertical_padding(scale = 0.35)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_tf_2.png")`
#' }}
#'
#' There are census-based population values in the [`towny`] dataset and quite a
#' few small towns within it. Let's look at the ten smallest towns (according
#' to the 2021 figures) and work out whether their populations have increased or
#' declined since 1996. Also, let's determine which of these towns even have a
#' website. After that data preparation, the data is made into a **gt** table
#' and `fmt_tf()` can be used in the `website` and `pop_dir` columns (which both
#' have `TRUE`/`FALSE` values). Each of these `fmt_tf()` calls will either
#' produce `"yes"`/`"no"` or `"up"`/`"down"` strings (set via the `tf_style`
#' option).
#'
#' ```r
#' towny |>
#'   dplyr::arrange(population_2021) |>
#'   dplyr::mutate(website = !is.na(website))  |>
#'   dplyr::mutate(pop_dir = population_2021 > population_1996) |>
#'   dplyr::select(name, website, population_1996, population_2021, pop_dir) |>
#'   dplyr::slice_head(n = 10) |>
#'   gt(rowname_col = "name") |>
#'   tab_spanner(
#'     label = "Population",
#'     columns = starts_with("pop")
#'   ) |>
#'   tab_stubhead(label = "Town") |>
#'   fmt_tf(
#'     columns = website,
#'     tf_style = "yes-no",
#'     auto_align = FALSE
#'   ) |>
#'   fmt_tf(
#'     columns = pop_dir,
#'     tf_style = "up-down",
#'     pattern = "It's {x}."
#'   ) |>
#'   cols_label_with(
#'     columns = starts_with("population"),
#'     fn = function(x) sub("population_", "", x)
#'   ) |>
#'   cols_label(
#'     website = md("Has a  \n website?"),
#'     pop_dir = "Pop. direction?"
#'   ) |>
#'   opt_horizontal_padding(scale = 2)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_tf_3.png")`
#' }}
#'
#' If formatting to words instead of symbols (with the hyphenated `tf_style`
#' keywords), the words themselves can be translated to different languages
#' if providing a `locale` value. In this next example, we're manually creating
#' a tibble with locale codes and their associated languages. The `yes` and `up`
#' columns all receive `TRUE` whereas `no` and `down` will all be `FALSE`.
#' With two calls of `fmt_tf()` for each of these pairings, we get the columns'
#' namesake words. To have these words translated, the `locale` argument is
#' pointed toward values in the `code` column by using [from_column()].
#'
#' ```r
#' dplyr::tibble(
#'   code = c("de", "fr", "is", "tr", "ka", "lt", "ca", "bg", "lv"),
#'   lang = c(
#'     "German", "French", "Icelandic", "Turkish", "Georgian",
#'     "Lithuanian", "Catalan", "Bulgarian", "Latvian"
#'   ),
#'   yes = TRUE,
#'   no = FALSE,
#'   up = TRUE,
#'   down = FALSE
#' ) |>
#'   gt(rowname_col = "lang") |>
#'   tab_header(title = "Common words in a few languages") |>
#'   fmt_tf(
#'     columns = c(yes, no),
#'     tf_style = "yes-no",
#'     locale = from_column("code")
#'   ) |>
#'   fmt_tf(
#'     columns = c(up, down),
#'     tf_style = "up-down",
#'     locale = from_column("code")
#'   ) |>
#'   cols_merge(
#'     columns = c(lang, code),
#'     pattern = "{1} ({2})"
#'   ) |>
#'   cols_width(
#'     stub() ~ px(150),
#'     everything() ~ px(80)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_tf_4.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-19
#'
#' @section Function Introduced:
#' `v0.11.0` (July 9, 2024)
#'
#' @export
fmt_tf <- function(
    data,
    columns = everything(),
    rows = everything(),
    tf_style = "true-false",
    pattern = "{x}",
    true_val = NULL,
    false_val = NULL,
    na_val = NULL,
    colors = NULL,
    auto_align = TRUE,
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - tf_style
  # - pattern
  # - true_val
  # - false_val
  # - na_val
  # - locale

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_tf",
        all_args_except = c("data", "columns", "rows", "colors", "auto_align")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_tf(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          tf_style = p_i$tf_style %||% tf_style,
          pattern = p_i$pattern %||% pattern,
          true_val = p_i$true_val %||% true_val,
          false_val = p_i$false_val %||% false_val,
          na_val = p_i$na_val %||% na_val,
          locale = p_i$locale %||% locale
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Stop function if `locale` does not have a valid value; normalize locale
  # and resolve one that might be set globally
  validate_locale(locale = locale)
  locale <- normalize_locale(locale = locale)
  locale <- resolve_locale(data = data, locale = locale)

  # If `locale` is NULL then use the 'en' locale
  locale <- locale %||% "en"

  valid_class <- c("logical", "numeric")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  # Obtain the vector of `TRUE`/`FALSE` text values
  tf_vals_vec <- get_tf_vals(tf_style = tf_style, locale = locale)

  # If there are any values provided to `true_val` or `false_val`, use
  # those in preference to the values obtained from `get_tf_vals()`
  true_val <- true_val %||% tf_vals_vec[1]
  false_val <- false_val %||% tf_vals_vec[2]

  if (auto_align) {

    # As a first pass, assume that the `true_val` and `false_val` values that
    # are returned from one of the styles that produce text should result in
    # a left alignment of values
    if (
      is.character(tf_style) && !(tf_style %in% tf_formats_text()) ||
      is.numeric(tf_style) && !(tf_style %in% seq_along(tf_formats_text()))
    ) {
      alignment <- "center"
    } else {
      alignment <- "left"
    }

    # If an HTML entity is detected, prefer center alignment
    if (grepl("^&.*", true_val) || grepl("^&.*", false_val)) {
      alignment <- "center"
    }

    if (nchar(true_val) <= 1 || nchar(false_val) <= 1) {
      alignment <- "center"
    }

    # If using SVG graphics for either of `true_val` or `false_val` then
    # we'd prefer to have center alignment of the icons
    if (
      startsWith(true_val, "<svg ") || startsWith(false_val, "<svg ")
    ) {
      alignment <- "center"
    }

    data <-
      cols_align(
        data = data,
        align = alignment,
        columns = {{ columns }}
      )
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      html = function(x) {
        format_tf_by_context(
          x,
          true_val = true_val,
          false_val = false_val,
          na_val = na_val,
          colors = colors,
          pattern = pattern,
          context = "html"
        )
      },
      latex = function(x) {
        format_tf_by_context(
          x,
          true_val = true_val,
          false_val = false_val,
          na_val = na_val,
          colors = colors,
          pattern = pattern,
          context = "latex"
        )
      },
      rtf = function(x) {
        format_tf_by_context(
          x,
          true_val = true_val,
          false_val = false_val,
          na_val = na_val,
          colors = colors,
          pattern = pattern,
          context = "rtf"
        )
      },
      word = function(x) {
        format_tf_by_context(
          x,
          true_val = true_val,
          false_val = false_val,
          na_val = na_val,
          colors = colors,
          pattern = pattern,
          context = "word"
        )
      },
      default = function(x) {
        format_tf_by_context(
          x,
          true_val = true_val,
          false_val = false_val,
          na_val = na_val,
          colors = colors,
          pattern = pattern,
          context = "plain"
        )
      }
    )
  )
}

format_tf_by_context <- function(
    x,
    true_val,
    false_val,
    na_val,
    colors,
    pattern,
    context
) {

  # Generate a vector of empty strings that will eventually
  # contain all of the text values
  x_str <- character(length(x))

  x_str_non_missing <- x[!is.na(x)]

  if (!is.null(colors)) {
    true_val_color <- colors[1]

    if (is.na(colors[2])) {
      false_val_color <- colors[1]
    } else {
      false_val_color <- colors[2]
    }

    na_val_color <- colors[3]

  } else {
    true_val_color <- false_val_color <- na_val_color <- NULL
  }

  if (context == "html" && !is.null(colors)) {

    # Ensure that any empty strings are replaced with a '<br />'
    # when in an HTML context; this avoids the potential collapse of
    # rows with only empty strings
    if (!is.null(true_val) && true_val == "") {
      true_val <- "<br />"
    }
    if (!is.null(false_val) && false_val == "") {
      false_val <- "<br />"
    }
    if (!is.null(na_val) && na_val == "") {
      na_val <- "<br />"
    }

    true_val <- make_span_with_color(text = true_val, color = true_val_color)
    false_val <- make_span_with_color(text = false_val, color = false_val_color)
    na_val <- make_span_with_color(text = na_val, color = na_val_color)
  }

  # Replace any `TRUE` values, or, numbers that are exactly `1`
  x_str_non_missing[
    x_str_non_missing == TRUE | x_str_non_missing == 1
  ] <- true_val

  # Replace any `FALSE` values, or, numbers that are exactly `0`
  x_str_non_missing[
    x_str_non_missing == FALSE | x_str_non_missing == 0
  ] <- false_val

  # Handle formatting of pattern
  x_str_non_missing <- apply_pattern_fmt_x(x_str_non_missing, pattern = pattern)

  x_str[!is.na(x)] <- x_str_non_missing
  x_str[is.na(x)] <- na_val %||% NA_character_
  x_str
}

make_span_with_color <- function(text, color = NULL) {

  if (is.null(color) || is.null(text) || is.na(color)) {
    return(text)
  }

  paste0("<span style=\"color:", color, ";\">", text, "</span>")
}

# fmt_units() ------------------------------------------------------------------
#' Format measurement units
#'
#' @description
#'
#' `fmt_units()` lets you better format measurement units in the table body.
#' These must conform to **gt**'s specialized units notation (e.g.,
#' `"J Hz^-1 mol^-1"` can be used to generate units for the
#' *molar Planck constant*) for the best conversion. The notation here provides
#' several conveniences for defining units, so as long as the values to be
#' formatted conform to this syntax, you'll obtain nicely-formatted units no
#' matter what the table output format might be (i.e., HTML, LaTeX, RTF, etc.).
#' Details pertaining to the units notation can be found in the section entitled
#' *How to use **gt**'s units notation*.
#'
#' @inheritParams fmt_number
#'
#' @return An object of class `gt_tbl`.
#'
#' @section How to use **gt**'s units notation:
#'
#' The units notation involves a shorthand of writing units that feels familiar
#' and is fine-tuned for the task at hand. Each unit is treated as a separate
#' entity (parentheses and other symbols included) and the addition of subscript
#' text and exponents is flexible and relatively easy to formulate. This is all
#' best shown with examples:
#'
#' - `"m/s"` and `"m / s"` both render as `"m/s"`
#' - `"m s^-1"` will appear with the `"-1"` exponent intact
#' - `"m /s"` gives the same result, as `"/<unit>"` is equivalent to
#'   `"<unit>^-1"`
#' - `"E_h"` will render an `"E"` with the `"h"` subscript
#' - `"t_i^2.5"` provides a `t` with an `"i"` subscript and a `"2.5"` exponent
#' - `"m[_0^2]"` will use overstriking to set both scripts vertically
#' - `"g/L %C6H12O6%"` uses a chemical formula (enclosed in a pair of `"%"`
#'   characters) as a unit partial, and the formula will render correctly with
#'   subscripted numbers
#' - Common units that are difficult to write using ASCII text may be implicitly
#'   converted to the correct characters (e.g., the `"u"` in `"ug"`, `"um"`,
#'   `"uL"`, and `"umol"` will be converted to the Greek *mu* symbol; `"degC"`
#'   and `"degF"` will render a degree sign before the temperature unit)
#' - We can transform shorthand symbol/unit names enclosed in `":"` (e.g.,
#'   `":angstrom:"`, `":ohm:"`, etc.) into proper symbols
#' - Greek letters can added by enclosing the letter name in `":"`; you can
#'   use lowercase letters (e.g., `":beta:"`, `":sigma:"`, etc.) and uppercase
#'   letters too (e.g., `":Alpha:"`, `":Zeta:"`, etc.)
#' - The components of a unit (unit name, subscript, and exponent) can be
#'   fully or partially italicized/emboldened by surrounding text with `"*"` or
#'   `"**"`
#'
#' @section Examples:
#'
#' Let's use the [`illness`] dataset and create a new **gt** table. The `units`
#' column contains character values in **gt**'s specialized units notation
#' (e.g., `"x10^9 / L"`) so the `fmt_units()` function was used to better format
#' those units.
#'
#' ```r
#' illness |>
#'   gt() |>
#'   fmt_units(columns = units) |>
#'   sub_missing(columns = -starts_with("norm")) |>
#'   sub_missing(columns = c(starts_with("norm"), units), missing_text = "") |>
#'   sub_large_vals(rows = test == "MYO", threshold = 1200) |>
#'   fmt_number(
#'     decimals = 2,
#'     drop_trailing_zeros = TRUE
#'   ) |>
#'   tab_header(title = "Laboratory Findings for the YF Patient") |>
#'   tab_spanner(label = "Day", columns = starts_with("day")) |>
#'   cols_label_with(fn = ~ gsub("day_", "", .)) |>
#'   cols_merge_range(col_begin = norm_l, col_end = norm_u) |>
#'   cols_label(
#'     starts_with("norm") ~ "Normal Range",
#'     test ~ "Test",
#'     units ~ "Units"
#'   ) |>
#'   cols_width(
#'     starts_with("day") ~ px(80),
#'     everything() ~ px(120)
#'   ) |>
#'   tab_style(
#'     style = cell_text(align = "center"),
#'     locations = cells_column_labels(columns = starts_with("day"))
#'   ) |>
#'   tab_style(
#'     style = cell_fill(color = "aliceblue"),
#'     locations = cells_body(columns = c(test, units))
#'   ) |>
#'   opt_vertical_padding(scale = 0.4) |>
#'   opt_align_table_header(align = "left") |>
#'   tab_options(heading.padding = px(10))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_units_1.png")`
#' }}
#'
#' The [`constants`] dataset contains values for hundreds of fundamental
#' physical constants. We'll take a subset of values that have some molar basis
#' and generate a **gt** table from that. Like the [`illness`] dataset, this one
#' has a `units` column so, again, the `fmt_units()` function will be used to
#' format those units. Here, the preference for typesetting measurement units is
#' to have positive and negative exponents (e.g., not `"<unit_1> / <unit_2>"`
#' but rather `"<unit_1> <unit_2>^-1"`).
#'
#' ```r
#' constants |>
#'   dplyr::filter(grepl("molar", name)) |>
#'   gt() |>
#'   cols_hide(columns = c(uncert, starts_with("sf"))) |>
#'   fmt_units(columns = units) |>
#'   fmt_scientific(columns = value, decimals = 3) |>
#'   tab_header(title = "Physical Constants Having a Molar Basis") |>
#'   tab_options(column_labels.hidden = TRUE)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_units_2.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-20
#'
#' @section Function Introduced:
#' `v0.10.0` (October 7, 2023)
#'
#' @export
fmt_units <- function(
    data,
    columns = everything(),
    rows = everything()
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  valid_class <- c("character", "factor")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      html = function(x) {
        format_units_by_context(x, context = "html")
      },
      latex = function(x) {
        format_units_by_context(x, context = "latex")
      },
      rtf = function(x) {
        format_units_by_context(x, context = "rtf")
      },
      word = function(x) {
        format_units_by_context(x, context = "word")
      },
      default = function(x) {
        format_units_by_context(x, context = "plain")
      }
    )
  )
}

# fmt_chem() -------------------------------------------------------------------
#' Format chemical formulas
#'
#' @description
#'
#' `fmt_chem()` lets you format chemical formulas or even chemical
#' reactions in the table body. Often the input text will be in a common form
#' representing single compounds (like `"C2H4O"`, for acetaldehyde) but chemical
#' reactions can be used (e.g., `2CH3OH -> CH3OCH3 + H2O"`). So long as the
#' text within the targeted cells conforms to **gt**'s specialized chemistry
#' notation, the appropriate conversions will occur. Details pertaining to
#' chemistry notation can be found in the section entitled
#' *How to use **gt**'s chemistry notation*.
#'
#' @inheritParams fmt_number
#'
#' @return An object of class `gt_tbl`.
#'
#' @section How to use **gt**'s chemistry notation:
#'
#' The chemistry notation involves a shorthand of writing chemical formulas and
#' chemical reactions, if needed. It should feel familiar in its basic usage and
#' the more advanced typesetting tries to limit the amount of syntax needed.
#' It's always best to show examples on usage:
#'
#' - `"CH3O2"` and `"(NH4)2S"` will render with subscripted numerals
#' - Charges can be expressed with terminating `"+"` or `"-"`, as in `"H+"` and
#'   `"[AgCl2]-"`; if any charges involve the use of a number, the following
#'   incantations could be used: `"CrO4^2-"`, `"Fe^n+"`, `"Y^99+"`, `"Y^{99+}"`
#'   (the final two forms produce equivalent output)
#' - Stoichiometric values can be included with whole values prepending formulas
#'   (e.g.,  `"2H2O2"`) or by setting them off with a space, like this:
#'   `"2 H2O2"`, `"0.5 H2O"`, `"1/2 H2O"`, `"(1/2) H2O"`
#' - Certain standalone, lowercase letters or combinations thereof will be
#'   automatically stylized to fit conventions; `"NO_x"` and `"x Na(NH4)HPO4"`
#'   will have italicized 'x' characters and you can always italicize letters
#'   by surrounding with `"*"` (as in `"*n* H2O"` or `"*n*-C5H12"`)
#' - Chemical isotopes can be rendered using either of these two constructions
#'   preceding an element: `"^{227}_{90}Th"` or `"^227_90Th"`; nuclides can
#'   be represented in a similar manner, here are two examples:
#'   `"^{0}_{-1}n^{-}"`, `"^0_-1n-"`
#' - Chemical reactions can use `"+"` signs and a variety of reaction arrows:
#'   (1) `"A -> B"`, (2) `"A <- B"`, (3) `"A <-> B"`, (4) `"A <--> B"`, (5)
#'   `"A <=> B"`, (6) `"A <=>> B"`, or (7) `"A <<=> B"`
#' - Center dots (useful in addition compounds) can be added by using a single
#'   `"."` or `"*"` character, surrounded by spaces; here are two equivalent
#'   examples `"KCr(SO4)2 . 12 H2O"` and `"KCr(SO4)2 * 12 H2O"`
#' - Single and double bonds can be shown by inserting a `"-"` or `"="` between
#'   adjacent characters (i.e., these shouldn't be at the beginning or end of
#'   the markup); two examples: `"C6H5-CHO"`, `"CH3CH=CH2"`
#' - as with units notation, Greek letters can be inserted by surrounding the
#'   letter name with `":"`; here's an example that describes the delta value
#'   of carbon-13: `":delta: ^13C"`
#'
#' @section Examples:
#'
#' Let's use the [`reactions`] dataset and create a new **gt** table. The table
#' will be filtered down to only a few rows and columns. The column
#' `cmpd_formula` contains chemical formulas and the formatting of those will be
#' performed by `fmt_chem()`. Certain column labels with chemical names
#' (`o3_k298` and `no3_k298`) can be handled within [cols_label()] by using
#' surrounding the text with `"{{%"`/`"%}}"`.
#'
#' ```r
#' reactions |>
#'   dplyr::filter(cmpd_type == "terminal monoalkene") |>
#'   dplyr::filter(grepl("^1-", cmpd_name)) |>
#'   dplyr::select(cmpd_name, cmpd_formula, ends_with("k298")) |>
#'   gt() |>
#'   tab_header(title = "Gas-phase reactions of selected terminal alkenes") |>
#'   tab_spanner(
#'     label = "Reaction Rate Constant at 298 K",
#'     columns = ends_with("k298")
#'   ) |>
#'   fmt_chem(columns = cmpd_formula) |>
#'   fmt_scientific() |>
#'   sub_missing() |>
#'   cols_label(
#'     cmpd_name = "Alkene",
#'     cmpd_formula = "Formula",
#'     OH_k298 = "OH",
#'     O3_k298 = "{{%O3%}}",
#'     NO3_k298 = "{{%NO3%}}",
#'     Cl_k298 = "Cl"
#'   ) |>
#'   opt_align_table_header(align = "left")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_chem_1.png")`
#' }}
#'
#' Taking just a few rows from the [`photolysis`] dataset, let's create a new
#' **gt** table. The `cmpd_formula` and `products` columns both contain text in
#' chemistry notation (the first has compounds, and the second column has the
#' products of photolysis reactions). These columns will be formatted by
#' `fmt_chem()`. The compound formulas will be merged with the compound
#' names with [cols_merge()].
#'
#' ```r
#' photolysis |>
#'   dplyr::filter(cmpd_name %in% c(
#'     "hydrogen peroxide", "nitrous acid",
#'     "nitric acid", "acetaldehyde",
#'     "methyl peroxide", "methyl nitrate",
#'     "ethyl nitrate", "isopropyl nitrate"
#'   )) |>
#'   dplyr::select(-c(l, m, n, quantum_yield, type)) |>
#'   gt() |>
#'   tab_header(title = "Photolysis pathways of selected VOCs") |>
#'   fmt_chem(columns = c(cmpd_formula, products)) |>
#'   cols_nanoplot(
#'     columns = sigma_298_cm2,
#'     columns_x_vals = wavelength_nm,
#'     expand_x = c(200, 400),
#'     new_col_name = "cross_section",
#'     new_col_label = "Absorption Cross Section",
#'     options = nanoplot_options(
#'       show_data_points = FALSE,
#'       data_line_stroke_width = 4,
#'       data_line_stroke_color = "black",
#'       show_data_area = FALSE
#'     )
#'   ) |>
#'   cols_merge(
#'     columns = c(cmpd_name, cmpd_formula),
#'     pattern = "{1}, {2}"
#'   ) |>
#'   cols_label(
#'     cmpd_name = "Compound",
#'     products = "Products"
#'   ) |>
#'   opt_align_table_header(align = "left")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_chem_2.png")`
#' }}
#'
#' `fmt_chem()` can handle the typesetting of nuclide notation.
#' Let's take a subset of columns and rows from the [`nuclides`] dataset and
#' make a new **gt** table. The contents of the `nuclide` column contains
#' isotopes of hydrogen and carbon and this is placed in the table stub. Using
#' `fmt_chem()` makes it so that the subscripted and superscripted values are
#' properly formatted to the convention of formatting nuclides.
#'
#' ```r
#' nuclides |>
#'   dplyr::filter(element %in% c("H", "C")) |>
#'   dplyr::mutate(nuclide = gsub("[0-9]+$", "", nuclide)) |>
#'   dplyr::select(nuclide, atomic_mass, half_life, decay_1, is_stable) |>
#'   gt(rowname_col = "nuclide") |>
#'   tab_header(title = "Isotopes of Hydrogen and Carbon") |>
#'   tab_stubhead(label = "Isotope") |>
#'   fmt_chem(columns = nuclide) |>
#'   fmt_scientific(columns = half_life) |>
#'   fmt_number(
#'     columns = atomic_mass,
#'     decimals = 4,
#'     scale_by = 1 / 1e6
#'   ) |>
#'   sub_missing(
#'     columns = half_life,
#'     rows = is_stable,
#'     missing_text = md("**STABLE**")
#'   ) |>
#'   sub_missing(columns = half_life, rows = !is_stable) |>
#'   sub_missing(columns = decay_1) |>
#'   data_color(
#'     columns = decay_1,
#'     target_columns = c(atomic_mass, half_life, decay_1),
#'     palette = "LaCroixColoR::PassionFruit",
#'     na_color = "white"
#'   ) |>
#'   cols_label_with(fn = function(x) tools::toTitleCase(gsub("_", " ", x))) |>
#'   cols_label(decay_1 = "Decay Mode") |>
#'   cols_width(
#'     stub() ~ px(70),
#'     c(atomic_mass, half_life, decay_1) ~ px(120)
#'   ) |>
#'   cols_hide(columns = c(is_stable)) |>
#'   cols_align(align = "center", columns = decay_1) |>
#'   opt_align_table_header(align = "left") |>
#'   opt_vertical_padding(scale = 0.5)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_chem_3.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-21
#'
#' @section Function Introduced:
#' `v0.11.0` (July 9, 2024)
#'
#' @export
fmt_chem <- function(
    data,
    columns = everything(),
    rows = everything()
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  valid_class <- c("character", "factor")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      html = function(x) {
        format_units_by_context(
          x,
          is_chemical_formula = TRUE,
          context = "html"
        )
      },
      latex = function(x) {
        format_units_by_context(
          x,
          is_chemical_formula = TRUE,
          context = "latex"
        )
      },
      rtf = function(x) {
        format_units_by_context(
          x,
          is_chemical_formula = TRUE,
          context = "rtf"
        )
      },
      word = function(x) {
        format_units_by_context(
          x,
          is_chemical_formula = TRUE,
          context = "word"
        )
      },
      default = function(x) {
        format_units_by_context(
          x,
          is_chemical_formula = TRUE,
          context = "plain"
        )
      }
    )
  )
}

format_units_by_context <- function(
    x,
    is_chemical_formula = FALSE,
    context = "html"
) {

  # Generate a vector of empty strings that will eventually
  # contain all of the ranged value text
  x_str <- character(length(x))

  x_str_non_missing <- x[!is.na(x)]

  x_str_non_missing <- as.character(x_str_non_missing)

  x_str_non_missing <-
    vapply(
      seq_along(x_str_non_missing),
      FUN.VALUE = character(1L),
      USE.NAMES = FALSE,
      FUN = function(x) {
        render_units(
          define_units(
            x_str_non_missing[x],
            is_chemical_formula = is_chemical_formula
          ),
        context = context
        )
      }
    )

  x_str[!is.na(x)] <- x_str_non_missing
  x_str[is.na(x)] <- NA_character_
  x_str
}

# fmt_url() --------------------------------------------------------------------
#' Format URLs to generate links
#'
#' @description
#'
#' Should cells contain URLs, `fmt_url()` can be used to make them
#' navigable links. This should be expressly used on columns that contain *only*
#' URL text (i.e., no URLs as part of a larger block of text). Should you have
#' such a column of data, there are options for how the links should be styled.
#' They can be of the conventional style (with underlines and text coloring that
#' sets it apart from other text), or, they can appear to be button-like (with
#' a surrounding box that can be filled with a color of your choosing).
#'
#' URLs in data cells are detected in two ways. The first is using the simple
#' Markdown notation for URLs of the form: `[label](URL)`. The second assumes
#' that the text is the URL. In the latter case the URL is also used as the
#' label but there is the option to use the `label` argument to modify that
#' text.
#'
#' @inheritParams fmt_number
#'
#' @param label *Link label*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   The visible 'label' to use for the link. If `NULL` (the default)
#'   the URL will serve as the label. There are two non-`NULL` options: (1) a
#'   piece of static text can be used for the label by providing a string, and
#'   (2) a function can be provided to fashion a label from every URL.
#'
#' @param as_button *Style link as a button*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   An option to style the link as a button. By default, this is
#'   `FALSE`. If this option is chosen then the `button_fill` argument becomes
#'   usable.
#'
#' @param color *Link color*
#'
#'   `scalar<character>` // *default:* `"auto"`
#'
#'   The color used for the resulting link and its underline. This is
#'   `"auto"` by default; this allows **gt** to choose an appropriate color
#'   based on various factors (such as the background `button_fill` when
#'   `as_button` is `TRUE`).
#'
#' @param show_underline *Show the link underline*
#'
#'   `scalar<character>|scalar<logical>` // *default:* `"auto"`
#'
#'   Should the link be decorated with an underline? By
#'   default this is `"auto"` which means that **gt** will choose `TRUE` when
#'   `as_button = FALSE` and `FALSE` in the other case. The link underline will
#'   be the same color as that set in the `color` option.
#'
#' @param button_fill,button_width,button_outline *Button options*
#'
#'   `scalar<character>` // *default:* `"auto"`
#'
#'   Options for styling a link-as-button (and only applies if
#'   `as_button = TRUE`). All of these options are by default set to `"auto"`,
#'   allowing **gt** to choose appropriate fill, width, and outline values.
#'
#' @param target,rel,referrerpolicy,hreflang *Anchor element attributes*
#'
#'   `scalar<character>` // *default:* `NULL`
#'
#'   Additional anchor element attributes. For descriptions of each attribute
#'   and the allowed values, refer to the [MDN Web Docs reference on the anchor
#'   HTML element](
#'   https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attributes).
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_url()` is compatible with body cells that are of the `"character"` or
#' `"factor"` types. Any other types of body cells are ignored during formatting.
#' This is to say that cells of incompatible data types may be targeted, but
#' there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_url()` to obtain
#' varying parameter values from a specified column within the table. This means
#' that each row could be formatted a little bit differently. These arguments
#' provide support for [from_column()]:
#'
#' - `label`
#' - `as_button`
#' - `color`
#' - `show_underline`
#' - `button_fill`
#' - `button_width`
#' - `button_outline`
#'
#' Please note that for each of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Examples:
#'
#' Using a portion of the [`towny`] dataset, let's create a **gt** table. We can
#' use `fmt_url()` on the `website` column to generate navigable links to
#' websites. By default the links are underlined and the color will be chosen
#' for you (it's dark cyan).
#'
#' ```r
#' towny |>
#'   dplyr::filter(csd_type == "city") |>
#'   dplyr::select(name, website, population_2021) |>
#'   dplyr::slice_max(population_2021, n = 10) |>
#'   gt() |>
#'   tab_header(
#'     title = md("The 10 Largest Municipalities in `towny`"),
#'     subtitle = "Population values taken from the 2021 census."
#'   ) |>
#'   fmt_integer() |>
#'   fmt_url(columns = website) |>
#'   cols_label(
#'     name = "Name",
#'     website = "Site",
#'     population_2021 = "Population"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_url_1.png")`
#' }}
#'
#' Let's try something else. We can set a static text label for the link with
#' the `label` argument (and we'll use the word `"site"` for this). The link
#' underline is removable with `show_underline = FALSE`. With this change, it
#' seems sensible to merge the link to the `"name"` column and enclose the link
#' text in parentheses ([cols_merge()] handles all that).
#'
#' ```r
#' towny |>
#'   dplyr::filter(csd_type == "city") |>
#'   dplyr::select(name, website, population_2021) |>
#'   dplyr::slice_max(population_2021, n = 10) |>
#'   gt() |>
#'   tab_header(
#'     title = md("The 10 Largest Municipalities in `towny`"),
#'     subtitle = "Population values taken from the 2021 census."
#'   ) |>
#'   fmt_integer() |>
#'   fmt_url(
#'     columns = website,
#'     label = "site",
#'     show_underline = FALSE
#'   ) |>
#'   cols_merge(
#'     columns = c(name, website),
#'     pattern = "{1} ({2})"
#'   ) |>
#'   cols_label(
#'     name = "Name",
#'     population_2021 = "Population"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_url_2.png")`
#' }}
#'
#' `fmt_url()` allows for the styling of links as 'buttons'. This is as easy as
#' setting `as_button = TRUE`. Doing that unlocks the ability to  set a
#' `button_fill` color. This color can automatically selected by **gt**
#' (this is the default) but here we're using `"steelblue"`. The `label`
#' argument also accepts a function! We can choose to adapt the label text from
#' the URLs by eliminating any leading `"https://"` or `"www."` parts.
#'
#' ```r
#' towny |>
#'   dplyr::filter(csd_type == "city") |>
#'   dplyr::select(name, website, population_2021) |>
#'   dplyr::slice_max(population_2021, n = 10) |>
#'   dplyr::mutate(ranking = dplyr::row_number()) |>
#'   gt(rowname_col = "ranking") |>
#'   tab_header(
#'     title = md("The 10 Largest Municipalities in `towny`"),
#'     subtitle = "Population values taken from the 2021 census."
#'   ) |>
#'   fmt_integer() |>
#'   fmt_url(
#'     columns = website,
#'     label = function(x) gsub("https://|www.", "", x),
#'     as_button = TRUE,
#'     button_fill = "steelblue",
#'     button_width = px(150)
#'   ) |>
#'   cols_move_to_end(columns = website) |>
#'   cols_align(align = "center", columns = website) |>
#'   cols_width(
#'     ranking ~ px(40),
#'     website ~ px(200)
#'   ) |>
#'   tab_options(column_labels.hidden = TRUE) |>
#'   tab_style(
#'     style = cell_text(weight = "bold"),
#'     locations = cells_stub()
#'   ) |>
#'   opt_vertical_padding(scale = 0.75)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_url_3.png")`
#' }}
#'
#' It's perhaps inevitable that you'll come across missing values in your column
#' of URLs. `fmt_url()` will preserve input `NA` values, allowing you to handle
#' them with [sub_missing()]. Here's an example of that.
#'
#' ```r
#' towny |>
#'   dplyr::select(name, website, population_2021) |>
#'   dplyr::slice_min(population_2021, n = 10) |>
#'   gt() |>
#'   tab_header(
#'     title = md("The 10 Smallest Municipalities in `towny`"),
#'     subtitle = "Population values taken from the 2021 census."
#'   ) |>
#'   fmt_integer() |>
#'   fmt_url(columns = website) |>
#'   cols_label(
#'     name = "Name",
#'     website = "Site",
#'     population_2021 = "Population"
#'   ) |>
#'   sub_missing()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_url_4.png")`
#' }}
#'
#' Links can be presented as icons. Let's take a look at an example of this type
#' of presentation with a table based on the [`films`] dataset. The `imdb_url`
#' column contains the URL information and in the `fmt_url()` call, we can use
#' `fontawesome::fa()` to specify a `label`. In this case we elect to use the
#' `"link"` icon and we can make some sizing adjustments to the icon here to
#' ensure the layout looks optimal. We also use [`cols_merge()`] to combine
#' the film's title, its original title (if present), and the link icon.
#'
#' ```r
#' films |>
#'   dplyr::filter(year == 2021) |>
#'   dplyr::select(
#'     contains("title"), run_time, director, imdb_url
#'   ) |>
#'   gt() |>
#'   tab_header(title = "Feature Films in Competition at the 2021 Festival") |>
#'   fmt_url(
#'     columns = imdb_url,
#'     label = fontawesome::fa(
#'       name = "link",
#'       height = "0.75em",
#'       vertical_align = "0em"
#'      ),
#'     color = "gray65"
#'   ) |>
#'   cols_merge(
#'     columns = c(title, original_title, imdb_url),
#'     pattern = "{1}<< ({2})>> {3}"
#'   ) |>
#'   cols_label(
#'     title = "Film",
#'     run_time = "Length",
#'     director = "Director(s)",
#'   ) |>
#'   tab_options(heading.title.font.size = px(26)) |>
#'   opt_vertical_padding(scale = 0.4) |>
#'   opt_horizontal_padding(scale = 2) |>
#'   opt_align_table_header(align = "left")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_url_5.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-22
#'
#' @section Function Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
#' @export
fmt_url <- function(
    data,
    columns = everything(),
    rows = everything(),
    label = NULL,
    as_button = FALSE,
    color = "auto",
    show_underline = "auto",
    button_fill = "auto",
    button_width = "auto",
    button_outline = "auto",
    target = NULL,
    rel = NULL,
    referrerpolicy = NULL,
    hreflang = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - label
  # - as_button
  # - color
  # - show_underline
  # - button_fill
  # - button_width
  # - button_outline

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_url",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_url(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          label = p_i$label %||% label,
          as_button = p_i$as_button %||% as_button,
          color = p_i$color %||% color,
          show_underline = p_i$show_underline %||% show_underline,
          button_fill = p_i$button_fill %||% button_fill,
          button_width = p_i$button_width %||% button_width,
          button_outline = p_i$button_outline %||% button_outline
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  valid_class <- c("character", "factor")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  if (as_button) {

    #
    # All determinations of `color`, `show_underline`, `button_fill` and
    # `button_width` for the case where `as_button = TRUE`; each of the
    # above arguments are set to "auto" by default
    #

    # In the button case, we opt to never show an underline unless it's
    # requested by the user (i.e., `show_underline = TRUE`)
    if (show_underline == "auto") {
      show_underline <- FALSE
    }

    if (button_width == "auto") {
      button_width <- NULL
    }

    button_outline_color <- button_outline
    button_outline_style <- "solid"
    button_outline_width <- "2px"

    # There are various combinations of "auto" or not with `button_fill` and
    # `color` that need to be handled delicately so as to ensure contrast
    # between foreground text and background fill is maximized
    if (button_fill == "auto" && color == "auto") {

      # Choose a fixed and standard color combination if both options are
      # 'auto'; these will be 'steelblue' and 'white'
      button_fill <- "#4682B4"
      color <- "#FFFFFF"

    } else if (button_fill == "auto" && color != "auto") {

      # Case where text color is chosen but background is left to gt
      # to determine; will either by light blue or dark blue based on the
      # brightness of the text color (can be of poor contrast if user chooses
      # a text color somewhere in the mid range of brightness, but nothing
      # really can be done there to compensate)

      # Ensure that the incoming `color` is transformed to hexadecimal form
      color <- html_color(colors = color, alpha = NULL)

      # Use `ideal_fgnd_color()` in a backwards manner only to see whether
      # the proxy background color is light (#FFFFFF) or dark (#000000)
      bgrnd_bw <-
        ideal_fgnd_color(
          bgnd_color = color,
          algo = "apca"
        )

      if (bgrnd_bw == "#FFFFFF") {
        # Background should be light so using 'lightblue'
        button_fill <- "#ADD8E6"
      } else {
        # Background should be dark so using 'darkblue'
        button_fill <- "#00008B"
      }

      if (button_outline == "auto") {
        button_outline_color <- "#BEBEBE"
        button_outline_style <- "none"
      }

    } else if (button_fill != "auto" && color == "auto") {

      # Ensure that the incoming `button_fill` is transformed
      # to hexadecimal form
      button_fill <- html_color(colors = button_fill, alpha = NULL)

      # Case where background color is chosen for foreground text color is
      # not; this is the simple case where `ideal_fgnd_color()` is well suited
      # to determine the text color (either black or white)
      color <-
        ideal_fgnd_color(
          bgnd_color = button_fill,
          algo = "apca"
        )

      if (button_outline == "auto") {

        button_outline_color <- "#DFDFDF"

        if (button_fill %in% c(
          "#FFFFFF", "#FFFFFF", "#FAF5EF", "#FAFAFA",
          "#FFFEFC", "#FBFCFA", "#FBFAF2"
        )) {
          button_outline_style <- "solid"
        } else {
          button_outline_style <- "none"
        }
      }
    } else {

      # Ensure that the incoming `color` is transformed to hexadecimal form
      color <- html_color(colors = color, alpha = NULL)
    }

  } else {

    if (show_underline == "auto") {
      show_underline <- TRUE
    }

    if (color == "auto") {

      color <- "#008B8B"

    } else {

      # Ensure that the incoming `color` is transformed to hexadecimal form
      color <- html_color(colors = color, alpha = NULL)
    }
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      html = function(x) {

        # Generate a vector of empty strings that will eventually
        # contain all of the link text
        x_str <- character(length(x))

        x_str_non_missing <- x[!is.na(x)]

        if (!is.null(label)) {

          if (rlang::is_function(label)) {
            label_str <- label(x_str_non_missing)
          } else {
            label_str <- label
          }

        } else {

          md_url_parsed <- parse_md_urls(text = x_str_non_missing)

          x_str_non_missing <- md_url_parsed$href
          label_str <- md_url_parsed$label
        }

        target <- target %||% "_blank"
        target_values <- NULL

        if (startsWith(target, "_")) {
          target_values <- c("_blank", "_self", "_parent", "_top")
        }

        anchor_attr <-
          add_anchor_attr(
            arg = target,
            nm = "target",
            values = target_values
          )

        if (!is.null(rel)) {

          anchor_attr <-
            add_anchor_attr(
              anchor_attr,
              rel,
              nm = "rel",
              values = c(
                "alternate", "author", "bookmark", "external", "help",
                "license", "next", "nofollow", "noreferrer", "noopener",
                "prev", "search", "tag"
              )
            )
        }

        if (!is.null(referrerpolicy)) {

          anchor_attr <-
            add_anchor_attr(
              anchor_attr,
              referrerpolicy,
              nm = "referrerpolicy",
              values = c(
                "no-referrer", "no-referrer-when-downgrade", "origin",
                "origin-when-cross-origin", "same-origin", "strict-origin",
                "strict-origin-when-cross-origin", "unsafe-url"
              )
            )
        }

        if (!is.null(hreflang)) {

          anchor_attr <-
            add_anchor_attr(
            anchor_attr,
            arg = hreflang,
            nm = "hreflang"
          )
        }

        anchor_attr <-
          add_anchor_attr(
            anchor_attr,
            arg = paste0(
              "color:", color[1], ";",
              "text-decoration:",
              if (show_underline) "underline" else "none", ";",
              if (show_underline) "text-underline-position: under;" else NULL,
              "display: inline-block;",
              if (as_button) {
                paste0(
                  "background-color: ", button_fill, ";",
                  "padding: 8px 12px;",
                  if (!is.null(button_width)) {
                    paste0("width: ", button_width, "; text-align: center;")
                  } else {
                    NULL
                  },
                  "outline-style: ", button_outline_style, "; ",
                  "outline-color: ", button_outline_color, "; ",
                  "outline-width: ", button_outline_width, ";"
                )
              } else {
                NULL
              }
            ),
            nm = "style"
          )

        x_str_non_missing <-
          paste0(
            "<span style=\"white-space: pre;\">",
            "<a",
            " href=\"", x_str_non_missing, "\"",
            anchor_attr,
            ">",
            label_str,
            "</a>",
            "</span>"
          )

        x_str[!is.na(x)] <- x_str_non_missing
        x_str[is.na(x)] <- NA_character_
        x_str
      },
      latex = function(x) {
        x
      },
      rtf = function(x) {
        x
      },
      word = function(x) {
        x
      },
      default = function(x) {
        x
      }
    )
  )
}

parse_md_urls <- function(text) {

  if (any(grepl("\\[.*?\\]\\(.*?\\)", text))) {

    # Generate labels
    label_str <-
      vapply(
        text,
        FUN.VALUE = character(1L),
        USE.NAMES = FALSE,
        FUN = function(x) {
          if (grepl("\\[.*?\\]\\(.*?\\)", x)) {
            out <- sub("\\[(.*?)\\]\\(.*?\\)", "\\1", x)
          } else {
            out <- x
          }
          out
        }
      )

    # Generate href values
    href_str <-
      vapply(
        text,
        FUN.VALUE = character(1L),
        USE.NAMES = FALSE,
        FUN = function(x) {
          if (grepl("\\[.*?\\]\\(.*?\\)", x)) {
            out <- sub("\\[.*?\\]\\((.*?)\\)", "\\1", x)
          } else {
            out <- x
          }
          out
        }
      )

  } else {
    href_str <- text
    label_str <- text
  }

  list(
    href = href_str,
    label = label_str
  )
}

add_anchor_attr <- function(
    init = NULL,
    arg,
    nm,
    values = NULL,
    error_arg = rlang::caller_arg(arg),
    error_call = rlang::caller_env()
) {

  if (!is.null(values)) {

    arg <-
      rlang::arg_match(
        arg,
        values = values,
        error_arg = error_arg,
        error_call = error_call
      )
  }

  if (!rlang::is_string(arg)) {
    cli::cli_abort(
      "{.arg {nm}} must be a string, not {.obj_type_friendly {arg}}",
      call = error_call
    )
  }

  paste0(init, " ", nm, "=\"", arg, "\"")
}

# fmt_email() ------------------------------------------------------------------
#' Format email addresses to generate 'mailto:' links
#'
#' @description
#'
#' Should cells contain email addresses, `fmt_email()` can be used to make email
#' addresses work well with email clients on the user system. This should be
#' expressly used on columns that contain *only* email addresses (i.e., no email
#' addresses as part of a larger block of text). Should you have such a column
#' of data, there are options for how the email addresses should be styled. They
#' can be of the conventional style (with underlines and text coloring that sets
#' it apart from other text), or, they can appear to be button-like (with a
#' surrounding box that can be filled with a color of your choosing).
#'
#' Email addresses in data cells are trusted as email addresses. We can also
#' provide more readable labels with the `display_name` argument. Supplying a
#' single value there will show the same label for all email addresses but
#' display names from an adjacent column could be used via a [from_column()]
#' call within `display_name`.
#'
#' @inheritParams fmt_number
#'
#' @param display_name *Display name for the email address*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   The display name is the visible 'label' to use for the email address. If
#'   `NULL` (the default) the address itself will serve as the display name.
#'   There are two non-`NULL` options: (1) a piece of static text can be used
#'   for the display name by providing a string, and (2) a function can be
#'   provided to fashion a display name from every email address.
#'
#' @param as_button *Style email address as a button*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   An option to style the email address as a button. By default, this is
#'   `FALSE`. If this option is chosen then the `button_fill` argument becomes
#'   usable.
#'
#' @param color *Link color*
#'
#'   `scalar<character>` // *default:* `"auto"`
#'
#'   The color used for the resulting email address and its underline. This is
#'   `"auto"` by default; this allows **gt** to choose an appropriate color
#'   based on various factors (such as the background `button_fill` when
#'   `as_button` is `TRUE`).
#'
#' @param show_underline *Show the link underline*
#'
#'   `scalar<character>|scalar<logical>` // *default:* `"auto"`
#'
#'   Should the email address be decorated with an underline? By default this is
#'   `"auto"` which means that **gt** will choose `TRUE` when
#'   `as_button = FALSE` and `FALSE` in the other case. The underline will be
#'   the same color as that set in the `color` option.
#'
#' @param button_fill,button_width,button_outline *Button options*
#'
#'   `scalar<character>` // *default:* `"auto"`
#'
#'   Options for styling an email address as a button (and only applies if
#'   `as_button = TRUE`). All of these options are by default set to `"auto"`,
#'   allowing **gt** to choose appropriate fill, width, and outline values.
#'
#' @param target *The 'target' anchor element attribute*
#'
#'   `scalar<character>` // *default:* `NULL`
#'
#'   The anchor element 'target' attribute value. For a description of the
#'   'target' attribute and its  allowed values, refer to the
#'   [MDN Web Docs reference on the anchor HTML element](
#'   https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attributes).
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_email()` is compatible with body cells that are of the `"character"` or
#' `"factor"` types. Any other types of body cells are ignored during
#' formatting. This is to say that cells of incompatible data types may be
#' targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_email()` to obtain
#' varying parameter values from a specified column within the table. This means
#' that each row could be formatted a little bit differently. These arguments
#' provide support for [from_column()]:
#'
#' - `display_name`
#' - `as_button`
#' - `color`
#' - `show_underline`
#' - `button_fill`
#' - `button_width`
#' - `button_outline`
#'
#' Please note that for each of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Examples:
#'
#' Let's take ten rows from the [`peeps`] dataset and create a table of contact
#' information with mailing addresses and email addresses. With the column that
#' contains email addresses (`email_addr`), we can use `fmt_email()` to generate
#' 'mailto:' links. Clicking any of these formatted email addresses should
#' result in new message creation (depending on the OS integration with an email
#' client).
#'
#' ```r
#' peeps |>
#'   dplyr::filter(country == "AUS") |>
#'   dplyr::select(
#'     starts_with("name"),
#'     address, city, state_prov, postcode, country, email_addr
#'   ) |>
#'   dplyr::mutate(city = toupper(city)) |>
#'   gt(rowname_col = "name_family") |>
#'   tab_header(title = "Our Contacts in Australia") |>
#'   tab_stubhead(label = "Name") |>
#'   fmt_email(columns = email_addr) |>
#'   fmt_country(columns = country) |>
#'   cols_merge(
#'     columns = c(address, city, state_prov, postcode, country),
#'     pattern = "{1}<br>{2} {3} {4}<br>{5}"
#'   ) |>
#'   cols_merge(
#'     columns = c(name_family, name_given),
#'     pattern = "{1},<br>{2}"
#'   ) |>
#'   cols_label(
#'     address = "Mailing Address",
#'     email_addr = "Email"
#'   ) |>
#'   tab_style(
#'     style = cell_text(size = "x-small"),
#'     locations = cells_body(columns = address)
#'   ) |>
#'   opt_align_table_header(align = "left")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_email_1.png")`
#' }}
#'
#' We can further condense the table by reducing the email link to an icon. The
#' approach we take here is the use of a **fontawesome** icon within the
#' `display_name` argument. The icon used is `"envelope"` and each icon produced
#' serves as a clickable 'mailto:' link. By adjusting one of the [cols_merge()]
#' calls, we can place the icon/link next to the name of the person.
#'
#' ```r
#' peeps |>
#'   dplyr::filter(country == "AUS") |>
#'   dplyr::select(
#'     starts_with("name"),
#'     address, city, state_prov, postcode, country, email_addr
#'   ) |>
#'   dplyr::mutate(city = toupper(city)) |>
#'   gt(rowname_col = "name_family") |>
#'   tab_header(title = "Our Contacts in Australia") |>
#'   fmt_email(
#'     columns = email_addr,
#'     display_name = fontawesome::fa(
#'       name = "envelope",
#'       height = "0.75em",
#'       fill = "gray"
#'     )
#'   ) |>
#'   fmt_country(columns = country) |>
#'   cols_merge(
#'     columns = c(address, city, state_prov, postcode, country),
#'     pattern = "{1}<br>{2} {3} {4}<br>{5}"
#'   ) |>
#'   cols_merge(
#'     columns = c(name_family, name_given, email_addr),
#'     pattern = "{1}, {2} {3}"
#'   ) |>
#'   cols_width(everything() ~ px(200)) |>
#'   tab_style(
#'     style = cell_text(size = px(11)),
#'     locations = cells_body(columns = address)
#'   ) |>
#'   tab_options(column_labels.hidden = TRUE) |>
#'   opt_align_table_header(align = "left")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_email_2.png")`
#' }}
#'
#' Another option is to display the names of the email recipients instead of the
#' email addresses, making the display names serve as 'mailto:' links. We can do
#' this by using [from_column()] in the `display_name` argument. The display
#' names in this case are the combined given and family names, handled earlier
#' through a `dplyr::mutate()` call. With some space conserved, we take the
#' opportunity here to add in phone information for each person.
#'
#' ```r
#' peeps |>
#'   dplyr::filter(country == "AUS") |>
#'   dplyr::mutate(name = paste(name_given, name_family)) |>
#'   dplyr::mutate(city = toupper(city)) |>
#'   dplyr::mutate(phone_number = gsub("^\\(0|\\)", "", phone_number)) |>
#'   dplyr::select(
#'     name, address, city, state_prov, postcode, country,
#'     email_addr, phone_number, country_code
#'   ) |>
#'   gt(rowname_col = "email_addr") |>
#'   tab_header(title = "Our Contacts in Australia") |>
#'   tab_stubhead(label = "Name") |>
#'   fmt_email(
#'     columns = email_addr,
#'     display_name = from_column("name"),
#'     color = "gray25"
#'   ) |>
#'   cols_hide(columns = name) |>
#'   fmt_country(columns = country) |>
#'   cols_merge(
#'     columns = c(address, city, state_prov, postcode, country),
#'     pattern = "{1}<br>{2} {3} {4}<br>{5}"
#'   ) |>
#'   cols_merge(
#'     columns = c(phone_number, country_code),
#'     pattern = "+{2} {1}"
#'   ) |>
#'   cols_label(
#'     address = "Mailing Address",
#'     email_addr = "Email",
#'     phone_number = "Phone"
#'   ) |>
#'   cols_move_to_start(columns = phone_number) |>
#'   cols_width(everything() ~ px(170)) |>
#'   tab_style(
#'     style = cell_text(size = px(11)),
#'     locations = cells_body(columns = address)
#'   ) |>
#'   cols_align(align = "left") |>
#'   opt_align_table_header(align = "left")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_email_3.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-23
#'
#' @section Function Introduced:
#' `v0.11.0` (July 9, 2024)
#'
#' @export
fmt_email <- function(
    data,
    columns = everything(),
    rows = everything(),
    display_name = NULL,
    as_button = FALSE,
    color = "auto",
    show_underline = "auto",
    button_fill = "auto",
    button_width = "auto",
    button_outline = "auto",
    target = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - display_name
  # - as_button
  # - color
  # - show_underline
  # - button_fill
  # - button_width
  # - button_outline

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_email",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_email(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          display_name = p_i$display_name %||% display_name,
          as_button = p_i$as_button %||% as_button,
          color = p_i$color %||% color,
          show_underline = p_i$show_underline %||% show_underline,
          button_fill = p_i$button_fill %||% button_fill,
          button_width = p_i$button_width %||% button_width,
          button_outline = p_i$button_outline %||% button_outline
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  valid_class <- c("character", "factor")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  if (as_button) {

    #
    # All determinations of `color`, `show_underline`, `button_fill` and
    # `button_width` for the case where `as_button = TRUE`; each of the
    # above arguments are set to "auto" by default
    #

    # In the button case, we opt to never show an underline unless it's
    # requested by the user (i.e., `show_underline = TRUE`)
    if (show_underline == "auto") {
      show_underline <- FALSE
    }

    if (button_width == "auto") {
      button_width <- NULL
    }

    button_outline_color <- button_outline
    button_outline_style <- "solid"
    button_outline_width <- "2px"

    # There are various combinations of "auto" or not with `button_fill` and
    # `color` that need to be handled delicately so as to ensure contrast
    # between foreground text and background fill is maximized
    if (button_fill == "auto" && color == "auto") {

      # Choose a fixed and standard color combination if both options are
      # 'auto'; these will be 'steelblue' and 'white'
      button_fill <- "#4682B4"
      color <- "#FFFFFF"

    } else if (button_fill == "auto" && color != "auto") {

      # Case where text color is chosen but background is left to gt
      # to determine; will either by light blue or dark blue based on the
      # brightness of the text color (can be of poor contrast if user chooses
      # a text color somewhere in the mid range of brightness, but nothing
      # really can be done there to compensate)

      # Ensure that the incoming `color` is transformed to hexadecimal form
      color <- html_color(colors = color, alpha = NULL)

      # Use `ideal_fgnd_color()` in a backwards manner only to see whether
      # the proxy background color is light (#FFFFFF) or dark (#000000)
      bgrnd_bw <-
        ideal_fgnd_color(
          bgnd_color = color,
          algo = "apca"
        )

      if (bgrnd_bw == "#FFFFFF") {
        # Background should be light so using 'lightblue'
        button_fill <- "#ADD8E6"
      } else {
        # Background should be dark so using 'darkblue'
        button_fill <- "#00008B"
      }

      if (button_outline == "auto") {
        button_outline_color <- "#BEBEBE"
        button_outline_style <- "none"
      }

    } else if (button_fill != "auto" && color == "auto") {

      # Ensure that the incoming `button_fill` is transformed
      # to hexadecimal form
      button_fill <- html_color(colors = button_fill, alpha = NULL)

      # Case where background color is chosen for foreground text color is
      # not; this is the simple case where `ideal_fgnd_color()` is well suited
      # to determine the text color (either black or white)
      color <-
        ideal_fgnd_color(
          bgnd_color = button_fill,
          algo = "apca"
        )

      if (button_outline == "auto") {

        button_outline_color <- "#DFDFDF"

        if (button_fill %in% c(
          "#FFFFFF", "#FFFFFF", "#FAF5EF", "#FAFAFA",
          "#FFFEFC", "#FBFCFA", "#FBFAF2"
        )) {
          button_outline_style <- "solid"
        } else {
          button_outline_style <- "none"
        }
      }
    } else {

      # Ensure that the incoming `color` is transformed to hexadecimal form
      color <- html_color(colors = color, alpha = NULL)
    }

  } else {

    if (show_underline == "auto") {
      show_underline <- TRUE
    }

    if (color == "auto") {

      color <- "#008B8B"

    } else {

      # Ensure that the incoming `color` is transformed to hexadecimal form
      color <- html_color(colors = color, alpha = NULL)
    }
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      html = function(x) {

        # Generate a vector of empty strings that will eventually
        # contain all of the link text
        x_str <- character(length(x))

        x_str_non_missing <- x[!is.na(x)]

        if (length(x) == 1 && is.na(x)) {
          return(x)
        }

        # Normalize all addresses with commas separating them
        x_str_non_missing <- gsub(",\\s+", ",", x_str_non_missing)

        # Trim leading and trailing space characters
        x_str_non_missing <- gsub("^\\s+|\\s+$", "", x_str_non_missing)

        if (!is.null(display_name)) {

          if (rlang::is_function(display_name)) {
            label_str <- display_name(x_str_non_missing)
          } else {
            label_str <- display_name
          }

        } else {
          label_str <- x_str_non_missing
        }

        target <- target %||% "_blank"
        target_values <- NULL

        if (startsWith(target, "_")) {
          target_values <- c("_blank", "_self", "_parent", "_top")
        }

        anchor_attr <-
          add_anchor_attr(
            arg = target,
            nm = "target",
            values = target_values
          )

        if (target == "_blank") {

          anchor_attr <-
            add_anchor_attr(
              anchor_attr,
              arg = "noopener noreferrer",
              nm = "rel"
            )
        }

        anchor_attr <-
          add_anchor_attr(
            anchor_attr,
            arg = paste0(
              "color:", color[1], ";",
              "text-decoration:",
              if (show_underline) "underline" else "none", ";",
              if (show_underline) "text-underline-position: under;" else NULL,
              "display: inline-block;",
              if (as_button) {
                paste0(
                  "background-color: ", button_fill, ";",
                  "padding: 8px 12px;",
                  if (!is.null(button_width)) {
                    paste0("width: ", button_width, "; text-align: center;")
                  } else {
                    NULL
                  },
                  "outline-style: ", button_outline_style, "; ",
                  "outline-color: ", button_outline_color, "; ",
                  "outline-width: ", button_outline_width, ";"
                )
              } else {
                NULL
              }
            ),
            nm = "style"
          )

        x_str_non_missing <-
          mapply(
            SIMPLIFY = TRUE,
            USE.NAMES = FALSE,
            x_str_non_missing,
            label_str,
            FUN = function(x, label_str) {

              if (grepl(" ", x)) {

                email_separated <- unlist(strsplit(x, " "))

                if (x == label_str) {

                  label_separated <- unlist(strsplit(label_str, " "))

                } else if (
                  grepl("^<.*>$", label_str) &&
                  !startsWith(label_str, "<svg")
                ) {

                  label_separated <- unlist(strsplit(label_str, ">\\s*<"))

                  label_separated <-
                    gsub("<", "", label_separated, fixed = TRUE)
                  label_separated <-
                    gsub(">", "", label_separated, fixed = TRUE)

                  label_separated <- gsub("^\\s+|\\s+$", "", label_separated)

                  if (length(label_separated) == 1) {
                    label_separated <-
                      rep_len(label_separated, length(email_separated))
                  }

                  if (length(label_separated) != length(email_separated)) {
                    cli::cli_abort(
                      "Labels supplied between `<`/`>` must match the length
                      of email addresses"
                    )
                  }

                } else {
                  label_separated <- rep_len(label_str, length(email_separated))
                }

                email_str_separated <- c()

                for (i in seq_along(email_separated)) {

                  email_str_i <-
                    generate_email_links(
                      email_address = email_separated[i],
                      anchor_attr = anchor_attr,
                      label_str = label_separated[i]
                    )

                  email_str_separated <- c(email_str_separated, email_str_i)
                }

                email_str <- paste(email_str_separated, collapse = " ")

              } else {

                email_str <-
                  generate_email_links(
                    email_address = x,
                    anchor_attr = anchor_attr,
                    label_str = label_str
                  )
              }

              email_str
            }
          )

        x_str[!is.na(x)] <- x_str_non_missing
        x_str[is.na(x)] <- NA_character_
        x_str
      },
    latex = function(x) {
      x
    },
    rtf = function(x) {
      x
    },
    word = function(x) {
      x
    },
    default = function(x) {
      x
    }
    )
  )
}

generate_email_links <- function(email_address, anchor_attr, label_str) {

  paste0(
    "<span style=\"white-space: pre;\">",
    "<a",
    " href=\"mailto:", email_address, "\"",
    anchor_attr,
    ">",
    label_str,
    "</a>",
    "</span>"
  )
}

# fmt_image() ------------------------------------------------------------------
#' Format image paths to generate images in cells
#'
#' @description
#'
#' To more easily insert graphics into body cells, we can use `fmt_image()`.
#' This allows for one or more images to be placed in the targeted cells.
#' The cells need to contain some reference to an image file, either: (1)
#' complete http/https or local paths to the files; (2) the file names, where a
#' common path can be provided via `path`; or (3) a fragment of the file name,
#' where the `file_pattern` helps to compose the entire file name and `path`
#' provides the path information. This should be expressly used on columns that
#' contain *only* references to image files (i.e., no image references as part
#' of a larger block of text). Multiple images can be included per cell by
#' separating image references by commas. The `sep` argument allows for a common
#' separator to be applied between images.
#'
#' @inheritParams fmt_number
#'
#' @param height,width *Height and width of images*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   The absolute height of the image in the table cell. If you set the `width`
#'   and `height` remains `NULL` (or vice versa), the width-to-height ratio will
#'   be preserved when **gt** calculates the length of the missing dimension. If
#'   `width` and `height` are both `NULL`, `height` is set as `"2em"` and
#'   `width` will be calculated.
#'
#' @param sep *Separator between images*
#'
#'   `scalar<character>` // *default:* `" "`
#'
#'   In the output of images within a body cell, `sep` provides the separator
#'   between each image.
#'
#' @param path *Path to image files*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional path to local image files (this is combined with all
#'   filenames).
#'
#' @param file_pattern *File pattern specification*
#'
#'   `scalar<character>` // *default:* `"{x}"`
#'
#'   The pattern to use for mapping input values in the body cells to the names
#'   of the graphics files. The string supplied should use `"{x}"` in the
#'   pattern to map filename fragments to input strings.
#'
#' @param encode *Use Base64 encoding*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   The option to always use Base64 encoding for image paths that are
#'   determined to be local. By default, this is `TRUE`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_image()` to obtain
#' varying parameter values from a specified column within the table. This means
#' that each row could be formatted a little bit differently. These arguments
#' provide support for [from_column()]:
#'
#' - `height`
#' - `width`
#' - `sep`
#' - `path`
#' - `file_pattern`
#' - `encode`
#'
#' Please note that for each of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Examples:
#'
#' Using a small portion of [`metro`] dataset, let's create a **gt** table. We
#' will only include a few columns and rows from that table. The `lines` and
#' `connect_rer` columns have comma-separated listings of numbers/letters
#' (corresponding to lines served at each station). We have a directory of SVG
#' graphics for all of these lines within the package (the path for the
#' directory containing the images can be accessed via
#' `system.file("metro_svg", package = "gt")`), and the filenames roughly
#' correspond to the data in those two columns. `fmt_image()` can be used with
#' these inputs since the `path` and `file_pattern` arguments allow us to
#' compose complete and valid file locations. What you get from all of this are
#' sequences of images in the table cells, taken from the referenced graphics
#' files on disk.
#'
#' ```r
#' metro |>
#'   dplyr::select(name, caption, lines, connect_rer) |>
#'   dplyr::slice_head(n = 10) |>
#'   gt() |>
#'   cols_merge(
#'     columns = c(name, caption),
#'     pattern = "{1}<< ({2})>>"
#'   ) |>
#'   text_replace(
#'     locations = cells_body(columns = name),
#'     pattern = "\\((.*?)\\)",
#'     replacement = "<br>(<em>\\1</em>)"
#'   ) |>
#'   sub_missing(columns = connect_rer, missing_text = "") |>
#'   fmt_image(
#'     columns = lines,
#'     path = system.file("metro_svg", package = "gt"),
#'     file_pattern = "metro_{x}.svg"
#'   ) |>
#'   fmt_image(
#'     columns = connect_rer,
#'     path = system.file("metro_svg", package = "gt"),
#'     file_pattern = "rer_{x}.svg"
#'   ) |>
#'   cols_label(
#'     name = "Station",
#'     lines = "Lines",
#'     connect_rer = "RER"
#'   ) |>
#'   cols_align(align = "left") |>
#'   tab_style(
#'     style = cell_borders(
#'       sides = c("left", "right"),
#'       weight = px(1),
#'       color = "gray85"
#'     ),
#'     locations = cells_body(columns = lines)
#'   ) |>
#'   opt_stylize(style = 6, color = "blue") |>
#'   opt_all_caps() |>
#'   opt_horizontal_padding(scale = 1.75)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_image_1.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-24
#'
#' @section Function Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
#' @export
#' @importFrom fs path_expand
fmt_image <- function(
    data,
    columns = everything(),
    rows = everything(),
    height = NULL,
    width = NULL,
    sep = " ",
    path = NULL,
    file_pattern = "{x}",
    encode = TRUE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - height
  # - width
  # - sep
  # - path
  # - file_pattern
  # - encode

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_image",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_image(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          height = p_i$height %||% height,
          width = p_i$width %||% width,
          sep = p_i$sep %||% sep,
          path = p_i$path %||% path,
          file_pattern = p_i$file_pattern %||% file_pattern,
          encode = p_i$encode %||% encode
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # If width & height not provided, default width to '2em' and let width scale
  if (is.null(height) && is.null(width)) {
    height <- "2em"
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      html = function(x) {

        # Generate a vector of empty strings that will eventually
        # contain all of the link text
        x_str <- character(length(x))

        x_str_non_missing <- x[!is.na(x)]

        x_str_non_missing <-
          vapply(
            seq_along(x_str_non_missing),
            FUN.VALUE = character(1L),
            USE.NAMES = FALSE,
            FUN = function(x) {

              if (grepl(",", x_str_non_missing[x])) {
                files <- unlist(strsplit(x_str_non_missing[x], ",\\s*"))
              } else {
                files <- x_str_non_missing[x]
              }

              # Automatically append `px` length unit when `height`
              # is given as a number
              if (is.numeric(height)) {
                height <- paste0(height, "px")
              }

              # Handle formatting of `file_pattern`
              files <-
                apply_pattern_fmt_x(
                  pattern = file_pattern,
                  values = files
                )

              out <- c()

              for (y in seq_along(files)) {

                if (
                  (!is.null(path) && grepl("https?://", path)) ||
                  grepl("https?://", files[y])
                ) {

                  if (!is.null(path)) {

                    # Normalize ending of `path`
                    path <- sub("/\\s+$", "", path)
                    uri <- paste0(path, "/", files[y])
                  } else {
                    uri <- files[y]
                  }

                } else {

                  # Compose and normalize the local file path
                  filename <- gtsave_filename(path = path, filename = files[y])
                  filename <- path_expand(filename)

                  # Create the image URI; this uses the logical value of
                  # `encode` to either perform or bypass Base64 encoding
                  if (encode) {
                    uri <- get_image_uri(filename)
                  } else {
                    uri <- filename
                  }
                }

                style_string <- paste0(
                    c(
                      ifelse(!is.null(height), paste0("height:", height, ";"), ""),
                      ifelse(!is.null(width), paste0("width:", width, ";"), "")
                    ),
                    collapse = ""
                  )

                # Place the `uri` value within an <img>, setting the
                # height and always preferring vertical alignment as 'middle'
                out_y <-
                  paste0(
                    "<img src=\"", uri, "\" ",
                    "style=\"", style_string,
                    "vertical-align:middle;\">"
                  )

                out <- c(out, out_y)
              }

              paste0(
                "<span style=\"white-space:nowrap;\">",
                paste0(out, collapse = sep),
                "</span>"
              )
            }
          )

        x_str[!is.na(x)] <- x_str_non_missing
        x_str[is.na(x)] <- NA_character_
        x_str
      },
      latex = function(x) {
        x
      },
      rtf = function(x) {

        x_str <- character(length(x))

        x_str_non_missing <- x[!is.na(x)]

        # convert dimensions to twips - used for rtf images

        if (!is.null(height)) {
          if (is.character(height)) {
              height <- convert_to_twips(height)
            }
          }

        if (!is.null(width)) {
          if (is.character(width)) {
              width <- convert_to_twips(width)
            }
          }

        x_str_non_missing <-
          vapply(
            seq_along(x_str_non_missing),
            FUN.VALUE = character(1L),
            USE.NAMES = FALSE,
            FUN = function(x) {

              if (grepl(",", x_str_non_missing[x], fixed = TRUE)) {
                files <- unlist(strsplit(x_str_non_missing[x], ",\\s*"))
              } else {
                files <- x_str_non_missing[x]
              }

              # Handle formatting of `file_pattern`
              files <-
                apply_pattern_fmt_x(
                  pattern = file_pattern,
                  values = files
                )

              out <- list()

              for(y in seq_along(files)){

                extension <- tools::file_ext(files[y])

                if(!(extension %in% c("emf", "png", "jpeg"))){
                  cli::cli_abort("For RTF output, images must be of type emf, png or jpeg")
                }

                # Handle case where the image is online
                if (
                  (!is.null(path) && grepl("https?://", path)) ||
                  grepl("https?://", files[y])
                ) {

                  if (!is.null(path)) {

                    # Normalize ending of `path`
                    path <- gsub("/\\s+$", "", path)
                    uri <- paste0(path, "/", files[y])

                  } else {
                    uri <- files[y]
                  }

                  filename <- download_file(uri)

                }else{
                  # Compose and normalize the local file path
                  filename <- gtsave_filename(path = path, filename = files[y])
                  filename <- path_expand(filename)

                }

                height_f <- height
                width_f <- width

                # if the heights or widths are missing find the ratio for each file
                if (is.null(height_f) || is.null(width_f)) {

                  hw_ratio <- get_image_hw_ratio(files[y])

                  if (is.null(width_f)) {
                    width_f <- round(height_f / hw_ratio, 0)
                  } else {
                    height_f <- round(width_f * hw_ratio, 0)
                  }
                }

                # build rtf image string
                size <- file.info(filename)$size
                img_data <- readBin(filename, what = "raw", n = size)
                rtf_image <- sprintf(paste0("{\\pict\\", extension, "blip\\picwgoal%d\\pichgoal%d\n%s\n}"), width_f, height_f, paste0(img_data, collapse = ""))
                out <- c(out, list(rtf_image))

              }

              rtf_images <- paste0(out, collapse = "")
              rtf_images

              })

        x_str[!is.na(x)] <- x_str_non_missing
        x_str[is.na(x)] <- NA_character_
        x_str

      },
      word = function(x) {

        x_str <- character(length(x))

        x_str_non_missing <- x[!is.na(x)]

        # Automatically append `px` length unit when `height` or `width`
        # is given as a number

        if (!is.null(height)) {
          if (is.numeric(height)) {
            height <- paste0(height, "px")
            } else {
              if (is.character(height)) {
                height <- convert_to_px(height)
              }
            }
        }

        if (!is.null(width)) {
          if (is.numeric(width)) {
            width <- paste0(width, "px")
          } else {
            if (is.character(width)) {
              width <- convert_to_px(width)
            }
          }
        }

        x_str_non_missing <-
          vapply(
            seq_along(x_str_non_missing),
            FUN.VALUE = character(1L),
            USE.NAMES = FALSE,
            FUN = function(x) {

              if (grepl(",", x_str_non_missing[x], fixed = TRUE)) {
                files <- unlist(strsplit(x_str_non_missing[x], ",\\s*"))
              } else {
                files <- x_str_non_missing[x]
              }

              # Handle formatting of `file_pattern`
              files <-
                apply_pattern_fmt_x(
                  pattern = file_pattern,
                  values = files
                )

              out <- list()

              for (y in seq_along(files)) {

                # Handle case where the image is online
                if (
                  (!is.null(path) && grepl("https?://", path)) ||
                  grepl("https?://", files[y])
                ) {

                  if (!is.null(path)) {

                    # Normalize ending of `path`
                    path <- gsub("/\\s+$", "", path)
                    uri <- paste0(path, "/", files[y])

                  } else {
                    uri <- files[y]
                  }

                  filename <- download_file(uri)

                } else {

                  # Compose and normalize the local file path
                  filename <- gtsave_filename(path = path, filename = files[y])
                  filename <- path_expand(filename)
                }

                if (is.null(height) || is.null(width)) {

                  hw_ratio <- get_image_hw_ratio(filename)

                  if (is.null(width)) {
                    width <- round(height / hw_ratio, 0)
                  } else {
                    height <- round(width * hw_ratio, 0)
                  }
                }

                out_y <-
                  xml_r(
                    xml_rPr(),
                    xml_image(filename, height = height, width = width, units = "px")
                  )

                out <- c(out, list(out_y))
              }

              paste0(
                "<md_container>",
                as.character(xml_p(xml_pPr(), htmltools::tagList(c(out)))),
                "</md_container>"
              )
            }
          )

        x_str[!is.na(x)] <- x_str_non_missing
        x_str[is.na(x)] <- NA_character_

        x_str
      },
      default = function(x) {
        x
      }
    )
  )
}

download_file <- function(uri) {
  filename <- tempfile(fileext = paste0("_", basename(uri)))
  utils::download.file(uri, destfile = filename, quiet = TRUE)
  filename
}

convert_to_pt <- function(x) {

  convert_to_px(x) * 0.75

}

convert_to_px <- function(x) {

  units <- tolower(gsub("[[:digit:]\\.\\,]+", "", x))
  value <- as.numeric(gsub(units, "", x))

  px_conversion <- c(
    "pt" = 4 / 3,
    "in" = 96,
    "cm" = 37.7952755906,
    "emu" = 1 / 9525,
    "em" = 16 # https://www.w3schools.com/tags/ref_pxtoemconversion.asp
  )

  if (units %in% c("px", names(px_conversion))) {

    if (units == "px") {
      value
    } else {
      round(value * px_conversion[[units]], 0)
    }

  } else {

    cli::cli_abort(c(
      "Conversion units must be one of type {.code {px_conversion}}, not -{.code {units}}."
    ))
  }
}

convert_to_twips <- function(x) {
  # make use of convert_to_px function
  # 15 twips are equivalent to 1 pixel https://www.unitconverters.net/typography/pixel-x-to-twip.htm

  px <- convert_to_px(x)

  px * 15

}


get_image_hw_ratio <- function(filepath) {

  if (rlang::is_installed("magick")) {

    if (tolower(tools::file_ext(filepath)) == "svg") {

      image <- magick::image_read_svg(filepath)

    } else if (tolower(tools::file_ext(filepath)) == "pdf") {

      image <- magick::image_read_pdf(filepath)

    } else {

      image <- magick::image_read(filepath)
    }

    image_dims <- magick::image_info(image)

    ratio <- image_dims$height / image_dims$width

  } else {

    cli::cli_warn("{.pkg magick} must be installed to derive image height/width ratio.")
    ratio <- 1
  }

  ratio
}

# fmt_flag() -------------------------------------------------------------------
#' Generate flag icons for countries from their country codes
#'
#' @description
#'
#' While it is fairly straightforward to insert images into body cells (using
#' [fmt_image()] is one way to it), there is often the need to incorporate
#' specialized types of graphics within a table. One such group of graphics
#' involves iconography representing different countries, and the `fmt_flag()`
#' function helps with inserting a flag icon (or multiple) in body cells. To
#' make this work seamlessly, the input cells need to contain some reference to
#' a country, and this can be in the form of a 2- or 3-letter ISO 3166-1 country
#' code (e.g., Egypt has the `"EG"` country code). This function will parse the
#' targeted body cells for those codes (and the [`countrypops`] dataset contains
#' all of them) and insert the appropriate flag graphics.
#'
#' Multiple flags can be included per cell by separating country codes with
#' commas (e.g., `"GB,TT"`). The `sep` argument allows for a common separator
#' to be applied between flag icons.
#'
#' @inheritParams fmt_number
#'
#' @param height *Height of flag*
#'
#'   `scalar<character>` // *default:* `"1em"`
#'
#'   The absolute height of the flag icon in the table cell. By default, this is
#'   set to `"1em"`.
#'
#' @param sep *Separator between flags*
#'
#'   `scalar<character>` // *default:* `" "`
#'
#'   In the output of flag icons within a body cell, `sep` provides the
#'   separator between each icon. By default, this is a single space character
#'   (`" "`).
#'
#' @param use_title *Display country name on hover*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   An option to display a tooltip for the country name (in the language
#'   according to the `locale` value, set either here or in [gt()]) when
#'   hovering over the flag icon.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_flag()` is compatible with body cells that are of the `"character"` or
#' `"factor"` types. Any other types of body cells are ignored during
#' formatting. This is to say that cells of incompatible data types may be
#' targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_flag()` to obtain
#' varying parameter values from a specified column within the table. This means
#' that each row could be formatted a little bit differently. These arguments
#' provide support for [from_column()]:
#'
#' - `height`
#' - `sep`
#' - `use_title`
#' - `locale`
#'
#' Please note that for each of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Supported regions:
#'
#' The following 242 regions (most of which comprise countries) are supported
#' with names across 574 locales: `"AD"`, `"AE"`, `"AF"`, `"AG"`, `"AI"`,
#' `"AL"`, `"AM"`, `"AO"`, `"AR"`, `"AS"`, `"AT"`, `"AU"`, `"AW"`, `"AX"`,
#' `"AZ"`, `"BA"`, `"BB"`, `"BD"`, `"BE"`, `"BF"`, `"BG"`, `"BH"`, `"BI"`,
#' `"BJ"`, `"BL"`, `"BM"`, `"BN"`, `"BO"`, `"BR"`, `"BS"`, `"BT"`, `"BW"`,
#' `"BY"`, `"BZ"`, `"CA"`, `"CC"`, `"CD"`, `"CF"`, `"CG"`, `"CH"`, `"CI"`,
#' `"CK"`, `"CL"`, `"CM"`, `"CN"`, `"CO"`, `"CR"`, `"CU"`, `"CV"`, `"CW"`,
#' `"CY"`, `"CZ"`, `"DE"`, `"DJ"`, `"DK"`, `"DM"`, `"DO"`, `"DZ"`, `"EC"`,
#' `"EE"`, `"EG"`, `"EH"`, `"ER"`, `"ES"`, `"ET"`, `"EU"`, `"FI"`, `"FJ"`,
#' `"FK"`, `"FM"`, `"FO"`, `"FR"`, `"GA"`, `"GB"`, `"GD"`, `"GE"`, `"GF"`,
#' `"GG"`, `"GH"`, `"GI"`, `"GL"`, `"GM"`, `"GN"`, `"GP"`, `"GQ"`, `"GR"`,
#' `"GS"`, `"GT"`, `"GU"`, `"GW"`, `"GY"`, `"HK"`, `"HN"`, `"HR"`, `"HT"`,
#' `"HU"`, `"ID"`, `"IE"`, `"IL"`, `"IM"`, `"IN"`, `"IO"`, `"IQ"`, `"IR"`,
#' `"IS"`, `"IT"`, `"JE"`, `"JM"`, `"JO"`, `"JP"`, `"KE"`, `"KG"`, `"KH"`,
#' `"KI"`, `"KM"`, `"KN"`, `"KP"`, `"KR"`, `"KW"`, `"KY"`, `"KZ"`, `"LA"`,
#' `"LB"`, `"LC"`, `"LI"`, `"LK"`, `"LR"`, `"LS"`, `"LT"`, `"LU"`, `"LV"`,
#' `"LY"`, `"MA"`, `"MC"`, `"MD"`, `"ME"`, `"MF"`, `"MG"`, `"MH"`, `"MK"`,
#' `"ML"`, `"MM"`, `"MN"`, `"MO"`, `"MP"`, `"MQ"`, `"MR"`, `"MS"`, `"MT"`,
#' `"MU"`, `"MV"`, `"MW"`, `"MX"`, `"MY"`, `"MZ"`, `"NA"`, `"NC"`, `"NE"`,
#' `"NF"`, `"NG"`, `"NI"`, `"NL"`, `"NO"`, `"NP"`, `"NR"`, `"NU"`, `"NZ"`,
#' `"OM"`, `"PA"`, `"PE"`, `"PF"`, `"PG"`, `"PH"`, `"PK"`, `"PL"`, `"PM"`,
#' `"PN"`, `"PR"`, `"PS"`, `"PT"`, `"PW"`, `"PY"`, `"QA"`, `"RE"`, `"RO"`,
#' `"RS"`, `"RU"`, `"RW"`, `"SA"`, `"SB"`, `"SC"`, `"SD"`, `"SE"`, `"SG"`,
#' `"SI"`, `"SK"`, `"SL"`, `"SM"`, `"SN"`, `"SO"`, `"SR"`, `"SS"`, `"ST"`,
#' `"SV"`, `"SX"`, `"SY"`, `"SZ"`, `"TC"`, `"TD"`, `"TF"`, `"TG"`, `"TH"`,
#' `"TJ"`, `"TK"`, `"TL"`, `"TM"`, `"TN"`, `"TO"`, `"TR"`, `"TT"`, `"TV"`,
#' `"TW"`, `"TZ"`, `"UA"`, `"UG"`, `"US"`, `"UY"`, `"UZ"`, `"VA"`, `"VC"`,
#' `"VE"`, `"VG"`, `"VI"`, `"VN"`, `"VU"`, `"WF"`, `"WS"`, `"YE"`, `"YT"`,
#' `"ZA"`, `"ZM"`, and `"ZW"`.
#'
#' You can view the entire set of supported flag icons as an informative table
#' by calling [info_flags()].
#'
#' @section Examples:
#'
#' Use the [`countrypops`] dataset to create a **gt** table. We will only
#' include a few columns and rows from that table. The `country_code_2` column
#' has 2-letter country codes in the format required for `fmt_flag()` and using
#' that function transforms the codes to circular flag icons.
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(year == 2021) |>
#'   dplyr::filter(grepl("^S", country_name)) |>
#'   dplyr::arrange(country_name) |>
#'   dplyr::select(-country_name, -year) |>
#'   dplyr::slice_head(n = 10) |>
#'   gt() |>
#'   fmt_integer() |>
#'   fmt_flag(columns = country_code_2) |>
#'   fmt_country(columns = country_code_3) |>
#'   cols_label(
#'     country_code_2 = "",
#'     country_code_3 = "Country",
#'     population = "Population (2021)"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_flag_1.png")`
#' }}
#'
#' Using [`countrypops`] we can generate a table that provides populations
#' every five years for the Benelux countries (`"BE"`, `"NL"`, and `"LU"`).
#' This requires some manipulation with **dplyr** and **tidyr** before
#' introducing the table to **gt**. With `fmt_flag()` we can obtain flag icons
#' in the `country_code_2` column. After that, we can merge the flag icons into
#' the stub column, generating row labels that have a combination of icon and
#' text.
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(country_code_2 %in% c("BE", "NL", "LU")) |>
#'   dplyr::filter(year %% 10 == 0) |>
#'   dplyr::select(country_name, country_code_2, year, population) |>
#'   tidyr::pivot_wider(names_from = year, values_from = population) |>
#'   dplyr::slice(1, 3, 2) |>
#'   gt(rowname_col = "country_name") |>
#'   tab_header(title = "Populations of the Benelux Countries") |>
#'   tab_spanner(columns = everything(), label = "Year") |>
#'   fmt_integer() |>
#'   fmt_flag(columns = country_code_2) |>
#'   cols_merge(
#'     columns = c(country_name, country_code_2),
#'     pattern = "{2} {1}"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_flag_2.png")`
#' }}
#'
#' `fmt_flag()` works well even when there are multiple country codes within the
#' same cell. It can operate on comma-separated codes without issue. When
#' rendered to HTML, hovering over each of the flag icons results in tooltip
#' text showing the name of the country.
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(year == 2021, population < 100000) |>
#'   dplyr::select(country_code_2, population) |>
#'   dplyr::mutate(population_class = cut(
#'     population,
#'     breaks = scales::breaks_pretty(n = 5)(population)
#'     )
#'   ) |>
#'   dplyr::group_by(population_class) |>
#'   dplyr::summarize(
#'     countries = paste0(country_code_2, collapse = ",")
#'   ) |>
#'   dplyr::arrange(desc(population_class)) |>
#'   gt() |>
#'   tab_header(title = "Countries with Small Populations") |>
#'   fmt_flag(columns = countries) |>
#'   fmt_bins(
#'     columns = population_class,
#'     fmt = ~ fmt_integer(., suffixing = TRUE)
#'   ) |>
#'   cols_label(
#'     population_class = "Population Range",
#'     countries = "Countries"
#'   ) |>
#'   cols_width(population_class ~ px(150))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_flag_3.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-25
#'
#' @section Function Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
#' @export
fmt_flag <- function(
    data,
    columns = everything(),
    rows = everything(),
    height = "1em",
    sep = " ",
    use_title = TRUE,
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - height
  # - sep
  # - use_title
  # - locale

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_flag",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_flag(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          height = p_i$height %||% height,
          sep = p_i$sep %||% sep,
          use_title = p_i$use_title %||% use_title,
          locale = p_i$locale %||% locale
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Stop function if `locale` does not have a valid value; normalize locale
  # and resolve one that might be set globally
  validate_locale(locale = locale)
  locale <- normalize_locale(locale = locale)
  locale <- resolve_locale(data = data, locale = locale)

  # If `locale` is NULL then use the 'en' locale
  locale <- locale %||% "en"

  valid_class <- c("character", "factor")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  # Create a vector of valid 2- and 3-letter country codes
  valid_country_codes <-
    c(
      country_names[, ][["country_code_2"]],
      country_names[, ][["country_code_3"]]
    )

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      html = function(x) {

        # Generate a vector of empty strings that will eventually
        # contain all of the link text
        x_str <- character(length(x))

        x_str_non_missing <- x[!is.na(x)]

        x_str_non_missing <-
          vapply(
            seq_along(x_str_non_missing),
            FUN.VALUE = character(1L),
            USE.NAMES = FALSE,
            FUN = function(x) {

              if (grepl(",", x_str_non_missing[x], fixed = TRUE)) {
                countries <-
                  toupper(unlist(strsplit(x_str_non_missing[x], ",\\s*")))
              } else {
                countries <- toupper(x_str_non_missing[x])
              }

              # Automatically append `px` length unit when `height`
              # is given as a number
              if (is.numeric(height)) {
                height <- paste0(height, "px")
              }

              out <- c()

              for (y in seq_along(countries)) {

                country_i <- toupper(countries[y])
                country_i_len <- nchar(country_i)

                # Check whether the country code is valid
                if (!(country_i %in% valid_country_codes))  {
                  cli::cli_abort(
                    "The country code provided ({.val {country_i}}) is invalid."
                  )
                }

                flag_svg <-
                  flag_tbl[
                    flag_tbl[[
                      paste0("country_code_", country_i_len)]] == country_i,
                  ][["country_flag"]]

                # If displaying a title, obtain that from `country_names`
                if (use_title) {

                  country_index <-
                    which(
                      country_names[[
                        paste0("country_code_", country_i_len)]] == country_i
                    )

                  flag_title <- country_names[country_index, ][[locale]]
                }

                out_y <-
                  gsub(
                    "<svg.*?>",
                    paste0(
                      "<svg xmlns=\"http://www.w3.org/2000/svg\" ",
                      "aria-hidden=\"true\" role=\"img\" ",
                      "width=\"512\" height=\"512\" ",
                      "viewBox=\"0 0 512 512\" ",
                      "style=\"vertical-align:-0.125em;",
                      "image-rendering:optimizeQuality;",
                      "height:", height, ";",
                      # height to make sure a square
                      "width:", height, ";",
                      "\"",
                      ">",
                      if (use_title) {
                        paste0("<title>", flag_title, "</title>")
                      } else {
                        NULL
                      }
                    ),
                    flag_svg
                  )

                out <- c(out, out_y)
              }

              paste0(
                "<span style=\"white-space:nowrap;\">",
                paste0(out, collapse = sep),
                "</span>"
              )
            }
          )

        x_str[!is.na(x)] <- x_str_non_missing
        x_str[is.na(x)] <- NA_character_
        x_str
      },
      latex = function(x) {
        x
      },
      rtf = function(x) {
        x
      },
      word = function(x) {
        x
      },
      default = function(x) {
        x
      }
    )
  )
}

# fmt_country() ----------------------------------------------------------------
#' Generate country names from their corresponding country codes
#'
#' @description
#'
#' Tables that have comparable data between countries often need to have the
#' country name included. While this seems like a fairly simple task, being
#' consistent with country names is surprisingly difficult. The `fmt_country()`
#' function can help in this regard by supplying a country name based on a
#' 2- or 3-letter ISO 3166-1 country code (e.g., Singapore has the `"SG"`
#' country code). The resulting country names have been obtained from the
#' Unicode *CLDR* (Common Locale Data Repository), which is a good source since
#' all country names are agreed upon by consensus. Furthermore, the country
#' names can be localized through the `locale` argument (either in this function
#' or through the initial [gt()] call).
#'
#' Multiple country names can be included per cell by separating country codes
#' with commas (e.g., `"RO,BM"`). And it is okay if the codes are set in either
#' uppercase or lowercase letters. The `sep` argument allows for a common
#' separator to be applied between country names.
#'
#' @inheritParams fmt_number
#'
#' @param sep *Separator between country names*
#'
#'   `scalar<character>` // *default:* `" "`
#'
#'   In the output of country names within a body cell, `sep` provides the
#'   separator between each instance. By default, this is a single space
#'   character (`" "`).
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_country()` function is compatible with body cells that are of the
#' `"character"` or `"factor"` types. Any other types of body cells are ignored
#' during formatting. This is to say that cells of incompatible data types may
#' be targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_country()` to
#' obtain varying parameter values from a specified column within the table.
#' This means that each row could be formatted a little bit differently. These
#' arguments provide support for [from_column()]:
#'
#' - `pattern`
#' - `sep`
#' - `locale`
#'
#' Please note that for each of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Supported regions:
#'
#' The following 242 regions (most of which comprise countries) are supported
#' with names across 574 locales: `"AD"`, `"AE"`, `"AF"`, `"AG"`, `"AI"`,
#' `"AL"`, `"AM"`, `"AO"`, `"AR"`, `"AS"`, `"AT"`, `"AU"`, `"AW"`, `"AX"`,
#' `"AZ"`, `"BA"`, `"BB"`, `"BD"`, `"BE"`, `"BF"`, `"BG"`, `"BH"`, `"BI"`,
#' `"BJ"`, `"BL"`, `"BM"`, `"BN"`, `"BO"`, `"BR"`, `"BS"`, `"BT"`, `"BW"`,
#' `"BY"`, `"BZ"`, `"CA"`, `"CC"`, `"CD"`, `"CF"`, `"CG"`, `"CH"`, `"CI"`,
#' `"CK"`, `"CL"`, `"CM"`, `"CN"`, `"CO"`, `"CR"`, `"CU"`, `"CV"`, `"CW"`,
#' `"CY"`, `"CZ"`, `"DE"`, `"DJ"`, `"DK"`, `"DM"`, `"DO"`, `"DZ"`, `"EC"`,
#' `"EE"`, `"EG"`, `"EH"`, `"ER"`, `"ES"`, `"ET"`, `"EU"`, `"FI"`, `"FJ"`,
#' `"FK"`, `"FM"`, `"FO"`, `"FR"`, `"GA"`, `"GB"`, `"GD"`, `"GE"`, `"GF"`,
#' `"GG"`, `"GH"`, `"GI"`, `"GL"`, `"GM"`, `"GN"`, `"GP"`, `"GQ"`, `"GR"`,
#' `"GS"`, `"GT"`, `"GU"`, `"GW"`, `"GY"`, `"HK"`, `"HN"`, `"HR"`, `"HT"`,
#' `"HU"`, `"ID"`, `"IE"`, `"IL"`, `"IM"`, `"IN"`, `"IO"`, `"IQ"`, `"IR"`,
#' `"IS"`, `"IT"`, `"JE"`, `"JM"`, `"JO"`, `"JP"`, `"KE"`, `"KG"`, `"KH"`,
#' `"KI"`, `"KM"`, `"KN"`, `"KP"`, `"KR"`, `"KW"`, `"KY"`, `"KZ"`, `"LA"`,
#' `"LB"`, `"LC"`, `"LI"`, `"LK"`, `"LR"`, `"LS"`, `"LT"`, `"LU"`, `"LV"`,
#' `"LY"`, `"MA"`, `"MC"`, `"MD"`, `"ME"`, `"MF"`, `"MG"`, `"MH"`, `"MK"`,
#' `"ML"`, `"MM"`, `"MN"`, `"MO"`, `"MP"`, `"MQ"`, `"MR"`, `"MS"`, `"MT"`,
#' `"MU"`, `"MV"`, `"MW"`, `"MX"`, `"MY"`, `"MZ"`, `"NA"`, `"NC"`, `"NE"`,
#' `"NF"`, `"NG"`, `"NI"`, `"NL"`, `"NO"`, `"NP"`, `"NR"`, `"NU"`, `"NZ"`,
#' `"OM"`, `"PA"`, `"PE"`, `"PF"`, `"PG"`, `"PH"`, `"PK"`, `"PL"`, `"PM"`,
#' `"PN"`, `"PR"`, `"PS"`, `"PT"`, `"PW"`, `"PY"`, `"QA"`, `"RE"`, `"RO"`,
#' `"RS"`, `"RU"`, `"RW"`, `"SA"`, `"SB"`, `"SC"`, `"SD"`, `"SE"`, `"SG"`,
#' `"SI"`, `"SK"`, `"SL"`, `"SM"`, `"SN"`, `"SO"`, `"SR"`, `"SS"`, `"ST"`,
#' `"SV"`, `"SX"`, `"SY"`, `"SZ"`, `"TC"`, `"TD"`, `"TF"`, `"TG"`, `"TH"`,
#' `"TJ"`, `"TK"`, `"TL"`, `"TM"`, `"TN"`, `"TO"`, `"TR"`, `"TT"`, `"TV"`,
#' `"TW"`, `"TZ"`, `"UA"`, `"UG"`, `"US"`, `"UY"`, `"UZ"`, `"VA"`, `"VC"`,
#' `"VE"`, `"VG"`, `"VI"`, `"VN"`, `"VU"`, `"WF"`, `"WS"`, `"YE"`, `"YT"`,
#' `"ZA"`, `"ZM"`, and `"ZW"`.
#'
#' @section Examples:
#'
#' The [`peeps`] dataset will be used to generate a small **gt** table
#' containing only the people born in the 1980s. The `country` column contains
#' 3-letter country codes and those will be transformed to country names with
#' `fmt_country()`.
#'
#' ```r
#' peeps |>
#'   dplyr::filter(grepl("198", dob)) |>
#'   dplyr::select(name_given, name_family, country, dob) |>
#'   dplyr::arrange(country, name_family) |>
#'   gt() |>
#'   fmt_country(columns = country) |>
#'   cols_merge(columns = c(name_given, name_family)) |>
#'   opt_vertical_padding(scale = 0.5) |>
#'   tab_options(column_labels.hidden = TRUE)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_country_1.png")`
#' }}
#'
#' Use the [`countrypops`] dataset to create a **gt** table. We will only
#' include a few columns and rows from that table. The `country_code_3` column
#' has 3-letter country codes in the format required for `fmt_country()` and
#' using that function transforms the codes to country names.
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(year == 2021) |>
#'   dplyr::filter(grepl("^S", country_name)) |>
#'   dplyr::arrange(country_name) |>
#'   dplyr::select(-country_name, -year) |>
#'   dplyr::slice_head(n = 10) |>
#'   gt() |>
#'   fmt_integer() |>
#'   fmt_flag(columns = country_code_2) |>
#'   fmt_country(columns = country_code_3) |>
#'   cols_label(
#'     country_code_2 = "",
#'     country_code_3 = "Country",
#'     population = "Population (2021)"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_country_2.png")`
#' }}
#'
#' The country names derived from country codes can be localized. Let's
#' translate some of those country names into three different languages using
#' different `locale` values in separate calls of `fmt_country()`.
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(year == 2021) |>
#'   dplyr::arrange(desc(population)) |>
#'   dplyr::filter(
#'     dplyr::row_number() > max(dplyr::row_number()) - 5 |
#'     dplyr::row_number() <= 5
#'   ) |>
#'   dplyr::select(
#'     country_code_fl = country_code_2,
#'     country_code_2a = country_code_2,
#'     country_code_2b = country_code_2,
#'     country_code_2c = country_code_2,
#'     population
#'   ) |>
#'   gt(rowname_col = "country_code_fl") |>
#'   fmt_integer() |>
#'   fmt_flag(columns = stub()) |>
#'   fmt_country(columns = ends_with("a")) |>
#'   fmt_country(columns = ends_with("b"), locale = "ja") |>
#'   fmt_country(columns = ends_with("c"), locale = "ar") |>
#'   cols_label(
#'     ends_with("a") ~ "`en`",
#'     ends_with("b") ~ "`ja`",
#'     ends_with("c") ~ "`ar`",
#'     population = "Population",
#'     .fn = md
#'   ) |>
#'   tab_spanner(
#'     label = "Country name in specified locale",
#'     columns = matches("2a|2b|2c")
#'   ) |>
#'   cols_align(align = "center", columns = matches("2a|2b|2c")) |>
#'   opt_horizontal_padding(scale = 2)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_country_3.png")`
#' }}
#'
#' Let's make another **gt** table, this time using the [`films`] dataset. The
#' `countries_of_origin` column contains 2-letter country codes and some cells
#' contain multiple countries (separated by commas). We'll use `fmt_country()`
#' on that column and also specify that the rendered country names should be
#' separated by a comma and a space character. Also note that historical
#' country codes like `"SU"` ('USSR'), `"CS"` ('Czechoslovakia'), and `"YU"`
#' ('Yugoslavia') are permitted as inputs for `fmt_country()`.
#'
#' ```r
#' films |>
#'   dplyr::filter(year == 1959) |>
#'   dplyr::select(
#'     contains("title"), run_time, director, countries_of_origin, imdb_url
#'   ) |>
#'   gt() |>
#'   tab_header(title = "Feature Films in Competition at the 1959 Festival") |>
#'   fmt_country(columns = countries_of_origin, sep = ", ") |>
#'   fmt_url(
#'     columns = imdb_url,
#'     label = fontawesome::fa("imdb", fill = "black")
#'   ) |>
#'   cols_merge(
#'     columns = c(title, original_title, imdb_url),
#'     pattern = "{1}<< ({2})>> {3}"
#'   ) |>
#'   cols_label(
#'     title = "Film",
#'     run_time = "Length",
#'     director = "Director",
#'     countries_of_origin = "Country"
#'   ) |>
#'   opt_vertical_padding(scale = 0.5) |>
#'   opt_table_font(stack = "classical-humanist", weight = "bold") |>
#'   opt_stylize(style = 1, color = "gray") |>
#'   tab_options(heading.title.font.size = px(26))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_country_4.png")`
#' }}
#'
#' Country names can sometimes pair nicely with flag-based graphics. In this
#' example (using a different portion of the [`films`] dataset) we use
#' `fmt_country()` along with [fmt_flag()]. The formatted country names are then
#' merged into the same cells as the icons via [cols_merge()].
#'
#' ```r
#' films |>
#'   dplyr::filter(director == "Jean-Pierre Dardenne, Luc Dardenne") |>
#'   dplyr::select(title, year, run_time, countries_of_origin) |>
#'   gt() |>
#'   tab_header(title = "In Competition Films by the Dardenne Bros.") |>
#'   cols_add(country_flag = countries_of_origin) |>
#'   fmt_flag(columns = country_flag) |>
#'   fmt_country(columns = countries_of_origin, sep = ", ") |>
#'   cols_merge(
#'     columns = c(countries_of_origin, country_flag),
#'     pattern = "{2}<br>{1}"
#'   ) |>
#'   tab_style(
#'     style = cell_text(size = px(9)),
#'     locations = cells_body(columns = countries_of_origin)
#'   ) |>
#'   cols_merge(columns = c(title, year), pattern = "{1} ({2})") |>
#'   opt_vertical_padding(scale = 0.5) |>
#'   opt_horizontal_padding(scale = 3) |>
#'   opt_table_font(font = google_font("PT Sans")) |>
#'   opt_stylize(style = 1, color = "blue") |>
#'   tab_options(
#'     heading.title.font.size = px(26),
#'     column_labels.hidden = TRUE
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_country_5.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-26
#'
#' @section Function Introduced:
#' `v0.11.0` (July 9, 2024)
#'
#' @export
fmt_country <- function(
    data,
    columns = everything(),
    rows = everything(),
    pattern = "{x}",
    sep = " ",
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - pattern
  # - sep
  # - locale

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_country",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_country(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          pattern = p_i$pattern %||% pattern,
          sep = p_i$sep %||% sep,
          locale = p_i$locale %||% locale
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Stop function if `locale` does not have a valid value; normalize locale
  # and resolve one that might be set globally
  validate_locale(locale = locale)
  locale <- normalize_locale(locale = locale)
  locale <- resolve_locale(data = data, locale = locale)

  # If `locale` is NULL then use the 'en' locale
  locale <- locale %||% "en"

  valid_class <- c("character", "factor")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  # Create a vector of valid 2- and 3-letter country codes
  valid_country_codes <-
    c(
      country_names[, ][["country_code_2"]],
      country_names[, ][["country_code_3"]],
      country_names_additional[, ][["country_code_2"]],
      country_names_additional[, ][["country_code_3"]]
    )

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = num_fmt_factory_multi(
      pattern = pattern,
      use_latex_math_mode = FALSE,
      format_fn = function(x, context) {

        # Generate a vector of empty strings that will eventually
        # contain all of the link text
        x_str <- character(length(x))

        x_str_non_missing <- x[!is.na(x)]

        x_str_non_missing <-
          vapply(
            seq_along(x_str_non_missing),
            FUN.VALUE = character(1L),
            USE.NAMES = FALSE,
            FUN = function(x) {

              if (grepl(",", x_str_non_missing[x])) {
                countries <-
                  toupper(unlist(strsplit(x_str_non_missing[x], ",\\s*")))
              } else {
                countries <- toupper(x_str_non_missing[x])
              }

              out <- NULL

              for (y in seq_along(countries)) {

                country_i <- toupper(countries[y])
                country_i_len <- nchar(country_i)

                # Check whether the country code is valid
                if (!(country_i %in% valid_country_codes))  {
                  cli::cli_abort(
                    "The country code provided (\"{country_i}\") is invalid."
                  )
                }

                country_index <-
                  which(
                    country_names[[
                      paste0("country_code_", country_i_len)]] == country_i
                  )

                if (length(country_index) < 1) {

                  country_additional_index <-
                    which(
                      country_names_additional[[
                        paste0("country_code_", country_i_len)]] == country_i
                    )

                  out_y <-
                    country_names_additional[
                      country_additional_index, ][["name"]]

                } else {

                  out_y <- country_names[country_index, ][[locale]]
                }

                out <- c(out, out_y)
              }

              paste0(out, collapse = sep)
            }
          )

        x_str[!is.na(x)] <- x_str_non_missing
        x_str[is.na(x)] <- NA_character_
        x_str
      }
    )
  )
}

# fmt_icon() -------------------------------------------------------------------
#' Use icons within a table's body cells
#'
#' @description
#'
#' We can draw from a library of thousands of icons and selectively insert them
#' into a **gt** table. The `fmt_icon()` function makes this possible and it
#' operates a lot like [fmt_flag()] in that input cells need to contain some
#' reference to an icon name. We are exclusively using *Font Awesome* icons here
#' (and we do need to have the **fontawesome** package installed) so the
#' reference is the short icon name. Multiple icons can be included per cell by
#' separating icon names with commas (e.g., `"hard-drive,clock"`). The `sep`
#' argument allows for a common separator to be applied between icons.
#'
#' @inheritParams fmt_number
#'
#' @param height *Height of icon*
#'
#'   `scalar<character>` // *default:* `"1em"`
#'
#'   The absolute height of the icon in the table cell. By default, this is set
#'   to `"1em"`.
#'
#' @param sep *Separator between icons*
#'
#'   `scalar<character>` // *default:* `" "`
#'
#'   In the output of icons within a body cell, `sep` provides the separator
#'   between each icon. By default, this is a single space character (`" "`).
#'
#' @param stroke_color *Color of the icon stroke/outline*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   The icon stroke is essentially the outline of the icon. The color of the
#'   stroke can be modified by applying a single color here. If not provided
#'   then the default value of `"currentColor"` is applied so that the stroke
#'   color matches that of the parent HTML element's color attribute.
#'
#' @param stroke_width *Width of the icon stroke/outline*
#'
#'   `scalar<character|numeric|integer>` // *default:* `NULL` (`optional`)
#'
#'   The `stroke_width` option allows for setting the color of the icon outline
#'   stroke. By default, the stroke width is very small at `"1px"` so a size
#'   adjustment here can sometimes be useful.
#'
#' @param stroke_alpha *Transparency value for icon stroke/outline*
#'
#'   `scalar<numeric>` // *default:* `NULL` (`optional`)
#'
#'   The level of transparency for the icon stroke can be controlled with a
#'   decimal value between `0` and `1`.
#'
#' @param fill_color *Color of the icon fill*
#'
#'   `scalar<character>|vector<character>` // *default:* `NULL` (`optional`)
#'
#'   The fill color of the icon can be set with `fill_color`; providing a single
#'   color here will change the color of the fill but not of the icon's 'stroke'
#'   or outline (use `stroke_color` to modify that). A named vector or named
#'   list comprising the icon names with corresponding fill colors can
#'   alternatively be used here (e.g.,
#'   `list("circle-check" = "green", "circle-xmark" = "red"`). If nothing is
#'   provided then the default value of `"currentColor"` is applied so that the
#'   fill matches the color of the parent HTML element's color attribute.
#'
#' @param fill_alpha *Transparency value for icon fill*
#'
#'   `scalar<numeric|integer>(0>=val>=1)` // *default:* `NULL` (`optional`)
#'
#'   The level of transparency for the icon fill can be controlled with a
#'   decimal value between `0` and `1`.
#'
#' @param vertical_adj *Vertical adjustment of icon from baseline*
#'
#'   `scalar<character|numeric|integer>` // *default:* `NULL` (`optional`)
#'
#'   The vertical alignment of the icon. By default, a length of `"-0.125em"`
#'   is used.
#'
#' @param margin_left *Margin width left of icon*
#'
#'   `scalar<character|numeric|integer>` // *default:* `NULL` (`optional`)
#'
#'   The length value for the margin that's to the left of the icon can be set
#'   with `margin_left`. By default, `"auto"` is used for this but if space is
#'   needed on the left-hand side then a length of `"0.2em"` is recommended as a
#'   starting point.
#'
#' @param margin_right *Margin width right of icon*
#'
#'   `scalar<character|numeric|integer>` // *default:* `NULL` (`optional`)
#'
#'   The length value for the margin that's to the right of the icon can be set
#'   with `margin_right`. By default, `"auto"` is used for this but if space is
#'   needed on the right-hand side then a length of `"0.2em"` is recommended as
#'   a starting point.
#'
#' @param a11y *Accessibility mode for icon*
#'
#'   `singl-kw:[semantic|decorative|none]` // *default:* `"semantic"`
#'
#'   The accessibility mode for the icon display can be set with the `a11y`
#'   argument. Icons can either be `"semantic"` or `"decorative"`. Using
#'   `"none"` will result in no accessibility features for the icons.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_icon()` is compatible with body cells that are of the
#' `"character"` or `"factor"` types. Any other types of body cells are ignored
#' during formatting. This is to say that cells of incompatible data types may
#' be targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_icon()` to obtain
#' varying parameter values from a specified column within the table. This means
#' that each row could be formatted a little bit differently. These arguments
#' provide support for [from_column()]:
#'
#' - `height`
#' - `sep`
#' - `stroke_color`
#' - `stroke_width`
#' - `stroke_alpha`
#' - `fill_color`
#' - `fill_alpha`
#' - `vertical_adj`
#' - `margin_left`
#' - `margin_right`
#' - `a11y`
#'
#' Please note that for each of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Icons that can be used:
#'
#' `fmt_icon()` relies on an installation of the **fontawesome** package to
#' operate and every icon within that package can be accessed here with either
#' an icon name or a full name. For example, the *Arrow Down* icon has an icon
#' name of `"arrow-down"` and its corresponding full name is
#' `"fas fa-arrow-down"`. In most cases you'll want to use the shorter name, but
#' some icons have both a *Solid* (`"fas"`) and a *Regular* (`"far"`) variant so
#' only the full name can disambiguate the pairing. In the latest release of
#' **fontawesome** (`v0.5.2`), there are 2,025 icons and you can view the entire
#' icon listing by calling [info_icons()]. What you'll get from that is an
#' information table showing every icon and associated set of identifiers.
#'
#' @section Examples:
#'
#' For this first example of generating icons with `fmt_icon()`, let's make a
#' simple tibble that has two columns of *Font Awesome* icon names. We separate
#' multiple icons per cell with commas. By default, the icons are 1 em in
#' height; we're going to make the icons slightly larger here (so we can see the
#' fine details of them) by setting `height = "4em"`.
#'
#' ```r
#' dplyr::tibble(
#'   animals = c(
#'     "hippo", "fish,spider", "mosquito,locust,frog",
#'     "dog,cat", "kiwi-bird"
#'   ),
#'   foods = c(
#'     "bowl-rice", "egg,pizza-slice", "burger,lemon,cheese",
#'     "carrot,hotdog", "bacon"
#'   )
#' ) |>
#'   gt() |>
#'   fmt_icon(height = "4em") |>
#'   cols_align(align = "center", columns = everything())
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_icon_1.png")`
#' }}
#'
#' Let's take a few rows from the [`towny`] dataset and make it so the
#' `csd_type` column contains *Font Awesome* icon names (we want only the
#' `"city"` and `"house-chimney"` icons here). After using `fmt_icon()` to
#' format the `csd_type` column, we get icons that are representative of the two
#' categories of municipality for this subset of data.
#'
#' ```r
#' towny |>
#'   dplyr::select(name, csd_type, population_2021) |>
#'   dplyr::filter(csd_type %in% c("city", "town")) |>
#'   dplyr::group_by(csd_type) |>
#'   dplyr::slice_max(population_2021, n = 5) |>
#'   dplyr::ungroup() |>
#'   dplyr::mutate(
#'     csd_type = ifelse(csd_type == "town", "house-chimney", "city")
#'   ) |>
#'   gt() |>
#'   fmt_integer() |>
#'   fmt_icon(columns = csd_type) |>
#'   cols_move_to_start(columns = csd_type) |>
#'   cols_label(
#'     csd_type = "",
#'     name = "City/Town",
#'     population_2021 = "Population"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_icon_2.png")`
#' }}
#'
#' Let's use a portion of the [`metro`] dataset to create a **gt** table.
#' Depending on which train services are offered at the subset of stations,
#' *Font Awesome* icon names will be applied to cells where the different
#' services exist (the specific names are `"train-subway"`, `"train"`, and
#' `"train-tram"`). With `tidyr::unite()`, those icon names can be converged
#' into a single column (`services`) with the `NA` values removed. Since the
#' names correspond to icons and they are in the correct format (separated by
#' commas), they can be formatted as *Font Awesome* icons with `fmt_icon()`.
#'
#' ```r
#' metro |>
#'   dplyr::select(name, lines, connect_rer, connect_tramway, location) |>
#'   dplyr::slice_tail(n = 10) |>
#'   dplyr::mutate(lines = "train-subway") |>
#'   dplyr::mutate(connect_rer = ifelse(!is.na(connect_rer), "train", NA)) |>
#'   dplyr::mutate(
#'     connect_tramway = ifelse(!is.na(connect_tramway), "train-tram", NA)
#'   ) |>
#'   tidyr::unite(
#'     col = services,
#'     lines:connect_tramway,
#'     sep = ",",
#'     na.rm = TRUE
#'   ) |>
#'   gt() |>
#'   fmt_icon(
#'     columns = services,
#'     a11y = "decorative"
#'   ) |>
#'   cols_merge(
#'     columns = c(name, services),
#'     pattern = "{1} ({2})"
#'   ) |>
#'   cols_label(
#'     name = "Station",
#'     location = "Location"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_icon_3.png")`
#' }}
#'
#' Taking a handful of starred reviews from a popular film review website, we
#' will attempt to format a numerical score (0 to 4) to use the `"star"` and
#' `"star-half"` icons. In this case, it is useful to generate the repeating
#' sequence of icon names (separated by commas) in the `rating` column before
#' introducing the table to [gt()]. We can make use of the numerical rating
#' values in `stars` within `fmt_icon()` with a little help from
#' [from_column()]. Using that, we can dynamically adjust the icon's
#' `fill_alpha` (i.e., opacity) value and accentuate the films with higher
#' scores.
#'
#' ```r
#' dplyr::tibble(
#'   film = c(
#'     "The Passengers of the Night", "Serena", "The Father",
#'     "Roma", "The Handmaiden", "Violet", "Vice"
#'   ),
#'   stars = c(3, 1, 3.5, 4, 4, 2.5, 1.5)
#' ) |>
#'   dplyr::mutate(rating = dplyr::case_when(
#'     stars %% 1 == 0 ~ strrep("star,", stars),
#'     stars %% 1 != 0 ~ paste0(strrep("star,", floor(stars)), "star-half")
#'   )) |>
#'   gt() |>
#'   fmt_icon(
#'     columns = rating,
#'     fill_color = "red",
#'     fill_alpha = from_column("stars", fn = function(x) x / 4)
#'   ) |>
#'   cols_hide(columns = stars) |>
#'   tab_source_note(
#'     source_note = md(
#'       "Data obtained from <https://www.rogerebert.com/reviews>."
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_icon_4.png")`
#' }}
#'
#' A fairly common thing to do with icons in tables is to indicate whether
#' a quantity is either higher or lower than another. Up and down arrow symbols
#' can serve as good visual indicators for this purpose. We can make use of the
#' `"up-arrow"` and `"down-arrow"` icons here. The `fmt_icon()` function has to
#' find those text values in cells to generate the icons, so, let's generate the
#' text within a new column with [cols_add()] (an expression is used therein to
#' generate the correct text given the `close` and `open` values). Following
#' that, `fmt_icon()` is used and its `fill_color` argument is provided with a
#' named vector that indicates which color should be used for each icon.
#'
#' ```r
#' sp500 |>
#'   dplyr::slice_head(n = 10) |>
#'   dplyr::select(date, open, close) |>
#'   dplyr::arrange(-dplyr::row_number()) |>
#'   gt(rowname_col = "date") |>
#'   cols_add(week = date, .after = date) |>
#'   cols_add(dir = ifelse(close > open, "arrow-up", "arrow-down")) |>
#'   cols_merge(columns = c(date, week), pattern = "{1} ({2})") |>
#'   fmt_date(columns = date, date_style = "m_day_year") |>
#'   fmt_datetime(columns = week, format = "w", pattern = "W{x}") |>
#'   fmt_currency() |>
#'   fmt_icon(
#'     columns = dir,
#'     fill_color = c("arrow-up" = "green", "arrow-down" = "red")
#'   ) |>
#'   cols_label(
#'     open = "Opening Value",
#'     close = "Closing Value",
#'     dir = ""
#'   ) |>
#'   opt_stylize(style = 1, color = "gray")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_icon_5.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-27
#'
#' @section Function Introduced:
#' `v0.10.0` (October 7, 2023)
#'
#' @export
fmt_icon <- function(
    data,
    columns = everything(),
    rows = everything(),
    height = "1em",
    sep = " ",
    stroke_color = NULL,
    stroke_width = NULL,
    stroke_alpha = NULL,
    fill_color = NULL,
    fill_alpha = NULL,
    vertical_adj = NULL,
    margin_left = NULL,
    margin_right = NULL,
    a11y = c("semantic", "decorative", "none")
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Determine if the fontawesome package is installed and stop the
  # function if it is not present
  rlang::check_installed("fontawesome", "to insert icons with `fmt_icon()`.")

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - height
  # - sep
  # - stroke_color
  # - stroke_width
  # - stroke_alpha
  # - fill_color
  # - fill_alpha
  # - vertical_adj
  # - margin_left
  # - margin_right
  # - a11y

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_icon",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_icon(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          height = p_i$height %||% height,
          sep = p_i$sep %||% sep,
          stroke_color = p_i$stroke_color %||% stroke_color,
          stroke_width = p_i$stroke_width %||% stroke_width,
          stroke_alpha = p_i$stroke_alpha %||% stroke_alpha,
          fill_color = p_i$fill_color %||% fill_color,
          fill_alpha = p_i$fill_alpha %||% fill_alpha,
          vertical_adj = p_i$vertical_adj %||% vertical_adj,
          margin_left = p_i$margin_left %||% margin_left,
          margin_right = p_i$margin_right %||% margin_right,
          a11y = p_i$a11y %||% a11y
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Ensure that arguments are matched
  a11y <- rlang::arg_match0(a11y, values = c("semantic", "decorative", "none"))

  if (a11y == "semantic") {
    a11y <- "sem"
  }
  if (a11y == "decorative") {
    a11y <- "deco"
  }

  valid_class <- c("character", "factor")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      html = function(x) {

        # Generate a vector of empty strings that will eventually
        # contain all of the link text
        x_str <- character(length(x))

        x_str_non_missing <- x[!is.na(x)]

        fill_color_named <- rlang::is_named(fill_color)

        x_str_non_missing <-
          vapply(
            seq_along(x_str_non_missing),
            FUN.VALUE = character(1L),
            USE.NAMES = FALSE,
            FUN = function(x) {

              if (grepl(",", x_str_non_missing[x])) {
                icons <-
                  tolower(unlist(strsplit(x_str_non_missing[x], ",\\s*")))
              } else {
                icons <- tolower(x_str_non_missing[x])
              }

              # Automatically append `px` length unit when `height`
              # is given as a number
              if (is.numeric(height)) {
                height <- paste0(height, "px")
              }

              # TODO: Parse to ensure that `icons` values are valid

              out <- c()

              for (y in seq_along(icons)) {

                icon_name_i <- icons[y]

                if (
                  fill_color_named &&
                  rlang::has_name(fill_color, name = icon_name_i)
                ) {
                  fill_color_i <- fill_color[[icon_name_i]]
                } else {
                  fill_color_i <- fill_color
                }

                out_y <-
                  as.character(
                    fontawesome::fa(
                      name = icons[y],
                      fill = fill_color_i,
                      fill_opacity = fill_alpha,
                      stroke = stroke_color,
                      stroke_width = stroke_width,
                      stroke_opacity = stroke_alpha,
                      height = height,
                      width = NULL,
                      margin_left = margin_left,
                      margin_right = margin_right,
                      vertical_align = vertical_adj,
                      position = NULL,
                      prefer_type = "regular",
                      a11y = a11y
                    )
                  )

                out <- c(out, out_y)
              }

              paste0(
                "<span style=\"white-space:nowrap;\">",
                paste0(out, collapse = sep),
                "</span>"
              )
            }
          )

        x_str[!is.na(x)] <- x_str_non_missing
        x_str[is.na(x)] <- NA_character_
        x_str
      },
      latex = function(x) {
        x
      },
      rtf = function(x) {
        x
      },
      word = function(x) {
        x
      },
      default = function(x) {
        x
      }
    )
  )
}

# fmt_markdown() ---------------------------------------------------------------
#' Format Markdown text
#'
#' @description
#'
#' Any Markdown-formatted text in the incoming cells will be transformed to the
#' appropriate output type during render when using `fmt_markdown()`.
#'
#' @inheritParams fmt_number
#'
#' @param md_engine *Choice of Markdown engine*
#'
#'   `singl-kw:[markdown|commonmark]` // *default:* `"markdown"`
#'
#'   The engine preference for Markdown rendering. By default, this is set to
#'   `"markdown"` where **gt** will use the **markdown** package for Markdown
#'   conversion to HTML and LaTeX. The other option is `"commonmark"` and with
#'   that the **commonmark** package will be used.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with the `md_engine` argument of `fmt_markdown()`
#' to obtain varying parameter values from a specified column within the table.
#' This means that each row could be formatted a little bit differently.
#'
#' Please note that for this argument (`md_engine`), a [from_column()] call
#' needs to reference a column that has data of the `character` type. Additional
#' columns for parameter values can be generated with [cols_add()] (if not
#' already present). Columns that contain parameter data can also be hidden from
#' final display with [cols_hide()].
#'
#' @section Examples:
#'
#' Create a few Markdown-based text snippets.
#'
#' ```r
#' text_1a <- "
#' ### This is Markdown.
#'
#' Markdown's syntax is comprised entirely of
#' punctuation characters, which punctuation
#' characters have been carefully chosen so as
#' to look like what they mean... assuming
#' you've ever used email.
#' "
#'
#' text_1b <- "
#' Info on Markdown syntax can be found
#' [here](https://daringfireball.net/projects/markdown/).
#' "
#'
#' text_2a <- "
#' The **gt** package has these datasets:
#'
#'  - `countrypops`
#'  - `sza`
#'  - `gtcars`
#'  - `sp500`
#'  - `pizzaplace`
#'  - `exibble`
#' "
#'
#' text_2b <- "
#' There's a quick reference [here](https://commonmark.org/help/).
#' "
#' ```
#'
#' Arrange the text snippets as a tibble using `dplyr::tribble()`, then, create
#' a **gt** table and format all columns with `fmt_markdown()`.
#'
#' ```r
#' dplyr::tribble(
#'   ~Markdown, ~md,
#'   text_1a,   text_2a,
#'   text_1b,   text_2b,
#' ) |>
#'   gt() |>
#'   fmt_markdown(columns = everything()) |>
#'   tab_options(table.width = px(400))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_markdown_1.png")`
#' }}
#'
#' `fmt_markdown()` can also handle LaTeX math formulas enclosed in
#' `"$..$"` (inline math) and also `"$$..$$"` (display math). The following
#' table has body cells that contain mathematical formulas in display mode
#' (i.e., the formulas are surrounded by `"$$"`). Further to this, math can be
#' used within [md()] wherever there is the possibility to insert text into the
#' table (e.g., with [cols_label()], [tab_header()], etc.).
#'
#' ```r
#' dplyr::tibble(
#'   idx = 1:5,
#'   l_time_domain =
#'     c(
#'       "$$1$$",
#'       "$${{\\bf{e}}^{a\\,t}}$$",
#'       "$${t^n},\\,\\,\\,\\,\\,n = 1,2,3, \\ldots$$",
#'       "$${t^p}, p > -1$$",
#'       "$$\\sqrt t$$"
#'     ),
#'   l_laplace_s_domain =
#'     c(
#'       "$$\\frac{1}{s}$$",
#'       "$$\\frac{1}{{s - a}}$$",
#'       "$$\\frac{{n!}}{{{s^{n + 1}}}}$$",
#'       "$$\\frac{{\\Gamma \\left( {p + 1} \\right)}}{{{s^{p + 1}}}}$$",
#'       "$$\\frac{{\\sqrt \\pi }}{{2{s^{\\frac{3}{2}}}}}$$"
#'     )
#' ) |>
#'   gt(rowname_col = "idx") |>
#'   fmt_markdown() |>
#'   cols_label(
#'     l_time_domain = md(
#'       "Time Domain<br/>$\\small{f\\left( t \\right) =
#'       {\\mathcal{L}^{\\,\\, - 1}}\\left\\{ {F\\left( s \\right)} \\right\\}}$"
#'     ),
#'     l_laplace_s_domain = md(
#'       "$s$ Domain<br/>$\\small{F\\left( s \\right) =
#'       \\mathcal{L}\\left\\{ {f\\left( t \\right)} \\right\\}}$"
#'     )
#'   ) |>
#'   tab_header(
#'     title = md(
#'       "A (Small) Table of Laplace Transforms &mdash; $\\small{{\\mathcal{L}}}$"
#'     ),
#'     subtitle = md(
#'       "Five commonly used Laplace transforms and formulas.<br/><br/>"
#'     )
#'   ) |>
#'   cols_align(align = "center") |>
#'   opt_align_table_header(align = "left") |>
#'   cols_width(
#'     idx ~ px(50),
#'     l_time_domain ~ px(300),
#'     l_laplace_s_domain ~ px(600)
#'   ) |>
#'   opt_stylize(
#'     style = 2,
#'     color = "gray",
#'     add_row_striping = FALSE
#'   ) |>
#'   opt_table_outline(style = "invisible") |>
#'   tab_style(
#'     style = cell_fill(color = "gray95"),
#'     locations = cells_body(columns = l_time_domain)
#'   ) |>
#'   tab_options(
#'     heading.title.font.size = px(32),
#'     heading.subtitle.font.size = px(18),
#'     heading.padding = px(0),
#'     footnotes.multiline = FALSE,
#'     column_labels.border.lr.style = "solid",
#'     column_labels.border.lr.width = px(1)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_markdown_2.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-28
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @seealso The vector-formatting version of this function:
#'   [vec_fmt_markdown()].
#'
#' @export
fmt_markdown <- function(
    data,
    columns = everything(),
    rows = everything(),
    md_engine = c("markdown", "commonmark")
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - md_engine

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_markdown",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_markdown(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          md_engine = p_i$md_engine %||% md_engine
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Ensure that arguments are matched
  md_engine <-
    rlang::arg_match0(
      md_engine,
      values = c("markdown", "commonmark")
    )

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      html = function(x) {
        # Ensure input is x (e.g. for factors)
        if (!is.character(x)) {
          x <- as.character(x)
        }
        process_text(md(x), context = "html")
      },
      latex = function(x) {
        markdown_to_latex(x, md_engine = md_engine)
      },
      rtf = function(x) {
        markdown_to_rtf(x)
      },
      word = function(x) {
        markdown_to_xml(x)
      },
      grid = function(x) {
        x <- unescape_html(x)
        sub(
          "\n$", "",
          vapply(
            x,
            FUN.VALUE = character(1L),
            USE.NAMES = FALSE,
            commonmark::markdown_text
          )
        )
      },
      default = function(x) {
        sub(
          "\n$", "",
          vapply(
            x,
            FUN.VALUE = character(1L),
            USE.NAMES = FALSE,
            commonmark::markdown_text
          )
        )
      }
    )
  )
}

# fmt_passthrough() ------------------------------------------------------------
#' Format by simply passing data through
#'
#' @description
#'
#' We can format values with `fmt_passthrough()`, which does little
#' more than: (1) coercing to `character` (as all the `fmt_*()` functions do),
#' and (2) applying decorator text via the `pattern` argument (the default is to
#' apply nothing). This formatting function is useful when don't want to modify
#' the input data other than to decorate it within a pattern.
#'
#' @inheritParams fmt_number
#'
#' @param escape *Text escaping*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   An option to escape text according to the final output format of the table.
#'   For example, if a LaTeX table is to be generated then LaTeX escaping would
#'   be performed during rendering. By default this is set to `TRUE` but setting
#'   as `FALSE` would be useful in the case where text is crafted for a specific
#'   output format in mind.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_passthrough()` to
#' obtain varying parameter values from a specified column within the table.
#' This means that each row could be formatted a little bit differently. These
#' arguments provide support for [from_column()]:
#'
#' - `escape`
#' - `pattern`
#'
#' Please note that for both of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Examples:
#'
#' Let's use the [`exibble`] dataset to create a single-column **gt** table
#' (with only the `char` column). Now we can pass the data in that column
#' through the 'non-formatter' that is `fmt_passthrough()`. While the
#' function doesn't do any explicit formatting it has a feature common to all
#' other formatting functions: the `pattern` argument. So that's what we'll use
#' in this example, applying a simple pattern to the non-`NA` values that adds
#' an `"s"` character.
#'
#' ```r
#' exibble |>
#'   dplyr::select(char) |>
#'   gt() |>
#'   fmt_passthrough(
#'     rows = !is.na(char),
#'     pattern = "{x}s"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_passthrough_1.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-29
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
fmt_passthrough <- function(
    data,
    columns = everything(),
    rows = everything(),
    escape = TRUE,
    pattern = "{x}"
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - escape
  # - pattern

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_passthrough",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_passthrough(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          escape = p_i$escape %||% escape,
          pattern = p_i$pattern %||% pattern
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions (as a function list) to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      html = function(x) {

        # Create `x_str` with same length as `x`
        x_str <- rep_len(NA_character_, length(x))

        # Handle formatting of pattern
        x_str <-
          apply_pattern_fmt_x(
            pattern,
            values = x
          )

        if (escape) {
          x_str <- process_text(text = x_str, context = "html")
        }

        x_str
      },
      grid = function(x) {
        # Create `x_str` with same length as `x`
        x_str <- rep_len(NA_character_, length(x))

        # Handle formatting of pattern
        x_str <-
          apply_pattern_fmt_x(
            pattern,
            values = x
          )

        if (escape) {
          x_str <- process_text(text = x_str, context = "grid")
        }

        x_str
      },
      latex = function(x) {

        # Create `x_str` with same length as `x`
        x_str <- rep_len(NA_character_, length(x))

        # Handle formatting of pattern
        x_str <-
          apply_pattern_fmt_x(
            pattern,
            values = x
          )

        if (escape) {
          x_str <- process_text(text = x_str, context = "latex")
        }

        x_str
      },
      rtf = function(x) {

        # Create `x_str` with same length as `x`
        x_str <- rep_len(NA_character_, length(x))

        # Handle formatting of pattern
        x_str <-
          apply_pattern_fmt_x(
            pattern,
            values = x
          )

        if (escape) {
          x_str <- process_text(text = x_str, context = "rtf")
        }

        x_str
      },
      default = function(x) {

        # Create `x_str` with same length as `x`
        x_str <- rep_len(NA_character_, length(x))

        # Handle formatting of pattern
        x_str <-
          apply_pattern_fmt_x(
            pattern,
            values = x
          )

        x_str
      }
    )
  )
}

# fmt_auto() -------------------------------------------------------------------
#' Automatically format column data according to their values
#'
#' @description
#'
#' `fmt_auto()` will automatically apply formatting of various types in a way
#' that best suits the data table provided. The function will attempt to format
#' numbers such that they are condensed to an optimal width, either with
#' scientific notation or large-number suffixing. Currency values are detected
#' by currency codes embedded in the column name and formatted in the correct
#' way. Although the functionality here is comprehensive it's still possible to
#' reduce the scope of automatic formatting with the `scope` argument and also
#' by choosing a subset of columns and rows to which the formatting will be applied.
#'
#' @inheritParams fmt_number
#'
#' @param scope *Scope of automatic formatting*
#'
#'   `mult-kw:[numbers|currency]` // *default:* `c("numbers", "currency")`
#'
#'   By default, the function will format both `"numbers"`-type values and
#'   `"currency"`-type values though the scope can be reduced to a single type
#'   of value to format.
#'
#' @param lg_num_pref *Large-number preference*
#'
#'   `singl-kw:[sci|suf]` // *default:* `"sci"`
#'
#'   When large numbers are present, there can be a fixed preference toward how
#'   they are formatted. Choices are scientific notation for very small and very
#'   large values (`"sci"`), or, the use of suffixed numbers (`"suf"`, for large
#'   values only).
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use the [`exibble`] dataset to create a **gt** table. Format all of the
#' columns automatically with the `fmt_auto()` function.
#'
#' ```r
#' exibble |>
#'   gt() |>
#'   fmt_auto()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_auto_1.png")`
#' }}
#'
#' Let's now use the [`countrypops`] dataset to create another **gt** table.
#' We'll again use `fmt_auto()` to automatically format all columns but this
#' time the choice will be made to opt for large-number suffixing instead of
#' scientific notation. This is done by using the `lg_num_pref = "suf"` option.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(country_code_3, year, population) |>
#'   dplyr::filter(country_code_3 %in% c("CHN", "IND", "USA", "PAK", "IDN")) |>
#'   dplyr::filter(year > 1975 & year %% 5 == 0) |>
#'   tidyr::pivot_wider(names_from = year, values_from = population) |>
#'   dplyr::arrange(desc(`2020`)) |>
#'   gt(rowname_col = "country_code_3") |>
#'   fmt_auto(lg_num_pref = "suf")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_auto_2.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-30
#'
#' @section Function Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
#' @export
fmt_auto <- function(
    data,
    columns = everything(),
    rows = everything(),
    scope = c("numbers", "currency"),
    lg_num_pref = c("sci", "suf"),
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Ensure that arguments are matched
  lg_num_pref <- rlang::arg_match0(lg_num_pref, values = c("sci", "suf"))

  # Resolve the `locale` value here with the global locale value
  locale <- resolve_locale(data = data, locale = locale)

  currency_codes <- tolower(currencies[["curr_code"]])

  resolved_columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data,
      excl_stub = FALSE
    )

  resolved_rows_idx <-
    resolve_rows_i(
      expr = {{ rows }},
      data = data
    )

  vars_default <- dt_boxhead_get_vars_default(data = data)

  # Get the intersection of the resolved columns and the default vars
  columns_to_format <- base::intersect(vars_default, resolved_columns)

  # Get the internal data table
  data_tbl <- dt_data_get(data = data)

  for (i in seq_along(columns_to_format)) {

    col_name <- columns_to_format[i]

    col_vec <- data_tbl[[columns_to_format[i]]]

    if (
      is.numeric(col_vec) &&
      "currency" %in% scope &&
      grepl(
        paste0("(\\.|_)(", paste0(currency_codes, collapse = "|"), ")$"),
        tolower(col_name)
      )
    ) {

      # Case where numeric values are inferred to be currency values
      # since the column name contains a valid currency code after a
      # period or underscore

      # Obtain the currency code (which is known to exist and be valid)
      # from the column name
      currency <- toupper(sub(".*(?=.{3}$)", "", col_name, perl = TRUE))

      # Format all values in the selected column as currency values
      data <-
        fmt_currency(
          data = data,
          columns = columns_to_format[i],
          rows = rows,
          currency = currency,
          locale = locale
        )

    } else if (is.numeric(col_vec) && "numbers" %in% scope) {

      # Case where column values are numeric or integer values,
      # known through inspection of the column class

      # Obtain the row series vector which actually just `resolved_rows_idx`
      row_series_vec <- resolved_rows_idx

      # Create a subset of `col_vec` which should only correspond to the
      # resolved rows
      col_vec <- col_vec[row_series_vec]

      # Determine whether the column class is of the integer type or
      # integer-like
      is_integer_column <- is.integer(col_vec) || rlang::is_integerish(col_vec)

      # Conditions for numbers in `col_vec` to be good candidates for
      # a scientific notation representation
      rows_sci <- col_vec != 0 & (abs(col_vec) < 1E-3 | abs(col_vec) >= 1E6)

      # Conditions for numbers in `col_vec` to be suitable for a
      # large-number-suffixing treatment (best in the millions to
      # trillions range)
      rows_suf <- abs(col_vec) >= 1E6 & col_vec < 1E15

      if (lg_num_pref == "sci") {

        # In the case where we prefer to have scientific notation
        # for very small and very large numbers, we need to partition
        # the `row_series_vec` into `rows_num` and `rows_sci` vectors
        # of integers; these represent the rows to be formatted in
        # the column by either `fmt_number()` or `fmt_scientific()`

        # This is the vector of row indices that will be used
        # for scientific notation formatting
        rows_sci_vec <- row_series_vec[rows_sci]

        # The remainder of values in `row_series_vec` will undergo
        # numeric formatting
        rows_num_vec <- base::setdiff(row_series_vec, rows_sci_vec)

        # Set `row_suf_vec` as a zero-length vector because the
        # preference is to not have any suffixed numbers at all
        rows_suf_vec <- integer(0L)
      }

      if (lg_num_pref == "suf") {

        # In the case where we would rather have suffixed numbers
        # represent large values (in the millions to trillions range);
        # we can't, however, rule out scientific notation for very large
        # or very small values though

        # This is the vector of row indices that will be used
        # for scientific notation formatting
        rows_sci_vec <- row_series_vec[rows_sci & !rows_suf]

        # If there's an overlapping range then preference is given
        # to the suffixing form
        rows_suf_vec <- row_series_vec[rows_sci & rows_suf]

        # The remainder of values in `row_series_vec` will undergo
        # numeric formatting without large number suffixing
        rows_num_vec <-
          base::setdiff(row_series_vec, c(rows_sci_vec, rows_suf_vec))
      }

      # Remove NA values from the different `vec` objects
      rows_sci_vec <- rows_sci_vec[!is.na(rows_sci_vec)]
      rows_suf_vec <- rows_suf_vec[!is.na(rows_suf_vec)]
      rows_num_vec <- rows_num_vec[!is.na(rows_num_vec)]

      if (length(rows_num_vec) > 0) {

        # Format non-scientific, non-suffixed values with
        # `fmt_number()` if they aren't integer or integer-like

        data <-
          fmt_number(
            data = data,
            columns = columns_to_format[i],
            rows = rows_num_vec,
            decimals = if (is_integer_column) 0 else 3,
            drop_trailing_zeros = TRUE,
            locale = locale
          )
      }

      if (length(rows_suf_vec) > 0) {

        # Format values with large-number suffixes using
        # `fmt_number(..., suffixing = TRUE)`
        data <-
          fmt_number(
            data = data,
            columns = columns_to_format[i],
            rows = rows_suf_vec,
            decimals = 1,
            drop_trailing_zeros = TRUE,
            suffixing = TRUE,
            locale = locale
          )
      }

      if (length(rows_sci_vec) > 0) {

        # Format values with in scientific notation using
        # `fmt_scientific()`
        data <-
          fmt_scientific(
            data = data,
            columns = columns_to_format[i],
            rows = rows_sci_vec,
            decimals = if (is_integer_column) 0 else 3,
            locale = locale
          )
      }

      if (length(rows_sci_vec) < 1 && length(rows_suf_vec) < 1) {

        data <-
          cols_align_decimal(
            data = data,
            columns = columns_to_format[i],
            locale = locale
          )
      }
    }
  }

  data
}
