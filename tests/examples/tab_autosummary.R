library(gt)

tab_summary <-
  gt(mtcars, rownames_to_stub = TRUE) %>%
  tab_stub_block(
    group = "Mercs",
    rows = c(
      "Merc 240D", "Merc 230", "Merc 280C", "Merc 280",
      "Merc 450SE", "Merc 450SL", "Merc 450SLC")) %>%
  tab_stub_block(
    group = "Supercars",
    rows = c("Ferrari Dino", "Maserati Bora", "Porsche 914-2", "Ford Pantera L")) %>%
  blocks_arrange(
    groups = vars(Mercs, Supercars)) %>%
  summary_rows(
    agg = "mean",
    groups = vars(Mercs),
    columns = vars(mpg, disp, hp),
    decimals = 1,
    tint = "pink") %>%
  summary_rows(
    agg = c("max", "min"),
    decimals = 1,
    tint = "green")

tab_summary
