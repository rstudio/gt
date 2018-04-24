library(gt)
library(tidyverse)

# Create a presentation table based on `iris`
# Edgar Anderson's Iris Data

# 1 - we take the `datasets::iris` data.frame
# 2 - the `Species` column is moved to the start of the column series
# 3 - the 'striped' theme is applied
# 4 - we are taking the column naming format `[heading].[caption]` and
#     automatically creating spanner headings to add structure
# 5 - all column values are center aligned
# 6 - we are formatting numbers in the named columns to have 1 decimal place
# 7 - a heading is added
# 8 - a source note is added
iris_tbl <-
  gt(tbl = iris) %>%  # 1
  move_columns_to_start(columns = "Species") %>%  # 2
  apply_theme_striped() %>%  # 3
  apply_spanner_headings(use_names = TRUE) %>%  # 4
  apply_alignment_center() %>%  # 5
  format_as_number(
    columns = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"),
    decimals = 1) %>%  # 6
  add_heading(
    title = "The `iris` dataset",
    headnote = "[A rather famous dataset about Iris setosa, versicolor, and virginica]",
    table_number = 1) %>%  # 7
  add_source_note(
    source_note = "Anderson, Edgar (1935).",
    lead_in = "The data were collected by ")  # 8

# Display the table in the Viewer
iris_tbl
