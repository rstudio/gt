library(gt)
library(tidyverse)
library(readr)

# Create a display table that uses markdown
"- item 1\n- item 2\n\n" -> markdown_text
"**bold** text<sup>2</sup>" -> markdown_text

commonmark::markdown_xml(markdown_text) |> cat()
gt:::markdown_to_rtf(markdown_text) |> cat()

md_tbl <-
  dplyr::tibble(markdown = markdown_text) |>
  gt() |>
  fmt_markdown(markdown) |>
  tab_options(
    table.width = pct(100)
  )

out_path <- "tests/gt-examples/rtf_output/md.rtf"

md_tbl |> gtsave(out_path)

readr::read_file(out_path) |> cat()

unicode_tbl <-
  dplyr::tibble(a = "a\u2014b", b = "**bold** \u2014") |>
  gt() |>
  fmt_markdown(columns = b) |>
  tab_header(title = "title a\u2014b", subtitle = "subtitle a\u2014b") |>
  tab_source_note("source note a\u2014b") |>
  tab_footnote("footnote a\u2014b", locations = cells_body(1, 1))

unicode_tbl |> gtsave("tests/gt-examples/rtf_output/unicode.rtf")

# Create a display table based on `iris`
iris_tbl <-
  gt(iris) |>
  tab_spanner_delim(delim = ".") |>
  cols_move_to_start(columns = Species) |>
  fmt_number(
    columns = c(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width),
    decimals = 1
  ) |>
  tab_header(
    title = md("The **iris** dataset"),
    subtitle = md("[All about *Iris setosa*, *versicolor*, and *virginica*]")
  ) |>
  tab_source_note(
    source_note = "The data were collected by Anderson (1935)."
  ) |>
  tab_footnote("Hello!", cells_title("title"))

iris_tbl |> gtsave("tests/gt-examples/rtf_output/iris.rtf")

# Create two display tables based on `exibble`
exibble_tbl <-
  exibble |>
  dplyr::mutate(char = paste(">", char)) |>
  gt() |>
  fmt_markdown(char)

exibble_tbl |>  gtsave("tests/gt-examples/rtf_output/exibble.rtf")

passthrough_tbl <-
  exibble |>
  gt() |>
  fmt_passthrough(columns = char, pattern = "1 {x} 2")

passthrough_tbl |>  gtsave("tests/gt-examples/rtf_output/passthrough.rtf")

# Create a display table based on `morley`
morley_tbl <-
  gt(morley) |>
  fmt_number(
    columns = Speed,
    decimals = 0,
    sep_mark = ",") |>
  cols_align(align = "left", columns = c(Run, Speed))

morley_tbl |> gtsave("tests/gt-examples/rtf_output/morley.rtf")

# Create a display table based on `pressure`
pressure_tbl <-
  gt(pressure) |>
  fmt_scientific(
    columns = pressure,
    decimals = 2
  )

pressure_tbl |> gtsave("tests/gt-examples/rtf_output/pressure.rtf")

# Create a display table based on `sleep`
sleep_tbl <-
  gt(sleep) |>
  fmt_scientific(columns = extra) |>
  tab_footnote(
    footnote = "This is a footnote",
    locations = cells_body(columns = 1, rows = c(2, 3, 4))
  )

sleep_tbl |> gtsave("tests/gt-examples/rtf_output/sleep.rtf")

# Create a display table based on `airquality`
airquality_tbl <-
  gt(airquality) |>
  cols_move_to_start(columns = c(Month, Day)) |>
  cols_label(Solar.R = md("Solar  \nRadiation")) |>
  fmt_number(
    columns = Wind,
    decimals = 2
  ) |>
  cols_label(Month = md("**Month**")) |>
  tab_spanner(
    label = "Measurement Period",
    columns = c(Month, Day)
  ) |>
  sub_missing(columns = c(Solar.R, Wind, Temp)) |>
  sub_missing(columns = Ozone, missing_text = I("---"))

airquality_tbl |> gtsave("tests/gt-examples/rtf_output/airquality.rtf")

sp500_tbl <-
  readr::read_csv(
    system.file("extdata", "sp500.csv", package = "gt"),
    col_types = "cddddd"
  ) |>
  gt() |>
  fmt_date(
    columns = Date,
    date_style = 6
  ) |>
  fmt_currency(
    columns = c(High, Open, Low, Close),
    currency = "USD",
    scale_by = 1/1000,
    pattern = "{x}K"
  ) |>
  fmt_number(
    columns = Volume,
    decimals = 3,
    scale_by = 1E-9,
    pattern = "{x}B"
  )

