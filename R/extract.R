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


# extract_body() ---------------------------------------------------------------
#' Extract the table body from a **gt** object
#'
#' @description
#'
#' We can extract the body of a **gt** table, even at various stages of its
#' rendering, from a `gt_tbl` object using `extract_body()`. By default, the
#' data frame returned will have gone through all of the build stages but we
#' can intercept the table body after a certain build stage. Here are the eight
#' different build stages and some notes about each:
#'
#' 1. `"init"`: the body table is initialized here, entirely with `NA` values.
#' It's important to note that all columns of the are of the `character` type in
#' this first stage. And all columns remain in the same order as the input data
#' table.
#'
#' 2. `"fmt_applied"`: Any cell values that have had formatting applied to them
#' are migrated to the body table. All other cells remain as `NA` values.
#' Depending on the `output` type, the formatting may also be different.
#'
#' 3. `"sub_applied"`: Any cell values that have had substitution functions
#' applied to them (whether or not they were previously formatted) are migrated
#' to the body table or modified in place (if formatted). All cells that had
#' neither been formatted nor undergone substitution remain as `NA` values.
#'
#' 4. `"unfmt_included"`: All cells that either didn't have any formatting or
#' any substitution operations applied are migrated to the body table. `NA`
#' values now become the string `"NA"`, so, there aren't any true missing values
#' in this body table.
#'
#' 5. `"cols_merged"`: The result of column-merging operations (through
#' [cols_merge()] and related functions) is materialized here. Columns that were
#' asked to be hidden will be present here (i.e., hiding columns doesn't remove
#' them from the body table).
#'
#' 6. `"body_reassembled"`: Though columns do not move positions rows can move
#' to different positions, and this is usually due to migration to different row
#' groups. At this stage, rows will be in the finalized order that is seen in
#' the associated display table.
#'
#' 7. `"text_transformed"`: Various `text_*()` functions in **gt** can operate
#' on body cells (now fully formatted at this stage) and return transformed
#' character values. After this stage, the effects of those functions are
#' apparent.
#'
#' 8. `"footnotes_attached"`: Footnote marks are attached to body cell values
#' (either on the left or right of the content). This stage performs said
#' attachment.
#'
#' @inheritParams fmt_number
#'
#' @param build_stage *The build stage of the formatted R data frame*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   When a **gt** undergoes rendering, the body of the table proceeds through
#'   several build stages. Providing a single stage name will yield a data frame
#'   that has been extracted after completed that stage. Here are the build
#'   stages in order: (1) `"init"`, (2) `"fmt_applied"`, (3) `"sub_applied"`,
#'   (4) `"unfmt_included"`, (5) `"cols_merged"`, (6) `"body_reassembled"`, (7)
#'   `"text_transformed"`, and (8) `"footnotes_attached"`. If not supplying a
#'   value for `build_stage` then the entire build for the table body (i.e., up
#'   to and including the `"footnotes_attached"` stage) will be performed before
#'   returning the data frame.
#'
#' @param incl_hidden_cols *Should hidden columns be included?*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   Certain columns may be hidden from final display via [cols_hide()]. By
#'   default, those columns won't be part of the extracted data frame. However,
#'   we can choose to include them by using `incl_hidden_cols = TRUE`.
#'
#' @param incl_stub_cols *Should stub columns be included?*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   Any stub columns in the **gt** object (which may consist of a grouping
#'   column and a column for row labels) are included in the extracted data for
#'   clarity but clearly marked with the names `"::group_id::"` and
#'   `"::rowname::"`. We can exclude them by setting `incl_stub_cols = FALSE`.
#'
#' @inheritParams rlang::args_dots_empty
#'
#' @param output *Output format*
#'
#'   `singl-kw:[html|latex|rtf|word]` // *default:* `"html"`
#'
#'   The output format of the resulting data frame. This can either be
#'   `"html"` (the default), `"latex"`, `"rtf"`, or `"word"`.
#'
#' @return A data frame or tibble object containing the table body.
#'
#' @section Examples:
#'
#' Use a modified version of [`sp500`] the dataset to create a **gt** table with
#' row groups and row labels. Formatting will be applied to the date- and
#' currency-based columns.
#'
#' ```{r}
#' gt_tbl <-
#'   sp500 |>
#'   dplyr::filter(date >= "2015-01-05" & date <= "2015-01-16") |>
#'   dplyr::arrange(date) |>
#'   dplyr::mutate(week = paste0("W", strftime(date, format = "%V"))) |>
#'   dplyr::select(-adj_close, -volume) |>
#'   gt(
#'     rowname_col = "date",
#'     groupname_col = "week"
#'   ) |>
#'   fmt_date(columns = date, date_style = "day_month_year") |>
#'   fmt_currency(columns = c(open, high, low, close)) |>
#'   cols_hide(columns = c(high, low))
#'
#' ```
#'
#' ```r
#' gt_tbl
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_extract_body_1.png")`
#' }}
#'
#' Using `extract_body()` on the **gt** object (`gt_tbl`) will provide us with
#' a tibble that contains the fully built data cells for the `output` context
#' (in this case, `"html"`).
#'
#' ```{r}
#' extract_body(gt_tbl)
#' ```
#'
#' To provide us with a better frame of reference, the grouping and row label
#' values are provided as the first columns in the returned output. We could
#' suppress those in the output by setting `incl_stub_cols = FALSE`.
#'
#' ```{r}
#' extract_body(gt_tbl, incl_stub_cols = FALSE)
#' ```
#'
#' The `high` and `low` columns were hidden via [`cols_hide()`] and so they
#' won't be shown in the returned data unless we use `incl_hidden_cols = TRUE`.
#'
#' ```{r}
#' extract_body(
#'   gt_tbl,
#'   incl_stub_cols = FALSE,
#'   incl_hidden_cols = TRUE
#' )
#' ```
#'
#' @family table export functions
#' @section Function ID:
#' 13-7
#'
#' @section Function Introduced:
#' `v0.10.0` (October 7, 2023)
#'
#' @export
extract_body <- function(
    data,
    build_stage = NULL,
    incl_hidden_cols = FALSE,
    incl_stub_cols = TRUE,
    ...,
    output = c("html", "latex", "rtf", "word", "grid")
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # If `build_stage` is given a keyword value, check that value is valid
  if (!is.null(build_stage)) {

    rlang::arg_match0(
      build_stage,
      values = c(
        "init", "fmt_applied", "sub_applied", "unfmt_included", "cols_merged",
        "body_reassembled", "text_transformed", "footnotes_attached"
      )
    )
  }

  # Ensure that `output` is matched correctly to one option
  output <-
    rlang::arg_match0(
      output,
      values = c("html", "latex", "rtf", "word", "grid")
    )

  rlang::check_dots_empty()

  # Generate vector of columns to include in output
  if (isTRUE(incl_hidden_cols)) {

    boxhead_df <- dt_boxhead_get(data = data)

    included_cols <-
      boxhead_df$var[boxhead_df$type %in% c("default", "hidden")]

  } else {
    included_cols <- dt_boxhead_get_vars_default(data = data)
  }

  # If there are any stub columns, get the column names for that component
  group_col <- dt_boxhead_get_vars_groups(data = data)
  if (is.na(group_col)) {
    group_col <- NULL
  }

  rowname_col <- dt_boxhead_get_var_stub(data = data)
  if (is.na(rowname_col)) {
    rowname_col <- NULL
  }

  stub_cols <- c(group_col, rowname_col)

  if (isTRUE(incl_stub_cols)) {

    # Add stub columns to `included_cols`, if any are present; and deduplicate
    included_cols <- unique(c(stub_cols, included_cols))
  }

  data <- dt_body_build(data = data)

  if (identical(build_stage, "init")) {

    out_df <-
      assemble_body_extract(
        data = data,
        included_cols = included_cols,
        incl_stub_cols = incl_stub_cols,
        group_col = group_col,
        rowname_col = rowname_col
      )

    return(out_df)
  }

  data <- render_formats(data = data, context = output)

  if (identical(build_stage, "fmt_applied")) {

    out_df <-
      assemble_body_extract(
        data = data,
        included_cols = included_cols,
        incl_stub_cols = incl_stub_cols,
        group_col = group_col,
        rowname_col = rowname_col
      )

    return(out_df)
  }

  data <- render_substitutions(data = data, context = output)

  if (identical(build_stage, "sub_applied")) {

    out_df <-
      assemble_body_extract(
        data = data,
        included_cols = included_cols,
        incl_stub_cols = incl_stub_cols,
        group_col = group_col,
        rowname_col = rowname_col
      )

    return(out_df)
  }

  data <- migrate_unformatted_to_output(data = data, context = output)

  if (identical(build_stage, "unfmt_included")) {

    out_df <-
      assemble_body_extract(
        data = data,
        included_cols = included_cols,
        incl_stub_cols = incl_stub_cols,
        group_col = group_col,
        rowname_col = rowname_col
      )

    return(out_df)
  }

  data <- perform_col_merge(data = data, context = output)

  if (identical(build_stage, "cols_merged")) {

    out_df <-
      assemble_body_extract(
        data = data,
        included_cols = included_cols,
        incl_stub_cols = incl_stub_cols,
        group_col = group_col,
        rowname_col = rowname_col
      )

    return(out_df)
  }

  # Reorder stub_df first (handles group ordering and row_order() directives),
  # then reassemble body using the reordered stub_df
  data <- reorder_stub_df(data = data)
  data <- dt_body_reassemble(data = data)

  if (identical(build_stage, "body_reassembled")) {

    out_df <-
      assemble_body_extract(
        data = data,
        included_cols = included_cols,
        incl_stub_cols = incl_stub_cols,
        group_col = group_col,
        rowname_col = rowname_col
      )

    return(out_df)
  }

  data <- reorder_footnotes(data = data)
  data <- reorder_styles(data = data)

  data <- perform_text_transforms(data = data)

  if (identical(build_stage, "text_transformed")) {

    out_df <-
      assemble_body_extract(
        data = data,
        included_cols = included_cols,
        incl_stub_cols = incl_stub_cols,
        group_col = group_col,
        rowname_col = rowname_col
      )

    return(out_df)
  }

  data <- dt_boxhead_build(data = data, context = output)
  data <- dt_spanners_build(data = data, context = output)
  data <- dt_heading_build(data = data, context = output)
  data <- dt_stubhead_build(data = data, context = output)
  data <- dt_stub_df_build(data = data, context = output)
  data <- dt_source_notes_build(data = data, context = output)
  data <- dt_summary_build(data = data, context = output)
  data <- dt_groups_rows_build(data = data, context = output)
  data <- resolve_footnotes_styles(data = data, tbl_type = "footnotes")
  data <- apply_footnotes_to_output(data = data, context = output)

  if (is.null(build_stage) || identical(build_stage, "footnotes_attached")) {

    out_df <-
      assemble_body_extract(
        data = data,
        included_cols = included_cols,
        incl_stub_cols = incl_stub_cols,
        group_col = group_col,
        rowname_col = rowname_col
      )
  }

  out_df
}

