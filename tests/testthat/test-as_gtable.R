test_that("gt_tbls can be rendered as a gtable", {

  table <-
    pizzaplace |>
    dplyr::filter(type %in% c("classic", "veggie")) |>
    dplyr::group_by(type, size) |>
    dplyr::summarize(
      sold = dplyr::n(),
      income = sum(price),
      .groups = "drop"
    ) |>
    gt(rowname_col = "size", groupname_col = "type") |>
    tab_header(title = "Pizzas Sold in 2015") |>
    fmt_integer(columns = sold) |>
    fmt_currency(columns = income) |>
    summary_rows(
      fns = list(label = "All Sizes", fn = "sum"),
      side = c("top"),
      fmt = list(
        ~ fmt_integer(., columns = sold),
        ~ fmt_currency(., columns = income)
      )
    ) |>
    tab_options(
      summary_row.background.color = "gray95",
      row_group.as_column = TRUE
    ) |>
    tab_stub_indent(
      rows = everything(),
      indent = 2
    ) |>
    grand_summary_rows(
      columns = c("sold", "income"),
      fns = list(Sum ~ sum(.)),
      fmt = ~ fmt_number(.)
    ) |>
    tab_caption("Here be caption text") |>
    tab_spanner(
      label = "Spanner",
      columns = c("sold", "income")
    ) |>
    tab_stubhead("Stubhead label") |>
    tab_source_note("Source: the pizzaria") |>
    tab_footnote("Pineapples not included")

  gtable <- as_gtable(table)

  expect_snapshot(gtable$layout)

  names <- unique(gsub("_[0-9]+$", "", gtable$layout$name))

  expect_in(
    names,
    c("caption", "title", "stubhead", "spanner", "column_label",
      "group_summary", "body_cell", "grand_summary", "source_notes",
      "footnotes", "table_body", "table")
  )
})

test_that("gtable widths are set appropriately", {

  skip_if(packageVersion("grid") < "4.0.0")

  # We want an easy to understand width/height for cells
  dummy_text <- function(...) {
    grid::rectGrob(width = grid::unit(100, "pt"), height = grid::unit(100, "pt"))
  }

  tbl <-
    data.frame(x = 1, y = 1) |>
    gt() |>
    tab_options(
      data_row.padding = "0px",
      data_row.padding.horizontal = "0px",
      column_labels.padding = "0px",
      column_labels.padding.horizontal = "0px"
    )

  # Automatic width is width of the text + margins
  test <- as_gtable(tbl, text_grob = dummy_text)

  expect_equal(
    test$widths,
    grid::unit(c(0.5, 100, 100, 0.5), c("null", "pt", "pt", "null"))
  )
  # The gt_col_heading class has a fixed +1px to bottom padding
  expect_equal(
    test$heights,
    grid::unit(c(100 + parse_px_to_pt("1px"), 100), "pt")
  )

  # Percentage width divides cells into npc units
  test <-
    tbl |>
    tab_options(
      table.width = "80%"
    ) |>
    as_gtable(tbl, text_grob = dummy_text)

  cell_width <-
    grid::unit.pmax(
      grid::unit(100, "pt"),
      grid::unit(0.4, "npc")
    )

  expect_equal(
    test$widths,
    grid::unit.c(
      grid::unit(0.5, "null"),
      cell_width,
      cell_width,
      grid::unit(0.5, "null")
    )
  )

  # Left alignment should have 0 on left, and a null unit on right
  test <-
    tbl |>
    tab_options(
      table.width = "80%",
      table.align = "left"
    ) |>
    as_gtable(tbl, text_grob = dummy_text)

  expect_equal(
    test$widths,
    grid::unit.c(
      grid::unit(0, "pt"),
      cell_width,
      cell_width,
      grid::unit(0.5, "null")
    )
  )

  # Relative margins on both sides
  test <-
    tbl |>
    tab_options(
      table.margin.left = "5%",
      table.margin.right = "15%"
    ) |>
    as_gtable(tbl, text_grob = dummy_text)

  expect_equal(
    as.numeric(test$widths)[1] * 3,
    as.numeric(test$widths)[4]
  )

  # Test relative columns
  # + absolute width
  test <-
    tbl |>
    cols_width(y ~ pct(30)) |>
    tab_options(table.width = px(500)) |>
    as_gtable(text_grob = dummy_text)

  test <- as.numeric(test$widths[2:3])

  expect_equal(test / sum(test), c(0.7, 0.3), tolerance = 1e-6)

  # + relative width
  test <-
    tbl |>
    cols_width(y ~ pct(30)) |>
    tab_options(table.width = pct(50)) |>
    as_gtable(text_grob = dummy_text)

  expect_equal(
    test$widths[2:3],
    grid::unit.pmax(grid::unit(c(100, 0), "pt"), grid::unit(c(0.35, 0.15), "npc"))
  )

  # + unspecified width
  test <-
    tbl |>
    cols_width(y ~ pct(30)) |>
    as_gtable(text_grob = dummy_text)

  test <- as.numeric(test$widths[2:3])

  expect_equal(test / sum(test), c(0.7, 0.3), tolerance = 1e-6)

  expect_equal(min(test), 100)

  test <-
    tbl |>
    cols_width(x ~ pct(20), y ~ px(200)) |>
    as_gtable(tbl, text_grob = dummy_text)

  expect_equal(
    as.character(test$widths),
    c("0.5null", "100points", "150.5625points", "0.5null")
  )
})

test_that("gtable works for cols_merge_n_cert()", {

  tbl_cols_merge <-
    exibble |>
    dplyr::select(num, currency) |>
    dplyr::slice(1:7) |>
    gt() |>
    fmt_number(
      columns = num,
      decimals = 3,
      use_seps = FALSE
    ) |>
    cols_merge_uncert(
      col_val = currency,
      col_uncert = num
    ) |>
    cols_label(currency = "value + uncert.")

  expect_no_error(as_gtable(tbl_cols_merge))
})

test_that("gtable outputs works well for currencies", {

  tbl <-
    exibble |>
    dplyr::select(currency) |>
    gt() |>
    fmt_currency(currency = "GBP")

  expect_no_error(as_gtable(tbl))
})

test_that("gtable output works when row groups are unique (#1802).", {
  # using groupname_col = "row" to ensure uniqueness
  tbl <-
    exibble |>
    gt(groupname_col = "row")

  expect_no_error(test <- as_gtable(tbl))

  expect_equal(
    test$layout$name[8],
    "column_label_8"
  )

  tbl <-
    exibble |>
    gt(groupname_col = "row", row_group_as_column = TRUE)

  expect_no_error(test <- as_gtable(tbl))

  expect_equal(
    test$layout$name[8],
    "column_label_8"
  )
})
