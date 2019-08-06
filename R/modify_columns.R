#' Set the alignment of columns
#'
#' The individual alignments of columns (which includes the column labels and
#' all of their data cells) can be modified. We have the option to align text to
#' the `left`, the `center`, and the `right`. In a less explicit manner, we can
#' allow \pkg{gt} to automatically choose the alignment of each column based on
#' the data type (with the `auto` option).
#'
#' When you create a \pkg{gt} table object using [gt()], automatic alignment of
#' column labels and their data cells is performed. By default, left-alignment
#' is applied to columns of class `character`, `Date`, or `POSIXct`;
#' center-alignment is for columns of class `logical`, `factor`, or `list`; and
#' right-alignment is used for the `numeric` and `integer` columns.
#'
#' @param data A table object that is created using the [gt()] function.
#' @param align The alignment type. This can be any of `"center"`, `"left"`, or
#'   `"right"` for center-, left-, or center-alignment. Alternatively, the
#'   `"auto"` option (the default), will automatically align values in columns
#'   according to the data type (see the Details section for specifics on which
#'   alignments are applied).
#' @param columns An optional vector of column names for which the alignment
#'   should be applied. If nothing is supplied, or if `columns` is `TRUE`), then
#'   the chosen alignment affects all columns.
#' @return An object of class `gt_tbl`.
#' @examples
#' # Use `countrypops` to create a gt table;
#' # align the `population` column data to
#' # the left
#' tab_1 <-
#'   countrypops %>%
#'   dplyr::select(-contains("code")) %>%
#'   dplyr::filter(country_name == "Mongolia") %>%
#'   tail(5) %>%
#'   gt() %>%
#'   cols_align(
#'     align = "left",
#'     columns = vars(population)
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_cols_align_1.svg}{options: width=100\%}}
#'
#' @family column modification functions
#' @export
cols_align <- function(data,
                       align = c("auto", "left", "center", "right"),
                       columns = TRUE) {

  # Get the `align` value, this stops the function if there is no match
  align <- match.arg(align)

  columns <- enquo(columns)

  # Get the columns supplied in `columns` as a character vector
  column_names <- resolve_vars(var_expr = !!columns, data = data)

  if (align == "auto") {

    # Obtain a vector of column classes for each of the column
    # names
    col_classes <-
      lapply(
        attr(data, "data_df", exact = TRUE)[column_names], class) %>%
      lapply(`[[`, 1) %>%
      unlist()

    # Get a vector of `align` values based on the column classes
    align <- sapply(
      col_classes, switch,
      "character" = "left",
      "Date" = "left",
      "POSIXct" = "left",
      "logical" = "center",
      "factor" = "center",
      "list" = "center",
      "numeric" = "right",
      "integer" = "center",
      "center") %>%
      unname()
  }

  # Set the alignment value for all columns in `columns`
  attr(data, "boxh_df")["column_align", column_names] <- align

  data
}

#' Set the widths of columns
#'
#' Manual specifications of column widths can be performed using the
#' `cols_width()` function.  We choose which columns get specific widths (in
#' pixels, usually by use of the [px()] helper function) and all other columns
#' are assigned a default width value though the `.others` argument. Width
#' assignments are supplied in `...` through two-sided formulas, where the
#' left-hand side defines the target columns and the right-hand side is a single
#' width value in pixels.
#'
#' Normally, column widths are automatically set to span across the width of the
#' container (both table and container widths can be individually modified with
#' the `table.width` and `container.width` options within [tab_options()]). When
#' using `cols_width()` though, the `table.width` option is disregarded in
#' favor of the pixel values set for each column.
#'
#' @inheritParams cols_align
#' @param ... Expressions for the assignment of column widths for the table
#'   columns in `data`. Two-sided formulas (e.g, `<LHS> ~ <RHS>`) can be used,
#'   where the left-hand side corresponds to selections of columns and the
#'   right-hand side evaluates to single-length character values in the form
#'   `{##}px` (i.e., pixel dimensions); the [px()] helper function is best used
#'   for this purpose. Column names should be enclosed in [vars()]. The
#'   column-based select helpers [starts_with()], [ends_with()], [contains()],
#'   [matches()], [one_of()], and [everything()] can be used in the LHS.
#'   Subsequent expressions that operate on the columns assigned previously will
#'   result in overwriting column width values (both in the same `cols_width()`
#'   call and across separate calls).
#' @param .list Allows for the use of a list as an input alternative to `...`.
#' @return An object of class `gt_tbl`.
#' @examples
#' # Use `exibble` to create a gt table;
#' # with named arguments in `...`, we
#' # can specify the exact widths for
#' # table columns (using `TRUE` will
#' # capture all remaining columns)
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(
#'     num, char, date,
#'     datetime, row
#'   ) %>%
#'   gt() %>%
#'   cols_width(
#'     vars(num) ~ px(150),
#'     ends_with("r") ~ px(100),
#'     starts_with("date") ~ px(200),
#'     TRUE ~ px(60)
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_cols_width_1.svg}{options: width=100\%}}
#'
#' @family column modification functions
#' @export
cols_width <- function(data,
                       ...,
                       .list = list2(...)) {

  # Collect a named list of column widths
  widths_list <- .list

  # If nothing is provided, return `data` unchanged
  if (length(widths_list) == 0) {
    stop("Nothing was provided to `...`:\n",
         " * Use formula expressions to define custom column widths",
         call. = FALSE)
  }

  # Extract the `col_names` list from `data/boxh_df`
  boxh_df <- attr(data, "boxh_df", exact = TRUE)

  all_formulas <-
    all(
      vapply(
        widths_list,
        FUN = function(width) rlang::is_formula(width),
        FUN.VALUE = logical(1)
      )
    )

  if (!all_formulas) {
    stop("Only two-sided formulas should be provided to `...`",
         call. = FALSE)
  }

  columns_used <- NULL

  for (width_item in widths_list) {

    cols <- width_item %>% rlang::f_lhs()

    columns <-
      resolve_vars(
        var_expr = !!cols,
        data = data
      ) %>%
      base::setdiff(columns_used)

    columns_used <- c(columns_used, columns)

    width <-
      width_item %>%
      rlang::f_rhs() %>%
      rlang::eval_tidy()

    boxh_df["column_width", ][columns] <- width
  }

  attr(data, "boxh_df") <- boxh_df

  data
}

