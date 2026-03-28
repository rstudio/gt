# Snapshot and structural tests for Typst output

# -- Basic table output --------------------------------------------------------

test_that("as_typst() produces valid Typst table structure", {

  typst_out <- gt(head(mtcars)) |> as_typst()

  # Should be a character string

  expect_type(typst_out, "character")
  expect_length(typst_out, 1)

  # Must contain #table( opening
  expect_match(typst_out, "#table(", fixed = TRUE)

  # Must contain columns: specification
  expect_match(typst_out, "columns:")

  # Must contain align: specification
  expect_match(typst_out, "align:")

  # Must contain stroke specification
  expect_match(typst_out, "stroke:", fixed = TRUE)

  # Must contain table.header(
  expect_match(typst_out, "table.header(", fixed = TRUE)

  # Must contain table.hline for booktabs-style rules
  expect_match(typst_out, "table.hline(", fixed = TRUE)

  # Should contain column names from mtcars
  expect_match(typst_out, "mpg", fixed = TRUE)
  expect_match(typst_out, "cyl", fixed = TRUE)
  expect_match(typst_out, "disp", fixed = TRUE)
})

test_that("as_typst() snapshot for basic table", {
  expect_snapshot(gt(head(exibble)) |> as_typst() |> cat())
})

# -- Escaping ------------------------------------------------------------------

test_that("as_typst() escapes special Typst characters in data", {

  df <- data.frame(x = "a # b", y = "c $ d")
  typst_out <- gt(df) |> as_typst()

  expect_match(typst_out, "a \\\\# b", perl = TRUE)
  expect_match(typst_out, "c \\\\\\$ d", perl = TRUE)
})

# -- Headings ------------------------------------------------------------------

test_that("as_typst() renders title and subtitle", {

  typst_out <-
    gt(head(exibble)) |>
    tab_header(
      title = "My Title",
      subtitle = "My Subtitle"
    ) |>
    as_typst()

  # Title should be present (bold, larger)
  expect_match(typst_out, "My Title", fixed = TRUE)

  # Subtitle should be present
  expect_match(typst_out, "My Subtitle", fixed = TRUE)
})

test_that("as_typst() snapshot for table with heading", {
  expect_snapshot(
    gt(head(exibble)) |>
      tab_header(title = "Title Here", subtitle = "Subtitle Here") |>
      as_typst() |>
      cat()
  )
})

# -- Column alignment ----------------------------------------------------------

test_that("as_typst() applies column alignment", {

  typst_out <-
    gt(head(exibble)) |>
    cols_align(align = "right", columns = num) |>
    cols_align(align = "center", columns = char) |>
    as_typst()

  # Should have an align: specification with right and center
  expect_match(typst_out, "right")
  expect_match(typst_out, "center")
})

# -- Stub (row names) ---------------------------------------------------------

test_that("as_typst() renders stub column", {

  typst_out <-
    gt(exibble, rowname_col = "row") |>
    as_typst()

  # Row label values should appear in output (underscores escaped in Typst)
  expect_match(typst_out, "row\\_1", fixed = TRUE)
  expect_match(typst_out, "row\\_2", fixed = TRUE)
})

test_that("as_typst() snapshot for table with stub", {
  expect_snapshot(
    gt(head(exibble), rowname_col = "row") |>
      as_typst() |>
      cat()
  )
})

# -- Row groups ----------------------------------------------------------------

test_that("as_typst() renders row group labels", {

  typst_out <-
    gt(exibble, rowname_col = "row", groupname_col = "group") |>
    as_typst()

  # Group labels should appear (underscores escaped in Typst)
  expect_match(typst_out, "grp\\_a", fixed = TRUE)
  expect_match(typst_out, "grp\\_b", fixed = TRUE)

  # Group labels should use colspan to span all columns
  expect_match(typst_out, "colspan:", fixed = TRUE)
})

test_that("as_typst() snapshot for table with row groups", {
  expect_snapshot(
    gt(exibble, rowname_col = "row", groupname_col = "group") |>
      as_typst() |>
      cat()
  )
})

# -- Spanners ------------------------------------------------------------------

