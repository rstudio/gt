.dt_stub_key <- "_stub"

dt_stub_get <- function(data) {

  attr(data, .dt_stub_key, exact = TRUE)
}

dt_stub_set <- function(data, stub) {

  attr(data, .dt_stub_key) <- stub
  data
}

dt_stub_init <- function(data,
                         data_df,
                         rowname_col,
                         groupname_col,
                         rownames_to_stub,
                         stub_group.sep) {
  vars_to_hide <- c()

  # If the option to place rownames in the stub
  # is taken, then the `stub_df` data frame will
  # be pre-populated with rownames in the `rowname`
  # column; otherwise, this will be an empty df
  if (isTRUE(rownames_to_stub)) {

    data_rownames <- rownames(data_df)

    stub_df <-
      dplyr::tibble(
        rownum_i = seq_len(nrow(data_df)),
        groupname = NA_character_,
        rowname = data_rownames,
      )

  } else {

    stub_df <-
      dplyr::tibble(
        rownum_i = seq_len(nrow(data_df)),
        groupname = rep(NA_character_, nrow(data_df)),
        rowname = rep(NA_character_, nrow(data_df))
      )
  }

  # If `rowname` is a column available in `data`,
  # place that column's data into `stub_df` and
  # remove it from `data`
  if (rowname_col %in% colnames(data_df)) {

    # Place the `rowname` values into `stub_df$rowname`
    stub_df[["rowname"]] <- as.character(data_df[[rowname_col]])

    vars_to_hide <- c(vars_to_hide, rowname_col)
  }

  # If `data` is a `grouped_df` then create groups from the
  # group columns; note that this will overwrite any values
  # already in `stub_df$groupname`
  if (inherits(data_df, "grouped_df")) {

    group_cols <- dplyr::group_vars(data_df)
    group_cols <- base::intersect(group_cols, colnames(data_df))

    group_labels <-
      apply(
        data_df[, group_cols],
        MARGIN = 1,
        paste, collapse = stub_group.sep
      )

    # Place the `group_labels` values into `stub_df$groupname`
    stub_df[["groupname"]] <- group_labels

    vars_to_hide <- c(vars_to_hide, group_cols)

  } else if (groupname_col %in% colnames(data_df)) {

    # If `groupname` is a column available in `data`,
    # place that column's data into `stub_df` and
    # remove it from `data`

    # Place the `groupname` values into `stub_df$groupname`
    stub_df[["groupname"]] <- as.character(data_df[[groupname_col]])

    vars_to_hide <- c(vars_to_hide, groupname_col)
  }

  # Stop if input `data` has no columns (after modifying
  # `data` for groups)
  if (ncol(data_df) == 0) {
    stop("The `data` must have at least one column that isn't a 'group' column.",
         call. = FALSE)
  }

  data <-
    data %>%
    dt_stub_set(stub = stub_df)

  if (length(vars_to_hide) > 0) {
    data <-
      data %>%
      cols_hide(columns = vars_to_hide)
  }

  data
}

# Function to obtain a reordered version of `stub_df`
reorder_stub_df <- function(data) {

  arrange_groups <- attr(data, "arrange_groups", exact = TRUE)
  stub_df <- dt_stub_get(data = data)

  rows_df <-
    get_row_reorder_df(
      arrange_groups = arrange_groups,
      stub_df = stub_df
    )

  stub_df <- stub_df[rows_df$rownum_final, ]

  data <- dt_stub_set(data = data, stub = stub_df)

  data
}

dt_stub_groupname_has_na <- function(data) {

  stub_df <- dt_stub_get(data = data)

  any(is.na(stub_df$groupname))
}

