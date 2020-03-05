#' Set data cell colors using a palette or a color function
#'
#' It's possible to add color to data cells according to their values. The
#' `data_color()` function colors all rows of any `columns` supplied. There are
#' two ways to define how cells are colored: (1) through the use of a supplied
#' color palette, and (2) through use of a color mapping function available from
#' the **scales** package. The first method colorizes cell data according to
#' whether values are character or numeric. The second method provides more
#' control over how cells are colored since we provide an explicit color
#' function and thus other requirements such as bin counts, cut points, or a
#' numeric domain. Finally, we can choose whether to apply the cell-specific
#' colors to either the cell background or the cell text.
#'
#' The `col_*()` color mapping functions from the scales package can be used in
#' the `colors` argument. These functions map data values (`numeric` or
#' `factor`/`character`) to colors according to the provided palette.
#'
#' \itemize{
#' \item [scales::col_numeric()]: provides a simple linear mapping from
#' continuous numeric data to an interpolated palette.
#' \item [scales::col_bin()]: provides a mapping of continuous numeric data to
#' value-based bins. This internally uses the [base::cut()] function.
#' \item [scales::col_quantile()]: provides a mapping of continuous
#' numeric data to quantiles. This internally uses the
#' [stats::quantile()] function.
#' \item [scales::col_factor()]: provides a mapping of factors to colors. If the
#' palette is discrete and has a different number of colors than the number of
#' factors, interpolation is used.
#' }
#'
#' By default, **gt** will choose the ideal text color (for maximal contrast)
#' when colorizing the background of data cells. This option can be disabled by
#' setting `autocolor_text` to `FALSE`.
#'
#' Choosing the right color palette can often be difficult because it's both
#' hard to discover suitable palettes and then obtain the vector of colors. To
#' make this process easier we can elect to use the **paletteer** package,
#' which makes a wide range of palettes from various R packages readily
#' available. The [info_paletteer()] information table allows us to easily
#' inspect all of the discrete color palettes available in **paletteer**. We
#' only then need to specify the `package` and `palette` when calling the
#' [paletteer::paletteer_d()] function, and, we get the palette as a vector of
#' hexadecimal colors.
#'
#' @inheritParams fmt_number
#' @param columns The columns wherein changes to cell data colors should occur.
#' @param colors Either a color mapping function from the **scales** package or
#'   a vector of colors to use for each distinct value or level in each of the
#'   provided `columns`. The color mapping functions are:
#'   [scales::col_quantile()], [scales::col_bin()], [scales::col_numeric()], and
#'   [scales::col_factor()]. If providing a vector of colors as a palette, each
#'   color value provided must either be a color name (in the set of colors
#'   provided by [grDevices::colors()]) or a hexadecimal string in the form of
#'   "#RRGGBB" or "#RRGGBBAA".
#' @param alpha An optional, fixed alpha transparency value that will be applied
#'   to all of the `colors` provided (regardless of whether a color palette was
#'   directly supplied or generated through a color mapping function).
#' @param apply_to Which style element should the colors be applied to? Options
#'   include the cell background (the default, given as `fill`) or the cell
#'   text (`text`).
#' @param autocolor_text An option to let **gt** modify the coloring of text
#'   within cells undergoing background coloring. This will in some cases yield
#'   more optimal text-to-background color contrast. By default, this is set to
#'   `TRUE`.
#'
#' @return An object of class `gt_tbl`.
#'
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
#'     sold = dplyr::n(),
#'     income = sum(price)
#'   ) %>%
#'   gt(rowname_col = "size") %>%
#'   data_color(
#'     columns = vars(sold, income),
#'     colors = scales::col_numeric(
#'       palette = paletteer::paletteer_d(
#'         palette = "ggsci::red_material"
#'         ) %>% as.character(),
#'       domain = NULL
#'       )
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_data_color_1.png}{options: width=100\%}}
#'
#' \if{html}{\figure{man_data_color_2.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-13
#'
#' @import rlang
#' @export
data_color <- function(data,
                       columns,
                       colors,
                       alpha = NULL,
                       apply_to = "fill",
                       autocolor_text = TRUE) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Get the internal data table
  data_tbl <- dt_data_get(data = data)

  # Collect the column names from `data_tbl`
  colnames <- names(data_tbl)

  # Resolution of columns as integer vectors providing the
  # positions of the matched variables
  columns <- rlang::enquo(columns)
  resolved_columns <- resolve_vars(var_expr = !!columns, data = data)

  for (column in resolved_columns) {

    data_vals <- data_tbl[[column]]

    if (inherits(colors, "character")) {

      if (is.numeric(data_vals)) {

        color_fn <-
          scales::col_numeric(
            palette = colors,
            domain = data_vals,
            alpha = TRUE
          )

      } else if (is.character(data_vals) || is.factor(data_vals)) {

        # At the time of this writing, scales has a bug where palettes in the
        # form of colors (as opposed to functions or palette names) use
        # interpolation when the number of colors is greater than the number
        # of levels. Instead, colors should be subsetted. scales does the right
        # thing for palette names though, so we need to screen those cases out.
        if (length(colors) > 1) {
          nlvl <- if (is.factor(data_vals)) {
            nlevels(data_vals)
          } else {
            nlevels(factor(data_vals))
          }
          if (length(colors) > nlvl) {
            colors <- colors[seq_len(nlvl)]
          }
        }

        color_fn <-
          scales::col_factor(
            palette = colors,
            domain = data_vals,
            alpha = TRUE
          )
      } else {

        stop("Don't know how to map colors to a column of class ", class(data_vals)[1], ".",
             call. = FALSE)
      }

    } else if (inherits(colors, "function")) {
      color_fn <- colors

    } else {
      stop("The `colors` arg must be either a character vector of colors or a function", call. = FALSE)
    }

    color_fn <- rlang::enquo(color_fn)
    color_fn <- rlang::eval_tidy(color_fn, data_tbl)

    # Evaluate the color function with the data values
    color_vals <- color_fn(data_vals)

    # Process the color values, combining with a
    # fixed alpha value if necessary
    color_vals <- html_color(colors = color_vals, alpha = alpha)

    for (i in seq_along(data_vals)) {

      color <- color_vals[i]

      if (apply_to == "fill") {

        # Apply color value to the background of the cell
        data <-
          scale_apply_styles(
            data,
            column = column,
            apply_to = apply_to,
            styles = list(list(color = color)),
            rows_i = i
          )

      } else if (apply_to == "text") {

        # Apply color value to the text within the cell
        data <-
          scale_apply_styles(
            data,
            column = column,
            apply_to = apply_to,
            styles = list(list(color = color)),
            rows_i = i
          )
      }

      # If the `autocolor_text` option is TRUE then the coloring
      # of text will be modified to achieve the highest contrast
      # possible
      if (apply_to == "fill" & autocolor_text) {

        # Apply the `ideal_fgnd_color()` function to
        # the background color value to obtain a suitable
        # text color
        color_text <- ideal_fgnd_color(bgnd_color = color)

        # Apply color value to the text of the cell
        data <-
          scale_apply_styles(
            data,
            column = column,
            apply_to = "text",
            styles = list(list(color = color_text)),
            rows_i = i
          )
      }
    }
  }

  data
}

