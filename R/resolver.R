#' Resolve the `cells_body` object once it has access to the `data` object
#'
#' @param data A table object that is created using the `gt()` function.
#' @param object The list object created by the `cells_body()` function.
#'
#' @import rlang
#' @noRd
resolve_cells_body <- function(data,
                               object) {


  # Get the `stub_df` data frame from `data`
  stub_df <- dt_stub_df_get(data = data)
  data_tbl <- dt_data_get(data = data)

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
      data_tbl = data_tbl,
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
  cells_resolved <-
    list(
      columns = expansion[[1]],
      colnames = resolve_vars(var_expr = expansion[[1]], data = data),
      rows = expansion[[2]]
    )

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
      data_tbl = NULL,
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
      data_tbl = NULL,
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

  spanner_ids <-
    dt_spanners_get(data = data) %>%
    .$spanner_id %>%
    .[!is.na(.)]

  resolved_spanners_idx <-
    resolve_data_vals_idx(
      var_expr = !!object$spanners,
      data_tbl = NULL,
      vals = spanner_ids
    )

  resolved_spanners <- spanner_ids[resolved_spanners_idx]

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
#' @param data The gt object.
#' @param body_only If FALSE, then the results may include stub and group names.
#' @noRd
resolve_vars_idx <- function(var_expr,
                             data,
                             body_only = TRUE) {

  var_expr <- rlang::enquo(var_expr)

  cols <- colnames(dt_data_get(data = data))

  idx <- resolve_data_vals_idx(
    var_expr = !!var_expr,
    data_tbl = NULL,
    vals = cols
  )

  if (body_only) {
    stub_var <- dt_boxhead_get_var_stub(data)
    if (!is.na(stub_var)) {
      stub_idx <- which(cols == stub_var)
      idx <- idx[idx != stub_idx]
    }

    group_rows_vars <- dt_boxhead_get_vars_groups(data)
    group_rows_vars_idx <- which(cols %in% group_rows_vars)
    idx <- idx[!(idx %in% group_rows_vars_idx)]
  }

  idx
}

#' Resolve expressions to obtain row indices
#'
#' @param var_expr An expression to evaluate. This is passed directly to
#'   `rlang::eval_tidy()` as a value for the `expr` argument.
#' @param data_tbl The input table available in `data` (usually accessed through
#'   `dt_data_get(data)`).
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

    # `resolved` is already in terms of indices
    # resolved <- resolved

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

#' @param var_expr An unquoted expression that follows tidyselect semantics
#' @param data A gt object or data frame or tibble
#' @return Character vector
#' @noRd
resolve_cols_c <- function(var_expr, data, strict = TRUE) {
  names(resolve_cols_i({{var_expr}}, data = data, strict = strict))
}

#' @param expr An unquoted expression that follows tidyselect semantics
#' @param data A gt object or data frame or tibble
#' @return Named integer vector
#' @noRd
resolve_cols_i <- function(expr, data, strict = TRUE) {

  quo <- rlang::enquo(expr)

  if (is_gt(data)) {
    data <- dt_data_get(data = data)
  }

  stopifnot(is.data.frame(data))

  quo <- translate_legacy_resolver_expr(quo)

  # No env argument required, because the expr is a quosure
  tidyselect::eval_select(expr = quo, data = data, strict = strict)
}

#' @param quo A quosure that might contain legacy gt column criteria
#' @noRd
translate_legacy_resolver_expr <- function(quo) {

  expr <- rlang::quo_get_expr(quo = quo)

  if (identical(expr, FALSE)) {
    warning(
      "`columns = FALSE` is deprecated since gt 0.2.3:\n",
      "* please use `columns = c()` instead",
      call. = FALSE
    )

    rlang::quo_set_expr(quo = quo, expr = quote(NULL))

  } else if (identical(expr, TRUE)) {

    warning(
      "`columns = TRUE` is deprecated since gt 0.2.3:\n",
      "* please use `columns = everything()` instead",
      call. = FALSE
    )

    rlang::quo_set_expr(quo = quo, expr = quote(everything()))

  } else if (is.null(expr)) {

    warning(
      "`columns = NULL` is deprecated since gt 0.2.3:\n",
      "* please use `columns = everything()` instead",
      call. = FALSE
    )

    rlang::quo_set_expr(quo = quo, expr = quote(everything()))

  } else if (rlang::quo_is_call(quo = quo, name = "vars")) {

    warning(
      "`columns = vars(...)` is deprecated since gt 0.2.3:\n",
      "* please use `columns = c(...)` instead",
      call. = FALSE
    )

    rlang::quo_set_expr(
      quo = quo,
      expr = rlang::call2(quote(c), !!!rlang::call_args(expr))
    )

  } else {
    # No legacy expression detected
    quo
  }
}

resolve_rows_l <- function(expr, data) {

  if (is_gt(data)) {
    row_names <- dplyr::pull(dt_stub_df_get(data), rowname)
    data <- dt_data_get(data = data)
  } else {
    row_names <- row.names(data)
  }

  stopifnot(is.data.frame(data))

  quo <- rlang::enquo(expr)

  resolved <-
    tidyselect::with_vars(
      vars = row_names,
      expr = rlang::eval_tidy(expr = quo, data = data)
    )

  if (is.null(resolved)) {

    # Maintained for backcompat
    resolved <- rep_len(TRUE, nrow(data))

  } else if (is.logical(resolved)) {

    if (length(resolved) == 1) {
      resolved <- rep_len(resolved, nrow(data))
    } else if (length(resolved) == nrow(data)) {
      # Do nothing
    } else {
      stop(
        "The number of logical values must either be 1 or the number of rows",
        call. = FALSE
      )
    }

  } else if (is.numeric(resolved)) {

    if (length(setdiff(resolved, seq_len(nrow(data)))) != 0) {
      stop(
        "The following rowname(s) do not exist in the data: ",
        paste0(setdiff(resolved, seq_len(nrow(data))), collapse = ", "),
        call. = FALSE
      )
    }

    resolved <- seq_len(nrow(data)) %in% resolved

  } else if (is.character(resolved)) {

    if (length(setdiff(resolved, row_names)) != 0) {
      stop(
        "The following rowname(s) do not exist in the data: ",
        paste0(setdiff(resolved, row_names), collapse = ", "),
        call. = FALSE
      )
    }

    resolved <- row_names %in% resolved

  } else {

    stop(
      "Don't know how to select rows using an object of class ",
      class(resolved)[1],
      call. = FALSE
    )
  }

  resolved
}


resolve_rows_i <- function(expr, data) {
  which(resolve_rows_l(expr = {{ expr }}, data = data))
}
