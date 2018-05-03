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
  create_summary_lines(
    group = "date",
    columns = "value_1",
    fcns = "mean",
    summary_labels = "mean") %>%
  apply_theme_striped() %>%
  apply_alignment_right(types = "numeric") %>%
  apply_alignment_left(types = "character") %>%
  format_as_number(
    columns = c("value_1", "value_2"),
    decimals = 1) %>%
  apply_font(font = "Helvetica") %>%
  replace_missing_values(replacement = "-")

html_tbl

html_tbl <-
  tab_create(tbl = mtcars) %>%
  apply_theme_striped() %>%
  create_summary_lines(
    group = "cyl",
    columns = c("mpg", "disp", "hp", "drat", "wt", "qsec"),
    fcns = "mean",
    summary_labels = "mean") %>%
  add_stubhead_caption(caption = "the mtcars") %>%
  apply_alignment_right(types = "numeric") %>%
  format_as_number(
    columns = c("mpg", "disp", "hp", "drat", "wt", "qsec"),
    decimals = 1) %>%
  remove_columns(columns = c("vs", "am", "gear", "carb")) %>%
  apply_font(font = "Helvetica")

html_tbl
