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
    y_ref_line = NULL,
    y_ref_area = NULL,
    missing_vals = c("gap", "zero", "remove"),
    currency = NULL,
    data_point_radius = 10,
    data_point_stroke_color = "white",
    data_point_stroke_width = 4,
    data_point_fill_color = "red",
    data_line_stroke_color = "steelblue",
    data_line_stroke_width = 8,
    vertical_guide_stroke_color = "#911EB4",
    vertical_guide_stroke_width = 12,
    show_data_points = TRUE,
    show_data_line = TRUE,
    show_data_area = TRUE,
    show_ref_line = FALSE,
    show_ref_area = FALSE,
    show_vertical_guides = TRUE,
    svg_height = "1.5em",
    view = FALSE
) {

  # Ensure that arguments are matched
  missing_vals <- rlang::arg_match(missing_vals)

  # Initialize several local `*_tags` variables with `NULL`
  circle_tags <- NULL
  data_path_tags <- NULL
  area_path_tags <- NULL
  ref_line_tags <- NULL
  ref_area_tags <- NULL
  g_guide_tags <- NULL

  if (length(y_vals) == 0) {
    return("")
  }
  if (all(is.na(y_vals))) {
    return("")
  }

  # For the `missing_vals` options of 'zero' or 'remove', either replace NAs
  # with `0` or remove NAs entirely
  if (missing_vals == "zero") {
    y_vals[is.na(y_vals)] <- 0
  }
  if (missing_vals == "remove") {
    y_vals <- y_vals[!is.na(y_vals)]
  }

  # Get a vector of data points that are missing and are to be treated as gaps
  if (missing_vals == "gap") {
    y_vals_gaps <- which(is.na(y_vals))
  }

  # Ensure that a reference line or reference area isn't shown if any
  # of its directives is NA
  if (!is.null(y_ref_line) && is.na(y_ref_line)) {
    show_ref_line <- FALSE
  }
  if (!is.null(y_ref_area)) {
    if (is.na(y_ref_area[[1]]) || is.na(y_ref_area[[2]])) {
      show_ref_area <- FALSE
    }
  }

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

    x_missing <- which(is.na(x))
    mean_x <- mean(x, na.rm = TRUE)
    x[x_missing] <- mean_x
    x <- as.matrix(x)
    min_attr <- apply(x, 2, min)
    max_attr <- apply(x, 2, max)
    x <- sweep(x, MARGIN = 2, STATS = min_attr, FUN = "-")
    x <- sweep(x, MARGIN = 2, STATS = max_attr - min_attr, FUN = "/")
    x <- as.numeric(x)
    x[x_missing] <- NA_real_
    x
  }

  #
  # If there is a reference line and/or reference area, the values for these
  # need to be generated and integrated in the `normalize_y_vals()` operation
  # so that there are normalized values in relation to the data points
  #

  if (show_ref_line && show_ref_area) {

    # Case where there is both a reference line and a reference area

    #
    # Resolve the reference line
    #

    if (is.null(y_ref_line)) {

      # When a reference line is requested but there are no directives for
      # defining the line, we will default to having the line represent the
      # median of the data

      y_ref_line <- stats::median(y_vals, na.rm = TRUE)

    } else if (
      !is.null(y_ref_line) &&
      is.character(y_ref_line) &&
      length(y_ref_line) == 1 &&
      y_ref_line %in% c("mean", "median", "min", "max", "first", "last")
    ) {

      y_ref_line <-
        generate_ref_line_from_keyword(
          vals = y_vals,
          keyword = y_ref_line
        )
    }

    #
    # Resolve the reference area
    #

    if (is.null(y_ref_area)) {

      # When a reference area is requested but there are no directives for
      # defining the area, we will default to constraining the area to the
      # Q1 and Q3 quartiles

      y_ref_area_l <- as.numeric(stats::quantile(y_vals, 0.25, na.rm = TRUE))
      y_ref_area_u <- as.numeric(stats::quantile(y_vals, 0.75, na.rm = TRUE))

    } else if (!is.null(y_ref_area)) {

      # TODO: Validate input for `y_ref_area`

      y_ref_area_1 <- y_ref_area[[1]]
      y_ref_area_2 <- y_ref_area[[2]]

      if (is.numeric(y_ref_area_1)) {
        y_ref_area_line_1 <- y_ref_area_1
      }
      if (is.numeric(y_ref_area_2)) {
        y_ref_area_line_2 <- y_ref_area_2
      }

      if (
        is.character(y_ref_area_1) &&
        y_ref_area_1 %in% c("mean", "median", "min", "max", "first", "last")
      ) {

        y_ref_area_line_1 <-
          generate_ref_line_from_keyword(
            vals = y_vals,
            keyword = y_ref_area_1
          )
      }

      if (
        is.character(y_ref_area_2) &&
        y_ref_area_2 %in% c("mean", "median", "min", "max", "first", "last")
      ) {

        y_ref_area_line_2 <-
          generate_ref_line_from_keyword(
            vals = y_vals,
            keyword = y_ref_area_2
          )
      }

      y_ref_area_lines_sorted <- sort(c(y_ref_area_line_1, y_ref_area_line_2))
      y_ref_area_l <- y_ref_area_lines_sorted[1]
      y_ref_area_u <- y_ref_area_lines_sorted[2]
    }

    # Scale to proportional values
    y_proportions_w_ref_line_area <-
      normalize_y_vals(c(y_vals, y_ref_line[1], y_ref_area_l, y_ref_area_u))
    y_proportion_ref_line <- y_proportions_w_ref_line_area[-(1:num_y_vals)][1]
    y_proportions_ref_area_l <- y_proportions_w_ref_line_area[-(1:num_y_vals)][2]
    y_proportions_ref_area_u <- y_proportions_w_ref_line_area[-(1:num_y_vals)][3]
    y_proportions <- y_proportions_w_ref_line_area[(1:num_y_vals)]

    # Scale reference line and reference area boundaries
    data_y_ref_line <- safe_y_d + ((1 - y_proportion_ref_line) * data_y_height)
    data_y_ref_area_l <- safe_y_d + ((1 - y_proportions_ref_area_l) * data_y_height)
    data_y_ref_area_u <- safe_y_d + ((1 - y_proportions_ref_area_u) * data_y_height)

  } else if (show_ref_line) {

    # Case where there is a reference line

    if (is.null(y_ref_line)) {

      # When a reference line is requested but there are no directives for
      # defining the line, we will default to having the line represent the
      # median of the data

      y_ref_line <- stats::median(y_vals, na.rm = TRUE)

    } else if (
      !is.null(y_ref_line) &&
      is.character(y_ref_line) &&
      length(y_ref_line) == 1 &&
      y_ref_line %in% c("mean", "median", "min", "max", "first", "last")
    ) {

      y_ref_line <-
        generate_ref_line_from_keyword(
          vals = y_vals,
          keyword = y_ref_line
        )
    }

    # Scale to proportional values
    y_proportions_w_ref_line <- normalize_y_vals(c(y_vals, y_ref_line[1]))
    y_proportion_ref_line <- y_proportions_w_ref_line[length(y_proportions_w_ref_line)]
    y_proportions <- y_proportions_w_ref_line[-length(y_proportions_w_ref_line)]

    # Scale reference line
    data_y_ref_line <- safe_y_d + ((1 - y_proportion_ref_line) * data_y_height)

  } else if (show_ref_area) {

    # Case where there is a reference area

    if (is.null(y_ref_area)) {

      # When a reference area is requested but there are no directives for
      # defining the area, we will default to constraining the area to the
      # Q1 and Q3 quartiles

      y_ref_area_l <- as.numeric(stats::quantile(y_vals, 0.25, na.rm = TRUE))
      y_ref_area_u <- as.numeric(stats::quantile(y_vals, 0.75, na.rm = TRUE))

    } else if (!is.null(y_ref_area)) {

      # TODO: Validate input for `y_ref_area`

      y_ref_area_1 <- y_ref_area[[1]]
      y_ref_area_2 <- y_ref_area[[2]]

      if (is.numeric(y_ref_area_1)) {
        y_ref_area_line_1 <- y_ref_area_1
      }
      if (is.numeric(y_ref_area_2)) {
        y_ref_area_line_2 <- y_ref_area_2
      }

      if (
        is.character(y_ref_area_1) &&
        y_ref_area_1 %in% c("mean", "median", "min", "max", "first", "last")
      ) {

        y_ref_area_line_1 <-
          generate_ref_line_from_keyword(
            vals = y_vals,
            keyword = y_ref_area_1
          )
      }

      if (
        is.character(y_ref_area_2) &&
        y_ref_area_2 %in% c("mean", "median", "min", "max", "first", "last")
      ) {

        y_ref_area_line_2 <-
          generate_ref_line_from_keyword(
            vals = y_vals,
            keyword = y_ref_area_2
          )
      }

      y_ref_area_lines_sorted <- sort(c(y_ref_area_line_1, y_ref_area_line_2))
      y_ref_area_l <- y_ref_area_lines_sorted[1]
      y_ref_area_u <- y_ref_area_lines_sorted[2]
    }

    # Scale to proportional values
    y_proportions_w_ref_area <- normalize_y_vals(c(y_vals, y_ref_area_l, y_ref_area_u))
    y_proportions_ref_area_l <- y_proportions_w_ref_area[-(1:num_y_vals)][1]
    y_proportions_ref_area_u <- y_proportions_w_ref_area[-(1:num_y_vals)][2]
    y_proportions <- y_proportions_w_ref_area[(1:num_y_vals)]

    # Scale reference area boundaries
    data_y_ref_area_l <- safe_y_d + ((1 - y_proportions_ref_area_l) * data_y_height)
    data_y_ref_area_u <- safe_y_d + ((1 - y_proportions_ref_area_u) * data_y_height)

  } else {

    # Case where there is no reference line or reference area

    y_proportions <- normalize_y_vals(y_vals)
  }

  x_proportions <- seq(0, 1, length.out = num_y_vals)

  # Create normalized (and inverted for SVG) data `x` and `y` values
  data_y_points <- safe_y_d + ((1 - y_proportions) * data_y_height)
  data_x_points <- (data_x_width * x_proportions) + safe_x_d

  #
  # Ensure that certain options have their lengths checked and
  # expanded to length `num_y_vals`
  #

  # - `data_point_radius`
  # - `data_point_stroke_color`
  # - `data_point_stroke_width `
  # - `data_point_fill_color`

  data_point_radius <- normalize_option_vector(data_point_radius, num_y_vals)
  data_point_stroke_color <- normalize_option_vector(data_point_stroke_color, num_y_vals)
  data_point_stroke_width <- normalize_option_vector(data_point_stroke_width, num_y_vals)
  data_point_fill_color <- normalize_option_vector(data_point_fill_color, num_y_vals)

  #
  # Generate data segments by defining `start` and `end` vectors (these
  # are guaranteed to be of the same length); these the segments of data
  # they receive line segments and adjoining areas
  #

  rle_data_y_points <- rle(!is.na(data_y_points))

  end_data_y_points <- cumsum(rle_data_y_points$lengths)
  start_data_y_points <- end_data_y_points - rle_data_y_points$lengths + 1

  na_indices <- which(is.na(data_y_points))

  is_non_na <- !(start_data_y_points %in% na_indices)

  start_data_y_points <- start_data_y_points[is_non_na]
  end_data_y_points <- end_data_y_points[is_non_na]

  is_not_length_one <- !(start_data_y_points == end_data_y_points)

  start_data_y_points <- start_data_y_points[is_not_length_one]
  end_data_y_points <- end_data_y_points[is_not_length_one]
  n_segments <- length(start_data_y_points)

  #
  # Generate curved data line
  #

  if (show_data_line) {

    data_path_tags <- c()

    for (i in seq_len(n_segments)) {

      curve_x <- data_x_points[start_data_y_points[i]:end_data_y_points[i]]
      curve_y <- data_y_points[start_data_y_points[i]:end_data_y_points[i]]

      curved_path_string <- paste0("M ", curve_x[1], ",", curve_y[1])

      for (j in seq_along(curve_x)[-1][-length(curve_x)]) {

        point_b1 <- paste0(curve_x[j - 1] + x_d / 2, ",", curve_y[j - 1])
        point_b2 <- paste0(curve_x[j] - x_d / 2, ",", curve_y[j])
        point_i <- paste0(curve_x[j], ",", curve_y[j])

        path_string_j <- paste("C", point_b1, point_b2, point_i)

        curved_path_string <- c(curved_path_string, path_string_j)
      }

      curved_path_string_i <- paste0(curved_path_string, collapse = " ")

      data_path_tags_i <-
        paste0(
          "<path ",
          "d=\"", curved_path_string_i, "\" ",
          "stroke=\"", data_line_stroke_color, "\" ",
          "stroke-width=\"", data_line_stroke_width, "\" ",
          "fill=\"none\"",
          ">",
          "</path>"
        )

      data_path_tags <- c(data_path_tags, data_path_tags_i)
    }

    data_path_tags <- paste(data_path_tags, collapse = "\n")
  }

  #
  # Generate data points
  #

  if (show_data_points) {

    circle_strings <- c()

    for (i in seq_along(data_x_points)) {

      data_point_radius_i <- data_point_radius[i]
      data_point_stroke_color_i <- data_point_stroke_color[i]
      data_point_stroke_width_i <- data_point_stroke_width[i]
      data_point_fill_color_i <- data_point_fill_color[i]

      if (is.na(data_y_points[i])) {

        if (missing_vals == "gap") {

          # Create a symbol that should denote that a
          # missing value is present
          circle_strings_i <-
            paste0(
              "<circle ",
              "cx=\"", data_x_points[i], "\" ",
              "cy=\"", safe_y_d + (data_y_height / 2), "\" ",
              "r=\"", data_point_radius_i + (data_point_radius_i / 2), "\" ",
              "stroke=\"", "red", "\" ",
              "stroke-width=\"", data_point_stroke_width_i, "\" ",
              "fill=\"", "white", "\" ",
              ">",
              "</circle>",
              ""
            )

        } else {
          next
        }

      } else {

        circle_strings_i <-
          paste0(
            "<circle ",
            "cx=\"", data_x_points[i], "\" ",
            "cy=\"", data_y_points[i], "\" ",
            "r=\"", data_point_radius_i, "\" ",
            "stroke=\"", data_point_stroke_color_i, "\" ",
            "stroke-width=\"", data_point_stroke_width_i, "\" ",
            "fill=\"", data_point_fill_color_i, "\" ",
            ">",
            "</circle>"
          )
      }

      circle_strings <- c(circle_strings, circle_strings_i)
    }

    circle_tags <- paste(circle_strings, collapse = "\n")
  }

  #
  # Generate reference line
  #

  if (show_ref_line) {

    stroke <- "#09647380"
    stroke_width <- 1
    stroke_dasharray <- "4 3"
    transform <- ""
    stroke_linecap <- "round"
    vector_effect <- "non-scaling-stroke"

    if (!is.null(currency)) {

      if (!is.na(y_ref_line) && abs(y_ref_line) < 10) {
        use_subunits <- TRUE
        decimals <- NULL
      } else {
        use_subunits <- FALSE
        decimals <- NULL
      }

      if (!is.na(y_ref_line) && abs(y_ref_line) > 1000) {
        suffixing <- TRUE
        decimals <- 1
      } else {
        suffixing <- FALSE
        decimals <- NULL
      }

      y_ref_line <-
        vec_fmt_currency(
          y_ref_line,
          currency = currency,
          use_subunits = use_subunits,
          decimals = decimals,
          suffixing = suffixing,
          output = "html"
        )

    } else {

      # TODO: Modify argument values based on input values
      y_ref_line <- vec_fmt_number(y_ref_line, n_sigfig = 2)
    }

    ref_line_tags <-
      paste0(
        "<g class=\"ref-line\">",
        "<rect ",
        "x=\"", data_x_points[1] - 10, "\" ",
        "y=\"", data_y_ref_line - 10, "\" ",
        "width=\"", data_x_width + 20, "\" ",
        "height=\"", 20, "\" ",
        "stroke=\"transparent\" ",
        "stroke-width=\"1\" ",
        "fill=\"transparent\"",
        ">",
        "</rect>",
        "<line ",
        "class=\"ref-line\" ",
        "x1=\"", data_x_points[1], "\" ",
        "y1=\"", data_y_ref_line, "\" ",
        "x2=\"", data_x_points[length(data_x_points)], "\" ",
        "y2=\"", data_y_ref_line, "\" ",
        "stroke=\"", stroke, "\" ",
        "stroke-width=\"", stroke_width, "\" ",
        "stroke-dasharray=\"", stroke_dasharray, "\" ",
        "transform=\"", transform, "\" ",
        "stroke-linecap=\"", stroke_linecap, "\" ",
        "vector-effect=\"", vector_effect, "\" ",
        ">",
        "</line>",
        "<text ",
        "x=\"", data_x_points[length(data_x_points)] + 10, "\" ",
        "y=\"", data_y_ref_line + 10, "\" ",
        "fill=\"transparent\" ",
        "stroke=\"transparent\" ",
        "font-size=\"", "30px", "\"",
        ">",
        y_ref_line,
        "</text>",
        "</g>"
      )
  }

  #
  # Generate reference area
  #

  if (show_ref_area) {

    fill <- "#90E0EF80"

    p_ul <- paste0(data_x_points[1], ",", data_y_ref_area_u)
    p_ur <- paste0(data_x_points[length(data_x_points)], ",", data_y_ref_area_u)
    p_lr <- paste0(data_x_points[length(data_x_points)], ",", data_y_ref_area_l)
    p_ll <- paste0(data_x_points[1], ",", data_y_ref_area_l)

    ref_area_path <-
      paste0("M", paste(p_ul, p_ur, p_lr, p_ll, collapse = ","), "Z")

    ref_area_tags <-
      paste0(
        "<path ",
        "d=\"", ref_area_path, "\" ",
        "stroke=\"transparent\" ",
        "stroke-width=\"2\" ",
        "fill=\"", fill, "\" ",
        "fill-opacity=\"0.8\">",
        "</path>"
      )
  }

  #
  # Generate vertical data point guidelines
  #

  if (show_vertical_guides) {

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
          "stroke-width=\"", vertical_guide_stroke_width, "\" ",
          "fill=\"transparent\"",
          ">",
          "</rect>"
        )

      if (!is.null(currency)) {

        if (!is.na(y_vals[i]) && abs(y_vals[i]) < 10) {
          use_subunits <- TRUE
          decimals <- NULL
        } else {
          use_subunits <- FALSE
          decimals <- NULL
        }

        if (!is.na(y_vals[i]) && abs(y_vals[i]) > 1000) {
          suffixing <- TRUE
          decimals <- 1
        } else {
          suffixing <- FALSE
          decimals <- NULL
        }

        y_value_i <-
          vec_fmt_currency(
            y_vals[i],
            currency = currency,
            use_subunits = use_subunits,
            decimals = decimals,
            suffixing = suffixing,
            output = "html"
          )

      } else {

        # TODO: Modify argument values based on input values
        y_value_i <- vec_fmt_number(y_vals[i], n_sigfig = 2)
      }

      x_text <- data_x_points[i] + 10

      if (y_value_i == "NA") {
        x_text <- x_text + 2
      }

      text_strings_i <-
        paste0(
          "<text ",
          "x=\"", x_text, "\" ",
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

  # Generate style tag for vertical guidelines
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
          "fill: ", vertical_guide_stroke_color, "; ",
          "fill-opacity: 40%; ",
          "stroke: #FFFFFF60; ",
          "color: red; ",
          "} ",
          ".vert-line:hover text { ",
          "stroke: white; ",
          "fill: #212427; ",
          "} ",
          ".ref-line:hover rect { ",
          "stroke: #FFFFFF60; ",
          "} ",
          ".ref-line:hover line { ",
          "stroke: #FF0000; ",
          "} ",
          ".ref-line:hover text { ",
          "stroke: white; ",
          "fill: #212427; ",
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
  # Optionally create an area path adjacent to the data points and data line
  #

  if (show_data_area) {

    area_path_tags <- c()

    for (i in seq_len(n_segments)) {

      area_x <- data_x_points[start_data_y_points[i]:end_data_y_points[i]]
      area_y <- data_y_points[start_data_y_points[i]:end_data_y_points[i]]

      area_path_string <- c()

      for (j in seq_along(area_x)) {

        area_path_j <- paste0(area_x[j], ",", area_y[j])
        area_path_string <- c(area_path_string, area_path_j)
      }

      area_path_i <-
        c(
          area_path_string,
          paste0(area_x[length(area_x)], ",", bottom_y),
          paste0(area_x[1], ",", bottom_y)
        )

      area_path_i <- paste0("M", paste(area_path_i, collapse = ","), "Z")

      area_path_tag_i <-
        paste0(
          "<path class=\"area-closed\" ",
          "d=\"", area_path_i, "\" ",
          "stroke=\"transparent\" ",
          "stroke-width=\"2\" ",
          "fill=\"url(#area_pattern)\" ",
          "fill-opacity=\"0.7\">",
          "</path>"
        )

      area_path_tags <- c(area_path_tags, area_path_tag_i)
    }

    area_path_tags <- paste(area_path_tags, collapse = "\n")
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
        "vertical-align:middle;",
        "position:relative;\">",
        svg_defs,
        svg_style,
        ref_area_tags,
        area_path_tags,
        data_path_tags,
        ref_line_tags,
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

mad_double <- function(x) {

  x <- x[!is.na(x)]
  m <- stats::median(x)
  abs_dev <- abs(x - m)
  left_mad <- stats::median(abs_dev[x <= m])
  right_mad <- stats::median(abs_dev[x >= m])

  if (left_mad == 0 || right_mad == 0) {

    if (left_mad  == 0) left_mad  <- NA_real_
    if (right_mad == 0) right_mad <- NA_real_
  }

  c(left_mad, right_mad)
}

mad_double_from_median <- function(x) {

  mad_two_sided <- mad_double(x)
  m <- stats::median(x, na.rm = TRUE)
  x_mad <- rep(mad_two_sided[1], length(x))
  x_mad[x > m] <- mad_two_sided[2]
  mad_distance <- abs(x - m) / x_mad
  mad_distance[x == m] <- 0
  mad_distance
}

out_indices_from_vec <- function(x, cutoff = 3) {
  which(mad_double_from_median(x) > cutoff)
}

generate_ref_line_from_keyword <- function(vals, keyword) {

  if (length(keyword) != 1) {
    stop("The keyword length must be one.")
  }

  if (!(keyword %in% c("mean", "median", "min", "max", "first", "last"))) {
    stop("A keyword for a reference line needs to be one of six valid options.")
  }

  if (keyword == "mean") {
    ref_line <- mean(vals, na.rm = TRUE)
  } else if (keyword == "median") {
    ref_line <- stats::median(vals, na.rm = TRUE)
  } else if (keyword == "min") {
    ref_line <- min(vals, na.rm = TRUE)
  } else if (keyword == "max") {
    ref_line <- max(vals, na.rm = TRUE)
  } else if (keyword == "first") {
    ref_line <- vals[!is.na(vals)][1]
  } else {
    ref_line <- vals[!is.na(vals)][length(vals[!is.na(vals)])]
  }

  ref_line
}
