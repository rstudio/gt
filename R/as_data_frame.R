#' Transform a **gt** object to a data frame
#'
#' This facilitates conversion of the `gt_tbl` object to a data frame.
#'
#' @param x An object of class `gt_tbl`.
#' @param ... Any additional parameters.
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
