#' @export
gt_multi <- function(
    data = NULL,
    index = NULL
) {

  # Initialize the `gt_multi` object
  gt_multi <- list()

  # Create an empty
  gt_tbl_tbl <- generate_gt_tbl_tbl_0()

  if (is.null(data)) {

    gt_multi$gt_tbl <- gt_tbl_tbl

    # Apply the `gt_multi` class to the object and return
    class(gt_multi) <- "gt_multi"
    return(gt_multi)
  }

  #
  # Check and normalize incoming data
  #

  if (rlang::is_bare_list(data)) {

    # TODO: Perform gt object validation for each of the list components
    # stop_if_not_gt(data = gt_tbl)
    gt_tbl_list <- data

  } else if (is_gt(data)) {

    # With a single `gt_tbl` object, we want to enclose that in a
    # bare list
    gt_tbl_list <- list(data)

  } else {

    # TODO: stop function here if we don't get a bare list with gt
    # tables or a single gt table object
  }

  #
  # Add gt tables to the `gt_tbl_tbl` object
  #

  for (i in seq_len(length(gt_tbl_list))) {

    gt_tbl_tbl_i <- generate_gt_tbl_tbl_i(i = i, gt_tbl = gt_tbl_list[[i]])
    gt_tbl_tbl <- dplyr::bind_rows(gt_tbl_tbl, gt_tbl_tbl_i)
  }

  gt_multi$gt_tbl <- gt_tbl_tbl

  # Apply the `gt_multi` class to the object and return
  class(gt_multi) <- "gt_multi"
  gt_multi
}

generate_gt_tbl_tbl_0 <- function() {

    dplyr::tibble(
      i = NA_integer_,
      gt_tbl = list(),
      rows = NA_integer_,
      columns = NA_integer_,
      summary_rows = NA_integer_,
      grand_summary_rows = NA_integer_,
      groups = NA_integer_,
      active = NA
    )[0, ]
}

generate_gt_tbl_tbl_i <- function(i, gt_tbl, active = TRUE) {

  # gt_tbl_built <- build_data(data = gt_tbl, context = "html")

  # TODO: get metadata for counts of rows, columns, summary rows, etc.

  dplyr::tibble(
    i = i,
    gt_tbl = list(gt_tbl),
    rows = NA_integer_,
    columns = NA_integer_,
    summary_rows = NA_integer_,
    grand_summary_rows = NA_integer_,
    groups = NA_integer_,
    active = active
  )
}
