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


# info_date_style() ------------------------------------------------------------
#' View a table with info on date styles
#'
#' @description
#'
#' [fmt_date()] lets us format date-based values in a convenient manner using
#' preset styles. The table generated by `info_date_style()` provides a quick
#' reference to all styles, with associated format names and example outputs
#' using a fixed date (`2000-02-29`).
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for displaying formatted
#'   date values according to the locale's rules. Examples include `"en"` for
#'   English (United States) and `"fr"` for French (France). We can call
#'   [info_locales()] for a useful reference for all of the locales that are
#'   supported.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Get a table of info on the different date-formatting styles (which are used
#' by supplying a number code to [fmt_date()]).
#'
#' ```r
#' info_date_style()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_info_date_style_1.png")`
#' }}
#'
#' @family information functions
#' @section Function ID:
#' 11-1
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
info_date_style <- function(locale = NULL) {

  if (is.null(locale)) {
    locale <- "en"
  }

  date_df <- date_formats()

  date_df$date <- "2000-02-29"

  flexible_rows <- date_df[, "flexible"][["flexible"]]

  date_df$flexible[flexible_rows] <- "FLEXIBLE"
  date_df$flexible[!flexible_rows] <- ""

  gt_tbl <- gt(date_df, rowname_col = "format_number", locale = locale)

  gt_tbl <- cols_hide(gt_tbl, columns = format_code)

  gt_tbl <-
    fmt_date(
      gt_tbl,
      columns = date,
      date_style = from_column(column = "format_name")
    )

  gt_tbl <-
    text_transform(
      gt_tbl,
      locations = cells_body(
        columns = flexible,
        rows = flexible == "FLEXIBLE"
      ),
      fn = function(x) {
        paste0(
          "<span style='",
          "color: darkslategray; font-weight: 700; font-size: 12px; ",
          "border: solid 1px; background: aliceblue; border-color: steelblue; ",
          "border-width: 2px; border-radius: 4px; padding: 0px 8px 0px 8px;",
          "'>", x, "</span>"
        )
      }
    )

  gt_tbl <-
    cols_label(
      gt_tbl,
      format_name = "Format Name",
      flexible = "",
      date = html(
        paste0(
          "Formatted Date (<span style=\"text-transform:none;\">",
          locale,
          "</span>)"
        )
      )
    )

  gt_tbl <-
    cols_width(
      gt_tbl,
      format_number ~ px(60),
      format_name ~ px(220),
      flexible ~ px(100),
      date ~ px(315)
    )

  gt_tbl <- opt_align_table_header(gt_tbl, align = "left")

  gt_tbl <- cols_align(gt_tbl, align = "center", columns = flexible)

  gt_tbl <- cols_align(gt_tbl, align = "left", columns = date)

  gt_tbl <-
    tab_style(
      gt_tbl,
      style = cell_text(
        font = system_fonts(name = "monospace-code"),
        size = px(12)
      ),
      locations = cells_body(columns = format_name)
    )

  gt_tbl <-
    tab_style(
      gt_tbl,
      style =
        cell_borders(
          sides = "r",
          color = "lightblue",
          weight = px(1.5)
        ),
      locations = cells_body(columns = format_name)
    )

  gt_tbl <- opt_all_caps(gt_tbl)

  gt_tbl <- opt_stylize(gt_tbl, style = 6)

  gt_tbl <-
    tab_style(
      gt_tbl,
      style = cell_text(size = px(24)),
      locations = cells_title(groups = "title")
    )

  gt_tbl <-
    tab_style(
      gt_tbl,
      style = cell_text(size = px(18)),
      locations = cells_title(groups = "subtitle")
    )

  gt_tbl <-
    tab_options(
      gt_tbl,
      table.border.top.style = "hidden",
      column_labels.border.bottom.style = "hidden"
    )

  gt_tbl <-
    tab_header(
      gt_tbl,
      title = "Date Formatting Options",
      subtitle = md(
        "Usable in the `fmt_date()` and `fmt_datetime()` functions.<br><br>"
      )
    )

  gt_tbl <- opt_align_table_header(gt_tbl, align = "left")

  gt_tbl <- opt_table_lines(gt_tbl, extent = "none")

  gt_tbl <- opt_horizontal_padding(gt_tbl, scale = 2)

  gt_tbl <- opt_vertical_padding(gt_tbl, scale = 0.7)

  gt_tbl
}

