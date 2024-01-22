
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

  gtable <- finalize_gtable(layout, data)
  grid::grid.newpage(); grid::grid.draw(gtable)
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

finalize_gtable <- function(layout, data) {

  classes <- set_classes(layout, data)

  grobs <- Map(
    label = layout$label,
    class = classes,
    f = render_grid_cell
  )

  widths  <- grid_layout_widths(layout, grobs)
  heights <- grid_layout_heights(layout, grobs)

  gtable <- gtable::gtable(widths = widths, heights = heights)
  gtable <- gtable::gtable_add_grob(
    gtable, grobs, name = "cells", clip = "off",
    t = layout$top, l = layout$left, b = layout$bottom, r = layout$right
  )
  gtable
}

grid_layout_heights <- function(layout, grobs) {

  heights <- vapply(grobs, `[[`, numeric(1), "height")

  rows <- vctrs::vec_group_loc(layout[, c("top", "bottom")])
  rows$height <- vapply(rows$loc, function(i) max(heights[i]), numeric(1))

  is_single <- rows$key$top == rows$key$bottom
  singles <- rows[is_single, ]
  spanner <- rows[!is_single, ]

  singles <- singles$height[order(singles$key$top)]
  spanner <- spanner[order(spanner$key$top, spanner$key$bottom), ]

  for (i in seq_len(nrow(spanner))) {
    top <- spanner$key$top[i]
    bottom <- spanner$key$bottom[i]
    single_size <- sum(singles[top:bottom])
    extra_height <- spanner$height[i] - single_size
    if (extra_height < 0) {
      next
    }
    extra_height <- extra_height / (bottom - top + 1)
    singles[top:bottom] <- singles[top:bottom] + extra_height
  }
  grid::unit(singles, .grid_unit)
}

grid_layout_widths <- function(layout, grobs) {

  widths <- vapply(grobs, `[[`, numeric(1), "width")

  columns <- vctrs::vec_group_loc(layout[, c("left", "right")])
  columns$width <- vapply(columns$loc, function(i) max(widths[i]), numeric(1))

  is_single <- columns$key$left == columns$key$right
  singles <- columns[is_single, ]
  spanner <- columns[!is_single, ]

  singles <- singles$width[order(singles$key$left)]
  spanner <- spanner[order(spanner$key$left, spanner$key$right), ]

  for (i in seq_len(nrow(spanner))) {
    left  <- spanner$key$left[i]
    right <- spanner$key$right[i]
    single_size <- sum(singles[left:right])
    extra_width <- spanner$width[i] - single_size
    if (extra_width < 0) {
      next
    }
    extra_width <- extra_width / (right - left + 1)
    singles[left:right] <- singles[left:right] + extra_width
  }
  grid::unit(singles, .grid_unit)
}
