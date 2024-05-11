# The `cols_move()` function works correctly

    Code
      gt(mtcars_short) %>% cols_move(columns = c(mpg, cyl, disp), after = c(am, wt))
    Condition
      Error in `cols_move()`:
      ! Only one column name should be supplied to `after`.

---

    Code
      gt(mtcars_short) %>% cols_move(columns = c(mpg, cyl, disp), after = wts)
    Condition
      Error in `cols_move()`:
      ! Can't select columns that don't exist.
      x Column `wts` doesn't exist.

---

    Code
      gt(mtcars_short) %>% cols_move(columns = c(mpg, cyls, disp), after = wt)
    Condition
      Error in `cols_move()`:
      ! Can't select columns that don't exist.
      x Column `cyls` doesn't exist.

# The `cols_move_to_start()` function works correctly

    Code
      gt(mtcars_short) %>% cols_move_to_start(columns = c(mpg, cyls, disp))
    Condition
      Error in `cols_move_to_start()`:
      ! Can't select columns that don't exist.
      x Column `cyls` doesn't exist.

# The `cols_move_to_end()` function works correctly

    Code
      gt(mtcars_short) %>% cols_move_to_end(columns = c(mpg, cyls, disp))
    Condition
      Error in `cols_move_to_end()`:
      ! Can't select columns that don't exist.
      x Column `cyls` doesn't exist.

