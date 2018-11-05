#' Set data cell colors using a palette or a colorizing helper function
#' @inheritParams fmt_number
#' @param columns the columns wherein changes to cell data colors should occur.
#' @param colors either a colorizing helper function or a vector of colors to
#'   use for each distinct value in each of the provided \code{columns}. The
#'   colorizing helper functions are: \code{\link{color_quantile}()},
#'   \code{\link{color_bin}()}, \code{\link{color_numeric}()}, and
#'   \code{\link{color_factor}()}. Details for the helper functions are provided
#'   in their respective help files. If providing a vector of colors as a
#'   palette, each color value provided must either be a color name (in the set
#'   of colors provided by \code{grDevices::colors()}) or hexadecimal strings in
#'   the form of "#RRGGBB" or "#RRGGBBAA".
#' @param alpha an optional, fixed alpha transparency value that will be applied
#'   to all of the \code{colors} provided if they are provided as a vector of
#'   colors. If using a colorizing helper function for \code{colors} then this
#'   option is ignored (each of the colorizing helper functions has its own
#'   \code{alpha} argument).
#' @param apply_to which style element should the colors be applied to? Options
#'   include the cell background (the default, given as \code{bkgd}) or the cell
#'   text (\code{text}).
#' @param autocolor_text an option to let gt modify the coloring of text within
#'   cells undergoing background coloring. This will in some cases yield more
#'   optimal text-to-background color contrast. By default, this is set to
#'   \code{TRUE}.
#' @import rlang
#' @export
cols_color_scale <- function(data,
                             columns,
                             colors,
                             alpha = NULL,
                             apply_to = "bkgd",
                             autocolor_text = TRUE) {

  # Extract `data_df` from the gt object
  data_df <- attr(data, "data_df", exact = TRUE)

  # If `columns` inherits from `quosures` (which any bare column names enclosed
  # `vars()` will), extract the column names as a vector
  if (inherits(columns, "quosures")) {

    columns <-
      lapply(columns, function(x) {
        rlang::get_expr(x) %>% as.character()
      }) %>%
      unlist() %>%
      unname()
  }

  if (inherits(colors, "character")) {

    for (column in columns) {

      # Get a unique set of data values for this column
      data_vals_j <- data_df[[column]] %>% unique()

      # Stop function if number of colors supplied is less than the
      # number of unique data values
      if (length(colors) < length(data_vals_j)) {
        stop("The number of `colors` supplied (", length(colors), ") is less than ",
             "the number of unique data values in column `", column, "` (",
             length(data_vals_j), ").", call. = FALSE)
      }

      # Trim vector of colors to match the length of the unique values
      colors <- colors[seq(length(data_vals_j))]

      # Apply color values to the correct element
      # of each of the data cells in the column
      data <-
        cols_color_manual(
          data,
          columns = column,
          values = data_vals_j,
          colors = colors,
          apply_to = apply_to,
          alpha = alpha,
          na_color = "#808080")

      # If the `autocolor_text` option is TRUE then the coloring
      # of text will be modified to achieve the highest contrast
      # possible
      if (apply_to == "bkgd" & autocolor_text) {

        # Apply the `ideal_fgnd_color()` function to the
        # vector of background color values to obtain a
        # vector of suitable text colors
        colors <- ideal_fgnd_color(colors)

        # Apply color values to the text of each
        # of the data cells in the column
        data <-
          cols_color_manual(
            data,
            columns = column,
            values = data_vals_j,
            colors = colors,
            apply_to = "text",
            alpha = NULL,
            na_color = "#808080")
      }
    }

  } else {

    color_fn <- rlang::enquo(colors)
    color_fn <- rlang::eval_tidy(color_fn, data_df)

    for (column in columns) {

      data_vals_j <- data_df[[column]]

      for (k in seq(data_vals_j)) {

        # Apply the colorizing function to the data value
        # to obtain a cell color
        color <- color_fn(data_vals_j[k])

        if (apply_to == "bkgd") {

          # Apply color value to the background of the cell
          data <-
            scale_apply_styles(
              data,
              column = column,
              styles = list(list(bkgd_color = color)), rows_i = k)

        } else if (apply_to == "text") {

          # Apply color value to the text within the cell
          data <-
            scale_apply_styles(
              data,
              column = column,
              styles = list(list(text_color = color)), rows_i = k)
        }

        # If the `autocolor_text` option is TRUE then the coloring
        # of text will be modified to achieve the highest contrast
        # possible
        if (apply_to == "bkgd" & autocolor_text) {

          # Apply the `ideal_fgnd_color()` function to
          # the background color value to obtain a suitable
          # text color
          color_text <- ideal_fgnd_color(color)

          # Apply color value to the text of the cell
          data <-
            scale_apply_styles(
              data,
              column = column,
              styles = list(list(text_color = color_text)), rows_i = k)
        }
      }
    }
  }

  data
}

