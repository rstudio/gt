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
#  Copyright (c) 2018-2025 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


# summary_columns() ------------------------------------------------------------
#' Add summary columns using aggregation functions
#'
#' @description
#'
#' The `summary_columns()` function adds one or more computed columns to a table
#' by aggregating values across selected columns within each row. This is the
#' horizontal counterpart to [summary_rows()], which aggregates down columns to
#' create summary rows. Common use cases include calculating row totals, row
#' averages, or other row-wise statistics.
#' 
#' Summary columns are computed immediately when the function is called and are
#' added to the table's data as regular columns. This means they can be
#' referenced in subsequent **gt** operations like [cols_move()], [fmt_number()],
#' [tab_style()], or even in other computed columns via [cols_add()].
#' 
#' You can create a single summary column or multiple columns at once by
#' providing a list of aggregation functions. The functions can be any R
#' expression that takes a vector of values and returns a single value (like
#' `sum()`, `mean()`, `max()`, `min()`, etc.). Column names and labels can be
#' auto-generated from function names or explicitly specified.
#'
#' @inheritParams fmt_number
#'
#' @param columns *Columns to aggregate*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns to aggregate across for each row. Can either be a series of
#'   column names provided in `c()`, a vector of column indices, or a select
#'   helper function (e.g. [starts_with()], [ends_with()], [contains()],
#'   [matches()], [num_range()], and [everything()]).
#'
#' @param fns *Aggregation Expression(s)*
#'
#'   `<expression|list of expressions>`
#'
#'   One or more functions used for aggregation. For a single summary column,
#'   provide a single function as a formula (e.g., `~ sum(.)`), character
#'   string (e.g., `"sum"`), or bare function (e.g., `sum`). For multiple
#'   summary columns, provide a list of formulas (e.g.,
#'   `list(~ sum(.), ~ mean(.), ~ sd(.))`). Base functions like `mean`, `min`,
#'   `max`, `median`, `sd`, and `sum` are supported, along with any
#'   user-defined aggregation functions.
#'
#' @param new_col_names *Names for new summary columns*
#'
#'   `vector<character>` // *default:* `NULL`
#'
#'   Optional names for the new summary columns. Can provide one name for a
#'   single summary column, or multiple names (must match the length of `fns`)
#'   when adding multiple columns. These names are used as column identifiers
#'   for targeting in other **gt** functions (e.g., [fmt_number()],
#'   [tab_style()]). If `NULL`, names will be generated from the function
#'   expressions (e.g., `"sum"`, `"mean"`) or default to `"summary_1"`,
#'   `"summary_2"`, etc.
#'
#' @param new_col_labels *Labels for new summary columns*
#'
#'   `list|vector<character>` // *default:* `NULL`
#'
#'   Optional labels for the new summary column headers. Can provide one label
#'   for a single column, or multiple labels (must match the length of `fns`)
#'   when adding multiple columns. Can include plain text or use [md()] or
#'   [html()] helpers. If `NULL`, will use `new_col_names` as labels.
#'   **Important**: Use `list()` instead of `c()` when mixing plain text with
#'   [md()] or [html()] objects to preserve their classes (e.g.,
#'   `list("Total", md("**Average**"))`).
#'
#' @param fmt *Formatting expression*
#'
#'   `<expression>`
#'
#'   An optional formatting expression in formula form. The RHS of `~` should
#'   contain a formatting call (e.g., `~ fmt_number(., decimals = 2)`).
#'
#' @param side *Side used for placement of summary column*
#'
#'   `singl-kw:[right|left]` // *default:* `"right"`
#'
#'   Should the summary column be placed on the `"right"` (the default) or the
#'   `"left"` side of the table?
#'
#' @param missing_text *Replacement text for `NA` values*
#'
#'   `scalar<character>` // *default:* `"---"`
#'
#'   The text to be used in place of `NA` values in the summary column cells.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use a subset of the [`gtcars`] dataset to create a **gt** table. Add a
#' summary column that computes row totals across numeric columns using
#' `summary_columns()`.
#'
#' ```r
#' # Single summary column
#' gtcars |>
#'   dplyr::select(mfr, model, hp, trq, msrp) |>
#'   dplyr::slice_head(n = 10) |>
#'   gt(rowname_col = "model") |>
#'   summary_columns(
#'     columns = c(hp, trq, msrp),
#'     fns = ~ sum(.),
#'     new_col_names = "total",
#'     new_col_labels = "Total",
#'     side = "right"
#'   ) |>
#'   fmt_number(columns = total, decimals = 0)
#'
#' # Multiple summary columns at once
#' gtcars |>
#'   dplyr::select(mfr, model, hp, trq, msrp) |>
#'   dplyr::slice_head(n = 10) |>
#'   gt(rowname_col = "model") |>
#'   summary_columns(
#'     columns = c(hp, trq, msrp),
#'     fns = list(~ sum(.), ~ mean(.), ~ max(.)),
#'     new_col_names = c("total", "average", "maximum"),
#'     new_col_labels = list("Total", md("**Average**"), "Maximum"),
#'     side = "right"
#'   ) |>
#'   fmt_number(columns = c(total, average, maximum), decimals = 0)
#' ```
#'
#' @family row addition/modification functions
#' @section Function ID:
#' 6-3
#'
#' @section Function Introduced:
#' `v0.12.0` (October 23, 2025)
#'
#' @export
summary_columns <- function(
    data,
    columns = everything(),
    fns = NULL,
    new_col_names = NULL,
    new_col_labels = NULL,
    fmt = NULL,
    side = c("right", "left"),
    missing_text = "---"
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Get the correct `side` value
  side <- rlang::arg_match0(side, values = c("right", "left"))

  # Resolve the column names to aggregate
  columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data
    )

  # Validate that we have columns to aggregate
  if (length(columns) == 0) {
    cli::cli_abort(c(
      "No columns were selected for aggregation.",
      "*" = "Specify columns using the `columns` argument."
    ))
  }

  # Validate fns argument
  if (is.null(fns)) {
    cli::cli_abort(c(
      "An aggregation function must be provided.",
      "*" = "Use the `fns` argument to specify a function like `~ sum(.)`."
    ))
  }

  # Determine if we're adding single or multiple columns
  # Convert single function to list for consistent processing
  if (rlang::is_formula(fns) || is.character(fns) || is.function(fns)) {
    fns_list <- list(fns)
    is_single <- TRUE
  } else if (is.list(fns)) {
    fns_list <- fns
    is_single <- FALSE
  } else {
    cli::cli_abort(c(
      "The `fns` argument must be a formula, function, character string, or list.",
      "*" = "Examples: `~ sum(.)` or `list(~ sum(.), ~ mean(.))`."
    ))
  }

  n_fns <- length(fns_list)

  # Validate and normalize names and labels
  if (is_single) {

    # Single column case
    # Generate name if not provided
    if (is.null(new_col_names)) {

      fn_name <- extract_fn_name(fns_list[[1]])
      
      if (is.na(fn_name) || fn_name == "") {
        
        existing_summary_cols <- dt_summary_cols_get(data = data)
        col_number <- length(existing_summary_cols) + 1
        col_names <- paste0("summary_", col_number)
      
      } else {
        col_names <- fn_name
      }
    } else {
      col_names <- as.character(new_col_names[1])
    }

    # Generate label if not provided
    if (is.null(new_col_labels)) {
      col_labels <- list(col_names)
    } else {
      # Handle both list and vector input
      if (is.list(new_col_labels)) {
        col_labels <- list(new_col_labels[[1]])
      } else {
        col_labels <- list(new_col_labels[1])
      }
    }

  } else {

    # Multiple columns case

    # Generate or validate names
    if (is.null(new_col_names)) {

      # Generate names from functions
      col_names <- 
        vapply(
          seq_len(n_fns),
          FUN.VALUE = character(1),
          function(i) {
            fn <- fns_list[[i]]
            fn_name <- extract_fn_name(fn)
            
            if (is.na(fn_name) || fn_name == "") {
              paste0("summary_", i)
            } else {
              fn_name
            }
          }
        )

    } else {
      
      if (length(new_col_names) != n_fns) {
        cli::cli_abort(c(
          "The length of `new_col_names` must match the number of functions in `fns`.",
          "*" = "Provided {length(new_col_names)} name{?s} for {n_fns} function{?s}."
        ))
      }

      col_names <- as.character(new_col_names)
    }

    # Generate or validate labels
    if (is.null(new_col_labels)) {
      
      col_labels <- as.list(col_names)  # Convert to list for consistent handling
    
    } else {
      
      if (length(new_col_labels) != n_fns) {
        cli::cli_abort(c(
          "The length of `new_col_labels` must match the number of functions in `fns`.",
          "*" = "Provided {length(new_col_labels)} label{?s} for {n_fns} function{?s}."
        ))
      }
      
      # Ensure new_col_labels is a list (handles both list and vector input)
      col_labels <- if (is.list(new_col_labels)) new_col_labels else as.list(new_col_labels)
    }
  }

  # Check for duplicate or existing column names
  existing_cols <- colnames(dt_data_get(data = data))
  
  for (col_name in col_names) {
    
    if (col_name %in% existing_cols) {
      cli::cli_abort(c(
        "The column name {.val {col_name}} already exists in the table.",
        "*" = "Choose different column names."
      ))
    }
  }

  # Check for duplicates within the new names
  if (anyDuplicated(col_names)) {
    cli::cli_abort(c(
      "Duplicate column names found in `new_col_names`.",
      "*" = "Each summary column must have a unique name."
    ))
  }

  # Normalize formatting expression if provided
  fmt_fn <- 
    if (!is.null(fmt)) {
      normalize_fmt_col_fn(fmt = fmt)
    } else {
      NULL
    }

  # Compute and add summary columns
  data_tbl <- dt_data_get(data = data)
  col_data <- data_tbl[, columns, drop = FALSE]

  # Process each function and add its corresponding column
  for (i in seq_along(fns_list)) {
    
    col_name <- col_names[i]
    col_label <- col_labels[[i]]  # Use [[i]] to extract element, not [i] which returns a list
    
    fn <- fns_list[[i]]

    # Normalize the aggregation function
    summary_fn <- normalize_summary_col_fn(fns = fn)
    fn_closure <- rlang::as_closure(summary_fn)

    # Compute summary values for each row
    summary_values <- 
      apply(
        col_data,
        MARGIN = 1,
        FUN = function(row_vals) {
          # Convert row to numeric if needed
          row_vals <- as.numeric(row_vals)
          # Apply the function
          result <- fn_closure(row_vals)
          # Return result
          if (is.na(result) || is.nan(result)) NA else result
        }
      )

    # Determine placement position
    if (side == "right") {
      
      # Add after the last column (or after the previous summary column)
      current_cols <- colnames(dt_data_get(data = data))
      after_col <- current_cols[length(current_cols)]
      
      data <-
        cols_add(
          .data = data,
          !!col_name := summary_values,
          .after = dplyr::all_of(after_col)
        )
    
    } else {
      
      # Add before the first column (or before the previous summary column)
      current_cols <- colnames(dt_data_get(data = data))
      
      before_col <- 
        if (i == 1) {
          current_cols[1]
        } else {
          col_names[i - 1]
        }
      
      data <-
        cols_add(
          .data = data,
          !!col_name := summary_values,
          .before = dplyr::all_of(before_col)
        )
    }

    # Update the column label
    data <-
      dt_boxhead_edit_column_label(
        data = data,
        var = col_name,
        column_label = col_label
      )

    # Store summary column metadata
    summary_col_spec <- list(
      new_col_names = col_name,
      new_col_labels = col_label,
      columns = columns,
      fn = summary_fn,
      fmt = fmt_fn,
      side = side,
      missing_text = missing_text
    )
    
    data <- dt_summary_cols_add(
      data = data,
      summary_col = summary_col_spec
    )
  }

  # Apply formatting if specified to all new columns
  if (!is.null(fmt_fn)) {
    
    # Ensure that the expression is a closure
    fmt_closure <- rlang::as_closure(fmt_fn)

    # Apply the formatting to all new columns
    data <- fmt_closure(data)
  }

  # Return the modified gt object
  data
}

