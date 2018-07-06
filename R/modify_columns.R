#' Set the alignment of columns
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param align the alignment direction. This can either
#' be \code{"center"}, \code{"left"}, or \code{"right"}.
#' @param columns an optional vector of column names
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
                       columns = NULL) {

  if (!(align %in% c("left", "center", "right"))) {
    return(data)
  }

  # Filter the vector of column names by the
  # column names actually in `data$input_df`
  columns <-
    columns[which(columns %in% colnames(data$input_df))]

  if (length(columns) == 0) {
    return(data)
  }

  data$boxhead_df[3, columns] <- align

  data
}

#' Set columns to be aligned left
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an optional vector of column names
#' for which the left alignment should be applied.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and align all
#' # columns to the left
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   cols_align_left()
#' @export
cols_align_left <- function(data,
                            columns = NULL) {

  cols_align(
    data = data,
    align = "left",
    columns = columns)
}

#' Set columns to be aligned to the center
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an optional vector of column names
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
                              columns = NULL) {

  cols_align(
    data = data,
    align = "center",
    columns = columns)
}

#' Set columns to be aligned right
#' @param data a table object that is created using the
#' \code{gt()} function.
#' @param columns an optional vector of column names
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
                             columns = NULL) {

  cols_align(
    data = data,
    align = "right",
    columns = columns)
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
  # column names actually in `data$input_df`
  columns <-
    columns[which(columns %in% colnames(data$input_df))]

  if (length(columns) == 0) {
    return(data)
  }

  # Get the remaining column names in the table
  column_names <- base::setdiff(colnames(data$input_df), columns)

  # Get the column index for where the set
  # of `columns` should be inserted after
  column_index <- which(column_names == after)

  if (length(columns) > 0 & column_index != length(column_names)) {

    data$input_df <- data$input_df %>%
      dplyr::select(
        column_names[1:column_index], columns,
        column_names[(column_index + 1):length(column_names)])

    data$output_df <- data$output_df %>%
      dplyr::select(
        column_names[1:column_index], columns,
        column_names[(column_index + 1):length(column_names)])

    data$foot_df <- data$foot_df %>%
      dplyr::select(
        column_names[1:column_index], columns,
        column_names[(column_index + 1):length(column_names)])

    data$forms_df <- data$forms_df %>%
      dplyr::select(
        column_names[1:column_index], columns,
        column_names[(column_index + 1):length(column_names)])

    data$boxhead_df <- data$boxhead_df %>%
      dplyr::select(
        column_names[1:column_index], columns,
        column_names[(column_index + 1):length(column_names)])

  } else if (length(columns) > 0 & column_index == length(column_names)) {

    data$input_df <- data$input_df %>%
      dplyr::select(column_names[1:column_index], columns)

    data$output_df <- data$output_df %>%
      dplyr::select(column_names[1:column_index], columns)

    data$foot_df <- data$foot_df %>%
      dplyr::select(column_names[1:column_index], columns)

    data$forms_df <- data$forms_df %>%
      dplyr::select(column_names[1:column_index], columns)

    data$boxhead_df <- data$boxhead_df %>%
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
#' @export
cols_move_to_start <- function(data,
                               columns) {

  # Filter the vector of column names by the
  # column names actually in `data$input_df`
  columns <-
    columns[which(columns %in% colnames(data$input_df))]

  if (length(columns) == 0) {
    return(data)
  }

  data$input_df <- data$input_df %>% dplyr::select(columns, everything())
  data$output_df <- data$output_df %>% dplyr::select(columns, everything())
  data$foot_df <- data$foot_df %>% dplyr::select(columns, everything())
  data$forms_df <- data$forms_df %>% dplyr::select(columns, everything())
  data$boxhead_df <- data$boxhead_df %>% dplyr::select(columns, everything())

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
#' @export
cols_move_to_end <- function(data,
                             columns) {

  # Filter the vector of column names by the
  # column names actually in `data$data`
  columns <-
    columns[which(columns %in% colnames(data$input_df))]

  if (length(columns) == 0) {
    return(data)
  }

  # Organize a vector of column names for `dplyr::select()`
  columns <- c(base::setdiff(colnames(data$input_df), columns), columns)

  data$input_df <- data$input_df %>% dplyr::select(columns)
  data$output_df <- data$output_df %>% dplyr::select(columns)
  data$foot_df <- data$foot_df %>% dplyr::select(columns)
  data$forms_df <- data$forms_df %>% dplyr::select(columns)
  data$boxhead_df <- data$boxhead_df %>% dplyr::select(columns)

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
    columns[which(columns %in% colnames(data$input_df))]

  if (length(columns) == 0) {
    return(data)
  }

  # Organize a vector of column names for `dplyr::select()`
  columns <- c(base::setdiff(colnames(data$input_df), columns))

  data$input_df <- data$input_df %>% dplyr::select(columns)
  data$output_df <- data$output_df %>% dplyr::select(columns)
  data$foot_df <- data$foot_df %>% dplyr::select(columns)
  data$forms_df <- data$forms_df %>% dplyr::select(columns)
  data$boxhead_df <- data$boxhead_df %>% dplyr::select(columns)

  data
}