assemble_body_extract <- function(
  data,
  included_cols,
  incl_stub_cols,
  group_col,
  rowname_col
) {

  out_df <- data[["_body"]][, included_cols]

  if (isTRUE(incl_stub_cols)) {

    if (!is.null(group_col)) {
      names(out_df)[names(out_df) == group_col] <- "::group_id::"
    }

    if (!is.null(rowname_col)) {
      # ::rowname::
      names(out_df)[names(out_df) == rowname_col] <- rowname_col_private
    }
  }

  out_df
}

# extract_summary() ------------------------------------------------------------
#' Extract a summary list from a **gt** object
#'
#' @description
#'
#' Get a list of summary row data frames from a `gt_tbl` object where summary
#' rows were added via [summary_rows()]. The output data frames contain the
#' `group_id` and `rowname` columns, whereby `rowname` contains descriptive stub
#' labels for the summary rows.
#'
#' @inheritParams extract_cells
#'
#' @return A list of data frames containing summary data.
#'
#' @section Examples:
#'
#' Use a modified version of [`sp500`] the dataset to create a **gt** table with
#' row groups and row labels. Create summary rows labeled as `min`, `max`, and
#' `avg` for every row group with [summary_rows()]. Then, extract the summary
#' rows as a list object.
#'
#' ```{r}
#' summary_extracted <-
#'   sp500 |>
#'   dplyr::filter(date >= "2015-01-05" & date <="2015-01-30") |>
#'   dplyr::arrange(date) |>
#'   dplyr::mutate(week = paste0("W", strftime(date, format = "%V"))) |>
#'   dplyr::select(-adj_close, -volume) |>
#'   gt(
#'     rowname_col = "date",
#'     groupname_col = "week"
#'   ) |>
#'   summary_rows(
#'     groups = everything(),
#'     columns = c(open, high, low, close),
#'     fns = list(
#'       min = ~min(.),
#'       max = ~max(.),
#'       avg = ~mean(.)
#'     ),
#      fmt = ~ fmt_number(.)
#'   ) |>
#'   extract_summary()
#'
#' summary_extracted
#' ```
#'
#' Use the summary list to make a new **gt** table. The key thing is to use
#' `dplyr::bind_rows()` and then pass the tibble to [gt()].
#'
#' ```r
#' summary_extracted |>
#'   unlist(recursive = FALSE) |>
#'   dplyr::bind_rows() |>
#'   gt(groupname_col = "group_id") |>
#'   cols_hide(columns = row_id)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_extract_summary_1.png")`
#' }}
#'
#' @family table export functions
#' @section Function ID:
#' 13-8
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#' @export
extract_summary <- function(data) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Stop function if there are no
  # directives to create summary rows
  if (!dt_summary_exists(data = data)) {

    cli::cli_abort(c(
      "There is no summary list to extract.",
      "*" = "Use the `{.help [summary_rows](gt::summary_rows)}()` /
      `{.help [grand_summary_rows](gt::grand_summary_rows)}()` functions to
      generate summaries."
    ))
  }

  # Build the `data` using the standard
  # pipeline with the `html` context
  built_data <- build_data(data = data, context = "html")

  # Extract the list of summary data frames
  # that contains tidy, unformatted data
  summary_tbl <-
    lapply(
      dt_summary_df_data_get(data = built_data),
      FUN = function(x) {
        lapply(x, function(y) {

          y <-
            dplyr::rename(
              y,
              dplyr::all_of(c(
                group_id = group_id_col_private,
                row_id = row_id_col_private,
                rowname = rowname_col_private
              ))
            )

          flattened_rowname <- unname(unlist(y$rowname))

          y[, ][["rowname"]] <- flattened_rowname

          y
        })
      }
    )

  as.list(summary_tbl)
}