# Summary column helpers -------------------------------------------------------

# Extract function name from a formula or function for auto-naming
extract_fn_name <- function(fn) {
  
  if (rlang::is_formula(fn)) {
    
    # Try to extract function name from formula RHS
    rhs <- rlang::f_rhs(fn)
    
    if (is.call(rhs)) {
      
      fn_name <- as.character(rhs[[1]])
      
      # Remove namespace prefix if present (e.g., "stats::mean" -> "mean")
      if (grepl("::", fn_name)) {
        fn_name <- sub(".*::", "", fn_name)
      }
      
      return(fn_name)
    }

  } else if (is.character(fn)) {

    return(fn)
  
  } else if (is.function(fn)) {
    
    # Try to get the function name from the calling environment
    # This is tricky, so we'll just return NA
    return(NA_character_)
  }
  
  return(NA_character_)
}

# Normalize `fns` input in `summary_columns`
normalize_summary_col_fn <- function(fns) {

  if (is.null(fns)) {
    cli::cli_abort(c(
      "An aggregation function must be provided.",
      "*" = "Use the `fns` argument to specify a function like `~ sum(.)`."
    ))
  }

  # Handle character input (function name as string)
  if (is.character(fns)) {
    if (fns %in% c("min", "max", "mean", "median", "sd", "sum")) {
      fn <- stats::as.formula(paste0("~ ", fns, "(., na.rm = TRUE)"))
    } else {
      fn <- stats::as.formula(paste0("~ ", fns, "(.)"))
    }
    return(fn)
  }

  # Handle formula input
  if (rlang::is_formula(fns)) {

    # Extract just the RHS if it's a formula
    if (!is.null(rlang::f_lhs(fns))) {

      # If there's a LHS, ignore it for now (could be used for label in future)
      cli::cli_warn(c(
        "The left-hand side of the formula is ignored in `summary_column()`.",
        "*" = "Use `new_col_name` and `new_col_label` to set the column name and label."
      ))
    }

    return(rlang::new_formula(lhs = NULL, rhs = rlang::f_rhs(fns)))
  }

  # Handle function input
  if (is.function(fns)) {
    return(stats::as.formula(paste0("~ fns(.)")))
  }

  # If we get here, the input format is not supported
  cli::cli_abort(c(
    "The `fns` argument must be a function, formula, or character string.",
    "*" = "Examples: `~ sum(.)`, `\"sum\"`, or `sum`."
  ))
}

# Normalize `fmt` input in `summary_column`
normalize_fmt_col_fn <- function(fmt) {

  if (is.null(fmt) || length(fmt) == 0) {
    return(NULL)
  }

  if (rlang::is_formula(fmt)) {

    # Ensure LHS is NULL
    if (!is.null(rlang::f_lhs(fmt))) {
      rlang::f_lhs(fmt) <- NULL
    }
    return(fmt)
  }

  return(NULL)
}
