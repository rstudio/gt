# cells_stub

resolve_location.cells_stub <- function(loc, data_attr) {

  stub_df <- data_attr[["stub_df"]]

  resolved <- resolve_cells_stub(data = stub_df, object = loc)

  loc$rows <- resolved$rows
  # loc$rows <-
  #   resolve_vars(
  #     var_expr = loc[["rows"]],
  #     var_names = stub_df$rowname,
  #     data_df = stub_df)

  class(loc) <- c("resolved", class(loc))

  loc
}

to_output_location.cells_stub <- function(loc, data_attr) {

  loc <- resolve_location(loc, data_attr)

  rows_df <-
    get_row_reorder_df(
      arrange_groups = data_attr$arrange_groups,
      stub_df = data_attr$stub_df)

  loc$rows <- rows_df$rownum_final[loc$rows]

  class(loc) <- c("output_relative", class(loc))
  loc
}

text_transform_at_location.cells_stub <- function(loc,
                                                  data_attr,
                                                  func = identity) {

  loc <- to_output_location(loc, data_attr)
  stub_df <- data_attr[["stub_df"]]

  # Do one vectorized operation per
  for (row in loc$rows) {

    if (row %in% stub_df$rowname) {
      stub_df[row, "rowname"] <- func(stub_df[row, "rowname"])
    }
  }

  data_attr$stub_df <- stub_df

  data_attr
}
