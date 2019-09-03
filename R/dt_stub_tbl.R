.dt_stub_tbl_key <- "_stub_tbl"

dt_stub_tbl_get <- function(data) {

  attr(data, .dt_stub_tbl_key, exact = TRUE)
}

dt_stub_tbl_set <- function(data, stub_tbl) {

  attr(data, .dt_stub_tbl_key) <- stub_tbl
  data
}

dt_stub_tbl_init <- function(data,
                             gt_stub_params) {

  data_tbl <- dt_data_tbl_get(data = data)

  # If the option to place rownames in the stub
  # is taken, then the `stub_df` data frame will
  # be pre-populated with rownames in the `rowname`
  # column; otherwise, this will be an empty df
  if (isTRUE(gt_stub_params$rownames_to_stub)) {

    stub_tbl <-
      dplyr::tibble(
        groupname = NA_character_,
        rowname = rownames(data_tbl)
      )

  } else {

    stub_tbl <-
      dplyr::tibble(
        groupname = rep(NA_character_, nrow(data_tbl)),
        rowname = rep(NA_character_, nrow(data_tbl))
      )
  }

  # If `rowname` is a column available in `data`,
  # place that column's data into `stub_tbl` and
  # remove it from `data`
  if (gt_stub_params$rowname_col %in% colnames(data_tbl)) {

    # Place the `rowname` values into `stub_tbl$rowname`
    stub_tbl[["rowname"]] <-
      as.character(data_tbl[[gt_stub_params$rowname_col]])

    # Remove the `rowname` column from `data`
    data_tbl[[gt_stub_params$rowname_col]] <- NULL
  }

  # If `data` is a `grouped_df` then create groups from the
  # group columns; note that this will overwrite any values
  # already in `stub_tbl$groupname`
  if (inherits(data_tbl, "grouped_df")) {

    group_cols <- dplyr::group_vars(data_tbl)
    group_cols <- base::intersect(group_cols, colnames(data_tbl))

    group_labels <-
      apply(
        data_tbl[, group_cols],
        MARGIN = 1,
        paste, collapse = gt_stub_params$stub_group.sep
      )

    # Place the `group_labels` values into `stub_tbl$groupname`
    stub_tbl[["groupname"]] <- group_labels

    # Remove all columns in `group_cols` from `data`
    data_tbl[, which(colnames(data_tbl) %in% group_cols)] <- NULL

  } else if (gt_stub_params$groupname_col %in% colnames(data_tbl)) {

    # If `groupname` is a column available in `data`,
    # place that column's data into `stub_tbl` and
    # remove it from `data`

    # Place the `groupname` values into `stub_tbl$groupname`
    stub_tbl[["groupname"]] <-
      as.character(data_tbl[[gt_stub_params$groupname_col]])

    # Remove the `groupname` column from `data`
    data_tbl[[gt_stub_params$groupname_col]] <- NULL
  }

  # Stop if input `data` has no columns (after modifying
  # `data` for groups)
  if (ncol(data_tbl) == 0) {
    stop("The `data` must have at least one column that isn't a 'group' column.",
         call. = FALSE)
  }

  data <- dt_data_tbl_set(data = data, data_tbl = data_tbl)
  data <- dt_stub_tbl_set(data = data, stub_tbl = stub_tbl)

  data
}
