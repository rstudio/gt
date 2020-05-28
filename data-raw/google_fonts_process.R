library(tidyverse)
library(fs)

# Location of `fonts-master`
fonts_master_path <- "~/Downloads/fonts-master/"
work_dir <- "data-raw/google_fonts_metadata"

fs::dir_create(work_dir)

ofl_dirs <- fs::dir_ls(path = fs::path_expand(file.path(fonts_master_path, "ofl")))

for (dr in ofl_dirs) {

  font_name <- dr %>% fs::path_split() %>% unlist() %>% rev() %>% .[1]

  if (fs::file_exists(file.path(dr, "METADATA.pb"))) {

    fs::file_copy(
      path = file.path(dr, "METADATA.pb"),
      new_path = file.path(work_dir, paste0(font_name, "__METADATA.pb"))
    )
  }

  rm(font_name)
}

ofl_files <- fs::dir_ls(work_dir)

font_tbl <-
  dplyr::tibble(
    name = character(0), designer = character(0), license = character(0),
    category = character(0), date_added = character(0)
  )

styles_tbl <-
  dplyr::tibble(
    name = character(0), style = character(0), weight = character(0),
    filename = character(0), post_script_name = character(0),
    full_name = character(0), copyright = character(0)
  )

axes_tbl <-
  dplyr::tibble(
    name = character(0), tag = character(0), min_value = character(0),
    max_value = character(0),
  )


for (file in ofl_files) {

  pb <-
    readr::read_file(file) %>%
    gt:::tidy_gsub("#.*?\n", "\n")

  font_variants <-
    stringr::str_extract_all(pb, pattern = "fonts \\{(\\n|.)*?\\}") %>% unlist() %>%
    gt:::tidy_gsub("(fonts \\{\n  |\\}$|\"|$)", "") %>%
    gt:::tidy_gsub("\n  ", "\n") %>% tidy_gsub("\n$", "") %>% str_split("\n")

  font_info <-
    pb %>%
    stringr::str_replace_all(pattern = "fonts \\{(\\n|.)*?\\}", "") %>%
    gt:::tidy_gsub("axes \\{.*", "") %>%
    gt:::tidy_gsub("subsets:.*", "") %>%
    gt:::tidy_gsub("\n{2,}", "\n") %>%
    gt:::tidy_gsub("\n$", "") %>%
    gt:::tidy_gsub("\"", "") %>%
    stringr::str_split("\n") %>%
    unlist()

  font_name <- read.dcf(textConnection(font_info))[1, 1] %>% unname()

  font_tbl <-
    dplyr::bind_rows(
      font_tbl,
      read.dcf(textConnection(font_info)) %>%
        dplyr::as_tibble()
    )

  for (i in seq_len(length(font_variants))) {
    styles_tbl <-
      dplyr::bind_rows(
        styles_tbl,
        read.dcf(textConnection(font_variants[[i]])) %>% dplyr::as_tibble()
      )
  }

  if (str_detect(pb, "axes \\{")) {

    axes <-
      stringr::str_extract_all(pb, pattern = "axes(\\n|.)*?\\}") %>%
      unlist() %>%
      gt:::tidy_gsub("(axes \\{\n  |\\}$|\"|$)", "") %>%
      gt:::tidy_gsub("\n  ", "\n") %>% tidy_gsub("\n$", "") %>%
      stringr::str_split("\n")


    for (i in seq_len(length(axes))) {
      axes_tbl <-
        dplyr::bind_rows(
          axes_tbl,
          read.dcf(textConnection(axes[[i]])) %>%
            dplyr::as_tibble() %>%
            dplyr::mutate(name = font_name) %>%
            dplyr::select(name, dplyr::everything())
        )
    }
  }
}

# TODO: Move to function `info_google_fonts()`

# Recommended Fonts
recommended <-
  c(
    "Space Mono",
    "Work Sans",
    "Inter",
    "Rubik",
    "Libre Franklin",
    "Comorant",
    "Fira Sans",
    "Fira Code",
    "Eczar",
    "Chivo",
    "Inknut",
    "Source Sans Pro",
    "Source Serif Pro",
    "Roboto",
    "Roboto Slab",
    "BioRhyme",
    "Poppins",
    "Archivo Narrow",
    "Libre Baskerville",
    "Playfair Display",
    "Karla",
    "Encode Sans",
    # "Encode Sans Condensed",
    # "Encode Sans Semi Condensed",
    # "Encode Sans Semi Expanded",
    # "Encode Sans Expanded",
    "Lora",
    "Proza Libre",
    "Spectral",
    "IBM Plex Sans",
    # "IBM Plex Sans Condensed",
    # "IBM Plex Serif",
    "IBM Plex Mono",
    "Crimson Text",
    "Montserrat",
    "PT Sans",
    "PT Serif",
    "Lato",
    "Cardo",
    "Open Sans",
    "Inconsolata",
    "Cabin",
    "Raleway",
    "Anonymous Pro",
    "Merriweather",
    "Exo 2",
    "Public Sans",
    "Muli"
  )

