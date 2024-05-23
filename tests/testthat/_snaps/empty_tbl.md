# We can start from empty tables and sometimes add rows

    Code
      gt(empty_w_cols_tbl) %>% rows_add(a = double(0), b = character(0))
    Condition
      Error in `rows_add()`:
      ! All column names referenced must be present in the data.
      x Can't find columns "a" and "b".

