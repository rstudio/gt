
render_as_gtable <- function(data) {

  data <- build_data(data = data, context = "html")
  data <- add_css_styles(data = data)
  # data <- add_grid_styles(data = data)

  caption_component <- create_caption_component_g(data = data)
  heading_component <- create_heading_component_g(data = data)
  columns_component <- create_columns_component_g(data = data)
  body_component    <- create_body_component_g(data = data)
  source_notes_component <- create_source_notes_component_g(data = data)
  footnotes_component <- create_footnotes_component_g(data = data)

  layout <- combine_components(
    caption = caption_component,
    heading = heading_component,
    columns = columns_component,
    body    = body_component,
    source  = source_notes_component,
    footnotes = footnotes_component
  )
}

combine_components <- function(caption = NULL, heading = NULL, columns = NULL,
                               body = NULL, source = NULL, footnotes = NULL) {
  vertical <- c("top", "bottom")
  n <- max(caption$bottom %||% 0)

  if (!is.null(heading)) {
    heading[vertical] <- heading[vertical] + n
    n <- max(heading$bottom %||% n)
  }

  if (!is.null(columns)) {
    columns[vertical] <- columns[vertical] + n
    n <- max(columns$bottom %||% n)
  }

  if (!is.null(body)) {
    body[vertical] <- body[vertical] + n
    n <- max(body$bottom %||% n)
  }

  if (!is.null(footnotes)) {
    footnotes[vertical] <- footnotes[vertical] + n
    n <- max(footnotes$bottom %||% n)
  }

  if (!is.null(source)) {
    source[vertical] <- source[vertical] + n

  }

  vctrs::vec_c(caption, heading, columns, body, source, footnotes)
}


combine_head <- function(caption, heading, columns) {

  n <- max(caption$bottom %||% 0)
  heading$top    <- heading$top    + n
  heading$bottom <- heading$bottom + n
  n <- max(heading$bottom %||% n)
  columns$top    <- columns$top    + n
  columns$bottom <- columns$bottom + n

  vctrs::vec_c(caption, heading, columns)
}
