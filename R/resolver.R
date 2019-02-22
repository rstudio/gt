#' Resolve the `cells_data` object once it has access to the `data` object
#' @param data a table object that is created using the \code{gt()} function.
#' @param object the list object created by the \code{cells_data()} function.
#' @importFrom dplyr arrange distinct
#' @noRd
resolve_cells_data <- function(data,
                               object) {


  # Get the `stub_df` data frame from `data`
  stub_df <- attr(data, "stub_df", exact = TRUE)

  #
  # Resolution of columns and rows as integer vectors
  # providing the positions of the matched variables
  #

  resolved_columns_idx <-
    resolve_vars_idx(
      var_expr = object$columns,
      data = data
    )

  # Get the resolved rows
  resolved_rows_idx <-
    resolve_data_vals_idx(
      var_expr = object$rows,
      data = data,
      # Collect the rownames from `stub_df`
      vals = stub_df$rowname
    )

  # Get all possible combinations with `expand.grid()`
  expansion <-
    expand.grid(resolved_columns_idx, resolved_rows_idx, stringsAsFactors = FALSE) %>%
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

  #
  # Resolution of rows as integer vectors
  # providing the positions of the matched variables
  #

  resolved_rows_idx <-
    resolve_data_vals_idx(
      var_expr = object$rows,
      data = data,
      vals = stub_df$rowname
    )

  # Create a list object
  cells_resolved <- list(rows = resolved_rows_idx)

  # Apply the `stub_cells_resolved` class
  attr(cells_resolved, "class") <- "stub_cells_resolved"

  cells_resolved
}

#' Resolve the `cells_column_labels` object once it has access to the `data`
#' object
#' @param data a table object that is created using the \code{gt()} function.
#' @param object the list object created by the \code{cells_column_labels()}
#'   function.
#' @noRd
resolve_cells_column_labels <- function(data,
                                        object) {

  #
  # Resolution of columns as integer vectors
  # providing the positions of the matched variables
  #

  resolved_columns <-
    resolve_vars_idx(
      var_expr = object$columns,
      data = data)

  # Create a list object
  cells_resolved <- list(columns = resolved_columns)

  # Apply the `columns_cells_resolved` class
  attr(cells_resolved, "class") <- "columns_cells_resolved"

  cells_resolved
}

#' Resolve expressions to obtain column indices
#'
#' @param var_expr An expression to evaluate. This is passed directly to
#'   \code{rlang::eval_tidy()} as a value for the \code{expr} argument.
#' @param data The input table available in \code{data} (usually accessed
#'   through \code{as.data.frame(data)}).
#' @noRd
resolve_vars_idx <- function(var_expr,
                             data) {

  resolve_data_vals_idx(
    var_expr = var_expr,
    data = NULL,
    vals = colnames(as.data.frame(data))
  )
}

#' Resolve expressions to obtain row indices
#'
#' @param var_expr An expression to evaluate. This is passed directly to
#'   \code{rlang::eval_tidy()} as a value for the \code{expr} argument.
#' @param data The input table available in \code{data} (usually accessed
#'   through \code{as.data.frame(data)}).
#' @param vals The names of columns or rows in \code{data}.
#' @import tidyselect
#' @import rlang
#' @importFrom dplyr between
#' @noRd
resolve_data_vals_idx <- function(var_expr,
                                  data,
                                  vals) {
  var_expr <- enquo(var_expr)

  if (!is.null(data)) {
    data <- as.data.frame(data)
  }

  # Translate variable expressions (e.g., logical
  # values, select helpers, expressions in `vars()`,
  # etc.) to the appropriate output
  resolved <-
    tidyselect::with_vars(
      vals,
      rlang::eval_tidy(
        expr = var_expr,
        data = data,
        env = emptyenv()
      )
    )

  # With the `resolved` output, check types and
  # process inputs to reliably output as a vector
  # of column indices based on `vals`
  if (is.null(resolved)) {

    resolved <- seq_along(vals)

  } else if (is.logical(resolved)) {

    if (!(length(resolved) == 1 || length(resolved) == length(vals))) {
      stop("The number of logical values must either be one or the total ",
           "number of columns or rows", call. = FALSE)
    }

    resolved <- which(rlang::rep_along(vals, resolved))

  } else if (is.numeric(resolved)) {

    if (any(!(resolved %in% seq_along(vals)))) {
      stop("All column or row indices given must be present in `data`.",
           call. = FALSE)
    }

    resolved <- which(seq_along(vals) %in% resolved)

  } else if (is.character(resolved)) {

    resolved <- tidyselect::vars_select(vals, !!!rlang::syms(resolved))
    resolved <- which(vals %in% resolved)

  } else if (is_quosures(resolved)) {

    # Define function to get an expression from a
    # quosure and translate it to a character vector
    quo_get_expr_char <- function(x) {
      x %>%
        rlang::quo_get_expr() %>%
        as.character()
    }

    resolved <- vapply(resolved, quo_get_expr_char, character(1))
    resolved <- tidyselect::vars_select(vals, !!!rlang::syms(resolved))
    resolved <- which(vals %in% resolved)
  }

  resolved
}

#' Resolve expressions to obtain column names
#'
#' @param var_expr The immutable column names from the input table.
#' @param data A table object that is created using the \code{\link{gt}()}
#'   function.
#' @noRd
resolve_vars <- function(var_expr,
                         data) {

  # Obtain the data frame of the input table data
  data_df <- as.data.frame(data)

  # Collect column names from the input table data
  column_names <- colnames(data_df)

  # Use `resolve_vars_idx()` to obtain a vector
  # column indices
  columns_idx <-
    resolve_vars_idx(
      var_expr = var_expr,
      data = data
    )

  # Translate the column indices to column names
  column_names[columns_idx]
}
