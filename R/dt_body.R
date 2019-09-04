.dt_body_key <- "_body"

dt_body_get <- function(data) {

  attr(data, .dt_body_key, exact = TRUE)
}

dt_body_set <- function(data, body) {

  attr(data, .dt_body_key) <- body %>% dplyr::as_tibble()
  data
}

dt_body_init <- function(data) {

  body <- dt_data_get(data = data)

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

  arrange_groups <- attr(data, "arrange_groups", exact = TRUE)
  stub_df <- attr(data, "stub_df", exact = TRUE)

  # Get the reordering df (`rows_df`) for the data rows
  rows_df <-
    get_row_reorder_df(
      arrange_groups = arrange_groups,
      stub_df = stub_df
    )

  # Get the `columns_df` data frame for the data columns
  columns_df <- get_column_reorder_df(data = data)

  rows <- rows_df$rownum_final

  cols <-
    subset(columns_df, !is.na(colnum_final))[
      order(subset(columns_df, !is.na(colnum_final))$colnum_final), ]$column_names

  data <- dt_body_set(data = data, body = body[rows, cols, drop = FALSE])

  data
}
