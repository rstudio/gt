library(gt)
library(tidyverse)

# Create a table that creates a stub and
# row groups based on magic column names

# Input table
tbl <-
  dplyr::tribble(
    ~groups,  ~rowname, ~value,  ~value_2,
    "A",      "1",      NA,      260.1,
    "A",      "2",      184.3,   84.4,
    "A",      "3",      342.3,   126.3,
    "A",      "4",      234.9,   NA,
    "B",      "1",      190.9,   832.5,
    "B",      "2",      743.3,   281.2,
    "B",      "3",      252.3,   732.5,
    "B",      "4",      344.7,   NA,
    "C",      "1",      197.2,   818.0,
    "C",      "2",      284.3,   394.4
  )

# Create a display table with summary rows
summary_tbl <-
  tbl |>
  gt(groupname_col = "groups") |>
  summary_rows(
    groups = c("A", "C"),
    columns = "value",
    fns = list(
      ~ mean(., na.rm = TRUE),
      ~ sum(., na.rm = TRUE),
      ~ sd(., na.rm = TRUE)
    )
  ) |>
  tab_footnote(
    footnote = "Note for Summary A.",
    locations = cells_summary(
      groups = "A",
      columns = value,
      rows = 1
    )
  ) |>
  tab_footnote(
    footnote = "Note for Summary C.",
    locations = cells_summary(
      groups = "C",
      columns = value,
      rows = 1
    )
  ) |>
  sub_missing(columns = c(value, value_2)) |>
  tab_options(
    summary_row.background.color = "#FFFEEE",
    row_group.background.color = "lightblue"
  )

summary_tbl

# Extract the summary data frame from the table object
summary_tbl |> extract_summary()
