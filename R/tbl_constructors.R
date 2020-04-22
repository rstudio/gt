#' Build on a `tbl_gt` by combining with another table
#'
#' @export
add_tbl <- function(x,
                    y,
                    below = NULL,
                    above = NULL,
                    by = NULL,
                    right_of = NULL,
                    left_of = NULL,
                    mode = c("insert", "replace")) {

  mode <- match.arg(mode)

  # Normalize the `x` and `y` tables
  x <- normalize_to_tbl_gt_minimal(tbl = x)
  y <- normalize_to_tbl_gt_minimal(tbl = y)

  if (!is.null(below) && !is.null(above)) {
    stop("Only one option (either `below` or `above`) should be used.", call. = FALSE)
  }

  if (!is.null(right_of) && !is.null(left_of)) {
    stop("Only one option (either `right_of` or `left_of`) should be used.", call. = FALSE)
  }

  # Normalize the `by` directive
  colnames_x <- colnames(x)
  colnames_y <- colnames(y)

  # Create a named `by` vector using column-name matching
  x_in_y <- which(colnames_x %in% colnames_y)
  not_x_in_y <- which(!(colnames_x %in% colnames_y))

  by_implicit <- setNames(nm = colnames_x[x_in_y], object = colnames_x[x_in_y])

  if (length(not_x_in_y) > 0) {
    by_implicit <- c(by_implicit, setNames(nm = colnames_x[not_x_in_y], object = NA_character_))
  }

  if (is.null(by)) {
    by <- by_implicit
  }

  if (is.null(below) && is.null(above) && is.null(right_of) && is.null(left_of)) {

    if (mode == "insert") {
      below <- TRUE
    } else if (mode == "replace") {
      above <- TRUE
    }
  }

  browser()

}

#' @export
insert_col <- function(tbl_gt,
                       col_name,
                       values = NULL,
                       direction = c("left", "right")) {

  direction <- match.arg(direction)

  tbl_rows <- nrow(tbl)

  if (is.null(values)) {
    values <- rep(NA_real_, tbl_rows)
  }

  if (direction == "right") {

    tbl_gt <-
      tbl_gt %>%
      dplyr::bind_cols(
        tibble({{ col_name }} := values) %>%
          as_tbl_gt(add_index_col = FALSE)
      ) %>%
      dplyr::as_tibble()

  } else if (direction == "left") {

    tbl_gt <-
      dplyr::bind_cols(
        tibble({{ col_name }} := values) %>%
          as_tbl_gt(add_index_col = FALSE),
        tbl_gt %>% remove_row_index_col()
      ) %>%
      dplyr::as_tibble()
  }

  class(tbl_gt) <- c("tbl_gt", class(tbl_gt))
  tbl_gt
}
#' @export
insert_col_left <- function(tbl_gt, col_name, values = NULL) {
  insert_col(tbl_gt = tbl_gt, col_name = {{ col_name }}, values = values, direction = "left")
}
#' @export
insert_col_right <- function(tbl_gt, col_name, values = NULL) {
  insert_col(tbl_gt = tbl_gt, col_name = {{ col_name }}, values = values, direction = "right")
}

#' @export
insert_row <- function(tbl_gt,
                       values = NULL,
                       direction = c("above", "below")) {

  direction <- match.arg(direction)

  tbl_gt <- tbl_gt %>% remove_row_index_col()
  tbl_cols <- ncol(tbl)

  if (is.null(values)) {
    values <- rep(NA_real_, tbl_cols)
  }

  new_row <- tbl_gt[1, ]

  for (i in seq(tbl_cols)) {
    new_row[[1, i]] <- list(cell_create(val = values[i]))
  }

  if (direction == "below") {
    tbl_gt <- rbind(tbl_gt, new_row)
  } else if (direction == "above") {
    tbl_gt <- rbind(new_row, tbl_gt)
  }

  tbl_gt
}
#' @export
insert_row_top <- function(tbl_gt, values = NULL) {
  insert_row(tbl_gt = tbl_gt, values = values, direction = "above")
}

#' @export
insert_row_bottom <- function(tbl_gt, values = NULL) {
  insert_row(tbl_gt = tbl_gt, values = values, direction = "below")
}


normalize_to_tbl_gt <- function(tbl) {

  if (inherits(x, "data.frame")) {
    tbl <- tbl %>% dplyr::as_tibble() %>% as_tbl_gt()
  }

  tbl
}
