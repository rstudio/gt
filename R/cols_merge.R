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


# cols_merge() -----------------------------------------------------------------
#' Merge data from two or more columns to a single column
#'
#' @description
#'
#' This function takes input from two or more columns and allows the contents to
#' be merged into a single column by using a pattern that specifies the
#' arrangement. We can specify which columns to merge together in the `columns`
#' argument. The string-combining pattern is to be provided in the `pattern`
#' argument. The first column in the `columns` series operates as the target
#' column (i.e., the column that will undergo mutation) whereas all following
#' `columns` will be untouched. There is the option to hide the non-target
#' columns (i.e., second and subsequent columns given in `columns`). The
#' formatting of values in different columns will be preserved upon merging.
#'
#' @inheritParams cols_align
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The columns for which the merging operations should be applied. The first
#'   column resolved will be the target column (i.e., undergo mutation) and the
#'   other columns will serve to provide input. Can either be a series of column
#'   names provided in `c()`, a vector of column indices, or a select helper
#'   function (e.g. [starts_with()], [ends_with()], [contains()], [matches()],
#'   [num_range()], and [everything()]). A vector is recommended because in that
#'   case we are absolutely certain about the order of columns, and, that order
#'   information is needed for this and other arguments.
#'
#' @param hide_columns *Subset of `columns` to hide*
#'
#'   `<column-targeting expression>|FALSE` // *default:* `columns[-1]`
#'
#'   Any column names provided here will have their state changed to `hidden`
#'   (via internal use of [cols_hide()]) if they aren't already hidden. This is
#'   convenient if the shared purpose of these specified columns is only to
#'   provide string input to the target column. To suppress any hiding of
#'   columns, `FALSE` can be used here.
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // *default:* `everything()`
#'
#'   In conjunction with `columns`, we can specify which of their rows should
#'   participate in the merging process. The default [everything()] results in
#'   all rows in `columns` being formatted. Alternatively, we can supply a
#'   vector of row IDs within `c()`, a vector of row indices, or a select
#'   helper function (e.g. [starts_with()], [ends_with()], [contains()],
#'   [matches()], [num_range()], and [everything()]). We can also use
#'   expressions to filter down to the rows we need
#'   (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @param pattern *Formatting pattern*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   A formatting pattern that specifies the arrangement of the `columns` values
#'   and any string literals. The pattern uses numbers (within `{ }`) that
#'   correspond to the indices of columns provided in `columns`. If two columns
#'   are provided in `columns` and we would like to combine the cell data onto
#'   the first column, `"{1} {2}"` could be used. If a pattern isn't provided
#'   then a space-separated pattern that includes all `columns` will be
#'   generated automatically. Further details are provided in the *How the
#'   `pattern` works* section.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section How the `pattern` works:
#'
#' There are two types of templating for the `pattern` string:
#'
#' 1. `{ }` for arranging single column values in a row-wise fashion
#' 2. `<< >>` to surround spans of text that will be removed if any of the
#' contained `{ }` yields a missing value
#'
#' Integer values are placed in `{ }` and those values correspond to the columns
#' involved in the merge, in the order they are provided in the `columns`
#' argument. So the pattern `"{1} ({2}-{3})"` corresponds to the target column
#' value listed first in `columns` and the second and third columns cited
#' (formatted as a range in parentheses). With hypothetical values, this might
#' result as the merged string `"38.2 (3-8)"`.
#'
#' Because some values involved in merging may be missing, it is likely that
#' something like `"38.2 (3-NA)"` would be undesirable. For such cases, placing
#' sections of text in `<< >>` results in the entire span being eliminated if
#' there were to be an `NA` value (arising from `{ }` values). We could instead
#' opt for a pattern like `"{1}<< ({2}-{3})>>"`, which results in `"38.2"` if
#' either columns `{2}` or `{3}` have an `NA` value. We can even use a more
#' complex nesting pattern like `"{1}<< ({2}-<<{3}>>)>>"` to retain a lower
#' limit in parentheses (where `{3}` is `NA`) but remove the range altogether
#' if `{2}` is `NA`.
#'
#' One more thing to note here is that if [sub_missing()] is used on values in
#' a column, those specific values affected won't be considered truly missing by
#' `cols_merge()` (since it's been handled with substitute text). So, the
#' complex pattern `"{1}<< ({2}-<<{3}>>)>>"` might result in something like
#' `"38.2 (3-limit)"` if `sub_missing(..., missing_text = "limit")` were used
#' on the third column supplied in `columns`.
#'
#' @section Comparison with other column-merging functions:
#'
#' There are three other column-merging functions that offer specialized
#' behavior that is optimized for common table tasks: [cols_merge_range()],
#' [cols_merge_uncert()], and [cols_merge_n_pct()]. These functions operate
#' similarly, where the non-target columns can be optionally hidden from the
#' output table through the `autohide` option.
#'
#' @section Examples:
#'
#' Use a subset of the [`sp500`] dataset to create a **gt** table. Use the
#' `cols_merge()` function to merge the `open` & `close` columns together, and,
#' the `low` & `high` columns (putting an em dash between both). Relabel the
#' columns with [cols_label()].
#'
#' ```r
#' sp500 |>
#'   dplyr::slice(50:55) |>
#'   dplyr::select(-volume, -adj_close) |>
#'   gt() |>
#'   cols_merge(
#'     columns = c(open, close),
#'     pattern = "{1}&mdash;{2}"
#'   ) |>
#'   cols_merge(
#'     columns = c(low, high),
#'     pattern = "{1}&mdash;{2}"
#'   ) |>
#'   cols_label(
#'     open = "open/close",
#'     low = "low/high"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_merge_1.png")`
#' }}
#'
#' Use a portion of [`gtcars`] to create a **gt** table. Use the `cols_merge()`
#' function to merge the `trq` & `trq_rpm` columns together, and, the `mpg_c` &
#' `mpg_h` columns. Given the presence of `NA` values, we can use patterns that
#' drop parts of the output text whenever missing values are encountered.
#'
#' ```r
#' gtcars |>
#'   dplyr::filter(year == 2017) |>
#'   dplyr::select(mfr, model, starts_with(c("trq", "mpg"))) |>
#'   gt() |>
#'   fmt_integer(columns = trq_rpm) |>
#'   cols_merge(
#'     columns = starts_with("trq"),
#'     pattern = "{1}<< ({2} rpm)>>"
#'   ) |>
#'   cols_merge(
#'     columns = starts_with("mpg"),
#'     pattern = "<<{1} city<</{2} hwy>>>>"
#'   ) |>
#'   cols_label(
#'     mfr = "Manufacturer",
#'     model = "Car Model",
#'     trq = "Torque",
#'     mpg_c = "MPG"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_merge_2.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-14
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cols_merge <- function(
    data,
    columns,
    hide_columns = columns[-1],
    rows = everything(),
    pattern = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl_or_group(data = data)

  # Handle gt_group
  if(inherits(data, "gt_group")){
    arg_list <- as.list(match.call())
    return(apply_to_grp(data, arg_list))
  }

  # Get the columns supplied in `columns` as a character vector
  columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data,
      excl_stub = FALSE
    )

  pattern <- pattern %||% paste0("{", seq_along(columns), "}", collapse = " ")

  # Resolve the rows supplied in the `rows` argument
  resolved_rows_idx <-
    resolve_rows_i(
      expr = {{ rows }},
      data = data
    )

  # NOTE: It's important that `hide_columns` NOT be evaluated until after the
  # previous line has run. Otherwise, the default `hide_columns` value of
  # columns[-1] may not evaluate to a sensible result. It's also important
  # that `pattern` not be evaluated, for much the same reason as above.

  # Get the columns supplied in `hide_columns` as a character vector
  hide_columns <-
    suppressWarnings(
      resolve_cols_c(
        expr = {{ hide_columns }},
        data = data
      )
  )

  if (length(hide_columns) > 0) {

    hide_columns_from_supplied <- base::intersect(hide_columns, columns)

    if (length(base::setdiff(hide_columns, columns)) > 0) {
      cli::cli_warn(c(
        "Only a subset of columns supplied in `columns` will be hidden.",
        "*" = "Use an additional `cols_hide()` expression to hide any
        out-of-scope columns."
      ),
      .frequency = "regularly",
      .frequency_id = "cols_merge_hide_columns_scope"
      )
    }

    if (length(hide_columns_from_supplied) > 0) {

      data <-
        cols_hide(
          data = data,
          columns = dplyr::all_of(hide_columns_from_supplied)
        )
    }
  }

  # Create an entry and add it to the `_col_merge` attribute
  dt_col_merge_add(
    data = data,
    col_merge = dt_col_merge_entry(
      vars = columns,
      rows = resolved_rows_idx,
      type = "merge",
      pattern = pattern
    )
  )
}

