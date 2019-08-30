# Given a location (i.e. cells_*() function result), evaluate captured quosures
# in the context of `data` and return an object with the `resolved` class added
# to the front of the class list.
resolve_location <- function(loc, data_attr) {
  UseMethod("resolve_location")
}

resolve_location.resolved <- function(loc, data_attr) {
  # The object is already resolved
  loc
}

resolve_location.cells_data <- function(loc, data_attr) {

  data_df <- data_attr[["data_df"]]
  stub_df <- data_attr[["stub_df"]]

  loc$columns <-
    resolve_vars_idx(
      var_expr = !!loc[["columns"]],
      data = data_df
    )

  loc$rows <-
    resolve_data_vals_idx(
      var_expr = !!loc[["rows"]],
      data = data_df,
      vals = stub_df$rowname
    )

  class(loc) <- c("resolved", class(loc))

  loc
}

# Given a location, reassign column/row numbers from data-relative to
# output-relative, and return an object with the `output_relative` class added.
to_output_location <- function(loc, data_attr) {
  UseMethod("to_output_location")
}

to_output_location.default <- function(loc, data_attr) {

  loc <- resolve_location(loc, data_attr)

  class(loc) <- c("output_relative", class(loc))
  loc
}

to_output_location.output_relative <- function(loc, data_attr) {
  # The object is already output-relative
  loc
}

to_output_location.cells_data <- function(loc, data_attr) {

  # TODO: this seems dangerous as determining the order of
  # columns before print time is uncertain and error-prone
  loc <- resolve_location(loc, data_attr)

  columns_df <-
    get_column_reorder_df(
      cols_df = data_attr$cols_df,
      boxh_df = data_attr$boxh_df
    )

  rows_df <-
    get_row_reorder_df(
      arrange_groups = data_attr$arrange_groups,
      stub_df = data_attr$stub_df
    )

  # We shouldn't need to do this, but `output_tbl` doesn't match up exactly to
  # the colnum_final values due to groupnames/rownames
  loc$colnames <- colnames(data_attr[["data_df"]])[loc$columns]
  loc$columns <- columns_df$colnum_final[loc$columns]
  loc$rows <- rows_df$rownum_final[loc$rows]

  class(loc) <- c("output_relative", class(loc))
  loc
}
