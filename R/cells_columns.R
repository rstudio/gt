# cells_column_labels

resolve_location.cells_column_labels <- function(loc, data_attr) {

  data_df <- data_attr[["data_df"]]

  if (!is.null(loc$columns)) {

    colnums <-
      resolve_vars(
        var_expr = loc[["columns"]],
        var_names = colnames(data_df),
        data_df = data_df)

    loc$colnames <- colnames(data_df)[colnums]
  }

  # TODO: for now, when groups is set to TRUE, the
  # behavior is not to select all groups; this
  # should be changed to select all group

  # TODO: implement a stop() if groups provided not
  # in the available set of groups
  class(loc) <- c("resolved", class(loc))

  loc
}

text_transform_at_location.cells_column_labels <- function(loc,
                                                           data_attr,
                                                           func = identity) {

  loc <- to_output_location(loc, data_attr)
  boxh_df <- data_attr[["boxh_df"]]

  for (colname in loc$colnames) {

    if (colname %in% colnames(boxh_df)) {
      boxh_df["column_label", colname] <- func(boxh_df["column_label", colname])
    }
  }

  data_attr$boxh_df <- boxh_df

  data_attr
}
