#' @export
gt_multi <- function(
    data = NULL,
    index = NULL,
    options = NULL
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
      column_names = list(),
      n_columns_total = NA_integer_,
      n_columns_data = NA_integer_,
      n_columns_stub = NA_integer_,
      n_rows_data = NA_integer_,
      n_summary_rows_total = NA_integer_,
      n_summary_rows_group = NA_integer_,
      n_summary_rows_grand = NA_integer_,
      n_groups_summary_rows_total = NA_integer_,
      n_groups_summary_rows_group = NA_integer_,
      n_groups_summary_rows_grand = NA_integer_,
      n_groups = NA_integer_,
      active = NA
    )[0, ]
}

generate_gt_tbl_tbl_i <- function(i, gt_tbl, active = TRUE) {

  gt_tbl_info_list <- generate_gt_tbl_info_list(gt_tbl = gt_tbl)

  dplyr::tibble(
    i = i,
    gt_tbl = list(gt_tbl),
    column_names = list(gt_tbl_info_list$column_names),
    n_columns_total = gt_tbl_info_list$n_columns_total,
    n_columns_data = gt_tbl_info_list$n_columns_data,
    n_columns_stub = gt_tbl_info_list$n_columns_stub,
    n_rows_data = gt_tbl_info_list$n_rows_data,
    n_summary_rows_total = gt_tbl_info_list$n_summary_rows_total,
    n_summary_rows_group = gt_tbl_info_list$n_summary_rows_group,
    n_summary_rows_grand = gt_tbl_info_list$n_summary_rows_grand,
    n_groups_summary_rows_total = gt_tbl_info_list$n_groups_summary_rows_total,
    n_groups_summary_rows_group = gt_tbl_info_list$n_groups_summary_rows_group,
    n_groups_summary_rows_grand = gt_tbl_info_list$n_groups_summary_rows_grand,
    n_groups = gt_tbl_info_list$n_groups,
    active = active
  )
}

generate_gt_tbl_info_list <- function(gt_tbl) {

  gt_tbl_built <- build_data(data = gt_tbl, context = "html")

  column_names <- dt_boxhead_get_vars_default(data = gt_tbl_built)

  # Get various column number counts
  n_columns_total <- get_effective_number_of_columns(data = gt_tbl_built)
  n_columns_data <- get_number_of_visible_data_columns(data = gt_tbl_built)
  n_columns_stub <- n_columns_total - n_columns_data

  # Get various row number counts
  n_rows_data <- nrow(gt_tbl_built[["_stub_df"]])

  if (dt_summary_exists(data = gt_tbl_built)) {

    summary_list <- gt_tbl_built[["_summary_build"]][["summary_df_display_list"]]

    n_groups_summary_rows_total <- length(summary_list)

    n_summary_rows_total <-
      sum(
        vapply(
          summary_list,
          FUN.VALUE = integer(1),
          FUN = function(x) nrow(x))
      )

    if (!is.null(summary_list[["::GRAND_SUMMARY"]])) {
      n_summary_rows_grand <- nrow(summary_list[["::GRAND_SUMMARY"]])
      n_groups_summary_rows_grand <- 1L
    } else {
      n_summary_rows_grand <- 0L
      n_groups_summary_rows_grand <- 0L
    }

    n_summary_rows_group <- n_summary_rows_total - n_summary_rows_grand
    n_groups_summary_rows_group <-
      n_groups_summary_rows_total - n_groups_summary_rows_grand

  } else {
    n_summary_rows_total <- 0L
    n_summary_rows_group <- 0L
    n_summary_rows_grand <- 0L
    n_groups_summary_rows_total <- 0L
    n_groups_summary_rows_group <- 0L
    n_groups_summary_rows_grand <- 0L
  }

  # TODO: Get total count of groups
  n_groups <- 0L

  list(
    column_names = column_names,
    n_columns_total = n_columns_total,
    n_columns_data = n_columns_data,
    n_columns_stub = n_columns_stub,
    n_rows_data = n_rows_data,
    n_summary_rows_total = n_summary_rows_total,
    n_summary_rows_group = n_summary_rows_group,
    n_summary_rows_grand = n_summary_rows_grand,
    n_groups_summary_rows_total = n_groups_summary_rows_total,
    n_groups_summary_rows_group = n_groups_summary_rows_group,
    n_groups_summary_rows_grand = n_groups_summary_rows_grand,
    n_groups = n_groups
  )
}
