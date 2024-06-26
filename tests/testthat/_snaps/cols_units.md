# cols_units() errors well with wrong input

    Code
      cols_units(gt(d), col2 ~ 1, everything() ~ "degree")
    Condition
      Error in `cols_units()`:
      ! Incorrect unit for column `col2`.
      Caused by error:
      ! `unit` must be a single string, not the number 1.
    Code
      cols_units(gt(d), everything() ~ 1, col2 ~ 2)
    Condition
      Error in `cols_units()`:
      ! Incorrect unit for columns `col1` and `col2`.
      Caused by error:
      ! `unit` must be a single string, not the number 1.
    Code
      cols_units(gt(d), col1 ~ c("x", "y"))
    Condition
      Error in `cols_units()`:
      ! Incorrect unit for column `col1`.
      Caused by error:
      ! `unit` must be a single string, not a character vector.

