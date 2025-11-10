library(tidyverse)
library(i18n)
library(jsonlite)
library(gt)
library(stringi)

all_locales <- i18n::all_locales
default_locales <- i18n::default_locales

en_locale_names <- i18n::locale_names[i18n::locale_names$locale == "en", ]

lang_names <- en_locale_names$lang_names$name
script_names <- en_locale_names$script_names$name
territory_names <- en_locale_names$territory_names$name
variant_names <- en_locale_names$variant_names$name

parse_locale <- function(locale) {

  locale_attrs <-
    list(
      lang_name = NA_character_,
      lang_desc = NA_character_,
      script_name = NA_character_,
      script_desc = NA_character_,
      territory_name = NA_character_,
      territory_desc = NA_character_,
      variant_name = NA_character_,
      variant_desc = NA_character_
    )

  default_locales_no_subtags <- gsub("-.*", "", default_locales$base_locale)

  # Resolve any territory that are purely language locales into their
  # base names (e.g., 'en-US' -> 'en')
  if (
    locale %in% default_locales$base_locale ||
    locale %in% default_locales_no_subtags
  ) {

    locale_i <- default_locales[default_locales$base_locale == locale, ][["default_locale"]]

    if (length(locale_i) < 1) {

      locale_i <- default_locales[default_locales_no_subtags == locale, ][["default_locale"]][[1]]
    }

    locale <- locale_i
  }

  # Normalize any hyphens to underscores
  locale <- gsub("-", "_", locale)

  # Split the locale string into parts
  locale_parts <- unlist(strsplit(locale, "_"))

  # The first part should always correspond to a language name
  if (!(locale_parts[1] %in% names(lang_names))) {
    stop("Locale parsing error; first component should be a language name")
  }

  # Add the language name and description to the variables
  locale_attrs$lang_name <- locale_parts[1]
  locale_attrs$lang_desc <- lang_names[names(lang_names) == locale_attrs$lang_name][[1]]

  # Remove the first component from `locale_parts`
  locale_parts <- locale_parts[-1]

  # For any extra components, search through the script, territory, and variant
  # names in the respective list objects, confirming names and assigning
  # descriptions to the appropriate list components in `locale_attrs`
  if (length(locale_parts) > 0) {

    for (i in seq_along(locale_parts)) {

      if (locale_parts[i] %in% names(script_names)) {
        locale_attrs$script_name <- locale_parts[i]
        locale_attrs$script_desc <- script_names[names(script_names) == locale_attrs$script_name][[1]]
      }

      if (locale_parts[i] %in% names(territory_names)) {
        locale_attrs$territory_name <- locale_parts[i]
        locale_attrs$territory_desc <- territory_names[names(territory_names) == locale_attrs$territory_name][[1]]
      }

      if (locale_parts[i] %in% names(variant_names)) {
        locale_attrs$variant_name <- locale_parts[i]
        locale_attrs$variant_desc <- variant_names[names(variant_names) == locale_attrs$variant_name][[1]]
      }
    }
  }

  # Process exceptions
  if (locale == "be_tarask") {
    locale_attrs$script_name <- "Cyrl"
    locale_attrs$script_desc <- "Cyrillic"
    locale_attrs$territory_name <- "BY"
    locale_attrs$territory_desc <- "Belarus"
  }
  if (locale == "no") {
    locale_attrs$territory_name <- "NO"
    locale_attrs$territory_desc <- "Norway"
  }

  locale_attrs
}

#
# Generate table of locales and descriptions in English
#

locale_metadata_tbl <-
  dplyr::tibble(
    locale = NA_character_,
    lang_name = NA_character_,
    lang_desc = NA_character_,
    script_name = NA_character_,
    script_desc = NA_character_,
    territory_name = NA_character_,
    territory_desc = NA_character_,
    variant_name = NA_character_,
    variant_desc = NA_character_
  )[0, ]

for (i in seq_along(all_locales)) {

  locale_metadata_list <- parse_locale(locale = all_locales[i])

  locale_metadata_tbl_i <-
    dplyr::tibble(
      locale = all_locales[i],
      lang_name = locale_metadata_list$lang_name,
      lang_desc = locale_metadata_list$lang_desc,
      script_name = locale_metadata_list$script_name,
      script_desc = locale_metadata_list$script_desc,
      territory_name = locale_metadata_list$territory_name,
      territory_desc = locale_metadata_list$territory_desc,
      variant_name = locale_metadata_list$variant_name,
      variant_desc = locale_metadata_list$variant_desc
    )

  locale_metadata_tbl <- dplyr::bind_rows(locale_metadata_tbl, locale_metadata_tbl_i)
}

#
# Generate table of index characters for each locale
#

chr_index_tbl <-
  dplyr::tibble(
    locale = NA_character_,
    chr_index = list(letters)
  )[0, ]

