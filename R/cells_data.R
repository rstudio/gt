# cells_data

resolve_location.cells_data <- function(loc, data_attr) {

  data_df <- data_attr[["data_df"]]
  stub_df <- data_attr[["stub_df"]]

  loc$columns <-
    resolve_vars(
      var_expr = loc[["columns"]],
      var_names = colnames(data_df),
      data_df =  data_df)

  loc$rows <-
    resolve_vars(
      var_expr = loc[["rows"]],
      var_names = stub_df$rowname,
      data_df = data_df)

  class(loc) <- c("resolved", class(loc))

  loc
}

to_output_location.cells_data <- function(loc, data_attr) {

  loc <- resolve_location(loc, data_attr)

  columns_df <-
    get_column_reorder_df(
      cols_df = data_attr$cols_df,
      boxh_df = data_attr$boxh_df)

  rows_df <-
    get_row_reorder_df(
      arrange_groups = data_attr$arrange_groups,
      stub_df = data_attr$stub_df)

  # We shouldn't need to do this, but output_df doesn't match up exactly to
  # the colnum_final values due to groupnames/rownames
  loc$colnames <- colnames(data_attr[["data_df"]])[loc$columns]
  loc$columns <- columns_df$colnum_final[loc$columns]
  loc$rows <- rows_df$rownum_final[loc$rows]

  class(loc) <- c("output_relative", class(loc))
  loc
}

text_transform_at_location.cells_data <- function(loc,
                                                  data_attr,
                                                  fn = identity) {

  loc <- to_output_location(loc, data_attr)
  output_df <- data_attr[["output_df"]]

  # Do one vectorized operation per column
  for (col in loc$colnames) {

    if (col %in% colnames(output_df)) {
      output_df[[col]][loc$rows] <- fn(output_df[[col]][loc$rows])
    }
  }

  data_attr$output_df <- output_df

  data_attr
}
