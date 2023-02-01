#' Perform targeted text transformation with a function
#'
#' @inheritParams cols_align
#' @param locations The cell or set of cells to be associated with the text
#'   transformation. Only the [cells_body()], [cells_stub()],
#'   [cells_column_labels()], and [cells_row_groups()] helper functions can be
#'   used here. We can enclose several of these calls within a `list()` if we
#'   wish to make the transformation happen at different locations.
#' @param fn The function to use for text transformation.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table. Transform the formatted text in the
#' `num` column using a function supplied to `text_transform()` (via the `fn`
#' argument). Note that the `x` in the `fn = function (x)` part is an already
#' formatted vector of column values from the `num` column.
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, char, currency) |>
#'   dplyr::slice(1:4) |>
#'   gt() |>
#'   fmt_number(columns = num) |>
#'   fmt_currency(columns = currency) |>
#'   text_transform(
#'     locations = cells_body(columns = num),
#'     fn = function(x) {
#'       paste0(
#'         x, " (",
#'         dplyr::case_when(
#'           x > 20   ~ "large",
#'           x <= 20  ~ "small"),
#'         ")")
#'     }
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_text_transform_1.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-26
#'
#' @export
text_transform <- function(
    data,
    locations,
    fn
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Resolve into a list of locations
  locations <- as_locations(locations = locations)

  # Resolve the locations of the targeted data cells and append
  # the footnotes
  for (loc in locations) {
    data <- dt_transforms_add(data = data, loc = loc, fn = fn)
  }

  data
}

# Given a location, gt attr object, and mapping function (one chr vector as
# input, chr vector of same length as output), replace the contents in the
# specified location with fn(contents). The `fn` may be invoked several times,
# as the location may not be naturally vectorizable as a single call. The return
# value is the transformed `data`
text_transform_at_location <- function(loc, data, fn = identity) {
  UseMethod("text_transform_at_location")
}

text_transform_at_location.cells_body <- function(
    loc,
    data,
    fn = identity
) {

  body <- dt_body_get(data = data)

  loc <- to_output_location(loc = loc, data = data)

  stub_df <- dt_stub_df_get(data = data)

  # Do one vectorized operation per column
  for (col in loc$colnames) {

    if (col %in% colnames(body)) {

      body[[col]][stub_df$rownum_i %in% loc$rows] <-
        fn(body[[col]][stub_df$rownum_i %in% loc$rows])
    }
  }

  dt_body_set(data = data, body = body)
}

text_transform_at_location.cells_stub <- function(
    loc,
    data,
    fn = identity
) {

  body <- dt_body_get(data = data)

  loc <- to_output_location(loc = loc, data = data)

  stub_df <- dt_stub_df_get(data = data)

  stub_var <- dt_boxhead_get_var_stub(data = data)

  # FIXME: Check for zero-length stub_var before continuing.
  body[[stub_var]][stub_df$rownum_i %in% loc$rows] <-
    fn(body[[stub_var]][stub_df$rownum_i %in% loc$rows])

  dt_body_set(data = data, body = body)
}

text_transform_at_location.cells_column_labels <- function(
    loc,
    data,
    fn = identity
) {

  boxh <- dt_boxhead_get(data = data)

  loc <- to_output_location(loc = loc, data = data)

  for (col in loc$colnames) {

    if (col %in% boxh$var) {

      column_label_edited <-
        fn(dplyr::filter(boxh, var == .env$col)[1, "column_label", drop = TRUE])

      data <-
        dt_boxhead_edit(
          data = data,
          var = col,
          column_label = list(column_label_edited)
        )
    }
  }

  data
}

text_transform_at_location.cells_row_groups <- function(
    loc,
    data,
    fn = identity
) {

  row_group_vec <- dt_row_groups_get(data = data)

  loc <- to_output_location(loc = loc, data = data)

  for (group in loc$groups) {

    stub_df <- dt_stub_df_get(data = data)

    if (group %in% row_group_vec) {

      if (is.na(group)) next

      stub_df[!is.na(stub_df$group_id) & stub_df$group_id == group, ][["group_label"]] <-
        as.list(fn(stub_df[!is.na(stub_df$group_id) & stub_df$group_id == group, ][["group_label"]]))

      data <- dt_stub_df_set(data = data, stub_df = stub_df)
    }
  }

  data
}
