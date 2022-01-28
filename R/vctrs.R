#' Attach a spec to a vector
#'
#' Use `gt_vctr()` early in your analysis to define the formatting of numbers
#' and other data.
#' The formatting is then picked up automatically by `gt()`.
#'
#' @param x A numeric vector
#' @param spec Created by [gt_spec_number()] and other functions.
#' @import vctrs
#' @export
gt_vctr <- function(x, spec) {
  vctrs::new_vctr(x, gt_spec = spec, class = "gt_vctr")
}

#' @export
obj_print_header.gt_vctr <- function(x, ...) {
  print(attr(x, "gt_spec"))
}
