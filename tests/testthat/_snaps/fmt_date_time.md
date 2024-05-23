# The `fmt_date()` function works correctly

    Code
      tab %>% fmt_date(columns = "num_1", date_style = 1)
    Condition
      Error in `fmt_date()`:
      ! Can't select columns that don't exist.
      x Column `num_1` doesn't exist.

---

    Code
      tab_1 %>% fmt_date(columns = "date", date_style = "none")
    Condition
      Error in `get_date_format()`:
      ! If using a `date_style` name, it must be in the valid set.
      * Use `info_date_style()` for a useful visual reference.

---

    Code
      tab_1 %>% fmt_date(columns = "date", date_style = 50)
    Condition
      Error in `get_date_format()`:
      ! If using a numeric value for a `date_style`, it must be
      between `1` and `41`.
      * Use `info_date_style()` for a useful visual reference.

---

    Code
      dplyr::tibble(time = c("23:01", "15:30", "08:22")) %>% gt() %>% fmt_date(
        columns = "time") %>% as_raw_html(inline_css = FALSE)
    Condition
      Error in `fmt_date()`:
      ! One or more of the provided date/datetime values are invalid.
      Caused by error in `as.POSIXlt.character()`:
      ! character string is not in a standard unambiguous format

---

    Code
      dplyr::tibble(date = c("2013-12-30", "2017-30-15")) %>% gt() %>% fmt_date(
        columns = "date") %>% as_raw_html(inline_css = FALSE)
    Condition
      Error in `fmt_date()`:
      ! One or more of the provided date/datetime values are invalid.
      Caused by error in `as.POSIXlt.character()`:
      ! character string is not in a standard unambiguous format

# The `fmt_time()` function works correctly

    Code
      tab %>% fmt_time(columns = "num_1", time_style = 1)
    Condition
      Error in `fmt_time()`:
      ! Can't select columns that don't exist.
      x Column `num_1` doesn't exist.

# The `fmt_datetime()` function works correctly

    Code
      tab %>% fmt_datetime(columns = "num_1", date_style = 1, time_style = 1)
    Condition
      Error in `fmt_datetime()`:
      ! Can't select columns that don't exist.
      x Column `num_1` doesn't exist.

