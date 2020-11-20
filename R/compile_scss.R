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
    # Replace default option values with bslib Sass defaults
    bslib_col <- if ("3" %in% theme_version(theme)) "value3" else "value"
    gt_options_tbl <- gt_options_tbl %>%
      dplyr::left_join(
        dplyr::select(dt_options_tbl, parameter, default = value), by = "parameter"
      ) %>%
      dplyr::left_join(
        dplyr::select(bslib_options_tbl, parameter, bsvalue = !!rlang::sym(bslib_col)), by = "parameter"
      ) %>%
      dplyr::mutate(
        is_default = as.logical(Map(identical, value, default)),
        value = ifelse(is_default & !is.na(bsvalue), bsvalue, value)
      )
    # Add values of bslib::bs_theme(bg, fg) as official Sass vars to the theme (since value3 uses them)
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
        paste(gt_options_tbl$value, "!default"),
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
