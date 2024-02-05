
#' Transform a **gt** table object to a gtable
#'
#' Take a `gt_tbl` table object and transform it to a gtable.
#'
#' @param data A table object that is created using the `gt()` function.
#' @param plot A `logical(1)` whether the gtable should be rendered on the
#'   graphics device.
#' @param text_grob A `function` used to draw text. Defaults to
#'   `grid::textGrob()`, but can be swapped to `gridtext::richtext_grob()` to
#'   better render html content.
#'
#' @return A `gtable` object
#'
#' @noRd
render_as_gtable <- function(data, plot = FALSE, text_grob = grid::textGrob) {

  data <- build_data(data = data, context = "html")
  data <- add_css_styles(data = data)

  caption_component <-
    create_caption_component_g(data = data)
  heading_component <-
    create_heading_component_g(data = data)
  columns_component <-
    create_columns_component_g(data = data)
  body_component <-
    create_body_component_g(data = data)
  source_notes_component <-
    create_source_notes_component_g(data = data)
  footnotes_component <-
    create_footnotes_component_g(data = data)

  layout <-
    combine_components(
      caption   = caption_component,
      heading   = heading_component,
      columns   = columns_component,
      body      = body_component,
      source    = source_notes_component,
      footnotes = footnotes_component
    )

  layout$grobs <-
    render_grobs(layout = layout, data = data, text_grob = text_grob)

  gtable <- finalize_gtable(layout, data)
  if (isTRUE(plot)) {
    plot(gtable)
  }
  gtable
}

combine_components <- function(caption = NULL, heading = NULL, columns = NULL,
                               body = NULL, source = NULL, footnotes = NULL) {
  vertical <- c("top", "bottom")
  n <- n_caption <- max(caption$bottom %||% 0)

  if (!is.null(heading)) {
    heading[vertical] <- heading[vertical] + n
    n <- max(heading$bottom %||% n)
  }

  if (!is.null(columns)) {
    columns[vertical] <- columns[vertical] + n
    n <- max(columns$bottom %||% n)
  }

  body_start <- n
  if (!is.null(body)) {
    body[vertical] <- body[vertical] + n
    n <- max(body$bottom %||% n)
  }
  body_end <- n

  if (!is.null(footnotes)) {
    footnotes[vertical] <- footnotes[vertical] + n
    n <- max(footnotes$bottom %||% n)
  }

  if (!is.null(source)) {
    source[vertical] <- source[vertical] + n
  }

  n_cols <- max(body$right)
  # A table body typically renders top and bottom borders for the
  # body part. We implement this a large cell without label
  table_body <- grid_layout(
    left = 1, right = n_cols,
    label   = "",
    classes = list("gt_table_body"),
    style   = "background-color: transparent",
    top = body_start + 1, bottom = body_end,
    name = "table_body"
  )

  # The table itself renders top and bottom borders for everything excluding
  # the caption
  table <- grid_layout(
    left = 1, right = n_cols,
    label = "",
    classes = list("gt_table"),
    style   = "background-color: transparent",
    top = n_caption + 1, bottom = max(source$bottom %||% n),
    name = "table"
  )

  vctrs::vec_c(
    caption, heading, columns, body, source, footnotes,
    table_body, table
  )
}

render_grobs <- function(
  layout, data,
  text_grob = grid::textGrob,
  cell_grob = grid::segmentsGrob
) {
  style <- grid_resolve_style(layout = layout, data = data)
  Map(
    label = layout$label,
    style = style,
    f     = render_grid_cell,
    MoreArgs = list(
      text_grob = text_grob,
      cell_grob = cell_grob
    ),
    USE.NAMES = FALSE
  )
}

finalize_gtable <- function(layout, data) {
  check_installed("gtable", "to render as a gtable.")

  widths  <- grid_layout_widths(layout, data)
  heights <- grid_layout_heights(layout)

  name <- layout$name
  name <- stats::ave(name, name, FUN = function(nm) {
    if (length(nm) == 1) {
      return(nm)
    }
    paste0(nm, "_", seq_along(nm))
  })

  gtable <- gtable::gtable(widths = widths, heights = heights)
  gtable <- gtable::gtable_add_grob(
    gtable, layout$grobs, name = name, clip = "off",
    t = layout$top, l = layout$left, b = layout$bottom, r = layout$right
  )
  gtable <- grid_align_gtable(gtable, data)
  class(gtable) <- union("gt_gtable", class(gtable))
  gtable
}

#' @export
plot.gt_gtable <- function(x, ...) {
  grid::grid.newpage()
  grid::grid.draw(x)
}

