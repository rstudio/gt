library(gt)
library(tidyverse)

flags_dir <- "data-raw/flags_svg"

flag_file_countries <-
  list.files(flags_dir) %>%
  sub(".svg", "", ., fixed = TRUE) %>%
  toupper()

countrypops_countries <-
  countrypops$country_code_2 %>%
  unique()

files_to_delete <- base::setdiff(flag_file_countries, countrypops_countries)

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
    country_flag = character(0)
  )

svg_insert <- "overflow=\"visible\" style=\"vertical-align:-0.125em;\""

for (i in seq_along(flag_files)) {

  country_code_i <-
    flag_files[i] %>%
    sub(".*/", "", .) %>%
    sub(".svg", "", ., fixed = TRUE) %>%
    toupper()

  flag_file_lines_i <- readLines(flag_files[i], warn = FALSE)

  flag_file_lines_i[1] <-
    flag_file_lines_i[1] %>%
    gsub("viewBox=\"0 0 512 512\">", paste0("viewBox=\"0 0 512 512\" ", svg_insert, ">"), .)

  country_flag_i <- paste(flag_file_lines_i, collapse = "")

  flag_tbl_i <-
    dplyr::tibble(
      country_code = country_code_i,
      country_flag = country_flag_i
    )

  flag_tbl <- dplyr::bind_rows(flag_tbl, flag_tbl_i)
}

rm(
  flag_file_countries, flag_file_lines_i, flag_files, flags_dir,
  i, svg_insert, country_code_i, country_flag_i, countrypops_countries,
  flag_tbl_i, files_to_delete
)
