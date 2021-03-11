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

  # Resolve columns as index values
  resolved_columns_idx <-
    resolve_cols_i(
      expr = !!object$columns,
      data = data
    )

  # Resolve rows as index values
  resolved_rows_idx <-
    resolve_rows_i(
      expr = !!object$rows,
      data = data
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
      colnames = names(expansion[[1]]),
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

  #
  # Resolution of rows as integer vectors
  # providing the positions of the matched variables
  #
  resolved_rows_idx <-
    resolve_rows_i(
      expr = !!object$rows,
      data = data
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
    resolve_cols_i(
      expr = !!object$columns,
      data = data
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
    resolve_vector_i(
      expr = !!object$spanners,
      vector = spanner_ids
    )

  resolved_spanners <- spanner_ids[resolved_spanners_idx]

  # Create a list object
  cells_resolved <- list(spanners = resolved_spanners)

  # Apply the `columns_cells_resolved` class
  class(cells_resolved) <- "columns_spanners_resolved"

  cells_resolved
}

#' @param expr An unquoted expression that follows tidyselect semantics
#' @param data A gt object or data frame or tibble
#' @return Character vector
#' @noRd
resolve_cols_c <- function(expr,
                           data,
                           strict = TRUE) {

  names(
    resolve_cols_i(
      expr = {{expr}},
      data = data,
      strict = strict
    )
  )
}

#' @param expr An unquoted expression that follows tidyselect semantics
#' @param data A gt object or data frame or tibble
#' @param strict If TRUE, out-of-bounds errors are thrown if `expr` attempts to
#'   select a column that doesn't exist. If FALSE, failed selections are
#'   ignored.
#' @return Named integer vector
#' @noRd
resolve_cols_i <- function(expr,
                           data,
                           strict = TRUE) {

  quo <- rlang::enquo(expr)
  cols_excl <- c()

  if (is_gt(data)) {

    cols <- colnames(dt_data_get(data = data))

    # Assumes that only the body of the data is considered (i.e., not the
    # stub or group cols)
    stub_var <- dt_boxhead_get_var_stub(data)
    group_rows_vars <- dt_boxhead_get_vars_groups(data)

    cols_excl <- c(stub_var, group_rows_vars)

    data <- dt_data_get(data = data)
  }

  stopifnot(is.data.frame(data))

  quo <- translate_legacy_resolver_expr(quo)

  # No env argument required, because the expr is a quosure
  selected <- tidyselect::eval_select(expr = quo, data = data, strict = strict)

  # Exclude certain columns (e.g., stub & group columns) if necessary
  selected[!names(selected) %in% cols_excl]
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
    row_names <- dt_stub_df_get(data)$rowname
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

    unknown_indices <- setdiff(resolved, seq_len(nrow(data)))
    if (length(unknown_indices) != 0) {
      stop(
        "The following row number(s) do not exist in the data: ",
        paste0(unknown_indices, collapse = ", "),
        call. = FALSE
      )
    }

    resolved <- seq_len(nrow(data)) %in% resolved

  } else if (is.character(resolved)) {

    unknown_rownames <- setdiff(resolved, row_names)
    if (length(unknown_rownames) != 0) {
      stop(
        "The following rowname(s) do not exist in the data: ",
        paste0(unknown_rownames, collapse = ", "),
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

resolve_vector_l <- function(expr, vector) {

  quo <- rlang::enquo(expr)

  resolved <-
    tidyselect::with_vars(
      vars = vector,
      expr = rlang::eval_tidy(expr = quo, data = NULL)
    )

  if (is.null(resolved)) {

    # Maintained for backcompat
    resolved <- rep_len(TRUE, length(vector))

  } else if (is.logical(resolved)) {

    if (length(resolved) == 1) {
      resolved <- rep_len(resolved, length(vector))
    } else if (length(resolved) == length(vector)) {
      # Do nothing
    } else {
      stop(
        "The number of logical values must either be 1 or the number of items",
        call. = FALSE
      )
    }

  } else if (is.numeric(resolved)) {

    unknown_indices <- setdiff(resolved, seq_along(vector))

    if (length(unknown_indices) != 0) {
      stop(
        "The following item number(s) do not exist in the data: ",
        paste0(unknown_indices, collapse = ", "),
        call. = FALSE
      )
    }

    resolved <- seq_along(vector) %in% resolved

  } else if (is.character(resolved)) {

    unknown_values <- setdiff(resolved, vector)

    if (length(unknown_values) != 0) {
      stop(
        "The following item(s) do not exist in the data: ",
        paste0(unknown_values, collapse = ", "),
        call. = FALSE
      )
    }

    resolved <- vector %in% resolved

  } else {

    stop(
      "Don't know how to select items using an object of class ",
      class(resolved)[1],
      call. = FALSE
    )
  }

  resolved
}

resolve_vector_i <- function(expr, vector) {
  which(resolve_vector_l(expr = {{ expr }}, vector = vector))
}
