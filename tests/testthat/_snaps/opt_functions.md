# The `opt_footnote_marks()` function sets the correct options

    Code
      exibble %>% gt() %>% opt_footnote_marks(NULL)
    Condition
      Error in `validate_marks()`:
      ! The value for `marks` must not be `NULL`.

---

    Code
      exibble %>% gt() %>% opt_footnote_marks("set_1")
    Condition
      Error in `validate_marks()`:
      ! The `marks` keyword provided ("set_1") is not valid.
      * Either of "numbers", "letters", "LETTERS", "standard", or "extended" can be used.

---

    Code
      exibble %>% gt() %>% opt_footnote_marks(1:5)
    Condition
      Error in `validate_marks()`:
      ! The value for `marks` must be a character vector.

---

    Code
      exibble %>% gt() %>% opt_footnote_marks(character(0))
    Condition
      Error in `validate_marks()`:
      ! The length of `marks` must not be zero.

# The `opt_align_table_header()` function sets the correct options

    Code
      exibble %>% gt() %>% opt_align_table_header(1)
    Condition
      Error in `opt_align_table_header()`:
      ! `align` must be a character vector, not the number 1.

---

    Code
      exibble %>% gt() %>% opt_align_table_header(c("left", "right"))
    Condition
      Error in `opt_align_table_header()`:
      ! `align` must be one of "left", "center", or "right", not "left".

---

    Code
      exibble %>% gt() %>% opt_align_table_header(c("justify"))
    Condition
      Error in `opt_align_table_header()`:
      ! `align` must be one of "left", "center", or "right", not "justify".

# The `opt_all_caps()` function sets the correct options

    Code
      exibble %>% gt() %>% opt_all_caps(locations = c("column_labels", "footer"))
    Condition
      Error in `opt_all_caps()`:
      ! The available locations are `column_labels`, `stub`, and `row_group`.

# The `opt_table_font()` function sets the correct options

    Code
      tbl %>% opt_table_font(font = c(TRUE, FALSE))
    Condition
      Error in `normalize_font_input()`:
      ! Values provided to `font` must either be a list or a character vector.

---

    Code
      tbl %>% opt_table_font(font = 1:3)
    Condition
      Error in `normalize_font_input()`:
      ! Values provided to `font` must either be a list or a character vector.

