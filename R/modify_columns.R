#' Set the alignment of columns
#' @param data a table object that is created using the \code{\link{gt}()}
#' function.
#' @param align the alignment type. This can be any of \code{"center"},
#'   \code{"left"}, or \code{"right"} for center-, left-, or center-alignment.
#'   Alternatively, the \code{"auto"} option (the default), will automatically
#'   align values in columns according to the data type (i.e., column class). In
#'   this way, left-alignment is applied to columns of class \code{character},
#'   \code{Date}, or \code{POSIXct}; center-alignment is for columns of class
#'   \code{logical}, \code{factor}, or \code{list}; and right-aligned is for the
#'   \code{numeric} and \code{integer} columns.
#' @param columns an optional vector of column names for which the alignment
#'   should be applied. If nothing is supplied, or if \code{columns} is
#'   \code{TRUE}), then the alignment affects all columns.
#' @return an object of class \code{gt_tbl}.
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

  data_df <- as.data.frame(data)
  colnames <- colnames(data_df)

  columns <- enquo(columns)

  resolved_columns <-
    resolve_vars(var_expr = columns, var_names = colnames, data_df = data_df)

  # Translate the column indices to column names
  resolved_columns <- colnames[resolved_columns]

  if (align == "auto") {

    # Obtain a vector of column classes for each of the column
    # names
    col_classes <-
      lapply(
        attr(data, "data_df", exact = TRUE)[resolved_columns], class) %>%
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
      "integer" = "right",
      "center") %>%
      unname()
  }

  # Set the alignment value to all boxhead columns in `columns`
  attr(data, "boxh_df")["column_align", resolved_columns] <- align

  data
}

