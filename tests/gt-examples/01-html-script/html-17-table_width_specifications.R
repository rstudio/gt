library(gt)
library(tidyverse)

# Test matrix for setting of column widths; broadly there are 21 cases with
# different combinations of setting dimensions (or not) on table columns with
# px and %, and, setting the table width (or not) in px and %

gt_tbl <-
  exibble |>
  select(num, char, datetime, row) |>
  gt(rowname_col = "row")


#
# I. Defining an absolute table width in pixels
#

# (1) UNDEF
# All columns are variable (equal widths unless
# content in some columns causes width expansion)
gt_tbl |>
  tab_options(table.width = px(800))


# (2) PX
# Define all columns in terms of px values;
# the overall table width of 800px is respected
# (of px values will act as proportions of width,
# as long as their sum isn't greater than the
# overall table width)
gt_tbl |>
  cols_width(
    everything() ~ px(20)
  ) |>
  tab_options(table.width = px(800))


# (3) PX + UNDEF
# Define some columns in terms of px values;
# undefined widths will be variable (based on content,
# filling the remaining width)
gt_tbl |>
  cols_width(
    num ~ px(120),
    char ~ px(140)
  ) |>
  tab_options(table.width = px(800))


# (4) PCT
# If everything is in terms of percentages, the
# proportional widths are normalized, overall
# table width is honored
gt_tbl |>
  cols_width(
    everything() ~ pct(30)
  ) |>
  tab_options(table.width = px(800))


# (5) PCT + UNDEF
# Define some columns in terms of % values;
# undefined widths will be variable (based on content,
# filling the remaining width)
gt_tbl |>
  cols_width(
    row ~ pct(5), # this is the stub column
    char ~ pct(10)
  ) |>
  tab_options(table.width = px(800))


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
  tab_options(table.width = px(800))


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
  tab_options(table.width = px(800))



#
# II. Defining an absolute table width as a percentage
#

# (1) UNDEF
# All columns are variable (equal widths unless
# content in some columns causes width expansion)
gt_tbl |>
  tab_options(table.width = pct(100))

gt_tbl |>
  tab_options(table.width = pct(60))


# (2) PX
# Define all columns in terms of px values;
# the overall table width of 800px is respected
# (of px values will act as proportions of width,
# as long as their sum isn't greater than the
# overall table width)
gt_tbl |>
  cols_width(
    everything() ~ px(20)
  ) |>
  tab_options(table.width = pct(100))

gt_tbl |>
  cols_width(
    everything() ~ px(20)
  ) |>
  tab_options(table.width = pct(80))


# (3) PX + UNDEF
# Define some columns in terms of px values;
# undefined widths will be variable (based on content,
# filling the remaining width)
gt_tbl |>
  cols_width(
    num ~ px(120),
    char ~ px(140)
  ) |>
  tab_options(table.width = pct(100))

gt_tbl |>
  cols_width(
    num ~ px(120),
    char ~ px(140)
  ) |>
  tab_options(table.width = pct(80))


# (4) PCT
# If everything is in terms of percentages, the
# proportional widths are normalized, overall
# table width is honored
gt_tbl |>
  cols_width(
    everything() ~ pct(30)
  ) |>
  tab_options(table.width = pct(100))

gt_tbl |>
  cols_width(
    everything() ~ pct(30)
  ) |>
  tab_options(table.width = pct(80))


# (5) PCT + UNDEF
# Define some columns in terms of % values;
# undefined widths will be variable (based on content,
# filling the remaining width)
gt_tbl |>
  cols_width(
    row ~ pct(5), # this is the stub column
    char ~ pct(10)
  ) |>
  tab_options(table.width = pct(100))

gt_tbl |>
  cols_width(
    row ~ pct(5), # this is the stub column
    char ~ pct(10)
  ) |>
  tab_options(table.width = pct(80))


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
  tab_options(table.width = pct(100))

gt_tbl |>
  cols_width(
    row ~ px(100),
    num ~ px(100),
    char ~ pct(10),
    datetime ~ pct(10)
  ) |>
  tab_options(table.width = pct(80))


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
  tab_options(table.width = pct(100))

gt_tbl |>
  cols_width(
    num ~ px(100),
    char ~ pct(50)
  ) |>
  tab_options(table.width = pct(80))



#
# III. No definition of the table width
#

# (1) UNDEF
# All columns are variable (equal widths unless
# content in some columns causes width expansion)
gt_tbl


# (2) PX
# Define all columns in terms of px values;
# each px is exactly as specified
# NOTE: we intervene and set the table width to 0px
gt_tbl |>
  cols_width(
    everything() ~ px(20)
  )


# (3) PX + UNDEF
# Define some columns in terms of px values;
# undefined widths will be variable (based on content,
# filling the remaining width)
gt_tbl |>
  cols_width(
    num ~ px(120),
    char ~ px(140)
  )


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
  )


# (5) PCT + UNDEF
# Define some columns in terms of % values;
# undefined widths will be variable (based on content,
# filling the remaining width); automatically, w/o
# intervention, the table width goes to 100%
gt_tbl |>
  cols_width(
    row ~ pct(10), # this is the stub column
    char ~ pct(10)
  )


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
  )


# (7) PX + PCT + UNDEF
# Define some columns in terms of px and % values;
# looks as though % columns are scaled and fixed, px
# columns are fixed, other columns expand to fit their
# content
gt_tbl |>
  cols_width(
    num ~ px(100),
    char ~ pct(50)
  )