# extract_cells() --------------------------------------------------------------
#' Extract a vector of formatted cells from a **gt** object
#'
#' @description
#'
#' Get a vector of cell data from a `gt_tbl` object. The output vector will have
#' cell data formatted in the same way as the table.
#'
#' @inheritParams vec_fmt_number
#'
#' @inheritParams fmt_number
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // *default:* `everything()`
#'
#'   In conjunction with `columns`, we can specify which of their rows should
#'   form a constraint for extraction. The default [everything()] results in all
#'   rows in `columns` being formatted. Alternatively, we can supply a vector of
#'   row IDs within `c()`, a vector of row indices, or a select helper function
#'   (e.g. [starts_with()], [ends_with()], [contains()], [matches()],
#'   [num_range()], and [everything()]). We can also use expressions to filter
#'   down to the rows we need (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @return A vector of cell data extracted from a **gt** table.
#'
#' @section Examples:
#'
#' Let's create a **gt** table with the [`exibble`] dataset to use in the next
#' few examples:
#'
#' ```r
#' gt_tbl <- gt(exibble, rowname_col = "row", groupname_col = "group")
#' ```
#'
#' We can extract a cell from the table with the `extract_cells()` function.
#' This is done by providing a column and a row intersection:
#'
#' ```r
#' extract_cells(gt_tbl, columns = num, row = 1)
#' ```
#' ```
#' #> [1] "1.111e-01"
#' ```
#'
#' Multiple cells can be extracted. Let's get the first four cells from the
#' `char` column.
#'
#' ```r
#' extract_cells(gt_tbl, columns = char, rows = 1:4)
#' ```
#' ```
#' #> [1] "apricot" "banana" "coconut" "durian"
#' ```
#'
#' We can format cells and expect that the formatting is fully retained after
#' extraction.
#'
#' ```r
#' gt_tbl |>
#'   fmt_number(columns = num, decimals = 2) |>
#'   extract_cells(columns = num, rows = 1)
#' ```
#' ```
#' #> [1] "0.11"
#' ```
#'
#' @family table export functions
#' @section Function ID:
#' 13-9
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @export
extract_cells <- function(
    data,
    columns,
    rows = everything(),
    output = c("auto", "plain", "html", "latex", "rtf", "word", "grid")
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Ensure that `output` is matched correctly to one option
  output <-
    rlang::arg_match0(
      output,
      values = c("auto", "plain", "html", "latex", "rtf", "word", "grid")
    )

  if (output == "auto") {
    output <- determine_output_format()
  }

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

  if (!dt_has_built(data)) {
    #
    # Partially build the gt table using the resolved `output` as the
    # rendering context; this formats the body cells and applies merging
    # routines and text transforms (but doesn't attach footnote marks)
    #

    data <- dt_body_build(data = data)
    data <- render_formats(data = data, context = output)
    data <- render_substitutions(data = data, context = output)
    data <- migrate_unformatted_to_output(data = data, context = output)
    data <- perform_col_merge(data = data, context = output)
    data <- dt_body_reassemble(data = data)
    data <- reorder_stub_df(data = data)
    data <- reorder_footnotes(data = data)
    data <- reorder_styles(data = data)
    data <- perform_text_transforms(data = data)
    built_data <- data

    # Extract the `_body` component of the built data
    data_body <- built_data[["_body"]]
  } else {
    data_body <- data[["_body"]]
  }

  #
  # Collect a vector of body cells in a specific order
  #

  out_vec <- c()

  for (column in resolved_columns) {
    out_vec_col <- data_body[resolved_rows_idx, ][[column]]
    out_vec <- c(out_vec, out_vec_col)
  }

  out_vec
}
