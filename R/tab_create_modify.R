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


#' Add a table header
#'
#' @description
#'
#' We can add a table header to the **gt** table with a title and even a
#' subtitle. A table header is an optional table part that is positioned above
#' the column labels. We have the flexibility to use Markdown formatting for the
#' header's title and subtitle. Furthermore, if the table is intended for HTML
#' output, we can use HTML in either of the title or subtitle.
#'
#' @inheritParams fmt_number
#' @param title,subtitle Text to be used in the table title and, optionally, for
#'   the table subtitle. We can elect to use the [md()] and [html()] helper
#'   functions to style the text as Markdown or to retain HTML elements in the
#'   text.
#' @param preheader Optional preheader content that is rendered above the table.
#'   Can be supplied as a vector of text.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use [`gtcars`] to create a **gt** table. Add a header part with the
#' `tab_header()` function so that we get a title and a subtitle for the table.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice(1:5) |>
#'   gt() |>
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_header_1.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-1
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
tab_header <- function(
    data,
    title,
    subtitle = NULL,
    preheader = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  dt_set_heading_components(
    data = data,
    title = title,
    subtitle = subtitle,
    preheader = preheader
  )
}

#' Add a spanner column label
#'
#' @description
#'
#' Set a spanner column label by mapping it to columns already in the table.
#' This label is placed above one or more column labels, spanning the width of
#' those columns and column labels.
#'
#' @inheritParams fmt_number
#' @param label The text to use for the spanner column label.
#' @param columns The columns to be components of the spanner heading.
#' @param spanners The spanners that should be spanned over, should they already
#'   be defined.
#' @param level An explicit level to which the spanner should be placed. If not
#'   provided, **gt** will choose the level based on the inputs provided within
#'   `columns` and `spanners`, placing the spanner label where it will fit. The
#'   first spanner level (right above the column labels) is `1`.
#' @param id The ID for the spanner column label. When accessing a spanner
#'   column label through [cells_column_spanners()] (when using [tab_style()] or
#'   [tab_footnote()]) the `id` value is used as the reference (and not the
#'   `label`). If an `id` is not explicitly provided here, it will be taken from
#'   the `label` value. It is advisable to set an explicit `id` value if you
#'   plan to access this cell in a later function call and the label text is
#'   complicated (e.g., contains markup, is lengthy, or both). Finally, when
#'   providing an `id` value you must ensure that it is unique across all ID
#'   values set for column spanner labels (the function will stop if `id` isn't
#'   unique).
#' @param gather An option to move the specified `columns` such that they are
#'   unified under the spanner column label. Ordering of the moved-into-place
#'   columns will be preserved in all cases. By default, this is set to `TRUE`.
#' @param replace Should new spanners be allowed to partially or fully replace
#'   existing spanners? (This is a possibility if setting spanners at an already
#'   populated `level`.) By default, this is set to `FALSE` and an error will
#'   occur if some replacement is attempted.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use [`gtcars`] to create a **gt** table. Use the `tab_spanner()` function to
#' effectively group several columns related to car performance under a spanner
#' column with the label `"performance"`.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(
#'     -mfr, -trim, bdy_style,
#'     -drivetrain, -trsmn, -ctry_origin
#'   ) |>
#'   dplyr::slice(1:8) |>
#'   gt(rowname_col = "model") |>
#'   tab_spanner(
#'     label = "performance",
#'     columns = c(
#'       hp, hp_rpm, trq, trq_rpm,
#'       mpg_c, mpg_h
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_spanner_1.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-2
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @import rlang
#' @export
tab_spanner <- function(
    data,
    label,
    columns = NULL,
    spanners = NULL,
    level = NULL,
    id = label,
    gather = TRUE,
    replace = FALSE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  present_spanner_ids <- dt_spanners_get_ids(data = data)

  # Get the columns supplied in `columns` as a character vector
  column_names <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data,
      null_means = "nothing"
    )

  # Get the spanner IDs supplied in `spanners` as a character vector
  spanner_id_idx <-
    tidyselect::with_vars(
      vars = present_spanner_ids,
      expr = spanners
    )

  # Stop function if `level` is provided and is less than `1`
  if (!is.null(level) && level < 1) {
    cli::cli_abort(c(
      "A spanner level of {level} cannot be set.",
      "*" = "Please choose a `level` value greater than or equal to `1`."
    ))
  }

  if (is.numeric(spanner_id_idx)) {

    spanner_ids <- present_spanner_ids[spanner_id_idx]

  } else {

    if (
      !is.null(spanner_id_idx) &&
      !all(spanner_id_idx %in% present_spanner_ids)
    ) {

      error_vars <-
        paste(
          base::setdiff(spanner_id_idx, present_spanner_ids),
          collapse = ", "
        )

      cli::cli_abort(
        "One or more spanner ID(s) supplied in `spanners` ({error_vars}),
        for the new spanner with the ID `{id}` doesn't belong to any
        existing spanners."
      )
    }

    spanner_ids <- spanner_id_idx
  }

  # If `column_names` and `spanner_ids` have zero lengths then
  # return the data unchanged
  if (length(column_names) < 1 && length(spanner_ids) < 1) {
    return(data)
  }

  # Check new `id` against existing `id` values across column labels
  # and spanner column labels and stop if necessary
  check_spanner_id_unique(data = data, spanner_id = id)

  # Resolve the `column_names` that new spanner will span over
  column_names <-
    resolve_spanned_column_names(
      data = data,
      column_names = column_names,
      spanner_ids = spanner_ids
    )

  # Resolve the `level` of the new spanner
  level <-
    resolve_spanner_level(
      data = data,
      column_names = column_names,
      level = level
    )

  # Add the spanner to the `_spanners` table
  data <-
    dt_spanners_add(
      data = data,
      vars = column_names,
      spanner_label = label,
      spanner_id = id,
      spanner_level = level,
      gather = gather,
      replace = replace
    )

  # Move columns into place with `cols_move()` only if specific
  # conditions are met:
  # - `gather` should be TRUE
  # - `spanner_ids` should be empty
  # - `level` is NULL or `1`
  if (
    gather &&
    length(spanner_ids) < 1 &&
    (is.null(level) || level == 1)
    ) {

    data <-
      cols_move(
        data = data,
        columns = column_names,
        after = column_names[1]
      )
  }

  data
}

resolve_spanner_level <- function(
  data,
  column_names,
  level
) {

  # If explicitly providing a `level` simply return that value
  if (!is.null(level)) {
    return(as.integer(level))
  }

  # Determine if there are any existing spanners
  any_existing_spanners <- dt_spanners_exists(data = data)

  # If there aren't any existing spanners, then the new spanner
  # level will always be `1`
  if (!any_existing_spanners) {
    return(1L)
  }

  # Get the present `spanners_tbl`
  spanners_tbl <- dt_spanners_get(data = data)

  highest_level <- 0L

  spanners_tbl <- dplyr::select(spanners_tbl, spanner_id, vars, spanner_level)

  highest_level <-
    dplyr::filter(
      spanners_tbl,
      vapply(
        vars,
        FUN.VALUE = logical(1),
        FUN = function(x) any(column_names %in% x)
      )
    ) %>%
    dplyr::pull("spanner_level") %>%
    max(0) # Max of ^ and 0

  highest_level + 1L
}

resolve_spanned_column_names <- function(
  data,
  column_names,
  spanner_ids
) {

  if (length(spanner_ids) > 0) {

    spanners_existing <- dt_spanners_get(data = data)

    column_names_associated <-
      unlist(
        spanners_existing[["vars"]][
          spanners_existing[["spanner_id"]] %in% spanner_ids
        ]
      )

    column_names <- c(column_names, column_names_associated)
  }

  unique(column_names)
}

