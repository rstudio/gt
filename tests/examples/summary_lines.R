library(gt)
library(tidyverse)

# Create a table that can be summarized
tbl <-
  tibble::tribble(
    ~date,        ~value_1,   ~value_2,
    "2018-02-10",     20.4,      361.1,
    "2018-02-11",     25.8,      184.3,
    "2018-02-10",     16.3,      342.3,
    "2018-02-11",     28.3,      234.9,
    "2018-02-11",     75.5,      190.9,
    "2018-02-10",     10.9,      743.3,
    "2018-02-11",     63.1,      252.3,
    "2018-02-10",     34.6,      344.7,
    "2018-02-11",     76.2,      197.2,
    "2018-02-11",     55.3,      284.6)

# Create a table -- # does not have rownames initially so this
# does not create group names and summary captions
html_tbl <-
  tab_create(tbl = tbl) %>%
  add_summary(
    group = "date",
    columns = "value_1",
    fcns = "mean",
    summary_labels = "mean") %>%
  theme_striped() %>%
  cols_align_right(types = "numeric") %>%
  cols_align_left(types = "character") %>%
  fmt_number(
    columns = c("value_1", "value_2"),
    decimals = 1) %>%
  fmt_font(font = "Helvetica") %>%
  replace_missing(replacement = "-")

html_tbl

html_tbl <-
  tab_create(tbl = mtcars) %>%
  theme_striped() %>%
  add_summary(
    group = "cyl",
    columns = c("mpg", "disp", "hp", "drat", "wt", "qsec"),
    fcns = "mean",
    summary_labels = "mean") %>%
  tab_stubhead_caption(caption = "the mtcars") %>%
  cols_align_right(types = "numeric") %>%
  fmt_number(
    columns = c("mpg", "disp", "hp", "drat", "wt", "qsec"),
    decimals = 1) %>%
  fmt_font(font = "Helvetica") %>%
  remove_columns(columns = c("vs", "am", "gear", "carb"))

html_tbl
