#' Resolve the `cells_data` object once it has access to the `data` object
#'
#' @param data A table object that is created using the `gt()` function.
#' @param object The list object created by the `cells_data()` function.
#' @import rlang
#' @noRd
resolve_cells_data <- function(data,
                               object) {


  # Get the `stub_df` data frame from `data`
  stub_df <- dt_stub_df_get(data = data)

  #
  # Resolution of columns and rows as integer vectors
  # providing the positions of the matched variables
  #

  resolved_columns_idx <-
    resolve_vars_idx(
      var_expr = !!object$columns,
      data = data
    )

  # Get the resolved rows
  resolved_rows_idx <-
    resolve_data_vals_idx(
      var_expr = !!object$rows,
      data = data,
      vals = stub_df$rowname
    )

  # Get all possible combinations with `expand.grid()`
  expansion <-
    expand.grid(
      resolved_columns_idx,
      resolved_rows_idx,
      stringsAsFactors = FALSE
    ) %>%
    dplyr::arrange(Var1) %>%
    dplyr::distinct()

  # Create a list object
  cells_resolved <- list(columns = expansion[[1]], rows = expansion[[2]])

  # Apply the `data_cells_resolved` class
  class(cells_resolved) <- "data_cells_resolved"

  cells_resolved
}

#' Resolve the `cells_stub` object once it has access to the `data` object
#'
#' @param data A table object that is created using the `gt()` function.
#' @param object The list object created by the `cells_stub()` function.
#' @noRd
resolve_cells_stub <- function(data,
                               object) {

  stub_df <- dt_stub_df_get(data = data)

  #
  # Resolution of rows as integer vectors
  # providing the positions of the matched variables
  #
  resolved_rows_idx <-
    resolve_data_vals_idx(
      var_expr = !!object$rows,
      data = NULL,
      vals = stub_df$rowname
    )

  # Create a list object
  cells_resolved <- list(rows = resolved_rows_idx)

  # Apply the `stub_cells_resolved` class
  class(cells_resolved) <- "stub_cells_resolved"

  cells_resolved
}

#' Resolve the `cells_column_labels` object once it has access to the `data`
#' object
#'
#' @param data A table object that is created using the `gt()` function.
#' @param object The list object created by the `cells_column_labels()`
#'   function.
#' @noRd
resolve_cells_column_labels <- function(data,
                                        object) {

  #
  # Resolution of columns as integer vectors
  # providing the positions of the matched variables
  #

  resolved_columns <-
    resolve_data_vals_idx(
      var_expr = !!object$columns,
      data = NULL,
      vals = dt_boxhead_get_vars_default(data = data)
    )

  # Create a list object
  cells_resolved <- list(columns = resolved_columns)

  # Apply the `columns_cells_resolved` class
  class(cells_resolved) <- "columns_cells_resolved"

  cells_resolved
}

#' Resolve the spanner values in the `cells_column_labels` object once it
#' has access to the `data` object
#'
#' @param data A table object that is created using the `gt()` function.
#' @param object The list object created by the `cells_column_labels()`
#'   function.
#' @noRd
resolve_cells_column_spanners <- function(data,
                                          object) {

  #
  # Resolution of spanners as column spanner names
  #

  spanner_labels <-
    dt_spanners_get(data = data) %>%
    .$spanner_label %>%
    unlist() %>%
    .[!is.na(.)] %>%
    unique()

  resolved_spanners_idx <-
    resolve_data_vals_idx(
      var_expr = !!object$spanners,
      data = NULL,
      vals = spanner_labels
    )

  resolved_spanners <- spanner_labels[resolved_spanners_idx]

  # Create a list object
  cells_resolved <- list(spanners = resolved_spanners)

  # Apply the `columns_cells_resolved` class
  class(cells_resolved) <- "columns_spanners_resolved"

  cells_resolved
}


#' Resolve expressions to obtain column indices
#'
#' @param var_expr An expression to evaluate. This is passed directly to
#'   `rlang::eval_tidy()` as a value for the `expr` argument.
#' @param data The input table available in `data` (usually accessed through
#'   `as.data.frame(data)`).
#' @noRd
resolve_vars_idx <- function(var_expr,
                             data) {

  var_expr <- rlang::enquo(var_expr)

  resolve_data_vals_idx(
    var_expr = !!var_expr,
    data = NULL,
    vals = colnames(as.data.frame(data))
  )
}

#' Resolve expressions to obtain row indices
#'
#' @param var_expr An expression to evaluate. This is passed directly to
#'   `rlang::eval_tidy()` as a value for the `expr` argument.
#' @param data The input table available in `data` (usually accessed through
#'   `as.data.frame(data)`).
#' @param vals The names of columns or rows in `data`.
#' @import tidyselect
#' @import rlang
#' @noRd
resolve_data_vals_idx <- function(var_expr,
                                  data_tbl,
                                  vals) {

  var_expr <- enquo(var_expr)

  if (!is.null(data_tbl)) {
    data_tbl <- as.data.frame(data_tbl)
  }

  # Translate variable expressions (e.g., logical
  # values, select helpers, expressions in `vars()`,
  # etc.) to the appropriate output
  resolved <-
    tidyselect::with_vars(
      vals,
      rlang::eval_tidy(
        expr = var_expr,
        data = data_tbl,
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
      stop("All column or row indices given must be present in `data_tbl`.",
           call. = FALSE)
    }

    resolved <- which(seq_along(vals) %in% resolved)

  } else if (is.character(resolved)) {

    resolved <- tidyselect::vars_select(vals, !!!rlang::syms(resolved))
    resolved <- resolve_vals(resolved = resolved, vals = vals)

  } else if (is_quosures(resolved)) {

    # Define function to get an expression from a
    # quosure and translate it to a character vector
    quo_get_expr_char <- function(x) {
      rlang::as_name(x)
    }

    resolved <- vapply(resolved, quo_get_expr_char, character(1))
    resolved <- tidyselect::vars_select(vals, !!!rlang::syms(resolved)) %>% unname()
    resolved <- resolve_vals(resolved = resolved, vals = vals)
  }

  resolved
}

resolve_vals <- function(resolved, vals) {

  resolved_idx <- c()

  for (res in resolved) {
    resolved_idx <- c(resolved_idx, which(vals %in% res))
  }

  resolved_idx
}

#' Resolve expressions to obtain column names
#'
#' @param var_expr The immutable column names from the input table.
#' @param data A table object that is created using the [gt()] function.
#' @noRd
resolve_vars <- function(var_expr,
                         data) {

  var_expr <- enquo(var_expr)

  # Obtain the data frame of the input table data
  data_tbl <- dt_data_get(data = data)

  # Collect column names from the input table data
  column_names <- colnames(data_tbl)

  # Use `resolve_vars_idx()` to obtain a vector
  # column indices
  columns_idx <-
    resolve_vars_idx(
      var_expr = !!var_expr,
      data = data
    )

  # Translate the column indices to column names
  column_names[columns_idx]
}
