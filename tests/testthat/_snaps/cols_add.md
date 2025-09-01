# cols_add() errors with bad input

    Code
      cols_add(tbl, x = 1, .after = 2, .before = 3)
    Condition
      Error in `cols_add()`:
      ! Expressions cannot be given to both `.before` and `.after`.
    Code
      cols_add(tbl, x = 1, .after = 15)
    Condition
      Error in `vars_select_eval()`:
      ! Can't select columns past the end.
      i Location 15 doesn't exist.
      i There are only 9 columns.
    Code
      cols_add(tbl, x = 1, .before = c(1, 2))
    Condition
      Error in `cols_add()`:
      ! The expression used for `.before` resolved multiple columns.
    Code
      cols_add(tbl, x = 1, .after = c(1, 2))
    Condition
      Error in `cols_add()`:
      ! The expression used for `.after` resolved multiple columns.

