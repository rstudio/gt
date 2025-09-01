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


# tab_style_body() -------------------------------------------------------------
#' Target cells in the table body and style accordingly
#'
#' @description
#'
#' With `tab_style_body()` we can target cells through value, regex, and
#' custom matching rules and apply styles to them and their surrounding context
#' (i.e., styling an entire row or column wherein the match is found). Just as
#' with the general [tab_style()] function, this function is focused on the
#' application of styles for HTML output only (as such, other output formats
#' will ignore all `tab_style()` calls).
#'
#' With the collection of `cell_*()` helper functions available in **gt**, we
#' can modify:
#'
#' - the background color of the cell ([cell_fill()]: `color`)
#' - the cell's text color, font, and size ([cell_text()]: `color`, `font`,
#' `size`)
#' - the text style ([cell_text()]: `style`), enabling the use of italics or
#' oblique text.
#' - the text weight ([cell_text()]: `weight`), allowing the use of thin to
#' bold text (the degree of choice is greater with variable fonts)
#' - the alignment and indentation of text ([cell_text()]: `align` and
#' `indent`)
#' - the cell borders ([cell_borders()])
#'
#' @inheritParams sub_missing
#'
#' @param style *Style declarations*
#'
#'   `<style expressions>` // **required**
#'
#'   The styles to use for the targeted cells. [cell_text()], [cell_fill()],
#'   and [cell_borders()] can be used here to more easily generate valid styles.
#'   If using more than one helper function to define styles, all calls must be
#'   enclosed in a [list()]. Custom CSS declarations can be used for HTML output
#'   by including a [css()]-based statement as a list item.
#'
#' @param values *Values for targeting*
#'
#'   `vector<character|numeric|integer>` // *default:* `NULL` (`optional`)
#'
#'   The specific value or values that should be targeted for styling. If
#'   `pattern` is also supplied then `values` will be ignored.
#'
#' @param pattern *Regex pattern for targeting*
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
#'   A supplied function that operates on each cell of each column specified
#'   through `columns` and `rows`. The function should be fashioned such that a
#'   single logical value is returned. If either of `values` or `pattern` is
#'   also supplied, `fn` will take precedence.
#'
#' @param targets *Styling targets*
#'
#'   `vector<character>` // *default:* `"cell"`
#'
#'   A vector of styling target keywords to contain or expand the target of each
#'   cell. By default, this is a vector just containing `"cell"`. However, the
#'   keywords `"row"` and `"column"` may be used separately or in combination to
#'   style the target cells' associated rows or columns.
#'
#' @param extents *Styling extents*
#'
#'   `vector<character>` // *default:* `"body"`
#'
#'   A vector of locations to project styling. By default, this is a vector just
#'   containing `"body"`, whereby styled rows or columns (facilitated via
#'   inclusion of the `"row"` and `"column"` keywords in `targets`) will not
#'   permeate into the stub. The additional keyword `"stub"` may be used alone
#'   or in conjunction with `"body"` to project or expand the styling into the
#'   stub.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use `exibble` to create a **gt** table with a stub and row groups. This
#' contains an assortment of values that could potentially undergo some styling
#' via `tab_style_body()`.
#'
#' ```r
#' gt_tbl <-
#'   exibble |>
#'   gt(
#'     rowname_col = "row",
#'     groupname_col = "group"
#'   )
#' ```
#'
#' Cells in the table body can be styled through specification of literal values
#' in the `values` argument of `tab_style_body()`. It's okay to search for
#' numerical, character, or logical values across all columns. Let's target the
#' values `49.95` and `33.33` and style those cells with an orange fill.
#'
#' ```r
#' gt_tbl |>
#'   tab_style_body(
#'     style = cell_fill(color = "orange"),
#'     values = c(49.95, 33.33)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_body_1.png")`
#' }}
#'
#' Multiple styles can be combined in a `list`, here's an example of that using
#' the same cell targets:
#'
#' ```r
#' gt_tbl |>
#'   tab_style_body(
#'     style = list(
#'       cell_text(font = google_font("Inter"), color = "white"),
#'       cell_fill(color = "red"),
#'       cell_borders(
#'         sides = c("left", "right"),
#'         color = "steelblue",
#'         weight = px(4)
#'       )
#'     ),
#'     values = c(49.95, 33.33)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_body_2.png")`
#' }}
#'
#' You can opt to color entire rows or columns (or both, should you want to)
#' with those specific keywords in the `targets` argument. For the `49.95` value
#' we will style the entire row and with `33.33` the entire column will get the
#' same styling.
#'
#' ```r
#' gt_tbl |>
#'   tab_style_body(
#'     style = cell_fill(color = "lightblue"),
#'     values = 49.95,
#'     targets = "row"
#'   ) |>
#'   tab_style_body(
#'     style = cell_fill(color = "lightblue"),
#'     values = 33.33,
#'     targets = "column"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_body_3.png")`
#' }}
#'
#' In a minor variation to the prior example, it's possible to extend the
#' styling to other locations, or, entirely project the styling elsewhere. This
#' is done with the `extents` argument. Valid keywords that can be included in
#' the vector are: `"body"` (the default) and `"stub"`. Let's take the previous
#' example and extend the styling of the row into the stub.
#'
#' ```r
#' gt_tbl |>
#'   tab_style_body(
#'     style = cell_fill(color = "lightblue"),
#'     values = 49.95,
#'     targets = "row",
#'     extents = c("body", "stub")
#'   ) |>
#'   tab_style_body(
#'     style = cell_fill(color = "lightblue"),
#'     values = 33.33,
#'     targets = "column"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_body_4.png")`
#' }}
#'
#' We can also use the `pattern` argument to target cell values in
#' `character`-based columns. The `"fctr"` column is skipped because it is in
#' fact a factor-based column.
#'
#' ```r
#' gt_tbl |>
#'   tab_style_body(
#'     style = cell_fill(color = "green"),
#'     pattern = "ne|na"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_body_5.png")`
#' }}
#'
#' For the most flexibility in targeting, it's best to use the `fn` argument.
#' The function you give to `fn` will be invoked separately on all cells so the
#' `columns` argument of `tab_style_body()` might be useful to limit which cells
#' should be evaluated. For this next example, the supplied function should only
#' be used on numeric values and we can make sure of this by using `columns =
#' where(is.numeric)`.
#'
#' ```r
#' gt_tbl |>
#'   tab_style_body(
#'     columns = where(is.numeric),
#'     style = cell_fill(color = "pink"),
#'     fn = function(x) x >= 0 && x < 50
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_body_6.png")`
#' }}
#'
#' Styling every `NA` value in a table is also easily accomplished with the `fn`
#' argument by way of `is.na()`.
#'
#' ```r
#' gt_tbl |>
#'   tab_style_body(
#'     style = cell_text(color = "red3"),
#'     fn = function(x) is.na(x)
#'   ) |>
#'   sub_missing(missing_text = "Not Available")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_body_7.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-11
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @export
tab_style_body <- function(
  data,
  style,
  columns = everything(),
  rows = everything(),
  values = NULL,
  pattern = NULL,
  fn = NULL,
  targets = "cell",
  extents = "body"
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  targets <-
    rlang::arg_match(
      targets,
      values = c("cell", "row", "column"),
      multiple = TRUE
    )

  extents <-
    rlang::arg_match(
      extents,
      values = c("body", "stub"),
      multiple = TRUE
    )

  if (is.null(values) && is.null(pattern) && is.null(fn)) {
    cli::cli_abort(
      "One of `values`, `pattern`, or `fn` must be supplied to {.fn sub_values}."
    )
  }

  # Validate that the `fn` object is a function
  if (!is.null(fn) && !rlang::is_function(fn)) {
    cli::cli_abort(
     "{.arg fn} must be a function."
    )
  }

  data_tbl <- dt_data_get(data = data)

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

  # For every target hit, produce a `tab_style()` statement and set it
  # to the object
  for (col in resolved_columns) {

    # Only perform style generation if the column is present and if there
    # are any rows to consider
    if (col %in% colnames(data_tbl) && length(resolved_rows_idx) > 0) {

      x <- data_tbl[[col]]

      if (!is.null(fn)) {

        vec_logical <- vapply(x, FUN.VALUE = logical(1), FUN = fn)

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

        vec_logical[which(is.na(vec_logical))] <- FALSE

        x_idx <- which(vec_logical)

      } else if (!is.null(pattern)) {

        x_idx <- which(!is.na(x) & is.character(x) & str_has_match(x, pattern = pattern))

      } else {

        x_idx <- which(!is.na(x) & x %in% values)
      }

      x_idx <- base::intersect(x_idx, resolved_rows_idx)

      for (row in x_idx) {

        locations_list <-
          list(
            if ("cell" %in% targets && "body" %in% extents) cells_body(columns = {{ col }}, rows = {{ row }}),
            if ("cell" %in% targets && "stub" %in% extents) cells_stub(rows = {{ row }}),
            if ("row" %in% targets && "body" %in% extents) cells_body(rows = {{ row }}),
            if ("row" %in% targets && "stub" %in% extents) cells_stub(rows = {{ row }}),
            if ("column" %in% targets && "body" %in% extents) cells_body(columns = {{ col }})
          )

        # Remove NULL elements from `locations_list`
        locations_list <- Filter(Negate(is.null), locations_list)

        data <-
          tab_style(
            data = data,
            style = style,
            locations = locations_list
          )
      }
    }
  }

  data
}
