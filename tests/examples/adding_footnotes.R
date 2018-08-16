library(gt)
library(tidyverse)

# Create a table with rownames and two columns of
# values
tbl <-
  dplyr::tribble(
    ~date,         ~rowname,  ~value_1,  ~value_2,
    "2018-02-10",  "1",       20.4,      361.1,
    "2018-02-10",  "2",       10.9,      743.3,
    "2018-02-10",  "3",       34.6,      344.7,
    "2018-02-10",  "4",        8.3,      342.3,
    "2018-02-11",  "5",       28.3,      234.9,
    "2018-02-11",  "6",       75.5,      190.9,
    "2018-02-11",  "7",       63.1,        2.3,
    "2018-02-11",  "8",       25.8,      184.3,
    "2018-02-11",  "9",        5.2,      197.2,
    "2018-02-11",  "10",      55.3,      284.6)

# Create a display table with footnotes
html_tbl <-
  gt(data = tbl) %>%
  tab_footnote(
    footnote = md("The value for *value_2* is quite small."),
    location = data_cells(7, 3)) %>%
  tab_footnote(
    footnote = "This is a small number.",
    location = data_cells(row = "9", column = 2)) %>%
  tab_footnote(
    footnote = "this is also very small.",
    location = data_cells(row = 4, column = 2))

html_tbl
