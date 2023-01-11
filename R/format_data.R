#' Format numeric values
#'
#' @description
#'
#' With numeric values in a **gt** table, we can perform number-based
#' formatting so that the targeted values are rendered with a higher
#' consideration for tabular presentation. Furthermore, there is finer control
#' over numeric formatting with the following options:
#'
#' - decimals: choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' - digit grouping separators: options to enable/disable digit separators
#' and provide a choice of separator symbol
#' - scaling: we can choose to scale targeted values by a multiplier value
#' - large-number suffixing: larger figures (thousands, millions, etc.) can
#' be autoscaled and decorated with the appropriate suffixes
#' - pattern: option to use a text pattern for decoration of the formatted
#' values
#' - locale-based formatting: providing a locale ID will result in number
#' formatting specific to the chosen locale
#'
#' @param data A table object that is created using the [gt()] function.
#' @param columns The columns to format. Can either be a series of column names
#'   provided in [c()], a vector of column indices, or a helper function
#'   focused on selections. The select helper functions are: [starts_with()],
#'   [ends_with()], [contains()], [matches()], [one_of()], [num_range()], and
#'   [everything()].
#' @param rows Optional rows to format. Providing [everything()] (the
#'   default) results in all rows in `columns` being formatted. Alternatively,
#'   we can supply a vector of row captions within [c()], a vector of row
#'   indices, or a helper function focused on selections. The select helper
#'   functions are: [starts_with()], [ends_with()], [contains()], [matches()],
#'   [one_of()], [num_range()], and [everything()]. We can also use expressions
#'   to filter down to the rows we need (e.g.,
#'   `[colname_1] > 100 & [colname_2] < 50`).
#' @param decimals An option to specify the exact number of decimal places to
#'   use. The default number of decimal places is `2`.
#' @param n_sigfig A option to format numbers to *n* significant figures. By
#'   default, this is `NULL` and thus number values will be formatted according
#'   to the number of decimal places set via `decimals`. If opting to format
#'   according to the rules of significant figures, `n_sigfig` must be a number
#'   greater than or equal to `1`. Any values passed to the `decimals` and
#'   `drop_trailing_zeros` arguments will be ignored.
#' @param drop_trailing_zeros A logical value that allows for removal of
#'   trailing zeros (those redundant zeros after the decimal mark).
#' @param drop_trailing_dec_mark A logical value that determines whether decimal
#'   marks should always appear even if there are no decimal digits to display
#'   after formatting (e.g, `23` becomes `23.`). The default for this is `TRUE`,
#'   which means that trailing decimal marks are not shown.
#' @param use_seps An option to use digit group separators. The type of digit
#'   group separator is set by `sep_mark` and overridden if a locale ID is
#'   provided to `locale`. This setting is `TRUE` by default.
#' @param accounting An option to use accounting style for values. With `FALSE`
#'   (the default), negative values will be shown with a minus sign. Using
#'   `accounting = TRUE` will put negative values in parentheses.
#' @param scale_by A value to scale the input. The default is `1.0`. All numeric
#'   values will be multiplied by this value first before undergoing formatting.
#'   This value will be ignored if using any of the `suffixing` options (i.e.,
#'   where `suffixing` is not set to `FALSE`).
#' @param suffixing An option to scale and apply suffixes to larger numbers
#'   (e.g., `1924000` can be transformed to `1.92M`). This option can accept a
#'   logical value, where `FALSE` (the default) will not perform this
#'   transformation and `TRUE` will apply thousands (`K`), millions (`M`),
#'   billions (`B`), and trillions (`T`) suffixes after automatic value scaling.
#'   We can also specify which symbols to use for each of the value ranges by
#'   using a character vector of the preferred symbols to replace the defaults
#'   (e.g., `c("k", "Ml", "Bn", "Tr")`).
#'
#'   Including `NA` values in the vector will ensure that the particular range
#'   will either not be included in the transformation (e.g, `c(NA, "M", "B",
#'   "T")` won't modify numbers in the thousands range) or the range will
#'   inherit a previous suffix (e.g., with `c("K", "M", NA, "T")`, all numbers
#'   in the range of millions and billions will be in terms of millions).
#'
#'   Any use of `suffixing` (where it is not set expressly as `FALSE`) means
#'   that any value provided to `scale_by` will be ignored.
#'
#'   If using `system = "ind"` then the default suffix set provided by
#'   `suffixing = TRUE` will be `c(NA, "L", "Cr")`. This doesn't apply suffixes
#'   to the thousands range, but does express values in lakhs and crores.
#'
#' @param pattern A formatting pattern that allows for decoration of the
#'   formatted value. The value itself is represented by `{x}` and all other
#'   characters are taken to be string literals.
#' @param sep_mark The mark to use as a separator between groups of digits
#'   (e.g., using `sep_mark = ","` with `1000` would result in a formatted value
#'   of `1,000`).
#' @param dec_mark The character to use as a decimal mark (e.g., using `dec_mark
#'   = ","` with `0.152` would result in a formatted value of `0,152`).
#' @param force_sign Should the positive sign be shown for positive values
#'   (effectively showing a sign for all values except zero)? If so, use `TRUE`
#'   for this option. The default is `FALSE`, where only negative numbers will
#'   display a minus sign. This option is disregarded when using accounting
#'   notation with `accounting = TRUE`.
#' @param system The numbering system to use. By default, this is the
#'   international numbering system (`"intl"`) whereby grouping separators
#'   (i.e., `sep_mark`) are separated by three digits. The alternative system,
#'   the Indian numbering system (`"ind"`) uses grouping separators that
#'   correspond to thousand, lakh, crore, and higher quantities.
#' @param locale An optional locale ID that can be used for formatting values
#'   according to the locale's rules.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' The `fmt_number()` formatting function is compatible with body cells that are
#' of the `"numeric"` or `"integer"` types. Any other types of body cells are
#' ignored during formatting. This is to say that cells of incompatible data
#' types may be targeted, but there will be no attempt to format them.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value of 100,000 (excluding
#' `NA`s from consideration).
#'
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
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
#' useful reference on which locales are supported, we can use the
#' [info_locales()] function to view an info table.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table. Format the `num` column as numeric
#' with three decimal places and with no use of digit separators.
#'
#' ```r
#' exibble |>
#'   gt() |>
#'   fmt_number(
#'     columns = num,
#'     decimals = 3,
#'     use_seps = FALSE
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_number_1.png")`
#' }}
#'
#' Use [`countrypops`] to create a **gt** table. Format all columns to use
#' large-number suffixing with the `suffixing = TRUE` option.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(country_code_3, year, population) |>
#'   dplyr::filter(country_code_3 %in% c("CHN", "IND", "USA", "PAK", "IDN")) |>
#'   dplyr::filter(year > 1975 & year %% 5 == 0) |>
#'   tidyr::spread(year, population) |>
#'   dplyr::arrange(desc(`2015`)) |>
#'   gt(rowname_col = "country_code_3") |>
#'   fmt_number(suffixing = TRUE)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_number_2.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-1
#'
#' @seealso The [fmt_integer()] function might be more useful if you really need
#'   to format numeric values to appear as integers (i.e., no decimals will be
#'   shown and input values are rounded as necessary). Need to do numeric
#'   formatting on a vector? Take a look at the vector-formatting version of
#'   this function: [vec_fmt_number()].
#'
#' @import rlang
#' @export
fmt_number <- function(
    data,
    columns = everything(),
    rows = everything(),
    decimals = 2,
    n_sigfig = NULL,
    drop_trailing_zeros = FALSE,
    drop_trailing_dec_mark = TRUE,
    use_seps = TRUE,
    accounting = FALSE,
    scale_by = 1.0,
    suffixing = FALSE,
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign = FALSE,
    system = c("intl", "ind"),
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Declare formatting function compatibility
  compat <- c("numeric", "integer")

  # Ensure that arguments are matched
  system <- rlang::arg_match(system)

  # Resolve the `locale` value here with the global locale value
  locale <- resolve_locale(data = data, locale = locale)

  # Use locale-based marks if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)
  dec_mark <- get_locale_dec_mark(locale, dec_mark)

  # Normalize the `suffixing` input to either return a character vector
  # of suffix labels, or NULL (the case where `suffixing` is FALSE)
  suffix_labels <- normalize_suffixing_inputs(suffixing, scale_by, system)

  # In this case where strict mode is being used (with the option
  # called "gt.strict_column_fmt"), stop the function if any of the
  # resolved columns have data that is incompatible with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = compat
    )
  ) {
    if (isTRUE(getOption("gt.strict_column_fmt", TRUE))) {
      cli::cli_abort(
        "The `fmt_number()` and `fmt_integer()` functions can only be
      used on `columns` with numeric data."
      )
    }
  }

  # Set the `formatC_format` option according to whether number
  # formatting with significant figures is to be performed
  if (!is.null(n_sigfig)) {

    # Stop function if `n_sigfig` does not have a valid value
    validate_n_sigfig(n_sigfig)

    formatC_format <- "fg"
  } else {
    formatC_format <- "f"
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = compat,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      format_fn = function(x, context) {

        # Create the `suffix_df` object
        suffix_df <-
          create_suffix_df(
            x,
            decimals = decimals,
            suffix_labels = suffix_labels,
            scale_by = scale_by,
            system = system
          )

        # Scale the `x` values by the `scale_by` values in `suffix_df`
        x <- scale_x_values(x, scale_by = suffix_df$scale_by)

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
            system = system
          )

        # Paste the vector of suffixes to the right of the values
        x_str <- paste_right(x_str, x_right = suffix_df$suffix)

        # Format values in accounting notation (if `accounting = TRUE`)
        x_str <-
          format_as_accounting(
            x_str,
            x = x,
            context = context,
            accounting = accounting
          )

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

#' Format values as integers
#'
#' @description
#'
#' With numeric values in a **gt** table, we can perform number-based
#' formatting so that the targeted values are always rendered as integer values.
#' We can have fine control over integer formatting with the following options:
#'
#' - digit grouping separators: options to enable/disable digit separators
#' and provide a choice of separator symbol
#' - scaling: we can choose to scale targeted values by a multiplier value
#' - large-number suffixing: larger figures (thousands, millions, etc.) can
#' be autoscaled and decorated with the appropriate suffixes
#' - pattern: option to use a text pattern for decoration of the formatted
#' values
#' - locale-based formatting: providing a locale ID will result in number
#' formatting specific to the chosen locale
#'
#' @inheritParams fmt_number
#' @param suffixing An option to scale and apply suffixes to larger numbers
#'   (e.g., `1924000` can be transformed to `2M`). This option can accept a
#'   logical value, where `FALSE` (the default) will not perform this
#'   transformation and `TRUE` will apply thousands (`K`), millions (`M`),
#'   billions (`B`), and trillions (`T`) suffixes after automatic value scaling.
#'   We can also specify which symbols to use for each of the value ranges by
#'   using a character vector of the preferred symbols to replace the defaults
#'   (e.g., `c("k", "Ml", "Bn", "Tr")`).
#'
#'   Including `NA` values in the vector will ensure that the particular range
#'   will either not be included in the transformation (e.g, `c(NA, "M", "B",
#'   "T")` won't modify numbers in the thousands range) or the range will
#'   inherit a previous suffix (e.g., with `c("K", "M", NA, "T")`, all numbers
#'   in the range of millions and billions will be in terms of millions).
#'
#'   Any use of `suffixing` (where it is not set expressly as `FALSE`) means
#'   that any value provided to `scale_by` will be ignored.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' The `fmt_integer()` formatting function is compatible with body cells that
#' are of the `"numeric"` or `"integer"` types. Any other types of body cells
#' are ignored during formatting. This is to say that cells of incompatible data
#' types may be targeted, but there will be no attempt to format them.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value of 100,000 (excluding
#' `NA`s from consideration).
#'
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
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
#' useful reference on which locales are supported, we can use the
#' [info_locales()] function to view an info table.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table. format the `num` column as integer
#' values having no digit separators (with the `use_seps = FALSE` option).
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, char) |>
#'   gt() |>
#'   fmt_integer(
#'     columns = num,
#'     use_seps = FALSE
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_integer_1.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-2
#'
#' @seealso The [fmt_number()] function might be more of what you need if you'd
#'   like decimal values in your outputs. Need to do integer-based formatting on
#'   a vector? Take a look at the vector-formatting version of this function:
#'   [vec_fmt_integer()].
#'
#' @import rlang
#' @export
fmt_integer <- function(
    data,
    columns = everything(),
    rows = everything(),
    use_seps = TRUE,
    accounting = FALSE,
    scale_by = 1.0,
    suffixing = FALSE,
    pattern = "{x}",
    sep_mark = ",",
    force_sign = FALSE,
    system = c("intl", "ind"),
    locale = NULL
) {

  fmt_number(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    decimals = 0,
    n_sigfig = NULL,
    drop_trailing_zeros = FALSE,
    drop_trailing_dec_mark = TRUE,
    use_seps = use_seps,
    accounting = accounting,
    scale_by = scale_by,
    suffixing = suffixing,
    pattern = pattern,
    sep_mark = sep_mark,
    dec_mark = "not used",
    force_sign = force_sign,
    system = system,
    locale = locale
  )
}

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
#' @param scale_by A value to scale the input. The default is `1.0`. All numeric
#'   values will be multiplied by this value first before undergoing formatting.
#' @param exp_style Style of formatting to use for the scientific notation
#'   formatting. By default this is `"x10n"` but other options include using
#'   a single letter (e.g., `"e"`, `"E"`, etc.), a letter followed by a `"1"` to
#'   signal a minimum digit width of one, or `"low-ten"` for using a stylized
#'   `"10"` marker.
#' @param force_sign_m,force_sign_n Should the plus sign be shown for positive
#'   values of the mantissa (first component) or the exponent? This would
#'   effectively show a sign for all values except zero on either of those
#'   numeric components of the notation. If so, use `TRUE` for either one of
#'   these options. The default for both is `FALSE`, where only negative numbers
#'   will display a sign.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' The `fmt_scientific()` formatting function is compatible with body cells that
#' are of the `"numeric"` or `"integer"` types. Any other types of body cells
#' are ignored during formatting. This is to say that cells of incompatible data
#' types may be targeted, but there will be no attempt to format them.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value of 100,000 (excluding
#' `NA`s from consideration).
#'
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
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
#' useful reference on which locales are supported, we can use the
#' [info_locales()] function to view an info table.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table. Format the `num` column as
#' partially numeric  and partially in scientific notation (using the
#' `num > 500` and `num <= 500` expressions in the respective `rows` arguments).
#'
#' ```r
#' exibble |>
#'   gt() |>
#'   fmt_number(
#'     columns = num,
#'     rows = num > 500,
#'     decimals = 1,
#'     scale_by = 1/1000,
#'     pattern = "{x}K"
#'   ) |>
#'   fmt_scientific(
#'     columns = num,
#'     rows = num <= 500,
#'     decimals = 1
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_scientific_1.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-3
#'
#' @seealso The vector-formatting version of this function:
#'   [vec_fmt_scientific()].
#'
#' @import rlang
#' @export
fmt_scientific <- function(
    data,
    columns = everything(),
    rows = everything(),
    decimals = 2,
    drop_trailing_zeros = FALSE,
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
  stop_if_not_gt(data = data)

  # Declare formatting function compatibility
  compat <- c("numeric", "integer")

  # Set default values
  suffixing <- FALSE
  use_seps <- TRUE

  # Resolve the `locale` value here with the global locale value
  locale <- resolve_locale(data = data, locale = locale)

  # Use locale-based marks if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)
  dec_mark <- get_locale_dec_mark(locale, dec_mark)

  # Normalize the `suffixing` input to either return a character vector
  # of suffix labels, or NULL (the case where `suffixing` is FALSE)
  suffix_labels <- normalize_suffixing_inputs(suffixing, scale_by, system = "intl")

  # In this case where strict mode is being used (with the option
  # called "gt.strict_column_fmt"), stop the function if any of the
  # resolved columns have data that is incompatible with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = compat
    )
  ) {
    if (isTRUE(getOption("gt.strict_column_fmt", TRUE))) {
      cli::cli_abort(
        "The `fmt_scientific()` function can only be used on `columns`
      with numeric data."
      )
    }
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = compat,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      format_fn = function(x, context) {

        # Define the marks by context
        exp_marks <- context_exp_marks(context = context)
        minus_mark <- context_minus_mark(context = context)

        # Define the `replace_minus()` function
        replace_minus <- function(x) {
           tidy_gsub(x, "-", minus_mark, fixed = TRUE)
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

        # Scale the `x` values by the `scale_by` values in `suffix_df`
        x <- scale_x_values(x, scale_by = suffix_df$scale_by)

        x_str <-
          format_num_to_str(
            x,
            context = context,
            decimals = decimals,
            n_sigfig = NULL,
            sep_mark = sep_mark,
            dec_mark = dec_mark,
            drop_trailing_zeros = drop_trailing_zeros,
            drop_trailing_dec_mark = FALSE,
            format = "e",
            replace_minus_mark = FALSE
          )

        if (exp_style == "x10n") {

          # Determine which values don't require the (x 10^n)
          # for scientific formatting since their order would be zero
          small_pos <- has_order_zero(x)

          # For any numbers that shouldn't have an exponent, remove
          # that portion from the character version
          x_str[small_pos] <-
            replace_minus(split_scientific_notn(x_str = x_str[small_pos])$num)

          # For any non-NA numbers that do have an exponent, format
          # those according to the output context
          sci_parts <- split_scientific_notn(x_str = x_str[!small_pos])

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

          m_part <- replace_minus(m_part)
          n_part <- replace_minus(n_part)

          x_str[!small_pos] <-
            paste0(m_part, exp_marks[1], n_part, exp_marks[2])

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
              x_str,
              FUN.VALUE = character(1),
              USE.NAMES = FALSE,
              FUN = function(x) {

                if (!grepl("e(\\+|-)[0-9]{2,}", x)) return("")

                x <- unlist(strsplit(x, "e"))[2]

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

          # Generate `x_str_left` using `x_str` here
          x_str_left <-
            vapply(
              x_str,
              FUN.VALUE = character(1),
              USE.NAMES = FALSE,
              FUN = function(x) {
                if (!grepl("e(\\+|-)[0-9]{2,}", x)) return("")
                unlist(strsplit(x, "e"))[1]
              }
            )

          if (force_sign_n) {

            n_part <-
              vapply(
                seq_along(n_part),
                FUN.VALUE = character(1),
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

          x_str[!is.infinite(x)] <-
            paste0(x_str_left[!is.infinite(x)], exp_str, replace_minus(n_part[!is.infinite(x)]))

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
#' @param scale_by A value to scale the input. The default is `1.0`. All numeric
#'   values will be multiplied by this value first before undergoing formatting.
#' @param exp_style Style of formatting to use for the engineering notation
#'   formatting. By default this is `"x10n"` but other options include using
#'   a single letter (e.g., `"e"`, `"E"`, etc.), a letter followed by a `"1"` to
#'   signal a minimum digit width of one, or `"low-ten"` for using a stylized
#'   `"10"` marker.
#' @param force_sign_m,force_sign_n Should the plus sign be shown for positive
#'   values of the mantissa (first component) or the exponent? This would
#'   effectively show a sign for all values except zero on either of those
#'   numeric components of the notation. If so, use `TRUE` for either one of
#'   these options. The default for both is `FALSE`, where only negative numbers
#'   will display a sign.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' The `fmt_engineering()` formatting function is compatible with body cells
#' that are of the `"numeric"` or `"integer"` types. Any other types of body
#' cells are ignored during formatting. This is to say that cells of
#' incompatible data types may be targeted, but there will be no attempt to
#' format them.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value of 100,000 (excluding
#' `NA`s from consideration).
#'
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
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
#' useful reference on which locales are supported, we can use the
#' [info_locales()] function to view an info table.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table. Format the `num` column in
#' engineering notation.
#'
#' ```r
#' exibble |>
#'   gt() |>
#'   fmt_engineering(columns = num)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_engineering_1.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-4
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
  stop_if_not_gt(data = data)

  # Declare formatting function compatibility
  compat <- c("numeric", "integer")

  # Set default values
  suffixing <- FALSE
  use_seps <- TRUE

  # Resolve the `locale` value here with the global locale value
  locale <- resolve_locale(data = data, locale = locale)

  # Use locale-based marks if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)
  dec_mark <- get_locale_dec_mark(locale, dec_mark)

  # Normalize the `suffixing` input to either return a character vector
  # of suffix labels, or NULL (the case where `suffixing` is FALSE)
  suffix_labels <- normalize_suffixing_inputs(suffixing, scale_by, system = "intl")

  # In this case where strict mode is being used (with the option
  # called "gt.strict_column_fmt"), stop the function if any of the
  # resolved columns have data that is incompatible with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = compat
    )
  ) {
    if (isTRUE(getOption("gt.strict_column_fmt", TRUE))) {
      cli::cli_abort(
        "The `fmt_engineering()` function can only be used on `columns`
      with numeric data."
      )
    }
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = compat,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      format_fn = function(x, context) {

        # Define the marks by context
        exp_marks <- context_exp_marks(context = context)
        minus_mark <- context_minus_mark(context = context)

        # Define the `replace_minus()` function
        replace_minus <- function(x) {
          tidy_gsub(x, "-", minus_mark, fixed = TRUE)
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

        # Scale the `x_vals` by the `scale_by` values
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
            drop_trailing_dec_mark = FALSE,
            format = "f",
            replace_minus_mark = FALSE
          )

        x_str_left <- replace_minus(x_str_left)

        n_part <-
          vapply(
            power_3,
            FUN.VALUE = character(1),
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
              FUN.VALUE = character(1),
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
                FUN.VALUE = character(1),
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
  system <- rlang::arg_match(system)

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

        # Scale the `x_vals` by the `scale_by` value
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
              sep_mark = sep_mark,
              dec_mark = dec_mark,
              drop_trailing_zeros = drop_trailing_zeros,
              drop_trailing_dec_mark = drop_trailing_dec_mark,
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
              sep_mark = sep_mark,
              dec_mark = dec_mark,
              drop_trailing_zeros = drop_trailing_zeros,
              drop_trailing_dec_mark = drop_trailing_dec_mark,
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

#' Format values as a percentage
#'
#' @description
#'
#' With numeric values in a **gt** table, we can perform percentage-based
#' formatting. It is assumed the input numeric values are proportional values
#' and, in this case, the values will be automatically multiplied by `100`
#' before decorating with a percent sign (the other case is accommodated though
#' setting the `scale_values` to `FALSE`). For more control over percentage
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
#' @param scale_values Should the values be scaled through multiplication by
#'   100? By default this is `TRUE` since the expectation is that normally
#'   values are proportions. Setting to `FALSE` signifies that the values are
#'   already scaled and require only the percent sign when formatted.
#' @param incl_space An option for whether to include a space between the value
#'   and the percent sign. The default is to not introduce a space character.
#' @param placement The placement of the percent sign. This can be either be
#'   `right` (the default) or `left`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' The `fmt_percent()` formatting function is compatible with body cells that
#' are of the `"numeric"` or `"integer"` types. Any other types of body cells
#' are ignored during formatting. This is to say that cells of incompatible data
#' types may be targeted, but there will be no attempt to format them.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value of 100,000 (excluding
#' `NA`s from consideration).
#'
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
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
#' useful reference on which locales are supported, we can use the
#' [info_locales()] function to view an info table.
#'
#' @section Examples:
#'
#' Use [`pizzaplace`] to create a **gt** table. Format the `frac_of_quota`
#' column to display values as percentages.
#'
#' ```r
#' pizzaplace |>
#'   dplyr::mutate(month = as.numeric(substr(date, 6, 7))) |>
#'   dplyr::group_by(month) |>
#'   dplyr::summarize(pizzas_sold = dplyr::n()) |>
#'   dplyr::ungroup() |>
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
#' 3-5
#'
#' @seealso The vector-formatting version of this function: [vec_fmt_percent()].
#'
#' @import rlang
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
    accounting = FALSE,
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign = FALSE,
    incl_space = FALSE,
    placement = "right",
    system = c("intl", "ind"),
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Declare formatting function compatibility
  compat <- c("numeric", "integer")

  # Ensure that arguments are matched
  system <- rlang::arg_match(system)

  # Resolve the `locale` value here with the global locale value
  locale <- resolve_locale(data = data, locale = locale)

  # In this case where strict mode is being used (with the option
  # called "gt.strict_column_fmt"), stop the function if any of the
  # resolved columns have data that is incompatible with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = compat
    )
  ) {
    if (isTRUE(getOption("gt.strict_column_fmt", TRUE))) {
      cli::cli_abort(
        "The `fmt_percent()` function can only be used on `columns`
      with numeric data."
      )
    }
  }

  if (scale_values) {
    scale_by <- 100
  } else {
    scale_by <- 1.0
  }

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
#' @param to_units A keyword that signifies the desired output quantity. This
#'   can be any from the following set: `"per-mille"`, `"per-myriad"`, `"pcm"`,
#'   `"ppm"`, `"ppb"`, `"ppt"`, or `"ppq"`.
#' @param symbol The symbol/units to use for the quantity. By default, this is
#'   set to `"auto"` and **gt** will choose the appropriate symbol based on the
#'   `to_units` keyword and the output context. However, this can be changed by
#'   supplying a string (e.g, using `symbol = "ppbV"` when `to_units = "ppb"`).
#' @param scale_values Should the values be scaled through multiplication
#'   according to the keyword set in `to_units`? By default this is `TRUE` since
#'   the expectation is that normally values are proportions. Setting to `FALSE`
#'   signifies that the values are already scaled and require only the
#'   appropriate symbol/units when formatted.
#' @param incl_space An option for whether to include a space between the value
#'   and the symbol/units. The default is `"auto"` which provides spacing
#'   dependent on the mark itself. This can be directly controlled by using
#'   either `TRUE` or `FALSE`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' The `fmt_partsper()` formatting function is compatible with body cells that
#' are of the `"numeric"` or `"integer"` types. Any other types of body cells
#' are ignored during formatting. This is to say that cells of incompatible data
#' types may be targeted, but there will be no attempt to format them.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value of 100,000 (excluding
#' `NA`s from consideration).
#'
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
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
#' useful reference on which locales are supported, we can use the
#' [info_locales()] function to view an info table.
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
#' 3-6
#'
#' @seealso The vector-formatting version of this function:
#'   [vec_fmt_partsper()].
#'
#' @import rlang
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
  stop_if_not_gt(data = data)

  # Declare formatting function compatibility
  compat <- c("numeric", "integer")

  # Ensure that arguments are matched
  to_units <- rlang::arg_match(to_units)
  system <- rlang::arg_match(system)

  # Resolve the `locale` value here with the global locale value
  locale <- resolve_locale(data = data, locale = locale)

  # In this case where strict mode is being used (with the option
  # called "gt.strict_column_fmt"), stop the function if any of the
  # resolved columns have data that is incompatible with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = compat
    )
  ) {
    if (isTRUE(getOption("gt.strict_column_fmt", TRUE))) {
      cli::cli_abort(
        "The `fmt_partsper()` function can only be used on `columns`
      with numeric data."
      )
    }
  }

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

#' Format values as a mixed fractions
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
#' @param accuracy The type of fractions to generate. This can either be one of
#'   the keywords `"low"`, `"med"`, or `"high"` (to generate fractions with
#'   denominators of up to 1, 2, or 3 digits, respectively) or an integer value
#'   greater than zero to obtain fractions with a fixed denominator (`2` yields
#'   halves, `3` is for thirds, `4` is quarters, etc.). For the latter option,
#'   using `simplify = TRUE` will simplify fractions where possible (e.g., `2/4`
#'   will be simplified as `1/2`). By default, the `"low"` option is used.
#' @param simplify If choosing to provide a numeric value for `accuracy`, the
#'   option to simplify the fraction (where possible) can be taken with `TRUE`
#'   (the default). With `FALSE`, denominators in fractions will be fixed to the
#'   value provided in `accuracy`.
#' @param layout For HTML output, the `"inline"` layout is the default. This
#'   layout places the numerals of the fraction on the baseline and uses a
#'   standard slash character. The `"diagonal"` layout will generate fractions
#'   that are typeset with raised/lowered numerals and a virgule.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' The `fmt_fraction()` formatting function is compatible with body cells that
#' are of the `"numeric"` or `"integer"` types. Any other types of body cells
#' are ignored during formatting. This is to say that cells of incompatible data
#' types may be targeted, but there will be no attempt to format them.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value of 100,000 (excluding
#' `NA`s from consideration).
#'
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
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
#' useful reference on which locales are supported, we can use the
#' [info_locales()] function to view an info table.
#'
#' @section Examples:
#'
#' Use [`pizzaplace`] to create a **gt** table. Format the `f_sold` and
#' `f_income` columns to display fractions.
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
#' 3-7
#'
#' @seealso The vector-formatting version of this function:
#'   [vec_fmt_fraction()].
#'
#' @import rlang
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
  stop_if_not_gt(data = data)

  # Declare formatting function compatibility
  compat <- c("numeric", "integer")

  # Ensure that arguments are matched
  system <- rlang::arg_match(system)
  layout <- rlang::arg_match(layout)

  if (is.null(accuracy)) {

    accuracy <- "low"

  } else {

    if (is.character(accuracy)) {

      if (!(accuracy %in% c("low", "med", "high"))) {

        cli::cli_abort(c(
          "The value supplied for `accuracy` is invalid.",
          "*" = "Must be either \"low\", \"med\", or \"high\"."
        ))
      }

    } else if (is.numeric(accuracy)) {

      if (accuracy < 1) {

        cli::cli_abort(c(
          "The numeric value supplied for `accuracy` is invalid.",
          "*" = "Must be an integer value greater than zero."
        ))
      }

    } else {

      cli::cli_abort(c(
        "The input for `accuracy` is invalid.",
        "*" = "Must be a keyword \"low\", \"med\", or \"high\", or",
        "*" = "Must be an integer value greater than zero."
      ))
    }
  }

  # Resolve the `locale` value here with the global locale value
  locale <- resolve_locale(data = data, locale = locale)

  # In this case where strict mode is being used (with the option
  # called "gt.strict_column_fmt"), stop the function if any of the
  # resolved columns have data that is incompatible with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = compat
    )
  ) {
    if (isTRUE(getOption("gt.strict_column_fmt", TRUE))) {
      cli::cli_abort(
        "The `fmt_fraction()` function can only be used on `columns`
      with numeric data."
      )
    }
  }

  # Use locale-based `sep_mark` if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = compat,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      format_fn = function(x, context) {

        # Get the correct minus mark based on the output context
        minus_mark <- context_minus_mark(context = context)

        # Generate an vector of empty strings that will eventually contain
        # all of the fractional parts of the finalized numbers
        fraction_x <- rep("", length(x))

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
            context = context, decimals = 0, n_sigfig = NULL,
            sep_mark = sep_mark, dec_mark = "",
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

          has_a_fraction <- grepl("/", x_str)

          non_fraction_part <- gsub("^(.*?)[0-9]*/[0-9]*", "\\1", x_str[has_a_fraction])

          fraction_part <- gsub("^(.*?)([0-9]*/[0-9]*)", "\\2", x_str[has_a_fraction])

          num_vec <- unlist(lapply(strsplit(fraction_part, "/"), `[[`, 1))
          denom_vec <- unlist(lapply(strsplit(fraction_part, "/"), `[[`, 2))

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
                gsub(" ", "\\\\, ", non_fraction_part),
                paste0("{{}^{", num_vec, "}\\!/_{", denom_vec, "}}")
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
  return(ifelse(r, gcd(y, r), y))
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
          decimals = 0, n_sigfig = NULL,
          sep_mark = "", dec_mark = ".",
          drop_trailing_zeros = TRUE,
          drop_trailing_dec_mark = TRUE,
          format = "f"
        ),
        "/",
        format_num_to_str(
          denom,
          context = "plain",
          decimals = 0, n_sigfig = NULL,
          sep_mark = "", dec_mark = ".",
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

#' Format values as currencies
#'
#' @description
#'
#' With numeric values in a **gt** table, we can perform currency-based
#' formatting. This function supports both automatic formatting with a
#' three-letter or numeric currency code. We can also specify a custom currency
#' that is formatted according to the output context with the [currency()]
#' helper function. Numeric formatting facilitated through the use of a locale
#' ID. We have fine control over the conversion from numeric values to currency
#' values, where we could take advantage of the following options:
#'
#' - the currency: providing a currency code or common currency name will
#' procure the correct currency symbol and number of currency subunits; we could
#' also use the [currency()] helper function to specify a custom currency
#' - currency symbol placement: the currency symbol can be placed before
#' or after the values
#' - decimals/subunits: choice of the number of decimal places, and a
#' choice of the decimal symbol, and an option on whether to include or exclude
#' the currency subunits (decimal portion)
#' - negative values: choice of a negative sign or parentheses for values
#' less than zero
#' - digit grouping separators: options to enable/disable digit separators
#' and provide a choice of separator symbol
#' - scaling: we can choose to scale targeted values by a multiplier value
#' - large-number suffixing: larger figures (thousands, millions, etc.) can
#' be autoscaled and decorated with the appropriate suffixes
#' - pattern: option to use a text pattern for decoration of the formatted
#' currency values
#' - locale-based formatting: providing a locale ID will result in
#' currency formatting specific to the chosen locale
#'
#' We can use the [info_currencies()] function for a useful reference on all of
#' the possible inputs to the `currency` argument.
#'
#' @inheritParams fmt_number
#' @param currency The currency to use for the numeric value. This input can be
#'   supplied as a 3-letter currency code (e.g., `"USD"` for U.S. Dollars,
#'   `"EUR"` for the Euro currency). Use [info_currencies()] to get an
#'   information table with all of the valid currency codes and examples of
#'   each. Alternatively, we can provide a common currency name (e.g.,
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
#'   If nothing is provided to `currency` then `"USD"` (U.S. dollars) will be
#'   used.
#' @param use_subunits An option for whether the subunits portion of a currency
#'   value should be displayed. By default, this is `TRUE`.
#' @param placement The placement of the currency symbol. This can be either be
#'   `left` (the default) or `right`.
#' @param incl_space An option for whether to include a space between the value
#'   and the currency symbol. The default is to not introduce a space character.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' The `fmt_currency()` formatting function is compatible with body cells that
#' are of the `"numeric"` or `"integer"` types. Any other types of body cells
#' are ignored during formatting. This is to say that cells of incompatible data
#' types may be targeted, but there will be no attempt to format them.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value of 100,000 (excluding
#' `NA`s from consideration).
#'
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
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
#' useful reference on which locales are supported, we can use the
#' [info_locales()] function to view an info table.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table. Format the `currency` column to
#' have currency values in euros (`"EUR"`).
#'
#' ```r
#' exibble |>
#'   gt() |>
#'   fmt_currency(
#'     columns = currency,
#'     currency = "EUR"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_currency_1.png")`
#' }}
#'
#' Use [`exibble`] to create a **gt** table. Keep only the `num` and `currency`,
#' columns, then, format those columns using the `"CNY"` and `"GBP"` currencies.
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, currency) |>
#'   gt() |>
#'   fmt_currency(
#'     columns = num,
#'     currency = "CNY"
#'   ) |>
#'   fmt_currency(
#'     columns = currency,
#'     currency = "GBP"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_currency_2.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-8
#'
#' @seealso The vector-formatting version of this function:
#'   [vec_fmt_currency()].
#'
#' @import rlang
#' @export
fmt_currency <- function(
    data,
    columns = everything(),
    rows = everything(),
    currency = "USD",
    use_subunits = TRUE,
    decimals = NULL,
    drop_trailing_dec_mark = TRUE,
    use_seps = TRUE,
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
  stop_if_not_gt(data = data)

  # Declare formatting function compatibility
  compat <- c("numeric", "integer")

  # Ensure that arguments are matched
  system <- rlang::arg_match(system)

  # Resolve the `locale` value here with the global locale value
  locale <- resolve_locale(data = data, locale = locale)

  # In this case where strict mode is being used (with the option
  # called "gt.strict_column_fmt"), stop the function if any of the
  # resolved columns have data that is incompatible with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = compat
    )
  ) {
    if (isTRUE(getOption("gt.strict_column_fmt", TRUE))) {
      cli::cli_abort(
        "The `fmt_currency()` function can only be used on `columns`
      with numeric data."
      )
    }
  }

  # Stop function if `currency` does not have a valid value
  validate_currency(currency = currency)

  # Get the number of decimal places
  decimals <-
    get_currency_decimals(
      currency = currency,
      decimals = decimals,
      use_subunits = use_subunits
    )

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

