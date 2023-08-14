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
#  Copyright (c) 2018-2023 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


#' Interpret input text as Markdown-formatted text
#'
#' @description
#'
#' Markdown text can be used in certain places in a **gt** table, and this is
#' wherever new text is defined (e.g., footnotes, source notes, the table title,
#' etc.). Using Markdown is advantageous for styling text since it will be
#' rendered correctly to the the output format of the **gt** table. There is
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
#' through the [tab_header()] function, we'll use the `md()` helper to signify
#' to **gt** that we're using Markdown formatting.
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
#' through the [tab_header()] function, we'll use the `html()` helper to signify
#' to **gt** that we're using HTML formatting.
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
#' The `from_column()` function can be used in a variety of formatting functions
#' so that values for common options don't have to be static, they can change in
#' every row (so long as you have a column of compatible option values). Here's
#' an example where we have a table of repeating numeric values along with a
#' column of currency codes. We can format the numbers to currencies with
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
#'   dplyr::select(mfr, ctry_origin) |>
#'   dplyr::group_by(mfr, ctry_origin) |>
#'   dplyr::count() |>
#'   dplyr::ungroup() |>
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
#' *In Development*
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
    cli::cli_abort("The `currency()` function must be provided with currency symbols.")
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
#' 8-7
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
  if (steps > 2.0 | steps < -2.0) {
    cli::cli_abort(
      "The value provided for `steps` (`{steps}`) must be between `-2.0` and `+2.0`."
    )
  }

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

#' Define measurement units with **gt**'s units notation
#'
#' The `define_units()` function is available for working with text in **gt**'s
#' units notation.
#'
#' @param units_notation *Text in specialized units notation*
#'
#'   `scalar<character>` // **required**
#'
#'   A single string that defines the units (e.g., `"m/s"`) to be used.
#'
#' @return An object of class `units_definition`.
#'
#' @section How to use **gt**'s units notation:
#'
#' The units notation involves a shorthand of writing units that feels familiar
#' and is fine-tuned for the task at hand. Each unit is treated as a separate
#' entity (parentheses and other symbols included) and the addition of subscript
#' text and exponents is flexible and relatively easy to formulate. This is all
#' best shown with examples:
#'
#' - `"m/s"` and `"m / s"` both render as `"m/s"`
#' - `"m s^-1"` will appear with the `"-1"` exponent intact
#' - `"m \s"` gives the the same result, as `"\<unit>"` is equivalent to
#'   `"<unit>^-1"`
#' - `"E_h"` will render an `"E"` with the `"h"` subscript
#' - `"t_i^2.5"` provides a `t` with an `"i"` subscript and a `"2.5"` exponent
#' - `"m[_0^2]"` will use overstriking to set both scripts vertically
#' - `"g/L %C6H12O6%"` uses a chemical formula (enclosed in a pair of `"%"`
#'   characters) as a unit partial, and the formula will render correctly with
#'   subscripted numbers
#' - Common units that are difficult to write using ASCII text may be implicitly
#'   converted to the correct characters (e.g., the `"u"` in `"ug"`, `"um"`,
#'   `"uL"`, and `"umol"` will be converted to the Greek *mu* symbol; `"degC"`
#'   and `"degF"` will render a degree sign before the temperature unit)
#' - We can transform shorthand symbol/unit names enclosed in `":"` (e.g.,
#'   `":angstrom:"`, `":ohm:"`, etc.) into proper symbols
#' - The components of a unit (unit name, subscript, and exponent) can be
#'   fully or partially italicized/emboldened by surrounding text with `"*"` or
#'   `"**"`
#'
#' @family helper functions
#' @section Function ID:
#' 8-8
#'
#' @section Function Introduced:
#' *In Development*
#'
#' @export
define_units <- function(units_notation) {

  # Trim any incoming `{{`/`}}`
  input <- gsub("^\\{\\{\\s*|\\s*\\}\\}$", "", units_notation)

  # Get a vector of raw tokens
  tokens_vec <- unlist(strsplit(input, split = " "))

  # Remove any empty tokens
  tokens_vec <- tokens_vec[tokens_vec != ""]

  # Replace any instances of `/<text>` with `<text>^-1`
  tokens_vec <-
    vapply(
      tokens_vec,
      FUN.VALUE = character(1),
      USE.NAMES = FALSE,
      FUN = function(x) {
        if (grepl("^/", x) && nchar(x) > 1) {
          x <- gsub("^/", "", x)
          x <- paste0(x, "^-1")
        }
        x
      }
    )

  units_list <- list()

  for (i in seq_along(tokens_vec)) {

    tokens_vec_i <- tokens_vec[i]

    unit_subscript <- NA_character_
    sub_super_overstrike <- FALSE
    chemical_formula <- FALSE
    exponent <- NULL

    if (
      grepl("^%", tokens_vec_i) &&
      grepl("%$", tokens_vec_i) &&
      nchar(tokens_vec_i) > 2
    ) {
      # Case where the unit is marked as a chemical formula

      chemical_formula <- TRUE

      # Extract the formula w/o the surrounding `%` signs
      unit <- gsub("^%|%$", "", tokens_vec_i)

    } else if (grepl(".+?\\[_.+?\\^.+?\\]", tokens_vec_i)) {
      # Case where both a subscript and exponent are present and
      # an overstrike arrangement is necessary

      sub_super_overstrike <- TRUE

      # Extract the unit w/o subscript from the string
      unit <- gsub("(.+?)\\[_.+?\\^.+?\\]", "\\1", tokens_vec_i)

      # Obtain only the subscript/exponent of the string
      sub_exponent <- gsub(".+?\\[(_.+?\\^.+?)\\]", "\\1", tokens_vec_i)

      # Extract the content after the underscore but terminate
      # before any `^`; this is the subscript
      unit_subscript <- gsub("^_(.+?)(\\^.+?)$", "\\1", sub_exponent)

      # Extract the content after the caret but terminate before
      # any `_`; this is the exponent
      exponent <- gsub("_.+?\\^(.+?)", "\\1", sub_exponent)

    } else if (grepl(".+?_.+?\\^.+?", tokens_vec_i)) {
      # Case where both a subscript and exponent are present and
      # the subscript is set before the exponent

      # Extract the unit w/o subscript from the string
      unit <- gsub("^(.+?)_.+?\\^.+?$", "\\1", tokens_vec_i)

      # Obtain only the subscript/exponent portion of the string
      sub_exponent <- gsub("^.+?(_.+?\\^.+?)$", "\\1", tokens_vec_i)

      # Extract the content after the underscore but terminate
      # before any `^`; this is the subscript
      unit_subscript <- gsub("^_(.+?)\\^.+?$", "\\1", sub_exponent)

      # Extract the content after the caret but terminate before
      # any `_`; this is the exponent
      exponent <- gsub("^_.+?\\^(.+?)$", "\\1", sub_exponent)

    } else if (grepl("^", tokens_vec_i, fixed = TRUE)) {
      # Case where only an exponent is present

      tokens_vec_i_split <- unlist(strsplit(tokens_vec_i, "^", fixed = TRUE))

      unit <- tokens_vec_i_split[1]
      exponent <- tokens_vec_i_split[2]

    } else if (grepl("_", tokens_vec_i, fixed = TRUE)) {
      # Case where only a subscript is present

      tokens_vec_i_split <- unlist(strsplit(tokens_vec_i, "_", fixed = TRUE))

      unit <- tokens_vec_i_split[1]
      unit_subscript <- tokens_vec_i_split[2]

    } else {
      unit <- tokens_vec_i
    }

    units_list[[length(units_list) + 1]] <-
      units_list_item(
        token = tokens_vec_i,
        unit = unit,
        unit_subscript = unit_subscript,
        exponent = exponent,
        chemical_formula = chemical_formula,
        sub_super_overstrike = sub_super_overstrike
      )
  }

  names(units_list) <- tokens_vec
  class(units_list) <- "units_definition"

  units_list
}

