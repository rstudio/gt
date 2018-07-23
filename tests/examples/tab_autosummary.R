library(gt)
library(tidyverse)

tab_summary <-
  gt(mtcars, rownames_to_stub = TRUE) %>%
  tab_stub_block(
    group = "Mercs",
    rows = rownames_with("Merc")) %>%
  tab_stub_block(
    group = "Supercars",
    rows = `Ferrari Dino` & `Maserati Bora` & `Porsche 914-2` & `Ford Pantera L`) %>%
  blocks_arrange(
    groups = tgt(Mercs, Supercars, Others)) %>%
  fmt_summary_auto(
    agg = "mean",
    groups = "Mercs",
    columns = c("mpg", "disp", "hp")) %>%
  fmt_summary_auto(
    agg = c("max", "min"),
    groups = c("Supercars", NA),
    decimals = 1)

tab_summary