#' Create column labels and spanners via delimited names
#'
#' @description
#'
#' This function will split selected delimited column names such that the first
#' components (LHS) are promoted to being spanner column labels, and the
#' secondary components (RHS) will become the column labels. Please note that
#' reference to individual columns must continue to be the column names from the
#' input table data (which are unique by necessity).
#'
#' @inheritParams tab_spanner
#' @param delim The delimiter to use to split an input column name. The
#'   delimiter supplied will be autoescaped for the internal splitting
#'   procedure. The first component of the split will become the spanner column
#'   label (and its ID value, used for styling or for the addition of footnotes
#'   in those locations) and the second component will be the column label.
#' @param columns An optional vector of column names that this operation should
#'   be limited to. The default is to consider all columns in the table.
#' @param split Should the delimiter splitting occur from the `"last"` instance
#'   of the `delim` character or from the `"first"`? By default, column name
#'   splitting begins at the last instance of the delimiter.
#'
#' @return An object of class `gt_tbl`.
#'
#' @details
#'
#' If we look to the column names in the `iris` dataset as an example of how
#' `tab_spanner_delim()` might be useful, we find the names `Sepal.Length`,
#' `Sepal.Width`, `Petal.Length`, `Petal.Width`. From this naming system, it's
#' easy to see that the `Sepal` and `Petal` can group together the repeated
#' common `Length` and `Width` values. In your own datasets, we can avoid a
#' lengthy relabeling with [cols_label()] if column names can be fashioned
#' beforehand to contain both the spanner column label and the column label. An
#' additional advantage is that the column names in the input table data remain
#' unique even though there may eventually be repeated column labels in the
#' rendered output table).
#'
#' @section Examples:
#'
#' Use `iris` to create a **gt** table and use the `tab_spanner_delim()`
#' function to automatically generate column spanner labels. This splits any
#' columns that are dot-separated between column spanner labels (first part) and
#' column labels (second part).
#'
#' ```r
#' iris |>
#'   dplyr::group_by(Species) |>
#'   dplyr::slice(1:4) |>
#'   gt() |>
#'   tab_spanner_delim(delim = ".")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_spanner_delim_1.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-3
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @import rlang
#' @export
tab_spanner_delim <- function(
    data,
    delim,
    columns = everything(),
    split = c("last", "first")
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Ensure that arguments are matched
  split <- rlang::arg_match(split)

  # Get all of the columns in the dataset
  all_cols <- dt_boxhead_get_vars(data = data)

  # Get the columns supplied in `columns` as a character vector
  columns <-
    suppressWarnings(
      resolve_cols_c(
        expr = {{ columns }},
        data = data
      )
    )

  if (!is.null(columns)) {
    colnames_spanners <- base::intersect(all_cols, columns)
  } else {
    colnames_spanners <- all_cols
  }

  if (length(colnames_spanners) == 0) {
    return(data)
  }

  if (split == "first") {

    colnames_spanners_ordered <-
      vapply(
        colnames_spanners,
        FUN.VALUE = character(1),
        USE.NAMES = FALSE,
        FUN = function(x) {
          paste(
            rev(unlist(strsplit(x, split = delim, fixed = TRUE))),
            collapse = delim
          )
        }
      )

  } else {
    colnames_spanners_ordered <- colnames_spanners
  }

  #
  # Determine the highest spanner level from these column names
  #

  max_level <-
    max(
      vapply(
        colnames_spanners_ordered,
        FUN.VALUE = integer(1), FUN = function(x) {
          length(unlist(strsplit(x, split = delim, fixed = TRUE)))
        }
      ),
      na.rm = TRUE
    )

  #
  # Create a matrix representation of the spanners
  #

  spanner_matrix <- matrix(data = NA_character_, nrow = max_level, ncol = 0)

  for (col in all_cols) {

    if (col %in% colnames_spanners) {

      col_name <- colnames_spanners_ordered[colnames_spanners %in% col]

      elements <- unlist(strsplit(col_name, split = delim, fixed = TRUE))

      elements_n <- length(elements)

      matrix_col_i <-
        matrix(
          c(rep(NA_character_, max_level - elements_n), elements),
          ncol = 1
        )

    } else {

      matrix_col_i <- matrix(c(rep(NA_character_, max_level - 1), col))
    }

    spanner_matrix <- cbind(spanner_matrix, matrix_col_i)
  }

  # If the height of the spanner matrix isn't greater than
  # one then return the data untouched
  if (nrow(spanner_matrix) == 1) {
    return(data)
  }

  for (i in rev(seq_len(nrow(spanner_matrix)))) {

    if (i == nrow(spanner_matrix)) next

    level <- nrow(spanner_matrix) - i

    rle_spanners_i <- rle(spanner_matrix[i, ])
    spanners_i_lengths <- rle_spanners_i$lengths
    spanners_i_values <- rle_spanners_i$values
    spanners_i_col_i <- utils::head(cumsum(c(1, spanners_i_lengths)), -1)

    spanner_id_vals <- c()

    for (j in seq_along(spanners_i_lengths)) {

      if (!is.na(spanners_i_values[j])) {

        # Construct the ID for the spanner from the spanner matrix
        spanner_id <-
          paste0(
            "spanner-",
            paste(
              spanner_matrix[seq(i, nrow(spanner_matrix)), spanners_i_col_i[j]],
              collapse = delim
            )
          )

        # Modify `spanner_id` to not collide with any other values
        if (spanner_id %in% spanner_id_vals) {

          if (grepl("^spanner-", spanner_id)) {

            # Add number to spanner ID values on first duplication
            spanner_id <- gsub("^spanner-", "spanner:1-", spanner_id)
          }

          while (spanner_id %in% spanner_id_vals) {

            # Increment number to spanner ID values on subsequent duplications
            idx_str <- gsub("^spanner:([0-9]+)-.*", "\\1", spanner_id)
            idx_int <- as.integer(idx_str)
            spanner_id <- gsub("^(spanner:)[0-9]+(-.*)", paste0("\\1", idx_int + 1, "\\2"), spanner_id)
          }
        }

        spanner_id_vals <- unique(c(spanner_id_vals, spanner_id))

        spanner_columns <-
          seq(
            spanners_i_col_i[j],
            spanners_i_col_i[j] + spanners_i_lengths[j] - 1
          )

        # Set the spanner with a call to `tab_spanner()`
        data <-
          tab_spanner(
            data = data,
            label = spanners_i_values[j],
            columns = spanner_columns,
            spanners = NULL,
            level = level,
            id = spanner_id,
            gather = FALSE
          )
      }
    }
  }

  #
  # Re-label column labels included in `colnames_spanners`
  #

  new_labels <- strsplit(colnames_spanners_ordered, split = delim, fixed = TRUE)
  new_labels <- vapply(new_labels, FUN.VALUE = character(1), utils::tail, 1)

  new_label_list <- stats::setNames(as.list(new_labels), colnames_spanners)

  #
  # Merge any column labels previously set by `cols_label()`
  #

  boxh <- dt_boxhead_get(data = data)

  old_label_list <- as.list(boxh$column_label)
  names(old_label_list) <- boxh$var

  for (name in names(new_label_list)) {

    if (!(name %in% names(old_label_list))) next

    if (
      !is.character(old_label_list[[name]]) ||
      (
        is.character(old_label_list[[name]]) &&
        old_label_list[[name]] != name
      )
    ) {
      new_label_list[[name]] <- old_label_list[[name]]
    }
  }

  # Conclude by invoking `cols_label()` on the data
  cols_label(data, .list = new_label_list)
}

#' Add a row group to a **gt** table
#'
#' @description
#'
#' Create a row group with a collection of rows. This requires specification of
#' the rows to be included, either by supplying row labels, row indices, or
#' through use of a select helper function like [starts_with()]. To modify the
#' order of row groups, use the [row_group_order()] function.
#'
#' To set a default row group label for any rows not formally placed in a row
#' group, we can use a separate call to `tab_options(row_group.default_label =
#' <label>)`. If this is not done and there are rows that haven't been placed
#' into a row group (where one or more row groups already exist), those rows
#' will be automatically placed into a row group without a label. To restore
#' labels for row groups not explicitly assigned a group,
#' `tab_options(row_group.default_label = "")` can be used.
#'
#' @inheritParams fmt_number
#' @param label The text to use for the row group label.
#' @param rows The rows to be made components of the row group. Can either be a
#'   vector of row captions provided in `c()`, a vector of row indices, or a
#'   helper function focused on selections. The select helper functions are:
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()], and
#'   [everything()].
#' @param id The ID for the row group. When accessing a row group through
#'   [cells_row_groups()] (when using [tab_style()] or [tab_footnote()]) the
#'   `id` value is used as the reference (and not the `label`). If an `id` is
#'   not explicitly provided here, it will be taken from the `label` value. It
#'   is advisable to set an explicit `id` value if you plan to access this cell
#'   in a later function call and the label text is complicated (e.g., contains
#'   markup, is lengthy, or both). Finally, when providing an `id` value you
#'   must ensure that it is unique across all ID values set for row groups (the
#'   function will stop if `id` isn't unique).
#' @param others_label This argument is deprecated. Instead use
#'   `tab_options(row_group.default_label = <label>)`.
#' @param group This argument is deprecated. Instead use `label`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use [`gtcars`] to create a **gt** table and use `tab_row_group()` to add two
#' row groups with the labels: `numbered` and `NA`. The row group with the `NA`
#' label ends up being rendered without a label at all.
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
#' Use [`gtcars`] to create a **gt** table. Add two row groups with the labels
#' `powerful` and `super powerful`. The distinction between the groups is
#' whether `hp` is lesser or greater than `600` (governed by the expressions
#' provided to the `rows` argument).
#'
#' ```r
#' gtcars |>
#'   dplyr::select(model, year, hp, trq) |>
#'   dplyr::slice(1:8) |>
#'   gt(rowname_col = "model") |>
#'   tab_row_group(
#'     label = "powerful",
#'     rows = hp <= 600
#'   ) |>
#'   tab_row_group(
#'     label = "super powerful",
#'     rows = hp > 600
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_row_group_2.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-4
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @import rlang
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

  # Resolve the row numbers using the `resolve_vars` function
  resolved_rows_idx <-
    resolve_rows_i(
      expr = !!row_expr,
      data = data
    )

  stub_df <- dt_stub_df_get(data = data)

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
    arrange_groups_vars <- character(0)
  }

  dt_row_groups_set(
    data = data,
    row_groups = arrange_groups_vars
  )
}

