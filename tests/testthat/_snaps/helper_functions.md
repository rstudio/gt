# The `pct()` helper function works correctly

    Code
      pct(x = "50")
    Condition
      Error in `pct()`:
      ! The supplied value must be numeric.

# The `px()` helper function works correctly

    Code
      px(x = "50")
    Condition
      Error in `px()`:
      ! The supplied value must be numeric.

# The `from_column()` helper works correctly

    Code
      tab %>% fmt_number(columns = num, rows = c(2, 4, 6, 7), decimals = from_column(
        column = "i_integer_2")) %>% cols_add(i_integer_2 = i_integer * 2)
    Condition
      Error in `generate_param_tbl()`:
      ! Can't select columns that don't exist.
      x Column `i_integer_2` doesn't exist.

