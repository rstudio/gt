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
#  Copyright (c) 2018-2024 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


# tab_stub_indent() ------------------------------------------------------------
#' Control indentation of row labels in the stub
#'
#' @description
#'
#' Indentation of row labels is an effective way for establishing structure in a
#' table stub. `tab_stub_indent()` allows for fine control over
#' row label indentation in the stub. We can use an explicit definition of an
#' indentation level (with a number between `0` and `5`), or, employ an
#' indentation directive using keywords (`"increase"`/`"decrease"`).
#'
#' @inheritParams fmt_number
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // **required**
#'
#'   The rows to consider for the indentation change. We can supply a vector of
#'   row ID values within `c()`, a vector of row indices, or use select helpers
#'   here (e.g. [starts_with()], [ends_with()], [contains()], [matches()],
#'   [num_range()], and [everything()]). We can also use expressions to filter
#'   down to the rows we need (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @param indent *Indentation directive*
#'
#'   `scalar<character|numeric|integer>` // *default:* `"increase"`
#'
#'   An indentation directive either as a keyword describing the indentation
#'   change or as an explicit integer value for directly setting the indentation
#'   level. The keyword `"increase"` (the default) will increase the indentation
#'   level by one; `"decrease"` will do the same in the reverse direction. The
#'   starting indentation level of `0` means no indentation and this values
#'   serves as a lower bound. The upper bound for indentation is at level `5`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with the `indent` argument of `tab_stub_indent()`
#' to obtain varying parameter values from a specified column within the table.
#' This means that each row label could be indented a little bit differently.
#'
#' Please note that for this argument (`indent`), a [from_column()] call needs
#' to reference a column that has data of the `numeric` or `integer` type.
#' Additional columns for parameter values can be generated with [cols_add()]
#' (if not already present). Columns that contain parameter data can also be
#'  hidden from final display with [cols_hide()].
#'
#' @section Examples:
#'
#' Using a subset of the [`photolysis`] dataset within a **gt** table, we can
#' provide some indentation to all of the row labels in the stub via
#' `tab_stub_indent()`. Here we provide an `indent` value of `3` for a very
#' prominent indentation that clearly shows that the row labels are subordinate
#' to the two row group labels in this table (`"inorganic reactions"` and
#' `"carbonyls"`).
#'
#' ```r
#' photolysis |>
#'   dplyr::select(cmpd_name, products, type, l, m, n) |>
#'   dplyr::slice_head(n = 10) |>
#'   gt(groupname_col = "type", rowname_col = "cmpd_name") |>
#'   fmt_chem(columns = products) |>
#'   fmt_scientific(columns = l) |>
#'   tab_stub_indent(
#'     rows = everything(),
#'     indent = 3
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_stub_indent_1.png")`
#' }}
#'
#' Let's use a summarized version of the [`pizzaplace`] dataset to create a
#' another **gt** table with row groups and row labels. With [summary_rows()],
#' we'll generate summary rows at the top of each row group. Using
#' `tab_stub_indent()` we can add indentation to the row labels in the stub.
#'
#' ```r
#' pizzaplace |>
#'   dplyr::group_by(type, size) |>
#'   dplyr::summarize(
#'     sold = dplyr::n(),
#'     income = sum(price),
#'     .groups = "drop"
#'   ) |>
#'   gt(rowname_col = "size", groupname_col = "type") |>
#'   tab_header(title = "Pizzas Sold in 2015") |>
#'   fmt_integer(columns = sold) |>
#'   fmt_currency(columns = income) |>
#'   summary_rows(
#'     fns = list(label = "All Sizes", fn = "sum"),
#'     side = "top",
#'     fmt = list(
#'       ~ fmt_integer(., columns = sold),
#'       ~ fmt_currency(., columns = income)
#'     )
#'   ) |>
#'   tab_options(
#'     summary_row.background.color = "gray95",
#'     row_group.background.color = "#FFEFDB",
#'     row_group.as_column = TRUE
#'   ) |>
#'   tab_stub_indent(
#'     rows = everything(),
#'     indent = 2
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_stub_indent_2.png")`
#' }}
#'
#' Indentation of entries in the stub can be controlled by values within a
#' column. Here's an example of that using the [`constants`] dataset, where
#' variations of a row label are mutated to eliminate the common leading text
#' (replacing it with `"..."`). At the same time, the indentation for those rows
#' is set to `4` in the `indent` column (value is `0` otherwise). The
#' `tab_stub_indent()` statement uses [from_column()], which passes values from
#' the `indent` column to the namesake argument. We hide the `indent` column
#' from view by use of [cols_hide()].
#'
#' ```r
#' constants |>
#'   dplyr::select(name, value, uncert, units) |>
#'   dplyr::filter(
#'     grepl("^atomic mass constant", name) |
#'       grepl("^Rydberg constant", name) |
#'       grepl("^Bohr magneton", name)
#'   ) |>
#'   dplyr::mutate(
#'     indent = ifelse(grepl("constant |magneton ", name), 4, 0),
#'     name = gsub(".*constant |.*magneton ", "...", name)
#'   ) |>
#'   gt(rowname_col = "name") |>
#'   tab_stubhead(label = "Physical Constant") |>
#'   tab_stub_indent(
#'     rows = everything(),
#'     indent = from_column(column = "indent")
#'   ) |>
#'   fmt_scientific(columns = c(value, uncert)) |>
#'   fmt_units(columns = units) |>
#'   cols_hide(columns = indent) |>
#'   cols_label(
#'     value = "Value",
#'     uncert = "Uncertainty",
#'     units = "Units"
#'   ) |>
#'   cols_width(
#'     stub() ~ px(250),
#'     c(value, uncert) ~ px(150),
#'     units ~ px(80)
#'   ) |>
#'   tab_style(
#'     style = cell_text(indent = px(10)),
#'     locations = list(
#'       cells_column_labels(columns = units),
#'       cells_body(columns = units)
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_stub_indent_3.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-6
#'
#' @section Function Introduced:
#' `v0.7.0` (Aug 25, 2022)
#'
#' @export
tab_stub_indent <- function(
    data,
    rows,
    indent = "increase"
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)
  rlang::check_required(rows)
  # Capture the `rows` expression
  row_expr <- rlang::enquo(rows)

  # Get the `stub_df` data frame from `data`
  stub_df <- dt_stub_df_get(data = data)

  # Resolve the row numbers using `resolve_vars()`
  resolved_rows_idx <-
    resolve_rows_i(
      expr = !!row_expr,
      data = data
    )

  # Get existing indentation values
  indent_vals <- stub_df[stub_df$rownum_i %in% resolved_rows_idx, ][["indent"]]

  # Implement support for the `from_column()` helper function; when
  # used for the `indent` arg, a `gt_column` object is provided
  if (inherits(indent, "gt_column")) {

    # Obtain the underlying data table
    data_df <- dt_data_get(data = data)

    # Obtain a `resolved_column` from a column name in the table
    resolved_column <- resolve_cols_c(expr = indent[["column"]], data = data)

    indent_vals <- data_df[resolved_rows_idx, ][[resolved_column]]

    # Stop function if indentation values aren't numeric
    if (!is.numeric(indent_vals)) {
      cli::cli_abort("Values taken from a column must be numeric.")
    }

    # If a function supplied with `fn` in the `from_column()` output,
    # apply that function to any `indent_vals`
    if (!is.null(indent[["fn"]])) {

      fn <- indent[["fn"]]
      indent_vals <- fn(indent_vals)
    }

    # If there is an `na_value` provided along with `from_column()`, apply
    # that to the `indent_vals` vector
    if (!is.null(indent[["na_value"]])) {

      na_value <- indent[["na_value"]]

      # Stop function if the `na_value` isn't numeric
      if (!is.numeric(na_value)) {
        cli::cli_abort("The `na_value` provided must be numeric.")
      }

      indent_vals[is.na(indent_vals)] <- na_value
    }

    indent_vals <- abs(as.integer(indent_vals))

    indent_vals[indent_vals > 5] <- 5L

    indent_vals <- as.character(indent_vals)

  } else {

    for (i in seq_along(indent_vals)) {

      if (is.na(indent_vals[i])) {
        indent_val_i <- 0L
      } else if (grepl("^[0-9]$", indent_vals[i])) {
        indent_val_i <- as.integer(indent_vals[i])
      } else {
        indent_val_i <- indent_vals[i]
      }

      # Modify `indent_val_i` based on keyword directives
      if (is.character(indent)) {

        # Move `indent_val_i` up or down by one
        if (indent == "increase") {
          indent_val_i <- indent_val_i + 1L
        } else if (indent == "decrease") {
          indent_val_i <- indent_val_i - 1L
        }

        # Set hard boundaries on the indentation value (LB is `0`, UB is `5`)
        if (indent_val_i > 5) indent_val_i <- 5L
        if (indent_val_i < 0) indent_val_i <- 0L
      }

      # Modify `indent_val_i` using a fixed value
      if (
        is.numeric(indent) &&
        !is.na(indent) &&
        !is.infinite(indent)
      ) {

        # Stop function if `indent` value doesn't fall into the acceptable range
        check_number_whole(
          indent,
          min = 0,
          max = 5,
          allow_infinite = FALSE
        )

        # Coerce `indent` to an integer value
        indent_val_i <- as.integer(indent)
      }

      # Ensure that `indent_val_i` is assigned to `indent_vals` as
      # a character value
      indent_vals[i] <- as.character(indent_val_i)
    }
  }

  stub_df[stub_df$rownum_i %in% resolved_rows_idx, ][["indent"]] <- indent_vals

  dt_stub_df_set(data = data, stub_df = stub_df)
}
