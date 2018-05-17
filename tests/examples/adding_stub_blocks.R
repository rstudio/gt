library(gt)
library(tidyverse)

# Create a table based on `mtcars` where we
# group rows into stub blocks; we specify
# the subhead name and we can use helpers
# to gather rownames
tab_stub_blocks <-
  tab_create(tbl = mtcars) %>%
  theme_striped() %>%
  tab_stub_block(
    "Mazdas" = rownames_with("Mazda"),
    "Mercs" = rownames_with("Merc"),
    "Hornets" = rownames_with("Hornet"),
    "Toyotas" = rownames_with("Toyota"),
    "Supercars" = c(
      "Ferrari Dino", "Maserati Bora",
      "Porsche 914-2", "Ford Pantera L",
      "Camaro Z28"),
    .default = "Other Cars") %>%
  tab_stubhead_caption("car make/model") %>%
  fmt_number(
    columns = c("mpg", "disp", "drat", "qsec"),
    decimals = 1
  ) %>%
  fmt_number(
    columns = "wt",
    decimals = 3
  ) %>%
  cols_align_left(types = "character")

tab_stub_blocks
