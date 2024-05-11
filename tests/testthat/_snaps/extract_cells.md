# Extraction of table cells works well

    Code
      gt_tbl_3 %>% fmt_number(columns = num, decimals = 5) %>% extract_cells(columns = num,
        rows = "row_50", output = "plain")
    Condition
      Error in `resolve_rows_i()`:
      ! Can't find row `row_50` in the data.

---

    Code
      gt_tbl_3 %>% fmt_number(columns = num, decimals = 5) %>% extract_cells(columns = num,
        rows = c("row_2", "row_50"), output = "plain")
    Condition
      Error in `resolve_rows_i()`:
      ! Can't find row `row_50` in the data.

---

    Code
      gt_tbl_3 %>% fmt_number(columns = num, decimals = 5) %>% extract_cells(columns = 10,
        output = "plain")
    Condition
      Error in `vars_select_eval()`:
      ! Can't select columns past the end.
      i Location 10 doesn't exist.
      i There are only 9 columns.

