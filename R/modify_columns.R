#' Set the alignment of columns
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param align the alignment direction. This can either
#' be \code{"center"}, \code{"left"}, or \code{"right"}.
#' @param columns an vector of column names for which the
#' alignment should be applied.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and align all
#' # columns to the left
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   cols_align(
#'     align = "left",
#'     columns = mpg)
#' @importFrom rlang enquo get_expr flatten_chr
#' @importFrom stringr str_trim
#' @export
cols_align <- function(data,
                       align = "center",
                       columns) {

  # Get the requested `columns`
  columns <-
    rlang::enquo(columns) %>%
    rlang::get_expr() %>%
    as.character() %>%
    strsplit(split = " & ") %>%
    rlang::flatten_chr() %>%
    stringr::str_trim()

  columns <- columns[columns != "&"]

  # Filter the vector of column names by the
  # column names actually in the input df
  columns <- columns[which(columns %in% colnames(data))]

  if (!(align %in% c("left", "center", "right"))) {
    return(data)
  }

  if (length(columns) == 0) {
    return(data)
  }

  attr(data, "boxh_df")[3, columns] <- align

  data
}

#' Set columns to be aligned left
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an vector of column names for which the
#' left alignment should be applied.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and align all
#' # columns to the left
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   cols_align_left(mpg)
#' @importFrom rlang enquo get_expr flatten_chr
#' @importFrom stringr str_trim
#' @export
cols_align_left <- function(data,
                            columns) {

  # Get the requested `columns`
  columns <-
    rlang::enquo(columns) %>%
    rlang::get_expr() %>%
    as.character() %>%
    strsplit(split = " & ") %>%
    rlang::flatten_chr() %>%
    stringr::str_trim()

  columns <- columns[columns != "&"]

  if (length(columns) == 0) {
    return(data)
  }

  attr(data, "boxh_df")[3, columns] <- "left"

  data
}

#' Set columns to be aligned to the center
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an vector of column names for which the
#' center alignment should be applied.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and center align
#' # all columns
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   cols_align_center(mpg)
#' @importFrom rlang enquo get_expr flatten_chr
#' @importFrom stringr str_trim
#' @export
cols_align_center <- function(data,
                              columns) {

  # Get the requested `columns`
  columns <-
    rlang::enquo(columns) %>%
    rlang::get_expr() %>%
    as.character() %>%
    strsplit(split = " & ") %>%
    rlang::flatten_chr() %>%
    stringr::str_trim()

  columns <- columns[columns != "&"]

  if (length(columns) == 0) {
    return(data)
  }

  attr(data, "boxh_df")[3, 2] <- "center"

  data
}

#' Set columns to be aligned right
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an vector of column names for which the
#' right alignment should be applied.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and align all
#' # columns to the right
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   cols_align_right(mpg)
#' @importFrom rlang enquo get_expr flatten_chr
#' @importFrom stringr str_trim
#' @export
cols_align_right <- function(data,
                             columns) {

  # Get the requested `columns`
  columns <-
    rlang::enquo(columns) %>%
    rlang::get_expr() %>%
    as.character() %>%
    strsplit(split = " & ") %>%
    rlang::flatten_chr() %>%
    stringr::str_trim()

  columns <- columns[columns != "&"]

  if (length(columns) == 0) {
    return(data)
  }

  attr(data, "boxh_df")[3, columns] <- "right"

  data
}

#' Relabel one or more columns
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param labels a named vector of column names and their
#' labels for display of the column headers.
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
    attr(data, "boxh_df")[2, names(labels[i])] <- unname(labels[i][1])
  }

  data
}

#' Move one or more columns
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to move to as a group to
#' a different position. The order of the remaining columns
#' will be preserved. Values provided that do not correspond
#' to column names will be disregarded.
#' @param after a column name used to anchor the insertion of
#' the moved columns. All of the moved columns will be placed
#' to the right of this column.
#' @return an object of class \code{gt_tbl}.
#' @importFrom dplyr select bind_cols
#' @importFrom rlang enquo get_expr flatten_chr
#' @importFrom stringr str_trim
#' @export
cols_move <- function(data,
                      columns,
                      after) {

  # Get the requested `columns`
  columns <-
    rlang::enquo(columns) %>%
    rlang::get_expr() %>%
    as.character() %>%
    strsplit(split = " & ") %>%
    rlang::flatten_chr() %>%
    stringr::str_trim()

  columns <- columns[columns != "&"]

  # Get the requested `after`
  after <-
    rlang::enquo(after) %>%
    rlang::get_expr() %>%
    as.character() %>%
    strsplit(split = " & ") %>%
    rlang::flatten_chr() %>%
    stringr::str_trim()

  after <- after[after != "&"]

  # Filter the vector of column names by the
  # column names actually in the input df
  columns <- columns[which(columns %in% colnames(data))]

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
  column_names <- base::setdiff(colnames(data), columns)

  # Get the column index for where the set
  # of `columns` should be inserted after
  column_index <- which(column_names == after)

  if (length(columns) > 0 & column_index != length(column_names)) {

    data <- data %>%
      dplyr::select(
        column_names[1:column_index], columns,
        column_names[(column_index + 1):length(column_names)])

    attr(data, "foot_df") <- attr(data, "foot_df") %>%
      dplyr::select(
        column_names[1:column_index], columns,
        column_names[(column_index + 1):length(column_names)])

    attr(data, "fmts_df") <- attr(data, "fmts_df") %>%
      dplyr::select(
        column_names[1:column_index], columns,
        column_names[(column_index + 1):length(column_names)])

    attr(data, "boxh_df") <- attr(data, "boxh_df") %>%
      dplyr::select(
        column_names[1:column_index], columns,
        column_names[(column_index + 1):length(column_names)])

  } else if (length(columns) > 0 & column_index == length(column_names)) {

    data <- data %>%
      dplyr::select(column_names[1:column_index], columns)

    attr(data, "foot_df") <- attr(data, "foot_df") %>%
      dplyr::select(column_names[1:column_index], columns)

    attr(data, "fmts_df") <- attr(data, "fmts_df") %>%
      dplyr::select(column_names[1:column_index], columns)

    attr(data, "boxh_df") <- attr(data, "boxh_df") %>%
      dplyr::select(column_names[1:column_index], columns)
  }

  data
}

