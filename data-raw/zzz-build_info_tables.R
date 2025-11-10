library(tidyverse)
library(gt)
library(fontawesome)

#
# Build table for `info_flags()` -> `info_flags.rds`
#

flags_tbl_gt <-
  countrypops |>
  dplyr::select(country_name, country_code_2) |>
  dplyr::distinct() |>
  tibble::add_row(country_name = "European Union", country_code_2 = "EU") |>
  dplyr::arrange(country_code_2) |>
  dplyr::mutate(flag = country_code_2) |>
  gt() |>
  fmt_flag(columns = flag) |>
  cols_move_to_start(columns = flag) |>
  cols_label(
    flag = "",
    country_name = "Entity",
    country_code_2 = "Code"
  ) |>
  tab_style(
    style = list(
      cell_text(
        font = system_fonts(name = "monospace-code"),
        size = px(12)
      ),
      cell_borders(
        sides = c("l", "r"),
        color = "lightblue",
        weight = px(1.5))
    ),
    locations = cells_body(columns = country_name)
  ) |>
  tab_style(
    style = cell_text(
      font = system_fonts(name = "monospace-code"),
      size = px(12)
    ),
    locations = cells_body(columns = c(country_name, country_code_2))
  ) |>
  tab_style(
    style = css(position = "sticky", top = "-1em", `z-index` = 10),
    locations = cells_column_labels()
  ) |>
  tab_style(
    style = cell_fill(color = "white"),
    locations = cells_body(columns = flag)
  ) |>
  cols_align(align = "center", columns = flag) |>
  cols_width(
    flag ~ px(80),
    country_name ~ px(480),
    country_code_2 ~ px(240)
  ) |>
  opt_all_caps() |>
  opt_stylize(style = 6) |>
  tab_style(
    style = cell_text(size = px(24)),
    locations = cells_title(groups = "title")
  ) |>
  tab_style(
    style = cell_text(size = px(18)),
    locations = cells_title(groups = "subtitle")
  ) |>
  tab_options(
    table.border.top.style = "hidden",
    column_labels.border.bottom.style = "hidden",
    container.height = px(620)
  ) |>
  tab_header(
    title = md("Complete List of Flag Icons Usable in **gt**"),
    subtitle = md("Flags like these can be used with the `fmt_flag()` function.<br><br>")
  ) |>
  opt_align_table_header("left") |>
  opt_table_lines("none")

readr::write_rds(
  flags_tbl_gt,
  file = "inst/gt_tables/info_flags.rds",
  compress = "xz"
)

rm(flags_tbl_gt)

#
# Build table for `info_icons()` -> `info_icons.rds`
#

fa_icons_vec <- c()

for (i in seq_len(nrow(fontawesome:::fa_tbl))) {

  icon_svg_i <- as.character(fontawesome::fa(fontawesome:::fa_tbl[i, ][["full_name"]]))
  fa_icons_vec <- c(fa_icons_vec, icon_svg_i)
}

rm(i, icon_svg_i)

readr::write_rds(
  fa_icons_vec,
  file = "inst/gt_tables/fa_icons_vec.rds",
  compress = "xz"
)

rm(fa_icons_vec)

icons_tbl_gt <-
  fontawesome:::fa_tbl |>
  dplyr::select(icon = name, label, icon_name = name, full_name) |>
  dplyr::mutate(icon = readRDS(file = "inst/gt_tables/fa_icons_vec.rds")) |>
  gt() |>
  fmt_markdown(columns = icon) |>
  cols_label(icon = "") |>
  cols_label_with(fn = function(x) gsub("_", " ", x)) |>
  tab_style(
    style = list(
      cell_text(
        font = system_fonts(name = "monospace-code"),
        size = px(12)
      ),
      cell_borders(
        sides = c("l", "r"),
        color = "lightblue",
        weight = px(1.5))
    ),
    locations = cells_body(columns = -icon)
  ) |>
  tab_style(
    style = css(position = "sticky", top = "-1em", `z-index` = 10),
    locations = cells_column_labels()
  ) |>
  tab_style(
    style = cell_fill(color = "lightblue"),
    locations = cells_body(columns = icon)
  ) |>
  cols_align(align = "center", columns = icon) |>
  cols_width(
    icon ~ px(60),
    label ~ px(240),
    icon_name ~ px(240),
    full_name ~ px(260)
  ) |>
  opt_all_caps() |>
  opt_stylize(style = 6) |>
  tab_style(
    style = cell_text(size = px(24)),
    locations = cells_title(groups = "title")
  ) |>
  tab_style(
    style = cell_text(size = px(18)),
    locations = cells_title(groups = "subtitle")
  ) |>
  tab_options(
    table.border.top.style = "hidden",
    column_labels.border.bottom.style = "hidden",
    container.height = px(620)
  ) |>
  tab_header(
    title = md("Complete List of *Font Awesome* Icons Usable in **gt**"),
    subtitle = md("Icons like these can be used with the `fmt_icon()` function.<br><br>")
  ) |>
  opt_align_table_header("left") |>
  opt_table_lines("none")

