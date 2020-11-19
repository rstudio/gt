#' @noRd
compile_scss <- function(data, id = NULL) {

  # Obtain the SCSS options table from `data`
  gt_options_tbl <-
    dt_options_get(data = data) %>%
    subset(scss) %>%
    subset(!is.na(value))

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

  # If a bslib theme is active, use it to provide defaults based on Bootstrap Sass variables
  theme_vars <- list()
  theme <- bs_current_theme()
  if (length(theme)) {
    gt_options_tbl <- dplyr::left_join(
      gt_options_tbl,
      dplyr::select(dt_options_tbl, parameter, default = value, bslib_value),
      by = c("parameter", "bslib_value")
    )
    is_default <- as.logical(Map(identical, gt_options_tbl$value, gt_options_tbl$default))
    gt_options_tbl <- dplyr::mutate(
      gt_options_tbl,
      value = ifelse(
        is_default & !is.na(bslib_value), bslib_value, value
      )
    )
    # Get at the value of bslib::bs_theme(bg, fg)
    bfg <- bslib::bs_get_variables(theme, c("bg", "fg"))
    theme <- bslib::bs_add_variables(theme, !!!as.list(bfg))
    theme_vars <- sass::as_sass_layer(theme)
    theme_vars$rules <- ""
  }

  sass::sass(
    list(
      list(element_id = id),
      theme_vars,
      as.list(stats::setNames(
        gt_options_tbl$value,
        gt_options_tbl$parameter
      )),
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

bs_current_theme <- function() {
  if ("bslib" %in% loadedNamespaces())
    bslib::bs_current_theme()
}
