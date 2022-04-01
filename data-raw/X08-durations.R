library(tidyverse)
library(i18n)

# duration_units <-
#   i18n::units %>%
#   dplyr::select(
#     locale, type,
#     dplyr::starts_with("duration-week"),
#     dplyr::starts_with("duration-day"),
#     dplyr::starts_with("duration-hour"),
#     dplyr::starts_with("duration-minute"),
#     dplyr::starts_with("duration-second")
#   ) %>%
#   dplyr::mutate(locale = gsub("-", "_", locale)) %>%
#   dplyr::bind_rows(
#     i18n::default_locales %>%
#       dplyr::mutate(
#         default_locale = gsub("-", "_", default_locale),
#         base_locale = gsub("-", "_", base_locale)
#       ) %>%
#       dplyr::inner_join(
#         duration_units, by = c("base_locale" = "locale")
#       ) %>%
#       dplyr::select(-base_locale, locale = default_locale)
#   ) %>%
#   dplyr::arrange(locale)
#
# readr::write_rds(duration_units, file = "data-raw/durations.RDS")

durations <- readr::read_rds(file = "data-raw/durations.RDS")
