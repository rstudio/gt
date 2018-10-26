#' Set background data cell colors using provided colors
#' @inheritParams fmt_number
#' @param column the column wherein changes to cell data background colors
#'   should occur.
#' @param values the cell values to which the background \code{colors} should be
#'   applied. The length of \code{values} must match that of \code{colors} since
#'   they are considered to be one-to-one mappings of value to color for the
#'   target \code{column}.
#' @param colors a vector of colors to use for each of the provided
#'   \code{values}. Each color value provided must either be a color name (in
#'   the set of colors provided by \code{grDevices::colors()}) or hexadecimal
#'   strings in the form of "#RRGGBB" or "#RRGGBBAA".
#' @param alpha a fixed alpha transparency value that will be applied to all of
#'   the \code{colors} provided.
#' @param na_color the default color for any unmapped data cells in the target
#'   \code{column}.
#' @return an object of class \code{gt_tbl}.
#' @import checkmate
#' @export
bg_color_fill_manual <- function(data,
                                 column,
                                 values,
                                 colors,
                                 alpha = 1,
                                 na_color = "darkgrey") {

  # Perform check for `values`
  checkmate::assert_vector(
    values, min.len = 1, any.missing = FALSE,
    null.ok = FALSE, unique = TRUE)

  # Perform check for `colors`
  checkmate::assert_character(
    colors, min.len = 1, len = length(values),
    any.missing = FALSE, null.ok = FALSE)

  # Pass all colors provided to `color_alpha()` to
  # get hexadecimal colors with hex transparency
  colors <- color_alpha(colors, alpha = alpha)
  na_color <- color_alpha(colors = na_color, alpha = alpha)

  # Get the data values from the `column` chosen
  data_df <- attr(data, "data_df")
  data_vals <- data_df[[column]]

  for (i in seq_along(data_vals)) {

    data_val <- data_vals[i]

    values_pos <- which(values == data_val)

    if (length(values_pos) > 0) {
      color <- colors[values_pos]
    } else {
      color <- na_color
    }

    data <-
      scale_apply_styles(
        data, column, styles = list(list(bkgd_color = color)), rows_i = i)
  }

  data
}

#' Set background data cell colors using provided colors and breaks
#' @inheritParams fmt_number
#' @inheritParams bg_color_fill_manual
#' @param breaks numeric breaks that represent the transition points between the
#'   colors provided in \code{colors}.
#' @param colors a vector of colors interpolate between according to the value
#'   provided in \code{breaks}. Each color value provided must either be a color
#'   name (in the set of colors provided by \code{grDevices::colors()}) or
#'   hexadecimal strings in the form of "#RRGGBB" or "#RRGGBBAA".
#' @return an object of class \code{gt_tbl}.
#' @import checkmate
#' @importFrom scales cscale
#' @export
bg_color_gradient_n <- function(data,
                                column,
                                breaks,
                                colors,
                                alpha = 1,
                                na_color = "darkgrey") {

  # Perform check for `breaks`
  checkmate::assert_numeric(
    breaks, min.len = 2, any.missing = FALSE,
    null.ok = FALSE, unique = TRUE)

  # Perform check for `colors`
  checkmate::assert_character(
    colors, min.len = 1, len = length(breaks),
    any.missing = FALSE, null.ok = FALSE)

  # Pass all colors provided to `color_alpha()` to
  # get hexadecimal colors with hex transparency
  colors <- color_alpha(colors, alpha = alpha)
  na_color <- color_alpha(colors = na_color, alpha = alpha)

  # Get the data values from the `column` chosen
  data_df <- attr(data, "data_df")
  data_vals <- data_df[[column]]

  break_order <- order(breaks)

  breaks <- breaks[break_order]
  colors <- colors[break_order]

  for (i in seq_along(data_vals)) {

    data_val <- data_vals[i]

    if (is.na(data_val)) {
      color <- na_color
    } else if (data_val <= breaks[1]) {
      color <- colors[1]
    } else if (data_val >= breaks[length(breaks)]) {
      color <- colors[length(colors)]
    } else {

      break_pos <- which(breaks[-length(breaks)] < data_val & breaks[-1] >= data_val)[1]

      color <-
        scales::cscale(
          x = c(data_val, breaks[break_pos], breaks[break_pos + 1]),
          palette = scales::seq_gradient_pal(
            colors[break_pos],
            colors[break_pos + 1]))[1]
    }

    data <-
      scale_apply_styles(
        data, column, styles = list(list(bkgd_color = color)), rows_i = i)
  }

  data
}

# Apply color scale styles to the gt table data
scale_apply_styles <- function(data,
                               column,
                               styles,
                               rows_i) {

  data_df <- attr(data, "data_df")

  if (missing(rows_i)) {
    rows_i <- seq(nrow(data_df))
  }

  if (length(styles) != length(rows_i)) {

    stop("The lengths of `styles` (", length(styles),
         ") and of `rows_i` (", length(rows_i), ") must be equal.",
         call. = FALSE)
  }

  for (i in seq_along(rows_i)) {

    data <- data %>%
      tab_style(
        do.call(apply_styles, styles[[i]]),
        cells_data(
          columns = column,
          rows = rows_i[[i]]))
  }

  data
}

# Transform X11 and hexadecimal colors to a hexadecimal
# format that includes hex transparency
#' @importFrom grDevices rgb col2rgb
color_alpha <- function(colors,
                        alpha = 1) {

  if (!is.numeric(alpha) || alpha > 1 || alpha < 0) {
    stop("The value for `alpha` must be a number between `0` and `1`.",
         call. = FALSE)
  }

  colors <- grDevices::col2rgb(col = colors)

  grDevices::rgb(
    red = colors[1, ],
    green = colors[2, ],
    blue = colors[3, ],
    alpha = 255 * alpha,
    maxColorValue = 255)
}