#' Apply color scale styles to the gt table data
#'
#' @noRd
scale_apply_styles <- function(data,
                               column,
                               apply_to,
                               styles,
                               rows_i = NULL) {

  data_tbl <- dt_data_get(data = data)

  if (is.null(rows_i)) {
    rows_i <- seq(nrow(data_tbl))
  }

  if (length(styles) != length(rows_i)) {

    stop("The lengths of `styles` (", length(styles),
         ") and of `rows_i` (", length(rows_i), ") must be equal.",
         call. = FALSE)
  }

  for (i in seq_along(rows_i)) {

    if (apply_to == "fill") {

      data <-
        data %>%
        tab_style(
          do.call(cell_fill, styles[[i]]),
          cells_body(
            columns = column,
            rows = rows_i[[i]]
          )
        )

    } else if (apply_to == "text") {

      data <-
        data %>%
        tab_style(
          do.call(cell_text, styles[[i]]),
          cells_body(
            columns = column,
            rows = rows_i[[i]]
          )
        )
    }
  }

  data
}

#' Are color values in rgba() format?
#'
#' The input for this is a character vector that should contain color strings.
#' While users won't directly supply colors in rgba() format, the `html_color()`
#' function can produce these types of color values and this utility function is
#' used in `rgba_to_hex()` to help convert colors *back* to hexadecimal
#' (ultimately for the `ideal_fgnd_color()` function). The output of
#' `is_rgba_col()` is a vector of logical values (the same length as the input
#' `colors` vector).
#'
#' @noRd
is_rgba_col <- function(colors) {

  grepl("^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$", colors)
}

