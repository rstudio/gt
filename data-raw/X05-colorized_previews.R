library(tidyverse)

colorized_previews_svg <-
  styles_colors_params %>%
  dplyr::select(color, style) %>%
  dplyr::mutate(file = paste0("style_", style, "_", color, ".svg")) %>%
  dplyr::pull(file) %>%
  vapply(
    FUN = function(x) readr::read_file(paste0("data-raw/colorized_previews/", x)), FUN.VALUE = character(1)
  )

preset_colorized_tbl <-
  styles_colors_params %>%
  dplyr::select(color, style) %>%
  dplyr::mutate(preview = colorized_previews_svg) %>%
  tidyr::pivot_wider(names_from = "color", values_from = "preview") %>%
  dplyr::select(style, blue, orange, aqua, pink, green, red, gray) %>%
  tidyr::unite(col = "preview", blue:gray, sep = " ")