# info_time_style() ------------------------------------------------------------
#' View a table with info on time styles
#'
#' @description
#'
#' [fmt_time()] lets us format time-based values in a convenient manner using
#' preset styles. The table generated by `info_time_style()` provides a quick
#' reference to all styles, with associated format names and example outputs
#' using a fixed time (`14:35`).
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for displaying formatted
#'   time values according to the locale's rules. Examples include `"en"` for
#'   English (United States) and `"fr"` for French (France). We can call
#'   [info_locales()] for a useful reference for all of the locales that are
#'   supported.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Get a table of info on the different time-formatting styles (which are used
#' by supplying a number code to `fmt_time()`).
#'
#' ```r
#' info_time_style()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_info_time_style_1.png")`
#' }}
#'
#' @family information functions
#' @section Function ID:
#' 11-2
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
info_time_style <- function(locale = NULL) {

  if (is.null(locale)) {
    locale <- "en"
  }

  time_df <- time_formats()

  time_df$time <- "14:35"

  flexible_rows <- time_df[, "flexible"][["flexible"]]

  time_df$flexible[flexible_rows] <- "FLEXIBLE"
  time_df$flexible[!flexible_rows] <- ""

  gt_tbl <- gt(time_df, rowname_col = "format_number", locale = locale)

  gt_tbl <- cols_hide(gt_tbl, columns = format_code)

  gt_tbl <-
    fmt_time(
      gt_tbl,
      columns = time,
      time_style = from_column(column = "format_name")
    )

  gt_tbl <-
    text_transform(
      gt_tbl,
      locations = cells_body(
        columns = flexible,
        rows = flexible == "FLEXIBLE"
      ),
      fn = function(x) {
        paste0(
          "<span style='",
          "color: darkslategray; font-weight: 700; font-size: 12px; ",
          "border: solid 1px; background: aliceblue; border-color: steelblue; ",
          "border-width: 2px; border-radius: 4px; padding: 0px 8px 0px 8px;",
          "'>", x, "</span>"
        )
      }
    )

  gt_tbl <-
    cols_label(
      gt_tbl,
      format_name = "Format Name",
      time_type = "12/24h",
      flexible = "",
      time = html(
        paste0(
          "Formatted Time (<span style=\"text-transform:none;\">",
          locale,
          "</span>)"
        )
      )
    )

  gt_tbl <-
    cols_width(
      gt_tbl,
      format_number ~ px(60),
      format_name ~ px(140),
      time_type ~ px(80),
      flexible ~ px(100),
      time ~ px(315)
    )

  gt_tbl <- opt_align_table_header(gt_tbl, align = "left")

  gt_tbl <- sub_missing(gt_tbl, columns = time_type)

  gt_tbl <-
    cols_align(
      gt_tbl,
      align = "center",
      columns = c(time_type, flexible)
    )

  gt_tbl <- cols_align(gt_tbl, align = "left", columns = time)

  gt_tbl <- tab_style(
    gt_tbl,
    style = cell_text(size = "smaller"),
    locations = cells_body(columns = time_type)
  )

  gt_tbl <-
    tab_style(
      gt_tbl,
      style = cell_text(
        font = system_fonts(name = "monospace-code"),
        size = px(12)
      ),
      locations = cells_body(columns = format_name)
    )

  gt_tbl <-
    tab_style(
      gt_tbl,
      style =
        cell_borders(
          sides = "r",
          color = "lightblue",
          weight = px(1.5)
        ),
      locations = cells_body(columns = format_name)
    )

  gt_tbl <- opt_all_caps(gt_tbl)

  gt_tbl <- opt_stylize(gt_tbl, style = 6)

  gt_tbl <-
    tab_style(
      gt_tbl,
      style = cell_text(size = px(24)),
      locations = cells_title(groups = "title")
    )

  gt_tbl <-
    tab_style(
      gt_tbl,
      style = cell_text(size = px(18)),
      locations = cells_title(groups = "subtitle")
    )

  gt_tbl <-
    tab_options(
      gt_tbl,
      table.border.top.style = "hidden",
      column_labels.border.bottom.style = "hidden"
    )

  gt_tbl <-
    tab_header(
      gt_tbl,
      title = "Time Formatting Options",
      subtitle = md(
        "Usable in the `fmt_time()` and `fmt_datetime()` functions.<br><br>"
      )
    )

  gt_tbl <- opt_align_table_header(gt_tbl, align = "left")

  gt_tbl <- opt_table_lines(gt_tbl, extent = "none")

  gt_tbl <- opt_horizontal_padding(gt_tbl, scale = 2)

  gt_tbl <- opt_vertical_padding(gt_tbl, scale = 0.7)

  gt_tbl
}

