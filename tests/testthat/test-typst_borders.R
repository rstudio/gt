test_that("as_typst() supports alignment, borders, numeric weights, and stretch mappings", {

  typst_output <-
    gtcars |>
    dplyr::select(mfr, model) |>
    dplyr::slice(1:2) |>
    gt() |>
    tab_style(
      style = list(
        cell_text(
          decorate = "underline",
          size = "large",
          align = "center",
          v_align = "middle",
          font = c("Fira Sans", "Arial")
        ),
        cell_fill(color = "#FFEEAA"),
        cell_borders(sides = "all", color = "red", weight = px(2))
      ),
      locations = cells_body(columns = model, rows = 1)
    ) |>
    tab_style(
      style = cell_text(weight = 500, v_align = "top"),
      locations = cells_body(columns = mfr, rows = 1)
    ) |>
    tab_style(
      style = cell_text(stretch = "ultra-condensed"),
      locations = cells_body(columns = model, rows = 2)
    ) |>
    as_typst()

  expect_match(typst_output, "if x == 1 \\{ rgb\\(\"#FFEEAA\"\\) \\}")
  expect_match(typst_output, "table\\.cell\\(align: horizon \\+ center, stroke:")
  expect_match(typst_output, "paint: red")
  expect_match(typst_output, "thickness: 1\\.5pt")
  expect_match(
    typst_output,
    "#text\\(size: 1\\.2em, font: \\(\"Fira Sans\", \"Arial\"\\)\\)"
  )
  expect_match(typst_output, "#underline\\[")
  expect_match(typst_output, "table\\.cell\\(align: top\\)")
  expect_match(typst_output, "#text\\(weight: \"medium\"\\)")
  expect_match(typst_output, "#text\\(stretch: 50%\\)")
})

test_that("as_typst() lifts exact whole-table stroke patterns", {

  typst_output <-
    exibble[1:2, c("num", "char")] |>
    gt() |>
    tab_style(
      style = cell_borders(sides = "all", color = "#444444", weight = px(1)),
      locations = cells_column_labels()
    ) |>
    tab_style(
      style = cell_borders(sides = "all", color = "#444444", weight = px(1)),
      locations = cells_body()
    ) |>
    as_typst()

  expect_match(typst_output, "stroke: \\(")
  expect_match(typst_output, "paint: rgb\\(\"#444444\"\\)")
  expect_no_match(
    typst_output,
    "table\\.cell\\(stroke: \\(left: \\(paint: rgb\\(\"#444444\"\\)"
  )
})

test_that("as_typst() lifts exact header row stroke patterns", {

  typst_output <-
    exibble[1:2, c("num", "char")] |>
    gt() |>
    tab_style(
      style = cell_borders(sides = "all", color = "#1565C0", weight = px(1)),
      locations = cells_column_labels()
    ) |>
    as_typst()

  expect_match(typst_output, "stroke: \\(x, y\\) => if y == 0 \\{")
  expect_match(typst_output, "paint: rgb\\(\"#1565C0\"\\)")
  expect_no_match(
    typst_output,
    "table\\.cell\\(stroke: \\(left: \\(paint: rgb\\(\"#1565C0\"\\)"
  )
})

test_that("as_typst() lifts exact summary row stroke patterns", {

  typst_output <-
    exibble[1:5, c("row", "group", "num", "currency")] |>
    gt(rowname_col = "row", groupname_col = "group") |>
    summary_rows(
      groups = "grp_a",
      columns = c(num, currency),
      fns = list(list(label = "Total", fn = "sum"))
    ) |>
    tab_style(
      style = cell_borders(sides = c("top", "bottom"), color = "#8E24AA", weight = px(1)),
      locations = cells_summary(groups = "grp_a", columns = c(num, currency), rows = 1)
    ) |>
    tab_style(
      style = cell_borders(sides = c("top", "bottom"), color = "#8E24AA", weight = px(1)),
      locations = cells_stub_summary(groups = "grp_a", rows = 1)
    ) |>
    as_typst()

  expect_match(typst_output, "stroke: \\(x, y\\) => if y == [0-9]+ \\{")
  expect_match(typst_output, "paint: rgb\\(\"#8E24AA\"\\)")
  expect_no_match(
    typst_output,
    "table\\.cell\\(stroke: \\(top: \\(paint: rgb\\(\"#8E24AA\"\\)"
  )
})

