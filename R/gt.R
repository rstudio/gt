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


# gt() -------------------------------------------------------------------------
#' Create a **gt** table object
#'
#' @description
#'
#' The `gt()` function creates a **gt** table object when provided with table
#' data. Using this function is the first step in a typical **gt** workflow.
#' Once we have the **gt** table object, we can perform styling transformations
#' before rendering to a display table of various formats.
#'
#' @details
#'
#' There are a few data ingest options we can consider at this stage. We can
#' choose to create a table stub containing row labels through the use of the
#' `rowname_col` argument. Further to this, stub row groups can be created with
#' the `groupname_col` argument. Both arguments take the name of a column in the
#' input table data. Typically, the data in the `groupname_col` column will
#' consist of categorical text whereas the data in the `rowname_col` column will
#' contain unique labels (could be unique across the entire table or unique
#' within the different row groups).
#'
#' Row groups can also be created by passing a `grouped_df` to `gt()` by using
#' [dplyr::group_by()] on the table data. In this way, two or more
#' columns of categorical data can be used to make row groups. The
#' `row_group.sep` argument allows for control in how the row group labels will
#' appear in the display table.
#'
#' @param data *Input data table*
#'
#'   `obj:<data.frame>|obj:<tbl_df>` // **required**
#'
#'   A `data.frame` object or a tibble (`tbl_df`).
#'
#' @param rowname_col *Column(s) for row names/labels from `data`*
#'
#'   `vector<character>` // *default:* `NULL` (`optional`)
#'
#'   The column name(s) in the input `data` table to use as row labels to be
#'   placed in the table stub. If multiple column names are provided, they will
#'   create a hierarchical stub layout where values from the leftmost column form
#'   the highest level of the hierarchy, proceeding to individual row identifiers
#'   in the rightmost column. If the `rownames_to_stub` option is `TRUE` then any
#'   column name provided to `rowname_col` will be ignored.
#'
#' @param groupname_col *Column for group names/labels from `data`*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   The column name in the input `data` table to use as group labels for
#'   generation of row groups. If the input `data` table has the `grouped_df`
#'   class (through use of [dplyr::group_by()] or associated `group_by*()`
#'   functions) then any input here is ignored.
#'
#' @param omit_na_group *Omit rows with NA in `groupname_col` from grouping*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   Should rows with `NA` values in the `groupname_col` be excluded from row
#'   group assignment? By default (`FALSE`), rows with `NA` in `groupname_col`
#'   will be assigned to a group called `"NA"`. When set to `TRUE`, rows with
#'   `NA` values will appear as ungrouped rows in the table body. This is useful
#'   when you want to include header or separator rows that shouldn't belong to
#'   any row group.
#'
#' @param process_md *Process Markdown in `rowname_col` and `groupname_col`*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   Should the contents of the `rowname_col` and `groupname_col` be interpreted
#'   as Markdown? By default this won't happen.
#'
#' @param caption *Table caption text*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional table caption to use for cross-referencing in R Markdown,
#'   Quarto, or **bookdown**.
#'
#' @param rownames_to_stub *Use data frame row labels in the stub*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   An option to take rownames from the input `data` table (should they be
#'   available) as row labels in the display table stub.
#'
#' @param row_group_as_column *Mode for displaying row group labels in the stub*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   An option that alters the display of row group labels. By default this is
#'   `FALSE` and row group labels will appear in dedicated rows above their
#'   respective groups of rows. If `TRUE` row group labels will occupy a
#'   secondary column in the table stub.
#'
#' @param auto_align *Automatic alignment of column values and labels*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   Optionally have column data be aligned depending on the content contained
#'   in each column of the input `data`. Internally, this calls
#'   `cols_align(align = "auto")` for all columns.
#'
#' @param id *The table ID*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   By default (with `NULL`) this will be a random, ten-letter ID as generated
#'   by using [random_id()]. A custom table ID can be used here by
#'   providing a character value.
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `getOption("gt.locale")` (`optional`)
#'
#'   An optional locale identifier that can be set as the default locale for all
#'   functions that take a `locale` argument. Examples include `"en"` for
#'   English (United States) and `"fr"` for French (France). We can call
#'   [info_locales()] as a useful reference for all of the locales that are supported.
#'   If set, `options(gt.locale)` is also consulted.
#'
#' @param row_group.sep *Separator text for multiple row group labels*
#'
#'   `scalar<character>` // *default:* `getOption("gt.row_group.sep", " - ")`
#'
#'   The separator to use between consecutive group names (a possibility when
#'   providing `data` as a `grouped_df` with multiple groups) in the displayed
#'   row group label.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Let's use the [`exibble`] dataset for the next few examples, we'll learn how
#' to make simple **gt** tables with the `gt()` function. The most basic thing
#' to do is to just use `gt()` with the dataset as the input.
#'
#' ```r
#' exibble |> gt()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_gt_1.png")`
#' }}
#'
#' This dataset has the `row` and `group` columns. The former contains unique
#' values that are ideal for labeling rows, and this often happens in what is
#' called the 'stub' (a reserved area that serves to label rows). With the
#' `gt()` function, we can immediately place the contents of the `row` column
#' into the stub column. To do this, we use the `rowname_col` argument with the
#' name of the column to use in quotes.
#'
#' ```r
#' exibble |> gt(rowname_col = "row")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_gt_2.png")`
#' }}
#'
#' This sets up a table with a stub, the row labels are placed within the stub
#' column, and a vertical dividing line has been placed on the right-hand side.
#'
#' The `group` column can be used to divide the rows into discrete groups.
#' Within that column, we see repetitions of the values `grp_a` and `grp_b`.
#' These serve both as ID values and the initial label for the groups. With the
#' `groupname_col` argument in `gt()`, we can set up the row groups immediately
#' upon creation of the table.
#'
#' ```r
#' exibble |>
#'   gt(
#'     rowname_col = "row",
#'     groupname_col = "group"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_gt_3.png")`
#' }}
#'
#' If you'd rather perform the set up of row groups later (i.e., not in the
#' `gt()` call), this is possible with [tab_row_group()] (and [row_group_order()]
#' can help with the arrangement of row groups).
#'
#' One more thing to consider with row groups is their layout. By default, row
#' group labels reside in separate rows the appear above the group. However,
#' we can use `row_group_as_column = TRUE` to put the row group labels within a
#' secondary column within the table stub.
#'
#' ```r
#' exibble |>
#'   gt(
#'     rowname_col = "row",
#'     groupname_col = "group",
#'     row_group_as_column = TRUE
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_gt_4.png")`
#' }}
#'
#' This could be done later if need be, and using
#' `tab_options(row_group.as_column = TRUE)` would be the way to do it outside
#' of the `gt()` call.
#'
#' Some datasets have rownames built in; `mtcars` famously has the car model
#' names as the rownames. To use those rownames as row labels in the stub, the
#' `rownames_to_stub = TRUE` option will prove to be useful.
#'
#' ```r
#' head(mtcars, 10) |> gt(rownames_to_stub = TRUE)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_gt_5.png")`
#' }}
#'
#' By default, values in the body of a **gt** table (and their column labels)
#' are automatically aligned. The alignment is governed by the types of values
#' in a column. If you'd like to disable this form of auto-alignment, the
#' `auto_align = FALSE` option can be taken.
#'
#' ```r
#' exibble |> gt(rowname_col = "row", auto_align = FALSE)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_gt_6.png")`
#' }}
#'
#' What you'll get from that is center-alignment of all table body values and
#' all column labels. Note that row labels in the stub are still
#' left-aligned; and `auto_align` has no effect on alignment within the table
#' stub.
#'
#' However which way you generate the initial **gt** table object, you can use
#' it with a huge variety of functions in the package to further customize the
#' presentation. Formatting body cells is commonly done with the family of
#' formatting functions (e.g., [fmt_number()], [fmt_date()], etc.). The package
#' supports formatting with internationalization ('i18n' features) and so
#' locale-aware functions come with a `locale` argument. To avoid having to use
#' that argument repeatedly, the `gt()` function has its own `locale` argument.
#' Setting a locale in that will make it available globally. Here's an example
#' of how that works in practice when setting `locale = "fr"` in `gt()` and
#' using formatting functions:
#'
#' ```r
#' exibble |>
#'   gt(
#'     rowname_col = "row",
#'     groupname_col = "group",
#'     locale = "fr"
#'   ) |>
#'   fmt_number() |>
#'   fmt_date(
#'     columns = date,
#'     date_style = "yMEd"
#'   ) |>
#'   fmt_datetime(
#'     columns = datetime,
#'     format = "EEEE, MMMM d, y",
#'     locale = "en"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_gt_7.png")`
#' }}
#'
#' In this example, [fmt_number()] and [fmt_date()] understand that the locale
#' for this table is `"fr"` (French), so the appropriate formatting for that
#' locale is apparent in the `num`, `currency`, and `date` columns. However in
#' [fmt_datetime()], we explicitly use the `"en"` (English) locale. This
#' overrides the `"fr"` default set for this table and the end result is
#' dates formatted with the English locale in the `datetime` column.
#'
#' @family table creation functions
#' @section Function ID:
#' 1-1
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
gt <- function(
    data,
    rowname_col = NULL,
    groupname_col = dplyr::group_vars(data),
    omit_na_group = FALSE,
    process_md = FALSE,
    caption = NULL,
    rownames_to_stub = FALSE,
    row_group_as_column = FALSE,
    auto_align = TRUE,
    id = NULL,
    locale = getOption("gt.locale"),
    row_group.sep = getOption("gt.row_group.sep", " - ")
) {

  # Stop function if the supplied `id` doesn't conform
  # to character(1) input or isn't NULL
  validate_table_id(id)

  # Stop function if `locale` does not have a valid value
  validate_locale(locale = locale)

  if (rownames_to_stub) {
    # Just a column name that's unlikely to collide with user data
    rowname_col <- "__GT_ROWNAME_PRIVATE__"
  }

  # Auto-detect rowname column if not specified and a "rowname" column exists
  if (is.null(rowname_col) && !rownames_to_stub && "rowname" %in% names(data)) {
    rowname_col <- "rowname"
  }

  if (length(groupname_col) == 0) {
    groupname_col <- NULL
  }

  # Stop function if `rowname_col` and `groupname_col`
  # have the same string values
  if (
    !is.null(rowname_col) &&
    !is.null(groupname_col) &&
    any(rowname_col %in% groupname_col)
  ) {
    cli::cli_abort(c(
      "The value(s) {.val {intersect(rowname_col, groupname_col)}} appear(s) in both `rowname_col` and `groupname_col`.",
      "*" = "These arguments must not have any values in common."
    ))
  }

  # Stop function if any `rowname_col` values don't exist in the data
  if (!is.null(rowname_col) && !rownames_to_stub) {
    data_names <- names(data)
    missing_cols <- setdiff(rowname_col, data_names)
    if (length(missing_cols) > 0) {
      cli::cli_abort(c(
        "The column(s) {.val {missing_cols}} specified in `rowname_col` do not exist in the data.",
        "*" = "Available columns are: {.val {data_names}}"
      ))
    }
  }

  # Initialize the main objects
  rownames_to_column <- if (rownames_to_stub) rowname_col[1] else NA_character_
  data <-
    dt_data_init(
      data = list(),
      data_tbl = data,
      rownames_to_column = rownames_to_column
    )

  data <- dt_boxhead_init(data = data)
  data <-
    dt_stub_df_init(
      data = data,
      rowname_col = rowname_col,
      groupname_col = groupname_col,
      omit_na_group = omit_na_group,
      row_group.sep = row_group.sep,
      process_md = process_md
    )
  data <- dt_row_groups_init(data = data)
  data <- dt_heading_init(data = data)
  data <- dt_spanners_init(data = data)
  data <- dt_stubhead_init(data = data)
  data <- dt_footnotes_init(data = data)
  data <- dt_source_notes_init(data = data)
  data <- dt_formats_init(data = data)
  data <- dt_substitutions_init(data = data)
  data <- dt_styles_init(data = data)
  data <- dt_summary_init(data = data)
  data <- dt_summary_cols_init(data = data)
  data <- dt_options_init(data = data)
  data <- dt_transforms_init(data = data)
  data <- dt_locale_init(data = data, locale = locale)
  data <- dt_has_built_init(data = data)

  # Add any user-defined table ID to the `table_id` parameter
  # (if NULL, the default setting will generate a random ID)
  if (!is.null(id)) {

    data <-
      dt_options_set_value(
        data = data,
        option = "table_id",
        value = id
      )
  }

  # If taking the option to display row group labels as a column
  # in the stub (with `row_group_as_column = TRUE`) set that option
  if (row_group_as_column) {

    data <-
      dt_options_set_value(
        data = data,
        option = "row_group_as_column",
        value = TRUE
      )
  }

  # Add any user-defined table caption to the `table_caption` parameter
  if (!is.null(caption)) {

    data <-
      dt_options_set_value(
        data = data,
        option = "table_caption",
        value = caption
      )
  }

  # Apply the `gt_tbl` class to the object while also
  # keeping the `data.frame` class
  class(data) <- c("gt_tbl", class(data))

  # If automatic alignment of values is to be done, call
  # the `cols_align()` function on data
  if (auto_align) {

    data <- cols_align(data = data, align = "auto")

    # Determine if there is a stub column
    stub_var <- dt_boxhead_get_var_stub(data = data)

    # If there is a stub, tweak the alignment by checking whether the values
    # are predominantly number-like; this will generally get the correct
    # appearance for either a row-label-type stub or an numeric-index-type stub
    if (!any(is.na(stub_var))) {

      data_tbl <- dt_data_get(data = data)

      # For multiple stub columns, check only the rightmost (primary) column for numeric alignment
      primary_stub_var <- stub_var[length(stub_var)]
      col_vals <- data_tbl[[primary_stub_var]]

      res <- grepl("^[0-9 -/:\\.]*$", col_vals[!is.na(col_vals)])

      if (length(res) > 0 && all(res)) {

        data <-
          dt_boxhead_edit(
            data = data,
            var = primary_stub_var,
            column_align = "right"
          )
      }
    }
  }

  if (
    process_md &&
    !is.null(rowname_col) &&
    all(rowname_col %in% colnames(dt_data_get(data = data)))
  ) {
    data <- fmt_markdown(data = data, columns = rowname_col)
  }

  data
}