#' Add label text to the stubhead
#'
#' @description
#'
#' Add a label to the stubhead of a **gt** table. The stubhead is the lone
#' element that is positioned left of the column labels, and above the stub. If
#' a stub does not exist, then there is no stubhead (so no change will be made
#' when using this function in that case). We have the flexibility to use
#' Markdown formatting for the stubhead label. Furthermore, if the table is
#' intended for HTML output, we can use HTML for the stubhead label.
#'
#' @inheritParams fmt_number
#' @param label The text to be used as the stubhead label We can optionally use
#'   the [md()] and [html()] functions to style the text as Markdown or to
#'   retain HTML elements in the text.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use [`gtcars`] to create a **gt** table. With `tab_stubhead()` we can add a
#' stubhead label. This appears in the top-left and can be used to describe what
#' is in the stub.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(model, year, hp, trq) |>
#'   dplyr::slice(1:5) |>
#'   gt(rowname_col = "model") |>
#'   tab_stubhead(label = "car")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_stubhead_1.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-5
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
tab_stubhead <- function(
    data,
    label
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  dt_stubhead_label(data = data, label = label)
}

#' Control indentation of row labels in the stub
#'
#' @description
#'
#' Indentation of row labels is an effective way for establishing structure in a
#' table stub. The `tab_stub_indent()` function allows for fine control over
#' row label indentation through either explicit definition of an indentation
#' level, or, by way of an indentation directive using keywords.
#'
#' @inheritParams fmt_number
#' @param rows The rows to consider for the indentation change. Can either be a
#'   vector of row captions provided in `c()`, a vector of row indices, or a
#'   helper function focused on selections. The select helper functions are:
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()], and
#'   [everything()].
#' @param indent An indentation directive either as a keyword describing the
#'   indentation change or as an explicit integer value for directly setting the
#'   indentation level. The keyword `"increase"` (the default) will increase the
#'   indentation level by one; `"decrease"` will do the same in the reverse
#'   direction. The starting indentation level of `0` means no indentation and
#'   this values serves as a lower bound. The upper bound for indentation is at
#'   level `5`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use [`pizzaplace`] to create a **gt** table with summary rows at the top of
#' each row group. With `tab_stub_indent()` we can add indentation to the row
#' labels in the stub.
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
#' `r man_get_image_tag(file = "man_tab_stub_indent_1.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-6
#'
#' @section Function Introduced:
#' `v0.7.0` (Aug 25, 2022)
#'
#' @import rlang
#' @export
tab_stub_indent <- function(
    data,
    rows,
    indent = "increase"
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Capture the `rows` expression
  row_expr <- rlang::enquo(rows)

  # Get the `stub_df` data frame from `data`
  stub_df <- dt_stub_df_get(data = data)

  # Resolve the row numbers using the `resolve_vars` function
  resolved_rows_idx <-
    resolve_rows_i(
      expr = !!row_expr,
      data = data
    )

  # Set indent levels appropriately
  indent_vals <- stub_df[stub_df$rownum_i %in% resolved_rows_idx, ][["indent"]]

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
      if (indent < 0 | indent > 5) {
        cli::cli_abort(c(
          "If given as a numeric value, `indent` should be one of the following:",
          "*" = "0, 1, 2, 3, 4, or 5"
        ))
      }

      # Coerce `indent` to an integer value
      indent_val_i <- as.integer(indent)
    }

    # Ensure that `indent_val_i` is assigned to indent_vals as a character value
    indent_vals[i] <- as.character(indent_val_i)
  }

  stub_df[stub_df$rownum_i %in% resolved_rows_idx, ][["indent"]] <- indent_vals

  dt_stub_df_set(data = data, stub_df = stub_df)
}

#' Add a table footnote
#'
#' @description
#'
#' The `tab_footnote()` function can make it a painless process to add a
#' footnote to a **gt** table. There are two components to a footnote: (1) a
#' footnote mark that is attached to the targeted cell text, and (2) the
#' footnote text (that starts with the corresponding footnote mark) that is
#' placed in the table's footer area. Each call of `tab_footnote()` will add a
#' different note, and one or more cells can be targeted via the location helper
#' functions (e.g., [cells_body()], [cells_column_labels()], etc.).
#'
#' @inheritParams fmt_number
#' @param footnote The text to be used in the footnote. We can optionally use
#'   the [md()] and [html()] functions to style the text as Markdown or to
#'   retain HTML elements in the footnote text.
#' @param locations The cell or set of cells to be associated with the footnote.
#'   Supplying any of the `cells_*()` helper functions is a useful way to target
#'   the location cells that are associated with the footnote text. These helper
#'   functions are: [cells_title()], [cells_stubhead()],
#'   [cells_column_spanners()], [cells_column_labels()], [cells_row_groups()],
#'   [cells_stub()], [cells_body()], [cells_summary()], [cells_grand_summary()],
#'   [cells_stub_summary()], and [cells_stub_grand_summary()]. Additionally, we
#'   can enclose several `cells_*()` calls within a `list()` if we wish to link
#'   the footnote text to different types of locations (e.g., body cells, row
#'   group labels, the table title, etc.).
#' @param placement Where to affix footnote marks to the table content. Two
#'   options for this are `"left` or `"right"`, where the placement is to the
#'   absolute left or right of the cell content. By default, however, this is
#'   set to `"auto"` whereby **gt** will choose a preferred left-or-right
#'   placement depending on the alignment of the cell content.
#'
#' @return An object of class `gt_tbl`.
#'
#' @details
#'
#' The formatting of the footnotes can be controlled through the use of various
#' parameters in the [tab_options()] function:
#' - `footnotes.multiline`: a setting that determines whether footnotes each
#' start on a new line or are combined into a single block.
#' - `footnotes.sep`: allows for a choice of the separator between consecutive
#' footnotes in the table footer. By default, this is set to a single space
#' character.
#' - `footnotes.marks`: the set of sequential characters or numbers used to
#' identify the footnotes.
#' - `footnotes.font.size`: the size of the font used in the footnote section.
#' - `footnotes.padding`: the amount of padding to apply between the footnote
#' and source note sections in the table footer.
#'
#' @section Examples:
#'
#' Use [`sza`] to create a **gt** table. Color the `sza` column using the
#' [data_color()] function, then, use `tab_footnote()` to add a footnote to the
#' `sza` column label (explaining what the color scale signifies).
#'
#' ```r
#' sza |>
#'   dplyr::filter(
#'     latitude == 20 &
#'       month == "jan" &
#'       !is.na(sza)
#'   ) |>
#'   dplyr::select(-latitude, -month) |>
#'   gt() |>
#'   data_color(
#'     columns = sza,
#'     palette = c("white", "yellow", "navyblue"),
#'     domain = c(0, 90)
#'   ) |>
#'   tab_footnote(
#'     footnote = "Color indicates height of sun.",
#'     locations = cells_column_labels(
#'       columns = sza
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_footnote_1.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-7
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
tab_footnote <- function(
    data,
    footnote,
    locations = NULL,
    placement = c("auto", "right", "left")
) {

  placement <- rlang::arg_match(placement)

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  if (is.null(locations)) {

    # We need to invoke `dt_footnotes_add()` here (and not use
    # `as_locations()`/`set_footnote()`) because there is no
    # method for NULL

    data <-
      dt_footnotes_add(
        data = data,
        locname = "none",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 0,
        rownum = NA_integer_,
        footnotes = footnote,
        placement = placement
      )

    return(data)
  }

  # Resolve into a list of locations
  locations <- as_locations(locations)

  # Resolve the locations of the targeted data cells and append
  # the footnotes
  for (loc in locations) {

    data <-
      set_footnote(
        loc = loc,
        data = data,
        footnote = footnote,
        placement = placement
      )
  }

  data
}

set_footnote <- function(loc, data, footnote, placement) {
  UseMethod("set_footnote")
}

set_footnote.cells_title <- function(
    loc,
    data,
    footnote,
    placement
) {

  title_components <- rlang::eval_tidy(loc$groups)

  if ("title" %in% title_components) {

    data <-
      dt_footnotes_add(
        data = data,
        locname = "title",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 1,
        rownum = NA_integer_,
        footnotes = footnote,
        placement = placement
      )
  }

  if ("subtitle" %in% title_components) {

    data <-
      dt_footnotes_add(
        data = data,
        locname = "subtitle",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 2,
        rownum = NA_integer_,
        footnotes = footnote,
        placement = placement
      )
  }

  data
}

set_footnote.cells_stubhead <- function(
    loc,
    data,
    footnote,
    placement
) {

  data <-
    dt_footnotes_add(
      data = data,
      locname = loc$groups,
      grpname = NA_character_,
      colname = NA_character_,
      locnum = 2.5,
      rownum = NA_integer_,
      footnotes = footnote,
      placement = placement
    )

  data
}

set_footnote.cells_column_labels <- function(
    loc,
    data,
    footnote,
    placement
) {

  resolved <- resolve_cells_column_labels(data = data, object = loc)

  cols <- resolved$columns

  colnames <- names(cols)

  data <-
    dt_footnotes_add(
      data = data,
      locname = "columns_columns",
      grpname = NA_character_,
      colname = colnames,
      locnum = 4,
      rownum = NA_integer_,
      footnotes = footnote,
      placement = placement
    )

  data
}

set_footnote.cells_column_spanners <- function(
    loc,
    data,
    footnote,
    placement
) {

  resolved <- resolve_cells_column_spanners(data = data, object = loc)

  groups <- resolved$spanners

  data <-
    dt_footnotes_add(
      data = data,
      locname = "columns_groups",
      grpname = groups,
      colname = NA_character_,
      locnum = 3,
      rownum = NA_integer_,
      footnotes = footnote,
      placement = placement
    )

  data
}