# info_currencies() ------------------------------------------------------------
#' View a table with info on supported currencies
#'
#' @description
#'
#' [fmt_currency()] lets us format numeric values as currencies. The table
#' generated by `info_currencies()` provides a quick reference to all the
#' available currencies. The currency identifiers are provided (name, 3-letter
#' currency code, and 3-digit currency code) along with the each currency's
#' exponent value (number of digits of the currency subunits). A formatted
#' example is provided (based on the value of `49.95`) to demonstrate the
#' default formatting of each currency.
#'
#' @details
#'
#' There are 172 currencies, which can lead to a verbose display table. To make
#' this presentation more focused on retrieval, we can provide an initial letter
#' corresponding to the 3-letter currency code to `begins_with`. This will
#' filter currencies in the info table to just the set beginning with the
#' supplied letter.
#'
#' @param type *Type of currency*
#'
#'   `singl-kw:[code|symbol]` // *default:* `"code"`
#'
#'   The type of currency information provided. Can either be `"code"` where
#'   currency information corresponding to 3-letter/3-number currency codes is
#'   provided, or `"symbol"` where currency info for common currency
#'   names/symbols (e.g., dollar, pound, yen, etc.) is returned.
#'
#' @param begins_with *Show currencies beginning with a specific letter*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   Providing a single letter will filter currencies to only those that begin
#'   with that letter in their currency code. The default (`NULL`) will produce
#'   a table with all currencies displayed. This option only constrains the
#'   information table where `type == "code"`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Get a table of info on all of the currencies where the three-letter code
#' begins with an `"h"`.
#'
#' ```r
#' info_currencies(begins_with = "h")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_info_currencies_1.png")`
#' }}
#'
#' Get a table of info on all of the common currency name/symbols that can be
#' used with [fmt_currency()].
#'
#' ```r
#' info_currencies(type = "symbol")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_info_currencies_2.png")`
#' }}
#'
#' @family information functions
#' @section Function ID:
#' 11-3
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
info_currencies <- function(
    type = c("code", "symbol"),
    begins_with = NULL
) {

  # Get the correct `type` value
  type <- rlang::arg_match0(type, values = c("code", "symbol"))

  if (type == "code") {

    if (!is.null(begins_with)) {

      starting <- toupper(substr(begins_with, 1, 1))

      curr <-
        dplyr::filter(currencies, grepl(paste0("^", starting, ".*"), curr_code))

    } else {
      curr <- currencies
    }

    curr_df <- curr[, c(4, 1, 2, 3)]
    curr_df$value <- 49.95

    gt_tbl <- gt(curr_df, id = "currencies")

    gt_tbl <-
      fmt_currency(
        gt_tbl,
        columns = "value",
        currency = from_column(column = "curr_code")
      )

    gt_tbl <-
      cols_label(
        gt_tbl,
        curr_name = md("Currency<br>Name"),
        curr_code = md("Alpha<br>Code"),
        curr_number = md("Numeric<br>Code"),
        exponent = md("No. of<br>Subunits"),
        value = md("Formatted<br>Currency"),
      )

    gt_tbl <-
      cols_width(
        gt_tbl,
        curr_name ~ px(325),
        curr_code ~ px(75),
        curr_number ~ px(85),
        exponent ~ px(85),
        value ~ px(125)
      )

    gt_tbl <-
      tab_style(
        gt_tbl,
        style = cell_text(
          font = system_fonts(name = "monospace-code"),
          size = px(12)
        ),
        locations = cells_body(columns = c(curr_code, curr_number))
      )

    gt_tbl <-
      tab_header(
        gt_tbl,
        title = md("Currencies Supported in **gt**"),
        subtitle = md(
          "Currency codes are used in the `fmt_currency()` function<br><br>"
        )
      )

    gt_tbl <- opt_all_caps(gt_tbl)

    gt_tbl <- opt_stylize(gt_tbl, style = 6)

    gt_tbl <-
      tab_style(
        gt_tbl,
        style = cell_text(size = px(24)),
        locations = cells_title(groups = "title")
      )

    gt_tbl <-
      tab_style(
        gt_tbl,
        style = cell_text(size = px(18)),
        locations = cells_title(groups = "subtitle")
      )

    gt_tbl <- opt_align_table_header(gt_tbl, align = "left")

    gt_tbl <- opt_table_lines(gt_tbl, extent = "none")

    gt_tbl <- opt_horizontal_padding(gt_tbl, scale = 2)

    gt_tbl <- opt_vertical_padding(gt_tbl, scale = 0.8)

    gt_tbl <-
      tab_options(
        gt_tbl,
        table.border.top.style = "hidden",
        column_labels.border.bottom.style = "hidden",
        container.height = px(620)
      )

    gt_tbl <-
      tab_style(
        gt_tbl,
        style = css(position = "sticky", top = "-1em", `z-index` = 10),
        locations = cells_column_labels()
      )

  } else {

    curr_df <- currency_symbols
    curr_df$symbol <- NULL
    curr_df$value <- 49.95

    gt_tbl <- gt(curr_df, id = "currency_symbols")

    gt_tbl <-
      fmt_currency(
        gt_tbl,
        columns = "value",
        currency = from_column(column = "curr_symbol")
      )

    gt_tbl <-
      cols_label(
        gt_tbl,
        curr_symbol = "Currency Symbol Keyword",
        value = "Formatted Currency"
      )

    gt_tbl <-
      cols_width(
        gt_tbl,
        curr_symbol ~ px(300),
        value ~ px(300)
      )

    gt_tbl <-
      tab_style(
        gt_tbl,
        style = list(
          cell_text(
            font = system_fonts(name = "monospace-code"),
            size = px(12)
          ),
          cell_borders(
            sides = "r",
            color = "lightblue",
            weight = px(1.5))
        ),
        locations = cells_body(columns = curr_symbol)
      )

    gt_tbl <- opt_all_caps(gt_tbl)

    gt_tbl <- opt_stylize(gt_tbl, style = 6)

    gt_tbl <-
      tab_style(
        gt_tbl,
        style = cell_text(size = px(24)),
        locations = cells_title(groups = "title")
      )

    gt_tbl <-
      tab_style(
        gt_tbl,
        style = cell_text(size = px(18)),
        locations = cells_title(groups = "subtitle")
      )

    gt_tbl <-
      tab_options(
        gt_tbl,
        table.border.top.style = "hidden",
        column_labels.border.bottom.style = "hidden"
      )

    gt_tbl <-
      tab_header(
        gt_tbl,
        title = md("Currencies Supported in **gt**"),
        subtitle = md(
          "Currency symbols are used in the `fmt_currency()` function.<br><br>"
        )
      )

    gt_tbl <- opt_align_table_header(gt_tbl, align = "left")

    gt_tbl <- opt_table_lines(gt_tbl, extent = "none")

    gt_tbl <- opt_horizontal_padding(gt_tbl, scale = 2)

    gt_tbl <- opt_vertical_padding(gt_tbl, scale = 0.7)
  }

  gt_tbl
}

