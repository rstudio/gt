#' Create a `tbl_gt` object from an existing table
#'
#' @param tbl A table object, which could be of the `tbl_df` class or a data
#'   frame.
#'
#' @export
as_tbl_gt <- function(tbl, add_index_col = FALSE) {

  if (inherits(tbl, "tbl_gt")) {
    return(tbl)
  }

  tbl <- dplyr::as_tibble(tbl)

  # TODO: allow the use of matrix objects
  tbl_gt <-
    colnames(tbl) %>%
    lapply(FUN = function(x) {
      tbl_col <- lapply(tbl[, x][[1]], cell_create) %>%
        tibble::enframe(name = NULL, value = x)
    }) %>%
    dplyr::bind_cols() %>%
    dplyr::as_tibble()

  class(tbl_gt) <- c("tbl_gt", class(tbl_gt))
  tbl_gt
}

# add_row_index_col <- function(tbl_gt) {
#
#   if ("::row" %in% colnames(tbl_gt)) {
#     return(tbl_gt)
#   }
#
#   tbl_gt %>%
#     dplyr::mutate(`::row` = 1:nrow(.)) %>%
#     dplyr::select(`::row`, dplyr::everything())
# }
#
# remove_row_index_col <- function(tbl_gt) {
#
#   if (!("::row" %in% colnames(tbl_gt))) {
#     return(tbl_gt)
#   }
#
#   tbl_gt %>% dplyr::select(-`::row`)
# }



cell_create <- function(val,
                        cell_align = NULL,
                        location = "body",
                        styles = NULL,
                        special_attrs = NULL,
                        footnote_mark_pattern = NULL) {

  if (inherits(val, "numeric") || inherits(val, "integer")) {
    val_type_gt <- "number"
    cell_align <- cell_align %||% "right"
  } else if (inherits(val, "character")) {
    val_type_gt <- "text"
    cell_align <- cell_align %||% "left"
  } else if (inherits(val, "logical")) {
    val_type_gt <- "logical"
    cell_align <- cell_align %||% "center"
  } else if (inherits(val, "list")) {
    val_type_gt <- "list"
    cell_align <- cell_align %||% "center"
  } else {
    val_type_gt <- "text"
    cell_align <- cell_align %||% "left"
  }

  if (is.null(styles)) {
    styles <- list(html = NULL, latex = NULL, default = NULL)
  }

  if (is.null(special_attrs)) {
    special_attrs <- list(html = NULL, latex = NULL, default = NULL)
  }

  if (is.null(footnote_mark_pattern)) {
    pattern <- list(html = NULL, latex = NULL, default = NULL)
  }

  cell <-
    list(
      membership = list(
        row_id = NA_integer_,
        row_group_id = NA_character_, # (chr, n_groups)
        col = NA_character_ # (chr, col + n_spanners)
      ),
      value = list(
        val_class_r = class(val),
        val_type_gt = val_type_gt, # (chr, 1) - normalization of type
        val_initial = val,
        val_format = NA_character_,
        val_final = NA_character_
      ),
      cell_align = cell_align,
      footnotes = list(
        id = NA_integer_,
        indices = NA_integer_,
        pattern = pattern # (context list)
      ),
      location = location,
      styles = styles, # (context list)
      special_attrs = special_attrs # (context list)
    )

  class(cell) <- "gt_cell"
  cell
}

get_values_in_column <- function(tbl_gt,
                                 column,
                                 rows = NULL,
                                 type = c("initial", "format", "final")) {

  type <- match.arg(type)
  value_type <- paste0("val_", type)

  if (is.null(rows)) {
    row_indices <- seq(nrow(tbl_gt))
  } else {
    row_indices <- rows
  }

  tbl_gt[[column]][row_indices] %>% lapply(function(x) x[["value"]][[value_type]])
}

set_values_in_column <- function(tbl_gt,
                                 values,
                                 column,
                                 rows = NULL,
                                 type = c("initial", "format", "final")) {

  type <- match.arg(type)
  value_type <- paste0("val_", type)

  if (is.null(rows)) {
    row_indices <- seq(nrow(tbl_gt))
  } else {
    row_indices <- rows
  }

  for (i in seq_along(row_indices)) {

    tbl_gt[[column]][[row_indices[i]]][["value"]][[value_type]] <-
      values[i] %>% unlist() %>% as.character()
  }

  tbl_gt
}

apply_function_to_val_list <- function(val_list, fn) {

  lapply(val_list, fn)
}


set_style_in_column <- function(tbl_gt,
                                style,
                                column,
                                rows = NULL,
                                context = c("html", "latex"),
                                mode = c("append", "replace")) {


  context <- match.arg(context)
  mode <- match.arg(mode)

  if (context == "html") {
    style <- style[[1]] %>% unlist() %>% paste0(names(.), ": ", .)
  }

  if (is.null(rows)) {
    row_indices <- seq(nrow(tbl_gt))
  } else {
    row_indices <- rows
  }

  for (i in seq(row_indices)) {
    if (mode == "append") {
      tbl_gt[[column]][[row_indices[i]]][["styles"]][[context]] <-
        c(tbl_gt[[column]][[row_indices[i]]][["styles"]][[context]], style)
    } else if (mode == "replace") {
      tbl_gt[[column]][[row_indices[i]]][["styles"]][[context]] <- style
    }
  }

  tbl_gt
}