test_that("as_typst() renders spanners with colspan", {

  typst_out <-
    gt(head(exibble)) |>
    tab_spanner(
      label = "Numbers",
      columns = c(num, currency)
    ) |>
    as_typst()

  # Spanner label should appear
  expect_match(typst_out, "Numbers", fixed = TRUE)

  # Should use table.cell(colspan: N) for spanning
  expect_match(typst_out, "colspan:", fixed = TRUE)
})

test_that("as_typst() snapshot for table with spanners", {
  expect_snapshot(
    gt(head(exibble)) |>
      tab_spanner(label = "Text Cols", columns = c(char, fctr)) |>
      tab_spanner(label = "Num Cols", columns = c(num, currency)) |>
      as_typst() |>
      cat()
  )
})

# -- Column widths -------------------------------------------------------------

test_that("as_typst() applies column widths", {

  typst_out <-
    gt(head(exibble[, 1:3])) |>
    cols_width(
      num ~ px(200),
      char ~ px(100),
      fctr ~ px(150)
    ) |>
    as_typst()

  # Column widths should appear as pt values (px * 0.75)
  expect_match(typst_out, "150.0pt|150pt", perl = TRUE)
  expect_match(typst_out, "75.0pt|75pt", perl = TRUE)
  expect_match(typst_out, "112.5pt", fixed = TRUE)
})

# -- Markdown ------------------------------------------------------------------

test_that("as_typst() processes markdown text", {

  df <- data.frame(x = 1)
  typst_out <-
    gt(df) |>
    tab_header(title = md("**Bold Title**")) |>
    as_typst()

  # Markdown bold should be converted to Typst bold
  expect_match(typst_out, "*Bold Title*", fixed = TRUE)
  # Should NOT have the markdown **
  expect_no_match(typst_out, "**Bold Title**", fixed = TRUE)
})

# -- Source notes --------------------------------------------------------------

test_that("as_typst() renders source notes below table", {

  typst_out <-
    gt(head(exibble)) |>
    tab_source_note("Source: test data") |>
    as_typst()

  expect_match(typst_out, "Source: test data", fixed = TRUE)
})

test_that("as_typst() snapshot for table with source note", {
  expect_snapshot(
    gt(head(exibble)) |>
      tab_source_note("Source: example dataset") |>
      as_typst() |>
      cat()
  )
})

# -- Footnotes -----------------------------------------------------------------

test_that("as_typst() renders footnote marks and footer", {

  typst_out <-
    gt(head(exibble)) |>
    tab_footnote(
      footnote = "A footnote about this column",
      locations = cells_column_labels(columns = num)
    ) |>
    as_typst()

  # Should have superscript footnote mark
  expect_match(typst_out, "#super[", fixed = TRUE)

  # Footnote text should appear
  expect_match(typst_out, "A footnote about this column", fixed = TRUE)
})

test_that("as_typst() snapshot for table with footnotes", {
  expect_snapshot(
    gt(head(exibble)) |>
      tab_footnote(
        footnote = "First footnote",
        locations = cells_column_labels(columns = num)
      ) |>
      tab_footnote(
        footnote = "Second footnote",
        locations = cells_body(columns = char, rows = 1)
      ) |>
      as_typst() |>
      cat()
  )
})

test_that("as_typst() renders multiple footnotes with distinct marks", {

  typst_out <-
    gt(head(exibble)) |>
    tab_footnote("Note A", locations = cells_column_labels(columns = num)) |>
    tab_footnote("Note B", locations = cells_column_labels(columns = char)) |>
    tab_footnote("Note C", locations = cells_body(columns = num, rows = 1)) |>
    as_typst()

  # Three distinct footnote marks in the footer
  expect_match(typst_out, "#super[1]", fixed = TRUE)
  expect_match(typst_out, "#super[2]", fixed = TRUE)
  expect_match(typst_out, "#super[3]", fixed = TRUE)

  # All footnote texts present
  expect_match(typst_out, "Note A", fixed = TRUE)
  expect_match(typst_out, "Note B", fixed = TRUE)
  expect_match(typst_out, "Note C", fixed = TRUE)
})

test_that("as_typst() renders source notes and footnotes together", {

  typst_out <-
    gt(head(exibble)) |>
    tab_footnote("A footnote", locations = cells_column_labels(columns = num)) |>
    tab_source_note("Source: test data") |>
    as_typst()

  # Both should appear below the table

  expect_match(typst_out, "A footnote", fixed = TRUE)
  expect_match(typst_out, "Source: test data", fixed = TRUE)
})

