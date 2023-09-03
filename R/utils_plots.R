#------------------------------------------------------------------------------#
#
#                /$$
#               | $$
#     /$$$$$$  /$$$$$$
#    /$$__  $$|_  $$_/
#   | $$  \ $$  | $$
#   | $$  | $$  | $$ /$$
#   |  $$$$$$$  |  $$$$/
#    \____  $$   \___/
#    /$$  \ $$
#   |  $$$$$$/
#    \______/
#
#  This file is part of the 'rstudio/gt' project.
#
#  Copyright (c) 2018-2023 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#

# This creates a nanoplot with equally-spaced y values
generate_equal_spaced_nanoplot <- function(
    y_vals,
    line_stroke = "steelblue",
    line_stroke_width = 8,
    line_fill = "none",
    data_point_radius = 10,
    data_point_stroke = "white",
    data_point_stroke_width = 4,
    data_point_fill = "red",
    vertical_guideline_stroke = "purple",
    vertical_guideline_stroke_width = 4,
    show_data_points = TRUE,
    show_curved_data_line = TRUE,
    show_lower_area = TRUE,
    show_vertical_guidelines = TRUE,
    svg_height = "1.5em",
    svg_margin_left = "auto",
    svg_margin_right = "auto",
    svg_font_size = "inherit",
    svg_overflow = "visible",
    svg_position = "relative",
    view = FALSE
) {

  if (length(y_vals) == 0) {
    return("")
  }
  if (length(y_vals) == 1 && is.na(y_vals[1])) {
    return("")
  }

  circle_tags <- NULL
  curved_path_tag <- NULL
  area_path_tag <- NULL
  g_guide_tags <- NULL

  # Fixed interval between data points in px
  x_d <- 50

  # Get the number of data points
  num_y_vals <- length(y_vals)

  # Define the top-left of the plot area
  left_x <- 0
  top_y <- 0

  # Define the safe zone distance from top/bottom and left/right edges
  safe_y_d <- 10
  safe_x_d <- 50

  # Define the width and height of the plot area that bounds the data points
  data_x_width <- num_y_vals * x_d
  data_y_height <- 100

  # Determine the bottom-right of the plot area based on the quantity of data
  bottom_y <- safe_y_d + data_y_height + safe_y_d
  right_x <- safe_x_d + data_x_width + safe_x_d

  viewbox <- paste(left_x, top_y, right_x, bottom_y, collapse = " ")

  normalize_y_vals <- function(x) {
    x <- as.matrix(x)
    min_attr <- apply(x, 2, min)
    max_attr <- apply(x, 2, max)
    x <- sweep(x, MARGIN = 2, STATS = min_attr, FUN = "-")
    x <- sweep(x, MARGIN = 2, STATS = max_attr - min_attr, FUN = "/")
    as.numeric(x)
  }

  y_proportions <- normalize_y_vals(y_vals)
  x_proportions <- seq(0, 1, length.out = num_y_vals)

  # Create normalized (and inverted for SVG) data `x` and `y` values
  data_y_points <- safe_y_d + ((1 - y_proportions) * data_y_height)
  data_x_points <- (data_x_width * x_proportions) + safe_x_d

  #
  # Ensure that certain options have their lengths checked and
  # expanded to length `num_y_vals`
  #

  # - `data_point_radius`
  # - `data_point_stroke`
  # - `data_point_stroke_width `
  # - `data_point_fill`
  # - `vertical_guideline_stroke`
  # - `vertical_guideline_stroke_width`

  data_point_radius <- normalize_option_vector(data_point_radius, num_y_vals)
  data_point_stroke <- normalize_option_vector(data_point_stroke, num_y_vals)
  data_point_stroke_width <- normalize_option_vector(data_point_stroke_width, num_y_vals)
  data_point_fill <- normalize_option_vector(data_point_fill, num_y_vals)
  vertical_guideline_stroke <- normalize_option_vector(vertical_guideline_stroke, num_y_vals)
  vertical_guideline_stroke_width <- normalize_option_vector(vertical_guideline_stroke_width, num_y_vals)

  #
  # Generate curved data line
  #

  if (show_curved_data_line) {

    curved_path_string <- paste0("M ", data_x_points[1], ",", data_y_points[1])

    for (i in seq_along(data_x_points)[-1][-length(data_x_points)]) {

      point_b1 <- paste0(data_x_points[i - 1] + x_d / 2, ",", data_y_points[i - 1])
      point_b2 <- paste0(data_x_points[i] - x_d / 2, ",", data_y_points[i])
      point_i <- paste0(data_x_points[i], ",", data_y_points[i])

      path_string_i <- paste("C", point_b1, point_b2, point_i)

      curved_path_string <- c(curved_path_string, path_string_i)
    }

    curved_path_string <- paste0(curved_path_string, collapse = " ")

    curved_path_tag <-
      paste0(
        "<path ",
        "d=\"", curved_path_string, "\" ",
        "stroke=\"", line_stroke, "\" ",
        "stroke-width=\"", line_stroke_width, "\" ",
        "fill=\"", line_fill, "\" ",
        ">",
        "</path>"
      )
  }

  #
  # Generate data points
  #

  if (show_data_points) {

    circle_strings <- c()

    for (i in seq_along(data_x_points)) {

      data_point_radius_i <- data_point_radius[i]
      data_point_stroke_i <- data_point_stroke[i]
      data_point_stroke_width_i <- data_point_stroke_width[i]
      data_point_fill_i <- data_point_fill[i]

      circle_strings_i <-
        paste0(
          "<circle ",
          "cx=\"", data_x_points[i], "\" ",
          "cy=\"", data_y_points[i], "\" ",
          "r=\"", data_point_radius_i, "\" ",
          "stroke=\"", data_point_stroke_i, "\" ",
          "stroke-width=\"", data_point_stroke_width_i, "\" ",
          "fill=\"", data_point_fill_i, "\" ",
          ">",
          "</circle>"
        )

      circle_strings <- c(circle_strings, circle_strings_i)
    }

    circle_tags <- paste(circle_strings, collapse = "\n")
  }

  #
  # Generate vertical data point guidelines
  #

  if (show_vertical_guidelines) {

    g_guide_strings <- c()

    for (i in seq_along(data_x_points)) {

      rect_strings_i <-
        paste0(
          "<rect ",
          "x=\"", data_x_points[i] - 10, "\" ",
          "y=\"", top_y, "\" ",
          "width=\"20\" ",
          "height=\"", bottom_y, "\" ",
          "stroke=\"transparent\" ",
          "stroke-width=\"12\" ",
          "fill=\"transparent\"",
          ">",
          "</rect>"
        )

      y_value_i <- vec_fmt_number(y_vals[i], n_sigfig = 2)

      text_strings_i <-
        paste0(
          "<text ",
          "x=\"", data_x_points[i] + 10, "\" ",
          "y=\"", safe_y_d + 5, "\" ",
          "fill=\"transparent\" ",
          "stroke=\"transparent\" ",
          "font-size=\"", "30px", "\"",
          ">",
          y_value_i,
          "</text>"
        )

      g_guide_strings_i <-
        paste0(
          "<g class=\"vert-line\">\n",
          rect_strings_i, "\n",
          text_strings_i,
          "</g>"
        )

      g_guide_strings <- c(g_guide_strings, g_guide_strings_i)
    }

    g_guide_tags <- paste(g_guide_strings, collapse = "\n")
  }

  #
  # Generate style tag
  #
  svg_style <-
    paste(
      c(
        "<style>",
        paste0(
          "text { ",
          "font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace; ",
          "stroke-width: 0.15em; ",
          "paint-order: stroke; ",
          "stroke-linejoin: round; ",
          "} ",
          ".vert-line:hover rect { ",
          "fill: #911EB460; ",
          "stroke: #FFFFFF60; ",
          "color: red; ",
          "} ",
          ".vert-line:hover text { ",
          "fill: #666666; ",
          "stroke: white; ",
          "fill: black; ",
          "}"
        ),
        "</style>"
      ),
      collapse = ""
    )

  #
  # Generate background with repeating line pattern
  #

  svg_defs <-
    paste(
      c(
        "<defs>",
        "<pattern id=\"area_pattern\" width=\"8\" height=\"8\" patternUnits=\"userSpaceOnUse\">",
        paste0(
          "<path class=\"pattern-line\" ",
          "d=\"M 0,8 l 8,-8 M -1,1 l 4,-4 M 6,10 l 4,-4\" ",
          "stroke=\"red\" ",
          "stroke-width=\"1.5\" ",
          "stroke-linecap=\"round\" ",
          "shape-rendering=\"geometricPrecision\"",
          ">"
        ),
        "</path>",
        "</pattern>",
        "</defs>"
      ),
      collapse = "\n"
    )

  #
  # Optionally create an area path in the bottom of the data area
  #

  if (show_lower_area) {

    area_path <- c()

    for (i in seq_along(data_x_points)) {

      area_path_i <- paste0(data_x_points[i], ",", data_y_points[i])
      area_path <- c(area_path, area_path_i)
    }

    area_path <-
      c(
        area_path,
        paste0(data_x_points[length(data_x_points)], ",", bottom_y),
        paste0(data_x_points[1], ",", bottom_y)
      )

    area_path_string <- paste0("M", paste(area_path, collapse = ","), "Z")

    area_path_tag <-
      paste0(
        "<path class=\"area-closed\" ",
        "d=\"", area_path_string, "\" ",
        "stroke=\"transparent\" ",
        "stroke-width=\"2\" ",
        "fill=\"url(#area_pattern)\" ",
        "fill-opacity=\"0.7\">",
        "</path>"
      )
  }

  #
  # Construction of SVG tag
  #

  svg <-
    paste(
      c(
        paste0("<svg role=\"img\" viewBox=\"", viewbox, "\" "),
        "style=\"",
        paste0("height:", svg_height, ";"),
        "margin-left:auto;",
        "margin-right:auto;",
        "font-size:inherit;",
        "overflow:visible;",
        "position:relative;\">",
        svg_defs,
        svg_style,
        area_path_tag,
        curved_path_tag,
        circle_tags,
        g_guide_tags,
        "</svg>"
      ),
      collapse = "\n"
    )

  if (view) {
    htmltools::html_print(htmltools::HTML(svg))
  }

  svg
}

normalize_option_vector <- function(vec, num_y_vals) {

  if (length(vec) != 1 && length(vec) != num_y_vals) {
    stop("The length of every option must be `1` or the length of `y_vals`.")
  }

  if (length(vec) == 1) vec <- rep(vec, num_y_vals)
  vec
}
