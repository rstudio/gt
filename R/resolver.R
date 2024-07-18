#------------------------------------------------------------------------------#
#
#                /$$
#               | $$
#     /$$$$$$  /$$$$$$
#    /$$__  $$|_  $$_/
#   | $$  \ $$  | $$
#   | $$  | $$  | $$ /$$
#   |  $$$$$$$  |  $$$$/
#    \____  $$   \___/
#    /$$  \ $$
#   |  $$$$$$/
#    \______/
#
#  This file is part of the 'rstudio/gt' project.
#
#  Copyright (c) 2018-2024 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


#' Resolve the `cells_body` object once it has access to the `data` object
#'
#' @param data A table object that is created using the `gt()` function.
#' @param object The list object created by the `cells_body()` function.
#'
#' @noRd
resolve_cells_body <- function(data, object, call = rlang::caller_env()) {

  #
  # Resolution of columns and rows as integer vectors
  # providing the positions of the matched variables
  #

  # Resolve columns as index values
  resolved_columns_idx <-
    resolve_cols_i(
      expr = !!object$columns,
      data = data,
      call = call
    )

  # Resolve rows as index values
  resolved_rows_idx <-
    resolve_rows_i(
      expr = !!object$rows,
      data = data,
      call = call
    )

  # Get all possible combinations with `expand.grid()`
  expansion <-
    expand.grid(
      resolved_columns_idx,
      resolved_rows_idx,
      stringsAsFactors = FALSE
    )
  expansion <- dplyr::distinct(expansion)
  # TODO consider sort_by when depending on 4.4?
  epansion <- expansion[order(expansion$Var1), , drop = FALSE]

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
                               object,
                               call = rlang::caller_env()) {

  #
  # Resolution of rows as integer vectors
  # providing the positions of the matched variables
  #
  resolved_rows_idx <-
    resolve_rows_i(
      expr = !!object$rows,
      data = data,
      call = call
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
resolve_cells_column_labels <- function(
    data,
    object,
    call = rlang::caller_env()
) {

  #
  # Resolution of columns as integer vectors
  # providing the positions of the matched variables
  #
  resolved_columns <-
    resolve_cols_i(
      expr = !!object$columns,
      data = data,
      call = call
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
resolve_cells_column_spanners <- function(
    data,
    object,
    call = rlang::caller_env()
) {

  spanners <- dt_spanners_get(data = data)

  #
  # Resolution of spanners as column spanner names
  #
  spanner_labels <- unlist(spanners$spanner_label)
  spanner_labels <- unique(spanner_labels[!is.na(spanner_labels)])

  spanner_ids <- spanners$spanner_id
  spanner_ids <- spanner_ids[!is.na(spanner_ids)]

  resolved_spanners_idx <-
    resolve_vector_i(
      expr = !!object$spanners,
      vector = spanner_ids,
      item_label = "spanner",
      call = call
    )

  resolved_spanners <- spanner_ids[resolved_spanners_idx]

  # Create a list object
  cells_resolved <- list(spanners = resolved_spanners)

  # Apply the `columns_cells_resolved` class
  class(cells_resolved) <- "columns_spanners_resolved"

  cells_resolved
}

#' Resolve the row group values in the `cells_row_groups` object once it
#' has access to the `data` object
#'
#' @param data A table object that is created using the `gt()` function.
#' @param object The list object created by the `cells_row_groups()`
#'   function.
#' @noRd
resolve_cells_row_groups <- function(data, object, call = rlang::caller_env()) {

  row_groups <- dt_row_groups_get(data = data)

  resolved_row_groups_idx <-
    resolve_vector_i(
      expr = !!object$groups,
      vector = row_groups,
      item_label = "group",
      call = call
    )

  resolved_row_groups <- row_groups[resolved_row_groups_idx]

  # Create a list object
  cells_resolved <- list(groups = resolved_row_groups)

  # Apply the `columns_cells_resolved` class
  class(cells_resolved) <- "row_groups_resolved"

  cells_resolved
}

#' @param expr An unquoted expression that follows **tidyselect** semantics
#' @param data A gt object or data frame or tibble
#' @return Character vector
#' @noRd
resolve_cols_c <- function(
    expr,
    data,
    strict = TRUE,
    excl_stub = TRUE,
    excl_group = TRUE,
    null_means = c("everything", "nothing"),
    call = rlang::caller_env()
) {

  null_means <- rlang::arg_match(null_means)

  names(
    resolve_cols_i(
      expr = {{ expr }},
      data = data,
      strict = strict,
      excl_stub = excl_stub,
      excl_group = excl_group,
      null_means = null_means,
      call = call
    )
  )
}

#' @param expr An unquoted expression that follows **tidyselect** semantics
#' @param data A gt object or data frame or tibble
#' @param strict If TRUE, out-of-bounds errors are thrown if `expr` attempts to
#'   select a column that doesn't exist. If FALSE, failed selections are
#'   ignored.
#' @param excl_stub If TRUE then the table stub column, if present, will be
#'   excluded from the selection of column names.
#' @return Named integer vector
#' @noRd
resolve_cols_i <- function(
    expr,
    data,
    strict = TRUE,
    excl_stub = TRUE,
    excl_group = TRUE,
    null_means = c("everything", "nothing"),
    call = rlang::caller_env()
) {
  quo <- rlang::enquo(expr)
  cols_excl <- NULL # c()
  null_means <- rlang::arg_match(null_means)

  if (is_gt_tbl(data = data)) {

    # If we use the gt-specific select helper `stub()` then we
    # will retrieve the stub var name and return the output in the
    # same format as the return value for `tidyselect::eval_select()`
    if (rlang::as_label(quo) %in% c("stub()", "gt::stub()")) {

      stub_var <- dt_boxhead_get_var_stub(data = data)

      if (!is.null(stub_var)) {
        stub_col <- 1
        names(stub_col) <- stub_var
        return(stub_col)
      } else {
        return(NULL)
      }
    }

    # If we use the gt-specific select helper `row_group()` then we
    # will retrieve the row_group var name and return the output in the
    # same format as the return value for `tidyselect::eval_select()`
    if (rlang::as_label(quo) %in% c("row_group()", "gt::row_group()")) {

      row_group_var <- dt_boxhead_get_vars_groups(data = data)

      if (!is.null(row_group_var)) {
        row_group_col <- 1
        names(row_group_col) <- row_group_var
        return(row_group_col)
      } else {
        return(NULL)
      }
    }

    # In most cases we would want to exclude the column that
    # represents the stub but that isn't always the case (e.g.,
    # when considering the stub for column sizing); the `excl_stub`
    # argument will determine whether the stub column is obtained
    # for exclusion or not (if FALSE, we get NULL which removes the
    # stub, if present, from `cols_excl`)
    stub_var <-
      if (excl_stub) {
        dt_boxhead_get_var_stub(data = data)
      } else {
        NULL
      }

    # The columns that represent the group rows are usually
    # always excluded but in certain cases (i.e., `rows_add()`)
    # we may want to include this column
    group_var <-
      if (excl_group) {
        dt_boxhead_get_vars_groups(data = data)[1]
      } else {
        NULL
      }


    cols_excl <- c(stub_var, group_var)

    data <- dt_data_get(data = data)
  }

  stopifnot(is.data.frame(data))

  quo <- translate_legacy_resolver_expr(quo, null_means)

  # With the quosure and the `data`, we can use `tidyselect::eval_select()`
  # to resolve the expression to columns indices/names; no `env` argument
  # is required here because the `expr` is a quosure
  # TODO: with tidyselect v1.2.0, there are a lot of warnings emitted because
  # of the way that the expression is supplied; this can be fixed later (since
  # these errors are developer facing) but suppressing here was important so
  # as to not pollute the snapshot testing values with warnings (that would
  # cause failures)
  selected <-
    suppressWarnings(
      tidyselect::eval_select(
        expr = quo,
        data = data,
        strict = strict,
        error_call = call # user-facing error message
      )
    )

  # Exclude certain columns (e.g., stub & group columns) if necessary
  selected[!names(selected) %in% cols_excl]
}

#' @param quo A quosure that might contain legacy gt column criteria
#' @noRd
translate_legacy_resolver_expr <- function(quo, null_means) {

  expr <- rlang::quo_get_expr(quo = quo)

  if (identical(expr, FALSE)) {
    cli::cli_warn(c(
      "Since gt v0.3.0, `columns = FALSE` has been deprecated.",
      "*" = "Please use `columns = c()` instead."
    ))

    rlang::quo_set_expr(quo = quo, expr = quote(NULL))

  } else if (identical(expr, TRUE)) {

    cli::cli_warn(c(
      "Since gt v0.3.0, `columns = TRUE` has been deprecated.",
      "*" = "Please use `columns = everything()` instead."
    ))

    rlang::quo_set_expr(quo = quo, expr = quote(everything()))

  } else if (is.null(expr)) {

    if (null_means == "everything") {

      cli::cli_warn(c(
        "Since gt v0.3.0, `columns = NULL` has been deprecated.",
        "*" = "Please use `columns = everything()` instead."
      ))

      rlang::quo_set_expr(quo = quo, expr = quote(everything()))

    } else {

      rlang::quo_set_expr(quo = quo, expr = quote(NULL))
    }

  } else if (rlang::quo_is_call(quo = quo, name = "vars")) {

    cli::cli_warn(c(
      "Since gt v0.3.0, `columns = vars(...)` has been deprecated.",
      "*" = "Please use `columns = c(...)` instead."
    ))

    rlang::quo_set_expr(
      quo = quo,
      expr = rlang::call2(quote(c), !!!rlang::call_args(expr))
    )

  } else {
    # No legacy expression detected
    quo
  }
}

resolve_rows_l <- function(
    expr,
    data,
    null_means,
    call = rlang::caller_env()
) {

  if (is_gt_tbl(data = data)) {
    # unlist because dt_stub_df_get might return a list instead of a vector
    # (when helper functions such as md/html were used)
    row_names <- unlist(dt_stub_df_get(data = data)$row_id)
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

    if (null_means == "everything") {

      cli::cli_warn(c(
        "Since gt v0.3.0, the use of `NULL` for `rows` has been deprecated.",
        "*" = "Please use `TRUE` instead."
      ))

      # Modify the NULL value of `resolved` to `TRUE` (which is
      # fully supported for selecting all rows)
      resolved <- TRUE

    } else {
      return(NULL)
    }
  }

  resolved <-
    normalize_resolved(
      resolved = resolved,
      item_names = row_names,
      item_label = "row",
      call = call
    )

  resolved
}

resolve_rows_i <- function(
    expr,
    data,
    null_means = c("everything", "nothing"),
    call = rlang::caller_env()
) {

  null_means <- rlang::arg_match(null_means)

  resolved_rows <-
    resolve_rows_l(
      expr = {{ expr }},
      data = data,
      null_means = null_means,
      call = call
    )

  if (!is.null(resolved_rows)) {
    return(which(resolved_rows))
  } else {
    return(NULL)
  }
}

resolve_vector_l <- function(
    expr,
    vector,
    item_label = "item",
    call = rlang::caller_env()
  ) {

  quo <- rlang::enquo(expr)

  resolved <-
    tidyselect::with_vars(
      vars = vector,
      expr = rlang::eval_tidy(expr = quo, data = NULL)
    )

  resolved <-
    normalize_resolved(
      resolved = resolved,
      item_names = vector,
      item_label = item_label,
      call = call
    )

  resolved
}

resolve_vector_i <- function(
    expr,
    vector,
    item_label = "item",
    call = rlang::caller_env()
) {

  which(
    resolve_vector_l(
      expr = {{ expr }},
      vector = vector,
      item_label = item_label,
      call = call
    )
  )
}

resolve_groups <- function(expr, vector) {

  quo <- rlang::enquo(expr)

  resolved <-
    tidyselect::with_vars(
      vars = vector,
      expr = rlang::eval_tidy(expr = quo, data = NULL)
    )

  if (length(resolved) == 1 && resolved == ":GRAND_SUMMARY:") {
    return(":GRAND_SUMMARY:")
  }

  if (is.null(resolved)) {

    # Provide deprecation warning
    cli::cli_warn(c(
      "Since gt v0.9.0, `groups = NULL` is deprecated.",
      "i" = "If this was intended for generation of grand summary rows,
  use `grand_summary_rows()` instead."
    ))

    return(":GRAND_SUMMARY:")
  }

  # Handle groups = FALSE supplied to not do any summary rows.
  if (isFALSE(resolved)) {
    resolved <- NULL
  }

  if (length(resolved) < 1) {
    # Error if groups = everything() and no row groups. Return NULL otherwise.
    input <- tryCatch(rlang::as_label(quo), error = NULL)
    if (identical(input, "everything()")) {
      # Abort to suggest grand_summary_rows() instead. (#1292)
      cli::cli_abort(c(
        "Since gt v0.9.0, `groups = everything()` is deprecated in {.fn summary_rows} if no row groups are present.",
        "i" = "Use `grand_summary_rows()` instead or add row groups."
        ),
        call = NULL
      )
    }
    return(NULL)
  }

  if (is.integer(resolved)) {
    return(vector[resolved])
  }

  if (is.character(resolved)) {

    resolved <- base::intersect(resolved, vector)

    if (length(resolved) < 1) {
      return(NULL)
    }

    return(resolved)
  }

  NULL
}

normalize_resolved <- function(
    resolved,
    item_names,
    item_label,
    call = rlang::caller_env()
) {

  item_count <- length(item_names)
  item_sequence <- seq_along(item_names)

  if (is.null(resolved)) {

    # Maintained for backcompatability
    resolved <- rep_len(TRUE, item_count)

    # TODO: this may not apply to all types of resolution so we may
    # want to either make this warning conditional (after investigating which
    # resolving contexts still allow `NULL`)
    cli::cli_warn(c(
      "Since gt v0.3.0, the use of `NULL` for {item_label} has been deprecated.",
      "*" = "Please use `everything()` instead."
    ))

  } else if (is.logical(resolved)) {

    if (length(resolved) == 1) {
      resolved <- rep_len(resolved, item_count)
    } else if (length(resolved) == item_count) {
      # Do nothing
    } else {
      resolver_stop_on_logical(
        item_label = item_label,
        actual_length = length(resolved),
        expected_length = item_count,
        call = call
      )
    }

  } else if (is.numeric(resolved)) {

    unknown_resolved <- setdiff(resolved, item_sequence)
    if (length(unknown_resolved) != 0) {
      resolver_stop_on_numeric(item_label = item_label, unknown_resolved = unknown_resolved, call = call)
    }
    resolved <- item_sequence %in% resolved

  } else if (is.character(resolved)) {

    unknown_resolved <- setdiff(resolved, item_names)
    if (length(unknown_resolved) != 0) {
      if (all(is.na(item_names)) && item_label == "row")  {
        # Send a more informative message when the gt table has no rows
        # rows need to be initialized with `rownames_to_stub = TRUE` or with `rowname_col = <column>`
        # Issue #1535 (Override the resolver default error message.)

        cli::cli_abort(c(
          "Can't find named rows in the table",
          "i" = "In {.help [gt()](gt::gt)}, use {.code rownames_to_stub = TRUE} or specify {.arg rowname_col} to initialize row names in the table."
        ), call = call)
      }

      # Potentially use arg_match() when rlang issue is solved?
      resolver_stop_on_character(
        item_label = item_label,
        unknown_resolved = unknown_resolved,
        call = call
      )
    }
    resolved <- item_names %in% resolved

  } else {
    resolver_stop_unknown(item_label = item_label, resolved = resolved, call = call)
  }

  resolved
}

resolver_stop_on_logical <- function(
    item_label,
    actual_length,
    expected_length,
    call = rlang::caller_env()
) {

  cli::cli_abort(
    "If logical, {.arg {item_label}s} must have length 1 or {expected_length}, \\
     not {actual_length}.",
    call = call
  )
}

resolver_stop_on_numeric <- function(
    item_label,
    unknown_resolved,
    call = rlang::caller_env()
) {
  item_label <- cap_first_letter(item_label)
  # Specify cli pluralization
  l <- length(unknown_resolved)
  cli::cli_abort(
    "{item_label}{cli::qty(l)}{?s} {unknown_resolved} {cli::qty(l)}do{?es/} \\
    not exist in the data.",
    call = call
  )
}

resolver_stop_on_character <- function(
    item_label,
    unknown_resolved,
    call = rlang::caller_env()
) {
  item_label <- cap_first_letter(item_label)
  # Specify cli pluralization
  l <- length(unknown_resolved)
  cli::cli_abort(
    "{item_label}{cli::qty(l)}{?s} {.str {unknown_resolved}}
    do{?es/} not exist in the data.",
    call = call
  )
}

resolver_stop_unknown <- function(
    item_label,
    resolved,
    call = rlang::caller_env()
) {

  cli::cli_abort(
    "Don't know how to select {item_label}s using {.obj_type_friendly {resolved}}.",
    call = call
  )
}

cap_first_letter <- function(x) {
  substr(x, 1, 1) <- toupper(substr(x, 1, 1))
  x
}
