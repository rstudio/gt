library(tidyverse)
library(glue)
library(paletteer)

make_rects <- function(colors,
                       full_width = 400,
                       height = 30) {

  col_count <- length(colors)
  width_each <- full_width / col_count

  bound_vals <- (0:(col_count - 1) * width_each) + 1

  color_vec <- vector(mode = "character", length = length(colors))

  for (i in seq_along(colors)) {

    color_vec[i] <-
      glue::glue('    <rect id="color_{i}" fill="{colors[i]}" x="{bound_vals[i]}" y="1" width="{width_each}" height="30"></rect>') %>%
      as.character()
  }

  paste(color_vec, collapse = "\n")
}

make_color_strip_svg <- function(colors) {

  rects <- make_rects(colors)

  glue::glue(
    '<svg width="403px" height="32px" viewBox="0 0 403 32" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
  <defs>
    <rect id="path-1" x="1" y="1" width="400" height="30" rx="4"></rect>
  </defs>
  <g id="main" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
{rects}
    <g id="outer_rect">
      <rect stroke="#979797" stroke-width="1" x="1.5" y="1.5" width="399" height="29" rx="4"></rect>
      <rect stroke="#FFFFFF" stroke-width="2" x="0" y="0" width="402" height="32" rx="4"></rect>
    </g>
  </g>
</svg>
') %>% as.character()
}


get_d_palettes <- function(color_packages = c(
  "awtools", "dichromat", "dutchmasters", "ggsci", "ggpomological",
  "ggthemes", "ghibli", "grDevices", "jcolors", "LaCroixColoR",
  "NineteenEightyR", "nord", "ochRe", "palettetown", "pals",
  "Polychrome", "quickpalette","rcartocolor", "RColorBrewer",
  "Redmonder", "tidyquant", "wesanderson", "yarrr")) {

  palettes <-
    palettes_d_names %>%
    dplyr::filter(package %in% color_packages) %>%
    mutate(colors = "NA_character_")

  for (i in seq(nrow(palettes))) {

    color_strip <-
      palettes_d[[palettes[i, "package"]]][[palettes[i, "palette"]]] %>%
      make_color_strip_svg()

    palettes[i, "colors"] <- color_strip
  }

  palettes
}

palettes_strips <- get_d_palettes()

rm(get_d_palettes)
rm(make_color_strip_svg)
rm(make_rects)

