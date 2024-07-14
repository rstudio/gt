# tab_row_group() warns for deprecated args, but respects output.

    Code
      gt_tbl <- gt(exibble, rowname_col = "row") %>% tab_row_group(label = "group_prioritized",
        group = "group", rows = 1:3)
    Condition
      Warning:
      Since gt v0.3.0 the `group` argument has been deprecated.
      * Use the `label` argument to specify the group label.
      This warning is displayed once every 8 hours.

---

    Code
      gt_tbl <- (gt(exibble, rowname_col = "row") %>% tab_row_group(label = "one",
        rows = 1:3) %>% tab_row_group(others_label = "foo"))
    Condition
      Warning:
      Since gt v0.3.0 the `others_label` argument has been deprecated.
      * Use `tab_options(row_group.default_label = <label>)` to set this label.
      This warning is displayed once every 8 hours.

# tab_row_group() errors when named rows are supplied (#1535)

    Code
      gt_tbl %>% tab_row_group("Mazda", c("Mazda RX4", "Mazda RX4 Wag"))
    Condition
      Error in `tab_row_group()`:
      ! Can't find named rows in the table
      i In gt() (`?gt::gt()`), use `rownames_to_stub = TRUE` or specify `rowname_col` to initialize row names in the table.

