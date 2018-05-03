#' Add a stub to a table
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param column an option to use an existing
#' column as the stub.
#' @return an object of class \code{html_table}.
#' @importFrom tibble add_row
#' @export
tab_stub <- function(html_tbl,
                     column = NULL) {

  # Obtain the next index value for the
  # `transforms` table
  index <- get_next_index(tbl = html_tbl[["transforms"]])

  if (is.null(column)) {
    column <- NA_character_
  }

  # Add to `transforms` tbl
  html_tbl[["transforms"]] <-
    html_tbl[["transforms"]] %>%
    tibble::add_row(
      index = index %>% as.integer(),
      transform_type = "tab_stub",
      transform_v1 = column)


  # Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  html_tbl
}

#' Move one or more columns to the start
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns the column names to move to
#' the left-most side of the table. The order in
#' which columns are provided will be preserved
#' (as is the case with the remaining columns).
#' Values provided that do not correspond to
#' column names will be disregarded.
#' @return an object of class \code{html_table}.
#' @importFrom tibble add_row
#' @export
move_columns_to_start <- function(html_tbl,
                                  columns) {

  # If none of the columns given in `columns` are
  # in the table, then don't add an entry to the
  # `transforms` table
  if (all(!(columns %in% colnames(html_tbl[["modified_tbl"]])))) {

    message("All columns supplied in `columns` are not in the table.")
    return(html_tbl)
  }

  # Obtain the next index value for the
  # `transforms` table
  index <- get_next_index(tbl = html_tbl[["transforms"]])

  # Collapse the vector of column names as a
  # string with names separated by `::`
  columns <- paste(columns, collapse = "::")

  # Add to `transforms` tbl
  html_tbl[["transforms"]] <-
    html_tbl[["transforms"]] %>%
    tibble::add_row(
      index = index %>% as.integer(),
      transform_type = "move_columns_to_start",
      transform_v1 = columns)


  # Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  html_tbl
}

#' Move one or more columns to the end
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns the column names to move to
#' the right-most side of the table. The order in
#' which columns are provided will be preserved
#' (as is the case with the remaining columns).
#' Values provided that do not correspond to
#' column names will be disregarded.
#' @return an object of class \code{html_table}.
#' @importFrom tibble add_row
#' @export
move_columns_to_end <- function(html_tbl,
                                columns) {

  # If none of the columns given in `columns` are
  # in the table, then don't add an entry to the
  # `transforms` table
  if (all(!(columns %in% colnames(html_tbl[["modified_tbl"]])))) {

    message("All columns supplied in `columns` are not in the table.")
    return(html_tbl)
  }

  # Obtain the next index value for the
  # `transforms` table
  index <- get_next_index(tbl = html_tbl[["transforms"]])

  # Collapse the vector of column names as a
  # string with names separated by `::`
  columns <- paste(columns, collapse = "::")

  # Add to `transforms` tbl
  html_tbl[["transforms"]] <-
    html_tbl[["transforms"]] %>%
    tibble::add_row(
      index = index %>% as.integer(),
      transform_type = "move_columns_to_end",
      transform_v1 = columns)


  # Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  html_tbl
}

#' Move one or more columns to the end
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns the column names to move to
#' as a group to a different position. The
#' order of the remaining columns will be
#' preserved. Values provided that do not
#' correspond to column names will be
#' disregarded.
#' @return an object of class \code{html_table}.
#' @importFrom tibble add_row
#' @export
move_columns <- function(html_tbl,
                         columns,
                         after) {

  # If none of the columns given in `columns` are
  # in the table, then don't add an entry to the
  # `transforms` table
  if (all(!(columns %in% colnames(html_tbl[["modified_tbl"]])))) {

    message("All columns supplied in `columns` are not in the table.")
    return(html_tbl)
  }

  # If the `after` column is not in the table, then
  # don't add an entry to the `transforms` table
  if (!(after[1] %in% colnames(html_tbl[["modified_tbl"]]))) {

    message("The column supplied in `after` is not in the table.")
    return(html_tbl)
  }

  # Obtain the next index value for the
  # `transforms` table
  index <- get_next_index(tbl = html_tbl[["transforms"]])

  # Collapse the vector of column names as a
  # string with names separated by `::`
  columns <- paste(columns, collapse = "::")

  # Add to `transforms` tbl
  html_tbl[["transforms"]] <-
    html_tbl[["transforms"]] %>%
    tibble::add_row(
      index = index %>% as.integer(),
      transform_type = "move_columns",
      transform_v1 = columns,
      transform_v2 = after[1])

  # Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  html_tbl
}