set_footnote.cells_row_groups <- function(
    loc,
    data,
    footnote,
    placement
) {

  row_groups <- dt_row_groups_get(data = data)

  # Resolve row groups
  resolved_row_groups_idx <-
    resolve_vector_i(
      expr = !!loc$groups,
      vector = row_groups,
      item_label = "row group"
    )

  groups <- row_groups[resolved_row_groups_idx]

  data <-
    dt_footnotes_add(
      data = data,
      locname = "row_groups",
      grpname = groups,
      colname = NA_character_,
      locnum = 5,
      rownum = NA_integer_,
      footnotes = footnote,
      placement = placement
    )

  data
}

set_footnote.cells_body <- function(
    loc,
    data,
    footnote,
    placement
) {

  resolved <- resolve_cells_body(data = data, object = loc)

  rows <- resolved$rows

  colnames <- resolved$colnames

  data <-
    dt_footnotes_add(
      data = data,
      locname = "data",
      grpname = NA_character_,
      colname = colnames,
      locnum = 5,
      rownum = rows,
      footnotes = footnote,
      placement = placement
    )

  data
}

set_footnote.cells_stub <- function(
    loc,
    data,
    footnote,
    placement
) {

  resolved <- resolve_cells_stub(data = data, object = loc)

  rows <- resolved$rows

  data <-
    dt_footnotes_add(
      data = data,
      locname = "stub",
      grpname = NA_character_,
      colname = NA_character_,
      locnum = 5,
      rownum = rows,
      footnotes = footnote,
      placement = placement
    )

  data
}

set_footnote.cells_summary <- function(
    loc,
    data,
    footnote,
    placement
) {

  add_summary_location_row(
    loc = loc,
    data = data,
    style = footnote,
    placement = placement,
    df_type = "footnotes_df"
  )
}

set_footnote.cells_grand_summary <- function(
    loc,
    data,
    footnote,
    placement
) {

  add_grand_summary_location_row(
    loc = loc,
    data = data,
    style = footnote,
    placement = placement,
    df_type = "footnotes_df"
  )
}

set_footnote.cells_stub_summary <- function(
    loc,
    data,
    footnote,
    placement
) {

  add_summary_location_row(
    loc = loc,
    data = data,
    style = footnote,
    placement = placement,
    df_type = "footnotes_df"
  )
}

set_footnote.cells_stub_grand_summary <- function(
    loc,
    data,
    footnote,
    placement
) {

  add_grand_summary_location_row(
    loc = loc,
    data = data,
    style = footnote,
    placement = placement,
    df_type = "footnotes_df"
  )
}

set_footnote.cells_source_notes <- function(
    loc,
    data,
    footnote,
    placement
) {
  cli::cli_abort("Footnotes cannot be applied to source notes.")
}

set_footnote.cells_footnotes <- function(
    loc,
    data,
    footnote,
    placement
) {
  cli::cli_abort("Footnotes cannot be applied to other footnotes.")
}

#' Add a source note citation
#'
#' @description
#'
#' Add a source note to the footer part of the **gt** table. A source note is
#' useful for citing the data included in the table. Several can be added to the
#' footer, simply use multiple calls of `tab_source_note()` and they will be
#' inserted in the order provided. We can use Markdown formatting for the note,
#' or, if the table is intended for HTML output, we can include HTML formatting.
#'
#' @inheritParams fmt_number
#' @param source_note Text to be used in the source note. We can optionally use
#'   the [md()] and [html()] functions to style the text as Markdown or to
#'   retain HTML elements in the text.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use [`gtcars`] to create a **gt** table. Use `tab_source_note()` to add a
#' source note to the table footer that cites the data source.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice(1:5) |>
#'   gt() |>
#'   tab_source_note(source_note = "From edmunds.com")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_source_note_1.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-8
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
tab_source_note <- function(
    data,
    source_note
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  dt_source_notes_add(
    data = data,
    source_note = source_note
  )
}

#' Add a table caption
#'
#' @description
#'
#' Add a caption to a **gt** table, which is handled specially for a table
#' within an R Markdown, Quarto, or **bookdown** context. The addition of
#' captions makes tables cross-referencing across the containing document. The
#' caption location (i.e., top, bottom, margin) is handled at the document level
#' in each of these system.
#'
#' @inheritParams fmt_number
#' @param caption The table caption to use for cross-referencing in R Markdown,
#'   Quarto, or **bookdown**.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use [`gtcars`] to create a **gt** table. Add a header part with the
#' [tab_header()] function, and, add a caption as well with `tab_caption()`.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice(1:5) |>
#'   gt() |>
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   ) |>
#'   tab_caption(caption = md("**gt** table example."))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_caption_1.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-9
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @export
tab_caption <- function(
    data,
    caption
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  dt_options_set_value(
    data = data,
    option = "table_caption",
    value = caption
  )
}

#' Add custom styles to one or more cells
#'
#' @description
#'
#' With the `tab_style()` function we can target specific cells and apply styles
#' to them. This is best done in conjunction with the helper functions
#' [cell_text()], [cell_fill()], and [cell_borders()]. At present this function
#' is focused on the application of styles for HTML output only (as such, other
#' output formats will ignore all `tab_style()` calls). Using the aforementioned
#' helper functions, here are some of the styles we can apply:
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
#' @inheritParams fmt_number
#' @param style The styles to use for the cells at the targeted `locations`. The
#'   [cell_text()], [cell_fill()], and [cell_borders()] helper functions can be
#'   used here to more easily generate valid styles. If using more than one
#'   helper function to define styles, all calls must be enclosed in a [list()].
#'   Custom CSS declarations can be used for HTML output by including a
#'   [css()]-based statement as a list item.
#' @param locations the cell or set of cells to be associated with the style.
#'   Supplying any of the `cells_*()` helper functions is a useful way to target
#'   the location cells that are associated with the styling. These helper
#'   functions are: [cells_title()], [cells_stubhead()],
#'   [cells_column_spanners()], [cells_column_labels()], [cells_row_groups()],
#'   [cells_stub()], [cells_body()], [cells_summary()], [cells_grand_summary()],
#'   [cells_stub_summary()], [cells_stub_grand_summary()], [cells_footnotes()],
#'   and [cells_source_notes()]. Additionally, we can enclose several
#'   `cells_*()` calls within a `list()` if we wish to apply styling to
#'   different types of locations (e.g., body cells, row group labels, the table
#'   title, etc.).
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table. Add styles that are to be applied
#' to data cells that satisfy a condition (using `tab_style()`).
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, currency) |>
#'   gt() |>
#'   fmt_number(
#'     columns = c(num, currency),
#'     decimals = 1
#'   ) |>
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "lightcyan"),
#'       cell_text(weight = "bold")
#'       ),
#'     locations = cells_body(
#'       columns = num,
#'       rows = num >= 5000
#'     )
#'   ) |>
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "#F9E3D6"),
#'       cell_text(style = "italic")
#'       ),
#'     locations = cells_body(
#'       columns = currency,
#'       rows = currency < 100
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_1.png")`
#' }}
#'
#' Use [`sp500`] to create a **gt** table. Color entire rows of cells based on
#' values in a particular column.
#'
#' ```r
#' sp500 |>
#'   dplyr::filter(
#'     date >= "2015-12-01" &
#'     date <= "2015-12-15"
#'   ) |>
#'   dplyr::select(-c(adj_close, volume)) |>
#'   gt() |>
#'   tab_style(
#'     style = cell_fill(color = "lightgreen"),
#'     locations = cells_body(rows = close > open)
#'   ) |>
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "red"),
#'       cell_text(color = "white")
#'       ),
#'     locations = cells_body(rows = open > close)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_2.png")`
#' }}
#'
#' Use [`exibble`] to create a **gt** table. Replace missing values with the
#' [sub_missing()] function and then add styling to the `char` column with
#' [cell_fill()] and with a CSS style declaration.
#'
#' ```r
#' exibble |>
#'   dplyr::select(char, fctr) |>
#'   gt() |>
#'   sub_missing() |>
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "lightcyan"),
#'       "font-variant: small-caps;"
#'     ),
#'     locations = cells_body(columns = char)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_3.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-10
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @seealso [cell_text()], [cell_fill()], and [cell_borders()] as helpers for
#'   defining custom styles and [cells_body()] as one of many useful helper
#'   functions for targeting the locations to be styled.
#'
#' @export
tab_style <- function(
    data,
    style,
    locations
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Upgrade `style` to be within a list if not provided as such
  if (inherits(style, "cell_styles")) {
    style <- list(style)
  }

  # Determine if there is a `cell_text` list within the main list;
  # because we need to intercept any provided `font` inputs in `cell_text`
  # this is the first thing we need to know
  has_cell_text <- "cell_text" %in% names(unlist(style, recursive = FALSE))

  # If the `cell_text` list is present we now need to determine if there
  # is indeed a `font` input within that list
  if (has_cell_text) {

    # The `style` list will itself contain several lists and it's
    # important to identify which one represents `cell_text`
    for (i in seq_along(style)) {
      if ("cell_text" %in% names(style[[i]])) {
        cell_text_idx <- i
      }
    }

    # If the `cell_text` list contains a `font` input then intercept
    # the font styles that require registration
    if ("font" %in% names(style[[cell_text_idx]][["cell_text"]])) {

      font <- style[[cell_text_idx]][["cell_text"]][["font"]]
      font <- normalize_font_input(font_input = font)

      existing_additional_css <-
        dt_options_get_value(
          data = data,
          option = "table_additional_css"
        )

      additional_css <- c(font$import_stmt, existing_additional_css)

      data <-
        tab_options(
          data = data,
          table.additional_css = additional_css
        )

      style[[cell_text_idx]][["cell_text"]][["font"]] <-
        as_css_font_family_attr(
          font_vec = font$name,
          value_only = TRUE
        )
    }
  }

  # Resolve into a list of locations
  locations <- as_locations(locations)

  style <- as_style(style = style)

  # Resolve the locations of the targeted data cells and append
  # the format directives
  for (loc in locations) {

    data <-
      set_style(
        loc = loc,
        data = data,
        style = style
      )
  }

  data
}

