library(gt)
library(tidyverse)

# Test matrix for setting of column widths; broadly there are 21 cases with
# different combinations of setting dimensions (or not) on table columns with
# px and %, and, setting the table width (or not) in px and %

gt_tbl <-
  exibble |>
  dplyr::select(num, char, datetime, row, group) |>
  gt(rowname_col = "row", groupname_col = "group") |>
  tab_header(title = "Table Title", subtitle = "Table Subtitle") |>
  tab_source_note(source_note = "Table Source Note") |>
  tab_footnote(footnote = "Table Footnote", locations = cells_title("title"))


#
# I. Defining an absolute table width in pixels
#

# (1) UNDEF
# All columns are variable (equal widths unless
# content in some columns causes width expansion)
gt_tbl |>
  tab_options(table.width = px(400)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_1_1.rtf")


# (2) PX
# Define all columns in terms of px values;
# the overall table width of 400px is respected
# (of px values will act as proportions of width,
# as long as their sum isn't greater than the
# overall table width)
gt_tbl |>
  cols_width(
    everything() ~ px(100)
  ) |>
  tab_options(table.width = px(400)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_1_2.rtf")


# (3) PX + UNDEF
# Define some columns in terms of px values;
# undefined widths will be variable (based on content,
# filling the remaining width)
gt_tbl |>
  cols_width(
    num ~ px(120),
    char ~ px(140)
  ) |>
  tab_options(table.width = px(400)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_1_3.rtf")


# (4) PCT
# If everything is in terms of percentages, the
# proportional widths are normalized, overall
# table width is honored
gt_tbl |>
  cols_width(
    everything() ~ pct(30)
  ) |>
  tab_options(table.width = px(400)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_1_4.rtf")


# (5) PCT + UNDEF
# Define some columns in terms of % values;
# undefined widths will be variable (based on content,
# filling the remaining width)
gt_tbl |>
  cols_width(
    row ~ pct(5), # this is the stub column
    char ~ pct(10)
  ) |>
  tab_options(table.width = px(400)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_1_5.rtf")


# (6) PX + PCT
# Define all columns in terms of either px or %;
# these are all converted to proportions but the
# exact routine is not intuitive; table.width seems
# to be constant no matter what values are given
# for the column widths
gt_tbl |>
  cols_width(
    row ~ px(100),
    num ~ px(100),
    char ~ pct(10),
    datetime ~ pct(10)
  ) |>
  tab_options(table.width = px(400)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_1_6.rtf")


# (7) PX + PCT + UNDEF
# Define some columns in terms of px and % values;
# looks as though % columns are scaled and fixed, px
# columns are fixed, other columns take up the remaining
# space (if any); table.width seems to be constant no
# matter what values are given for the column widths
gt_tbl |>
  cols_width(
    num ~ px(100),
    char ~ pct(50)
  ) |>
  tab_options(table.width = px(400)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_1_7.rtf")



#
# II. Defining an absolute table width as a percentage
#

# (1) UNDEF
# All columns are variable (equal widths unless
# content in some columns causes width expansion)
gt_tbl |>
  tab_options(table.width = pct(100)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_2_1a.rtf")

gt_tbl |>
  tab_options(table.width = pct(60)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_2_1b.rtf")


# (2) PX
# Define all columns in terms of px values;
# the overall table width of 600px is respected
# (of px values will act as proportions of width,
# as long as their sum isn't greater than the
# overall table width)
gt_tbl |>
  cols_width(
    everything() ~ px(120)
  ) |>
  tab_options(table.width = pct(100)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_2_2a.rtf")

gt_tbl |>
  cols_width(
    everything() ~ px(120)
  ) |>
  tab_options(table.width = pct(80)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_2_2b.rtf")


# (3) PX + UNDEF
# Define some columns in terms of px values;
# undefined widths will be variable (based on content,
# filling the remaining width)
gt_tbl |>
  cols_width(
    num ~ px(120),
    char ~ px(140)
  ) |>
  tab_options(table.width = pct(100)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_2_3a.rtf")

gt_tbl |>
  cols_width(
    num ~ px(120),
    char ~ px(140)
  ) |>
  tab_options(table.width = pct(80)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_2_3b.rtf")


# (4) PCT
# If everything is in terms of percentages, the
# proportional widths are normalized, overall
# table width is honored
gt_tbl |>
  cols_width(
    everything() ~ pct(30)
  ) |>
  tab_options(table.width = pct(100)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_2_4a.rtf")

gt_tbl |>
  cols_width(
    everything() ~ pct(30)
  ) |>
  tab_options(table.width = pct(80)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_2_4b.rtf")


# (5) PCT + UNDEF
# Define some columns in terms of % values;
# undefined widths will be variable (based on content,
# filling the remaining width)
gt_tbl |>
  cols_width(
    row ~ pct(5), # this is the stub column
    char ~ pct(10)
  ) |>
  tab_options(table.width = pct(100)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_2_5a.rtf")

gt_tbl |>
  cols_width(
    row ~ pct(5), # this is the stub column
    char ~ pct(10)
  ) |>
  tab_options(table.width = pct(80)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_2_5b.rtf")


# (6) PX + PCT
# Define all columns in terms of either px or %;
# these are all converted to proportions but the
# exact routine is not intuitive; table.width seems
# to be constant no matter what values are given
# for the column widths
gt_tbl |>
  cols_width(
    row ~ px(100),
    num ~ px(100),
    char ~ pct(10),
    datetime ~ pct(10)
  ) |>
  tab_options(table.width = pct(100)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_2_6a.rtf")

gt_tbl |>
  cols_width(
    row ~ px(100),
    num ~ px(100),
    char ~ pct(10),
    datetime ~ pct(10)
  ) |>
  tab_options(table.width = pct(80)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_2_6b.rtf")


# (7) PX + PCT + UNDEF
# Define some columns in terms of px and % values;
# looks as though % columns are scaled and fixed, px
# columns are fixed, other columns take up the remaining
# space (if any); table.width seems to be constant no
# matter what values are given for the column widths
gt_tbl |>
  cols_width(
    num ~ px(100),
    char ~ pct(50)
  ) |>
  tab_options(table.width = pct(100)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_2_7a.rtf")

gt_tbl |>
  cols_width(
    num ~ px(100),
    char ~ pct(50)
  ) |>
  tab_options(table.width = pct(80)) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_2_7b.rtf")



#
# III. No definition of the table width
#

# (1) UNDEF
# All columns are variable (equal widths unless
# content in some columns causes width expansion)
gt_tbl |>
  gtsave("tests/gt-examples/rtf_output/col_widths_3_1.rtf")


# (2) PX
# Define all columns in terms of px values;
# each px is exactly as specified
# NOTE: we intervene and set the table width to 0px
gt_tbl |>
  cols_width(
    everything() ~ px(20)
  ) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_3_2.rtf")


# (3) PX + UNDEF
# Define some columns in terms of px values;
# undefined widths will be variable (based on content,
# filling the remaining width)
gt_tbl |>
  cols_width(
    num ~ px(120),
    char ~ px(140)
  ) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_3_3.rtf")


# (4) PCT
# If everything is in terms of percentages, the
# proportional widths are normalized
# NOTE: we intervene and set the table width to 100%
gt_tbl |>
  cols_width(
    row ~ pct(30),
    num ~ pct(30),
    char ~ pct(10),
    datetime ~ pct(10)
  ) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_3_4.rtf")


# (5) PCT + UNDEF
# Define some columns in terms of % values;
# undefined widths will be variable (based on content,
# filling the remaining width); automatically, w/o
# intervention, the table width goes to 100%
gt_tbl |>
  cols_width(
    row ~ pct(10), # this is the stub column
    char ~ pct(10)
  ) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_3_5.rtf")


# (6) PX + PCT
# Define all columns in terms of either px or %;
# these are all converted to proportions but the
# exact routine is not intuitive; automatically, w/o
# intervention, the table width goes to 100%
gt_tbl |>
  cols_width(
    row ~ px(100),
    num ~ px(100),
    char ~ pct(10),
    datetime ~ pct(10)
  ) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_3_6.rtf")


# (7) PX + PCT + UNDEF
# Define some columns in terms of px and % values;
# looks as though % columns are scaled and fixed, px
# columns are fixed, other columns expand to fit their
# content
gt_tbl |>
  cols_width(
    num ~ px(100),
    char ~ pct(50)
  ) |>
  gtsave("tests/gt-examples/rtf_output/col_widths_3_7.rtf")

