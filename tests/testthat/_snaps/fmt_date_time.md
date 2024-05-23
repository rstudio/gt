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
      Error in `fmt_date()`:
      ! Invalid date style. See `gt::info_date_style()`.
      Caused by error:
      ! `date_style` must be one of "iso", "wday_month_day_year", "wd_m_day_year", "wday_day_month_year", "month_day_year", "m_day_year", "day_m_year", "day_month_year", "day_month", "day_m", "year", "month", "day", "year.mn.day", "y.mn.day", "year_week", "year_quarter", "yMd", "yMEd", "yMMM", "yMMMM", "yMMMd", "yMMMEd", "GyMd", "GyMMMd", "GyMMMEd", "yM", "Md", "MEd", "MMMd", "MMMEd", "MMMMd", "GyMMM", "yQQQ", "yQQQQ", "Gy", "y", "M", "MMM", "d", or "Ed", not "none".

---

    Code
      tab_1 %>% fmt_date(columns = "date", date_style = 50)
    Condition
      Error in `fmt_date()`:
      ! Invalid date style. See `gt::info_date_style()`.
      Caused by error:
      ! `date_style` must be a whole number between 1 and 41, not the number 50.

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

