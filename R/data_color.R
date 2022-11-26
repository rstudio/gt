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
#' @param columns,rows The columns and rows to which cell data color operations
#'   are constrained.
#' @param direction Should the color computations be performed columnwise or
#'   rowwise? By default this is set with the `"column"` keyword and colors will
#'   be applied down columns. The alternative option with the `"row"` keyword
#'   ensures that color mapping will work across rows.
#' @param method A method for computing color based on the data within body
#'   cells. Can be `"auto"` (the default), `"numeric"`, `"bin"`, `"quantile"`,
#'   or `"factor"`.
#' @param palette A vector of color names, the name of an **RColorBrewer**
#'   palette, or the name of a **viridis** palette. If providing a vector of
#'   colors as a palette, each color value provided must either be a color name
#'   (in the set of colors provided by [grDevices::colors()]) or a hexadecimal
#'   string in the form of `"#RRGGBB"` or `"#RRGGBBAA"`.
#' @param domain The possible values that can be mapped. For the `"numeric"` and
#'   `"bin"` methods, this can be a numeric range specified with a length of two
#'   vector. Representative numeric data is needed for the `"quantile"` method
#'   and categorical data must be used for the `"factor"` method. If `NULL` (the
#'   default value), the values in each column or row (depending on `direction`)
#'   value will represent the domain.
#' @param bins For `method = "bin"` this can either be a numeric vector of two
#'   or more unique cut points, or, a single numeric value (greater than or
#'   equal to `2`) giving the number of intervals into which the domain values
#'   are to be cut. By default, this is `8`.
#' @param levels For `method = "factor"` this allows for an alternate way of
#'   specifying levels. If anything is provided here then any value supplied to
#'   `domain` will be ignored. This should be a character vector of unique
#'   values.
#' @param ordered For `method = "factor"`, setting this to `TRUE` means that the
#'   vector supplied to `domain` will be treated as being in the correct order
#'   if that vector needs to be coerced to a factor. By default, this is
#'   `FALSE`.
#' @param na_color The color to use for missing values. By default (with
#'   `na_color = NULL`) gray, `"#808080"`, will be used.
#' @param alpha An optional, fixed alpha transparency value that will be applied
#'   to all of the `colors` provided (regardless of whether a color palette was
#'   directly supplied or generated through a color mapping function).
#' @param reverse Should the colors computed operate in reverse order?
#'   If `TRUE` then colors that normally change from red to blue will change in
#'   the opposite direction. By default, this is `FALSE`.
#' @param fn A color mapping function from the **scales** package. The supported
#'   color mapping functions are: [scales::col_quantile()], [scales::col_bin()],
#'   [scales::col_numeric()], and [scales::col_factor()].
#' @param apply_to Which style element should the colors be applied to? Options
#'   include the cell background (the default, given as `"fill"`) or the cell
#'   text (`"text"`).
#' @param autocolor_text An option to let **gt** modify the coloring of text
#'   within cells undergoing background coloring. This will result in better
#'   text-to-background color contrast. By default, this is set to `TRUE`.
#' @param contrast_algo The color contrast algorithm to use when
#'   `autocolor_text = TRUE`. By default this is `"apca"` (Accessible Perceptual
#'   Contrast Algorithm) and the alternative to this is `"wcag"` (Web Content
#'   Accessibility Guidelines).
#' @param colors Deprecated. Use the `fn` argument instead to provide a
#'   **scales**-based color-mapping function. If providing a palette, use the
#'   `palette` argument.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use [`countrypops`] to create a **gt** table. Apply a color scale to the
#' `population` column with `scales::col_numeric`, four supplied colors, and a
#' domain.
#'
#' ```r
#' countrypops %>%
#'   dplyr::filter(country_name == "Mongolia") %>%
#'   dplyr::select(-contains("code")) %>%
#'   tail(10) %>%
#'   gt() %>%
#'   data_color(
#'     columns = population,
#'     colors = scales::col_numeric(
#'       palette = c("red", "orange", "green", "blue"),
#'       domain = c(0.2E7, 0.4E7)
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_data_color_1.png")`
#' }}
#'
#' Use [`pizzaplace`] to create a **gt** table. Apply colors from the
#' `"ggsci::red_material"` palette (it's in the **ggsci** R package but more
#' easily gotten from the **paletteer** package, info at [info_paletteer()]) to
#' to `sold` and `income` columns. Setting the `domain` of
#' `scales::col_numeric()` to `NULL` will use the bounds of the available data
#' as the domain.
#'
#' ```r
#' pizzaplace %>%
#'   dplyr::filter(type %in% c("chicken", "supreme")) %>%
#'   dplyr::group_by(type, size) %>%
#'   dplyr::summarize(
#'     sold = dplyr::n(),
#'     income = sum(price),
#'     .groups = "drop"
#'   ) %>%
#'   gt(
#'     rowname_col = "size",
#'     groupname_col = "type"
#'   ) %>%
#'   data_color(
#'     columns = c(sold, income),
#'     colors = scales::col_numeric(
#'       palette = paletteer::paletteer_d(
#'         palette = "ggsci::red_material"
#'       ) %>%
#'         as.character(),
#'       domain = NULL
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_data_color_2.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-23
#'
#' @import rlang
#' @export
data_color <- function(
    data,
    columns = everything(),
    rows = everything(),
    direction = c("column", "row"),
    method = c("auto", "numeric", "bin", "quantile", "factor"),
    palette = NULL,
    domain = NULL,
    bins = 8,
    levels = NULL,
    ordered = FALSE,
    na_color = NULL,
    alpha = NULL,
    reverse = FALSE,
    fn = NULL,
    apply_to = c("fill", "text"),
    autocolor_text = TRUE,
    contrast_algo = c("apca", "wcag"),
    colors = NULL
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Get the correct `direction` value
  direction <- rlang::arg_match(direction)

  # Get the correct `method` value
  method <- rlang::arg_match(method)

  # Get the correct `apply_to` value
  apply_to <- rlang::arg_match(apply_to)

  # Get the correct `contrast_algo` value
  contrast_algo <- rlang::arg_match(contrast_algo)

  # If no color is provided to `na_color`, use gray as a default
  if (is.null(na_color)) {
    na_color <- "#808080"
  }

  # Defuse any function supplied to `fn`; if function supplied to `colors`
  # (previous argument for this purpose) then let that take precent and
  # provide deprecation warning
  if (!is.null(colors)) {

    fn <- rlang::enquo(colors)

    if (is.character(rlang::eval_tidy(fn))) {

      palette <- rlang::eval_tidy(fn)
      fn <- NULL

      cli::cli_warn(c(
        "Since gt v0.9.0, the `colors` argument has been deprecated.",
        "*" = "Please use the `palette` argument to define a color palette."
      ))

    } else {

      cli::cli_warn(c(
        "Since gt v0.9.0, the `colors` argument has been deprecated.",
        "*" = "Please use the `fn` argument instead."
      ))
    }

  } else if (!is.null(fn)) {

    fn <- rlang::enquo(fn)

  } else {

    fn <- NULL
  }

  # Ensure that the `palette` contains something that can be used if no
  # function (as `fn`) was provided
  if (is.null(fn)) {

    # If no palette is provided, use the default palette
    if (is.null(palette)) {
      palette <- palette()
    }

    # TODO: Validate the `palette` value to ensure it works with
    # the scales functions it will be passed to
  }

  # Get the internal data table
  data_tbl <- dt_data_get(data = data)

  # Evaluate `colors` with `eval_tidy()` (supports quosures)
  fn <- rlang::eval_tidy(fn, data_tbl)

  # Resolution of `columns` as column names in the table
  resolved_columns <- resolve_cols_c(expr = {{ columns }}, data = data)

  # Resolution of `rows` as row indices in the table
  resolved_rows <- resolve_rows_i(expr = {{ rows }}, data = data)

  # Generate a table to accumulate all of the styles to be applied to the
  # body cells; in the end, this (along with all previously set styles) will
  # be used in a concluding `dt_styles_set()` call
  data_color_styles_tbl <-
    dplyr::tibble(
      locname = character(0),
      grpname = character(0),
      colname = character(0),
      locnum = numeric(0),
      rownum = integer(0),
      colnum = integer(0),
      styles = list()
    )

  # Obtain the total number of iterations depending on whether
  # `direction` is columnwise or rowwise
  if (direction == "column") {
    total_iterations <- seq_along(resolved_columns)
  } else {
    total_iterations <- seq_along(resolved_rows)
  }

  # Iteration is performed in a piecewise manner
  for (i in total_iterations) {

    if (direction == "column") {

      data_vals <- dplyr::pull(dplyr::select(data_tbl, dplyr::all_of(resolved_columns[i])))
      data_vals <- data_vals[resolved_rows]

    } else {

      data_vals <- dplyr::select(data_tbl, dplyr::all_of(resolved_columns))
      data_vals <- unname(unlist(as.vector(data_vals[resolved_rows[i], ])))
    }

    if (!is.null(fn)) {

      # If a color function is directly provided, use as is
      color_fn <- fn

    } else if (method == "auto") {

      # For the "auto" method, we are getting data values in a piecewise
      # fashion and the strategy is to generate a color function (using
      # a `col_*()` function from scales) for each piece of data; we can
      # process vectors that are numeric with `scales::col_numeric()` and
      # vectors that are either character or factor with `scales::col_factor()`

      if (is.numeric(data_vals)) {

        # Create a color function based on `scales::col_numeric()`
        color_fn <-
          scales::col_numeric(
            palette = palette,
            domain = if (is.null(domain)) data_vals else domain,
            na.color = na_color,
            alpha = TRUE,
            reverse = reverse
          )

      } else if (is.character(data_vals) || is.factor(data_vals)) {

        # At the time of this writing, scales has a bug where palettes in the
        # form of colors (as opposed to functions or palette names) use
        # interpolation when the number of colors is greater than the number
        # of levels. Instead, colors should be subsetted. scales does the right
        # thing for palette names though, so we need to screen those cases out.
        palette <-
          screen_palette_for_col_factor(
            palette = palette,
            data_vals = data_vals
          )

        # Create a color function based on `scales::col_factor()`
        color_fn <-
          scales::col_factor(
            palette = palette,
            domain = if (is.null(domain)) data_vals else domain,
            levels = levels,
            ordered = ordered,
            na.color = na_color,
            alpha = TRUE,
            reverse = reverse
          )
      }

    } else if (method == "numeric") {

      if (!is.numeric(data_vals) && direction == "row") {

        cli::cli_warn(c(
          "The \"numeric\" method with `direction == \"row\"` cannot be used
          when non-numeric columns are included.",
          "*" = "Either target a collection of numeric columns or use the
          \"factor\" method."
        ))

        return(data)
      }

      if (!is.numeric(data_vals)) next

      # Create a color function based on `scales::col_numeric()`
      color_fn <-
        scales::col_numeric(
          palette = palette,
          domain = if (is.null(domain)) data_vals else domain,
          na.color = na_color,
          alpha = TRUE,
          reverse = reverse
        )

    } else if (method == "bin") {

      if (!is.numeric(data_vals)) next

      # Create a color function based on `scales::col_bin()`
      color_fn <-
        scales::col_bin(
          palette = palette,
          domain = if (is.null(domain)) data_vals else domain,
          bins = bins,
          pretty = FALSE,
          na.color = na_color,
          alpha = TRUE,
          reverse = reverse,
          right = FALSE
        )

    } else if (method == "quantile") {

      if (!is.numeric(data_vals)) next

      # Create a color function based on `scales::col_quantile()`
      color_fn <-
        scales::col_quantile(
          palette = palette,
          domain = if (is.null(domain)) data_vals else domain,
          na.color = na_color,
          alpha = TRUE,
          reverse = reverse,
          right = FALSE
        )

    } else if (method == "factor") {

      palette <-
        screen_palette_for_col_factor(
          palette = palette,
          data_vals = data_vals
        )

      # Create a color function based on `scales::col_factor()`
      color_fn <-
        scales::col_factor(
          palette = palette,
          domain = if (is.null(domain)) data_vals else domain,
          levels = levels,
          ordered = ordered,
          na.color = na_color,
          alpha = TRUE,
          reverse = reverse
        )
    }

    # Evaluate `color_fn` with `eval_tidy()` (supports quosures)
    color_fn <- rlang::eval_tidy(color_fn, data_tbl)

    # Evaluate the color function with the data values
    color_vals <- color_fn(data_vals)

    # Process the color values, combining with a
    # fixed alpha value if necessary
    color_vals <- html_color(colors = color_vals, alpha = alpha)

    color_styles <-
      switch(
        apply_to,
        fill = lapply(color_vals, FUN = function(x) cell_fill(color = x)),
        text = lapply(color_vals, FUN = function(x) cell_text(color = x))
      )

    data_color_styles_tbl <-
      dplyr::bind_rows(
        data_color_styles_tbl,
        generate_data_color_styles_tbl(
          columns = if (direction == "column") resolved_columns[i] else resolved_columns,
          rows = if (direction == "column") resolved_rows else resolved_rows[i],
          color_styles = color_styles
        )
      )

    # We are to generate an extra set of styling if we are applying coloring
    # to the background fill and `autocolor_text = TRUE`. This styling applies
    # to the foreground text in the same cells. For each background fill color,
    # the ideal text color (either a light or dark color) will be determined
    # and styles based on `cell_text(color = ...)` will be generated and added
    # to the `data_color_styles_tbl`
    if (apply_to == "fill" && autocolor_text) {

      color_vals <-
        ideal_fgnd_color(
          bgnd_color = color_vals,
          algo = contrast_algo
        )

      color_styles <- lapply(color_vals, FUN = function(x) cell_text(color = x))

      data_color_styles_tbl <-
        dplyr::bind_rows(
          data_color_styles_tbl,
          generate_data_color_styles_tbl(
            columns = if (direction == "column") resolved_columns[i] else resolved_columns,
            rows = if (direction == "column") resolved_rows else resolved_rows[i],
            color_styles = color_styles
          )
        )
    }
  }

  dt_styles_set(
    data = data,
    styles = dplyr::bind_rows(dt_styles_get(data = data), data_color_styles_tbl)
  )
}

