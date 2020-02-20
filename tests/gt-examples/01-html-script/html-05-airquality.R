library(mrggt)

# Create a display table based on `airquality`
airquality_tbl <-
  gt(data = airquality) %>%
  cols_move_to_start(columns = vars(Month, Day)) %>%
  cols_label(Solar.R = html("Solar<br>Radiation")) %>%
  fmt_number(
    columns = vars(Wind),
    decimals = 2
  ) %>%
  tab_spanner(
    label = "Measurement Period",
    columns = vars(Month, Day)
  ) %>%
  fmt_missing(columns = vars(Ozone, Solar.R, Wind, Temp))

airquality_tbl
