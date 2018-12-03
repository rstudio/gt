#' Resolve the `cells_data` object once it has access to the `data` object
#' @param data a table object that is created using the \code{gt()} function.
#' @param object the list object created by the \code{cells_data()} function.
#' @importFrom dplyr arrange distinct
#' @noRd
resolve_cells_data <- function(data,
                               object) {

  # Get the `data_df` data frame from `data`
  data_df <- as.data.frame(data)

  # Get the `stub_df` data frame from `data`
  stub_df <- attr(data, "stub_df", exact = TRUE)

  # Obtain the `columns` and `rows` components of
  # object created by the `cells_data()` function
  object_columns <- object$columns
  object_rows <- object$rows

  # Collect the column names from `data_df`
  colnames <- names(data_df)

  # Collect the rownames from `stub_df`
  rownames <- stub_df$rowname

  #
  # Resolution of columns and rows as integer vectors
  # providing the positions of the matched variables
  #

  resolved_columns <- resolve_vars(object_columns, colnames, data_df)
  resolved_rows <- resolve_vars(object_rows, rownames, data_df)

  # Get all possible combinations with `expand.grid()`
  expansion <-
    expand.grid(resolved_columns, resolved_rows, stringsAsFactors = FALSE) %>%
    dplyr::arrange(Var1) %>%
    dplyr::distinct()

  # Create a list object
  cells_resolved <- list(columns = expansion[[1]], rows = expansion[[2]])

  # Apply the `data_cells_resolved` class
  attr(cells_resolved, "class") <- "data_cells_resolved"

  cells_resolved
}

#' Resolve the `cells_stub` object once it has access to the `data` object
#' @param data a table object that is created using the \code{gt()} function.
#' @param object the list object created by the \code{cells_stub()} function.
#' @noRd
resolve_cells_stub <- function(data,
                               object) {

  # Get the `data_df` data frame from `data`
  data_df <- as.data.frame(data)

  # Get the `stub_df` data frame from `data`
  stub_df <- attr(data, "stub_df", exact = TRUE)

  # Obtain the `columns` and `rows` components of
  # object created by the `cells_stub()` function
  object_rows <- object$rows

  # Collect the rownames from `stub_df`
  rownames <- stub_df$rowname

  #
  # Resolution of rows as integer vectors
  # providing the positions of the matched variables
  #

  resolved_rows <- resolve_vars(object_rows, rownames, data_df)

  # Create a list object
  cells_resolved <- list(rows = resolved_rows)

  # Apply the `stub_cells_resolved` class
  attr(cells_resolved, "class") <- "stub_cells_resolved"

  cells_resolved
}

#' Resolve the `cells_columns` object once it has access to the `data` object
#' @param data a table object that is created using the \code{gt()} function.
#' @param object the list object created by the \code{cells_columns()}
#'   function.
#' @noRd
resolve_cells_columns <- function(data,
                                  object) {

  # Get the `data_df` data frame from `data`
  data_df <- as.data.frame(data)

  # Collect the column names from `data_df`
  colnames <- names(data_df)

  # Obtain the `columns` component of object created
  # by the `cells_columns()` function
  object_columns <- object$columns

  #
  # Resolution of columns as integer vectors
  # providing the positions of the matched variables
  #

  resolved_columns <- resolve_vars(object_columns, colnames, data_df)

  # Create a list object
  cells_resolved <- list(columns = resolved_columns)

  # Apply the `columns_cells_resolved` class
  attr(cells_resolved, "class") <- "columns_cells_resolved"

  cells_resolved
}

#' Resolve variables for rows and columns using expressions
#' @import tidyselect
#' @import rlang
#' @noRd
resolve_vars <- function(var_expr, var_names, data_df) {

  stopifnot(rlang::is_quosure(var_expr))

  resolved <-
    tidyselect::with_vars(
      var_names, rlang::eval_tidy(var_expr, data_df, env = NULL))

  if (is.null(resolved)) {

    resolved <- seq_along(var_names)

  } else if (is.logical(resolved)) {

    resolved <- which(rlang::rep_along(var_names, resolved))

  } else if (is.character(resolved)) {

    resolved <- tidyselect::vars_select(var_names, !!!rlang::syms(resolved))
    resolved <- which(var_names %in% resolved)

  } else if (is_quosures(resolved)) {

    resolved <- vapply(resolved, function(x) as.character(quo_get_expr(x)), character(1))
    resolved <- tidyselect::vars_select(var_names, !!!rlang::syms(resolved))
    resolved <- which(var_names %in% resolved)
  }

  resolved
}
