#' @export
as.data.frame.gt_tbl <- function(x, ...) {

  data <- x

  data_built <-
    data %>%
    build_data(context = "html")

  ret <-
    data_built %>%
    dt_body_get() %>%
    as.data.frame(stringsAsFactors = FALSE)

  has_rowname <-
    data_built %>%
    dt_stub_components() %>%
    dt_stub_components_has_rowname()

  if (has_rowname) {
    rowname_vals <-
      data_built %>%
      dt_stub_df_get() %>%
      dplyr::pull(rowname)

    rownames(ret) <- rowname_vals
  }

  ret
}
