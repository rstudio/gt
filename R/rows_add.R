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


#' Add one or more rows to a **gt** table
#'
#' @description
#'
#' It's possible to add new rows to your table with `rows_add()` by supplying
#' the new row data through name value pairs. The new rows are added to the
#' bottom of the table by default but can be added internally though by using
#' either the `.before` or `.after` arguments. If entirely empty rows need to
#' be added, the `.n_empty` option provides a means to specify the number of
#' blank (i.e., all `NA`) rows to be inserted into the table.
#'
#' @param .data A table object that is created using the [gt()] function.
#' @param ... Expressions for the assignment of cell values to the new rows
#'   by column name in `.data`. Name-value pairs, in the form of
#'   `<column> = <value vector>` will work, so long as the `<column>` value
#'   exists in the table. Two-sided formulas with column-resolving expressions
#'   (e.g, `<expr> ~ <value vector>`) can also be used, where the left-hand side
#'   corresponds to selections of columns. The length of the longest vector in
#'   `<value vector>` determines how many new rows will be added. Single values
#'   in `<value vector>` will be repeated down in cases where there are multiple
#'   rows to be added.
#' @param .list Allows for the use of a list as an input alternative to `...`.
#' @param .before,.after A single row-resolving expression or row index can be
#'   given to either `.before` or `.after`. This specifies where the new rows
#'   should be positioned among the existing rows in the input data table. If
#'   nothing is provided for either argument the new rows will be placed at the
#'   bottom.
#' @param .n_empty An option to add empty rows in lieu of rows containing data
#'   that would otherwise be supplied to `...` or `.list`. If the option is
#'   taken, provide an integer value here.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Let's make a simple **gt** table with the [`exibble`] dataset, using the
#' `row` column for labels in the stub. We'll add a single row to the bottom of
#' the table with `rows_add()`. With name-value pairs, it's possible to add
#' values for the body cells corresponding to columns available in the table.
#' For any columns that are missed, the corresponding body cells receive `NA`
#' values.
#'
#' ```r
#' exibble |>
#'   gt(rowname_col = "row") |>
#'   rows_add(
#'     row = "row_9",
#'     num = 9.999E7,
#'     char = "ilama",
#'     fctr = "nine",
#'     group = "grp_b"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rows_add_1.png")`
#' }}
#'
#' If you wanted to place a row somewhere in the middle of the table, we can use
#' either of the `.before` or `.after` arguments in `rows_add()`:
#'
#' ```r
#' exibble |>
#'   gt(rowname_col = "row") |>
#'   rows_add(
#'     row = "row_4.5",
#'     num = 9.923E3,
#'     char = "elderberry",
#'     fctr = "eighty",
#'     group = "grp_a",
#'     .after = "row_4"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rows_add_2.png")`
#' }}
#'
#' Putting a row at the beginning requires the use of the `.before` argument. We
#' can use an index value for the row as in `.before = 1` for maximum easiness:
#'
#' ```r
#' exibble |>
#'   gt(rowname_col = "row") |>
#'   rows_add(
#'     row = "row_0",
#'     num = 0,
#'     char = "apple",
#'     fctr = "zero",
#'     group = "grp_a",
#'     .before = 1
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rows_add_3.png")`
#' }}
#'
#' Again with [`exibble`], we can create an example where we insert 'spacer'
#' rows. These are rows without any content and merely serve to add extra
#' rowwise space to the table. In this case, we'll have a stub with row names
#' and row groups (set up in the [gt()] call). The two rows being added will
#' occupy the bottom row of each group. The only data defined for the two rows
#' involves values for the `row` and `group` columns. It's important that the
#' data for `group` uses the group names already present in the data (`"grp_a"`
#' and `"grp_b"`). The corresponding values for `row` will be `"row_a_end"` and
#' `"row_b_end"`, these will be used later expressions for targeting the rows.
#' Here's the code needed to generate spacer rows at the end of each row group:
#'
#' ```r
#' exibble |>
#'   gt(rowname_col = "row", groupname_col = "group") |>
#'   rows_add(
#'     row = c("row_a_end", "row_b_end"),
#'     group = c("grp_a", "grp_b")
#'   ) |>
#'   tab_style(
#'     style = cell_borders(sides = "top", style = "hidden"),
#'     locations = list(
#'       cells_body(rows = ends_with("end")),
#'       cells_stub(rows = ends_with("end"))
#'     )
#'   ) |>
#'   sub_missing(missing_text = "") |>
#'   text_case_when(
#'     grepl("end", x) ~ "",
#'     .locations = cells_stub()
#'   ) |>
#'   opt_vertical_padding(scale = 0.5)
#' ```
#'
#' All missing values are substituted with an empty string (`""`) using the
#' [sub_missing()] function. We removed the top border of the new rows with a
#' call to [tab_style()], targeting those rows where the row labels end with
#' `"end"`. Finally, we get rid of the row labels with the use of the
#' [text_case_when()] function, using a similar strategy of targeting the name
#' of the row label.
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rows_add_4.png")`
#' }}
#'
#' @family row addition/modification functions
#' @section Function ID:
#' 6-4
#'
#' @section Function Introduced:
#' `0.9.1` (in development)
#'
#' @import rlang
#' @export
rows_add <- function(
    .data,
    ...,
    .list = list2(...),
    .before = NULL,
    .after = NULL,
    .n_empty = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = .data)

  # Collect a list of new row data
  row_data_list <- .list

  if (length(row_data_list) < 1 && is.null(.n_empty)) {
    return(.data)
  }

  # Get the column names from the internal dataset
  data_tbl <- dt_data_get(data = .data)

  if (!is.null(.n_empty)) {

    # Ensure that `.n_empty` is an integer if anything is provided
    if (!rlang::is_integerish(.n_empty)) {
      cli::cli_abort("An integer value should be supplied for `.n_empty`.")
    }

    # If the `.n_empty` should evaluate to `0` return the data unchanged
    if (as.integer(.n_empty) == 0) {
      return(.data)
    }

    # Ensure that `.n_empty` is not negative
    if (as.integer(.n_empty) < 0) {
      cli::cli_abort("The value for `.n_empty` cannot be negative.")
    }

    # Generate empty rows with `NA` values
    row_data_list <-
      lapply(
        seq_along(colnames(data_tbl)),
        FUN = function(x) rep(NA, .n_empty)
      )
    names(row_data_list) <- colnames(data_tbl)

  } else {

    # Ensure that the column names resolved belong to the internal
    # data table of `data_tbl`
    if (any(!(names(row_data_list) %in% colnames(data_tbl)))) {
      cli::cli_abort("All column names referenced must be present in the data.")
    }
  }

  resolved_rows_before_idx <-
    resolve_rows_i(
      expr = {{ .before }},
      data = .data,
      null_means = "nothing"
    )

  resolved_rows_after_idx <-
    resolve_rows_i(
      expr = {{ .after }},
      data = .data,
      null_means = "nothing"
    )

  dt_data_add_rows(
    data = .data,
    row_data_list = row_data_list,
    before = resolved_rows_before_idx,
    after = resolved_rows_after_idx
  )
}
