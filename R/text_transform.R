#' @export
text_transform <- function(data,
                           locations,
                           func) {

  # Resolve into a list of locations
  locations <- as_locations(locations)

  # Resolve the locations of the targeted data cells and append
  # the footnotes
  for (loc in locations) {
    data <- set_transform(loc, data, func)
  }

  data
}

set_transform <- function(loc, data, func) {

  resolved <- resolve_location(loc, data_attr = attributes(data))

  attr(data, "transforms") <-
    c(
      attr(data, "transforms", exact = TRUE),
      list(
        list(
          resolved = resolved,
          func = func
        )
      )
    )

  data
}

# Given a location, gt attr object, and mapping function (one chr vector as
# input, chr vector of same length as output), replace the contents in the
# specified location with func(contents). func may be invoked several times, as
# the location may not be naturally vectorizable as a single call. The return
# value is the transformed data_attr.
text_transform_at_location <- function(loc, data_attr, func = identity) {
  UseMethod("text_transform_at_location")
}
