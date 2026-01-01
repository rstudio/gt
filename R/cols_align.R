#------------------------------------------------------------------------------#
#
#                /$$
#               | $$
#     /$$$$$$  /$$$$$$
#    /$$__  $$|_  $$_/
#   | $$  \ $$  | $$
#   | $$  | $$  | $$ /$$
#   |  $$$$$$$  |  $$$$/
#    \____  $$   \___/
#    /$$  \ $$
#   |  $$$$$$/
#    \______/
#
#  This file is part of the 'rstudio/gt' project.
#
#  Copyright (c) 2018-2026 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


# cols_align() -----------------------------------------------------------------
#' Set the alignment of columns
#'
#' @description
#'
#' The individual alignments of columns (which includes the column labels and
#' all of their data cells) can be modified. We have the option to align text to
#' the `left`, the `center`, and the `right`. In a less explicit manner, we can
#' allow **gt** to automatically choose the alignment of each column based on
#' the data type (with the `auto` option).
#'
#' @param data *The gt table or gt group data object*
#'
#'   `obj:<gt_tbl>` // **required**
#'
#'   This is the **gt** table object that is commonly created through use of the
#'   [gt()] function.
#'
#'   OR
#'
#'   `obj:<gt_group>` // **required**
#'
#'   This is the **gt** group object that is commonly created through use of the
#'   [gt_group()] function.
#'
#' @param align *Alignment type*
#'
#'   `singl-kw:[auto|left|center|right]` // *default:* `"auto"`
#'
#'   This can be any of `"center"`, `"left"`, or `"right"` for center-, left-,
#'   or right-alignment. Alternatively, the `"auto"` option (the default), will
#'   automatically align values in columns according to the data type (see the
#'   Details section for specifics on which alignments are applied).
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns for which the alignment should be applied. Can either be a
#'   series of column names provided in `c()`, a vector of column indices, or a
#'   select helper function (e.g. [starts_with()], [ends_with()], [contains()],
#'   [matches()], [num_range()], and [everything()]). By default this is set to
#'   [everything()] which means that the chosen alignment affects all columns.
#'
#' @return An object of class `gt_tbl`.
#'
#' @details
#'
#' When you create a **gt** table object using [gt()], automatic alignment of
#' column labels and their data cells is performed. By default, left-alignment
#' is applied to columns of class `character`, `Date`, or `POSIXct`;
#' center-alignment is for columns of class `logical`, `factor`, or `list`; and
#' right-alignment is used for the `numeric` and `integer` columns.
#'
#' @section Examples:
#'
#' Let's use [`countrypops`] to create a small **gt** table. We can change the
#' alignment of the `population` column with `cols_align()`. In this example,
#' the label and body cells of `population` will be aligned to the left.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::filter(
#'     country_name == "San Marino",
#'     year %in% 2017:2021
#'   ) |>
#'   gt(
#'     rowname_col = "year",
#'     groupname_col = "country_name"
#'   ) |>
#'   cols_align(
#'     align = "left",
#'     columns = population
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_align_1.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-1
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cols_align <- function(
    data,
    align = c("auto", "left", "center", "right"),
    columns = everything()
) {

  # Perform input object validation
  stop_if_not_gt_tbl_or_group(data = data)

  # Handle gt_group
  if(inherits(data, "gt_group")){
    arg_list <- as.list(match.call())
    return(apply_to_grp(data, arg_list))
  }

  # Get the `align` value, this stops the function if there is no match
  align <-
    rlang::arg_match0(
      align,
      values = c("auto", "left", "center", "right")
    )

  # Get the columns supplied in `columns` as a character vector
  column_names <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data,
      excl_stub = FALSE
    )

  if (align == "auto") {

    # Get the internal data table
    data_tbl <- dt_data_get(data = data)

    # Obtain a vector of column classes for each of the column names
    col_classes <- unlist(lapply(lapply(data_tbl[column_names], class), `[[`, 1))

    # Check whether all values in 'character' columns are
    # predominantly 'number-like' and modify `col_classes` accordingly
    col_classes <-
      determine_which_character_number(
        data_tbl = data_tbl,
        col_classes = col_classes
      )

    # Get a vector of `align` values based on the column classes
    align <-
      unname(
        sapply(
          col_classes, switch,
          "character-numeric" = "right",
          "character" = "left",
          "Date" = "right",
          "POSIXct" = "right",
          "logical" = "center",
          "factor" = "center",
          "list" = "center",
          "numeric" = "right",
          "integer" = "right",
          "center"
        )
      )

  } else {
    align <- rep(align, length(column_names))
  }

  for (i in seq(column_names)) {

    data <-
      dt_boxhead_edit(
        data = data,
        var = column_names[i],
        column_align = align[i]
      )
  }

  data
}

# helpers ---------------------------
determine_which_character_number <- function(
  data_tbl = data_tbl,
  col_classes = col_classes
) {

  cols_character <- names(col_classes[col_classes == "character"])

  for (col in cols_character) {

    col_vals <- data_tbl[[col]]

    res <- grepl("^[0-9 -/:\\.]*$", col_vals[!is.na(col_vals)])

    if (length(res) > 0 && all(res)) {
      col_classes[names(col_classes) == col] <- "character-numeric"
    }
  }

  col_classes
}