#' Format values as Roman numerals
#'
#' @description
#'
#' With numeric values in a **gt** table we can transform those to Roman
#' numerals, rounding values as necessary.
#'
#' @inheritParams fmt_number
#' @param case Should Roman numerals should be rendered as uppercase (`"upper"`)
#'   or lowercase (`"lower"`) letters? By default, this is set to `"upper"`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' The `fmt_roman()` formatting function is compatible with body cells that are
#' of the `"numeric"` or `"integer"` types. Any other types of body cells are
#' ignored during formatting. This is to say that cells of incompatible data
#' types may be targeted, but there will be no attempt to format them.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value of 100,000 (excluding
#' `NA`s from consideration).
#'
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
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
#' @family data formatting functions
#' @section Function ID:
#' 3-9
#'
#' @seealso The vector-formatting version of this function: [vec_fmt_roman()].
#'
#' @import rlang
#' @export
fmt_roman <- function(
    data,
    columns = everything(),
    rows = everything(),
    case = c("upper", "lower"),
    pattern = "{x}"
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Declare formatting function compatibility
  compat <- c("numeric", "integer")

  # Ensure that arguments are matched
  case <- rlang::arg_match(case)

  # In this case where strict mode is being used (with the option
  # called "gt.strict_column_fmt"), stop the function if any of the
  # resolved columns have data that is incompatible with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = compat
    )
  ) {
    if (isTRUE(getOption("gt.strict_column_fmt", TRUE))) {
      cli::cli_abort(
        "The `fmt_roman()` function can only be used on `columns`
      with numeric data."
      )
    }
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = compat,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      use_latex_math_mode = FALSE,
      format_fn = function(x, context) {

        # Generate an vector of empty strings that will eventually contain
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
#' @param case Should resulting index characters be rendered as uppercase
#'   (`"upper"`) or lowercase (`"lower"`) letters? By default, this is set to
#'   `"upper"`.
#' @param index_algo The indexing algorithm for handling the recycling of the
#'   index character set. By default, the `"repeat"` option is used where
#'   characters are doubled, tripled, and so on, when moving past the character
#'   set limit. The alternative is the `"excel"` option, where Excel-based
#'   column naming is adapted and used here (e.g., `[..., Y, Z, AA, AB, ...]`).
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' The `fmt_index()` formatting function is compatible with body cells that are
#' of the `"numeric"` or `"integer"` types. Any other types of body cells are
#' ignored during formatting. This is to say that cells of incompatible data
#' types may be targeted, but there will be no attempt to format them.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value of 100,000 (excluding
#' `NA`s from consideration).
#'
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
#'
#' @section Examples:
#'
#' Create a tibble of small numeric values and generate a **gt** table. Format
#' the `idx` column to appear as index characters with `fmt_index()`.
#'
#' ```r
#' dplyr::tibble(num = c(1, 8, 24, 85), idx = num) |>
#'   gt(rowname_col = "num") |>
#'   fmt_index(columns = idx)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_roman_1.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-10
#'
#' @seealso The vector-formatting version of this function: [vec_fmt_index()].
#'
#' @import rlang
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
  stop_if_not_gt(data = data)

  # Declare formatting function compatibility
  compat <- c("numeric", "integer")

  # Ensure that arguments are matched
  case <- rlang::arg_match(case)
  index_algo <- rlang::arg_match(index_algo)

  # Resolve the `locale` value here with the global locale value
  locale <- resolve_locale(data = data, locale = locale)

  # Use locale-based `idx_set` if a locale ID is provided
  idx_set <- get_locale_idx_set(locale)

  # In this case where strict mode is being used (with the option
  # called "gt.strict_column_fmt"), stop the function if any of the
  # resolved columns have data that is incompatible with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = compat
    )
  ) {
    if (isTRUE(getOption("gt.strict_column_fmt", TRUE))) {
      cli::cli_abort(
        "The `fmt_index()` function can only be used on `columns`
      with numeric data."
      )
    }
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = compat,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      use_latex_math_mode = FALSE,
      format_fn = function(x, context) {

        # Generate an vector of empty strings that will eventually contain
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
            FUN.VALUE = character(1),
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
      FUN.VALUE = character(1),
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

#' Format values as bytes
#'
#' @description
#'
#' With numeric values in a **gt** table, we can transform those to values of
#' bytes with human readable units. The `fmt_bytes()` function allows for the
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
#' @param standard The way to express large byte sizes.
#' @param decimals An option to specify the exact number of decimal places to
#'   use. The default number of decimal places is `1`.
#' @param incl_space An option for whether to include a space between the value
#'   and the units. The default of `TRUE` uses a space character for separation.
#' @param force_sign Should the positive sign be shown for positive numbers
#'   (effectively showing a sign for all numbers except zero)? If so, use `TRUE`
#'   for this option. The default is `FALSE`, where only negative numbers will
#'   display a minus sign.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' The `fmt_bytes()` formatting function is compatible with body cells that are
#' of the `"numeric"` or `"integer"` types. Any other types of body cells are
#' ignored during formatting. This is to say that cells of incompatible data
#' types may be targeted, but there will be no attempt to format them.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value of 100,000 (excluding
#' `NA`s from consideration).
#'
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
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
#' useful reference on which locales are supported, we can use the
#' [info_locales()] function to view an info table.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table. Format the `num` column to have
#' byte sizes in the decimal standard.
#'
#' ```r
#' exibble |>
#'   dplyr::select(num) |>
#'   gt() |>
#'   fmt_bytes(columns = num)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_bytes_1.png")`
#' }}
#'
#' Create a similar table with the `fmt_bytes()` function, this time showing
#' byte sizes as binary values.
#'
#' ```r
#' exibble |>
#'   dplyr::select(num) |>
#'   gt() |>
#'   fmt_bytes(
#'     columns = num,
#'     standard = "binary"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_bytes_2.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-11
#'
#' @seealso The vector-formatting version of this function: [vec_fmt_bytes()].
#'
#' @import rlang
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
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign = FALSE,
    incl_space = TRUE,
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Declare formatting function compatibility
  compat <- c("numeric", "integer")

  # Ensure that arguments are matched
  standard <- rlang::arg_match(standard)

  # In this case where strict mode is being used (with the option
  # called "gt.strict_column_fmt"), stop the function if any of the
  # resolved columns have data that is incompatible with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = compat
    )
  ) {
    if (isTRUE(getOption("gt.strict_column_fmt", TRUE))) {
      cli::cli_abort(
        "The `fmt_bytes()` function can only be used on `columns`
      with numeric data."
      )
    }
  }

  # Resolve the `locale` value here with the global locale value
  locale <- resolve_locale(data = data, locale = locale)

  # Use locale-based marks if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)
  dec_mark <- get_locale_dec_mark(locale, dec_mark)

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
    compat = compat,
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

