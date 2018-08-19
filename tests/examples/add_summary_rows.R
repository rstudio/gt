library(gt)
library(tidyverse)

# Create a table that creates a stub and
# stub blocks based on a naming convention
tbl <-
  dplyr::tribble(
    ~groupname, ~rowname, ~value,  ~value_2,
    "A",        "1",      NA,      260.1,
    "A",        "2",      184.3,   84.4,
    "A",        "3",      342.3,   126.3,
    "A",        "4",      234.9,   NA,
    "B",        "1",      190.9,   832.5,
    "B",        "2",      743.3,   281.2,
    "B",        "3",      252.3,   732.5,
    "B",        "4",      344.7,   NA,
    "C",        "1",      197.2,   818.0,
    "C",        "2",      284.3,   394.4)

# Create a display table with summary rows
data <-
  gt(tbl) %>%
  summary_rows(
    groups = vars(A, C),
    columns = vars(value),
    funs = funs(
      mean(., na.rm = TRUE),
      sum(., na.rm = TRUE),
      sd(., na.rm = TRUE)),
    labels = c("mean", "sum", "sd")) %>%
  summary_rows(
    groups = vars(B),
    columns = vars(value_2),
    funs = funs(
      sum(., na.rm = TRUE)),
    labels = "sum") %>%
  fmt_missing(columns = vars(value, value_2)) %>%
  tab_options(
    summary_row.background.color = "#FFFEEE",
    summary_row.padding = 5,
    stub_group.background.color = "lightblue")

# View the HTML table
data

# Extract the summary data frame from the table object
data %>% extract_summary()