grid_layout_heights <- function(layout) {

  heights <- vapply(layout$grobs, `[[`, numeric(1), "height")

  rows <- vctrs::vec_group_loc(layout[, c("top", "bottom")])
  rows$height <- vapply(rows$loc, function(i) max(heights[i]), numeric(1))

  is_single <- rows$key$top == rows$key$bottom
  singles <- rows[is_single, ]
  spanner <- rows[!is_single, ]

  heights <- rep(0, max(layout$bottom))
  heights[singles$key$top] <- singles$height
  spanner <- spanner[order(spanner$key$top, spanner$key$bottom), ]

  for (i in seq_len(nrow(spanner))) {
    top <- spanner$key$top[i]
    bottom <- spanner$key$bottom[i]
    single_size <- sum(heights[top:bottom])
    extra_height <- spanner$height[i] - single_size
    if (extra_height < 0) {
      next
    }
    extra_height <- extra_height / (bottom - top + 1)
    heights[top:bottom] <- heights[top:bottom] + extra_height
  }
  grid::unit(heights, .grid_unit)
}

grid_align_gtable <- function(gtable, data) {

  left  <- dt_options_get_value(data, "table_margin_left")
  right <- dt_options_get_value(data, "table_margin_right")

  if (left == "auto") {
    left <- grid::unit(0.5, "null")
  } else if (grepl("\\%$", left)) {
    left <- as.numeric(gsub("\\%$", "", left)) / 100
    left <- grid::unit(left * 0.5, "null")
  } else {
    left <- grid::unit(parse_px_to_pt(left), "pt")
  }

  if (right == "auto") {
    right <- grid::unit(0.5, "null")
  } else if (grepl("\\%$", right)) {
    right <- as.numeric(gsub("\\%$", "", right)) / 100
    right <- grid::unit(right * 0.5, "null")
  } else {
    right <- grid::unit(grid::unit(parse_px_to_pt(left), "pt"))
  }

  gtable <- gtable::gtable_add_cols(gtable, left,  pos = 0)
  gtable <- gtable::gtable_add_cols(gtable, right, pos = -1)
  gtable
}

grid_layout_widths <- function(layout, data) {

  widths <- vapply(layout$grobs, `[[`, numeric(1), "width")

  columns <- vctrs::vec_group_loc(layout[, c("left", "right")])
  columns$width <- vapply(columns$loc, function(i) max(widths[i]), numeric(1))

  is_single <- columns$key$left == columns$key$right
  singles <- columns[is_single, ]
  spanner <- columns[!is_single, ]

  widths <- rep(0, max(layout$right))
  widths[singles$key$left] <- singles$width

  # Enlarge columns if fixed column widths have been set
  column_width <- unlist(dt_boxhead_get(data)$column_width)
  fixed <- integer(0)
  if (any(nzchar(column_width)) && length(column_width) == length(widths)) {
    fixed <- which(nzchar(column_width))
    widths[fixed] <- pmax(parse_px_to_pt(column_width[fixed]), widths[fixed])
  }

  spanner <- spanner[order(spanner$key$left, spanner$key$right), ]

  for (i in seq_len(nrow(spanner))) {
    left  <- spanner$key$left[i]
    right <- spanner$key$right[i]
    single_size <- sum(widths[left:right])
    extra_width <- spanner$width[i] - single_size
    if (extra_width < 0) {
      next
    }
    extra_width <- extra_width / (right - left + 1)
    widths[left:right] <- widths[left:right] + extra_width
  }

  total_width <- dt_options_get_value(data, "table_width")
  if (grepl("px$", total_width)) {
    total_width <- parse_px_to_pt(total_width)
    extra_width <- total_width - sum(widths)
    if (extra_width <= 0 || length(fixed) == length(widths)) {
      return(grid::unit(widths, .grid_unit))
    }
    change <- setdiff(seq_along(widths), fixed)
    widths[change] <- widths[change] + extra_width / (length(widths[change]))
    return(grid::unit(widths, .grid_unit))
  }
  if (grepl("\\%$", total_width)) {
    # Set the total width in npc units
    total_width <- as.numeric(gsub("\\%$", "", total_width)) / 100
    change <- setdiff(seq_along(widths), fixed)
    extra_width <- rep(0, length(widths))
    extra_width[change] <- total_width / length(change)
    extra_width <- grid::unit(extra_width, "npc")

    # Subtract the size of fixed columns from the npc units
    extra_width[change] <- extra_width[change] -
      grid::unit(sum(widths[fixed]) / length(change), .grid_unit)

    # Take pairwise max between minimal size and relative size
    widths <- grid::unit.pmax(grid::unit(widths, .grid_unit), extra_width)
    return(widths)
  }
  return(grid::unit(widths, .grid_unit))
}
