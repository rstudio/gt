library(gt)
library(tidyverse)

# Create a table that creates a stub and
# stub blocks based on a naming convention
tbl <-
  dplyr::tribble(
    ~groupname, ~rowname, ~value,  ~value_2,
    "A",        "1",      361.1,   260.1,
    "A",        "2",      184.3,   84.4,
    "A",        "3",      342.3,   126.3,
    "A",        "4",      234.9,   37.1,
    "B",        "1",      190.9,   832.5,
    "B",        "2",      743.3,   281.2,
    "B",        "3",      252.3,   732.5,
    "B",        "4",      344.7,   281.2,
    "C",        "1",      197.2,   818.0,
    "C",        "2",      284.3,   394.4)

# Create a display table where individual table
# cells are styled
tab_cell_fmts <-
  gt(tbl) %>%
  tab_style(
    style = apply_styles(
      bkgd_color = "orange",
      text_color = "white"),
    location = data_cells(
      rows = 1, columns = vars(value, value_2)))

tab_cell_fmts

