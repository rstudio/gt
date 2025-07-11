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


# tab_style() ------------------------------------------------------------------
#' Add custom styles to one or more cells
#'
#' @description
#'
#' With `tab_style()` we can [target specific cells][location-helper]
#' and apply styles to them. This is best done in conjunction with the helper
#' functions [cell_text()], [cell_fill()], and [cell_borders()]. Currently, this
#' function is focused on the application of styles for HTML output only (as
#' such, other output formats will ignore all `tab_style()` calls). Using the
#' aforementioned helper functions, here are some of the styles we can apply:
#'
#' - the background color of the cell ([cell_fill()]: `color`)
#' - the cell's text color, font, and size ([cell_text()]: `color`, `font`,
#' `size`)
#' - the text style ([cell_text()]: `style`), enabling the use of italics or
#' oblique text.
#' - the text weight ([cell_text()]: `weight`), allowing the use of thin to
#' bold text (the degree of choice is greater with variable fonts)
#' - the alignment and indentation of text ([cell_text()]: `align` and
#' `indent`)
#' - the cell borders ([cell_borders()])
#'
#' @inheritParams fmt_number
#'
#' @param style *Style declarations*
#'
#'   `<style expressions>` // **required**
#'
#'   The styles to use for the cells at the targeted `locations`. The
#'   [cell_text()], [cell_fill()], and [cell_borders()] helper functions can be
#'   used here to more easily generate valid styles. If using more than one
#'   helper function to define styles, all calls must be enclosed in a [list()].
#'   Custom CSS declarations can be used for HTML output by including a
#'   [css()]-based statement as a list item.
#'
#' @param locations *Locations to target*
#'
#'   [`<locations expressions>`][location-helper] // **required**
#'
#'   The cell or set of cells to be associated with the style. Supplying any of
#'   the `cells_*()` helper functions is a useful way to target the location
#'   cells that are associated with the styling. These helper functions are:
#'   [cells_title()], [cells_stubhead()], [cells_column_spanners()],
#'   [cells_column_labels()], [cells_row_groups()], [cells_stub()],
#'   [cells_body()], [cells_summary()], [cells_grand_summary()],
#'   [cells_stub_summary()], [cells_stub_grand_summary()], [cells_footnotes()],
#'   and [cells_source_notes()]. Additionally, we can enclose several
#'   `cells_*()` calls within a `list()` if we wish to apply styling to
#'   different types of locations (e.g., body cells, row group labels, the table
#'   title, etc.).
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Using `from_column()` with `cell_*()` styling functions:
#'
#' [from_column()] can be used with certain arguments of [cell_fill()] and
#' [cell_text()]; this allows you to get parameter values from a specified
#' column within the table. This means that body cells targeted for styling
#' could be formatted a little bit differently, using options taken from a
#' column. For [cell_fill()], we can use [from_column()] for its `color`
#' argument. [cell_text()] allows the use of [from_column()] in the following arguments:
#'
#' - `color`
#' - `size`
#' - `align`
#' - `v_align`
#' - `style`
#' - `weight`
#' - `stretch`
#' - `decorate`
#' - `transform`
#' - `whitespace`
#' - `indent`
#'
#' Please note that for all of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#'
#' Importantly, a `tab_style()` call with any use of [from_column()] within
#' styling expressions must only use [cells_body()] within `locations`. This is
#' because we cannot map multiple options taken from a column onto other
#' locations.
#'
#' @section Examples:
#'
#' Let's use the [`exibble`] dataset to create a simple, two-column **gt** table
#' (keeping only the `num` and `currency` columns). With [tab_style()]
#' (called twice), we'll selectively add style to the values formatted by
#' [fmt_number()]. In the `style` argument of each `tab_style()` call, we can
#' define multiple types of styling with [cell_fill()] and [cell_text()]
#' (enclosed in a list). The cells to be targeted for styling require the use of
#' helpers like [cells_body()], which is used here with different columns and
#' rows being targeted.
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, currency) |>
#'   gt() |>
#'   fmt_number(decimals = 1) |>
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "lightcyan"),
#'       cell_text(weight = "bold")
#'       ),
#'     locations = cells_body(
#'       columns = num,
#'       rows = num >= 5000
#'     )
#'   ) |>
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "#F9E3D6"),
#'       cell_text(style = "italic")
#'       ),
#'     locations = cells_body(
#'       columns = currency,
#'       rows = currency < 100
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_1.png")`
#' }}
#'
#' With a subset of the [`sp500`] dataset, we'll create a different **gt**
#' table. Here, we'll color the background of entire rows of body cells and do
#' so on the basis of value expressions involving the `open` and `close`
#' columns.
#'
#' ```r
#' sp500 |>
#'   dplyr::filter(
#'     date >= "2015-12-01" &
#'     date <= "2015-12-15"
#'   ) |>
#'   dplyr::select(-c(adj_close, volume)) |>
#'   gt() |>
#'   tab_style(
#'     style = cell_fill(color = "lightgreen"),
#'     locations = cells_body(rows = close > open)
#'   ) |>
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "red"),
#'       cell_text(color = "white")
#'       ),
#'     locations = cells_body(rows = open > close)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_2.png")`
#' }}
#'
#' With another two-column table based on the [`exibble`] dataset, let's create
#' a **gt** table. First, we'll replace missing values with [sub_missing()].
#'  Next, we'll add styling to the `char` column. This styling will be
#' HTML-specific and it will involve (all within a list): (1) a [cell_fill()]
#' call (to set a `"lightcyan"` background), and (2) a string containing a CSS
#' style declaration (`"font-variant: small-caps;"`).
#'
#' ```r
#' exibble |>
#'   dplyr::select(char, fctr) |>
#'   gt() |>
#'   sub_missing() |>
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "lightcyan"),
#'       "font-variant: small-caps;"
#'     ),
#'     locations = cells_body(columns = char)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_3.png")`
#' }}
#'
#' In the following table based on the [`towny`] dataset, we'll use a larger
#' number of `tab_style()` calls with the aim of styling each location available
#' in the table. Over six separate uses of `tab_style()`, different body cells
#' are styled with background colors, the header and the footer also receive
#' background color fills, borders are applied to a column of body cells and
#' also to the column labels, and, the row labels in the stub receive a custom
#' text treatment.
#'
#' ```r
#' towny |>
#'   dplyr::filter(csd_type == "city") |>
#'   dplyr::select(
#'     name, land_area_km2, density_2016, density_2021,
#'     population_2016, population_2021
#'   ) |>
#'   dplyr::slice_max(population_2021, n = 5) |>
#'   gt(rowname_col = "name") |>
#'   tab_header(
#'     title = md(paste("Largest Five", fontawesome::fa("city") , "in `towny`")),
#'     subtitle = "Changes in vital numbers from 2016 to 2021."
#'   ) |>
#'   fmt_number(
#'     columns = starts_with("population"),
#'     n_sigfig = 3,
#'     suffixing = TRUE
#'   ) |>
#'   fmt_integer(columns = starts_with("density")) |>
#'   fmt_number(columns = land_area_km2, decimals = 1) |>
#'   cols_merge(
#'     columns = starts_with("density"),
#'     pattern = paste("{1}", fontawesome::fa("arrow-right"), "{2}")
#'   ) |>
#'   cols_merge(
#'     columns = starts_with("population"),
#'     pattern = paste("{1}", fontawesome::fa("arrow-right"), "{2}")
#'   ) |>
#'   cols_label(
#'     land_area_km2 = md("Area, km^2^"),
#'     starts_with("density") ~ md("Density, ppl/km^2^"),
#'     starts_with("population") ~ "Population"
#'   ) |>
#'   cols_align(align = "center", columns = -name) |>
#'   cols_width(
#'     stub() ~ px(125),
#'     everything() ~ px(150)
#'   ) |>
#'   tab_footnote(
#'     footnote = "Data was used from their respective census-year publications.",
#'     locations = cells_title(groups = "subtitle")
#'   ) |>
#'   tab_source_note(source_note = md(
#'     "All figures are compiled in the `towny` dataset (in the **gt** package)."
#'   )) |>
#'   opt_footnote_marks(marks = "letters") |>
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "gray95"),
#'       cell_borders(sides = c("l", "r"), color = "gray50", weight = px(3))
#'     ),
#'     locations = cells_body(columns = land_area_km2)
#'   ) |>
#'   tab_style(
#'     style = cell_fill(color = "lightblue" |> adjust_luminance(steps = 2)),
#'     locations = cells_body(columns = -land_area_km2)
#'   ) |>
#'   tab_style(
#'     style = list(cell_fill(color = "gray35"), cell_text(color = "white")),
#'     locations = list(cells_footnotes(), cells_source_notes())
#'   ) |>
#'   tab_style(
#'     style = cell_fill(color = "gray98"),
#'     locations = cells_title()
#'   ) |>
#'   tab_style(
#'     style = cell_text(
#'       size = "smaller",
#'       weight = "bold",
#'       transform = "uppercase"
#'     ),
#'     locations = cells_stub()
#'   ) |>
#'   tab_style(
#'     style = cell_borders(
#'       sides = c("t", "b"),
#'       color = "powderblue",
#'       weight = px(3)
#'     ),
#'     locations = list(cells_column_labels(), cells_stubhead())
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_4.png")`
#' }}
#'
#' [from_column()] can be used to get values from a column. We'll use it in the
#' next example, which begins with a table having a color name column and a
#' column with the associated hexadecimal color code. To show the color in a
#' separate column, we first create one with [cols_add()] (ensuring that missing
#' values are replaced with `""` via [sub_missing()]). Then, `tab_style()` is
#' used to style that column, using [color = from_column()][from_column()]
#' within [cell_fill()].
#'
#' ```r
#' dplyr::tibble(
#'   name = c(
#'     "red", "green", "blue", "yellow", "orange",
#'     "cyan", "purple", "magenta", "lime", "pink"
#'   ),
#'   hex = c(
#'     "#E6194B", "#3CB44B", "#4363D8", "#FFE119", "#F58231",
#'     "#42D4F4", "#911EB4", "#F032E6", "#BFEF45", "#FABED4"
#'   )
#' ) |>
#'   gt(rowname_col = "name") |>
#'   cols_add(color = rep(NA_character_, 10)) |>
#'   sub_missing(missing_text = "") |>
#'   tab_style(
#'     style = cell_fill(color = from_column(column = "hex")),
#'     locations = cells_body(columns = color)
#'   ) |>
#'   tab_style(
#'     style = cell_text(font = system_fonts(name = "monospace-code")),
#'     locations = cells_body()
#'   ) |>
#'   opt_all_caps() |>
#'   cols_width(everything() ~ px(100)) |>
#'   tab_options(table_body.hlines.style = "none")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_5.png")`
#' }}
#'
#' [cell_text()] also allows the use of [from_column()] for many of its arguments.
#' Let's take a small portion of data from [`sp500`] and add an up or down arrow
#' based on the values in the `open` and `close` columns. Within [cols_add()] we
#' can create a new column (`dir`) with an expression to get either `"red"` or
#' `"green"` text from a comparison of the `open` and `close` values. These
#' values are transformed to up or down arrows with [text_case_match()], using
#' **fontawesome** icons in the end. However, the text values are still present
#' and can be used by [cell_text()] within `tab_style()`. [from_column()] makes
#' it possible to use the text in the cells of the `dir` column as `color` input
#'  values.
#'
#' ```r
#' sp500 |>
#'   dplyr::filter(date > "2015-01-01") |>
#'   dplyr::slice_min(date, n = 5) |>
#'   dplyr::select(date, open, close) |>
#'   gt(rowname_col = "date") |>
#'   fmt_currency(columns = c(open, close)) |>
#'   cols_add(dir = ifelse(close < open, "red", "forestgreen")) |>
#'   cols_label(dir = "") |>
#'   text_case_match(
#'     "red" ~ fontawesome::fa("arrow-down"),
#'     "forestgreen" ~ fontawesome::fa("arrow-up")
#'   ) |>
#'   tab_style(
#'     style = cell_text(color = from_column("dir")),
#'     locations = cells_body(columns = dir)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_style_6.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-10
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @seealso [cell_text()], [cell_fill()], and [cell_borders()] as helpers for
#'   defining custom styles and [cells_body()] as one of many useful helper
#'   functions for targeting the [locations][location-helper] to be styled.
#'
#' @export
tab_style <- function(
    data,
    style,
    locations
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Resolve into a list of locations
  locations <- as_locations(locations)

  # Upgrade `style` to be within a list if not provided as such
  if (inherits(style, "cell_styles")) {
    style <- list(style)
  }

  #
  # Begin support for `from_column()`
  #

  cell_helpers <-
    vapply(
      style,
      FUN.VALUE = character(1L),
      USE.NAMES = FALSE,
      FUN = function(x) {
        x <- names(x) %||% "bare"
        if (any(grepl("cell_border", x))) {
          x <- "cell_border"
        }
        x
      }
    )

  # Set `has_gt_column` as FALSE initially and toggle to TRUE if there is
  # any instance of `from_column()` used (a `gt_column` object will be present)
  has_gt_column <- FALSE

  for (i in seq_along(cell_helpers)) {

    if (!is.character(style) && is.list(style)) {
      style_i <- unlist(style, recursive = FALSE)
    } else {
      style_i <- style
    }

    if (cell_helpers[i] == "bare") {
      any_gt_column <- FALSE
    } else {
      any_gt_column <-
        any(
          vapply(
            style_i[[cell_helpers[i]]],
            FUN.VALUE = logical(1),
            USE.NAMES = FALSE,
            FUN = function(x) {
              inherits(x, "gt_column")
            }
          )
        )
    }

    if (any_gt_column) {
      has_gt_column <- TRUE
    }
  }

  if (has_gt_column) {

    # Stop if `locations` only refers to locations other than `cells_body()`
    for (i in seq_along(locations)) {

      any_non_body_location <-
        any(
          vapply(
            locations,
            FUN.VALUE = logical(1),
            USE.NAMES = FALSE,
            FUN = function(x) {
              !inherits(x, "cells_body")
            }
          )
        )

      if (any_non_body_location) {
        cli::cli_abort(c(
          "If using `from_column()` in a `cell_*()` function, the location helper
          used must be `cells_body().",
          "*" = "Please remove any other location helpers."
        ))
      }
    }

    # TODO: Extract only the body location from the `locations` object
    body_location <- locations[[1]]

    # Remove the outer list from the `style` object
    style <- unlist(style, recursive = FALSE)

    # Resolve the row numbers using the `resolve_rows_i` function
    resolved_rows_idx <-
      resolve_rows_i(
        expr = !!body_location$rows,
        data = data
      )

    for (i in seq_along(style)) {

      arg_vals <- unclass(style[[i]])

      param_tbl <-
        generate_param_tbl(
          data = data,
          arg_vals = arg_vals,
          resolved_rows_idx = resolved_rows_idx
        )

      if (names(style[i]) == "cell_fill") {

        for (j in seq_len(nrow(param_tbl))) {

          p_j <- as.list(param_tbl[j, ])

          data <-
            tab_style(
              data = data,
              style = cell_fill(
                color = p_j$color
              ),
              locations = cells_body(
                columns = !!body_location$columns,
                rows = resolved_rows_idx[j]
              )
            )
        }
      }

      if (names(style[i]) == "cell_text") {

        for (j in seq_len(nrow(param_tbl))) {

          p_j <- as.list(param_tbl[j, ])

          data <-
            tab_style(
              data = data,
              style = cell_text(
                color = p_j$color,
                font = p_j$font,
                size = p_j$size,
                align = p_j$align,
                v_align = p_j$v_align,
                style = p_j$style,
                weight = p_j$weight,
                stretch = p_j$stretch,
                decorate = p_j$decorate,
                transform = p_j$transform,
                whitespace = p_j$whitespace,
                indent = p_j$indent
              ),
              locations = cells_body(
                columns = !!body_location$columns,
                rows = resolved_rows_idx[j]
              )
            )
        }
      }

    }

    return(data)
  }

  #
  # End support for `from_column()`
  #

  # Determine if there is a `cell_text` list within the main list;
  # because we need to intercept any provided `font` inputs in `cell_text`
  # this is the first thing we need to know
  has_cell_text <- "cell_text" %in% names(unlist(style, recursive = FALSE))

  # If the `cell_text` list is present we now need to determine if there
  # is indeed a `font` input within that list
  if (has_cell_text) {

    # The `style` list will itself contain several lists and it's
    # important to identify which one represents `cell_text`
    for (i in seq_along(style)) {
      if ("cell_text" %in% names(style[[i]])) {
        cell_text_idx <- i
      }
    }

    # If the `cell_text` list contains a `font` input then intercept
    # the font styles that require registration
    if ("font" %in% names(style[[cell_text_idx]][["cell_text"]])) {

      font <- style[[cell_text_idx]][["cell_text"]][["font"]]
      font <- normalize_font_input(font_input = font)

      existing_additional_css <-
        dt_options_get_value(
          data = data,
          option = "table_additional_css"
        )

      additional_css <- c(font$import_stmt, existing_additional_css)

      data <-
        tab_options(
          data = data,
          table.additional_css = additional_css
        )

      style[[cell_text_idx]][["cell_text"]][["font"]] <-
        as_css_font_family_attr(
          font_vec = font$name,
          value_only = TRUE
        )
    }
  }

  style <- as_style(style = style)

  # Resolve the locations of the targeted data cells and append
  # the format directives
  for (loc in locations) {

    data <-
      withCallingHandlers(
        set_style(
          loc = loc,
          data = data,
          style = style
        ),
        error = function(e) {
          # remove the cell_ prefix and convert snake case
          # to sentence case
          # cell_grand_summary_row -> grand summary row
          readable_table_part <- attr(loc, "class")[[1]]
          readable_table_part <- sub("cells_", "", readable_table_part, fixed = TRUE)
          readable_table_part <- gsub("_", " ", readable_table_part, fixed = TRUE)

          cli::cli_abort(
            "Failed to style the {readable_table_part} of the table.",
            parent = e
          )
        })
  }

  data
}

# Helpers -------------------------------------------------
as_style <- function(style) {

  # If style rules are part of a list, paste each of the list
  # components together
  if (!inherits(style, "cell_styles")) {

    # Initialize an empty list that will be
    # populated with normalized style declarations
    final_style <- list()

    for (i in seq(style)) {

      style_item <- style[[i]]

      if (inherits(style_item, "character")) {

        style_item <- list(cell_style = style_item)

      } else if (!inherits(style_item, "cell_styles")) {

        cli::cli_abort(c(
          "All provided styles should be generated by stylizing
          helper functions.",
          "*" = "Style with index `{i}` is invalid."
        ))
      }

      final_style <- utils::modifyList(final_style, style_item)
    }

    class(final_style) <- "cell_styles"

    style <- final_style
  }

  style
}

set_style <- function(loc, data, style) {
  UseMethod("set_style")
}

#' @export
set_style.cells_title <- function(loc, data, style) {

  title_components <- rlang::eval_tidy(loc$groups)

  if ("title" %in% title_components) {

    data <-
      dt_styles_add(
        data = data,
        locname = "title",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 1,
        rownum = NA_integer_,
        styles = style
      )
  }

  if ("subtitle" %in% title_components) {

    data <-
      dt_styles_add(
        data = data,
        locname = "subtitle",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 2,
        rownum = NA_integer_,
        styles = style
      )
  }

  data
}

#' @export
set_style.cells_stubhead <- function(loc, data, style) {

  data <-
    dt_styles_add(
      data = data,
      locname = loc$groups,
      grpname = NA_character_,
      colname = NA_character_,
      locnum = 2.5,
      rownum = NA_integer_,
      styles = style
    )

  data
}

#' @export
set_style.cells_column_labels <- function(loc, data, style) {

  call <- call("cells_column_labels")
  resolved <- resolve_cells_column_labels(data = data, object = loc, call = call)

  cols <- resolved$columns

  col_names <- names(cols)

  data <-
    dt_styles_add(
      data = data,
      locname = "columns_columns",
      grpname = NA_character_,
      colname = col_names,
      locnum = 4,
      rownum = NA_integer_,
      styles = style
    )

  data
}

#' @export
set_style.cells_column_spanners <- function(loc, data, style) {
  call <- call("cells_column_spanners")
  resolved <- resolve_cells_column_spanners(data = data, object = loc, call = call)

  groups <- resolved$spanners

  data <-
    dt_styles_add(
      data = data,
      locname = "columns_groups",
      grpname = groups,
      colname = NA_character_,
      locnum = 3,
      rownum = NA_integer_,
      styles = style
    )

  data
}

#' @export
set_style.cells_row_groups <- function(loc, data, style) {

  call <- call("cells_row_groups")
  row_groups <- dt_row_groups_get(data = data)

  # Resolve row groups
  resolved_row_groups_idx <-
    resolve_vector_i(
      expr = !!loc$groups,
      vector = row_groups,
      item_label = "row group",
      call = call
    )

  groups <- row_groups[resolved_row_groups_idx]

  data <-
    dt_styles_add(
      data = data,
      locname = "row_groups",
      grpname = groups,
      colname = NA_character_,
      locnum = 5,
      rownum = NA_integer_,
      styles = style
    )

  data
}

#' @export
set_style.cells_body <- function(loc, data, style) {

  call <- call("cells_body")
  resolved <- resolve_cells_body(data = data, object = loc, call = call)

  rows <- resolved$rows

  colnames <- resolved$colnames

  data <-
    dt_styles_add(
      data = data,
      locname = "data",
      grpname = NA_character_,
      colname = colnames,
      locnum = 5,
      rownum = rows,
      styles = style
    )

  data
}

#' @export
set_style.cells_stub <- function(loc, data, style) {

  call <- call("cells_stub")
  resolved <- resolve_cells_stub(data = data, object = loc, call = call)

  columns <- resolved$columns
  rows <- resolved$rows

  # Get all stub variables for reference
  stub_vars <- dt_boxhead_get_var_stub(data = data)
  
  # Check if this is traditional usage (no columns parameter) 
  # vs. new usage (explicit columns parameter provided)
  is_traditional_usage <- is.null(loc$columns)
  
  if (is_traditional_usage) {
    # For backward compatibility: traditional cells_stub() usage without columns parameter
    # Use the original "stub" locname for compatibility with existing code
    data <-
      dt_styles_add(
        data = data,
        locname = "stub",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 4,
        rownum = rows,
        styles = style
      )
  } else {
    # New usage: per-column stub styling
    # If no stub columns are resolved, apply to all stub columns (backward compatibility)
    if (length(columns) == 0) {
      if (!all(is.na(stub_vars))) {
        columns <- stub_vars
      }
    }
    
    # Apply styling to each specified stub column using stub_column locname
    for (col in columns) {
      data <-
        dt_styles_add(
          data = data,
          locname = "stub_column",  # Special locname for individual stub columns
          grpname = NA_character_,
          colname = col,
          locnum = 4,
          rownum = rows,
          styles = style
        )
    }
  }

  data
}

#' @export
set_style.cells_summary <- function(loc, data, style) {

  add_summary_location_row(
    loc = loc,
    data = data,
    style = style,
    df_type = "styles_df"
  )
}

#' @export
set_style.cells_grand_summary <- function(loc, data, style) {

  add_grand_summary_location_row(
    loc = loc,
    data = data,
    style = style,
    df_type = "styles_df"
  )
}

#' @export
set_style.cells_stub_summary <- function(loc, data, style) {

  add_summary_location_row(
    loc = loc,
    data = data,
    style = style,
    df_type = "styles_df"
  )
}

#' @export
set_style.cells_stub_grand_summary <- function(loc, data, style) {

  add_grand_summary_location_row(
    loc = loc,
    data = data,
    style = style,
    df_type = "styles_df"
  )
}

#' @export
set_style.cells_footnotes <- function(loc, data, style) {

  data <-
    dt_styles_add(
      data = data,
      locname = "footnotes",
      grpname = NA_character_,
      colname = NA_character_,
      locnum = 7,
      rownum = NA_integer_,
      styles = style
    )
}

#' @export
set_style.cells_source_notes <- function(loc, data, style) {

  data <-
    dt_styles_add(
      data = data,
      locname = "source_notes",
      grpname = NA_character_,
      colname = NA_character_,
      locnum = 8,
      rownum = NA_integer_,
      styles = style
    )
}
