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
    color_2 = "white"
) {

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

  # Obtain relative luminance for `color_1` and `color_2`
  lum_1 <- get_relative_luminance(color_1)
  lum_2 <- get_relative_luminance(color_2)

  cbind(
    "normal"  = get_apca_ratio(txt = lum_1, bgrnd = lum_2),
    "reverse" = get_apca_ratio(txt = lum_2, bgrnd = lum_1)
  )
}

get_apca_ratio <- function(txt, bgrnd) {

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

get_relative_luminance <- function(col) {

  rgb <- t(grDevices::col2rgb(col)) / 255

  coef <- c(apca_coeffs$sRco, apca_coeffs$sGco, apca_coeffs$sBco)

  rgb[] <- rgb^apca_coeffs$mainTRC
  r_lum <- as.numeric(rgb %*% coef)
  clamp <- r_lum <= apca_coeffs$blkThrs
  r_lum[clamp] <-
    (apca_coeffs$blkThrs - r_lum[clamp])^apca_coeffs$blkClmp + r_lum[clamp]

  r_lum
}
