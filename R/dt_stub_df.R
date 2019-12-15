.dt_stub_df_key <- "_stub_df"

dt_stub_df_get <- function(data) {

  dt__get(data, .dt_stub_df_key)
}

dt_stub_df_set <- function(data, stub_df) {

  dt__set(data, .dt_stub_df_key, stub_df)
}

dt_stub_df_init <- function(data,
                            data_df,
                            rowname_col,
                            groupname_col,
                            rownames_to_stub,
                            row_group.sep) {

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

    row_group_columns <- dplyr::group_vars(data_df)
    row_group_columns <- base::intersect(row_group_columns, colnames(data_df))

    row_group_labels <-
      apply(
        data_df[, row_group_columns],
        MARGIN = 1,
        paste, collapse = row_group.sep
      )

    # Place the `group_labels` values into `stub_df$groupname`
    stub_df[["groupname"]] <- row_group_labels

    vars_to_hide <- c(vars_to_hide, row_group_columns)

  } else if (groupname_col %in% colnames(data_df)) {

    # If `groupname` is a column available in `data`,
    # place that column's data into `stub_df`

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
    dt_stub_df_set(stub_df = stub_df)

  if (length(vars_to_hide) > 0) {
    data <-
      data %>%
      cols_hide(columns = vars_to_hide)
  }

  data
}

dt_stub_df_exists <- function(data) {

  stub_df <- dt_stub_df_get(data = data)

  available <- !all(is.na((stub_df)[["rowname"]]))

  available
}

# Function to obtain a reordered version of `stub_df`
reorder_stub_df <- function(data) {

  stub_df <- dt_stub_df_get(data = data)

  row_groups <- dt_row_groups_get(data = data)

  rows_df <-
    get_row_reorder_df(
      groups = row_groups,
      stub_df = stub_df
    )

  stub_df <- stub_df[rows_df$rownum_final, ]

  stub_df %>% dt_stub_df_set(data = data)
}

dt_stub_groupname_has_na <- function(data) {

  stub_df <- dt_stub_df_get(data = data)

  any(is.na(stub_df$groupname))
}

dt_stub_components <- function(data) {

  stub_df <- dt_stub_df_get(data = data)

  stub_components <- c()

  if (any(!is.na(stub_df[["rowname"]]))) {
    stub_components <- c(stub_components, "rowname")
  }

  if (any(!is.na(stub_df[["groupname"]]))) {
    stub_components <- c(stub_components, "groupname")
  }

  stub_components
}

# Function that checks `stub_components` and determines whether just the
# `rowname` part is available; TRUE indicates that we are working with a table
# with rownames
dt_stub_components_is_rowname <- function(stub_components) {

  identical(stub_components, "rowname")
}

# Function that checks `stub_components` and determines whether just the
# `groupname` part is available; TRUE indicates that we are working with a table
# with groups but it doesn't have rownames
dt_stub_components_is_groupname <- function(stub_components) {

  identical(stub_components, "groupname")
}

# Function that checks `stub_components` and determines whether the
# `rowname` and `groupname` parts are available; TRUE indicates that we are
# working with a table with rownames and groups
dt_stub_components_is_rowname_groupname <- function(stub_components) {

  identical(stub_components, c("rowname", "groupname"))
}

dt_stub_components_has_rowname <- function(stub_components) {

  isTRUE("rowname" %in% stub_components)
}

dt_stub_rowname_at_position <- function(data, i) {

  stub_components <- dt_stub_components(data = data)

  if (!(dt_stub_components_has_rowname(stub_components = stub_components))) {
    return(NULL)
  }

  stub_df <- dt_stub_df_get(data = data)

  stub_df$rowname[[i]]
}
