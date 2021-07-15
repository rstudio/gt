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

#
# 1/2 - halves
#

tibble_1_2 <-
  dplyr::tibble(
    num   = c(rep(0L, 24), rep(1L, 50), rep(0L, 25)),
    denom = c(rep(0L, 24), rep(2L, 50), rep(0L, 25)),
    value = seq(from = 0.01, to = 0.99, by = 0.01),
    one_up = c(rep(FALSE, 74), rep(TRUE, 25)),
  )

#
# 1/4 - quarters
#

tibble_1_4 <-
  dplyr::tibble(
    num   = c(rep(0L, 12), rep(1L, 25), rep(2L, 25), rep(3L, 25), rep(0L, 12)),
    denom = c(rep(0L, 12), rep(4L, 25), rep(4L, 25), rep(4L, 25), rep(0L, 12)),
    value = seq(from = 0.01, to = 0.99, by = 0.01),
    one_up = c(rep(FALSE, 87), rep(TRUE, 12)),
  )

#
# 1/8 - eighths
#

tibble_1_8 <-
  dplyr::tibble(
    num   = c(
      rep(0L, 6), rep(1L, 12), rep(2L, 13), rep(3L, 12), rep(4L, 13),
      rep(5L, 12), rep(6L, 13), rep(7L, 12), rep(0L, 6)
    ),
    denom = c(
      rep(0L, 6), rep(8L, 12), rep(8L, 13), rep(8L, 12), rep(8L, 13),
      rep(8L, 12), rep(8L, 13), rep(8L, 12), rep(0L, 6)
    ),
    value = seq(from = 0.01, to = 0.99, by = 0.01),
    one_up = c(rep(FALSE, 93), rep(TRUE, 6)),
  )

#
# 1/16 - sixteenths
#

tibble_1_16 <-
  dplyr::tibble(
    num = c(
      rep(0L, 3), rep(1L, 6), rep(2L, 6), rep(3L, 6), rep(4L, 7),
      rep(5L, 6), rep(6L, 6), rep(7L, 6), rep(8L, 7), rep(9L, 6),
      rep(10L, 6), rep(11L, 6), rep(12L, 7), rep(13L, 6), rep(14L, 6),
      rep(15L, 6), rep(0L, 3)
    ),
    denom = c(rep(0L, 3), rep(16L, 93), rep(0L, 3)),
    value = seq(from = 0.01, to = 0.99, by = 0.01),
    one_up = c(rep(FALSE, 96), rep(TRUE, 3)),
  )

#
# 1/10 - tenths
#

tibble_1_10 <-
  dplyr::tibble(
    num = c(
      rep(0L, 4), rep(1L, 10), rep(2L, 10), rep(3L, 10), rep(4L, 10),
      rep(5L, 10), rep(6L, 10), rep(7L, 10), rep(8L, 10), rep(9L, 10),
      rep(0L, 5)
    ),
    denom = c(rep(0L, 4), rep(10L, 90), rep(0L, 5)),
    value = seq(from = 0.01, to = 0.99, by = 0.01),
    one_up = c(rep(FALSE, 94), rep(TRUE, 5)),
  )

#
# 1/100 - hundredths
#

tibble_1_100 <-
  dplyr::tibble(
    num = 1:99,
    denom = 100L,
    value = seq(from = 0.01, to = 0.99, by = 0.01),
    one_up = FALSE,
  )

# Write out three tibbles as CSV data
tibble_100_d %>% readr::write_csv(file = "frac_100_d.csv")
tibble_10_d %>% readr::write_csv(file = "frac_10_d.csv")
tibble_1_d %>% readr::write_csv(file = "frac_1_d.csv")
tibble_1_2 %>% readr::write_csv(file = "frac_1_2.csv")
tibble_1_4 %>% readr::write_csv(file = "frac_1_4.csv")
tibble_1_8 %>% readr::write_csv(file = "frac_1_8.csv")
tibble_1_16 %>% readr::write_csv(file = "frac_1_16.csv")
tibble_1_10 %>% readr::write_csv(file = "frac_1_10.csv")
tibble_1_100 %>% readr::write_csv(file = "frac_1_100.csv")
