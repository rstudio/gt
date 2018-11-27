library(gt)

# Create a display table based on `sleep` Student's Sleep Data

sleep_tbl <-
  gt(data = sleep) %>%
  fmt_scientific(columns = vars(extra)) %>%
  tab_footnote(
    footnote = "This is a footnote",
    locations = cells_data(columns = 1, rows = c(2, 3, 4)))

# Display the table in the Viewer
sleep_tbl
