#' @noRd
compile_scss <- function(data, id = NULL) {

  # Obtain the SCSS options table from `data`
  gt_options_tbl <-
    dt_options_get(data = data) %>%
    subset(scss) %>%
    subset(!is.na(value))

  has_id <- !is.null(id)

  # Get the vector of fonts and transform to a `font-family` string
  font_vec <- dt_options_get_value(data = data, option = "table_font_names")
  font_family_attr <- as_css_font_family_attr(font_vec = font_vec)

  # Get any font-related @import statements
  font_imports <- dt_options_get_value(data = data, option = "table_font_imports")

  has_font_imports <- any(nchar(font_imports) > 0)

  if (has_font_imports) {
    font_imports <-
      paste(font_imports, collapse = "\n") %>% paste_right("\n")
  }

  sass::sass(
    list(
      list(element_id = id),
      as.list(stats::setNames(gt_options_tbl$value, gt_options_tbl$parameter)),
      sass::sass_file(system_file(file = "css/gt_colors.scss")),
      sass::sass_file(system_file(file = "css/gt_styles_default.scss")),
      glue::glue(
        .open = "<<", .close = ">>",
        "
        <<ifelse(has_font_imports, font_imports, '')>>

        <<ifelse(has_id, 'html', '.gt_table')>> {
          <<font_family_attr>>
        }

        <<ifelse(has_id, '##{$element_id} {', '')>>
        @include gt_styles();
        <<ifelse(has_id, '}', '')>>
        ")
    )
  )
}