for (i in seq_along(all_locales)) {

  index_chr <- cldr_characters(locale = all_locales[i], element = "index")

  if (is.na(index_chr)) {
    index_chr <- cldr_characters(locale = all_locales[i], element = "exemplar_characters")
    chr_from_exemplar <- TRUE
  } else {
    chr_from_exemplar <- FALSE
  }

  index_chr <- gsub("^\\[|\\]$", "", index_chr)
  index_chr <- gsub("\\{|\\}", "", index_chr)
  index_chr <- strsplit(index_chr, " ")
  index_chr <- unlist(index_chr)
  index_chr <- stringi::stri_unescape_unicode(index_chr)

  if (chr_from_exemplar) {
    index_chr <- toupper(index_chr)
  }

  chr_index_tbl_i <-
    dplyr::tibble(
      locale = all_locales[i],
      chr_index = list(index_chr)
    )

  chr_index_tbl <- dplyr::bind_rows(chr_index_tbl, chr_index_tbl_i)
}

#
# Generate table of numeric formatting directives for each locale
#

numbers_metadata_tbl <-
  dplyr::select(
    i18n::numbers,
    locale, decimal, group, percent_sign, plus_sign, minus_sign, approx_sign,
    exp_sign, sup_exp, per_mille, infinity, nan,
    approx_pattern, at_least_pattern, at_most_pattern, range_pattern,
    decimal_format, sci_format, percent_format, currency_format, accounting_format,
    default_numbering_system, minimum_grouping_digits
  )

#
# Create a table of in-use currencies from all possible regions
#

regional_currencies_tbl <- dplyr::tibble()

regional_currencies_path <-
  file.path(
    "https://raw.githubusercontent.com/unicode-org/cldr-json",
    "41.0.0", "cldr-json/cldr-core/supplemental/currencyData.json"
  )

regional_currencies_data <-
  jsonlite::read_json(regional_currencies_path)

regional_currencies <- regional_currencies_data$supplemental$currencyData$region

for (i in seq_along(regional_currencies)) {

  regional_currencies_i <- regional_currencies[[i]]

  not_tender_j <- integer(0L)

  for (j in seq_along(regional_currencies_i)) {

    if (
      "_tender" %in% names(regional_currencies_i[[j]][[1]]) &&
      regional_currencies_i[[j]][[1]][["_tender"]] == "false"
    ) {
      not_tender_j <- c(not_tender_j, j)
    }
  }

  if (length(not_tender_j) > 0) {
    regional_currencies_i <- regional_currencies_i[-not_tender_j]
  }

  if (length(regional_currencies_i) < 1) next

  n_regional_currencies <- length(regional_currencies_i)

  currency_in_use <- names(regional_currencies_i[[n_regional_currencies]])

  regional_currencies_tbl_row_i <-
    dplyr::tibble(
      territory_name = names(regional_currencies[i]),
      currency_code = currency_in_use
    )

  # Append row to main table
  regional_currencies_tbl <-
    dplyr::bind_rows(regional_currencies_tbl, regional_currencies_tbl_row_i)
}

# Make corrections for specific currencies
regional_currencies_tbl[regional_currencies_tbl$territory_name == "CU", ][["currency_code"]] <- "CUP"

#
# Create a table with label text for all possible languages
#

i18n_table_labels <-
  readr::read_csv(
    "data-raw/table_label_text.csv",
    col_types = cols(
      lang_name = col_character(),
      no_table_data_text = col_character(),
      sort_label_text = col_character(),
      filter_label_text = col_character(),
      search_placeholder_text = col_character(),
      page_next_text = col_character(),
      page_previous_text = col_character(),
      page_numbers_text = col_character(),
      page_info_text = col_character(),
      page_size_options_text = col_character(),
      page_next_label_text = col_character(),
      page_previous_label_text = col_character(),
      page_number_label_text = col_character(),
      page_jump_label_text = col_character(),
      page_size_options_label_text = col_character()
    )
  )

#
# Join all tables together to generate a comprehensive locale metadata table
#

locales <-
  locale_metadata_tbl |>
  left_join(chr_index_tbl, by = "locale") |>
  left_join(numbers_metadata_tbl, by = "locale") |>
  left_join(regional_currencies_tbl, by = "territory_name") |>
  left_join(i18n_table_labels, by = "lang_name")

rm(parse_locale)
rm(i)
rm(j)
rm(all_locales)
rm(variant_names)
rm(territory_names)
rm(script_names)
rm(regional_currencies)
rm(regional_currencies_tbl)
rm(regional_currencies_tbl_row_i)
rm(regional_currencies_i)
rm(regional_currencies_data)
rm(regional_currencies_path)
rm(numbers_metadata_tbl)
rm(locale_metadata_tbl)
rm(locale_metadata_tbl_i)
rm(locale_metadata_list)
rm(lang_names)
rm(en_locale_names)
rm(default_locales)
rm(chr_index_tbl)
rm(chr_index_tbl_i)
rm(chr_from_exemplar)
rm(currency_in_use)
rm(index_chr)
rm(n_regional_currencies)
rm(not_tender_j)
rm(i18n_table_labels)
