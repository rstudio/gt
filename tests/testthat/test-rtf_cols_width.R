test_that("cols_width() works for RTF output tables", {

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
  gt_tbl_1 <-
    gt_tbl |>
    tab_options(table.width = px(400))

  expect_snapshot_rtf(gt_tbl_1)

  # (2) PX
  # Define all columns in terms of px values;
  # the overall table width of 400px is respected
  # (of px values will act as proportions of width,
  # as long as their sum isn't greater than the
  # overall table width)
  gt_tbl_2 <-
    gt_tbl |>
    cols_width(
      everything() ~ px(100)
    ) |>
    tab_options(table.width = px(400))

  expect_snapshot_rtf(gt_tbl_2)

  # (3) PX + UNDEF
  # Define some columns in terms of px values;
  # undefined widths will be variable (based on content,
  # filling the remaining width)
  gt_tbl_3 <-
    gt_tbl |>
    cols_width(
      num ~ px(120),
      char ~ px(140)
    ) |>
    tab_options(table.width = px(400))

  expect_snapshot_rtf(gt_tbl_3)

  # (4) PCT
  # If everything is in terms of percentages, the
  # proportional widths are normalized, overall
  # table width is honored
  gt_tbl_4 <-
    gt_tbl |>
    cols_width(
      everything() ~ pct(30)
    ) |>
    tab_options(table.width = px(400))

  expect_snapshot_rtf(gt_tbl_4)

  # (5) PCT + UNDEF
  # Define some columns in terms of % values;
  # undefined widths will be variable (based on content,
  # filling the remaining width)
  gt_tbl_5 <-
    gt_tbl |>
    cols_width(
      row ~ pct(5), # this is the stub column
      char ~ pct(10)
    ) |>
    tab_options(table.width = px(400))

  expect_snapshot_rtf(gt_tbl_5)

  # (6) PX + PCT
  # Define all columns in terms of either px or %;
  # these are all converted to proportions but the
  # exact routine is not intuitive; table.width seems
  # to be constant no matter what values are given
  # for the column widths
  gt_tbl_6 <-
    gt_tbl |>
    cols_width(
      row ~ px(100),
      num ~ px(100),
      char ~ pct(10),
      datetime ~ pct(10)
    ) |>
    tab_options(table.width = px(400))

  expect_snapshot_rtf(gt_tbl_6)

  # (7) PX + PCT + UNDEF
  # Define some columns in terms of px and % values;
  # looks as though % columns are scaled and fixed, px
  # columns are fixed, other columns take up the remaining
  # space (if any); table.width seems to be constant no
  # matter what values are given for the column widths
  gt_tbl_7 <-
    gt_tbl |>
    cols_width(
      num ~ px(100),
      char ~ pct(50)
    ) |>
    tab_options(table.width = px(400))

  expect_snapshot_rtf(gt_tbl_7)

  #
  # II. Defining an absolute table width as a percentage
  #

  # (1) UNDEF
  # All columns are variable (equal widths unless
  # content in some columns causes width expansion)
  expect_snapshot_rtf(tab_options(gt_tbl, table.width = pct(100)))

  expect_snapshot_rtf(tab_options(gt_tbl, table.width = pct(60)))

  # (2) PX
  # Define all columns in terms of px values;
  # the overall table width of 600px is respected
  # (of px values will act as proportions of width,
  # as long as their sum isn't greater than the
  # overall table width)
  gt_tbl_2 <-
    gt_tbl |>
    cols_width(
      everything() ~ px(120)
    )

  expect_snapshot_rtf(tab_options(gt_tbl_2, table.width = pct(100)))

  expect_snapshot_rtf(tab_options(gt_tbl_2, table.width = pct(80)))

  # (3) PX + UNDEF
  # Define some columns in terms of px values;
  # undefined widths will be variable (based on content,
  # filling the remaining width)
  gt_tbl_3 <-
    gt_tbl |>
    cols_width(
      num ~ px(120),
      char ~ px(140)
    )

  expect_snapshot_rtf(tab_options(gt_tbl_3, table.width = pct(100)))

  expect_snapshot_rtf(tab_options(gt_tbl_3, table.width = pct(80)))

  # (4) PCT
  # If everything is in terms of percentages, the
  # proportional widths are normalized, overall
  # table width is honored
  gt_tbl_4 <-
    gt_tbl |>
    cols_width(
      everything() ~ pct(30)
    )

  expect_snapshot_rtf(tab_options(gt_tbl_4, table.width = pct(100)))

  expect_snapshot_rtf(tab_options(gt_tbl_4, table.width = pct(80)))

  # (5) PCT + UNDEF
  # Define some columns in terms of % values;
  # undefined widths will be variable (based on content,
  # filling the remaining width)
  gt_tbl_5 <-
    gt_tbl |>
    cols_width(
      row ~ pct(5), # this is the stub column
      char ~ pct(10)
    )

  expect_snapshot_rtf(tab_options(gt_tbl_5, table.width = pct(100)))

  expect_snapshot_rtf(tab_options(gt_tbl_5, table.width = pct(80)))

  # (6) PX + PCT
  # Define all columns in terms of either px or %;
  # these are all converted to proportions but the
  # exact routine is not intuitive; table.width seems
  # to be constant no matter what values are given
  # for the column widths
  gt_tbl_6 <-
    gt_tbl |>
    cols_width(
      row ~ px(100),
      num ~ px(100),
      char ~ pct(10),
      datetime ~ pct(10)
    )

  expect_snapshot_rtf(tab_options(gt_tbl_6, table.width = pct(100)))

  expect_snapshot_rtf(tab_options(gt_tbl_6, table.width = pct(80)))

  # (7) PX + PCT + UNDEF
  # Define some columns in terms of px and % values;
  # looks as though % columns are scaled and fixed, px
  # columns are fixed, other columns take up the remaining
  # space (if any); table.width seems to be constant no
  # matter what values are given for the column widths
  gt_tbl_7 <-
    gt_tbl |>
    cols_width(
      num ~ px(100),
      char ~ pct(50)
    )

  expect_snapshot_rtf(tab_options(gt_tbl_7, table.width = pct(100)))

  expect_snapshot_rtf(tab_options(gt_tbl_7, table.width = pct(80)))

  #
  # III. No definition of the table width
  #

  # (1) UNDEF
  # All columns are variable (equal widths unless
  # content in some columns causes width expansion)
  expect_snapshot_rtf(gt_tbl)

  # (2) PX
  # Define all columns in terms of px values;
  # each px is exactly as specified
  # NOTE: we intervene and set the table width to 0px
  gt_tbl_2 <-
    gt_tbl |>
    cols_width(
      everything() ~ px(20)
    )

  expect_snapshot_rtf(gt_tbl_2)

  # (3) PX + UNDEF
  # Define some columns in terms of px values;
  # undefined widths will be variable (based on content,
  # filling the remaining width)
  gt_tbl_3 <-
    gt_tbl |>
    cols_width(
      num ~ px(120),
      char ~ px(140)
    )

  expect_snapshot_rtf(gt_tbl_3)

  # (4) PCT
  # If everything is in terms of percentages, the
  # proportional widths are normalized
  # NOTE: we intervene and set the table width to 100%
  gt_tbl_4 <-
    gt_tbl |>
    cols_width(
      row ~ pct(30),
      num ~ pct(30),
      char ~ pct(10),
      datetime ~ pct(10)
    )

  expect_snapshot_rtf(gt_tbl_4)

  # (5) PCT + UNDEF
  # Define some columns in terms of % values;
  # undefined widths will be variable (based on content,
  # filling the remaining width); automatically, w/o
  # intervention, the table width goes to 100%
  gt_tbl_5 <-
    gt_tbl |>
    cols_width(
      row ~ pct(10), # this is the stub column
      char ~ pct(10)
    )

  expect_snapshot_rtf(gt_tbl_5)

  # (6) PX + PCT
  # Define all columns in terms of either px or %;
  # these are all converted to proportions but the
  # exact routine is not intuitive; automatically, w/o
  # intervention, the table width goes to 100%
  gt_tbl_6 <-
    gt_tbl |>
    cols_width(
      row ~ px(100),
      num ~ px(100),
      char ~ pct(10),
      datetime ~ pct(10)
    )

  expect_snapshot_rtf(gt_tbl_6)

  # (7) PX + PCT + UNDEF
  # Define some columns in terms of px and % values;
  # looks as though % columns are scaled and fixed, px
  # columns are fixed, other columns expand to fit their
  # content
  gt_tbl_7 <-
    gt_tbl |>
    cols_width(
      num ~ px(100),
      char ~ pct(50)
    )

  expect_snapshot_rtf(gt_tbl_7)
})

