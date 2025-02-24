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


.dt_spanners_key <- "_spanners"

dt_spanners_get <- function(data) {
  dt__get(data, .dt_spanners_key)
}

dt_spanners_set <- function(data, spanners) {
  dt__set(data, .dt_spanners_key, spanners)
}

dt_spanners_init <- function(data) {

  spanners <-
    vctrs::data_frame(
      # Column names that are part of the spanner
      vars = list(),
      # The spanner label
      spanner_label = list(),
      # The spanner units
      spanner_units = character(0L),
      # The spanner pattern
      spanner_pattern = character(0L),
      # The spanner ID
      spanner_id = character(0L),
      # The spanner level
      spanner_level = integer(0L),
      # Should be columns be gathered under a single spanner label?
      gather = logical(0L),
      built = NA_character_
    )

  dt_spanners_set(data = data, spanners = spanners)
}

dt_spanners_add <- function(
    data,
    vars,
    spanner_label,
    spanner_units,
    spanner_pattern,
    spanner_id,
    spanner_level,
    gather,
    replace,
    call = rlang::caller_env()
) {

  spanners <- dt_spanners_get(data = data)

  spanners_at_level <-
    dplyr::filter(spanners, .env$spanner_level == .data$spanner_level)

  if (
    !replace &&
    any(vars %in% unlist(spanners_at_level[["vars"]]))
  ) {

    error_vars <-
      vars[vars %in% unlist(spanners_at_level[["vars"]])]
    cli::cli_abort(c(
      "x" = "Can't create the {.val {spanner_id}} spanner.",
      "!" = "Column{?s} {.code {error_vars}} belong{?s/} to an existing spanner.",
      "i" = "Specify {.arg columns} appropriately by using other variable names."
    ),
    call = call
    )
  }

  spanners <-
    dplyr::bind_rows(
      spanners,
      dplyr::tibble(
        vars = list(vars),
        spanner_label = list(spanner_label),
        spanner_units = as.character(spanner_units),
        spanner_pattern = as.character(spanner_pattern),
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
      FUN.VALUE = character(1L),
      FUN = function(label) process_text(label, context = context)
    )

  # Merge spanner units into built spanner labels
  if (!all(is.na(spanners$spanner_units))) {

    for (i in seq_along(spanners$spanner_label)) {

      if (is.na(spanners[["spanner_units"]][i])) next

      spanner_label <- spanners[["built"]][i]

      units <- spanners[["spanner_units"]][i]
      spanner_pattern <- spanners[["spanner_pattern"]][i]

      units_built <-
        render_units(
          define_units(units_notation = units),
          context = context
        )

      if (
        spanner_pattern == "" &&
        grepl("\\{\\{.*?\\}\\}", spanner_label) ||
        (
          grepl("\\{\\{", spanner_label, fixed = TRUE) &&
          grepl("\\}\\}", spanner_label, fixed = TRUE)
        ) ||
        (
          grepl("\\'7b\\'7b", spanner_label, fixed = TRUE) &&
          grepl("\\'7d\\'7d", spanner_label, fixed = TRUE)
        )
      ) {

        # With `spanner_pattern` equal to `""`, we can surmise that this was
        # set automatically by `tab_spanner()`; the mechanism now is to replace
        # the units text in the label with the 'built' units text
        if (context == "latex") {

          spanner_label <- gsub("\\{\\{", "{{", spanner_label, fixed = TRUE)
          spanner_label <- gsub("\\}\\}", "}}", spanner_label, fixed = TRUE)

          spanner_label <-
            gsub(
              "\\{\\{.*?\\}\\}",
              gsub("\\", "\\\\", units_built, fixed = TRUE),
              spanner_label
            )

        } else if (context == "rtf") {

          spanner_label <- gsub("\\'7b\\'7b", "{{", spanner_label, fixed = TRUE)
          spanner_label <- gsub("\\'7d\\'7d", "}}", spanner_label, fixed = TRUE)

          spanner_label <-
            gsub(
              "\\{\\{.*?\\}\\}",
              gsub("\\", "\\\\", units_built, fixed = TRUE),
              spanner_label
            )

        } else {

          spanner_label <- gsub("\\{\\{.*?\\}\\}", units_built, spanner_label)
        }

      } else {

        if (is.na(spanner_pattern)) {

          # Obtain the default `spanner_pattern` (which that is settable in the
          # `column_labels.units_pattern` option of `tab_options()`
          spanner_pattern <-
            dt_options_get_value(
              data = data,
              option = "column_labels_units_pattern"
            )
        }

        if (context == "latex") {
          spanner_label <- gsub("\\{\\{", "{{", spanner_label, fixed = TRUE)
          spanner_label <- gsub("\\}\\}", "{{", spanner_label, fixed = TRUE)
        }

        spanner_pattern <- gsub("{1}", spanner_label, spanner_pattern, fixed = TRUE)
        spanner_pattern <- gsub("{2}", units_built, spanner_pattern, fixed = TRUE)
        spanner_label <- spanner_pattern
      }

      spanners$built[i] <- spanner_label
    }
  }

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

  if (include_hidden) {
    vars <- dt_boxhead_get_vars(data = data)
  } else {
    vars <- dt_boxhead_get_vars_default(data = data)
  }

  # If `spanners_tbl` is immediately empty then return a single-row
  # matrix of column vars/IDs (or not, if `omit_columns_row = TRUE`)
  if (nrow(spanners_tbl) < 1L) {
    return(
      empty_spanner_matrix(vars = vars, omit_columns_row = omit_columns_row)
    )
  }

  # Modify `spanners_tbl` such that:
  # (1) only visible vars are included in the `vars` column
  # (2) entries with no vars (after step 1) are removed, and
  # (3) `spanner_level` values have all gaps removed, being compressed
  #     down to start at 1 (e.g., 7, 5, 3, 1 -> 4, 3, 2, 1)
  spanners_tbl$vars <-
    lapply(spanners_tbl$vars, base::intersect, vars)

  # keep rows where vars is non-empty
  spanners_tbl <- spanners_tbl[lengths(spanners_tbl$vars) > 0L, , drop = FALSE]

  spanners_tbl$spanner_level <-
    match(spanners_tbl$spanner_level, sort(unique(spanners_tbl$spanner_level)))

  # If `spanners_tbl` is immediately empty then return a single-row
  # matrix of column vars/IDs (or not, if `omit_columns_row = TRUE`)
  if (nrow(spanners_tbl) < 1L) {
    return(
      empty_spanner_matrix(vars = vars, omit_columns_row = omit_columns_row)
    )
  }

  # Get the height of the spanner matrix
  spanner_height <- max(spanners_tbl[["spanner_level"]])

  vars_vec <- rep_len(NA_character_, length(vars))
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
    columns_mat <- rbind(columns_mat, matrix(vars, nrow = 1L, ncol = length(vars)))
  }

  columns_mat
}

empty_spanner_matrix <- function(vars, omit_columns_row) {

  columns_mat <- matrix(vars, nrow = 1L, ncol = length(vars))
  colnames(columns_mat) <- vars

  if (omit_columns_row) {
    columns_mat <- columns_mat[-1L, , drop = FALSE]
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
