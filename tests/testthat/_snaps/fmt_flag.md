# The `fmt_flag()` function works correctly

    Code
      tab %>% fmt_flag(columns = b)
    Condition
      Error in `fmt_flag()`:
      ! Can't select columns that don't exist.
      x Column `b` doesn't exist.