test_that("col_width_resolver_rtf() works correctly", {

  tw <- function(x) paste0(x, "tw")

  page_body_width_portrait <- 12240L - 1440L - 1440L

  expect_error(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = "-1tw",
      col_widths = "1tw",
      n_cols = 1
    )
  )

  expect_error(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = "1tw",
      col_widths = "-1tw",
      n_cols = 1
    )
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = "auto",
      col_widths = NULL,
      n_cols = 3
    ),
    c(3120, 3120, 3120)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = "1000tw",
      col_widths = NULL,
      n_cols = 3
    ),
    c(333, 333, 333)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(900),
      col_widths = tw(c(200, 200, 200)),
      n_cols = 3
    ),
    c(200, 200, 200)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(1200),
      col_widths = pct(c(100, 200, 300)),
      n_cols = 3
    ),
    c(200, 400, 600)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(1200),
      col_widths = c(pct(c(100, 200, 300)), "", ""),
      n_cols = 5
    ),
    c(200, 400, 600, 0, 0)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(1200),
      col_widths = c(pct(c(10, 20, 30)), "", ""),
      n_cols = 5
    ),
    c(120, 240, 360, 240, 240)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(1000),
      col_widths = c("500tw", "50%", "50%"),
      n_cols = 3
    ),
    c(500, 250, 250)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(1000),
      col_widths = c("500tw", "10%", "10%"),
      n_cols = 3
    ),
    c(500, 250, 250)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(1000),
      col_widths = c("500tw", "10%", "10%", "", ""),
      n_cols = 5
    ),
    c(500, 100, 100, 150, 150)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(1000),
      col_widths = c("500tw", "25%", "25%", "", ""),
      n_cols = 5
    ),
    c(500, 250, 250, 0, 0)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(100),
      col_widths = rep_len("50tw", 3),
      n_cols = 3
    ),
    c(50, 50, 50)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(100),
      col_widths = rep_len("0%", 3),
      n_cols = 3
    ),
    c(0, 0, 0)
  )
})

