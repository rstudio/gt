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
      ! `data` must be a `gt_tbl` object, not a <html/character> object.

---

    Code
      stop_if_not_gt_group(gt(exibble))
    Condition
      Error:
      ! `data` must be a `gt_group` object, not a <gt_tbl/list> object.

---

    Code
      stop_if_not_gt_group(gt_preview(gtcars))
    Condition
      Error:
      ! `data` must be a `gt_group` object, not a <gt_tbl/list> object.

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
      ! `data` must be a `gt_group` object, not a <html/character> object.

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
      ! `data` must either be a `gt_tbl` or a `gt_group`, not a <html/character> object.

# The `get_date_format()` function works properly

    Code
      get_date_format(date_style = 42)
    Condition
      Error:
      ! `date_style` must be a whole number between 1 and 41, not the number 42.

---

    Code
      get_date_format(date_style = "42")
    Condition
      Error:
      ! `date_style` must be one of "iso", "wday_month_day_year", "wd_m_day_year", "wday_day_month_year", "month_day_year", "m_day_year", "day_m_year", "day_month_year", "day_month", "day_m", "year", "month", "day", "year.mn.day", "y.mn.day", "year_week", "year_quarter", "yMd", "yMEd", "yMMM", "yMMMM", "yMMMd", "yMMMEd", "GyMd", "GyMMMd", "GyMMMEd", "yM", "Md", "MEd", "MMMd", "MMMEd", "MMMMd", "GyMMM", "yQQQ", "yQQQQ", "Gy", "y", "M", "MMM", "d", or "Ed", not "42".

---

    Code
      get_date_format(date_style = 0)
    Condition
      Error:
      ! `date_style` must be a whole number between 1 and 41, not the number 0.

---

    Code
      get_date_format(date_style = "0")
    Condition
      Error:
      ! `date_style` must be one of "iso", "wday_month_day_year", "wd_m_day_year", "wday_day_month_year", "month_day_year", "m_day_year", "day_m_year", "day_month_year", "day_month", "day_m", "year", "month", "day", "year.mn.day", "y.mn.day", "year_week", "year_quarter", "yMd", "yMEd", "yMMM", "yMMMM", "yMMMd", "yMMMEd", "GyMd", "GyMMMd", "GyMMMEd", "yM", "Md", "MEd", "MMMd", "MMMEd", "MMMMd", "GyMMM", "yQQQ", "yQQQQ", "Gy", "y", "M", "MMM", "d", or "Ed", not "0".

---

    Code
      get_date_format(date_style = -5)
    Condition
      Error:
      ! `date_style` must be a whole number between 1 and 41, not the number -5.

---

    Code
      get_date_format(date_style = "-5")
    Condition
      Error:
      ! `date_style` must be one of "iso", "wday_month_day_year", "wd_m_day_year", "wday_day_month_year", "month_day_year", "m_day_year", "day_m_year", "day_month_year", "day_month", "day_m", "year", "month", "day", "year.mn.day", "y.mn.day", "year_week", "year_quarter", "yMd", "yMEd", "yMMM", "yMMMM", "yMMMd", "yMMMEd", "GyMd", "GyMMMd", "GyMMMEd", "yM", "Md", "MEd", "MMMd", "MMMEd", "MMMMd", "GyMMM", "yQQQ", "yQQQQ", "Gy", "y", "M", "MMM", "d", or "Ed", not "-5".

---

    Code
      get_date_format(date_style = NA)
    Condition
      Error:
      ! `date_style` must be numeric or character.

---

    Code
      get_date_format(date_style = NULL)
    Condition
      Error:
      ! `date_style` must be numeric or character.

---

    Code
      get_date_format(date_style = c(1, 2))
    Condition
      Error:
      ! `date_style` must be a whole number, not a double vector.

---

    Code
      get_date_format(date_style = "daym")
    Condition
      Error:
      ! `date_style` must be one of "iso", "wday_month_day_year", "wd_m_day_year", "wday_day_month_year", "month_day_year", "m_day_year", "day_m_year", "day_month_year", "day_month", "day_m", "year", "month", "day", "year.mn.day", "y.mn.day", "year_week", "year_quarter", "yMd", "yMEd", "yMMM", "yMMMM", "yMMMd", "yMMMEd", "GyMd", "GyMMMd", "GyMMMEd", "yM", "Md", "MEd", "MMMd", "MMMEd", "MMMMd", "GyMMM", "yQQQ", "yQQQQ", "Gy", "y", "M", "MMM", "d", or "Ed", not "daym".
      i Did you mean "day_m"?

# The `get_time_format()` function works properly

    Code
      get_time_format(time_style = 26)
    Condition
      Error:
      ! `time_style` must be a whole number between 1 and 25, not the number 26.

---

    Code
      get_time_format(time_style = "26")
    Condition
      Error:
      ! `time_style` must be one of "iso", "iso-short", "h_m_s_p", "h_m_p", "h_p", "Hms", "Hm", "H", "EHm", "EHms", "Hmsv", "Hmv", "hms", "hm", "h", "Ehm", "Ehms", "EBhms", "Bhms", "EBhm", "Bhm", "Bh", "hmsv", "hmv", or "ms", not "26".

---

    Code
      get_time_format(time_style = 0)
    Condition
      Error:
      ! `time_style` must be a whole number between 1 and 25, not the number 0.

---

    Code
      get_time_format(time_style = "0")
    Condition
      Error:
      ! `time_style` must be one of "iso", "iso-short", "h_m_s_p", "h_m_p", "h_p", "Hms", "Hm", "H", "EHm", "EHms", "Hmsv", "Hmv", "hms", "hm", "h", "Ehm", "Ehms", "EBhms", "Bhms", "EBhm", "Bhm", "Bh", "hmsv", "hmv", or "ms", not "0".

---

    Code
      get_time_format(time_style = -5)
    Condition
      Error:
      ! `time_style` must be a whole number between 1 and 25, not the number -5.

---

    Code
      get_time_format(time_style = "-5")
    Condition
      Error:
      ! `time_style` must be one of "iso", "iso-short", "h_m_s_p", "h_m_p", "h_p", "Hms", "Hm", "H", "EHm", "EHms", "Hmsv", "Hmv", "hms", "hm", "h", "Ehm", "Ehms", "EBhms", "Bhms", "EBhm", "Bhm", "Bh", "hmsv", "hmv", or "ms", not "-5".

---

    Code
      get_time_format(time_style = NA)
    Condition
      Error:
      ! `time_style` must be numeric or character.

---

    Code
      get_time_format(time_style = NULL)
    Condition
      Error:
      ! `time_style` must be numeric or character.

---

    Code
      get_time_format(time_style = c(1, 2))
    Condition
      Error:
      ! `time_style` must be a whole number, not a double vector.

---

    Code
      get_time_format(time_style = "Hmsa")
    Condition
      Error:
      ! `time_style` must be one of "iso", "iso-short", "h_m_s_p", "h_m_p", "h_p", "Hms", "Hm", "H", "EHm", "EHms", "Hmsv", "Hmv", "hms", "hm", "h", "Ehm", "Ehms", "EBhms", "Bhms", "EBhm", "Bhm", "Bh", "hmsv", "hmv", or "ms", not "Hmsa".
      i Did you mean "Hmsv"?

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

