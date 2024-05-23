# The `fmt_roman()` function works correctly

    Code
      tab %>% fmt_roman(columns = num_2)
    Condition
      Error in `fmt_roman()`:
      ! Can't select columns that don't exist.
      x Column `num_2` doesn't exist.