#' Colorizing helper function that colors by quantile
#' @param palette the colors that values will be mapped to.
#' @param domain the possible range of values that should be mapped to colors.
#' @param n the number of equally-sized quantiles to use for color binning. The
#'   \code{probs} argument can be used in lieu of \code{n} for more control over
#'   the quantiles.
#' @param probs a numeric vector of probabilities. If provided, \code{n} is
#'   ignored.
#' @param na_color the default color for cells where data isn't mapped.
#' @family colorizing helper functions
#' @importFrom scales viridis_pal col_quantile
#' @export
color_quantile <- function(palette,
                           domain = NULL,
                           n = 4,
                           probs = seq(0, 1, length.out = n + 1),
                           na_color = "#808080") {

  if (missing(palette)) {
    palette <- scales::viridis_pal()(n)
  }

  scales::col_quantile(
    palette = palette,
    domain = domain,
    n = n,
    probs = probs,
    na.color = na_color)
}

#' Colorizing helper function that colors by bin membership
#' @param palette the colors or color function that values will be mapped to.
#' @param domain the possible values that should be mapped.
#' @param bins either a numeric vector of two or more unique cut points, or, a
#'   single number (>= 2) giving the number of intervals into which the
#'   \code{domain} values are to be cut.
#' @param pretty an option for whether to create pretty breaks based on the
#'   specified number of \code{bins}. By default, this is set to \code{TRUE}.
#' @param na_color the default color for cells where data isn't mapped.
#' @family colorizing helper functions
#' @importFrom scales viridis_pal col_bin
#' @export
color_bin <- function(palette,
                      domain = NULL,
                      bins = 7,
                      pretty = TRUE,
                      na_color = "#808080") {

  if (missing(palette)) {
    palette <- scales::viridis_pal()(bins)
  }

  scales::col_bin(
    palette = palette,
    domain = domain,
    bins = bins,
    pretty = pretty,
    na.color = na_color)
}

#' Colorizing helper function that linearly colors continuous data
#' @param palette the colors or color function that values will be mapped to.
#' @param domain the possible values that should be mapped.
#' @param na_color the default color for cells where data isn't mapped.
#' @family colorizing helper functions
#' @importFrom scales viridis_pal col_numeric
#' @export
color_numeric <- function(palette,
                          domain = NULL,
                          na_color = "#808080") {

  if (missing(palette)) {
    palette <- scales::viridis_pal()(10)
  }

  scales::col_numeric(
    palette = palette,
    domain = domain,
    na.color = na_color)
}

#' Colorizing helper function that colors according to factor levels
#' @param palette the colors or color function that values will be mapped to.
#' @param domain the possible values that should be mapped.
#' @param levels levels
#' @param ordered ordered
#' @param na_color the default color for cells where data isn't mapped.
#' @family colorizing helper functions
#' @importFrom scales viridis_pal col_factor
#' @export
color_factor <- function(palette,
                         domain = NULL,
                         levels = NULL,
                         ordered = FALSE,
                         na_color = "#808080") {

  if (missing(palette)) {
    palette <- scales::viridis_pal()(10)
  }

  scales::col_factor(
    palette = palette,
    domain = domain,
    levels = levels,
    ordered = ordered,
    na.color = na_color)
}

