.dt_stub_key <- "_stub"

dt_stub_get <- function(data) {

  attr(data, .dt_stub_key, exact = TRUE)
}

dt_stub_set <- function(data, stub) {

  attr(data, .dt_stub_key) <- stub
  data
}

dt_stub_init <- function(data) {

}

dt_stub_configure <- function(data,
                              rowname_col,
                              groupname_col,
                              rownames_to_stub,
                              stub_group.sep) {

  data <- dt_data_get(data = data)

  vars_to_hide <- c()

  # If the option to place rownames in the stub
  # is taken, then the `stub_df` data frame will
  # be pre-populated with rownames in the `rowname`
  # column; otherwise, this will be an empty df
  if (isTRUE(rownames_to_stub)) {

    data_rownames <- rownames(data)

    stub_df <-
      dplyr::tibble(
        rownum_i = seq_len(nrow(data)),
        groupname = NA_character_,
        rowname = data_rownames,
      )

  } else {

    stub_df <-
      dplyr::tibble(
        rownum_i = seq_len(nrow(data)),
        groupname = rep(NA_character_, nrow(data)),
        rowname = rep(NA_character_, nrow(data))
      )
  }

  # If `rowname` is a column available in `data`,
  # place that column's data into `stub_df` and
  # remove it from `data`
  if (rowname_col %in% colnames(data)) {

    # Place the `rowname` values into `stub_df$rowname`
    stub_df[["rowname"]] <- as.character(data[[rowname_col]])

    vars_to_hide <- c(vars_to_hide, rowname_col)
  }

  # If `data` is a `grouped_df` then create groups from the
  # group columns; note that this will overwrite any values
  # already in `stub_df$groupname`
  if (inherits(data, "grouped_df")) {

    group_cols <- dplyr::group_vars(data)
    group_cols <- base::intersect(group_cols, colnames(data))

    group_labels <-
      apply(
        data[, group_cols],
        MARGIN = 1,
        paste, collapse = stub_group.sep
      )

    # Place the `group_labels` values into `stub_df$groupname`
    stub_df[["groupname"]] <- group_labels

    vars_to_hide <- c(vars_to_hide, group_cols)

  } else if (groupname_col %in% colnames(data)) {

    # If `groupname` is a column available in `data`,
    # place that column's data into `stub_df` and
    # remove it from `data`

    # Place the `groupname` values into `stub_df$groupname`
    stub_df[["groupname"]] <- as.character(data[[groupname_col]])

    vars_to_hide <- c(vars_to_hide, groupname_col)
  }

  # Stop if input `data` has no columns (after modifying
  # `data` for groups)
  if (ncol(data) == 0) {
    stop("The `data` must have at least one column that isn't a 'group' column.",
         call. = FALSE)
  }

  data <- dt_data_set(data = data, data = data)
  data <- dt_stub_set(data = data, stub = stub)

  data
}
