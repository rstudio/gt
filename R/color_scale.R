
#' Set background data cell colors using provided colors
#' @export
#' @import checkmate
bg_color_fill_manual <- function(data,
                                 column,
                                 values,
                                 colors,
                                 na_color = "darkgrey") {

  checkmate::assert_vector(
    values, min.len = 1, any.missing = FALSE,
    null.ok = FALSE, unique = TRUE)

  checkmate::assert_character(
    colors, min.len = 1, len = length(values),
    any.missing = FALSE, null.ok = FALSE)

  # TODO: convert colors to hexadecimal (e.g., R color names)
  # TODO: ensure that alpha == TRUE when calling `col2rgb()`

  data_df <- attr(data, "data_df")

  data_vals <- data_df[[column]]

  # Create color map
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

#' Set background data cell colors using provided colors and breaks
#' @export
#' @import checkmate
bg_color_gradient_n <- function(data,
                                column,
                                breaks,
                                colors,
                                na_color = "darkgrey") {

  checkmate::assert_numeric(
    breaks, min.len = 2, any.missing = FALSE,
    null.ok = FALSE, unique = TRUE)

  checkmate::assert_character(
    colors, min.len = 1, len = length(breaks),
    any.missing = FALSE, null.ok = FALSE)

  # TODO: convert colors to hexadecimal (e.g., R color names)
  # TODO: ensure that alpha == TRUE when calling `col2rgb()`

  data_df <- attr(data, "data_df")

  break_order <- order(breaks)

  breaks <- breaks[break_order]
  colors <- colors[break_order]

  data_vals <- data_df[[column]]

  # Create color map
  for (i in seq_along(data_vals)) {

    data_val <- data_vals[i]

    if (is.na(data_val)) {
      color <- na_color
    } else if (data_val <= breaks[1]) {
      color <- colors[1]
    } else if (data_val >= breaks[length(breaks)]) {
      color <- colors[length(colors)]
    } else {

      break_pos <- which(breaks[-length(breaks)] < data_val & breaks[-1] >= data_val)[1]

      color <-
        scales::cscale(
          x = c(data_val, breaks[break_pos], breaks[break_pos + 1]),
          palette = scales::seq_gradient_pal(
            colors[break_pos],
            colors[break_pos + 1]))[1]
    }

    data <-
      scale_apply_styles(
        data, column, styles = list(list(bkgd_color = color)), rows_i = i)
  }

  data
}


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





