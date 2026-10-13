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
#  Copyright (c) 2018-2026 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


# md() -------------------------------------------------------------------------
#' Interpret input text as Markdown-formatted text
#'
#' @description
#'
#' Markdown text can be used in certain places in a **gt** table, and this is
#' wherever new text is defined (e.g., footnotes, source notes, the table title,
#' etc.). Using Markdown is advantageous for styling text since it will be
#' rendered correctly to the output format of the **gt** table. There is
#' also the [html()] helper that allows you use HTML exclusively (for tables
#' expressly meant for HTML output) but `md()` allows for both; you get to use
#' Markdown plus any HTML fragments at the same time.
#'
#' @param text *Markdown text*
#'
#'   `scalar<character>` // **required**
#'
#'   The text that is understood to contain Markdown formatting.
#'
#' @return A character object of class `from_markdown`. It's tagged as being
#'   Markdown text and it will undergo conversion to the desired output context.
#'
#' @section Examples:
#'
#' Use the [`exibble`] dataset to create a **gt** table. When adding a title
#' through [tab_header()], we'll use the `md()` helper to signify to **gt** that
#' we're using Markdown formatting.
#'
#' ```r
#' exibble |>
#'   dplyr::select(currency, char) |>
#'   gt() |>
#'   tab_header(title = md("Using *Markdown*"))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_md_1.png")`
#' }}
#'
#' @family helper functions
#' @section Function ID:
#' 8-1
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
md <- function(text) {
  # Apply the `from_markdown` class
  class(text) <- "from_markdown"
  text
}

# html() -----------------------------------------------------------------------
#' Interpret input text as HTML-formatted text
#'
#' @description
#'
#' For certain pieces of text (like in column labels or table headings) we may
#' want to express them as raw HTML. In fact, with HTML, anything goes so it can
#' be much more than just text. The `html()` function will guard the input HTML
#' against escaping, so, your HTML tags will come through as HTML when
#' rendered... to HTML.
#'
#' @param text *HTML text*
#'
#'   `scalar<character>` // **required**
#'
#'   The text that is understood to be HTML text, which is to be preserved in
#'   the HTML output context.
#'
#' @param ... *Optional parameters for `htmltools::HTML()`*
#'
#'   `<multiple expressions>` // (`optional`)
#'
#'   The `htmltools::HTML()` function contains `...` and anything provided here
#'   will be passed to that internal function call.
#'
#' @return A character object of class `html`. It's tagged as an HTML fragment
#'   that is not to be sanitized.
#'
#' @section Examples:
#'
#' Use the [`exibble`] dataset to create a **gt** table. When adding a title
#' through [tab_header()], we'll use the `html()` helper to signify to **gt**
#' that we're using HTML formatting.
#'
#' ```r
#' exibble |>
#'   dplyr::select(currency, char) |>
#'   gt() |>
#'   tab_header(title = html("<em>HTML</em>"))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_html_1.png")`
#' }}
#'
#' @family helper functions
#' @section Function ID:
#' 8-2
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
html <- function(text, ...) {

  if (inherits(text, "shiny.tag.list")) {
    text <- as.character(text)
  }

  htmltools::HTML(text, ...)
}

# latex() -----------------------------------------------------------------------
#' Interpret input text as LaTeX-formatted text
#'
#' @description
#'
#' For certain pieces of text (like in column labels or table headings) we may
#' want to express them as raw LaTeX. In fact, with LaTeX, so much more can be done for formatting.
#' The `latex()` function will guard the input LaTeX from being escaped.
#'
#' @param text *LaTeX text*
#'
#'   `scalar<character>` // **required**
#'
#'   The text that is understood to be LaTeX text, which is to be preserved in
#'   the LaTeX output context.
#'
#'
#' @return A character object of class `latex`. It's tagged as an latex fragment
#'   that is not to be sanitized.
#'
#' @section Examples:
#'
#' Use the [`exibble`] dataset to create a **gt** table. When adding a title
#' through [tab_header()], we'll use the `latex()` helper to signify to **gt**
#' that we're using LaTeX formatting.
#'
#' ```r
#' exibble |>
#'   dplyr::select(currency, char) |>
#'   gt() |>
#'   tab_header(title = latex("\\emph{LaTeX}"))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_latex_1.png")`
#' }}
#'
#' @family helper functions
#' @section Function ID:
#' 8-2
#'
#' @section Function Introduced:
#' `v1.0.1` (May 10, 2025)
#'
#' @export
latex <- function(text) {

  # Apply the `from_latex` class
  class(text) <- "from_latex"
  text
}

# px() -------------------------------------------------------------------------
#' Helper for providing a numeric value as pixels value
#'
#' @description
#'
#' For certain parameters, a length value is required. Examples include the
#' setting of font sizes (e.g., in [cell_text()]) and thicknesses of lines
#' (e.g., in [cell_borders()]). Setting a length in pixels with `px()` allows
#' for an absolute definition of size as opposed to the analogous helper
#' function [pct()].
#'
#' @param x *Numeric length in pixels*
#'
#'   `scalar<numeric|integer>` // **required**
#'
#'   The numeric value to format as a string (e.g., `"12px"`) for some
#'   [tab_options()] arguments that can take values as units of pixels (e.g.,
#'   `table.font.size`).
#'
#' @return A character vector with a single value in pixel units.
#'
#' @section Examples:
#'
#' Use the [`exibble`] dataset to create a **gt** table. Inside of the
#' [cell_text()] call (which is itself inside of [tab_style()]), we'll use the
#' `px()` helper function to define the font size for the column labels in units
#' of pixels.
#'
#' ```r
#' exibble |>
#'   gt() |>
#'   tab_style(
#'     style = cell_text(size = px(20)),
#'     locations = cells_column_labels()
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_px_1.png")`
#' }}
#'
#' @family helper functions
#' @section Function ID:
#' 8-3
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
px <- function(x) {

  if (mode(x) != "numeric") {
    cli::cli_abort("The supplied value must be numeric.")
  }

  paste0(x, "px")
}

# pct() ------------------------------------------------------------------------
#' Helper for providing a numeric value as percentage
#'
#' @description
#'
#' A percentage value acts as a length value that is relative to an initial
#' state. For instance an 80 percent value for something will size the target
#' to 80 percent the size of its 'previous' value. This type of sizing is
#' useful for sizing up or down a length value with an intuitive measure. This
#' helper function can be used for the setting of font sizes (e.g., in
#' [cell_text()]) and altering the thicknesses of lines (e.g., in
#' [cell_borders()]). Should a more exact definition of size be required, the
#' analogous helper function [pct()] will be more useful.
#'
#' @param x *Numeric value in percent*
#'
#'   `scalar<numeric|integer>` // **required**
#'
#'   The numeric value to format as a string percentage for some [tab_options()]
#'   arguments that can take percentage values (e.g., `table.width`).
#'
#' @return A character vector with a single value in percentage units.
#'
#' @section Examples:
#'
#' Use the [`exibble`] dataset to create a **gt** table. Inside of the
#' [cell_text()] call (which is itself inside of [tab_style()]), we'll use the
#' `pct()` helper function to define the font size for the column labels as a
#' percentage value.
#'
#' ```r
#' exibble |>
#'   gt() |>
#'   tab_style(
#'     style = cell_text(size = pct(75)),
#'     locations = cells_column_labels()
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_pct_1.png")`
#' }}
#'
#' @family helper functions
#' @section Function ID:
#' 8-4
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
pct <- function(x) {

  if (mode(x) != "numeric") {
    cli::cli_abort("The supplied value must be numeric.")
  }

  paste0(x, "%")
}

# from_column() ----------------------------------------------------------------
#' Reference a column of values for certain parameters
#'
#' @description
#'
#' It can be useful to obtain parameter values from a column in a
#' **gt** for functions that operate on the table body and stub cells. For
#' example, you might want to indent row labels in the stub. You could call
#' [tab_stub_indent()] and indent different rows to various indentation levels.
#' However, each level of indentation applied necessitates a new call of that
#' function. To make this better, we can use indentation values available in a
#' table column via the `from_column()` helper function. For the
#' [tab_stub_indent()] case, you'd invoke this helper at the `indent` argument
#' and specify the column that has the values.
#'
#' @param column *Column name*
#'
#'   `scalar<character>` // **required**
#'
#'   A single column name in quotation marks. Values will be extracted from this
#'   column and provided to compatible arguments.
#'
#' @param na_value *Default replacement for `NA` values*
#'
#'   `scalar<character|numeric|logical>` // *default:* `NULL` (`optional`)
#'
#'   A single value to replace any `NA` values in the `column`. Take care to
#'   provide a value that is of the same type as the `column` values to avoid
#'   any undesirable coercion.
#'
#' @param fn *Function to apply*
#'
#'   `function|formula` // *default:* `NULL` (`optional`)
#'
#'   If a function is provided here, any values extracted from the table
#'   `column` (except `NA` values) can be mutated.
#'
#' @return A list object of class `gt_column`.
#'
#' @section Functions that allow the use of the `from_column()` helper:
#'
#' Only certain functions (and furthermore a subset of arguments within each)
#' support the use of `from_column()` for accessing varying parameter values.
#' These functions are:
#'
#' - [tab_stub_indent()]
#' - [fmt_number()]
#' - [fmt_integer()]
#' - [fmt_scientific()]
#' - [fmt_engineering()]
#' - [fmt_percent()]
#' - [fmt_partsper()]
#' - [fmt_fraction()]
#' - [fmt_currency()]
#' - [fmt_roman()]
#' - [fmt_index()]
#' - [fmt_spelled_num()]
#' - [fmt_bytes()]
#' - [fmt_date()]
#' - [fmt_time()]
#' - [fmt_datetime()]
#' - [fmt_url()]
#' - [fmt_image()]
#' - [fmt_flag()]
#' - [fmt_markdown()]
#' - [fmt_passthrough()]
#'
#' Within help documents for each of these functions you'll find the
#' *Compatibility of arguments with the `from_column()` helper function* section
#' and sections like these describe which arguments support the use of
#' `from_column()`.
#'
#' @section Examples:
#'
#' `from_column()` can be used in a variety of formatting functions so that
#' values for common options don't have to be static, they can change in every
#' row (so long as you have a column of compatible option values). Here's an
#' example where we have a table of repeating numeric values along with a column
#' of currency codes. We can format the numbers to currencies with
#' [fmt_currency()] and use `from_column()` to reference the column of currency
#' codes, giving us values that are each formatted as having a different
#' currency.
#'
#' ```r
#' dplyr::tibble(
#'   amount = rep(30.75, 6),
#'   curr = c("USD", "EUR", "GBP", "CAD", "AUD", "JPY"),
#' ) |>
#'   gt() |>
#'   fmt_currency(currency = from_column(column = "curr"))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_from_column_1.png")`
#' }}
#'
#' Let's summarize the [`gtcars`] dataset to get a set of rankings of car
#' manufacturer by country of origin. The `n` column represents the number of
#' cars a manufacturer has within this dataset and we can use that column as a
#' way to size the text. We do that in the [tab_style()] call; the
#' `from_column()` function is used within the [cell_text()] statement to
#' fashion different font sizes from that `n` column. This is done in
#' conjunction with the `fn` argument of `from_column()`, which helps to tweak
#' the values in `n` to get a useful range of font sizes.
#'
#' ```r
#' gtcars |>
#'   dplyr::count(mfr, ctry_origin) |>
#'   dplyr::arrange(ctry_origin) |>
#'   gt(groupname_col = "ctry_origin") |>
#'   tab_style(
#'     style = cell_text(
#'       size = from_column(
#'         column = "n",
#'         fn = function(x) paste0(5 + (x * 3), "px")
#'       )
#'     ),
#'     locations = cells_body()
#'   ) |>
#'   tab_style(
#'     style = cell_text(align = "center"),
#'     locations = cells_row_groups()
#'   ) |>
#'   cols_hide(columns = n) |>
#'   tab_options(column_labels.hidden = TRUE) |>
#'   opt_all_caps() |>
#'   opt_vertical_padding(scale = 0.25) |>
#'   cols_align(align = "center", columns = mfr)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_from_column_2.png")`
#' }}
#'
#' @family helper functions
#' @section Function ID:
#' 8-5
#'
#' @section Function Introduced:
#' `v0.10.0` (October 7, 2023)
#'
#' @export
from_column <- function(
    column,
    na_value = NULL,
    fn = NULL
) {

  column_list <-
    list(
      column = column,
      na_value = na_value[1],
      fn = fn
    )

  # Set the `gt_currency` class
  class(column_list) <- "gt_column"

  column_list
}