#' Relabel one or more columns
#'
#' Column labels can be modified from their default values (the names of the
#' columns from the input table data). When you create a \pkg{gt} table object
#' using [gt()], column names effectively become the column labels. While this
#' serves as a good first approximation, column names aren't often appealing as
#' column labels in a \pkg{gt} output table. The `cols_label()` function
#' provides the flexibility to relabel one or more columns and we even have the
#' option to use the [md()] or [html()] helper functions for rendering column
#' labels from Markdown or using HTML.
#'
#' It's important to note that while columns can be freely relabeled, we
#' continue to refer to columns by their original column names. Column names in
#' a tibble or data frame must be unique whereas column labels in \pkg{gt} have
#' no requirement for uniqueness (which is useful for labeling columns as, say,
#' measurement units that may be repeated several times---usually under
#' different spanner column labels). Thus, we can still easily distinguish
#' between columns in other \pkg{gt} function calls (e.g., in all of the
#' `fmt*()` functions) even though we may lose distinguishability in column
#' labels once they have been relabeled.
#'
#' @inheritParams cols_align
#' @param ... One or more named arguments of column names from the input `data`
#'   table along with their labels for display as the column labels. We can
#'   optionally wrap the column labels with [md()] (to interpret text as
#'   Markdown) or [html()] (to interpret text as HTML).
#' @param .list Allows for the use of a list as an input alternative to `...`.
#' @return An object of class `gt_tbl`.
#' @examples
#' # Use `countrypops` to create a gt table;
#' # label all the table's columns to
#' # present better
#' tab_1 <-
#'   countrypops %>%
#'   dplyr::select(-contains("code")) %>%
#'   dplyr::filter(country_name == "Mongolia") %>%
#'   tail(5) %>%
#'   gt() %>%
#'   cols_label(
#'     country_name = "Name",
#'     year = "Year",
#'     population = "Population"
#'   )
#'
#' # Use `countrypops` to create a gt table;
#' # label columns as before but make them
#' # bold with markdown formatting
#' tab_2 <-
#'   countrypops %>%
#'   dplyr::select(-contains("code")) %>%
#'   dplyr::filter(country_name == "Mongolia") %>%
#'   tail(5) %>%
#'   gt() %>%
#'   cols_label(
#'     country_name = md("**Name**"),
#'     year = md("**Year**"),
#'     population = md("**Population**")
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_cols_label_1.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_cols_label_2.svg}{options: width=100\%}}
#'
#' @family column modification functions
#' @import rlang
#' @export
cols_label <- function(data,
                       ...,
                       .list = list2(...)) {

  # Collect a named list of column labels
  labels_list <- .list

  # If nothing is provided, return `data` unchanged
  if (length(labels_list) == 0) {
    return(data)
  }

  # Test for names being NULL
  if (is.null(names(labels_list))) {
    stop("Named arguments are required for `cols_label()`.", call. = FALSE)
  }

  # Test for any missing names
  if (any(names(labels_list) == "")) {
    stop("All arguments to `cols_label()` must be named.", call. = FALSE)
  }

  # Extract the `col_labels` list from `data`
  col_labels <- attr(data, "col_labels", exact = TRUE)

  # Stop function if any of the column names specified are not in `cols_labels`
  if (!all(names(labels_list) %in% names(col_labels))) {
    stop("All column names provided must exist in the input `data` table.")
  }

  # Filter the list of labels by the names in `col_labels`
  labels_list <- labels_list[names(labels_list) %in% names(col_labels)]

  # If no labels remain after filtering, return the data
  if (length(labels_list) == 0) {
    return(data)
  }

  col_labels[names(labels_list)] <- labels_list

  # Set the `col_labels` attr with the `col_labels` object
  attr(data, "col_labels") <- col_labels

  data
}