as_style <- function(style) {

  # If style rules are part of a list, paste each of the list
  # components together
  if (!inherits(style, "cell_styles")) {

    # Initialize an empty list that will be
    # populated with normalized style declarations
    final_style <- list()

    for (i in seq(style)) {

      style_item <- style[[i]]

      if (inherits(style_item, "character")) {

        style_item <- list(cell_style = style_item)

      } else if (!inherits(style_item, "cell_styles")) {

        cli::cli_abort(c(
          "All provided styles should be generated by stylizing
          helper functions.",
          "*" = "Style with index `{i}` is invalid."
        ))
      }

      final_style <- utils::modifyList(final_style, style_item)
    }

    class(final_style) <- "cell_styles"

    style <- final_style
  }

  style
}

set_style <- function(loc, data, style) {
  UseMethod("set_style")
}

set_style.cells_title <- function(loc, data, style) {

  title_components <- rlang::eval_tidy(loc$groups)

  if ("title" %in% title_components) {

    data <-
      dt_styles_add(
        data = data,
        locname = "title",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 1,
        rownum = NA_integer_,
        styles = style
      )
  }

  if ("subtitle" %in% title_components) {

    data <-
      dt_styles_add(
        data = data,
        locname = "subtitle",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 2,
        rownum = NA_integer_,
        styles = style
      )
  }

  data
}

set_style.cells_stubhead <- function(loc, data, style) {

  data <-
    dt_styles_add(
      data = data,
      locname = loc$groups,
      grpname = NA_character_,
      colname = NA_character_,
      locnum = 2.5,
      rownum = NA_integer_,
      styles = style
    )

  data
}

set_style.cells_column_labels <- function(loc, data, style) {

  resolved <- resolve_cells_column_labels(data = data, object = loc)

  cols <- resolved$columns

  colnames <- names(cols)

  data <-
    dt_styles_add(
      data = data,
      locname = "columns_columns",
      grpname = NA_character_,
      colname = colnames,
      locnum = 4,
      rownum = NA_integer_,
      styles = style
    )

  data
}

set_style.cells_column_spanners <- function(loc, data, style) {

  resolved <- resolve_cells_column_spanners(data = data, object = loc)

  groups <- resolved$spanners

  data <-
    dt_styles_add(
      data = data,
      locname = "columns_groups",
      grpname = groups,
      colname = NA_character_,
      locnum = 3,
      rownum = NA_integer_,
      styles = style
    )

  data
}

set_style.cells_row_groups <- function(loc, data, style) {

  row_groups <- dt_row_groups_get(data = data)

  # Resolve row groups
  resolved_row_groups_idx <-
    resolve_vector_i(
      expr = !!loc$groups,
      vector = row_groups,
      item_label = "row group"
    )

  groups <- row_groups[resolved_row_groups_idx]

  data <-
    dt_styles_add(
      data = data,
      locname = "row_groups",
      grpname = groups,
      colname = NA_character_,
      locnum = 5,
      rownum = NA_integer_,
      styles = style
    )

  data
}

set_style.cells_body <- function(loc, data, style) {

  resolved <- resolve_cells_body(data = data, object = loc)

  rows <- resolved$rows

  colnames <- resolved$colnames

  data <-
    dt_styles_add(
      data = data,
      locname = "data",
      grpname = NA_character_,
      colname = colnames,
      locnum = 5,
      rownum = rows,
      styles = style
    )

  data
}

set_style.cells_stub <- function(loc, data, style) {

  resolved <- resolve_cells_stub(data = data, object = loc)

  rows <- resolved$rows

  data <-
    dt_styles_add(
      data = data,
      locname = "stub",
      grpname = NA_character_,
      colname = NA_character_,
      locnum = 5,
      rownum = rows,
      styles = style
    )

  data
}

set_style.cells_summary <- function(loc, data, style) {

  add_summary_location_row(
    loc = loc,
    data = data,
    style = style,
    df_type = "styles_df"
  )
}

set_style.cells_grand_summary <- function(loc, data, style) {

  add_grand_summary_location_row(
    loc = loc,
    data = data,
    style = style,
    df_type = "styles_df"
  )
}

set_style.cells_stub_summary <- function(loc, data, style) {

  add_summary_location_row(
    loc = loc,
    data = data,
    style = style,
    df_type = "styles_df"
  )
}

set_style.cells_stub_grand_summary <- function(loc, data, style) {

  add_grand_summary_location_row(
    loc = loc,
    data = data,
    style = style,
    df_type = "styles_df"
  )
}

set_style.cells_footnotes <- function(loc, data, style) {

  data <-
    dt_styles_add(
      data = data,
      locname = "footnotes",
      grpname = NA_character_,
      colname = NA_character_,
      locnum = 7,
      rownum = NA_integer_,
      styles = style
    )
}

set_style.cells_source_notes <- function(loc, data, style) {

  data <-
    dt_styles_add(
      data = data,
      locname = "source_notes",
      grpname = NA_character_,
      colname = NA_character_,
      locnum = 8,
      rownum = NA_integer_,
      styles = style
    )
}

