# The `cols_label()` function works correctly

    Code
      gt(tbl) %>% cols_label("col_a")
    Condition
      Error in `cols_label()`:
      ! object 'columns' not found

---

    Code
      gt(tbl) %>% cols_label(col_a = "col_1")
    Condition
      Error in `cols_label()`:
      ! The column name supplied to `cols_label()` (`col_a`) is not valid.
      * Include column names or a tidyselect statement on the LHS.

---

    Code
      dplyr::tribble(~a, ~.dat, 1, 4, 5, 8) %>% gt() %>% cols_label(a = "label a",
        .dat = "label dat")
    Condition
      Error in `cols_label()`:
      ! `data` must be a `gt_tbl` object, not a string.

