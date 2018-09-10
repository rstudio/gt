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

# Given a location, reassign column/row numbers from data-relative to
# output-relative, and return an object with the `output_relative` class added.
to_output_location <- function(loc, data_attr) {
  UseMethod("to_output_location")
}

to_output_location.output_relative <- function(loc, data_attr) {
  # The object is already output-relative
  loc
}

# Given a location, gt attr object, and mapping function (one chr vector as
# input, chr vector of same length as output), replace the contents in the
# specified location with func(contents). func may be invoked several times, as
# the location may not be naturally vectorizable as a single call. The return
# value is the transformed data_attr.
replace_output_at_location <- function(loc, data_attr, func = identity) {
  UseMethod("replace_output_at_location")
}


resolve_location.cells_data <- function(loc, data_attr) {

  data_df <- data_attr[["data_df"]]

  loc$columns <-
    resolve_vars(
      var_expr = loc[["columns"]],
      var_names = colnames(data_df),
      data_df =  data_df)

  loc$rows <-
    resolve_vars(
      var_expr = loc[["rows"]],
      var_names = rownames(data_df),
      data_df = data_df)

  class(loc) <- c("resolved", class(loc))

  loc
}

to_output_location.cells_data <- function(loc, data_attr) {

  loc <- resolve_location(loc, data_attr)
  columns_df <- get_column_reorder_df(data_attr)
  rows_df <- get_row_reorder_df(data_attr)

  # We shouldn't need to do this, but output_df doesn't match up exactly to
  # the colnum_final values due to groupnames/rownames
  loc$colnames <- colnames(data_attr[["data_df"]])[loc$columns]
  loc$columns <- columns_df$colnum_final[loc$columns]
  loc$rows <- rows_df$rownum_final[loc$rows]

  class(loc) <- c("output_relative", class(loc))
  loc
}

replace_output_at_location.cells_data <- function(loc,
                                                  data_attr,
                                                  func = identity) {

  loc <- to_output_location(loc, data_attr)
  output_df <- data_attr[["output_df"]]

  # Do one vectorized operation per column
  for (col in loc$colnames) {

    if (col %in% colnames(output_df)) {
      output_df[[col]][loc$rows] <- func(output_df[[col]][loc$rows])
    }
  }

  data_attr$output_df <- output_df

  data_attr
}