# currency() -------------------------------------------------------------------
#' Supply a custom currency symbol to `fmt_currency()`
#'
#' @description
#'
#' The `currency()` helper function makes it easy to specify a context-aware
#' currency symbol to `currency` argument of [fmt_currency()]. Since **gt** can
#' render tables to several output formats, `currency()` allows for different
#' variations of the custom symbol based on the output context (which are
#' `html`, `latex`, `rtf`, and `default`). The number of decimal places for
#' the custom currency defaults to `2`, however, a value set for the `decimals`
#' argument of [fmt_currency()] will take precedence.
#'
#' @details
#'
#' We can use any combination of `html`, `latex`, `rtf`, and `default` as named
#' arguments for the currency text in each of the namesake contexts. The
#' `default` value is used as a fallback when there doesn't exist a dedicated
#' currency text value for a particular output context (e.g., when a table is
#' rendered as HTML and we use `currency(latex = "LTC", default = "ltc")`, the
#' currency symbol will be `"ltc"`. For convenience, if we provide only a single
#' string without a name, it will be taken as the `default` (i.e.,
#' `currency("ltc")` is equivalent to `currency(default = "ltc")`). However, if
#' we were to specify currency strings for multiple output contexts, names are
#' required each and every context.
#'
#' @param ... *Currency symbols by output context*
#'
#'   `<named arguments>` // **required** (or, use `.list`)
#'
#'   One or more named arguments using output contexts as the names and
#'   currency symbol text as the values.
#'
#' @param .list *Alternative to `...`*
#'
#'   `<list of multiple expressions>` // **required** (or, use `...`)
#'
#'   Allows for the use of a list as an input alternative to `...`.
#'
#' @return A list object of class `gt_currency`.
#'
#' @section Examples:
#'
#' Use the [`exibble`] dataset to create a **gt** table. Within the
#' [fmt_currency()] call, we'll format the `currency` column to have currency
#' values in guilder (a defunct Dutch currency). We can register this custom
#' currency with the `currency()` helper function, supplying the `"&fnof;"` HTML
#' entity for `html` outputs and using `"f"` for any other type of **gt**
#' output.
#'
#' ```r
#' exibble |>
#'   gt() |>
#'   fmt_currency(
#'     columns = currency,
#'     currency = currency(
#'       html = "&fnof;",
#'       default = "f"
#'     ),
#'     decimals = 2
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_currency_1.png")`
#' }}
#'
#' @family helper functions
#' @section Function ID:
#' 8-6
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
currency <- function(
    ...,
    .list = list2(...)
) {

  # Collect a named list of currencies
  currency_list <- .list

  # Stop function if the currency list contains no values
  if (length(currency_list) == 0) {
    cli::cli_abort(
      "The `currency()` function must be provided with currency symbols."
    )
  }

  # If only a single string is provided, upgrade the `currency_list`
  # to have that string be the `default` value
  if (length(currency_list) == 1 && !rlang::is_named(currency_list)) {
    currency_list <- list(default = currency_list[[1]])
  }

  # Stop function if `currency_list` isn't entirely named
  if (!rlang::is_named(currency_list)) {
    cli::cli_abort("Names must be provided for all output contexts.")
  }

  # Stop function if all names are not part of the supported contexts
  validate_contexts(contexts = names(currency_list))

  # Stop function if there are duplicated names
  if (!rlang::is_dictionaryish(currency_list)) {
    cli::cli_abort("There cannot be any duplicate names for output contexts.")
  }

  # Set the `gt_currency` class
  class(currency_list) <- "gt_currency"

  currency_list
}

# unit_conversion() ------------------------------------------------------------
#' Get a conversion factor across two measurement units of a given class
#'
#' @description
#'
#' The `unit_conversion()` helper function gives us a conversion factor for
#' transforming a value from one form of measurement units to a target form.
#' For example if you have a length value that is expressed in miles you could
#' transform that value to one in kilometers through multiplication of the value
#' by the conversion factor (in this case `1.60934`).
#'
#' For `unit_conversion()` to understand the source and destination units, you
#' need to provide a keyword value for the `from` and `to` arguments. To aid as
#' a reference for this, call [info_unit_conversions()] to display an
#' information table that contains all of the keywords for every conversion
#' type.
#'
#' @param from *Units for the input value*
#'
#'   `scalar<character>` // **required**
#'
#'   The keyword representing the units for the value that requires unit
#'   conversion. In the case where the value has units of miles, the necessary
#'   input is `"length.mile"`.
#'
#' @param to *Desired units for the value*
#'
#'   `scalar<character>` // **required**
#'
#'   The keyword representing the target units for the value with units defined
#'   in `from`. In the case where input value has units of miles and we would
#'   rather want the value to be expressed as kilometers, the `to` value should
#'   be `"length.kilometer"`.
#'
#' @return A single numerical value.
#'
#' @section Examples:
#'
#' Let's use a portion of the [`towny`] dataset and create a table showing
#' population, density, and land area for 10 municipalities. The `land_area_km2`
#' values are in units of square kilometers, however, we'd rather the values
#' were in square miles. We can convert the numeric values while formatting the
#' values with [`fmt_number()`] by using `unit_conversion()` in the `scale_by`
#' argument since the return value of that is a conversion factor (which is
#' applied to each value by multiplication). The same is done for converting the
#' 'people per square kilometer' values in `density_2021` to 'people per square
#' mile', however, the units to convert are in the denominator so the inverse
#' of the conversion factor must be used.
#'
#' ```r
#' towny |>
#'   dplyr::slice_max(density_2021, n = 10) |>
#'   dplyr::select(name, population_2021, density_2021, land_area_km2) |>
#'   gt(rowname_col = "name") |>
#'   fmt_integer(columns = population_2021) |>
#'   fmt_number(
#'     columns = land_area_km2,
#'     decimals = 1,
#'     scale_by = unit_conversion(
#'       from = "area.square-kilometer",
#'       to = "area.square-mile"
#'     )
#'   ) |>
#'   fmt_number(
#'     columns = density_2021,
#'     decimals = 1,
#'     scale_by = 1 / unit_conversion(
#'       from = "area.square-kilometer",
#'       to = "area.square-mile"
#'     )
#'   ) |>
#'   cols_label(
#'     land_area_km2 = "Land Area,<br>sq. mi",
#'     population_2021 = "Population",
#'     density_2021 = "Density,<br>ppl / sq. mi",
#'     .fn = md
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_unit_conversion_1.png")`
#' }}
#'
#' With a small slice of the [`gibraltar`] dataset, let's display the
#' temperature values in terms of degrees Celsius (present in the data) *and* as
#' temperatures in degrees Fahrenheit (achievable via conversion). We can
#' duplicate the `temp` column through [cols_add()] (naming the new column as
#' `temp_f`) and when formatting through [fmt_integer()] we can call
#' `unit_conversion()` within the `scale_by` argument to perform this
#' transformation while formatting the values as integers.
#'
#' ```r
#' gibraltar |>
#'   dplyr::filter(
#'     date == "2023-05-15",
#'     time >= "06:00",
#'     time <= "12:00"
#'   ) |>
#'   dplyr::select(time, temp) |>
#'   gt() |>
#'   tab_header(
#'     title = "Air Temperature During Late Morning Hours at LXGB Stn.",
#'     subtitle = "May 15, 2023"
#'   ) |>
#'   cols_add(temp_f = temp) |>
#'   cols_move(columns = temp_f, after = temp) |>
#'   tab_spanner(
#'     label = "Temperature",
#'     columns = starts_with("temp")
#'   ) |>
#'   fmt_number(
#'     columns = temp,
#'     decimals = 1
#'   ) |>
#'   fmt_integer(
#'     columns = temp_f,
#'     scale_by = unit_conversion(
#'       from = "temperature.C",
#'       to = "temperature.F"
#'     )
#'   ) |>
#'   cols_label(
#'     time = "Time",
#'     temp = "{{degC}}",
#'     temp_f = "{{degF}}"
#'   ) |>
#'   cols_width(
#'     starts_with("temp") ~ px(80),
#'     time ~ px(100)
#'   ) |>
#'   opt_horizontal_padding(scale = 3) |>
#'   opt_vertical_padding(scale = 0.5) |>
#'   opt_align_table_header(align = "left") |>
#'   tab_options(heading.title.font.size = px(16))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_unit_conversion_2.png")`
#' }}
#'
#' @family helper functions
#' @section Function ID:
#' 8-7
#'
#' @section Function Introduced:
#' `v0.11.0` (July 9, 2024)
#'
#' @export
unit_conversion <- function(from, to) {

  force(from)
  force(to)

  if (from %in% temperature_keywords() && to %in% temperature_keywords()) {

    from <- normalize_temp_keyword(from)
    to <- normalize_temp_keyword(to)

    return(temperature_conversions(from = from, to = to))
  }

  if (!(from %in% conversion_factors[["from"]])) {
    cli::cli_abort("The unit supplied in {.arg from} is not known.")
  }
  if (!(to %in% conversion_factors[["to"]])) {
    cli::cli_abort("The unit supplied in {.arg to} is not known.")
  }

  if (from == to) {
    return(1.0)
  }

  row_conversion <-
    vctrs::vec_slice(
      conversion_factors,
      conversion_factors$from == from &
        conversion_factors$to == to
    )

  # In the case where units are valid and available in the internal dataset,
  # they may be across categories; such pairings do not allow for a conversion
  # to take place
  if (nrow(row_conversion) == 0L) {
    cli::cli_abort("The conversion specified cannot be performed.")
  }

  row_conversion[["conv_factor"]]
}

temperature_keywords <- function() {
  c(
    "temperature.celsius",
    "temp.celsius",
    "celsius",
    "temperature.C",
    "temp.C",
    "C",
    "temperature.fahrenheit",
    "temp.fahrenheit",
    "fahrenheit",
    "temperature.F",
    "temp.F",
    "F",
    "temperature.kelvin",
    "temp.kelvin",
    "kelvin",
    "temperature.K",
    "temp.K",
    "K",
    "temperature.rankine",
    "temp.rankine",
    "rankine",
    "temperature.R",
    "temp.R",
    "R"
  )
}

normalize_temp_keyword <- function(keyword) {

  switch(
    keyword,
    temperature.celsius = ,
    temp.celsius = ,
    celsius = ,
    temperature.C = ,
    temp.C = ,
    C = "C",
    temperature.fahrenheit = ,
    temp.fahrenheit = ,
    fahrenheit = ,
    temperature.F = ,
    temp.F = ,
    `F` = "F",
    temperature.kelvin = ,
    temp.kelvin = ,
    kelvin = ,
    temperature.K = ,
    temp.K = ,
    K = "K",
    temperature.rankine = ,
    temp.rankine = ,
    rankine = ,
    temperature.R = ,
    temp.R = ,
    R = "R"
  )
}

temperature_conversions <- function(from, to) {

  from_to <- paste0(from, to)

  switch(
    from_to,
    "CF" = function(x) (1.8 * x) + 32,
    "CK" = function(x) x + 273.15,
    "CR" = function(x) (1.8 * x) + 491.67,
    "FC" = function(x) (x - 32) * 5/9,
    "FK" = function(x) (x + 459.67) / 1.8,
    "FR" = function(x) x + 459.67,
    "KC" = function(x) x - 273.15,
    "KF" = function(x) ((x - 273.15) * 1.8) + 32,
    "KR" = function(x) x * 1.8,
    "RC" = function(x) (x - 32 - 459.67) / 1.8,
    "RF" = function(x) x - 459.67,
    "RK" = function(x) x / 1.8,
    "CC" = ,
    "FF" = ,
    "KK" = ,
    "RR" = 1
  )
}

# adjust_luminance() -----------------------------------------------------------
#' Adjust the luminance for a palette of colors
#'
#' @description
#'
#' The `adjust_luminance()` function can brighten or darken a palette of colors
#' by an arbitrary number of steps, which is defined by a real number between
#' -2.0 and 2.0. The transformation of a palette by a fixed step in this
#' function will tend to apply greater darkening or lightening for those colors
#' in the midrange compared to any very dark or very light colors in the input
#' palette.
#'
#' @details
#'
#' This function can be useful when combined with the [data_color()] function's
#' `palette` argument, which can use a vector of colors or any of the `col_*`
#' functions from the **scales** package (all of which have a `palette`
#' argument).
#'
#' @param colors *Color vector*
#'
#'   `vector<character>` // **required**
#'
#'   This is the vector of colors that will undergo an adjustment in luminance.
#'   Each color value provided must either be a color name (in the set of colors
#'   provided by `grDevices::colors()`) or a hexadecimal string in the form of
#'   "#RRGGBB" or "#RRGGBBAA".
#'
#' @param steps *Adjustment level*
#'
#'   `scalar<numeric|integer>(-2>=val>=2)` // **required**
#'
#'   A positive or negative factor by which the luminance of colors in the
#'   `colors` vector will be adjusted. Must be a number between `-2.0` and
#'   `2.0`.
#'
#' @return A vector of color values.
#'
#' @section Examples:
#'
#' Get a palette of 8 pastel colors from the **RColorBrewer** package.
#'
#' ```r
#' pal <- RColorBrewer::brewer.pal(8, "Pastel2")
#' ```
#'
#' Create lighter and darker variants of the base palette (one step lower, one
#' step higher).
#'
#' ```r
#' pal_darker  <- pal |> adjust_luminance(-1.0)
#' pal_lighter <- pal |> adjust_luminance(+1.0)
#' ```
#'
#' Create a tibble and make a **gt** table from it. Color each column in order
#' of increasingly darker palettes (with [data_color()]).
#'
#' ```r
#' dplyr::tibble(a = 1:8, b = 1:8, c = 1:8) |>
#'   gt() |>
#'   data_color(
#'     columns = a,
#'     colors = scales::col_numeric(
#'       palette = pal_lighter,
#'       domain = c(1, 8)
#'     )
#'   ) |>
#'   data_color(
#'     columns = b,
#'     colors = scales::col_numeric(
#'       palette = pal,
#'       domain = c(1, 8)
#'     )
#'   ) |>
#'   data_color(
#'     columns = c,
#'     colors = scales::col_numeric(
#'       palette = pal_darker,
#'       domain = c(1, 8)
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_adjust_luminance_1.png")`
#' }}
#'
#' @family helper functions
#' @section Function ID:
#' 8-9
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
adjust_luminance <- function(
    colors,
    steps
) {

  # Stop if steps is beyond an acceptable range
  check_number_decimal(steps, min = -2, max = 2)

  # Get a matrix of values in the RGB color space
  rgb_matrix <- t(grDevices::col2rgb(colors, alpha = TRUE)) / 255

  # Obtain the alpha values
  alpha <- rgb_matrix[, "alpha"]

  # Get a matrix of values in the Luv color space
  luv_matrix <- grDevices::convertColor(rgb_matrix[, 1:3], "sRGB", "Luv")

  # Apply calculations to obtain values in the HCL color space
  h <- atan2(luv_matrix[, "v"], luv_matrix[, "u"]) * 180 / pi
  c <- sqrt(luv_matrix[, "u"]^2 + luv_matrix[, "v"]^2)
  l <- luv_matrix[, "L"]

  # Scale luminance to occupy [0, 1]
  y <- l / 100.

  # Obtain `x` positions of luminance values along a sigmoid function
  x <- log(-(y / (y - 1)))

  # Calculate new luminance values based on a fixed step-change in `x`
  y_2 <- 1 / (1 + exp(-(x + steps)))

  # Rescale the new luminance values to [0, 100]
  l <- y_2 * 100.

  # Obtain hexadecimal colors from the modified HCL color values
  grDevices::hcl(h, c, l, alpha = alpha)
}


