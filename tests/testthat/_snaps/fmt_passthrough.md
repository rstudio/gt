# The `fmt_passthrough()` function works correctly

    Code
      tab %>% fmt_passthrough(columns = "num_3")
    Condition
      Error in `fmt()`:
      ! Can't select columns that don't exist.
      x Column `num_3` doesn't exist.