# info_locales() ------------------------------------------------------------
#' View a table with info on supported locales
#'
#' @description
#'
#' Many of the `fmt_*()` functions have a `locale` argument that makes
#' locale-based formatting easier. The table generated by the `info_locales()`
#' function provides a quick reference to all the available locales. The locale
#' identifiers are provided (base locale ID, common display name) along with the
#' each locale's group and decimal separator marks. A formatted numeric example
#' is provided (based on the value of `11027`) to demonstrate the default
#' formatting of each locale.
#'
#' @details
#'
#' There are `r nrow(locales)` locales, which means that a very long display
#' table is provided by default. To trim down the output table size, we can
#' provide an initial letter corresponding to the base locale ID to
#' `begins_with`. This will filter locales in the info table to just the set
#' that begins with the supplied letter.
#'
#' @param begins_with *Show locales beginning with a specific letter*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   Providing a single letter will filter locales to only those that begin
#'   with that letter in their locale ID. The default (`NULL`) will produce
#'   a table with all locales displayed
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Get a table of info on all of the locales supported by **gt**.
#'
#' ```r
#' info_locales()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_info_locales_1.png")`
#' }}
#'
#' @family information functions
#' @section Function ID:
#' 11-4
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
info_locales <- function(begins_with = NULL) {

  locale <- lang_desc <- script_desc <- territory_desc <- NULL
  variant_desc <- group <- decimal <- NULL

  if (!is.null(begins_with)) {

    starting <- tolower(substr(begins_with, 1, 1))
    regex_starting <- paste0("^", starting, ".*")
    loc <- vctrs::vec_slice(locales, grepl(regex_starting, locales$locale))

  } else {
    loc <- locales
  }

  tab_1 <-
    dplyr::select(
      loc, "locale", "lang_desc", "script_desc",
      "territory_desc", "variant_desc", "group", "decimal"
    )

  tab_1$display_name <- paste0(
    tab_1$lang_desc,
    paste0(
      " (",
      tab_1$territory_desc, ", ",
      tab_1$script_desc, ", ",
      tab_1$variant_desc,
      ")"
    )
  )

  tab_1$group <-
    dplyr::case_match(
      tab_1$group,
      c("\u00a0", "\u202f") ~ "space",
      .default = tab_1$group
    )

  tab_1 <- tab_1[c("locale", "display_name", "group", "decimal")]
  tab_1$display_name <- gsub(" (NA, NA, NA)", "", tab_1$display_name, fixed = TRUE)
  tab_1$display_name <- gsub(", NA, NA", "", tab_1$display_name, fixed = TRUE)
  tab_1$display_name <- gsub("NA, ", "", tab_1$display_name, fixed = TRUE)
  tab_1$display_name <- gsub(", NA)", ")", tab_1$display_name, fixed = TRUE)
  tab_1$value <- 11027

  gt(tab_1) %>%
    tab_header(
      title = md("Locales Supported in **gt**"),
      subtitle = md("Locale codes are used in several `fmt_*()` functions.<br><br>")
    ) %>%
    fmt_number(
      columns = "value",
      locale = from_column("locale")
    ) %>%
    text_transform(
      fn = function(x) sub("space", "\U02420", x, fixed = TRUE),
      locations = cells_body(columns = "group")
    ) %>%
    cols_merge(
      columns = c("locale", "display_name"),
      pattern = "<code>{1}</code><br><span style=font-size:11px>{2}</span>"
    ) %>%
    cols_label(
      locale = "Locale",
      group = "Group",
      decimal = "Decimal",
      value = html("Formatted<br>Value")
    ) %>%
    cols_align(
      align = "center",
      columns = c("group", "decimal")
    ) %>%
    tab_style(
      style = css(position = "sticky", top = "-1em", `z-index` = 10),
      locations = cells_column_labels()
    ) %>%
    tab_style(
      style = cell_text(size = px(24)),
      locations = cells_title(groups = "title")
    ) %>%
    tab_style(
      style = cell_text(size = px(18)),
      locations = cells_title(groups = "subtitle")
    ) %>%
    tab_style(
      style = cell_text(size = px(32)),
      locations = cells_body(columns = c(group, decimal))
    ) %>%
    opt_all_caps() %>%
    opt_stylize(style = 6) %>%
    opt_align_table_header(align = "left") %>%
    opt_table_lines(extent = "none") %>%
    opt_horizontal_padding(scale = 2) %>%
    opt_css(
      css = "
      #unit_conversion .gt_group_heading {
        padding-top: 18px;
        padding-bottom: 4px;
        padding-left: 10px;
        text-decoration: underline;
        text-underline-offset: 2px;
      }"
    ) %>%
    tab_options(
      table.border.top.style = "hidden",
      column_labels.border.bottom.style = "hidden",
      container.height = px(620),
      data_row.padding = "5px",
      table.width = px(600)
    )
}