#' Move one or more columns to the start
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to move to
#' the left-most side of the table. The order in
#' which columns are provided will be preserved
#' (as is the case with the remaining columns).
#' Values provided that do not correspond to
#' column names will be disregarded.
#' @return an object of class \code{gt_tbl}.
#' @importFrom dplyr select everything
#' @importFrom rlang enquo get_expr flatten_chr
#' @importFrom stringr str_trim
#' @export
cols_move_to_start <- function(data,
                               columns) {

  # Get the requested `columns`
  columns <-
    rlang::enquo(columns) %>%
    rlang::get_expr() %>%
    as.character() %>%
    strsplit(split = " & ") %>%
    rlang::flatten_chr() %>%
    stringr::str_trim()

  columns <- columns[columns != "&"]

  # Filter the vector of column names by the
  # column names actually in the input df
  columns <- columns[which(columns %in% colnames(data))]

  if (length(columns) == 0) {
    return(data)
  }

  data <- data %>% dplyr::select(columns, everything())

  attr(data, "foot_df") <- attr(data, "foot_df") %>% dplyr::select(columns, everything())
  attr(data, "fmts_df") <- attr(data, "fmts_df") %>% dplyr::select(columns, everything())
  attr(data, "boxh_df") <- attr(data, "boxh_df") %>% dplyr::select(columns, everything())

  data
}

#' Move one or more columns to the end
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to move to
#' the right-most side of the table. The order in
#' which columns are provided will be preserved
#' (as is the case with the remaining columns).
#' Values provided that do not correspond to
#' column names will be disregarded.
#' @return an object of class \code{gt_tbl}.
#' @importFrom dplyr select
#' @importFrom rlang enquo get_expr flatten_chr
#' @importFrom stringr str_trim
#' @export
cols_move_to_end <- function(data,
                             columns) {

  # Get the requested `columns`
  columns <-
    rlang::enquo(columns) %>%
    rlang::get_expr() %>%
    as.character() %>%
    strsplit(split = " & ") %>%
    rlang::flatten_chr() %>%
    stringr::str_trim()

  columns <- columns[columns != "&"]

  # Filter the vector of column names by the
  # column names actually in the input df
  columns <- columns[which(columns %in% colnames(data))]

  if (length(columns) == 0) {
    return(data)
  }

  # Organize a vector of column names for `dplyr::select()`
  columns <- c(base::setdiff(colnames(data), columns), columns)

  data <- data %>% dplyr::select(columns)

  attr(data, "foot_df") <- attr(data, "foot_df") %>% dplyr::select(columns)
  attr(data, "fmts_df") <- attr(data, "fmts_df") %>% dplyr::select(columns)
  attr(data, "boxh_df") <- attr(data, "boxh_df") %>% dplyr::select(columns)

  data
}

#' Remove one or more columns
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to remove from the table.
#' The order of the remaining columns will be preserved. Values
#' provided that do not correspond to column names will be disregarded.
#' @return an object of class \code{gt_tbl}.
#' @importFrom dplyr select
#' @importFrom rlang enquo get_expr flatten_chr
#' @importFrom stringr str_trim
#' @export
cols_remove <- function(data,
                        columns) {

  # Get the requested `columns`
  columns <-
    rlang::enquo(columns) %>%
    rlang::get_expr() %>%
    as.character() %>%
    strsplit(split = " & ") %>%
    rlang::flatten_chr() %>%
    stringr::str_trim()

  columns <- columns[columns != "&"]

  # Filter the vector of column names by the
  # column names actually in the input df
  columns <- columns[which(columns %in% colnames(data))]

  if (length(columns) == 0) {
    return(data)
  }

  # Organize a vector of column names for `dplyr::select()`
  columns <- c(base::setdiff(colnames(data), columns))

  data <- data %>% dplyr::select(columns)

  attr(data, "foot_df") <- attr(data, "foot_df") %>% dplyr::select(columns)
  attr(data, "fmts_df") <- attr(data, "fmts_df") %>% dplyr::select(columns)
  attr(data, "boxh_df") <- attr(data, "boxh_df") %>% dplyr::select(columns)

  data
}

#' Create group names and column labels via delimited column names
#' This option will split delimited column names such that the
#' first component is promoted to the group name (and hence
#' will span over column labels) and subsequent components will
#' represent the column label. Please note that reference to individual
#' columns must still be via the original column names.
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param delim the delimiter to use to split an input column name.
#' The delimiter supplied will be autoescaped for the internal
#' splitting procedure. The first component of the split will
#' become the group name and the second component will be the
#' column label.
#' @param columns an optional vector of column names that this
#' operation should be limited to. The default is to consider all
#' columns in the table.
#' @return an object of class \code{gt_tbl}.
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
        1, i] <- split_colname[1]

      attr(data, "boxh_df")[
        2, i] <- paste0(split_colname[-1], collapse = delim)
    }
  }

  data
}
