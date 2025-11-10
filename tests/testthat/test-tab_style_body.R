test_that("tab_style_body() works correctly", {

  # Generate a table that will be used in checks of body styling
  gt_tbl <-
    sp500 |>
    dplyr::filter(date >= "2015-01-05", date <= "2015-01-16") |>
    dplyr::arrange(date) |>
    dplyr::mutate(week = paste0("W", strftime(date, format = "%V"))) |>
    dplyr::select(-adj_close, -volume) |>
    gt(
      rowname_col = "date",
      groupname_col = "week"
    )

  #
  # Target literal body cell values with the `values` argument
  #

  gt_tbl_2 <-
    gt_tbl |>
    tab_style_body(
      style = cell_fill(color = "orange"),
      values = c(2046.13, 2028.26, 2018.40, 1988.12, 2030.25)
    )

  expect_true(gt_tbl |> render_as_html() != gt_tbl_2 |> render_as_html())

  expect_snapshot_html(gt_tbl_2)

  gt_tbl_3 <-
    gt_tbl |>
    tab_style_body(
      style = list(
        cell_text(font = google_font("Inter"), color = "white"),
        cell_fill(color = "red"),
        cell_borders(
          sides = c("left", "right"),
          color = "steelblue",
          weight = px(4)
        )
      ),
      values = c(2046.13, 2028.26, 2018.40, 1988.12, 2030.25)
    )

  expect_true(gt_tbl |> render_as_html() != gt_tbl_3 |> render_as_html())

  expect_snapshot_html(gt_tbl_3)

  #
  # Target rows and columns
  #

  gt_tbl_4 <-
    gt_tbl |>
    tab_style_body(
      style = cell_fill(color = "orange"),
      values = c(1988.12, 2030.25),
      targets = "row"
    )

  expect_true(gt_tbl |> render_as_html() != gt_tbl_4 |> render_as_html())

  expect_snapshot_html(gt_tbl_4)

  gt_tbl_5 <-
    gt_tbl |>
    tab_style_body(
      style = cell_fill(color = "orange"),
      values = c(1988.12, 2030.25),
      targets = "column"
    )

  expect_true(gt_tbl |> render_as_html() != gt_tbl_5 |> render_as_html())

  expect_snapshot_html(gt_tbl_5)

  gt_tbl_6 <-
    gt_tbl |>
    tab_style_body(
      style = cell_fill(color = "orange"),
      values = c(1988.12, 2030.25),
      targets = "column"
    ) |>
    tab_style_body(
      style = cell_fill(color = "lightblue"),
      values = c(1988.12, 2030.25),
      targets = "row"
    )

  expect_true(gt_tbl |> render_as_html() != gt_tbl_6 |> render_as_html())

  expect_snapshot_html(gt_tbl_6)

  gt_tbl_7 <-
    gt_tbl |>
    tab_style_body(
      style = cell_fill(color = "lightblue"),
      values = c(1988.12, 2030.25),
      targets = "row"
    ) |>
    tab_style_body(
      style = cell_fill(color = "orange"),
      values = c(1988.12, 2030.25),
      targets = "column"
    )

  expect_true(gt_tbl |> render_as_html() != gt_tbl_7 |> render_as_html())

  expect_snapshot_html(gt_tbl_7)

  gt_tbl_8 <-
    gt_tbl |>
    tab_style_body(
      style = cell_fill(color = "yellow"),
      values = c(1988.12, 2030.25),
      targets = "cell"
    )

  expect_true(gt_tbl |> render_as_html() != gt_tbl_8 |> render_as_html())

  expect_snapshot_html(gt_tbl_8)

  #
  # Use the `extents` argument to project styling to other locations
  #

  gt_tbl_9 <-
    gt_tbl |>
    tab_style_body(
      style = cell_fill(color = "yellow"),
      values = c(1988.12, 2030.25),
      targets = "row",
      extents = "stub"
    )

  expect_true(gt_tbl |> render_as_html() != gt_tbl_9 |> render_as_html())

  expect_snapshot_html(gt_tbl_9)

  gt_tbl_10 <-
    gt_tbl |>
    tab_style_body(
      style = cell_fill(color = "yellow"),
      values = c(1988.12, 2030.25),
      targets = "row",
      extents = c("body", "stub")
    )

  expect_true(gt_tbl |> render_as_html() != gt_tbl_10 |> render_as_html())

  expect_snapshot_html(gt_tbl_10)

  gt_tbl_11 <-
    gt_tbl |>
    tab_style_body(
      style = cell_fill(color = "yellow"),
      values = c(1988.12, 2030.25),
      targets = "row",
      extents = "body"
    )

  expect_true(gt_tbl |> render_as_html() != gt_tbl_11 |> render_as_html())

  expect_snapshot_html(gt_tbl_11)

  gt_tbl_12 <-
    gt_tbl |>
    tab_style_body(
      style = cell_fill(color = "yellow"),
      values = c(1988.12, 2030.25),
      targets = "column",
      extents = c("body", "stub")
    )

  expect_true(gt_tbl |> render_as_html() != gt_tbl_12 |> render_as_html())

  expect_snapshot_html(gt_tbl_12)

  # Generate an alternate table that will be used in checks of body styling
  gt_tbl_alt <-
    exibble |>
    gt(rowname_col = "row", groupname_col = "group")

  #
  # Use the `pattern` argument to target body cells through a regex pattern
  #

  gt_tbl_13 <-
    gt_tbl_alt |>
    tab_style_body(
      style = cell_fill(color = "yellow"),
      pattern = "ne|na"
    )

  expect_true(gt_tbl_alt |> render_as_html() != gt_tbl_13 |> render_as_html())

  expect_snapshot_html(gt_tbl_13)

  gt_tbl_14 <-
    gt_tbl_alt |>
    tab_style_body(
      style = cell_fill(color = "lightgreen"),
      pattern = "2015-01-15"
    )

  expect_true(gt_tbl_alt |> render_as_html() != gt_tbl_14 |> render_as_html())

  expect_snapshot_html(gt_tbl_14)

  gt_tbl_15 <-
    gt_tbl_alt |>
    tab_style_body(
      style = cell_fill(color = "lightgreen"),
      pattern = "a$"
    )

  expect_true(gt_tbl_alt |> render_as_html() != gt_tbl_15 |> render_as_html())

  expect_snapshot_html(gt_tbl_15)

  #
  # Use the `fn` argument to target body cells through a function
  #

  gt_tbl_16 <-
    gt_tbl_alt |>
    tab_style_body(
      columns = where(is.numeric),
      style = cell_fill(color = "#FF8AF3"),
      fn = function(x) x >= 0 && x < 50
    )

  expect_true(gt_tbl_alt |> render_as_html() != gt_tbl_16 |> render_as_html())

  expect_snapshot_html(gt_tbl_16)
})
