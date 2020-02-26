library(mrggt)

# Create a display table based on `sleep`
sleep_tbl <-
  gt(data = sleep) %>%
  fmt_scientific(columns = vars(extra)) %>%
  tab_footnote(
    footnote = "This is a footnote",
    locations = cells_body(columns = 1, rows = c(2, 3, 4))
  )

sleep_tbl