#' Format values as dates
#'
#' @description
#'
#' Format input values to time values using one of 41 preset date styles. Input
#' can be in the form of `POSIXt` (i.e., datetimes), the `Date` type, or
#' `character` (must be in the ISO 8601 form of `YYYY-MM-DD HH:MM:SS` or
#' `YYYY-MM-DD`).
#'
#' @inheritParams fmt_number
#' @param date_style The date style to use. By default this is `"iso"` which
#'   corresponds to ISO 8601 date formatting. The other date styles can be
#'   viewed using [info_date_style()].
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' The `fmt_date()` formatting function is compatible with body cells that are
#' of the `"Date"`, `"POSIXt"` or `"character"` types. Any other types of body
#' cells are ignored during formatting. This is to say that cells of
#' incompatible data types may be targeted, but there will be no attempt to
#' format them.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value of 100,000 (excluding
#' `NA`s from consideration).
#'
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
#'
#' @section Formatting with the `date_style` argument:
#'
#' We need to supply a preset date style to the `date_style` argument. The date
#' styles are numerous and can handle localization to any supported locale. A
#' large segment of date styles are termed flexible date formats and this means
#' that their output will adapt to any `locale` provided. That feature makes the
#' flexible date formats a better option for locales other than `"en"` (the
#' default locale).
#'
#' The following table provides a listing of all date styles and their output
#' values (corresponding to an input date of `2000-02-29`).
#'
#' |    | Date Style            | Output                  | Notes         |
#' |----|-----------------------|-------------------------|---------------|
#' | 1  | `"iso"`               | `"2000-02-29"`          | ISO 8601      |
#' | 2  | `"wday_month_day_year"`| `"Tuesday, February 29, 2000"`  |      |
#' | 3  | `"wd_m_day_year"`     | `"Tue, Feb 29, 2000"`   |               |
#' | 4  | `"wday_day_month_year"`| `"Tuesday 29 February 2000"`    |      |
#' | 5  | `"month_day_year"`    | `"February 29, 2000"`   |               |
#' | 6  | `"m_day_year"`        | `"Feb 29, 2000"`        |               |
#' | 7  | `"day_m_year"`        | `"29 Feb 2000"`         |               |
#' | 8  | `"day_month_year"`    | `"29 February 2000"`    |               |
#' | 9  | `"day_month"`         | `"29 February"`         |               |
#' | 10 | `"day_m"`             | `"29 Feb"`              |               |
#' | 11 | `"year"`              | `"2000"`                |               |
#' | 12 | `"month"`             | `"February"`            |               |
#' | 13 | `"day"`               | `"29"`                  |               |
#' | 14 | `"year.mn.day"`       | `"2000/02/29"`          |               |
#' | 15 | `"y.mn.day"`          | `"00/02/29"`            |               |
#' | 16 | `"year_week"`         | `"2000-W09"`            |               |
#' | 17 | `"year_quarter"`      | `"2000-Q1"`             |               |
#' | 18 | `"yMd"`               | `"2/29/2000"`           | flexible      |
#' | 19 | `"yMEd"`              | `"Tue, 2/29/2000"`      | flexible      |
#' | 20 | `"yMMM"`              | `"Feb 2000"`            | flexible      |
#' | 21 | `"yMMMM"`             | `"February 2000"`       | flexible      |
#' | 22 | `"yMMMd"`             | `"Feb 29, 2000"`        | flexible      |
#' | 23 | `"yMMMEd"`            | `"Tue, Feb 29, 2000"`   | flexible      |
#' | 24 | `"GyMd"`              | `"2/29/2000 A"`         | flexible      |
#' | 25 | `"GyMMMd"`            | `"Feb 29, 2000 AD"`     | flexible      |
#' | 26 | `"GyMMMEd"`           | `"Tue, Feb 29, 2000 AD"`| flexible      |
#' | 27 | `"yM"`                | `"2/2000"`              | flexible      |
#' | 28 | `"Md"`                | `"2/29"`                | flexible      |
#' | 29 | `"MEd"`               | `"Tue, 2/29"`           | flexible      |
#' | 30 | `"MMMd"`              | `"Feb 29"`              | flexible      |
#' | 31 | `"MMMEd"`             | `"Tue, Feb 29"`         | flexible      |
#' | 32 | `"MMMMd"`             | `"February 29"`         | flexible      |
#' | 33 | `"GyMMM"`             | `"Feb 2000 AD"`         | flexible      |
#' | 34 | `"yQQQ"`              | `"Q1 2000"`             | flexible      |
#' | 35 | `"yQQQQ"`             | `"1st quarter 2000"`    | flexible      |
#' | 36 | `"Gy"`                | `"2000 AD"`             | flexible      |
#' | 37 | `"y"`                 | `"2000"`                | flexible      |
#' | 38 | `"M"`                 | `"2"`                   | flexible      |
#' | 39 | `"MMM"`               | `"Feb"`                 | flexible      |
#' | 40 | `"d"`                 | `"29"`                  | flexible      |
#' | 41 | `"Ed"`                | `"29 Tue"`              | flexible      |
#'
#' We can use the [info_date_style()] function within the console to view a
#' similar table of date styles with example output.
#'
#' @section Adapting output to a specific `locale`:
#'
#' This formatting function can adapt outputs according to a provided `locale`
#' value. Examples include `"en"` for English (United States) and `"fr"` for
#' French (France). Note that a `locale` value provided here will override any
#' global locale setting performed in [gt()]'s own `locale` argument (it is
#' settable there as a value received by all other functions that have a
#' `locale` argument). As a useful reference on which locales are supported, we
#' can use the [info_locales()] function to view an info table.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table. Keep only the `date` and `time`
#' columns. Format the `date` column to have dates formatted with the
#' `"month_day_year"` date style.
#'
#' ```r
#' exibble |>
#'   dplyr::select(date, time) |>
#'   gt() |>
#'   fmt_date(
#'     columns = date,
#'     date_style = "month_day_year"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_date_1.png")`
#' }}
#'
#' Use [`exibble`] to create a **gt** table. Keep only the `date` and `time`
#' columns. Format the `date` column to have mixed date formats (dates after
#' April will be different than the others because of the expressions used
#' in the `rows` argument).
#'
#' ```r
#' exibble |>
#'   dplyr::select(date, time) |>
#'   gt() |>
#'   fmt_date(
#'     columns = date,
#'     rows = as.Date(date) > as.Date("2015-04-01"),
#'     date_style = "m_day_year"
#'   ) |>
#'   fmt_date(
#'     columns = date,
#'     rows = as.Date(date) <= as.Date("2015-04-01"),
#'     date_style = "day_m_year"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_date_2.png")`
#' }}
#'
#' Use [`exibble`] to create another **gt** table, this time only with the
#' `date` column. Format the `date` column to use the `"yMMMEd"` date style
#' (which is one of the 'flexible' styles). Also, set the locale to `"nl"` to
#' get the dates in Dutch.
#'
#' ```r
#' exibble |>
#'   dplyr::select(date) |>
#'   gt() |>
#'   fmt_date(
#'     columns = date,
#'     date_style = "yMMMEd",
#'     locale = "nl"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_date_3.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-12
#'
#' @seealso The vector-formatting version of this function: [vec_fmt_date()].
#'
#' @import rlang
#' @export
fmt_date <- function(
    data,
    columns = everything(),
    rows = everything(),
    date_style = "iso",
    pattern = "{x}",
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Declare formatting function compatibility
  compat <- c("Date", "POSIXt", "character")

  # Resolve the `locale` value here with the global locale value
  locale <- resolve_locale(data = data, locale = locale)

  # Transform `date_style` to `date_format_str`
  date_format_str <- get_date_format(date_style = date_style)

  # In this case where strict mode is being used (with the option
  # called "gt.strict_column_fmt"), stop the function if any of the
  # resolved columns have data that is incompatible with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = compat
    )
  ) {
    if (isTRUE(getOption("gt.strict_column_fmt", TRUE))) {
      cli::cli_abort(c(
        "The `fmt_date()` function can only be used on `columns` of certain types.",
        "*" = "Allowed types are `Date`, `POSIXt`, and `character` (with
      ISO-8601 formatted dates)."
      ))
    }
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = compat,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      use_latex_math_mode = FALSE,
      format_fn = function(x, context) {

        # Convert incoming values to POSIXlt but provide a friendly error
        # if the values cannot be parsed by `as.POSIXlt()`
        date <-
          tryCatch(
            as.POSIXlt(x, tz = "GMT"),
            error = function(cond) {
              cli::cli_abort(
                "One or more of the provided date/datetime values are invalid."
              )
            }
          )

        # Format the date string using `fdt()`
        bigD::fdt(
          input = as.character(date),
          format = date_format_str,
          locale = locale
        )
      }
    )
  )
}