sp500_tbl |> gtsave("tests/gt-examples/rtf_output/sp500.rtf")

# Input table
tbl <-
  dplyr::tribble(
    ~groups,  ~rowname, ~value,  ~value_2,
    "A",      "1",      NA,      260.1,
    "A",      "2",      184.3,   84.4,
    "A",      "3",      342.3,   126.3,
    "A",      "4",      234.9,   NA,
    "B",      "1",      190.9,   832.5,
    "B",      "2",      743.3,   281.2,
    "B",      "3",      252.3,   732.5,
    "B",      "4",      344.7,   NA,
    "C",      "1",      197.2,   818.0,
    "C",      "2",      284.3,   394.4
  )

# Create a display table with summary rows
summary_tbl <-
  tbl |>
  gt(groupname_col = "groups") |>
  summary_rows(
    groups = c("A", "C"),
    columns = value,
    fns = list(
      ~mean(., na.rm = TRUE),
      ~sum(., na.rm = TRUE),
      ~sd(., na.rm = TRUE)
    )
  ) |>
  grand_summary_rows(
    columns = value_2,
    fns = list(
      ~mean(., na.rm = TRUE),
      ~sum(., na.rm = TRUE),
      ~sd(., na.rm = TRUE)
    )
  ) |>
  tab_footnote(
    footnote = "Note for Summary A.",
    locations = cells_summary(
      groups = "A", columns = 1, rows = 1)
  ) |>
  tab_footnote(
    footnote = "Note for Summary C.",
    locations = cells_summary(
      groups = "C", columns = 1, rows = 1)
  ) |>
  sub_missing(columns = c(value, value_2)) |>
  tab_options(
    summary_row.background.color = "#FFFEEE",
    row_group.background.color = "lightblue"
  )

summary_tbl |> gtsave("tests/gt-examples/rtf_output/summary.rtf")

# Create a table with values and uncertainties
tbl <-
  dplyr::tribble(
    ~value_1, ~uncertainty, ~value_2, ~uncertainty_2,
    0.352,    0.10,         0.32,     NA_real_,
    0.983,    0.13,         NA_real_, NA_real_,
    0.639,    NA_real_,     0.21,     0.10,
    NA_real_, 0.17,         0.74,     0.15
  )

# Create a display table with uncertainties
uncert_tbl <-
  gt(tbl) |>
  cols_merge_uncert(
    col_val = value_1,
    col_uncert = uncertainty
  ) |>
  cols_merge_uncert(
    col_val = value_2,
    col_uncert = uncertainty_2
  ) |>
  fmt_number(
    columns = c(value_1, value_2),
    decimals = 2
  ) |>
  sub_missing(columns = c(value_1, value_2))

uncert_tbl |> gtsave("tests/gt-examples/rtf_output/uncert.rtf")

# Create a table where rows are formatted conditionally
conditional_tbl <-
  readr::read_csv(
    system.file("extdata", "sp500.csv", package = "gt"),
    col_types = "cddddd"
  ) |>
  gt() |>
  fmt_number(
    columns = Open,
    rows = Open > 1900,
    decimals = 3,
    scale_by = 1/1000,
    pattern = "{x}K"
  ) |>
  fmt_number(
    columns = Close,
    rows = High < 1940 & Low > 1915,
    decimals = 3
  ) |>
  fmt_currency(
    columns = c(High, Low, Close),
    rows = Date > "2016-02-20",
    currency = "USD"
  )

conditional_tbl |> gtsave("tests/gt-examples/rtf_output/conditional.rtf")

# Create a table that has a stubhead label
tbl <-
  dplyr::tribble(
    ~groups, ~rowname, ~value_1, ~value_2,
    "A",        "1",      361.1,    260.1,
    "A",        "2",      184.3,    84.4,
    "A",        "3",      342.3,    126.3,
    "A",        "4",      234.9,    37.1,
    "B",        "1",      190.9,    832.5,
    "B",        "2",      743.3,    281.2,
    "B",        "3",      252.3,    732.5,
    "B",        "4",      344.7,    281.2,
    "C",        "1",      197.2,    818.0,
    "C",        "2",      284.6,    394.4
  )

# Create a display table
sh_caption_tbl <-
  tbl |>
  gt(groupname_col = "groups") |>
  tab_stubhead(label = "groups")

