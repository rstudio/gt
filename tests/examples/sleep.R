library(gt)
library(htmltools)

# Student's Sleep Data

html_table <-
  gt(data = sleep) %>%
  fmt_percent(columns = "extra") %>%
  tab_footnote("This is a footnote", location = target_cell(1, 1)) %>%
  fmt_percent(columns = "extra", decimals = 2) %>%
  fmt_number(columns = "extra", decimals = 2, drop0trailing = FALSE) %>%
  fmt_scientific(columns = "extra", decimals = 2)

# Use the HTML processing step
html_table <- process_html(html_table)

# Create an HTML dependency for the stylesheet
dep <- htmltools::htmlDependency(
  name = 'gt',
  version = '0.1',
  src = gt:::system_file(file = 'css'),
  stylesheet = 'gt.css')

# Attach the dependency to the HTML table
html_tbl <- htmltools::attachDependencies(HTML(html_table), dep)

# Print the object in the Viewer
html_print(html_tbl)
