# The `fmt_markdown()` function works correctly

    Code
      tab %>% fmt_markdown(columns = "column_3")
    Condition
      Error in `fmt()`:
      ! Can't select columns that don't exist.
      x Column `column_3` doesn't exist.