#' Select helper for targeting the stub column
#'
#' @description
#'
#' Should you need to target only the stub column for formatting or other
#' operations, the `stub()` select helper can be used. This obviates the need
#' to use the name of the column that was selected as the stub column.
#'
#' @param column *Stub column selection*
#'
#'   `scalar<integer>` // *default:* `NULL` (optional)
#'
#'   For tables with multi-column stubs, optionally specify which stub column to
#'   target. Use `1` for the rightmost stub column, `2` for the second from
#'   right, etc. If `NULL` (the default), all stub columns are selected.
#'
#' @return A character vector of class `"stub_column"`.
#'
#' @section Examples:
#'
#' Create a tibble that has a `row` column (values from `1` to `6`), a `group`
#' column, and a `vals` column (containing the same values as in `row`).
#'
#' ```r
#' tbl <-
#'   dplyr::tibble(
#'     row = 1:6,
#'     group = c(rep("Group A", 3), rep("Group B", 3)),
#'     vals = 1:6
#'   )
#' ```
#'
#' Create a **gt** table with a two-column stub (incorporating the `row` and
#' `group` columns in that). Format the row labels of the stub with
#' [fmt_roman()] to obtain Roman numerals in the stub; we're selecting the stub
#' column here with the `stub()` select helper.
#'
#' ```r
#' tbl |>
#'   gt(rowname_col = "row", groupname_col = "group") |>
#'   fmt_roman(columns = stub()) |>
#'   tab_options(row_group.as_column = TRUE)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_stub_1.png")`
#' }}
#'
#' For multi-column stubs, you can set widths for all stub columns together or
#' target specific columns individually:
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, char, row, group) |>
#'   gt(rowname_col = c("group", "row")) |>
#'   cols_width(
#'     stub() ~ px(200),        # All stub columns get 200px
#'     everything() ~ px(100)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_stub_2.png")`
#' }}
#'
#' Or target specific stub columns (1 = rightmost, 2 = second from right):
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, char, row, group) |>
#'   gt(rowname_col = c("group", "row")) |>
#'   cols_width(
#'     stub(1) ~ px(70),        # Rightmost stub column (row)
#'     stub(2) ~ px(200),       # Second stub column (group)
#'     everything() ~ px(100)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_stub_3.png")`
#' }}
#'
#' @family helper functions
#' @section Function ID:
#' 8-10
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @export
stub <- function(column = NULL) {
  x <- "::stub::"
  class(x) <- "stub_column"
  attr(x, "column") <- column
  x
}

# row_group() ------------------------------------------------------------------
#' Select helper for targeting the row group column
#'
#' @description
#'
#' Should you need to target only the row group column for column-width
#' declarations (i.e., when `row_group_as_column = TRUE` is set in the initial
#' [gt()] call), the `row_group()` select helper can be used. This shorthand
#' makes it so you don't have to use the name of the column that was selected
#' as the row group column.
#'
#' @return A character vector of class `"row_group_column"`.
#'
#' @section Examples:
#'
#' Create a tibble that has a `row` column (values from `1` to `6`), a `group`
#' column, and a `vals` column (containing the same values as in `row`).
#'
#' ```r
#' tbl <-
#'   dplyr::tibble(
#'     row = 1:6,
#'     group = c(rep("Group A", 3), rep("Group B", 3)),
#'     vals = 1:6
#'   )
#' ```
#'
#' Create a **gt** table with a two-column stub (incorporating the `row` and
#' `group` columns in that). We can set the widths of the two columns in the
#' stub with the `row_group()` and [stub()] helpers on the LHS of the
#' expressions passed to [cols_width()].
#'
#' ```r
#' tbl |>
#'   gt(
#'     rowname_col = "row",
#'     groupname_col = "group",
#'     row_group_as_column = TRUE
#'   ) |>
#'   fmt_roman(columns = stub()) |>
#'   cols_width(
#'     row_group() ~ px(200),
#'     stub() ~ px(100),
#'     vals ~ px(50)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_row_group_1.png")`
#' }}
#'
#' @family helper functions
#' @section Function ID:
#' 8-11
#'
#' @section Function Introduced:
#' `v0.11.0` (July 9, 2024)
#'
#' @export
row_group <- function() {
  x <- "::row_group::"
  class(x) <- "row_group_column"
  x
}

# cells_title() ----------------------------------------------------------------
#' Location helper for targeting the table title and subtitle
#'
#' @description
#'
#' `cells_title()` is used to target the table title or subtitle
#' when applying a footnote with [tab_footnote()] or adding custom style with
#' [tab_style()]. The function is expressly used in each of those functions'
#' `locations` argument. The header location where the title and optionally the
#' subtitle reside is generated by the [tab_header()] function.
#'
#' @param groups *Specification of groups*
#'
#'   `mult-kw:[title|subtitle]` // *default:* `c("title", "subtitle")`
#'
#'   We can either specify `"title"`, `"subtitle"`, or both (the default) in a
#'   vector to target the title element, the subtitle element, or both elements.
#'
#' @return A list object of classes `cells_title` and `location_cells`.
#'
#' @section Examples:
#'
#' Use a subset of the [`sp500`] dataset to create a small **gt** table. Add a
#' header with a title, and then add a footnote to the title with
#' [tab_footnote()] and `cells_title()` (in `locations`).
#'
#' ```r
#' sp500 |>
#'   dplyr::filter(date >= "2015-01-05" & date <= "2015-01-10") |>
#'   dplyr::select(-c(adj_close, volume, high, low)) |>
#'   gt() |>
#'   tab_header(title = "S&P 500") |>
#'   tab_footnote(
#'     footnote = "All values in USD.",
#'     locations = cells_title(groups = "title")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cells_title_1.png")`
#' }}
#'
#' @family location helper functions
#' @section Function ID:
#' 8-12
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cells_title <- function(groups = c("title", "subtitle")) {

  # Stop function if the `groups` input is invalid
  if (
    is.null(groups) ||
    !is.character(groups) ||
    length(groups) < 1 ||
    !all(groups %in% c("title", "subtitle")) ||
    anyDuplicated(groups) > 0L
  ) {
    cli::cli_abort(
      "`groups` must be either {.val title}, {.val subtitle}, or both."
    )
  }

  # Capture expression for the `groups` argument
  groups_expr <- rlang::enquo(groups)

  # Create the `cells` object
  cells <- list(groups = groups_expr)

  # Apply the `cells_title` and `location_cells` classes
  class(cells) <- c("cells_title", "location_cells")

  cells
}

# cells_stubhead() -------------------------------------------------------------
#' Location helper for targeting the table stubhead cell
#'
#' @description
#'
#' `cells_stubhead()` is used to target the table stubhead location
#' when applying a footnote with [tab_footnote()] or adding custom style with
#' [tab_style()]. The function is expressly used in each of those functions'
#' `locations` argument. The 'stubhead' location is always present alongside the
#' 'stub' location.
#'
#' @return A list object with the classes `cells_stubhead` and `location_cells`.
#'
#' @section Examples:
#'
#' Using a summarized version of the [`pizzaplace`] dataset, let's create a
#' **gt** table. Add a stubhead label with [tab_stubhead()] and then style it
#' with [tab_style()] in conjunction with the use of `cells_stubhead()` in the
#' `locations` argument.
#'
#' ```r
#' pizzaplace |>
#'   dplyr::mutate(month = as.numeric(substr(date, 6, 7))) |>
#'   dplyr::group_by(month, type) |>
#'   dplyr::summarize(sold = dplyr::n(), .groups = "drop") |>
#'   dplyr::filter(month %in% 1:2) |>
#'   gt(rowname_col = "type") |>
#'   tab_stubhead(label = "type") |>
#'   tab_style(
#'     style = cell_fill(color = "lightblue"),
#'     locations = cells_stubhead()
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cells_stubhead_1.png")`
#' }}
#'
#' @family location helper functions
#' @section Function ID:
#' 8-13
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cells_stubhead <- function() {

  # Create the `cells` object
  cells <- list(groups = "stubhead")

  # Apply the `cells_stubhead` and `location_cells` classes
  class(cells) <- c("cells_stubhead", "location_cells")

  cells
}

# cells_column_spanners() ------------------------------------------------------
#' Location helper for targeting the column spanners
#'
#' @description
#'
#' `cells_column_spanners()` is used to target the cells that contain the table
#' column spanners. This is useful when applying a footnote with
#' [tab_footnote()] or adding custom style with [tab_style()]. The function is
#' expressly used in each of those functions' `locations` argument. The
#' 'column_spanners' location is generated by one or more uses of
#' [tab_spanner()] or [tab_spanner_delim()].
#'
#' @param spanners *Specification of spanner IDs*
#'
#'   `<spanner-targeting expression>` // *default:* `everything()`
#'
#'   The spanners to which targeting operations are constrained. Can either be a
#'   series of spanner ID values provided in `c()` or a select helper function
#'   (e.g. [starts_with()], [ends_with()], [contains()], [matches()],
#'   [num_range()], and [everything()]).
#'
#' @param levels *Specification of the spanner levels *
#'
#'   `scalar|vector<numerical>` // *default:* `NULL`
#'
#'   The *existing* spanner levels (1, 2, ...) to which targeting operations are
#'   constrained. Use NULL to refer to all existing levels.
#'
#' @return A list object with the classes `cells_column_spanners` and
#' `location_cells`.
#'
#' @section Examples:
#'
#' Use the [`exibble`] dataset to create a **gt** table. We'll add a spanner
#' column label over three columns (`date`, `time`, and `datetime`) with
#' [tab_spanner()]. The spanner column label can be styled with [tab_style()] by
#' using the `cells_column_spanners()` function in `locations`. In this example,
#' we are making the text of the column spanner label appear as bold.
#'
#' ```r
#' exibble |>
#'   dplyr::select(-fctr, -currency, -group) |>
#'   gt(rowname_col = "row") |>
#'   tab_spanner(
#'     label = "dates and times",
#'     columns = c(date, time, datetime),
#'     id = "dt"
#'   ) |>
#'   tab_style(
#'     style = cell_text(weight = "bold"),
#'     locations = cells_column_spanners(spanners = "dt")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cells_column_spanners_1.png")`
#' }}
#'
#' Use the [`exibble`] dataset to create a **gt** table. We'll add two spanners
#' for the column combinations of (`num`, `char`) and time related columns
#' (`time` and `datetime`). Furthermore we add another level of spanners with
#' a column label over all date- and time related  columns (`date`, `time`, and
#' `datetime`). We want all spanner labels with "time" in their name to be bold.
#' Additionally we want the text to be red of the spanner that is both time-
#' related and on level 1.
#'
#' ```r
#' exibble |>
#'   dplyr::select(-fctr, -currency, -group) |>
#'   gt(rowname_col = "row") |>
#'   tab_spanner(
#'     label = "time related cols",
#'     columns = c(datetime, time)
#'   ) |>
#'   tab_spanner(
#'     label = "num and char",
#'     columns = c(num, char)
#'   ) |>
#'   tab_spanner(
#'     label = "date and time cols",
#'     columns = c(date, time, datetime)
#'   ) |>
#'   tab_style(
#'     style = cell_text(weight = "bold"),
#'     locations = cells_column_spanners(spanners = tidyselect::contains("time"))
#'   ) |>
#'   tab_style(
#'     style = cell_text(color = "red"),
#'     locations = cells_column_spanners(
#'       spanners = tidyselect::contains("time"),
#'       levels = 1
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cells_column_spanners_2.png")`
#' }}
#'
#' @family location helper functions
#' @section Function ID:
#' 8-14
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cells_column_spanners <- function(spanners = everything(), levels = NULL) {

  # Capture expression for the `spanners` argument
  spanners_expr <- rlang::enquo(spanners)

  # Create the `cells` object
  cells <- list(spanners = spanners_expr)

  # Apply the `cells_column_spanners` and `location_cells` classes
  class(cells) <- c("cells_column_spanners", "location_cells")

  # Save what spanner_levels are in scope of the location selection
  attr(cells, "spanner_levels") <- levels

  cells
}