readr::write_rds(
  icons_tbl_gt,
  file = "inst/gt_tables/info_icons.rds",
  compress = "xz"
)

rm(icons_tbl_gt)

#
# Build table for `info_google_fonts()` -> `info_google_fonts.rds`
#

# Recommended Fonts
recommended <-
  c(
    "Anonymous Pro",
    "Archivo Narrow",
    "Bio Rhyme",
    "Cabin",
    "Cardo",
    "Chivo",
    "Crimson Text",
    "Encode Sans",
    "Exo 2",
    "Fira Code",
    "Fira Sans",
    "IBM Plex Mono",
    "IBM Plex Sans",
    "Inconsolata",
    "Inter",
    "Karla",
    "Lato",
    "Libre Baskerville",
    "Libre Franklin",
    "Lora",
    "Merriweather",
    "Montserrat",
    "Mulish",
    "Open Sans",
    "Playfair Display",
    "Poppins",
    "Proza Libre",
    "PT Sans",
    "PT Serif",
    "Public Sans",
    "Raleway",
    "Roboto",
    "Rubik",
    "Source Sans Pro",
    "Source Serif Pro",
    "Space Mono",
    "Spectral",
    "Work Sans"
  )

styles_summary <-
  gt:::google_styles_tbl |>
  dplyr::mutate(weight = as.integer(weight)) |>
  dplyr::filter(name %in% recommended) |>
  dplyr::group_by(name, style) |>
  dplyr::summarize(min_weight = min(weight), max_weight = max(weight), .groups = "keep") |>
  dplyr::ungroup() |>
  dplyr::arrange(name, dplyr::desc(style)) |>
  dplyr::mutate(weight_range = dplyr::case_when(
    style == "normal" & min_weight != max_weight ~ paste0("n&nbsp;", min_weight, "&#8209;", max_weight),
    style == "normal" & min_weight == max_weight ~ paste0("n&nbsp;", min_weight),
    style == "italic" & min_weight != max_weight ~ paste0("*i*&nbsp;", min_weight, "&#8209;", max_weight),
    style == "italic" & min_weight == max_weight ~ paste0("*i*&nbsp;", min_weight)
  )) |>
  dplyr::group_by(name) |>
  dplyr::summarize(weight_ranges = paste(weight_range, collapse = "<br>"), .groups = "keep")

source_notes <-
  gt:::google_styles_tbl |>
  dplyr::filter(name %in% recommended) |>
  dplyr::distinct(name, copyright) |>
  dplyr::mutate(name = paste0("**", name, "** ")) |>
  dplyr::mutate(name_copy = paste0(name, copyright)) |>
  dplyr::pull(name_copy) |>
  paste(collapse = ". ")

source_notes <-
  gsub("..", ".", source_notes, fixed = TRUE) |>
  gt:::paste_right(".")

google_font_tbl_int <-
  gt:::google_font_tbl |>
  dplyr::filter(name %in% recommended) |>
  dplyr::left_join(styles_summary, by = "name") |>
  dplyr::mutate(
    category = tolower(category),
    category = gt:::str_title_case(category),
    category = gsub("_", " ", category, fixed = TRUE),
    category = gsub("serif", "Serif", category, fixed = TRUE)
  ) |>
  dplyr::select(-license, -date_added, -designer) |>
  dplyr::mutate(samp = paste0(LETTERS[1:13], letters[1:13], collapse = ""))