sh_caption_tbl |> gtsave("tests/gt-examples/rtf_output/sh_caption.rtf")


# Create a table with footnotes in various cell types
tbl <-
  dplyr::tribble(
    ~date,        ~rowname,  ~value_1,  ~value_2,
    "2018-02-10", "1",       20.4,      361.1,
    "2018-02-10", "2",       10.9,      743.3,
    "2018-02-10", "3",       34.6,      344.7,
    "2018-02-10", "4",        8.3,      342.3,
    "2018-02-11", "5",       28.3,      234.9,
    "2018-02-11", "6",       75.5,      190.9,
    "2018-02-11", "7",       63.1,        2.3,
    "2018-02-11", "8",       25.8,      184.3,
    "2018-02-11", "9",        5.2,      197.2,
    "2018-02-11", "10",      55.3,      284.6
  )

# Create a display table
footnotes_tbl <-
  gt(tbl, groupname_col = "date") |>
  tab_header(title = md("The Table `Title`"), subtitle = "The subtitle.") |>
  tab_spanner(
    label = "values",
    columns = starts_with("value")
  ) |>
  tab_footnote(
    footnote = "This is an even smaller number.",
    locations = cells_body(columns = value_1, rows = 9)
  ) |>
  tab_footnote(
    footnote = "This is a small number.",
    locations = cells_body(columns = value_1, rows = 4)
  ) |>
  tab_footnote(
    footnote = "First data cell.",
    locations = cells_body(columns = "value_1", rows = 1)
  ) |>
  tab_footnote(
    footnote = "The first row group",
    locations = cells_row_groups(groups = ends_with("10"))
  ) |>
  tab_footnote(
    footnote = "Two sets of values",
    locations = cells_column_spanners(spanners = starts_with("val"))
  ) |>
  tab_footnote(
    footnote = "A stub cell.",
    locations = cells_stub(rows = 1)
  ) |>
  tab_footnote(
    footnote = md("`value_1` is the first column of values."),
    locations = cells_column_labels(columns = value_1)
  ) |>
  tab_footnote(
    footnote = md("The `title` can get a footnote."),
    locations = cells_title(groups = "title")
  ) |>
  tab_footnote(
    footnote = md("The `subtitle` can likewise get a footnote."),
    locations = cells_title(groups = "subtitle")
  )

footnotes_tbl |> gtsave("tests/gt-examples/rtf_output/footnotes.rtf")

# Create a table with spanner column labels
tbl <-
  dplyr::tribble(
    ~v_1, ~v_2, ~v_3, ~v_4, ~v_5,
    20.4, 36.1, 34.2, 21.6, 23.1,
    25.8, 14.3, 13.7, 12.9, 75.9,
    16.3, 34.3, 15.1, 93.2, 12.1
  )

# Create a display table
spanner_tbl <-
  gt(tbl) |>
  tab_spanner(
    label = "v_1_2",
    columns =  c("v_1", "v_2")
  ) |>
  tab_spanner(
    label = "v_4_5",
    columns = c("v_4", "v_5")
  ) |>
  cols_move_to_start(columns = "v_3")

spanner_tbl |> gtsave("tests/gt-examples/rtf_output/spanner.rtf")

# Create a display table where individual table cells are styled
tbl <-
  dplyr::tribble(
    ~rowname, ~value,  ~value_2,
    "1",      361.1,   260.1,
    "2",      184.3,   84.4,
    "3",      342.3,   126.3,
    "4",      234.9,   37.1,
    "1",      190.9,   832.5,
    "2",      743.3,   281.2,
    "3",      252.3,   732.5,
    "4",      344.7,   281.2
  )

# Create a display table
cell_styles_tbl <-
  gt(tbl) |>
  tab_style(
    style = cell_text(size = px(28)),
    locations = cells_column_labels(
      columns = c("value", "value_2"))
  ) |>
  tab_style(
    style = list(
      cell_fill(color = "orange"),
      cell_text(color = "white")
    ),
    locations = cells_body(
      columns = c(value, value_2),
      rows = 1
    )
  )

