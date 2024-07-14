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

# tab_row_group() --------------------------------------------------------------
#' Add a row group to a **gt** table
#'
#' @description
#'
#' We can create a row group from a collection of rows with `tab_row_group()`.
#' This requires specification of the rows to be included, either by supplying
#' row labels, row indices, or through use of a select helper function like
#' [starts_with()]. To modify the order of row groups, we can use
#' [row_group_order()].
#'
#' To set a default row group label for any rows not formally placed in a row
#' group, we can use a separate call to `tab_options(row_group.default_label =
#' <label>)`. If this is not done and there are rows that haven't been placed
#' into a row group (where one or more row groups already exist), those rows
#' will be automatically placed into a row group without a label.
#'
#' @inheritParams fmt_number
#'
#' @param label *Row group label text*
#'
#'   `scalar<character>` // **required**
#'
#'   The text to use for the row group label. We can optionally use [md()] or
#'   [html()] to style the text as Markdown or to retain HTML elements in the text.
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // **required**
#'
#'   The rows to be made components of the row group. We can supply a vector of
#'   row ID values within `c()`, a vector of row indices, or use select helpers
#'   (e.g. [starts_with()], [ends_with()], [contains()], [matches()],
#'   [num_range()], and [everything()]. We can also use expressions to filter
#'   down to the rows we need (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @param id *Row group ID*
#'
#'   `scalar<character>` // *default:* `label`
#'
#'   The ID for the row group. When accessing a row group through
#'   [cells_row_groups()] (when using [tab_style()] or [tab_footnote()]) the
#'   `id` value is used as the reference (and not the `label`). If an `id` is
#'   not explicitly provided here, it will be taken from the `label` value. It
#'   is advisable to set an explicit `id` value if you plan to access this cell
#'   in a later function call and the label text is complicated (e.g., contains
#'   markup, is lengthy, or both). Finally, when providing an `id` value you
#'   must ensure that it is unique across all ID values set for row groups (the
#'   function will stop if `id` isn't unique).
#'
#' @param others_label *[Deprecated] Label for default row group*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   This argument is deprecated. Instead use
#'   `tab_options(row_group.default_label = <label>)`.
#'
#' @param group *[Deprecated] The group label*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   This argument is deprecated. Instead use `label`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Using a subset of the [`gtcars`] dataset, let's create a simple **gt** table
#' with row labels (from the `model` column) inside of a stub. This eight-row
#' table begins with no row groups at all but with a single use of
#' `tab_row_group()`, we can specify a row group that will contain any rows
#' where the car model begins with a number.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(model, year, hp, trq) |>
#'   dplyr::slice(1:8) |>
#'   gt(rowname_col = "model") |>
#'   tab_row_group(
#'     label = "numbered",
#'     rows = matches("^[0-9]")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_row_group_1.png")`
#' }}
#'
#' This actually makes two row groups since there are row labels that don't
#' begin with a number. That second row group is a catch-all `NA` group, and it
#' doesn't display a label at all. Rather, it is set off from the other group
#' with a double line. This may be a preferable way to display the arrangement
#' of one distinct group and an 'others' or default group. If that's the case
#' but you'd like the order reversed, you can use [row_group_order()].
#'
#' ```r
#' gtcars |>
#'   dplyr::select(model, year, hp, trq) |>
#'   dplyr::slice(1:8) |>
#'   gt(rowname_col = "model") |>
#'   tab_row_group(
#'     label = "numbered",
#'     rows = matches("^[0-9]")
#'   ) |>
#'   row_group_order(groups = c(NA, "numbered"))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_row_group_2.png")`
#' }}
#'
#' Two more options include: (1) setting a default label for the 'others' group
#' (done through [tab_options()]), and (2) creating row groups until there are
#' no more unaccounted for rows. Let's try the first option in the next example:
#'
#' ```r
#' gtcars |>
#'   dplyr::select(model, year, hp, trq) |>
#'   dplyr::slice(1:8) |>
#'   gt(rowname_col = "model") |>
#'   tab_row_group(
#'     label = "numbered",
#'     rows = matches("^[0-9]")
#'   ) |>
#'   row_group_order(groups = c(NA, "numbered")) |>
#'   tab_options(row_group.default_label = "others")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_row_group_3.png")`
#' }}
#'
#' The above use of the `row_group.default_label` in [tab_options()] gets the
#' job done and provides a default label. One drawback is that the default/`NA`
#' group doesn't have an ID, so it can't as easily be styled with [tab_style()];
#' however, row groups have indices and the index for the `"others"` group here
#' is `1`.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(model, year, hp, trq) |>
#'   dplyr::slice(1:8) |>
#'   gt(rowname_col = "model") |>
#'   tab_row_group(
#'     label = "numbered",
#'     rows = matches("^[0-9]")
#'   ) |>
#'   row_group_order(groups = c(NA, "numbered")) |>
#'   tab_options(row_group.default_label = "others") |>
#'   tab_style(
#'     style = cell_fill(color = "bisque"),
#'     locations = cells_row_groups(groups = 1)
#'   ) |>
#'   tab_style(
#'     style = cell_fill(color = "lightgreen"),
#'     locations = cells_row_groups(groups = "numbered")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_row_group_4.png")`
#' }}
#'
#' Now let's try using `tab_row_group()` with our [`gtcars`]-based table such
#' that all rows are formally assigned to different row groups. We'll define two
#' row groups with the (Markdown-infused) labels `"**Powerful Cars**"` and
#' `"**Super Powerful Cars**"`. The distinction between the groups is whether
#' `hp` is lesser or greater than `600` (and this is governed by the expressions
#' provided to the `rows` argument).
#'
#' ```r
#' gtcars |>
#'   dplyr::select(model, year, hp, trq) |>
#'   dplyr::slice(1:8) |>
#'   gt(rowname_col = "model") |>
#'   tab_row_group(
#'     label = md("**Powerful Cars**"),
#'     rows = hp < 600,
#'     id = "powerful"
#'   ) |>
#'   tab_row_group(
#'     label = md("**Super Powerful Cars**"),
#'     rows = hp >= 600,
#'     id = "v_powerful"
#'   ) |>
#'   tab_style(
#'     style = cell_fill(color = "gray85"),
#'     locations = cells_row_groups(groups = "powerful")
#'   ) |>
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "gray95"),
#'       cell_text(size = "larger")
#'     ),
#'     locations = cells_row_groups(groups = "v_powerful")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_row_group_5.png")`
#' }}
#'
#' Setting the `id` values for each of the row groups makes things easier since
#' you will have clean, markup-free ID values to reference in later calls (as
#' was done with the [tab_style()] invocations in the example above). The use of
#' the [md()] helper function makes it so that any Markdown provided for the
#' `label` of a row group is faithfully rendered.
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-4
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
tab_row_group <- function(
    data,
    label,
    rows,
    id = label,
    others_label = NULL,
    group = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  arrange_groups_vars <- dt_row_groups_get(data = data)

  if (!missing(group)) {

    if (missing(label)) {
      label <- group
    }

    cli::cli_warn(c(
      "Since gt v0.3.0 the `group` argument has been deprecated.",
      "*" = "Use the `label` argument to specify the group label."
    ),
    .frequency = "regularly",
    .frequency_id = "tab_row_group_group_arg_deprecated"
    )
  }

  # Warn user about `others_label` deprecation
  if (!is.null(others_label)) {

    data <-
      tab_options(
        data = data,
        row_group.default_label = others_label
      )

    cli::cli_warn(c(
      "Since gt v0.3.0 the `others_label` argument has been deprecated.",
      "*" = "Use `tab_options(row_group.default_label = <label>)` to set
      this label."
    ),
    .frequency = "regularly",
    .frequency_id = "tab_row_group_others_label_arg_deprecated"
    )

    if (missing(label) && missing(rows) && missing(id)) {
      return(data)
    }
  }

  # Check `id` against existing `id` values and stop if necessary
  check_row_group_id_unique(data = data, row_group_id = id)

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

  stub_df <- dt_stub_df_get(data = data)

  # If the label is marked as HTML or Markdown and there's no `id` set
  # (assumed when `id` is equal to `label`), strip away HTML tags in the
  # `id` value
  if (id == label && (inherits(id, "html") || inherits(id, "from_markdown"))) {
    id <- remove_html(as.character(id))
  }

  # Place the `label` in the `groupname` column `stub_df`
  stub_df[resolved_rows_idx, "group_label"] <- list(list(label))
  stub_df[resolved_rows_idx, "group_id"] <- as.character(id)

  data <- dt_stub_df_set(data = data, stub_df = stub_df)

  # Set the `_row_groups` vector here with the group id; new groups will
  # be placed at the front, pushing down `NA` (the 'Others' group)
  arrange_groups_vars <- c(id, stats::na.omit(arrange_groups_vars))
  arrange_groups_vars <- unique(arrange_groups_vars)
  arrange_groups_vars <- arrange_groups_vars[arrange_groups_vars %in% stub_df$group_id]

  if (dt_stub_groupname_has_na(data = data)) {
    arrange_groups_vars <- c(arrange_groups_vars, NA_character_)
  }

  if (length(arrange_groups_vars) == 1 && is.na(arrange_groups_vars)) {
    arrange_groups_vars <- character(0L)
  }

  dt_row_groups_set(
    data = data,
    row_groups = arrange_groups_vars
  )
}
# TODO: (#729) add tab_row_group_order() maybe under row_group_when()?

