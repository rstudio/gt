library(mrggt)

# Create a display table based on `pressure`
pressure_tbl <-
  gt(data = pressure) %>%
  fmt_scientific(
    columns = vars(pressure),
    decimals = 2
  )

pressure_tbl