#' Format values as times
#'
#' @description
#'
#' Format input values to time values using one of 25 preset time styles. Input
#' can be in the form of `POSIXt` (i.e., datetimes), `character` (must be in the
#' ISO 8601 forms of `HH:MM:SS` or `YYYY-MM-DD HH:MM:SS`), or `Date` (which
#' always results in the formatting of `00:00:00`).
#'
#' @inheritParams fmt_number
#' @param time_style The time style to use. By default this is `"iso"` which
#'   corresponds to how times are formatted within ISO 8601 datetime values. The
#'   other time styles can be viewed using [info_time_style()].
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' The `fmt_time()` formatting function is compatible with body cells that are
#' of the `"Date"`, `"POSIXt"` or `"character"` types. Any other types of body
#' cells are ignored during formatting. This is to say that cells of
#' incompatible data types may be targeted, but there will be no attempt to
#' format them.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value of 100,000 (excluding
#' `NA`s from consideration).
#'
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
#'
#' @section Formatting with the `time_style` argument:
#'
#' We need to supply a preset time style to the `time_style` argument. There are
#' many time styles and all of them can handle localization to any supported
#' locale. Many of the time styles are termed flexible time formats and this
#' means that their output will adapt to any `locale` provided. That feature
#' makes the flexible time formats a better option for locales other than `"en"`
#' (the default locale).
#'
#' The following table provides a listing of all time styles and their output
#' values (corresponding to an input time of `14:35:00`). It is noted which of
#' these represent 12- or 24-hour time.
#'
#' |    | Time Style    | Output                          | Notes         |
#' |----|---------------|---------------------------------|---------------|
#' | 1  | `"iso"`       | `"14:35:00"`                    | ISO 8601, 24h |
#' | 2  | `"iso-short"` | `"14:35"`                       | ISO 8601, 24h |
#' | 3  | `"h_m_s_p"`   | `"2:35:00 PM"`                  | 12h           |
#' | 4  | `"h_m_p"`     | `"2:35 PM"`                     | 12h           |
#' | 5  | `"h_p"`       | `"2 PM"`                        | 12h           |
#' | 6  | `"Hms"`       | `"14:35:00"`                    | flexible, 24h |
#' | 7  | `"Hm"`        | `"14:35"`                       | flexible, 24h |
#' | 8  | `"H"`         | `"14"`                          | flexible, 24h |
#' | 9  | `"EHm"`       | `"Thu 14:35"`                   | flexible, 24h |
#' | 10 | `"EHms"`      | `"Thu 14:35:00"`                | flexible, 24h |
#' | 11 | `"Hmsv"`      | `"14:35:00 GMT+00:00"`          | flexible, 24h |
#' | 12 | `"Hmv"`       | `"14:35 GMT+00:00"`             | flexible, 24h |
#' | 13 | `"hms"`       | `"2:35:00 PM"`                  | flexible, 12h |
#' | 14 | `"hm"`        | `"2:35 PM"`                     | flexible, 12h |
#' | 15 | `"h"`         | `"2 PM"`                        | flexible, 12h |
#' | 16 | `"Ehm"`       | `"Thu 2:35 PM"`                 | flexible, 12h |
#' | 17 | `"Ehms"`      | `"Thu 2:35:00 PM"`              | flexible, 12h |
#' | 18 | `"EBhms"`   | `"Thu 2:35:00 in the afternoon"`  | flexible, 12h |
#' | 19 | `"Bhms"`      | `"2:35:00 in the afternoon"`    | flexible, 12h |
#' | 20 | `"EBhm"`      | `"Thu 2:35 in the afternoon"`   | flexible, 12h |
#' | 21 | `"Bhm"`       | `"2:35 in the afternoon"`       | flexible, 12h |
#' | 22 | `"Bh"`        | `"2 in the afternoon"`          | flexible, 12h |
#' | 23 | `"hmsv"`      | `"2:35:00 PM GMT+00:00"`        | flexible, 12h |
#' | 24 | `"hmv"`       | `"2:35 PM GMT+00:00"`           | flexible, 12h |
#' | 25 | `"ms"`        | `"35:00"`                       | flexible      |
#'
#' We can use the [info_time_style()] function within the console to view a
#' similar table of time styles with example output.
#'
#' @section Adapting output to a specific `locale`:
#'
#' This formatting function can adapt outputs according to a provided `locale`
#' value. Examples include `"en"` for English (United States) and `"fr"` for
#' French (France). Note that a `locale` value provided here will override any
#' global locale setting performed in [gt()]'s own `locale` argument (it is
#' settable there as a value received by all other functions that have a
#' `locale` argument). As a useful reference on which locales are supported, we
#' can use the [info_locales()] function to view an info table.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table. Keep only the `date` and `time`
#' columns. Format the `time` column to have times formatted as `hms_p` (time
#' style `3`).
#'
#' ```r
#' exibble |>
#'   dplyr::select(date, time) |>
#'   gt() |>
#'   fmt_time(
#'     columns = time,
#'     time_style = "h_m_s_p"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_time_1.png")`
#' }}
#'
#' Use [`exibble`] to create a **gt** table. Keep only the `date` and `time`
#' columns. Format the `time` column to have mixed time formats (times after
#' 16:00 will be different than the others because of the expressions used
#' in the `rows` argument).
#'
#' ```r
#' exibble |>
#'   dplyr::select(date, time) |>
#'   gt() |>
#'   fmt_time(
#'     columns = time,
#'     rows = time > "16:00",
#'     time_style = "h_m_s_p"
#'   ) |>
#'   fmt_time(
#'     columns = time,
#'     rows = time <= "16:00",
#'     time_style = "h_m_p"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_time_2.png")`
#' }}
#'
#' Use [`exibble`] to create another **gt** table, this time only with the
#' `time` column. Format the `time` column to use the `"EBhms"` time style
#' (which is one of the 'flexible' styles). Also, set the locale to `"sv"` to
#' get the dates in Swedish.
#'
#' ```r
#' exibble |>
#'   dplyr::select(time) |>
#'   gt() |>
#'   fmt_time(
#'     columns = time,
#'     time_style = "EBhms",
#'     locale = "sv"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_time_3.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-13
#'
#' @seealso The vector-formatting version of this function: [vec_fmt_time()].
#'
#' @import rlang
#' @export
fmt_time <- function(
    data,
    columns = everything(),
    rows = everything(),
    time_style = "iso",
    pattern = "{x}",
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Declare formatting function compatibility
  compat <- c("Date", "POSIXt", "character")

  # Transform `time_style` to `time_format_str`
  time_format_str <- get_time_format(time_style = time_style)

  # In this case where strict mode is being used (with the option
  # called "gt.strict_column_fmt"), stop the function if any of the
  # resolved columns have data that is incompatible with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = compat
    )
  ) {
    if (isTRUE(getOption("gt.strict_column_fmt", TRUE))) {
      cli::cli_abort(c(
        "The `fmt_time()` function can only be used on `columns` of certain types.",
        "*" = "Allowed types are `Date`, `POSIXt`, and `character` (in
      `HH:MM:SS` format)."
      ))
    }
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = compat,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      use_latex_math_mode = FALSE,
      format_fn = function(x, context) {

        # If the incoming values are strings that adequately represent time
        # values, then prepend with the `1970-01-01` dummy date to create an
        # input that will works with `strftime()`
        if (all(is_string_time(x))) {
          x <- paste("1970-01-01", x)
        }

        # Convert incoming values to POSIXlt but provide a friendly error
        # if the values cannot be parsed by `as.POSIXlt()`
        time <-
          tryCatch(
            as.POSIXlt(x, tz = "GMT"),
            error = function(cond) {
              cli::cli_abort(
                "One or more of the provided date/time/datetime values are invalid."
              )
            }
          )

        # Format the time string using `fdt()`
        bigD::fdt(
          input = as.character(time),
          format = time_format_str,
          locale = locale
        )
      }
    )
  )
}

