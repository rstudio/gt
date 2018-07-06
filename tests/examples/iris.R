library(gt)

# Create a presentation table based on `iris`
# Edgar Anderson's Iris Data

# 1 - we take the `datasets::iris` data.frame
#   - the dot-notation column naming format (i.e., `[heading].[caption]`)
#     is used to automatically creating spanner headings to add structure
# 2 - the `Species` column is moved to the start of the column series
# 3 - we are formatting numbers in the named columns to have 1 decimal place
# 4 - a heading is added
# 5 - a source note is added
iris_tbl <-
  gt(data = iris) %>% # 1
  cols_move_to_start(columns = "Species") %>% # 2
  fmt_number(
    columns = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"),
    decimals = 1
    ) %>% # 3
  tab_heading(
    title = md("The **iris** dataset"),
    headnote = md("[All about *Iris setosa*, *versicolor*, and *virginica*]")) %>% # 4
  tab_source_note(
    source_note = md("The data were collected by *Anderson* (1935).")) # 5

# Display the table in the Viewer
iris_tbl
