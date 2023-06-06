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
#  Copyright (c) 2018-2023 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


.dt_spanners_key <- "_spanners"

dt_spanners_get <- function(data) {
  dt__get(data, .dt_spanners_key)
}

dt_spanners_set <- function(data, spanners) {
  dt__set(data, .dt_spanners_key, spanners)
}

dt_spanners_init <- function(data) {

  spanners <-
    dplyr::tibble(
      # Column names that are part of the spanner
      vars = list(),
      # The spanner label
      spanner_label = list(),
      # The spanner id
      spanner_id = character(0),
      # The spanner level
      spanner_level = integer(0),
      # Should be columns be gathered under a single spanner label?
      gather = logical(0),
      built = NA_character_
    )

  dt_spanners_set(data = data, spanners = spanners)
}

dt_spanners_add <- function(
    data,
    vars,
    spanner_label,
    spanner_id,
    spanner_level,
    gather,
    replace
) {

  spanners <- dt_spanners_get(data = data)

  spanners_at_level <-
    dplyr::filter(spanners, .env$spanner_level == .data$spanner_level)

  if (
    !replace &&
    any(vars %in% unlist(spanners_at_level[["vars"]]))
  ) {

    error_vars <-
      paste(
        vars[vars %in% unlist(spanners_at_level[["vars"]])],
        collapse = ", "
      )

    cli::cli_abort(
      "The column(s) used (`{error_vars}`) for the new spanner `{spanner_id}`
      belong to an existing spanner."
    )
  }

  spanners <-
    dplyr::bind_rows(
      spanners,
      dplyr::tibble(
        vars = list(vars),
        spanner_label = list(spanner_label),
        spanner_id = as.character(spanner_id),
        spanner_level = as.integer(spanner_level),
        gather = gather,
        built = NA_character_
      )
    )

  dt_spanners_set(data = data, spanners = spanners)
}

dt_spanners_exists <- function(data) {

  spanners <- dt_spanners_get(data = data)

  nrow(spanners) > 0
}

dt_spanners_build <- function(data, context) {

  spanners <- dt_spanners_get(data = data)

  spanners$built <-
    vapply(
      spanners$spanner_label,
      FUN.VALUE = character(1),
      FUN = function(label) process_text(label, context = context)
    )

  dt_spanners_set(data = data, spanners = spanners)
}

dt_spanners_get_ids <- function(data) {
  dt_spanners_get(data = data)$spanner_id
}

dt_spanners_print_matrix <- function(
    data,
    include_hidden = TRUE,
    ids = FALSE,
    omit_columns_row = FALSE
) {

  spanners_tbl <- dt_spanners_get(data = data)

  if (!include_hidden) {
    vars <- dt_boxhead_get_vars_default(data = data)
  } else {
    vars <- dt_boxhead_get_vars(data = data)
  }

  # If `spanners_tbl` is immediately empty then return a single-row
  # matrix of column vars/IDs (or not, if `omit_columns_row = TRUE`)
  if (nrow(spanners_tbl) < 1) {
    return(
      empty_spanner_matrix(vars = vars, omit_columns_row = omit_columns_row)
    )
  }

  # Modify `spanners_tbl` such that:
  # (1) only visible vars are included in the `vars` column
  # (2) entries with no vars (after step 1) are removed, and
  # (3) `spanner_level` values have all gaps removed, being compressed
  #     down to start at 1 (e.g., 7, 5, 3, 1 -> 4, 3, 2, 1)
  spanners_tbl <-
    dplyr::mutate(spanners_tbl, vars = lapply(.data$vars, base::intersect, .env$vars))

  spanners_tbl <-
    dplyr::filter(spanners_tbl, vapply(vars, length, integer(1)) > 0)

  spanners_tbl <-
    dplyr::mutate(
      spanners_tbl,
      spanner_level = match(spanner_level, sort(unique(spanner_level)))
    )

  # If `spanners_tbl` is immediately empty then return a single-row
  # matrix of column vars/IDs (or not, if `omit_columns_row = TRUE`)
  if (nrow(spanners_tbl) < 1) {
    return(
      empty_spanner_matrix(vars = vars, omit_columns_row = omit_columns_row)
    )
  }

  # Get the height of the spanner matrix
  spanner_height <- max(spanners_tbl[["spanner_level"]])

  vars_vec <- rep(NA_character_, length(vars))
  names(vars_vec) <- vars

  # Initialize matrix to serve as boxhead representation
  columns_mat <-
    matrix(NA_character_, nrow = spanner_height, ncol = length(vars_vec))
  colnames(columns_mat) <- vars

  for (i in seq_len(nrow(spanners_tbl))) {
    columns_mat[spanners_tbl$spanner_level[[i]], spanners_tbl$vars[[i]]] <-
      if (ids) spanners_tbl$spanner_id[[i]] else spanners_tbl$built[[i]]
  }

  # Flip matrix in y direction to put boxhead levels in display order
  columns_mat <- columns_mat[rev(seq_len(nrow(columns_mat))), , drop = FALSE]

  if (!omit_columns_row) {
    columns_mat <- rbind(columns_mat, matrix(vars, nrow = 1, ncol = length(vars)))
  }

  columns_mat
}

empty_spanner_matrix <- function(vars, omit_columns_row) {

  columns_mat <- matrix(vars, nrow = 1, ncol = length(vars))
  colnames(columns_mat) <- vars

  if (omit_columns_row) {
    columns_mat <- columns_mat[-1, , drop = FALSE]
  }

  columns_mat
}

dt_spanners_matrix_height <- function(
    data,
    include_hidden = FALSE,
    omit_columns_row = FALSE
) {

  nrow(
    dt_spanners_print_matrix(
      data = data,
      include_hidden = include_hidden,
      omit_columns_row = omit_columns_row
    )
  )
}
