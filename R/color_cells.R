#' Set data cell colors using a helper function
#' @inheritParams fmt_number
#' @param columns the columns wherein changes to cell data colors
#'   should occur.
#' @param colors a vector of colors to use for each of the provided
#'   \code{values}. Each color value provided must either be a color name (in
#'   the set of colors provided by \code{grDevices::colors()}) or hexadecimal
#'   strings in the form of "#RRGGBB" or "#RRGGBBAA".
#' @import rlang
#' @export
cols_color_scale <- function(data,
                             columns,
                             colors,
                             handle_text = TRUE) {

  data_df <- attr(data, "data_df", exact = TRUE)

  if (!inherits(colors, "list")) {
    colors <- list(colors)
  }

  if (!inherits(columns, "list")) {
    columns <- list(columns)
  }

  # The `colors` and `columns` lists should be of equal length; stop the function
  # if this isn't the case
  if (length(colors) != length(columns)) {
    stop("The lengths of `colors` and `columns` should be equal to each other.",
         call. = FALSE)
  }

  for (i in seq(colors)) {

    columns_i <- columns[[i]]
    colors_i <- colors[[i]]

    # If `columns_i` inherits from `quosures` (which any bare column names enclosed
    # `vars()` will), extract the column names as a vector
    if (inherits(columns_i, "quosures")) {

      columns_i <-
        lapply(columns_i, function(x) {
          rlang::get_expr(x) %>% as.character()
        }) %>%
        unlist() %>%
        unname()
    }

    if (inherits(colors_i, "character")) {

      # TODO: verify that the colors are valid


      for (j in seq(columns_i)) {

        # Obtain the column name
        column_ij <- columns_i[j]

        # Get a unique set of data values for this column
        data_vals_j <- data_df[[column_ij]] %>% unique()

        # Stop function if number of colors supplied is less than the
        # number of unique data values
        if (length(colors_i) < length(data_vals_j)) {
          stop("The number of `colors` supplied (", length(colors_i), ") is less than ",
               "the number of unique data values in column `", column_ij, "` (",
               length(data_vals_j), ").", call. = FALSE)
        }

        # Trim vector of colors to match the length of the unique values
        colors_i <- colors_i[seq(length(data_vals_j))]

        # Apply color values to each of the data cells in the column
        data <-
          cols_color_manual(
            data,
            column = column_ij,
            values = data_vals_j,
            colors = colors_i,
            alpha = 1,
            na_color = "#808080")
      }

    } else {

      color_fn <- rlang::enquo(colors_i)
      color_fn <- rlang::eval_tidy(color_fn, data_df)

      for (j in seq(columns_i)) {

        column_ij <- columns_i[j]

        data_vals_j <- data_df[[column_ij]]

        for (k in seq(data_vals_j)) {

          color <- color_fn(data_vals_j[k])

          data <-
            scale_apply_styles(
              data,
              column = column_ij,
              styles = list(list(bkgd_color = color)), rows_i = k)
        }
      }

    }

  }

  data
}

#' Colorizing helper function that colors by quantile
#' @param palette the colors or color function that values will be mapped to.
#' @param domain the possible values that should be mapped.
#' @param n the number of equally-sized quantiles to use for color binning. The
#'   \code{probs} argument can be used in lieu of \code{n} for more control over
#'   quartiles.
#' @param probs a numeric vector of probabilities. If provided, \code{n} is
#'   ignored.
#' @param na_color the default color for cells where data isn't mapped.
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
#' @importFrom scales viridis_pal col_bin
#' @export
color_bin <- function(palette,
                      domain = NULL,
                      bins = 7,
                      pretty = TRUE,
                      na_color = "#808080") {

  if (missing(palette)) {
    palette <- scales::viridis_pal()(n)
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

#' Set data cell colors using an explicit mapping of colors/values
#' @inheritParams fmt_number
#' @inheritParams cols_color_scale
#' @param values the cell values to which the background \code{colors} should be
#'   applied. The length of \code{values} must match that of \code{colors} since
#'   they are considered to be one-to-one mappings of value to color for the
#'   target \code{column}.
#' @param alpha a fixed alpha transparency value that will be applied to all of
#'   the \code{colors} provided.
#' @param na_color the default color for any unmapped data cells in the target
#'   \code{column}.
#' @return an object of class \code{gt_tbl}.
#' @import checkmate
#' @export
cols_color_manual <- function(data,
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

#' Set data cell colors as a gradient with provided colors and breaks
#' @inheritParams fmt_number
#' @inheritParams cols_color_scale
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
cols_color_gradient_n <- function(data,
                                  column,
                                  colors,
                                  breaks,
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
        styles = list(list(bkgd_color = color)), rows_i = i)
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

#' Lighten a palette of colors by a fixed factor
#' @param colors a vector of colors that is to be lightened.
#' @param factor the factor to which the colors will be lightened.
#' @importFrom grDevices rgb
#' @export
lighten_palette <- function(colors,
                            factor = 1.5){

  colors_light <- c()

  for (color in colors) {

    colors_light <-
      c(
        colors_light,
        grDevices::rgb(
          t(
            as.matrix(
              apply(grDevices::col2rgb(color) * factor,
                    1,
                    function(x) if (x > 255) 255 else x))),
          maxColorValue = 255)
      )
  }
  colors_light
}

#' Darken a palette of colors by a fixed factor
#' @param colors a vector of colors that is to be darkened.
#' @param factor the factor to which the colors will be darkened.
#' @importFrom grDevices rgb
#' @export
darken_palette <- function(colors,
                           factor = 1.5){

  colors_dark <- c()

  for (color in colors) {

    colors_dark <-
      c(
        colors_dark,
        grDevices::rgb(
          t(
            as.matrix(
              apply(grDevices::col2rgb(color) / factor,
                    1,
                    function(x) if (x > 255) 255 else x))),
          maxColorValue = 255)
      )
  }
  colors_dark
}

# Function for determining the best `light` and `dark` colors to appear above a
# background color
#' @importFrom grDevices col2rgb
#' @importFrom dplyr as_tibble mutate pull
#' @noRd
text_color_for_bkgd <- function(colors_vec,
                                light = "#FFFFFFFF",
                                dark = "#000000FF") {

  yiq_contrasted_threshold <- 128

  grDevices::col2rgb(colors_vec) %>%
    t() %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(yiq = ((red * 299) + (green * 587) + (blue * 114)) / 1000) %>%
    dplyr::mutate(text_col = ifelse(yiq >= yiq_contrasted_threshold, light, dark)) %>%
    dplyr::pull(text_col)
}
