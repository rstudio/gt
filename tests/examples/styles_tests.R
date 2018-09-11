library(gt)

# Create a table based on `mtcars`
# Add all of the different types of table parts
# Add styles in every type of part
data <-
  gt(mtcars, rownames_to_stub = TRUE) %>%
  cols_move_to_start(columns = c("gear", "carb")) %>%
  tab_stubhead_caption("cars") %>%
  cols_remove(columns = "mpg") %>%
  cols_remove(columns = "vs") %>%
  tab_stub_block(group = "Mercs", rows = contains("Merc")) %>%
  tab_stub_block(group = "Mazdas", rows = contains("Mazda")) %>%
  tab_boxhead_panel(group = "gear_carb_cyl", columns = vars(gear, carb, cyl)) %>%
  blocks_arrange(groups = c("Mazdas", "Mercs")) %>%
  cols_merge_range(col_begin = "disp", col_end = "drat") %>%
  tab_heading(title = "Title", headnote = "Headnote") %>%
  tab_source_note(source_note = "this is a source note") %>%
  summary_rows(
    groups = c("Mazdas"),
    columns = vars(hp, wt, qsec),
    funs = funs(
      mean(., na.rm = TRUE),
      sum(., na.rm = TRUE))) %>%
  tab_style(
    style = apply_styles(text_align = "left"),
    locations = cells_title(groups = "title")) %>%
  tab_style(
    style = apply_styles(text_align = "left"),
    locations = cells_title(groups = "headnote")) %>%
  tab_style(
    style = apply_styles(bkgd_color = "green"),
    locations = cells_summary(
      groups = "Mazdas", columns = "hp", rows = 1)) %>%
  tab_style(
    style = apply_styles(bkgd_color = "blue"),
    locations = cells_boxhead(groups = "gear_carb_cyl")) %>%
  tab_style(
    style = apply_styles(bkgd_color = "steelblue", text_color = "white"),
    locations = cells_stub(rows = "Merc 240D")) %>%
  tab_style(
    style = apply_styles(bkgd_color = "lightgray", text_style = "italic"),
    locations = cells_data(columns = "hp", rows = "Datsun 710")) %>%
  tab_style(
    style = apply_styles(bkgd_color = "yellow"),
    locations = cells_data(columns = "disp", rows = "Mazda RX4")) %>%
  tab_style(
    style = apply_styles(bkgd_color = "gray"),
    locations = cells_boxhead(columns = "cyl")) %>%
  tab_style(
    style = apply_styles(bkgd_color = "turquoise"),
    locations = cells_boxhead(columns = "gear"))

data
