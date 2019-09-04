# Given a location (i.e. cells_*() function result), evaluate captured quosures
# in the context of `data` and return an object with the `resolved` class added
# to the front of the class list.
resolve_location <- function(loc, data) {
  UseMethod("resolve_location")
}

resolve_location.resolved <- function(loc, data) {
  # The object is already resolved
  loc
}

resolve_location.cells_data <- function(loc, data) {

  data_tbl <- dt_data_get(data = data)
  stub_df <- attr(data, "stub_df", exact = TRUE)

  loc$columns <-
    resolve_vars_idx(
      var_expr = !!loc[["columns"]],
      data = data_tbl
    )

  loc$rows <-
    resolve_data_vals_idx(
      var_expr = !!loc[["rows"]],
      data = data_tbl,
      vals = stub_df$rowname
    )

  class(loc) <- c("resolved", class(loc))
  loc
}

resolve_location.cells_column_labels <- function(loc, data) {

  data_tbl <- dt_data_get(data = data)

  if (!is.null(loc$columns)) {

    loc$colnames <-
      resolve_vars(
        var_expr = !!loc$columns,
        data = data_tbl
      )
  }

  # TODO: for now, when groups is set to TRUE, the
  # behavior is not to select all groups; this
  # should be changed to select all group

  # TODO: implement a stop() if groups provided not
  # in the available set of groups
  class(loc) <- c("resolved", class(loc))

  loc
}

resolve_location.cells_stub <- function(loc, data) {

  stub_df <- attr(data, "stub_df", exact = TRUE)

  resolved <- resolve_cells_stub(data = stub_df, object = loc)

  loc$rows <- resolved$rows

  class(loc) <- c("resolved", class(loc))

  loc
}

# Given a location, reassign column/row numbers from data-relative to
# output-relative, and return an object with the `output_relative` class added.
to_output_location <- function(loc, data) {
  UseMethod("to_output_location")
}

to_output_location.default <- function(loc, data) {

  loc <- resolve_location(loc = loc, data = data)

  class(loc) <- c("output_relative", class(loc))
  loc
}

to_output_location.output_relative <- function(loc, data) {
  # The object is already output-relative
  loc
}

to_output_location.cells_data <- function(loc, data) {

  data_tbl <- dt_data_get(data = data)
  boxh <- dt_boxhead_get(data = data)

  cols_df <- attr(data, "cols_df", exact = TRUE)
  arrange_groups <- attr(data, "arrange_groups", exact = TRUE)
  stub_df <- attr(data, "stub_df", exact = TRUE)

  loc <- resolve_location(loc = loc, data = data)

  columns_df <- get_column_reorder_df(data = data)

  rows_df <-
    get_row_reorder_df(
      arrange_groups = arrange_groups,
      stub_df = stub_df
    )

  # We shouldn't need to do this, but `output_tbl` doesn't match up exactly to
  # the colnum_final values due to groupnames/rownames
  loc$colnames <- colnames(data_tbl)[loc$columns]
  loc$columns <- columns_df$colnum_final[loc$columns]
  loc$rows <- rows_df$rownum_final[loc$rows]

  class(loc) <- c("output_relative", class(loc))
  loc
}

to_output_location.cells_stub <- function(loc, data) {

  stub_df <- attr(data, "stub_df", exact = TRUE)
  arrange_groups <- attr(data, "arrange_groups", exact = TRUE)

  loc <- resolve_location(loc = loc, data = data)

  rows_df <-
    get_row_reorder_df(
      arrange_groups = arrange_groups,
      stub_df = stub_df
    )

  loc$rows <- rows_df$rownum_final[loc$rows]

  class(loc) <- c("output_relative", class(loc))
  loc
}