styles_summary <-
  styles_tbl %>%
  dplyr::mutate(weight = as.integer(weight)) %>%
  dplyr::filter(name %in% recommended) %>%
  dplyr::group_by(name, style) %>%
  dplyr::summarize(min_weight = min(weight), max_weight = max(weight)) %>%
  dplyr::ungroup() %>%
  dplyr::arrange(name, desc(style)) %>%
  dplyr::mutate(weight_range = dplyr::case_when(
    style == "normal" & min_weight != max_weight ~ paste0("n&nbsp;", min_weight, "&#8209;", max_weight),
    style == "normal" & min_weight == max_weight ~ paste0("n&nbsp;", min_weight),
    style == "italic" & min_weight != max_weight ~ paste0("*i*&nbsp;", min_weight, "&#8209;", max_weight),
    style == "italic" & min_weight == max_weight ~ paste0("*i*&nbsp;", min_weight)
  )) %>%
  dplyr::group_by(name) %>%
  dplyr::summarize(weight_ranges = paste(weight_range, collapse = "<br>"))

source_notes <-
  styles_tbl %>%
  dplyr::filter(name %in% recommended) %>%
  dplyr::select(name, copyright) %>%
  dplyr::distinct() %>%
  dplyr::mutate(name = paste0("**", name, "** ")) %>%
  dplyr::mutate(name_copy = paste0(name, copyright)) %>%
  dplyr::pull(name_copy) %>%
  paste(collapse = ". ") %>%
  gsub("..", ".", ., fixed = TRUE) %>%
  paste_right(".")

font_tbl_int <-
  font_tbl %>%
  dplyr::filter(name %in% recommended) %>%
  dplyr::left_join(styles_summary, by = "name") %>%
  dplyr::mutate(
    category = stringr::str_to_title(category) %>%
      tidy_gsub("_", " ") %>%
      tidy_gsub("serif", "Serif")
  ) %>%
  dplyr::select(-license, -date_added, -designer) %>%
  dplyr::mutate(samp = paste0(LETTERS[1:13], letters[1:13], collapse = ""))

font_tbl_gt <-
  font_tbl_int %>%
  dplyr::arrange(category) %>%
  gt(rowname_col = "name", groupname_col = "category") %>%
  fmt_markdown(columns = vars(weight_ranges)) %>%
  tab_style(
    style = list(
      cell_text(size = px(8), font = "Courier"),
      cell_fill(color = "#F7F7F7")
    ),
    locations = cells_body(columns = vars(weight_ranges))
  ) %>%
  tab_style(
    style = cell_text(size = px(24)),
    locations = cells_title(groups = "title")
  ) %>%
  tab_style(
    style = cell_text(size = px(18)),
    locations = cells_title(groups = "subtitle")
  ) %>%
  tab_style(
    style = cell_text(size = px(28), indent = px(5)),
    locations = cells_body(columns = vars(samp))
  ) %>%
  tab_style(
    style = cell_text(size = px(14)),
    locations = cells_stub()
  ) %>%
  tab_style(
    style = cell_text(size = px(18), weight = "600"),
    locations = cells_row_groups()
  ) %>%
  tab_header(
    title = md("Recommended *Google Fonts* for **gt**"),
    subtitle = md("Fonts like these can be accessed using the `google_fonts()` function.<br><br>")
  ) %>%
  opt_align_table_header("left") %>%
  opt_table_lines("none") %>%
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
  ) %>%
  tab_source_note(md(source_notes))

for (i in seq(nrow(font_tbl_int))) {

  font_tbl_gt <-
    font_tbl_gt %>%
    tab_style(
      style = cell_text(font = google_fonts(name = font_tbl_int$name[i])),
      locations = cells_body(columns = vars(samp), rows = font_tbl_int$name[i])
    )
}

font_tbl_gt

font_tbl_gt %>% gtsave("google_fonts.png")