# cells_column_labels() --------------------------------------------------------
#' Location helper for targeting the column labels
#'
#' @description
#'
#' `cells_column_labels()` is used to target the table's column
#' labels when applying a footnote with [tab_footnote()] or adding custom style
#' with [tab_style()]. The function is expressly used in each of those
#' functions' `locations` argument. The 'column_labels' location is present by
#' default in every **gt** table.
#'
#' @inheritParams cells_body
#'
#' @return A list object with the classes `cells_column_labels` and
#'   `location_cells`.
#'
#' @section Targeting columns with the `columns` argument:
#'
#' The `columns` argument allows us to target a subset of columns contained in
#' the table. We can declare column names in `c()` (with bare column names or
#' names in quotes) or we can use **tidyselect**-style expressions. This can be
#' as basic as supplying a select helper like `starts_with()`, or, providing a
#' more complex incantation like
#'
#' `where(~ is.numeric(.x) & max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value greater than
#' 1,000,000 (excluding any `NA`s from consideration).
#'
#' @section Examples:
#'
#' Let's use a small portion of the [`sza`] dataset to create a **gt** table.
#' Add footnotes to the column labels with [tab_footnote()] and
#' `cells_column_labels()` in `locations`.
#'
#' ```r
#' sza |>
#'   dplyr::filter(
#'     latitude == 20 & month == "jan" &
#'       !is.na(sza)
#'   ) |>
#'   dplyr::select(-latitude, -month) |>
#'   gt() |>
#'   tab_footnote(
#'     footnote = "True solar time.",
#'     locations = cells_column_labels(
#'       columns = tst
#'     )
#'   ) |>
#'   tab_footnote(
#'     footnote = "Solar zenith angle.",
#'     locations = cells_column_labels(
#'       columns = sza
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cells_column_labels_1.png")`
#' }}
#'
#' @family location helper functions
#' @section Function ID:
#' 8-15
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cells_column_labels <- function(columns = everything()) {

  # Capture expression for the `columns` argument
  columns_expr <- rlang::enquo(columns)

  # Create the `cells` object
  cells <- list(columns = columns_expr)

  # Apply the `cells_column_labels` and `location_cells` classes
  class(cells) <- c("cells_column_labels", "location_cells")

  cells
}

# cells_row_groups() -----------------------------------------------------------
#' Location helper for targeting row groups
#'
#' @description
#'
#' `cells_row_groups()` is used to target the table's row groups
#' when applying a footnote with [tab_footnote()] or adding custom style with
#' [tab_style()]. The function is expressly used in each of those functions'
#' `locations` argument. The 'row_groups' location can be generated by the
#' specifying a `groupname_col` in [gt()], by introducing grouped data to [gt()]
#' (via [dplyr::group_by()]), or, by specifying groups with [tab_row_group()].
#'
#' @param groups *Specification of row group IDs*
#'
#'   `<row-group-targeting expression>` // *default:* `everything()`
#'
#'   The row groups to which targeting operations are constrained. Can either be
#'   a series of row group ID values provided in `c()` or a select helper
#'   function (e.g. [starts_with()], [ends_with()], [contains()], [matches()],
#'   [num_range()], and [everything()]).
#'
#' @return A list object with the classes `cells_row_groups` and
#'   `location_cells`.
#'
#' @section Targeting cells with `groups`:
#'
#' By default `groups` is set to `everything()`, which means that all available
#' groups will be considered. Providing the ID values (in quotes) of row groups
#' in `c()` will serve to constrain the targeting to that subset of groups.
#'
#' @section Examples:
#'
#' Let's use a summarized version of the [`pizzaplace`] dataset to create a
#' **gt** table with grouped data. Add a summary with [summary_rows()] and then
#' add a footnote to the `"peppr_salami"` row group label with [tab_footnote()];
#' the targeting is done with `cells_row_groups()` in the `locations` argument.
#'
#' ```r
#' pizzaplace |>
#'   dplyr::filter(name %in% c("soppressata", "peppr_salami")) |>
#'   dplyr::group_by(name, size) |>
#'   dplyr::summarize(`Pizzas Sold` = dplyr::n(), .groups = "drop") |>
#'   gt(rowname_col = "size", groupname_col = "name") |>
#'   summary_rows(
#'     columns = `Pizzas Sold`,
#'     fns = list(label = "TOTAL", fn = "sum"),
#'     fmt = ~ fmt_integer(.)
#'   ) |>
#'   tab_footnote(
#'     footnote = "The Pepper-Salami.",
#'     cells_row_groups(groups = "peppr_salami")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cells_row_groups_1.png")`
#' }}
#'
#' @family location helper functions
#' @section Function ID:
#' 8-16
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cells_row_groups <- function(groups = everything()) {

  # Capture expression for the `groups` argument
  groups_expr <- rlang::enquo(groups)

  # Create the `cells` object
  cells <- list(groups = groups_expr)

  # Apply the `cells_row_groups` and `location_cells` classes
  class(cells) <- c("cells_row_groups", "location_cells")

  cells
}

#' Location helper for targeting row groups (deprecated)
#'
#' @inheritParams cells_row_groups
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @keywords internal
#' @export
cells_group <- function(groups = everything()) {

  cli::cli_warn(c(
    "Since gt v0.2.0.5, the `cells_group()` function has been deprecated.",
    "*" = "Please use {.help [cells_row_groups()](gt::cells_row_groups)} instead."
  ),
  .frequency = "regularly",
  .frequency_id = "cells_group_fn_deprecation"
  )

  cells_row_groups(groups = {{groups}})
}

# cells_stub() -----------------------------------------------------------------
#' Location helper for targeting cells in the table stub
#'
#' @description
#'
#' `cells_stub()` is used to target the table's stub cells and it
#' is useful when applying a footnote with [tab_footnote()] or adding a custom
#' style with [tab_style()]. The function is expressly used in each of those
#' functions' `locations` argument. Here are several ways that a stub location
#' might be available in a **gt** table: (1) through specification of a
#' `rowname_col` in [gt()], (2) by introducing a data frame with row names to
#' [gt()] with `rownames_to_stub = TRUE`, or (3) by using [summary_rows()] or
#' [grand_summary_rows()] with neither of the previous two conditions being
#' true.
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // *default:* `everything()`
#'
#'   The rows to which targeting operations are constrained. The default
#'   [everything()] results in all rows in the stub being targeted.
#'   Multiple targeting methods are supported:
#'
#'   **Numeric indices:** A vector of row indices within `c()` (e.g., `c(1, 3, 5)`).
#'
#'   **Content-based targeting:** A vector of content values within `c()` that match
#'   values in any stub column (e.g., `c("Ford", "BMW")` to target all rows
#'   containing those manufacturer names). This is particularly useful for
#'   multi-column stubs where you want to target based on content rather than
#'   calculating row indices.
#'
#'   **Select helpers:** Use functions like [starts_with()], [ends_with()],
#'   [contains()], [matches()], [num_range()], and [everything()].
#'
#'   **Expressions:** Filter expressions to target specific rows
#'   (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#'   When using content-based targeting with multi-column stubs, the function
#'   will search all stub columns for matching values unless specific `columns`
#'   are provided to constrain the search.
#'
#' @param columns *Stub columns to target*
#'
#'   `<column-targeting expression>` // *default:* `NULL` (`optional`)
#'
#'   The stub columns to which targeting operations are constrained. By default
#'   (`NULL`), all stub columns are targeted for backward compatibility. For
#'   tables with multi-column stubs (created with `gt(rowname_col = c(...))` or
#'   when `row_group_as_column = TRUE`), you can target specific columns by
#'   providing a vector of column names within `c()`, a vector of column indices,
#'   or a select helper function. When `columns` is specified, only the
#'   intersection of the specified columns and rows will be targeted. For
#'   single-column stubs, this argument can be omitted for traditional behavior.
#'
#' @return A list object with the classes `cells_stub` and `location_cells`.
#'
#' @section Examples:
#'
#' Let's create a **gt** table using a transformed version of the [`sza`]
#' dataset. We'll color all of the `month` values in the table stub with
#' [tab_style()], using `cells_stub()` in `locations`.
#'
#' ```r
#' sza |>
#'   dplyr::filter(latitude == 20 & tst <= "1000") |>
#'   dplyr::select(-latitude) |>
#'   dplyr::filter(!is.na(sza)) |>
#'   tidyr::pivot_wider(
#'     names_from = "tst",
#'     values_from = sza,
#'     names_sort = TRUE
#'   ) |>
#'   gt(rowname_col = "month") |>
#'   sub_missing(missing_text = "") |>
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "darkblue"),
#'       cell_text(color = "white")
#'       ),
#'     locations = cells_stub()
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cells_stub_1.png")`
#' }}
#'
#' For multi-column stubs, you can target specific columns. Here's an example
#' with a table that has multiple stub columns:
#'
#' ```r
#' dplyr::tibble(
#'   country = rep(c("USA", "Canada"), each = 3),
#'   region = rep(c("North", "South", "West"), 2),
#'   pop_2020 = c(5000, 3000, 2000, 4000, 3500, 1500),
#'   pop_2021 = c(5100, 3100, 2100, 4100, 3600, 1600)
#' ) |>
#'   gt(rowname_col = c("country", "region")) |>
#'   tab_style(
#'     style = cell_fill(color = "lightblue"),
#'     locations = cells_stub(columns = "country", rows = 1:2)
#'   ) |>
#'   tab_style(
#'     style = cell_text(weight = "bold"),
#'     locations = cells_stub(columns = "region", rows = c(1, 3, 5))
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cells_stub_2.png")`
#' }}
#'
#' You can also use content-based targeting to target rows by their actual values
#' rather than calculating row indices:
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, year, hp, msrp) |>
#'   dplyr::slice(1:8) |>
#'   gt(rowname_col = c("mfr", "model")) |>
#'   tab_style(
#'     style = cell_fill(color = "lightcoral"),
#'     locations = cells_stub(rows = "Ford")  # Targets all Ford rows
#'   ) |>
#'   tab_style(
#'     style = cell_text(weight = "bold"),
#'     locations = cells_stub(rows = c("BMW", "Audi"), columns = "mfr")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cells_stub_3.png")`
#' }}
#'
#' @family location helper functions
#' @section Function ID:
#' 8-17
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cells_stub <- function(rows = everything(), columns = NULL) {

  # Capture expression for the `rows` argument
  rows_expr <- rlang::enquo(rows)

  # Check if columns parameter was explicitly provided
  # For backward compatibility, only include columns if it was explicitly set
  columns_provided <- !is.null(columns)

  # Create the `cells` object based on backward compatibility needs
  if (columns_provided) {
    # New behavior: both columns and rows
    columns_expr <- rlang::enquo(columns)
    cells <- list(columns = columns_expr, rows = rows_expr)
  } else {
    # Legacy behavior: only rows (for backward compatibility)
    cells <- list(rows = rows_expr)
  }

  # Apply the `cells_stub` and `location_cells` classes
  class(cells) <- c("cells_stub", "location_cells")

  cells
}

# cells_body() -----------------------------------------------------------------
#' Location helper for targeting data cells in the table body
#'
#' @description
#'
#' `cells_body()` is used to target the data cells in the table
#' body. The function can be used to apply a footnote with [tab_footnote()], to
#' add custom styling with [tab_style()], or the transform the targeted cells
#' with [text_transform()]. The function is expressly used in each of those
#' functions' `locations` argument. The 'body' location is present by default in
#' every **gt** table.
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns to which targeting operations are constrained. Can either
#'   be a series of column names provided in `c()`, a vector of column indices,
#'   or a select helper function (e.g. [starts_with()], [ends_with()],
#'   [contains()], [matches()], [num_range()], and [everything()]).
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // *default:* `everything()`
#'
#'   In conjunction with `columns`, we can specify which of their rows should
#'   form a constraint for targeting operations. The default [everything()]
#'   results in all rows in `columns` being formatted. Alternatively, we can
#'   supply a vector of row IDs within `c()`, a vector of row indices, or a
#'   select helper function (e.g. [starts_with()], [ends_with()], [contains()],
#'   [matches()], [num_range()], and [everything()]). We can also use
#'   expressions to filter down to the rows we need
#'   (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @return A list object with the classes `cells_body` and `location_cells`.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). The
#' `columns` argument allows us to target a subset of cells contained in the
#' resolved columns. We say resolved because aside from declaring column names
#' in `c()` (with bare column names or names in quotes) we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) & max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value greater than
#' 1,000,000 (excluding any `NA`s from consideration).
#'
#' Once the columns are targeted, we may also target the `rows` within those
#' columns. This can be done in a variety of ways. If a stub is present, then we
#' potentially have row identifiers. Those can be used much like column names in
#' the `columns`-targeting scenario. We can use simpler **tidyselect**-style
#' expressions (the select helpers should work well here) and we can use quoted
#' row identifiers in `c()`. It's also possible to use row indices (e.g.,
#' `c(3, 5, 6)`) though these index values must correspond to the row numbers of
#' the input data (the indices won't necessarily match those of rearranged rows
#' if row groups are present). One more type of expression is possible, an
#' expression that takes column values (can involve any of the available columns
#' in the table) and returns a logical vector.
#'
#' @section Examples:
#'
#' Let's use a subset of the [`gtcars`] dataset to create a **gt** table. Add a
#' footnote (with [tab_footnote()]) that targets a single data cell via the use
#' of `cells_body()` in `locations` (`rows = hp == max(hp)` will target a single
#' row in the `hp` column).
#'
#' ```r
#' gtcars |>
#'   dplyr::filter(ctry_origin == "United Kingdom") |>
#'   dplyr::select(mfr, model, year, hp) |>
#'   gt() |>
#'   tab_footnote(
#'     footnote = "Highest horsepower.",
#'     locations = cells_body(
#'       columns = hp,
#'       rows = hp == max(hp)
#'     ),
#'     placement = "right"
#'   ) |>
#'   opt_footnote_marks(marks = c("*", "+"))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cells_body_1.png")`
#' }}
#'
#' @family location helper functions
#' @section Function ID:
#' 8-18
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cells_body <- function(
    columns = everything(),
    rows = everything()
) {

  # Capture expressions for the `columns` and `rows` arguments
  columns_expr <- rlang::enquo(columns)
  rows_expr <- rlang::enquo(rows)

  # Create the `cells` object
  cells <-
    list(
      columns = columns_expr,
      rows = rows_expr
    )

  # Apply the `cells_body` and `location_cells` classes
  class(cells) <- c("cells_body", "location_cells")

  cells
}

