library(gt)
library(tidyverse)

# Create a presentation table based on `iris`
# Edgar Anderson's Iris Data

# 1 - we take the `datasets::iris` data.frame
# 2 - the `Species` column is moved to the start of the column series
# 3 - the 'striped' theme is applied
# 4 - we are taking the column naming format `[heading].[caption]` and
#     automatically creating spanner headings to add structure
# 5 - we are formatting numbers in the named columns to have 1 decimal place
# 6 - a heading is added
# 7 - a source note is added
iris_tbl <-
  tab_create(tbl = iris) %>%  # 1
  cols_move_to_start(columns = "Species") %>%  # 2
  theme_striped() %>%  # 3
  tab_boxhead_panel(use_names = TRUE) %>%  # 4
  fmt_number(
    columns = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"),
    decimals = 1
    ) %>%  # 5
  tab_heading(
    title = "The **iris** dataset",
    headnote = "[All about *Iris setosa*, *versicolor*, and *virginica*]",
    table_number = 1
    ) %>%  # 6
  tab_source_note(
    source_note = "*Anderson* (1935).",
    lead_in = "The data were collected by "
    )  # 7

# Display the table in the Viewer
iris_tbl
