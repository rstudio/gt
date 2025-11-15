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

# cols_label() -----------------------------------------------------------------
#' Relabel one or more columns
#'
#' @description
#'
#' Column labels can be modified from their default values (the names of the
#' columns from the input table data). When you create a **gt** table object
#' using [gt()], column names effectively become the column labels. While this
#' serves as a good first approximation, column names as label defaults aren't
#' often as appealing in a **gt** table as the option for custom column labels.
#' `cols_label()` provides the flexibility to relabel one or more columns and
#' we even have the option to use [md()] or [html()] for rendering column labels
#' from Markdown or using HTML.
#'
#' @inheritParams cols_align
#'
#' @param ... *Column label assignments*
#'
#'   `<multiple expressions>` // **required** (or, use `.list`)
#'
#'   Expressions for the assignment of column labels for the table columns in
#'   `.data`. Two-sided formulas (e.g., `<LHS> ~ <RHS>`) can be used, where the
#'   left-hand side corresponds to selections of columns and the right-hand side
#'   evaluates to single-length values for the label to apply. Column names
#'   should be enclosed in `c()`. Select helpers like [starts_with()],
#'   [ends_with()], [contains()], [matches()], and [everything()] can be used
#'   in the LHS. Named arguments are also valid as input for simple mappings of
#'   column name to label text; they should be of the form
#'   `<column name> = <label>`. Subsequent expressions that operate on the
#'   columns assigned previously will result in overwriting column label values.
#'
#' @param .list *Alternative to `...`*
#'
#'   `<list of multiple expressions>` // **required** (or, use `...`)
#'
#'   Allows for the use of a list as an input alternative to `...`.
#'
#' @param .fn *Function to apply*
#'
#'   `function` // *default:* `NULL` (`optional`)
#'
#'   An option to specify a function that will be applied to all of the provided
#'   label values.
#'
#' @param .process_units *Option to process any available units throughout*
#'
#'   `scalar<logical>` // *default:* `NULL` (`optional`)
#'
#'   Should your column text contain text that is already in **gt**'s units
#'   notation (and, importantly, is surrounded by `"{{"`/`"}}"`), using `TRUE`
#'   here reprocesses all column such that the units are properly registered for
#'   each of the column labels. This ignores any column label assignments in
#'   `...` or `.list`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section A note on column names and column labels:
#'
#' It's important to note that while columns can be freely relabeled, we
#' continue to refer to columns by their original column names. Column names in
#' a tibble or data frame must be unique whereas column labels in **gt** have
#' no requirement for uniqueness (which is useful for labeling columns as, say,
#' measurement units that may be repeated several times---usually under
#' different spanner labels). Thus, we can still easily distinguish
#' between columns in other **gt** function calls (e.g., in all of the
#' `fmt*()` functions) even though we may lose distinguishability between column
#' labels once they have undergone relabeling.
#'
#' @section Incorporating units with **gt**'s units notation:
#'
#' Measurement units are often seen as part of column labels and indeed it can
#' be much more straightforward to include them here rather than using other
#' devices to make readers aware of units for specific columns. The **gt**
#' package offers the function [cols_units()] to apply units to various columns
#' with an interface that's similar to that of this function. However, it is
#' also possible to define units here along with the column label, obviating the
#' need for pattern syntax that joins the two text components. To do this, we
#' have to surround the portion of text in the label that corresponds to the
#' units definition with `"{{"`/`"}}"`.
#'
#' Now that we know how to mark text for units definition, we know need to know
#' how to write proper units with the notation. Such notation uses a succinct
#' method of writing units and it should feel somewhat familiar though it is
#' particular to the task at hand. Each unit is treated as a separate entity
#' (parentheses and other symbols included) and the addition of subscript text
#' and exponents is flexible and relatively easy to formulate. This is all best
#' shown with a few examples:
#'
#' - `"m/s"` and `"m / s"` both render as `"m/s"`
#' - `"m s^-1"` will appear with the `"-1"` exponent intact
#' - `"m /s"` gives the same result, as `"/<unit>"` is equivalent to
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
#' - Greek letters can added by enclosing the letter name in `":"`; you can
#'   use lowercase letters (e.g., `":beta:"`, `":sigma:"`, etc.) and uppercase
#'   letters too (e.g., `":Alpha:"`, `":Zeta:"`, etc.)
#' - The components of a unit (unit name, subscript, and exponent) can be
#'   fully or partially italicized/emboldened by surrounding text with `"*"` or
#'   `"**"`
#'
#' @section Examples:
#'
#' Let's use a portion of the [`countrypops`] dataset to create a **gt** table.
#' We can relabel all the table's columns with the `cols_label()` function to
#' improve its presentation. In this simple case we are supplying the name of
#' the column on the left-hand side, and the label text on the right-hand side.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::filter(
#'     country_name == "Uganda",
#'     year %in% 2017:2021
#'   ) |>
#'   gt() |>
#'   cols_label(
#'     country_name = "Name",
#'     year = "Year",
#'     population = "Population"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_label_1.png")`
#' }}
#'
#' Using the [`countrypops`] dataset again, we label columns similarly to before
#' but this time making the column labels be bold through Markdown formatting
#' (with the [md()] helper function). It's possible here to use either a `=` or
#' a `~` between the column name and the label text.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::filter(
#'     country_name == "Uganda",
#'     year %in% 2017:2021
#'   ) |>
#'   gt() |>
#'   cols_label(
#'     country_name = md("**Name**"),
#'     year = md("**Year**"),
#'     population ~ md("**Population**")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_label_2.png")`
#' }}
#'
#' With a select portion of the [`metro`] dataset, let's create a small **gt**
#' table with three columns. Within `cols_label()` we'd like to provide column
#' labels that contain line breaks. For that, we can use `<br>` to indicate
#' where the line breaks should be. We also need to use the [md()] helper
#' function to signal to **gt** that this text should be interpreted as
#' Markdown. Instead of calling [md()] on each of labels as before, we can more
#' conveniently use the `.fn` argument and provide the bare function there (it
#' will be applied to each label defined in the `cols_label()` call).
#'
#' ```r
#' metro |>
#'   dplyr::select(name, lines, passengers, connect_other) |>
#'   dplyr::slice_max(passengers, n = 10) |>
#'   gt() |>
#'   cols_hide(columns = passengers) |>
#'   cols_label(
#'     name = "Name of<br>Metro Station",
#'     lines = "Metro<br>Lines",
#'     connect_other = "Train<br>Services",
#'     .fn = md
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_label_3.png")`
#' }}
#'
#' Using a subset of the [`towny`] dataset, we can create an interesting **gt**
#' table. First, only certain columns are selected from the dataset, some
#' filtering of rows is done, rows are sorted, and then only the first 10 rows
#' are kept. After the data is introduced to [gt()], we then apply some spanner
#' labels using two calls of [tab_spanner()]. Below those spanners, we want to
#' label the columns by the years of interest. Using `cols_label()` and select
#' expressions on the left side of the formulas, we can easily relabel multiple
#' columns with common label text. Note that we cannot use an `=` sign in any of
#' the expressions within `cols_label()`; because the left-hand side is not a
#' single column name, we must use formula syntax (i.e., with the `~`).
#'
#' ```r
#' towny |>
#'   dplyr::select(
#'     name, ends_with("2001"), ends_with("2006"), matches("2001_2006")
#'   ) |>
#'   dplyr::filter(population_2001 > 100000) |>
#'   dplyr::slice_max(pop_change_2001_2006_pct, n = 10) |>
#'   gt() |>
#'   fmt_integer() |>
#'   fmt_percent(columns = matches("change"), decimals = 1) |>
#'   tab_spanner(label = "Population", columns = starts_with("population")) |>
#'   tab_spanner(label = "Density", columns = starts_with("density")) |>
#'   cols_label(
#'     ends_with("01") ~ "2001",
#'     ends_with("06") ~ "2006",
#'     matches("change") ~ md("Population Change,<br>2001 to 2006")
#'   ) |>
#'   cols_width(everything() ~ px(120))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_label_4.png")`
#' }}
#'
#' Here's another table that uses the [`towny`] dataset. The big difference
#' compared to the previous *gt* table is that `cols_label()` as used here
#' incorporates unit notation text (within `"{{"`/`"}}"`).
#'
#' ```r
#' towny |>
#'   dplyr::select(
#'     name, population_2021, density_2021, land_area_km2, latitude, longitude
#'   ) |>
#'   dplyr::slice_max(population_2021, n = 10) |>
#'   gt() |>
#'   fmt_integer(columns = population_2021) |>
#'   fmt_number(
#'     columns = c(density_2021, land_area_km2),
#'     decimals = 1
#'   ) |>
#'   fmt_number(columns = latitude, decimals = 2) |>
#'   fmt_number(columns = longitude, decimals = 2, scale_by = -1) |>
#'   cols_label(
#'     starts_with("population") ~ "Population",
#'     starts_with("density") ~ "Density, {{*persons* km^-2}}",
#'     land_area_km2 ~ "Area, {{km^2}}",
#'     latitude ~ "Latitude, {{:degrees:N}}",
#'     longitude ~ "Longitude, {{:degrees:W}}"
#'   ) |>
#'   cols_width(everything() ~ px(120))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_label_5.png")`
#' }}
#'
#' The [`illness`] dataset has units within the `units` column. They're
#' formatted in just the right way for **gt** too. Let's do some text
#' manipulation through `dplyr::mutate()` and some pivoting with
#' `tidyr::pivot_longer()` and `tidyr::pivot_wider()` in order to include the
#' units as part of the column names in the reworked table. These column names
#' are in a format where the units are included within `"{{"`/`"}}"`, so, we can
#' use `cols_label()` with the `.process_units = TRUE` option to register the
#' measurement units. In addition to this, because there is a `<br>` included
#' (for a line break), we should use the `.fn` option and provide the [md()]
#' helper function (as a bare function name). This ensures that any line breaks
#' will materialize.
#'
#' ```r
#' illness |>
#'   dplyr::mutate(test = paste0(test, ",<br>{{", units, "}}")) |>
#'   dplyr::slice_head(n = 8) |>
#'   dplyr::select(-c(starts_with("norm"), units)) |>
#'   tidyr::pivot_longer(
#'     cols = starts_with("day"),
#'     names_to = "day",
#'     names_prefix = "day_",
#'     values_to = "value"
#'   ) |>
#'   tidyr::pivot_wider(
#'     names_from = test,
#'     values_from = value
#'   ) |>
#'   gt(rowname_col = "day") |>
#'   tab_stubhead(label = "Day") |>
#'   cols_label(
#'     .fn = md,
#'     .process_units = TRUE
#'   ) |>
#'   cols_width(
#'     stub() ~ px(50),
#'     everything() ~ px(120)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_label_6.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-4
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cols_label <- function(
    .data,
    ...,
    .list = list2(...),
    .fn = NULL,
    .process_units = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl_or_group(data = .data)

  # Handle gt_group
  if(inherits(.data, "gt_group")){
    arg_list <- as.list(match.call())
    return(apply_to_grp(.data, arg_list))
  }

  if (!is.null(.process_units) && .process_units) {

    # Obtain all extant labels as a list
    vars_default <- dt_boxhead_get_vars_default(data = .data)
    vars_labels_default <- dt_boxhead_get_vars_labels_default(data = .data)

    labels_list <- as.list(vars_labels_default)
    names(labels_list) <- vars_default

  } else if (!is.null(.process_units) && !.process_units) {

    # Collect a list of column labels
    labels_list <- .list

  } else {

    # Collect a list of column labels
    labels_list <- .list
  }

  column_vars <- dt_boxhead_get_vars(data = .data)

  # If nothing is provided, return `data` unchanged
  if (length(labels_list) == 0) {
    return(.data)
  }

  for (i in seq_along(labels_list)) {

    label_i <- labels_list[i]

    # When input is provided as a list in `.list`, we obtain named vectors;
    # upgrade this to a list to match the input collected from `...`
    if (rlang::is_named(label_i) && rlang::is_scalar_vector(label_i)) {
      label_i <- as.list(label_i)
    }

    if (
      is.list(label_i) &&
      rlang::is_named(label_i) &&
      rlang::is_scalar_vector(label_i[[1]])
    ) {

      # Get column and value
      columns <- names(label_i)
      new_label <- label_i[[1]]

      if (!(columns %in% column_vars)) {
        cli::cli_abort(c(
          "Can't find column{?s} {.var {columns}} in the data.",
          "i" = "The LHS should include column names or a tidyselect statement."
        ))
      }

    } else if (
      is.list(label_i) &&
      rlang::is_formula(label_i[[1]])
    ) {

      label_i <- label_i[[1]]

      cols <- rlang::f_lhs(label_i)

      if (is.null(cols)) {
        cli::cli_abort(c(
          "A formula supplied to `cols_label()` must be two-sided.",
          "*" = "Include column names or a tidyselect statement on the LHS."
        ))
      }

      # The default use of `resolve_cols_c()` won't work here if there
      # is a table stub column (because we need to be able to set the
      # stub column width and, by default, `resolve_cols_c()` excludes
      # the stub); to prevent this exclusion, we set `excl_stub` to FALSE
      columns <-
        resolve_cols_c(
          expr = !!cols,
          data = .data
        )

      new_label <- rlang::eval_tidy(rlang::f_rhs(label_i))
    }

    if (!is.null(.fn)) {

      # Invoke the supplied function on the `new_label` vector
      new_label <- .fn(new_label)
    }

    for (j in seq_along(columns)) {

      # For each of the resolved columns, process the label text and
      # insert the new label and any discovered units in the boxhead

      # Determine is there is any text pertaining to units; if there is,
      # then (1) extract that text, (2) add it to the `column_units` entry,
      # and (3) set a `column_pattern` override value of `""` (because the
      # use of units here is already part of the column label string, so no
      # pattern needed)

      if (grepl("\\{\\{.*?\\}\\}", new_label)) {

        column_units <- sub("^.*?(\\{\\{.*?\\}\\}).*?$", "\\1", new_label)

        .data <-
          dt_boxhead_edit_column_units(
            data = .data,
            var = columns[j],
            column_units = column_units
          )

        .data <-
          dt_boxhead_edit_column_pattern(
            data = .data,
            var = columns[j],
            column_pattern = ""
          )
      }

      .data <-
        dt_boxhead_edit_column_label(
          data = .data,
          var = columns[j],
          column_label = new_label
        )
    }
  }

  .data
}