#' Move one or more columns
#'
#' On those occasions where you need to move columns this way or that way, we
#' can make use of the `cols_move()` function. While it's true that the movement
#' of columns can be done upstream of \pkg{gt}'s API, it is much easier and less
#' error prone to use the function provided here. The movement procedure here
#' takes one or more specified columns (in the `columns` argument) and places
#' them to the right of a different column (the `after` argument). The ordering
#' of the `columns` to be moved is preserved, as is the ordering of all other
#' columns in the table.
#'
#' The columns supplied in `columns` must all exist in the table and none of
#' them can be in the `after` argument. The `after` column must also exist and
#' only one column should be provided here. If you need to place one or columns
#' at the beginning of the column series, the [cols_move_to_start()] function
#' should be used. Similarly, if those columns to move should be placed at the
#' end of the column series then use [cols_move_to_end()].
#'
#' @inheritParams cols_align
#' @param columns The column names to move to as a group to a different
#'   position. The order of the remaining columns will be preserved.
#' @param after A column name used to anchor the insertion of the moved columns.
#'   All of the moved columns will be placed to the right of this column.
#' @return An object of class `gt_tbl`.
#' @examples
#' # Use `countrypops` to create a gt table;
#' # With the remaining columns, position
#' # `population` after `country_name`
#' tab_1 <-
#'   countrypops %>%
#'   dplyr::select(-contains("code")) %>%
#'   dplyr::filter(country_name == "Mongolia") %>%
#'   tail(5) %>%
#'   gt() %>%
#'   cols_move(
#'     columns = vars(population),
#'     after = vars(country_name)
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_cols_move_1.svg}{options: width=100\%}}
#'
#' @family column modification functions
#' @import rlang
#' @export
cols_move <- function(data,
                      columns,
                      after) {

  columns <- enquo(columns)
  after <- enquo(after)

  # Get the columns supplied in `columns` as a character vector
  columns <- resolve_vars(var_expr = !!columns, data = data)

  # Get the `after` columns as a character vector
  after <- resolve_vars(var_expr = !!after, data = data)

  # Extract the internal `boxh_df` table
  boxh_df <- attr(data, "boxh_df", exact = TRUE)

  # Extract the `data_df` df from `data`
  data_df <- as.data.frame(data)

  # Stop function if `after` contains multiple columns
  if (length(after) > 1) {
    stop("Only one column name should be supplied to `after`.",
         call. = FALSE)
  }

  # Stop function if `after` doesn't exist in `data_df`
  if (!(after %in% colnames(data_df))) {
    stop("The column supplied to `after` doesn't exist in the input `data` table.",
         call. = FALSE)
  }

  # Stop function if any of the `columns` doesn't exist in `data_df`
  if (!all(columns %in% colnames(data_df))) {
    stop("All `columns` must exist in the input `data` table.",
         call. = FALSE)
  }

  # Filter the vector of column names by the
  # column names actually in `boxh_df`
  columns <- columns[which(columns %in% colnames(boxh_df))]

  if (length(columns) == 0) {
    return(data)
  }

  # Get the remaining column names in the table
  column_names <- base::setdiff(colnames(boxh_df), columns)

  # Get the column index for where the set
  # of `columns` should be inserted after
  column_index <- which(column_names == after)

  if (length(columns) > 0 & column_index != length(column_names)) {

    attr(data, "boxh_df") <- attr(data, "boxh_df") %>%
      dplyr::select(
        column_names[1:column_index], columns,
        column_names[(column_index + 1):length(column_names)])

  } else if (length(columns) > 0 & column_index == length(column_names)) {

    attr(data, "boxh_df") <- attr(data, "boxh_df") %>%
      dplyr::select(column_names[1:column_index], columns)
  }

  data
}