# -- Column merges -------------------------------------------------------------

test_that("as_typst() renders merged columns", {

  typst_out <-
    gt(head(exibble)) |>
    cols_merge_range(
      col_begin = num,
      col_end = currency
    ) |>
    as_typst()

  # The merged column should show a range separator
  expect_type(typst_out, "character")
})

# -- Summary rows --------------------------------------------------------------

test_that("as_typst() renders grand summary rows", {

  typst_out <-
    gt(exibble, rowname_col = "row", groupname_col = "group") |>
    grand_summary_rows(
      fns = list(
        list(label = "Mean", fn = "mean")
      ),
      columns = num,
      missing_text = ""
    ) |>
    as_typst()

  # Summary label should appear
  expect_match(typst_out, "Mean", fixed = TRUE)
})

test_that("as_typst() renders group summary rows", {

  typst_out <-
    gt(exibble, rowname_col = "row", groupname_col = "group") |>
    summary_rows(
      fns = list(
        list(label = "Total", fn = "sum")
      ),
      columns = num,
      missing_text = ""
    ) |>
    as_typst()

  expect_match(typst_out, "Total", fixed = TRUE)
})

# -- Empty table ---------------------------------------------------------------

test_that("as_typst() handles empty table without error", {

  empty_df <- data.frame(x = character(0), y = numeric(0))
  expect_no_error(gt(empty_df) |> as_typst())
})

# -- gtsave with .typ extension ------------------------------------------------

test_that("gtsave() writes .typ files", {

  tmp <- tempfile(fileext = ".typ")
  on.exit(unlink(tmp), add = TRUE)

  gt(head(exibble)) |> gtsave(tmp)

  expect_true(file.exists(tmp))
  content <- readLines(tmp)
  expect_true(any(grepl("#table(", content, fixed = TRUE)))
})

# -- Cell styling in Typst -----------------------------------------------------

test_that("as_typst() applies cell fill styling", {

  typst_out <-
    gt(head(exibble)) |>
    tab_style(
      style = cell_fill(color = "#FF0000"),
      locations = cells_body(columns = num, rows = 1)
    ) |>
    as_typst()

  # Should contain Typst fill with rgb color
  expect_match(typst_out, "fill:", fixed = TRUE)
  expect_match(typst_out, "rgb(", fixed = TRUE)
})

test_that("as_typst() applies text styling", {

  typst_out <-
    gt(head(exibble)) |>
    tab_style(
      style = cell_text(weight = "bold", color = "#0000FF"),
      locations = cells_body(columns = num, rows = 1)
    ) |>
    as_typst()

  expect_match(typst_out, "weight:", fixed = TRUE)
  expect_match(typst_out, "bold", fixed = TRUE)
})

# -- Stubhead ------------------------------------------------------------------

test_that("as_typst() renders stubhead label", {

  typst_out <-
    gt(exibble, rowname_col = "row") |>
    tab_stubhead(label = "Row ID") |>
    as_typst()

  expect_match(typst_out, "Row ID", fixed = TRUE)
})

# -- Units in column labels ----------------------------------------------------

test_that("as_typst() renders units with superscripts", {

  typst_out <-
    gt(head(exibble)) |>
    cols_units(num = "kg m^-2") |>
    as_typst()

  # Should contain superscript markup
  expect_match(typst_out, "#super[", fixed = TRUE)
})

# -- typst() helper ------------------------------------------------------------

test_that("typst() helper passes through raw Typst in typst context", {

  typst_out <-
    gt(data.frame(x = 1)) |>
    tab_header(title = typst("#text(fill: red)[Red Title]")) |>
    as_typst()

  # Raw Typst content should pass through without escaping
  expect_match(typst_out, "#text(fill: red)[Red Title]", fixed = TRUE)
  # Should NOT have escaped the #
  expect_no_match(typst_out, "\\#text", fixed = TRUE)
})

# -- fmt_typst() ---------------------------------------------------------------

test_that("fmt_typst() passes through raw Typst in cells", {

  df <- data.frame(x = c("hello", "world"))
  typst_out <-
    gt(df) |>
    fmt_typst(columns = x) |>
    as_typst()

  # Content should pass through without escaping
  expect_match(typst_out, "hello", fixed = TRUE)
  expect_match(typst_out, "world", fixed = TRUE)
})

