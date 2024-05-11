# Various `is_*()` utility functions work properly

    Code
      stop_if_not_gt_tbl(exibble)
    Condition
      Error:
      ! `data` must be a `gt_tbl` object, not a tibble.

---

    Code
      stop_if_not_gt_tbl(gt_group(gt(exibble), gt(exibble)))
    Condition
      Error:
      ! `data` must be a `gt_tbl` object, not a <gt_group> object.

---

    Code
      stop_if_not_gt_tbl(gt(exibble) %>% as_raw_html())
    Condition
      Error:
      ! `data` must be a `gt_tbl` object, not a <html> object.

---

    Code
      stop_if_not_gt_group(gt(exibble))
    Condition
      Error:
      ! `data` must be a `gt_group` object, not a <gt_tbl> object.

---

    Code
      stop_if_not_gt_group(gt_preview(gtcars))
    Condition
      Error:
      ! `data` must be a `gt_group` object, not a <gt_tbl> object.

---

    Code
      stop_if_not_gt_group(exibble)
    Condition
      Error:
      ! `data` must be a `gt_group` object, not a tibble.

---

    Code
      stop_if_not_gt_group(gt(exibble) %>% as_raw_html())
    Condition
      Error:
      ! `data` must be a `gt_group` object, not a <html> object.

---

    Code
      stop_if_not_gt_tbl_or_group(exibble)
    Condition
      Error:
      ! `data` must either be a `gt_tbl` or a `gt_group`, not a tibble.

---

    Code
      stop_if_not_gt_tbl_or_group(gt(exibble) %>% as_raw_html())
    Condition
      Error:
      ! `data` must either be a `gt_tbl` or a `gt_group`, not a <html> object.

# The `get_date_format()` function works properly

    Code
      get_date_format(date_style = 42)
    Condition
      Error in `get_date_format()`:
      ! If using a numeric value for a `date_style`, it must be
      between `1` and `41`.
      * Use `info_date_style()` for a useful visual reference.

---

    Code
      get_date_format(date_style = "42")
    Condition
      Error in `get_date_format()`:
      ! If using a `date_style` name, it must be in the valid set.
      * Use `info_date_style()` for a useful visual reference.

---

    Code
      get_date_format(date_style = 0)
    Condition
      Error in `get_date_format()`:
      ! If using a numeric value for a `date_style`, it must be
      between `1` and `41`.
      * Use `info_date_style()` for a useful visual reference.

---

    Code
      get_date_format(date_style = "0")
    Condition
      Error in `get_date_format()`:
      ! If using a `date_style` name, it must be in the valid set.
      * Use `info_date_style()` for a useful visual reference.

---

    Code
      get_date_format(date_style = -5)
    Condition
      Error in `get_date_format()`:
      ! If using a numeric value for a `date_style`, it must be
      between `1` and `41`.
      * Use `info_date_style()` for a useful visual reference.

---

    Code
      get_date_format(date_style = "-5")
    Condition
      Error in `get_date_format()`:
      ! If using a `date_style` name, it must be in the valid set.
      * Use `info_date_style()` for a useful visual reference.

---

    Code
      get_date_format(date_style = NA)
    Condition
      Error in `if (date_format_tbl_i[["flexible"]]) ...`:
      ! the condition has length > 1

---

    Code
      get_date_format(date_style = NULL)
    Condition
      Error in `if (date_format_tbl_i[["flexible"]]) ...`:
      ! argument is of length zero

---

    Code
      get_date_format(date_style = c(1, 2))
    Condition
      Error in `if (!(date_style %in% date_format_num_range)) ...`:
      ! the condition has length > 1

---

    Code
      get_date_format(date_style = "daym")
    Condition
      Error in `get_date_format()`:
      ! If using a `date_style` name, it must be in the valid set.
      * Use `info_date_style()` for a useful visual reference.

# The `get_time_format()` function works properly

    Code
      get_time_format(time_style = 26)
    Condition
      Error in `get_time_format()`:
      ! If using a numeric value for a `time_style`, it must be between `1` and `25`.
      * Use `info_time_style()` for a useful visual reference.

---

    Code
      get_time_format(time_style = "26")
    Condition
      Error in `get_time_format()`:
      ! If using a `time_style` name, it must be in the valid set.
      * Use `info_time_style()` for a useful visual reference.

---

    Code
      get_time_format(time_style = 0)
    Condition
      Error in `get_time_format()`:
      ! If using a numeric value for a `time_style`, it must be between `1` and `25`.
      * Use `info_time_style()` for a useful visual reference.

---

    Code
      get_time_format(time_style = "0")
    Condition
      Error in `get_time_format()`:
      ! If using a `time_style` name, it must be in the valid set.
      * Use `info_time_style()` for a useful visual reference.

---

    Code
      get_time_format(time_style = -5)
    Condition
      Error in `get_time_format()`:
      ! If using a numeric value for a `time_style`, it must be between `1` and `25`.
      * Use `info_time_style()` for a useful visual reference.

---

    Code
      get_time_format(time_style = "-5")
    Condition
      Error in `get_time_format()`:
      ! If using a `time_style` name, it must be in the valid set.
      * Use `info_time_style()` for a useful visual reference.

---

    Code
      get_time_format(time_style = NA)
    Condition
      Error in `if (time_format_tbl_i[["flexible"]]) ...`:
      ! the condition has length > 1

---

    Code
      get_time_format(time_style = NULL)
    Condition
      Error in `if (time_format_tbl_i[["flexible"]]) ...`:
      ! argument is of length zero

---

    Code
      get_time_format(time_style = c(1, 2))
    Condition
      Error in `if (!(time_style %in% time_format_num_range)) ...`:
      ! the condition has length > 1

---

    Code
      get_time_format(time_style = "Hmsa")
    Condition
      Error in `get_time_format()`:
      ! If using a `time_style` name, it must be in the valid set.
      * Use `info_time_style()` for a useful visual reference.

# The `process_footnote_marks()` function works properly

    Code
      process_footnote_marks(as.character(1:12), marks = "extended")
    Condition
      Error in `x - 1`:
      ! non-numeric argument to binary operator

---

    Code
      process_footnote_marks(list(1, 2), marks = "letters")
    Condition
      Error in `x - 1`:
      ! non-numeric argument to binary operator

---

    Code
      process_footnote_marks(Inf, marks = "letters")
    Condition
      Error in `rep()`:
      ! invalid 'times' argument

# The `validate_length_one()` function works for vectors

    Code
      validate_length_one(c(), "vector")
    Condition
      Error:
      ! `vector` must have a length one, not 0.

---

    Code
      validate_length_one(c(1, 2), "vector")
    Condition
      Error:
      ! `vector` must have a length one, not 2.

---

    Code
      validate_length_one(list(), "vector")
    Condition
      Error:
      ! `vector` must have a length one, not 0.

