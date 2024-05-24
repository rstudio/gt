# The `cols_hide()` and `cols_hide()` do not error when no columns selected

    Code
      gt(exibble) %>% cols_hide(problem)
    Condition
      Error in `cols_hide()`:
      ! Can't select columns that don't exist.
      x Column `problem` doesn't exist.

