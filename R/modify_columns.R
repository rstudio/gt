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
#' # Create a table object using the
#' # `mtcars` dataset and align the `mpg`
#' # column to the left
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     cols_align(
#'       align = "left",
#'       columns = vars(mpg))
#' @family column modification functions
#' @export
cols_align <- function(data,
                       align = c("auto", "left", "center", "right"),
                       columns = NULL) {

  # Get the `align` value, this stops the function if there is no match
  align <- match.arg(align)

  # If using the `vars()` helper, get `columns` as a character vector
  if (inherits(columns, "quosures")) {
    columns <- columns %>%
      lapply(`[[`, 2) %>%
      as.character()
  }

  # If a numeric vector is supplied to `columns`, transform to a
  # vector of column names
  if (!is.null(columns) &&
      inherits(columns, "numeric") || inherits(columns, "integer")) {

    # Get a vector of column numbers
    colnums <- unique(floor(columns))

    # Stop function if any of the column numbers are not in the
    # range of column indices for `data_df` (the original dataset)
    if (!all(colnums %in% 1:ncol(attr(data, "data_df", exact = TRUE)))) {
      stop("All column indices provided in `columns` must exist in `data`.",
           call. = FALSE)
    }

    # Get a vector of column names (`columns`) from `colnums`
    columns <- colnames(attr(data, "data_df", exact = TRUE))[colnums]
  }

  # If `columns` is NULL or `TRUE` then `columns` becomes a vector
  # of all columns available in the boxhead
  if (is.null(columns) || isTRUE(columns)) {
    columns <- colnames(attr(data, "boxh_df", exact = TRUE))
  }

  # Stop if any column names in `columns` don't exist
  # in the table boxhead
  if (any(!(columns %in% colnames(attr(data, "boxh_df", exact = TRUE))))) {

    stop("All `columns` must exist in the table boxhead.",
         call. = FALSE)
  }

  if (align == "auto") {

    # Obtain a vector of column classes for each of the column
    # names
    col_classes <-
      lapply(
        attr(data, "data_df", exact = TRUE)[columns], class) %>%
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
  attr(data, "boxh_df")["column_align", columns] <- align

  data
}

#' Relabel one or more columns
#' @inheritParams cols_align
#' @param labels a named vector of column names and their labels for display of
#'   the column headers. We can use the \code{\link{col_labels}()} function to
#'   more easily specify column names and column labels, since we can also wrap
#'   the column labels with \code{\link{md}()} (to interpret text as Markdown)
#'   or \code{\link{html}()} (to interpret text as HTML).
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and apply different
#' # column labels to the `mpg` and `qsec`
#' # columns (the column labels will be
#' # inherited from the column names)
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     cols_label(
#'       labels = col_labels(
#'         mpg = md("*MPG*"),
#'         qsec = "QMT, seconds"))
#' @family column modification functions
#' @seealso \code{\link{col_labels}()} as a useful helper function for
#'   processing column labels.
#' @export
cols_label <- function(data,
                       labels) {

  # Filter the vector of column names by the
  # column names actually in the input df
  labels <- labels[which(names(labels) %in% colnames(data))]

  if (length(labels) == 0) {
    return(data)
  }

  for (i in seq(labels)) {
    attr(data, "boxh_df")["column_label", names(labels[i])] <- unname(labels[i][1])
  }

  data
}

#' Move one or more columns
#' @inheritParams cols_align
#' @param columns the column names to move to as a group to a different
#'   position. The order of the remaining columns will be preserved. Values
#'   provided that do not correspond to column names will be disregarded.
#' @param after a column name used to anchor the insertion of the moved columns.
#'   All of the moved columns will be placed to the right of this column.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and move the `mpg`,
#' # `cyl`, and `disp` columns to the right
#' # of `qsec`
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     cols_move(
#'       columns = vars(mpg, cyl, disp),
#'       after = vars(qsec))
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
    after <- (after %>% lapply(`[[`, 2) %>% as.character())[1]
  }

  boxh_df <- attr(data, "boxh_df")

  # Filter the vector of column names by the
  # column names actually in the input df
  columns <- columns[which(columns %in% colnames(boxh_df))]

  if (length(columns) == 0) {
    return(data)
  }

  # Ensure that only the last element of `after` is
  # retained in the case that multiple columns are
  # provided
  if (length(after) > 1) {
    after <- after[length(after)]
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
#'   with the remaining columns). Values provided that do not correspond to
#'   column names will be disregarded.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and move the `mpg`,
#' # `cyl`, and `disp` columns to the start
#' # of the column series
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     cols_move_to_start(
#'       columns = vars(mpg, cyl, disp))
#' @family column modification functions
#' @importFrom dplyr select everything
#' @export
cols_move_to_start <- function(data,
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

  attr(data, "boxh_df") <- attr(data, "boxh_df") %>% dplyr::select(columns, everything())

  data
}

#' Move one or more columns to the end
#' @inheritParams cols_align
#' @param columns the column names to move to the right-most side of the table.
#'   The order in which columns are provided will be preserved (as is the case
#'   with the remaining columns). Values provided that do not correspond to
#'   column names will be disregarded.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and move the `mpg`,
#' # `cyl`, and `disp` columns to the end
#' # of the column series
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     cols_move_to_end(
#'       columns = vars(mpg, cyl, disp))
#' @family column modification functions
#' @importFrom dplyr select
#' @export
cols_move_to_end <- function(data,
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
#' # Create a table object using the
#' # `mtcars` dataset and hide the `mpg`,
#' # `cyl`, and `disp` columns
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     cols_hide(
#'       columns = vars(mpg, cyl, disp))
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
#' # Create a table object using the
#' # `iris` dataset and split any columns
#' # that are dot separated between column
#' # groups and column labels.
#' gt_tbl <-
#'  gt(iris) %>%
#'     cols_split_delim(delim = ".")
#' @family column modification functions
#' @export
cols_split_delim <- function(data,
                             delim,
                             columns = NULL) {

  # Escape any characters that require escaping
  delim <- gsub("\\.", "\\\\.", delim)

  # Get all of the columns in the dataset
  all_cols <- colnames(attr(data, "boxh_df", exact = TRUE))

  # Get the column names in the dataset
  colnames <- colnames(attr(data, "boxh_df", exact = TRUE))

  # If using the `vars()` helper, get the columns as a character vector
  if (inherits(columns, "quosures")) {
    columns <- columns %>% lapply(`[[`, 2) %>% as.character()
  }

  if (!is.null(columns)) {
    colnames <- base::intersect(colnames, columns)
  }

  if (length(colnames) == 0) {
    return(data)
  }

  colnames_indices <-
    which(colnames(attr(data, "boxh_df", exact = TRUE)) %in% colnames)

  for (i in colnames_indices) {

    if (grepl(paste0("[^.]", delim, "[^.]"), all_cols[i])) {

      split_colname <- strsplit(x = all_cols[i], split = delim) %>% unlist()

      attr(data, "boxh_df")[
        "group_label", i] <- split_colname[1]

      attr(data, "boxh_df")[
        "column_label", i] <- paste0(split_colname[-1], collapse = delim)
    }
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
#' # Create a table object using the
#' # `sleep` dataset and merge the `group`
#' # and `ID` columns together (where the
#' # `ID` number is in parentheses after
#' # the `group` number)
#' gt_tbl <-
#'   gt(sleep) %>%
#'     cols_merge(
#'       col_1 = vars(group),
#'       col_2 = vars(ID),
#'       pattern = "{1} ({2})")
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
#' # Create a tibble with two columns;
#' # both are numeric but the `uncert`
#' # column contains uncertainty values
#' data_tbl <-
#'   dplyr::tribble(
#'     ~value,   ~uncert,
#'     0.352,    0.10,
#'     0.983,    0.13,
#'     0.639,    NA_real_,
#'     NA_real_, 0.17)
#'
#' # Create a table object using this
#' # dataset where the `uncert` column
#' # is merged into the `value` column,
#' # forming a single column of values
#' # with uncertainties
#' gt_tbl <-
#'   gt(data_tbl) %>%
#'     cols_merge_uncert(
#'       col_val = vars(value),
#'       col_uncert = vars(uncert))
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
#' # Create a tibble with two columns
#' # that are both numeric
#' data_tbl <-
#'   dplyr::tribble(
#'     ~val_1, ~val_2,
#'     1.6,    2.6,
#'     1.9,    3.3,
#'     2.6,    3.8,
#'     2.1,    4.2)
#'
#' # Create a table object using this
#' # dataset where the `val_1` and
#' # `val_2` columns are merged together
#' # with an em-dash between them (the
#' # `val_1` column is retained)
#' gt_tbl <-
#'   gt(data_tbl) %>%
#'     cols_merge_range(
#'       col_begin = vars(val_1),
#'       col_end = vars(val_2))
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
