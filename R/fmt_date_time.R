#------------------------------------------------------------------------------#
#
#                /$$
#               | $$
#     /$$$$$$  /$$$$$$
#    /$$__  $$|_  $$_/
#   | $$  \ $$  | $$
#   | $$  | $$  | $$ /$$
#   |  $$$$$$$  |  $$$$/
#    \____  $$   \___/
#    /$$  \ $$
#   |  $$$$$$/
#    \______/
#
#  This file is part of the 'rstudio/gt' project.
#
#  Copyright (c) 2018-2025 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


# fmt_date() -------------------------------------------------------------------
#' Format values as dates
#'
#' @description
#'
#' Format input values to time values using one of 41 preset date styles. Input
#' can be in the form of `POSIXt` (i.e., datetimes), the `Date` type, or
#' `character` (must be in the ISO 8601 form of `YYYY-MM-DD HH:MM:SS` or
#' `YYYY-MM-DD`).
#'
#' @inheritParams fmt_number
#'
#' @param date_style *Predefined style for dates*
#'
#'   `scalar<character>|scalar<numeric|integer>(1<=val<=41)` // *default:* `"iso"`
#'
#'   The date style to use. By default this is the short name `"iso"` which
#'   corresponds to ISO 8601 date formatting. There are 41 date styles in total
#'   and their short names can be viewed using [info_date_style()].
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_date()` is compatible with body cells that are of the `"Date"`,
#' `"POSIXt"` or `"character"` types. Any other types of body cells are ignored
#' during formatting. This is to say that cells of incompatible data types may
#' be targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_date()` to obtain
#' varying parameter values from a specified column within the table. This means
#' that each row could be formatted a little bit differently. These arguments
#' provide support for [from_column()]:
#'
#' - `date_style`
#' - `pattern`
#' - `locale`
#'
#' Please note that for each of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Formatting with the `date_style` argument:
#'
#' We need to supply a preset date style to the `date_style` argument. The date
#' styles are numerous and can handle localization to any supported locale. A
#' large segment of date styles are termed flexible date formats and this means
#' that their output will adapt to any `locale` provided. That feature makes the
#' flexible date formats a better option for locales other than `"en"` (the
#' default locale).
#'
#' The following table provides a listing of all date styles and their output
#' values (corresponding to an input date of `2000-02-29`).
#'
#' |    | Date Style            | Output                  | Notes         |
#' |----|-----------------------|-------------------------|---------------|
#' | 1  | `"iso"`               | `"2000-02-29"`          | ISO 8601      |
#' | 2  | `"wday_month_day_year"`| `"Tuesday, February 29, 2000"`  |      |
#' | 3  | `"wd_m_day_year"`     | `"Tue, Feb 29, 2000"`   |               |
#' | 4  | `"wday_day_month_year"`| `"Tuesday 29 February 2000"`    |      |
#' | 5  | `"month_day_year"`    | `"February 29, 2000"`   |               |
#' | 6  | `"m_day_year"`        | `"Feb 29, 2000"`        |               |
#' | 7  | `"day_m_year"`        | `"29 Feb 2000"`         |               |
#' | 8  | `"day_month_year"`    | `"29 February 2000"`    |               |
#' | 9  | `"day_month"`         | `"29 February"`         |               |
#' | 10 | `"day_m"`             | `"29 Feb"`              |               |
#' | 11 | `"year"`              | `"2000"`                |               |
#' | 12 | `"month"`             | `"February"`            |               |
#' | 13 | `"day"`               | `"29"`                  |               |
#' | 14 | `"year.mn.day"`       | `"2000/02/29"`          |               |
#' | 15 | `"y.mn.day"`          | `"00/02/29"`            |               |
#' | 16 | `"year_week"`         | `"2000-W09"`            |               |
#' | 17 | `"year_quarter"`      | `"2000-Q1"`             |               |
#' | 18 | `"yMd"`               | `"2/29/2000"`           | flexible      |
#' | 19 | `"yMEd"`              | `"Tue, 2/29/2000"`      | flexible      |
#' | 20 | `"yMMM"`              | `"Feb 2000"`            | flexible      |
#' | 21 | `"yMMMM"`             | `"February 2000"`       | flexible      |
#' | 22 | `"yMMMd"`             | `"Feb 29, 2000"`        | flexible      |
#' | 23 | `"yMMMEd"`            | `"Tue, Feb 29, 2000"`   | flexible      |
#' | 24 | `"GyMd"`              | `"2/29/2000 A"`         | flexible      |
#' | 25 | `"GyMMMd"`            | `"Feb 29, 2000 AD"`     | flexible      |
#' | 26 | `"GyMMMEd"`           | `"Tue, Feb 29, 2000 AD"`| flexible      |
#' | 27 | `"yM"`                | `"2/2000"`              | flexible      |
#' | 28 | `"Md"`                | `"2/29"`                | flexible      |
#' | 29 | `"MEd"`               | `"Tue, 2/29"`           | flexible      |
#' | 30 | `"MMMd"`              | `"Feb 29"`              | flexible      |
#' | 31 | `"MMMEd"`             | `"Tue, Feb 29"`         | flexible      |
#' | 32 | `"MMMMd"`             | `"February 29"`         | flexible      |
#' | 33 | `"GyMMM"`             | `"Feb 2000 AD"`         | flexible      |
#' | 34 | `"yQQQ"`              | `"Q1 2000"`             | flexible      |
#' | 35 | `"yQQQQ"`             | `"1st quarter 2000"`    | flexible      |
#' | 36 | `"Gy"`                | `"2000 AD"`             | flexible      |
#' | 37 | `"y"`                 | `"2000"`                | flexible      |
#' | 38 | `"M"`                 | `"2"`                   | flexible      |
#' | 39 | `"MMM"`               | `"Feb"`                 | flexible      |
#' | 40 | `"d"`                 | `"29"`                  | flexible      |
#' | 41 | `"Ed"`                | `"29 Tue"`              | flexible      |
#'
#' We can call [info_date_style()] in the console to view a similar table
#' of date styles with example output.
#'
#' @section Adapting output to a specific `locale`:
#'
#' This formatting function can adapt outputs according to a provided `locale`
#' value. Examples include `"en"` for English (United States) and `"fr"` for
#' French (France). Note that a `locale` value provided here will override any
#' global locale setting performed in [gt()]'s own `locale` argument (it is
#' settable there as a value received by all other functions that have a
#' `locale` argument). As a useful reference on which locales are supported, we
#' can call [info_locales()] to view an info table.
#'
#' @section Examples:
#'
#' Let's use the [`exibble`] dataset to create a simple, two-column **gt** table
#' (keeping only the `date` and `time` columns). With `fmt_date()`, we'll format
#' the `date` column to display dates formatted with the `"month_day_year"`
#' date style.
#'
#' ```r
#' exibble |>
#'   dplyr::select(date, time) |>
#'   gt() |>
#'   fmt_date(
#'     columns = date,
#'     date_style = "month_day_year"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_date_1.png")`
#' }}
#'
#' Again using the [`exibble`] dataset, let's format the `date` column to have
#' mixed date formats, where dates after April 1st will be different than the
#' others because of the expressions used in the `rows` argument. This will
#' involve two calls of `fmt_date()` with different statements provided for
#' `rows`. In the first call (dates after the 1st of April) the date style
#' `"m_day_year"` is used; for the second call, `"day_m_year"` is the named
#' date style supplied to `date_style`.
#'
#' ```r
#' exibble |>
#'   dplyr::select(date, time) |>
#'   gt() |>
#'   fmt_date(
#'     columns = date,
#'     rows = as.Date(date) > as.Date("2015-04-01"),
#'     date_style = "m_day_year"
#'   ) |>
#'   fmt_date(
#'     columns = date,
#'     rows = as.Date(date) <= as.Date("2015-04-01"),
#'     date_style = "day_m_year"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_date_2.png")`
#' }}
#'
#' Use the [`exibble`] dataset to create a single-column **gt** table (with only
#' the `date` column). Format the date values using the `"yMMMEd"` date style
#' (which is one of the 'flexible' styles). Also, we'll set the locale to `"nl"`
#' to get the dates in Dutch.
#'
#' ```r
#' exibble |>
#'   dplyr::select(date) |>
#'   gt() |>
#'   fmt_date(
#'     date_style = "yMMMEd",
#'     locale = "nl"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_date_3.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-13
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @seealso The vector-formatting version of this function: [vec_fmt_date()].
#'
#' @export
fmt_date <- function(
    data,
    columns = everything(),
    rows = everything(),
    date_style = "iso",
    pattern = "{x}",
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - date_style
  # - pattern
  # - locale

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_date",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_date(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          date_style = p_i$date_style %||% date_style,
          pattern = p_i$pattern %||% pattern,
          locale = p_i$locale %||% locale
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Stop function if `locale` does not have a valid value; normalize locale
  # and resolve one that might be set globally
  validate_locale(locale = locale)
  locale <- normalize_locale(locale = locale)
  locale <- resolve_locale(data = data, locale = locale)

  # Transform `date_style` to `date_format_str`
  date_format_str <- withCallingHandlers(
    get_date_format(date_style = date_style),
    error = function(e) {
      cli::cli_abort("Invalid date style. See {.run gt::info_date_style()}.",
                     parent = e)
    })

  valid_class <- c("Date", "POSIXt", "character")
  extra_msg <- c(i = "If character data is supplied, it should be ISO-8601 formatted dates.")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class, extra_msg = extra_msg)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = valid_class,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      use_latex_math_mode = FALSE,
      format_fn = function(x, context) {

        # Handle Inf values by preserving them as "Inf" strings
        x_is_inf <- is.infinite(x)
        x_is_finite <- !x_is_inf
        
        # Initialize result vector
        x_formatted <- character(length(x))
        
        # Only process finite values
        if (any(x_is_finite)) {

          # Convert finite values to POSIXlt but provide a friendly error
          # if the values cannot be parsed by `as.POSIXlt()`
          date <-
            withCallingHandlers(
              as.POSIXlt(x[x_is_finite], tz = "GMT"),
              error = function(e) {
                cli::cli_abort(
                  "One or more of the provided date/datetime values are invalid.",
                  call = call("fmt_date"),
                  parent = e
                )
              }
            )

          # Format the date string using `fdt()`
          x_formatted[x_is_finite] <- bigD::fdt(
            input = as.character(date),
            format = date_format_str,
            locale = locale
          )
        }
        
        # Preserve Inf values as "Inf" in the result
        x_formatted[x_is_inf] <- "Inf"
        
        x_formatted
      }
    )
  )
}

