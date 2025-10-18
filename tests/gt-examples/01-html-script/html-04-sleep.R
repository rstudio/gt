library(gt)

# Create a display table based on `sleep`
sleep_tbl <-
  gt(sleep) |>
  fmt_scientific(columns = extra) |>
  tab_footnote(
    footnote = "This is a footnote",
    locations = cells_body(columns = 1, rows = c(2, 3, 4))
  )

sleep_tbl
