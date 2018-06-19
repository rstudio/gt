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

#' Arrange a table stub into blocks
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param ... a series of named vectors for
#' specifying the mappings between row names or
#' row numbers to subhead names.
#' @param .default a subhead name to apply to
#' those rows not encapsulated \code{...}.
#' @return an object of class \code{html_table}.
#' @examples
#' # Create an `mtcars` presentation table that
#' # groups certain rows together in stub blocks
#' mtcars_tbl <-
#'   tab_create(tbl = mtcars) %>%  # 1
#'   theme_striped() %>%
#'   tab_stub_block(
#'     "Mazda" = rownames_with("Mazda"),
#'     "Mercs" = rownames_with("Merc"),
#'     "Hornets" = rownames_with("Hornet"),
#'     "Toyotas" = rownames_with("Toyota"),
#'     "Supercars" = c(
#'       "Ferrari Dino","Maserati Bora",
#'       "Porsche 914-2"))
#' @importFrom dplyr pull add_row
#' @importFrom stringr str_match str_replace_all
#' @importFrom commonmark markdown_html
#' @export
tab_stub_block <- function(html_tbl,
                           ...,
                           .default = NULL) {

  # Create bindings for specific variables
  #rowname <- row_indices <- NULL

  # Assign a name to the subhead where there
  # is none formally assigned
  if (is.null(.default)) {
    .default <- "Others"
  }

  # Get `rownames` and `row_indices`
  # from `modified_tbl`
  if ("rowname" %in% colnames(html_tbl[["modified_tbl"]])) {
    assign(
      x = "rowname",
      value = html_tbl[["modified_tbl"]] %>% dplyr::pull(rowname),
      envir = .GlobalEnv)

    assign(
      x = "row_indices",
      value = seq(html_tbl[["modified_tbl"]] %>% dplyr::pull(rowname)),
      envir = .GlobalEnv)

    on.exit(expr = rm(rowname, envir = .GlobalEnv))
    on.exit(expr = rm(row_indices, envir = .GlobalEnv), add = TRUE)
  }

  x <- list(...)

  # Obtain row numbers for literal rownames
  for (i in seq(length(x))) {

    if (!(x[[i]] %>% is.integer())) {

      row_indices_x <- vector(mode = "integer")

      for (j in seq(x[[i]])) {

        row_indices_x <-
          c(row_indices_x,
            which(rowname == x[[i]][j])[1])
      }

      x[[i]] <- row_indices_x
    }
  }

  # Obtain remaining rows
  others_rows <-
    base::setdiff(
      row_indices,
      (x %>% unlist() %>% unname()))

  # Add to the `stub_block` tbl
  for (i in seq(length(x))) {

    html_tbl[["stub_block"]] <-
      html_tbl[["stub_block"]] %>%
      dplyr::add_row(
        stub_heading = x[i] %>%
          names() %>%
          process_text(),
        row_number = x[[i]])
  }

  # If there are remaining rows, add
  # those in
  if (length(others_rows) > 0) {

    html_tbl[["stub_block"]] <-
      html_tbl[["stub_block"]] %>%
      dplyr::add_row(
        stub_heading = .default %>%
          process_text(),
        row_number = others_rows)
  }

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
cols_move_to_start <- function(html_tbl,
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
      transform_type = "cols_move_to_start",
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
cols_move_to_end <- function(html_tbl,
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
      transform_type = "cols_move_to_end",
      transform_v1 = columns)

  # Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  html_tbl
}

#' Move one or more columns
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns the column names to move to
#' as a group to a different position. The
#' order of the remaining columns will be
#' preserved. Values provided that do not
#' correspond to column names will be
#' disregarded.
#' @param after a column name used to anchor the
#' insertion of the moved columns. All of the
#' moved columns will be placed to the right of
#' this column.
#' @return an object of class \code{html_table}.
#' @importFrom tibble add_row
#' @export
cols_move <- function(html_tbl,
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
      transform_type = "cols_move",
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
cols_reorder <- function(html_tbl,
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
      transform_type = "cols_reorder",
      transform_v1 = columns)

  # Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  html_tbl
}

#' Remove one or more columns
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
cols_remove <- function(html_tbl,
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
      transform_type = "cols_remove",
      transform_v1 = columns)

  # Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  html_tbl
}

#' Format as values with uncertainties
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
