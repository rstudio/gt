.dt_spanners_key <- "_spanners"

dt_spanners_get <- function(data) {

  dt__get(data, .dt_spanners_key)
}

dt_spanners_set <- function(data, spanners) {

  dt__set(data, .dt_spanners_key, spanners)
}

dt_spanners_init <- function(data) {

  empty_list <- lapply(seq_along(names(data)), function(x) NULL)

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
  ) %>%
    dt_spanners_set(spanners = ., data = data)
}

dt_spanners_add <- function(data,
                            vars,
                            spanner_label,
                            spanner_id,
                            spanner_level,
                            gather,
                            replace) {

  spanners_at_level <-
    dt_spanners_get(data = data) %>%
    dplyr::filter(.env$spanner_level == .data$spanner_level)

  if (
    !replace &&
    any(vars %in% unlist(spanners_at_level[["vars"]]))
  ) {

    error_vars <-
      paste(
        vars[vars %in% unlist(spanners_at_level[["vars"]])],
        collapse = ", "
      )

    stop(
      "The column(s) used (", error_vars ,") for the new spanner `",
      spanner_id, "` belong to an existing spanner",
      call. = FALSE
    )
  }

  dt_spanners_get(data = data) %>%
    dplyr::bind_rows(
      dplyr::tibble(
        vars = list(vars),
        spanner_label = list(spanner_label),
        spanner_id = as.character(spanner_id),
        spanner_level = as.integer(spanner_level),
        gather = gather,
        built = NA_character_
      )
    ) %>%
    dt_spanners_set(spanners = ., data = data)
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
      FUN = function(label) process_text(label, context)
    )

  data <- dt_spanners_set(data = data, spanners = spanners)

  data
}

dt_spanners_get_ids <- function(data) {

  spanners <- dt_spanners_get(data = data)

  spanners$spanner_id
}

dt_spanners_print_matrix <- function(
    data,
    include_hidden = TRUE,
    ids = FALSE,
    omit_columns_row = FALSE
) {

  spanners_tbl <- dt_spanners_get(data = data)

  remove_entry <- rep(FALSE, nrow(spanners_tbl))

  if (!include_hidden) {
    vars <- dt_boxhead_get_vars_default(data = data)
  } else {
    vars <- dt_boxhead_get_vars(data = data)
  }

  # Keep only the columns in `spanners_tbl` that are in the `vars`;
  # this will exclude spanners if their columns aren't in `vars` (this
  # is possible when hiding columns via `col_hide()`
  for (i in seq_len(nrow(spanners_tbl))) {

    vars_spanner_i <- unlist(spanners_tbl[i, ][["vars"]])
    vars_spanner_i_flt <- base::intersect(vars_spanner_i, vars)

    if (length(vars_spanner_i_flt) < 1) {
      # If none of the columns under the proposed spanner are
      # set as visible columns, then we need to mark the spanner
      # entry for deletion from `spanners_tbl`
      remove_entry[i] <- TRUE
    } else {
      spanners_tbl[i, ][["vars"]] <- list(vars_spanner_i_flt)
    }
  }

  # Remove entries from `spanners_tbl` as needed
  spanners_tbl <- spanners_tbl[!remove_entry, ]

  # Get the maximum height of the spanner matrix; this won't
  # necessarily be the finalized height since we will collapse
  # empty rows
  if (nrow(spanners_tbl) < 1) {
    spanner_height <- 0
  } else {
    spanner_height <- max(spanners_tbl[["spanner_level"]])
  }

  vars_vec <- rep(NA_character_, length(vars))
  names(vars_vec) <- vars

  # Initialize matrix to serve as boxhead representation
  columns_mat <- matrix(vars, nrow = 1, ncol = length(vars))

  columns_mat <-
    rbind(
      columns_mat,
      if (spanner_height > 0) {
      matrix(vars_vec, nrow = spanner_height, ncol = length(vars_vec))
      }
    )
  colnames(columns_mat) <- vars

  spanners_tbl <- spanners_tbl %>% dplyr::filter(spanner_level >= 1)

  columns_mat_id <- columns_mat_labels <- columns_mat

  if (spanner_height > 0) {

    for (i in seq_len(nrow(spanners_tbl))) {

      columns_mat_id[spanners_tbl$spanner_level[[i]] + 1, spanners_tbl$vars[[i]]] <-
        spanners_tbl$spanner_id[i]

      columns_mat_labels[spanners_tbl$spanner_level[[i]] + 1, spanners_tbl$vars[[i]]] <-
        spanners_tbl$built[i]
    }

    # Flip matrix in y direction to put boxhead levels in display order
    columns_mat_id <- columns_mat_id[rev(seq_len(nrow(columns_mat_id))), ]
    columns_mat_labels <- columns_mat_labels[rev(seq_len(nrow(columns_mat_labels))), ]

    # TODO: Prune any rows that are completely filled with NA values
    na_rows <- c()
    for (i in seq_len(nrow(columns_mat_id))) {

      row_i_unique <- unique(columns_mat_id[i, ])

      if (length(row_i_unique) == 1 && is.na(row_i_unique)) {
        na_rows <- c(na_rows, i)
      }
    }

    if (length(na_rows) > 0) {
      columns_mat_id <- columns_mat_id[-na_rows, ]
      columns_mat_labels <- columns_mat_labels[-na_rows, ]
    }

  }

  if (omit_columns_row) {
    columns_mat_id <- columns_mat_id[-nrow(columns_mat_id), , drop = FALSE]
    columns_mat_labels <- columns_mat_labels[-nrow(columns_mat_labels), , drop = FALSE]
  }

  if (ids) {
    return(columns_mat_id)
  } else {
    return(columns_mat_labels)
  }
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
