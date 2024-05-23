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
      Error in `opt_table_font()`:
      ! `font` must be a list or a character vector, not a logical vector.

---

    Code
      tbl %>% opt_table_font(font = 1:3)
    Condition
      Error in `opt_table_font()`:
      ! `font` must be a list or a character vector, not an integer vector.

