# The `cols_width()` function stores values correctly

    Code
      gt(tbl) %>% cols_width(col_10 ~ px(150), everything() ~ px(75))
    Condition
      Error in `cols_width()`:
      ! Can't select columns that don't exist.
      x Column `col_10` doesn't exist.

---

    Code
      gt(tbl) %>% cols_width()
    Condition
      Error in `cols_width()`:
      ! Nothing was provided to `...`.
      * Use formula expressions to define custom column widths.

---

    Code
      validate_css_lengths(c("", "3", "3em", "3rem", "3dem"))
    Condition
      Error in `FUN()`:
      ! "3dem" is not a valid CSS unit (e.g., "100%", "400px", "auto")

