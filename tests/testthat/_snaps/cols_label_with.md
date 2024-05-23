# The `cols_label_with()` function works correctly

    Code
      gt(tbl) %>% cols_label_with(fn = NULL)
    Condition
      Error in `cols_label_with()`:
      ! Can't convert `fn`, `NULL`, to a function.

---

    Code
      gt(tbl) %>% cols_label_with(columns = col_a, fn = function(x) "col_1")
    Condition
      Error in `cols_label_with()`:
      ! Can't select columns that don't exist.
      x Column `col_a` doesn't exist.