#' Move one or more columns to the start
#'
#' We can easily move set of columns to the beginning of the column series and
#' we only need to specify which `columns`. It's possible to do this upstream of
#' \pkg{gt}'s API, however, it is easier with this function and it presents less
#' possibility for error. The ordering of the `columns` that are moved to the
#' start is preserved (same with the ordering of all other columns in the
#' table).
#'
#' The columns supplied in `columns` must all exist in the table. If you need to
#' place one or columns at the end of the column series, the
#' [cols_move_to_end()] function should be used. More control is offered with
#' the [cols_move()] function, where columns could be placed after a specific
#' column.
#'
#' @inheritParams cols_align
#' @param columns The column names to move to the left-most side of the table.
#'   The order in which columns are provided will be preserved (as is the case
#'   with the remaining columns).
#' @return An object of class `gt_tbl`.
#' @examples
#' # Use `countrypops` to create a gt table;
#' # With the remaining columns, move the
#' # `year` column to the start
#' tab_1 <-
#'   countrypops %>%
#'   dplyr::select(-contains("code")) %>%
#'   dplyr::filter(country_name == "Mongolia") %>%
#'   tail(5) %>%
#'   gt() %>%
#'   cols_move_to_start(
#'     columns = vars(year)
#'   )
#'
#' # Use `countrypops` to create a gt table;
#' # With the remaining columns, move `year`
#' # and `population` to the start
#' tab_2 <-
#'   countrypops %>%
#'   dplyr::select(-contains("code")) %>%
#'   dplyr::filter(country_name == "Mongolia") %>%
#'   tail(5) %>%
#'   gt() %>%
#'   cols_move_to_start(
#'     columns = vars(year, population)
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_cols_move_to_start_1.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_cols_move_to_start_2.svg}{options: width=100\%}}
#'
#' @family column modification functions
#' @import rlang
#' @export
cols_move_to_start <- function(data,
                               columns) {

  columns <- enquo(columns)

  # Get the columns supplied in `columns` as a character vector
  columns <- resolve_vars(var_expr = !!columns, data = data)

  # Extract the internal `boxh_df` table
  boxh_df <- attr(data, "boxh_df", exact = TRUE)

  # Extract the `data_df` df from `data`
  data_df <- as.data.frame(data)

  # Stop function if any of the `columns` doesn't exist in `data_df`
  if (!all(columns %in% colnames(data_df))) {
    stop("All `columns` must exist in the input `data` table.",
         call. = FALSE)
  }

  # Filter the vector of column names by the
  # column names actually in the input df
  columns <- columns[which(columns %in% colnames(boxh_df))]

  if (length(columns) == 0) {
    return(data)
  }

  attr(data, "boxh_df") <- attr(data, "boxh_df") %>% dplyr::select(columns, everything())

  data
}

#' Move one or more columns to the end
#'
#' It's possible to move a set of columns to the end of the column series, we
#' only need to specify which `columns` are to be moved. While this can be done
#' upstream of \pkg{gt}'s API, this function makes to process much easier and
#' it's less error prone. The ordering of the `columns` that are moved to the
#' end is preserved (same with the ordering of all other columns in the table).
#'
#' The columns supplied in `columns` must all exist in the table. If you need to
#' place one or columns at the start of the column series, the
#' [cols_move_to_start()] function should be used. More control is offered with
#' the [cols_move()] function, where columns could be placed after a specific
#' column.
#'
#' @inheritParams cols_align
#' @param columns The column names to move to the right-most side of the table.
#'   The order in which columns are provided will be preserved (as is the case
#'   with the remaining columns).
#' @return An object of class `gt_tbl`.
#' @examples
#' # Use `countrypops` to create a gt table;
#' # With the remaining columns, move the
#' # `year` column to the end
#' tab_1 <-
#'   countrypops %>%
#'   dplyr::select(-contains("code")) %>%
#'   dplyr::filter(country_name == "Mongolia") %>%
#'   tail(5) %>%
#'   gt() %>%
#'   cols_move_to_end(
#'     columns = vars(year)
#'   )
#'
#' # Use `countrypops` to create a gt table;
#' # With the remaining columns, move `year`
#' # and `country_name` to the end
#' tab_2 <-
#'   countrypops %>%
#'   dplyr::select(-contains("code")) %>%
#'   dplyr::filter(country_name == "Mongolia") %>%
#'   tail(5) %>%
#'   gt() %>%
#'   cols_move_to_end(
#'     columns = vars(year, country_name)
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_cols_move_to_end_1.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_cols_move_to_end_2.svg}{options: width=100\%}}
#'
#' @family column modification functions
#' @import rlang
#' @export
cols_move_to_end <- function(data,
                             columns) {

  columns <- enquo(columns)

  # Get the columns supplied in `columns` as a character vector
  columns <- resolve_vars(var_expr = !!columns, data = data)

  # Extract the internal `boxh_df` table
  boxh_df <- attr(data, "boxh_df", exact = TRUE)

  # Extract the `data_df` df from `data`
  data_df <- as.data.frame(data)

  # Stop function if any of the `columns` doesn't exist in `data_df`
  if (!all(columns %in% colnames(data_df))) {
    stop("All `columns` must exist in the input `data` table.",
         call. = FALSE)
  }

  # Filter the vector of column names by the
  # column names actually in the input df
  columns <- columns[which(columns %in% colnames(boxh_df))]

  if (length(columns) == 0) {
    return(data)
  }

  # Organize a vector of column names for `dplyr::select()`
  columns <- c(base::setdiff(colnames(boxh_df), columns), columns)

  attr(data, "boxh_df") <- attr(data, "boxh_df") %>% dplyr::select(columns)

  data
}