#' Relabel one or more columns
#' @inheritParams cols_align
#' @param ... one or more named arguments of column names from the input `data`
#'   table along with their labels for display as the column labels. We can
#'   optionally wrap the column labels with \code{\link{md}()} (to interpret
#'   text as Markdown) or \code{\link{html}()} (to interpret text as HTML).
#' @param .list allows for the use of a list as an input alternative to
#'   \code{...}.
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
    stop("All columns names provided must exist in the input `data` table.")
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
#' @inheritParams cols_align
#' @param columns the column names to move to as a group to a different
#'   position. The order of the remaining columns will be preserved.
#' @param after a column name used to anchor the insertion of the moved columns.
#'   All of the moved columns will be placed to the right of this column.
#' @return an object of class \code{gt_tbl}.
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
#' @importFrom dplyr select
#' @export
cols_move <- function(data,
                      columns,
                      after) {

  # If using the `vars()` helper, get the columns as a character vector
  if (inherits(columns, "quosures")) {
    columns <- columns %>% lapply(`[[`, 2) %>% as.character()
  }

  # If using the `vars()` helper, get the `after` column as a character vector
  if (inherits(after, "quosures")) {
    after <- (after %>% lapply(`[[`, 2) %>% as.character())
  }

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
#' @inheritParams cols_align
#' @param columns the column names to move to the left-most side of the table.
#'   The order in which columns are provided will be preserved (as is the case
#'   with the remaining columns).
#' @return an object of class \code{gt_tbl}.
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
#' @importFrom dplyr select everything
#' @export
cols_move_to_start <- function(data,
                               columns) {

  # If using the `vars()` helper, get the columns as a character vector
  if (inherits(columns, "quosures")) {
    columns <- columns %>% lapply(`[[`, 2) %>% as.character()
  }

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
#' @inheritParams cols_align
#' @param columns the column names to move to the right-most side of the table.
#'   The order in which columns are provided will be preserved (as is the case
#'   with the remaining columns).
#' @return an object of class \code{gt_tbl}.
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
#' @importFrom dplyr select
#' @export
cols_move_to_end <- function(data,
                             columns) {

  # If using the `vars()` helper, get the columns as a character vector
  if (inherits(columns, "quosures")) {
    columns <- columns %>% lapply(`[[`, 2) %>% as.character()
  }

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
#' @inheritParams cols_align
#' @param columns the column names to hide from the output display table. The
#'   order of the remaining columns will be preserved. Values provided that do
#'   not correspond to column names will be disregarded.
#' @return an object of class \code{gt_tbl}.
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
#'   tab_footnote(
#'     footnote = "Population above 3,000,000.",
#'     locations = cells_data(
#'       columns = vars(year),
#'       rows = population > 3000000)
#'   ) %>%
#'   cols_hide(
#'     columns = vars(country_code_3, population)
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_cols_hide_1.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_cols_hide_2.svg}{options: width=100\%}}
#'
#' @family column modification functions
#' @importFrom dplyr select
#' @export
cols_hide <- function(data,
                      columns) {

  # If using the `vars()` helper, get the columns as a character vector
  if (inherits(columns, "quosures")) {
    columns <- columns %>% lapply(`[[`, 2) %>% as.character()
  }

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

#' Create group names and column labels via delimited column names
#'
#' This option will split delimited column names such that the first component
#' is promoted to the group name (and hence will span over column labels) and
#' subsequent components will represent the column label. Please note that
#' reference to individual columns must continue to be through the original
#' column names.
#' @inheritParams cols_align
#' @param delim the delimiter to use to split an input column name. The
#'   delimiter supplied will be autoescaped for the internal splitting
#'   procedure. The first component of the split will become the group name and
#'   the second component will be the column label.
#' @param columns an optional vector of column names that this operation should
#'   be limited to. The default is to consider all columns in the table.
#' @return an object of class \code{gt_tbl}.
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

  # Escape any characters that require escaping
  delim <- gsub("\\.", "\\\\.", delim)

  # Get all of the columns in the dataset
  all_cols <- colnames(attr(data, "boxh_df", exact = TRUE))

  # If using the `vars()` helper, get the columns as a character vector
  if (inherits(columns, "quosures")) {
    columns <- columns %>% lapply(`[[`, 2) %>% as.character()
  }

  if (!is.null(columns)) {
    colnames <- base::intersect(all_cols, columns)
  } else {
    colnames <- all_cols
  }

  if (length(colnames) == 0) {
    return(data)
  }

  colnames_has_delim <- grepl(paste0("[^.]", delim, "[^.]"), colnames)

  if (any(colnames_has_delim)) {

    split_colnames <- strsplit(colnames[colnames_has_delim], delim)

    attr(data, "grp_labels")[colnames[colnames_has_delim]] <-
      vapply(split_colnames, `[[`, character(1), 1)

    attr(data, "col_labels")[colnames[colnames_has_delim]] <-
      vapply(split_colnames, `[[`, character(1), 2)
  }

  data
}

#' Merge two columns to a single column with a formatter
#' @inheritParams cols_align
#' @param col_1 a column that contains values for the start of the range.
#' @param col_2 a column that contains values for the end of the range.
#' @param pattern a formatting pattern that specifies the arrangement of the
#'   \code{col_1} and \code{col_1} values and any string literals. The
#'   \code{col_1} column is represented as \code{{1}} whereas \code{col_2} is
#'   \code{{2}}. All other characters are taken to be string literals.
#' @return an object of class \code{gt_tbl}.
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
#' @importFrom stats setNames
#' @export
cols_merge <- function(data,
                       col_1,
                       col_2,
                       pattern = "{1} {2}") {

  # If using the `vars()` helper, get `col_1` as a character vector
  if (inherits(col_1, "quosures")) {
    col_1 <- col_1 %>% lapply(`[[`, 2) %>% as.character()
  }

  # If using the `vars()` helper, get `col_2` as a character vector
  if (inherits(col_2, "quosures")) {
    col_2 <- col_2 %>% lapply(`[[`, 2) %>% as.character()
  }

  if (!(col_1 %in% colnames(data)) |
      !(col_2 %in% colnames(data))) {
    return(data)
  }

  col_1 <- stats::setNames(col_1, nm = col_2)

  # Create and store a list of column pairs
  if ("col_merge" %in% names(attributes(data))) {

    if (col_1 %in% unname(attr(data, "col_merge")[["col_1"]]) |
        col_2 %in% names(attr(data, "col_merge")[["col_1"]])) {
      return(data)
    }

    attr(data, "col_merge")[["pattern"]] <-
      c(attr(data, "col_merge")[["pattern"]], pattern)

    attr(data, "col_merge")[["col_1"]] <-
      c(attr(data, "col_merge")[["col_1"]], col_1)

  } else {

    attr(data, "col_merge") <-
      list(
        pattern = pattern,
        col_1 = col_1)
  }

  data
}

#' Merge two columns to a value + uncertainty column
#' @inheritParams cols_align
#' @param col_val a single column name that contains the base values.
#' @param col_uncert a single column name that contains the uncertainty values.
#' @return an object of class \code{gt_tbl}.
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
#'     currency = "value + uncert.")
#'
#' @section Figures:
#' \if{html}{\figure{man_cols_merge_uncert_1.svg}{options: width=100\%}}
#'
#' @family column modification functions
#' @importFrom stats setNames
#' @export
cols_merge_uncert <- function(data,
                              col_val,
                              col_uncert) {

  # Set the formatting pattern
  pattern <- "{1} \u00B1 {2}"

  # If using the `vars()` helper, get `col_val` as a character vector
  if (inherits(col_val, "quosures")) {
    col_val <- col_val %>% lapply(`[[`, 2) %>% as.character()
  }

  # If using the `vars()` helper, get `col_uncert` as a character vector
  if (inherits(col_uncert, "quosures")) {
    col_uncert <- col_uncert %>% lapply(`[[`, 2) %>% as.character()
  }

  if (!(col_val %in% colnames(data)) |
      !(col_uncert %in% colnames(data))) {
    return(data)
  }

  col_val <- stats::setNames(col_val, nm = col_uncert)

  # Create and store a list of column pairs
  if ("col_merge" %in% names(attributes(data))) {

    if (col_val %in% unname(attr(data, "col_merge")[["col_1"]]) |
        col_uncert %in% names(attr(data, "col_merge")[["col_1"]])) {
      return(data)
    }

    attr(data, "col_merge")[["pattern"]] <-
      c(attr(data, "col_merge")[["pattern"]], pattern)

    attr(data, "col_merge")[["col_1"]] <-
      c(attr(data, "col_merge")[["col_1"]], col_val)

  } else {

    attr(data, "col_merge") <-
      list(
        pattern = pattern,
        col_1 = col_val)
  }

  data
}

#' Merge two columns to a value range column
#' @inheritParams cols_align
#' @param col_begin a column that contains values for the start of the range.
#' @param col_end a column that contains values for the end of the range.
#' @return an object of class \code{gt_tbl}.
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
#' @importFrom stats setNames
#' @export
cols_merge_range <- function(data,
                             col_begin,
                             col_end) {

  # Set the formatting pattern
  pattern <- "{1} \u2014 {2}"

  # If using the `vars()` helper, get `col_begin` as a character vector
  if (inherits(col_begin, "quosures")) {
    col_begin <- col_begin %>% lapply(`[[`, 2) %>% as.character()
  }

  # If using the `vars()` helper, get `col_end` as a character vector
  if (inherits(col_end, "quosures")) {
    col_end <- col_end %>% lapply(`[[`, 2) %>% as.character()
  }

  if (!(col_begin %in% colnames(data)) |
      !(col_end %in% colnames(data))) {
    return(data)
  }

  col_begin <- stats::setNames(col_begin, nm = col_end)

  # Create and store a list of column pairs
  if ("col_merge" %in% names(attributes(data))) {

    if (col_begin %in% unname(attr(data, "col_merge")[["col_1"]]) |
        col_end %in% names(attr(data, "col_merge")[["col_1"]])) {
      return(data)
    }

    attr(data, "col_merge")[["pattern"]] <-
      c(attr(data, "col_merge")[["pattern"]], pattern)

    attr(data, "col_merge")[["col_1"]] <-
      c(attr(data, "col_merge")[["col_1"]], col_begin)

  } else {

    attr(data, "col_merge") <-
      list(
        pattern = pattern,
        col_1 = col_begin)
  }

  data
}
