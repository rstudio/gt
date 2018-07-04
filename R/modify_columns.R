#' Set the alignment of columns
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param align the alignment direction. This can either
#' be \code{"center"}, \code{"left"}, or \code{"right"}.
#' @param columns an optional vector of column names
#' for which the alignment should be applied.
#' @param types an optional vector of column types
#' for which the alignment should be applied.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and align all
#' # columns to the left
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   cols_align("left")
#' @importFrom dplyr bind_cols
#' @export
cols_align <- function(data,
                       align = "center",
                       columns = NULL,
                       types = NULL) {

  if (!(align %in% c("left", "center", "right"))) {
    return(data)
  }

  data_lhs <- data$data[, c(1, 2)]
  data_rhs <- data$data[, -c(1, 2)]

  if (!is.null(columns)) {
    data_columns <-
      columns[which(columns %in% colnames(data$data[, -1:-3]))]
    if ("stub" %in% columns) {
      data_columns <- c(":row_name:", data_columns)
    }

    data_rhs[3, data_columns] <- align

  } else if (!is.null(types)) {

    data_rhs[3, which(data_rhs[2, ] %in% types)] <- align
  }

  data$data <- dplyr::bind_cols(data_lhs, data_rhs)
  data
}

#' Set columns to be aligned left
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an optional vector of column names
#' for which the left alignment should be applied.
#' @param types an optional vector of column types
#' for which the left alignment should be applied.
#' \code{gt()} function.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and align all
#' # columns to the left
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   cols_align_left()
#' @export
cols_align_left <- function(data,
                            columns = NULL,
                            types = NULL) {

  cols_align(
    data = data,
    align = "left",
    columns = columns,
    types = types)
}

#' Set columns to be aligned to the center
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an optional vector of column names
#' for which the center alignment should be applied.
#' @param types an optional vector of column types
#' for which the center alignment should be applied.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and center align
#' # all columns
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   cols_align_center()
#' @export
cols_align_center <- function(data,
                              columns = NULL,
                              types = NULL) {

  cols_align(
    data = data,
    align = "center",
    columns = columns,
    types = types)
}

#' Set columns to be aligned right
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an optional vector of column names
#' for which the right alignment should be applied.
#' @param types an optional vector of column types
#' for which the right alignment should be applied.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and align all
#' # columns to the right
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   cols_align_right()
#' @export
cols_align_right <- function(data,
                             columns = NULL,
                             types = NULL) {

  cols_align(
    data = data,
    align = "right",
    columns = columns,
    types = types)
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
#' @export
cols_move <- function(data,
                      columns,
                      after) {

  # Filter the vector of column names by the
  # column names actually in `data$data`
  columns <-
    columns[which(columns %in% colnames(data$data[, -1:-3]))]

  data_lhs <- data$data[, 1:3]
  data_rhs <- data$data[, -1:-3]

  # Get the remaining column names in the table
  column_names <- base::setdiff(colnames(data_rhs), columns)

  # Get the column index for where the set
  # of `columns` should be inserted after
  column_index <- which(column_names == after)

  if (length(columns) > 0 & column_index != length(column_names)) {

    data_rhs <-
      data_rhs %>%
      dplyr::select(
        column_names[1:column_index],
        columns,
        column_names[(column_index + 1):length(column_names)])

  } else if (length(columns) > 0 & column_index == length(column_names)) {

    data_rhs <-
      data_rhs %>%
      dplyr::select(
        column_names[1:column_index],
        columns)
  }

  # Reindex the column numbers
  for (i in seq(ncol(data_rhs))) {
    data_rhs[1, i] <- i
  }

  data$data <- dplyr::bind_cols(data_lhs, data_rhs)
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
#' @importFrom dplyr select everything bind_cols
#' @export
cols_move_to_start <- function(data,
                               columns) {

  # Filter the vector of column names by the
  # column names actually in `data$data`
  columns <-
    columns[which(columns %in% colnames(data$data[, -1:-3]))]

  data_lhs <- data$data[, 1:3]
  data_rhs <- data$data[, -1:-3]

  if (length(columns) > 0) {
    data_rhs <- data_rhs %>% dplyr::select(columns, everything())

    # Reindex the column numbers
    for (i in seq(ncol(data_rhs))) {
      data_rhs[1, i] <- i
    }
  }

  data$data <- dplyr::bind_cols(data_lhs, data_rhs)
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
#' @importFrom dplyr select bind_cols
#' @export
cols_move_to_end <- function(data,
                             columns) {

  # Filter the vector of column names by the
  # column names actually in `data$data`
  columns <-
    columns[which(columns %in% colnames(data$data[, -1:-3]))]

  data_lhs <- data$data[, 1:3]
  data_rhs <- data$data[, -1:-3]

  if (length(columns) > 0) {

    # Place the column names at the end
    columns <- c(base::setdiff(colnames(data_rhs), columns), columns)

    data_rhs <- data_rhs %>% dplyr::select(columns)

    # Reindex the column numbers
    for (i in seq(ncol(data_rhs))) {
      data_rhs[1, i] <- i
    }
  }

  data$data <- dplyr::bind_cols(data_lhs, data_rhs)
  data
}

#' Remove one or more columns
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns the column names to remove from the table.
#' The order of the remaining columns will be preserved. Values
#' provided that do not correspond to column names will be disregarded.
#' @return an object of class \code{gt_tbl}.
#' @importFrom dplyr select bind_cols
#' @export
cols_remove <- function(data,
                        columns) {

  # Filter the vector of column names by the
  # column names actually in `data$data`
  columns <-
    columns[which(columns %in% colnames(data$data[, -1:-3]))]

  data_lhs <- data$data[, 1:3]
  data_rhs <- data$data[, -1:-3]

  # Perform removal of columns using `dplyr::select()`
  if (length(columns) > 0) {

    # Remove the column names from the column list
    columns <- c(base::setdiff(colnames(data_rhs), columns))

    data_rhs <- data_rhs %>% dplyr::select(columns)

    # Reindex the column numbers
    for (i in seq(ncol(data_rhs))) {
      data_rhs[1, i] <- i
    }
  }

  data$data <- dplyr::bind_cols(data_lhs, data_rhs)
  data
}
