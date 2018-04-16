#' Apply the aesthetics available in \code{aesthetics_tbl}
#' to the \code{html_table}.
#' @param html_tbl the internal table called
#' \code{html_table}.
#' @param aesthetics_tbl the internal table called
#' \code{aesthetics}.
#' @importFrom dplyr filter pull
#' @noRd
use_html_aesthetics <- function(html_tbl, aesthetics_tbl) {

  # Apply theme if any theme setting is applied
  if ("theme" %in% aesthetics_tbl$type) {

    theme_name <-
      aesthetics_tbl %>%
      dplyr::filter(type == "theme") %>%
      dplyr::pull(options)

    if (theme_name[1] == "striped") {
      html_tbl <- htt_theme_striped(html_tbl = html_tbl)
    }

    if (theme_name[1] == "minimal") {
      html_tbl <- htt_theme_minimal(html_tbl = html_tbl)
    }

    if (theme_name[1] == "classical") {
      html_tbl <- htt_theme_classical(html_tbl = html_tbl)
    }
  }

  # Apply fonts if any such transformations are applied
  if ("apply_font" %in% aesthetics_tbl$type) {

    column <-
      aesthetics_tbl %>%
      dplyr::filter(type == "apply_font") %>%
      dplyr::pull(columns)

    type <-
      aesthetics_tbl %>%
      dplyr::filter(type == "apply_font") %>%
      dplyr::pull(types)

    font <-
      aesthetics_tbl %>%
      dplyr::filter(type == "apply_font") %>%
      dplyr::pull(font)

    for (i in seq(column)) {

      html_tbl <-
        htt_font(
          html_tbl = html_tbl,
          column = column[i],
          type = type[i],
          font = font[i])
    }
  }

  # Apply center alignment if any such transformations are applied
  if ("alignment_center" %in% aesthetics_tbl$type) {

    options <-
      aesthetics_tbl %>%
      dplyr::filter(type == "alignment_center") %>%
      dplyr::pull(options)

    html_tbl <-
      htt_alignment(
        html_tbl = html_tbl,
        transform = options[1],
        align_type = "center")
  }

  # Apply left alignment if any such transformations are applied
  if ("alignment_left" %in% aesthetics_tbl$type) {

    options <-
      aesthetics_tbl %>%
      dplyr::filter(type == "alignment_left") %>%
      dplyr::pull(options)

    html_tbl <-
      htt_alignment(
        html_tbl = html_tbl,
        transform = options[1],
        align_type = "left")
  }

  # Apply right alignment if any such transformations are applied
  if ("alignment_right" %in% aesthetics_tbl$type) {

    options <-
      aesthetics_tbl %>%
      dplyr::filter(type == "alignment_right") %>%
      dplyr::pull(options)

    html_tbl <-
      htt_alignment(
        html_tbl = html_tbl,
        transform = options[1],
        align_type = "right")
  }

  html_tbl
}
