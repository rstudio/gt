# The `fmt_spelled_num()` function works correctly

    Code
      tab %>% fmt_spelled_num(columns = num_2)
    Condition
      Error in `column_classes_are_valid()`:
      ! Can't select columns that don't exist.
      x Column `num_2` doesn't exist.

