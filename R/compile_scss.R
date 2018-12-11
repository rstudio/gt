#' @import sass
#' @noRd
compile_scss <- function(data, id = NULL) {

  # Obtain the SCSS options table from `data`
  gt_options_tbl <-
    attr(data, "opts_df", exact = TRUE) %>%
    subset(scss) %>%
    subset(!is.na(value))

  has_id <- !is.null(id)

  sass::sass(
    list(
      list(element_id = id),
      as.list(setNames(gt_options_tbl$value, gt_options_tbl$parameter)),
      sass::sass_file(system_file(file = "css/gt_colors.scss")),
      sass::sass_file(system_file(file = "css/gt_styles_default.scss")),
      glue::glue(
        .open = "<<", .close = ">>",
        "
        <<ifelse(has_id, 'html', '.gt_table')>> {
          font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,
            Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans',
            Arial, sans-serif;
        }

        <<ifelse(has_id, '##{$element_id} {', '')>>
        @include gt_styles();
        <<ifelse(has_id, '}', '')>>
        ")))
}