units_list_item <- function(
    token,
    unit,
    unit_subscript = NULL,
    exponent = NULL,
    sub_super_overstrike = FALSE,
    chemical_formula = FALSE
) {

  list_item <-
    list(
      token = token,
      unit = unit,
      unit_subscript = NA_character_,
      exponent = NA_character_,
      sub_super_overstrike = FALSE,
      chemical_formula = FALSE
    )

  if (!is.null(exponent)) {
    list_item[["exponent"]] <- exponent
  }

  if (!is.null(unit_subscript)) {
    list_item[["unit_subscript"]] <- unit_subscript
  }

  list_item[["sub_super_overstrike"]] <- sub_super_overstrike
  list_item[["chemical_formula"]] <- chemical_formula

  list_item
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
#' 8-9
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

#' Location helper for targeting the table title and subtitle
#'
#' @description
#'
#' The `cells_title()` function is used to target the table title or subtitle
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
#' @section Overview of location helper functions:
#'
#' Location helper functions can be used to target cells with virtually any
#' function that has a `locations` argument. Here is a listing of all of the
#' location helper functions, with locations corresponding roughly from top to
#' bottom of a table:
#'
#' - [cells_title()]: targets the table title or the table subtitle depending on
#' the value given to the `groups` argument (`"title"` or `"subtitle"`).
#' - [cells_stubhead()]: targets the stubhead location, a cell of which is only
#' available when there is a stub; a label in that location can be created by
#' using the [tab_stubhead()] function.
#' - [cells_column_spanners()]: targets the spanner column labels with the
#' `spanners` argument; spanner column labels appear above the column labels.
#' - [cells_column_labels()]: targets the column labels with its `columns`
#' argument.
#' - [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' - [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' - [cells_body()]: targets data cells in the table body using intersections of
#' `columns` and `rows`.
#' - [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' - [cells_grand_summary()]: targets cells of the table's grand summary using
#' intersections of `columns` and `rows`
#' - [cells_stub_summary()]: targets summary row labels in the table stub using
#' the `groups` and `rows` arguments.
#' - [cells_stub_grand_summary()]: targets grand summary row labels in the table
#' stub using the `rows` argument.
#' - [cells_footnotes()]: targets all footnotes in the table footer (cannot be
#' used with [tab_footnote()]).
#' - [cells_source_notes()]: targets all source notes in the table footer
#' (cannot be used with [tab_footnote()]).
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument (e.g., [tab_style()]), multiple locations
#' can be targeted by enclosing several `cells_*()` helper functions in a
#' `list()` (e.g., `list(cells_body(), cells_grand_summary())`).
#'
#' @section Examples:
#'
#' Use a subset of the [`sp500`] dataset to create a small **gt** table. Add a
#' header with a title, and then add a footnote to the title with
#' [tab_footnote()] and `cells_title()` (in `locations`).
#'
#' ```r
#' sp500 |>
#'   dplyr::filter(date >= "2015-01-05" & date <="2015-01-10") |>
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
#' @family helper functions
#' @section Function ID:
#' 8-10
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @import rlang
#' @export
cells_title <- function(groups = c("title", "subtitle")) {

  # Stop function if the `groups` input is invalid
  if (
    is.null(groups) ||
    !is.character(groups) ||
    length(groups) < 1 ||
    !all(groups %in% c("title", "subtitle")) ||
    any(duplicated(groups))
  ) {
    cli::cli_abort(
      "The input to `groups` must be either \"title\", \"subtitle\", or both."
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

#' Location helper for targeting the table stubhead cell
#'
#' @description
#'
#' The `cells_stubhead()` function is used to target the table stubhead location
#' when applying a footnote with [tab_footnote()] or adding custom style with
#' [tab_style()]. The function is expressly used in each of those functions'
#' `locations` argument. The 'stubhead' location is always present alongside the
#' 'stub' location.
#'
#' @return A list object with the classes `cells_stubhead` and `location_cells`.
#'
#' @section Overview of location helper functions:
#'
#' Location helper functions can be used to target cells with virtually any
#' function that has a `locations` argument. Here is a listing of all of the
#' location helper functions, with locations corresponding roughly from top to
#' bottom of a table:
#'
#' - [cells_title()]: targets the table title or the table subtitle depending on
#' the value given to the `groups` argument (`"title"` or `"subtitle"`).
#' - [cells_stubhead()]: targets the stubhead location, a cell of which is only
#' available when there is a stub; a label in that location can be created by
#' using the [tab_stubhead()] function.
#' - [cells_column_spanners()]: targets the spanner column labels with the
#' `spanners` argument; spanner column labels appear above the column labels.
#' - [cells_column_labels()]: targets the column labels with its `columns`
#' argument.
#' - [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' - [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' - [cells_body()]: targets data cells in the table body using intersections of
#' `columns` and `rows`.
#' - [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' - [cells_grand_summary()]: targets cells of the table's grand summary using
#' intersections of `columns` and `rows`
#' - [cells_stub_summary()]: targets summary row labels in the table stub using
#' the `groups` and `rows` arguments.
#' - [cells_stub_grand_summary()]: targets grand summary row labels in the table
#' stub using the `rows` argument.
#' - [cells_footnotes()]: targets all footnotes in the table footer (cannot be
#' used with [tab_footnote()]).
#' - [cells_source_notes()]: targets all source notes in the table footer
#' (cannot be used with [tab_footnote()]).
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument (e.g., [tab_style()]), multiple locations
#' can be targeted by enclosing several `cells_*()` helper functions in a
#' `list()` (e.g., `list(cells_body(), cells_grand_summary())`).
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
#' @family helper functions
#' @section Function ID:
#' 8-11
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

#' Location helper for targeting the column spanners
#'
#' @description
#'
#' The `cells_column_spanners()` function is used to target the cells that
#' contain the table column spanners. This is useful when applying a footnote
#' with [tab_footnote()] or adding custom style with [tab_style()]. The function
#' is expressly used in each of those functions' `locations` argument. The
#' 'column_spanners' location is generated by one or more uses of the
#' [tab_spanner()] function or the [tab_spanner_delim()] function.
#'
#' @param spanners *Specification of spanner IDs*
#'
#'   `<spanner-targeting expression>` // *default:* `everything()`
#'
#'   The spanners to which targeting operations are constrained. Can either be a
#'   series of spanner ID values provided in [c()] or a select helper function.
#'   Examples of select helper functions include [starts_with()], [ends_with()],
#'   [contains()], [matches()], [one_of()], [num_range()], and [everything()].
#'
#' @return A list object with the classes `cells_column_spanners` and
#' `location_cells`.
#'
#' @section Overview of location helper functions:
#'
#' Location helper functions can be used to target cells with virtually any
#' function that has a `locations` argument. Here is a listing of all of the
#' location helper functions, with locations corresponding roughly from top to
#' bottom of a table:
#'
#' - [cells_title()]: targets the table title or the table subtitle depending on
#' the value given to the `groups` argument (`"title"` or `"subtitle"`).
#' - [cells_stubhead()]: targets the stubhead location, a cell of which is only
#' available when there is a stub; a label in that location can be created by
#' using the [tab_stubhead()] function.
#' - [cells_column_spanners()]: targets the spanner column labels with the
#' `spanners` argument; spanner column labels appear above the column labels.
#' - [cells_column_labels()]: targets the column labels with its `columns`
#' argument.
#' - [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' - [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' - [cells_body()]: targets data cells in the table body using intersections of
#' `columns` and `rows`.
#' - [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' - [cells_grand_summary()]: targets cells of the table's grand summary using
#' intersections of `columns` and `rows`
#' - [cells_stub_summary()]: targets summary row labels in the table stub using
#' the `groups` and `rows` arguments.
#' - [cells_stub_grand_summary()]: targets grand summary row labels in the table
#' stub using the `rows` argument.
#' - [cells_footnotes()]: targets all footnotes in the table footer (cannot be
#' used with [tab_footnote()]).
#' - [cells_source_notes()]: targets all source notes in the table footer
#' (cannot be used with [tab_footnote()]).
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument (e.g., [tab_style()]), multiple locations
#' can be targeted by enclosing several `cells_*()` helper functions in a
#' `list()` (e.g., `list(cells_body(), cells_grand_summary())`).
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
#' @family helper functions
#' @section Function ID:
#' 8-12
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @import rlang
#' @export
cells_column_spanners <- function(spanners = everything()) {

  # Capture expression for the `spanners` argument
  spanners_expr <- rlang::enquo(spanners)

  # Create the `cells` object
  cells <- list(spanners = spanners_expr)

  # Apply the `cells_column_spanners` and `location_cells` classes
  class(cells) <- c("cells_column_spanners", "location_cells")

  cells
}

#' Location helper for targeting the column labels
#'
#' @description
#'
#' The `cells_column_labels()` function is used to target the table's column
#' labels when applying a footnote with [tab_footnote()] or adding custom style
#' with [tab_style()]. The function is expressly used in each of those
#' functions' `locations` argument. The 'column_labels' location is present by
#' default in every **gt** table.
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns to which targeting operations are constrained. Can either
#'   be a series of column names provided in [c()], a vector of column indices,
#'   or a select helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()].
#'
#' @return A list object with the classes `cells_column_labels` and
#'   `location_cells`.
#'
#' @section Overview of location helper functions:
#'
#' Location helper functions can be used to target cells with virtually any
#' function that has a `locations` argument. Here is a listing of all of the
#' location helper functions, with locations corresponding roughly from top to
#' bottom of a table:
#'
#' - [cells_title()]: targets the table title or the table subtitle depending on
#' the value given to the `groups` argument (`"title"` or `"subtitle"`).
#' - [cells_stubhead()]: targets the stubhead location, a cell of which is only
#' available when there is a stub; a label in that location can be created by
#' using the [tab_stubhead()] function.
#' - [cells_column_spanners()]: targets the spanner column labels with the
#' `spanners` argument; spanner column labels appear above the column labels.
#' - [cells_column_labels()]: targets the column labels with its `columns`
#' argument.
#' - [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' - [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' - [cells_body()]: targets data cells in the table body using intersections of
#' `columns` and `rows`.
#' - [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' - [cells_grand_summary()]: targets cells of the table's grand summary using
#' intersections of `columns` and `rows`
#' - [cells_stub_summary()]: targets summary row labels in the table stub using
#' the `groups` and `rows` arguments.
#' - [cells_stub_grand_summary()]: targets grand summary row labels in the table
#' stub using the `rows` argument.
#' - [cells_footnotes()]: targets all footnotes in the table footer (cannot be
#' used with [tab_footnote()]).
#' - [cells_source_notes()]: targets all source notes in the table footer
#' (cannot be used with [tab_footnote()]).
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument (e.g., [tab_style()]), multiple locations
#' can be targeted by enclosing several `cells_*()` helper functions in a
#' `list()` (e.g., `list(cells_body(), cells_grand_summary())`).
#'
#' @section Targeting columns with the `columns` argument:
#'
#' The `columns` argument allows us to target a subset of columns contained in
#' the table. We can declare column names in `c()` (with bare column names or
#' names in quotes) or we can use **tidyselect**-style expressions. This can be
#' as basic as supplying a select helper like `starts_with()`, or, providing a
#' more complex incantation like
#'
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
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
#' @family helper functions
#' @section Function ID:
#' 8-13
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @import rlang
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

#' Location helper for targeting row groups
#'
#' @description
#'
#' The `cells_row_groups()` function is used to target the table's row groups
#' when applying a footnote with [tab_footnote()] or adding custom style with
#' [tab_style()]. The function is expressly used in each of those functions'
#' `locations` argument. The 'row_groups' location can be generated by the
#' specifying a `groupname_col` in [gt()], by introducing grouped data to [gt()]
#' (by way of [dplyr::group_by()]), or, by specifying groups with the
#' [tab_row_group()] function.
#'
#' @param groups *Specification of row group IDs*
#'
#'   `<row-group-targeting expression>` // *default:* `everything()`
#'
#'   The row groups to which targeting operations are constrained. Can either be
#'   a series of row group ID values provided in [c()] or a select helper
#'   function. Examples of select helper functions include [starts_with()],
#'   [ends_with()], [contains()], [matches()], [one_of()], [num_range()], and
#'   [everything()].
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
#' @section Overview of location helper functions:
#'
#' Location helper functions can be used to target cells with virtually any
#' function that has a `locations` argument. Here is a listing of all of the
#' location helper functions, with locations corresponding roughly from top to
#' bottom of a table:
#'
#' - [cells_title()]: targets the table title or the table subtitle depending on
#' the value given to the `groups` argument (`"title"` or `"subtitle"`).
#' - [cells_stubhead()]: targets the stubhead location, a cell of which is only
#' available when there is a stub; a label in that location can be created by
#' using the [tab_stubhead()] function.
#' - [cells_column_spanners()]: targets the spanner column labels with the
#' `spanners` argument; spanner column labels appear above the column labels.
#' - [cells_column_labels()]: targets the column labels with its `columns`
#' argument.
#' - [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' - [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' - [cells_body()]: targets data cells in the table body using intersections of
#' `columns` and `rows`.
#' - [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' - [cells_grand_summary()]: targets cells of the table's grand summary using
#' intersections of `columns` and `rows`
#' - [cells_stub_summary()]: targets summary row labels in the table stub using
#' the `groups` and `rows` arguments.
#' - [cells_stub_grand_summary()]: targets grand summary row labels in the table
#' stub using the `rows` argument.
#' - [cells_footnotes()]: targets all footnotes in the table footer (cannot be
#' used with [tab_footnote()]).
#' - [cells_source_notes()]: targets all source notes in the table footer
#' (cannot be used with [tab_footnote()]).
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument (e.g., [tab_style()]), multiple locations
#' can be targeted by enclosing several `cells_*()` helper functions in a
#' `list()` (e.g., `list(cells_body(), cells_grand_summary())`).
#'
#' @section Examples:
#'
#' Let's use a summarized version of the [`pizzaplace`] dataset to create a
#' **gt** table with grouped data. Add a summary with the [summary_rows()]
#' function and then add a footnote to the `"peppr_salami"` row group label with
#' [tab_footnote()]; the targeting is done with `cells_row_groups()` in the
#' `locations` argument.
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
#' @family helper functions
#' @section Function ID:
#' 8-14
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @import rlang
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
    "*" = "Please use the `cells_row_groups()` function instead."
  ),
  .frequency = "regularly",
  .frequency_id = "cells_group_fn_deprecation"
  )

  cells_row_groups(groups = {{groups}})
}

#' Location helper for targeting cells in the table stub
#'
#' @description
#'
#' The `cells_stub()` function is used to target the table's stub cells and it
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
#'   Alternatively, we can supply a vector of row captions within [c()], a
#'   vector of row indices, or a select helper function. Examples of select
#'   helper functions include [starts_with()], [ends_with()], [contains()],
#'   [matches()], [one_of()], [num_range()], and [everything()]. We can also use
#'   expressions to filter down to the rows we need (e.g., `[colname_1] > 100 &
#'   [colname_2] < 50`).
#'
#' @return A list object with the classes `cells_stub` and `location_cells`.
#'
#' @section Overview of location helper functions:
#'
#' Location helper functions can be used to target cells with virtually any
#' function that has a `locations` argument. Here is a listing of all of the
#' location helper functions, with locations corresponding roughly from top to
#' bottom of a table:
#'
#' - [cells_title()]: targets the table title or the table subtitle depending on
#' the value given to the `groups` argument (`"title"` or `"subtitle"`).
#' - [cells_stubhead()]: targets the stubhead location, a cell of which is only
#' available when there is a stub; a label in that location can be created by
#' using the [tab_stubhead()] function.
#' - [cells_column_spanners()]: targets the spanner column labels with the
#' `spanners` argument; spanner column labels appear above the column labels.
#' - [cells_column_labels()]: targets the column labels with its `columns`
#' argument.
#' - [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' - [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' - [cells_body()]: targets data cells in the table body using intersections of
#' `columns` and `rows`.
#' - [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' - [cells_grand_summary()]: targets cells of the table's grand summary using
#' intersections of `columns` and `rows`
#' - [cells_stub_summary()]: targets summary row labels in the table stub using
#' the `groups` and `rows` arguments.
#' - [cells_stub_grand_summary()]: targets grand summary row labels in the table
#' stub using the `rows` argument.
#' - [cells_footnotes()]: targets all footnotes in the table footer (cannot be
#' used with [tab_footnote()]).
#' - [cells_source_notes()]: targets all source notes in the table footer
#' (cannot be used with [tab_footnote()]).
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument (e.g., [tab_style()]), multiple locations
#' can be targeted by enclosing several `cells_*()` helper functions in a
#' `list()` (e.g., `list(cells_body(), cells_grand_summary())`).
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
#'   tidyr::spread(key = "tst", value = sza) |>
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
#' @family helper functions
#' @section Function ID:
#' 8-15
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @import rlang
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

#' Location helper for targeting data cells in the table body
#'
#' @description
#'
#' The `cells_body()` function is used to target the data cells in the table
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
#'   be a series of column names provided in [c()], a vector of column indices,
#'   or a select helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()].
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // *default:* `everything()`
#'
#'   In conjunction with `columns`, we can specify which of their rows should
#'   form a constraint for targeting operations. The default [everything()]
#'   results in all rows in `columns` being formatted. Alternatively, we can
#'   supply a vector of row captions within [c()], a vector of row indices, or a
#'   select helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()]. We can also use expressions to filter
#'   down to the rows we need (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @return A list object with the classes `cells_body` and `location_cells`.
#'
#' @section Overview of location helper functions:
#'
#' Location helper functions can be used to target cells with virtually any
#' function that has a `locations` argument. Here is a listing of all of the
#' location helper functions, with locations corresponding roughly from top to
#' bottom of a table:
#'
#' - [cells_title()]: targets the table title or the table subtitle depending on
#' the value given to the `groups` argument (`"title"` or `"subtitle"`).
#' - [cells_stubhead()]: targets the stubhead location, a cell of which is only
#' available when there is a stub; a label in that location can be created by
#' using the [tab_stubhead()] function.
#' - [cells_column_spanners()]: targets the spanner column labels with the
#' `spanners` argument; spanner column labels appear above the column labels.
#' - [cells_column_labels()]: targets the column labels with its `columns`
#' argument.
#' - [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' - [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' - [cells_body()]: targets data cells in the table body using intersections of
#' `columns` and `rows`.
#' - [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' - [cells_grand_summary()]: targets cells of the table's grand summary using
#' intersections of `columns` and `rows`
#' - [cells_stub_summary()]: targets summary row labels in the table stub using
#' the `groups` and `rows` arguments.
#' - [cells_stub_grand_summary()]: targets grand summary row labels in the table
#' stub using the `rows` argument.
#' - [cells_footnotes()]: targets all footnotes in the table footer (cannot be
#' used with [tab_footnote()]).
#' - [cells_source_notes()]: targets all source notes in the table footer
#' (cannot be used with [tab_footnote()]).
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument (e.g., [tab_style()]), multiple locations
#' can be targeted by enclosing several `cells_*()` helper functions in a
#' `list()` (e.g., `list(cells_body(), cells_grand_summary())`).
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
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
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
#'     )
#'   ) |>
#'   opt_footnote_marks(marks = c("*", "+"))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cells_body_1.png")`
#' }}
#'
#' @family helper functions
#' @section Function ID:
#' 8-16
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @import rlang
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

#' Location helper for targeting group summary cells
#'
#' @description
#'
#' The `cells_summary()` function is used to target the cells in a group summary
#' and it is useful when applying a footnote with [tab_footnote()] or adding a
#' custom style with [tab_style()]. The function is expressly used in each of
#' those functions' `locations` argument. The 'summary' location is generated by
#' the [summary_rows()] function.
#'
#' @param groups *Specification of row group IDs*
#'
#'   `<row-group-targeting expression>` // *default:* `everything()`
#'
#'   The row groups to which targeting operations are constrained. This aids in
#'   targeting the summary rows that reside in certain row groups. Can either be
#'   a series of row group ID values provided in [c()] or a select helper
#'   function. Examples of select helper functions include [starts_with()],
#'   [ends_with()], [contains()], [matches()], [one_of()], [num_range()], and
#'   [everything()].
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns to which targeting operations are constrained. Can either
#'   be a series of column names provided in [c()], a vector of column indices,
#'   or a select helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()].
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // *default:* `everything()`
#'
#'   In conjunction with `columns`, we can specify which of their rows should
#'   form a constraint for targeting operations. The default [everything()]
#'   results in all rows in `columns` being formatted. Alternatively, we can
#'   supply a vector of row captions within [c()], a vector of row indices, or a
#'   select helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()]. We can also use expressions to filter
#'   down to the rows we need (e.g., `[colname_1] > 100 & [colname_2] < 50`).
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
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
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
#' @section Overview of location helper functions:
#'
#' Location helper functions can be used to target cells with virtually any
#' function that has a `locations` argument. Here is a listing of all of the
#' location helper functions, with locations corresponding roughly from top to
#' bottom of a table:
#'
#' - [cells_title()]: targets the table title or the table subtitle depending on
#' the value given to the `groups` argument (`"title"` or `"subtitle"`).
#' - [cells_stubhead()]: targets the stubhead location, a cell of which is only
#' available when there is a stub; a label in that location can be created by
#' using the [tab_stubhead()] function.
#' - [cells_column_spanners()]: targets the spanner column labels with the
#' `spanners` argument; spanner column labels appear above the column labels.
#' - [cells_column_labels()]: targets the column labels with its `columns`
#' argument.
#' - [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' - [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' - [cells_body()]: targets data cells in the table body using intersections of
#' `columns` and `rows`.
#' - [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' - [cells_grand_summary()]: targets cells of the table's grand summary using
#' intersections of `columns` and `rows`
#' - [cells_stub_summary()]: targets summary row labels in the table stub using
#' the `groups` and `rows` arguments.
#' - [cells_stub_grand_summary()]: targets grand summary row labels in the table
#' stub using the `rows` argument.
#' - [cells_footnotes()]: targets all footnotes in the table footer (cannot be
#' used with [tab_footnote()]).
#' - [cells_source_notes()]: targets all source notes in the table footer
#' (cannot be used with [tab_footnote()]).
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument (e.g., [tab_style()]), multiple locations
#' can be targeted by enclosing several `cells_*()` helper functions in a
#' `list()` (e.g., `list(cells_body(), cells_grand_summary())`).
#'
#' @section Examples:
#'
#' Use a portion of the [`countrypops`] dataset to create a **gt** table. Add
#' some styling to the summary data cells with with [tab_style()], using
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
#' @family helper functions
#' @section Function ID:
#' 8-17
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @import rlang
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

#' Location helper for targeting cells in a grand summary
#'
#' @description
#'
#' The `cells_grand_summary()` function is used to target the cells in a grand
#' summary and it is useful when applying a footnote with [tab_footnote()] or
#' adding custom styles with [tab_style()]. The function is expressly used in
#' each of those functions' `locations` argument. The 'grand_summary' location
#' is generated by the [grand_summary_rows()] function.
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns to which targeting operations are constrained. Can either
#'   be a series of column names provided in [c()], a vector of column indices,
#'   or a select helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()].
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // *default:* `everything()`
#'
#'   In conjunction with `columns`, we can specify which of their rows should
#'   form a constraint for targeting operations. The default [everything()]
#'   results in all rows in `columns` being formatted. Alternatively, we can
#'   supply a vector of row captions within [c()], a vector of row indices, or a
#'   select helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()]. We can also use expressions to filter
#'   down to the rows we need (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @return A list object with the classes `cells_grand_summary` and
#'   `location_cells`.
#'
#' @section Overview of location helper functions:
#'
#' Location helper functions can be used to target cells with virtually any
#' function that has a `locations` argument. Here is a listing of all of the
#' location helper functions, with locations corresponding roughly from top to
#' bottom of a table:
#'
#' - [cells_title()]: targets the table title or the table subtitle depending on
#' the value given to the `groups` argument (`"title"` or `"subtitle"`).
#' - [cells_stubhead()]: targets the stubhead location, a cell of which is only
#' available when there is a stub; a label in that location can be created by
#' using the [tab_stubhead()] function.
#' - [cells_column_spanners()]: targets the spanner column labels with the
#' `spanners` argument; spanner column labels appear above the column labels.
#' - [cells_column_labels()]: targets the column labels with its `columns`
#' argument.
#' - [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' - [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' - [cells_body()]: targets data cells in the table body using intersections of
#' `columns` and `rows`.
#' - [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' - [cells_grand_summary()]: targets cells of the table's grand summary using
#' intersections of `columns` and `rows`
#' - [cells_stub_summary()]: targets summary row labels in the table stub using
#' the `groups` and `rows` arguments.
#' - [cells_stub_grand_summary()]: targets grand summary row labels in the table
#' stub using the `rows` argument.
#' - [cells_footnotes()]: targets all footnotes in the table footer (cannot be
#' used with [tab_footnote()]).
#' - [cells_source_notes()]: targets all source notes in the table footer
#' (cannot be used with [tab_footnote()]).
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument (e.g., [tab_style()]), multiple locations
#' can be targeted by enclosing several `cells_*()` helper functions in a
#' `list()` (e.g., `list(cells_body(), cells_grand_summary())`).
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
#' `where(~ is.numeric(.x) && max(.x, na.rm = TRUE) > 1E6)`
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
#' some styling to a grand summary cells with the [tab_style()] function and
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
#' @family helper functions
#' @section Function ID:
#' 8-18
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @import rlang
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

#' Location helper for targeting the stub cells in a summary
#'
#' @description
#'
#' The `cells_stub_summary()` function is used to target the stub cells of
#' summary and it is useful when applying a footnote with [tab_footnote()] or
#' adding custom styles with [tab_style()]. The function is expressly used in
#' each of those functions' `locations` argument. The 'stub_summary' location is
#' generated by the [summary_rows()] function.
#'
#' @param groups *Specification of row group IDs*
#'
#'   `<row-group-targeting expression>` // *default:* `everything()`
#'
#'   The row groups to which targeting operations are constrained. Can either be
#'   a series of row group ID values provided in [c()] or a select helper
#'   function. Examples of select helper functions include [starts_with()],
#'   [ends_with()], [contains()], [matches()], [one_of()], [num_range()], and
#'   [everything()].
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // *default:* `everything()`
#'
#'   In conjunction with `groups`, we can specify which of their rows should
#'   form a constraint for targeting operations. The default [everything()]
#'   results in all rows in `columns` being formatted. Alternatively, we can
#'   supply a vector of row captions within [c()], a vector of row indices, or a
#'   select helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()]. We can also use expressions to filter
#'   down to the rows we need (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @return A list object with the classes `cells_stub_summary` and
#'   `location_cells`.
#'
#' @section Overview of location helper Functions:
#'
#' Location helper functions can be used to target cells with virtually any
#' function that has a `locations` argument. Here is a listing of all of the
#' location helper functions, with locations corresponding roughly from top to
#' bottom of a table:
#'
#' - [cells_title()]: targets the table title or the table subtitle depending on
#' the value given to the `groups` argument (`"title"` or `"subtitle"`).
#' - [cells_stubhead()]: targets the stubhead location, a cell of which is only
#' available when there is a stub; a label in that location can be created by
#' using the [tab_stubhead()] function.
#' - [cells_column_spanners()]: targets the spanner column labels with the
#' `spanners` argument; spanner column labels appear above the column labels.
#' - [cells_column_labels()]: targets the column labels with its `columns`
#' argument.
#' - [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' - [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' - [cells_body()]: targets data cells in the table body using intersections of
#' `columns` and `rows`.
#' - [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' - [cells_grand_summary()]: targets cells of the table's grand summary using
#' intersections of `columns` and `rows`
#' - [cells_stub_summary()]: targets summary row labels in the table stub using
#' the `groups` and `rows` arguments.
#' - [cells_stub_grand_summary()]: targets grand summary row labels in the table
#' stub using the `rows` argument.
#' - [cells_footnotes()]: targets all footnotes in the table footer (cannot be
#' used with [tab_footnote()]).
#' - [cells_source_notes()]: targets all source notes in the table footer
#' (cannot be used with [tab_footnote()]).
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument (e.g., [tab_style()]), multiple locations
#' can be targeted by enclosing several `cells_*()` helper functions in a
#' `list()` (e.g., `list(cells_body(), cells_grand_summary())`).
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
#' @family helper functions
#' @section Function ID:
#' 8-19
#'
#' @section Function Introduced:
#' `v0.3.0` (May 12, 2021)
#'
#' @import rlang
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

#' Location helper for targeting the stub cells in a grand summary
#'
#' @description
#'
#' The `cells_stub_grand_summary()` function is used to target the stub cells of
#' a grand summary and it is useful when applying a footnote with
#' [tab_footnote()] or adding custom styles with [tab_style()]. The function is
#' expressly used in each of those functions' `locations` argument. The
#' 'stub_grand_summary' location is generated by the [grand_summary_rows()]
#' function.
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // *default:* `everything()`
#'
#'   We can specify which rows should be targeted. The default [everything()]
#'   results in all rows in `columns` being formatted. Alternatively, we can
#'   supply a vector of row captions within [c()], a vector of row indices, or a
#'   select helper function. Examples of select helper functions include
#'   [starts_with()], [ends_with()], [contains()], [matches()], [one_of()],
#'   [num_range()], and [everything()]. We can also use expressions to filter
#'   down to the rows we need (e.g., `[colname_1] > 100 & [colname_2] < 50`).
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
#' @section Overview of location helper functions:
#'
#' Location helper functions can be used to target cells with virtually any
#' function that has a `locations` argument. Here is a listing of all of the
#' location helper functions, with locations corresponding roughly from top to
#' bottom of a table:
#'
#' - [cells_title()]: targets the table title or the table subtitle depending on
#' the value given to the `groups` argument (`"title"` or `"subtitle"`).
#' - [cells_stubhead()]: targets the stubhead location, a cell of which is only
#' available when there is a stub; a label in that location can be created by
#' using the [tab_stubhead()] function.
#' - [cells_column_spanners()]: targets the spanner column labels with the
#' `spanners` argument; spanner column labels appear above the column labels.
#' - [cells_column_labels()]: targets the column labels with its `columns`
#' argument.
#' - [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' - [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' - [cells_body()]: targets data cells in the table body using intersections of
#' `columns` and `rows`.
#' - [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' - [cells_grand_summary()]: targets cells of the table's grand summary using
#' intersections of `columns` and `rows`
#' - [cells_stub_summary()]: targets summary row labels in the table stub using
#' the `groups` and `rows` arguments.
#' - [cells_stub_grand_summary()]: targets grand summary row labels in the table
#' stub using the `rows` argument.
#' - [cells_footnotes()]: targets all footnotes in the table footer (cannot be
#' used with [tab_footnote()]).
#' - [cells_source_notes()]: targets all source notes in the table footer
#' (cannot be used with [tab_footnote()]).
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument (e.g., [tab_style()]), multiple locations
#' can be targeted by enclosing several `cells_*()` helper functions in a
#' `list()` (e.g., `list(cells_body(), cells_grand_summary())`).
#'
#' @section Examples:
#'
#' Use a portion of the [`countrypops`] dataset to create a **gt** table. Add
#' some styling to a grand summary stub cell with the [tab_style()] function and
#' using `cells_stub_grand_summary()` in the `locations` argument.
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
#' @family helper functions
#' @section Function ID:
#' 8-20
#'
#' @section Function Introduced:
#' `v0.3.0` (May 12, 2021)
#'
#' @import rlang
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

#' Location helper for targeting the footnotes
#'
#' @description
#'
#' The `cells_footnotes()` function is used to target all footnotes in the
#' footer section of the table. This is useful for adding custom styles to the
#' footnotes with [tab_style()] (using the `locations` argument). The
#' 'footnotes' location is generated by one or more uses of the [tab_footnote()]
#' function. This location helper function cannot be used for the `locations`
#' argument of [tab_footnote()] and doing so will result in a warning (with no
#' change made to the table).
#'
#' @return A list object with the classes `cells_footnotes` and
#'   `location_cells`.
#'
#' @section Overview of location helper functions:
#'
#' Location helper functions can be used to target cells with virtually any
#' function that has a `locations` argument. Here is a listing of all of the
#' location helper functions, with locations corresponding roughly from top to
#' bottom of a table:
#'
#' - [cells_title()]: targets the table title or the table subtitle depending on
#' the value given to the `groups` argument (`"title"` or `"subtitle"`).
#' - [cells_stubhead()]: targets the stubhead location, a cell of which is only
#' available when there is a stub; a label in that location can be created by
#' using the [tab_stubhead()] function.
#' - [cells_column_spanners()]: targets the spanner column labels with the
#' `spanners` argument; spanner column labels appear above the column labels.
#' - [cells_column_labels()]: targets the column labels with its `columns`
#' argument.
#' - [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' - [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' - [cells_body()]: targets data cells in the table body using intersections of
#' `columns` and `rows`.
#' - [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' - [cells_grand_summary()]: targets cells of the table's grand summary using
#' intersections of `columns` and `rows`
#' - [cells_stub_summary()]: targets summary row labels in the table stub using
#' the `groups` and `rows` arguments.
#' - [cells_stub_grand_summary()]: targets grand summary row labels in the table
#' stub using the `rows` argument.
#' - [cells_footnotes()]: targets all footnotes in the table footer (cannot be
#' used with [tab_footnote()]).
#' - [cells_source_notes()]: targets all source notes in the table footer
#' (cannot be used with [tab_footnote()]).
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument (e.g., [tab_style()]), multiple locations
#' can be targeted by enclosing several `cells_*()` helper functions in a
#' `list()` (e.g., `list(cells_body(), cells_grand_summary())`).
#'
#' @section Examples:
#'
#' Using a subset of the [`sza`] dataset, let's create a **gt** table. We'd like
#' to color the `sza` column so that's done with the [data_color()] function. We
#' can add a footnote through the [tab_footnote()] function and we can also
#' style the footnotes section. The styling is done through the use of the
#' [tab_style()] function and to target the footnotes we use `locations =
#' cells_footnotes()`.
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
#' @family helper functions
#' @section Function ID:
#' 8-21
#'
#' @section Function Introduced:
#' `v0.3.0` (May 12, 2021)
#'
#' @import rlang
#' @export
cells_footnotes <- function() {

  # Create the `cells` object
  cells <- list(groups = "footnotes")

  # Apply the `cells_footnotes` and `location_cells` classes
  class(cells) <- c("cells_footnotes", "location_cells")

  cells
}

#' Location helper for targeting the source notes
#'
#' @description
#'
#' The `cells_source_notes()` function is used to target all source notes in the
#' footer section of the table. This is useful for adding custom styles to the
#' source notes with [tab_style()] (using the `locations` argument). The
#' 'source_notes' location is generated by the [tab_source_note()] function.
#' This location helper function cannot be used for the `locations` argument of
#' [tab_footnote()] and doing so will result in a warning (with no change made
#' to the table).
#'
#' @return A list object with the classes `cells_source_notes` and
#'   `location_cells`.
#'
#' @section Overview of location helper functions:
#'
#' Location helper functions can be used to target cells with virtually any
#' function that has a `locations` argument. Here is a listing of all of the
#' location helper functions, with locations corresponding roughly from top to
#' bottom of a table:
#'
#' - [cells_title()]: targets the table title or the table subtitle depending on
#' the value given to the `groups` argument (`"title"` or `"subtitle"`).
#' - [cells_stubhead()]: targets the stubhead location, a cell of which is only
#' available when there is a stub; a label in that location can be created by
#' using the [tab_stubhead()] function.
#' - [cells_column_spanners()]: targets the spanner column labels with the
#' `spanners` argument; spanner column labels appear above the column labels.
#' - [cells_column_labels()]: targets the column labels with its `columns`
#' argument.
#' - [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' - [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' - [cells_body()]: targets data cells in the table body using intersections of
#' `columns` and `rows`.
#' - [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' - [cells_grand_summary()]: targets cells of the table's grand summary using
#' intersections of `columns` and `rows`
#' - [cells_stub_summary()]: targets summary row labels in the table stub using
#' the `groups` and `rows` arguments.
#' - [cells_stub_grand_summary()]: targets grand summary row labels in the table
#' stub using the `rows` argument.
#' - [cells_footnotes()]: targets all footnotes in the table footer (cannot be
#' used with [tab_footnote()]).
#' - [cells_source_notes()]: targets all source notes in the table footer
#' (cannot be used with [tab_footnote()]).
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument (e.g., [tab_style()]), multiple locations
#' can be targeted by enclosing several `cells_*()` helper functions in a
#' `list()` (e.g., `list(cells_body(), cells_grand_summary())`).
#'
#' @section Examples:
#'
#' Let's use a subset of the [`gtcars`] dataset to create a **gt** table. Add a
#' source note (with [tab_source_note()]) and style the source notes section
#' inside the [tab_style()] call by using the `cells_source_notes()` helper
#' function for the targeting via the `locations` argument.
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
#' @family helper functions
#' @section Function ID:
#' 8-22
#'
#' @section Function Introduced:
#' `v0.3.0` (May 12, 2021)
#'
#' @import rlang
#' @export
cells_source_notes <- function() {

  # Create the `cells` object
  cells <- list(groups = "source_notes")

  # Apply the `cells_source_notes` and `location_cells` classes
  class(cells) <- c("cells_source_notes", "location_cells")

  cells
}

#' Helper for defining custom text styles for table cells
#'
#' @description
#'
#' This helper function is to be used with the [tab_style()] function, which
#' itself allows for the setting of custom styles to one or more cells. We can
#' also define several styles within a single call of `cell_text()` and
#' [tab_style()] will reliably apply those styles to the targeted element.
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
#'   represent `px` values (or could be wrapped in the [px()]) helper function.
#'   We can also use one of the following absolute size keywords: `"xx-small"`,
#'   `"x-small"`, `"small"`, `"medium"`, `"large"`, `"x-large"`, or
#'   `"xx-large"`.
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
#' @param align *Text alignment*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   The text in a cell can be aligned though one of the following options:
#'   `"center"`, `"left"`, `"right"`, or `"justify"`.
#'
#' @param v_align *Vertical alignment*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   The vertical alignment of the text in the cell can be modified through the
#'   options `"middle"`, `"top"`, or `"bottom"`.
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
#'   represent `px` values (or could be wrapped in the [px()]) helper function.
#'   Alternatively, this can be given as a percentage (easily constructed with
#'   [pct()]).
#'
#' @return A list object of class `cell_styles`.
#'
#' @section Examples:
#'
#' Let's use the [`exibble`] dataset to create a simple, two-column **gt** table
#' (keeping only the `num` and `currency` columns). With the [tab_style()]
#' function (called twice), we'll selectively add style to the values formatted
#' by [fmt_number()]. We do this by using the `cell_text()` helper function in
#' the `style` argument of [tab_style()].
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
#' 8-23
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

#' Helper for defining custom fills for table cells
#'
#' @description
#'
#' The `cell_fill()` helper function is to be used with the [tab_style()]
#' function, which itself allows for the setting of custom styles to one or more
#' cells. Specifically, the call to `cell_fill()` should be bound to the
#' `styles` argument of [tab_style()].
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
#' [cells_body()] helper function). With the `cell_fill()` helper funciton we
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
#' 8-24
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cell_fill <- function(
    color = "#D3D3D3",
    alpha = NULL
) {

  if (!inherits(color, "gt_column") && length(color) != 1) {
    cli::cli_abort("The length of the `color` vector must be `1`.")
  }

  if (!is.null(alpha) && !inherits(color, "gt_column") && length(alpha) != 1) {
    cli::cli_abort("If provided, `alpha` must be a single value.")
  }

  # Transform the `color` value, if present, so that X11 color names
  # can be used in all output contexts

  if (!inherits(color, "gt_column")) {
    color <- html_color(colors = color, alpha = alpha)
  }

  style_vals <- list(color = color)

  cell_style_structure("cell_fill", style_vals)
}

cell_style_to_html.cell_fill <- function(style) {

  css <- list()
  css$`background-color` <- style$color

  css
}

#' Helper for defining custom borders for table cells
#'
#' @description
#'
#' The `cell_borders()` helper function is to be used with the [tab_style()]
#' function, which itself allows for the setting of custom styles to one or more
#' cells. Specifically, the call to `cell_borders()` should be bound to the
#' `styles` argument of [tab_style()]. The `selection` argument is where we
#' define which borders should be modified (e.g., `"left"`, `"right"`, etc.).
#' With that selection, the `color`, `style`, and `weight` of the selected
#' borders can then be modified.
#'
#' @param sides *Border sides*
#'
#'   `vector<character>` // *default:* `"all"`
#'
#'   The border sides to be modified. Options include `"left"`,
#'   `"right"`, `"top"`, and `"bottom"`. For all borders surrounding the
#'   selected cells, we can use the `"all"` option.
#'
#' @param color *Border color*
#'
#'   `scalar<character>|NULL` // *default:* `"#000000"`
#'
#'   The border `color` can be defined with a color name or with a hexadecimal
#'   color code. The default `color` value is `"#000000"` (black). Borders for any
#'   defined `sides` can be removed by supplying `NULL` here.
#'
#' @param style *Border line style*
#'
#'   `scalar<character>|NULL` // *default:* `"solid"`
#'
#'   The border `style` can be one of either `"solid"` (the default),
#'   `"dashed"`, `"dotted"`, `"hidden"`, or `"double"`. Borders for any
#'   defined `sides` can be removed by supplying `NULL` here.
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
#' 8-25
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

  if (is.null(weight)) {
    weight <- "0"
  }

  if (is.null(style)) {
    style <- "hidden"
  }

  if (is.null(color)) {
    color <- "transparent"
  }

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
        FUN.VALUE = character(1),
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
          c("solid", "dashed", "dotted", "hidden", "double")
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

#' Helper for creating a random `id` for a **gt** table
#'
#' @description
#'
#' The `random_id()` helper function can be used to create a random,
#' character-based ID value argument of variable length (the default is 10
#' letters).
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
#' 8-26
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

#' Perform LaTeX escaping
#'
#' @description
#'
#' Text may contain several characters with special meanings in LaTeX. The
#' `escape_latex()` function will transform a character vector so that it is
#' safe to use within LaTeX tables.
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
#' 8-27
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
  text
}