# cells_summary() --------------------------------------------------------------
#' Location helper for targeting group summary cells
#'
#' @description
#'
#' `cells_summary()` is used to target the cells in a group summary and it is
#' useful when applying a footnote with [tab_footnote()] or adding a custom
#' style with [tab_style()]. The function is expressly used in each of those
#' functions' `locations` argument. The 'summary' location is generated by
#' [summary_rows()].
#'
#' @inheritParams cells_body
#'
#' @param groups *Specification of row group IDs*
#'
#'   `<row-group-targeting expression>` // *default:* `everything()`
#'
#'   The row groups to which targeting operations are constrained. This aids in
#'   targeting the summary rows that reside in certain row groups. Can either be
#'   a series of row group ID values provided in `c()` or a select helper
#'   function (e.g. [starts_with()], [ends_with()], [contains()], [matches()],
#'   [num_range()], and [everything()].
#'
#' @return A list object with the classes `cells_summary` and `location_cells`.
#'
#' @section Targeting cells with `columns`, `rows`, and `groups`:
#'
#' Targeting of summary cells is done through the `groups`, `columns`, and
#' `rows` arguments. By default `groups` is set to `everything()`, which means
#' that all available groups will be considered. Providing the ID values (in
#' quotes) of row groups in `c()` will serve to constrain the targeting to that
#' subset of groups.
#'
#' The `columns` argument allows us to target a subset of summary
#' cells contained in the resolved columns. We say resolved because aside from
#' declaring column names in `c()` (with bare column names or names in quotes)
#' we can use **tidyselect**-style expressions. This can be as basic as
#' supplying a select helper like `starts_with()`, or, providing a more complex
#' incantation like
#'
#' `where(~ is.numeric(.x) & max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value greater than
#' 1,000,000 (excluding any `NA`s from consideration).
#'
#' Once the groups and columns are targeted, we may also target the `rows` of
#' the summary. Summary cells in the stub will have ID values that can be used
#' much like column names in the `columns`-targeting scenario. We can use
#' simpler **tidyselect**-style expressions (the select helpers should work well
#' here) and we can use quoted row identifiers in `c()`. It's also possible to
#' use row indices (e.g., `c(3, 5, 6)`) that correspond to the row number of a
#' summary row in a row group (numbering restarts with every row group).
#'
#' @section Examples:
#'
#' Use a portion of the [`countrypops`] dataset to create a **gt** table. Add
#' some styling to the summary data cells with [tab_style()], using
#' `cells_summary()` in the `locations` argument.
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(country_name == "Japan", year < 1970) |>
#'   dplyr::select(-contains("country")) |>
#'   dplyr::mutate(decade = paste0(substr(year, 1, 3), "0s")) |>
#'   gt(
#'     rowname_col = "year",
#'     groupname_col = "decade"
#'   ) |>
#'   fmt_number(
#'     columns = population,
#'     decimals = 0
#'   ) |>
#'   summary_rows(
#'     groups = "1960s",
#'     columns = population,
#'     fns = list("min", "max"),
#'     fmt = ~ fmt_integer(.)
#'   ) |>
#'   tab_style(
#'     style = list(
#'       cell_text(style = "italic"),
#'       cell_fill(color = "lightblue")
#'     ),
#'     locations = cells_summary(
#'       groups = "1960s",
#'       columns = population,
#'       rows = 1
#'     )
#'   ) |>
#'   tab_style(
#'     style = list(
#'       cell_text(style = "italic"),
#'       cell_fill(color = "lightgreen")
#'     ),
#'     locations = cells_summary(
#'       groups = "1960s",
#'       columns = population,
#'       rows = 2
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cells_summary_1.png")`
#' }}
#'
#' @family location helper functions
#' @section Function ID:
#' 8-19
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cells_summary <- function(
    groups = everything(),
    columns = everything(),
    rows = everything()
) {

  # Capture expressions for the `groups`,
  # `columns`, and `rows` arguments
  groups_expr <- rlang::enquo(groups)
  columns_expr <- rlang::enquo(columns)
  rows_expr <- rlang::enquo(rows)

  # Create the `cells` object
  cells <-
    list(
      groups = groups_expr,
      columns = columns_expr,
      rows = rows_expr
    )

  # Apply the `cells_summary` and `location_cells` classes
  class(cells) <- c("cells_summary", "location_cells")

  cells
}

# cells_grand_summary() --------------------------------------------------------
#' Location helper for targeting cells in a grand summary
#'
#' @description
#'
#' `cells_grand_summary()` is used to target the cells in a grand
#' summary and it is useful when applying a footnote with [tab_footnote()] or
#' adding custom styles with [tab_style()]. The function is expressly used in
#' each of those functions' `locations` argument. The 'grand_summary' location
#' is generated by [grand_summary_rows()].
#'
#' @inheritParams cells_summary
#'
#' @return A list object with the classes `cells_grand_summary` and
#'   `location_cells`.
#'
#' @section Targeting cells with `columns` and `rows`:
#'
#' Targeting of grand summary cells is done through the `columns` and `rows`
#' arguments. The `columns` argument allows us to target a subset of grand
#' summary cells contained in the resolved columns. We say resolved because
#' aside from declaring column names in `c()` (with bare column names or names
#' in quotes) we can use **tidyselect**-style expressions. This can be as basic
#' as supplying a select helper like `starts_with()`, or, providing a more
#' complex incantation like
#'
#' `where(~ is.numeric(.x) & max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value greater than
#' 1,000,000 (excluding any `NA`s from consideration).
#'
#' Once the columns are targeted, we may also target the `rows` of the grand
#' summary. Grand summary cells in the stub will have ID values that can be used
#' much like column names in the `columns`-targeting scenario. We can use
#' simpler **tidyselect**-style expressions (the select helpers should work well
#' here) and we can use quoted row identifiers in `c()`. It's also possible to
#' use row indices (e.g., `c(3, 5, 6)`) that correspond to the row number of a
#' grand summary row.
#'
#' @section Examples:
#'
#' Use a portion of the [`countrypops`] dataset to create a **gt** table. Add
#' some styling to a grand summary cells with [tab_style()] and
#' `cells_grand_summary()` in the `locations` argument.
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(country_name == "Spain", year < 1970) |>
#'   dplyr::select(-contains("country")) |>
#'   gt(rowname_col = "year") |>
#'   fmt_number(
#'     columns = population,
#'     decimals = 0
#'   ) |>
#'   grand_summary_rows(
#'     columns = population,
#'     fns = change ~ max(.) - min(.),
#'     fmt = ~ fmt_integer(.)
#'   ) |>
#'   tab_style(
#'     style = list(
#'       cell_text(style = "italic"),
#'       cell_fill(color = "lightblue")
#'     ),
#'     locations = cells_grand_summary(
#'       columns = population,
#'       rows = 1
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cells_grand_summary_1.png")`
#' }}
#'
#' @family location helper functions
#' @section Function ID:
#' 8-20
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cells_grand_summary <- function(
    columns = everything(),
    rows = everything()
) {

  # Capture expressions for the `columns` and `rows` arguments
  columns_expr <- rlang::enquo(columns)
  rows_expr <- rlang::enquo(rows)

  # Create the `cells` object
  cells <-
    list(
      columns = columns_expr,
      rows = rows_expr
    )

  # Apply the `cells_grand_summary` and `location_cells` classes
  class(cells) <- c("cells_grand_summary", "location_cells")

  cells
}

# cells_stub_summary() ---------------------------------------------------------
#' Location helper for targeting the stub cells in a summary
#'
#' @description
#'
#' `cells_stub_summary()` is used to target the stub cells of
#' summary and it is useful when applying a footnote with [tab_footnote()] or
#' adding custom styles with [tab_style()]. The function is expressly used in
#' each of those functions' `locations` argument. The 'stub_summary' location is
#' generated by [summary_rows()].
#'
#' @inheritParams cells_row_groups
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // *default:* `everything()`
#'
#'   In conjunction with `groups`, we can specify which of their rows should
#'   form a constraint for targeting operations. The default [everything()]
#'   results in all rows in `columns` being formatted. Alternatively, we can
#'   supply a vector of row IDs within `c()`, a vector of row indices, or a
#'   select helper function (e.g. [starts_with()], [ends_with()], [contains()],
#'   [matches()], [num_range()], and [everything()]). We can also use
#'   expressions to filter down to the rows we need
#'   (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @return A list object with the classes `cells_stub_summary` and
#'   `location_cells`.
#'
#' @section Targeting summary stub cells with `groups` and `rows`:
#'
#' Targeting the stub cells of group summary rows is done through the `groups`
#' and `rows` arguments. By default `groups` is set to `everything()`, which means
#' that all available groups will be considered. Providing the ID values (in
#' quotes) of row groups in `c()` will serve to constrain the targeting to that
#' subset of groups.
#'
#' Once the groups are targeted, we may also target the `rows` of the summary.
#' Summary cells in the stub will have ID values that can be used much like
#' column names in the `columns`-targeting scenario. We can use simpler
#' **tidyselect**-style expressions (the select helpers should work well here)
#' and we can use quoted row identifiers in `c()`. It's also possible to use row
#' indices (e.g., `c(3, 5, 6)`) that correspond to the row number of a summary
#' row in a row group (numbering restarts with every row group).
#'
#' @section Examples:
#'
#' Use a portion of the [`countrypops`] dataset to create a **gt** table. Add
#' some styling to the summary data stub cells with [tab_style()] and
#' `cells_stub_summary()` in the `locations` argument.
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(country_name == "Japan", year < 1970) |>
#'   dplyr::select(-contains("country")) |>
#'   dplyr::mutate(decade = paste0(substr(year, 1, 3), "0s")) |>
#'   gt(
#'     rowname_col = "year",
#'     groupname_col = "decade"
#'   ) |>
#'   fmt_integer(columns = population) |>
#'   summary_rows(
#'     groups = "1960s",
#'     columns = population,
#'     fns = list("min", "max"),
#'     fmt = ~ fmt_integer(.)
#'   ) |>
#'   tab_style(
#'     style = list(
#'       cell_text(
#'         weight = "bold",
#'         transform = "capitalize"
#'       ),
#'       cell_fill(
#'         color = "lightblue",
#'         alpha = 0.5
#'       )
#'     ),
#'     locations = cells_stub_summary(
#'       groups = "1960s"
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cells_stub_summary_1.png")`
#' }}
#'
#' @family location helper functions
#' @section Function ID:
#' 8-21
#'
#' @section Function Introduced:
#' `v0.3.0` (May 12, 2021)
#'
#' @export
cells_stub_summary <- function(
    groups = everything(),
    rows = everything()
) {

  # Capture expressions for the `groups` and `rows` arguments
  groups_expr <- rlang::enquo(groups)
  rows_expr <- rlang::enquo(rows)

  # Create the `cells` object
  cells <-
    list(
      groups = groups_expr,
      rows = rows_expr
    )

  # Apply the `cells_stub_summary` and `location_cells` classes
  class(cells) <- c("cells_stub_summary", "location_cells")

  cells
}

# cells_stub_grand_summary() ---------------------------------------------------
#' Location helper for targeting the stub cells in a grand summary
#'
#' @description
#'
#' `cells_stub_grand_summary()` is used to target the stub cells of
#' a grand summary and it is useful when applying a footnote with
#' [tab_footnote()] or adding custom styles with [tab_style()]. The function is
#' expressly used in each of those functions' `locations` argument. The
#' 'stub_grand_summary' location is generated by [grand_summary_rows()].
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // *default:* `everything()`
#'
#'   We can specify which rows should be targeted. The default [everything()]
#'   results in all rows in `columns` being formatted. Alternatively, we can
#'   supply a vector of row IDs within `c()`, a vector of row indices, or a
#'   select helper function (e.g. [starts_with()], [ends_with()], [contains()],
#'   [matches()], [num_range()], and [everything()]). We can also use
#'   expressions to filter down to the rows we need
#'   (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @return A list object with the classes `cells_stub_grand_summary` and
#'   `location_cells`.
#'
#' @section Targeting grand summary stub cells with `rows`:
#'
#' Targeting the stub cells of a grand summary row is done through the `rows`
#' argument. Grand summary cells in the stub will have ID values that can be
#' used much like column names in the `columns`-targeting scenario. We can use
#' simpler **tidyselect**-style expressions (the select helpers should work well
#' here) and we can use quoted row identifiers in `c()`. It's also possible to
#' use row indices (e.g., `c(3, 5, 6)`) that correspond to the row number of a
#' grand summary row.
#'
#' @section Examples:
#'
#' Use a portion of the [`countrypops`] dataset to create a **gt** table. Add
#' some styling to a grand summary stub cell with [tab_style()] and using
#' `cells_stub_grand_summary()` in the `locations` argument.
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(country_name == "Spain", year < 1970) |>
#'   dplyr::select(-contains("country")) |>
#'   gt(rowname_col = "year") |>
#'   fmt_number(
#'     columns = population,
#'     decimals = 0
#'   ) |>
#'   grand_summary_rows(
#'     columns = population,
#'     fns = list(change = ~max(.) - min(.)),
#'     fmt = ~ fmt_integer(.)
#'   ) |>
#'   tab_style(
#'     style = cell_text(weight = "bold", transform = "uppercase"),
#'     locations = cells_stub_grand_summary(rows = "change")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cells_stub_grand_summary_1.png")`
#' }}
#'
#' @family location helper functions
#' @section Function ID:
#' 8-22
#'
#' @section Function Introduced:
#' `v0.3.0` (May 12, 2021)
#'
#' @export
cells_stub_grand_summary <- function(rows = everything()) {

  # Capture expressions for the `rows` arguments
  rows_expr <- rlang::enquo(rows)

  # Create the `cells` object
  cells <- list(rows = rows_expr)

  # Apply the `cells_stub_grand_summary` and `location_cells` classes
  class(cells) <- c("cells_stub_grand_summary", "location_cells")

  cells
}