# fmt_time() -------------------------------------------------------------------
#' Format values as times
#'
#' @description
#'
#' Format input values to time values using one of 25 preset time styles. Input
#' can be in the form of `POSIXt` (i.e., datetimes), `character` (must be in the
#' ISO 8601 forms of `HH:MM:SS` or `YYYY-MM-DD HH:MM:SS`), or `Date` (which
#' always results in the formatting of `00:00:00`).
#'
#' @inheritParams fmt_number
#'
#' @param time_style *Predefined style for times*
#'
#'   `scalar<character>|scalar<numeric|integer>(1<=val<=25)` // *default:* `"iso"`
#'
#'   The time style to use. By default this is the short name `"iso"` which
#'   corresponds to how times are formatted within ISO 8601 datetime values.
#'   There are 25 time styles in total and their short names can be viewed using
#'   [info_time_style()].
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_time()` is compatible with body cells that are of the `"Date"`,
#' `"POSIXt"` or `"character"` types. Any other types of body cells are ignored
#' during formatting. This is to say that cells of incompatible data types may
#' be targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_time()` to obtain
#' varying parameter values from a specified column within the table. This means
#' that each row could be formatted a little bit differently. These arguments
#' provide support for [from_column()]:
#'
#' - `time_style`
#' - `pattern`
#' - `locale`
#'
#' Please note that for each of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Formatting with the `time_style` argument:
#'
#' We need to supply a preset time style to the `time_style` argument. There are
#' many time styles and all of them can handle localization to any supported
#' locale. Many of the time styles are termed flexible time formats and this
#' means that their output will adapt to any `locale` provided. That feature
#' makes the flexible time formats a better option for locales other than `"en"`
#' (the default locale).
#'
#' The following table provides a listing of all time styles and their output
#' values (corresponding to an input time of `14:35:00`). It is noted which of
#' these represent 12- or 24-hour time.
#'
#' |    | Time Style    | Output                          | Notes         |
#' |----|---------------|---------------------------------|---------------|
#' | 1  | `"iso"`       | `"14:35:00"`                    | ISO 8601, 24h |
#' | 2  | `"iso-short"` | `"14:35"`                       | ISO 8601, 24h |
#' | 3  | `"h_m_s_p"`   | `"2:35:00 PM"`                  | 12h           |
#' | 4  | `"h_m_p"`     | `"2:35 PM"`                     | 12h           |
#' | 5  | `"h_p"`       | `"2 PM"`                        | 12h           |
#' | 6  | `"Hms"`       | `"14:35:00"`                    | flexible, 24h |
#' | 7  | `"Hm"`        | `"14:35"`                       | flexible, 24h |
#' | 8  | `"H"`         | `"14"`                          | flexible, 24h |
#' | 9  | `"EHm"`       | `"Thu 14:35"`                   | flexible, 24h |
#' | 10 | `"EHms"`      | `"Thu 14:35:00"`                | flexible, 24h |
#' | 11 | `"Hmsv"`      | `"14:35:00 GMT+00:00"`          | flexible, 24h |
#' | 12 | `"Hmv"`       | `"14:35 GMT+00:00"`             | flexible, 24h |
#' | 13 | `"hms"`       | `"2:35:00 PM"`                  | flexible, 12h |
#' | 14 | `"hm"`        | `"2:35 PM"`                     | flexible, 12h |
#' | 15 | `"h"`         | `"2 PM"`                        | flexible, 12h |
#' | 16 | `"Ehm"`       | `"Thu 2:35 PM"`                 | flexible, 12h |
#' | 17 | `"Ehms"`      | `"Thu 2:35:00 PM"`              | flexible, 12h |
#' | 18 | `"EBhms"`   | `"Thu 2:35:00 in the afternoon"`  | flexible, 12h |
#' | 19 | `"Bhms"`      | `"2:35:00 in the afternoon"`    | flexible, 12h |
#' | 20 | `"EBhm"`      | `"Thu 2:35 in the afternoon"`   | flexible, 12h |
#' | 21 | `"Bhm"`       | `"2:35 in the afternoon"`       | flexible, 12h |
#' | 22 | `"Bh"`        | `"2 in the afternoon"`          | flexible, 12h |
#' | 23 | `"hmsv"`      | `"2:35:00 PM GMT+00:00"`        | flexible, 12h |
#' | 24 | `"hmv"`       | `"2:35 PM GMT+00:00"`           | flexible, 12h |
#' | 25 | `"ms"`        | `"35:00"`                       | flexible      |
#'
#' We can call [info_time_style()] in the console to view a similar table of
#' time styles with example output.
#'
#' @section Adapting output to a specific `locale`:
#'
#' This formatting function can adapt outputs according to a provided `locale`
#' value. Examples include `"en"` for English (United States) and `"fr"` for
#' French (France). Note that a `locale` value provided here will override any
#' global locale setting performed in [gt()]'s own `locale` argument (it is
#' settable there as a value received by all other functions that have a
#' `locale` argument). As a useful reference on which locales are supported, we
#' can use [info_locales()] to view an info table.
#'
#' @section Examples:
#'
#' Let's use the [`exibble`] dataset to create a simple, two-column **gt** table
#' (keeping only the `date` and `time` columns). Format the `time` column with
#' `fmt_time()` to display times formatted with the `"h_m_s_p"` time style.
#'
#' ```r
#' exibble |>
#'   dplyr::select(date, time) |>
#'   gt() |>
#'   fmt_time(
#'     columns = time,
#'     time_style = "h_m_s_p"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_time_1.png")`
#' }}
#'
#' Again using the [`exibble`] dataset, let's format the `time` column to have
#' mixed time formats, where times after 16:00 will be different than the others
#' because of the expressions used in the `rows` argument. This will involve two
#' calls of `fmt_time()` with different statements provided for `rows`. In the
#' first call (times after 16:00) the time style `"h_m_s_p"` is used; for the
#' second call, `"h_m_p"` is the named time style supplied to `time_style`.
#'
#' ```r
#' exibble |>
#'   dplyr::select(date, time) |>
#'   gt() |>
#'   fmt_time(
#'     columns = time,
#'     rows = time > "16:00",
#'     time_style = "h_m_s_p"
#'   ) |>
#'   fmt_time(
#'     columns = time,
#'     rows = time <= "16:00",
#'     time_style = "h_m_p"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_time_2.png")`
#' }}
#'
#' Use the [`exibble`] dataset to create a single-column **gt** table (with only
#' the `time` column). Format the time values using the `"EBhms"` time style
#' (which is one of the 'flexible' styles). Also, we'll set the locale to `"sv"`
#' to get the times in Swedish.
#'
#' ```r
#' exibble |>
#'   dplyr::select(time) |>
#'   gt() |>
#'   fmt_time(
#'     columns = time,
#'     time_style = "EBhms",
#'     locale = "sv"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_time_3.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-14
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @seealso The vector-formatting version of this function: [vec_fmt_time()].
#'
#' @export
fmt_time <- function(
    data,
    columns = everything(),
    rows = everything(),
    time_style = "iso",
    pattern = "{x}",
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - time_style
  # - pattern
  # - locale

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_time",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_time(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          time_style = p_i$time_style %||% time_style,
          pattern = p_i$pattern %||% pattern,
          locale = p_i$locale %||% locale
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Stop function if `locale` does not have a valid value; normalize locale
  # and resolve one that might be set globally
  validate_locale(locale = locale)
  locale <- normalize_locale(locale = locale)
  locale <- resolve_locale(data = data, locale = locale)

  # Transform `time_style` to `time_format_str`
  time_format_str <- withCallingHandlers(
    get_time_format(time_style = time_style),
    error = function(e) {
      cli::cli_abort("Invalid time style. See {.run gt::info_time_style()}.",
                     parent = e)
    })

  valid_class <- c("Date", "POSIXt", "character")
  msg <- c(i = "Allowed types are `Date`, `POSIXt`, and `character` (in
      `HH:MM:SS` format).")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class, msg)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = valid_class,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      use_latex_math_mode = FALSE,
      format_fn = function(x, context) {

        # If the incoming values are strings that adequately represent time
        # values, then prepend with the `1970-01-01` dummy date to create an
        # input that will works with `strftime()`
        if (all(is_string_time(x))) {
          x <- paste("1970-01-01", x)
        }

        # Handle Inf values by preserving them as "Inf" strings
        x_is_inf <- is.infinite(x)
        x_is_finite <- !x_is_inf
        
        # Initialize result vector
        x_formatted <- character(length(x))

        # Only process finite values
        if (any(x_is_finite)) {
          
          # Convert finite values to POSIXlt but provide a friendly error
          # if the values cannot be parsed by `as.POSIXlt()`
          time <-
            withCallingHandlers(
              as.POSIXlt(x[x_is_finite], tz = "GMT"),
              error = function(e) {
                cli::cli_abort(
                  "One or more of the provided date/time/datetime values are invalid.",
                  call = call("fmt_time"),
                  parent = e
                )
              }
            )

          # Format the time string using `fdt()`
          x_formatted[x_is_finite] <- bigD::fdt(
            input = as.character(time),
            format = time_format_str,
            locale = locale
          )
        }
        
        # Preserve Inf values as "Inf" in the result
        x_formatted[x_is_inf] <- "Inf"
        
        x_formatted
      }
    )
  )
}