#' Modify the table output options
#'
#' @description
#'
#' Modify the options available in a table. These options are named by the
#' components, the subcomponents, and the element that can adjusted.
#'
#' @inheritParams fmt_number
#' @param table.width The width of the table. Can be specified as a
#'   single-length character with units of pixels or as a percentage. If
#'   provided as a single-length numeric vector, it is assumed that the value is
#'   given in units of pixels. The [px()] and [pct()] helper functions can also
#'   be used to pass in numeric values and obtain values as pixel or percent
#'   units.
#' @param table.layout The value for the `table-layout` CSS style in the HTML
#'   output context. By default, this is `"fixed"` but another valid option is
#'   `"auto"`.
#' @param table.align The horizontal alignment of the table in its container. By
#'   default, this is `"center"`. Other options are `"left"` and `"right"`. This
#'   will automatically set `table.margin.left` and `table.margin.right` to the
#'   appropriate values.
#' @param table.margin.left,table.margin.right The size of the margins on the
#'   left and right of the table within the container. Can be specified as a
#'   single-length character with units of pixels or as a percentage. If
#'   provided as a single-length numeric vector, it is assumed that the value is
#'   given in units of pixels. The [px()] and [pct()] helper functions can also
#'   be used to pass in numeric values and obtain values as pixel or percent
#'   units. Using `table.margin.left` or `table.margin.right` will overwrite any
#'   values set by `table.align`.
#' @param table.background.color,heading.background.color,column_labels.background.color,row_group.background.color,stub.background.color,summary_row.background.color,grand_summary_row.background.color,footnotes.background.color,source_notes.background.color
#'   Background colors for the parent element `table` and the following child
#'   elements: `heading`, `column_labels`, `row_group`, `stub`, `summary_row`,
#'   `grand_summary_row`, `footnotes`, and `source_notes`. A color name or a
#'   hexadecimal color code should be provided.
#' @param table.additional_css This option can be used to supply an additional
#'   block of CSS rules to be applied after the automatically generated table
#'   CSS.
#' @param table.font.names The names of the fonts used for the table. This is
#'   a vector of several font names. If the first font isn't available, then
#'   the next font is tried (and so on).
#' @param table.font.style The font style for the table. Can be one of either
#'   `"normal"`, `"italic"`, or `"oblique"`.
#' @param table.font.color,table.font.color.light
#'   The text color used throughout the table. There are two variants:
#'   `table.font.color` is for text overlaid on lighter background colors, and
#'   `table.font.color.light` is automatically used when text needs to be
#'   overlaid on darker background colors. A color name or a hexadecimal color
#'   code should be provided.
#' @param table.font.size,heading.title.font.size,heading.subtitle.font.size,column_labels.font.size,row_group.font.size,stub.font.size,footnotes.font.size,source_notes.font.size
#'   The font sizes for the parent text element `table` and the following child
#'   elements: `heading.title`, `heading.subtitle`, `column_labels`,
#'   `row_group`, `footnotes`, and `source_notes`. Can be specified as a
#'   single-length character vector with units of pixels (e.g., `12px`) or as a
#'   percentage (e.g., `80\%`). If provided as a single-length numeric vector,
#'   it is assumed that the value is given in units of pixels. The [px()] and
#'   [pct()] helper functions can also be used to pass in numeric values and
#'   obtain values as pixel or percentage units.
#' @param heading.align Controls the horizontal alignment of the heading title
#'   and subtitle. We can either use `"center"`, `"left"`, or `"right"`.
#' @param table.font.weight,heading.title.font.weight,heading.subtitle.font.weight,column_labels.font.weight,row_group.font.weight,stub.font.weight
#'   The font weights of the table, `heading.title`, `heading.subtitle`,
#'   `column_labels`, `row_group`, and `stub` text elements. Can be a text-based
#'   keyword such as `"normal"`, `"bold"`, `"lighter"`, `"bolder"`, or, a
#'   numeric value between `1` and `1000`, inclusive. Note that only variable
#'   fonts may support the numeric mapping of weight.
#' @param column_labels.text_transform,row_group.text_transform,stub.text_transform,summary_row.text_transform,grand_summary_row.text_transform
#'   Options to apply text transformations to the `column_labels`, `row_group`,
#'   `stub`, `summary_row`, and `grand_summary_row` text elements. Either of the
#'   `"uppercase"`, `"lowercase"`, or `"capitalize"` keywords can be used.
#' @param heading.padding,column_labels.padding,data_row.padding,row_group.padding,summary_row.padding,grand_summary_row.padding,footnotes.padding,source_notes.padding
#'   The amount of vertical padding to incorporate in the `heading` (title and
#'   subtitle), the `column_labels` (this includes the column spanners), the row
#'   group labels (`row_group.padding`), in the body/stub rows
#'   (`data_row.padding`), in summary rows (`summary_row.padding` or
#'   `grand_summary_row.padding`), or in the footnotes and source notes
#'   (`footnotes.padding` and `source_notes.padding`).
#' @param heading.padding.horizontal,column_labels.padding.horizontal,data_row.padding.horizontal,row_group.padding.horizontal,summary_row.padding.horizontal,grand_summary_row.padding.horizontal,footnotes.padding.horizontal,source_notes.padding.horizontal
#'   The amount of horizontal padding to incorporate in the `heading` (title and
#'   subtitle), the `column_labels` (this includes the column spanners), the row
#'   group labels (`row_group.padding.horizontal`), in the body/stub rows
#'   (`data_row.padding`), in summary rows (`summary_row.padding.horizontal` or
#'   `grand_summary_row.padding.horizontal`), or in the footnotes and source
#'   notes (`footnotes.padding.horizontal` and
#'   `source_notes.padding.horizontal`).
#' @param table.border.top.style,table.border.top.width,table.border.top.color,table.border.right.style,table.border.right.width,table.border.right.color,table.border.bottom.style,table.border.bottom.width,table.border.bottom.color,table.border.left.style,table.border.left.width,table.border.left.color
#'   The style, width, and color properties of the table's absolute top and
#'   absolute bottom borders.
#' @param heading.border.bottom.style,heading.border.bottom.width,heading.border.bottom.color
#'   The style, width, and color properties of the header's bottom border. This
#'   border shares space with that of the `column_labels` location. If the
#'   `width` of this border is larger, then it will be the visible border.
#' @param heading.border.lr.style,heading.border.lr.width,heading.border.lr.color
#'   The style, width, and color properties for the left and right borders of
#'   the `heading` location.
#' @param column_labels.vlines.style,column_labels.vlines.width,column_labels.vlines.color
#'   The style, width, and color properties for all vertical lines ('vlines')
#'   of the the `column_labels`.
#' @param column_labels.border.top.style,column_labels.border.top.width,column_labels.border.top.color
#'   The style, width, and color properties for the top border of the
#'   `column_labels` location. This border shares space with that of the
#'   `heading` location. If the `width` of this border is larger, then it will
#'   be the visible border.
#' @param column_labels.border.bottom.style,column_labels.border.bottom.width,column_labels.border.bottom.color
#'   The style, width, and color properties for the bottom border of the
#'   `column_labels` location.
#' @param column_labels.border.lr.style,column_labels.border.lr.width,column_labels.border.lr.color
#'   The style, width, and color properties for the left and right borders of
#'   the `column_labels` location.
#' @param column_labels.hidden An option to hide the column labels. If providing
#'   `TRUE` then the entire `column_labels` location won't be seen and the table
#'   header (if present) will collapse downward.
#' @param row_group.border.top.style,row_group.border.top.width,row_group.border.top.color,row_group.border.bottom.style,row_group.border.bottom.width,row_group.border.bottom.color,row_group.border.left.style,row_group.border.left.width,row_group.border.left.color,row_group.border.right.style,row_group.border.right.width,row_group.border.right.color
#'   The style, width, and color properties for all top, bottom, left, and right
#'   borders of the `row_group` location.
#' @param table_body.hlines.style,table_body.hlines.width,table_body.hlines.color,table_body.vlines.style,table_body.vlines.width,table_body.vlines.color
#'   The style, width, and color properties for all horizontal lines ('hlines')
#'   and vertical lines ('vlines') in the `table_body`.
#' @param table_body.border.top.style,table_body.border.top.width,table_body.border.top.color,table_body.border.bottom.style,table_body.border.bottom.width,table_body.border.bottom.color
#'   The style, width, and color properties for all top and bottom borders of
#'   the `table_body` location.
#' @param stub.border.style,stub.border.width,stub.border.color
#'   The style, width, and color properties for the vertical border of the table
#'   stub.
#' @param stub_row_group.font.size,stub_row_group.font.weight,stub_row_group.text_transform,stub_row_group.border.style,stub_row_group.border.width,stub_row_group.border.color
#'   Options for the row group column in the stub (made possible when using
#'   `row_group.as_column = TRUE`). The defaults for these options mirror that
#'   of the `stub.*` variants (except for `stub_row_group.border.width`, which
#'   is `"1px"` instead of `"2px"`).
#' @param row_group.default_label An option to set a default row group label for
#'   any rows not formally placed in a row group named by `group` in any call of
#'   `tab_row_group()`. If this is set as `NA_character` and there are rows that
#'   haven't been placed into a row group (where one or more row groups already
#'   exist), those rows will be automatically placed into a row group without a
#'   label.
#' @param row_group.as_column How should row groups be structured? By default,
#'   they are separate rows that lie above the each of the groups. Setting this
#'   to `TRUE` will structure row group labels are columns to the far left of
#'   the table.
#' @param stub.indent_length The width of each indentation level. By default
#'   this is `"5px"`.
#' @param summary_row.border.style,summary_row.border.width,summary_row.border.color
#'   The style, width, and color properties for all horizontal borders of the
#'   `summary_row` location.
#' @param grand_summary_row.border.style,grand_summary_row.border.width,grand_summary_row.border.color
#'   The style, width, and color properties for the top borders of the
#'   `grand_summary_row` location.
#' @param footnotes.border.bottom.style,footnotes.border.bottom.width,footnotes.border.bottom.color
#'   The style, width, and color properties for the bottom border of the
#'   `footnotes` location.
#' @param footnotes.border.lr.style,footnotes.border.lr.width,footnotes.border.lr.color
#'   The style, width, and color properties for the left and right borders of
#'   the `footnotes` location.
#' @param footnotes.marks The set of sequential marks used to reference and
#'   identify each of the footnotes (same input as the [opt_footnote_marks()]
#'   function). We can supply a vector that represents the series of footnote
#'   marks. This vector is recycled when its usage goes beyond the length of the
#'   set. At each cycle, the marks are simply combined (e.g., `*` -> `**` ->
#'   `***`). The option exists for providing keywords for certain types of
#'   footnote marks. The keyword `"numbers"` (the default, indicating that we
#'   want to use numeric marks). We can use lowercase `"letters"` or uppercase
#'   `"LETTERS"`. There is the option for using a traditional symbol set where
#'   `"standard"` provides four symbols, and, `"extended"` adds two more
#'   symbols, making six.
#' @param footnotes.spec_ref,footnotes.spec_ftr Optional specifications for
#'   formatting of footnote references (`footnotes.spec_ref`) and their
#'   associated marks the footer section (`footnotes.spec_ftr`) (same input as
#'   the [opt_footnote_spec()] function). This is a string containing
#'   specification control characters. The default is the spec string `"^i"`,
#'   which is superscript text set in italics. Other control characters that can
#'   be used are: (1) `"b"` for bold text, and (2) `"("` / `")"` for the
#'   enclosure of footnote marks in parentheses.
#' @param footnotes.multiline,source_notes.multiline An option to either put
#'   footnotes and source notes in separate lines (the default, or `TRUE`) or
#'   render them as a continuous line of text with `footnotes.sep` providing the
#'   separator (by default `" "`) between notes.
#' @param footnotes.sep,source_notes.sep The separating characters between
#'   adjacent footnotes and source notes in their respective footer sections
#'   when rendered as a continuous line of text (when
#'   `footnotes.multiline == FALSE`). The default value is a single space
#'   character (`" "`).
#' @param source_notes.border.bottom.style,source_notes.border.bottom.width,source_notes.border.bottom.color
#'   The style, width, and color properties for the bottom border of the
#'   `source_notes` location.
#' @param source_notes.border.lr.style,source_notes.border.lr.width,source_notes.border.lr.color
#'   The style, width, and color properties for the left and right borders of
#'   the `source_notes` location.
#' @param row.striping.background_color The background color for striped table
#'   body rows. A color name or a hexadecimal color code should be provided.
#' @param row.striping.include_stub An option for whether to include the stub
#'   when striping rows.
#' @param row.striping.include_table_body An option for whether to include the
#'   table body when striping rows.
#' @param container.width,container.height,container.padding.x,container.padding.y
#'   The width and height of the table's container, and, the vertical and
#'   horizontal padding of the table's container. The container width and height
#'   can be specified with units of pixels or as a percentage. The padding is to
#'   be specified as a length with units of pixels. If provided as a numeric
#'   value, it is assumed that the value is given in units of pixels. The [px()]
#'   and [pct()] helper functions can also be used to pass in numeric values and
#'   obtain values as pixel or percent units.
#' @param container.overflow.x,container.overflow.y Options to enable scrolling
#'   in the horizontal and vertical directions when the table content overflows
#'   the container dimensions. Using `TRUE` (the default for both) means that
#'   horizontal or vertical scrolling is enabled to view the entire table in
#'   those directions. With `FALSE`, the table may be clipped if the table width
#'   or height exceeds the `container.width` or `container.height`.
#' @param ihtml.active The option for displaying an interactive version of an
#'   HTML table (rather than an otherwise 'static' table). This enables the use
#'   of controls for pagination, global search, filtering, and sorting. The
#'   individual features are controlled by the other `table.*` options. By
#'   default, the pagination (`ihtml.use_pagination`) and sorting
#'   (`ihtml.use_sorting`) features are enabled. The `ihtml.active` option,
#'   however, is `FALSE` by default.
#' @param ihtml.use_pagination,ihtml.use_pagination_info For interactive HTML
#'   output, the option for using pagination controls (below the table body) can
#'   be controlled with `ihtml.use_pagination`. By default, this is `TRUE` and
#'   it will allow the use to page through table content. The informational
#'   display text regarding the current page can be set with
#'   `ihtml.use_pagination_info` (which is `TRUE` by default).
#' @param ihtml.use_sorting For interactive HTML output, the option to provide
#'   controls for sorting column values. By default, this is `TRUE`.
#' @param ihtml.use_search For interactive HTML output, an option that places a
#'   search field for globally filtering rows to the requested content. By
#'   default, this is `FALSE`.
#' @param ihtml.use_filters For interactive HTML output, this places search
#'   fields below each column header and allows for filtering by column. By
#'   default, this is `FALSE`.
#' @param ihtml.use_resizers For interactive HTML output, this allows for
#'   interactive resizing of columns. By default, this is `FALSE`.
#' @param ihtml.use_highlight For interactive HTML output, this highlights
#'   individual rows upon hover. By default, this is `FALSE`.
#' @param ihtml.use_compact_mode For interactive HTML output, an option to
#'   reduce vertical padding and thus make the table consume less vertical
#'   space. By default, this is `FALSE`.
#' @param ihtml.use_text_wrapping For interactive HTML output, an option to
#'   control text wrapping. By default (`TRUE`), text will be wrapped to
#'   multiple lines; if `FALSE`, text will be truncated to a single line.
#' @param ihtml.use_page_size_select,ihtml.page_size_default,ihtml.page_size_values
#'   For interactive HTML output, `ihtml.use_page_size_select` provides the
#'   option to display a dropdown menu for the number of rows to show per page
#'   of data. By default, this is the vector `c(10, 25, 50, 100)` which
#'   corresponds to options for `10`, `25`, `50`, and `100` rows of data per
#'   page. To modify these page-size options, provide a numeric vector to
#'   `ihtml.page_size_values`. The default page size (initially set as `10`) can
#'   be modified with `ihtml.page_size_default` and this works whether or not
#'   `ihtml.use_page_size_select` is set to `TRUE`.
#' @param ihtml.pagination_type For interactive HTML output and when using
#'   pagination, one of three options for presentation pagination controls. The
#'   default is `"numbers"`, where a series of page-number buttons is presented
#'   along with 'previous' and 'next' buttons. The `"jump"` option provides an
#'   input field with a stepper for the page number. With `"simple"`, only the
#'   'previous' and 'next' buttons are displayed.
#' @param page.orientation For RTF output, this provides an two options for page
#'   orientation: `"portrait"` (the default) and `"landscape"`.
#' @param page.numbering Within RTF output, should page numbering be displayed?
#'   By default, this is set to `FALSE` but if `TRUE` then page numbering text
#'   will be added to the document header.
#' @param page.header.use_tbl_headings If `TRUE` then RTF output tables will
#'   migrate all table headings (including the table title and all column
#'   labels) to the page header. This page header content will repeat across
#'   pages. By default, this is `FALSE`.
#' @param page.footer.use_tbl_notes If `TRUE` then RTF output tables will
#'   migrate all table footer content (this includes footnotes and source notes)
#'   to the page footer. This page footer content will repeat across pages. By
#'   default, this is `FALSE`.
#' @param page.width,page.height The page width and height in the standard
#'   portrait orientation. This is for RTF table output and the default
#'   values (in inches) are `8.5in` and `11.0in`.
#' @param page.margin.left,page.margin.right,page.margin.top,page.margin.bottom
#'   For RTF table output, these options correspond to the left, right, top, and
#'   bottom page margins. The default values for each of these is `1.0in`.
#' @param page.header.height,page.footer.height The heights of the page header
#'   and footer for RTF table outputs. Default values for both are `0.5in`.
#' @param quarto.use_bootstrap,quarto.disable_processing When rendering a **gt**
#'   table with Quarto, the table can undergo transformations to support
#'   advanced Quarto features. Setting `quarto.use_bootstrap` to `TRUE` (`FALSE`
#'   by default) will allow Quarto to add Bootstrap classes to the table,
#'   allowing those styles to permeate the table. Quarto performs other
#'   alterations as well but they can all be deactivated with
#'   `quarto.disable_processing = TRUE` (this option is `FALSE` by default).
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table with all the main parts added. We
#' can use this **gt** object going forward to demo some of what's available in
#' the `tab_options()` function.
#'
#' ```r
#' tab_1 <-
#'   exibble |>
#'   dplyr::select(-c(fctr, date, time, datetime)) |>
#'   gt(
#'     rowname_col = "row",
#'     groupname_col = "group"
#'   ) |>
#'   tab_header(
#'     title = md("Data listing from **exibble**"),
#'     subtitle = md("`exibble` is an R dataset")
#'   ) |>
#'   fmt_number(columns = num) |>
#'   fmt_currency(columns = currency) |>
#'   tab_footnote(
#'     footnote = "Using commas for separators.",
#'     locations = cells_body(
#'       columns = num,
#'       rows = num > 1000
#'     )
#'   ) |>
#'   tab_footnote(
#'     footnote = "Using commas for separators.",
#'     locations = cells_body(
#'       columns = currency,
#'       rows = currency > 1000
#'     )
#'   ) |>
#'   tab_footnote(
#'     footnote = "Alphabetical fruit.",
#'     locations = cells_column_labels(columns = char)
#'   )
#'
#' tab_1
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_options_1.png")`
#' }}
#'
#' Modify the table width to be 100% (which spans the entire content width
#' area).
#'
#' ```r
#' tab_1 |> tab_options(table.width = pct(100))
#' ```
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_options_2.png")`
#' }}
#'
#' Modify the table's background color to be `"lightcyan"`.
#'
#' ```r
#' tab_1 |> tab_options(table.background.color = "lightcyan")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_options_3.png")`
#' }}
#'
#' Use letters as the marks for footnote references. Also, separate footnotes in
#' the footer by spaces instead of newlines.
#'
#' ```r
#' tab_1 |>
#'   tab_options(
#'     footnotes.marks = letters,
#'     footnotes.multiline = FALSE
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_options_4.png")`
#' }}
#'
#' Change the padding of data rows to 5 px.
#'
#' ```r
#' tab_1 |>
#'   tab_options(
#'     data_row.padding = px(5)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_options_5.png")`
#' }}
#'
#' Reduce the size of the title and the subtitle text.
#'
#' ```r
#' tab_1 |>
#'   tab_options(
#'     heading.title.font.size = "small",
#'     heading.subtitle.font.size = "small"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_options_6.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-12
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
tab_options <- function(
    data,
    table.width = NULL,
    table.layout = NULL,
    table.align = NULL,
    table.margin.left = NULL,
    table.margin.right = NULL,
    table.background.color = NULL,
    table.additional_css = NULL,
    table.font.names = NULL,
    table.font.size = NULL,
    table.font.weight = NULL,
    table.font.style = NULL,
    table.font.color = NULL,
    table.font.color.light = NULL,
    table.border.top.style = NULL,
    table.border.top.width = NULL,
    table.border.top.color = NULL,
    table.border.right.style = NULL,
    table.border.right.width = NULL,
    table.border.right.color = NULL,
    table.border.bottom.style = NULL,
    table.border.bottom.width = NULL,
    table.border.bottom.color = NULL,
    table.border.left.style = NULL,
    table.border.left.width = NULL,
    table.border.left.color = NULL,
    heading.background.color = NULL,
    heading.align = NULL,
    heading.title.font.size = NULL,
    heading.title.font.weight = NULL,
    heading.subtitle.font.size = NULL,
    heading.subtitle.font.weight = NULL,
    heading.padding = NULL,
    heading.padding.horizontal = NULL,
    heading.border.bottom.style = NULL,
    heading.border.bottom.width = NULL,
    heading.border.bottom.color = NULL,
    heading.border.lr.style = NULL,
    heading.border.lr.width = NULL,
    heading.border.lr.color = NULL,
    column_labels.background.color = NULL,
    column_labels.font.size = NULL,
    column_labels.font.weight = NULL,
    column_labels.text_transform = NULL,
    column_labels.padding = NULL,
    column_labels.padding.horizontal = NULL,
    column_labels.vlines.style = NULL,
    column_labels.vlines.width = NULL,
    column_labels.vlines.color = NULL,
    column_labels.border.top.style = NULL,
    column_labels.border.top.width = NULL,
    column_labels.border.top.color = NULL,
    column_labels.border.bottom.style = NULL,
    column_labels.border.bottom.width = NULL,
    column_labels.border.bottom.color = NULL,
    column_labels.border.lr.style = NULL,
    column_labels.border.lr.width = NULL,
    column_labels.border.lr.color = NULL,
    column_labels.hidden = NULL,
    row_group.background.color = NULL,
    row_group.font.size = NULL,
    row_group.font.weight = NULL,
    row_group.text_transform = NULL,
    row_group.padding = NULL,
    row_group.padding.horizontal = NULL,
    row_group.border.top.style = NULL,
    row_group.border.top.width = NULL,
    row_group.border.top.color = NULL,
    row_group.border.bottom.style = NULL,
    row_group.border.bottom.width = NULL,
    row_group.border.bottom.color = NULL,
    row_group.border.left.style = NULL,
    row_group.border.left.width = NULL,
    row_group.border.left.color = NULL,
    row_group.border.right.style = NULL,
    row_group.border.right.width = NULL,
    row_group.border.right.color = NULL,
    row_group.default_label = NULL,
    row_group.as_column = NULL,
    table_body.hlines.style = NULL,
    table_body.hlines.width = NULL,
    table_body.hlines.color = NULL,
    table_body.vlines.style = NULL,
    table_body.vlines.width = NULL,
    table_body.vlines.color = NULL,
    table_body.border.top.style = NULL,
    table_body.border.top.width = NULL,
    table_body.border.top.color = NULL,
    table_body.border.bottom.style = NULL,
    table_body.border.bottom.width = NULL,
    table_body.border.bottom.color = NULL,
    stub.background.color = NULL,
    stub.font.size = NULL,
    stub.font.weight = NULL,
    stub.text_transform = NULL,
    stub.border.style = NULL,
    stub.border.width = NULL,
    stub.border.color = NULL,
    stub.indent_length = NULL,
    stub_row_group.font.size = NULL,
    stub_row_group.font.weight = NULL,
    stub_row_group.text_transform = NULL,
    stub_row_group.border.style = NULL,
    stub_row_group.border.width = NULL,
    stub_row_group.border.color = NULL,
    data_row.padding = NULL,
    data_row.padding.horizontal = NULL,
    summary_row.background.color = NULL,
    summary_row.text_transform = NULL,
    summary_row.padding = NULL,
    summary_row.padding.horizontal = NULL,
    summary_row.border.style = NULL,
    summary_row.border.width = NULL,
    summary_row.border.color = NULL,
    grand_summary_row.background.color = NULL,
    grand_summary_row.text_transform = NULL,
    grand_summary_row.padding = NULL,
    grand_summary_row.padding.horizontal = NULL,
    grand_summary_row.border.style = NULL,
    grand_summary_row.border.width = NULL,
    grand_summary_row.border.color = NULL,
    footnotes.background.color = NULL,
    footnotes.font.size = NULL,
    footnotes.padding = NULL,
    footnotes.padding.horizontal = NULL,
    footnotes.border.bottom.style = NULL,
    footnotes.border.bottom.width = NULL,
    footnotes.border.bottom.color = NULL,
    footnotes.border.lr.style = NULL,
    footnotes.border.lr.width = NULL,
    footnotes.border.lr.color = NULL,
    footnotes.marks = NULL,
    footnotes.spec_ref = NULL,
    footnotes.spec_ftr = NULL,
    footnotes.multiline = NULL,
    footnotes.sep = NULL,
    source_notes.background.color = NULL,
    source_notes.font.size = NULL,
    source_notes.padding = NULL,
    source_notes.padding.horizontal = NULL,
    source_notes.border.bottom.style = NULL,
    source_notes.border.bottom.width = NULL,
    source_notes.border.bottom.color = NULL,
    source_notes.border.lr.style = NULL,
    source_notes.border.lr.width = NULL,
    source_notes.border.lr.color = NULL,
    source_notes.multiline = NULL,
    source_notes.sep = NULL,
    row.striping.background_color = NULL,
    row.striping.include_stub = NULL,
    row.striping.include_table_body = NULL,
    container.width = NULL,
    container.height = NULL,
    container.padding.x = NULL,
    container.padding.y = NULL,
    container.overflow.x = NULL,
    container.overflow.y = NULL,
    ihtml.active = NULL,
    ihtml.use_pagination = NULL,
    ihtml.use_pagination_info = NULL,
    ihtml.use_sorting = NULL,
    ihtml.use_search = NULL,
    ihtml.use_filters = NULL,
    ihtml.use_resizers = NULL,
    ihtml.use_highlight = NULL,
    ihtml.use_compact_mode = NULL,
    ihtml.use_text_wrapping = NULL,
    ihtml.use_page_size_select = NULL,
    ihtml.page_size_default = NULL,
    ihtml.page_size_values = NULL,
    ihtml.pagination_type = NULL,
    page.orientation = NULL,
    page.numbering = NULL,
    page.header.use_tbl_headings = NULL,
    page.footer.use_tbl_notes = NULL,
    page.width = NULL,
    page.height = NULL,
    page.margin.left = NULL,
    page.margin.right = NULL,
    page.margin.top = NULL,
    page.margin.bottom = NULL,
    page.header.height = NULL,
    page.footer.height = NULL,
    quarto.use_bootstrap = NULL,
    quarto.disable_processing = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Extract the options table from `data`
  opts_df <- dt_options_get(data = data)

  arg_names <-
    base::setdiff(
      names(formals(tab_options)),
      c("data", "ihtml.page_size_values", "ihtml.page_size_default")
    )

  arg_vals <- mget(arg_names)
  arg_vals <- arg_vals[!vapply(arg_vals, FUN = is.null, FUN.VALUE = logical(1))]
  arg_vals <- set_super_options(arg_vals = arg_vals)

  new_df <-
    dplyr::tibble(
      parameter = tidy_gsub(names(arg_vals), ".", "_", fixed = TRUE),
      value = unname(arg_vals)
    )
  new_df <-
    dplyr::left_join(
      new_df,
      dplyr::select(opts_df, parameter, type),
      by = "parameter"
    )
  new_df <-
    dplyr::mutate(
      new_df,
      value = mapply(
        preprocess_tab_option,
        option = value, var_name = parameter, type = type,
        SIMPLIFY = FALSE
      )
    )
  new_df <- dplyr::select(new_df, -type)

  # This rearranges the rows in the `opts_df` table, but this
  # shouldn't be a problem
  opts_df <-
    dplyr::bind_rows(
      dplyr::inner_join(
        new_df,
        dplyr::select(opts_df, -value),
        by = "parameter"
      ),
      dplyr::anti_join(opts_df, new_df, by = "parameter")
    )

  # Write the modified options table back to `data`
  data <- dt_options_set(data = data, options = opts_df)

  #
  # Handle special cases where option values are vectors
  #

  ihtml_page_size_values <- mget("ihtml.page_size_values")
  if (!is.null(ihtml_page_size_values[[1]])) {
    data <-
      dt_options_set_value(
        data = data,
        option = "ihtml_page_size_values",
        value = unname(unlist(ihtml_page_size_values))
      )
  }

  ihtml_page_size_default <- mget("ihtml.page_size_default")
  if (!is.null(ihtml_page_size_default[[1]])) {
    data <-
      dt_options_set_value(
        data = data,
        option = "ihtml_page_size_default",
        value = unname(unlist(ihtml_page_size_default))
      )
  }

  data
}