# cells_footnotes() ------------------------------------------------------------
#' Location helper for targeting the footnotes
#'
#' @description
#'
#' `cells_footnotes()` is used to target all footnotes in the
#' footer section of the table. This is useful for adding custom styles to the
#' footnotes with [tab_style()] (using the `locations` argument). The
#' 'footnotes' location is generated by one or more uses of [tab_footnote()].
#' This location helper function cannot be used for the `locations` argument of
#' `tab_footnote()` and doing so will result in a warning (with no change made
#' to the table).
#'
#' @return A list object with the classes `cells_footnotes` and
#'   `location_cells`.
#'
#' @section Examples:
#'
#' Using a subset of the [`sza`] dataset, let's create a **gt** table. We'd like
#' to color the `sza` column so that's done with the [data_color()] function. We
#' can add a footnote with [tab_footnote()] and we can also style the
#' footnotes section. The styling is done with [tab_style()] and
#' `locations = cells_footnotes()`.
#'
#' ```r
#' sza |>
#'   dplyr::filter(
#'     latitude == 20 &
#'       month == "jan" &
#'       !is.na(sza)
#'   ) |>
#'   dplyr::select(-latitude, -month) |>
#'   gt() |>
#'   data_color(
#'     columns = sza,
#'     palette = c("white", "yellow", "navyblue"),
#'     domain = c(0, 90)
#'   ) |>
#'   tab_footnote(
#'     footnote = "Color indicates height of sun.",
#'     locations = cells_column_labels(columns = sza)
#'   ) |>
#'   tab_options(table.width = px(320)) |>
#'   tab_style(
#'     style = list(
#'       cell_text(size = "smaller"),
#'       cell_fill(color = "gray90")
#'       ),
#'     locations = cells_footnotes()
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cells_footnotes_1.png")`
#' }}
#'
#' @family location helper functions
#' @section Function ID:
#' 8-23
#'
#' @section Function Introduced:
#' `v0.3.0` (May 12, 2021)
#'
#' @export
cells_footnotes <- function() {

  # Create the `cells` object
  cells <- list(groups = "footnotes")

  # Apply the `cells_footnotes` and `location_cells` classes
  class(cells) <- c("cells_footnotes", "location_cells")

  cells
}

# cells_source_notes() ---------------------------------------------------------
#' Location helper for targeting the source notes
#'
#' @description
#'
#' `cells_source_notes()` is used to target all source notes in the
#' footer section of the table. This is useful for adding custom styles to the
#' source notes with [tab_style()] (using the `locations` argument). The
#' 'source_notes' location is generated by [tab_source_note()].
#'
#' @return A list object with the classes `cells_source_notes` and
#'   `location_cells`.
#'
#' @section Examples:
#'
#' Let's use a subset of the [`gtcars`] dataset to create a **gt** table. Add a
#' source note (with [tab_source_note()]) and style the source notes section
#' inside [tab_style()] with `locations = cells_source_notes()`.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice(1:5) |>
#'   gt() |>
#'   tab_source_note(source_note = "From edmunds.com") |>
#'   tab_style(
#'     style = cell_text(
#'       color = "#A9A9A9",
#'       size = "small"
#'     ),
#'     locations = cells_source_notes()
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cells_source_notes_1.png")`
#' }}
#'
#' @family location helper functions
#' @section Function ID:
#' 8-24
#'
#' @section Function Introduced:
#' `v0.3.0` (May 12, 2021)
#'
#' @export
cells_source_notes <- function() {

  # Create the `cells` object
  cells <- list(groups = "source_notes")

  # Apply the `cells_source_notes` and `location_cells` classes
  class(cells) <- c("cells_source_notes", "location_cells")

  cells
}

# cell_text() ------------------------------------------------------------------
#' Helper for defining custom text styles for table cells
#'
#' @description
#'
#' This helper function can be used with [tab_style()], which itself allows for
#' the setting of custom styles to one or more cells. We can also define several
#' styles within a single call of `cell_text()` and [tab_style()] will reliably
#' apply those styles to the targeted element.
#'
#' @param color *Text color*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   The text color can be modified through the `color` argument.
#'
#' @param font *Font (or collection of fonts) used for text*
#'
#'   `vector<character>` // *default:* `NULL` (`optional`)
#'
#'   The font or collection of fonts (subsequent font names are) used as
#'   fallbacks.
#'
#' @param size *Text size*
#'
#'   `scalar<numeric|integer|character>` // *default:* `NULL` (`optional`)
#'
#'   The size of the font. Can be provided as a number that is assumed to
#'   represent `px` values (or could be wrapped in the [px()] helper function).
#'   We can also use one of the following absolute size keywords: `"xx-small"`,
#'   `"x-small"`, `"small"`, `"medium"`, `"large"`, `"x-large"`, or
#'   `"xx-large"`.
#'
#' @param align *Text alignment*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   The text in a cell can be horizontally aligned though one of the following
#'   options: `"center"`, `"left"`, `"right"`, or `"justify"`.
#'
#' @param v_align *Vertical alignment*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   The vertical alignment of the text in the cell can be modified through the
#'   options `"middle"`, `"top"`, or `"bottom"`.
#'
#' @param style *Text style*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   Can be one of either `"normal"`, `"italic"`, or `"oblique"`.
#'
#' @param weight *Font weight*
#'
#'   `scalar<character|numeric|integer>` // *default:* `NULL` (`optional`)
#'
#'   The weight of the font can be modified thorough a text-based option such as
#'   `"normal"`, `"bold"`, `"lighter"`, `"bolder"`, or, a numeric value between
#'   `1` and `1000`, inclusive. Note that only variable fonts may support the
#'   numeric mapping of weight.
#'
#' @param stretch *Stretch text*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   Allows for text to either be condensed or expanded. We can use one of the
#'   following text-based keywords to describe the degree of
#'   condensation/expansion: `"ultra-condensed"`, `"extra-condensed"`,
#'   `"condensed"`, `"semi-condensed"`, `"normal"`, `"semi-expanded"`,
#'   `"expanded"`, `"extra-expanded"`, or `"ultra-expanded"`. Alternatively, we
#'   can supply percentage values from `0\%` to `200\%`, inclusive. Negative
#'   percentage values are not allowed.
#'
#' @param decorate *Decorate text*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   Allows for text decoration effect to be applied. Here, we can use
#'   `"overline"`, `"line-through"`, or `"underline"`.
#'
#' @param transform *Transform text*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   Allows for the transformation of text. Options are `"uppercase"`,
#'   `"lowercase"`, or `"capitalize"`.
#'
#' @param whitespace *White-space options*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   A white-space preservation option. By default, runs of white-space will be
#'   collapsed into single spaces but several options exist to govern how
#'   white-space is collapsed and how lines might wrap at soft-wrap
#'   opportunities. The options are `"normal"`, `"nowrap"`, `"pre"`,
#'   `"pre-wrap"`, `"pre-line"`, and `"break-spaces"`.
#'
#' @param indent *Text indentation*
#'
#'   `scalar<numeric|integer|character>` // *default:* `NULL` (`optional`)
#'
#'   The indentation of the text. Can be provided as a number that is assumed to
#'   represent `px` values (or could be wrapped in the [px()] helper function).
#'   Alternatively, this can be given as a percentage (easily constructed with
#'   [pct()]).
#'
#' @return A list object of class `cell_styles`.
#'
#' @section Examples:
#'
#' Let's use the [`exibble`] dataset to create a simple, two-column **gt** table
#' (keeping only the `num` and `currency` columns). With [tab_style()]
#' (called twice), we'll selectively add style to the values formatted with
#' [fmt_number()]. We do this by using `cell_text()` in the `style` argument of
#' `tab_style()`.
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, currency) |>
#'   gt() |>
#'   fmt_number(decimals = 1) |>
#'   tab_style(
#'     style = cell_text(weight = "bold"),
#'     locations = cells_body(
#'       columns = num,
#'       rows = num >= 5000
#'     )
#'   ) |>
#'   tab_style(
#'     style = cell_text(style = "italic"),
#'     locations = cells_body(
#'       columns = currency,
#'       rows = currency < 100
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cell_text_1.png")`
#' }}
#'
#' @family helper functions
#' @section Function ID:
#' 8-25
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cell_text <- function(
    color = NULL,
    font = NULL,
    size = NULL,
    align = NULL,
    v_align = NULL,
    style = NULL,
    weight = NULL,
    stretch = NULL,
    decorate = NULL,
    transform = NULL,
    whitespace = NULL,
    indent = NULL
) {

  # Get all assigned values for the functions' arguments
  style_names <- mget(names(formals(cell_text)))

  # Filter list by only the non-NULL (e.g., assigned with
  # value) elements
  style_vals <- style_names[!vapply(style_names, is.null, logical(1))]

  # Get a vector of argument names (`style_names`) for
  # validation purposes
  style_names <- names(style_vals)

  #
  # Validate textual styles values with `validate_style_in()`
  #

  if (!inherits(align, "gt_column")) {
    validate_style_in(
      style_vals, style_names,
      arg_name = "align",
      in_vector = c("center", "left", "right", "justify")
    )
  }

  if (!inherits(v_align, "gt_column")) {
    validate_style_in(
      style_vals, style_names,
      arg_name = "v_align",
      in_vector = c("middle", "top", "bottom")
    )
  }

  if (!inherits(style, "gt_column")) {
    validate_style_in(
      style_vals, style_names,
      arg_name = "style",
      in_vector = c("normal", "italic", "oblique")
    )
  }

  if (!inherits(weight, "gt_column")) {
    validate_style_in(
      style_vals, style_names,
      arg_name = "weight",
      in_vector = c("normal", "bold", "lighter", "bolder"),
      with_pattern = "[1-9][0-9][0-9]"
    )
  }

  if (!inherits(stretch, "gt_column")) {
    validate_style_in(
      style_vals, style_names, arg_name = "stretch",
      in_vector = c(
        "ultra-condensed", "extra-condensed", "condensed", "semi-condensed",
        "normal", "semi-expanded", "expanded", "extra-expanded", "ultra-expanded"
      )
    )
  }

  if (!inherits(decorate, "gt_column")) {
    validate_style_in(
      style_vals, style_names,
      arg_name = "decorate",
      in_vector = c("overline", "line-through", "underline", "underline overline")
    )
  }

  if (!inherits(transform, "gt_column")) {
    validate_style_in(
      style_vals, style_names,
      arg_name = "transform",
      in_vector = c("uppercase", "lowercase", "capitalize")
    )
  }

  if (!inherits(whitespace, "gt_column")) {
    validate_style_in(
      style_vals = style_vals,
      style_names = style_names,
      arg_name = "whitespace",
      in_vector = c(
        "normal", "nowrap", "pre", "pre-wrap", "pre-line", "break-spaces"
      )
    )
  }

  # Transform the `color` value, if present, so that X11 color names
  # can be used in all output contexts
  if (!inherits(color, "gt_column") && "color" %in% style_names) {
    style_vals$color <- html_color(colors = color)
  }

  cell_style_structure(name = "cell_text", obj = style_vals)
}

#' @export
cell_style_to_html.cell_text <- function(style) {

  css <- unclass(style)

  css_names <-
    c(
      font = "font-family",
      size = "font-size",
      align = "text-align",
      v_align = "vertical-align",
      style = "font-style",
      weight = "font-weight",
      stretch = "font-stretch",
      decorate = "text-decoration",
      transform = "text-transform",
      whitespace = "white-space",
      indent = "text-indent"
    )

  html_names <- css_names[names(css)]
  names(css) <- ifelse(!is.na(html_names), html_names, names(css))

  css
}

