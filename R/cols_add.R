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


# cols_add() -------------------------------------------------------------------
#' Add one or more columns to a **gt** table
#'
#' @description
#'
#' We can add new columns to a table with `cols_add()` and it works quite a bit
#' like `dplyr::mutate()` does. The idea is that you supply name-value pairs
#' where the name is the new column name and the value part describes the data
#' that will go into the column. The latter can: (1) be a vector where the
#' length of the number of rows in the data table, (2) be a single value
#' (which will be repeated all the way down), or (3) involve other columns in
#' the table (as they represent vectors of the correct length). The new columns
#' are added to the end of the column series by default but can instead be added
#' internally by using either the `.before` or `.after` arguments. If entirely
#' empty (i.e., all `NA`) columns need to be added, you can use any of the `NA`
#' types (e.g., `NA`, `NA_character_`, `NA_real_`, etc.) for such columns.
#'
#' @inheritParams cols_align
#'
#' @param ... *Cell data assignments*
#'
#'   `<multiple expressions>` // (or, use `.list`)
#'
#'   Expressions for the assignment of cell values to the new columns.
#'   Name-value pairs, in the form of `<column> = <value vector>` will work, so
#'   long as any `<column>` value does not already exist in the table. The
#'   `<value vector>` may be an expression that uses one or more column names in
#'   the table to generate a vector of values. Single values in `<value vector>`
#'   will be repeated down the new column. A vector where the length is exactly
#'   the number of rows in the table can also be used.
#'
#' @param .before,.after *Column used as anchor*
#'
#'   `<column-targeting expression>` // *default:* `NULL` (`optional`)
#'
#'   A single column-resolving expression or column index can be given to either
#'   `.before` or `.after`. The column specifies where the new columns should be
#'   positioned among the existing columns in the input data table. While select
#'   helper functions such as [starts_with()] and [ends_with()] can be used for
#'   column targeting, it's recommended that a single column name or index be
#'   used. This is to ensure that exactly one column is provided to either of
#'   these arguments (otherwise, the function will be stopped). If nothing is
#'   provided for either argument then any new column will be placed at the end
#'   of the column series.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Targeting the column for insertion with `.before` or `.after`:
#'
#' The targeting of a column for insertion is done through the `.before` or
#' `.after` arguments (only one of these options should be used). While
#' **tidyselect**-style expressions or indices can used to target a column, it's
#' advised that a single column name be used. This is to avoid the possibility
#' of inadvertently resolving multiple columns (since the requirement is for a
#' single column).
#'
#' @section Examples:
#'
#' Let's take a subset of the [`exibble`] dataset and make a simple **gt** table
#' with it (using the `row` column for labels in the stub). We'll add a single
#' column to the right of all the existing columns and call it `country`. This
#' new column needs eight values and these will be supplied when using
#' `cols_add()`.
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, char, datetime, currency, group) |>
#'   gt(rowname_col = "row") |>
#'   cols_add(
#'     country = c("TL", "PY", "GL", "PA", "MO", "EE", "CO", "AU")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_add_1.png")`
#' }}
#'
#' We can add multiple columns with a single use of `cols_add()`. The columns
#' generated can be formatted and otherwise manipulated just as any column could
#' be in a **gt** table. The following example extends the first one by adding
#' more columns and immediately using them in various function calls like
#' [fmt_flag()] and [fmt_units()].
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, char, datetime, currency, group) |>
#'   gt(rowname_col = "row") |>
#'   cols_add(
#'     country = c("TL", "PY", "GL", "PA", "MO", "EE", "CO", "AU"),
#'     empty = NA_character_,
#'     units = c(
#'       "k m s^-2", "N m^-2", "degC", "m^2 kg s^-2",
#'       "m^2 kg s^-3", "/s", "A s", "m^2 kg s^-3 A^-1"
#'     ),
#'     big_num = num ^ 3
#'   ) |>
#'   fmt_flag(columns = country) |>
#'   sub_missing(columns = empty, missing_text = "") |>
#'   fmt_units(columns = units) |>
#'   fmt_scientific(columns = big_num)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_add_2.png")`
#' }}
#'
#' In this table generated from a portion of the [`towny`] dataset, we add two
#' new columns (`land_area` and `density`) through a single use of `cols_add()`.
#' The new `land_area` column is a conversion of land area from square
#' kilometers to square miles and the `density` column is calculated by through
#' division of `population_2021` by that new `land_area` column. We hide the
#' now unneeded `land_area_km2` with [cols_hide()] and also perform some column
#' labeling and adjustments to column widths with [cols_label()] and
#' [cols_width()].
#'
#' ```r
#' towny |>
#'   dplyr::select(name, population_2021, land_area_km2) |>
#'   dplyr::filter(population_2021 > 100000) |>
#'   dplyr::slice_max(population_2021, n = 10) |>
#'   gt() |>
#'   cols_add(
#'     land_area = land_area_km2 / 2.58998811,
#'     density = population_2021 / land_area
#'   ) |>
#'   fmt_integer() |>
#'   cols_hide(columns = land_area_km2) |>
#'   cols_label(
#'     population_2021 = "Population",
#'     density = "Density, {{*persons* / sq mi}}",
#'     land_area ~ "Area, {{mi^2}}"
#'   ) |>
#'   cols_width(everything() ~ px(120))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_add_3.png")`
#' }}
#'
#' It's possible to start with an empty table (i.e., no columns and no rows) and
#' add one or more columns to that. You can, for example, use `dplyr::tibble()`
#' or `data.frame()` to create a completely empty table. The first `cols_add()`
#' call for an empty table can have columns of arbitrary length but subsequent
#' uses of `cols_add()` must adhere to the rule of new columns being the same
#' length as existing.
#'
#' ```r
#' dplyr::tibble() |>
#'   gt() |>
#'   cols_add(
#'     num = 1:5,
#'     chr = vec_fmt_spelled_num(1:5)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_add_4.png")`
#' }}
#'
#' Tables can contain no rows, yet have columns. In the following example, we'll
#' create a zero-row table with three columns (`num`, `chr`, and `ext`) and
#' perform the same `cols_add()`-based addition of two columns of data. This is
#' another case where the function allows for arbitrary-length columns (since
#' always adding zero-length columns is impractical). Furthermore, here we can
#' reference columns that already exist (`num` and `chr`) and add values to
#' them.
#'
#' ```r
#' dplyr::tibble(
#'   num = numeric(0),
#'   chr = character(0),
#'   ext = character(0)
#' ) |>
#'   gt() |>
#'   cols_add(
#'     num = 1:5,
#'     chr = vec_fmt_spelled_num(1:5)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_add_5.png")`
#' }}
#'
#' We should note that the `ext` column did not receive any values from
#' `cols_add()` but the table was expanded to having five rows nonetheless. So,
#' each cell of `ext` was by necessity filled with an `NA` value.
#'
#' @family column modification functions
#' @section Function ID:
#' 5-7
#'
#' @section Function Introduced:
#' `v0.10.0` (October 7, 2023)
#'
#' @export
cols_add <- function(
    .data,
    ...,
    .before = NULL,
    .after = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl_or_group(data = .data)

  # Handle gt_group
  if(inherits(.data, "gt_group")){
    arg_list <- as.list(match.call())
    return(apply_to_grp(.data, arg_list))
  }

  # Get the table's boxhead
  boxh_df <- dt_boxhead_get(data = .data)

  # Get the internal dataset and a vector of its column names
  data_tbl <- dt_data_get(data = .data)
  data_tbl_columns <- colnames(data_tbl)

  #
  # Special case where data table has no columns (and perhaps no rows); here,
  # we allow for one or more columns to be added with an arbitrary number of
  # rows, however, the number of rows should be consistent across the supplied
  # columns
  #

  if (nrow(data_tbl) == 0L && ncol(data_tbl) == 0L) {

    # Generate boxhead rows that correspond to the new columns
    updated_boxh_df <-
      dt_boxhead_get(data = gt(dplyr::as_tibble(as.data.frame(list(...)))))

    # Modify the internal boxhead data frame
    .data <- dt_boxhead_set(data = .data, boxh = updated_boxh_df)

    # Manually add rows to the empty data table (if there are indeed some rows)
    if (nrow(dplyr::as_tibble(as.data.frame(list(...)))) > 0) {

      .data <-
        dt_data_add_rows(
          data = .data,
          row_data_list = list(...),
          before = NULL,
          after = NULL
        )
    }

    # Update the internal data table object
    .data <-
      dt_data_set(
        data = .data,
        data_tbl = dplyr::as_tibble(as.data.frame(list(...)))
      )

    return(.data)
  }

  #
  # Special case where data table has some columns (but no rows); here, we allow
  # for one or more columns to be added with an arbitrary number of rows,
  # however, the number of rows should be consistent across the supplied columns
  #

  if (nrow(data_tbl) == 0L && ncol(data_tbl) > 0) {

    # Generate boxhead rows that correspond to the new columns
    updated_boxh_df <-
      dt_boxhead_get(data = gt(dplyr::as_tibble(as.data.frame(list(...)))))

    updated_boxh_df <-
      vctrs::vec_rbind(
        dt_boxhead_get(data = .data),
        updated_boxh_df[
          !(updated_boxh_df$var %in% dt_boxhead_get(data = .data)[["var"]]),
        ]
      )

    # Modify the internal boxhead data frame
    .data <- dt_boxhead_set(data = .data, boxh = updated_boxh_df)

    # Determine whether the supplied set of values is zero length
    row_data_list_empty <-
      all(
        vapply(
          seq_along(list(...)),
          FUN.VALUE = logical(1),
          USE.NAMES = FALSE,
          FUN = function(x) {
            length(list(...)[[x]]) < 1
          }
        )
      )

    if (row_data_list_empty) {

      # Bind the zero-row tables together
      updated_data_tbl <-
        dplyr::bind_cols(
          dt_data_get(data = .data),
          dplyr::as_tibble(as.data.frame(list(...)))
        )

      # Update the internal data table object
      .data <-
        dt_data_set(
          data = .data,
          data_tbl = updated_data_tbl
        )

      return(.data)
    }

    # Manually add rows to the empty data table (if there are indeed some rows)
    if (nrow(dplyr::as_tibble(as.data.frame(list(...)))) > 0) {

      .data <-
        dt_data_add_rows(
          data = .data,
          row_data_list = list(...),
          before = NULL,
          after = NULL
        )
    }

    return(.data)
  }

  # Mutate the internal data table and get a vector of its column names
  data_tbl_mutated <- dplyr::mutate(data_tbl, ...)
  data_tbl_mutated_columns <- colnames(data_tbl_mutated)

  #
  # If the number of columns in the mutated table is not at least one
  # larger than the non-mutated table then return the data unchanged
  #

  column_count_diff <-
    length(data_tbl_mutated_columns) - length(data_tbl_columns)

  if (column_count_diff < 1) {
    return(.data)
  }

  # Determine which columns are new in the mutated table
  columns_new <- base::setdiff(data_tbl_mutated_columns, data_tbl_columns)

  # Generate a table that has only the new columns
  data_tbl_new_cols <- data_tbl_mutated[columns_new]

  # Generate boxhead rows that correspond to the new columns
  boxh_df_new_cols <- dt_boxhead_get(data = gt(data_tbl_new_cols))

  #
  # Resolve any `.before` or `.after` column and stop function upon
  # observing any inconsistencies
  #

  resolved_column_before <-
    resolve_cols_c(
      expr = {{ .before }},
      data = .data,
      null_means = "nothing"
    )

  if (length(resolved_column_before) == 0) {
    resolved_column_before <- NULL
  } else if (length(resolved_column_before) != 1) {

    if (length(resolved_column_before) > 1) {
      cli::cli_abort("The expression used for `.before` resolved multiple columns.")
    }
  }

  resolved_column_after <-
    resolve_cols_c(
      expr = {{ .after }},
      data = .data,
      null_means = "nothing"
    )

  if (length(resolved_column_after) == 0L) {
    resolved_column_after <- NULL
  } else if (length(resolved_column_after) != 1) {

    if (length(resolved_column_after) > 1) {
      cli::cli_abort("The expression used for `.after` resolved multiple columns.")
    }
  }

  if (length(resolved_column_after) == 1 && resolved_column_after == colnames(data_tbl)[NCOL(data_tbl)]) {
    # if requesting the last column to add after, use NULL instead.
    resolved_column_after <- NULL
  }

  # Stop function if expressions are given to both `.before` and `.after`
  if (!is.null(resolved_column_before) && !is.null(resolved_column_after)) {
    cli::cli_abort("Expressions cannot be given to both `.before` and `.after`.")
  }

  #
  # Prepend, insert, or append the new data columns (`data_tbl_new_cols`)
  # to those existing in `data_tbl`
  #

  # Get the first and last column names from `data_tbl`
  first_colname <- colnames(data_tbl)[1]
  last_colname <- colnames(data_tbl)[ncol(data_tbl)]

  if (is.null(resolved_column_before) && is.null(resolved_column_after)) {

    updated_data_tbl <-
      vctrs::vec_cbind(
        data_tbl,
        data_tbl_new_cols
      )

    updated_boxh_df <-
      vctrs::vec_rbind(
        boxh_df,
        boxh_df_new_cols
      )

  } else if (!is.null(resolved_column_before) && is.null(resolved_column_after)) {

    before_colnum <- which(colnames(data_tbl) == resolved_column_before)

    if (before_colnum <= 1) {
      # put new column first
      updated_data_tbl <-
        vctrs::vec_cbind(
          data_tbl_new_cols,
          data_tbl
        )
    } else {
      updated_data_tbl <-
        vctrs::vec_cbind(
          data_tbl[1:(before_colnum - 1)],
          data_tbl_new_cols,
          data_tbl[before_colnum:ncol(data_tbl)]
        )
    }


    before_colnum <- which(boxh_df[["var"]] == resolved_column_before)

    updated_boxh_df <-
      vctrs::vec_rbind(
        boxh_df[(1:before_colnum) - 1, ],
        boxh_df_new_cols,
        boxh_df[before_colnum:nrow(boxh_df), ]
      )

  } else if (is.null(resolved_column_before) && !is.null(resolved_column_after)) {

    after_colnum <- which(colnames(data_tbl) == resolved_column_after)

    updated_data_tbl <-
      dplyr::bind_cols(
        data_tbl[1:(after_colnum)],
        data_tbl_new_cols,
        data_tbl[(after_colnum + 1):ncol(data_tbl)]
      )

    after_colnum <- which(boxh_df[["var"]] == resolved_column_after)

    updated_boxh_df <-
      vctrs::vec_rbind(
        boxh_df[1:after_colnum, ],
        boxh_df_new_cols,
        boxh_df[(after_colnum + 1):nrow(boxh_df), ]
      )
  }

  # Modify the internal datasets
  .data <- dt_data_set(data = .data, data_tbl = updated_data_tbl)
  .data <- dt_boxhead_set(data = .data, boxh = updated_boxh_df)

  .data
}
