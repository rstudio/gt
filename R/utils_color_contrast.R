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
  algo <- rlang::arg_match0(algo, values = c("apca", "wcag"))

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

  rgb[] <- ifelse(rgb <= 0.04045, rgb / 12.92, ((rgb + 0.055) / 1.055)^2.4)

  as.numeric(rgb %*% coef)
}
