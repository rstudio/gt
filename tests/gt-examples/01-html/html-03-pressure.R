library(gt)

# Create a display table based on `pressure` Vapor Pressure of
# Mercury as a Function of Temperature

pressure_tbl <-
  gt(data = pressure) %>%
  fmt_scientific(
    columns = vars(pressure),
    decimals = 2)

# Display the table in the Viewer
pressure_tbl
