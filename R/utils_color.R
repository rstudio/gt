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
#  Copyright (c) 2018-2024 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


# data_color() helpers ---------------------------------------------------------
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
#' While users won't directly supply colors in rgba() format, `html_color()`
#' can produce these types of color values and this utility function is
#' used in `rgba_to_hex()` to help convert colors *back* to hexadecimal
#' (ultimately for `ideal_fgnd_color()`). The output of
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
      ncol = 4L,
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
html_color <- function(colors, alpha = NULL, call = rlang::caller_env()) {

  # Stop function if there are any NA values in `colors`
  if (anyNA(colors)) {
    cli::cli_abort("`colors` should not contain any `NA` values.", call = call)
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
    check_named_colors(named_colors, call = call)

    # Translate the `transparent` color to #FFFFFF00 (white, transparent)
    named_colors[named_colors == "transparent"] <- "#FFFFFF00"

    # Translate any CSS exclusive colors to hexadecimal values;
    # there are nine CSS 3.0 named colors that don't belong to the
    # set of X11/R color names (not included numbered variants and
    # the numbered grays, those will be handled by `grDevices::col2rgb()`)
    is_css_excl_named <- colors %in% names(css_exclusive_colors())

    if (any(is_css_excl_named)) {

      # `css_exclusive_colors()` returns a named vector
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

check_named_colors <- function(named_colors, call = rlang::caller_env()) {

  named_colors <- tolower(named_colors)

  if (!all(named_colors %in% valid_color_names())) {

    invalid_colors <- base::setdiff(unique(named_colors), valid_color_names())

    one_several_invalid <-
      ifelse(
        length(invalid_colors) > 1L,
        "Several invalid color names were ",
        "An invalid color name was "
      )

    cli::cli_abort(c(
      "{one_several_invalid} used ({str_catalog(invalid_colors, conj = 'and')}).",
      "*" = "Only R/X11 color names and CSS 3.0 color names can be used."
    ),
    call = call
    )
  }
}


# Color contrast helpers -------------------------------------------------------

# Functionality to parse color values and determine Lc contrast taken from
# the SAPC APCA (Accessible Perceptual Contrast Algorithm)
# Coefficient values current as of Beta 0.0.98G-4g (Oct 1, 2021)

apca_coeffs <-
  list(
    mainTRC = 2.4,
    sRco = 0.2126729,
    sGco = 0.7151522,
    sBco = 0.0721750,
    normBG = 0.56,
    normTXT = 0.57,
    revTXT = 0.62,
    revBG = 0.65,
    blkThrs = 0.022,
    blkClmp = 1.414,
    scaleBoW = 1.14,
    scaleWoB = 1.14,
    loBoWthresh = 0.035991,
    loBoWfactor = 27.7847239587675,
    loBoWoffset = 0.027,
    loClip = 0.001,
    deltaYmin = 0.0005
  )

get_contrast_ratio <- function(
    color_1 = "black",
    color_2 = "white",
    algo = c("apca", "wcag")
) {

  # Get the correct `algo` value
  algo <- rlang::arg_match(algo)

  if (length(color_1) < 1L || length(color_2) < 1L) {
    cli::cli_abort(
      "At least one color defined for each of `color_1` and `color_2`."
    )
  }

  # Perform recycling of colors
  n <- max(c(length(color_1), length(color_2)))
  if (!(length(color_1) == n && length(color_2) == n)) {
    color_1 <- rep_len(color_1, n)
    color_2 <- rep_len(color_2, n)
  }

  #
  # Obtain relative luminance for `color_1` and `color_2`
  #

  if (algo == "apca") {

    lum_1 <- get_relative_luminance_apca(col = color_1)
    lum_2 <- get_relative_luminance_apca(col = color_2)

    ratio <-
      cbind(
        "normal"  = get_ratio_apca(txt = lum_1, bgrnd = lum_2),
        "reverse" = get_ratio_apca(txt = lum_2, bgrnd = lum_1)
      )

  } else {

    lum_1 <- get_relative_luminance_wcag(col = color_1)
    lum_2 <- get_relative_luminance_wcag(col = color_2)

    ratio <- (lum_1 + 0.05) / (lum_2 + 0.05)
    ratio[ratio < 1] <- 1 / ratio[ratio < 1]
  }

  ratio
}

get_ratio_apca <- function(txt, bgrnd) {

  # Determine ratio for normal polarity
  ratio <- (bgrnd^apca_coeffs$normBG - txt^apca_coeffs$normTXT) * apca_coeffs$scaleBoW
  ratio <- ifelse(ratio < 0.1, 0, ratio - apca_coeffs$loBoWoffset)

  # Determine ratio for reverse polarity
  rev <- bgrnd <= txt
  ratio[rev] <- (bgrnd[rev]^apca_coeffs$revBG - txt[rev]^apca_coeffs$revTXT) * apca_coeffs$scaleWoB
  ratio[rev] <- ifelse(ratio[rev] > -0.1, 0, ratio[rev] + apca_coeffs$loBoWoffset)

  # If the luminance difference between background and text is
  # nearly the same, treat that as zero
  ratio[abs(bgrnd - txt) < apca_coeffs$deltaYmin] <- 0

  ratio * 100
}

get_relative_luminance_apca <- function(col) {

  rgb <- t(grDevices::col2rgb(col)) / 255

  coef <- c(apca_coeffs$sRco, apca_coeffs$sGco, apca_coeffs$sBco)

  rgb[] <- rgb^apca_coeffs$mainTRC
  r_lum <- as.numeric(rgb %*% coef)
  clamp <- r_lum <= apca_coeffs$blkThrs
  r_lum[clamp] <-
    (apca_coeffs$blkThrs - r_lum[clamp])^apca_coeffs$blkClmp + r_lum[clamp]

  r_lum
}

get_relative_luminance_wcag <- function(col) {

  rgb <- t(grDevices::col2rgb(col)) / 255

  coef <- round(c(apca_coeffs$sRco, apca_coeffs$sGco, apca_coeffs$sBco), 4)

  rgb[] <- ifelse(rgb <= 0.03928, rgb / 12.92, ((rgb + 0.055) / 1.055)^2.4)

  as.numeric(rgb %*% coef)
}