#' Get the LaTeX dependencies required for a **gt** table
#'
#' @description
#'
#' When working with Rnw (Sweave) files or otherwise writing LaTeX code,
#' including a **gt** table can be problematic if we don't have knowledge
#' of the LaTeX dependencies. For the most part, these dependencies are the
#' LaTeX packages that are required for rendering a **gt** table. The
#' `gt_latex_dependencies()` function provides an object that can be
#' used to provide the LaTeX in an Rnw file, allowing **gt** tables to work
#' and not yield errors due to missing packages.
#'
#' @details
#' Here is an example Rnw document that shows how the
#' `gt_latex_dependencies()` can be used in conjunction with a **gt**
#' table:
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
#' 8-28
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
gt_latex_dependencies <- function() {

  if (requireNamespace("knitr", quietly = TRUE)) {

    knitr::asis_output(
      paste(
        "",
        "% gt packages",
        paste0("\\usepackage{", latex_packages(), "}", collapse = "\n"),
        "",
        sep = "\n"
      )
    )

  } else {
    cli::cli_abort(c(
      "The `knitr` package is required for getting the LaTeX dependency headers.",
      "*" = "It can be installed with `install.packages(\"knitr\")`."
    ))
  }
}

#' Helper function for specifying a font from the *Google Fonts* service
#'
#' @description
#'
#' The `google_font()` helper function can be used wherever a font name should
#' be specified. There are two instances where this helper can be used: the
#' `name` argument in [opt_table_font()] (for setting a table font) and in that
#' of [cell_text()] (used with [tab_style()]). To get a helpful listing of fonts
#' that work well in tables, use the [info_google_fonts()] function.
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
#' rows. We'll replace missing values with em dashes using the [sub_missing()]
#' function. For text in the `time` column, we will use the font called `"IBM
#' Plex Mono"` which is available in Google Fonts. This is defined in the
#' `google_font()` function call, itself part of a vector that includes fonts
#' returned by the [default_fonts()] function (those fonts will serve as
#' fallbacks just in case the font supplied by Google Fonts is not accessible).
#' In terms of placement, all of this is given to the `font` argument of the
#' [cell_text()] helper function which is itself given to the `style` argument
#' of [tab_style()].
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
#' 8-29
#'
#' @section Function Introduced:
#' `v0.2.2` (August 5, 2020)
#'
#' @export
google_font <- function(name) {

  import_stmt <-
    paste_between(
      gsub(" ", "+", name),
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
#' This vector of fonts is useful when specifying `font` values in the
#' [cell_text()] function (itself usable in the [tab_style()] and
#' [tab_style_body()] functions). If using [opt_table_font()] (which also has a
#' `font` argument) we probably don't need to specify this vector of fonts since
#' that function prepends font names (this is handled by its `add` option, which
#' is `TRUE` by default).
#'
#' @return A character vector of font names.
#'
#' @section Examples:
#'
#' Let's use the [`exibble`] dataset to create a simple, two-column **gt** table
#' (keeping only the `char` and `time` columns). Attempting to modify the fonts
#' used for the `time` column is much safer if `default_fonts()` is appended to
#' the end of the `font` listing in the `cell_text()` call. What will happen,
#' since the `"Comic Sansa"` and `"Menloa"` fonts shouldn't exist, is that we'll
#' get the first available font from vector of fonts that `default_fonts()`
#' provides.
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
#' 8-30
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

#' Get a themed font stack that works well across systems
#'
#' @description
#'
#' A font stack can be obtained from `system_fonts()` using one or various
#' keywords such as `"system-ui"`, `"old-style"`, and `"humanist"` (there are 15
#' in total). These sets comprise a themed font family that has been tested to
#' work across a wide range of computer systems. This is useful when specifying
#' `font` values in the [cell_text()] function (itself used in the [tab_style()]
#' function). If using [opt_table_font()] we can invoke this function in its
#' `stack` argument.
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
#' font-family: Avenir, 'Avenir Next LT Pro', Montserrat, Corbel, 'URW Gothic', source-sans-pro, sans-serif;
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
#' font-family: 'Nimbus Mono PS', 'Courier New', 'Cutive Mono', monospace;
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
#' font-family: ui-rounded, 'Hiragino Maru Gothic ProN', Quicksand, Comfortaa, Manjari, 'Arial Rounded MT Bold', Calibri, source-sans-pro, sans-serif;
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
#' `"Bahnschrift"`, `"DIN Alternate"`, `"Franklin Gothic Medium"`, and `"Nimbus
#' Sans Narrow"` (the generic `"sans-serif-condensed"` and `"sans-serif"` are
#' used if the aforementioned fonts aren't available).
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
#' 8-31
#'
#' @section Function Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
#' @export
system_fonts <- function(name) {
  get_font_stack(name = name, add_emoji = TRUE)
}
