library(gt)

# Create a table with options applied to every type of table part

# Input table
tbl <-
  dplyr::tribble(
    ~groupname,    ~rowname, ~col_1, ~col_2, ~col_3, ~col_4,
    "2018-02-10",  "1",       767.6,  928.1,  382.0,  674.5,
    "2018-02-10",  "2",       403.3,  461.5,   15.1,  242.8,
    "2018-02-10",  "3",       686.4,   54.1,  282.7,   56.3,
    "2018-02-10",  "4",       662.6,  148.8,  984.6,  928.1,
    "2018-02-11",  "5",       198.5,   65.1,  127.4,  219.3,
    "2018-02-11",  "6",       132.1,  118.1,   91.2,  874.3,
    "2018-02-11",  "7",       349.7,  307.1,  566.7,  542.9,
    "2018-02-11",  "8",        63.7,  504.3,  152.0,  724.5,
    "2018-02-11",  "9",       105.4,  729.8,  962.4,  336.4,
    "2018-02-11",  "10",      924.2,  424.6,  740.8,  104.2)

# Create a display table
many_options_tbl <-
  gt(tbl) %>%
  tab_header(
    title = "The Title",
    subtitle = "The Subtitle"
  ) %>%
  tab_stubhead_label(label = "Stubhead Label") %>%
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
    locations = cells_data(columns = 1, rows = 1)
  ) %>%
  tab_footnote(
    footnote = "Footnote #2",
    locations = cells_data(columns = 2, rows = 2)
  ) %>%
  tab_footnote(
    footnote = "Footnote #3",
    locations = cells_data(columns = 3, rows = 3)
  ) %>%
  tab_footnote(
    footnote = "Footnote #4",
    locations = cells_data(columns = 4, rows = 4)
  ) %>%
  tab_source_note("A source note for the table.") %>%
  tab_options(
    table.font.size = px(14),            # Entire table's font size
    table.background.color = NULL,       # Entire table's background color
    table.width = px(360),              # Entire table's width
    table.border.top.style = "solid",    # Top line of table - style
    table.border.top.width = px(3),      # Top line of table - width
    table.border.top.color = "orange",   # Top line of table - color
    heading.background.color = "lightblue",   # Heading background color
    heading.title.font.size = px(18),    # Title of heading font size
    heading.subtitle.font.size = px(14), # Subtitle font size
    heading.border.bottom.style = "solid",     # Bottom line of heading - style
    heading.border.bottom.width = px(5),       # Bottom line of heading - width
    heading.border.bottom.color = "purple",    # Bottom line of heading - color
    column_labels.font.size = px(16),                # Column labels - font size
    column_labels.font.weight = "normal",            # Column labels - font weight
    column_labels.background.color = "lightgray",    # Column labels background color
    stub_group.background.color = "green",     # Stub group background color
    stub_group.font.size = px(14),             # Stub group labels - font size
    stub_group.font.weight = "800",            # Stub group labels - font weight
    stub_group.border.top.style = "solid",     # Top line of stub group - style
    stub_group.border.top.width = px(5),       # Top line of stub group - width
    stub_group.border.top.color = "blue",      # Top line of stub group - color
    stub_group.border.bottom.style = "solid",     # Bottom line of stub group - style
    stub_group.border.bottom.width = px(4),       # Bottom line of stub group - width
    stub_group.border.bottom.color = "orange",    # Bottom line of stub group - color
    field.border.top.style = "solid",          # Top line of field - style
    field.border.top.width = px(5),            # Top line of field - width
    field.border.top.color = "indianred",      # Top line of field - color
    field.border.bottom.style = "solid",       # Bottom line of field - style
    field.border.bottom.width = px(5),         # Bottom line of field - width
    field.border.bottom.color = "turquoise",   # Bottom line of field - color
    row.padding = px(8),                       # Padding of all data rows (stub & field)
    summary_row.background.color = "pink", # -- background color of all summary rows (stub & field)
    summary_row.padding = px(3),               # padding of all summary rows (stub & field)
    summary_row.text_transform = "lowercase",  # text transform on all summary row labels
    footnote.font.size = px(12),               # text size of the footnotes block
    footnote.padding = px(3),                  # padding of the footnotes block
    sourcenote.font.size = px(12),             # text size of the source notes block
    sourcenote.padding = px(3)                 # padding of the source note block
  )

many_options_tbl
