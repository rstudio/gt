library(gt)

# Create a display table based on `sleep`
# Student's Sleep Data
html_table <-
  gt(data = sleep) %>%
  fmt_scientific(columns = vars(extra)) %>%
  tab_footnote(
    footnote = "This is a footnote",
    locations = cells_data(columns = 1, rows = 1))

# Display the table in the Viewer
html_table
