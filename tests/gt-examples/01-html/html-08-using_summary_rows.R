library(gt)

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

data <-
  gt(tbl) %>%
  summary_rows(
    groups = c("A", "C"),
    columns = vars(value),
    funs = list(
      ~mean(., na.rm = TRUE),
      ~sum(., na.rm = TRUE),
      ~sd(., na.rm = TRUE))) %>%
  tab_footnote(
    footnote = "Note for Summary A.",
    locations = cells_summary(
      groups = "A", columns = 1, rows = 1)) %>%
  tab_footnote(
    footnote = "Note for Summary C.",
    locations = cells_summary(
      groups = "C", columns = 1, rows = 1))

# View the HTML table
data

# Create a display table with summary rows
data <-
  gt(tbl) %>%
  summary_rows(
    groups = c("A", "C"),
    columns = vars(value),
    funs = funs(
      mean(., na.rm = TRUE),
      sum(., na.rm = TRUE),
      sd(., na.rm = TRUE))) %>%
  summary_rows(
    groups = c("B"),
    columns = vars(value_2),
    funs = funs(
      sum(., na.rm = TRUE))) %>%
  fmt_missing(columns = vars(value, value_2)) %>%
  tab_options(
    summary_row.background.color = "#FFFEEE",
    summary_row.padding = 5,
    stub_group.background.color = "lightblue")

# View the HTML table
data

# Extract the summary data frame from the table object
data %>% extract_summary()