# info_paletteer() -------------------------------------------------------------
#' View a table with info on color palettes
#'
#' @description
#'
#' While [data_color()] allows us to flexibly color data cells in our **gt**
#' table, the harder part of this process is discovering and choosing color
#' palettes that are suitable for the table output. We can make this process
#' much easier in two ways: (1) by using the **paletteer** package, which makes
#' a wide range of palettes from various R packages readily available, and (2)
#' calling `info_paletteer()` to give us an information table that serves as a
#' quick reference for all of the discrete color palettes available in
#' **paletteer**.
#'
#' @details
#'
#' The palettes displayed are organized by package and by palette name. These
#' values are required when obtaining a palette (as a vector of hexadecimal
#' colors), from `paletteer::paletteer_d()`. Once we are familiar with the names
#' of the color palette packages (e.g., **RColorBrewer**, **ggthemes**,
#' **wesanderson**), we can narrow down the content of this information table by
#' supplying a vector of such package names to `color_pkgs`.
#'
#' Colors from the following color packages (all supported by **paletteer**)
#' are shown by default with `info_paletteer()`:
#' \itemize{
#' \item **awtools**, 5 palettes
#' \item **dichromat**, 17 palettes
#' \item **dutchmasters**, 6 palettes
#' \item **ggpomological**, 2 palettes
#' \item **ggsci**, 42 palettes
#' \item **ggthemes**, 31 palettes
#' \item **ghibli**, 27 palettes
#' \item **grDevices**, 1 palette
#' \item **jcolors**, 13 palettes
#' \item **LaCroixColoR**, 21 palettes
#' \item **NineteenEightyR**, 12 palettes
#' \item **nord**, 16 palettes
#' \item **ochRe**, 16 palettes
#' \item **palettetown**, 389 palettes
#' \item **pals**, 8 palettes
#' \item **Polychrome**, 7 palettes
#' \item **quickpalette**, 17 palettes
#' \item **rcartocolor**, 34 palettes
#' \item **RColorBrewer**, 35 palettes
#' \item **Redmonder**, 41 palettes
#' \item **wesanderson**, 19 palettes
#' \item **yarrr**, 21 palettes
#' }
#'
#' @param color_pkgs *Filter to specific color packages*
#'
#'   `vector<character>` // *default:* `NULL` (`optional`)
#'
#'   A vector of color packages that determines which sets of palettes should be
#'   displayed in the information table. If this is `NULL` (the default) then
#'   all of the discrete palettes from all of the color packages represented in
#'   **paletteer** will be displayed.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Get a table of info on just the `"ggthemes"` color palette (easily accessible
#' from the **paletteer** package).
#'
#' ```r
#' info_paletteer(color_pkgs = "ggthemes")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_info_paletteer_1.png")`
#' }}
#'
#' @family information functions
#' @section Function ID:
#' 11-5
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
info_paletteer <- function(color_pkgs = NULL) {

  if (is.null(color_pkgs)) {
    return(readRDS(system_file("gt_tables/info_paletteer.rds")))
  }

  palettes_strips_df <-
    dplyr::filter(palettes_strips, package %in% color_pkgs)

  palettes_strips <- palettes_strips_df$colors

  palettes_strips_df %>%
    dplyr::select("package", "palette", "length") %>%
    dplyr::mutate(`Color Count and Palette` = NA) %>%
    gt(groupname_col = "package", rowname_col = "palette") %>%
    text_transform(
      locations = cells_body("Color Count and Palette"),
      fn = function(x) {
        palettes_strips
      }
    ) %>%
    cols_label(length = "") %>%
    tab_stubhead(label = "Package and Palette Name") %>%
    tab_header(
      title = md("Palettes Made Easily Available with **paletteer**"),
      subtitle = md("Palettes like these are useful with the `data_color()` function")
    ) %>%
    tab_style(
      style = cell_text(align = "left"),
      locations = list(
        cells_title(groups = "title"),
        cells_title(groups = "subtitle")
      )
    ) %>%
    tab_style(
      style = list(
        cell_fill(color = "#E3E3E3"),
        cell_text(font = "Courier", size = "smaller", weight = "bold")
      ),
      locations = cells_stub(rows = TRUE)
    ) %>%
    tab_style(
      style = cell_text(font = "Courier"),
      locations = cells_body(columns = "length")
    ) %>%
    tab_options(
      row_group.background.color = "#FFFFF0",
      column_labels.background.color = "#666660",
      row_group.font.weight = "600",
      row_group.font.size = "smaller"
    ) %>%
    tab_source_note(
      source_note = md(
        paste0(
          "The **paletteer** package is maintained by Emil Hvitfeldt. More ",
          "information can be found on [the **paletteer** site]",
          "(https://emilhvitfeldt.github.io/paletteer/) and on the ",
          "[**CRAN** info page]",
          "(https://cran.r-project.org/web/packages/paletteer/index.html)."
        )
      )
    )
}