generate_data_color_styles_tbl <- function(columns, rows, color_styles) {

  dplyr::tibble(
    locname = "data",
    grpname = NA_character_,
    colname = columns,
    locnum = 5,
    rownum = rows,
    colnum = NA_integer_,
    styles = color_styles
  )
}

screen_palette_for_col_factor <- function(palette, data_vals) {

  if (length(palette) > 1) {

    nlvl <-
      if (is.factor(data_vals)) {
        nlevels(data_vals)
      } else {
        nlevels(factor(data_vals))
      }

    if (length(palette) > nlvl) {
      palette <- palette[seq_len(nlvl)]
    }
  }
  palette
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
#' @param colors A vector of color values.
#'
#' @noRd
is_rgba_col <- function(colors) {
  grepl("^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$", colors)
}

#' Are color values in hexadecimal format?
#'
#' This regex checks for valid hexadecimal colors in either the `#RRGGBB` and
#' `#RRGGBBAA` forms (not including shortened form `#RGB` here,
#' `is_short_hex()` handles this case).
#'
#' @param colors A vector of color values.
#'
#' @noRd
is_hex_col <- function(colors) {
  grepl("^#[0-9a-fA-F]{6}([0-9a-fA-F]{2})?$", colors)
}

#' Are color values in the shorthand hexadecimal format?
#'
#' This regex checks for valid hexadecimal colors in the `#RGB` or `#RGBA`
#' shorthand forms.
#'
#' @param colors A vector of color values.
#'
#' @noRd
is_short_hex <- function(colors) {
  grepl("^#[0-9a-fA-F]{3}([0-9a-fA-F])?$", colors)
}

#' Expand shorthand hexadecimal colors to the normal form
#'
#' This function takes a vector of colors in the `#RGB` or `#RGBA`
#' shorthand forms and transforms them to their respective normal forms
#' (`#RRGGBB` and `#RRGGBBAA`). This should only be used with a vector of
#' `#RGB`- and `#RGBA`-formatted color values; `is_short_hex()` should be used
#' beforehand to ensure that input `colors` vector conforms to this expectation.
#'
#' @param colors A vector of color values.
#'
#' @noRd
expand_short_hex <- function(colors) {
  gsub("^#(.)(.)(.)(.?)$", "#\\1\\1\\2\\2\\3\\3\\4\\4", toupper(colors))
}

#' For a background color, which foreground color provides better contrast?
#'
#' The input for this function is a single color value in 'rgba()' format. The
#' output is a single color value in #RRGGBB hexadecimal format
#'
#' @noRd
ideal_fgnd_color <- function(
    bgnd_color,
    light = "#FFFFFF",
    dark = "#000000",
    algo = c("apca", "wcag")
) {

  # Get the correct `algo` value
  algo <- rlang::arg_match(algo)

  # Normalize color to hexadecimal color if it is in the 'rgba()' string format
  bgnd_color <- rgba_to_hex(colors = bgnd_color)

  # Normalize color to a #RRGGBB (stripping the alpha channel)
  bgnd_color <- html_color(colors = bgnd_color, alpha = 1)

  if (algo == "apca") {

    # Determine the ideal color for the chosen background color with APCA
    contrast_dark <- get_contrast_ratio(color_1 = dark, color_2 = bgnd_color, algo = "apca")[, 1]
    contrast_light <- get_contrast_ratio(color_1 = light, color_2 = bgnd_color, algo = "apca")[, 1]

  } else {

    # Determine the ideal color for the chosen background color with WCAG
    contrast_dark <- get_contrast_ratio(color_1 = dark, color_2 = bgnd_color, algo = "wcag")
    contrast_light <- get_contrast_ratio(color_1 = light, color_2 = bgnd_color, algo = "wcag")
  }

  ifelse(abs(contrast_dark) >= abs(contrast_light), dark, light)
}

#' Convert colors in mixed formats (incl. rgba() strings) format to hexadecimal
#'
#' This function will accept colors in mixed formats and convert any in the
#' 'rgba()' string format (e.g., "`rgba(255,170,0,0.5)`") to a hexadecimal
#' format that preserves the alpha information (#RRGGBBAA). This function is
#' required for the `ideal_fgnd_color()` function.
#'
#' @noRd
rgba_to_hex <- function(colors) {

  colors_vec <- rep(NA_character_, length(colors))

  colors_rgba <- is_rgba_col(colors = colors)

  colors_vec[!colors_rgba] <- colors[!colors_rgba]

  rgba_str <- gsub("(rgba\\(|\\))", "", colors[colors_rgba])

  rgba_vec <- as.numeric(unlist(strsplit(rgba_str, ",")))

  color_matrix <-
    matrix(
      rgba_vec,
      ncol = 4,
      dimnames = list(c(), c("r", "g", "b", "alpha")),
      byrow = TRUE
    )

  alpha <- unname(color_matrix[, "alpha"])

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
#' alpha value for a color is 1) or 'rgba()' string format colors (if the input
#' alpha value for a color is not 1).
#'
#' @noRd
html_color <- function(colors, alpha = NULL) {

  # Stop function if there are any NA values in `colors`
  if (any(is.na(colors))) {

    cli::cli_abort("No values supplied in `colors` should be `NA`.")
  }

  is_rgba <- is_rgba_col(colors = colors)
  is_short_hex <- is_short_hex(colors = colors)

  # Expand any shorthand hexadecimal color values to the `RRGGBB` form
  colors[is_short_hex] <- expand_short_hex(colors = colors[is_short_hex])

  is_hex <- is_hex_col(colors = colors)

  # If not classified as RGBA or hexadecimal, assume other values are named
  # colors to be handled separately
  is_named <- !is_rgba & !is_hex

  colors[is_named] <- tolower(colors[is_named])

  named_colors <- colors[is_named]

  if (length(named_colors) > 0) {

    # Ensure that all color names are in the set of X11/R color
    # names or CSS color names
    check_named_colors(named_colors)

    # Translate the `transparent` color to #FFFFFF00 (white, transparent)
    named_colors[named_colors == "transparent"] <- "#FFFFFF00"

    # Translate any CSS exclusive colors to hexadecimal values;
    # there are nine CSS 3.0 named colors that don't belong to the
    # set of X11/R color names (not included numbered variants and
    # the numbered grays, those will be handled by `grDevices::col2rgb()`)
    is_css_excl_named <- colors %in% names(css_exclusive_colors())

    if (any(is_css_excl_named)) {

      # The `css_exclusive_colors()` function returns a named vector
      # of the CSS colors not in the X11/R set; the names are the hexadecimal
      # color values
      colors[is_css_excl_named] <-
        unname(css_exclusive_colors()[colors[is_css_excl_named]])
    }
  }

  # Normalize all non-'rgba()' color values and combine
  # with any preexisting 'rgba()' color values
  colors[!is_rgba] <-
    normalize_colors(
      colors = colors[!is_rgba],
      alpha = alpha
    )

  colors
}

# Utility function for creating 'rgba()' color values
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

# Utility function for generating hexadecimal or 'rgba()' colors (for IE11
# compatibility with colors having some transparency) from hexadecimal color
# values and X11/R color names
normalize_colors <- function(colors, alpha) {

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
    col_matrix_to_rgba(color_matrix[!colors_alpha_1, , drop = FALSE])

  colors_html
}

css_exclusive_colors <- function() {

  color_tbl_subset <- css_colors[!css_colors$is_x11_color, ]

  color_values <- color_tbl_subset[["hexadecimal"]]

  stats::setNames(
    color_values,
    tolower(color_tbl_subset[["color_name"]])
  )
}

valid_color_names <- function() {
  c(tolower(grDevices::colors()), names(css_exclusive_colors()), "transparent")
}

check_named_colors <- function(named_colors) {

  named_colors <- tolower(named_colors)

  if (!all(named_colors %in% valid_color_names())) {

    invalid_colors <- base::setdiff(unique(named_colors), valid_color_names())

    one_several_invalid <-
      ifelse(
        length(invalid_colors) > 1,
        "Several invalid color names were ",
        "An invalid color name was "
      )

    cli::cli_abort(c(
      "{one_several_invalid} used ({str_catalog(invalid_colors, conj = 'and')}).",
      "*" = "Only R/X11 color names and CSS 3.0 color names can be used."
    ))
  }
}
