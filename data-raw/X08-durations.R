library(tidyverse)

# Note: the following code generates all of the locale-specific word fragments
#       for the `fmt_duration()` function. The package is still somewhat
#       unstable (as of 2022-07-08) but it will soon get another CRAN release
#       focused on API stability. When that occurs, the following code will be
#       uncommented and regular updates to the `duration_units` dataset will be
#       made.

# library(i18n)
#
# duration_units <-
#   i18n::units |>
#   dplyr::select(
#     locale, type,
#     dplyr::starts_with("duration-week"),
#     dplyr::starts_with("duration-day"),
#     dplyr::starts_with("duration-hour"),
#     dplyr::starts_with("duration-minute"),
#     dplyr::starts_with("duration-second")
#   ) |>
#   dplyr::mutate(locale = gsub("-", "_", locale)) |>
#   dplyr::bind_rows(
#     i18n::default_locales |>
#       dplyr::mutate(
#         default_locale = gsub("-", "_", default_locale),
#         base_locale = gsub("-", "_", base_locale)
#       ) |>
#       dplyr::inner_join(
#         duration_units, by = c("base_locale" = "locale")
#       ) |>
#       dplyr::select(-base_locale, locale = default_locale)
#   ) |>
#   dplyr::arrange(locale)
#
# readr::write_rds(duration_units, file = "data-raw/durations.RDS")

durations <- readr::read_rds(file = "data-raw/durations.RDS")
