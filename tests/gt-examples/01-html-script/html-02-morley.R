library(gt)

# Create a display table based on `morley`
morley_tbl <-
  gt(morley) |>
  fmt_number(
    columns = Speed,
    decimals = 0,
    sep_mark = ",") |>
  cols_align(align = "left", columns = c(Run, Speed))

morley_tbl