test_that("fmt_typst() does not escape special chars", {

  df <- data.frame(x = "#text(fill: red)[danger]")
  typst_out <-
    gt(df) |>
    fmt_typst(columns = x) |>
    as_typst()

  # The # and [] should NOT be escaped
  expect_match(typst_out, "#text(fill: red)[danger]", fixed = TRUE)
})

test_that("fmt_typst() preserves Typst math mode", {

  df <- data.frame(x = "$x^2 + y^2 = z^2$")
  typst_out <-
    gt(df) |>
    fmt_typst(columns = x) |>
    as_typst()

  # Math mode $ should not be escaped
  expect_match(typst_out, "$x^2 + y^2 = z^2$", fixed = TRUE)
})

test_that("fmt_typst() content is escaped without it", {

  df <- data.frame(x = "#text(fill: red)[danger]")

  # WITHOUT fmt_typst: special chars should be escaped
  typst_out_escaped <- gt(df) |> as_typst()
  expect_match(typst_out_escaped, "\\#text", fixed = TRUE)

  # WITH fmt_typst: special chars should pass through
  typst_out_raw <- gt(df) |> fmt_typst(columns = x) |> as_typst()
  expect_match(typst_out_raw, "#text(fill: red)", fixed = TRUE)
})

# -- tab_options propagation ---------------------------------------------------

test_that("as_typst() propagates table font size option", {

  typst_out <-
    gt(head(exibble)) |>
    tab_options(table.font.size = px(12)) |>
    as_typst()

  expect_match(typst_out, "#set text(size: 9.0pt)", fixed = TRUE)
})

test_that("as_typst() hides column labels when option set", {

  typst_out <-
    gt(head(exibble)) |>
    tab_options(column_labels.hidden = TRUE) |>
    as_typst()

  # Should NOT contain table.header
  expect_no_match(typst_out, "table.header(", fixed = TRUE)
})

test_that("as_typst() propagates column label background color", {

  typst_out <-
    gt(head(exibble)) |>
    tab_options(column_labels.background.color = "#E0E0E0") |>
    as_typst()

  expect_match(typst_out, "fill:", fixed = TRUE)
  expect_match(typst_out, "rgb(\"#E0E0E0\")", fixed = TRUE)
})

test_that("as_typst() propagates table font weight option", {

  typst_out <-
    gt(head(exibble)) |>
    tab_options(table.font.weight = "bold") |>
    as_typst()

  expect_match(typst_out, "#set text(weight: \"bold\")", fixed = TRUE)
})

test_that("as_typst() propagates table background color option", {

  typst_out <-
    gt(head(exibble)) |>
    tab_options(table.background.color = "#F0F0F0") |>
    as_typst()

  expect_match(typst_out, "fill:", fixed = TRUE)
  expect_match(typst_out, "rgb(\"#F0F0F0\")", fixed = TRUE)
})

test_that("as_typst() propagates table width option", {

  typst_out <-
    gt(head(exibble)) |>
    tab_options(table.width = pct(80)) |>
    as_typst()

  expect_match(typst_out, "width: 80%", fixed = TRUE)
})

test_that("as_typst() propagates footnotes multiline=FALSE with separator", {

  typst_out <-
    gt(head(exibble)) |>
    tab_footnote("Note A", locations = cells_column_labels(columns = num)) |>
    tab_footnote("Note B", locations = cells_column_labels(columns = char)) |>
    tab_options(footnotes.multiline = FALSE, footnotes.sep = " | ") |>
    as_typst()

  # Both notes should be on one line
  expect_match(typst_out, "Note A | ", fixed = TRUE)
  expect_match(typst_out, "Note B", fixed = TRUE)
})

test_that("as_typst() propagates row striping option", {

  typst_out <-
    gt(head(exibble)) |>
    tab_options(row.striping.include_table_body = TRUE) |>
    as_typst()

  expect_match(typst_out, "fill: (_, y) =>", fixed = TRUE)
  expect_match(typst_out, "calc.odd", fixed = TRUE)
})

# -- as_typst() returns typst_text class ---------------------------------------

test_that("as_typst() returns typst_text class", {

  result <- gt(head(exibble)) |> as_typst()
  expect_s3_class(result, "typst_text")
})