# cols_merge_uncert() ----------------------------------------------------------
#' Merge columns to a value-with-uncertainty column
#'
#' @description
#'
#' `cols_merge_uncert()` is a specialized variant of [cols_merge()]. It takes as
#' input a base value column (`col_val`) and either: (1) a single uncertainty
#' column, or (2) two columns representing lower and upper uncertainty bounds.
#' These columns will be essentially merged in a single column (that of
#' `col_val`). What results is a column with values and associated
#' uncertainties, and any columns specified in `col_uncert` are hidden from
#' appearing the output table.
#'
#' @inheritParams cols_align
#'
#' @param col_val *Column to target for base values*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The column that contains values for the start of the range. While select
#'   helper functions such as [starts_with()] and [ends_with()] can be used for
#'   column targeting, it's recommended that a single column name be used. This
#'   is to ensure that exactly one column is provided here.
#'
#' @param col_uncert *Column or columns to target for uncertainty values*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The most common case involves supplying a single column with uncertainties;
#'   these values will be combined with those in `col_val`. Less commonly, the
#'   lower and upper uncertainty bounds may be different. For that case, two
#'   columns representing the lower and upper uncertainty values away from
#'   `col_val`, respectively, should be provided. While select helper functions
#'   such as [starts_with()] and [ends_with()] can be used for column targeting,
#'   it's recommended that one or two column names be explicitly provided in a
#'   vector.
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // *default:* `everything()`
#'
#'   In conjunction with `columns`, we can specify which of their rows should
#'   participate in the merging process. The default [everything()] results in
#'   all rows in `columns` being formatted. Alternatively, we can supply a
#'   vector of row IDs within `c()`, a vector of row indices, or a select
#'   helper function (e.g. [starts_with()], [ends_with()], [contains()],
#'   [matches()], [num_range()], and [everything()]). We can also use
#'   expressions to filter down to the rows we need
#'   (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @param sep *Separator text for uncertainties*
#'
#'   `scalar<character>` // *default:* `" +/- "`
#'
#'   The separator text that contains the uncertainty mark for a single
#'   uncertainty value. The default value of `" +/- "` indicates that an
#'   appropriate plus/minus mark will be used depending on the output context.
#'   Should you want this special symbol to be taken literally, it can be
#'   supplied within the [I()] function.
#'
#' @param autohide *Automatic hiding of the `col_uncert` column(s)*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   An option to automatically hide any columns specified in `col_uncert`. Any
#'   columns with their state changed to 'hidden' will behave the same as
#'   before, they just won't be displayed in the finalized table.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Comparison with other column-merging functions:
#'
#' This function could be somewhat replicated using [cols_merge()] in the case
#' where a single column is supplied for `col_uncert`, however,
#' `cols_merge_uncert()` employs the following specialized semantics for `NA`
#' handling:
#'
#' 1. `NA`s in `col_val` result in missing values for the merged column (e.g.,
#' `NA` + `0.1` = `NA`)
#' 2. `NA`s in `col_uncert` (but not `col_val`) result in base values only for
#' the merged column (e.g., `12.0` + `NA` = `12.0`)
#' 3. `NA`s both `col_val` and `col_uncert` result in missing values for the
#' merged column (e.g., `NA` + `NA` = `NA`)
#'
#' Any resulting `NA` values in the `col_val` column following the merge
#' operation can be easily formatted using [sub_missing()].
#'
#' This function is part of a set of four column-merging functions. The other
#' three are the general [cols_merge()] function and the specialized
#' [cols_merge_range()] and [cols_merge_n_pct()] functions. These functions
#' operate similarly, where the non-target columns can be optionally hidden from
#' the output table through the `hide_columns` or `autohide` options.
#'
#' @section Examples:
#'
#' Let's use the [`exibble`] dataset to create a simple, two-column **gt** table
#' (keeping only the `num` and `currency` columns). We'll format the `num`
#' column with the [fmt_number()] function. Next we merge the `currency` and
#' `num` columns into the `currency` column; this will contain a base value and
#' an uncertainty and it's all done using the `cols_merge_uncert()` function.
#' After the merging process, the column label for the `currency` column is
#' updated with [cols_label()] to better describe the content.
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, currency) |>
#'   dplyr::slice(1:7) |>
#'   gt() |>
#'   fmt_number(
#'     columns = num,
#'     decimals = 3,
#'     use_seps = FALSE
#'   ) |>
#'   cols_merge_uncert(
#'     col_val = currency,
#'     col_uncert = num
#'   ) |>
#'   cols_label(currency = "value + uncert.")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_merge_uncert_1.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-15
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cols_merge_uncert <- function(
    data,
    col_val,
    col_uncert,
    rows = everything(),
    sep = " +/- ",
    autohide = TRUE
) {

  # Perform input object validation
  stop_if_not_gt_tbl_or_group(data = data)

  # Handle gt_group
  if(inherits(data, "gt_group")){
    arg_list <- as.list(match.call())
    return(apply_to_grp(data, arg_list))
  }

  resolved <-
    cols_merge_resolver(
      data = data,
      col_begin = {{ col_val }},
      col_end = {{ col_uncert }}
    )

  # Resolve the rows supplied in the `rows` argument
  resolved_rows_idx <-
    resolve_rows_i(
      expr = {{ rows }},
      data = data
    )

  # Create an entry and add it to the `_col_merge` attribute
  data <-
    dt_col_merge_add(
      data = data,
      col_merge = dt_col_merge_entry(
        vars = resolved$columns,
        rows = resolved_rows_idx,
        type = "merge_uncert",
        pattern = resolved$pattern,
        sep = sep
      )
    )

  if (isTRUE(autohide)) {

    col_uncert <-
      resolve_cols_c(
        expr = {{ col_uncert }},
        data = data
      )

    data <-
      cols_hide(
        data = data,
        columns = dplyr::all_of(col_uncert)
      )
  }

  data
}

