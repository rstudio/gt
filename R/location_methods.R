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

to_output_location.default <- function(loc, data_attr) {

  loc <- resolve_location(loc, data_attr)

  class(loc) <- c("output_relative", class(loc))
  loc
}

to_output_location.output_relative <- function(loc, data_attr) {
  # The object is already output-relative
  loc
}
