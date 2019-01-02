#' Set data cell colors using a palette or a color function
#'
#' It's possible to add color to data cells according to their values. The
#' \code{data_color()} function colors all rows of any \code{columns} supplied.
#' There are two ways to define how cells are colored: (1) through the use of a
#' supplied color palette, and (2) through use of a color mapping function
#' available from the \code{scales} package. The first method colorizes cell
#' data according to whether values are character or numeric. The second method
#' provides more control over how cells are colored since we provide an explicit
#' color function and thus other requirements such as bin counts, cut points, or
#' a numeric domain. Finally, we can choose whether to apply the cell-specific
#' colors to either the cell background or the cell text.
#'
#' The \code{col_*()} functions from the scales package can be used in the
#' \code{colors} argument. These functions map data values (\code{numeric} or
#' \code{factor}/\code{character}) to colors according to the provided palette.
#'
#' \itemize{
#' \item \code{\link[scales]{col_numeric}()}: provides a simple linear mapping
#' from continuous numeric data to an interpolated palette.
#' \item \code{\link[scales]{col_bin}()}: provides a mapping of continuous
#' numeric data to value-based bins. This internally uses the
#' \code{\link[base]{cut}()} function.
#' \item \code{\link[scales]{col_quantile}()}: provides a mapping of continuous
#' numeric data to quantiles. This internally uses the
#' \code{\link[stats]{quantile}()} function.
#' \item \code{\link[scales]{col_factor}()}: provides a mapping of factors to
#' colors. If the palette is discrete and has a different number of colors than
#' the number of factors, interpolation is used.
#' }
#'
#' By default, \pkg{gt} will choose the ideal text color (for maximal contrast)
#' when colorizing the background of data cells. This option can be disabled by
#' setting \code{autocolor_text} to \code{FALSE}.
#'
#' Choosing the right color palette can often be difficult because it's both
#' hard to discover suitable palettes and then obtain the vector of colors. To
#' make this process easier we can elect to use the \pkg{paletteer} package,
#' which makes a wide range of palettes from various R packages readily
#' available. The \code{\link{info_paletteer}()} information table allows us to
#' easily inspect all of the discrete color palettes available in
#' \pkg{paletteer}. We only then need to specify the \code{package} and
#' \code{palette} when calling the \code{paletteer::paletteer_d()} function,
#' and, we get the palette as a vector of hexadecimal colors.
#'
#' @inheritParams fmt_number
#' @param columns the columns wherein changes to cell data colors should occur.
#' @param colors either a color mapping function from the \code{scales} package
#'   or a vector of colors to use for each distinct value or level in each of
#'   the provided \code{columns}. The color mapping functions are:
#'   \code{scales::col_quantile()}, \code{scales::col_bin()},
#'   \code{scales::col_numeric()}, and \code{scales::col_factor()}. If providing
#'   a vector of colors as a palette, each color value provided must either be a
#'   color name (in the set of colors provided by \code{grDevices::colors()}) or
#'   a hexadecimal string in the form of "#RRGGBB" or "#RRGGBBAA".
#' @param alpha an optional, fixed alpha transparency value that will be applied
#'   to all of the \code{colors} provided if they are provided as a vector of
#'   colors. If using a colorizing helper function for \code{colors} then this
#'   option is ignored (each of the colorizing helper functions has its own
#'   \code{alpha} argument).
#' @param apply_to which style element should the colors be applied to? Options
#'   include the cell background (the default, given as \code{bkgd}) or the cell
#'   text (\code{text}).
#' @param autocolor_text an option to let \pkg{gt} modify the coloring of text
#'   within cells undergoing background coloring. This will in some cases yield
#'   more optimal text-to-background color contrast. By default, this is set to
#'   \code{TRUE}.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # library(paletteer)
#'
#' # Use `countrypops` to create a gt table;
#' # Apply a color scale to the `population`
#' # column with `scales::col_numeric`,
#' # four supplied colors, and a domain
#' tab_1 <-
#'   countrypops %>%
#'   dplyr::filter(country_name == "Mongolia") %>%
#'   dplyr::select(-contains("code")) %>%
#'   tail(10) %>%
#'   gt() %>%
#'   data_color(
#'     columns = vars(population),
#'     colors = scales::col_numeric(
#'       palette = c(
#'         "red", "orange", "green", "blue"),
#'       domain = c(0.2E7, 0.4E7))
#'   )
#'
#' # Use `pizzaplace` to create a gt table;
#' # Apply colors from the `red_material`
#' # palette (in the `ggsci` pkg but
#' # more easily gotten from the `paletteer`
#' # package, info at `info_paletteer()`) to
#' # to `sold` and `income` columns; setting
#' # the `domain` of `scales::col_numeric()`
#' # to `NULL` will use the bounds of the
#' # available data as the domain
#' tab_2 <-
#'   pizzaplace %>%
#'   dplyr::filter(
#'     type %in% c("chicken", "supreme")) %>%
#'   dplyr::group_by(type, size) %>%
#'   dplyr::summarize(
#'     sold = n(),
#'     income = sum(price)
#'   ) %>%
#'   gt(rowname_col = "size") %>%
#'   data_color(
#'     columns = vars(sold, income),
#'     colors = scales::col_numeric(
#'       palette = paletteer::paletteer_d(
#'         package = "ggsci",
#'         palette = "red_material"
#'         ),
#'       domain = NULL)
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_data_color_1.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_data_color_2.svg}{options: width=100\%}}
#'
#' @family data formatting functions
#' @import rlang
#' @importFrom scales col_numeric col_factor
#' @export
data_color <- function(data,
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
        color_fn <- scales::col_numeric(palette = colors, domain = domain)

      } else if (is.character(data_vals)) {

        domain <- unique(data_vals)
        color_fn <-
          scales::col_factor(
            palette = colors[seq(domain)],
            domain = domain)

      } else if (is.factor(data_vals)) {

        levels <- unique(levels(data_vals))

        color_fn <-
          scales::col_factor(
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

  # TODO: this part should be vectorized, with `tab_style()`
  # taking a vector of style property values.
  for (i in seq_along(rows_i)) {

    data <-
      data %>%
      tab_style(
        do.call(cells_styles, styles[[i]]),
        cells_data(
          columns = column,
          rows = rows_i[[i]]))
  }

  data
}

#' Adjust the luminance for a palette of colors
#'
#' This function can brighten or darken a palette of colors by an arbitrary
#' number of steps, which is defined by a real number between -2.0 and 2.0. The
#' transformation of a palette by a fixed step in this function will tend to
#' apply greater darkening or lightening for those colors in the midrange
#' compared to any very dark or very light colors in the input palette.
#'
#' This function can be useful when combined with the \code{\link{data_color}()}
#' function's \code{palette} argument, which can use a vector of colors or any
#' of the \code{col_*} functions from the \pkg{scales} package (all of which
#' have a \code{palette} argument).
#'
#' @param colors a vector of colors that will undergo an adjustment in
#'   luminance. Each color value provided must either be a color name (in the
#'   set of colors provided by \code{grDevices::colors()}) or a hexadecimal
#'   string in the form of "#RRGGBB" or "#RRGGBBAA".
#' @param steps a positive or negative factor by which the luminance will be
#'   adjusted. Must be a number between \code{-2.0} and \code{2.0}.
#' @examples
#' # Get a palette of 8 pastel colors from
#' # the RColorBrewer package
#' pal <- RColorBrewer::brewer.pal(8, "Pastel2")
#'
#' # Create lighter and darker variants
#' # of the base palette (one step lower, one
#' # step higher)
#' pal_darker  <- pal %>% adjust_luminance(-1.0)
#' pal_lighter <- pal %>% adjust_luminance(+1.0)
#'
#' # Create a tibble and make a gt table from it;
#' # color each column in order of increasingly
#' # darker palettes (with `data_color()`)
#' tab_1 <-
#'   dplyr::tibble(a = 1:8, b = 1:8, c = 1:8) %>%
#'   gt() %>%
#'   data_color(
#'     columns = vars(a),
#'     colors = scales::col_numeric(
#'       palette = pal_lighter, domain = c(1, 8))
#'   ) %>%
#'   data_color(
#'     columns = vars(b),
#'     colors = scales::col_numeric(
#'       palette = pal, domain = c(1, 8))
#'   ) %>%
#'   data_color(
#'     columns = vars(c),
#'     colors = scales::col_numeric(
#'       palette = pal_darker, domain = c(1, 8))
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_adjust_luminance_1.svg}{options: width=100\%}}
#'
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
