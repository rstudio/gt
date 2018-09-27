library(gt)

# Create a presentation table based on `pressure`
# Vapor Pressure of Mercury as a Function of Temperature

# 1 - we take the `datasets::pressure` data.frame
# 2 - we are formatting numbers in the `pressure` column to scientific notation
pressure_tbl <-
  gt(data = pressure) %>% # 1
  fmt_scientific(
    columns = vars(pressure),
    decimals = 2) # 2

# Display the table in the Viewer
pressure_tbl