test_that("as_typst() lifts exact column stroke patterns", {

  typst_output <-
    exibble[1:3, c("num", "char", "currency")] |>
    gt() |>
    tab_style(
      style = cell_borders(sides = c("left", "right"), color = "#00897B", weight = px(1)),
      locations = cells_column_labels(columns = char)
    ) |>
    tab_style(
      style = cell_borders(sides = c("left", "right"), color = "#00897B", weight = px(1)),
      locations = cells_body(columns = char)
    ) |>
    as_typst()

  expect_match(typst_output, "stroke: \\(x, y\\) => if x == 1 \\{")
  expect_match(typst_output, "paint: rgb\\(\"#00897B\"\\)")
  expect_no_match(
    typst_output,
    "table\\.cell\\(stroke: \\(left: \\(paint: rgb\\(\"#00897B\"\\)"
  )
})

test_that("as_typst() preserves duplicated edges and residual local stroke exceptions", {

  duplicated_edges <-
    exibble[1:1, c("num", "char")] |>
    gt() |>
    tab_style(
      style = cell_borders(sides = "right", color = "red", weight = px(2)),
      locations = cells_body(columns = num, rows = 1)
    ) |>
    tab_style(
      style = cell_borders(sides = "left", color = "blue", weight = px(3)),
      locations = cells_body(columns = char, rows = 1)
    ) |>
    as_typst()

  expect_match(duplicated_edges, "right: \\(paint: red, thickness: 1\\.5pt\\)")
  expect_match(duplicated_edges, "left: \\(paint: blue, thickness: 2\\.25pt\\)")

  residual_row_output <-
    exibble[1:2, c("num", "char")] |>
    gt() |>
    tab_style(
      style = cell_borders(sides = c("top", "bottom"), color = "#616161", weight = px(1)),
      locations = cells_body(rows = 1)
    ) |>
    tab_style(
      style = cell_borders(sides = c("left", "right"), color = "red", weight = px(2)),
      locations = cells_body(columns = char, rows = 1)
    ) |>
    as_typst()

  expect_match(residual_row_output, "stroke: \\(x, y\\) => if y == 1 \\{")
  expect_match(
    residual_row_output,
    "table\\.cell\\(stroke: \\(left: \\(paint: red, thickness: 1\\.5pt\\), right: \\(paint: red, thickness: 1\\.5pt\\)\\)\\)"
  )
  expect_no_match(
    residual_row_output,
    "table\\.cell\\(stroke: \\(top: \\(paint: rgb\\(\"#616161\"\\)"
  )

  residual_default_output <-
    exibble[1:2, c("num", "char")] |>
    gt() |>
    tab_style(
      style = cell_borders(sides = "top", color = "#455A64", weight = px(1)),
      locations = cells_column_labels()
    ) |>
    tab_style(
      style = cell_borders(sides = "top", color = "#455A64", weight = px(1)),
      locations = cells_body()
    ) |>
    tab_style(
      style = cell_borders(sides = "right", color = "#D32F2F", weight = px(2)),
      locations = cells_body(columns = char, rows = 1)
    ) |>
    as_typst()

  expect_match(residual_default_output, "stroke: \\(top: \\(paint: rgb\\(\"#455A64\"\\)")
  expect_match(
    residual_default_output,
    "table\\.cell\\(stroke: \\(right: \\(paint: rgb\\(\"#D32F2F\"\\), thickness: 1\\.5pt\\)\\)\\)"
  )
})
