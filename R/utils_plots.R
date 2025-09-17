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
#  Copyright (c) 2018-2025 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


# This creates a nanoplot
generate_nanoplot <- function(
    y_vals,
    y_ref_line = NULL,
    y_ref_area = NULL,
    x_vals = NULL,
    expand_x = NULL,
    expand_y = NULL,
    missing_vals = c("gap", "marker", "zero", "remove"),
    all_y_vals = NULL,
    all_single_y_vals = NULL,
    plot_type = c("line", "bar"),
    line_type = c("curved", "straight"),
    currency = NULL,
    y_val_fmt_fn = NULL,
    y_axis_fmt_fn = NULL,
    y_ref_line_fmt_fn = NULL,
    data_point_radius = 10,
    data_point_stroke_color = "#FFFFFF",
    data_point_stroke_width = 4,
    data_point_fill_color = "#FF0000",
    data_line_stroke_color = "#4682B4",
    data_line_stroke_width = 8,
    data_area_fill_color = "#FF0000",
    data_bar_stroke_color = "#3290CC",
    data_bar_stroke_width = 4,
    data_bar_fill_color = "#3FB5FF",
    data_bar_negative_stroke_color = "#CC3243",
    data_bar_negative_stroke_width = 4,
    data_bar_negative_fill_color = "#D75A68",
    reference_line_color = "#75A8B0",
    reference_area_fill_color = "#A6E6F2",
    vertical_guide_stroke_color = "#911EB4",
    vertical_guide_stroke_width = 12,
    show_data_points = TRUE,
    show_data_line = TRUE,
    show_data_area = TRUE,
    show_ref_line = TRUE,
    show_ref_area = TRUE,
    show_vertical_guides = TRUE,
    show_y_axis_guide = TRUE,
    interactive_data_values = TRUE,
    svg_height = "2em",
    view = FALSE
) {

  # Ensure that arguments are matched
  missing_vals <- rlang::arg_match(missing_vals)
  line_type <- rlang::arg_match(line_type)

  # Initialize several local `*_tags` variables with `NULL`
  ref_area_tags <- NULL
  area_path_tags <- NULL
  data_path_tags <- NULL
  zero_line_tags <- NULL
  bar_tags <- NULL
  boxplot_tags <- NULL
  ref_line_tags <- NULL
  circle_tags <- NULL
  g_y_axis_tags <- NULL
  g_guide_tags <- NULL

  # Initialize the `single_horizontal_bar` variable with `FALSE`
  single_horizontal_bar <- FALSE

  # If the number of `y` values is zero or if all consist of NA values,
  # return an empty string
  if (length(y_vals) == 0) {
    return("")
  }
  if (all(is.na(y_vals))) {
    return("")
  }

  # Get the number of data points for `y`
  num_y_vals <- length(y_vals)

  # Handle case where `x_vals` exists (i.e., is not `NULL`)
  if (!is.null(x_vals)) {

    # If the number of `x` values is zero or an empty string,
    # return an empty string
    if (length(x_vals) == 0) {
      return("")
    }
    if (all(is.na(x_vals))) {
      return("")
    }

    # Get the number of data points for `x`
    num_x_vals <- length(x_vals)

    # Ensure that, if there are `x` values, the number of `x`
    # and `y` values matches
    if (num_x_vals != num_y_vals) {

      cli::cli_abort(c(
        "The number of `x` and `y` values must match.",
        "*" = "The `x` value length is: {num_x_vals}",
        "*" = "The `y` value length is: {num_y_vals}"
      ))
    }

    # Handle missing values in `x_vals` through removal (i.e., missing
    # values in `x_vals` means removal of positional values from both
    # `x_vals` and `y_vals`)
    if (anyNA(x_vals)) {

      # Determine which values from `x_vals` are non-missing values
      x_vals_non_missing <- !is.na(x_vals)

      # Retain only `x_vals_non_missing` from `x_vals` and `y_vals`
      x_vals <- x_vals[x_vals_non_missing]
      y_vals <- y_vals[x_vals_non_missing]
    }

    # If `x` values are present, we cannot use a curved line so
    # we'll force the use of the 'straight' line type
    line_type <- "straight"
  }

  # For the `missing_vals` options of 'zero' or 'remove', either replace NAs
  # with `0` or remove NAs entirely
  if (missing_vals == "zero") {
    y_vals[is.na(y_vals)] <- 0
  }

  if (missing_vals == "remove") {

    # Determine which values from `y` are missing
    y_vals_non_missing <- !is.na(y_vals)

    # Keep only the non-missing `y` values
    y_vals <- y_vals[y_vals_non_missing]

    if (!is.null(x_vals)) {

      # Remove any values from `x_vals` wherever NAs found in `y_vals`
      x_vals <- x_vals[y_vals_non_missing]
    }
  }

  # Determine the total number of `y` values available
  num_y_vals <- length(y_vals)

  # If the number of y_vals is `1` and we requested a 'bar' plot, then
  # reset several parameters
  if (num_y_vals == 1 && grepl("bar", plot_type, fixed = TRUE)) {

    single_horizontal_bar <- TRUE
    show_data_points <- FALSE
    show_data_line <- FALSE
    show_data_area <- FALSE
    show_ref_line <- FALSE
    show_ref_area <- FALSE
    show_vertical_guides <- FALSE
    show_y_axis_guide <- FALSE
  }

  # If this is a boxplot, set several parameters
  if (plot_type == "boxplot") {

    show_data_points <- FALSE
    show_data_line <- FALSE
    show_data_area <- FALSE
    show_ref_line <- FALSE
    show_ref_area <- FALSE
    show_vertical_guides <- FALSE
    show_y_axis_guide <- FALSE
  }

  # Find out whether the collection of non-NA `y` values are all integer-like
  y_vals_integerlike <- rlang::is_integerish(y_vals)

  # Get the max and min of the `y` scale from the `y` data values
  y_scale_max <- get_extreme_value(y_vals, stat = "max")
  y_scale_min <- get_extreme_value(y_vals, stat = "min")

  # Handle cases where collection of `y_vals` is invariant
  if (y_scale_min == y_scale_max && is.null(expand_y)) {

    if (y_scale_min == 0) {
      expand_y_dist <- 5
    } else {
      expand_y_dist <- (y_scale_min / 10) * 2
    }

    # Expand the `y` scale, centering around the `y_scale_min` value
    expand_y <- c(y_scale_min - expand_y_dist, y_scale_min + expand_y_dist)
  }

  # Ensure that a reference line or reference area isn't shown if NULL or
  # any of its directives is NA
  if (
    is.null(y_ref_line) ||
    !is.null(y_ref_line) && is.na(y_ref_line)
  ) {
    show_ref_line <- FALSE
  }

  if (is.null(y_ref_area)) {
    show_ref_area <- FALSE
  }

  if (
    !is.null(y_ref_area) &&
    (is.na(y_ref_area[[1]]) || is.na(y_ref_area[[2]]))
  ) {
    show_ref_area <- FALSE
  }

  # Determine the width of the data plot area; for plots where `x_vals`
  # are available, we'll use a fixed width of `500` (px), and for plots
  # where `x_vals` aren't present, we'll adjust the final width based
  # on the fixed interval between data points (this is dependent on the
  # number of data points)
  if (!is.null(x_vals) || single_horizontal_bar || plot_type == "boxplot") {

    data_x_width <- 600

  } else {

    # Obtain a sensible, fixed interval between data points in px
    x_d <-
      dplyr::case_when(
        num_y_vals <= 20 ~ 50,
        num_y_vals <= 30 ~ 40,
        num_y_vals <= 40 ~ 30,
        num_y_vals <= 50 ~ 25,
        .default = 20
      )

    data_x_width <- num_y_vals * x_d
  }

  # Define the top-left of the plot area
  left_x <- 0
  top_y <- 0

  # Define the safe zone distance from top/bottom and left/right edges
  safe_y_d <- 15
  safe_x_d <- 50

  # Define the height of the plot area that bounds the data points
  data_y_height <- 100

  # Determine the bottom-right of the plot area based on the quantity of data
  bottom_y <- safe_y_d + data_y_height + safe_y_d
  right_x <- safe_x_d + data_x_width + safe_x_d

  viewbox <- paste(left_x, top_y, right_x, bottom_y, collapse = " ")

  #
  # If there is a reference line and/or reference area, the values for these
  # need to be generated and integrated in the `normalize_y_vals()` operation
  # so that there are normalized values in relation to the data points
  #

  if (plot_type == "line") {

    if (show_ref_line && show_ref_area) {

      # Case where there is both a reference line and a reference area

      #
      # Resolve the reference line
      #

      if (
        !is.null(y_ref_line) &&
        is.character(y_ref_line) &&
        length(y_ref_line) == 1 &&
        y_ref_line %in% reference_line_keywords()
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

      if (!is.null(y_ref_area)) {

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
          y_ref_area_1 %in% reference_line_keywords()
        ) {

          y_ref_area_line_1 <-
            generate_ref_line_from_keyword(
              vals = y_vals,
              keyword = y_ref_area_1
            )
        }

        if (
          is.character(y_ref_area_2) &&
          y_ref_area_2 %in% reference_line_keywords()
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

      # Recompute the `y` scale min and max values
      y_scale_max <- get_extreme_value(y_vals, y_ref_line[1], y_ref_area_l, y_ref_area_u, expand_y, stat = "max")
      y_scale_min <- get_extreme_value(y_vals, y_ref_line[1], y_ref_area_l, y_ref_area_u, expand_y, stat = "min")

      # Scale to proportional values
      y_proportions_list <-
        normalize_to_list(
          vals = y_vals,
          ref_line = y_ref_line[1],
          ref_area_l = y_ref_area_l,
          ref_area_u = y_ref_area_u,
          expand_y = expand_y
        )

      y_proportions <- y_proportions_list[["vals"]]
      y_proportion_ref_line <- y_proportions_list[["ref_line"]]
      y_proportions_ref_area_l <- y_proportions_list[["ref_area_l"]]
      y_proportions_ref_area_u <- y_proportions_list[["ref_area_u"]]

      # Scale reference line and reference area boundaries
      data_y_ref_line <- safe_y_d + ((1 - y_proportion_ref_line) * data_y_height)
      data_y_ref_area_l <- safe_y_d + ((1 - y_proportions_ref_area_l) * data_y_height)
      data_y_ref_area_u <- safe_y_d + ((1 - y_proportions_ref_area_u) * data_y_height)

    } else if (show_ref_line) {

      # Case where there is a reference line

      if (
        !is.null(y_ref_line) &&
        is.character(y_ref_line) &&
        length(y_ref_line) == 1 &&
        y_ref_line %in% reference_line_keywords()
      ) {

        y_ref_line <-
          generate_ref_line_from_keyword(
            vals = y_vals,
            keyword = y_ref_line
          )
      }

      # Recompute the `y` scale min and max values
      y_scale_max <- get_extreme_value(y_vals, y_ref_line[1], expand_y, stat = "max")
      y_scale_min <- get_extreme_value(y_vals, y_ref_line[1], expand_y, stat = "min")

      # Scale to proportional values
      y_proportions_list <-
        normalize_to_list(
          vals = y_vals,
          ref_line = y_ref_line[1],
          expand_y = expand_y
        )

      y_proportions <- y_proportions_list[["vals"]]
      y_proportion_ref_line <- y_proportions_list[["ref_line"]]

      # Scale reference line
      data_y_ref_line <- safe_y_d + ((1 - y_proportion_ref_line) * data_y_height)

    } else if (show_ref_area) {

      # Case where there is a reference area

      if (!is.null(y_ref_area)) {

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
          y_ref_area_1 %in% reference_line_keywords()
        ) {

          y_ref_area_line_1 <-
            generate_ref_line_from_keyword(
              vals = y_vals,
              keyword = y_ref_area_1
            )
        }

        if (
          is.character(y_ref_area_2) &&
          y_ref_area_2 %in% reference_line_keywords()
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

      # Recompute the `y` scale min and max values
      y_scale_max <- get_extreme_value(y_vals, y_ref_area_l, y_ref_area_u, expand_y, stat = "max")
      y_scale_min <- get_extreme_value(y_vals, y_ref_area_l, y_ref_area_u, expand_y, stat = "min")

      # Scale to proportional values
      y_proportions_list <-
        normalize_to_list(
          vals = y_vals,
          ref_area_l = y_ref_area_l,
          ref_area_u = y_ref_area_u,
          expand_y = expand_y
        )

      y_proportions <- y_proportions_list[["vals"]]
      y_proportions_ref_area_l <- y_proportions_list[["ref_area_l"]]
      y_proportions_ref_area_u <- y_proportions_list[["ref_area_u"]]

      # Scale reference area boundaries
      data_y_ref_area_l <- safe_y_d + ((1 - y_proportions_ref_area_l) * data_y_height)
      data_y_ref_area_u <- safe_y_d + ((1 - y_proportions_ref_area_u) * data_y_height)

    } else {

      # Case where there is no reference line or reference area

      # Recompute the `y` scale min and max values
      y_scale_max <- get_extreme_value(y_vals, expand_y, stat = "max")
      y_scale_min <- get_extreme_value(y_vals, expand_y, stat = "min")

      # Scale to proportional values
      y_proportions_list <-
        normalize_to_list(
          vals = y_vals,
          expand_y = expand_y
        )

      y_proportions <- y_proportions_list[["vals"]]
    }
  }

  if (plot_type == "bar" || plot_type == "boxplot") {

    if (show_ref_line && show_ref_area) {

      # Case where there is both a reference line and a reference area

      #
      # Resolve the reference line
      #

      if (
        !is.null(y_ref_line) &&
        is.character(y_ref_line) &&
        length(y_ref_line) == 1 &&
        y_ref_line %in% reference_line_keywords()
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

      if (!is.null(y_ref_area)) {

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
          y_ref_area_1 %in% reference_line_keywords()
        ) {

          y_ref_area_line_1 <-
            generate_ref_line_from_keyword(
              vals = y_vals,
              keyword = y_ref_area_1
            )
        }

        if (
          is.character(y_ref_area_2) &&
          y_ref_area_2 %in% reference_line_keywords()
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

      # Recompute the `y` scale min and max values
      y_scale_max <- get_extreme_value(y_vals, y_ref_line[1], y_ref_area_l, y_ref_area_u, 0, expand_y, stat = "max")
      y_scale_min <- get_extreme_value(y_vals, y_ref_line[1], y_ref_area_l, y_ref_area_u, 0, expand_y, stat = "min")

      # Scale to proportional values
      y_proportions_list <-
        normalize_to_list(
          vals = y_vals,
          ref_line = y_ref_line[1],
          ref_area_l = y_ref_area_l,
          ref_area_u = y_ref_area_u,
          zero = 0,
          expand_y = expand_y
        )

      y_proportions <- y_proportions_list[["vals"]]
      y_proportion_ref_line <- y_proportions_list[["ref_line"]]
      y_proportions_ref_area_l <- y_proportions_list[["ref_area_l"]]
      y_proportions_ref_area_u <- y_proportions_list[["ref_area_u"]]
      y_proportions_zero <- y_proportions_list[["zero"]]

      # Scale reference line and reference area boundaries
      data_y_ref_line <- safe_y_d + ((1 - y_proportion_ref_line) * data_y_height)
      data_y_ref_area_l <- safe_y_d + ((1 - y_proportions_ref_area_l) * data_y_height)
      data_y_ref_area_u <- safe_y_d + ((1 - y_proportions_ref_area_u) * data_y_height)

    } else if (show_ref_line) {

      # Case where there is a reference line

      if (
        !is.null(y_ref_line) &&
        is.character(y_ref_line) &&
        length(y_ref_line) == 1 &&
        y_ref_line %in% reference_line_keywords()
      ) {

        y_ref_line <-
          generate_ref_line_from_keyword(
            vals = y_vals,
            keyword = y_ref_line
          )
      }

      # Recompute the `y` scale min and max values
      y_scale_max <- get_extreme_value(y_vals, y_ref_line[1], 0, expand_y, stat = "max")
      y_scale_min <- get_extreme_value(y_vals, y_ref_line[1], 0, expand_y, stat = "min")

      # Scale to proportional values
      y_proportions_list <-
        normalize_to_list(
          vals = y_vals,
          ref_line = y_ref_line[1],
          zero = 0,
          expand_y = expand_y
        )

      y_proportions <- y_proportions_list[["vals"]]
      y_proportion_ref_line <- y_proportions_list[["ref_line"]]
      y_proportions_zero <- y_proportions_list[["zero"]]

      # Scale reference line
      data_y_ref_line <- safe_y_d + ((1 - y_proportion_ref_line) * data_y_height)

    } else if (show_ref_area) {

      # Case where there is a reference area

      if (!is.null(y_ref_area)) {

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
          y_ref_area_1 %in% reference_line_keywords()
        ) {

          y_ref_area_line_1 <-
            generate_ref_line_from_keyword(
              vals = y_vals,
              keyword = y_ref_area_1
            )
        }

        if (
          is.character(y_ref_area_2) &&
          y_ref_area_2 %in% reference_line_keywords()
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

      # Recompute the `y` scale min and max values
      y_scale_max <- get_extreme_value(y_vals, y_ref_area_l, y_ref_area_u, 0, expand_y, stat = "max")
      y_scale_min <- get_extreme_value(y_vals, y_ref_area_l, y_ref_area_u, 0, expand_y, stat = "min")

      # Scale to proportional values
      y_proportions_list <-
        normalize_to_list(
          vals = y_vals,
          ref_area_l = y_ref_area_l,
          ref_area_u = y_ref_area_u,
          zero = 0,
          expand_y = expand_y
        )

      y_proportions <- y_proportions_list[["vals"]]
      y_proportions_ref_area_l <- y_proportions_list[["ref_area_l"]]
      y_proportions_ref_area_u <- y_proportions_list[["ref_area_u"]]
      y_proportions_zero <- y_proportions_list[["zero"]]

      # Scale reference area boundaries
      data_y_ref_area_l <- safe_y_d + ((1 - y_proportions_ref_area_l) * data_y_height)
      data_y_ref_area_u <- safe_y_d + ((1 - y_proportions_ref_area_u) * data_y_height)

    } else {

      # Case where there is no reference line or reference area

      # Recompute the `y` scale min and max values
      y_scale_max <- get_extreme_value(y_vals, 0, expand_y, stat = "max")
      y_scale_min <- get_extreme_value(y_vals, 0, expand_y, stat = "min")

      # Scale to proportional values
      y_proportions_list <-
        normalize_to_list(
          vals = y_vals,
          zero = 0,
          expand_y = expand_y
        )

      y_proportions <- y_proportions_list[["vals"]]
      y_proportions_zero <- y_proportions_list[["zero"]]
    }

    data_y0_point <- safe_y_d + ((1 - y_proportions_zero) * data_y_height)
  }

  # If x values are present then normalize them between [0, 1]; if
  # there are no x values, generate equally-spaced x values according
  # to the number of y values
  if (plot_type == "line" && !is.null(x_vals)) {

    if (!is.null(expand_x) && is.character(expand_x)) {
      expand_x <- as.numeric(as.POSIXct(expand_x, tz = "UTC"))
    }

    # Scale to proportional values
    x_proportions_list <-
      normalize_to_list(
        vals = unname(x_vals),
        expand_x = expand_x
      )

    x_proportions <- x_proportions_list[["vals"]]

  } else {

    x_proportions <- seq(0, 1, length.out = num_y_vals)
  }

  # Create normalized (and inverted for SVG) data `x` and `y` values
  data_y_points <- safe_y_d + ((1 - y_proportions) * data_y_height)
  data_x_points <- (data_x_width * x_proportions) + safe_x_d

  #
  # Ensure that certain options have their lengths checked and
  # expanded to length `num_y_vals`; these are: (1) all `data_point_*`
  # options, and (2) three `data_bar_*` options
  #

  data_point_radius <- normalize_option_vector(data_point_radius, num_y_vals)
  data_point_stroke_color <- normalize_option_vector(data_point_stroke_color, num_y_vals)
  data_point_stroke_width <- normalize_option_vector(data_point_stroke_width, num_y_vals)
  data_point_fill_color <- normalize_option_vector(data_point_fill_color, num_y_vals)
  data_bar_stroke_color <- normalize_option_vector(data_bar_stroke_color, num_y_vals)
  data_bar_stroke_width <- normalize_option_vector(data_bar_stroke_width, num_y_vals)
  data_bar_fill_color <- normalize_option_vector(data_bar_fill_color, num_y_vals)

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

  is_not_length_one <- start_data_y_points != end_data_y_points

  start_data_y_points <- start_data_y_points[is_not_length_one]
  end_data_y_points <- end_data_y_points[is_not_length_one]
  n_segments <- length(start_data_y_points)

  #
  # Generate a curved data line
  #

  if (
    plot_type == "line" &&
    show_data_line &&
    line_type == "curved"
  ) {

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

  if (
    plot_type == "line" &&
    show_data_line &&
    line_type == "straight"
  ) {

    data_path_tags <- c()

    for (i in seq_len(n_segments)) {

      line_x <- data_x_points[start_data_y_points[i]:end_data_y_points[i]]
      line_y <- data_y_points[start_data_y_points[i]:end_data_y_points[i]]

      data_path_tags_i <-
        paste0(
          "<polyline ",
          "points=\"",
          paste(paste0(line_x, ",", line_y), collapse = " "),
          "\" ",
          "stroke=\"", data_line_stroke_color, "\" ",
          "stroke-width=\"", data_line_stroke_width, "\" ",
          "fill=\"none\"",
          ">",
          "</polyline>"
        )

      data_path_tags <- c(data_path_tags, data_path_tags_i)
    }

    data_path_tags <- paste(data_path_tags, collapse = "\n")
  }

  #
  # Generate data points
  #

  if (
    plot_type == "line" &&
    show_data_points
  ) {

    circle_strings <- c()

    for (i in seq_along(data_x_points)) {

      data_point_radius_i <- data_point_radius[i]
      data_point_stroke_color_i <- data_point_stroke_color[i]
      data_point_stroke_width_i <- data_point_stroke_width[i]
      data_point_fill_color_i <- data_point_fill_color[i]

      if (is.na(data_y_points[i])) {

        if (missing_vals == "marker") {

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
              "fill=\"white\" ",
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
  # Generate data bars
  #

  if (plot_type == "bar" && !single_horizontal_bar) {

    bar_strings <- c()

    for (i in seq_along(data_x_points)) {

      data_point_radius_i <- data_point_radius[i]
      data_bar_stroke_color_i <- data_bar_stroke_color[i]
      data_bar_stroke_width_i <- data_bar_stroke_width[i]
      data_bar_fill_color_i <- data_bar_fill_color[i]

      if (is.na(data_y_points[i])) {

        if (missing_vals == "marker") {

          # Create a symbol that should denote that a
          # missing value is present
          bar_strings_i <-
            paste0(
              "<circle ",
              "cx=\"", data_x_points[i], "\" ",
              "cy=\"", safe_y_d + (data_y_height / 2), "\" ",
              "r=\"", data_point_radius_i + (data_point_radius_i / 2), "\" ",
              "stroke=\"", "red", "\" ",
              "stroke-width=\"", data_bar_stroke_width_i, "\" ",
              "fill=\"transparent\" ",
              ">",
              "</circle>",
              ""
            )

        } else {
          next
        }

      } else {

        if (y_vals[i] < 0) {

          y_value_i <- data_y0_point
          y_height <- data_y_points[i] - data_y0_point
          data_bar_stroke_color_i <- data_bar_negative_stroke_color[1]
          data_bar_stroke_width_i <- data_bar_negative_stroke_width[1]
          data_bar_fill_color_i <- data_bar_negative_fill_color[1]

        } else if (y_vals[i] > 0) {

          y_value_i <- data_y_points[i]
          y_height <- data_y0_point - data_y_points[i]

        } else if (y_vals[i] == 0) {

          y_value_i <- data_y0_point - 1
          y_height <- 2
          data_bar_stroke_color_i <- "#808080"
          data_bar_stroke_width_i <- 4
          data_bar_fill_color_i <- "#808080"
        }

        bar_strings_i <-
          paste0(
            "<rect ",
            "x=\"", data_x_points[i] - (x_d - 10) / 2, "\" ",
            "y=\"", y_value_i, "\" ",
            "width=\"", (x_d - 10), "\" ",
            "height=\"", y_height, "\" ",
            "stroke=\"", data_bar_stroke_color_i, "\" ",
            "stroke-width=\"", data_bar_stroke_width_i, "\" ",
            "fill=\"", data_bar_fill_color_i, "\" ",
            ">",
            "</rect>"
          )
      }

      bar_strings <- c(bar_strings, bar_strings_i)
    }

    bar_tags <- paste(bar_strings, collapse = "\n")
  }

  # Speed up nanoplots number formatting rendering by avoid
  # calling resolve_cols_i() too much.
  # To be used with caution, but setting this envvar for all the vec_*() calls
  # similar to withr::local_envvar()
  Sys.setenv(GT_AVOID_RESOLVE = "true")
  on.exit(
    Sys.unsetenv("GT_AVOID_RESOLVE"),
    add = TRUE,
    after = TRUE
  )

  if (plot_type == "bar" && single_horizontal_bar) {

    # This type of display assumes there is only a single `y` value and there
    # are possibly several such horizontal bars across different rows that
    # need to be on a common scale

    bar_thickness <- data_point_radius[1] * 4

    if (all(all_single_y_vals == 0)) {

      # Handle case where all values across rows are `0`

      y_proportion <- 0.5
      y_proportion_zero <- 0.5

    } else {

      # Scale to proportional values
      y_proportions_list <-
        normalize_to_list(
          val = y_vals,
          all_vals = all_single_y_vals,
          zero = 0
        )

      y_proportion <- y_proportions_list[["val"]]
      y_proportion_zero <- y_proportions_list[["zero"]]
    }

    y0_width <- y_proportion_zero * data_x_width
    y_width <- y_proportion * data_x_width

    if (y_vals[1] < 0) {

      data_bar_stroke_color <- data_bar_negative_stroke_color[1]
      data_bar_stroke_width <- data_bar_negative_stroke_width[1]
      data_bar_fill_color <- data_bar_negative_fill_color[1]

      rect_x <- y_width
      rect_width <- y0_width - y_width

    } else if (y_vals[1] > 0) {

      data_bar_stroke_color <- data_bar_stroke_color[1]
      data_bar_stroke_width <- data_bar_stroke_width[1]
      data_bar_fill_color <- data_bar_fill_color[1]

      rect_x <- y0_width
      rect_width <- y_width - y0_width

    } else if (y_vals[1] == 0) {

      data_bar_stroke_color <- "#808080"
      data_bar_stroke_width <- 4
      data_bar_fill_color <- "#808080"

      rect_x <- y0_width - 2.5
      rect_width <- 5
    }

    # Format number compactly
    y_value <-
      format_number_compactly(
        val = y_vals,
        currency = currency,
        as_integer = y_vals_integerlike,
        fn = y_val_fmt_fn
      )

    rect_strings <-
      paste0(
        "<rect ",
        "x=\"", 0, "\" ",
        "y=\"", (bottom_y / 2) - (bar_thickness / 2), "\" ",
        "width=\"600\" ",
        "height=\"", bar_thickness, "\" ",
        "stroke=\"transparent\" ",
        "stroke-width=\"", vertical_guide_stroke_width, "\" ",
        "fill=\"transparent\"",
        ">",
        "</rect>"
      )

    if (y_vals[1] > 0) {

      text_strings <-
        paste0(
          "<text ",
          "x=\"", y0_width + 10, "\" ",
          "y=\"", safe_y_d + 10, "\" ",
          "fill=\"transparent\" ",
          "stroke=\"transparent\" ",
          "font-size=\"30px\"",
          ">",
          y_value,
          "</text>"
        )

    } else if (y_vals[1] < 0) {

      text_strings <-
        paste0(
          "<text ",
          "x=\"", y0_width - 10, "\" ",
          "y=\"", safe_y_d + 10, "\" ",
          "fill=\"transparent\" ",
          "stroke=\"transparent\" ",
          "font-size=\"30px\" ",
          "text-anchor=\"end\"",
          ">",
          y_value,
          "</text>"
        )

    } else if (y_vals[1] == 0) {

      if (all(all_single_y_vals == 0)) {
        text_anchor <- "start"
        x_position_text <- y0_width + 10
      } else if (all(all_single_y_vals <= 0)) {
        text_anchor <- "end"
        x_position_text <- y0_width - 10
      } else {
        text_anchor <- "start"
        x_position_text <- y0_width + 10
      }

      text_strings <-
        paste0(
          "<text ",
          "x=\"", x_position_text, "\" ",
          "y=\"", (bottom_y / 2) + 10, "\" ",
          "fill=\"transparent\" ",
          "stroke=\"transparent\" ",
          "font-size=\"30px\" ",
          "text-anchor=\"", text_anchor, "\"",
          ">",
          y_value,
          "</text>"
        )
    }

    g_guide_tags <-
      paste0(
        "<g class=\"horizontal-line\">\n",
        rect_strings, "\n",
        text_strings,
        "</g>"
      )

    bar_tags <-
      paste0(
        "<rect ",
        "x=\"", rect_x, "\" ",
        "y=\"", (bottom_y / 2) - (bar_thickness / 2), "\" ",
        "width=\"", rect_width, "\" ",
        "height=\"", bar_thickness, "\" ",
        "stroke=\"", data_bar_stroke_color, "\" ",
        "stroke-width=\"", data_bar_stroke_width, "\" ",
        "fill=\"", data_bar_fill_color, "\" ",
        ">",
        "</rect>"
      )

    stroke <- "#BFBFBF"
    stroke_width <- 5

    zero_line_tags <-
      paste0(
        "<line ",
        "x1=\"", y0_width, "\" ",
        "y1=\"", (bottom_y / 2) - (bar_thickness * 1.5), "\" ",
        "x2=\"", y0_width, "\" ",
        "y2=\"", (bottom_y / 2) + (bar_thickness * 1.5), "\" ",
        "stroke=\"", stroke, "\" ",
        "stroke-width=\"", stroke_width, "\" ",
        ">",
        "</line>"
      )

    # Redefine the `viewbox` in terms of the `data_x_width` value; this ensures
    # that the horizontal bars are centered about their extreme values
    viewbox <- paste(left_x, top_y, data_x_width, bottom_y, collapse = " ")
  }

  if (plot_type == "boxplot") {

    # This display is that of a boxplot and it automatically consider all
    # values across all rows
    box_thickness <- data_point_radius[1] * 6

    # Calculate statistics for boxplot
    stat_q_1 <- unname(stats::quantile(y_vals, probs = 0.25, na.rm = TRUE))
    stat_med <- unname(stats::quantile(y_vals, probs = 0.50, na.rm = TRUE))
    stat_q_3 <- unname(stats::quantile(y_vals, probs = 0.75, na.rm = TRUE))
    stat_iqr <- stats::IQR(y_vals, na.rm = TRUE)

    low_outliers <- y_vals[y_vals < stat_q_1 - (1.5 * stat_iqr)]
    high_outliers <- y_vals[y_vals > stat_q_3 + (1.5 * stat_iqr)]

    stat_min_excl_low_outliers <-
      min(base::setdiff(y_vals, low_outliers), na.rm = TRUE)

    stat_max_excl_high_outliers <-
      max(base::setdiff(y_vals, high_outliers), na.rm = TRUE)

    plot_only_outliers <- length(y_vals) >= 20

    if (plot_only_outliers) {

      # Plot only outliers since the number of data values is sufficiently high
      y_vals_plot <- c(low_outliers, high_outliers)

      data_point_radius <- 4
      data_point_stroke_width <- 2

      data_point_stroke_color <-
        adjust_luminance(data_bar_stroke_color[1], steps = 0.75)

      data_point_fill_color <-
        adjust_luminance(data_point_stroke_color[1], steps = 1.75)

    } else {

      # Plot all data values but diminish the visibility of the data points
      # as the number approaches 20
      y_vals_plot <- y_vals

      if (length(y_vals) < 10) {
        data_point_radius <- 6
        data_point_stroke_width <- 2
      } else {
        data_point_radius <- 4
        data_point_stroke_width <- 2
      }

      data_point_stroke_color <-
        adjust_luminance("black", steps = length(y_vals) / 25)

      data_point_fill_color <- "transparent"
    }

    # Scale to proportional values
    y_proportions_list <-
      normalize_to_list(
        vals = y_vals,
        all_vals = all_y_vals,
        y_vals_plot = y_vals_plot,
        stat_min = stat_min_excl_low_outliers,
        stat_qlow = stat_q_1,
        stat_med = stat_med,
        stat_qup = stat_q_3,
        stat_max = stat_max_excl_high_outliers
      )

    y_proportions <- y_proportions_list[["vals"]]
    y_proportions_plot <- y_proportions_list[["y_vals_plot"]]
    y_stat_min <- y_proportions_list[["stat_min"]]
    y_stat_q_1 <- y_proportions_list[["stat_qlow"]]
    y_stat_med <- y_proportions_list[["stat_med"]]
    y_stat_q_3 <- y_proportions_list[["stat_qup"]]
    y_stat_max <- y_proportions_list[["stat_max"]]

    # Calculate boxplot x values
    fence_start <- y_stat_min * data_x_width
    box_start <- y_stat_q_1 * data_x_width
    median_x <- y_stat_med * data_x_width
    box_end <- y_stat_q_3 * data_x_width
    fence_end <- y_stat_max * data_x_width
    box_width <- (y_stat_q_3 - y_stat_q_1) * data_x_width

    # Establish positions for plottable x and y values
    plotted_x_vals <- y_proportions_plot * data_x_width

    if (length(y_vals) == 1) {

      plotted_y_vals <- bottom_y / 2

    } else {

      if (plot_only_outliers) {

        plotted_y_vals <- rep(bottom_y / 2, length(plotted_x_vals))

      } else {

        plotted_y_vals <-
          jitter(rep(bottom_y / 2, length(plotted_x_vals)), factor = 10)
      }
    }

    # Format numbers compactly
    stat_min_value <-
      format_number_compactly(
        val = stat_min_excl_low_outliers,
        currency = currency,
        fn = y_val_fmt_fn
      )
    stat_q_1_value <-
      format_number_compactly(
        val = stat_q_1,
        currency = currency,
        fn = y_val_fmt_fn
      )
    stat_med_value <-
      format_number_compactly(
        val = stat_med,
        currency = currency,
        fn = y_val_fmt_fn
      )
    stat_q_3_value <-
      format_number_compactly(
        val = stat_q_3,
        currency = currency,
        fn = y_val_fmt_fn
      )
    stat_max_value <-
      format_number_compactly(
        val = stat_max_excl_high_outliers,
        currency = currency,
        fn = y_val_fmt_fn
      )

    rect_strings <-
      paste0(
        "<rect ",
        "x=\"0\" ",
        "y=\"", (bottom_y / 2) - (box_thickness / 2), "\" ",
        "width=\"", data_x_width, "\" ",
        "height=\"", box_thickness, "\" ",
        "stroke=\"transparent\" ",
        "stroke-width=\"", vertical_guide_stroke_width, "\" ",
        "fill=\"transparent\"",
        ">",
        "</rect>"
      )

    if (length(y_vals) == 1) {

      text_strings <-
        paste0(
          "</text>",
          "<text ",
          "x=\"", median_x, "\" ",
          "y=\"", safe_y_d + 15, "\" ",
          "fill=\"transparent\" ",
          "stroke=\"transparent\" ",
          "font-size=\"30px\" ",
          "text-anchor=\"middle\"",
          ">",
          stat_med_value,
          "</text>"
        )

    } else {

      text_strings <-
        paste0(
          "<text ",
          "x=\"", fence_start - 10, "\" ",
          "y=\"", (bottom_y / 2) + 10, "\" ",
          "fill=\"transparent\" ",
          "stroke=\"transparent\" ",
          "font-size=\"30px\" ",
          "text-anchor=\"end\"",
          ">",
          stat_min_value,
          "</text>",
          "<text ",
          "x=\"", box_start - 6, "\" ",
          "y=\"", bottom_y - 10, "\" ",
          "fill=\"transparent\" ",
          "stroke=\"transparent\" ",
          "font-size=\"30px\" ",
          "text-anchor=\"end\"",
          ">",
          stat_q_1_value,
          "</text>",
          "<text ",
          "x=\"", median_x, "\" ",
          "y=\"", safe_y_d + 12.5, "\" ",
          "fill=\"transparent\" ",
          "stroke=\"transparent\" ",
          "font-size=\"30px\" ",
          "text-anchor=\"middle\"",
          ">",
          stat_med_value,
          "</text>",
          "<text ",
          "x=\"", box_end + 6, "\" ",
          "y=\"", bottom_y - 10, "\" ",
          "fill=\"transparent\" ",
          "font-size=\"30px\" ",
          "text-anchor=\"start\"",
          ">",
          stat_q_3_value,
          "</text>",
          "<text ",
          "x=\"", fence_end + 10, "\" ",
          "y=\"", (bottom_y / 2) + 10, "\" ",
          "fill=\"transparent\" ",
          "stroke=\"transparent\" ",
          "font-size=\"30px\"",
          ">",
          stat_max_value,
          "</text>"
        )
    }

    g_guide_tags <-
      paste0(
        "<g class=\"boxplot-line\">\n",
        rect_strings, "\n",
        text_strings,
        "</g>"
      )

    if (length(plotted_x_vals) > 0) {

      circle_strings <- c()

      for (i in seq_along(plotted_x_vals)) {

        circle_strings_i <-
          paste0(
            "<circle ",
            "cx=\"", plotted_x_vals[i], "\" ",
            "cy=\"", plotted_y_vals[i], "\" ",
            "r=\"", data_point_radius, "\" ",
            "stroke=\"", data_point_stroke_color, "\" ",
            "stroke-width=\"", data_point_stroke_width, "\" ",
            "fill=\"", data_point_fill_color, "\" ",
            ">",
            "</circle>"
          )

        circle_strings <- c(circle_strings, circle_strings_i)
      }

      circle_tags <- paste(circle_strings, collapse = "\n")

    } else {
      circle_tags <- NULL
    }

    boxplot_tags <-
      paste0(
        "<line ",
        "x1=\"", fence_start, "\" ",
        "y1=\"", (bottom_y / 2), "\" ",
        "x2=\"", fence_end, "\" ",
        "y2=\"", (bottom_y / 2), "\" ",
        "width=\"", box_width, "\" ",
        "height=\"", box_thickness, "\" ",
        "stroke=\"", data_bar_stroke_color[1], "\" ",
        "stroke-width=\"", data_bar_stroke_width[1], "\" ",
        "fill=\"none\"",
        ">",
        "</line>",
        "<rect ",
        "x=\"", box_start, "\" ",
        "y=\"", (bottom_y / 2) - (box_thickness / 2), "\" ",
        "width=\"", box_width, "\" ",
        "height=\"", box_thickness, "\" ",
        "stroke=\"", data_bar_stroke_color[1], "\" ",
        "stroke-width=\"", data_bar_stroke_width[1], "\" ",
        "fill=\"white\" ",
        ">",
        "</rect>",
        "<line ",
        "x1=\"", fence_start, "\" ",
        "y1=\"", (bottom_y / 2) - box_thickness / 4, "\" ",
        "x2=\"", fence_start, "\" ",
        "y2=\"", (bottom_y / 2) + box_thickness / 4, "\" ",
        "width=\"", box_width, "\" ",
        "height=\"", box_thickness, "\" ",
        "stroke=\"", data_bar_stroke_color[1], "\" ",
        "stroke-width=\"", data_bar_stroke_width[1], "\" ",
        "fill=\"", "none", "\" ",
        ">",
        "</line>",
        "<line ",
        "x1=\"", fence_end, "\" ",
        "y1=\"", (bottom_y / 2) - box_thickness / 4, "\" ",
        "x2=\"", fence_end, "\" ",
        "y2=\"", (bottom_y / 2) + box_thickness / 4, "\" ",
        "width=\"", box_width, "\" ",
        "height=\"", box_thickness, "\" ",
        "stroke=\"", data_bar_stroke_color[1], "\" ",
        "stroke-width=\"", data_bar_stroke_width[1], "\" ",
        "fill=\"", "none", "\" ",
        ">",
        "</line>",
        "<line ",
        "x1=\"", median_x, "\" ",
        "y1=\"", (bottom_y / 2) - box_thickness / 2, "\" ",
        "x2=\"", median_x, "\" ",
        "y2=\"", (bottom_y / 2) + box_thickness / 2, "\" ",
        "width=\"", box_width, "\" ",
        "height=\"", box_thickness, "\" ",
        "stroke=\"", data_bar_stroke_color[1], "\" ",
        "stroke-width=\"", data_bar_stroke_width[1], "\" ",
        "fill=\"", "none", "\" ",
        ">",
        "</line>",
        circle_tags
      )

    # Redefine the `viewbox` in terms of the `data_x_width` value; this ensures
    # that the horizontal bars are centered about their extreme values
    viewbox <- paste(left_x, top_y, data_x_width, bottom_y, collapse = " ")
  }

  #
  # Generate zero line for bar plots
  #

  if (plot_type == "bar" && !single_horizontal_bar) {

    stroke <- "#BFBFBF"
    stroke_width <- 2

    zero_line_tags <-
      paste0(
        "<line ",
        "x1=\"", data_x_points[1] - 27.5, "\" ",
        "y1=\"", data_y0_point, "\" ",
        "x2=\"", data_x_points[length(data_x_points)] + 27.5, "\" ",
        "y2=\"", data_y0_point, "\" ",
        "stroke=\"", stroke, "\" ",
        "stroke-width=\"", stroke_width, "\" ",
        ">",
        "</line>"
      )
  }

  #
  # Generate reference line
  #

  if (show_ref_line) {

    stroke <- reference_line_color
    stroke_width <- 1
    stroke_dasharray <- "4 3"
    transform <- ""
    stroke_linecap <- "round"
    vector_effect <- "non-scaling-stroke"

    y_ref_line <-
      format_number_compactly(
        val = y_ref_line,
        currency = currency,
        as_integer = y_vals_integerlike,
        fn = y_ref_line_fmt_fn
      )

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
        "x2=\"", data_x_width + safe_x_d, "\" ",
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
        "x=\"", data_x_width + safe_x_d + 10, "\" ",
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

    fill <- reference_area_fill_color

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
  # Generate y-axis guide
  #

  if (show_y_axis_guide) {

    rect_tag <-
      paste0(
        "<rect ",
        "x=\"", left_x, "\" ",
        "y=\"", top_y, "\" ",
        "width=\"", safe_x_d + 15, "\" ",
        "height=\"", bottom_y, "\" ",
        "stroke=\"transparent\" ",
        "stroke-width=\"0\" ",
        "fill=\"transparent\"",
        ">",
        "</rect>"
      )

    if (rlang::is_integerish(y_scale_max) && rlang::is_integerish(y_scale_min)) {
      y_axis_guide_vals_integerlike <- TRUE
    } else {
      y_axis_guide_vals_integerlike <- FALSE
    }

    y_value_max_label <-
      format_number_compactly(
        y_scale_max,
        currency = currency,
        as_integer = y_axis_guide_vals_integerlike,
        fn = y_axis_fmt_fn
      )

    y_value_min_label <-
      format_number_compactly(
        y_scale_min,
        currency = currency,
        as_integer = y_axis_guide_vals_integerlike,
        fn = y_axis_fmt_fn
      )

    text_strings_min <-
      paste0(
        "<text ",
        "x=\"", left_x, "\" ",
        "y=\"", safe_y_d + data_y_height + safe_y_d - data_y_height / 25, "\" ",
        "fill=\"transparent\" ",
        "stroke=\"transparent\" ",
        "font-size=\"25\"",
        ">",
        y_value_min_label,
        "</text>"
      )

    text_strings_max <-
      paste0(
        "<text ",
        "x=\"", left_x, "\" ",
        "y=\"", safe_y_d + data_y_height / 25, "\" ",
        "fill=\"transparent\" ",
        "stroke=\"transparent\" ",
        "font-size=\"25\"",
        ">",
        y_value_max_label,
        "</text>"
      )

    g_y_axis_tags <-
      paste0(
        "<g class=\"y-axis-line\">\n",
        rect_tag, "\n",
        text_strings_max, "\n",
        text_strings_min,
        "</g>"
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

      y_value_i <-
        format_number_compactly(
          val = y_vals[i],
          currency = currency,
          as_integer = y_vals_integerlike,
          fn = y_val_fmt_fn
        )

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

  # Generate style tag for vertical guidelines and y-axis
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
          "cursor: default; ",
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
          ".horizontal-line:hover text { ",
          "stroke: white; ",
          "fill: #212427; ",
          "} ",
          ".horizontal-line:hover rect { ",
          "fill: transparent; ",
          "stroke: transparent; ",
          "color: blue; ",
          "} ",
          ".boxplot-line:hover text { ",
          "stroke: white; ",
          "fill: #212427; ",
          "} ",
          ".boxplot-line:hover rect { ",
          "fill: transparent; ",
          "stroke: transparent; ",
          "} ",
          ".horizontal-line", ifelse(interactive_data_values, ":hover", ""), " text { ",
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
          "} ",
          ".y-axis-line:hover rect { ",
          "fill: #EDEDED; ",
          "fill-opacity: 60%; ",
          "stroke: #FFFFFF60; ",
          "color: red; ",
          "} ",
          ".y-axis-line:hover text { ",
          "stroke: white; ",
          "stroke-width: 0.20em; ",
          "fill: #1A1C1F; ",
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
          "stroke=\"", data_area_fill_color, "\" ",
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

  if (
    plot_type == "line" &&
    show_data_area
  ) {

    area_path_tags <- c()

    for (i in seq_len(n_segments)) {

      area_x <- data_x_points[start_data_y_points[i]:end_data_y_points[i]]
      area_y <- data_y_points[start_data_y_points[i]:end_data_y_points[i]]

      area_path_string <- NULL # same as c()

      for (j in seq_along(area_x)) {

        area_path_j <- paste0(area_x[j], ",", area_y[j])
        area_path_string <- c(area_path_string, area_path_j)
      }

      area_path_i <-
        c(
          area_path_string,
          paste0(area_x[length(area_x)], ",", bottom_y - safe_y_d + data_point_radius),
          paste0(area_x[1L], ",", bottom_y - safe_y_d + data_point_radius)
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
        "<div>",
        "<svg ",
        "role=\"img\" ",
        paste0("viewBox=\"", viewbox, "\" "),
        "style=\"",
        paste0("height:", svg_height, ";"),
        "margin-left:auto;",
        "margin-right:auto;",
        "font-size:inherit;",
        "overflow:visible;",
        "vertical-align:middle;",
        "position:relative;\"",
        ">",
        svg_defs,
        svg_style,
        ref_area_tags,
        area_path_tags,
        data_path_tags,
        zero_line_tags,
        bar_tags,
        boxplot_tags,
        ref_line_tags,
        circle_tags,
        g_y_axis_tags,
        g_guide_tags,
        "</svg>",
        "</div>"
      ),
      collapse = "\n"
    )

  if (view) {
    htmltools::html_print(htmltools::HTML(svg))
  }

  svg
}

reference_line_keywords <- function() {
  c("mean", "median", "min", "max", "q1", "q3", "first", "last")
}

normalize_option_vector <- function(vec, num_y_vals) {

  if (length(vec) != 1L && length(vec) != num_y_vals) {
    cli::cli_abort("Every option must have either length 1 or `length(y_vals)`.")
  }

  if (length(vec) == 1L) vec <- rep(vec, num_y_vals)
  vec
}

normalize_vals <- function(x) {

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

normalize_to_list <- function(...) {

  value_list <- list(...)

  if (!rlang::is_named(value_list)) {
    cli::cli_abort("All vectors provided to `...` must be named.")
  }

  value_list_vec_nm <- gsub("\\d+", "", names(unlist(value_list)))
  value_list_unique_nm <- names(value_list)
  value_list_vec <- unlist(value_list)

  if (length(unique(value_list_vec)) == 1L) {
    value_list_vec <- jitter(value_list_vec, amount = 1 / 100000)
  }

  values_normalized <- normalize_vals(value_list_vec)

  for (i in seq_along(value_list_unique_nm)) {
    value_list[[value_list_unique_nm[i]]] <-
      values_normalized[value_list_vec_nm == value_list_unique_nm[i]]
  }

  value_list
}

get_extreme_value <- function(..., stat = c("max", "min")) {

  value_list <- list(...)

  stat <- rlang::arg_match0(stat, values = c("max", "min"))

  value_list_vec <- unlist(value_list)

  if (stat == "max") {
    extreme_val <- max(value_list_vec, na.rm = TRUE)
  } else {
    extreme_val <- min(value_list_vec, na.rm = TRUE)
  }

  extreme_val
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

  rlang::arg_match0(keyword, reference_line_keywords())

  ref_line <- switch(keyword,
    mean = mean(vals, na.rm = TRUE),
    median = stats::median(vals, na.rm = TRUE),
    min = min(vals, na.rm = TRUE),
    max = max(vals, na.rm = TRUE),
    first = vals[!is.na(vals)][1],
    last = vals[!is.na(vals)][length(vals[!is.na(vals)])],
    q1 = as.numeric(stats::quantile(vals, 0.25, na.rm = TRUE)),
    # default:
    as.numeric(stats::quantile(vals, 0.75, na.rm = TRUE))
  )

  ref_line
}

format_number_compactly <- function(
    val,
    currency = NULL,
    as_integer = FALSE,
    fn = NULL
) {

  if (!is.null(fn)) {
    return(fn(val))
  }

  if (is.na(val)) {
    return("NA")
  }

  if (val == 0) {
    return("0")
  }

  if (abs(val) < 0.01) {

    use_subunits <- TRUE
    decimals <- NULL

    n_sigfig <- 2
    suffixing <- FALSE

  } else if (abs(val) < 1) {

    use_subunits <- TRUE
    decimals <- NULL

    n_sigfig <- 2
    suffixing <- FALSE

  } else if (abs(val) < 100) {

    use_subunits <- TRUE
    decimals <- NULL

    n_sigfig <- 3
    suffixing <- FALSE

  } else if (abs(val) < 1000) {

    use_subunits <- TRUE
    decimals <- NULL

    n_sigfig <- 3
    suffixing <- FALSE

  } else if (abs(val) < 10000) {

    use_subunits <- FALSE
    decimals <- 2

    n_sigfig <- 3
    suffixing <- TRUE

  } else if (abs(val) < 100000) {

    use_subunits <- FALSE
    decimals <- 1

    n_sigfig <- 3
    suffixing <- TRUE

  } else if (abs(val) < 1000000) {

    use_subunits <- FALSE
    decimals <- 0

    n_sigfig <- 3
    suffixing <- TRUE

  } else if (abs(val) < 1e15) {

    use_subunits <- FALSE
    decimals <- 1

    n_sigfig <- 3
    suffixing <- TRUE

  } else {

    use_subunits <- FALSE
    decimals <- NULL
    n_sigfig <- 2
    suffixing <- FALSE
  }

  # Format value accordingly

  if (!is.null(currency)) {

    if (abs(val) >= 1e15) {

      val_formatted <-
        vec_fmt_currency(
          1e15,
          currency = currency,
          use_subunits = FALSE,
          decimals = 0,
          suffixing = TRUE,
          output = "html"
        )

      val_formatted <- paste0(">", val_formatted)

    } else {

      val_formatted <-
        vec_fmt_currency(
          val,
          currency = currency,
          use_subunits = use_subunits,
          decimals = decimals,
          suffixing = suffixing,
          output = "html"
        )
    }

  } else {

    if (abs(val) < 0.01 || abs(val) >= 1e15) {

      val_formatted <-
        vec_fmt_scientific(
          val,
          exp_style = "E",
          n_sigfig = n_sigfig,
          decimals = 1,
          output = "html"
        )

    } else {

      if (as_integer && val > -100 && val < 100) {

        val_formatted <-
          vec_fmt_integer(
            val,
            output = "html"
          )

      } else {

        val_formatted <-
          vec_fmt_number(
            val,
            n_sigfig = n_sigfig,
            decimals = 1,
            suffixing = suffixing,
            output = "html"
          )
      }
    }
  }

  val_formatted
}

process_number_stream <- function(number_stream) {

  number_stream <- gsub("[;,]", " ", number_stream)
  number_stream <- gsub("\\[|\\]", " ", number_stream)
  number_stream <- sub("^\\s+|\\s+$", "", number_stream)
  number_stream <- unlist(strsplit(number_stream, split = "\\s+"))
  number_stream <- gsub("[\\(\\)a-dA-Df-zF-Z]", "", number_stream)
  number_stream <- as.numeric(number_stream)
  number_stream
}

process_time_stream <- function(time_stream) {

  time_stream <- unlist(strsplit(time_stream, split = "\\s*[;,]\\s*"))
  time_stream <- gsub("T", " ", time_stream, fixed = TRUE)

  time_stream_vals <- as.POSIXct(time_stream, tz = "UTC")
  time_stream_vals <- as.numeric(time_stream_vals)

  names(time_stream_vals) <- time_stream
  time_stream_vals
}
