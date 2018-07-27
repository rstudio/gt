library(gt)

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
  summary_rows(
    agg = "mean",
    groups = "Mercs",
    columns = c("mpg", "disp", "hp"),
    decimals = 1,
    tint = "pink") %>%
  summary_rows(
    agg = c("max", "min"),
    decimals = 1,
    tint = "green")

tab_summary
