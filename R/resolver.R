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
#  Copyright (c) 2018-2026 gt authors
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
resolve_cells_stub <- function(
    data,
    object,
    call = rlang::caller_env()
) {

  #
  # Resolution of columns as a character vector providing
  # the names of the matched stub variables
  #
  stub_vars <- dt_boxhead_get_var_stub(data = data)

  # Handle case where no stub exists
  if (length(stub_vars) == 0 || all(is.na(stub_vars))) {

    resolved_columns <- character(0)

  } else if (!is.null(object$columns)) {
    #
    # Only resolve columns if the columns parameter exists
    #

    # Check if columns expression is everything() (default)
    expr_text <- rlang::quo_text(object$columns)

    if (expr_text == "everything()") {

      # Handle everything() case explicitly for stub columns
      resolved_columns <- stub_vars

    } else {

      # First resolve columns normally with stub inclusion
      resolved_columns <-
        resolve_cols_c(
          expr = !!object$columns,
          data = data,
          excl_stub = FALSE,
          call = call
        )

      # Validate that all requested columns are actually stub columns
      if (length(resolved_columns) > 0) {

        # Check if the requested columns are stub columns
        all_data_cols <- names(dt_data_get(data))
        requested_cols <- intersect(resolved_columns, all_data_cols)

        if (length(requested_cols) > 0) {

          non_stub_cols <- setdiff(requested_cols, stub_vars)

          if (length(non_stub_cols) > 0) {

            available_stub_cols <-
              if (length(stub_vars) > 0) {
                paste0(
                  "Available stub columns: ",
                  paste(stub_vars, collapse = ", ")
                )
              } else {
                "This table has no stub columns."
              }

            cli::cli_abort(
              c(
                "Column{?s} {.val {non_stub_cols}} {?is/are} not stub column{?s}.",
                "i" = "cells_stub() can only target columns that are part of the table stub.",
                "i" = available_stub_cols,
                "i" = "To target non-stub columns, use cells_body() instead."
              )
            )
          }
        }
      }

      # Filter to only include actual stub variables
      resolved_columns <- intersect(resolved_columns, stub_vars)
    }

  } else {
    # Legacy behavior: no columns parameter provided
    resolved_columns <- character(0)
  }

  #
  # Resolution of rows as integer vectors
  # providing the positions of the matched variables
  # Enhanced to support content-based targeting
  #
  resolved_rows_idx <-
    resolve_stub_rows_enhanced(
      expr = !!object$rows,
      data = data,
      columns = resolved_columns,
      call = call
    )

  # For hierarchical stubs, correct row indices to point to group leaders and
  # apply hierarchical correction for row-spanned cells in hierarchical stubs;
  # this ensures that when users target a row within a hierarchical group,
  # the styling is applied to the actual row-spanned cell in the HTML output
  #
  # Only apply this correction when:
  #
  # 1. we have multiple stub columns (hierarchical structure)
  # 2. we have specific column targeting
  # 3. the rows were explicitly specified with INTEGER indices
  # 4. the target column is the leftmost column (which typically has row-spanned cells)
  if (length(resolved_columns) > 0 && length(stub_vars) > 1) {

    # Check if rows were explicitly specified with integer indices
    rows_expr <- rlang::quo_get_expr(object$rows)
    is_explicit_rows <- !identical(rows_expr, quote(everything()))
    is_integer_targeting <-
      is.numeric(rows_expr) ||
      (is.call(rows_expr) && any(sapply(rows_expr, is.numeric)))

    if (is_explicit_rows && is_integer_targeting) {

      # Apply correction only for the leftmost column (which typically has
      # row-spanned cells)
      for (col_name in resolved_columns) {

        col_position <- which(stub_vars == col_name)

        # Only apply hierarchical correction if this is the leftmost stub column
        if (length(col_position) > 0 && col_position == 1) {

          resolved_rows_idx <-
            resolve_hierarchical_stub_indices(
              data = data,
              row_indices = resolved_rows_idx,
              target_column = col_name
            )
        }
      }
    }
  }

  # Create a list object
  cells_resolved <- list(columns = resolved_columns, rows = resolved_rows_idx)

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

  levels <- attr(object, "spanner_levels")

  if (!is.null(levels)) {
    # check if there are wrong level expectations in the argument

    # must be numeric
    if (!all(suppressWarnings(!is.na(as.numeric(levels))))) {
      cli::cli_warn(c(
        "All values of vector `levels` must be numeric.",
        "!" = "Please check wrong element{?/s}: [{levels[suppressWarnings(is.na(as.numeric(levels)))]}]."
      ))

      levels <- levels[suppressWarnings(!is.na(as.numeric(levels)))]
    }
    # must actually exist

    wrong_levels <- setdiff(levels, unique(spanners$spanner_level))
    if (length(wrong_levels) > 0) {
      cli::cli_warn(c(
        "All values of vector `levels` must exist in spanner definition.",
        "i" = "currently only the following level{?s} {?is/are} available: [{as.character(unique(spanners$spanner_level))}].",
        "!" = "Please check wrong element{?s} of vector `levels`: [{wrong_levels}]."
      ))

      levels <- setdiff(levels, wrong_levels)
    }

    # filter for levels
    spanners <- vctrs::vec_slice(
      spanners,
      spanners$spanner_level %in% levels
    )
  }  #
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

  if (identical(Sys.getenv("GT_AVOID_RESOLVE"), "true")) {
    ret <- names(dt_data_get(data))
    return(ret)
  }

  null_means <- rlang::arg_match0(null_means, c("everything", "nothing"))

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
    # Check if the expression is a stub() call (with or without arguments)
    stub_label <- rlang::as_label(quo)
    if (grepl("^(gt::)?stub\\(", stub_label)) {

      stub_var <- dt_boxhead_get_var_stub(data = data)

      if (!is.null(stub_var) && !all(is.na(stub_var))) {

        # Evaluate the stub() expression to get the column parameter if any
        stub_result <- rlang::eval_tidy(quo)
        column_idx <- attr(stub_result, "column")

        # If column index is specified, select that specific stub column
        # (1 = rightmost, 2 = second from right, etc.)
        if (!is.null(column_idx)) {
          # Validate the column index
          if (!is.numeric(column_idx) || length(column_idx) != 1 || column_idx < 1) {
            cli::cli_abort(
              "The {.arg column} argument in {.fn stub} must be a single positive integer."
            )
          }

          # Check if the requested column exists
          if (column_idx > length(stub_var)) {
            cli::cli_abort(c(
              "Cannot select stub column {column_idx}.",
              "i" = "This table has {length(stub_var)} stub column{?s}."
            ))
          }

          # Select from right to left (1 = rightmost)
          selected_stub_var <- stub_var[length(stub_var) - column_idx + 1]
          stub_col <- 1
          names(stub_col) <- selected_stub_var
          return(stub_col)

        } else {
          # No column specified, return all stub columns
          stub_col <- seq_along(stub_var)
          names(stub_col) <- stub_var
          return(stub_col)
        }
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
  if (identical(Sys.getenv("GT_AVOID_RESOLVE"), "true")) {
    ret <- seq_len(nrow(dt_data_get(data)))
    return(ret)
  }
  null_means <- rlang::arg_match0(null_means, c("everything", "nothing"))

  resolved_rows <-
    resolve_rows_l(
      expr = {{ expr }},
      data = data,
      null_means = null_means,
      call = call
    )

  if (is.null(resolved_rows)) {
    return(NULL)
  }

  which(resolved_rows)
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

  if (length(resolved) == 0) {
    # Error if groups = everything() and no row groups. Return NULL otherwise.
    input <- tryCatch(rlang::as_label(quo), error = NULL)
    if (identical(input, "everything()")) {
      # Abort to suggest grand_summary_rows() instead. (#1292)
      cli::cli_abort(c(
        "Since gt v0.9.0, `groups = everything()` is deprecated in
        {.fn summary_rows} if no row groups are present.",
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

    if (length(resolved) == 0) {
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

      resolver_stop_on_numeric(
        item_label = item_label,
        unknown_resolved = unknown_resolved,
        call = call
      )
    }

    resolved <- item_sequence %in% resolved

  } else if (is.character(resolved)) {

    unknown_resolved <- setdiff(resolved, item_names)

    if (length(unknown_resolved) != 0) {

      if (all(is.na(item_names)) && item_label == "row")  {
        # Send a more informative message when the gt table has no rows
        # rows need to be initialized with `rownames_to_stub = TRUE` or with
        # `rowname_col = <column>`
        # Issue #1535 (Override the resolver default error message.)

        cli::cli_abort(c(
          "Can't find named rows in the table",
          "i" = "In {.help [gt()](gt::gt)}, use {.code rownames_to_stub = TRUE}
          or specify {.arg rowname_col} to initialize row names in the table."
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
    resolver_stop_unknown(
      item_label = item_label,
      resolved = resolved,
      call = call
    )
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
    "If logical, {.arg {item_label}s} must have length 1 or {expected_length},
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
    "{item_label}{cli::qty(l)}{?s} {unknown_resolved} {cli::qty(l)}do{?es/}
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
    "Don't know how to select {item_label}s using
    {.obj_type_friendly {resolved}}.",
    call = call
  )
}

cap_first_letter <- function(x) {
  substr(x, 1, 1) <- toupper(substr(x, 1, 1))
  x
}

#' Enhanced stub row resolution with content-based targeting
#'
#' @param expr The expression for row specification (can be numeric indices or
#' content values)
#' @param data The gt table data object
#' @param columns The resolved stub columns for context
#' @param call The calling environment for error reporting
#' @noRd
resolve_stub_rows_enhanced <- function(
    expr,
    data,
    columns = NULL,
    call = rlang::caller_env()
) {

  # Evaluate the expression to get the rows specification
  quo <- rlang::enquo(expr)

  # Handle the special case of everything() which is the default
  if (identical(rlang::quo_get_expr(quo), quote(everything()))) {
    return(seq_len(nrow(dt_data_get(data))))
  }

  # Try to evaluate the expression
  tryCatch({
    rows_spec <- rlang::eval_tidy(quo, data = dt_data_get(data))

    # If NULL or missing, return all rows
    if (is.null(rows_spec)) {
      return(seq_len(nrow(dt_data_get(data))))
    }

    # If TRUE, return all rows
    if (identical(rows_spec, TRUE)) {
      return(seq_len(nrow(dt_data_get(data))))
    }

    # If logical vector, convert to row indices
    if (is.logical(rows_spec)) {
      return(which(rows_spec))
    }

    # If character, use enhanced content-based targeting (do this before
    # the numeric check)
    if (is.character(rows_spec)) {
      return(resolve_stub_content_targeting(data, rows_spec, columns, call))
    }

    # If numeric, use simple integer targeting (no hierarchical correction)
    if (is.numeric(rows_spec)) {
      # Validate row indices
      data_tbl <- dt_data_get(data)
      valid_rows <- rows_spec[rows_spec >= 1 & rows_spec <= nrow(data_tbl)]
      return(as.integer(valid_rows))
    }

    # For other types, fall back to traditional resolution
    return(resolve_rows_i(expr = {{ expr }}, data = data, call = call))

  }, error = function(e) {

    # If evaluation fails, fall back to traditional resolution
    return(resolve_rows_i(expr = {{ expr }}, data = data, call = call))
  })
}

#' Resolve stub rows by content-based targeting
#'
#' @param data The gt table data object
#' @param rows_spec Character vector of content values to target
#' @param columns Specific stub columns to search in (optional)
#' @param call The calling environment for error reporting
#' @noRd
resolve_stub_content_targeting <- function(
    data,
    rows_spec,
    columns = NULL,
    call = rlang::caller_env()
) {

  # Get the data table and stub variables
  data_tbl <- dt_data_get(data)
  stub_vars <- dt_boxhead_get_var_stub(data)

  # Handle case where no stub exists
  if (length(stub_vars) == 0 || all(is.na(stub_vars))) {
    cli::cli_abort(
      c(
        "Cannot use content-based targeting: table has no stub columns.",
        "i" = "Use numeric row indices instead, or add stub columns with
        `rowname_col` in `gt()`."
      ),
      call = call
    )
  }

  # Create a comprehensive stub targeting map
  stub_map <- create_stub_targeting_map_internal(data_tbl, stub_vars)

  resolved_rows <- c()

  for (row_spec in rows_spec) {

    current_rows <- c()

    # Strategy 1: Direct value match in specified columns (if provided)
    if (!is.null(columns) && length(columns) > 0) {

      for (col in columns) {

        key <- paste0(col, ":", row_spec)

        if (key %in% names(stub_map)) {
          current_rows <- c(current_rows, stub_map[[key]])
        }
      }
    }

    # Strategy 2: Search all stub columns for the value (if no specific
    # columns or no matches)
    if (length(current_rows) == 0) {

      for (col in stub_vars) {

        key <- paste0(col, ":", row_spec)

        if (key %in% names(stub_map)) {
          current_rows <- c(current_rows, stub_map[[key]])
        }
      }
    }

    # Strategy 3: Hierarchical match with partial keys (for complex
    # hierarchical targeting)
    if (length(current_rows) == 0) {

      # Look for hierarchical keys that contain this value
      matching_keys <-
        names(stub_map)[grepl(paste0(":", row_spec, "$"), names(stub_map))]

      for (key in matching_keys) {
        current_rows <- c(current_rows, stub_map[[key]])
      }
    }

    # If still no matches found, provide helpful error
    if (length(current_rows) == 0) {
      # Get available values for error message
      available_values <- c()
      for (col in stub_vars) {
        col_values <- unique(data_tbl[[col]])
        available_values <- c(available_values, paste0(col, ": ", col_values))
      }

      cli::cli_abort(
        c(
          "Cannot find '{row_spec}' in any stub column.",
          "i" = "Available values in stub columns:",
          set_names(
            paste0("  ", available_values), rep("*", length(available_values))
          )
        ),
        call = call
      )
    }

    resolved_rows <- c(resolved_rows, current_rows)
  }

  # Return unique rows in original order
  unique(resolved_rows)
}

#' Create an internal stub targeting map
#'
#' @param data_tbl The data table
#' @param stub_vars The stub column variables
#' @noRd
create_stub_targeting_map_internal <- function(data_tbl, stub_vars) {

  stub_map <- list()

  # For each stub column, create mappings from values to row indices
  for (col_name in stub_vars) {

    col_values <- data_tbl[[col_name]]
    unique_values <- unique(col_values)

    for (value in unique_values) {

      rows_with_value <- which(col_values == value)
      key <- paste0(col_name, ":", value)
      stub_map[[key]] <- rows_with_value
    }
  }

  # Add hierarchical mappings for multi-column stubs
  if (length(stub_vars) > 1) {

    for (row_idx in seq_len(nrow(data_tbl))) {
      row_values <- sapply(stub_vars, function(col) data_tbl[[col]][row_idx])

      # Add mappings for each level of hierarchy
      for (level in seq_along(stub_vars)) {

        partial_values <- row_values[1:level]
        partial_key <-
          paste(stub_vars[1:level], partial_values, sep=":", collapse="|")

        # Find all rows that match this partial hierarchy
        matching_rows <- c()
        for (check_row in seq_len(nrow(data_tbl))) {

          check_values <-
            sapply(stub_vars[1:level], function(col) data_tbl[[col]][check_row])

          if (all(check_values == partial_values)) {
            matching_rows <- c(matching_rows, check_row)
          }
        }

        stub_map[[partial_key]] <- matching_rows
      }
    }
  }

  stub_map
}

#' Resolve hierarchical stub targeting for numeric row indices
#'
#' When targeting rows in hierarchical stubs, we need to ensure that
#' the styling is applied to the correct hierarchical parent rows.
#' For example, if we target row 3 in the "mfr" column, but "Ferrari"
#' spans rows 2-5, we should apply the style to row 2 (the first Ferrari row).
#'
#' @param data The gt table data object
#' @param rows_spec Numeric vector of row indices to target
#' @param columns The resolved stub columns for context
#' @param call The calling environment for error reporting
#' @noRd
resolve_hierarchical_stub_targeting <- function(
    data,
    rows_spec,
    columns = NULL,
    call = rlang::caller_env()
) {

  # If no columns specified, just return the rows as-is (traditional behavior)
  if (is.null(columns) || length(columns) == 0) {
    return(rows_spec)
  }

  # Get the table data
  data_tbl <- dt_data_get(data)
  stub_vars <- dt_boxhead_get_var_stub(data)

  # If we don't have hierarchical stub columns, return as-is
  if (length(stub_vars) <= 1) {
    return(rows_spec)
  }

  # For each target row and each target column, find the hierarchical parent row
  expanded_rows <- c()

  for (row_idx in rows_spec) {
    if (row_idx > nrow(data_tbl)) {
      # Skip invalid row indices
      next
    }

    for (col_name in columns) {
      if (!col_name %in% stub_vars) {
        # Skip non-stub columns
        next
      }

      # Find the position of this column in the stub hierarchy
      col_position <- which(stub_vars == col_name)

      # For hierarchical stubs, we need to find the first row with this value
      # in the hierarchical group
      target_value <- data_tbl[[col_name]][row_idx]

      # Find all rows with the same values in the higher-level columns
      # (columns to the left in the hierarchy)
      if (col_position > 1) {

        # Get the higher-level column values for this row
        higher_cols <- stub_vars[1:(col_position - 1)]
        higher_values <- data_tbl[row_idx, higher_cols, drop = FALSE]

        # Find all rows that match the higher-level columns
        matching_rows <- seq_len(nrow(data_tbl))

        for (i in seq_len(ncol(higher_values))) {

          matching_rows <-
            matching_rows[
              data_tbl[[higher_cols[i]]][matching_rows] == higher_values[[i]]
            ]
        }

        # Among the matching rows, find the first one with the target value
        # in the target column
        target_rows <-
          matching_rows[data_tbl[[col_name]][matching_rows] == target_value]

        if (length(target_rows) > 0) {

          # Add the first row of this hierarchical group
          expanded_rows <- c(expanded_rows, min(target_rows))
        }
      } else {

        # For the first column, find the first row with this value
        target_rows <- which(data_tbl[[col_name]] == target_value)
        if (length(target_rows) > 0) {
          expanded_rows <- c(expanded_rows, min(target_rows))
        }
      }
    }
  }

  # Return unique row indices, sorted
  unique(sort(c(rows_spec, expanded_rows)))
}

#' Map row indices to their hierarchical group leaders for stub columns
#'
#' For hierarchical stubs, when a label spans multiple rows, we need to map
#' any row index within that span to the first row of the span (the group leader).
#' This ensures that styling and footnotes work correctly regardless of which
#' row within the hierarchical group is targeted.
#'
#' @param data The gt table data object
#' @param row_indices The row indices to map
#' @param target_column The stub column being targeted (optional)
#' @noRd
resolve_hierarchical_stub_indices <- function(
    data,
    row_indices,
    target_column = NULL
) {

  # Get the data and stub variables
  data_tbl <- dt_data_get(data)
  stub_vars <- dt_boxhead_get_var_stub(data)

  # If no stub or single column stub, return as-is
  if (length(stub_vars) <= 1 || is.null(target_column)) {
    return(row_indices)
  }

  # Find the position of the target column in the stub hierarchy
  target_pos <- which(stub_vars == target_column)

  # If target column is not found or is the rightmost column, return as-is
  if (length(target_pos) == 0 || target_pos == length(stub_vars)) {
    return(row_indices)
  }

  #
  # For hierarchical stubs, we need to map each row to its group leader
  # The group leader is the first row with the same values in all columns
  # to the left of (and including) the target column
  #

  corrected_indices <- integer(length(row_indices))

  for (i in seq_along(row_indices)) {
    row_idx <- row_indices[i]

    # If row index is out of bounds, keep as-is
    if (row_idx < 1 || row_idx > nrow(data_tbl)) {
      corrected_indices[i] <- row_idx
      next
    }

    # Get the values for the hierarchical grouping columns (up to and
    # including the target)
    grouping_cols <- stub_vars[1:target_pos]
    target_values <- data_tbl[row_idx, grouping_cols, drop = FALSE]

    # Find the first row that has the same values in all grouping columns
    group_leader <- NA

    for (j in 1:nrow(data_tbl)) {

      current_values <- data_tbl[j, grouping_cols, drop = FALSE]

      if (all(target_values == current_values, na.rm = TRUE)) {
        group_leader <- j
        break
      }
    }

    # Use the group leader if found, otherwise use the original index
    corrected_indices[i] <- if (!is.na(group_leader)) group_leader else row_idx
  }

  return(corrected_indices)
}
