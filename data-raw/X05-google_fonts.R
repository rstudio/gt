library(tidyverse)
library(here)
library(downloader)
library(fs)

# Set up a working directory for Google Font data processing
work_dir <- here("data-raw", "google_fonts_metadata")
fs::dir_create(work_dir)

# Download and extract the tarball for the google/font repository
downloader::download(
  "https://github.com/google/fonts/tarball/main",
  destfile = file.path(work_dir, "google_fonts.tar.gz")
)
utils::untar(file.path(work_dir, "google_fonts.tar.gz"), exdir = work_dir)

# Get the directory names for each of the fonts
file_list <- fs::dir_ls(path = fs::path_expand(work_dir)) |> as.character()
ofl_dirs <- fs::dir_ls(file.path(file_list[!grepl("tar.gz", file_list)], "ofl"))
apache_dirs <- fs::dir_ls(file.path(file_list[!grepl("tar.gz", file_list)], "apache"))
ufl_dirs <- fs::dir_ls(file.path(file_list[!grepl("tar.gz", file_list)], "apache"))

all_dirs <- c(ofl_dirs, apache_dirs, ufl_dirs)

# Copy all .pb files to the root of the work directory
for (dr in all_dirs) {

  font_name <- rev(unlist(fs::path_split(dr)))[1]

  if (fs::file_exists(file.path(dr, "METADATA.pb"))) {

    fs::file_copy(
      path = file.path(dr, "METADATA.pb"),
      new_path = file.path(work_dir, paste0(font_name, "__METADATA.pb")),
      overwrite = TRUE
    )
  }

  rm(font_name)
}

# Get paths for all .pb files in the work directory
all_files <- fs::dir_ls(work_dir, glob = "*.pb")

# Initialize tibbles
google_font_tbl <-
  dplyr::tibble(
    name = character(0L),
    designer = character(0L),
    license = character(0L),
    category = character(0L),
    date_added = character(0L)
  )
google_styles_tbl <-
  dplyr::tibble(
    name = character(0L),
    style = character(0L),
    weight = character(0L),
    filename = character(0L),
    post_script_name = character(0L),
    full_name = character(0L),
    copyright = character(0L)
  )
google_axes_tbl <-
  dplyr::tibble(
    name = character(0L),
    tag = character(0L),
    min_value = character(0L),
    max_value = character(0L)
  )

# For every font file, read the `.pb` metadata file and extract
# font metrics and other items of information
for (file in all_files) {

  pb <- gsub("#.*?\n", "\n", readr::read_file(file))

  font_variants <-
    unlist(stringr::str_extract_all(pb, pattern = "fonts \\{(\\n|.)*?\\}")) |>
    stringr::str_remove_all("(fonts \\{\n  |\\}$|\"|$)") |>
    stringr::str_replace_all("\n  ", "\n") |>
    trimws("right", "\n") |>
    stringr::str_split("\n")

  font_info <-
    stringr::str_replace_all(pb, pattern = "fonts \\{(\\n|.)*?\\}", "") |>
    stringr::str_remove_all("axes \\{.*") |>
    stringr::str_remove_all("subsets:.*") |>
    stringr::str_replace_all("\n{2,}", "\n") |>
    trimws("right", "\n") |>
    stringr::str_remove_all("\"") |>
    stringr::str_split("\n") |>
    unlist()

  font_name <- read.dcf(textConnection(font_info))[1, 1] |> unname()

  google_font_tbl <-
    dplyr::bind_rows(
      google_font_tbl,
      dplyr::as_tibble(read.dcf(textConnection(font_info)))
    )

  for (i in seq_len(length(font_variants))) {
    google_styles_tbl <-
      dplyr::bind_rows(
        google_styles_tbl,
        dplyr::as_tibble(read.dcf(textConnection(font_variants[[i]])))
      )
  }

  if (grepl("axes {", pb, fixed = TRUE)) {

    axes <-
      unlist(stringr::str_extract_all(pb, pattern = "axes(\\n|.)*?\\}")) |>
      stringr::str_remove_all("(axes \\{\n  |\\}$|\"|$)") |>
      stringr::str_replace_all("\n  ", "\n") |>
      trimws("right", "\n") |>
      stringr::str_split("\n")

    for (i in seq_len(length(axes))) {
      google_axes_tbl <-
        dplyr::bind_rows(
          google_axes_tbl,
          dplyr::as_tibble(read.dcf(textConnection(axes[[i]]))) |>
            dplyr::mutate(name = font_name, .before = 0)
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
rm(all_dirs)
rm(ofl_dirs)
rm(apache_dirs)
rm(ufl_dirs)
rm(all_files)
rm(pb)
rm(work_dir)
rm(font_variants)
rm(axes)
