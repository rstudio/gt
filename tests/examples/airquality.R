library(gt)

# Create a presentation table based on `airquality`
# New York Air Quality Measurements

# 1 - we take the `datasets::airquality` data.frame
# 2 - the `Month` and `Day` columns are moved to the
#     beginning of the column series
# 3 - the `Solar.R` column is given a display label
# 4 - we are formatting numbers in the `Wind` column
#     to have 1 decimal place
# 5 - a spanner is added above `Month` and `Day`
# 6 - we replace missing (NA) values in all columns
#     with a string replacement (default is an em dash)
airquality_tbl <-
  gt(data = airquality) %>%  # 1
  cols_move_to_start(columns = Month & Day) %>% # 2
  cols_label(col_labels(Solar.R = html("Solar<br>Radiation"))) %>% # 3
  fmt_number(
    columns = Wind,
    decimals = 2
    )  %>% # 4
  tab_boxhead_panel(
    group = "Measurement Period",
    columns = Month & Day
    ) %>% # 5
  fmt_missing() # 6

# Display the table in the Viewer
airquality_tbl