# cell_fill() ------------------------------------------------------------------
#' Helper for defining custom fills for table cells
#'
#' @description
#'
#' `cell_fill()` is to be used with [tab_style()], which itself allows for the
#' setting of custom styles to one or more cells. Specifically, the call to
#' `cell_fill()` should be bound to the `styles` argument of [tab_style()].
#'
#' @param color *Cell fill color*
#'
#'   `scalar<character>` // *default:* `"#D3D3D3"`
#'
#'   If nothing is provided for `color` then `"#D3D3D3"` (light gray) will be
#'   used as a default.
#'
#' @param alpha *Transparency value*
#'
#'   `scalar<numeric|integer>(0>=val>=1)` // *default:* `NULL` (`optional`)
#'
#'   An optional alpha transparency value for the `color` as single value in the
#'   range of `0` (fully transparent) to `1` (fully opaque). If not provided the
#'   fill color will either be fully opaque or use alpha information from the
#'   color value if it is supplied in the `#RRGGBBAA` format.
#'
#' @return A list object of class `cell_styles`.
#'
#' @section Examples:
#'
#' Let's use the [`exibble`] dataset to create a simple, two-column **gt** table
#' (keeping only the `num` and `currency` columns). Styles are added with
#' [tab_style()] in two separate calls (targeting different body cells with the
#' [cells_body()] helper function). With the `cell_fill()` helper function we
#' define cells with a `"lightblue"` background in one instance, and `"gray85"`
#' in the other.
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, currency) |>
#'   gt() |>
#'   fmt_number(decimals = 1) |>
#'   tab_style(
#'     style = cell_fill(color = "lightblue"),
#'     locations = cells_body(
#'       columns = num,
#'       rows = num >= 5000
#'     )
#'   ) |>
#'   tab_style(
#'     style = cell_fill(color = "gray85"),
#'     locations = cells_body(
#'       columns = currency,
#'       rows = currency < 100
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cell_fill_1.png")`
#' }}
#'
#' @family helper functions
#' @section Function ID:
#' 8-26
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cell_fill <- function(
    color = "#D3D3D3",
    alpha = NULL
) {

  if (!inherits(color, "gt_column")) {

    validate_length_one(color, "color")

    # Normally, `alpha` should be between `0` and `1`, but to avoid breaking
    # changes, let's be permissive for now.
    check_number_decimal(
      alpha,
      allow_null = TRUE,
      allow_infinite = TRUE,
      allow_na = TRUE
    )

    # Transform the `color` value, if present, so that X11 color names
    # can be used in all output contexts
    color <- html_color(colors = color, alpha = alpha)
  }

  style_vals <- list(color = color)

  cell_style_structure("cell_fill", style_vals)
}

#' @export
cell_style_to_html.cell_fill <- function(style) {

  css <- list()
  css$`background-color` <- style$color

  css
}

# cell_borders() ---------------------------------------------------------------
#' Helper for defining custom borders for table cells
#'
#' @description
#'
#' `cell_borders()` is to be used with [tab_style()], which itself allows for
#' the setting of custom styles to one or more cells. Specifically, the call to
#' `cell_borders()` should be bound to the `styles` argument of [tab_style()].
#' The `sides` argument is where we define which borders should be modified
#' (e.g., `"left"`, `"right"`, etc.). With that selection, the `color`, `style`,
#' and `weight` of the selected borders can then be modified.
#'
#' @param sides *Border sides*
#'
#'   `vector<character>` // *default:* `"all"`
#'
#'   The border sides to be modified. Options include `"left"`, `"right"`,
#'   `"top"`, and `"bottom"`. For all borders surrounding the selected cells, we
#'   can use the `"all"` option.
#'
#' @param color *Border color*
#'
#'   `scalar<character>|NULL` // *default:* `"#000000"`
#'
#'   The border `color` can be defined with a color name or with a hexadecimal
#'   color code. The default `color` value is `"#000000"` (black). Borders for
#'   any defined `sides` can be removed by supplying `NULL` here.
#'
#' @param style *Border line style*
#'
#'   `scalar<character>|NULL` // *default:* `"solid"`
#'
#'   The border `style` can be one of either `"solid"` (the default),
#'   `"dashed"`, `"dotted"`, `"hidden"`, or `"double"`. Borders for any defined
#'   `sides` can be removed by supplying `NULL` here.
#'
#' @param weight *Border weight*
#'
#'   `scalar<character>|NULL` // *default:* `px(1)`
#'
#'   The default value for `weight` is `"1px"` and higher values will become
#'   more visually prominent. Borders for any defined `sides` can be removed by
#'   supplying `NULL` to any of `color`, `style`, or `weight`.
#'
#' @return A list object of class `cell_styles`.
#'
#' @section Examples:
#'
#' We can add horizontal border lines for all table body rows in a **gt** table
#' based on the [`exibble`] dataset. For this, we need to use [tab_style()]
#' (targeting all cells in the table body with [cells_body()]) in conjunction
#' with `cell_borders()` in the `style` argument. Both top and bottom borders
#' will be added as `"solid"` and `"red"` lines with a line width of 1.5 px.
#'
#' ```r
#' exibble |>
#'   gt() |>
#'   tab_style(
#'     style = cell_borders(
#'       sides = c("top", "bottom"),
#'       color = "red",
#'       weight = px(1.5),
#'       style = "solid"
#'     ),
#'     locations = cells_body()
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cell_borders_1.png")`
#' }}
#'
#' It's possible to incorporate different horizontal and vertical (`"left"` and
#' `"right"`) borders at several different locations. This uses multiple
#' `cell_borders()` and [cells_body()] calls within their own respective lists.
#'
#' ```r
#' exibble |>
#'   gt() |>
#'   tab_style(
#'     style = list(
#'       cell_borders(
#'         sides = c("top", "bottom"),
#'         color = "#FF0000",
#'         weight = px(2)
#'       ),
#'       cell_borders(
#'         sides = c("left", "right"),
#'         color = "#0000FF",
#'         weight = px(2)
#'       )
#'     ),
#'     locations = list(
#'       cells_body(
#'         columns = num,
#'         rows = is.na(num)
#'       ),
#'       cells_body(
#'         columns = currency,
#'         rows = is.na(currency)
#'       )
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cell_borders_2.png")`
#' }}
#'
#' @family helper functions
#' @section Function ID:
#' 8-27
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cell_borders <- function(
    sides = "all",
    color = "#000000",
    style = "solid",
    weight = px(1)
) {

  weight <- weight %||% "0"
  style <- style %||% "hidden"
  color <- color %||% "transparent"

  validate_length_one(weight, "weight")
  validate_length_one(style, "style")
  validate_length_one(color, "color")

  if (!any(sides %in% c(
    "left", "l",
    "right", "r",
    "top", "t",
    "bottom", "b",
    "all", "everything", "a"
  ))) {
    cli::cli_abort(c(
      "The `sides` vector for `cell_borders()` has to include one ",
      "or more of the following keywords (or short forms):",
      "*" = "\"left\" (or: \"l\")",
      "*" = "\"right\" (or: \"r\")",
      "*" = "\"top\" (or: \"t\")",
      "*" = "\"bottom\" (or: \"b\")",
      "*" = "\"all\" (or: \"a\", \"everything\")"
    ))
  }

  # Resolve the selection of borders into a vector of
  # standardized sides
  sides <-
    unique(
      vapply(
        sides,
        FUN.VALUE = character(1L),
        USE.NAMES = FALSE,
        FUN = resolve_border_side
      )
    )

  # Should the `all` selection appear in the
  # `sides` vector, use all possible sides
  if ("all" %in% sides) {
    sides <- c("left", "right", "top", "bottom")
  }

  style_list <-
    lapply(
      sides,
      FUN = function(side) {

        style_vals <-
          list(
            side = side,
            width = weight,
            style = style,
            color = color
          )

        validate_style_in(
          style_vals, names(style_vals), "style",
          c("solid", "dashed", "dotted", "hidden", "double"),
          call = rlang::caller_env(n = 2)
        )

        cell_style_structure(
          name = paste0("cell_border_", side),
          obj = style_vals,
          subclass =  "cell_border"
        )
      }
    )

  as_style(style = style_list)
}

#' @export
cell_style_to_html.cell_border <- function(style) {

  css <- unclass(style)

  side <- css$side

  css$side <- NULL

  names(css) <- paste0("border-", side, "-", names(css))

  css
}

cell_style_structure <- function(name, obj, subclass = name) {

  style_obj <- list()

  class(obj) <- c(subclass, "cell_style")

  style_obj[[name]] <- obj

  class(style_obj) <- "cell_styles"

  style_obj
}

# random_id() ------------------------------------------------------------------
#' Helper for creating a random `id` for a **gt** table
#'
#' @description
#'
#' `random_id()` can be used to create a random, character-based ID value
#' argument of variable length (the default is 10 letters).
#'
#' @param n *Number of letters*
#'
#'   `scalar<numeric|integer>` // *default:* `10`
#'
#'   The `n` argument defines the number of lowercase letters to use for the
#'   random ID.
#'
#' @return A character vector containing a single, random ID.
#'
#' @family helper functions
#' @section Function ID:
#' 8-28
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
random_id <- function(n = 10) {

  paste(sample(letters, n, replace = TRUE), collapse = "")
}

latex_special_chars <- c(
  "\\" = "\\textbackslash{}",
  "~" = "\\textasciitilde{}",
  "^" = "\\textasciicircum{}",
  "&" = "\\&",
  "%" = "\\%",
  "$" = "\\$",
  "#" = "\\#",
  "_" = "\\_",
  "{" = "\\{",
  "}" = "\\}"
)

latex_unicode_env <- new.env()


# escape_latex() ---------------------------------------------------------------
#' Perform LaTeX escaping
#'
#' @description
#'
#' Text may contain several characters with special meanings in LaTeX.
#' `escape_latex()` will transform a character vector so that it is safe to use
#' within LaTeX tables.
#'
#' @param text *LaTeX text*
#'
#'   `vector<character>` // **required**
#'
#'   A character vector containing the text that is to be LaTeX-escaped.
#'
#' @param unicode_conversion *Boolean*
#'
#'   `scalar<boolean>` // *default:* `TRUE`
#'
#'   A boolean value indicating whether unicode in text should be turned into
#'    LaTeX.
#'
#'
#' @return A character vector.
#'
#' @family helper functions
#' @section Function ID:
#' 8-29
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
escape_latex <- function(text, unicode_conversion = getOption("gt.latex.unicode_convert",default = FALSE)) {

  if (length(text) < 1) return(text)

  # If all text elements are `NA_character_` then return `text` unchanged
  if (all(is.na(text))) {
    return(text)
  }

  # Determine the elements of `text` that are `NA_character_`
  na_text <- is.na(text)

  m <- gregexpr("[\\\\&%$#_{}~^]", text[!na_text], perl = TRUE)

  special_chars <- regmatches(text[!na_text], m)

  escaped_chars <-
    lapply(special_chars, function(x) {
      latex_special_chars[x]
    })

  regmatches(text[!na_text], m) <- escaped_chars

  if(unicode_conversion){

    if(getRversion() > package_version("4.1.3")){

      if(is.null(latex_unicode_env$latex_unicode_chars) & !isTRUE(latex_unicode_env$latex_unicode_char_load_fail)){
          latex_unicode_env$latex_unicode_chars <- tryCatch(
            eval(str2expression(
              readLines(system.file("latex_unicode/latex_unicode_conversion.txt", package = "gt"))
            )),
            error = function(e){
              latex_unicode_env$latex_unicode_char_load_fail <- TRUE
              cli::cli_warn("A problem was encountered loading the unicode conversion data. Unicode values will not be converted into LaTeX.")
              c()
            })
      }

      m2 <- gregexpr(paste0("[",paste0(names(latex_unicode_env$latex_unicode_chars), collapse = "|"),"]"), text[!na_text], perl = TRUE)

      unicode_chars <- regmatches(text[!na_text], m2)

      latex_unicode <-
        lapply(unicode_chars, function(x) {
          new_var <- latex_unicode_env$latex_unicode_chars[x]
          if(length(new_var) > 0){
            x[!is.na(new_var)] <- new_var[!is.na(new_var)]
          }
          x
        })

      regmatches(text[!na_text], m2) <- latex_unicode
    }
  }

  text
}

# gt_latex_dependencies() ------------------------------------------------------
#' Get the LaTeX dependencies required for a **gt** table
#'
#' @description
#'
#' When working with Rnw (Sweave) files or otherwise writing LaTeX code,
#' including a **gt** table can be problematic if we don't have knowledge
#' of the LaTeX dependencies. For the most part, these dependencies are the
#' LaTeX packages that are required for rendering a **gt** table.
#' `gt_latex_dependencies()` provides an object that can be used to provide the
#' LaTeX in an Rnw file, allowing **gt** tables to work and not yield errors
#' due to missing packages.
#'
#' @details
#' Here is an example Rnw document that shows how `gt_latex_dependencies()`
#' can be used in conjunction with a **gt** table:
#'
#' \preformatted{
#' \%!sweave=knitr
#'
#' \documentclass{article}
#'
#' <<echo=FALSE>>=
#' library(gt)
#'  @
#'
#' <<results='asis', echo=FALSE>>=
#' gt_latex_dependencies()
#'  @
#'
#' \begin{document}
#'
#' <<results='asis', echo=FALSE>>=
#' gt(exibble)
#'  @
#'
#' \end{document}
#' }
#'
#' @return An object of class `knit_asis`.
#'
#' @family helper functions
#' @section Function ID:
#' 8-30
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
gt_latex_dependencies <- function() {

  check_installed("knitr", "for getting the LaTeX dependency headers.")

  knitr::asis_output(
    paste(
      "",
      "% gt packages",
      paste0("\\usepackage{", latex_packages(), "}", collapse = "\n"),
      "",
      sep = "\n"
    )
  )
}

