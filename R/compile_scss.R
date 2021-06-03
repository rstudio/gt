#' @noRd
compile_scss <- function(data, id = NULL) {

  # Obtain the SCSS options table from `data`
  gt_options_tbl <-
    dt_options_get(data = data) %>%
    subset(scss) %>%
    subset(!is.na(value))

  gt_options_tbl <-
    dplyr::mutate(
      gt_options_tbl,
      value =
        lapply(
          seq_len(nrow(gt_options_tbl)),
          FUN = function(x) {

            if (x %in% which(grepl("_color$", gt_options_tbl$parameter))) {
              x11_to_suitable_html_color(gt_options_tbl[, "value", drop = TRUE][[x]])
            } else {
              gt_options_tbl[, "value", drop = TRUE][[x]]
            }
          }
        )
    )

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
    table_additional_css <- paste(additional_css, collapse = "\n") %>% paste_right("\n")
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

x11_numbered_grays <-
  grDevices::colors()[grepl("^gr(a|e)y[0-9]+", grDevices::colors())]

x11_numbered_non_grays <-
  base::setdiff(
    grDevices::colors()[grepl("^[a-z]*?[1-4]+", grDevices::colors())],
    x11_numbered_grays
  )

x11_to_suitable_html_color <- function(color) {

  if (color %in% c(x11_numbered_grays, x11_numbered_non_grays)) {
    color <- html_color(colors = color)
  }

  color
}