#' Hide one or more columns
#'
#' The `cols_hide()` function allows us to hide one or more columns from
#' appearing in the final output table. While it's possible and often desirable
#' to omit columns from the input table data before introduction to the [gt()]
#' function, there can be cases where the data in certain columns is useful (as
#' a column reference during formatting of other columns) but the final display
#' of those columns is not necessary.
#'
#' The hiding of columns is internally a rendering directive, so, all columns
#' that are 'hidden' are still accessible and useful in any expression provided
#' to a `rows` argument. Furthermore, the `cols_hide()` function (as with many
#' \pkg{gt} functions) can be placed anywhere in a pipeline of \pkg{gt} function
#' calls (acting as a promise to hide columns when the timing is right). However
#' there's perhaps greater readability when placing this call closer to the end
#' of such a pipeline.
#'
#' @inheritParams cols_align
#' @param columns The column names to hide from the output display table. The
#'   order of the remaining columns will be preserved. Values provided that do
#'   not correspond to column names will be disregarded.
#' @return An object of class `gt_tbl`.
#' @examples
#' # Use `countrypops` to create a gt table;
#' # Hide the columns `country_code_2` and
#' # `country_code_3`
#' tab_1 <-
#'   countrypops %>%
#'   dplyr::filter(country_name == "Mongolia") %>%
#'   tail(5) %>%
#'   gt() %>%
#'   cols_hide(
#'     columns = vars(
#'       country_code_2, country_code_3)
#'   )
#'
#' # Use `countrypops` to create a gt table;
#' # Use the `population` column to provide
#' # the conditional placement of footnotes,
#' # then hide that column and one other
#' tab_2 <-
#'   countrypops %>%
#'   dplyr::filter(country_name == "Mongolia") %>%
#'   tail(5) %>%
#'   gt() %>%
#'   cols_hide(
#'     columns = vars(country_code_3, population)
#'   ) %>%
#'   tab_footnote(
#'     footnote = "Population above 3,000,000.",
#'     locations = cells_data(
#'       columns = vars(year),
#'       rows = population > 3000000)
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_cols_hide_1.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_cols_hide_2.svg}{options: width=100\%}}
#'
#' @family column modification functions
#' @import rlang
#' @export
cols_hide <- function(data,
                      columns) {

  columns <- enquo(columns)

  # Get the columns supplied in `columns` as a character vector
  columns <- resolve_vars(var_expr = !!columns, data = data)

  boxh_df <- attr(data, "boxh_df")

  # Filter the vector of column names by the
  # column names actually in the input df
  columns <- columns[which(columns %in% colnames(boxh_df))]

  if (length(columns) == 0) {
    return(data)
  }

  # Organize a vector of column names for `dplyr::select()`
  columns <- c(base::setdiff(colnames(boxh_df), columns))

  attr(data, "boxh_df") <- attr(data, "boxh_df") %>% dplyr::select(columns)

  data
}

