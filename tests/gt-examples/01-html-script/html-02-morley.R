library(gt)

# Create a display table based on `morley`
morley_tbl <-
  gt(data = morley) %>%
  fmt_number(
    columns = vars(Speed),
    decimals = 0,
    sep_mark = ",") %>%
  cols_align(align = "left", columns = vars(Run, Speed))

morley_tbl