# info_google_fonts() ----------------------------------------------------------
#' View a table on recommended Google Fonts
#'
#' @description
#'
#' The [google_font()] helper function can be used wherever a font name should
#' be specified. There are two instances where this helper can be used: the
#' `name` argument in [opt_table_font()] (for setting a table font) and in that
#' of [cell_text()] (used with [tab_style()]). Because there is an overwhelming
#' number of fonts available in the *Google Fonts* catalog, the
#' `info_google_fonts()` provides a table with a set of helpful font
#' recommendations. These fonts look great in the different parts of a **gt**
#' table. Why? For the most part they are suitable for body text, having large
#' counters, large x-height, reasonably low contrast, and open apertures. These
#' font features all make for high legibility at smaller sizes.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Get a table of info on some of the recommended *Google Fonts* for tables.
#'
#' ```r
#' info_google_fonts()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_info_google_fonts_1.png")`
#' }}
#'
#' @family information functions
#' @section Function ID:
#' 11-6
#'
#' @section Function Introduced:
#' `v0.2.2` (August 5, 2020)
#'
#' @export
info_google_fonts <- function() {
  readRDS(system_file("gt_tables/info_google_fonts.rds"))
}

# info_flags() -----------------------------------------------------------------
#' View a table with all available flags for `fmt_flag()`
#'
#' @description
#'
#' [fmt_flag()] can be used to render flag icons within body cells that have
#' 2-letter country codes. There are a lot of countries, so, calling
#' `info_flags()` can be helpful in showing all of the valid and supported
#' country codes along with their flag icons.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Get a table of info on all the available flag icons.
#'
#' ```r
#' info_flags()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_info_flags_1.png")`
#' }}
#'
#' @family information functions
#' @section Function ID:
#' 11-7
#'
#' @section Function Introduced:
#' `v0.10.0` (October 7, 2023)
#'
#' @export
info_flags <- function() {
  readRDS(system_file("gt_tables/info_flags.rds"))
}

