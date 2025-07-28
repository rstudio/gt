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
#' @family helper functions
#' @section Function ID:
#' 8-10
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @export
stub <- function() {
  x <- "::stub::"
  class(x) <- "stub_column"
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
#'   [everything()] results in all rows in `columns` being formatted.
#'   Alternatively, we can supply a vector of row IDs within `c()`, a vector of
#'   row indices, or a select helper function (e.g. [starts_with()],
#'   [ends_with()], [contains()], [matches()], [num_range()], and
#'   [everything()]). We can also use expressions to filter down to the rows we
#'   need (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @return A list object with the classes `cells_stub` and `location_cells`.
#'
#' @section Examples:
#'
#' Using a transformed version of the [`sza`] dataset, let's create a **gt**
#' table. Color all of the `month` values in the table stub with [tab_style()],
#' using `cells_stub()` in `locations`.
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
#' @family location helper functions
#' @section Function ID:
#' 8-17
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cells_stub <- function(rows = everything()) {

  # Capture expression for the `rows` argument
  rows_expr <- rlang::enquo(rows)

  # Create the `cells` object
  cells <- list(rows = rows_expr)

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

## Copied from https://github.com/phfaist/pylatexenc/blob/6dc2ce7fcd89b7cd1536c79c800f49f09535f5e9/pylatexenc/latexencode/_uni2latexmap.py
latex_unicode_chars <- c(
    "\U00A1"='\\textexclamdown',                      # character ¡",
    "\U00A2"='\\textcent',                            # character ¢",
    "\U00A3"='\\textsterling',                        # character £",
    "\U00A4"='\\textcurrency',                        # character ¤",
    "\U00A5"='\\textyen',                             # character ¥",
    "\U00A6"='\\textbrokenbar',                       # character ¦",
    "\U00A7"='\\textsection',                         # character §",
    "\U00A8"='\\textasciidieresis',                   # character ¨",
    "\U00A9"='\\textcopyright',                       # character ©",
    "\U00AA"='\\textordfeminine',                     # character ª",
    "\U00AB"='\\guillemotleft',                       # character «",
    "\U00AC"='\\textlnot',                            # character ¬",
    "\U00AE"='\\textregistered',                      # character ®",
    "\U00AF"='\\textasciimacron',                     # character ¯",
    "\U00B0"='\\textdegree',                          # character °",
    "\U00B1"='\\ensuremath{\\pm}',                     # character ±",
    "\U00B2"='\\texttwosuperior',                     # character ²",
    "\U00B3"='\\textthreesuperior',                   # character ³",
    "\U00B4"='\\textasciiacute',                      # character ´",
    "\U00B5"='\\textmu',                              # character µ",
    "\U00B6"='\\textparagraph',                       # character ¶",
    "\U00B7"='\\textperiodcentered',                  # character ·",
    "\U00B9"='\\textonesuperior',                     # character ¹",
    "\U00BA"='\\textordmasculine',                    # character º",
    "\U00BB"='\\guillemotright',                      # character »",
    "\U00BC"='\\textonequarter',                      # character ¼",
    "\U00BD"='\\textonehalf',                         # character ½",
    "\U00BE"='\\textthreequarters',                   # character ¾",
    "\U00BF"='\\textquestiondown',                    # character ¿",
    "\U00C0"='\\\\`A',                                  # character �\u0080",
    "\U00C1"="\\'A",                                  # character �\u0081",
    "\U00C2"='\\^A',                                  # character �\u0082",
    "\U00C3"='\\~A',                                  # character �\u0083",
    "\U00C4"='\\\"A',                                  # character �\u0084",
    "\U00C5"='\\r{A}',                                # character �\u0085",
    "\U00C6"='\\AE',                                  # character �\u0086",
    "\U00C7"='\\c{C}',                                # character �\u0087",
    "\U00C8"='\\`E',                                  # character �\u0088",
    "\U00C9"="\\\\'E",                                  # character �\u0089",
    "\U00CA"='\\^E',                                  # character �\u008a",
    "\U00CB"='\\\"E',                                  # character �\u008b",
    "\U00CC"='\\`I',                                  # character �\u008c",
    "\U00CD"="\\\\'I",                                  # character �\u008d",
    "\U00CE"='\\^I',                                  # character �\u008e",
    "\U00CF"='\\\"I',                                  # character �\u008f",
    "\U00D0"='\\DH',                                  # character �\u0090",
    "\U00D1"='\\~N',                                  # character �\u0091",
    "\U00D2"='\\`O',                                  # character �\u0092",
    "\U00D3"="\\\\'O",                                  # character �\u0093",
    "\U00D4"='\\^O',                                  # character �\u0094",
    "\U00D5"='\\~O',                                  # character �\u0095",
    "\U00D6"='\\\"O',                                  # character �\u0096",
    "\U00D7"='\\texttimes',                           # character �\u0097",
    "\U00D8"='\\O',                                   # character �\u0098",
    "\U00D9"='\\`U',                                  # character �\u0099",
    "\U00DA"="\\\\'U",                                  # character �\u009a",
    "\U00DB"='\\^U',                                  # character �\u009b",
    "\U00DC"='\\\"U',                                  # character �\u009c",
    "\U00DD"="\\\\'Y",                                  # character �\u009d",
    "\U00DE"='\\TH',                                  # character �\u009e",
    "\U00DF"='\\ss',                                  # character �\u009f",
    "\U00E0"='\\`a',                                  # character à",
    "\U00E1"="\\\\'a",                                  # character á",
    "\U00E2"='\\^a',                                  # character â",
    "\U00E3"='\\~a',                                  # character ã",
    "\U00E4"='\\\"a',                                  # character ä",
    "\U00E5"='\\r{a}',                                # character å",
    "\U00E6"='\\ae',                                  # character æ",
    "\U00E7"='\\c{c}',                                # character ç",
    "\U00E8"='\\`e',                                  # character è",
    "\U00E9"="\\\\'e",                                  # character é",
    "\U00EA"='\\^e',                                  # character ê",
    "\U00EB"='\\\"e',                                  # character ë",
    "\U00EC"='\\`i',                                  # character ì",
    "\U00ED"="\\\\'i",                                  # character í",
    "\U00EE"='\\^i',                                  # character î",
    "\U00EF"='\\\"i',                                  # character ï",
    "\U00F0"='\\dh',                                  # character ð",
    "\U00F1"='\\~n',                                  # character ñ",
    "\U00F2"='\\`o',                                  # character ò",
    "\U00F3"="\\\\'o",                                  # character ó",
    "\U00F4"='\\^o',                                  # character ô",
    "\U00F5"='\\~o',                                  # character õ",
    "\U00F6"='\\\"o',                                  # character ö",
    "\U00F7"='\\textdiv',                             # character ÷",
    "\U00F8"='\\o',                                   # character ø",
    "\U00F9"='\\`u',                                  # character ù",
    "\U00FA"="\\\\'u",                                  # character ú",
    "\U00FB"='\\^u',                                  # character û",
    "\U00FC"='\\\"u',                                  # character ü",
    "\U00FD:"="\\\\'y",                                  # character ý",
    "\U00FE"='\\th',                                  # character þ",
    "\U00FF"='\\\"y',                                  # character ÿ",
    "\U0100"='\\={A}',
    "\U0101"='\\={a}',
    "\U0102"='\\u{A}',
    "\U0103"='\\u{a}',
    "\U0104"='\\k{A}',
    "\U0105"='\\k{a}',
    "\U0106: \"\\\\'C\"",
    "\U0107: \"\\\\'c\"",
    "\U0108"='\\^{C}',
    "\U0109"='\\^{c}',
    "\U010A"='\\.{C}',
    "\U010B"='\\.{c}',
    "\U010C"='\\v{C}',
    "\U010D"='\\v{c}',
    "\U010E"='\\v{D}',
    "\U010F"='\\v{d}',
    "\U0110"='\\DJ',
    "\U0111"='\\dj',
    "\U0112"='\\={E}',
    "\U0113"='\\={e}',
    "\U0114"='\\u{E}',
    "\U0115"='\\u{e}',
    "\U0116"='\\.{E}',
    "\U0117"='\\.{e}',
    "\U0118"='\\k{E}',
    "\U0119"='\\k{e}',
    "\U011A"='\\v{E}',
    "\U011B"='\\v{e}',
    "\U011C"='\\^{G}',
    "\U011D"='\\^{g}',
    "\U011E"='\\u{G}',
    "\U011F"='\\u{g}',
    "\U0120"='\\.{G}',
    "\U0121"='\\.{g}',
    "\U0122"='\\c{G}',
    "\U0123"='\\c{g}',
    "\U0124"='\\^{H}',
    "\U0125"='\\^{h}',
    "\U0126"='\\={H}',
    "\U0127"='\\={h}',
    "\U0128"='\\~{I}',
    "\U0129"='\\~{i}',
    "\U012A"='\\={I}',
    "\U012B"='\\={i}',
    "\U012C"='\\u{I}',
    "\U012D"='\\u{i}',
    "\U012E"='\\k{I}',
    "\U012F"='\\k{i}',
    "\U0130"='\\.I',
    "\U0131"='\\i',
    "\U0132"='\\IJ',
    "\U0133"='\\ij',
    "\U0134"='\\^{J}',
    "\U0135"='\\^{j}',
    "\U0136"='\\c{K}',
    "\U0137"='\\c{k}',
    "\U0138"='\\textsc{k}',
    "\U0139"="\\\\'L",
    "\U013A"="\\\\'l",
    "\U013B"='\\c{L}',
    "\U013C"='\\c{l}',
    "\U013D"='\\v{L}',
    "\U013E"='\\v{l}',
    "\U013F"='\\.{L}',
    "\U0140"='\\.{l}',
    "\U0141"='\\L',
    "\U0142"='\\l',
    "\U0143"="\\\\'N\"",
    "\U0144"="\\\\'n\"",
    "\U0145"='\\c{N}',
    "\U0146"='\\c{n}',
    "\U0147"='\\v{N}',
    "\U0148"='\\v{n}',
    "\U0149"='\\nument{149}',
    "\U014A"='\\NG',
    "\U014B"='\\ng',
    "\U014C"='\\={O}',
    "\U014D"='\\={o}',
    "\U014E"='\\u{O}',
    "\U014F"='\\u{o}',
    "\U0150"='\\H{O}',
    "\U0151"='\\H{o}',
    "\U0152"='\\OE',
    "\U0153"='\\oe',
    "\U0154"="\\\\'R",
    "\U0155"="\\\\'r",
    "\U0156"='\\c{R}',
    "\U0157"='\\c{r}',
    "\U0158"='\\v{R}',
    "\U0159"='\\v{r}',
    "\U015A"="\\\\'S",
    "\U015B"="\\\\'s",
    "\U015C"='\\^{S}',
    "\U015D"='\\^{s}',
    "\U015E"='\\c{S}',
    "\U015F"='\\c{s}',
    "\U0160"='\\v{S}',
    "\U0161"='\\v{s}',
    "\U0162"='\\c{T}',
    "\U0163"='\\c{t}',
    "\U0164"='\\v{T}',
    "\U0165"='\\v{t}',
    "\U0166"='\\={T}',
    "\U0167"='\\={t}',
    "\U0168"='\\~{U}',
    "\U0169"='\\~{u}',
    "\U016A"='\\={U}',
    "\U016B"='\\={u}',
    "\U016C"='\\u{U}',
    "\U016D"='\\u{u}',
    "\U016E"='\\r{U}',
    "\U016F"='\\r{u}',
    "\U0170"="\\\\'{U}",
    "\U0171"="\\\\'{u}",
    "\U0172"='\\k{U}',
    "\U0173"='\\k{u}',
    "\U0174"='\\^{W}',
    "\U0175"='\\^{w}',
    "\U0176"='\\^{Y}',
    "\U0177"='\\^{y}',
    "\U0178"='\\\"Y',
    "\U0179"="\\\\'Z",
    "\U017A"="\\\\'z",
    "\U017B"='\\.Z',
    "\U017C"='\\.z',
    "\U017D"='\\v{Z}',
    "\U017E"='\\v{z}',
    "\U0192"='\\textflorin',                          # 0x0192",
    "\U0195"='\\texthvlig',                           # LATIN SMALL LETTER HV [�\u0095]",
    "\U019E"='\\textnrleg',                           # LATIN SMALL LETTER N WITH LONG RIGHT LEG [�\u009e]",
    "\U01E7"='\\v{g}',                                # character ǧ",
    "\U01F5"="\\'{g}",                                # LATIN SMALL LETTER G WITH ACUTE [ǵ]",

    "\U0228"='\\c{E}',
    "\U0229"='\\c{e}',

    "\U0259"='\\textschwa',
    "\U025B"='\\varepsilon',                           # LATIN SMALL LETTER OPEN E [�\u009b]",
    "\U0278"='\\textphi',                              # LATIN SMALL LETTER PHI [ɸ]",
    "\U0294"='\\textglotstop',
    "\U029E"='\\textturnk',                            # LATIN SMALL LETTER TURNED K [�\u009e]",
    "\U02B7"='\\textsuperscript{w}',

    "\U02C6"='\\textasciicircum',                     # 0x02C6",
    "\U02C7"='\\textasciicaron',
    "\U02D8"='\\textasciibreve',
    "\U02D9"='\\textperiodcentered',                   # DOT ABOVE [�\u0099]",
    "\U02DA"='\\r{}',                                  # RING ABOVE [�\u009a]",
    "\U02DB"='\\k{}',                                  # OGONEK [�\u009b]",
    "\U02DC"='\\textasciitilde',
    "\U02DD"='\\textacutedbl',                        # 0x02DD",

    "\U0307"='\\ensuremath{\\dot{}}',
    "\U0308"='\\ensuremath{\\ddot{}}',

    "\U0386"="\\\\'{}A",                                 # GREEK CAPITAL LETTER ALPHA WITH TONOS [�\u0086]",
    "\U0388"="\\\\'{}E",                                 # GREEK CAPITAL LETTER EPSILON WITH TONOS [�\u0088]",
    "\U0389"="\\\\'{}H",                                 # GREEK CAPITAL LETTER ETA WITH TONOS [�\u0089]",
    "\U038A"="\\\\'{}I",                               # GREEK CAPITAL LETTER IOTA WITH TONOS [�\u008a]",
    "\U038C"="\\\\'{}O",                                 # GREEK CAPITAL LETTER OMICRON WITH TONOS [�\u008c]",
    "\U038E"="\\\\'{}Y",                                 # GREEK CAPITAL LETTER UPSILON WITH TONOS [�\u008e]",
    "\U038F"="\\\\'{}\\\\ensuremath{\\\\Omega}",             # GREEK CAPITAL LETTER OMEGA WITH TONOS [�\u008f]",
    "\U0390"='\\acute{\\ddot{\\iota}}',                  # GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS [�\u0090]",
    "\U0391"='A',                                    # GREEK CAPITAL LETTER ALPHA",
    "\U0392"='B',                                    # GREEK CAPITAL LETTER BETA",
    "\U0393"='\\ensuremath{\\Gamma}',                  # GREEK CAPITAL LETTER GAMMA",
    "\U0394"='\\ensuremath{\\Delta}',                  # ...",
    # "\U0395"='E',
    # "\U0396"='Z',
    # "\U0397"='H',
    "\U0398"='\\ensuremath{\\Theta}',
    # "\U0399"='I',
    # "\U039A"='K',
    "\U039B"='\\ensuremath{\\Lambda}',
    # "\U039C"='M',
    # "\U039D"='N',
    "\U039E"='\\ensuremath{\\Xi}',
    # "\U039F"='O',
    "\U03A0"='\\ensuremath{\\Pi}',
    # "\U03A1"='P',
    "\U03A3"='\\ensuremath{\\Sigma}',
    # "\U03A4"='T',
    "\U03A5"='\\ensuremath{\\Upsilon}',
    "\U03A6"='\\ensuremath{\\Phi}',
    # "\U03A7"='X',
    "\U03A8"='\\ensuremath{\\Psi}',
    "\U03A9"='\\ensuremath{\\Omega}',

    "\U03AA"='\\ensuremath{\\ddot{I}}',                 # GREEK CAPITAL LETTER IOTA WITH DIALYTIKA [Ϊ]",
    "\U03AB"='\\ensuremath{\\ddot{Y}}',                 # GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA [Ϋ]",
    "\U03AC"="\\ensuremath{\\acute\\alpha}",             # GREEK SMALL LETTER ALPHA WITH TONOS [ά]",
    "\U03AD"="\\ensuremath{\\acute\\epsilon}",           # GREEK SMALL LETTER EPSILON WITH TONOS [έ]",
    "\U03AE"="\\ensuremath{\\acute\\eta}",               # GREEK SMALL LETTER ETA WITH TONOS [ή]",
    "\U03AF"="\\ensuremath{\\acute\\iota}",              # GREEK SMALL LETTER IOTA WITH TONOS [ί]",
    "\U03B0"='\\ensuremath{\\acute{\\ddot{\\upsilon}}}',  # GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS [ΰ]",
    "\U03CA"='\\ensuremath{\\ddot\\iota}',               # GREEK SMALL LETTER IOTA WITH DIALYTIKA [�\u008a]",
    "\U03CB"='\\ensuremath{\\ddot{\\upsilon}}',          # GREEK SMALL LETTER UPSILON WITH DIALYTIKA [�\u008b]",
    "\U03CC"="\\'{o}",                                 # GREEK SMALL LETTER OMICRON WITH TONOS [�\u008c]",
    "\U03CD"="\\ensuremath{\\acute\\upsilon}",           # GREEK SMALL LETTER UPSILON WITH TONOS [�\u008d]",
    "\U03CE"="\\ensuremath{\\acute\\omega}",             # GREEK SMALL LETTER OMEGA WITH TONOS [�\u008e]",

    "\U0251"='\\ensuremath{\\alpha}',                  # Greek Small Letter Alpha",
    "\U03B1"='\\ensuremath{\\alpha}',                  # Greek Small Letter Alpha",
    "\U03B2"='\\ensuremath{\\beta}',
    "\U03B3"='\\ensuremath{\\gamma}',
    "\U03B4"='\\ensuremath{\\delta}',
    "\U03B5"='\\ensuremath{\\varepsilon}',
    "\U03B6"='\\ensuremath{\\zeta}',
    "\U03B7"='\\ensuremath{\\eta}',
    "\U03B8"='\\ensuremath{\\theta}',
    "\U03B9"='\\ensuremath{\\iota}',
    "\U03BA"='\\ensuremath{\\kappa}',
    "\U03BB"='\\ensuremath{\\lambda}',
    "\U03BC"='\\ensuremath{\\mu}',
    "\U03BD"='\\ensuremath{\\nu}',
    "\U03BE"='\\ensuremath{\\xi}',
    "\U03BF"='o',
    "\U03C0"='\\ensuremath{\\pi}',
    "\U03C1"='\\ensuremath{\\rho}',
    "\U03C2"='\\ensuremath{\\varsigma}',
    "\U03C3"='\\ensuremath{\\sigma}',
    "\U03C4"='\\ensuremath{\\tau}',
    "\U03C5"='\\ensuremath{\\upsilon}',
    "\U03C6"='\\ensuremath{\\varphi}',
    "\U03C7"='\\ensuremath{\\chi}',
    "\U03C8"='\\ensuremath{\\psi}',
    "\U03C9"='\\ensuremath{\\omega}',

    "\U03D1"='\\ensuremath{\\vartheta}',                # GREEK THETA SYMBOL [�\u0091]",
    "\U03D2"='\\Upsilon',                              # GREEK UPSILON WITH HOOK SYMBOL [�\u0092]",
    "\U03D5"='\\ensuremath{\\phi}',                     # GREEK PHI SYMBOL [�\u0095]",
    "\U03D6"='\\ensuremath{\\varpi}',                   # GREEK PI SYMBOL [�\u0096]",
    "\U03F0"='\\ensuremath{\\varkappa}',                # GREEK KAPPA SYMBOL [ϰ]",
    "\U03F1"='\\ensuremath{\\varrho}',                  # GREEK RHO SYMBOL [ϱ]",
    "\U03F5"='\\ensuremath{\\epsilon}',                 # GREEK LUNATE EPSILON SYMBOL [ϵ]",
    "\U03F6"='\\ensuremath{\\backepsilon}',             # GREEK REVERSED LUNATE EPSILON SYMBOL [϶]",

    "\U0400"='\\`\\CYRE',                              # 0x0400",
    "\U0401"='\\CYRYO',
    "\U0402"='\\CYRDJE',
    "\U0403"='\\`\\CYRG',
    "\U0404"='\\CYRIE',
    "\U0405"='\\CYRDZE',
    "\U0406"='\\CYRII',
    "\U0407"='\\CYRYI',
    "\U0408"='\\CYRJE',
    "\U0409"='\\CYRLJE',
    "\U040A"='\\CYRNJE',
    "\U040B"='\\CYRTSHE',
    "\U040C"='\\`\\CYRK',
    "\U040D"='\\`\\CYRI',
    "\U040E"='\\CYRUSHRT',
    "\U040F"='\\CYRDZHE',
    "\U0410"='\\CYRA',
    "\U0411"='\\CYRB',
    "\U0412"='\\CYRV',
    "\U0413"='\\CYRG',
    "\U0414"='\\CYRD',
    "\U0415"='\\CYRE',
    "\U0416"='\\CYRZH',
    "\U0417"='\\CYRZ',
    "\U0418"='\\CYRI',
    "\U0419"='\\CYRISHRT',
    "\U041A"='\\CYRK',
    "\U041B"='\\CYRL',
    "\U041C"='\\CYRM',
    "\U041D"='\\CYRN',
    "\U041E"='\\CYRO',
    "\U041F"='\\CYRP',
    "\U0420"='\\CYRR',
    "\U0421"='\\CYRS',
    "\U0422"='\\CYRT',
    "\U0423"='\\CYRU',
    "\U0424"='\\CYRF',
    "\U0425"='\\CYRH',
    "\U0426"='\\CYRC',
    "\U0427"='\\CYRCH',
    "\U0428"='\\CYRSH',
    "\U0429"='\\CYRSHCH',
    "\U042A"='\\CYRHRDSN',
    "\U042B"='\\CYRERY',
    "\U042C"='\\CYRSFTSN',
    "\U042D"='\\CYREREV',
    "\U042E"='\\CYRYU',
    "\U042F"='\\CYRYA',
    "\U0430"='\\cyra',
    "\U0431"='\\cyrb',
    "\U0432"='\\cyrv',
    "\U0433"='\\cyrg',
    "\U0434"='\\cyrd',
    "\U0435"='\\cyre',
    "\U0436"='\\cyrzh',
    "\U0437"='\\cyrz',
    "\U0438"='\\cyri',
    "\U0439"='\\cyrishrt',
    "\U043A"='\\cyrk',
    "\U043B"='\\cyrl',
    "\U043C"='\\cyrm',
    "\U043D"='\\cyrn',
    "\U043E"='\\cyro',
    "\U043F"='\\cyrp',
    "\U0440"='\\cyrr',
    "\U0441"='\\cyrs',
    "\U0442"='\\cyrt',
    "\U0443"='\\cyru',
    "\U0444"='\\cyrf',
    "\U0445"='\\cyrh',
    "\U0446"='\\cyrc',
    "\U0447"='\\cyrch',
    "\U0448"='\\cyrsh',
    "\U0449"='\\cyrshch',
    "\U044A"='\\cyrhrdsn',
    "\U044B"='\\cyrery',
    "\U044C"='\\cyrsftsn',
    "\U044D"='\\cyrerev',
    "\U044E"='\\cyryu',
    "\U044F"='\\cyrya',
    "\U0450"='\\`\\cyre',
    "\U0451"='\\cyryo',
    "\U0452"='\\cyrdje',
    "\U0453"='\\`\\cyrg',
    "\U0454"='\\cyrie',
    "\U0455"='\\cyrdze',
    "\U0456"='\\cyrii',
    "\U0457"='\\cyryi',
    "\U0458"='\\cyrje',
    "\U0459"='\\cyrlje',
    "\U045A"='\\cyrnje',
    "\U045B"='\\cyrtshe',
    "\U045C"='\\`\\cyrk',
    "\U045D"='\\`\\cyri',
    "\U045E"='\\cyrushrt',
    "\U045F"='\\cyrdzhe',
    "\U0460"='\\cyrchar\\CYROMEGA',                     # CYRILLIC CAPITAL LETTER OMEGA [Ѡ]",
    "\U0461"='\\cyrchar\\cyromega',                     # CYRILLIC SMALL LETTER OMEGA [ѡ]",
    "\U0462"='\\CYRYAT',
    "\U0463"='\\cyryat',
    "\U0464"='\\cyrchar\\CYRIOTE',                      # CYRILLIC CAPITAL LETTER IOTIFIED E [Ѥ]",
    "\U0465"='\\cyrchar\\cyriote',                      # CYRILLIC SMALL LETTER IOTIFIED E [ѥ]",
    "\U0466"='\\cyrchar\\CYRLYUS',                      # CYRILLIC CAPITAL LETTER LITTLE YUS [Ѧ]",
    "\U0467"='\\cyrchar\\cyrlyus',                      # CYRILLIC SMALL LETTER LITTLE YUS [ѧ]",
    "\U0468"='\\cyrchar\\CYRIOTLYUS',                   # CYRILLIC CAPITAL LETTER IOTIFIED LITTLE YUS [Ѩ]",
    "\U0469"='\\cyrchar\\cyriotlyus',                   # CYRILLIC SMALL LETTER IOTIFIED LITTLE YUS [ѩ]",
    "\U046A"='\\CYRBYUS',
    "\U046B"='\\cyrbyus',
    "\U046C"='\\cyrchar\\CYRIOTBYUS',                   # CYRILLIC CAPITAL LETTER IOTIFIED BIG YUS [Ѭ]",
    "\U046D"='\\cyrchar\\cyriotbyus',                   # CYRILLIC SMALL LETTER IOTIFIED BIG YUS [ѭ]",
    "\U046E"='\\cyrchar\\CYRKSI',                       # CYRILLIC CAPITAL LETTER KSI [Ѯ]",
    "\U046F"='\\cyrchar\\cyrksi',                       # CYRILLIC SMALL LETTER KSI [ѯ]",
    "\U0470"='\\cyrchar\\CYRPSI',                       # CYRILLIC CAPITAL LETTER PSI [Ѱ]",
    "\U0471"='\\cyrchar\\cyrpsi',                       # CYRILLIC SMALL LETTER PSI [ѱ]",
    "\U0472"='\\CYRFITA',
    "\U0473"='\\cyrfita',
    "\U0474"='\\CYRIZH',
    "\U0475"='\\cyrizh',
    "\U0476"='\\C\\CYRIZH',
    "\U0477"='\\C\\cyrizh',
    "\U0478"='\\cyrchar\\CYRUK',                        # CYRILLIC CAPITAL LETTER UK [Ѹ]",
    "\U0479"='\\cyrchar\\cyruk',                        # CYRILLIC SMALL LETTER UK [ѹ]",
    "\U047A"='\\cyrchar\\CYROMEGARND',                  # CYRILLIC CAPITAL LETTER ROUND OMEGA [Ѻ]",
    "\U047B"='\\cyrchar\\cyromegarnd',                  # CYRILLIC SMALL LETTER ROUND OMEGA [ѻ]",
    "\U047C"='\\cyrchar\\CYROMEGATITLO',                # CYRILLIC CAPITAL LETTER OMEGA WITH TITLO [Ѽ]",
    "\U047D"='\\cyrchar\\cyromegatitlo',                # CYRILLIC SMALL LETTER OMEGA WITH TITLO [ѽ]",
    "\U047E"='\\cyrchar\\CYROT',                        # CYRILLIC CAPITAL LETTER OT [Ѿ]",
    "\U047F"='\\cyrchar\\cyrot',                        # CYRILLIC SMALL LETTER OT [ѿ]",
    "\U0480"='\\cyrchar\\CYRKOPPA',                     # CYRILLIC CAPITAL LETTER KOPPA [�\u0080]",
    "\U0481"='\\cyrchar\\cyrkoppa',                     # CYRILLIC SMALL LETTER KOPPA [�\u0081]",
    "\U0482"='\\cyrchar\\cyrthousands',                 # CYRILLIC THOUSANDS SIGN [�\u0082]",
    "\U0488"='\\cyrchar\\cyrhundredthousands',          # COMBINING CYRILLIC HUNDRED THOUSANDS SIGN [�\u0088]",
    "\U0489"='\\cyrchar\\cyrmillions',                  # COMBINING CYRILLIC MILLIONS SIGN [�\u0089]",
    "\U048C"='\\CYRSEMISFTSN',
    "\U048D"='\\cyrsemisftsn',
    "\U048E"='\\CYRRTICK',
    "\U048F"='\\cyrrtick',
    "\U0490"='\\CYRGUP',
    "\U0491"='\\cyrgup',
    "\U0492"='\\CYRGHCRS',
    "\U0493"='\\cyrghcrs',
    "\U0494"='\\CYRGHK',
    "\U0495"='\\cyrghk',
    "\U0496"='\\CYRZHDSC',
    "\U0497"='\\cyrzhdsc',
    "\U0498"='\\CYRZDSC',
    "\U0499"='\\cyrzdsc',
    "\U049A"='\\CYRKDSC',
    "\U049B"='\\cyrkdsc',
    "\U049C"='\\CYRKVCRS',
    "\U049D"='\\cyrkvcrs',
    "\U049E"='\\CYRKHCRS',
    "\U049F"='\\cyrkhcrs',
    "\U04A0"='\\CYRKBEAK',
    "\U04A1"='\\cyrkbeak',
    "\U04A2"='\\CYRNDSC',
    "\U04A3"='\\cyrndsc',
    "\U04A4"='\\CYRNG',
    "\U04A5"='\\cyrng',
    "\U04A6"='\\CYRPHK',
    "\U04A7"='\\cyrphk',
    "\U04A8"='\\CYRABHHA',
    "\U04A9"='\\cyrabhha',
    "\U04AA"='\\CYRSDSC',
    "\U04AB"='\\cyrsdsc',
    "\U04AC"='\\CYRTDSC',
    "\U04AD"='\\cyrtdsc',
    "\U04AE"='\\CYRY',
    "\U04AF"='\\cyry',
    "\U04B0"='\\CYRYHCRS',
    "\U04B1"='\\cyryhcrs',
    "\U04B2"='\\CYRHDSC',
    "\U04B3"='\\cyrhdsc',
    "\U04B4"='\\CYRTETSE',
    "\U04B5"='\\cyrtetse',
    "\U04B6"='\\CYRCHRDSC',
    "\U04B7"='\\cyrchrdsc',
    "\U04B8"='\\CYRCHVCRS',
    "\U04B9"='\\cyrchvcrs',
    "\U04BA"='\\CYRSHHA',
    "\U04BB"='\\cyrshha',
    "\U04BC"='\\CYRABHCH',
    "\U04BD"='\\cyrabhch',
    "\U04BE"='\\CYRABHCHDSC',
    "\U04BF"='\\cyrabhchdsc',
    "\U04C0"='\\CYRpalochka',
    "\U04C1"='\\U\\CYRZH',
    "\U04C2"='\\U\\cyrzh',
    "\U04C3"='\\CYRKHK',
    "\U04C4"='\\cyrkhk',
    "\U04C5"='\\CYRLDSC',
    "\U04C6"='\\cyrldsc',
    "\U04C7"='\\CYRNHK',
    "\U04C8"='\\cyrnhk',
    "\U04CB"='\\CYRCHLDSC',
    "\U04CC"='\\cyrchldsc',
    "\U04CD"='\\CYRMDSC',
    "\U04CE"='\\cyrmdsc',
    "\U04D0"='\\U\\CYRA',
    "\U04D1"='\\U\\cyra',
    "\U04D2"='\\\"\\CYRA',
    "\U04D3"='\\\"\\cyra',
    "\U04D4"='\\CYRAE',
    "\U04D5"='\\cyrae',
    "\U04D6"='\\U\\CYRE',
    "\U04D7"='\\U\\cyre',
    "\U04D8"='\\CYRSCHWA',
    "\U04D9"='\\cyrschwa',
    "\U04DA"='\\\"\\CYRSCHWA',
    "\U04DB"='\\\"\\cyrschwa',
    "\U04DC"='\\\"\\CYRZH',
    "\U04DD"='\\\"\\cyrzh',
    "\U04DE"='\\\"\\CYRZ',
    "\U04DF"='\\\"\\cyrz',
    "\U04E0"='\\CYRABHDZE',
    "\U04E1"='\\cyrabhdze',
    "\U04E2"='\\=\\CYRI',
    "\U04E3"='\\=\\cyri',
    "\U04E4"='\\\"\\CYRI',
    "\U04E5"='\\\"\\cyri',
    "\U04E6"='\\\"\\CYRO',
    "\U04E7"='\\\"\\cyro',
    "\U04E8"='\\CYROTLD',
    "\U04E9"='\\cyrotld',
    "\U04EC"='\\\"\\CYREREV',
    "\U04ED"='\\\"\\cyrerev',
    "\U04EE"='\\=\\CYRU',
    "\U04EF"='\\=\\cyru',
    "\U04F0"='\\\"\\CYRU',
    "\U04F1"='\\\"\\cyru',
    "\U04F2"='\\H\\CYRU',
    "\U04F3"='\\H\\cyru',
    "\U04F4"='\\\"\\CYRCH',
    "\U04F5"='\\\"\\cyrch',
    "\U04F6"='\\CYRGDSC',
    "\U04F7"='\\cyrgdsc',
    "\U04F8"='\\\"\\CYRERY',
    "\U04F9"='\\\"\\cyrery',
    "\U04FA"='\\CYRGDSCHCRS',
    "\U04FB"='\\cyrgdschcrs',
    "\U04FC"='\\CYRHHK',
    "\U04FD"='\\cyrhhk',
    "\U04FE"='\\CYRHHCRS',
    "\U04FF"='\\cyrhhcrs',                            # 0x04FF",

    "\U0E3F"='\\textbaht',

    "\U2000"='\\enskip',                              # EN QUAD (= EN SPACE U+2002)",
    "\U2001"='\\quad',                                # EM QUAD (= EM SPACE U+2003)",
    "\U2002"='\\enskip',                              # EN SPACE",
    "\U2003"='\\quad',                                # EM SPACE",
    "\U2004"='\\hspace{0.33em}',                      # THREE-PER-EM SPACE",
    "\U2005"='\\hspace{0.25em}',                      # FOUR-PER-EM SPACE",
    "\U2006"='\\hspace{0.167em}',                     # SIX-PER-EM SPACE",
    "\U2007"='~',                                    # FIGURE SPACE",
    "\U2008"='\\;',                                   # PUNCTUATION SPACE",
    "\U2009"='\\,',                                   # thin space",
    "\U200A"='\\hspace{1pt}',                         # supposed to be thinnest typographical space available",

    "\U200C"='\\textcompwordmark',                    # ZERO WIDTH NON-JOINER",

    # "\U2010"='-',                                    # HYPHEN",
    "\U2011"='\\nobreakdash-',                        # NON-BREAKING HYPHEN, https://tex.stackexchange.com/a/330437/32188",
    # "\U2012"='-',                                    # FIGURE DASH",
    "\U2013"='\\textendash',                          # 0x2013",
    "\U2014"='\\textemdash',
    "\U2015"='\\textemdash',                          # HORIZONTAL BAR",
    "\U2016"='\\ensuremath{\\Vert}',
    "\U2018"='\\textquoteleft',
    "\U2019"='\\textquoteright',
    "\U201A"='\\quotesinglbase',                      # 0x201A",
    "\U201C"='\\textquotedblleft',
    "\U201D"='\\textquotedblright',
    "\U201E"='\\quotedblbase',
    "\U2020"='\\textdagger',
    "\U2021"='\\textdaggerdbl',
    "\U2022"='\\textbullet',
    # "\U2024"='.',                                     # ONE DOT LEADER [�\u0080�]",
    # "\U2025"='..',                                    # TWO DOT LEADER [�\u0080�]",
    "\U2026"='\\textellipsis',
    "\U2030"='\\textperthousand',
    "\U2031"='\\textpertenthousand',
    "\U2032"="'",                                      # PRIME [�\u0080�]",
    "\U2033"="''",                                     # DOUBLE PRIME [�\u0080�]",
    "\U2034"="'''",                                    # TRIPLE PRIME [�\u0080�]",
    "\U2035"='\\ensuremath{\\backprime}',               # REVERSED PRIME [�\u0080�]",
    "\U2039"='\\guilsinglleft',
    "\U203A"='\\guilsinglright',
    "\U203B"='\\textreferencemark',
    "\U203D"='\\textinterrobang',
    "\U2044"='\\textfractionsolidus',
    "\U204E"='\\textasteriskcentered',
    "\U2052"='\\textdiscount',                        # 0x2052",
    "\U2057"="''''",                                   # QUADRUPLE PRIME [�\u0081\u0097]",

    "\U205F"='\\hspace{0.22em}',                             # MEDIUM MATHEMATICAL SPACE [�\u0081\u009f]",
    "\U2060"='\\nolinebreak',                          # WORD JOINER [�\u0081�]",
    # "\U2061"='',                                     # FUNCTION APPLICATION",

    "\U20A1"='\\textcolonmonetary',                   # 0x20A1",
    "\U20A4"='\\textlira',
    "\U20A6"='\\textnaira',
    "\U20A9"='\\textwon',
    "\U20AB"='\\textdong',
    "\U20AC"='\\texteuro',
    "\U20B1"='\\textpeso',                            # 0x20B1",

    "\U2102"='\\ensuremath{\\mathbb{C}}',              # DOUBLE-STRUCK CAPITAL C",
    "\U2103"='\\textcelsius',                         # DEGREE CELSIUS",
    "\U2109"='\\ensuremath{^\\circ}F',                 # DEGREE FARENHEIT",
    "\U210A"='\\ensuremath{g}',                       # SCRIPT SMALL G",
    "\U210B"='\\ensuremath{\\mathscr{H}}',             # SCRIPT CAPITAL H",
    "\U210C"='\\ensuremath{\\mathfrak{H}}',            # BLACK-LETTER CAPITAL H",
    "\U210D"='\\ensuremath{\\mathbb{H}}',              # DOUBLE-STRUCK CAPITAL H",
    "\U210E"='\\ensuremath{h}',                       # PLANCK CONSTANT",
    "\U210F"='\\ensuremath{\\hbar}',                   # h bar, PLANCK CONSTANT OVER TWO PI",
    "\U2110"='\\ensuremath{\\mathscr{I}}',             # SCRIPT CAPITAL I",
    "\U2111"='\\ensuremath{\\mathfrak{I}}',            # BLACK-LETTER CAPITAL I",
    "\U2112"='\\ensuremath{\\mathscr{L}}',             # SCRIPT CAPITAL L",
    "\U2113"='\\ensuremath{\\ell}',                    # SCRIPT SMALL L",
    "\U2115"='\\ensuremath{\\mathbb{N}}',              # DOUBLE-STRUCK CAPITAL N",
    "\U2116"='\\textnumero',                          # NUMERO SIGN",
    "\U2117"='\\textcircledP',                        # SOUND RECORDING COPYRIGHT",
    "\U2118"='\\ensuremath{\\wp}',                     # SCRIPT CAPITAL P [�\u0084\u0098]",
    "\U211E"='\\textrecipe',                          # PRESCRIPTION TAKE",
    "\U2119"='\\ensuremath{\\mathbb{P}}',              # DOUBLE-STRUCK CAPITAL P",
    "\U211A"='\\ensuremath{\\mathbb{Q}}',              # DOUBLE-STRUCK CAPITAL Q",
    "\U211B"='\\ensuremath{\\mathscr{R}}',             # SCRIPT CAPITAL R",
    "\U211C"='\\ensuremath{\\mathfrak{R}}',            # BLACK-LETTER CAPITAL R",
    "\U211D"='\\ensuremath{\\mathbb{R}}',              # DOUBLE-STRUCK CAPITAL R",
    "\U2120"='\\textservicemark',                     # SERVICE MARK",
    "\U2122"='\\texttrademark',                       # TRADE MARK SIGN",
    "\U2124"='\\ensuremath{\\mathbb{Z}}',              # DOUBLE-STRUCK CAPITAL Z",
    "\U2126"='\\textohm',                             # OHM SIGN",
    "\U2127"='\\textmho',                             # OHM SIGN",
    "\U2128"='\\ensuremath{\\mathfrak{Z}}',            # BLACK-LETTER CAPITAL Z",
    "\U212A"='K',                                    # KELVIN SIGN",
    "\U212B"='\\r{A}',                                # ANGSTROM SIGN",
    "\U212C"='\\ensuremath{\\mathscr{B}}',             # SCRIPT CAPITAL B",
    "\U212D"='\\ensuremath{\\mathfrak{C}}',            # BLACK-LETTER CAPITAL C",
    "\U212E"='\\textestimated',                       # ESTIMATED SYMBOL",
    "\U212F"='\\ensuremath{e}',                       # SCRIPT SMALL E",
    "\U2130"='\\ensuremath{\\mathscr{E}}',             # SCRIPT CAPITAL E",
    "\U2131"='\\ensuremath{\\mathscr{F}}',             # SCRIPT CAPITAL F",
    "\U2133"='\\ensuremath{\\mathscr{M}}',             # SCRIPT CAPITAL M",
    "\U2134"='\\ensuremath{o}',                       # SCRIPT SMALL O",
    "\U2135"='\\ensuremath{\\aleph}',                  # ALEF SYMBOL",
    "\U2136"='\\ensuremath{\\beth}',                    # BET SYMBOL [�\u0084�]",
    "\U2137"='\\ensuremath{\\gimel}',                   # GIMEL SYMBOL [�\u0084�]",
    "\U2138"='\\ensuremath{\\daleth}',                  # DALET SYMBOL [�\u0084�]")

    "\U2153"='\\textfrac{1}{3}',                       # VULGAR FRACTION ONE THIRD [⅓]",
    "\U2154"='\\textfrac{2}{3}',                       # VULGAR FRACTION TWO THIRDS [⅔]",
    "\U2155"='\\textfrac{1}{5}',                       # VULGAR FRACTION ONE FIFTH [⅕]",
    "\U2156"='\\textfrac{2}{5}',                       # VULGAR FRACTION TWO FIFTHS [⅖]",
    "\U2157"='\\textfrac{3}{5}',                       # VULGAR FRACTION THREE FIFTHS [⅗]",
    "\U2158"='\\textfrac{4}{5}',                       # VULGAR FRACTION FOUR FIFTHS [⅘]",
    "\U2159"='\\textfrac{1}{6}',                       # VULGAR FRACTION ONE SIXTH [⅙]",
    "\U215A"='\\textfrac{5}{6}',                       # VULGAR FRACTION FIVE SIXTHS [⅚]",
    "\U215B"='\\textfrac{1}{8}',                       # VULGAR FRACTION ONE EIGHTH [⅛]",
    "\U215C"='\\textfrac{3}{8}',                       # VULGAR FRACTION THREE EIGHTHS [⅜]",
    "\U215D"='\\textfrac{5}{8}',                       # VULGAR FRACTION FIVE EIGHTHS [⅝]",
    "\U215E"='\\textfrac{7}{8}',                       # VULGAR FRACTION SEVEN EIGHTHS [⅞]",

    "\U2190"='\\textleftarrow',                       # 0x2190",
    "\U2191"='\\textuparrow',
    "\U2192"='\\textrightarrow',
    "\U2193"='\\textdownarrow',                       # 0x2193",
    "\U2194"='\\ensuremath{\\leftrightarrow}',          # LEFT RIGHT ARROW [↔]",
    "\U2195"='\\ensuremath{\\updownarrow}',                         # UP DOWN ARROW [↕]",
    "\U2196"='\\ensuremath{\\nwarrow}',                             # NORTH WEST ARROW [↖]",
    "\U2197"='\\ensuremath{\\nearrow}',                             # NORTH EAST ARROW [↗]",
    "\U2198"='\\ensuremath{\\searrow}',                             # SOUTH EAST ARROW [↘]",
    "\U2199"='\\ensuremath{\\swarrow}',                             # SOUTH WEST ARROW [↙]",
    "\U219A"='\\ensuremath{\\nleftarrow}',                          # LEFTWARDS ARROW WITH STROKE [↚]",
    "\U219B"='\\ensuremath{\\nrightarrow}',                         # RIGHTWARDS ARROW WITH STROKE [↛]",
    "\U219C"='\\ensuremath{\\arrowwaveleft}',                       # LEFTWARDS WAVE ARROW [↜]",
    "\U219D"='\\ensuremath{\\arrowwaveright}',                      # RIGHTWARDS WAVE ARROW [↝]",
    "\U219E"='\\ensuremath{\\twoheadleftarrow}',                    # LEFTWARDS TWO HEADED ARROW [↞]",
    "\U21A0"='\\ensuremath{\\twoheadrightarrow}',                   # RIGHTWARDS TWO HEADED ARROW [↠]",
    "\U21A2"='\\ensuremath{\\leftarrowtail}',                       # LEFTWARDS ARROW WITH TAIL [↢]",
    "\U21A3"='\\ensuremath{\\rightarrowtail}',                      # RIGHTWARDS ARROW WITH TAIL [↣]",
    "\U21A6"='\\ensuremath{\\mapsto}',                              # RIGHTWARDS ARROW FROM BAR [↦]",
    "\U21A9"='\\ensuremath{\\hookleftarrow}',                       # LEFTWARDS ARROW WITH HOOK [↩]",
    "\U21AA"='\\ensuremath{\\hookrightarrow}',                      # RIGHTWARDS ARROW WITH HOOK [↪]",
    "\U21AB"='\\ensuremath{\\looparrowleft}',                       # LEFTWARDS ARROW WITH LOOP [↫]",
    "\U21AC"='\\ensuremath{\\looparrowright}',                      # RIGHTWARDS ARROW WITH LOOP [↬]",
    "\U21AD"='\\ensuremath{\\leftrightsquigarrow}',                 # LEFT RIGHT WAVE ARROW [↭]",
    "\U21AE"='\\ensuremath{\\nleftrightarrow}',                     # LEFT RIGHT ARROW WITH STROKE [↮]",
    "\U21B0"='\\ensuremath{\\Lsh}',                                 # UPWARDS ARROW WITH TIP LEFTWARDS [↰]",
    "\U21B1"='\\ensuremath{\\Rsh}',                                 # UPWARDS ARROW WITH TIP RIGHTWARDS [↱]",
    "\U21B6"='\\ensuremath{\\curvearrowleft}',                      # ANTICLOCKWISE TOP SEMICIRCLE ARROW [↶]",
    "\U21B7"='\\ensuremath{\\curvearrowright}',                     # CLOCKWISE TOP SEMICIRCLE ARROW [↷]",
    "\U21BA"='\\ensuremath{\\circlearrowleft}',                     # ANTICLOCKWISE OPEN CIRCLE ARROW [↺]",
    "\U21BB"='\\ensuremath{\\circlearrowright}',                    # CLOCKWISE OPEN CIRCLE ARROW [↻]",
    "\U21BC"='\\ensuremath{\\leftharpoonup}',                       # LEFTWARDS HARPOON WITH BARB UPWARDS [↼]",
    "\U21BD"='\\ensuremath{\\leftharpoondown}',                     # LEFTWARDS HARPOON WITH BARB DOWNWARDS [↽]",
    "\U21BE"='\\ensuremath{\\upharpoonright}',                      # UPWARDS HARPOON WITH BARB RIGHTWARDS [↾]",
    "\U21BF"='\\ensuremath{\\upharpoonleft}',                       # UPWARDS HARPOON WITH BARB LEFTWARDS [↿]",
    "\U21C0"='\\ensuremath{\\rightharpoonup}',                      # RIGHTWARDS HARPOON WITH BARB UPWARDS [⇀]",
    "\U21C1"='\\ensuremath{\\rightharpoondown}',                    # RIGHTWARDS HARPOON WITH BARB DOWNWARDS [⇁]",
    "\U21C2"='\\ensuremath{\\downharpoonright}',                    # DOWNWARDS HARPOON WITH BARB RIGHTWARDS [⇂]",
    "\U21C3"='\\ensuremath{\\downharpoonleft}',                     # DOWNWARDS HARPOON WITH BARB LEFTWARDS [⇃]",
    "\U21C4"='\\ensuremath{\\rightleftarrows}',                     # RIGHTWARDS ARROW OVER LEFTWARDS ARROW [⇄]",
    "\U21C5"='\\ensuremath{\\dblarrowupdown}',                      # UPWARDS ARROW LEFTWARDS OF DOWNWARDS ARROW [⇅]",
    "\U21C6"='\\ensuremath{\\leftrightarrows}',                     # LEFTWARDS ARROW OVER RIGHTWARDS ARROW [⇆]",
    "\U21C7"='\\ensuremath{\\leftleftarrows}',                      # LEFTWARDS PAIRED ARROWS [⇇]",
    "\U21C8"='\\ensuremath{\\upuparrows}',                          # UPWARDS PAIRED ARROWS [⇈]",
    "\U21C9"='\\ensuremath{\\rightrightarrows}',                    # RIGHTWARDS PAIRED ARROWS [⇉]",
    "\U21CA"='\\ensuremath{\\downdownarrows}',                      # DOWNWARDS PAIRED ARROWS [⇊]",
    "\U21CB"='\\ensuremath{\\leftrightharpoons}',                   # LEFTWARDS HARPOON OVER RIGHTWARDS HARPOON [⇋]",
    "\U21CC"='\\ensuremath{\\rightleftharpoons}',                   # RIGHTWARDS HARPOON OVER LEFTWARDS HARPOON [⇌]",
    "\U21CD"='\\ensuremath{\\nLeftarrow}',                          # LEFTWARDS DOUBLE ARROW WITH STROKE [⇍]",
    "\U21CE"='\\ensuremath{\\nLeftrightarrow}',                     # LEFT RIGHT DOUBLE ARROW WITH STROKE [⇎]",
    "\U21CF"='\\ensuremath{\\nRightarrow}',                         # RIGHTWARDS DOUBLE ARROW WITH STROKE [⇏]",
    "\U21D0"='\\ensuremath{\\Leftarrow}',                           # LEFTWARDS DOUBLE ARROW [⇐]",
    "\U21D1"='\\ensuremath{\\Uparrow}',                             # UPWARDS DOUBLE ARROW [⇑]",
    "\U21D2"='\\ensuremath{\\Rightarrow}',                          # RIGHTWARDS DOUBLE ARROW [⇒]",
    "\U21D3"='\\ensuremath{\\Downarrow}',                           # DOWNWARDS DOUBLE ARROW [⇓]",
    "\U21D4"='\\ensuremath{\\Leftrightarrow}',                      # LEFT RIGHT DOUBLE ARROW [⇔]",
    "\U21D5"='\\ensuremath{\\Updownarrow}',                         # UP DOWN DOUBLE ARROW [⇕]",
    "\U21DA"='\\ensuremath{\\Lleftarrow}',                          # LEFTWARDS TRIPLE ARROW [⇚]",
    "\U21DB"='\\ensuremath{\\Rrightarrow}',                         # RIGHTWARDS TRIPLE ARROW [⇛]",
    "\U21DD"='\\ensuremath{\\rightsquigarrow}',                     # RIGHTWARDS SQUIGGLE ARROW [⇝]",
    "\U21F5"='\\ensuremath{\\DownArrowUpArrow}',                    # DOWNWARDS ARROW LEFTWARDS OF UPWARDS ARROW [⇵]",

    # Math operators and symbols (U+22XX)
    "\U2200"='\\ensuremath{\\forall}',
    "\U2201"='\\ensuremath{\\complement}',
    "\U2202"='\\ensuremath{\\partial}',
    "\U2203"='\\ensuremath{\\exists}',
    "\U2204"='\\ensuremath{\\nexists}',
    "\U2205"='\\ensuremath{\\varnothing}',
    "\U2206"='\\ensuremath{\\Delta}',
    "\U2207"='\\ensuremath{\\nabla}',
    "\U2208"='\\ensuremath{\\in}',
    "\U2209"='\\ensuremath{\\notin}',
    "\U220A"='\\ensuremath{\\in}',                     # alternative",
    "\U220B"='\\ensuremath{\\ni}',
    "\U220C"='\\ensuremath{\\not\\ni}',
    "\U220D"='\\ensuremath{\\ni}',                     # alternative",
    "\U220E"='\\ensuremath{\\blacksquare}',
    "\U220F"='\\ensuremath{\\prod}',
    "\U2210"='\\ensuremath{\\coprod}',
    "\U2211"='\\ensuremath{\\sum}',
    "\U2212"='\\ensuremath{-}',
    "\U2213"='\\ensuremath{\\mp}',
    "\U2214"='\\ensuremath{\\dotplus}',                             # DOT PLUS [∔]",
    "\U2215"='\\ensuremath{/}',
    "\U2216"='\\ensuremath{\\smallsetminus}',
    "\U2217"='\\ensuremath{*}',
    "\U2218"='\\ensuremath{\\circ}',
    "\U2219"='\\ensuremath{\\bullet}',
    "\U221A"='\\ensuremath{\\sqrt{}}',
    "\U221B"='\\ensuremath{\\sqrt[3]{}}',
    "\U221C"='\\ensuremath{\\sqrt[4]{}}',
    "\U221D"='\\ensuremath{\\propto}',
    "\U221E"='\\ensuremath{\\infty}',
    "\U221F"='\\ensuremath{\\rightangle}',                          # RIGHT ANGLE [∟]",
    "\U2220"='\\ensuremath{\\angle}',                               # ANGLE [∠]",
    "\U2221"='\\ensuremath{\\measuredangle}',                       # MEASURED ANGLE [∡]",
    "\U2222"='\\ensuremath{\\sphericalangle}',                      # SPHERICAL ANGLE [∢]",
    "\U2223"='\\ensuremath{\\mid}',
    "\U2224"='\\ensuremath{\\nmid}',
    "\U2225"='\\ensuremath{\\parallel}',
    "\U2226"='\\ensuremath{\\nparallel}',
    "\U2227"='\\ensuremath{\\wedge}',
    "\U2228"='\\ensuremath{\\vee}',
    "\U2229"='\\ensuremath{\\cap}',
    "\U222A"='\\ensuremath{\\cup}',
    "\U222B"='\\ensuremath{\\int}',
    "\U222C"='\\ensuremath{\\iint}',
    "\U222D"='\\ensuremath{\\iiint}',
    "\U222E"='\\ensuremath{\\oint}',
    "\U222F"='\\ensuremath{\\surfintegral}',                        # SURFACE INTEGRAL [∯]",
    "\U2230"='\\ensuremath{\\volintegral}',                         # VOLUME INTEGRAL [∰]",
    "\U2231"='\\ensuremath{\\clwintegral}',                         # CLOCKWISE INTEGRAL [∱]",
    #"\U2232"=NA, #CLOCKWISE CONTOUR INTEGRAL
    #"\U2233"=NA, #ANTICLOCKWISE CONTOUR INTEGRAL
    "\U2234"='\\ensuremath{\\therefore}',
    "\U2235"='\\ensuremath{\\because}',
    # "\U2236"='\\ensuremath{:}',
    # "\U2237"='\\ensuremath{::}',

    "\U223A"='\\ensuremath{\\mathbin{{:}\\!\\!{-}\\!\\!{:}}}', # GEOMETRIC PROPORTION [∺]",
    "\U223B"='\\ensuremath{\\homothetic}',              # HOMOTHETIC [∻]",
    "\U223C"='\\ensuremath{\\sim}',
    "\U223D"='\\ensuremath{\\backsim}',
    "\U223E"='\\ensuremath{\\lazysinv}',                            # INVERTED LAZY S [∾]",

    "\U2240"='\\ensuremath{\\wr}',                                  # WREATH PRODUCT [≀]",
    "\U2241"='\\ensuremath{\\not\\sim}',                             # NOT TILDE [≁]",
    "\U2243"='\\ensuremath{\\simeq}',                               # ASYMPTOTICALLY EQUAL TO [≃]",
    "\U2244"='\\ensuremath{\\not\\simeq}',                           # NOT ASYMPTOTICALLY EQUAL TO [≄]",
    "\U2245"='\\ensuremath{\\cong}',                                # APPROXIMATELY EQUAL TO [≅]",
    "\U2246"='\\ensuremath{\\approxnotequal}',          # APPROXIMATELY BUT NOT ACTUALLY EQUAL TO [≆]",
    "\U2247"='\\ensuremath{\\not\\cong}',                # NEITHER APPROXIMATELY NOR ACTUALLY EQUAL TO [≇]",
    "\U2248"='\\ensuremath{\\approx}',
    "\U2249"='\\ensuremath{\\not\\approx}',                          # NOT ALMOST EQUAL TO [≉]",
    "\U224A"='\\ensuremath{\\approxeq}',                            # ALMOST EQUAL OR EQUAL TO [≊]",
    "\U224B"='\\ensuremath{\\tildetrpl}',                           # TRIPLE TILDE [≋]",
    "\U224C"='\\ensuremath{\\allequal}',                            # ALL EQUAL TO [≌]",
    "\U224D"='\\ensuremath{\\asymp}',                               # EQUIVALENT TO [≍]",
    "\U224E"='\\ensuremath{\\Bumpeq}',                              # GEOMETRICALLY EQUIVALENT TO [≎]",
    "\U224F"='\\ensuremath{\\bumpeq}',                              # DIFFERENCE BETWEEN [≏]",
    "\U2250"='\\ensuremath{\\doteq}',                               # APPROACHES THE LIMIT [≐]",
    "\U2251"='\\ensuremath{\\doteqdot}',                            # GEOMETRICALLY EQUAL TO [≑]",
    "\U2252"='\\ensuremath{\\fallingdotseq}',                       # APPROXIMATELY EQUAL TO OR THE IMAGE OF [≒]",
    "\U2253"='\\ensuremath{\\risingdotseq}',                        # IMAGE OF OR APPROXIMATELY EQUAL TO [≓]",
    "\U2254"='\\ensuremath{:=}',                                    # COLON EQUALS [≔]",
    "\U2255"='\\ensuremath{=:}',                                    # EQUALS COLON [≕]",
    "\U2256"='\\ensuremath{\\eqcirc}',                              # RING IN EQUAL TO [≖]",
    "\U2257"='\\ensuremath{\\circeq}',                              # RING EQUAL TO [≗]",
    "\U2259"='\\ensuremath{\\estimates}',                           # ESTIMATES [≙]",
    "\U225B"='\\ensuremath{\\starequal}',                           # STAR EQUALS [≛]",
    "\U225C"='\\ensuremath{\\triangleq}',                           # DELTA EQUAL TO [≜]",

    "\U2260"='\\ensuremath{\\neq}',
    "\U2261"='\\ensuremath{\\equiv}',
    "\U2262"='\\ensuremath{\\not\\equiv}',
    #"\U2263" = NA,     #STRICTLY EQUIVALENT TO (DNE)
    "\U2264"='\\ensuremath{\\leq}',
    "\U2265"='\\ensuremath{\\geq}',
    "\U2266"='\\ensuremath{\\leqq}',
    "\U2267"='\\ensuremath{\\geqq}',
    "\U2268"='\\ensuremath{\\lneqq}',
    "\U2269"='\\ensuremath{\\gneqq}',
    "\U226A"='\\ensuremath{\\ll}',
    "\U226B"='\\ensuremath{\\gg}',
    "\U226C"='\\ensuremath{\\between}',                             # BETWEEN [≬]",
    "\U226D"='\\ensuremath{\\not\\kern-0.3em\\times}',                # NOT EQUIVALENT TO [≭]",
    "\U226E"='\\ensuremath{\\nless}',
    "\U226F"='\\ensuremath{\\ngtr}',
    "\U2270"='\\ensuremath{\\nleq}',
    "\U2271"='\\ensuremath{\\ngeq}',
    "\U2272"='\\ensuremath{\\lesssim}',
    "\U2273"='\\ensuremath{\\gtrsim}',
    "\U2274"='\\ensuremath{\\not\\lesssim}',
    "\U2275"='\\ensuremath{\\not\\gtrsim}',
    "\U2276"='\\ensuremath{\\lessgtr}',
    "\U2277"='\\ensuremath{\\gtrless}',
    "\U2278"='\\ensuremath{\\notlessgreater}',                      # NEITHER LESS-THAN NOR GREATER-THAN [≸]",
    "\U2279"='\\ensuremath{\\notgreaterless}',                      # NEITHER GREATER-THAN NOR LESS-THAN [≹]",
    "\U227A"='\\ensuremath{\\prec}',
    "\U227B"='\\ensuremath{\\succ}',
    "\U227C"='\\ensuremath{\\preceq}',
    "\U227D"='\\ensuremath{\\succeq}',
    "\U227E"='\\ensuremath{\\precsim}',
    "\U227F"='\\ensuremath{\\succsim}',
    "\U2280"='\\ensuremath{\\nprec}',
    "\U2281"='\\ensuremath{\\nsucc}',
    "\U2282"='\\ensuremath{\\subset}',
    "\U2283"='\\ensuremath{\\supset}',
    "\U2284"='\\ensuremath{\\not\\subset}',
    "\U2285"='\\ensuremath{\\not\\supset}',
    "\U2286"='\\ensuremath{\\subseteq}',
    "\U2287"='\\ensuremath{\\supseteq}',
    "\U2288"='\\ensuremath{\\nsubseteq}',
    "\U2289"='\\ensuremath{\\nsupseteq}',
    "\U228A"='\\ensuremath{\\subsetneq}',
    "\U228B"='\\ensuremath{\\supsetneq}',
    "\U228E"='\\ensuremath{\\uplus}',                               # MULTISET UNION [⊎]",
    "\U228F"='\\ensuremath{\\sqsubset}',                            # SQUARE IMAGE OF [⊏]",
    "\U2290"='\\ensuremath{\\sqsupset}',                            # SQUARE ORIGINAL OF [⊐]",
    "\U2291"='\\ensuremath{\\sqsubseteq}',                          # SQUARE IMAGE OF OR EQUAL TO [⊑]",
    "\U2292"='\\ensuremath{\\sqsupseteq}',                          # SQUARE ORIGINAL OF OR EQUAL TO [⊒]",
    "\U2293"='\\ensuremath{\\sqcap}',
    "\U2294"='\\ensuremath{\\sqcup}',
    "\U2295"='\\ensuremath{\\oplus}',
    "\U2296"='\\ensuremath{\\ominus}',
    "\U2297"='\\ensuremath{\\otimes}',
    "\U2298"='\\ensuremath{\\oslash}',
    "\U2299"='\\ensuremath{\\odot}',
    "\U229A"='\\ensuremath{\\circledcirc}',                         # CIRCLED RING OPERATOR [⊚]",
    "\U229B"='\\ensuremath{\\circledast}',                          # CIRCLED ASTERISK OPERATOR [⊛]",
    "\U229D"='\\ensuremath{\\circleddash}',                         # CIRCLED DASH [⊝]",
    "\U229E"='\\ensuremath{\\boxplus}',                             # SQUARED PLUS [⊞]",
    "\U229F"='\\ensuremath{\\boxminus}',                            # SQUARED MINUS [⊟]",
    "\U22A0"='\\ensuremath{\\boxtimes}',                            # SQUARED TIMES [⊠]",
    "\U22A1"='\\ensuremath{\\boxdot}',                              # SQUARED DOT OPERATOR [⊡]",
    "\U22A2"='\\ensuremath{\\vdash}',                               # RIGHT TACK [⊢]",
    "\U22A3"='\\ensuremath{\\dashv}',                               # LEFT TACK [⊣]",
    "\U22A4"='\\ensuremath{\\top}',                                 # DOWN TACK [⊤]",
    "\U22A5"='\\ensuremath{\\perp}',                                # UP TACK [⊥]",
    "\U22A7"='\\ensuremath{\\truestate}',                           # MODELS [⊧]",
    "\U22A8"='\\ensuremath{\\forcesextra}',                         # TRUE [⊨]",
    "\U22A9"='\\ensuremath{\\Vdash}',                               # FORCES [⊩]",
    "\U22AA"='\\ensuremath{\\Vvdash}',                              # TRIPLE VERTICAL BAR RIGHT TURNSTILE [⊪]",
    "\U22AB"='\\ensuremath{\\VDash}',                   # DOUBLE VERTICAL BAR DOUBLE RIGHT TURNSTILE [⊫]",
    "\U22AC"='\\ensuremath{\\nvdash}',                              # DOES NOT PROVE [⊬]",
    "\U22AD"='\\ensuremath{\\nvDash}',                              # NOT TRUE [⊭]",
    "\U22AE"='\\ensuremath{\\nVdash}',                              # DOES NOT FORCE [⊮]",
    "\U22AF"='\\ensuremath{\\nVDash}',                  # NEGATED DOUBLE VERTICAL BAR DOUBLE RIGHT TURNSTILE [⊯]",
    "\U22B2"='\\ensuremath{\\vartriangleleft}',                     # NORMAL SUBGROUP OF [⊲]",
    "\U22B3"='\\ensuremath{\\vartriangleright}',                    # CONTAINS AS NORMAL SUBGROUP [⊳]",
    "\U22B4"='\\ensuremath{\\trianglelefteq}',                      # NORMAL SUBGROUP OF OR EQUAL TO [⊴]",
    "\U22B5"='\\ensuremath{\\trianglerighteq}',                     # CONTAINS AS NORMAL SUBGROUP OR EQUAL TO [⊵]",
    "\U22B6"='\\ensuremath{\\original}',                            # ORIGINAL OF [⊶]",
    "\U22B7"='\\ensuremath{\\image}',                               # IMAGE OF [⊷]",
    "\U22B8"='\\ensuremath{\\multimap}',                            # MULTIMAP [⊸]",
    "\U22B9"='\\ensuremath{\\hermitconjmatrix}',                    # HERMITIAN CONJUGATE MATRIX [⊹]",
    "\U22BA"='\\ensuremath{\\intercal}',                            # INTERCALATE [⊺]",
    "\U22BB"='\\ensuremath{\\veebar}',                              # XOR [⊻]",
    "\U22BE"='\\ensuremath{\\rightanglearc}',                       # RIGHT ANGLE WITH ARC [⊾]",
    "\U22C0"='\\ensuremath{\\bigwedge}',
    "\U22C1"='\\ensuremath{\\bigvee}',
    "\U22C2"='\\ensuremath{\\bigcap}',
    "\U22C3"='\\ensuremath{\\bigcup}',
    "\U22C4"='\\ensuremath{\\diamond}',
    "\U22C5"='\\ensuremath{\\cdot}',
    "\U22C6"='\\ensuremath{\\star}',
    "\U22C7"='\\ensuremath{\\divideontimes}',
    "\U22C8"='\\ensuremath{\\bowtie}',
    "\U22C9"='\\ensuremath{\\ltimes}',
    "\U22CA"='\\ensuremath{\\rtimes}',
    "\U22CB"='\\ensuremath{\\leftthreetimes}',
    "\U22CC"='\\ensuremath{\\rightthreetimes}',
    "\U22CD"='\\ensuremath{\\backsimeq}',                           # REVERSED TILDE EQUALS [⋍]",
    "\U22CE"='\\ensuremath{\\curlyvee}',                            # CURLY LOGICAL OR [⋎]",
    "\U22CF"='\\ensuremath{\\curlywedge}',                          # CURLY LOGICAL AND [⋏]",
    "\U22D0"='\\ensuremath{\\Subset}',                              # DOUBLE SUBSET [⋐]",
    "\U22D1"='\\ensuremath{\\Supset}',                              # DOUBLE SUPERSET [⋑]",
    "\U22D2"='\\ensuremath{\\Cap}',                                 # DOUBLE INTERSECTION [⋒]",
    "\U22D3"='\\ensuremath{\\Cup}',                                 # DOUBLE UNION [⋓]",
    "\U22D4"='\\ensuremath{\\pitchfork}',                           # PITCHFORK [⋔]",
    "\U22D6"='\\ensuremath{\\lessdot}',                             # LESS-THAN WITH DOT [⋖]",
    "\U22D7"='\\ensuremath{\\gtrdot}',                              # GREATER-THAN WITH DOT [⋗]",
    "\U22D8"='\\ensuremath{\\verymuchless}',                        # VERY MUCH LESS-THAN [⋘]",
    "\U22D9"='\\ensuremath{\\verymuchgreater}',                     # VERY MUCH GREATER-THAN [⋙]",
    "\U22DA"='\\ensuremath{\\lesseqgtr}',                           # LESS-THAN EQUAL TO OR GREATER-THAN [⋚]",
    "\U22DB"='\\ensuremath{\\gtreqless}',                           # GREATER-THAN EQUAL TO OR LESS-THAN [⋛]",
    "\U22DE"='\\ensuremath{\\curlyeqprec}',                         # EQUAL TO OR PRECEDES [⋞]",
    "\U22DF"='\\ensuremath{\\curlyeqsucc}',                         # EQUAL TO OR SUCCEEDS [⋟]",
    "\U22E2"='\\ensuremath{\\not\\sqsubseteq}',                      # NOT SQUARE IMAGE OF OR EQUAL TO [⋢]",
    "\U22E3"='\\ensuremath{\\not\\sqsupseteq}',                      # NOT SQUARE ORIGINAL OF OR EQUAL TO [⋣]",
    "\U22E6"='\\ensuremath{\\lnsim}',                               # LESS-THAN BUT NOT EQUIVALENT TO [⋦]",
    "\U22E7"='\\ensuremath{\\gnsim}',                               # GREATER-THAN BUT NOT EQUIVALENT TO [⋧]",
    "\U22E8"='\\ensuremath{\\precedesnotsimilar}',                  # PRECEDES BUT NOT EQUIVALENT TO [⋨]",
    "\U22E9"='\\ensuremath{\\succnsim}',                            # SUCCEEDS BUT NOT EQUIVALENT TO [⋩]",
    "\U22EA"='\\ensuremath{\\ntriangleleft}',                       # NOT NORMAL SUBGROUP OF [⋪]",
    "\U22EB"='\\ensuremath{\\ntriangleright}',                      # DOES NOT CONTAIN AS NORMAL SUBGROUP [⋫]",
    "\U22EC"='\\ensuremath{\\ntrianglelefteq}',                     # NOT NORMAL SUBGROUP OF OR EQUAL TO [⋬]",
    "\U22ED"='\\ensuremath{\\ntrianglerighteq}',        # DOES NOT CONTAIN AS NORMAL SUBGROUP OR EQUAL [⋭]",
    "\U22EE"='\\ensuremath{\\vdots}',
    "\U22EF"='\\ensuremath{\\cdots}',
    "\U22F0"='\\ensuremath{\\udots}',
    "\U22F1"='\\ensuremath{\\ddots}',

    "\U2305"='\\ensuremath{\\barwedge}',                            # PROJECTIVE [⌅]",
    "\U2306"='\\ensuremath{\\varperspcorrespond}',                  # PERSPECTIVE [⌆]",
    "\U2308"='\\ensuremath{\\lceil}',                               # LEFT CEILING [⌈]",
    "\U2309"='\\ensuremath{\\rceil}',                               # RIGHT CEILING [⌉]",
    "\U230A"='\\ensuremath{\\lfloor}',                              # LEFT FLOOR [⌊]",
    "\U230B"='\\ensuremath{\\rfloor}',                              # RIGHT FLOOR [⌋]",
    "\U2315"='\\ensuremath{\\recorder}',                            # TELEPHONE RECORDER [⌕]",
    "\U2316"='\\ensuremath{\\mathchar\"2208}',                        # POSITION INDICATOR [⌖]",
    "\U231C"='\\ensuremath{\\ulcorner}',                            # TOP LEFT CORNER [⌜]",
    "\U231D"='\\ensuremath{\\urcorner}',                            # TOP RIGHT CORNER [⌝]",
    "\U231E"='\\ensuremath{\\llcorner}',                            # BOTTOM LEFT CORNER [⌞]",
    "\U231F"='\\ensuremath{\\lrcorner}',                            # BOTTOM RIGHT CORNER [⌟]",
    "\U2322"='\\ensuremath{\\frown}',                               # FROWN [⌢]",
    "\U2323"='\\ensuremath{\\smile}',                               # SMILE [⌣]",

    "\U23B0"='\\ensuremath{\\lmoustache}',              # UPPER LEFT OR LOWER RIGHT CURLY BRACKET SECTION [⎰]",
    "\U23B1"='\\ensuremath{\\rmoustache}',              # UPPER RIGHT OR LOWER LEFT CURLY BRACKET SECTION [⎱]",

    "\U2329"='\\textlangle',                          # 0x2329",
    "\U232A"='\\textrangle',
    "\U2422"='\\textblank',
    "\U2423"='\\textvisiblespace',
    "\U25A0"='\\ensuremath{\\blacksquare}',             # BLACK SQUARE [■]",
    "\U25A1"='\\ensuremath{\\square}',                  # WHITE SQUARE [□]",
    "\U25AA"='{\\small\\ensuremath{\\blacksquare}}',     # BLACK SMALL SQUARE [▪]",
    "\U25AD"='\\fbox{~~}',                             # WHITE RECTANGLE [▭]",
    "\U25B3"='\\ensuremath{\\bigtriangleup}',                       # WHITE UP-POINTING TRIANGLE [△]",
    "\U25B4"='\\ensuremath{\\blacktriangle}',                       # BLACK UP-POINTING SMALL TRIANGLE [▴]",
    "\U25B5"='\\ensuremath{\\vartriangle}',                         # WHITE UP-POINTING SMALL TRIANGLE [▵]",
    "\U25B8"='\\ensuremath{\\blacktriangleright}',                  # BLACK RIGHT-POINTING SMALL TRIANGLE [▸]",
    "\U25B9"='\\ensuremath{\\triangleright}',                       # WHITE RIGHT-POINTING SMALL TRIANGLE [▹]",
    "\U25BD"='\\ensuremath{\\bigtriangledown}',                     # WHITE DOWN-POINTING TRIANGLE [▽]",
    "\U25BE"='\\ensuremath{\\blacktriangledown}',                   # BLACK DOWN-POINTING SMALL TRIANGLE [▾]",
    "\U25BF"='\\ensuremath{\\triangledown}',                        # WHITE DOWN-POINTING SMALL TRIANGLE [▿]",
    "\U25C2"='\\ensuremath{\\blacktriangleleft}',                   # BLACK LEFT-POINTING SMALL TRIANGLE [◂]",
    "\U25C3"='\\ensuremath{\\triangleleft}',                        # WHITE LEFT-POINTING SMALL TRIANGLE [◃]",
    "\U25CA"='\\ensuremath{\\lozenge}',                             # LOZENGE [◊]",
    "\U25CB"='\\ensuremath{\\bigcirc}',                             # WHITE CIRCLE [○]",

    "\U25E6"='\\textopenbullet',
    "\U25EF"='\\textbigcircle',
    "\U2662"='\\ensuremath{\\diamond}',                             # WHITE DIAMOND SUIT [♢]",
    "\U266A"='\\textmusicalnote',                     # 0x266A",
    "\U2669"='\\quarternote',                          # QUARTER NOTE [♩]",
    "\U266D"='\\flat',                                 # MUSIC FLAT SIGN [♭]",
    "\U266E"='\\natural',                              # MUSIC NATURAL SIGN [♮]",
    "\U266F"='\\sharp',                                # MUSIC SHARP SIGN [♯]",

    "\U27E8"='\\ensuremath{\\langle}',                 # MATHEMATICAL LEFT ANGLE BRACKET",
    "\U27E9"='\\ensuremath{\\rangle}',                 # MATHEMATICAL RIGHT ANGLE BRACKET",

    "\U27F5"='\\ensuremath{\\longleftarrow}',                       # LONG LEFTWARDS ARROW [⟵]",
    "\U27F6"='\\ensuremath{\\longrightarrow}',                      # LONG RIGHTWARDS ARROW [⟶]",
    "\U27F7"='\\ensuremath{\\longleftrightarrow}',                  # LONG LEFT RIGHT ARROW [⟷]",
    "\U27F8"='\\ensuremath{\\Longleftarrow}',                       # LONG LEFTWARDS DOUBLE ARROW [⟸]",
    "\U27F9"='\\ensuremath{\\Longrightarrow}',                      # LONG RIGHTWARDS DOUBLE ARROW [⟹]",
    "\U27FA"='\\ensuremath{\\Longleftrightarrow}',                  # LONG LEFT RIGHT DOUBLE ARROW [⟺]",
    "\U27FC"='\\ensuremath{\\longmapsto}',                          # LONG RIGHTWARDS ARROW FROM BAR [⟼]",
    "\U27FF"='\\ensuremath{\\sim\\joinrel\\leadsto}',                 # LONG RIGHTWARDS SQUIGGLE ARROW [⟿]",

    "\U2993"='\\ensuremath{<\\kern-0.58em(}',                        # LEFT ARC LESS-THAN BRACKET [⦓]",
    "\U29EB"='\\ensuremath{\\blacklozenge}',                        # BLACK LOZENGE [⧫]",

    # Supplemental Mathematical Operators U+2AXX",
    "\U2A0F"='\\ensuremath{\\clockoint}',                           # INTEGRAL AVERAGE WITH SLASH [⨏]",
    "\U2A16"='\\ensuremath{\\sqrint}',                              # QUATERNION INTEGRAL OPERATOR [⨖]",
    "\U2A3F"='\\ensuremath{\\amalg}',                               # AMALGAMATION OR COPRODUCT [⨿]",
    "\U2A6E"='\\ensuremath{\\stackrel{*}{=}}',                       # EQUALS WITH ASTERISK [⩮]",
    "\U2A75"='==',                               # TWO CONSECUTIVE EQUALS SIGNS [⩵]",
    "\U2A7D"='\\ensuremath{\\leqslant}',
    "\U2A7E"='\\ensuremath{\\geqslant}',
    "\U2A85"='\\ensuremath{\\lessapprox}',                          # LESS-THAN OR APPROXIMATE [⪅]",
    "\U2A86"='\\ensuremath{\\gtrapprox}',                           # GREATER-THAN OR APPROXIMATE [⪆]",
    "\U2A87"='\\ensuremath{\\lneq}',                                # LESS-THAN AND SINGLE-LINE NOT EQUAL TO [⪇]",
    "\U2A88"='\\ensuremath{\\gneq}',                                # GREATER-THAN AND SINGLE-LINE NOT EQUAL TO [⪈]",
    "\U2A89"='\\ensuremath{\\lnapprox}',                            # LESS-THAN AND NOT APPROXIMATE [⪉]",
    "\U2A8A"='\\ensuremath{\\gnapprox}',                            # GREATER-THAN AND NOT APPROXIMATE [⪊]",
    "\U2A8B"='\\ensuremath{\\lesseqqgtr}',              # LESS-THAN ABOVE DOUBLE-LINE EQUAL ABOVE GREATER-THAN [⪋]",
    "\U2A8C"='\\ensuremath{\\gtreqqless}',              # GREATER-THAN ABOVE DOUBLE-LINE EQUAL ABOVE LESS-THAN [⪌]",
    "\U2A95"='\\ensuremath{\\eqslantless}',                         # SLANTED EQUAL TO OR LESS-THAN [⪕]",
    "\U2A96"='\\ensuremath{\\eqslantgtr}',                          # SLANTED EQUAL TO OR GREATER-THAN [⪖]",
    "\U2AAF"='\\ensuremath{\\preceq}',                              # PRECEDES ABOVE SINGLE-LINE EQUALS SIGN [⪯]",
    "\U2AB0"='\\ensuremath{\\succeq}',                              # SUCCEEDS ABOVE SINGLE-LINE EQUALS SIGN [⪰]",
    "\U2AB5"='\\ensuremath{\\precneqq}',                            # PRECEDES ABOVE NOT EQUAL TO [⪵]",
    "\U2AB6"='\\ensuremath{\\succneqq}',                            # SUCCEEDS ABOVE NOT EQUAL TO [⪶]",
    "\U2AB7"='\\ensuremath{\\precapprox}',                          # PRECEDES ABOVE ALMOST EQUAL TO [⪷]",
    "\U2AB8"='\\ensuremath{\\succapprox}',                          # SUCCEEDS ABOVE ALMOST EQUAL TO [⪸]",
    "\U2AB9"='\\ensuremath{\\precnapprox}',                         # PRECEDES ABOVE NOT ALMOST EQUAL TO [⪹]",
    "\U2ABA"='\\ensuremath{\\succna pprox}',                         # SUCCEEDS ABOVE NOT ALMOST EQUAL TO [⪺]",
    "\U2AC5"='\\ensuremath{\\subseteqq}',                           # SUBSET OF ABOVE EQUALS SIGN [⫅]",
    "\U2AC6"='\\ensuremath{\\supseteqq}',                           # SUPERSET OF ABOVE EQUALS SIGN [⫆]",
    "\U2ACB"='\\ensuremath{\\subsetneqq}',                          # SUBSET OF ABOVE NOT EQUAL TO [⫋]",
    "\U2ACC"='\\ensuremath{\\supsetneqq}',                          # SUPERSET OF ABOVE NOT EQUAL TO [⫌]",
    "\U2AFD"='\\ensuremath{{{/}\\!\\!{/}}}',                          # DOUBLE SOLIDUS OPERATOR [⫽]")

    # CJK Symbols Punktuation (!) U+3000 : for \langle/\rangle
    "\U3008"='\\ensuremath{\\langle}',
    "\U3009"='\\ensuremath{\\rangle}'
) %>%
  (function(x){
    unicode_names <- names(x)
    dupe_unicode_names <- unique(unicode_names[duplicated(unicode_names)])
    x[!unicode_names %in% c(dupe_unicode_names, LETTERS, letters)]
  })()

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
escape_latex <- function(text) {

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

  m2 <- gregexpr(paste0("[",paste0(names(latex_unicode_chars), collapse = "|"),"]"), text[!na_text], perl = TRUE)

  unicode_chars <- regmatches(text[!na_text], m2)

  # browser()

  latex_unicode <-
    lapply(unicode_chars, function(x) {
      new_var <- latex_unicode_chars[x]
      if(length(new_var) > 0){
        x[!is.na(new_var)] <- new_var[!is.na(new_var)]
      }
      x
    })

  regmatches(text[!na_text], m2) <- latex_unicode
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
        ":ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');"
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
#' font-family"=ockwell, 'Rockwell Nova', 'Roboto Slab', 'DejaVu Serif', 'Sitka Small', serif;
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
