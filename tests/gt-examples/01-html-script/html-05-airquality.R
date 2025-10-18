library(gt)

# Create a display table based on `airquality`
airquality_tbl <-
  gt(airquality) |>
  cols_move_to_start(columns = c(Month, Day)) |>
  cols_label(Solar.R = html("Solar<br>Radiation")) |>
  fmt_number(
    columns = Wind,
    decimals = 2
  ) |>
  tab_spanner(
    label = "Measurement Period",
    columns = c(Month, Day)
  ) |>
  sub_missing(columns = c(Ozone, Solar.R, Wind, Temp))

airquality_tbl