cell_styles_tbl |> gtsave("tests/gt-examples/rtf_output/cell_styles.rtf")


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
  tbl |>
  gt(groupname_col = "date") |>
  tab_header(
    title = "The Title",
    subtitle = "The Subtitle"
  ) |>
  tab_stubhead(label = "Stubhead Label") |>
  tab_spanner(
    label = "Group 1",
    columns = c(col_1, col_2)
  ) |>
  tab_spanner(
    label = "Group 2",
    columns = c(col_3, col_4)
  ) |>
  tab_footnote(
    footnote = "Footnote #1",
    locations = cells_body(
      columns = col_1, rows = 1
    )
  ) |>
  tab_footnote(
    footnote = "Footnote #2",
    locations = cells_body(
      columns = col_2, rows = 2
    )
  ) |>
  tab_footnote(
    footnote = "Footnote #3",
    locations = cells_body(
      columns = col_3, rows = 3
    )
  ) |>
  tab_footnote(
    footnote = "Footnote #4",
    locations = cells_body(
      columns = col_4, rows = 4
    )
  ) |>
  tab_source_note("A source note for the table.") |>
  tab_options(
    table.font.size = px(14),            # Entire table's font size
    table.background.color = "aliceblue",# Entire table's background color
    table.width = px(360),               # Entire table's width
    table.border.top.style = "solid",    # Top line of table - style
    table.border.top.width = px(3),      # Top line of table - width
    table.border.top.color = "#99AA22",   # Top line of table - color
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
    row_group.border.top.color = "#FF3388",         # Top line of row group - color
    row_group.border.bottom.style = "solid",     # Bottom line of row group - style
    row_group.border.bottom.width = px(4),       # Bottom line of row group - width
    row_group.border.bottom.color = "#229900",    # Bottom line of row group - color
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

many_options_tbl |> gtsave("tests/gt-examples/rtf_output/many_options.rtf")

# Tests with summaries

tbl_1 <-
  dplyr::tribble(
    ~col_1, ~col_2, ~col_3, ~col_4,    ~row,       ~group,
    767.6,  928.1,  382.0,  674.5,   "one", "first_five",
    403.3,  461.5,   15.1,  242.8,   "two", "first_five",
    686.4,   54.1,  282.7,   56.3, "three", "first_five",
    662.6,  148.8,  984.6,  928.1,  "four", "first_five",
    198.5,   65.1,  127.4,  219.3,  "five", "first_five",
    132.1,  118.1,   91.2,  874.3,   "six", "2nd_five",
    349.7,  307.1,  566.7,  542.9, "seven", "2nd_five",
    63.7,  504.3,  152.0,  724.5, "eight", "2nd_five",
    105.4,  729.8,  962.4,  336.4,  "nine", "2nd_five",
    924.2,  424.6,  740.8,  104.2,   "ten", "2nd_five"
  )

summary_tbl_1 <-
  gt(tbl_1) |>
  grand_summary_rows(
    columns = col_1,
    fns = list(average = ~ mean(., na.rm = TRUE))
  )

summary_tbl_1 |> gtsave("tests/gt-examples/rtf_output/summary_tbl_1.rtf")

summary_tbl_2 <-
  gt(tbl_1, rowname_col = "row") |>
  grand_summary_rows(
    columns = col_1,
    fns = list(average = ~ mean(., na.rm = TRUE))
  )

summary_tbl_2 |> gtsave("tests/gt-examples/rtf_output/summary_tbl_2.rtf")

summary_tbl_3 <-
  gt(tbl_1, groupname_col = "group") |>
  grand_summary_rows(
    columns = col_1,
    fns = list(average = ~ mean(., na.rm = TRUE))
  )

summary_tbl_3 |> gtsave("tests/gt-examples/rtf_output/summary_tbl_3.rtf")

summary_tbl_4 <-
  gt(tbl_1, rowname_col = "row", groupname_col = "group") |>
  grand_summary_rows(
    columns = col_1,
    fns = list(average = ~ mean(., na.rm = TRUE))
  )

summary_tbl_4 |> gtsave("tests/gt-examples/rtf_output/summary_tbl_4.rtf")

summary_tbl_5 <-
  gt(tbl_1, groupname_col = "group") |>
  summary_rows(
    groups = "first_five",
    columns = col_1,
    fns = list(average = ~ mean(., na.rm = TRUE))
  )

summary_tbl_5 |> gtsave("tests/gt-examples/rtf_output/summary_tbl_5.rtf")

summary_tbl_6 <-
  gt(tbl_1, rowname_col = "row", groupname_col = "group") |>
  summary_rows(
    groups = "first_five",
    columns = col_1,
    fns = list(average = ~ mean(., na.rm = TRUE))
  )

summary_tbl_6 |> gtsave("tests/gt-examples/rtf_output/summary_tbl_6.rtf")
