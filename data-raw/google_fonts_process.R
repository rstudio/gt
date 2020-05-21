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
    tidy_gsub("#.*?\n", "\n")

  font_variants <-
    stringr::str_extract_all(pb, pattern = "fonts \\{(\\n|.)*?\\}") %>% unlist() %>%
    tidy_gsub("(fonts \\{\n  |\\}$|\"|$)", "") %>%
    tidy_gsub("\n  ", "\n") %>% tidy_gsub("\n$", "") %>% str_split("\n")

  font_info <-
    pb %>%
    stringr::str_replace_all(pattern = "fonts \\{(\\n|.)*?\\}", "") %>%
    tidy_gsub("axes \\{.*", "") %>%
    tidy_gsub("subsets:.*", "") %>%
    tidy_gsub("\n{2,}", "\n") %>%
    tidy_gsub("\n$", "") %>%
    tidy_gsub("\"", "") %>%
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
      tidy_gsub("(axes \\{\n  |\\}$|\"|$)", "") %>%
      tidy_gsub("\n  ", "\n") %>% tidy_gsub("\n$", "") %>%
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


font_tbl_int <-
  font_tbl %>%
  dplyr::mutate(
    category = stringr::str_to_title(category) %>%
      tidy_gsub("_", " ") %>%
      tidy_gsub("serif", "Serif")
  ) %>%
  dplyr::select(-license, -date_added) %>%
  dplyr::mutate(samp = paste0(LETTERS, letters, collapse = ""))

font_tbl_gt <-
  font_tbl_int %>%
  dplyr::arrange(category) %>%
  gt(rowname_col = "name", groupname_col = "category") %>%
  tab_options(column_labels.hidden = TRUE)


for (i in seq(nrow(font_tbl_int))) {

  font_tbl_gt <-
    font_tbl_gt %>%
    tab_style(
      style = cell_text(font = google_fonts(name = font_tbl_int$name[i])),
      locations = cells_body(columns = vars(samp), rows = font_tbl_int$name[i])
    )
}

font_tbl_gt
styles_tbl
axes_tbl

