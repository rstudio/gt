library(gt)
library(tidyverse)

# Create a table with rownames and five columns of
# values
tbl <-
  dplyr::tribble(
    ~groupname, ~rowname, ~v_1, ~v_2, ~v_3, ~v_4, ~v_5,
    6,           1,        20.4, 36.1, 34.2, 21.6, 23.1,
    6,           2,        25.8, 14.3, 13.7, 12.9, 75.9,
    10,          3,        16.3, 34.3, 15.1, 93.2, 12.1)

# Create a table that groups column headings together
# into panels (e.g., spanner head -> column_headings)
tab_panels <-
  gt(data = tbl) %>%
  tab_boxhead_panel(
    "v_1_2" = c("v_1", "v_2"),
    "v_4_5" = c("v_4", "v_5")) %>%
  tab_stubhead_caption(caption = "caption") %>%
  cols_rename(
    "%" = "v_1", "% change" = "v_2",
    "%" = "v_4", "% change" = "v_5",
    "a" = "v_3") %>%
  cols_move_to_start("v_3")

tab_panels