preprocess_tab_option <- function(option, var_name, type) {

  # Perform pre-processing on the option depending on `type`
  option <-
    switch(
      type,
      overflow = {
        if (isTRUE(option)) {
          "auto"
        } else if (is_false(option)) {
          "hidden"
        } else {
          option
        }
      },
      px = {
        if (is.numeric(option)) {
          px(option)
        } else {
          option
        }
      },
      option
    )

  # Perform `stopifnot()` checks by `type`
  switch(
    type,
    logical = stopifnot(rlang::is_scalar_logical(option), !any(is.na(option))),
    overflow = ,
    px = ,
    value = stopifnot(rlang::is_scalar_character(option), !any(is.na(option))),
    values = stopifnot(rlang::is_character(option), length(option) >= 1, !any(is.na(option)))
  )

  option
}

set_super_options <- function(arg_vals) {

  if ("table.align" %in% names(arg_vals)) {

    table_align_val <- arg_vals$table.align

    arg_vals$table.align <- NULL

    if (!(table_align_val %in% c("left", "center", "right"))) {
      cli::cli_abort(c(
        "The chosen option for `table.align` (`{table_align_val}`) is invalid.",
        "*" = "We can use either of \"left\", \"center\", or \"right\"."
      ))
    }

    arg_vals$table.margin.left <-
      arg_vals$table.margin.left %||%
      switch(
        table_align_val,
        center = "auto",
        left = "0",
        right = "auto"
      )

    arg_vals$table.margin.right <-
      arg_vals$table.margin.right %||%
      switch(
        table_align_val,
        center = "auto",
        left = "auto",
        right = "0"
      )
  }

  arg_vals
}
