library(gt)
library(tidyverse)

# Create a table with options applied to every type of table part
tbl <-
  dplyr::tribble(
    ~date,         ~rowname, ~col_1, ~col_2, ~col_3, ~col_4,
    "2018-02-10",  "1",       767.6,  928.1,  382.0,  674.5,
    "2018-02-10",  "2",       403.3,  461.5,   15.1,  242.8,
    "2018-02-10",  "3",       686.4,   54.1,  282.7,   56.3,
    "2018-02-10",  "4",       662.6,  148.8,  984.6,  928.1,
    "2018-02-11",  "5",       198.5,   65.1,  127.4,  219.3,
    "2018-02-11",  "6",       132.1,  118.1,   91.2,  874.3,
    "2018-02-11",  "7",       349.7,  307.1,  566.7,  542.9,
    "2018-02-11",  "8",        63.7,  504.3,  152.0,  724.5,
    "2018-02-11",  "9",       105.4,  729.8,  962.4,  336.4,
    "2018-02-11",  "10",      924.2,  424.6,  740.8,  104.2
  )

# Create a display table
many_options_tbl <-
  tbl %>%
  gt(groupname_col = "date") %>%
  tab_header(
    title = "The Title",
    subtitle = "The Subtitle"
  ) %>%
  tab_stubhead(label = "Stubhead Label") %>%
  tab_spanner(
    label = "Group 1",
    columns = vars(col_1, col_2)
  ) %>%
  tab_spanner(
    label = "Group 2",
    columns = vars(col_3, col_4)
  ) %>%
  tab_footnote(
    footnote = "Footnote #1",
    locations = cells_body(
      columns = vars(col_1), rows = 1
    )
  ) %>%
  tab_footnote(
    footnote = "Footnote #2",
    locations = cells_body(
      columns = vars(col_2), rows = 2
    )
  ) %>%
  tab_footnote(
    footnote = "Footnote #3",
    locations = cells_body(
      columns = vars(col_3), rows = 3
    )
  ) %>%
  tab_footnote(
    footnote = "Footnote #4",
    locations = cells_body(
      columns = vars(col_4), rows = 4
    )
  ) %>%
  tab_source_note("A source note for the table.") %>%
  tab_options(
    table.font.size = px(14),            # Entire table's font size
    table.background.color = "aliceblue",# Entire table's background color
    table.width = px(360),               # Entire table's width
    table.border.top.style = "solid",    # Top line of table - style
    table.border.top.width = px(3),      # Top line of table - width
    table.border.top.color = "orange",   # Top line of table - color
    heading.background.color = "lightblue",   # Heading background color
    heading.title.font.size = px(18),         # Title of heading font size
    heading.subtitle.font.size = px(14),      # Subtitle font size
    heading.border.bottom.style = "solid",    # Bottom line of heading - style
    heading.border.bottom.width = px(5),      # Bottom line of heading - width
    heading.border.bottom.color = "purple",   # Bottom line of heading - color
    column_labels.font.size = px(16),                # Column labels - font size
    column_labels.font.weight = "normal",            # Column labels - font weight
    column_labels.background.color = "olivedrab",    # Column labels background color
    row_group.background.color = "green",        # Row group background color
    row_group.font.size = px(14),                # Row group labels - font size
    row_group.font.weight = "800",               # Row group labels - font weight
    row_group.border.top.style = "solid",        # Top line of row group - style
    row_group.border.top.width = px(5),          # Top line of row group - width
    row_group.border.top.color = "blue",         # Top line of row group - color
    row_group.border.bottom.style = "solid",     # Bottom line of row group - style
    row_group.border.bottom.width = px(4),       # Bottom line of row group - width
    row_group.border.bottom.color = "orange",    # Bottom line of row group - color
    table_body.border.top.style = "solid",          # Top line of table body - style
    table_body.border.top.width = px(5),            # Top line of table body - width
    table_body.border.top.color = "chocolate1",     # Top line of table body - color
    table_body.border.bottom.style = "solid",       # Bottom line of table body - style
    table_body.border.bottom.width = px(5),         # Bottom line of table body - width
    table_body.border.bottom.color = "turquoise",   # Bottom line of table body - color
    data_row.padding = px(8),                     # Padding of all data rows (stub & table body)
    summary_row.background.color = "pink",     # background color of all summary rows (stub & table body)
    summary_row.padding = px(3),               # padding of all summary rows (stub & table body)
    summary_row.text_transform = "lowercase",  # text transform on all summary row labels
    footnotes.font.size = px(12),           # text size of the footnotes block
    footnotes.padding = px(3),              # padding of the footnotes block
    source_notes.font.size = px(12),    # text size of the source notes block
    source_notes.padding = px(3)        # padding of the source note block
  )

many_options_tbl