#' For a background color, which foreground color provides better contrast?
#'
#' The input for this function is a single color value in rgba() format. The
#' output is a single color value in #RRGGBB hexadecimal format
#'
#' @noRd
ideal_fgnd_color <- function(bgnd_color,
                             light = "#FFFFFF",
                             dark = "#000000") {

  # Normalize color to hexadecimal color if it is in the rgba() string format
  bgnd_color <- rgba_to_hex(colors = bgnd_color)

  # Normalize color to a #RRGGBB (stripping the alpha channel)
  bgnd_color <- html_color(colors = bgnd_color, alpha = 1)

  # Determine the ideal color for the chosen background color
  yiq_contrasted_threshold <- 128
  colors <- grDevices::col2rgb(bgnd_color)
  score <- colSums(colors * c(299, 587, 144)) / 1000
  ifelse(score >= yiq_contrasted_threshold, dark, light)
}

#' Convert colors in mixed formats (incl. rgba() strings) format to hexadecimal
#'
#' This function will accept colors in mixed formats and convert any in the
#' rgba() string format (e.g., "`rgba(255,170,0,0.5)`") to a hexadecimal format
#' the preserves the alpha information (#RRGGBBAA). This function is required
#' for the `ideal_fgnd_color()` function.
#'
#' @noRd
rgba_to_hex <- function(colors) {

  colors_vec <- rep(NA_character_, length(colors))

  colors_rgba <- is_rgba_col(colors = colors)

  colors_vec[!colors_rgba] <- colors[!colors_rgba]

  color_matrix <-
    colors[colors_rgba] %>%
    gsub(pattern = "(rgba\\(|\\))", replacement = "", x = .) %>%
    strsplit(",") %>%
    unlist() %>%
    as.numeric() %>%
    matrix(
      ., ncol = 4,
      dimnames = list(c(), c("r", "g", "b", "alpha")),
      byrow = TRUE
    )

  alpha <- color_matrix[, "alpha"] %>% unname()

  # Convert color matrix to hexadecimal colors in the #RRGGBBAA format
  colors_to_hex <-
    grDevices::rgb(
      red = color_matrix[, "r"] / 255,
      green = color_matrix[, "g"] / 255,
      blue = color_matrix[, "b"] / 255,
      alpha = alpha
    )

  colors_vec[colors_rgba] <- colors_to_hex

  colors_vec
}

#' With a vector of input colors return normalized color strings
#'
#' Input colors can be color names (e.g., `"green"`, `"steelblue"`, etc.) or
#' colors in hexadecimal format with or without an alpha component (either
#' #RRGGBB or #RRGGBBAA). Output is the same length vector as the
#' input but it will contain a mixture of either #RRGGBB colors (if the input
#' alpha value for a color is 1) or rgba() string format colors (if the input
#' alpha value for a color is not 1).
#'
#' @noRd
html_color <- function(colors, alpha = NULL) {

  # Stop function if there are any NA values in `colors`
  if (any(is.na(colors))) {
    stop("No values supplied in `colors` should be NA")
  }

  # Utility function for creating rgba() color values
  # from an RGBA color matrix (already subsetted to those
  # rows where alpha < 1)
  col_matrix_to_rgba <- function(color_matrix) {

    paste0(
      "rgba(",
      color_matrix[, "red"], ",",
      color_matrix[, "green"], ",",
      color_matrix[, "blue"], ",",
      round(color_matrix[, "alpha"], 2),
      ")"
    )
  }

  # Create a color matrix with an `alpha` column
  color_matrix <- t(grDevices::col2rgb(col = colors, alpha = TRUE))
  color_matrix[, "alpha"] <- color_matrix[, "alpha"] / 255

  # If `alpha` has a value, replace all pre-existing
  # alpha values in the color matrix with `alpha`
  if (!is.null(alpha)) {
    color_matrix[, "alpha"] <- alpha
  }

  # Generate a vector for the finalized HTML color values
  colors_html <- rep(NA_character_, nrow(color_matrix))

  # Determine which of the input colors have an alpha of `1`
  colors_alpha_1 <- color_matrix[, "alpha"] == 1

  # Generate #RRGGBB color values for `colors_html`
  colors_html[colors_alpha_1] <-
    grDevices::rgb(
      red = color_matrix[colors_alpha_1, "red", drop = FALSE] / 255,
      green = color_matrix[colors_alpha_1, "green", drop = FALSE] / 255,
      blue = color_matrix[colors_alpha_1, "blue", drop = FALSE] / 255
    )

  # Generate rgba() color values for `colors_html`
  colors_html[!colors_alpha_1] <-
    color_matrix[!colors_alpha_1, , drop = FALSE] %>%
    col_matrix_to_rgba()

  colors_html
}
