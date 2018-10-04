#' @import sass
#' @noRd
compile_scss <- function(data, id) {

  # Obtain the SCSS options table from `data`
  gt_options_tbl <- attr(data, "opts_df", exact = TRUE) %>%
    subset(scss) %>%
    subset(!is.na(value))

  sass::sass(
    list(
      list(element_id = id),
      as.list(setNames(gt_options_tbl$value, gt_options_tbl$parameter)),
      sass::sass_file(system_file(file = "css/gt_default.scss"))
    )
  )
}