# google_font() ----------------------------------------------------------------
#' Helper function for specifying a font from the *Google Fonts* service
#'
#' @description
#'
#' `google_font()` can be used wherever a font name should be specified. There
#' are two instances where this helper can be used: the `name` argument in
#' [opt_table_font()] (for setting a table font) and in that of [cell_text()]
#' (used with [tab_style()]). To get a helpful listing of fonts that work well
#' in tables, call [info_google_fonts()].
#'
#' @param name *Google Font name*
#'
#'   `scalar<character>` // **required**
#'
#'   The complete name of a font available in *Google Fonts*.
#'
#' @return An object of class `font_css`.
#'
#' @section Examples:
#'
#' Use the [`exibble`] dataset to create a **gt** table of two columns and eight
#' rows. We'll replace missing values with em dashes using [sub_missing()].
#' For text in the `time` column, we will use the font called `"IBM Plex Mono"`
#' which is available in Google Fonts. This is defined inside the
#' `google_font()` call, itself part of a vector that includes fonts returned by
#' [default_fonts()] (those fonts will serve as fallbacks just in case the font
#' supplied by Google Fonts is not accessible). In terms of placement, all of
#' this is given to the `font` argument of [cell_text()] which is itself given
#' to the `style` argument of [tab_style()].
#'
#' ```r
#' exibble |>
#'   dplyr::select(char, time) |>
#'   gt() |>
#'   sub_missing() |>
#'   tab_style(
#'     style = cell_text(
#'       font = c(
#'         google_font(name = "IBM Plex Mono"),
#'         default_fonts()
#'       )
#'     ),
#'     locations = cells_body(columns = time)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_google_font_1.png")`
#' }}
#'
#' We can use a subset of the [`sp500`] dataset to create a small **gt** table.
#' With [fmt_currency()], we can display a dollar sign for the first row of the
#' monetary values. Then, we'll set a larger font size for the table and opt to
#' use the `"Merriweather"` font by calling `google_font()` within
#' [opt_table_font()]. In cases where that font may not materialize, we include
#' two font fallbacks: `"Cochin"` and the catchall `"Serif"` group.
#'
#' ```r
#' sp500 |>
#'   dplyr::slice(1:10) |>
#'   dplyr::select(-volume, -adj_close) |>
#'   gt() |>
#'   fmt_currency(
#'     rows = 1,
#'     currency = "USD",
#'     use_seps = FALSE
#'   ) |>
#'   tab_options(table.font.size = px(20)) |>
#'   opt_table_font(
#'     font = list(
#'       google_font(name = "Merriweather"),
#'       "Cochin", "Serif"
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_google_font_2.png")`
#' }}
#'
#' @family helper functions
#' @section Function ID:
#' 8-31
#'
#' @section Function Introduced:
#' `v0.2.2` (August 5, 2020)
#'
#' @export
google_font <- function(name) {

  import_stmt <-
    paste_between(
      gsub(" ", "+", name, fixed = TRUE),
      c(
        "@import url('https://fonts.googleapis.com/css2?family=",
        "&display=swap');"
      )
    )

  font_list <-
    list(
      name = name,
      import_stmt = import_stmt
    )

  class(font_list) <- "font_css"
  font_list
}

# default_fonts() --------------------------------------------------------------
#' Provide a vector of sensible system fonts for use with **gt** tables
#'
#' @description
#'
#' The vector of fonts given by `default_fonts()` can be safely used with a
#' **gt** table rendered as HTML since the font stack is expected to be
#' available across a wide set of systems. We can always specify additional
#' fonts to use and place them higher in precedence order, done through
#' prepending to this vector (i.e., this font stack should be placed after that
#' to act as a set of fallbacks).
#'
#' This vector of fonts is useful when specifying `font` values inside
#' [cell_text()] (itself usable in [tab_style()] or [tab_style_body()]). If
#' using [opt_table_font()] (which also has a `font` argument), we probably
#' don't need to specify this vector of fonts since that function prepends font
#' names (this is handled by its `add` option, which is `TRUE` by default).
#'
#' @return A character vector of font names.
#'
#' @section Examples:
#'
#' Let's use the [`exibble`] dataset to create a simple, two-column **gt** table
#' (keeping only the `char` and `time` columns). Attempting to modify the fonts
#' used for the `time` column is much safer if `default_fonts()` is appended to
#' the end of the `font` listing inside `cell_text()`. What will happen, since
#' the `"Comic Sansa"` and `"Menloa"` fonts shouldn't exist, is that we'll get
#  the first available font from vector of fonts that `default_fonts()` provides.
#'
#' ```r
#' exibble |>
#'   dplyr::select(char, time) |>
#'   gt() |>
#'   tab_style(
#'     style = cell_text(
#'       font = c("Comic Sansa", "Menloa", default_fonts())
#'     ),
#'     locations = cells_body(columns = time)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_default_fonts_1.png")`
#' }}
#'
#' @family helper functions
#' @section Function ID:
#' 8-32
#'
#' @section Function Introduced:
#' `v0.2.2` (August 5, 2020)
#'
#' @export
default_fonts <- function() {
  c(
    "system-ui", "Segoe UI", "Roboto", "Helvetica", "Arial", "sans-serif",
    "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji"
  )
}

# system_fonts() ---------------------------------------------------------------
#' Get a themed font stack that works well across systems
#'
#' @description
#'
#' A font stack can be obtained from `system_fonts()` using one of various
#' keywords such as `"system-ui"`, `"old-style"`, and `"humanist"` (there are 15
#' in total) representing a themed set of fonts. These sets comprise a font
#' family that has been tested to work across a wide range of computer systems.
#' This is useful when specifying `font` values in [cell_text()]
#' (itself used inside [tab_style()]). If using [opt_table_font()], we can
#' invoke this function in its `stack` argument.
#'
#' @param name *Name of font stack*
#'
#'   `scalar<character>` // **required**
#'
#'   The name of a font stack. Must be drawn from the set of `"system-ui"`,
#'   `"transitional"`, `"old-style"`, `"humanist"`, `"geometric-humanist"`,
#'   `"classical-humanist"`, `"neo-grotesque"`, `"monospace-slab-serif"`,
#'   `"monospace-code"`, `"industrial"`, `"rounded-sans"`, `"slab-serif"`,
#'   `"antique"`, `"didone"`, and `"handwritten"`.
#'
#' @return A character vector of font names.
#'
#' @section The font stacks and the individual fonts used by platform:
#'
#' ## System UI (`"system-ui"`)
#'
#' ```css
#' font-family: system-ui, sans-serif;
#' ```
#'
#' The operating system interface's default typefaces are known as system UI
#' fonts. They contain a variety of font weights, are quite readable at small
#' sizes, and are perfect for UI elements. These typefaces serve as a great
#' starting point for text in data tables and so this font stack is the default
#' for **gt**.
#'
#' ## Transitional (`"transitional"`)
#'
#' ```css
#' font-family: Charter, 'Bitstream Charter', 'Sitka Text', Cambria, serif;
#' ```
#'
#' The Enlightenment saw the development of transitional typefaces, which
#' combine Old Style and Modern typefaces. *Times New Roman*, a transitional
#' typeface created for the Times of London newspaper, is among the most
#' well-known instances of this style.
#'
#' ## Old Style (`"old-style"`)
#'
#' ```css
#' font-family: 'Iowan Old Style', 'Palatino Linotype', 'URW Palladio L', P052, serif;
#' ```
#'
#' Old style typefaces were created during the Renaissance and are distinguished
#' by diagonal stress, a lack of contrast between thick and thin strokes, and
#' rounded serifs. *Garamond* is among the most well-known instances of an antique
#' typeface.
#'
#' ## Humanist (`"humanist"`)
#'
#' ```css
#' font-family: Seravek, 'Gill Sans Nova', Ubuntu, Calibri, 'DejaVu Sans', source-sans-pro, sans-serif;
#' ```
#'
#' Low contrast between thick and thin strokes and organic, calligraphic forms
#' are traits of humanist typefaces. These typefaces, which draw their
#' inspiration from Renaissance calligraphy, are frequently regarded as being
#' more readable and easier to read than other sans serif typefaces.
#'
#' ## Geometric Humanist (`"geometric-humanist"`)
#'
#' ```css
#' font-family: Avenir, Montserrat, Corbel, 'URW Gothic', source-sans-pro, sans-serif;
#' ```
#'
#' Clean, geometric forms and consistent stroke widths are characteristics of
#' geometric humanist typefaces. These typefaces, which are frequently used for
#' headlines and other display purposes, are frequently thought to be
#' contemporary and slick in appearance. A well-known example of this
#' classification is *Futura*.
#'
#' ## Classical Humanist (`"classical-humanist"`)
#'
#' ```css
#' font-family: Optima, Candara, 'Noto Sans', source-sans-pro, sans-serif;
#' ```
#'
#' The way the strokes gradually widen as they approach the stroke terminals
#' without ending in a serif is what distinguishes classical humanist typefaces.
#' The stone carving on Renaissance-era tombstones and classical Roman capitals
#' served as inspiration for these typefaces.
#'
#' ## Neo-Grotesque (`"neo-grotesque"`)
#'
#' ```css
#' font-family: Inter, Roboto, 'Helvetica Neue', 'Arial Nova', 'Nimbus Sans', Arial, sans-serif;
#' ```
#'
#' Neo-grotesque typefaces are a form of sans serif that originated in the late
#' 19th and early 20th centuries. They are distinguished by their crisp,
#' geometric shapes and regular stroke widths. *Helvetica* is among the most
#' well-known examples of a Neo-grotesque typeface.
#'
#' ## Monospace Slab Serif (`"monospace-slab-serif"`)
#'
#' ```css
#' font-family: 'Nimbus Mono PS', 'Courier New', monospace;
#' ```
#'
#' Monospace slab serif typefaces are distinguished by their fixed-width
#' letters, which are the same width irrespective of their shape, and their
#' straightforward, geometric forms. For reports, tabular work, and technical
#' documentation, this technique is used to simulate typewriter output.
#'
#' ## Monospace Code (`"monospace-code"`)
#'
#' ```css
#' font-family: ui-monospace, 'Cascadia Code', 'Source Code Pro', Menlo, Consolas, 'DejaVu Sans Mono', monospace;
#' ```
#'
#' Specifically created for use in programming and other technical applications,
#' monospace code typefaces are used in these fields. These typefaces are
#' distinguished by their clear, readable forms and monospaced design, which
#' ensures that all letters and characters are the same width.
#'
#' ## Industrial (`"industrial"`)
#'
#' ```css
#' font-family: Bahnschrift, 'DIN Alternate', 'Franklin Gothic Medium', 'Nimbus Sans Narrow', sans-serif-condensed, sans-serif;
#' ```
#'
#' The development of industrial typefaces began in the late 19th century and
#' was greatly influenced by the industrial and technological advancements of
#' the time. Industrial typefaces are distinguished by their strong sans serif
#' letterforms, straightforward appearance, and use of geometric shapes and
#' straight lines.
#'
#' ## Rounded Sans (`"rounded-sans"`)
#'
#' ```css
#' font-family: ui-rounded, 'Hiragino Maru Gothic ProN', Quicksand, Comfortaa, Manjari, 'Arial Rounded MT', 'Arial Rounded MT Bold', Calibri, source-sans-pro, sans-serif;
#' ```
#'
#' The rounded, curved letterforms that define rounded typefaces give them a
#' softer, friendlier appearance. The typeface's rounded edges give it a more
#' natural and playful feel, making it appropriate for use in casual or
#' kid-friendly designs. Since the 1950s, the rounded sans-serif design has
#' gained popularity and is still frequently used in branding, graphic design,
#' and other fields.
#'
#' ## Slab Serif (`"slab-serif"`)
#'
#' ```css
#' font-family: Rockwell, 'Rockwell Nova', 'Roboto Slab', 'DejaVu Serif', 'Sitka Small', serif;
#' ```
#'
#' Slab Serif typefaces are distinguished by the thick, block-like serifs that
#' appear at the ends of each letterform. Typically, these serifs are
#' unbracketed, which means that they do not have any curved or tapered
#' transitions to the letter's main stroke.
#'
#' ## Antique (`"antique"`)
#'
#' ```css
#' font-family: Superclarendon, 'Bookman Old Style', 'URW Bookman', 'URW Bookman L', 'Georgia Pro', Georgia, serif;
#' ```
#'
#' Serif typefaces that were popular in the 19th century include antique
#' typefaces, also referred to as Egyptians. They are distinguished by their
#' thick, uniform stroke weight and block-like serifs.
#'
#' ## Didone (`"didone"`)
#'
#' ```css
#' font-family: Didot, 'Bodoni MT', 'Noto Serif Display', 'URW Palladio L', P052, Sylfaen, serif;
#' ```
#'
#' Didone typefaces, also referred to as Modern typefaces, are distinguished by
#' their vertical stress, sharp contrast between thick and thin strokes, and
#' hairline serifs without bracketing. The Didone style first appeared in the
#' late 18th century and became well-known in the early 19th century.
#'
#' ## Handwritten (`"handwritten"`)
#'
#' ```css
#' font-family: 'Segoe Print', 'Bradley Hand', Chilanka, TSCu_Comic, casual, cursive;
#' ```
#'
#' The appearance and feel of handwriting are replicated by handwritten
#' typefaces. Although there are a wide variety of handwriting styles, this font
#' stack tends to use a more casual and commonplace style.
#'
#' @section Examples:
#'
#' Use a subset of the [`sp500`] dataset to create a **gt** table with 10 rows.
#' For the `date` column and the column labels, let's use a different font stack
#' (the `"industrial"` one). The system fonts used in this particular stack are
#' `"Bahnschrift"`, `"DIN Alternate"`, `"Franklin Gothic Medium"`, and
#' `"Nimbus Sans Narrow"` (the generic `"sans-serif-condensed"` and `"sans-serif"`
#' are used if the aforementioned fonts aren't available).
#'
#' ```r
#' sp500 |>
#'   dplyr::slice(1:10) |>
#'   dplyr::select(-volume, -adj_close) |>
#'   gt() |>
#'   fmt_currency() |>
#'   tab_style(
#'     style = cell_text(
#'       font = system_fonts(name = "industrial"),
#'       size = px(18)
#'     ),
#'     locations = list(
#'       cells_body(columns = date),
#'       cells_column_labels()
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_system_fonts_1.png")`
#' }}
#'
#' @family helper functions
#' @section Function ID:
#' 8-33
#'
#' @section Function Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
#' @export
system_fonts <- function(name) {
  get_font_stack(name = name, add_emoji = TRUE)
}
