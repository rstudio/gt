library(gt)

# Create a display table based on `pressure`
pressure_tbl <-
  gt(pressure) |>
  fmt_scientific(
    columns = pressure,
    decimals = 2
  )

pressure_tbl
