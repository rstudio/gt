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
#'   include the cell background (the default, given as `"fill"`) or the cell
#'   text (`"text"`).
#' @param autocolor_text An option to let **gt** modify the coloring of text
#'   within cells undergoing background coloring. This will in some cases yield
#'   more optimal text-to-background color contrast. By default, this is set to
#'   `TRUE`.
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
#' @family Format Data
#' @section Function ID:
#' 3-21
#'
#' @import rlang
#' @export
data_color <- function(
    data,
    columns,
    colors,
    alpha = NULL,
    apply_to = c("fill", "text"),
    autocolor_text = TRUE
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Get the correct `apply_to` value
  apply_to <- match.arg(apply_to)

  colors <- rlang::enquo(colors)

  # Get the internal data table
  data_tbl <- dt_data_get(data = data)

  # Evaluate `colors` with `eval_tidy()` (supports quosures)
  colors <- rlang::eval_tidy(colors, data_tbl)

  # Collect the column names from `data_tbl`
  colnames <- names(data_tbl)

  # Resolution of `columns` as column names in the table
  resolved_columns <- resolve_cols_c(expr = {{ columns }}, data = data)

  # Get the sequence of row indices for the table
  rows <- seq_len(nrow(data_tbl))

  data_color_styles_tbl <-
    dplyr::tibble(
      locname = character(0), grpname = character(0), colname = character(0),
      locnum = numeric(0), rownum = integer(0), colnum = integer(0), styles = list()
    )

  for (column in resolved_columns) {

    data_vals <- data_tbl[[column]][rows]

    if (inherits(colors, "character")) {

      if (is.numeric(data_vals)) {

        # Create a color function based on `scales::col_numeric()`
        color_fn <- scales::col_numeric(palette = colors, domain = data_vals, alpha = TRUE)

      } else if (is.character(data_vals) || is.factor(data_vals)) {

        # At the time of this writing, scales has a bug where palettes in the
        # form of colors (as opposed to functions or palette names) use
        # interpolation when the number of colors is greater than the number
        # of levels. Instead, colors should be subsetted. scales does the right
        # thing for palette names though, so we need to screen those cases out.
        if (length(colors) > 1) {

          nlvl <-
            if (is.factor(data_vals)) {
              nlevels(data_vals)
            } else {
              nlevels(factor(data_vals))
            }

          if (length(colors) > nlvl) {
            colors <- colors[seq_len(nlvl)]
          }
        }

        # Create a color function based on `scales::col_factor()`
        color_fn <-
          scales::col_factor(palette = colors, domain = data_vals, alpha = TRUE)

      } else {

        cli::cli_abort(
          "Don't know how to map colors to a column of class {class(data_vals)[1]}."
        )
      }

    } else if (inherits(colors, "function")) {

      # If a color function is directly provided, use as is
      color_fn <- colors

    } else {

      cli::cli_abort(
        "The `colors` arg must be either a character vector of colors or a function."
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
          column = column, rows = rows,
          color_styles = color_styles
        )
      )

    if (apply_to == "fill" && autocolor_text) {

      color_vals <- ideal_fgnd_color(bgnd_color = color_vals)

      color_styles <- lapply(color_vals, FUN = function(x) cell_text(color = x))

      data_color_styles_tbl <-
        dplyr::bind_rows(
          data_color_styles_tbl,
          generate_data_color_styles_tbl(
            column = column, rows = rows,
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

generate_data_color_styles_tbl <- function(column, rows, color_styles) {

  dplyr::tibble(
    locname = "data", grpname = NA_character_,
    colname = column, locnum = 5, rownum = rows,
    styles = color_styles
  )
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
    dark = "#000000"
) {

  # Normalize color to hexadecimal color if it is in the 'rgba()' string format
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
#' 'rgba()' string format (e.g., "`rgba(255,170,0,0.5)`") to a hexadecimal
#' format that preserves the alpha information (#RRGGBBAA). This function is
#' required for the `ideal_fgnd_color()` function.
#'
#' @noRd
rgba_to_hex <- function(colors) {

  colors_vec <- rep(NA_character_, length(colors))

  colors_rgba <- is_rgba_col(colors = colors)

  colors_vec[!colors_rgba] <- colors[!colors_rgba]

  rgba_str <- gsub(pattern = "(rgba\\(|\\))", replacement = "", x = colors[colors_rgba])

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

  color_values <-
    stats::setNames(
      color_values,
      tolower(color_tbl_subset[["color_name"]])
    )

  color_values
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
