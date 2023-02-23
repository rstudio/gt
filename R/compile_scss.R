#' @noRd
compile_scss <- function(data, id = NULL) {

  # Obtain the SCSS options table from `data`
  gt_options_tbl <- dt_options_get(data = data)

  gt_options_tbl <- gt_options_tbl[gt_options_tbl$scss & !is.na(gt_options_tbl$value), ]

  color_rows <- grepl("_color", gt_options_tbl$parameter)

  gt_options_tbl <-
    within(
      gt_options_tbl,{
        value[color_rows] = value[color_rows] <- lapply(value[color_rows], html_color)
      }
    )

  # TODO: Seems like `id` can never be NULL so an ID is always placed in
  # the HTML table; we always need ID values for accessibility features
  # but in some use cases we'd not want to prefix the CSS rules with the
  # ID (this should perhaps be another options available in `tab_options()`)
  has_id <- !is.null(id)

  # Get the vector of fonts and transform to a `font-family` string
  font_vec <- unique(dt_options_get_value(data = data, option = "table_font_names"))
  font_family_attr <- as_css_font_family_attr(font_vec = font_vec)

  # Get any additional CSS statements
  additional_css <- dt_options_get_value(data = data, option = "table_additional_css")

  # Determine if there are any additional CSS statements
  has_additional_css <- any(nchar(additional_css) > 0)

  # Combine any additional CSS statements and separate with `\n`
  if (has_additional_css) {
    table_additional_css <- paste0(paste(additional_css, collapse = "\n"),  "\n")
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
        <<ifelse(has_id, 'html', '.gt_table')>> {
          <<font_family_attr>>
        }

        <<ifelse(has_id, '##{$element_id} {', '')>>
        @include gt_styles();
        <<ifelse(has_id, '}', '')>>

        <<ifelse(has_additional_css, table_additional_css, '')>>
        ")
    )
  )
}