#' Create group names and column labels via delimited names
#'
#' This function will split selected delimited column names such that the first
#' components (LHS) are promoted to being spanner column labels, and the
#' secondary components (RHS) will become the column labels. Please note that
#' reference to individual columns must continue to be the column names from the
#' input table data (which are unique by necessity).
#'
#' If we look to the column names in the `iris` dataset as an example of how
#' `cols_split_delim()` might be useful, we find the names `Sepal.Length`,
#' `Sepal.Width`, `Petal.Length`, `Petal.Width`. From this naming system, it's
#' easy to see that the `Sepal` and `Petal` can group together the repeated
#' common `Length` and `Width` values. In your own datasets, we can avoid a
#' lengthy relabeling with [cols_label()] if column names can be fashioned
#' beforehand to contain both the spanner column label and the column label. An
#' additional advantage is that the column names in the input table data remain
#' unique even though there may eventually be repeated column labels in the
#' rendered output table).
#'
#' @inheritParams cols_align
#' @param delim The delimiter to use to split an input column name. The
#'   delimiter supplied will be autoescaped for the internal splitting
#'   procedure. The first component of the split will become the group name and
#'   the second component will be the column label.
#' @param columns An optional vector of column names that this operation should
#'   be limited to. The default is to consider all columns in the table.
#' @return An object of class `gt_tbl`.
#' @examples
#' # Use `iris` to create a gt table; split
#' # any columns that are dot-separated
#' # between column spanner labels (first
#' # part) and column labels (second part)
#' tab_1 <-
#'   iris %>%
#'   dplyr::group_by(Species) %>%
#'   dplyr::slice(1:4) %>%
#'   gt() %>%
#'   cols_split_delim(delim = ".")
#'
#' @section Figures:
#' \if{html}{\figure{man_cols_split_delim_1.svg}{options: width=100\%}}
#'
#' @family column modification functions
#' @export
cols_split_delim <- function(data,
                             delim,
                             columns = NULL) {

  columns <- enquo(columns)

  # Escape any characters that require escaping
  delim <- gsub("\\.", "\\\\.", delim)

  boxh_df <- attr(data, "boxh_df", exact = TRUE)
  grp_labels <- attr(data, "grp_labels", exact = TRUE)
  col_labels <- attr(data, "col_labels", exact = TRUE)

  # Get all of the columns in the dataset
  all_cols <- colnames(boxh_df)

  # Get the columns supplied in `columns` as a character vector
  columns <-
    resolve_vars(
      var_expr = !!columns,
      data = data
    )

  if (!is.null(columns)) {
    colnames <- base::intersect(all_cols, columns)
  } else {
    colnames <- all_cols
  }

  if (length(colnames) == 0) {
    return(data)
  }

  colnames_has_delim <- grepl(paste0("[^.]", delim, "[^.]"), colnames)

  if (!any(colnames_has_delim)) {
    return(data)
  }

  split_colnames <- strsplit(colnames[colnames_has_delim], delim)

  group_label <- vapply(split_colnames, `[[`, character(1), 1)

  boxh_df["group_label", colnames[colnames_has_delim]] <- group_label

  grp_labels[colnames[colnames_has_delim]] <- group_label

  col_labels[colnames[colnames_has_delim]] <-
    vapply(split_colnames, `[[`, character(1), 2)

  attr(data, "boxh_df") <- boxh_df
  attr(data, "grp_labels") <- grp_labels
  attr(data, "col_labels") <- col_labels

  data
}

#' Merge two columns to a single column
#'
#' This function takes any two columns and merges them into a single column,
#' using a pattern that specifies how the values in the data cells are combined.
#' We specify the columns to merge together in the `col_1` and `col_2` arguments
#' and the string-combining pattern is specified in `pattern`. The column that
#' is retained is that of `col_1` whereas the column specified in `col_2` is
#' dropped from the output table.
#'
#' There are two other column-merging functions that offer specialized behavior
#' that is optimized for common table tasks: [cols_merge_range()] and
#' [cols_merge_uncert()]. These functions operate similarly, where the second
#' column specified is dropped from the output table. For all of the
#' `cols_merge*()` functions, column removal occurs late in the rendering
#' lifecycle so those secondary columns are still usable as column references
#' (e.g., inside expressions provided to `rows` in the `fmt*()` functions).
#'
#' @inheritParams cols_align
#' @param col_1 A retained column that contains values to be merged with those
#'   in `col_2`.
#' @param col_2 A column that contains values to be merged with those in
#'   `col_1`. This column will be discarded but is still useful as a reference
#'   in other \pkg{gt} functions.
#' @param pattern A formatting pattern that specifies the arrangement of the
#'   `col_1` and `col_1` values and any string literals. The `col_1` column is
#'   represented as `{1}` whereas `col_2` is `{2}`. All other characters are
#'   taken to be string literals.
#' @return An object of class `gt_tbl`.
#' @examples
#' # Use `sp500` to create a gt table;
#' # merge the `open` & `close` columns
#' # together, and, the `low` & `high`
#' # columns (putting an em dash between
#' # both); rename the columns
#' tab_1 <-
#'   sp500 %>%
#'   dplyr::slice(50:55) %>%
#'   dplyr::select(-volume, -adj_close) %>%
#'   gt() %>%
#'   cols_merge(
#'     col_1 = vars(open),
#'     col_2 = vars(close),
#'     pattern = "{1}&mdash;{2}"
#'   ) %>%
#'   cols_merge(
#'     col_1 = vars(low),
#'     col_2 = vars(high),
#'     pattern = "{1}&mdash;{2}"
#'   ) %>%
#'   cols_label(
#'     open = "open/close",
#'     low = "low/high"
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_cols_merge_1.svg}{options: width=100\%}}
#'
#' @family column modification functions
#' @import rlang
#' @export
cols_merge <- function(data,
                       col_1,
                       col_2,
                       pattern = "{1} {2}") {

  col_1 <- enquo(col_1)
  col_2 <- enquo(col_2)

  # Get the columns supplied in `col_1` as a character vector
  col_1 <- resolve_vars(var_expr = !!col_1, data = data)

  # Get the columns supplied in `col_2` as a character vector
  col_2 <- resolve_vars(var_expr = !!col_2, data = data)

  # Create a named character vector using
  # `col_1` and `col_2`
  col_1 <- stats::setNames(col_1, nm = col_2)

  # Create and store a list of column pairs
  if ("col_merge" %in% names(attributes(data))) {

    if (col_1 %in% unname(attr(data, "col_merge")[["col_1"]]) |
        col_2 %in% names(attr(data, "col_merge")[["col_1"]])) {
      return(data)
    }

    attr(data, "col_merge")[["pattern"]] <-
      c(attr(data, "col_merge")[["pattern"]], pattern)

    attr(data, "col_merge")[["sep"]] <-
      c(attr(data, "col_merge")[["sep"]], "")

    attr(data, "col_merge")[["col_1"]] <-
      c(attr(data, "col_merge")[["col_1"]], col_1)

  } else {

    attr(data, "col_merge") <-
      list(
        pattern = pattern,
        sep = "",
        col_1 = col_1
      )
  }

  data
}