# cols_merge_range() -----------------------------------------------------------
#' Merge two columns to a value range column
#'
#' @description
#'
#' `cols_merge_range()` is a specialized variant of [cols_merge()]. It operates
#' by taking a two columns that constitute a range of values (`col_begin` and
#' `col_end`) and merges them into a single column. What results is a column
#' containing both values separated by an em dash. The column specified in
#' `col_end` is dropped from the output table.
#'
#' @inheritParams cols_align
#'
#' @param col_begin *Column to target for beginning of range*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The column that contains values for the start of the range. While select
#'   helper functions such as [starts_with()] and [ends_with()] can be used for
#'   column targeting, it's recommended that a single column name be used. This
#'   is to ensure that exactly one column is provided here.
#'
#' @param col_end *Column to target for end of range*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The column that contains values for the end of the range. While select
#'   helper functions such as [starts_with()] and [ends_with()] can be used for
#'   column targeting, it's recommended that a single column name be used. This
#'   is to ensure that exactly one column is provided here.
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // *default:* `everything()`
#'
#'   In conjunction with `columns`, we can specify which of their rows should
#'   participate in the merging process. The default [everything()] results in
#'   all rows in `columns` being formatted. Alternatively, we can supply a
#'   vector of row IDs within `c()`, a vector of row indices, or a select
#'   helper function (e.g. [starts_with()], [ends_with()], [contains()],
#'   [matches()], [num_range()], and [everything()]). We can also use
#'   expressions to filter down to the rows we need
#'   (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @param autohide *Automatic hiding of the `col_end` column*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   An option to automatically hide the column specified as
#'   `col_end`. Any columns with their state changed to hidden will behave
#'   the same as before, they just won't be displayed in the finalized table.
#'
#' @param sep *Separator text for ranges*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   The separator text that indicates the values are ranged. If a `sep` value
#'   is not provided then the range separator specific to the `locale` provided
#'   will be used (if a locale isn't specified then an en dash will be used).
#'   You can specify the use of an en dash with `"--"`; a triple-hyphen sequence
#'   (`"---"`) will be transformed to an em dash. Should you want hyphens to be
#'   taken literally, the `sep` value can be supplied within the base [I()]
#'   function.
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for applying a `sep` pattern
#'   specific to a locale's rules. Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). We can call [info_locales()] as a
#'   useful reference for all of the locales that are supported. A locale ID can
#'   be also set in the initial [gt()] function call (where it would be used
#'   automatically by any function with a `locale` argument) but a `locale`
#'   value provided here will override that global locale.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Comparison with other column-merging functions:
#'
#' This function could be somewhat replicated using [cols_merge()], however,
#' `cols_merge_range()` employs the following specialized operations for `NA`
#' handling:
#'
#' 1. `NA`s in `col_begin` (but not `col_end`) result in a display of only
#  the `col_end` values only for the merged column
#' 2. `NA`s in `col_end` (but not `col_begin`) result in a display of only
#' the `col_begin` values only for the merged column (this is the converse of
#' the previous)
#' 3. `NA`s both in `col_begin` and `col_end` result in missing values for
#' the merged column
#'
#' Any resulting `NA` values in the `col_begin` column following the merge
#' operation can be easily formatted using [sub_missing()]. Separate calls of
#' [sub_missing()] can be used for the `col_begin` and `col_end` columns for
#' finer control of the replacement values.
#'
#' This function is part of a set of four column-merging functions. The other
#' three are the general [cols_merge()] function and the specialized
#' [cols_merge_uncert()] and [cols_merge_n_pct()] functions. These functions
#' operate similarly, where the non-target columns can be optionally hidden from
#' the output table through the `hide_columns` or `autohide` options.
#'
#' @section Examples:
#'
#' Let's use a subset of the [`gtcars`] dataset to create a **gt** table,
#' keeping only the `model`, `mpg_c`, and `mpg_h` columns. Merge the `"mpg*"`
#' columns together as a single range column (which is labeled as MPG, in
#' italics) using the `cols_merge_range()` function. After the merging process,
#' the column label for the `mpg_c` column is updated with [cols_label()] to
#' better describe the content.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(model, starts_with("mpg")) |>
#'   dplyr::slice(1:8) |>
#'   gt() |>
#'   cols_merge_range(
#'     col_begin = mpg_c,
#'     col_end = mpg_h
#'   ) |>
#'   cols_label(mpg_c = md("*MPG*"))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_merge_range_1.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-16
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cols_merge_range <- function(
    data,
    col_begin,
    col_end,
    rows = everything(),
    autohide = TRUE,
    sep = NULL,
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl_or_group(data = data)

  # Handle gt_group
  if(inherits(data, "gt_group")){
    arg_list <- as.list(match.call())
    return(apply_to_grp(data, arg_list))
  }

  resolved <-
    cols_merge_resolver(
      data = data,
      col_begin = {{ col_begin }},
      col_end = {{ col_end }}
    )

  # Resolve the rows supplied in the `rows` argument
  resolved_rows_idx <-
    resolve_rows_i(
      expr = {{ rows }},
      data = data
    )

  # Stop function if `locale` does not have a valid value; normalize locale
  # and resolve one that might be set globally
  validate_locale(locale = locale)
  locale <- normalize_locale(locale = locale)
  locale <- resolve_locale(data = data, locale = locale)

  # Use locale-based marks if a `sep` value is not provided
  if (is.null(sep)) {

    # Get the range pattern for the locale (if not specified then 'en' is used)
    range_pattern <- get_locale_range_pattern(locale = locale)

    # Remove the placeholders from `range_pattern` since `cols_merge_range()`
    # only requires the internal separator text for `sep`
    sep <- gsub("\\{1\\}|\\{2\\}", "", range_pattern)
  }

  # Create an entry and add it to the `_col_merge` attribute
  data <-
    dt_col_merge_add(
      data = data,
      col_merge = dt_col_merge_entry(
        vars = resolved$columns,
        rows = resolved_rows_idx,
        type = "merge_range",
        pattern = resolved$pattern,
        sep = sep
      )
    )

  if (isTRUE(autohide)) {

    col_end <-
      resolve_cols_c(
        expr = {{ col_end }},
        data = data,
        excl_stub = FALSE
      )

    data <-
      cols_hide(
        data = data,
        columns = dplyr::all_of(col_end)
      )
  }

  data
}