# info_icons() -----------------------------------------------------------------
#' View a table with all available Font Awesome icons for `fmt_icon()`
#'
#' @description
#'
#' [fmt_icon()] can be used to render *Font Awesome* icons within
#' body cells that reference the icon names. Further to this, the text
#' transformation functions (e.g., [text_case_match()]) allow for the insertion
#' of these icons as replacement text (so long as you use the `fa()` function
#' from the **fontawesome** package). Because there is a very large number of
#' icons available to use in *Font Awesome*, `info_icons()` can be used to
#' provide us with a table that lists all the icons along with their short and
#' full names (either can be used with [fmt_icon()]). It also contains
#' acceptable codes for [fmt_country()]
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Get a table of info on all the available *Font Awesome* icons.
#'
#' ```r
#' info_icons()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_info_icons_1.png")`
#' }}
#'
#' @family information functions
#' @section Function ID:
#' 11-8
#'
#' @section Function Introduced:
#' `v0.10.0` (October 7, 2023)
#'
#' @export
info_icons <- function() {
  readRDS(system_file("gt_tables/info_icons.rds"))
}

# info_unit_conversions() ------------------------------------------------------
#' View a table with all units that can be converted by `unit_conversion()`
#'
#' @description
#'
#' [unit_conversion()] can be used to yield conversion factors across compatible
#' pairs of units. This is useful for expressing values in different units and
#' the conversion can be performed via the `scale_by` argument available in
#' several formatting functions. When calling [unit_conversion()], one must
#' supply two string-based keywords to specify the value's current units and the
#' desired units. All of these keywords are provided in the table shown by
#' calling `info_unit_conversions()`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Get a table of info on all the available keywords for unit conversions.
#'
#' ```r
#' info_unit_conversions()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_info_unit_conversions_1.png")`
#' }}
#'
#' @family information functions
#' @section Function ID:
#' 11-9
#'
#' @section Function Introduced:
#' `v0.11.0` (July 9, 2024)
#'
#' @export
info_unit_conversions <- function() {
  readRDS(system_file("gt_tables/info_conversions.rds"))
}
