library(tidyverse)

#
# denom 100s
#

num_all <- 1:999
denom_all <- 100:999

tibble_100_d <- dplyr::tibble(num = integer(0), denom = integer(0))

for (i in seq_along(num_all)) {
  for (j in seq_along(denom_all)) {

    value <- num_all[i]/denom_all[j]

    if (value >= 0 && value <= 1) {

      tibble_100_d <-
        dplyr::bind_rows(
          tibble_100_d,
          dplyr::tibble(num = num_all[i], denom = denom_all[j])
        )
    }
  }
}

tibble_100_d <-
  tibble_100_d %>%
  dplyr::mutate(value = round(num / denom, 3)) %>%
  dplyr::arrange(value) %>%
  dplyr::filter(denom %% 2 == 0) %>%
  dplyr::group_by(value) %>%
  dplyr::arrange(num, denom) %>%
  dplyr::filter(dplyr::row_number() == 1) %>%
  dplyr::ungroup() %>%
  dplyr::arrange(value) %>%
  dplyr::filter(value != 1) %>%
  dplyr::mutate(denom = ifelse(denom == 668 & num %in% c(1, 667), 1000L, denom)) %>%
  dplyr::select(num, denom, value)

#
# denom 10s
#

num_all <- 1:99
denom_all <- 10:99

tibble_10_d <- dplyr::tibble(num = integer(0), denom = integer(0))

for (i in seq_along(num_all)) {
  for (j in seq_along(denom_all)) {

    value <- num_all[i]/denom_all[j]

    if (value >= 0 && value <= 1) {

      tibble_10_d <-
        dplyr::bind_rows(
          tibble_10_d,
          dplyr::tibble(num = num_all[i], denom = denom_all[j])
        )
    }
  }
}

tibble_10_d <-
  tibble_10_d %>%
  dplyr::mutate(value = round(num / denom, 2)) %>%
  dplyr::arrange(value) %>%
  dplyr::filter(denom %% 2 == 0) %>%
  dplyr::group_by(value) %>%
  dplyr::arrange(num, denom) %>%
  dplyr::filter(dplyr::row_number() == 1) %>%
  dplyr::ungroup() %>%
  dplyr::arrange(value) %>%
  dplyr::filter(value != 1) %>%
  dplyr::mutate(denom = ifelse(denom == 68 & num %in% c(1, 67), 100L, denom)) %>%
  dplyr::mutate(num = ifelse(value == 0.99, 99L, num)) %>%
  dplyr::select(num, denom, value)

#
# denom 1s
#

tibble_1_d <-
  dplyr::tribble(
    ~num, ~denom, ~value,
      1L,    10L,    0.1,
      1L,     4L,    0.2,
      1L,     3L,    0.3,
      3L,     8L,    0.4,
      1L,     2L,    0.5,
      5L,     8L,    0.6,
      2L,     3L,    0.7,
      3L,     4L,    0.8,
      9L,    10L,    0.9
  )


# Write out three tibbles as CSV data
tibble_100_d %>% readr::write_csv(file = "frac_100_d.csv")
tibble_10_d %>% readr::write_csv(file = "frac_10_d.csv")
tibble_1_d %>% readr::write_csv(file = "frac_1_d.csv")

