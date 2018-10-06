#' Perform targeted text transformation with a function
#' @inheritParams cols_align
#' @param locations the cell or set of cells to be associated with the text
#'   transformation. Supplying any of the \code{cells_*()} helper functions is a
#'   useful way to target the location cells that are associated with the
#'   footnote text. These helper functions are: \code{\link{cells_title}()},
#'   \code{\link{cells_boxhead}()}, \code{\link{cells_group}()},
#'   \code{\link{cells_stub}()}, \code{\link{cells_data}()}, and
#'   \code{\link{cells_summary}()}. Please see the help article
#'   \link{location_cells} for more information on how these helper functions
#'   can be used. Additionally, we can enclose several \code{cells_*()} calls
#'   within a \code{list()} if we wish to link the footnote text to different
#'   types of locations (e.g., cell data values, stub group headings, the table
#'   title, etc.).
#' @param fn the function to use for text transformation.
#' @examples
#' # Add a footnote that is in
#' # reference to a single table cell
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     text_transform(
#'       locations = cells_data(columns = vars(mpg)),
#'       fn = function(x) {
#'         ifelse(x > 20,
#'                paste(x, "(good)"),
#'                paste(x, "(worse)"))
#'       })
#' @export
text_transform <- function(data,
                           locations,
                           fn) {

  # Resolve into a list of locations
  locations <- as_locations(locations)

  # Resolve the locations of the targeted data cells and append
  # the footnotes
  for (loc in locations) {
    data <- set_transform(loc, data, fn)
  }

  data
}

set_transform <- function(loc, data, fn) {

  resolved <- resolve_location(loc, data_attr = attributes(data))

  attr(data, "transforms") <-
    c(
      attr(data, "transforms", exact = TRUE),
      list(
        list(
          resolved = resolved,
          fn = fn
        )
      )
    )

  data
}

# Given a location, gt attr object, and mapping function (one chr vector as
# input, chr vector of same length as output), replace the contents in the
# specified location with fn(contents). The `fn` may be invoked several times,
# as the location may not be naturally vectorizable as a single call. The return
# value is the transformed data_attr.
text_transform_at_location <- function(loc, data_attr, fn = identity) {
  UseMethod("text_transform_at_location")
}
