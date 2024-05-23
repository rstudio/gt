# The `sub_missing()` function works correctly

    Code
      tab %>% sub_missing(columns = "num_3")
    Condition
      Error in `sub_missing()`:
      ! Can't select columns that don't exist.
      x Column `num_3` doesn't exist.

# The `sub_zero()` function works correctly

    Code
      tab %>% sub_zero(columns = "num_3")
    Condition
      Error in `sub_zero()`:
      ! Can't select columns that don't exist.
      x Column `num_3` doesn't exist.

# The `sub_small_vals()` function works correctly

    Code
      tab %>% sub_small_vals(columns = "num_3")
    Condition
      Error in `sub_small_vals()`:
      ! Can't select columns that don't exist.
      x Column `num_3` doesn't exist.

---

    Code
      tab %>% sub_small_vals(columns = "num_1", sign = "?")
    Condition
      Error in `sub_small_vals()`:
      ! The `sign` option should either be "+" or "-".
      * With "+", we consider only positive large values.
      * Using "-" means that the focus is on negative values.

# The `sub_large_vals()` function works correctly

    Code
      tab %>% sub_large_vals(columns = "num_3")
    Condition
      Error in `sub_large_vals()`:
      ! Can't select columns that don't exist.
      x Column `num_3` doesn't exist.

---

    Code
      tab %>% sub_large_vals(columns = "num_1", sign = "?")
    Condition
      Error in `sub_large_vals()`:
      ! The `sign` option should either be "+" or "-".
      * With "+", we consider only positive large values.
      * Using "-" means that the focus is on negative values.

---

    Code
      tab %>% sub_large_vals(rows = "num_1")
    Condition
      Error in `sub_large_vals()`:
      ! Row `num_1` does not exist in the data.

---

    Code
      tab %>% sub_large_vals(rows = "num_1", threshold = c(10, 100))
    Condition
      Error in `sub_large_vals()`:
      ! `threshold` must be a number, not a double vector.

# The `sub_values()` function works correctly

    Code
      gt(data_tbl) %>% sub_values(replacement = "hey")
    Condition
      Error in `sub_values()`:
      ! One of `values`, `pattern`, or `fn` must be supplied to `sub_value()`.

---

    Code
      gt(data_tbl) %>% sub_values(values = "A")
    Condition
      Error in `sub_values()`:
      ! `replacement` must be a number, or a string, not NULL.

---

    Code
      gt(data_tbl) %>% sub_values(values = "A", replacement = TRUE)
    Condition
      Error in `sub_values()`:
      ! `replacement` must be a number, or a string, not `TRUE`.

---

    Code
      gt(data_tbl) %>% sub_values(fn = "A", replacement = "error")
    Condition
      Error in `sub_values()`:
      ! A function must be provided to the `fn` argument.