# cols_label_with() ------------------------------------------------------------
#' Relabel columns with a function
#'
#' @description
#'
#' Column labels can be modified from their default values (the names of the
#' columns from the input table data). When you create a **gt** table object
#' using [gt()], column names effectively become the column labels. While this
#' serves as a good first approximation, you may want to make adjustments so
#' that the columns names present better in the **gt** output table. The
#' `cols_label_with()` function allows for modification of column labels through
#' a supplied function. By default, the function will be invoked on all column
#' labels but this can be limited to a subset via the `columns` argument. With
#' the `fn` argument, we provide either a bare function name, a RHS formula
#' (with `.` representing the vector of column labels), or, an anonymous
#' function (e.g., `function(x) tools::toTitleCase(x)`).
#'
#' @inheritParams cols_align
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns for which the column-labeling operations should be applied. Can
#'   either be a series of column names provided in `c()`, a vector of column
#'   indices, or a select helper function (e.g. [starts_with()], [ends_with()],
#'   [contains()], [matches()], [num_range()], and [everything()]).
#'
#' @param fn *Function to apply*
#'
#'   `function|formula` // **required**
#'
#'   The function or function call to be applied to the column labels. This can
#'   take the form of a bare function (e.g., `tools::toTitleCase`), a function
#'   call as a RHS formula (e.g., `~ tools::toTitleCase(.)`), or an anonymous
#'   function as in `function(x) tools::toTitleCase(x)`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section A note on column names and column labels:
#'
#' It's important to note that while columns can be freely relabeled, we
#' continue to refer to columns by their original column names. Column names in
#' a tibble or data frame must be unique whereas column labels in **gt** have no
#' requirement for uniqueness (which is useful for labeling columns as, say,
#' measurement units that may be repeated several times---usually under
#' different spanner labels). Thus, we can still easily distinguish between
#' columns in other **gt** function calls (e.g., in all of the `fmt*()`
#' functions) even though we may lose distinguishability in column labels once
#' they have been relabeled.
#'
#' @section Examples:
#'
#' Use a subset of the [`sp500`] dataset to create a **gt** table. We want all
#' the column labels to be entirely capitalized versions of the default labels
#' but, instead of using [cols_label()] and rewriting each label manually in
#' capital letters we can use `cols_label_with()` and instruct it to apply the
#' `toupper()` function to all column labels.
#'
#' ```r
#' sp500 |>
#'   dplyr::filter(
#'     date >= "2015-12-01" &
#'       date <= "2015-12-15"
#'   ) |>
#'   dplyr::select(-c(adj_close, volume)) |>
#'   gt() |>
#'   cols_label_with(fn = toupper)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_label_with_1.png")`
#' }}
#'
#' Use the [`countrypops`] dataset to create a **gt** table. To improve the
#' presentation of the table, we are again going to change the default column
#' labels via function calls supplied within `cols_label_with()`. We can, if we
#' prefer, apply multiple types of column label changes in sequence with
#' multiple calls of `cols_label_with()`. Here, we use the `make_clean_names()`
#' functions from the **janitor** package and follow up with the removal of a
#' numeral with `gsub()`.
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(year == 2021) |>
#'   dplyr::filter(grepl("^C", country_code_3)) |>
#'   dplyr::select(-country_code_2, -year) |>
#'   head(8) |>
#'   gt() |>
#'   cols_move_to_start(columns = country_code_3) |>
#'   fmt_integer(columns = population) |>
#'   cols_label_with(
#'     fn = ~ janitor::make_clean_names(., case = "title")
#'   ) |>
#'   cols_label_with(
#'     fn = ~ gsub("[0-9]", "", .)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_label_with_2.png")`
#' }}
#'
#' We can make a svelte **gt** table with the [`pizzaplace`] dataset. There are
#' ways to use one instance of `cols_label_with()` with multiple functions
#' called on the column labels. In the example, we use an anonymous function
#' call (with the `function(x) { ... }` construction) to perform multiple
#' mutations of `x` (the vector of column labels). We can even use the [md()]
#' helper function with that to signal to **gt** that the column label should be
#' interpreted as Markdown text.
#'
#' ```r
#' pizzaplace |>
#'   dplyr::mutate(month = substr(date, 6, 7)) |>
#'   dplyr::count(month, name = "pizze_vendute") |>
#'   dplyr::mutate(frazione_della_quota = pizze_vendute / 4000) |>
#'   dplyr::mutate(date = paste0("2015/", month, "/01")) |>
#'   dplyr::select(-month) |>
#'   gt(rowname_col = "date") |>
#'   fmt_date(date, date_style = "month", locale = "it") |>
#'   fmt_percent(columns = frazione_della_quota) |>
#'   fmt_integer(columns = pizze_vendute) |>
#'   cols_width(everything() ~ px(100)) |>
#'   cols_label_with(
#'     fn = function(x) {
#'       janitor::make_clean_names(x, case = "title") |>
#'         toupper() |>
#'         stringr::str_replace_all("^|$", "**") |>
#'         md()
#'     }
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_label_with_3.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-5
#'
#' @section Function Introduced:
#' `v0.9.0` (March 31, 2023)
#'
#' @export
cols_label_with <- function(
    data,
    columns = everything(),
    fn
) {

  # Perform input object validation
  stop_if_not_gt_tbl_or_group(data = data)

  # Handle gt_group
  if(inherits(data, "gt_group")){
    arg_list <- as.list(match.call())
    return(apply_to_grp(data, arg_list))
  }

  fn <- rlang::as_function(fn)

  resolved_columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data,
      excl_stub = TRUE
    )

  # If no columns are resolved, return the data unchanged
  if (length(resolved_columns) < 1) {
    return(data)
  }

  # Obtain `boxh_df` table and filter to the rows with resolved column names
  boxh_df <- dt_boxhead_get(data = data)
  boxh_df <- boxh_df[boxh_df[["var"]] %in% resolved_columns, ]

  # Obtain a list of current labels for the resolved columns and ensure
  # that the var names are included as names for each of the list components
  old_label_list <- boxh_df[["column_label"]]
  names(old_label_list) <- boxh_df[["var"]]

  # Apply the function call to each element of `old_label_list`
  new_label_list <- lapply(old_label_list, FUN = fn)

  if (!all(vapply(new_label_list, FUN.VALUE = logical(1L), FUN = is_character))) {
    cli::cli_abort("{.arg fn} must return a character vector.")
  }

  if (
    length(new_label_list) != length(resolved_columns) ||
    any(unlist(lapply(new_label_list, FUN = length)) != 1)
  ) {
    cli::cli_abort(
      "Each invocation of {.arg fn} on a column label must return a vector of
      length 1."
    )
  }

  # If no labels remain after filtering, return the data
  if (length(new_label_list) < 1) {
    return(data)
  }

  for (i in seq_along(new_label_list)) {

    data <-
      dt_boxhead_edit_column_label(
        data = data,
        var = names(new_label_list)[i],
        column_label = new_label_list[[i]]
      )
  }

  data
}
