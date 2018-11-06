#' Set data cell colors using a palette or a colorizing helper function
#' @inheritParams fmt_number
#' @param columns the columns wherein changes to cell data colors should occur.
#' @param colors either a color mapping function from the \code{scales} package
#'   or a vector of colors to use for each distinct value or level in each of
#'   the provided \code{columns}. The color mapping functions are:
#'   \code{col_quantile()}, \code{col_bin()}, \code{col_numeric()}, and
#'   \code{col_factor()}. If providing a vector of colors as a palette, each
#'   color value provided must either be a color name (in the set of colors
#'   provided by \code{grDevices::colors()}) or hexadecimal strings in the form
#'   of "#RRGGBB" or "#RRGGBBAA".
#' @param alpha an optional, fixed alpha transparency value that will be applied
#'   to all of the \code{colors} provided if they are provided as a vector of
#'   colors. If using a colorizing helper function for \code{colors} then this
#'   option is ignored (each of the colorizing helper functions has its own
#'   \code{alpha} argument).
#' @param apply_to which style element should the colors be applied to? Options
#'   include the cell background (the default, given as \code{bkgd}) or the cell
#'   text (\code{text}).
#' @param autocolor_text an option to let \code{gt} modify the coloring of text
#'   within cells undergoing background coloring. This will in some cases yield
#'   more optimal text-to-background color contrast. By default, this is set to
#'   \code{TRUE}.
#' @return an object of class \code{gt_tbl}.
#' @family column modification functions
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

  # Collect the column names and column indices
  # from `data_df`
  colnames <- names(data_df)

  #
  # Resolution of columns as integer vectors providing the
  # positions of the matched variables
  #
  columns <- rlang::enquo(columns)

  resolved_columns <-
    resolve_vars(var_expr = columns, var_names = colnames, data_df = data_df)

  # Translate the column indices to column names
  resolved_columns <- colnames[resolved_columns]

  for (column in resolved_columns) {

    data_vals <- data_df[[column]]

    if (inherits(colors, "character")) {

      if (is.numeric(data_vals)) {

        domain <- c(min(data_vals), max(data_vals))
        color_fn <- col_numeric(palette = colors, domain = domain)

      } else if (is.character(data_vals)) {

        domain <- unique(data_vals)
        color_fn <-
          col_factor(
            palette = colors[seq(domain)],
            domain = domain)

      } else if (is.factor(data_vals)) {

        levels <- unique(levels(data_vals))

        color_fn <-
          col_factor(
            palette = colors[seq(levels)],
            levels = levels(data_vals))
      }

    } else if (inherits(colors, "function")) {
      color_fn <- colors
    }

    color_fn <- rlang::enquo(color_fn)
    color_fn <- rlang::eval_tidy(color_fn, data_df)

    colors_cols <- color_fn(data_vals)

    for (i in seq(data_vals)) {

      color <- colors_cols[i]

      if (apply_to == "bkgd") {

        # Apply color value to the background of the cell
        data <-
          scale_apply_styles(
            data,
            column = column,
            styles = list(list(bkgd_color = color)),
            rows_i = i)

      } else if (apply_to == "text") {

        # Apply color value to the text within the cell
        data <-
          scale_apply_styles(
            data,
            column = column,
            styles = list(list(text_color = color)),
            rows_i = i)
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
            styles = list(list(text_color = color_text)),
            rows_i = i)
      }
    }
  }

  data
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
#'   \code{columns}.
#' @return an object of class \code{gt_tbl}.
#' @family column modification functions
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
#' @return an object of class \code{gt_tbl}.
#' @family column modification functions
#' @import checkmate
#' @importFrom scales cscale seq_gradient_pal
#' @export
cols_color_gradient_n <- function(data,
                                  columns,
                                  colors,
                                  breaks,
                                  alpha = NULL,
                                  na_color = "#808080",
                                  apply_to = "bkgd",
                                  autocolor_text = TRUE) {

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