#' Reorder all columns
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns a vector of column names in
#' the revised order. All column names must
#' be provided without any repeats.
#' @return an object of class \code{html_table}.
#' @importFrom tibble add_row
#' @export
reorder_columns <- function(html_tbl,
                            columns) {

  # If the columns given in `columns` do not
  # contain the same columns as in the table,
  # return input object with a message
  if (any(
    all(!(columns %in% colnames(html_tbl[["modified_tbl"]]))) &
    length(columns) != length(colnames(html_tbl[["modified_tbl"]])) &
    length(columns %>% unique()) != length(columns))) {

    message("Not all of the columns supplied in `columns` are in the table.")
    return(html_tbl)
  }

  # Obtain the next index value for the
  # `transforms` table
  index <- get_next_index(tbl = html_tbl[["transforms"]])

  # Collapse the vector of column names as a
  # string with names separated by `::`
  columns <- paste(columns, collapse = "::")

  # Add to `transforms` tbl
  html_tbl[["transforms"]] <-
    html_tbl[["transforms"]] %>%
    tibble::add_row(
      index = index %>% as.integer(),
      transform_type = "reorder_columns",
      transform_v1 = columns)

  # Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  html_tbl
}

#' Move one or more columns to the end
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns the column names to remove
#' from the table. The order of the remaining
#' columns will be preserved. Values provided
#' that do not correspond to column names will
#' be disregarded.
#' @return an object of class \code{html_table}.
#' @importFrom tibble add_row
#' @export
remove_columns <- function(html_tbl,
                           columns) {

  # If none of the columns given in `columns` are
  # in the table, then don't add an entry to the
  # `transforms` table
  if (all(!(columns %in% colnames(html_tbl[["modified_tbl"]])))) {

    message("All columns supplied in `columns` are not in the table.")
    return(html_tbl)
  }

  # Obtain the next index value for the
  # `transforms` table
  index <- get_next_index(tbl = html_tbl[["transforms"]])

  # Collapse the vector of column names as a
  # string with names separated by `::`
  columns <- paste(columns, collapse = "::")

  # Add to `transforms` tbl
  html_tbl[["transforms"]] <-
    html_tbl[["transforms"]] %>%
    tibble::add_row(
      index = index %>% as.integer(),
      transform_type = "remove_columns",
      transform_v1 = columns)

  # Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  html_tbl
}

#' Apply uncertainty values to a column of data
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param value_column the column containing the
#' values where uncertainties should be applied.
#' @param uncert_column the column containing
#' uncertainties related to quantities in
#' \code{value column}.
#' @return an object of class \code{html_table}.
#' @importFrom tibble add_row
#' @export
fmt_uncertainty <- function(html_tbl,
                            value_column,
                            uncert_column) {

  # If the column given in `value_column` does
  # not exist in the table, return input object
  # with a message
  if (!(value_column[1] %in% colnames(html_tbl[["modified_tbl"]]))) {

    message("The column supplied in `value_column` does not exist in the table.")
    return(html_tbl)
  }

  # If the column given in `uncert_column` does
  # not exist in the table, return input object
  # with a message
  if (!(uncert_column[1] %in% colnames(html_tbl[["modified_tbl"]]))) {

    message("The column supplied in `uncert_column` does not exist in the table.")
    return(html_tbl)
  }

  # Obtain the next index value for the
  # `transforms` table
  index <- get_next_index(tbl = html_tbl[["transforms"]])

  # Add to `transforms` tbl
  html_tbl[["transforms"]] <-
    html_tbl[["transforms"]] %>%
    tibble::add_row(
      index = index %>% as.integer(),
      transform_type = "fmt_uncertainty",
      transform_v1 = value_column,
      transform_v2 = uncert_column)

  # Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  html_tbl
}