#' Format values as datetimes
#'
#' @description
#'
#' Format input values to datetime values using either presets for the date and
#' time components or a formatting directive (this can either use a *CLDR*
#' datetime pattern or `strptime` formatting). The input values can be in the
#' form of `POSIXct` (i.e., datetimes), the `Date` type, or `character` (must be
#' in the ISO 8601 form of `YYYY-MM-DD HH:MM:SS` or `YYYY-MM-DD`).
#'
#' @inheritParams fmt_number
#' @inheritParams fmt_date
#' @inheritParams fmt_time
#' @param sep The separator string to use between the date and time components.
#'   By default, this is a single space character (`" "`). Only used when not
#'   specifying a `format` code.
#' @param format An optional formatting string used for generating custom
#'   dates/times. If used then the arguments governing preset styles
#'   (`date_style` and `time_style`) will be ignored in favor of formatting via
#'   the `format` string.
#' @param tz The time zone for printing dates/times (i.e., the output). The
#'   default of `NULL` will preserve the time zone of the input data in the
#'   output. If providing a time zone, it must be one that is recognized by the
#'   user's operating system (a vector of all valid `tz` values can be produced
#'   with [OlsonNames()]).
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' The `fmt_datetime()` formatting function is compatible with body cells that
#' are of the `"Date"`, `"POSIXct"` or `"character"` types. Any other types of
#' body cells are ignored during formatting. This is to say that cells of
#' incompatible data types may be targeted, but there will be no attempt to
#' format them.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value of 100,000 (excluding
#' `NA`s from consideration).
#'
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
#'
#' @section Formatting with the `date_style` argument:
#'
#' We can supply a preset date style to the `date_style` argument to separately
#' handle the date portion of the output. The date styles are numerous and can
#' handle localization to any supported locale. A large segment of date styles
#' are termed flexible date formats and this means that their output will adapt
#' to any `locale` provided. That feature makes the flexible date formats a
#' better option for locales other than `"en"` (the default locale).
#'
#' The following table provides a listing of all date styles and their output
#' values (corresponding to an input date of `2000-02-29`).
#'
#' |    | Date Style            | Output                  | Notes         |
#' |----|-----------------------|-------------------------|---------------|
#' | 1  | `"iso"`               | `"2000-02-29"`          | ISO 8601      |
#' | 2  | `"wday_month_day_year"`| `"Tuesday, February 29, 2000"`  |      |
#' | 3  | `"wd_m_day_year"`     | `"Tue, Feb 29, 2000"`   |               |
#' | 4  | `"wday_day_month_year"`| `"Tuesday 29 February 2000"`    |      |
#' | 5  | `"month_day_year"`    | `"February 29, 2000"`   |               |
#' | 6  | `"m_day_year"`        | `"Feb 29, 2000"`        |               |
#' | 7  | `"day_m_year"`        | `"29 Feb 2000"`         |               |
#' | 8  | `"day_month_year"`    | `"29 February 2000"`    |               |
#' | 9  | `"day_month"`         | `"29 February"`         |               |
#' | 10 | `"day_m"`             | `"29 Feb"`              |               |
#' | 11 | `"year"`              | `"2000"`                |               |
#' | 12 | `"month"`             | `"February"`            |               |
#' | 13 | `"day"`               | `"29"`                  |               |
#' | 14 | `"year.mn.day"`       | `"2000/02/29"`          |               |
#' | 15 | `"y.mn.day"`          | `"00/02/29"`            |               |
#' | 16 | `"year_week"`         | `"2000-W09"`            |               |
#' | 17 | `"year_quarter"`      | `"2000-Q1"`             |               |
#' | 18 | `"yMd"`               | `"2/29/2000"`           | flexible      |
#' | 19 | `"yMEd"`              | `"Tue, 2/29/2000"`      | flexible      |
#' | 20 | `"yMMM"`              | `"Feb 2000"`            | flexible      |
#' | 21 | `"yMMMM"`             | `"February 2000"`       | flexible      |
#' | 22 | `"yMMMd"`             | `"Feb 29, 2000"`        | flexible      |
#' | 23 | `"yMMMEd"`            | `"Tue, Feb 29, 2000"`   | flexible      |
#' | 24 | `"GyMd"`              | `"2/29/2000 A"`         | flexible      |
#' | 25 | `"GyMMMd"`            | `"Feb 29, 2000 AD"`     | flexible      |
#' | 26 | `"GyMMMEd"`           | `"Tue, Feb 29, 2000 AD"`| flexible      |
#' | 27 | `"yM"`                | `"2/2000"`              | flexible      |
#' | 28 | `"Md"`                | `"2/29"`                | flexible      |
#' | 29 | `"MEd"`               | `"Tue, 2/29"`           | flexible      |
#' | 30 | `"MMMd"`              | `"Feb 29"`              | flexible      |
#' | 31 | `"MMMEd"`             | `"Tue, Feb 29"`         | flexible      |
#' | 32 | `"MMMMd"`             | `"February 29"`         | flexible      |
#' | 33 | `"GyMMM"`             | `"Feb 2000 AD"`         | flexible      |
#' | 34 | `"yQQQ"`              | `"Q1 2000"`             | flexible      |
#' | 35 | `"yQQQQ"`             | `"1st quarter 2000"`    | flexible      |
#' | 36 | `"Gy"`                | `"2000 AD"`             | flexible      |
#' | 37 | `"y"`                 | `"2000"`                | flexible      |
#' | 38 | `"M"`                 | `"2"`                   | flexible      |
#' | 39 | `"MMM"`               | `"Feb"`                 | flexible      |
#' | 40 | `"d"`                 | `"29"`                  | flexible      |
#' | 41 | `"Ed"`                | `"29 Tue"`              | flexible      |
#'
#' We can use the [info_date_style()] function within the console to view a
#' similar table of date styles with example output.
#'
#' @section Formatting with the `time_style` argument:
#'
#' We can supply a preset time style to the `time_style` argument to separately
#' handle the time portion of the output. There are many time styles and all of
#' them can handle localization to any supported locale. Many of the time styles
#' are termed flexible time formats and this means that their output will adapt
#' to any `locale` provided. That feature makes the flexible time formats a
#' better option for locales other than `"en"` (the default locale).
#'
#' The following table provides a listing of all time styles and their output
#' values (corresponding to an input time of `14:35:00`). It is noted which of
#' these represent 12- or 24-hour time. Some of the flexible formats (those
#' that begin with `"E"`) include the the day of the week. Keep this in mind
#' when pairing such `time_style` values with a `date_style` so as to avoid
#' redundant or repeating information.
#'
#' |    | Time Style    | Output                          | Notes         |
#' |----|---------------|---------------------------------|---------------|
#' | 1  | `"iso"`       | `"14:35:00"`                    | ISO 8601, 24h |
#' | 2  | `"iso-short"` | `"14:35"`                       | ISO 8601, 24h |
#' | 3  | `"h_m_s_p"`   | `"2:35:00 PM"`                  | 12h           |
#' | 4  | `"h_m_p"`     | `"2:35 PM"`                     | 12h           |
#' | 5  | `"h_p"`       | `"2 PM"`                        | 12h           |
#' | 6  | `"Hms"`       | `"14:35:00"`                    | flexible, 24h |
#' | 7  | `"Hm"`        | `"14:35"`                       | flexible, 24h |
#' | 8  | `"H"`         | `"14"`                          | flexible, 24h |
#' | 9  | `"EHm"`       | `"Thu 14:35"`                   | flexible, 24h |
#' | 10 | `"EHms"`      | `"Thu 14:35:00"`                | flexible, 24h |
#' | 11 | `"Hmsv"`      | `"14:35:00 GMT+00:00"`          | flexible, 24h |
#' | 12 | `"Hmv"`       | `"14:35 GMT+00:00"`             | flexible, 24h |
#' | 13 | `"hms"`       | `"2:35:00 PM"`                  | flexible, 12h |
#' | 14 | `"hm"`        | `"2:35 PM"`                     | flexible, 12h |
#' | 15 | `"h"`         | `"2 PM"`                        | flexible, 12h |
#' | 16 | `"Ehm"`       | `"Thu 2:35 PM"`                 | flexible, 12h |
#' | 17 | `"Ehms"`      | `"Thu 2:35:00 PM"`              | flexible, 12h |
#' | 18 | `"EBhms"`   | `"Thu 2:35:00 in the afternoon"`  | flexible, 12h |
#' | 19 | `"Bhms"`      | `"2:35:00 in the afternoon"`    | flexible, 12h |
#' | 20 | `"EBhm"`      | `"Thu 2:35 in the afternoon"`   | flexible, 12h |
#' | 21 | `"Bhm"`       | `"2:35 in the afternoon"`       | flexible, 12h |
#' | 22 | `"Bh"`        | `"2 in the afternoon"`          | flexible, 12h |
#' | 23 | `"hmsv"`      | `"2:35:00 PM GMT+00:00"`        | flexible, 12h |
#' | 24 | `"hmv"`       | `"2:35 PM GMT+00:00"`           | flexible, 12h |
#' | 25 | `"ms"`        | `"35:00"`                       | flexible      |
#'
#' We can use the [info_time_style()] function within the console to view a
#' similar table of time styles with example output.
#'
#' @section Formatting with a *CLDR* datetime pattern:
#'
#' We can use a *CLDR* datetime pattern with the `format` argument to create
#' a highly customized and locale-aware output. This is a character string that
#' consists of two types of elements:
#'
#' - Pattern fields, which repeat a specific pattern character one or more
#'   times. These fields are replaced with date and time data when formatting.
#'   The character sets of `A`-`Z` and `a`-`z` are reserved for use as pattern
#'   characters.
#' - Literal text, which is output verbatim when formatting. This can include:
#'     - Any characters outside the reserved character sets, including
#'       spaces and punctuation.
#'     - Any text between single vertical quotes (e.g., `'text'`).
#'     - Two adjacent single vertical quotes (''), which represent a literal
#'     single quote, either inside or outside quoted text.
#'
#' The number of pattern fields is quite sizable so let's first look at how some
#' *CLDR* datetime patterns work. We'll use the datetime string
#' `"2018-07-04T22:05:09.2358(America/Vancouver)"` for all of the examples that
#' follow.
#'
#' - `"mm/dd/y"` -> `"05/04/2018"`
#' - `"EEEE, MMMM d, y"` -> `"Wednesday, July 4, 2018"`
#' - `"MMM d E"` -> `"Jul 4 Wed"`
#' - `"HH:mm"` -> `"22:05"`
#' - `"h:mm a"` -> `"10:05 PM"`
#' - `"EEEE, MMMM d, y 'at' h:mm a"` -> `"Wednesday, July 4, 2018 at 10:05 PM"`
#'
#' Here are the individual pattern fields:
#'
#' ## Year
#'
#' ### Calendar Year
#'
#' This yields the calendar year, which is always numeric. In most cases the
#' length of the `"y"` field specifies the minimum number of digits to display,
#' zero-padded as necessary. More digits will be displayed if needed to show the
#' full year. There is an exception: `"yy"` gives use just the two low-order
#' digits of the year, zero-padded as necessary. For most use cases, `"y"` or
#' `"yy"` should be good enough.
#'
#' | Field Patterns                 | Output                                 |
#' |------------------------------- |----------------------------------------|
#' | `"y"`                          | `"2018"`                               |
#' | `"yy"`                         | `"18"`                                 |
#' | `"yyy"` to `"yyyyyyyyy"`       | `"2018"` to `"000002018"`              |
#'
#' ### Year in the Week in Year Calendar
#'
#' This is the year in 'Week of Year' based calendars in which the year
#' transition occurs on a week boundary. This may differ from calendar year
#' `"y"` near a year transition. This numeric year designation is used in
#' conjunction with pattern character `"w"` in the ISO year-week calendar as
#' defined by ISO 8601.
#'
#' | Field Patterns                 | Output                                 |
#' |--------------------------------|----------------------------------------|
#' | `"Y"`                          | `"2018"`                               |
#' | `"YY"`                         | `"18"`                                 |
#' | `"YYY"` to `"YYYYYYYYY"`       | `"2018"` to `"000002018"`              |
#'
#' ## Quarter
#'
#' ### Quarter of the Year: formatting and standalone versions
#'
#' The quarter names are identified numerically, starting at `1` and ending at
#' `4`. Quarter names may vary along two axes: the width and the context. The
#' context is either 'formatting' (taken as a default), which the form used
#' within a complete date format string, or, 'standalone', the form for date
#' elements used independently (such as in calendar headers). The standalone
#' form may be used in any other date format that shares the same form of the
#' name. Here, the formatting form for quarters of the year consists of some run
#' of `"Q"` values whereas the standalone form uses `"q"`.
#'
#' | Field Patterns    | Output          | Notes                             |
#' |-------------------|-----------------|-----------------------------------|
#' | `"Q"`/`"q"`       | `"3"`           | Numeric, one digit                |
#' | `"QQ"`/`"qq"`     | `"03"`          | Numeric, two digits (zero padded) |
#' | `"QQQ"`/`"qqq"`   | `"Q3"`          | Abbreviated                       |
#' | `"QQQQ"`/`"qqqq"` | `"3rd quarter"` | Wide                              |
#' | `"QQQQQ"`/`"qqqqq"` | `"3"`         | Narrow                            |
#'
#' ## Month
#'
#' ### Month: formatting and standalone versions
#'
#' The month names are identified numerically, starting at `1` and ending at
#' `12`. Month names may vary along two axes: the width and the context. The
#' context is either 'formatting' (taken as a default), which the form used
#' within a complete date format string, or, 'standalone', the form for date
#' elements used independently (such as in calendar headers). The standalone
#' form may be used in any other date format that shares the same form of the
#' name. Here, the formatting form for months consists of some run of `"M"`
#' values whereas the standalone form uses `"L"`.
#'
#' | Field Patterns    | Output          | Notes                             |
#' |-------------------|-----------------|-----------------------------------|
#' | `"M"`/`"L"`       | `"7"`           | Numeric, minimum digits           |
#' | `"MM"`/`"LL"`     | `"07"`          | Numeric, two digits (zero padded) |
#' | `"MMM"`/`"LLL"`   | `"Jul"`         | Abbreviated                       |
#' | `"MMMM"`/`"LLLL"` | `"July"`        | Wide                              |
#' | `"MMMMM"`/`"LLLLL"` | `"J"`         | Narrow                            |
#'
#' ## Week
#'
#' ### Week of Year
#'
#' Values calculated for the week of year range from `1` to `53`. Week `1` for a
#' year is the first week that contains at least the specified minimum number of
#' days from that year. Weeks between week `1` of one year and week `1` of the
#' following year are numbered sequentially from `2` to `52` or `53` (if
#' needed).
#'
#' There are two available field lengths. Both will display the week of year
#' value but the `"ww"` width will always show two digits (where weeks `1` to
#' `9` are zero padded).
#'
#' | Field Patterns   | Output    | Notes                                    |
#' |------------------|-----------|------------------------------------------|
#' | `"w"`            | `"27"`    | Minimum digits                           |
#' | `"ww"`           | `"27"`    | Two digits (zero padded)                 |
#'
#' ### Week of Month
#'
#' The week of a month can range from `1` to `5`. The first day of every month
#' always begins at week `1` and with every transition into the beginning of a
#' week, the week of month value is incremented by `1`.
#'
#' | Field Pattern    | Output                                               |
#' |------------------|------------------------------------------------------|
#' | `"W"`            | `"1"`                                                |
#'
#' ## Day
#'
#' ### Day of Month
#'
#' The day of month value is always numeric and there are two available field
#' length choices in its formatting. Both will display the day of month value
#' but the `"dd"` formatting will always show two digits (where days `1` to `9`
#' are zero padded).
#'
#' | Field Patterns | Output    | Notes                                      |
#' |----------------|-----------|--------------------------------------------|
#' | `"d"`          | `"4"`     | Minimum digits                             |
#' | `"dd"`         | `"04"`    | Two digits, zero padded                    |
#'
#' ### Day of Year
#'
#' The day of year value ranges from `1` (January 1) to either `365` or `366`
#' (December 31), where the higher value of the range indicates that the year is
#' a leap year (29 days in February, instead of 28). The field length specifies
#' the minimum number of digits, with zero-padding as necessary.
#'
#' | Field Patterns  | Output   | Notes                                      |
#' |-----------------|----------|--------------------------------------------|
#' | `"D"`           | `"185"`  |                                            |
#' | `"DD"`          | `"185"`  | Zero padded to minimum width of 2          |
#' | `"DDD"`         | `"185"`  | Zero padded to minimum width of 3          |
#'
#' ### Day of Week in Month
#'
#' The day of week in month returns a numerical value indicating the number of
#' times a given weekday had occurred in the month (e.g., '2nd Monday in
#' March'). This conveniently resolves to predicable case structure where ranges
#' of day of the month values return predictable day of week in month values:
#'
#' - days `1` - `7` -> `1`
#' - days `8` - `14` -> `2`
#' - days `15` - `21` -> `3`
#' - days `22` - `28` -> `4`
#' - days `29` - `31` -> `5`
#'
#' | Field Pattern                  | Output                                 |
#' |--------------------------------|----------------------------------------|
#' | `"F"`                          | `"1"`                                  |
#'
#' ### Modified Julian Date
#'
#' The modified version of the Julian date is obtained by subtracting
#' 2,400,000.5 days from the Julian date (the number of days since January 1,
#' 4713 BC). This essentially results in the number of days since midnight
#' November 17, 1858. There is a half day offset (unlike the Julian date, the
#' modified Julian date is referenced to midnight instead of noon).
#'
#' | Field Patterns                 | Output                                 |
#' |--------------------------------|----------------------------------------|
#' | `"g"` to `"ggggggggg"`         | `"58303"` -> `"000058303"`             |
#'
#' ## Weekday
#'
#' ### Day of Week Name
#'
#' The name of the day of week is offered in four different widths.
#'
#' | Field Patterns             | Output         | Notes                     |
#' |----------------------------|----------------|---------------------------|
#' | `"E"`, `"EE"`, or `"EEE"`  | `"Wed"`        | Abbreviated               |
#' | `"EEEE"`                   | `"Wednesday"`  | Wide                      |
#' | `"EEEEE"`                  | `"W"`          | Narrow                    |
#' | `"EEEEEE"`                 | `"We"`         | Short                     |
#'
#' ## Periods
#'
#' ### AM/PM Period of Day
#'
#' This denotes before noon and after noon time periods. May be upper or
#' lowercase depending on the locale and other options. The wide form may be
#' the same as the short form if the 'real' long form (e.g. 'ante meridiem') is
#' not customarily used. The narrow form must be unique, unlike some other
#' fields.
#'
#' | Field Patterns                 | Output   | Notes                       |
#' |--------------------------------|----------|-----------------------------|
#' | `"a"`, `"aa"`, or `"aaa"`      | `"PM"`   | Abbreviated                 |
#' | `"aaaa"`                       | `"PM"`   | Wide                        |
#' | `"aaaaa"`                      | `"p"`    | Narrow                      |
#'
#' ### AM/PM Period of Day Plus Noon and Midnight
#'
#' Provide AM and PM as well as phrases for exactly noon and midnight. May be
#' upper or lowercase depending on the locale and other options. If the locale
#' doesn't have the notion of a unique 'noon' (i.e., 12:00), then the PM form
#' may be substituted. A similar behavior can occur for 'midnight' (00:00) and
#' the AM form. The narrow form must be unique, unlike some other fields.
#'
#' (a) `input_midnight`: `"2020-05-05T00:00:00"`
#' (b) `input_noon`: `"2020-05-05T12:00:00"`
#'
#' | Field Patterns                 | Output             | Notes             |
#' |--------------------------------|--------------------|-------------------|
#' | `"b"`, `"bb"`, or `"bbb"`      | (a) `"midnight"`   | Abbreviated       |
#' |                                | (b) `"noon"`       |                   |
#' | `"bbbb"`                       | (a) `"midnight"`   | Wide              |
#' |                                | (b) `"noon"`       |                   |
#' | `"bbbbb"`                      | (a) `"mi"`         | Narrow            |
#' |                                | (b) `"n"`          |                   |
#'
#' ### Flexible Day Periods
#'
#' Flexible day periods denotes things like 'in the afternoon', 'in the
#' evening', etc., and the flexibility comes from a locale's language and
#' script. Each locale has an associated rule set that specifies when the day
#' periods start and end for that locale.
#'
#' (a) `input_morning`: `"2020-05-05T00:08:30"`
#' (b) `input_afternoon`: `"2020-05-05T14:00:00"`
#'
#' | Field Patterns             | Output                   | Notes           |
#' |----------------------------|--------------------------|-----------------|
#' | `"B"`, `"BB"`, or `"BBB"`  | (a) `"in the morning"`   | Abbreviated     |
#' |                            | (b) `"in the afternoon"` |                 |
#' | `"BBBB"`                   | (a) `"in the morning"`   | Wide            |
#' |                            | (b) `"in the afternoon"` |                 |
#' | `"BBBBB"`                  | (a) `"in the morning"`   | Narrow          |
#' |                            | (b) `"in the afternoon"` |                 |
#'
#' ## Hours, Minutes, and Seconds
#'
#' ### Hour 0-23
#'
#' Hours from `0` to `23` are for a standard 24-hour clock cycle (midnight plus
#' 1 minute is `00:01`) when using `"HH"` (which is the more common width that
#' indicates zero-padding to 2 digits).
#'
#' Using `"2015-08-01T08:35:09"`:
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"H"`                  | `"8"`   | Numeric, minimum digits              |
#' | `"HH"`                 | `"08"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Hour 1-12
#'
#' Hours from `1` to `12` are for a standard 12-hour clock cycle (midnight plus
#' 1 minute is `12:01`) when using `"hh"` (which is the more common width that
#' indicates zero-padding to 2 digits).
#'
#' Using `"2015-08-01T08:35:09"`:
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"h"`                  | `"8"`   | Numeric, minimum digits              |
#' | `"hh"`                 | `"08"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Hour 1-24
#'
#' Using hours from `1` to `24` is a less common way to express a 24-hour clock
#' cycle (midnight plus 1 minute is `24:01`) when using `"kk"` (which is the
#' more common width that indicates zero-padding to 2 digits).
#'
#' Using `"2015-08-01T08:35:09"`:
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"k"`                  | `"9"`   | Numeric, minimum digits              |
#' | `"kk"`                 | `"09"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Hour 0-11
#'
#' Using hours from `0` to `11` is a less common way to express a 12-hour clock
#' cycle (midnight plus 1 minute is `00:01`) when using `"KK"` (which is the
#' more common width that indicates zero-padding to 2 digits).
#'
#' Using `"2015-08-01T08:35:09"`:
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"K"`                  | `"7"`   | Numeric, minimum digits              |
#' | `"KK"`                 | `"07"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Minute
#'
#' The minute of the hour which can be any number from `0` to `59`. Use `"m"` to
#' show the minimum number of digits, or `"mm"` to always show two digits
#' (zero-padding, if necessary).
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"m"`                  | `"5"`   | Numeric, minimum digits              |
#' | `"mm"`                 | `"06"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Seconds
#'
#' The second of the minute which can be any number from `0` to `59`. Use `"s"`
#' to show the minimum number of digits, or `"ss"` to always show two digits
#' (zero-padding, if necessary).
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"s"`                  | `"9"`   | Numeric, minimum digits              |
#' | `"ss"`                 | `"09"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Fractional Second
#'
#' The fractional second truncates (like other time fields) to the width
#' requested (i.e., count of letters). So using pattern `"SSSS"` will display
#' four digits past the decimal (which, incidentally, needs to be added manually
#' to the pattern).
#'
#' | Field Patterns                 | Output                                 |
#' |--------------------------------|----------------------------------------|
#' | `"S"` to `"SSSSSSSSS"`         | `"2"` -> `"235000000"`                 |
#'
#' ### Milliseconds Elapsed in Day
#'
#' There are 86,400,000 milliseconds in a day and the `"A"` pattern will provide
#' the whole number. The width can go up to nine digits with `"AAAAAAAAA"` and
#' these higher field widths will result in zero padding if necessary.
#'
#' Using `"2011-07-27T00:07:19.7223"`:
#'
#' | Field Patterns                 | Output                                 |
#' |--------------------------------|----------------------------------------|
#' | `"A"` to `"AAAAAAAAA"`         | `"439722"` -> `"000439722"`            |
#'
#' ## Era
#'
#' ### The Era Designator
#'
#' This provides the era name for the given date. The Gregorian calendar has two
#' eras: AD and BC. In the AD year numbering system, AD 1 is immediately
#' preceded by 1 BC, with nothing in between them (there was no year zero).
#'
#' | Field Patterns                 | Output          | Notes                |
#' |--------------------------------|-----------------|----------------------|
#' | `"G"`, `"GG"`, or `"GGG"`      | `"AD"`          | Abbreviated          |
#' | `"GGGG"`                       | `"Anno Domini"` | Wide                 |
#' | `"GGGGG"`                      | `"A"`           | Narrow               |
#'
#' ## Time Zones
#'
#' ### TZ // Short and Long Specific non-Location Format
#'
#' The short and long specific non-location formats for time zones are suggested
#' for displaying a time with a user friendly time zone name. Where the short
#' specific format is unavailable, it will fall back to the short localized GMT
#' format (`"O"`). Where the long specific format is unavailable, it will fall
#' back to the long localized GMT format (`"OOOO"`).
#'
#' | Field Patterns             | Output                    | Notes          |
#' |----------------------------|---------------------------|----------------|
#' | `"z"`, `"zz"`, or `"zzz"`  | `"PDT"`                   | Short Specific |
#' | `"zzzz"`                   | `"Pacific Daylight Time"` | Long Specific  |
#'
#' ### TZ // Common UTC Offset Formats
#'
#' The ISO8601 basic format with hours, minutes and optional seconds fields is
#' represented by `"Z"`, `"ZZ"`, or `"ZZZ"`. The format is equivalent to RFC 822
#' zone format (when the optional seconds field is absent). This is equivalent
#' to the `"xxxx"` specifier. The field pattern `"ZZZZ"` represents the long
#' localized GMT format. This is equivalent to the `"OOOO"` specifier. Finally,
#' `"ZZZZZ"` pattern yields the ISO8601 extended format with hours, minutes and
#' optional seconds fields. The ISO8601 UTC indicator `Z` is used when local
#' time offset is `0`. This is equivalent to the `"XXXXX"` specifier.
#'
#' | Field Patterns             | Output       | Notes                       |
#' |----------------------------|--------------|-----------------------------|
#' | `"Z"`, `"ZZ"`, or `"ZZZ"`  | `"-0700"`    | ISO 8601 basic format       |
#' | `"ZZZZ"`                   | `"GMT-7:00"` | Long localized GMT format   |
#' | `"ZZZZZ"`                  | `"-07:00"`   | ISO 8601 extended format    |
#'
#' ### TZ // Short and Long Localized GMT Formats
#'
#' The localized GMT formats come in two widths `"O"` (which removes the minutes
#' field if it's `0`) and `"OOOO"` (which always contains the minutes field).
#' The use of the `GMT` indicator changes according to the locale.
#'
#' | Field Patterns          | Output        | Notes                         |
#' |-------------------------|---------------|-------------------------------|
#' | `"O"`                   | `"GMT-7"`     | Short localized GMT format    |
#' | `"OOOO"`                | `"GMT-07:00"` | Long localized GMT format     |
#'
#' ### TZ // Short and Long Generic non-Location Formats
#'
#' The generic non-location formats are useful for displaying a recurring wall
#' time (e.g., events, meetings) or anywhere people do not want to be overly
#' specific. Where either of these is unavailable, there is a fallback to the
#' generic location format (`"VVVV"`), then the short localized GMT format as
#' the final fallback.
#'
#' | Field Patterns  | Output           | Notes                              |
#' |-----------------|------------------|------------------------------------|
#' | `"v"`           | `"PT"`           | Short generic non-location format  |
#' | `"vvvv"`        | `"Pacific Time"` | Long generic non-location format   |
#'
#' ### TZ // Short Time Zone IDs and Exemplar City Formats
#'
#' These formats provide variations of the time zone ID and often include the
#' exemplar city. The widest of these formats, `"VVVV"`, is useful for
#' populating a choice list for time zones, because it supports 1-to-1 name/zone
#' ID mapping and is more uniform than other text formats.
#'
#' | Field Patterns     | Output                | Notes                      |
#' |--------------------|-----------------------|----------------------------|
#' | `"V"`              | `"cavan"`             | Short time zone ID         |
#' | `"VV"`             | `"America/Vancouver"` | Long time zone ID          |
#' | `"VVV"`            | `"Vancouver"`         | The tz exemplar city       |
#' | `"VVVV"`           | `"Vancouver Time"`    | Generic location format    |
#'
#' ### TZ // ISO 8601 Formats with Z for +0000
#'
#' The `"X"`-`"XXX"` field patterns represent valid ISO 8601 patterns for time
#' zone offsets in datetimes. The final two widths, `"XXXX"` and `"XXXXX"` allow
#' for optional seconds fields. The seconds field is *not* supported by the ISO
#' 8601 specification. For all of these, the ISO 8601 UTC indicator `Z` is used
#' when the local time offset is `0`.
#'
#' | Field Patterns | Output     | Notes                                     |
#' |----------------|------------|-------------------------------------------|
#' | `"X"`          | `"-07"`    | ISO 8601 basic format (h, optional m)     |
#' | `"XX"`         | `"-0700"`  | ISO 8601 basic format (h & m)             |
#' | `"XXX"`        | `"-07:00"` | ISO 8601 extended format (h & m)          |
#' | `"XXXX"`       | `"-0700"`  | ISO 8601 basic format (h & m, optional s) |
#' | `"XXXXX"`      | `"-07:00"` | ISO 8601 extended format (h & m, optional s) |
#'
#' ### TZ // ISO 8601 Formats (no use of Z for +0000)
#'
#' The `"x"`-`"xxxxx"` field patterns represent valid ISO 8601 patterns for time
#' zone offsets in datetimes. They are similar to the `"X"`-`"XXXXX"` field
#' patterns except that the ISO 8601 UTC indicator `Z` *will not* be used when
#' the local time offset is `0`.
#'
#' | Field Patterns | Output     | Notes                                     |
#' |----------------|------------|-------------------------------------------|
#' | `"x"`          | `"-07"`    | ISO 8601 basic format (h, optional m)     |
#' | `"xx"`         | `"-0700"`  | ISO 8601 basic format (h & m)             |
#' | `"xxx"`        | `"-07:00"` | ISO 8601 extended format (h & m)          |
#' | `"xxxx"`       | `"-0700"`  | ISO 8601 basic format (h & m, optional s) |
#' | `"xxxxx"`      | `"-07:00"` | ISO 8601 extended format (h & m, optional s) |
#'
#' @section Formatting with a `strptime` format code:
#'
#' Performing custom date/time formatting with the `format` argument can also
#' occur with a `strptime` format code. This works by constructing a string of
#' individual format codes representing formatted date and time elements. These
#' are all indicated with a leading `%`, literal characters are interpreted as
#' any characters not starting with a `%` character.
#'
#' First off, let's look at a few format code combinations that work well
#' together as a `strptime` format. This will give us an intuition on how these
#' generally work. We'll use the datetime `"2015-06-08 23:05:37.48"` for all of
#' the examples that follow.
#'
#' - `"%m/%d/%Y"` -> `"06/08/2015"`
#' - `"%A, %B %e, %Y"` -> `"Monday, June 8, 2015"`
#' - `"%b %e %a"` -> `"Jun 8 Mon"`
#' - `"%H:%M"` -> `"23:05"`
#' - `"%I:%M %p"` -> `"11:05 pm"`
#' - `"%A, %B %e, %Y at %I:%M %p"` -> `"Monday, June 8, 2015 at 11:05 pm"`
#'
#' Here are the individual format codes for the date components:
#'
#' - `"%a"` -> `"Mon"` (abbreviated day of week name)
#' - `"%A"` -> `"Monday"` (full day of week name)
#' - `"%w"` -> `"1"` (day of week number in `0..6`; Sunday is `0`)
#' - `"%u"` -> `"1"` (day of week number in `1..7`; Monday is `1`, Sunday `7`)
#' - `"%y"` -> `"15"` (abbreviated year, using the final two digits)
#' - `"%Y"` -> `"2015"` (full year)
#' - `"%b"` -> `"Jun"` (abbreviated month name)
#' - `"%B"` -> `"June"` (full month name)
#' - `"%m"` -> `"06"` (month number)
#' - `"%d"` -> `"08"` (day number, zero-padded)
#' - `"%e"` -> `"8"` (day number without zero padding)
#' - `"%j"` -> `"159"` (day of the year, always zero-padded)
#' - `"%W"` -> `"23"` (week number for the year, always zero-padded)
#' - `"%V"` -> `"24"` (week number for the year, following the ISO 8601
#' standard)
#' - `"%C"` -> `"20"` (the century number)
#'
#' Here are the individual format codes for the time components:
#'
#' - `"%H"` -> `"23"` (24h hour)
#' - `"%I"` -> `"11"` (12h hour)
#' - `"%M"` -> `"05"` (minute)
#' - `"%S"` -> `"37"` (second)
#' - `"%OS3"` -> `"37.480"` (seconds with decimals; `3` decimal places here)
#' - `%p` -> `"pm"` (AM or PM indicator)
#'
#' Here are some extra formats that you may find useful:
#'
#' - `"%z"` -> `"+0000"` (signed time zone offset, here using UTC)
#' - `"%F"` -> `"2015-06-08"` (the date in the ISO 8601 date format)
#' - `"%%"` -> `"%"` (the literal "`%`" character, in case you need it)
#'
#' @section Adapting output to a specific `locale`:
#'
#' This formatting function can adapt outputs according to a provided `locale`
#' value. Examples include `"en"` for English (United States) and `"fr"` for
#' French (France). Note that a `locale` value provided here will override any
#' global locale setting performed in [gt()]'s own `locale` argument (it is
#' settable there as a value received by all other functions that have a
#' `locale` argument). As a useful reference on which locales are supported, we
#' can use the [info_locales()] function to view an info table.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table. Keep only the `datetime` column.
#' Format the column to have dates formatted with the `"month_day_year"` style
#' and times with the `"h_m_s_p"` 12-hour time style.
#'
#' ```r
#' exibble |>
#'   dplyr::select(datetime) |>
#'   gt() |>
#'   fmt_datetime(
#'     columns = datetime,
#'     date_style = "month_day_year",
#'     time_style = "h_m_s_p"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_datetime_1.png")`
#' }}
#'
#' Using the same input table, we can use flexible date and time styles. Two
#' that work well together are `"MMMEd"` and `"Hms"`. These will mutate
#' depending on the locale. Let's use the default locale for the first 3 rows
#' and the Danish locale (`"da"`) for the remaining rows.
#'
#' ```r
#' exibble |>
#'   dplyr::select(datetime) |>
#'   gt() |>
#'   fmt_datetime(
#'     columns = datetime,
#'     date_style = "MMMEd",
#'     time_style = "Hms",
#'     locale = "da"
#'   ) |>
#'   fmt_datetime(
#'     columns = datetime,
#'     rows = 1:3,
#'     date_style = "MMMEd",
#'     time_style = "Hms"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_datetime_2.png")`
#' }}
#'
#' It's possible to use the `format` argument and write our own formatting
#' specification. Using the CLDR datetime pattern
#' `"EEEE, MMMM d, y 'at' h:mm a (zzzz)"` gives us datetime outputs with time
#' zone formatting. Let's provide a time zone ID (`"America/Vancouver"`) to the
#' `tz` argument.
#'
#' ```r
#' exibble |>
#'   dplyr::select(datetime) |>
#'   gt() |>
#'   fmt_datetime(
#'     columns = datetime,
#'     format = "EEEE, MMMM d, y 'at' h:mm a (zzzz)",
#'     tz = "America/Vancouver"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_datetime_3.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-14
#'
#' @seealso The vector-formatting version of this function:
#'   [vec_fmt_datetime()].
#'
#' @import rlang
#' @export
fmt_datetime <- function(
    data,
    columns = everything(),
    rows = everything(),
    date_style = "iso",
    time_style = "iso",
    sep = " ",
    format = NULL,
    tz = NULL,
    pattern = "{x}",
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Declare formatting function compatibility
  compat <- c("Date", "POSIXct", "character")

  if (!is.null(format)) {

    # Ensure that the format code meets some basic validation requirements
    check_format_code(format = format)

  } else {

    # Transform `date_style` to `date_format`
    date_format_str <- get_date_format(date_style = date_style)

    # Transform `time_style` to `time_format`
    time_format_str <- get_time_format(time_style = time_style)
  }

  # In this case where strict mode is being used (with the option
  # called "gt.strict_column_fmt"), stop the function if any of the
  # resolved columns have data that is incompatible with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = compat
    )
  ) {
    if (isTRUE(getOption("gt.strict_column_fmt", TRUE))) {
      cli::cli_abort(c(
        "The `fmt_datetime()` function can only be used on `columns` of certain types.",
        "*" = "Allowed types are `Date`, `POSIXct`, and `character` (with
      ISO-8601 formatted dates)"
      ))
    }
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = compat,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      use_latex_math_mode = FALSE,
      format_fn = function(x, context) {

        # If a format string is provided then use that to generate the
        # formatted date/time string
        if (!is.null(format)) {

          # If the incoming values are strings that adequately represent time
          # values, then prepend with the `1970-01-01` dummy date to create an
          # input that will works with `strftime()`
          if (all(is_string_time(x))) {
            x <- paste("1970-01-01", x)
          }

          if (grepl("%", format)) {

            if (is.character(x)) {

              if (is.null(tz)) {
                tz <- "GMT"
              }

              datetime <-
                tryCatch(
                  as.POSIXlt(x),
                  error = function(cond) {
                    cli::cli_abort(
                      "One or more of the provided date/datetime values are invalid."
                    )
                  }
                )

              attr(datetime, which = "tzone") <- tz

              datetime <- as.POSIXct(datetime)

              return(strftime(datetime, format = format, tz = tz))
            }

            # Format the datetime values using `strftime()`
            return(strftime(x, format = format, tz = tz))

          } else {

            if (is.null(tz)) {
              tz <- "UTC"
            }

            dt_str <- strftime(x, format = "%Y-%m-%dT%H:%M:%S%z", tz = tz)

            if ("tzone" %in% names(attributes(x))) {
              tzone <- attr(x, which = "tzone", exact = TRUE)
              dt_str <- paste0(dt_str, "(", tzone, ")")
            }

            # Format the datetime values using `fdt()`
            return(
              bigD::fdt(
                input = dt_str,
                format = format,
                locale = locale,
                use_tz = tz
              )
            )
          }
        }

        #
        # Format the date and time portions of the datetime value
        #

        # Convert incoming values to POSIXlt but provide a friendly error
        # if the values cannot be parsed by `as.POSIXlt()`
        datetime <-
          tryCatch(
            as.POSIXlt(x),
            error = function(cond) {
              cli::cli_abort(
                "One or more of the provided date/datetime values are invalid."
              )
            }
          )

        #
        # Separately format the date and time portions using `fdt()`
        #

        date_str <-
          bigD::fdt(
            input = as.character(datetime),
            format = date_format_str,
            locale = locale
          )

        time_str <-
          bigD::fdt(
            input = as.character(datetime),
            format = time_format_str,
            locale = locale
          )

        paste0(date_str, sep, time_str)
      }
    )
  )
}

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
#' @param input_units If one or more selected columns contains numeric values, a
#'   keyword must be provided for `input_units` for **gt** to determine how
#'   those values are to be interpreted in terms of duration. The accepted units
#'   are: `"seconds"`, `"minutes"`, `"hours"`, `"days"`, and `"weeks"`.
#' @param output_units Controls the output time units. The default, `NULL`,
#'   means that **gt** will automatically choose time units based on the input
#'   duration value. To control which time units are to be considered for output
#'   (before trimming with `trim_zero_units`) we can specify a vector of one or
#'   more of the following keywords: `"weeks"`, `"days"`, `"hours"`,
#'   `"minutes"`, or `"seconds"`.
#' @param duration_style A choice of four formatting styles for the output
#'   duration values. With `"narrow"` (the default style), duration values will
#'   be formatted with single letter time-part units (e.g., 1.35 days will be
#'   styled as `"1d 8h 24m`). With `"wide"`, this example value will be expanded
#'   to `"1 day 8 hours 24 minutes"` after formatting. The `"colon-sep"` style
#'   will put days, hours, minutes, and seconds in the `"([D]/)[HH]:[MM]:[SS]"`
#'   format. The `"iso"` style will produce a value that conforms to the ISO
#'   8601 rules for duration values (e.g., 1.35 days will become `"P1DT8H24M"`).
#' @param trim_zero_units Provides methods to remove output time units that have
#'   zero values. By default this is `TRUE` and duration values that might
#'   otherwise be formatted as `"0w 1d 0h 4m 19s"` with
#'   `trim_zero_units = FALSE` are instead displayed as `"1d 4m 19s"`. Aside
#'   from using `TRUE`/`FALSE` we could provide a vector of keywords for more
#'   precise control. These keywords are: (1) `"leading"`, to omit all leading
#'   zero-value time units (e.g., `"0w 1d"` -> `"1d"`), (2) `"trailing"`, to
#'   omit all trailing zero-value time units (e.g., `"3d 5h 0s"` -> `"3d 5h"`),
#'   and `"internal"`, which removes all internal zero-value time units (e.g.,
#'   `"5d 0h 33m"` -> `"5d 33m"`).
#' @param max_output_units If `output_units` is `NULL`, where the output time
#'   units are unspecified and left to **gt** to handle, a numeric value
#'   provided for `max_output_units` will be taken as the maximum number of time
#'   units to display in all output time duration values. By default, this is
#'   `NULL` and all possible time units will be displayed. This option has no
#'   effect when `duration_style = "colon-sep"` (only `output_units` can be used
#'   to customize that type of duration output).
#' @param force_sign Should the positive sign be shown for positive values
#'   (effectively showing a sign for all values except zero)? If so, use `TRUE`
#'   for this option. The default is `FALSE`, where only negative value will
#'   display a minus sign.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' The `fmt_duration()` formatting function is compatible with body cells that
#' are of the `"numeric"`, `"integer"`, or `"difftime"` types. Any other types
#' of body cells are ignored during formatting. This is to say that cells of
#' incompatible data types may be targeted, but there will be no attempt to
#' format them.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value of 100,000 (excluding
#' `NA`s from consideration).
#'
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
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
#' useful reference on which locales are supported, we can use the
#' [info_locales()] function to view an info table.
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
#' 3-15
#'
#' @seealso The vector-formatting version of this function:
#'   [vec_fmt_duration()].
#'
#' @import rlang
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
  stop_if_not_gt(data = data)

  # Declare formatting function compatibility
  compat <- c("numeric", "integer", "difftime")

  # Ensure that arguments are matched
  duration_style <- rlang::arg_match(duration_style)
  system <- rlang::arg_match(system)

  # Duration values will never have decimal marks
  dec_mark <- "unused"

  # Resolve the `locale` value here with the global locale value
  locale <- resolve_locale(data = data, locale = locale)

  # Use locale-based marks if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)

  if (is_true(trim_zero_units)) {
    trim_zero_units <- c("leading", "trailing", "internal")
  } else if (is_false(trim_zero_units)) {
    trim_zero_units <- NULL
  } else if (is.character(trim_zero_units) && length(trim_zero_units) > 0) {
    # Validate that `trim_zero_units` contains only the allowed keywords
    validate_trim_zero_units(trim_zero_units = trim_zero_units)
  } else {
    cli::cli_abort(c(
      "The value provided for `trim_zero_units` is invalid. Either use:",
      "*" = "`TRUE` or `FALSE`, or",
      "*" = "A vector with any of the keywords \"leading\", \"trailing\", or \"internal\"."
    ))
  }

  if (
    !is.null(max_output_units) &&
    (
      !is.numeric(max_output_units) ||
      length(max_output_units) != 1 ||
      max_output_units < 1
    )
  ) {
    cli::cli_abort(c(
      "The numeric value supplied for `max_output_units` is invalid.",
      "*" = "Must either be `NULL` or an integer value greater than zero."
    ))
  }

  # In this case where strict mode is being used (with the option
  # called "gt.strict_column_fmt"), stop the function if any of the
  # resolved columns have data that is incompatible with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = compat
    )
  ) {
    if (isTRUE(getOption("gt.strict_column_fmt", TRUE))) {
      cli::cli_abort(c(
        "The `fmt_duration()` function can only be used on `columns` of certain types.",
        "*" = "Allowed types are `numeric` and `difftime`."
      ))
    }
  }

  # Stop function if any columns have numeric data and `input_units` is NULL
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = "difftime"
    ) &&
    is.null(input_units)
  ) {
    cli::cli_abort(c(
      "When there are numeric columns to format, `input_units` must not be `NULL`.",
      "*" = "Use one of \"seconds\", \"minutes\", \"hours\", \"days\", or \"weeks\"."
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
  if (is.null(output_units)) {

    output_units <- c("weeks", "days", "hours", "minutes", "seconds")

  } else {

    # Stop function if `output_units` isn't a character vector, isn't of
    # the right length (1 or greater), and does not contain valid values
    validate_duration_output_units(output_units = output_units)

    # Normalize the valid set of provided `output_units`
    output_units <- normalize_duration_output_units(output_units = output_units)
  }

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
    compat = compat,
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

validate_trim_zero_units <- function(trim_zero_units) {

  if (!all(trim_zero_units %in% c("leading", "trailing", "internal"))) {

    cli::cli_abort(c(
      "The character vector provided for `trim_zero_units` is invalid.",
      "*" = "It should only contain any of the keywords \"leading\", \"trailing\",
      or ", "\"internal\"."
    ))
  }
}

validate_duration_input_units <- function(input_units) {

  if (is.null(input_units)) {
    return(NULL)
  }

  if (!is.character(input_units)) {

    cli::cli_abort(
      "The `input_units` input to `fmt_duration()` must be a character vector."
    )
  }

  time_parts_vec <- c("weeks", "days", "hours", "mins", "minutes", "secs", "seconds")

  if (!all(input_units %in% time_parts_vec) || length(input_units) != 1) {

    cli::cli_abort(c(
      "The value of `input_units` for `fmt_duration()` is invalid.",
      "*" = "Only one of the \"weeks\", \"days\", \"hours\", \"minutes\", or
      \"seconds\" time parts should be present."
    ))
  }
}

normalize_duration_input_units <- function(input_units) {

  # Ensure that key transforms occur
  input_units <- tidy_sub(input_units, "secs", "seconds")
  input_units <- tidy_sub(input_units, "mins", "minutes")
  input_units
}

validate_duration_output_units <- function(output_units) {

  if (!is.character(output_units)) {

    cli::cli_abort(
      "The `output_units` input to `fmt_duration()` must be a character vector."
    )
  }

  if (length(output_units) < 1) {

    cli::cli_abort(
      "The `output_units` input to `fmt_duration()` must be a vector with at
      least one element."
    )
  }

  time_parts_vec <- c("weeks", "days", "hours", "mins", "minutes", "secs", "seconds")

  if (!all(output_units %in% time_parts_vec)) {

    cli::cli_abort(c(
      "There are invalid components in the `output_units` input to `fmt_duration()`.",
      "*" = "Only the \"weeks\", \"days\", \"hours\", \"minutes\", and \"seconds\`
      time parts should be present."
    ))
  }
}

normalize_duration_output_units <- function(output_units) {

  # Ensure that key transforms occur and that the output units are a unique set
  output_units <- tidy_sub(output_units, "secs", "seconds")
  output_units <- tidy_sub(output_units, "mins", "minutes")
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

  # Should `in_units` be anything other than days then
  # convert all `x` values to days
  if (in_units != "days") {

    x <-
      switch(
        in_units,
        weeks = x * 7,
        hours = x / 24,
        mins = ,
        minutes = x / 1440,
        secs = ,
        seconds = x / 86400
      )
  }

  x_str <- character(length(x))

  for (i in seq_along(x)) {

    x_df_i <-
      dplyr::tibble(
        value = numeric(0),
        time_part = character(0),
        formatted = character(0)
      )

    x_rem_i <- abs(x[i])

    for (time_p in out_units) {

      time_part_val <- get_time_part_val(x_rem_i, time_part = time_p)

      x_df_i <-
        dplyr::bind_rows(
          x_df_i,
          dplyr::tibble(
            value = time_part_val,
            time_part = time_p,
            formatted = NA_character_
          )
        )

      x_rem_i <-
        subtract_time_with_val(
          x = x_rem_i,
          time_part = time_p,
          val = time_part_val
        )
    }

    # Remove time parts according to keywords in `trim_zero_units`
    total_time_units <- nrow(x_df_i)

    first_non_zero_unit_idx <- utils::head(which(x_df_i$value != 0), 1)
    last_non_zero_unit_idx <- utils::tail(which(x_df_i$value != 0), 1)

    remove_idx <- c()

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

      if (x_rem_i != 0 ) {
        x_df_i[1, "formatted"] <- paste0("<", x_df_i[1, "formatted"])
      }
    }

    if (out_style == "colon-sep") {

      colon_sep_output_units <- colon_sep_params$output_units
      colon_sep_trim_zero_units <- colon_sep_params$trim_zero_units

      # Filter to only the output units needed
      x_df_i <- dplyr::filter(x_df_i, time_part %in% .env$colon_sep_output_units)

      # If days has a zero value, remove that entry unconditionally
      if ("days" %in% x_df_i$time_part && x_df_i[[1, "value"]] == 0) {
        x_df_i <- dplyr::filter(x_df_i, time_part != "days")
      }

      if (colon_sep_trim_zero_units == "leading") {
        if (
          identical(x_df_i$time_part, c("hours", "minutes", "seconds")) &&
          x_df_i[[1, "value"]] == 0
        ) {
          x_df_i <- dplyr::filter(x_df_i, time_part != "hours")
        }
      }

      # Assemble the remaining time parts
      hms_part <-
        x_df_i %>%
        dplyr::filter(time_part %in% c("hours", "minutes", "seconds")) %>%
        dplyr::pull(formatted) %>%
        paste(collapse = ":")

      d_part <-
        ifelse("days" %in% x_df_i$time_part, paste0(x_df_i$formatted[1], "/"), "")

      x_str[i] <- paste0(d_part, hms_part)

    } else if (out_style == "iso") {

      x_str[i] <-
        paste0("P", paste0(x_df_i$formatted, collapse = "")) %>%
        tidy_sub("D", "DT", fixed = TRUE)

    } else {
      x_str[i] <- paste0(x_df_i$formatted, collapse = " ")
    }
  }

  x_str
}

day_conversion_factor <- function(time_part) {

  switch(
    time_part,
    weeks = 1/7,
    days = 1,
    hours = 24,
    minutes = 1440,
    seconds = 86400
  )
}

get_time_part_val <- function(x, time_part) {
  floor(x * day_conversion_factor(time_part = time_part))
}

subtract_time_with_val <- function(x, time_part, val) {
  x - (val / day_conversion_factor(time_part = time_part))
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

  if (is.null(locale)) locale <- "en"

  if (type == "wide") type <- "long"

  pattern_tbl <-
    durations[
      durations$locale == locale,
      grepl(
        "^duration-(week|day|hour|minute|second).unitPattern-count-(zero|one|other)$",
        colnames(durations)
      ) |
        grepl("type", colnames(durations), fixed = TRUE)
    ] %>%
    dplyr::filter(type == .env$type) %>%
    dplyr::select(-type)

  colnames(pattern_tbl) <- gsub("(duration|-|unitPattern-count)", "", colnames(pattern_tbl))

  as.list(pattern_tbl)
}

extract_duration_pattern <- function(
    value,
    time_p,
    patterns
) {

  x_val_i_type <-
    dplyr::case_when(
      value == 1 ~ "one",
      value == 0 ~ "zero",
      TRUE ~ "other"
    )

  pattern <- patterns[grepl(paste0(gsub("s$", "", time_p), ".*?.", x_val_i_type), names(patterns))][[1]]
  if (!is.null(pattern) && is.na(pattern)) {
    pattern <- patterns[grepl(paste0(gsub("s$", "", time_p), ".*?.other"), names(patterns))][[1]]
  }

  pattern
}

#' Format Markdown text
#'
#' @description
#'
#' Any Markdown-formatted text in the incoming cells will be transformed to the
#' appropriate output type during render when using `fmt_markdown()`.
#'
#' @inheritParams fmt_number
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value of 100,000 (excluding
#' `NA`s from consideration).
#'
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
#'
#' @section Examples:
#'
#' Create a few Markdown-based text snippets.
#'
#' ```r
#' text_1a <- "
#' ### This is Markdown.
#'
#' Markdown’s syntax is comprised entirely of
#' punctuation characters, which punctuation
#' characters have been carefully chosen so as
#' to look like what they mean... assuming
#' you’ve ever used email.
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
#' Arrange the text snippets as a tibble using the `dplyr::tribble()` function.
#' then, create a **gt** table and format all columns with `fmt_markdown()`.
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
#' @family data formatting functions
#' @section Function ID:
#' 3-16
#'
#' @seealso The vector-formatting version of this function:
#'   [vec_fmt_markdown()].
#'
#' @import rlang
#' @export
fmt_markdown <- function(
    data,
    columns = everything(),
    rows = everything()
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      html = function(x) {
        md_to_html(x)
      },
      latex = function(x) {
        markdown_to_latex(x)
      },
      rtf = function(x) {
        markdown_to_rtf(x)
      },
      word = function(x) {
        markdown_to_xml(x)
      },
      default = function(x) {
        sub(
          "\n$", "",
          vapply(
            x,
            FUN.VALUE = character(1),
            USE.NAMES = FALSE,
            commonmark::markdown_text
          )
        )
      }
    )
  )
}

#' Format by simply passing data through
#'
#' @description
#'
#' Format by passing data through no other transformation other than: (1)
#' coercing to `character` (as all the `fmt_*()` functions do), and (2) applying
#' text via the `pattern` argument (the default is to apply nothing). All of
#' this is useful when don't want to modify the input data other than to
#' decorate it within a pattern.
#'
#' @inheritParams fmt_number
#' @param escape An option to escape text according to the final output format
#'   of the table. For example, if a LaTeX table is to be generated then LaTeX
#'   escaping would be performed during rendering. By default this is set to
#'   `TRUE` and setting to `FALSE` would be useful in the case where text is
#'   crafted for a specific output format in mind.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value of 100,000 (excluding
#' `NA`s from consideration).
#'
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table. Keep only the `char` column. Pass
#' the data in that column through but apply a simple pattern that adds an `"s"`
#' to the non-`NA` values.
#'
#' ```r
#' exibble |>
#'   dplyr::select(char) |>
#'   gt() |>
#'   fmt_passthrough(
#'     columns = char,
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
#' 3-17
#'
#' @import rlang
#' @export
fmt_passthrough <- function(
    data,
    columns = everything(),
    rows = everything(),
    escape = TRUE,
    pattern = "{x}"
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions (as a function list) to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      html = function(x) {

        # Create `x_str` with same length as `x`
        x_str <- rep(NA_character_, length(x))

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
      latex = function(x) {

        # Create `x_str` with same length as `x`
        x_str <- rep(NA_character_, length(x))

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
        x_str <- rep(NA_character_, length(x))

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
        x_str <- rep(NA_character_, length(x))

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

#' Automatically format column data according to their values
#'
#' @description
#'
#' The `fmt_auto()` function will automatic applying formatting of various types
#' in a way that best suits the data table provided. The function will attempt
#' format numbers such that they are condensed to an optimal width, either with
#' scientific notation or large number suffixing. Currency values are detected
#' by currency codes embedded in the column name and formatted in the correct
#' way. Although the functionality here is comprehensive it's still possible to
#' reduce the scope of automatic formatting with the `scope` argument and also
#' by choosing a subset of columns and rows to which the formatting will be
#' applied.
#'
#' @inheritParams fmt_number
#' @param scope The scope of automatic formatting. By default this includes
#'   `"numbers"`-type values and `"currency"`-type values though the scope can
#'   be reduced to a single type of value to format.
#' @param lg_num_pref The preference toward either scientific notation for very
#'   small and very large values (`"sci"`, the default option), or, suffixed
#'   numbers (`"suf"`, for large values only).
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value of 100,000 (excluding
#' `NA`s from consideration).
#'
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table. Format the columns automatically
#' with `fmt_auto()`.
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
#' Let's now use [`countrypops`] to create another **gt** table. Automatically
#' format all columns with `fmt_auto()` but elect to use large-number suffixing
#' instead of scientific notation with the `lg_num_pref = "suf"` option.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(country_code_3, year, population) |>
#'   dplyr::filter(country_code_3 %in% c("CHN", "IND", "USA", "PAK", "IDN")) |>
#'   dplyr::filter(year > 1975 & year %% 5 == 0) |>
#'   tidyr::spread(year, population) |>
#'   dplyr::arrange(desc(`2015`)) |>
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
#' 3-18
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
  stop_if_not_gt(data = data)

  # Ensure that arguments are matched
  lg_num_pref <- rlang::arg_match(lg_num_pref)

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
        rows_suf_vec <- integer(0)
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

#' Set a column format with a formatter function
#'
#' @description
#'
#' The `fmt()` function provides a way to execute custom formatting
#' functionality with raw data values in a way that can consider all output
#' contexts.
#'
#' Along with the `columns` and `rows` arguments that provide some precision in
#' targeting data cells, the `fns` argument allows you to define one or more
#' functions for manipulating the raw data.
#'
#' If providing a single function to `fns`, the recommended format is in the
#' form: `fns = function(x) ...`. This single function will format the targeted
#' data cells the same way regardless of the output format (e.g., HTML, LaTeX,
#' RTF).
#'
#' If you require formatting of `x` that depends on the output format, a list of
#' functions can be provided for the `html`, `latex`, `rtf`, and `default`
#' contexts. This can be in the form of `fns = list(html = function(x) ...,
#' latex = function(x) ..., default = function(x) ...)`. In this
#' multiple-function case, we recommended including the `default` function as a
#' fallback if all contexts aren't provided.
#'
#' @inheritParams fmt_number
#' @param fns Either a single formatting function or a named list of functions.
#' @param compat An optional vector that provides the compatible classes for the
#' formatter. By default this is `NULL`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value of 100,000 (excluding
#' `NA`s from consideration).
#'
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table. Format the numeric values in the
#' `num` column with a function supplied to the `fns` argument.
#'
#' ```r
#' exibble |>
#'   dplyr::select(-row, -group) |>
#'   gt() |>
#'   fmt(
#'     columns = num,
#'     fns = function(x) {
#'       paste0("'", x * 1000, "'")
#'     }
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_1.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-19
#'
#' @import rlang
#' @export
fmt <- function(
    data,
    columns = everything(),
    rows = everything(),
    compat = NULL,
    fns
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  #
  # Resolution of columns and rows as character vectors
  #

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

  # If a single function is supplied to `fns` then
  # repackage that into a list as the `default` function
  if (is.function(fns)) {
    fns <- list(default = fns)
  }

  # Create the `formatter_list`, which is a bundle of
  # formatting functions for specific columns and rows
  formatter_list <-
    list(
      func = fns,
      cols = resolved_columns,
      rows = resolved_rows_idx,
      compat = compat
    )

  dt_formats_add(
    data = data,
    formats = formatter_list
  )
}

#' Insert separator marks to an integer to conform to Indian numbering system
#'
#' @param integer The integer portion of a numeric value. Should be supplied as
#'   a length-1 character vector. The element should only contain numeral
#'   characters.
#'
#' @noRd
insert_seps_ind <- function(integer) {

  # The `fmt_fraction()` formatter can sometimes generate
  # empty strings; if seen here, just return them unchanged
  if (integer == "") {
    return(integer)
  }

  # Ensure that integer-based strings only contain numbers
  if (!grepl("^[0-9]+?$", integer)) {
    cli::cli_abort(
      "The `integer` string must only contain numbers."
    )
  }

  # Return integer unchanged if there are no commas to insert
  if (nchar(integer) < 4) return(integer)

  # Generate an 'insertion sequence' (where to place the separators)
  insertion_seq <- cumsum(c(3, rep(2, floor((nchar(integer) - 4) / 2)))) + 1
  insertion_seq <- (nchar(integer) - insertion_seq) + 2

  split_strings <- split_str_by_index(target = integer, index = insertion_seq)

  paste(split_strings, collapse = ",")
}

split_str_by_index <- function(target, index) {

  index <- sort(index)
  substr(
    rep(target, length(index) + 1),
    start = c(1, index),
    stop = c(index - 1, nchar(target))
  )
}
