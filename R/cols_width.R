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
#  Copyright (c) 2018-2025 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#

# cols_width() -----------------------------------------------------------------
#' Set the widths of columns
#'
#' @description
#'
#' Manual specifications of column widths can be performed using the
#' `cols_width()` function. We choose which columns get specific widths. This
#' can be in units of pixels (easily set by use of the [px()] helper function),
#' or, as percentages (where the [pct()] helper function is useful). Width
#' assignments are supplied in `...` through two-sided formulas, where the
#' left-hand side defines the target columns and the right-hand side is a single
#' dimension.
#'
#' @inheritParams cols_align
#'
#' @param ... *Column width assignments*
#'
#'   `<multiple expressions>` // **required** (or, use `.list`)
#'
#'   Expressions for the assignment of column widths for the table columns in
#'   `.data`. Two-sided formulas (e.g, `<LHS> ~ <RHS>`) can be used, where the
#'   left-hand side corresponds to selections of columns and the right-hand side
#'   evaluates to single-length character values in the form `{##}px` (i.e.,
#'   pixel dimensions); the [px()] helper function is best used for this
#'   purpose. Column names should be enclosed in `c()`. The column-based select
#'   helpers [starts_with()], [ends_with()], [contains()], [matches()], and
#'   [everything()] can be used in the LHS. Subsequent expressions that operate
#'   on the columns assigned previously will result in overwriting column width
#'   values (both in the same `cols_width()` call and across separate calls).
#'   All other columns can be assigned a default width value by using
#'   `everything()` on the left-hand side.
#'
#' @param .list *Alternative to `...`*
#'
#'   `<list of multiple expressions>` // **required** (or, use `...`)
#'
#'   Allows for the use of a list as an input alternative to `...`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @details
#'
#' Column widths can be set as absolute or relative values (with px and
#' percentage values). Those columns not specified are treated as having
#' variable width. The sizing behavior for column widths depends on the
#' combination of value types, and, whether a table width has been set (which
#' could, itself, be expressed as an absolute or relative value). Widths for the
#' table and its container can be individually modified with the `table.width`
#' and `container.width` arguments within [tab_options()]).
#'
#' @section Examples:
#'
#' Use select columns from the [`exibble`] dataset to create a **gt** table. We
#' can specify the widths of columns with `cols_width()`. This is done with
#' named arguments in `...`, specifying the exact widths for table columns
#' (using `everything()` at the end will capture all remaining columns).
#'
#' ```r
#' exibble |>
#'   dplyr::select(
#'     num, char, date,
#'     datetime, row
#'   ) |>
#'   gt() |>
#'   cols_width(
#'     num ~ px(150),
#'     ends_with("r") ~ px(100),
#'     starts_with("date") ~ px(200),
#'     everything() ~ px(60)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_width_1.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-3
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cols_width <- function(
    .data,
    ...,
    .list = list2(...)
) {

  # Perform input object validation
  stop_if_not_gt_tbl_or_group(data = .data)

  # Handle gt_group
  if(inherits(.data, "gt_group")){
    arg_list <- as.list(match.call())
    return(apply_to_grp(.data, arg_list))
  }

  # Collect a named list of column widths
  widths_list <- .list

  # If nothing is provided, return `.data` unchanged
  if (length(widths_list) == 0) {
    cli::cli_abort(c(
      "Nothing was provided to `...`.",
      "*" = "Use formula expressions to define custom column widths."
    ))
  }

  all_formulas <-
    all(
      vapply(
        widths_list,
        FUN = rlang::is_formula,
        FUN.VALUE = logical(1L)
      )
    )

  if (!all_formulas) {
    cli::cli_abort(
      "Only two-sided formulas should be provided to `...`."
    )
  }

  columns_used <- NULL

  for (width_item in widths_list) {

    cols <- rlang::f_lhs(width_item)

    # The default use of `resolve_cols_c()` won't work here if there
    # is a table stub column (because we need to be able to set the
    # stub column width and, by default, `resolve_cols_c()` excludes
    # the stub); to prevent this exclusion, we set `excl_stub` to FALSE
    columns <-
      resolve_cols_c(
        expr = !!cols,
        data = .data,
        excl_stub = FALSE,
        excl_group = FALSE
      )

    columns <- base::setdiff(columns, columns_used)

    columns_used <- c(columns_used, columns)

    width <- rlang::eval_tidy(rlang::f_rhs(width_item))

    # If a bare numeric value is provided, give that the `px` dimension
    if (is.numeric(width)) width <- paste_right(as.character(width), "px")

    for (column in columns) {

      .data <-
        dt_boxhead_edit(
          data = .data,
          var = column,
          column_width = list(width)
        )
    }
  }

  boxh <- dt_boxhead_get(data = .data)

  unset_widths <- unlist(lapply(boxh$column_width, FUN = is.null))

  if (any(unset_widths)) {

    columns_unset <- dt_boxhead_get_vars(data = .data)[unset_widths]

    for (column in columns_unset) {

      .data <-
        dt_boxhead_edit(
          data = .data,
          var = column,
          column_width = list("")
        )
    }
  }

  .data
}
