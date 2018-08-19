library(tidyverse)
library(gt)

# Create a table with rownames and four columns of values
tbl <-
  dplyr::tribble(
    ~groupname,    ~rowname, ~col_1, ~col_2, ~col_3, ~col_4,
    "2018-02-10",  "1",        20.4,  361.1,  361.1,  361.1,
    "2018-02-10",  "2",        10.9,  743.3,  743.3,  743.3,
    "2018-02-10",  "3",        34.6,  344.7,  234.2,  344.7,
    "2018-02-10",  "4",         8.3,  342.3,  342.3,  342.3,
    "2018-02-11",  "5",        28.3,  234.9,   23.3,  234.9,
    "2018-02-11",  "6",        75.5,  190.9,   10.9,  190.9,
    "2018-02-11",  "7",        63.1,    2.3,   22.2,    2.3,
    "2018-02-11",  "8",        25.8,  184.3,  184.3,  184.3,
    "2018-02-11",  "9",         5.2,  197.2,  197.2,  197.2,
    "2018-02-11",  "10",       55.3,  284.6,  284.6,  284.6)

data <-
  gt(tbl) %>%
  tab_heading(title = "The Title", headnote = "The Headnote") %>%
  tab_stubhead_caption(caption = "Stubhead Caption") %>%
  tab_boxhead_panel(group = "Group 1", columns = vars(col_1, col_2)) %>%
  tab_boxhead_panel(group = "Group 2", columns = vars(col_3, col_4)) %>%
  summary_rows(
    funs = funs(mean, sum),
    groups = vars("2018-02-10"),
    columns = vars(col_1, col_2),
    decimals = 1) %>%
  tab_footnote(
    footnote = "Footnote #1",
    location = data_cells(row = 1, column = 1)) %>%
  tab_footnote(
    footnote = "Footnote below",
    location = data_cells(row = 2, column = 1)) %>%
  tab_source_note("Source Note") %>%
  tab_options(
    table.font.size = 14,                # Entire table's font size
    table.background.color = NULL,       # Entire table's background color
    table.width = "100%",                # Entire table's width
    table.border.top.style = "dotted",   # Top line of table - style
    table.border.top.width = 3,          # Top line of table - width
    table.border.top.color = "orange",   # Top line of table - color
    heading.background.color = "lightblue",   # Heading background color
    heading.title.font.size = 18,        # Title of heading font size
    heading.headnote.font.size = 14,     # Headnote font size
    heading.border.bottom.style = "dotted",    # Bottom line of heading - style
    heading.border.bottom.width = 5,           # Bottom line of heading - width
    heading.border.bottom.color = "purple",    # Bottom line of heading - color
    boxhead.font.size = 16,                    # Boxhead labels - font size
    boxhead.font.weight = "normal",            # Boxhead labels - font weight
    boxhead.background.color = "gray",         # Boxhead background color
    stub_group.background.color = "green",     # Stub group background color
    stub_group.font.size = 14,                    # Stub group labels - font size
    stub_group.font.weight = 800,              # Stub group labels - font weight
    stub_group.border.top = "dashed 5px blue",    # works but split into separate components
    stub_group.border.bottom = "dashed 4px yellow",     # works but split into separate components
    field.border.top = "solid 5px purple",     # works but split into separate components
    field.border.bottom = "solid 5px purple",  # works but split into separate components
    row.padding = 8,                           # padding of all data rows (stub & field)
    row.striping.background.color = "red",     # -- does nothing currently
    row.striping.include.stub = FALSE,         # -- does nothing currently
    row.striping.include_field = TRUE,         # -- does nothing currently
    summary_row.background.color = "pink", # -- background color of all summary rows (stub & field)
    summary_row.padding = 3,                   # padding of all summary rows (stub & field)
    summary_row.text_transform = "lowercase",  # text transform on all summary row labels
    footnote.font.size = 12,                   # text size of the footnotes block
    footnote.padding = 3,                      # padding of the footnotes block
    sourcenote.font.size = 12,                 # text size of the source notes block
    sourcenote.padding = 3                     # padding of the source note block
  )

data