# cols_merge_n_pct() -----------------------------------------------------------
#' Merge two columns to combine counts and percentages
#'
#' @description
#'
#' `cols_merge_n_pct()` is a specialized variant of [cols_merge()],
#' It operates by taking two columns that constitute both a count (`col_n`) and
#' a fraction of the total population (`col_pct`) and merges them into a single
#' column. What results is a column containing both counts and their associated
#' percentages (e.g., `12 (23.2%)`). The column specified in `col_pct` is
#' dropped from the output table.
#'
#' @inheritParams cols_align
#'
#' @param col_n *Column to target for counts*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The column that contains values for the count component. While select
#'   helper functions such as [starts_with()] and [ends_with()] can be used for
#'   column targeting, it's recommended that a single column name be used. This
#'   is to ensure that exactly one column is provided here.
#'
#' @param col_pct *Column to target for percentages*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The column that contains values for the percentage component. While select
#'   helper functions such as [starts_with()] and [ends_with()] can be used for
#'   column targeting, it's recommended that a single column name be used. This
#'   is to ensure that exactly one column is provided here. This column should
#'   be formatted such that percentages are displayed (e.g., with
#'   `fmt_percent()`).
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // *default:* `everything()`
#'
#'   In conjunction with `columns`, we can specify which of their rows should
#'   participate in the merging process. The default [everything()] results in
#'   all rows in `columns` being formatted. Alternatively, we can supply a
#'   vector of row IDs within `c()`, a vector of row indices, or a select
#'   helper function (e.g. [starts_with()], [ends_with()], [contains()],
#'   [matches()], [num_range()], and [everything()]). We can also use
#'   expressions to filter down to the rows we need
#'   (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @param autohide *Automatic hiding of the `col_pct` column*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   An option to automatically hide the column specified as `col_pct`. Any
#'   columns with their state changed to hidden will behave the same as before,
#'   they just won't be displayed in the finalized table.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Comparison with other column-merging functions:
#'
#' This function could be somewhat replicated using [cols_merge()], however,
#' `cols_merge_n_pct()` employs the following specialized semantics for `NA`
#' and zero-value handling:
#'
#' 1. `NA`s in `col_n` result in missing values for the merged
#' column (e.g., `NA` + `10.2%` = `NA`)
#' 2. `NA`s in `col_pct` (but not `col_n`) result in
#' base values only for the merged column (e.g., `13` + `NA` = `13`)
#' 3. `NA`s both `col_n` and `col_pct` result in
#' missing values for the merged column (e.g., `NA` + `NA` = `NA`)
#' 4. If a zero (`0`) value is in `col_n` then the formatted output will be
#' `"0"` (i.e., no percentage will be shown)
#'
#' Any resulting `NA` values in the `col_n` column following the merge
#' operation can be easily formatted using [sub_missing()].
#' Separate calls of [sub_missing()] can be used for the `col_n` and
#' `col_pct` columns for finer control of the replacement values. It is the
#' responsibility of the user to ensure that values are correct in both the
#' `col_n` and `col_pct` columns (this function neither generates nor
#' recalculates values in either). Formatting of each column can be done
#' independently in separate [fmt_number()] and [fmt_percent()] calls.
#'
#' This function is part of a set of four column-merging functions. The other
#' three are the general [cols_merge()] function and the specialized
#' [cols_merge_uncert()] and [cols_merge_range()] functions. These functions
#' operate similarly, where the non-target columns can be optionally hidden from
#' the output table through the `hide_columns` or `autohide` options.
#'
#' @section Examples:
#'
#' Using a summarized version of the [`pizzaplace`] dataset, let's create a
#' **gt** table that displays the counts and percentages of the top 3 pizzas
#' sold by pizza category in 2015. The `cols_merge_n_pct()` function is used to
#' merge the `n` and `frac` columns (and the `frac` column is formatted using
#' [fmt_percent()]).
#'
#' ```r
#' pizzaplace |>
#'   dplyr::count(name, type, price, sort = TRUE) |>
#'   dplyr::mutate(frac = prop.table(n)) |>
#'   dplyr::slice_max(n, n = 3, by = type) |>
#'   dplyr::arrange(type) |>
#'   gt(
#'     rowname_col = "name",
#'     groupname_col = "type"
#'   ) |>
#'   fmt_currency(price) |>
#'   fmt_percent(frac) |>
#'   cols_merge_n_pct(
#'     col_n = n,
#'     col_pct = frac
#'   ) |>
#'   cols_label(
#'     n = md("*N* (%)"),
#'     price = "Price"
#'   ) |>
#'   tab_style(
#'     style = cell_text(font = "monospace"),
#'     locations = cells_stub()
#'   ) |>
#'   tab_stubhead(md("Cat. and  \nPizza Code")) |>
#'   tab_header(title = "Top 3 Pizzas Sold by Category in 2015") |>
#'   tab_options(table.width = px(512))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_merge_n_pct_1.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-17
#'
#' @section Function Introduced:
#' `v0.3.0` (May 12, 2021)
#'
#' @export
cols_merge_n_pct <- function(
    data,
    col_n,
    col_pct,
    rows = everything(),
    autohide = TRUE
) {

  # Perform input object validation
  stop_if_not_gt_tbl_or_group(data = data)

  # Handle gt_group
  if(inherits(data, "gt_group")){
    arg_list <- as.list(match.call())
    return(apply_to_grp(data, arg_list))
  }

  resolved <-
    cols_merge_resolver(
      data = data,
      col_begin = {{ col_n }},
      col_end = {{ col_pct }}
    )

  # Resolve the rows supplied in the `rows` argument
  resolved_rows_idx <-
    resolve_rows_i(
      expr = {{ rows }},
      data = data
    )

  # Create an entry and add it to the `_col_merge` attribute
  data <-
    dt_col_merge_add(
      data = data,
      col_merge = dt_col_merge_entry(
        vars = resolved$columns,
        rows = resolved_rows_idx,
        type = "merge_n_pct",
        pattern = resolved$pattern,
        sep = ""
      )
    )

  if (isTRUE(autohide)) {

    col_pct <-
      resolve_cols_c(
        expr = {{ col_pct }},
        data = data
      )

    data <-
      cols_hide(
        data = data,
        columns = dplyr::all_of(col_pct)
      )
  }

  data
}

# Helpers --------------------------------------------------

cols_merge_resolver <- function(
    data,
    col_begin,
    col_end
) {

  # Get the columns supplied in `col_begin` as a character vector
  col_begin <-
    resolve_cols_c(
      expr = {{ col_begin }},
      data = data,
      excl_stub = FALSE
    )

  # Get the columns supplied in `col_end` as a character vector
  col_end <-
    resolve_cols_c(
      expr = {{ col_end }},
      data = data,
      excl_stub = FALSE
    )

  columns <- c(col_begin, col_end)

  list(
    columns = columns,
    pattern = "{1}{sep}{2}"
  )
}
