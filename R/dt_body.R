.dt_body_key <- "_body"

dt_body_get <- function(data) {

  ret <- dt__get(data, .dt_body_key)

  if (is.null(ret)) {
    stop("Must call `dt_body_build_init()` first.")
  }

  ret
}

dt_body_set <- function(data, body) {

  dt__set(data, .dt_body_key, body %>% dplyr::as_tibble())
}

dt_body_build_init <- function(data) {

  body <- dt_data_get(data = data)[, dt_boxhead_get_vars(data = data)]

  if (NROW(body) > 0) {
    body[] <- NA_character_
  }

  body %>%
    dt_body_set(body = ., data = data)
}

# Function to reassemble the rows and columns of the `body`
# in a revised order
dt_body_reassemble <- function(data) {

  body <- dt_body_get(data = data)
  stub_df <- dt_stub_df_get(data = data)

  groups <- dt_stub_groups_get(data = data)

  # Get the reordering df (`rows_df`) for the data rows
  rows_df <-
    get_row_reorder_df(
      groups = groups,
      stub_df = stub_df
    )

  # Get the `columns_df` data frame for the data columns
  #columns_df <- get_column_reorder_df(data = data)

  rows <- rows_df$rownum_final

  cols <- dt_boxhead_get_vars(data = data)

  data <- dt_body_set(data = data, body = body[rows, cols, drop = FALSE])

  data
}

dt_body_combine_stub <- function(data) {

  body <- dt_body_get(data = data)
  stub_df <- dt_stub_df_get(data = data)
  stub_components <- dt_stub_components(data = data)

  if (dt_stub_components_has_rowname(stub_components)) {

    body <-
      body %>%
      dplyr::mutate(rowname = stub_df$rowname)
  }

  data <- dt_body_set(data = data, body = body)

  data
}

dt_body_build <- function(data) {

  data %>%
  dt_body_build_init()
}
