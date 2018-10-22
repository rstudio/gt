library(gt)

# Create a display table based on `morley` Michelson Speed of Light Data

morley_tbl <-
  gt(data = morley %>% dplyr::mutate(Speed = as.numeric(Speed))) %>%
  fmt_number(
    columns = vars(Speed),
    decimals = 0,
    sep_mark = ",") %>%
  cols_align(align = "left", columns = vars(Run, Speed))

morley_tbl
