library(gt)
library(tidyverse)

# Create a table that can be summarized
tbl <-
  tibble::tribble(
    ~groupname,   ~rowname,     ~value,  ~value_2,
    "A",          "1",          361.1,   260.1,
    "A",          "2",          184.3,   84.4,
    "A",          "3",          342.3,   126.3,
    "A",          "4",          234.9,   37.1,
    "B",          "1",          190.9,   832.5,
    "B",          "2",          743.3,   281.2,
    "B",          "3",          252.3,   732.5,
    "B",          "4",          344.7,   281.2,
    "C",          "1",          197.2,   818.0,
    "C",          "2",          284.6,   394.4)


tbl_2 <-
  tab_create(tbl = tbl) %>%
  apply_theme_striped() %>%
  apply_alignment_center() %>%
  apply_font(font = "Helvetica") %>%
  add_stubhead_caption(caption = "groups", alignment = "center")

tbl_2