# fmt_datetime() ---------------------------------------------------------------
#' Format values as datetimes
#'
#' @description
#'
#' Format input values to datetime values using either presets for the date and
#' time components or a formatting directive (this can either use a *CLDR*
#' datetime pattern or `strptime` formatting). The input values can be in the
#' form of `POSIXct` (i.e., datetimes), the `Date` type, or `character` (must be
#' in the ISO 8601 form of `YYYY-MM-DD HH:MM:SS` or `YYYY-MM-DD`).
#'
#' @inheritParams fmt_number
#'
#' @inheritParams fmt_date
#'
#' @inheritParams fmt_time
#'
#' @param sep *Separator between date and time components*
#'
#'   `scalar<character>` // *default:* `" "`
#'
#'   The separator string to use between the date and time components. By
#'   default, this is a single space character (`" "`). Only used when not
#'   specifying a `format` code.
#'
#' @param format *Date/time formatting string*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional formatting string used for generating custom dates/times. If
#'   used then the arguments governing preset styles (`date_style` and
#'   `time_style`) will be ignored in favor of formatting via the `format`
#'   string.
#'
#' @param tz *Time zone*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   The time zone for printing dates/times (i.e., the output). The
#'   default of `NULL` will preserve the time zone of the input data in the
#'   output. If providing a time zone, it must be one that is recognized by the
#'   user's operating system (a vector of all valid `tz` values can be produced
#'   with [OlsonNames()]).
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_datetime()` is compatible with body cells that are of the `"Date"`,
#' `"POSIXct"` or `"character"` types. Any other types of body cells are ignored
#' during formatting. This is to say that cells of incompatible data types may
#' be targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_datetime()` to
#' obtain varying parameter values from a specified column within the table.
#' This means that each row could be formatted a little bit differently. These
#' arguments provide support for [from_column()]:
#'
#' - `date_style`
#' - `time_style`
#' - `sep`
#' - `format`
#' - `tz`
#' - `pattern`
#' - `locale`
#'
#' Please note that for each of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Formatting with the `date_style` argument:
#'
#' We can supply a preset date style to the `date_style` argument to separately
#' handle the date portion of the output. The date styles are numerous and can
#' handle localization to any supported locale. A large segment of date styles
#' are termed flexible date formats and this means that their output will adapt
#' to any `locale` provided. That feature makes the flexible date formats a
#' better option for locales other than `"en"` (the default locale).
#'
#' The following table provides a listing of all date styles and their output
#' values (corresponding to an input date of `2000-02-29`).
#'
#' |    | Date Style            | Output                  | Notes         |
#' |----|-----------------------|-------------------------|---------------|
#' | 1  | `"iso"`               | `"2000-02-29"`          | ISO 8601      |
#' | 2  | `"wday_month_day_year"`| `"Tuesday, February 29, 2000"`  |      |
#' | 3  | `"wd_m_day_year"`     | `"Tue, Feb 29, 2000"`   |               |
#' | 4  | `"wday_day_month_year"`| `"Tuesday 29 February 2000"`    |      |
#' | 5  | `"month_day_year"`    | `"February 29, 2000"`   |               |
#' | 6  | `"m_day_year"`        | `"Feb 29, 2000"`        |               |
#' | 7  | `"day_m_year"`        | `"29 Feb 2000"`         |               |
#' | 8  | `"day_month_year"`    | `"29 February 2000"`    |               |
#' | 9  | `"day_month"`         | `"29 February"`         |               |
#' | 10 | `"day_m"`             | `"29 Feb"`              |               |
#' | 11 | `"year"`              | `"2000"`                |               |
#' | 12 | `"month"`             | `"February"`            |               |
#' | 13 | `"day"`               | `"29"`                  |               |
#' | 14 | `"year.mn.day"`       | `"2000/02/29"`          |               |
#' | 15 | `"y.mn.day"`          | `"00/02/29"`            |               |
#' | 16 | `"year_week"`         | `"2000-W09"`            |               |
#' | 17 | `"year_quarter"`      | `"2000-Q1"`             |               |
#' | 18 | `"yMd"`               | `"2/29/2000"`           | flexible      |
#' | 19 | `"yMEd"`              | `"Tue, 2/29/2000"`      | flexible      |
#' | 20 | `"yMMM"`              | `"Feb 2000"`            | flexible      |
#' | 21 | `"yMMMM"`             | `"February 2000"`       | flexible      |
#' | 22 | `"yMMMd"`             | `"Feb 29, 2000"`        | flexible      |
#' | 23 | `"yMMMEd"`            | `"Tue, Feb 29, 2000"`   | flexible      |
#' | 24 | `"GyMd"`              | `"2/29/2000 A"`         | flexible      |
#' | 25 | `"GyMMMd"`            | `"Feb 29, 2000 AD"`     | flexible      |
#' | 26 | `"GyMMMEd"`           | `"Tue, Feb 29, 2000 AD"`| flexible      |
#' | 27 | `"yM"`                | `"2/2000"`              | flexible      |
#' | 28 | `"Md"`                | `"2/29"`                | flexible      |
#' | 29 | `"MEd"`               | `"Tue, 2/29"`           | flexible      |
#' | 30 | `"MMMd"`              | `"Feb 29"`              | flexible      |
#' | 31 | `"MMMEd"`             | `"Tue, Feb 29"`         | flexible      |
#' | 32 | `"MMMMd"`             | `"February 29"`         | flexible      |
#' | 33 | `"GyMMM"`             | `"Feb 2000 AD"`         | flexible      |
#' | 34 | `"yQQQ"`              | `"Q1 2000"`             | flexible      |
#' | 35 | `"yQQQQ"`             | `"1st quarter 2000"`    | flexible      |
#' | 36 | `"Gy"`                | `"2000 AD"`             | flexible      |
#' | 37 | `"y"`                 | `"2000"`                | flexible      |
#' | 38 | `"M"`                 | `"2"`                   | flexible      |
#' | 39 | `"MMM"`               | `"Feb"`                 | flexible      |
#' | 40 | `"d"`                 | `"29"`                  | flexible      |
#' | 41 | `"Ed"`                | `"29 Tue"`              | flexible      |
#'
#' We can call [info_date_style()] in the console to view a similar table of
#' date styles with example output.
#'
#' @section Formatting with the `time_style` argument:
#'
#' We can supply a preset time style to the `time_style` argument to separately
#' handle the time portion of the output. There are many time styles and all of
#' them can handle localization to any supported locale. Many of the time styles
#' are termed flexible time formats and this means that their output will adapt
#' to any `locale` provided. That feature makes the flexible time formats a
#' better option for locales other than `"en"` (the default locale).
#'
#' The following table provides a listing of all time styles and their output
#' values (corresponding to an input time of `14:35:00`). It is noted which of
#' these represent 12- or 24-hour time. Some of the flexible formats (those
#' that begin with `"E"`) include the day of the week. Keep this in mind
#' when pairing such `time_style` values with a `date_style` so as to avoid
#' redundant or repeating information.
#'
#' |    | Time Style    | Output                          | Notes         |
#' |----|---------------|---------------------------------|---------------|
#' | 1  | `"iso"`       | `"14:35:00"`                    | ISO 8601, 24h |
#' | 2  | `"iso-short"` | `"14:35"`                       | ISO 8601, 24h |
#' | 3  | `"h_m_s_p"`   | `"2:35:00 PM"`                  | 12h           |
#' | 4  | `"h_m_p"`     | `"2:35 PM"`                     | 12h           |
#' | 5  | `"h_p"`       | `"2 PM"`                        | 12h           |
#' | 6  | `"Hms"`       | `"14:35:00"`                    | flexible, 24h |
#' | 7  | `"Hm"`        | `"14:35"`                       | flexible, 24h |
#' | 8  | `"H"`         | `"14"`                          | flexible, 24h |
#' | 9  | `"EHm"`       | `"Thu 14:35"`                   | flexible, 24h |
#' | 10 | `"EHms"`      | `"Thu 14:35:00"`                | flexible, 24h |
#' | 11 | `"Hmsv"`      | `"14:35:00 GMT+00:00"`          | flexible, 24h |
#' | 12 | `"Hmv"`       | `"14:35 GMT+00:00"`             | flexible, 24h |
#' | 13 | `"hms"`       | `"2:35:00 PM"`                  | flexible, 12h |
#' | 14 | `"hm"`        | `"2:35 PM"`                     | flexible, 12h |
#' | 15 | `"h"`         | `"2 PM"`                        | flexible, 12h |
#' | 16 | `"Ehm"`       | `"Thu 2:35 PM"`                 | flexible, 12h |
#' | 17 | `"Ehms"`      | `"Thu 2:35:00 PM"`              | flexible, 12h |
#' | 18 | `"EBhms"`   | `"Thu 2:35:00 in the afternoon"`  | flexible, 12h |
#' | 19 | `"Bhms"`      | `"2:35:00 in the afternoon"`    | flexible, 12h |
#' | 20 | `"EBhm"`      | `"Thu 2:35 in the afternoon"`   | flexible, 12h |
#' | 21 | `"Bhm"`       | `"2:35 in the afternoon"`       | flexible, 12h |
#' | 22 | `"Bh"`        | `"2 in the afternoon"`          | flexible, 12h |
#' | 23 | `"hmsv"`      | `"2:35:00 PM GMT+00:00"`        | flexible, 12h |
#' | 24 | `"hmv"`       | `"2:35 PM GMT+00:00"`           | flexible, 12h |
#' | 25 | `"ms"`        | `"35:00"`                       | flexible      |
#'
#' We can call [info_time_style()] in the console to view a similar table of
#' time styles with example output.
#'
#' @section Formatting with a *CLDR* datetime pattern:
#'
#' We can use a *CLDR* datetime pattern with the `format` argument to create
#' a highly customized and locale-aware output. This is a character string that
#' consists of two types of elements:
#'
#' - Pattern fields, which repeat a specific pattern character one or more
#'   times. These fields are replaced with date and time data when formatting.
#'   The character sets of `A`-`Z` and `a`-`z` are reserved for use as pattern
#'   characters.
#' - Literal text, which is output verbatim when formatting. This can include:
#'     - Any characters outside the reserved character sets, including
#'       spaces and punctuation.
#'     - Any text between single vertical quotes (e.g., `'text'`).
#'     - Two adjacent single vertical quotes (''), which represent a literal
#'     single quote, either inside or outside quoted text.
#'
#' The number of pattern fields is quite sizable so let's first look at how some
#' *CLDR* datetime patterns work. We'll use the datetime string
#' `"2018-07-04T22:05:09.2358(America/Vancouver)"` for all of the examples that
#' follow.
#'
#' - `"mm/dd/y"` -> `"05/04/2018"`
#' - `"EEEE, MMMM d, y"` -> `"Wednesday, July 4, 2018"`
#' - `"MMM d E"` -> `"Jul 4 Wed"`
#' - `"HH:mm"` -> `"22:05"`
#' - `"h:mm a"` -> `"10:05 PM"`
#' - `"EEEE, MMMM d, y 'at' h:mm a"` -> `"Wednesday, July 4, 2018 at 10:05 PM"`
#'
#' Here are the individual pattern fields:
#'
#' ## Year
#'
#' ### Calendar Year
#'
#' This yields the calendar year, which is always numeric. In most cases the
#' length of the `"y"` field specifies the minimum number of digits to display,
#' zero-padded as necessary. More digits will be displayed if needed to show the
#' full year. There is an exception: `"yy"` gives use just the two low-order
#' digits of the year, zero-padded as necessary. For most use cases, `"y"` or
#' `"yy"` should be good enough.
#'
#' | Field Patterns                 | Output                                 |
#' |------------------------------- |----------------------------------------|
#' | `"y"`                          | `"2018"`                               |
#' | `"yy"`                         | `"18"`                                 |
#' | `"yyy"` to `"yyyyyyyyy"`       | `"2018"` to `"000002018"`              |
#'
#' ### Year in the Week in Year Calendar
#'
#' This is the year in 'Week of Year' based calendars in which the year
#' transition occurs on a week boundary. This may differ from calendar year
#' `"y"` near a year transition. This numeric year designation is used in
#' conjunction with pattern character `"w"` in the ISO year-week calendar as
#' defined by ISO 8601.
#'
#' | Field Patterns                 | Output                                 |
#' |--------------------------------|----------------------------------------|
#' | `"Y"`                          | `"2018"`                               |
#' | `"YY"`                         | `"18"`                                 |
#' | `"YYY"` to `"YYYYYYYYY"`       | `"2018"` to `"000002018"`              |
#'
#' ## Quarter
#'
#' ### Quarter of the Year: formatting and standalone versions
#'
#' The quarter names are identified numerically, starting at `1` and ending at
#' `4`. Quarter names may vary along two axes: the width and the context. The
#' context is either 'formatting' (taken as a default), which the form used
#' within a complete date format string, or, 'standalone', the form for date
#' elements used independently (such as in calendar headers). The standalone
#' form may be used in any other date format that shares the same form of the
#' name. Here, the formatting form for quarters of the year consists of some run
#' of `"Q"` values whereas the standalone form uses `"q"`.
#'
#' | Field Patterns    | Output          | Notes                             |
#' |-------------------|-----------------|-----------------------------------|
#' | `"Q"`/`"q"`       | `"3"`           | Numeric, one digit                |
#' | `"QQ"`/`"qq"`     | `"03"`          | Numeric, two digits (zero padded) |
#' | `"QQQ"`/`"qqq"`   | `"Q3"`          | Abbreviated                       |
#' | `"QQQQ"`/`"qqqq"` | `"3rd quarter"` | Wide                              |
#' | `"QQQQQ"`/`"qqqqq"` | `"3"`         | Narrow                            |
#'
#' ## Month
#'
#' ### Month: formatting and standalone versions
#'
#' The month names are identified numerically, starting at `1` and ending at
#' `12`. Month names may vary along two axes: the width and the context. The
#' context is either 'formatting' (taken as a default), which the form used
#' within a complete date format string, or, 'standalone', the form for date
#' elements used independently (such as in calendar headers). The standalone
#' form may be used in any other date format that shares the same form of the
#' name. Here, the formatting form for months consists of some run of `"M"`
#' values whereas the standalone form uses `"L"`.
#'
#' | Field Patterns    | Output          | Notes                             |
#' |-------------------|-----------------|-----------------------------------|
#' | `"M"`/`"L"`       | `"7"`           | Numeric, minimum digits           |
#' | `"MM"`/`"LL"`     | `"07"`          | Numeric, two digits (zero padded) |
#' | `"MMM"`/`"LLL"`   | `"Jul"`         | Abbreviated                       |
#' | `"MMMM"`/`"LLLL"` | `"July"`        | Wide                              |
#' | `"MMMMM"`/`"LLLLL"` | `"J"`         | Narrow                            |
#'
#' ## Week
#'
#' ### Week of Year
#'
#' Values calculated for the week of year range from `1` to `53`. Week `1` for a
#' year is the first week that contains at least the specified minimum number of
#' days from that year. Weeks between week `1` of one year and week `1` of the
#' following year are numbered sequentially from `2` to `52` or `53` (if
#' needed).
#'
#' There are two available field lengths. Both will display the week of year
#' value but the `"ww"` width will always show two digits (where weeks `1` to
#' `9` are zero padded).
#'
#' | Field Patterns   | Output    | Notes                                    |
#' |------------------|-----------|------------------------------------------|
#' | `"w"`            | `"27"`    | Minimum digits                           |
#' | `"ww"`           | `"27"`    | Two digits (zero padded)                 |
#'
#' ### Week of Month
#'
#' The week of a month can range from `1` to `5`. The first day of every month
#' always begins at week `1` and with every transition into the beginning of a
#' week, the week of month value is incremented by `1`.
#'
#' | Field Pattern    | Output                                               |
#' |------------------|------------------------------------------------------|
#' | `"W"`            | `"1"`                                                |
#'
#' ## Day
#'
#' ### Day of Month
#'
#' The day of month value is always numeric and there are two available field
#' length choices in its formatting. Both will display the day of month value
#' but the `"dd"` formatting will always show two digits (where days `1` to `9`
#' are zero padded).
#'
#' | Field Patterns | Output    | Notes                                      |
#' |----------------|-----------|--------------------------------------------|
#' | `"d"`          | `"4"`     | Minimum digits                             |
#' | `"dd"`         | `"04"`    | Two digits, zero padded                    |
#'
#' ### Day of Year
#'
#' The day of year value ranges from `1` (January 1) to either `365` or `366`
#' (December 31), where the higher value of the range indicates that the year is
#' a leap year (29 days in February, instead of 28). The field length specifies
#' the minimum number of digits, with zero-padding as necessary.
#'
#' | Field Patterns  | Output   | Notes                                      |
#' |-----------------|----------|--------------------------------------------|
#' | `"D"`           | `"185"`  |                                            |
#' | `"DD"`          | `"185"`  | Zero padded to minimum width of 2          |
#' | `"DDD"`         | `"185"`  | Zero padded to minimum width of 3          |
#'
#' ### Day of Week in Month
#'
#' The day of week in month returns a numerical value indicating the number of
#' times a given weekday had occurred in the month (e.g., '2nd Monday in
#' March'). This conveniently resolves to predicable case structure where ranges
#' of day of the month values return predictable day of week in month values:
#'
#' - days `1` - `7` -> `1`
#' - days `8` - `14` -> `2`
#' - days `15` - `21` -> `3`
#' - days `22` - `28` -> `4`
#' - days `29` - `31` -> `5`
#'
#' | Field Pattern                  | Output                                 |
#' |--------------------------------|----------------------------------------|
#' | `"F"`                          | `"1"`                                  |
#'
#' ### Modified Julian Date
#'
#' The modified version of the Julian date is obtained by subtracting
#' 2,400,000.5 days from the Julian date (the number of days since January 1,
#' 4713 BC). This essentially results in the number of days since midnight
#' November 17, 1858. There is a half day offset (unlike the Julian date, the
#' modified Julian date is referenced to midnight instead of noon).
#'
#' | Field Patterns                 | Output                                 |
#' |--------------------------------|----------------------------------------|
#' | `"g"` to `"ggggggggg"`         | `"58303"` -> `"000058303"`             |
#'
#' ## Weekday
#'
#' ### Day of Week Name
#'
#' The name of the day of week is offered in four different widths.
#'
#' | Field Patterns             | Output         | Notes                     |
#' |----------------------------|----------------|---------------------------|
#' | `"E"`, `"EE"`, or `"EEE"`  | `"Wed"`        | Abbreviated               |
#' | `"EEEE"`                   | `"Wednesday"`  | Wide                      |
#' | `"EEEEE"`                  | `"W"`          | Narrow                    |
#' | `"EEEEEE"`                 | `"We"`         | Short                     |
#'
#' ## Periods
#'
#' ### AM/PM Period of Day
#'
#' This denotes before noon and after noon time periods. May be upper or
#' lowercase depending on the locale and other options. The wide form may be
#' the same as the short form if the 'real' long form (e.g. 'ante meridiem') is
#' not customarily used. The narrow form must be unique, unlike some other
#' fields.
#'
#' | Field Patterns                 | Output   | Notes                       |
#' |--------------------------------|----------|-----------------------------|
#' | `"a"`, `"aa"`, or `"aaa"`      | `"PM"`   | Abbreviated                 |
#' | `"aaaa"`                       | `"PM"`   | Wide                        |
#' | `"aaaaa"`                      | `"p"`    | Narrow                      |
#'
#' ### AM/PM Period of Day Plus Noon and Midnight
#'
#' Provide AM and PM as well as phrases for exactly noon and midnight. May be
#' upper or lowercase depending on the locale and other options. If the locale
#' doesn't have the notion of a unique 'noon' (i.e., 12:00), then the PM form
#' may be substituted. A similar behavior can occur for 'midnight' (00:00) and
#' the AM form. The narrow form must be unique, unlike some other fields.
#'
#' (a) `input_midnight`: `"2020-05-05T00:00:00"`
#' (b) `input_noon`: `"2020-05-05T12:00:00"`
#'
#' | Field Patterns                 | Output             | Notes             |
#' |--------------------------------|--------------------|-------------------|
#' | `"b"`, `"bb"`, or `"bbb"`      | (a) `"midnight"`   | Abbreviated       |
#' |                                | (b) `"noon"`       |                   |
#' | `"bbbb"`                       | (a) `"midnight"`   | Wide              |
#' |                                | (b) `"noon"`       |                   |
#' | `"bbbbb"`                      | (a) `"mi"`         | Narrow            |
#' |                                | (b) `"n"`          |                   |
#'
#' ### Flexible Day Periods
#'
#' Flexible day periods denotes things like 'in the afternoon', 'in the
#' evening', etc., and the flexibility comes from a locale's language and
#' script. Each locale has an associated rule set that specifies when the day
#' periods start and end for that locale.
#'
#' (a) `input_morning`: `"2020-05-05T00:08:30"`
#' (b) `input_afternoon`: `"2020-05-05T14:00:00"`
#'
#' | Field Patterns             | Output                   | Notes           |
#' |----------------------------|--------------------------|-----------------|
#' | `"B"`, `"BB"`, or `"BBB"`  | (a) `"in the morning"`   | Abbreviated     |
#' |                            | (b) `"in the afternoon"` |                 |
#' | `"BBBB"`                   | (a) `"in the morning"`   | Wide            |
#' |                            | (b) `"in the afternoon"` |                 |
#' | `"BBBBB"`                  | (a) `"in the morning"`   | Narrow          |
#' |                            | (b) `"in the afternoon"` |                 |
#'
#' ## Hours, Minutes, and Seconds
#'
#' ### Hour 0-23
#'
#' Hours from `0` to `23` are for a standard 24-hour clock cycle (midnight plus
#' 1 minute is `00:01`) when using `"HH"` (which is the more common width that
#' indicates zero-padding to 2 digits).
#'
#' Using `"2015-08-01T08:35:09"`:
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"H"`                  | `"8"`   | Numeric, minimum digits              |
#' | `"HH"`                 | `"08"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Hour 1-12
#'
#' Hours from `1` to `12` are for a standard 12-hour clock cycle (midnight plus
#' 1 minute is `12:01`) when using `"hh"` (which is the more common width that
#' indicates zero-padding to 2 digits).
#'
#' Using `"2015-08-01T08:35:09"`:
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"h"`                  | `"8"`   | Numeric, minimum digits              |
#' | `"hh"`                 | `"08"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Hour 1-24
#'
#' Using hours from `1` to `24` is a less common way to express a 24-hour clock
#' cycle (midnight plus 1 minute is `24:01`) when using `"kk"` (which is the
#' more common width that indicates zero-padding to 2 digits).
#'
#' Using `"2015-08-01T08:35:09"`:
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"k"`                  | `"9"`   | Numeric, minimum digits              |
#' | `"kk"`                 | `"09"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Hour 0-11
#'
#' Using hours from `0` to `11` is a less common way to express a 12-hour clock
#' cycle (midnight plus 1 minute is `00:01`) when using `"KK"` (which is the
#' more common width that indicates zero-padding to 2 digits).
#'
#' Using `"2015-08-01T08:35:09"`:
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"K"`                  | `"7"`   | Numeric, minimum digits              |
#' | `"KK"`                 | `"07"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Minute
#'
#' The minute of the hour which can be any number from `0` to `59`. Use `"m"` to
#' show the minimum number of digits, or `"mm"` to always show two digits
#' (zero-padding, if necessary).
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"m"`                  | `"5"`   | Numeric, minimum digits              |
#' | `"mm"`                 | `"06"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Seconds
#'
#' The second of the minute which can be any number from `0` to `59`. Use `"s"`
#' to show the minimum number of digits, or `"ss"` to always show two digits
#' (zero-padding, if necessary).
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"s"`                  | `"9"`   | Numeric, minimum digits              |
#' | `"ss"`                 | `"09"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Fractional Second
#'
#' The fractional second truncates (like other time fields) to the width
#' requested (i.e., count of letters). So using pattern `"SSSS"` will display
#' four digits past the decimal (which, incidentally, needs to be added manually
#' to the pattern).
#'
#' | Field Patterns                 | Output                                 |
#' |--------------------------------|----------------------------------------|
#' | `"S"` to `"SSSSSSSSS"`         | `"2"` -> `"235000000"`                 |
#'
#' ### Milliseconds Elapsed in Day
#'
#' There are 86,400,000 milliseconds in a day and the `"A"` pattern will provide
#' the whole number. The width can go up to nine digits with `"AAAAAAAAA"` and
#' these higher field widths will result in zero padding if necessary.
#'
#' Using `"2011-07-27T00:07:19.7223"`:
#'
#' | Field Patterns                 | Output                                 |
#' |--------------------------------|----------------------------------------|
#' | `"A"` to `"AAAAAAAAA"`         | `"439722"` -> `"000439722"`            |
#'
#' ## Era
#'
#' ### The Era Designator
#'
#' This provides the era name for the given date. The Gregorian calendar has two
#' eras: AD and BC. In the AD year numbering system, AD 1 is immediately
#' preceded by 1 BC, with nothing in between them (there was no year zero).
#'
#' | Field Patterns                 | Output          | Notes                |
#' |--------------------------------|-----------------|----------------------|
#' | `"G"`, `"GG"`, or `"GGG"`      | `"AD"`          | Abbreviated          |
#' | `"GGGG"`                       | `"Anno Domini"` | Wide                 |
#' | `"GGGGG"`                      | `"A"`           | Narrow               |
#'
#' ## Time Zones
#'
#' ### TZ // Short and Long Specific non-Location Format
#'
#' The short and long specific non-location formats for time zones are suggested
#' for displaying a time with a user friendly time zone name. Where the short
#' specific format is unavailable, it will fall back to the short localized GMT
#' format (`"O"`). Where the long specific format is unavailable, it will fall
#' back to the long localized GMT format (`"OOOO"`).
#'
#' | Field Patterns             | Output                    | Notes          |
#' |----------------------------|---------------------------|----------------|
#' | `"z"`, `"zz"`, or `"zzz"`  | `"PDT"`                   | Short Specific |
#' | `"zzzz"`                   | `"Pacific Daylight Time"` | Long Specific  |
#'
#' ### TZ // Common UTC Offset Formats
#'
#' The ISO8601 basic format with hours, minutes and optional seconds fields is
#' represented by `"Z"`, `"ZZ"`, or `"ZZZ"`. The format is equivalent to RFC 822
#' zone format (when the optional seconds field is absent). This is equivalent
#' to the `"xxxx"` specifier. The field pattern `"ZZZZ"` represents the long
#' localized GMT format. This is equivalent to the `"OOOO"` specifier. Finally,
#' `"ZZZZZ"` pattern yields the ISO8601 extended format with hours, minutes and
#' optional seconds fields. The ISO8601 UTC indicator `Z` is used when local
#' time offset is `0`. This is equivalent to the `"XXXXX"` specifier.
#'
#' | Field Patterns             | Output       | Notes                       |
#' |----------------------------|--------------|-----------------------------|
#' | `"Z"`, `"ZZ"`, or `"ZZZ"`  | `"-0700"`    | ISO 8601 basic format       |
#' | `"ZZZZ"`                   | `"GMT-7:00"` | Long localized GMT format   |
#' | `"ZZZZZ"`                  | `"-07:00"`   | ISO 8601 extended format    |
#'
#' ### TZ // Short and Long Localized GMT Formats
#'
#' The localized GMT formats come in two widths `"O"` (which removes the minutes
#' field if it's `0`) and `"OOOO"` (which always contains the minutes field).
#' The use of the `GMT` indicator changes according to the locale.
#'
#' | Field Patterns          | Output        | Notes                         |
#' |-------------------------|---------------|-------------------------------|
#' | `"O"`                   | `"GMT-7"`     | Short localized GMT format    |
#' | `"OOOO"`                | `"GMT-07:00"` | Long localized GMT format     |
#'
#' ### TZ // Short and Long Generic non-Location Formats
#'
#' The generic non-location formats are useful for displaying a recurring wall
#' time (e.g., events, meetings) or anywhere people do not want to be overly
#' specific. Where either of these is unavailable, there is a fallback to the
#' generic location format (`"VVVV"`), then the short localized GMT format as
#' the final fallback.
#'
#' | Field Patterns  | Output           | Notes                              |
#' |-----------------|------------------|------------------------------------|
#' | `"v"`           | `"PT"`           | Short generic non-location format  |
#' | `"vvvv"`        | `"Pacific Time"` | Long generic non-location format   |
#'
#' ### TZ // Short Time Zone IDs and Exemplar City Formats
#'
#' These formats provide variations of the time zone ID and often include the
#' exemplar city. The widest of these formats, `"VVVV"`, is useful for
#' populating a choice list for time zones, because it supports 1-to-1 name/zone
#' ID mapping and is more uniform than other text formats.
#'
#' | Field Patterns     | Output                | Notes                      |
#' |--------------------|-----------------------|----------------------------|
#' | `"V"`              | `"cavan"`             | Short time zone ID         |
#' | `"VV"`             | `"America/Vancouver"` | Long time zone ID          |
#' | `"VVV"`            | `"Vancouver"`         | The tz exemplar city       |
#' | `"VVVV"`           | `"Vancouver Time"`    | Generic location format    |
#'
#' ### TZ // ISO 8601 Formats with Z for +0000
#'
#' The `"X"`-`"XXX"` field patterns represent valid ISO 8601 patterns for time
#' zone offsets in datetimes. The final two widths, `"XXXX"` and `"XXXXX"` allow
#' for optional seconds fields. The seconds field is *not* supported by the ISO
#' 8601 specification. For all of these, the ISO 8601 UTC indicator `Z` is used
#' when the local time offset is `0`.
#'
#' | Field Patterns | Output     | Notes                                     |
#' |----------------|------------|-------------------------------------------|
#' | `"X"`          | `"-07"`    | ISO 8601 basic format (h, optional m)     |
#' | `"XX"`         | `"-0700"`  | ISO 8601 basic format (h & m)             |
#' | `"XXX"`        | `"-07:00"` | ISO 8601 extended format (h & m)          |
#' | `"XXXX"`       | `"-0700"`  | ISO 8601 basic format (h & m, optional s) |
#' | `"XXXXX"`      | `"-07:00"` | ISO 8601 extended format (h & m, optional s) |
#'
#' ### TZ // ISO 8601 Formats (no use of Z for +0000)
#'
#' The `"x"`-`"xxxxx"` field patterns represent valid ISO 8601 patterns for time
#' zone offsets in datetimes. They are similar to the `"X"`-`"XXXXX"` field
#' patterns except that the ISO 8601 UTC indicator `Z` *will not* be used when
#' the local time offset is `0`.
#'
#' | Field Patterns | Output     | Notes                                     |
#' |----------------|------------|-------------------------------------------|
#' | `"x"`          | `"-07"`    | ISO 8601 basic format (h, optional m)     |
#' | `"xx"`         | `"-0700"`  | ISO 8601 basic format (h & m)             |
#' | `"xxx"`        | `"-07:00"` | ISO 8601 extended format (h & m)          |
#' | `"xxxx"`       | `"-0700"`  | ISO 8601 basic format (h & m, optional s) |
#' | `"xxxxx"`      | `"-07:00"` | ISO 8601 extended format (h & m, optional s) |
#'
#' @section Formatting with a `strptime` format code:
#'
#' Performing custom date/time formatting with the `format` argument can also
#' occur with a `strptime` format code. This works by constructing a string of
#' individual format codes representing formatted date and time elements. These
#' are all indicated with a leading `%`, literal characters are interpreted as
#' any characters not starting with a `%` character.
#'
#' First off, let's look at a few format code combinations that work well
#' together as a `strptime` format. This will give us an intuition on how these
#' generally work. We'll use the datetime `"2015-06-08 23:05:37.48"` for all of
#' the examples that follow.
#'
#' - `"%m/%d/%Y"` -> `"06/08/2015"`
#' - `"%A, %B %e, %Y"` -> `"Monday, June 8, 2015"`
#' - `"%b %e %a"` -> `"Jun 8 Mon"`
#' - `"%H:%M"` -> `"23:05"`
#' - `"%I:%M %p"` -> `"11:05 pm"`
#' - `"%A, %B %e, %Y at %I:%M %p"` -> `"Monday, June 8, 2015 at 11:05 pm"`
#'
#' Here are the individual format codes for the date components:
#'
#' - `"%a"` -> `"Mon"` (abbreviated day of week name)
#' - `"%A"` -> `"Monday"` (full day of week name)
#' - `"%w"` -> `"1"` (day of week number in `0..6`; Sunday is `0`)
#' - `"%u"` -> `"1"` (day of week number in `1..7`; Monday is `1`, Sunday `7`)
#' - `"%y"` -> `"15"` (abbreviated year, using the final two digits)
#' - `"%Y"` -> `"2015"` (full year)
#' - `"%b"` -> `"Jun"` (abbreviated month name)
#' - `"%B"` -> `"June"` (full month name)
#' - `"%m"` -> `"06"` (month number)
#' - `"%d"` -> `"08"` (day number, zero-padded)
#' - `"%e"` -> `"8"` (day number without zero padding)
#' - `"%j"` -> `"159"` (day of the year, always zero-padded)
#' - `"%W"` -> `"23"` (week number for the year, always zero-padded)
#' - `"%V"` -> `"24"` (week number for the year, following the ISO 8601
#' standard)
#' - `"%C"` -> `"20"` (the century number)
#'
#' Here are the individual format codes for the time components:
#'
#' - `"%H"` -> `"23"` (24h hour)
#' - `"%I"` -> `"11"` (12h hour)
#' - `"%M"` -> `"05"` (minute)
#' - `"%S"` -> `"37"` (second)
#' - `"%OS3"` -> `"37.480"` (seconds with decimals; `3` decimal places here)
#' - `%p` -> `"pm"` (AM or PM indicator)
#'
#' Here are some extra formats that you may find useful:
#'
#' - `"%z"` -> `"+0000"` (signed time zone offset, here using UTC)
#' - `"%F"` -> `"2015-06-08"` (the date in the ISO 8601 date format)
#' - `"%%"` -> `"%"` (the literal "`%`" character, in case you need it)
#'
#' @section Adapting output to a specific `locale`:
#'
#' This formatting function can adapt outputs according to a provided `locale`
#' value. Examples include `"en"` for English (United States) and `"fr"` for
#' French (France). Note that a `locale` value provided here will override any
#' global locale setting performed in [gt()]'s own `locale` argument (it is
#' settable there as a value received by all other functions that have a
#' `locale` argument). As a useful reference on which locales are supported, we
#' can call [info_locales()] to view an info table.
#'
#' @section Examples:
#'
#' Use the [`exibble`] dataset to create a single-column **gt** table (with only
#' the `datetime` column). With `fmt_datetime()` we'll format the `datetime`
#' column to have dates formatted with the `"month_day_year"` style and times
#' with the `"h_m_s_p"` 12-hour time style.
#'
#' ```r
#' exibble |>
#'   dplyr::select(datetime) |>
#'   gt() |>
#'   fmt_datetime(
#'     date_style = "month_day_year",
#'     time_style = "h_m_s_p"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_datetime_1.png")`
#' }}
#'
#' Using the same input table, we can use `fmt_datetime()` with flexible date
#' and time styles. Two that work well together are `"MMMEd"` and `"Hms"`. These
#' date and time styles will, being flexible, create outputs that conform to the
#' locale value given to the `locale` argument. Let's use two calls of
#' `fmt_datetime()`: the first will format all rows in `datetime` to the Danish
#' locale (with `locale = "da"`) and the second call will target the first three
#' rows with the same formatting, but in the default locale (which is `"en"`).
#'
#' ```r
#' exibble |>
#'   dplyr::select(datetime) |>
#'   gt() |>
#'   fmt_datetime(
#'     date_style = "MMMEd",
#'     time_style = "Hms",
#'     locale = "da"
#'   ) |>
#'   fmt_datetime(
#'     rows = 1:3,
#'     date_style = "MMMEd",
#'     time_style = "Hms"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_datetime_2.png")`
#' }}
#'
#' It's possible to use the `format` argument and write our own formatting
#' specification. Using the CLDR datetime pattern
#' `"EEEE, MMMM d, y 'at' h:mm a (zzzz)"` gives us datetime outputs with time
#' zone formatting. Let's provide a time zone ID (`"America/Vancouver"`) to the
#' `tz` argument.
#'
#' ```r
#' exibble |>
#'   dplyr::select(datetime) |>
#'   gt() |>
#'   fmt_datetime(
#'     format = "EEEE, MMMM d, y 'at' h:mm a (zzzz)",
#'     tz = "America/Vancouver"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_datetime_3.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-15
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @seealso The vector-formatting version of this function:
#'   [vec_fmt_datetime()].
#'
#' @export
fmt_datetime <- function(
    data,
    columns = everything(),
    rows = everything(),
    date_style = "iso",
    time_style = "iso",
    sep = " ",
    format = NULL,
    tz = NULL,
    pattern = "{x}",
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - date_style
  # - time_style
  # - sep
  # - format
  # - tz
  # - pattern
  # - locale

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_datetime",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_datetime(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          date_style = p_i$date_style %||% date_style,
          time_style = p_i$time_style %||% time_style,
          sep = p_i$sep %||% sep,
          format = p_i$format %||% format,
          tz = p_i$tz %||% tz,
          pattern = p_i$pattern %||% pattern,
          locale = p_i$locale %||% locale
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Stop function if `locale` does not have a valid value; normalize locale
  # and resolve one that might be set globally
  validate_locale(locale = locale)
  locale <- normalize_locale(locale = locale)
  locale <- resolve_locale(data = data, locale = locale)

  if (!is.null(format)) {

    # Ensure that the format code meets some basic validation requirements
    check_string(format)

  } else {

    # Transform `date_style` to `date_format_str`
    date_format_str <- withCallingHandlers(
      get_date_format(date_style = date_style),
      error = function(e) {
        cli::cli_abort("Invalid date style. See {.run gt::info_date_style()} for valid inputs.",
                       parent = e)
      })

    # Transform `time_style` to `time_format_str`
    time_format_str <- withCallingHandlers(
      get_time_format(time_style = time_style),
      error = function(e) {
        cli::cli_abort("Invalid time style. See {.run gt::info_time_style()} for valid inputs.",
                       parent = e)
      })
  }

  valid_class <- c("Date", "POSIXct", "character")
  msg <- c(i = "Allowed types are `Date`, `POSIXct`, and `character` (with
      ISO-8601 formatted dates)")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class, msg)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    compat = valid_class,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      use_latex_math_mode = FALSE,
      format_fn = function(x, context) {

        # Handle Inf values by preserving them as "Inf" strings
        x_is_inf <- is.infinite(x)
        x_is_finite <- !x_is_inf
        
        # Initialize result vector
        x_formatted <- character(length(x))

        # If a format string is provided then use that to generate the
        # formatted date/time string
        if (!is.null(format)) {

          # If the incoming values are strings that adequately represent time
          # values, then prepend with the `1970-01-01` dummy date to create an
          # input that will works with `strftime()`
          if (all(is_string_time(x[x_is_finite]))) {
            x[x_is_finite] <- paste("1970-01-01", x[x_is_finite])
          }

          if (grepl("%", format)) {

            if (is.character(x) && any(x_is_finite)) {

              tz <- tz %||% "GMT"

              datetime <-
                withCallingHandlers(
                  as.POSIXlt(x[x_is_finite]),
                  error = function(e) {
                    cli::cli_abort(
                      "One or more of the provided date/datetime values are invalid.",
                      call = call("fmt_datetime"),
                      parent = e
                    )
                  }
                )

              attr(datetime, which = "tzone") <- tz

              datetime <- as.POSIXct(datetime)

              x_formatted[x_is_finite] <- strftime(datetime, format = format, tz = tz)
              x_formatted[x_is_inf] <- "Inf"
              return(x_formatted)
            }

            # Format the datetime values using `strftime()`
            if (any(x_is_finite)) {
              x_formatted[x_is_finite] <- strftime(x[x_is_finite], format = format, tz = tz)
            }
            x_formatted[x_is_inf] <- "Inf"
            return(x_formatted)

          } else {

            tz <- tz %||% "UTC"

            if (any(x_is_finite)) {
              dt_str <- strftime(x[x_is_finite], format = "%Y-%m-%dT%H:%M:%S%z", tz = tz)

              if ("tzone" %in% names(attributes(x))) {
                tzone <- attr(x, which = "tzone", exact = TRUE)
                dt_str <- paste0(dt_str, "(", tzone, ")")
              }

              # Format the datetime values using `fdt()`
              x_formatted[x_is_finite] <- bigD::fdt(
                input = dt_str,
                format = format,
                locale = locale,
                use_tz = tz
              )
            }
            x_formatted[x_is_inf] <- "Inf"
            return(x_formatted)
          }
        }

        #
        # Format the date and time portions of the datetime value
        #

        # Only process finite values
        if (any(x_is_finite)) {
          # Convert finite values to POSIXlt but provide a friendly error
          # if the values cannot be parsed by `as.POSIXlt()`
          datetime <-
            withCallingHandlers(
              as.POSIXlt(x[x_is_finite]),
              error = function(e) {
                cli::cli_abort(
                  # possibly Error in `fmt()` caused by error in `as.POSIXlt`
                  "One or more of the provided date/datetime values are invalid.",
                  call = call("fmt_datetime"),
                  parent = e
                )
              }
            )

          #
          # Separately format the date and time portions using `fdt()`
          #

          date_str <-
            bigD::fdt(
              input = as.character(datetime),
              format = date_format_str,
              locale = locale
            )

          time_str <-
            bigD::fdt(
              input = as.character(datetime),
              format = time_format_str,
              locale = locale
            )

          x_formatted[x_is_finite] <- paste0(date_str, sep, time_str)
        }
        
        # Preserve Inf values as "Inf" in the result
        x_formatted[x_is_inf] <- "Inf"
        
        x_formatted
      }
    )
  )
}