# row_group_order() ------------------------------------------------------------
#' Modify the ordering of any row groups
#'
#' @description
#'
#' We can modify the display order of any row groups in a **gt** object with
#' `row_group_order()`. The `groups` argument takes a vector of row group ID values.
#' After this function is invoked, the row groups will adhere to this revised
#' ordering. It isn't necessary to provide all row ID values in `groups`, rather,
#' what is provided will assume the specified ordering at the top of the table
#' and the remaining row groups will follow in their original ordering.
#'
#' @inheritParams cols_align
#'
#' @param groups *Specification of row group IDs*
#'
#'   `vector<character>` // **required**
#'
#'   A character vector of row group ID values corresponding to the revised
#'   ordering. While this vector must contain valid group ID values, it is not
#'   required to have all of the row group IDs within it; any omitted values
#'   will be added to the end while preserving the original ordering.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Let's use [`exibble`] to create a **gt** table with a stub and with row
#' groups. We can modify the order of the row groups with `row_group_order()`,
#' specifying the new ordering in `groups`.
#'
#' ```r
#' exibble |>
#'   dplyr::select(char, currency, row, group) |>
#'   gt(
#'     rowname_col = "row",
#'     groupname_col = "group"
#'   ) |>
#'   row_group_order(groups = c("grp_b", "grp_a"))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_row_group_order_1.png")`
#' }}
#'
#' @family row addition/modification functions
#' @section Function ID:
#' 6-3
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
row_group_order <- function(
    data,
    groups
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Stop function if `groups` is not a `character` vector
  if (!inherits(groups, "character")) {
    cli::cli_abort(
      "The values provided for `groups` must be a character vector."
    )
  }

  # Get the current arrangement of the row groups
  arrange_groups <- dt_row_groups_get(data = data)

  # Stop function if any value in `groups` doesn't match a group name
  if (!all(groups %in% arrange_groups)) {

    cli::cli_abort(c(
      "All values given as `groups` must correspond to `group_id` values.",
      "*" = "The following `group_id` values can be
      used {str_catalog(arrange_groups)}."
    ))
  }

  # Arrange groups in the new order
  groups <- c(unique(groups), base::setdiff(arrange_groups, unique(groups)))

  # Create and store a list of row groups in the intended ordering
  dt_row_groups_set(
    data = data,
    row_groups = groups
  )
}

