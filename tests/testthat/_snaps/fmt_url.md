# The `fmt_url()` function works correctly

    Code
      tab %>% fmt_url(columns = b)
    Condition
      Error in `fmt_url()`:
      ! Can't select columns that don't exist.
      x Column `b` doesn't exist.

