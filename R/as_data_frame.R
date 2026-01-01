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


#nocov start

#' Transform a **gt** object to a data frame
#'
#' This facilitates conversion of the `gt_tbl` object to a data frame.
#'
#' @param x *The gt table data object*
#'
#'   `obj:<gt_tbl>` // **required**
#'
#'   This is the **gt** table object that is commonly created through use of the
#'   [gt()] function.
#'
#' @param ... *Optional parameters*
#'
#'   `<multiple expressions>` // (`optional`)
#'
#'   Anything provided here in `...` will be passed to internal function calls
#'   that can consume it.
#'
#' @keywords internal
#'
#' @export
as.data.frame.gt_tbl <- function(x, ...) {

  data <- x

  data_built <- build_data(data, context = "html")

  ret <- as.data.frame(dt_body_get(data = data_built), stringsAsFactors = FALSE)

  has_rowname <-
    dt_stub_components_has_rowname(dt_stub_components(data = data_built))

  if (has_rowname) {

    if ("__GT_ROWNAME_PRIVATE__" %in% colnames(ret)) {
      ret$`__GT_ROWNAME_PRIVATE__` <- NULL
    }
    rowname_vals <- dt_stub_df_get(data = data_built)$row_id
    rownames(ret) <- rowname_vals
  }

  ret
}

#nocov end