# row_group() ------------------------------------------------------------------
#' Select helper for targeting the row group column
#'
#' @description
#'
#' Should you need to target only the row group column for column-width
#' declarations (i.e., when `row_group_as_column = TRUE` is set in the initial
#' [gt()] call), the `row_group()` select helper can be used. This shorthand
#' makes it so you don't have to use the name of the column that was selected
#' as the row group column.
#'
#' @return A character vector of class `"row_group_column"`.
#'
#' @section Examples:
#'
#' Create a tibble that has a `row` column (values from `1` to `6`), a `group`
#' column, and a `vals` column (containing the same values as in `row`).
#'
#' ```r
#' tbl <-
#'   dplyr::tibble(
#'     row = 1:6,
#'     group = c(rep("Group A", 3), rep("Group B", 3)),
#'     vals = 1:6
#'   )
#' ```
#'
#' Create a **gt** table with a two-column stub (incorporating the `row` and
#' `group` columns in that). We can set the widths of the two columns in the
#' stub with the `row_group()` and [stub()] helpers on the LHS of the
#' expressions passed to [cols_width()].
#'
#' ```r
#' tbl |>
#'   gt(
#'     rowname_col = "row",
#'     groupname_col = "group",
#'     row_group_as_column = TRUE
#'   ) |>
#'   fmt_roman(columns = stub()) |>
#'   cols_width(
#'     row_group() ~ px(200),
#'     stub() ~ px(100),
#'     vals ~ px(50)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_row_group_1.png")`
#' }}
#'
#' @family helper functions
#' @section Function ID:
#' 8-11
#'
#' @section Function Introduced:
#' `v0.11.0`
#'
#' @export
row_group <- function() {
  x <- "::row_group::"
  class(x) <- "row_group_column"
  x
}


# Row groups helpers -----------------------------------------------------------

check_row_group_id_unique <- function(data, row_group_id, call = rlang::caller_env()) {

  stub_df <- dt_stub_df_get(data = data)

  existing_ids <- stub_df$group_id

  if (row_group_id %in% existing_ids) {

    cli::cli_abort(c(
      "The row group {.arg id} provided ({.val {row_group_id}}) is not unique.",
      "*" = "Provide a unique ID value for this row group"
    ),
    call = call
    )
  }
}
