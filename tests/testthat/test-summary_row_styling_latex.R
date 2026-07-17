# Regression tests for #2123: styling of summary rows in LaTeX output.
#
# Two related bugs were fixed in `summary_rows_for_group_l()` and
# `.apply_style_alignment_shortstack()`:
#
# 1. The within-group summary row position was recovered from the fractional
#    part of `row_num` via `(row_num - floor(row_num)) * 100`. Floating-point
#    error left that product just below the intended integer (e.g. 2.03 -> 2.99..
#    -> truncates to 2), so styles landed on the wrong summary row (off-by-one)
#    or, when it truncated to 0, on an empty (`character(0)`) cell.
# 2. `.apply_style_alignment_shortstack()` used `if (!grepl(...))`, which errors
#    when its input is `character(0)` or longer than length 1.

# A single row group with two body rows and three summary rows places the
# summary rows at `row_num` values of 2.01, 2.02, and 2.03 -- exactly the values
# that exposed the truncation bug (2.01 -> 0, 2.03 -> 2 under the old code).
summary_style_tbl <-
  dplyr::tibble(grp = "G", rn = c("r1", "r2"), v = c(10, 20)) |>
  gt(rowname_col = "rn", groupname_col = "grp") |>
  summary_rows(
    groups = "G",
    columns = v,
    fns = list(minimum = "min", maximum = "max", average = "mean")
  )

test_that("styling the first summary row targets that row in LaTeX (#2123)", {

  # `min` is the first summary row; under the old code its `row_num` (2.01)
  # truncated to position 0, landing the style on an empty cell.
  gt_tbl <-
    summary_style_tbl |>
    tab_style(
      style = cell_fill(color = "#00FF00"),
      locations = cells_summary(groups = "G", columns = v, rows = 1L)
    ) |>
    tab_options(latex.use_longtable = TRUE)

  latex <- as.character(as_latex(gt_tbl))

  # The fill lands on the `min` value (10) and nowhere else
  expect_true(grepl("cellcolor[HTML]{00FF00}{10}", latex, fixed = TRUE))
  expect_false(grepl("cellcolor[HTML]{00FF00}{20}", latex, fixed = TRUE))
  expect_false(grepl("cellcolor[HTML]{00FF00}{15}", latex, fixed = TRUE))
})

test_that("styling a later summary row targets the correct row in LaTeX (#2123)", {

  # `average` is the third summary row; under the old code its `row_num` (2.03)
  # truncated to position 2, landing the style on the `max` row instead.
  gt_tbl <-
    summary_style_tbl |>
    tab_style(
      style = cell_fill(color = "#FF0000"),
      locations = cells_summary(groups = "G", columns = v, rows = 3L)
    ) |>
    tab_options(latex.use_longtable = TRUE)

  latex <- as.character(as_latex(gt_tbl))

  # The fill lands on the `mean` value (15), not the `max` value (20)
  expect_true(grepl("cellcolor[HTML]{FF0000}{15}", latex, fixed = TRUE))
  expect_false(grepl("cellcolor[HTML]{FF0000}{20}", latex, fixed = TRUE))
})

test_that(".apply_style_alignment_shortstack() tolerates empty and non-scalar input (#2123)", {

  style_obj <- list(cell_text = list(align = "center"))

  # `character(0)` arose from summary cells indexed at position 0 by the old
  # truncation bug; `grepl()` inside an `if ()` also errors on length > 1
  expect_no_error(out_empty <- .apply_style_alignment_shortstack(character(0), style_obj))
  expect_identical(out_empty, character(0))

  expect_no_error(.apply_style_alignment_shortstack(c("a", "b"), style_obj))
})