test_that("parse_length_str() works correctly", {

  lengths_vec_list <-
    list(
      c("20px", "20px", "20px", "20px"),
      c("20px", "20px", "", ""),
      c("20%", "20%", "30%", "40%"),
      c("", "", "", ""),
      c("20px", "20%", "20px", "20%"),
      c("20%", "20px", "", "30px"),
      c("1.2in", "230pt", "3.03cm", "502.1mm"),
      c("400tw", "", "20%", "301mm")
    )

  value_vec_list <-
    list(
      c(20, 20, 20, 20),
      c(20, 20, NA, NA),
      c(20, 20, 30, 40),
      rep(NA_real_, 4),
      c(20, 20, 20, 20),
      c(20, 20, NA, 30),
      c(1.2, 230, 3.03, 502.1),
      c(400, NA, 20, 301)
    )

  unit_vec_list <-
    list(
      c("px", "px", "px", "px"),
      c("px", "px", NA, NA),
      c("%", "%", "%", "%"),
      rep(NA_character_, 4),
      c("px", "%", "px", "%"),
      c("%", "px", NA, "px"),
      c("in", "pt", "cm", "mm"),
      c("tw", NA, "%", "mm")
    )

  for (i in seq_along(lengths_vec_list)) {

    lengths_tbl <-
      parse_length_str(
        lengths_vec = lengths_vec_list[[i]],
        allow_negative = FALSE
      )

    expect_type(lengths_tbl, "list")
    expect_s3_class(lengths_tbl, "data.frame")
    expect_equal(lengths_tbl[["value"]], value_vec_list[[i]])
    expect_equal(lengths_tbl[["unit"]], unit_vec_list[[i]])
  }

  expect_error(
    parse_length_str(
      lengths_vec = "-6px",
      allow_negative = FALSE
    )
  )

  parsed_length_1 <-
    parse_length_str(
      lengths_vec = "-6px",
      allow_negative = TRUE
  )

  expect_equal(parsed_length_1[["value"]], -6)

  expect_equal(parsed_length_1[["unit"]], "px")

  parsed_length_2 <-
    parse_length_str(
      lengths_vec = character(0L),
      allow_negative = TRUE
    )

  expect_type(parsed_length_2, "list")

  expect_s3_class(parsed_length_2, "data.frame")

  expect_equal(nrow(parsed_length_2), 0)

  # `parse_length_str()` doesn't check for valid units
  # so anything that fits the `(%|[a-z]+)` will work
  parsed_length_3 <- parse_length_str(lengths_vec = "6.234points")

  expect_equal(parsed_length_3[["value"]], 6.234)

  expect_equal(parsed_length_3[["unit"]], "points")

  # NA values cannot be used
  expect_error(
    parse_length_str(
      lengths_vec = NA_character_,
      allow_negative = TRUE
    )
  )
})

test_that("abs_len_to_twips() works correctly", {

  lengths_vec_list <-
    list(
      c("20px", "20px", "20px", "20px"),
      c("20px", "20px", "", ""),
      c("20%", "20%", "30%", "40%"),
      c("", "", "", ""),
      c("20px", "20%", "20px", "20%"),
      c("20%", "20px", "", "30px"),
      c("1.2in", "230pt", "3.03cm", "502.1mm"),
      c("400tw", "", "20%", "301mm")
    )

  value_vec_list <-
    list(
      rep(300, 4),
      c(300, 300, NA, NA),
      c(20, 20, 30, 40),
      rep(NA_real_, 4),
      c(300, 20, 300, 20),
      c(20, 300, NA, 450),
      c(1728, 4600, 1717.795, 28465.51),
      c(400, NA, 20, 17064.57)
    )

  unit_vec_list <-
    list(
      rep("tw", 4),
      c("tw", "tw", NA, NA),
      rep("%", 4),
      rep(NA_character_, 4),
      c("tw", "%", "tw", "%"),
      c("%", "tw", NA, "tw"),
      rep("tw", 4),
      c("tw", NA, "%", "tw")
    )

  for (i in seq_along(lengths_vec_list)) {

    lengths_tbl <-
      abs_len_to_twips(parse_length_str(lengths_vec_list[[i]]))

    expect_type(lengths_tbl, "list")

    expect_s3_class(lengths_tbl, "data.frame")

    expect_equal(lengths_tbl[["value"]], value_vec_list[[i]], tolerance = 0.1)

    expect_equal(lengths_tbl[["unit"]], unit_vec_list[[i]])
  }
})