google_font_tbl_gt <-
  google_font_tbl_int |>
  dplyr::arrange(category) |>
  gt(rowname_col = "name", groupname_col = "category") |>
  fmt_markdown(columns = "weight_ranges") |>
  tab_style(
    style = list(
      cell_text(size = px(8), font = "Courier"),
      cell_fill(color = "#F7F7F7")
    ),
    locations = cells_body(columns = "weight_ranges")
  ) |>
  tab_style(
    style = cell_text(size = px(24)),
    locations = cells_title(groups = "title")
  ) |>
  tab_style(
    style = cell_text(size = px(18)),
    locations = cells_title(groups = "subtitle")
  ) |>
  tab_style(
    style = cell_text(size = px(28), indent = px(5)),
    locations = cells_body(columns = "samp")
  ) |>
  tab_style(
    style = cell_text(size = px(14)),
    locations = cells_stub()
  ) |>
  tab_style(
    style = cell_text(size = px(18), weight = "600"),
    locations = cells_row_groups()
  ) |>
  tab_header(
    title = md("Recommended *Google Fonts* for **gt**"),
    subtitle = md("Fonts like these can be accessed using the `google_font()` function.<br><br>")
  ) |>
  opt_align_table_header("left") |>
  opt_table_lines("none") |>
  tab_options(
    table.width = px(800),
    column_labels.hidden = TRUE,
    row_group.padding = px(12),
    data_row.padding = px(4),
    table_body.hlines.style = "solid",
    table_body.hlines.width = px(1),
    table_body.hlines.color = "#F7F7F7",
    row_group.border.top.style = "solid",
    row_group.border.top.width = px(1),
    row_group.border.bottom.width = px(1),
    table.border.bottom.style = "solid",
    table.border.bottom.width = px(1),
    table.border.bottom.color = "#F7F7F7",
    source_notes.font.size = px(10),
    source_notes.padding = px(6)
  ) |>
  tab_source_note(md(source_notes))

for (i in seq(nrow(google_font_tbl_int))) {

  google_font_tbl_gt <-
    google_font_tbl_gt |>
    tab_style(
      style = cell_text(font = google_font(name = google_font_tbl_int$name[i])),
      locations = cells_body(columns = samp, rows = google_font_tbl_int$name[i])
    )
}

readr::write_rds(
  google_font_tbl_gt,
  file = "inst/gt_tables/info_google_fonts.rds",
  compress = "xz"
)

rm(
  google_font_tbl_gt, google_font_tbl_int, styles_summary, recommended,
  source_notes, i
)

#
# Build table for `info_paletteer()` -> `info_paletteer.rds`
#

#color_pkgs <-
#  c(
#    "awtools", "dichromat", "dutchmasters", "ggsci", "ggpomological",
#    "ggthemes", "ghibli", "grDevices", "jcolors", "LaCroixColoR",
#    "NineteenEightyR", "nord", "ochRe", "palettetown", "pals",
#    "Polychrome", "quickpalette", "rcartocolor", "RColorBrewer",
#    "Redmonder", "tidyquant", "wesanderson", "yarrr"
#  )

palettes_tbl_gt <-
  gt:::palettes_strips |>
  dplyr::select(package, palette, length) |>
  dplyr::mutate(`Color Count and Palette` = NA) |>
  gt(groupname_col = "package", rowname_col = "palette") |>
  text_transform(
    locations = cells_body("Color Count and Palette"),
    fn = function(x) {
      dplyr::pull(gt:::palettes_strips, colors)
    }
  ) |>
  cols_label(length = "") |>
  tab_stubhead(label = "Package and Palette Name") |>
  tab_header(
    title = md("Palettes Made Easily Available with **paletteer**"),
    subtitle = md("Palettes like these are useful with the `data_color()` function")
  ) |>
  tab_style(
    style = cell_text(align = "left"),
    locations = list(
      cells_title(groups = "title"),
      cells_title(groups = "subtitle")
    )
  ) |>
  tab_style(
    style = list(
      cell_fill(color = "#E3E3E3"),
      cell_text(font = "Courier", size = "smaller", weight = "bold")
    ),
    locations = cells_stub(rows = TRUE)
  ) |>
  tab_style(
    style = cell_text(font = "Courier"),
    locations = cells_body(columns = "length")
  ) |>
  tab_options(
    row_group.background.color = "#FFFFF0",
    column_labels.background.color = "#666660",
    row_group.font.weight = "600",
    row_group.font.size = "smaller"
  ) |>
  tab_source_note(
    source_note = md(
      paste0(
        "The **paletteer** package is maintained by Emil Hvitfeldt. More ",
        "information can be found on [the **paletteer** site]",
        "(https://emilhvitfeldt.github.io/paletteer/) and on the ",
        "[**CRAN** info page]",
        "(https://cran.r-project.org/web/packages/paletteer/index.html)."
      )
    )
  )

