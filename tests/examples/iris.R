library(gt)
library(tidyverse)

# Create a presentation table based on `iris`
# Edgar Anderson's Iris Data

# 1 - we take the `datasets::iris` data.frame and move `Species` to front during ingest
# 2 - the 'striped' theme is applied
# 3 - we are taking the column naming format `[heading].[caption]` and
#     automatically creating spanner headings to add structure
# 4 - all column values are center aligned
# 5 - we are formatting numbers in the named columns to have 1 decimal place
# 6 - a heading is added
# 7 - a source note is added
iris_tbl <-
  gt(tbl = iris %>%
       dplyr::select(Species, everything())) %>%  # 1
  apply_theme_striped() %>%  # 2
  apply_spanner_headings() %>%  # 3
  apply_alignment_center() %>%  # 4
  format_as_number(
    columns = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"),
    decimals = 1) %>%  # 5
  add_heading(
    title = "The `iris` dataset",
    headnote = "[A rather famous dataset about Iris setosa, versicolor, and virginica]",
    table_number = 1) %>%  # 6
  add_source_note(
    source_note = "Anderson, Edgar (1935).",
    lead_in = "The data were collected by ")  # 7

# Display the table in the Viewer
iris_tbl
