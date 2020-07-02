#' @noRd
compile_scss <- function(data, id = NULL) {

  # Obtain the SCSS options table from `data`
  gt_options_tbl <-
    dt_options_get(data = data) %>%
    subset(scss) %>%
    subset(!is.na(value))

  has_id <- !is.null(id)

  if (has_id) {

    css_reset <-
      paste0(
        paste(
          paste0("#", id),
          c("body", "div", "span", "applet", "h1", "h2", "h3", "h4", "h5", "h6",
            "p", "blockquote", "pre", "a", "abbr", "acronym", "address", "big",
            "cite", "code", "del", "dfn", "em", "img", "ins", "kbd", "q", "s",
            "samp", "small", "strike", "strong", "sub", "sup", "tt", "var", "b",
            "u", "center", "dl", "dt", "dd", "ol", "ul", "li", "fieldset",
            "form", "label", "legend", "table", "caption", "tbody", "tfoot",
            "thead", "tr", "th", "td", "article", "aside", "canvas", "details",
            "embed", "figure", "figcaption", "footer", "header", "hgroup",
            "menu", "nav", "output", "section", "summary", "time", "mark",
            "audio", "video"),
          collapse = ", "),
        " {
margin: 0;
padding: 0;
border: 0;
font-size: 100%;
font: inherit;
vertical-align: baseline;
}"
      )
  } else {
    css_reset <- ""
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
        <<ifelse(has_id, css_reset, '')>>

        <<ifelse(has_id, 'html', '.gt_table')>> {
          font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto,
            Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans',
            Arial, sans-serif;
        }

        <<ifelse(has_id, '##{$element_id} {', '')>>
        @include gt_styles();
        <<ifelse(has_id, '}', '')>>
        ")
    )
  )
}
