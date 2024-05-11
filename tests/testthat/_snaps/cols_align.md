# The `cols_align()` function works correctly

    Code
      gt(mtcars_short) %>% cols_align(align = "righter", columns = c(mpg, cyl, drat))
    Condition
      Error in `cols_align()`:
      ! `align` must be one of "auto", "left", "center", or "right", not "righter".
      i Did you mean "right"?

---

    Code
      gt(mtcars_short) %>% cols_align(align = "right", columns = car)
    Condition
      Error in `cols_align()`:
      ! Can't select columns that don't exist.
      x Column `car` doesn't exist.

---

    Code
      gt(mtcars_short) %>% cols_align(align = "right", columns = c(1, 20))
    Condition
      Error in `cols_align()`:
      ! Can't select columns past the end.
      i Location 20 doesn't exist.
      i There are only 11 columns.

# The stub gets its alignment set properly with `cols_align()`

    Code
      gt(tbl) %>% cols_align(align = "center", columns = stub())
    Condition
      Error in `check_vars_dt_boxhead()`:
      ! The `var` value must be value in `dt_boxhead$var`.

