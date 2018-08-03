#' View a table with info on date styles
#' @importFrom dplyr tibble
#' @family information functions
#' @export
info_date_style <- function() {

  dplyr::tibble(
    Number = 1:14,
    Name = c(
      "iso", "wday_month_day_year", "wd_m_day_year", "wday_day_month_year",
      "month_day_year", "m_day_year", "day_m_year", "day_month_year",
      "day_month", "year", "month", "day", "year.mn.day", "y.mn.day"),
    date = "2000-02-29") %>%
    gt() %>%
    fmt_date(columns = vars(date), rows = 1, date_style = 1) %>%
    fmt_date(columns = vars(date), rows = 2, date_style = 2) %>%
    fmt_date(columns = vars(date), rows = 3, date_style = 3) %>%
    fmt_date(columns = vars(date), rows = 4, date_style = 4) %>%
    fmt_date(columns = vars(date), rows = 5, date_style = 5) %>%
    fmt_date(columns = vars(date), rows = 6, date_style = 6) %>%
    fmt_date(columns = vars(date), rows = 7, date_style = 7) %>%
    fmt_date(columns = vars(date), rows = 8, date_style = 8) %>%
    fmt_date(columns = vars(date), rows = 9, date_style = 9) %>%
    fmt_date(columns = vars(date), rows = 10, date_style = 10) %>%
    fmt_date(columns = vars(date), rows = 11, date_style = 11) %>%
    fmt_date(columns = vars(date), rows = 12, date_style = 12) %>%
    fmt_date(columns = vars(date), rows = 13, date_style = 13) %>%
    fmt_date(columns = vars(date), rows = 14, date_style = 14) %>%
    tab_boxhead_panel(group = "Date Formats", columns = c("Number", "Name")) %>%
    cols_label(labels = c("date" = "Formatted Date")) %>%
    tab_heading(
      title = "Preset Date Formats",
      headnote = md("Usable in the `fmt_date()` and `fmt_datetime()` functions"))
}

#' View a table with info on time styles
#' @importFrom dplyr tibble
#' @family information functions
#' @export
info_time_style <- function() {

  dplyr::tibble(
    Number = 1:5,
    Name = c("hms", "hm", "hms_p", "hm_p", "h_p"),
    time = "14:35") %>%
    gt() %>%
    fmt_time(columns = vars(time), rows = 1, time_style = 1) %>%
    fmt_time(columns = vars(time), rows = 2, time_style = 2) %>%
    fmt_time(columns = vars(time), rows = 3, time_style = 3) %>%
    fmt_time(columns = vars(time), rows = 4, time_style = 4) %>%
    fmt_time(columns = vars(time), rows = 5, time_style = 5) %>%
    tab_boxhead_panel(group = "Time Formats", columns = c("Number", "Name")) %>%
    cols_label(labels = c("time" = "Formatted Time")) %>%
    tab_heading(
      title = "Preset Time Formats",
      headnote = md("Usable in the `fmt_time()` and `fmt_datetime()` functions"))
}