#' Merge two columns to a value & uncertainty column
#'
#' The `cols_merge_uncert()` function is a specialized variant of the
#' [cols_merge()] function. It operates by taking a base value column
#' (`col_val`) and an uncertainty column (`col_uncert`) and merges them into a
#' single column. What results is a column with values and associated
#' uncertainties (e.g., `12.0 ± 0.1`), and, the column specified in `col_uncert`
#' is dropped from the output table.
#'
#' This function could be somewhat replicated using [cols_merge()], however,
#' `cols_merge_uncert()` employs the following specialized semantics for `NA`
#' handling:
#'
#' \enumerate{
#'
#' \item `NA`s in `col_val` result in missing values for the merged
#' column (e.g., `NA` + `0.1` = `NA`)
#'
#' \item `NA`s in `col_uncert` (but not `col_val`) result in
#' base values only for the merged column (e.g.,
#' `12.0` + `NA` = `12.0`)
#'
#' \item `NA`s both `col_val` and `col_uncert` result in
#' missing values for the merged column (e.g., `NA` + `NA` =
#' `NA`)
#' }
#'
#' Any resulting `NA` values in the `col_val` column following the merge
#' operation can be easily formatted using the [fmt_missing()] function.
#'
#' This function is part of a set of three column-merging functions. The other
#' two are the general [cols_merge()] function and the specialized
#' [cols_merge_range()] function. These functions operate similarly, where the
#' second column specified is dropped from the output table. For all of the
#' `cols_merge*()` functions, column removal occurs late in the rendering
#' lifecycle so those secondary columns are still usable as column references
#' (e.g., inside expressions provided to `rows` in the `fmt*()` functions).
#'
#' @inheritParams cols_align
#' @param col_val A single column name that contains the base values.
#' @param col_uncert A single column name that contains the uncertainty values.
#' @return An object of class `gt_tbl`.
#' @examples
#' # Use `exibble` to create a gt table,
#' # keeping only the `currency` and `num`
#' # columns; merge columns into one with
#' # a base value and uncertainty (after
#' # formatting the `num` column)
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(currency, num) %>%
#'   dplyr::slice(1:7) %>%
#'   gt() %>%
#'   fmt_number(
#'     columns = vars(num),
#'     decimals = 3,
#'     use_seps = FALSE
#'   ) %>%
#'   cols_merge_uncert(
#'     col_val = vars(currency),
#'     col_uncert = vars(num)
#'   ) %>%
#'   cols_label(
#'     currency = "value + uncert."
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_cols_merge_uncert_1.svg}{options: width=100\%}}
#'
#' @family column modification functions
#' @import rlang
#' @export
cols_merge_uncert <- function(data,
                              col_val,
                              col_uncert) {

  # Set the formatting pattern
  pattern <- "{1} \u00B1 {2}"

  col_val <- enquo(col_val)
  col_uncert <- enquo(col_uncert)

  # Get the columns supplied in `col_val` as a character vector
  col_val <- resolve_vars(var_expr = !!col_val, data = data)

  # Get the columns supplied in `col_val` as a character vector
  col_uncert <- resolve_vars(var_expr = !!col_uncert, data = data)

  # Create a named character vector using
  # `col_val` and `col_uncert`
  col_val <- stats::setNames(col_val, nm = col_uncert)

  # Create and store a list of column pairs
  if ("col_merge" %in% names(attributes(data))) {

    if (col_val %in% unname(attr(data, "col_merge")[["col_1"]]) |
        col_uncert %in% names(attr(data, "col_merge")[["col_1"]])) {
      return(data)
    }

    attr(data, "col_merge")[["pattern"]] <-
      c(attr(data, "col_merge")[["pattern"]], pattern)

    attr(data, "col_merge")[["sep"]] <-
      c(attr(data, "col_merge")[["sep"]], "")

    attr(data, "col_merge")[["col_1"]] <-
      c(attr(data, "col_merge")[["col_1"]], col_val)

  } else {

    attr(data, "col_merge") <-
      list(
        pattern = pattern,
        sep = "",
        col_1 = col_val
      )
  }

  data
}