#' Set data cell colors with an explicit mapping of colors to values
#' @inheritParams fmt_number
#' @inheritParams cols_color_scale
#' @param values the cell values to which the colors should be applied. The
#'   length of \code{values} must match that of \code{colors} since they are
#'   considered to be one-to-one mappings of value to color for the target
#'   \code{column}.
#' @param colors a vector of colors for mapping to the values provided in
#'   \code{values}. Each color value provided must either be a color name (in
#'   the set of colors provided by \code{grDevices::colors()}) or a hexadecimal
#'   string in the form of "#RRGGBB" or "#RRGGBBAA".
#' @param alpha an optional, fixed alpha transparency value that will be applied
#'   to all of the \code{colors} provided.
#' @param na_color the default color for any unmapped data cells in the target
#'   \code{column}.
#' @return an object of class \code{gt_tbl}.
#' @import checkmate
#' @export
cols_color_manual <- function(data,
                              columns,
                              values,
                              colors,
                              alpha = NULL,
                              na_color = "#808080",
                              apply_to = "bkgd",
                              autocolor_text = TRUE) {

  # Perform check for `values`
  checkmate::assert_vector(
    values, min.len = 1, any.missing = FALSE,
    null.ok = FALSE, unique = TRUE)

  # Perform check for `colors`
  checkmate::assert_character(
    colors, min.len = 1, len = length(values),
    any.missing = FALSE, null.ok = FALSE)

  # Extract `data_df` from the gt object
  data_df <- attr(data, "data_df", exact = TRUE)

  # If `columns` inherits from `quosures` (which any bare column names enclosed
  # `vars()` will), extract the column names as a vector
  if (inherits(columns, "quosures")) {

    columns <-
      lapply(columns, function(x) {
        rlang::get_expr(x) %>% as.character()
      }) %>%
      unlist() %>%
      unname()
  }

  # Optionally pass all colors provided to `color_alpha()` to
  # apply a common transparency values to the set
  if (!is.null(alpha)) {

    colors <- color_alpha(colors, alpha = alpha)
    na_color <- color_alpha(colors = na_color, alpha = alpha)
  }

  for (column in columns) {

    # Get the data values from the column
    data_vals <- data_df[[column]]

    for (i in seq_along(data_vals)) {

      data_val <- data_vals[i]

      values_pos <- which(values == data_val)

      if (length(values_pos) > 0) {
        color <- colors[values_pos]
      } else {
        color <- na_color
      }

      if (apply_to == "bkgd") {

        data <-
          scale_apply_styles(
            data, column,
            styles = list(list(bkgd_color = color)),
            rows_i = i)

        if (autocolor_text) {

          # Apply the `ideal_fgnd_color()` function to the single
          # background color value to obtain a suitable text color
          color <- ideal_fgnd_color(color)

          # Apply the color value to the text of the
          # target data cell
          data <-
            scale_apply_styles(
              data, column,
              styles = list(list(text_color = color)),
              rows_i = i)
        }

      } else if (apply_to == "text") {

        data <-
          scale_apply_styles(
            data, column,
            styles = list(list(text_color = color)),
            rows_i = i)
      }
    }
  }

  data
}

#' Set data cell colors as a gradient with provided colors and breaks
#' @inheritParams fmt_number
#' @inheritParams cols_color_scale
#' @inheritParams cols_color_manual
#' @param colors a vector of colors for interpolation according to the values
#'   provided in \code{breaks}. Each color value provided must either be a color
#'   name (in the set of colors provided by \code{grDevices::colors()}) or
#'   a hexadecimal string in the form of "#RRGGBB" or "#RRGGBBAA".
#' @param breaks numeric breaks that represent the transition points between the
#'   colors provided in \code{colors}.
#' @param alpha an optional, fixed alpha transparency value that will be applied
#'   to all of the \code{colors} provided.
#' @return an object of class \code{gt_tbl}.
#' @import checkmate
#' @importFrom scales cscale seq_gradient_pal
#' @export
cols_color_gradient_n <- function(data,
                                  columns,
                                  colors,
                                  breaks,
                                  alpha = NULL,
                                  na_color = "#808080") {

  # Perform check for `breaks`
  checkmate::assert_numeric(
    breaks, min.len = 2, any.missing = FALSE,
    null.ok = FALSE, unique = TRUE)

  # Perform check for `colors`
  checkmate::assert_character(
    colors, min.len = 1, len = length(breaks),
    any.missing = FALSE, null.ok = FALSE)

  # Extract `data_df` from the gt object
  data_df <- attr(data, "data_df", exact = TRUE)

  # If `columns` inherits from `quosures` (which any bare column names enclosed
  # `vars()` will), extract the column names as a vector
  if (inherits(columns, "quosures")) {

    columns <-
      lapply(columns, function(x) {
        rlang::get_expr(x) %>% as.character()
      }) %>%
      unlist() %>%
      unname()
  }

  # Optionally pass all colors provided to `color_alpha()` to
  # apply a common transparency values to the set
  if (!is.null(alpha)) {

    colors <- color_alpha(colors, alpha = alpha)
    na_color <- color_alpha(colors = na_color, alpha = alpha)
  }

  for (column in columns) {

    # Get the data values from the `column` chosen
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

        break_pos <-
          which(breaks[-length(breaks)] < data_val & breaks[-1] >= data_val)[1]

        color <-
          scales::cscale(
            x = c(data_val, breaks[break_pos], breaks[break_pos + 1]),
            palette = scales::seq_gradient_pal(
              colors[break_pos],
              colors[break_pos + 1]))[1]
      }

      data <-
        scale_apply_styles(
          data, column,
          styles = list(list(bkgd_color = color)),
          rows_i = i)
    }
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

