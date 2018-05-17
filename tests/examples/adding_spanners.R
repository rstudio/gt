library(gt)
library(tidyverse)

# Create a table with rownames and five columns of
# values
tbl <-
  tibble::tribble(
    ~index,  ~v_1, ~v_2, ~v_3, ~v_4, ~v_5,
    1,       20.4, 36.1, 34.2, 21.6, 23.1,
    2,       25.8, 14.3, 13.7, 12.9, 75.9,
    3,       16.3, 34.3, 15.1, 93.2, 12.1)

# Create a table that groups column headings together
# into panels (e.g., spanner head -> column_headings)
tab_panels <-
  tab_create(tbl = tbl) %>%
  tab_boxhead_panel(
    "v_1_2" = c("v_1", "v_2"),
    "v_4_5" = c("v_4", "v_5")) %>%
  theme_striped()

tab_panels
