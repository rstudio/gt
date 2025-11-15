library(gt)
library(tidyverse)

flags_dir <- "data-raw/flags_svg"

flag_file_countries <-
  toupper(
    sub(".svg", "", list.files(flags_dir), fixed = TRUE)
  )

flag_file_two_lett <-
  flag_file_countries[grepl("^[A-Z]{2}$", flag_file_countries)]

if (length(base::setdiff(flag_file_countries, flag_file_two_lett)) > 0) {

  files_to_delete <-
    tolower(base::setdiff(flag_file_countries, flag_file_two_lett)) |>
    paste0(".svg")

  if (length(files_to_delete) > 0) {

    files_to_delete <-
      files_to_delete |>
      tolower() |>
      paste0(".svg")

    file.remove(paste0("data-raw/flags_svg/", files_to_delete))
  }
}

flag_files <- list.files(flags_dir, full.names = TRUE)

flag_tbl <-
  dplyr::tibble(
    country_code_2 = character(0L),
    country_code_3 = character(0L),
    country_name = character(0L),
    country_flag = character(0L)
  )

countrypops_country_lookup <-
  countrypops |>
  dplyr::select(starts_with("country")) |>
  dplyr::distinct()

for (i in seq_along(flag_files)) {

  country_code_2_i <- sub(".*/", "", flag_files[i])
  country_code_2_i <- toupper(
    sub(".svg", "", country_code_2_i, fixed = TRUE)
  )

  country_name_i <-
    countrypops_country_lookup[["country_name"]][
      countrypops_country_lookup[["country_code_2"]] == country_code_2_i
    ]

  country_code_3_i <-
    countrypops_country_lookup[["country_code_3"]][
      countrypops_country_lookup[["country_code_2"]] == country_code_2_i
    ]

  flag_file_lines_i <- readLines(flag_files[i], warn = FALSE)

  country_flag_i <- paste(flag_file_lines_i, collapse = "")

  flag_tbl_i <-
    dplyr::tibble(
      country_code_2 = country_code_2_i,
      country_code_3 = country_code_3_i,
      country_name = country_name_i,
      country_flag = country_flag_i
    )

  flag_tbl <- dplyr::bind_rows(flag_tbl, flag_tbl_i)
}

# Create tibble to use as extra rows in the `flag_tbl`
extra_flags <-
  dplyr::tribble(
    ~country_code_2, ~country_code_3, ~country_name,
    "EU", "EUR", "European Union",
    "AI", "AIA", "Anguilla",
    "AX", "ALA", "Åland Islands",
    "BL", "BLM", "St. Barthélemy",
    "CC", "CCK", "Cocos (Keeling) Islands",
    "CK", "COK", "Cook Islands",
    "EH", "ESH", "Western Sahara",
    "FK", "FLK", "Falkland Islands (Malvinas)",
    "GF", "GUF", "French Guiana",
    "GG", "GGY", "Guernsey",
    "GP", "GLP", "Guadeloupe",
    "GS", "SGS", "South Georgia and South Sandwich Islands",
    "IO", "IOT", "British Indian Ocean Territory",
    "JE", "JEY", "Jersey",
    "MQ", "MTQ", "Martinique",
    "MS", "MSR", "Montserrat",
    "NF", "NFK", "Norfolk Island",
    "NU", "NIU", "Niue",
    "PM", "SPM", "Saint Pierre and Miquelon",
    "PN", "PCN", "Pitcairn Islands",
    "RE", "REU", "Réunion",
    "TF", "ATF", "French Southern Territories",
    "TK", "TKL", "Tokelau",
    "TW", "TWN", "Taiwan",
    "VA", "VAT", "Vatican City",
    "WF", "WLF", "Wallis and Futuna",
    "YT", "MYT", "Mayotte"
  )

extra_flags <-
  extra_flags |>
  dplyr::mutate(country_flag = NA_character_)

# This needs to obtain the SVG lines from the associated files

flag_files_short <- list.files(flags_dir)

for (i in seq_len(nrow(extra_flags))) {

  file_name <-
    tolower(extra_flags[i, ][["country_code_2"]]) |>
    paste0(".svg")

  if (!(file_name %in% flag_files_short)) next

  flag_file_lines_i <-
    readLines(paste0(flags_dir, "/", file_name), warn = FALSE)

  country_flag_i <- paste(flag_file_lines_i, collapse = "")

  extra_flags[i, ][["country_flag"]] <- country_flag_i
}

flag_tbl <-
  dplyr::bind_rows(flag_tbl, extra_flags) |>
  dplyr::arrange(country_code_2)

rm(
  flag_file_countries, flag_file_lines_i, flag_files, flags_dir, extra_flags,
  i, country_code_2_i, country_code_3_i, country_name_i, country_flag_i, file_name,
  countrypops_country_lookup, flag_files_short, flag_file_two_lett,
  flag_tbl_i, files_to_delete
)