# Transform named and hexadecimal colors to a hexadecimal
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

#' Adjust the luminance for a palette of colors
#' @param colors a vector of colors that will undergo an adjustment in
#'   luminance.
#' @param steps a positive or negative factor by which the luminance will be
#'   adjusted. Must be a number between \code{-2.0} and \code{2.0}.
#' @family colorizing helper functions
#' @importFrom grDevices col2rgb convertColor hcl
#' @export
adjust_luminance <- function(colors,
                             steps) {

  # Stop if steps is beyond an acceptable range
  if (steps > 2.0 | steps < -2.0) {
    stop("The value provided for `steps` (", steps, ") must be between `-2.0` and `+2.0`.",
         call. = FALSE)
  }

  # Get a matrix of values in the RGB color space
  rgb_matrix <- t(grDevices::col2rgb(colors)) / 255

  # Obtain the alpha values
  alpha <- get_alpha_vec(colors)

  # Get a matrix of values in the Luv color space
  luv_matrix <- grDevices::convertColor(rgb_matrix, "sRGB", "Luv")

  # Apply calculations to obtain values in the HCL color space
  h <- atan2(luv_matrix[, "v"], luv_matrix[, "u"]) * 180 / pi
  c <- sqrt(luv_matrix[, "u"]^2 + luv_matrix[, "v"]^2)
  l <- luv_matrix[, "L"]

  # Scale luminance to occupy [0, 1]
  y <- l / 100.

  # Obtain `x` positions of luminance values along a sigmoid function
  x <- log(-(y / (y - 1)))

  # Calculate new luminance values based on a fixed step-change in `x`
  y_2 <- 1 / (1 + exp(-(x + steps)))

  # Rescale new luminance values to [0, 100]
  l <- y_2 * 100.

  # Obtain hexadecimal colors from the modified HCL color values
  hcl_colors <- grDevices::hcl(h, c, l, alpha = NULL)

  # Apply alpha values to the hexadecimal colors
  hcl_colors <- paste0(hcl_colors, alpha)

  hcl_colors
}

# Extract a vector of alpha values for a vector of colors
get_alpha_vec <- function(colors) {

  alpha <- c()

  for (color in colors) {

    if (grepl("^#[0-9A-Fa-f]{6}$", color)) {
      alpha <- c(alpha, "FF")
    } else if (grepl("^#[0-9A-Fa-f]{8}$", color)) {
      alpha <- c(alpha, toupper(sub(".*(..)$", "\\1", color)))
    } else {
      alpha <- c(alpha, "FF")
    }
  }

  alpha
}

# Function for determining the best `light` and `dark` colors to appear above a
# background color
#' @importFrom grDevices col2rgb
#' @noRd
ideal_fgnd_color <- function(bgnd_colors,
                             light = "#FFFFFFFF",
                             dark = "#000000FF") {

  yiq_contrasted_threshold <- 128
  colors <- grDevices::col2rgb(bgnd_colors)
  score <- colSums(colors * c(299, 587, 144)) / 1000
  ifelse(score >= yiq_contrasted_threshold, dark, light)
}
