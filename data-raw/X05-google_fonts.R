library(tidyverse)
library(here)
library(downloader)
library(fs)

# Set up a working directory for Google Font data processing
work_dir <- here("data-raw", "google_fonts_metadata")
fs::dir_create(work_dir)

# Download and extract the tarball for the google/font repository
downloader::download(
  "https://github.com/google/fonts/tarball/master",
  destfile = file.path(work_dir, "google_fonts.tar.gz")
)
utils::untar(file.path(work_dir, "google_fonts.tar.gz"), exdir = work_dir)

# Get the directory names for each of the OFL fonts
file_list <- fs::dir_ls(path = fs::path_expand(work_dir)) %>% as.character()
ofl_dirs <- fs::dir_ls(file.path(file_list[!grepl("tar.gz", file_list)], "ofl"))

# Copy all .pb files to the root of the work directory
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

# Get paths for all .pb files in the work directory
ofl_files <- fs::dir_ls(work_dir, glob = "*.pb")

# Initialize tibbles
google_font_tbl <-
  dplyr::tibble(
    name = character(0), designer = character(0), license = character(0),
    category = character(0), date_added = character(0)
  )
google_styles_tbl <-
  dplyr::tibble(
    name = character(0), style = character(0), weight = character(0),
    filename = character(0), post_script_name = character(0),
    full_name = character(0), copyright = character(0)
  )
google_axes_tbl <-
  dplyr::tibble(
    name = character(0), tag = character(0), min_value = character(0),
    max_value = character(0),
  )

# For every font file, read the `.pb` metadata file and extract
# font metrics and other items of information
for (file in ofl_files) {

  pb <-
    readr::read_file(file) %>%
    gt:::tidy_gsub("#.*?\n", "\n")

  font_variants <-
    stringr::str_extract_all(pb, pattern = "fonts \\{(\\n|.)*?\\}") %>%
    unlist() %>%
    gt:::tidy_gsub("(fonts \\{\n  |\\}$|\"|$)", "") %>%
    gt:::tidy_gsub("\n  ", "\n") %>%
    gt:::tidy_gsub("\n$", "") %>%
    stringr::str_split("\n")

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

  google_font_tbl <-
    dplyr::bind_rows(
      google_font_tbl,
      read.dcf(textConnection(font_info)) %>%
        dplyr::as_tibble()
    )

  for (i in seq_len(length(font_variants))) {
    google_styles_tbl <-
      dplyr::bind_rows(
        google_styles_tbl,
        read.dcf(textConnection(font_variants[[i]])) %>% dplyr::as_tibble()
      )
  }

  if (str_detect(pb, "axes \\{")) {

    axes <-
      stringr::str_extract_all(pb, pattern = "axes(\\n|.)*?\\}") %>%
      unlist() %>%
      gt:::tidy_gsub("(axes \\{\n  |\\}$|\"|$)", "") %>%
      gt:::tidy_gsub("\n  ", "\n") %>%
      gt:::tidy_gsub("\n$", "") %>%
      stringr::str_split("\n")


    for (i in seq_len(length(axes))) {
      google_axes_tbl <-
        dplyr::bind_rows(
          google_axes_tbl,
          read.dcf(textConnection(axes[[i]])) %>%
            dplyr::as_tibble() %>%
            dplyr::mutate(name = font_name) %>%
            dplyr::select(name, dplyr::everything())
        )
    }
  }
}

# Remove the work directory
unlink(work_dir, recursive = TRUE)

rm(dr)
rm(file)
rm(file_list)
rm(font_info)
rm(font_name)
rm(i)
rm(ofl_dirs)
rm(ofl_files)
rm(pb)
rm(work_dir)
rm(font_variants)
rm(axes)