#' Merge two columns to a value range column
#'
#' The `cols_merge_range()` function is a specialized variant of the
#' [cols_merge()] function. It operates by taking a two columns that constitute
#' a range of values (`col_begin` and `col_end`) and merges them into a single
#' column. What results is a column containing both values separated by a long
#' dash (e.g., `12.0 — 20.0`). The column specified in `col_end` is dropped from
#' the output table.
#'
#' This function could be somewhat replicated using [cols_merge()], however,
#' `cols_merge_range()` employs the following specialized semantics for `NA`
#' handling:
#'
#' \enumerate{
#'
#' \item `NA`s in `col_begin` result in missing values for the merged
#' column (e.g., `NA` + `20.0` = `NA`)
#'
#' \item `NA`s in `col_end` (but not `col_begin`) result in a display of only
#' the `col_begin` values only for the merged column
#' (e.g., `12.0` + `NA` = `12.0`)
#'
#' \item `NA`s both in `col_begin` and `col_end` result in missing values for
#' the merged column (e.g., `NA` + `NA` = `NA`)
#' }
#'
#' Any resulting `NA` values in the `col_begin` column following the merge
#' operation can be easily formatted using the [fmt_missing()] function.
#'
#' This function is part of a set of three column-merging functions. The other
#' two are the general [cols_merge()] function and the specialized
#' [cols_merge_uncert()] function. These functions operate similarly, where the
#' second column specified is dropped from the output table. For all of the
#' `cols_merge*()` functions, column removal occurs late in the rendering
#' lifecycle so those secondary columns are still usable as column references
#' (e.g., inside expressions provided to `rows` in the `fmt*()` functions).
#'
#' @inheritParams cols_align
#' @param col_begin A column that contains values for the start of the range.
#' @param col_end A column that contains values for the end of the range.
#' @param sep The separator text that indicates the values are ranged.
#' @return An object of class `gt_tbl`.
#' @examples
#' # Use `gtcars` to create a gt table,
#' # keeping only the `model`, `mpg_c`,
#' # and `mpg_h` columns; merge the mpg
#' # columns together as a single range
#' # column (which is labeled as MPG,
#' # in italics)
#' tab_1 <-
#'   gtcars %>%
#'   dplyr::select(model, starts_with("mpg")) %>%
#'   dplyr::slice(1:8) %>%
#'   gt() %>%
#'   cols_merge_range(
#'     col_begin = vars(mpg_c),
#'     col_end = vars(mpg_h)) %>%
#'   cols_label(
#'     mpg_c = md("*MPG*")
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_cols_merge_range_1.svg}{options: width=100\%}}
#'
#' @family column modification functions
#' @import rlang
#' @export
cols_merge_range <- function(data,
                             col_begin,
                             col_end,
                             sep = "---") {

  # Set the formatting pattern
  pattern <- "{1} {sep} {2}"

  col_begin <- enquo(col_begin)
  col_end <- enquo(col_end)

  # Get the columns supplied in `col_begin` as a character vector
  col_begin <- resolve_vars(var_expr = !!col_begin, data = data)

  # Get the columns supplied in `col_end` as a character vector
  col_end <- resolve_vars(var_expr = !!col_end, data = data)

  # Create a named character vector using
  # `col_begin` and `col_end`
  col_begin <- stats::setNames(col_begin, nm = col_end)

  # Create and store a list of column pairs
  if ("col_merge" %in% names(attributes(data))) {

    if (col_begin %in% unname(attr(data, "col_merge")[["col_1"]]) |
        col_end %in% names(attr(data, "col_merge")[["col_1"]])) {
      return(data)
    }

    attr(data, "col_merge")[["pattern"]] <-
      c(attr(data, "col_merge")[["pattern"]], pattern)

    attr(data, "col_merge")[["sep"]] <-
      c(attr(data, "col_merge")[["sep"]], sep)

    attr(data, "col_merge")[["col_1"]] <-
      c(attr(data, "col_merge")[["col_1"]], col_begin)

  } else {

    attr(data, "col_merge") <-
      list(
        pattern = pattern,
        sep = sep,
        col_1 = col_begin
      )
  }

  data
}
