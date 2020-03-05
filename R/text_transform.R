#' Perform targeted text transformation with a function
#'
#' @inheritParams cols_align
#' @param locations The cell or set of cells to be associated with the text
#'   transformation. Only the [cells_body()], [cells_stub()], and
#'   [cells_column_labels()] helper functions can be used here. We can enclose
#'   several of these calls within a `list()` if we wish to make the
#'   transformation happen at different locations.
#' @param fn The function to use for text transformation.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table;
#' # transform the formatted text in the
#' # `num` and `currency` columns using
#' # a function within `text_transform()`,
#' # where `x` is a formatted vector of
#' # column values
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(num, char, currency) %>%
#'   dplyr::slice(1:4) %>%
#'   gt() %>%
#'   fmt_number(columns = vars(num)) %>%
#'   fmt_currency(columns = vars(currency)) %>%
#'   text_transform(
#'     locations = cells_body(
#'       columns = vars(num)),
#'     fn = function(x) {
#'       paste0(
#'         x, " (",
#'         dplyr::case_when(
#'           x > 20   ~ "large",
#'           x <= 20  ~ "small"),
#'         ")")
#'     }
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_text_transform_1.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-12
#'
#' @export
text_transform <- function(data,
                           locations,
                           fn) {

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

text_transform_at_location.cells_body <- function(loc,
                                                  data,
                                                  fn = identity) {

  body <- dt_body_get(data = data)

  loc <- to_output_location(loc = loc, data = data)

  # Do one vectorized operation per column
  for (col in loc$colnames) {

    if (col %in% colnames(body)) {
      body[[col]][loc$rows] <- fn(body[[col]][loc$rows])
    }
  }

  data <- dt_body_set(data = data, body = body)

  data
}

text_transform_at_location.cells_stub <- function(loc,
                                                  data,
                                                  fn = identity) {

  stub_df <- dt_stub_df_get(data = data)

  loc <- to_output_location(loc = loc, data = data)

  for (row in loc$rows) {

    if (row %in% stub_df$rowname) {
      stub_df[row, "rowname"] <- fn(stub_df[row, "rowname"])
    }
  }

  dt_stub_df_set(data = data, stub_df = stub_df)
}

text_transform_at_location.cells_column_labels <- function(loc,
                                                           data,
                                                           fn = identity) {

  boxh <- dt_boxhead_get(data = data)

  loc <- to_output_location(loc = loc, data = data)

  for (col in loc$columns) {

    if (col %in% boxh$var) {

      column_label_edited <-
        boxh %>%
        dplyr::filter(var == !!col) %>%
        dplyr::pull(column_label) %>%
        .[[1]] %>%
        fn()

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
