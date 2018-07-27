#' Modify the ordering of the stub block groups
#' @param data a table object that is created using the \code{gt()} function.
#' @param groups a vector of stub block group heading names.
#' @return an object of class \code{gt_tbl}.
#' @export
blocks_arrange <- function(data,
                           groups) {

  # Create and store a list of stub block
  # groups in the intended ordering
  attr(data, "arrange_groups") <- list(groups = groups)

  data
}
