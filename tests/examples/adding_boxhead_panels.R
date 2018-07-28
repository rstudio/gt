library(gt)
library(tidyverse)

# Create a table with rownames and five columns of
# values
tbl <-
  dplyr::tribble(
    ~v_1, ~v_2, ~v_3, ~v_4, ~v_5,
     20.4, 36.1, 34.2, 21.6, 23.1,
     25.8, 14.3, 13.7, 12.9, 75.9,
     16.3, 34.3, 15.1, 93.2, 12.1)

# Create a table that put column headings
# together into panels under group headings
tab_panels <-
  gt(data = tbl) %>%
  tab_boxhead_panel(
    group = "v_1_2", columns =  c("v_1", "v_2")) %>%
  tab_boxhead_panel(
    group = "v_4_5", columns = c("v_4", "v_5")) %>%
  cols_move_to_start("v_3")

tab_panels
