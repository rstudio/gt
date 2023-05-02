library(gt)
library(tidyverse)

flags_dir <- "data-raw/flags_svg"

flag_file_countries <-
  list.files(flags_dir) %>%
  sub(".svg", "", ., fixed = TRUE) %>%
  toupper()

flag_file_two_lett <-
  flag_file_countries[grepl("^[A-Z]{2}$", flag_file_countries)]

files_to_delete <-
  tolower(base::setdiff(flag_file_countries, flag_file_two_lett)) |>
  paste0(".svg")

if (length(files_to_delete) > 0) {

  files_to_delete <-
    files_to_delete %>%
    tolower() %>%
    paste0(".svg")

  file.remove(paste0("data-raw/flags_svg/", files_to_delete))
}

flag_files <- list.files(flags_dir, full.names = TRUE)

flag_tbl <-
  dplyr::tibble(
    country_code = character(0),
    country_name = character(0),
    country_flag = character(0)
  )

for (i in seq_along(flag_files)) {

  country_code_i <-
    flag_files[i] %>%
    sub(".*/", "", .) %>%
    sub(".svg", "", ., fixed = TRUE) %>%
    toupper()

  country_name_i <-
    countrypops_country_lookup[["country_name"]][
      countrypops_country_lookup[["country_code_2"]] == country_code_i
    ]

  flag_file_lines_i <- readLines(flag_files[i], warn = FALSE)

  country_flag_i <- paste(flag_file_lines_i, collapse = "")

  flag_tbl_i <-
    dplyr::tibble(
      country_code = country_code_i,
      country_name = country_name_i,
      country_flag = country_flag_i
    )

  flag_tbl <- dplyr::bind_rows(flag_tbl, flag_tbl_i)
}

rm(
  flag_file_countries, flag_file_lines_i, flag_files, flags_dir,
  i, country_code_i, country_name_i, country_flag_i,
  countrypops_countries, countrypops_country_lookup,
  flag_tbl_i, files_to_delete
)