readr::write_rds(
  palettes_tbl_gt,
  file = "inst/gt_tables/info_paletteer.rds",
  compress = "xz"
)

rm(palettes_tbl_gt, color_pkgs, palettes_strips_df)

#
# Build table for `info_conversions()` -> `info_conversions.rds`
#

conversions_tbl <-
  conversion_factors |>
  dplyr::distinct(type, from) |>
  dplyr::mutate(name = gsub(".*\\.", "", from)) |>
  dplyr::mutate(name = gsub("-", " ", name)) |>
  dplyr::mutate(name = gsub("therm us", "US therm", name)) |>
  dplyr::mutate(name = gsub("g force", "g-force", name)) |>
  dplyr::mutate(name = gsub("british ", "British ", name)) |>
  dplyr::mutate(name = gsub("imperial$", "(Imperial)", name)) |>
  dplyr::mutate(name = gsub("foodcalorie", "food calorie", name)) |>
  dplyr::mutate(name = gsub("foot pound", "foot-pound", name)) |>
  dplyr::mutate(name = gsub("pound force", "pound-force", name)) |>
  dplyr::mutate(name = gsub("std", "std.", name)) |>
  dplyr::select(type, name, from)

conversions_tbl_gt <-
  conversions_tbl |>
  gt(groupname_col = "type", id = "unit_conversion") |>
  rows_add(
    type = "temperature", name = "degree Celsius", from = "temperature.celsius",
  ) |>
  rows_add(
    type = "temperature", name = "degree Fahrenheit", from = "temperature.fahrenheit"
  ) |>
  rows_add(
    type = "temperature", name = "kelvin", from = "temperature.kelvin"
  ) |>
  rows_add(
    type = "temperature", name = "rankine", from = "temperature.rankine"
  ) |>
  cols_label(
    name = "Unit",
    from = "Keyword"
  ) |>
  cols_width(
    name ~ px(300),
    from ~ px(300)
  ) |>
  tab_style(
    style = list(
      cell_text(
        font = system_fonts(name = "monospace-code"),
        size = px(12)
      ),
      cell_borders(
        sides = "l",
        color = "lightblue",
        weight = px(1.5))
    ),
    locations = cells_body(columns = from)
  ) |>
  tab_style(
    style = css(position = "sticky", top = "-1em", `z-index` = 10),
    locations = cells_column_labels()
  ) |>
  opt_all_caps() |>
  opt_stylize(style = 6) |>
  tab_style(
    style = cell_text(size = px(24)),
    locations = cells_title(groups = "title")
  ) |>
  tab_style(
    style = cell_text(size = px(18)),
    locations = cells_title(groups = "subtitle")
  ) |>
  tab_options(
    table.border.top.style = "hidden",
    column_labels.border.bottom.style = "hidden",
    container.height = px(620)
  ) |>
  tab_header(
    title = md("Units that are compatible with `unit_conversion()`"),
    subtitle = md("Use pairs of keyword values from a common group.<br><br>")
  ) |>
  opt_align_table_header("left") |>
  opt_table_lines("none") |>
  opt_horizontal_padding(scale = 2) |>
  opt_css(
    css = "
    #unit_conversion .gt_group_heading {
      padding-top: 18px;
      padding-bottom: 4px;
      padding-left: 10px;
      text-decoration: underline;
      text-underline-offset: 2px;
    }"
  ) |>
  row_group_order(groups = c(
    "acceleration", "angle", "area", "consumption", "digital",
    "duration", "energy", "force", "length", "mass",
    "pressure", "speed", "temperature", "torque", "volume"
  ))

readr::write_rds(
  conversions_tbl_gt,
  file = "inst/gt_tables/info_conversions.rds",
  compress = "xz"
)

rm(conversions_tbl, conversions_tbl_gt)
