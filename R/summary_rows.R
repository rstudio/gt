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


# summary_rows() ---------------------------------------------------------------
#' Add group-wise summary rows using aggregation functions
#'
#' @description
#'
#' Add summary rows to one or more row groups by using the table data and any
#' suitable aggregation functions. Multiple summary rows can be added for
#' selected groups via expressions given to `fns`. You can selectively format
#' the values in the resulting summary cells by use of formatting expressions in
#' `fmt`.
#'
#' @inheritParams fmt_number
#'
#' @param groups *Specification of row group IDs*
#'
#'   `<row-group-targeting expression>` // *default:* `everything()`
#'
#'   The row groups to which targeting operations are constrained. Can either be
#'   a series of row group ID values provided in `c()` or a select helper
#'   function (e.g. [starts_with()], [ends_with()], [contains()], [matches()],
#'   [num_range()], and [everything()]). By default this is set to
#'   [everything()], which means that all available groups will obtain summary
#'   rows.
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns for which the summaries should be calculated. Can either
#'   be a series of column names provided in `c()`, a vector of column indices,
#'   or a select helper function (e.g. [starts_with()], [ends_with()],
#'   [contains()], [matches()], [num_range()], and [everything()]).
#'
#' @param fns *Aggregation Expressions*
#'
#'   `<expression|list of expressions>`
#'
#'   Functions used for aggregations. This can include base functions like
#'   `mean`, `min`, `max`, `median`, `sd`, or `sum` or any other user-defined
#'   aggregation function. Multiple functions, each of which would generate a
#'   different row, are to be supplied within a `list()`. We can specify the
#'   functions by use of function names in quotes (e.g., `"sum"`), as bare
#'   functions (e.g., `sum`), or in formula form (e.g., `minimum ~ min(.)`)
#'   where the LHS could be used to supply the summary row label and ID values.
#'   More information on this can be found in the
#'   *Aggregation expressions for `fns`* section.
#'
#' @param fmt *Formatting expressions*
#'
#'   `<expression|list of expressions>`
#'
#'   Formatting expressions in formula form. The RHS of `~` should contain a
#'   formatting call (e.g., `~ fmt_number(., decimals = 3, use_seps = FALSE`).
#'   Optionally, the LHS could contain a group-targeting expression (e.g.,
#'   `"group_a" ~ fmt_number(.)`). More information on this can be found in the
#'   *Formatting expressions for `fmt`* section.
#'
#' @param side *Side used for placement of summary rows*
#'
#'   `singl-kw:[bottom|top]` // *default:* `"bottom"`
#'
#'   Should the summary rows be placed at the `"bottom"` (the default) or the
#'   `"top"` of the row group?
#'
#' @param missing_text *Replacement text for `NA` values*
#'
#'   `scalar<character>` // *default:* `"---"`
#'
#'   The text to be used in place of `NA` values in summary cells with no data
#'   outputs.
#'
#' @param formatter *[Deprecated] Formatting function*
#'
#'   `<expression>`
#'
#'   Deprecated, please use `fmt` instead. This was previously used as a way to
#'   input a formatting function name, which could be any of the `fmt_*()`
#'   functions available in the package (e.g., [fmt_number()], [fmt_percent()],
#'   etc.), or a custom function using [fmt()]. The options of a formatter can
#'   be accessed through `...`.
#'
#' @param ... *[Deprecated] Formatting arguments*
#'
#'   `<Named arguments>`
#'
#'   Deprecated (along with `formatter`) but otherwise used for argument values
#'   for a formatting function supplied in `formatter`. For example, if using
#'   `formatter = fmt_number`, options such as `decimals = 1`, `use_seps =
#'   FALSE`, and the like can be used here.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Using `columns` to target column data for aggregation:
#'
#' Targeting of column data for which aggregates should be generated is done
#' through the `columns` argument. We can declare column names in `c()` (with
#' bare column names or names in quotes) or we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) & max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value greater than
#' 1,000,000 (excluding any `NA`s from consideration).
#'
#' By default all columns are selected (with the `everything()` default). This
#' default may be not what's needed unless all columns can undergo useful
#' aggregation by expressions supplied in `fns`.
#'
#' @section Aggregation expressions for `fns`:
#'
#' There are a number of ways to express how an aggregation should work for
#' each summary row. In addition to that, we have the ability to pass important
#' information such as the summary row ID value and its label (the former
#' necessary for targeting within [tab_style()] or [tab_footnote()] and the
#' latter used for display in the rendered table). Here are a number of
#' instructive examples for how to supply such expressions.
#'
#' ### Double-sided formula with everything supplied
#'
#' We can be explicit and provide a double-sided formula (in the form
#' `<LHS> ~ <RHS>`) that expresses everything about a summary row. That is, it
#' has an aggregation expression (where `.` represents the data in the
#' focused column). Here's an example:
#'
#' `list(id = "minimum", label = "min") ~ min(., na.rm = TRUE)`
#'
#' The left side (the list) contains named elements that identify the `id` and
#' `label` for the summary row. The right side has an expression for obtaining
#' a minimum value (dropping `NA` values in the calculation).
#'
#' The `list()` can be replaced with `c()` but the advantage of a list is
#' allowing the use of the [md()] and [html()] helper functions. The above
#' example can be written as:
#'
#' `list(id = "minimum", label = md("**Minimum**")) ~ min(., na.rm = TRUE)`
#'
#' and we can have that label value interpreted as Markdown text.
#'
#' ### Function names in quotes
#'
#' With `fns = "min"` we get the equivalent of the fuller expression:
#'
#' `list(id = "min", label = "min") ~ min(., na.rm = TRUE)`
#'
#' For sake of convenience, common aggregation functions with the `na.rm`
#' argument will be rewritten with the `na.rm = TRUE` option. These functions
#' are: `"min"`, `"max"`, `"mean"`, `"median"`, `"sd"`, and `"sum"`.
#'
#' Should you need to specify multiple aggregation functions in this way (giving
#' you multiple summary rows), use `c()` or `list()`.
#'
#' ### RHS formula expressions
#'
#' With `fns = ~ min(.)` or `fns = list(~ min(.))`, **gt** will use the function
#' name as the `id` and `label`. The expansion of this shorthand to full form
#' looks like this:
#'
#' `list(id = "min", label = "min") ~ min(.)`
#'
#' The RHS expression is kept as written and the name portion is both the `id`
#' and the `label`.
#'
#' ### Named vector or list with RHS formula expression
#'
#' Using `fns = c(minimum = ~ min(.))` or `fns = list(minimum = ~ min(.))`
#' expands to this:
#'
#' `list(id = "minimum", label = "minimum") ~ min(.)`
#'
#' ### Unnamed vector or list with RHS formula expression
#'
#' With `fns = c("minimum", "min") ~ min(.)` or
#' `fns = list("minimum", "min") ~ min(.)` the LHS contains the `label` and `id`
#' values and, importantly, the order is `label` first and `id` second. This can
#' be rewritten as:
#'
#' `list(id = "min", label = "minimum") ~ min(.)`
#'
#' If the vector or list is partially named, **gt** has enough to go on to
#' disambiguate the unnamed element. So with
#' `fns = c("minimum", label = "min") ~ min(.)`, `"min"` is indeed the `label`
#' and `"minimum"` is taken as the `id` value.
#'
#' ### A fully named list with three specific elements
#'
#' We can avoid using a formula if we are satisfied with the default options of
#' a function (except some of those functions with the `na.rm` options, see
#' above). Instead, a list with the named elements `id`, `label`, and `fn` could
#' be used. It can look like this:
#'
#' `fns = list(id = "mean_id", label = "average", fn = "mean")`
#'
#' which translates to
#'
#' `list(id = "mean_id", label = "average") ~ mean(., na.rm = TRUE)`
#'
#' @section Formatting expressions for `fmt`:
#'
#' Given that we are generating new data in a table, we might also want to
#' take the opportunity to format those new values right away. We can do this
#' in the `fmt` argument, either with a single expression or a number of them
#' in a list.
#'
#' ### Formatting cells across all groups
#'
#' We can supply a one-sided (RHS only) or two-sided expression (targeting
#' groups) to `fmt`, and, several can be provided in a list. The RHS will always
#' contain an expression that uses a formatting function (e.g., [fmt_number()],
#' [fmt_currency()], etc.) and it must contain an initial `.` that stands for
#' the data object. If performing numeric formatting on all columns in the new
#' summary rows, it might look something like this:
#'
#' `fmt = ~ fmt_number(., decimals = 1, use_seps = FALSE)`
#'
#' We can use the `columns` and `rows` arguments that are available in every
#' formatting function. This allows us to format only a subset of columns or
#' rows. Summary rows can be targeted by using their ID values and these are
#' settable within expressions given to `fns` (see the *Aggregation expressions
#' for `fns`* section for details on this). Here's an example with hypothetical
#' column and row names:
#'
#' `fmt = ~ fmt_number(., columns = num, rows = "mean", decimals = 3)`
#'
#' ### Formatting cells in specific groups
#'
#' A two-sided expression is needed for targeting the formatting directives to
#' specific summary row groups. In this format, the LHS should contain an
#' expression that resolves to a set of available groups. We can use a single
#' row group name in quotes, several of those in a vector, or a select helper
#' expression like `starts_with()` or `matches()`.
#'
#' In a situation where summary rows were generated across the row groups named
#' `"group_1"`, `"group_2"`, and `"group_3"`, we could format all summary cells
#' in `"group_2"` with the following:
#'
#' `fmt = "group_2" ~ fmt_number(., decimals = 1, use_seps = FALSE)`
#'
#' If you wanted to target the latter two groups, this can be done:
#'
#' `fmt = matches("2|3") ~ fmt_number(., decimals = 1, use_seps = FALSE)`
#'
#' Should you need to target a single cell, the LHS expression for group
#' targeting could be paired with single values for `columns` and `rows` on the
#' RHS formatting expression. Like this:
#'
#' `fmt = "group_1" ~ fmt_number(., columns = num, rows = "mean")`
#'
#' @section Extraction of summary rows:
#'
#' Should we need to obtain the summary data for external purposes,
#' [extract_summary()] can be used with a `gt_tbl` object where summary rows
#' were added via `summary_rows()` or [grand_summary_rows()].
#'
#' @section Examples:
#'
#' Use a modified version of [`sp500`] dataset to create a **gt** table with row
#' groups and row labels. Create the summary rows labeled `min`, `max`, and
#' `avg` by row group (where each each row group is a week number) with
#' `summary_rows()`.
#'
#' ```r
#' sp500 |>
#'   dplyr::filter(date >= "2015-01-05" & date <= "2015-01-16") |>
#'   dplyr::arrange(date) |>
#'   dplyr::mutate(week = paste0("W", strftime(date, format = "%V"))) |>
#'   dplyr::select(-adj_close, -volume) |>
#'   gt(
#'     rowname_col = "date",
#'     groupname_col = "week"
#'   ) |>
#'   summary_rows(
#'     fns = list(
#'       "min",
#'       "max",
#'       list(label = "avg", fn = "mean")
#'     ),
#'     fmt = ~ fmt_number(., use_seps = FALSE)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_summary_rows_1.png")`
#' }}
#'
#' Using the [`countrypops`] dataset, let's process that a bit before giving it
#' to **gt**. We can create a summary rows with totals that appear at the top of
#' each row group (with `side = "top"`). We can define the aggregation with a
#' list that contains parameters for the summary row label (`md("**ALL**")`),
#' the shared ID value of those rows across groups (`"totals"`), and the
#' aggregation function (expressed as `"sum"`, which **gt** recognizes as the
#' `sum()` function). To top it all off, we'll add background fills to the
#' summary rows with [tab_style()].
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(
#'     country_code_2 %in% c("BR", "RU", "IN", "CN", "FR", "DE", "IT", "GB")
#'   ) |>
#'   dplyr::filter(year %% 10 == 0) |>
#'   dplyr::select(country_name, year, population) |>
#'   tidyr::pivot_wider(names_from = year, values_from = population) |>
#'   gt(rowname_col = "country_name") |>
#'   tab_row_group(
#'     label = md("*BRIC*"),
#'     rows = c("Brazil", "Russia", "India", "China"),
#'     id = "bric"
#'   ) |>
#'   tab_row_group(
#'     label = md("*Big Four*"),
#'     rows = c("France", "Germany", "Italy", "United Kingdom"),
#'     id = "big4"
#'   ) |>
#'   row_group_order(groups = c("bric", "big4")) |>
#'   tab_stub_indent(rows = everything()) |>
#'   tab_header(title = "Populations of the BRIC and Big Four Countries") |>
#'   tab_spanner(columns = everything(), label = "Year") |>
#'   fmt_number(n_sigfig = 3, suffixing = TRUE) |>
#'   summary_rows(
#'     fns =  list(label = md("**ALL**"), id = "totals", fn = "sum"),
#'     fmt = ~ fmt_number(., n_sigfig = 3, suffixing = TRUE),
#'     side = "top"
#'   ) |>
#'   tab_style(
#'     locations = cells_summary(),
#'     style = cell_fill(color = "lightblue" |> adjust_luminance(steps = +1))
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_summary_rows_2.png")`
#' }}
#'
#' @family row addition/modification functions
#' @section Function ID:
#' 6-1
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
summary_rows <- function(
    data,
    groups = everything(),
    columns = everything(),
    fns = NULL,
    fmt = NULL,
    side = c("bottom", "top"),
    missing_text = "---",
    formatter = NULL,
    ...
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Get the correct `side` value
  side <- rlang::arg_match0(side, values = c("bottom", "top"))

  # Collect all provided formatting options in a list
  formatter_options <- list(...)

  # Perform a partial build of the table to obtain the current
  # state of `group_id` values in the table; we should not assign this
  # to `data` but to a new object (`data_built`) so that we do not
  # affect the return value of `data`
  data_built <- dt_body_build_init(data = data)
  data_built <- dt_groups_rows_build(data = data_built, context = "html")
  groups_rows_tbl <- dt_groups_rows_get(data = data_built)

  # Pull a character vector of available groups from `groups_rows_tbl`
  available_groups <- groups_rows_tbl$group_id
  check_character(available_groups)

  # Resolve the group names
  groups <-
    resolve_groups(
      expr = {{ groups }},
      vector = available_groups
    )

  # Return data unchanged if there are no groups and this summary is not
  # a grand summary
  # Return data unchanged if no groups were resolved
  return_unchanged <- is.null(groups) ||
    (length(available_groups) < 1 && !identical(groups, ":GRAND_SUMMARY:"))

  if (return_unchanged) {
      return(data)
  }

  # Resolve the column names
  columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data
    )

  stub_available <- dt_stub_df_exists(data = data)

  # If there isn't a stub available, create an
  # 'empty' stub (populated with empty strings);
  # the stub is necessary for summary row labels
  if (!stub_available) {

    data <-
      dt_boxhead_add_var(
        data = data,
        var = rowname_col_private,
        type = "stub",
        column_label = list(rowname_col_private),
        column_align = "left",
        column_width = list(NULL),
        hidden_px = list(NULL),
        add_where = "bottom"
      )

    # Add the `"::rowname::"` column into `_data`
    data$`_data` <-
      dplyr::mutate(
        data$`_data`,
        !!rowname_col_private := rep("", nrow(data$`_data`)),
        .after = dplyr::last_col()
      )

    # Get the `stub_df` object from `data`
    stub_df <- dt_stub_df_get(data = data)

    # Place the `::rowname::` values into `stub_df$row_id`; these are
    # empty strings which will provide an empty stub for locations
    # adjacent to the body rows
    stub_df[["row_id"]] <- ""

    data <-
      dt_stub_df_set(
        data = data,
        stub_df = stub_df
      )
  }

  # With `fns` input, normalize to list of summary functions
  summary_fns <- normalize_summary_fns(fns = fns)

  # If `formatter` has a value but `fmt` does not, adapt the value provided
  # in `formatter` and `...` and warn about their deprecation
  if (is.null(fmt) && !is.null(formatter) && is.function(formatter)) {

    fmt_args <-
      vapply(
        seq_along(formatter_options),
        FUN.VALUE = character(1L),
        USE.NAMES = FALSE,
        FUN = function(x) {
          paste0(names(formatter_options[x]), " = ", formatter_options[x])
        }
      )

    fmt_args <-
      paste0(
        ".",
        if (length(fmt_args) > 0) ", " else NULL,
        paste(
          fmt_args, collapse = ", "
        )
      )

    formatter_name <- deparse(substitute(formatter))

    formatter_formula <- paste0("~ ", formatter_name, "(", fmt_args, ")")

    fmt <- list(stats::as.formula(formatter_formula))

    # Provide deprecation warning
    cli::cli_warn(c(
      "Since gt v0.9.0, the `formatter` argument (and associated `...`) has been deprecated.",
      "*" = "Please use the `fmt` argument to provide formatting directives."
    ),
    .frequency = "regularly",
    .frequency_id = "summary_rows_formatter_arg_deprecated"
    )
  }

  # With `fmt` input, normalize to list of formatting functions
  fmt_fns <- normalize_fmt_fns(fmt = fmt)

  summary_list <-
    list(
      groups = groups,
      columns = columns,
      fns = summary_fns,
      fmt = fmt_fns,
      side = side,
      missing_text = missing_text,
      formatter = formatter,
      formatter_options = formatter_options
    )

  dt_summary_add(
    data = data,
    summary = summary_list
  )
}

# grand_summary_rows() ---------------------------------------------------------
#' Add grand summary rows using aggregation functions
#'
#' @description
#'
#' Add grand summary rows by using the table data and any suitable aggregation
#' functions. With grand summary rows, all of the available data in the **gt**
#' table is incorporated (regardless of whether some of the data are part of row
#' groups). Multiple grand summary rows can be added via expressions given to
#' `fns`. You can selectively format the values in the resulting grand summary
#' cells by use of formatting expressions in `fmt`.
#'
#' @inheritParams summary_rows
#'
#' @param side *Side used for placement of grand summary rows*
#'
#'   `singl-kw:[bottom|top]` // *default:* `"bottom"`
#'
#'   Should the grand summary rows be placed at the `"bottom"` (the default) or
#'   the `"top"` of the table?
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Using `columns` to target column data for aggregation:
#'
#' Targeting of column data for which aggregates should be generated is done
#' through the `columns` argument. We can declare column names in `c()` (with
#' bare column names or names in quotes) or we can use
#' **tidyselect**-style expressions. This can be as basic as supplying a select
#' helper like `starts_with()`, or, providing a more complex incantation like
#'
#' `where(~ is.numeric(.x) & max(.x, na.rm = TRUE) > 1E6)`
#'
#' which targets numeric columns that have a maximum value greater than
#' 1,000,000 (excluding any `NA`s from consideration).
#'
#' By default all columns are selected (with the `everything()` default). This
#' default may be not what's needed unless all columns can undergo useful
#' aggregation by expressions supplied in `fns`.
#'
#' @section Aggregation expressions for `fns`:
#'
#' There are a number of ways to express how an aggregation should work for
#' each summary row. In addition to that, we have the ability to pass important
#' information such as the summary row ID value and its label (the former
#' necessary for targeting within [tab_style()] or [tab_footnote()] and the
#' latter used for display in the rendered table). Here are a number of
#' instructive examples for how to supply such expressions.
#'
#' ### Double-sided formula with everything supplied
#'
#' We can be explicit and provide a double-sided formula (in the form
#' `<LHS> ~ <RHS>`) that expresses everything about a summary row. That is, it
#' has an aggregation expression (where `.` represents the data in the
#' focused column). Here's an example:
#'
#' `list(id = "minimum", label = "min") ~ min(., na.rm = TRUE)`
#'
#' The left side (the list) contains named elements that identify the `id` and
#' `label` for the summary row. The right side has an expression for obtaining
#' a minimum value (dropping `NA` values in the calculation).
#'
#' The `list()` can be replaced with `c()` but the advantage of a list is
#' allowing the use of the [md()] and [html()] helper functions. The above
#' example can be written as:
#'
#' `list(id = "minimum", label = md("**Minimum**")) ~ min(., na.rm = TRUE)`
#'
#' and we can have that label value interpreted as Markdown text.
#'
#' ### Function names in quotes
#'
#' With `fns = "min"` we get the equivalent of the fuller expression:
#'
#' `list(id = "min", label = "min") ~ min(., na.rm = TRUE)`
#'
#' For sake of convenience, common aggregation functions with the `na.rm`
#' argument will be rewritten with the `na.rm = TRUE` option. These functions
#' are: `"min"`, `"max"`, `"mean"`, `"median"`, `"sd"`, and `"sum"`.
#'
#' Should you need to specify multiple aggregation functions in this way (giving
#' you multiple summary rows), use `c()` or `list()`.
#'
#' ### RHS formula expressions
#'
#' With `fns = ~ min(.)` or `fns = list(~ min(.))`, **gt** will use the function
#' name as the `id` and `label`. The expansion of this shorthand to full form
#' looks like this:
#'
#' `list(id = "min", label = "min") ~ min(.)`
#'
#' The RHS expression is kept as written and the name portion is both the `id`
#' and the `label`.
#'
#' ### Named vector or list with RHS formula expression
#'
#' Using `fns = c(minimum = ~ min(.))` or `fns = list(minimum = ~ min(.))`
#' expands to this:
#'
#' `list(id = "minimum", label = "minimum") ~ min(.)`
#'
#' ### Unnamed vector or list with RHS formula expression
#'
#' With `fns = c("minimum", "min") ~ min(.)` or
#' `fns = list("minimum", "min") ~ min(.)` the LHS contains the `label` and `id`
#' values and, importantly, the order is `label` first and `id` second. This can
#' be rewritten as:
#'
#' `list(id = "min", label = "minimum") ~ min(.)`
#'
#' If the vector or list is partially named, **gt** has enough to go on to
#' disambiguate the unnamed element. So with
#' `fns = c("minimum", label = "min") ~ min(.)`, `"min"` is indeed the `label`
#' and `"minimum"` is taken as the `id` value.
#'
#' ### A fully named list with three specific elements
#'
#' We can avoid using a formula if we are satisfied with the default options of
#' a function (except some of those functions with the `na.rm` options, see
#' above). Instead, a list with the named elements `id`, `label`, and `fn` could
#' be used. It can look like this:
#'
#' `fns = list(id = "mean_id", label = "average", fn = "mean")`
#'
#' which translates to
#'
#' `list(id = "mean_id", label = "average") ~ mean(., na.rm = TRUE)`
#'
#' @section Formatting expressions for `fmt`:
#'
#' Given that we are generating new data in a table, we might also want to
#' take the opportunity to format those new values right away. We can do this
#' in the `fmt` argument, either with a single expression or a number of them
#' in a list.
#'
#' We can supply a one-sided (RHS only) expression to `fmt`, and, several can
#' be provided in a list. The expression uses a formatting function (e.g.,
#' [fmt_number()], [fmt_currency()], etc.) and it must contain an initial `.`
#' that stands for the data object. If performing numeric formatting on all
#' columns in the new grand summary rows, it might look something like this:
#'
#' `fmt = ~ fmt_number(., decimals = 1, use_seps = FALSE)`
#'
#' We can use the `columns` and `rows` arguments that are available in every
#' formatting function. This allows us to format only a subset of columns or
#' rows. Summary rows can be targeted by using their ID values and these are
#' settable within expressions given to `fns` (see the *Aggregation expressions
#' for `fns`* section for details on this). Here's an example with hypothetical
#' column and row names:
#'
#' `fmt = ~ fmt_number(., columns = num, rows = "mean", decimals = 3)`
#'
#' @section Extraction of summary rows:
#'
#' Should we need to obtain the summary data for external purposes,
#' [extract_summary()] can be used with a `gt_tbl` object where summary rows
#' were added via `grand_summary_rows()` or [summary_rows()].
#'
#' @section Examples:
#'
#' Use a modified version of the [`sp500`] dataset to create a **gt** table with
#' row groups and row labels. Create the grand summary rows `min`, `max`, and
#' `avg` for the table with `grand_summary_rows()`.
#'
#' ```r
#' sp500 |>
#'   dplyr::filter(date >= "2015-01-05" & date <= "2015-01-16") |>
#'   dplyr::arrange(date) |>
#'   dplyr::mutate(week = paste0("W", strftime(date, format = "%V"))) |>
#'   dplyr::select(-adj_close, -volume) |>
#'   gt(
#'     rowname_col = "date",
#'     groupname_col = "week"
#'   ) |>
#'   grand_summary_rows(
#'     columns = c(open, high, low, close),
#'     fns = list(
#'       min ~ min(.),
#'       max ~ max(.),
#'       avg ~ mean(.)
#'     ),
#'     fmt = ~ fmt_number(., use_seps = FALSE)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_grand_summary_rows_1.png")`
#' }}
#'
#' Let's take the [`countrypops`] dataset and process that a bit before handing
#' it off to **gt**. We can create a single grand summary row with totals that
#' appears at the top of the table body (with `side = "top"`). We can define the
#' aggregation with a list that contains parameters for the grand summary row
#' label (`"TOTALS"`), the ID value of that row (`"totals"`), and the
#' aggregation function (expressed as `"sum"`, which **gt** recognizes as the
#' `sum()` function). Finally, we'll add a background fill to the grand summary
#' row with [tab_style()].
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(country_code_2 %in% c("BE", "NL", "LU")) |>
#'   dplyr::filter(year %% 10 == 0) |>
#'   dplyr::select(country_name, year, population) |>
#'   tidyr::pivot_wider(names_from = year, values_from = population) |>
#'   gt(rowname_col = "country_name") |>
#'   tab_header(title = "Populations of the Benelux Countries") |>
#'   tab_spanner(columns = everything(), label = "Year") |>
#'   fmt_integer() |>
#'   grand_summary_rows(
#'     fns =  list(label = "TOTALS", id = "totals", fn = "sum"),
#'     fmt = ~ fmt_integer(.),
#'     side = "top"
#'   ) |>
#'   tab_style(
#'     locations = cells_grand_summary(),
#'     style = cell_fill(color = "lightblue" |> adjust_luminance(steps = +1))
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_grand_summary_rows_2.png")`
#' }}
#'
#' @family row addition/modification functions
#' @section Function ID:
#' 6-2
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
grand_summary_rows <- function(
    data,
    columns = everything(),
    fns = NULL,
    fmt = NULL,
    side = c("bottom", "top"),
    missing_text = "---",
    formatter = NULL,
    ...
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Get the correct `side` value
  side <- rlang::arg_match0(side, values = c("bottom", "top"))

  summary_rows(
    data = data,
    groups = ":GRAND_SUMMARY:",
    columns = {{ columns }},
    fns = fns,
    fmt = fmt,
    side = side,
    missing_text = missing_text,
    formatter = formatter,
    ...
  )
}

# Summary rows helpers --------------------------------------------------------
# Normalize `fns` input in `summary_rows` and `grand_summary_rows`
#
# Returns a normalized list of summary functions
# list(
#   <id> = list(label = "the **label**", fn = ~mean(., na.rm = TRUE)),
#   <id> = list(label = "another label", fn = ~sum(.))
# )
normalize_summary_fns <- function(fns) {

  if (length(fns) < 1) {
    return(list())
  }

  summary_fns <- list()

  if (rlang::is_formula(fns)) {
    fns <-
      list(
        rlang::new_formula(
          lhs = rlang::f_lhs(fns),
          rhs = rlang::f_rhs(fns)
        )
      )
  }

  # Upgrade `fns` to a list if it's a vector
  if (!is.list(fns)) {
    fns <- as.list(fns)
  }

  if (
    is.list(fns) &&
    rlang::is_named(fns) &&
    all(names(fns) %in% c("id", "label", "fn"))
  ) {
    fns <- list(fns)
  }

  for (i in seq_along(fns)) {

    id <- NULL
    label <- NULL

    # Get `id` values if we have a named list
    if (rlang::is_named(fns[i])) {
      id <- names(fns[i])
    }

    # Extract the value of the first list component
    value <- fns[i][[1]]

    # If component is a named list, extract those elements by
    # any recognizable names
    if (
      is.list(value) &&
      rlang::is_named(value) &&
      all(names(value) %in% c("id", "label", "fn"))
    ) {

      id <- value$id
      label <- value$label
      value <- value$fn
    }

    if (is.character(value)) {

      #
      # Handle character vector cases
      #

      if (value %in% c("min", "max", "mean", "median", "sd", "sum")) {
        fn <- stats::as.formula(paste0("~", value, "(., na.rm = TRUE)"))
      } else {
        fn <- stats::as.formula(paste0("~", value, "(.)"))
      }

      id    <- id    %||% value
      label <- label %||% value

    } else if (rlang::is_formula(value)) {

      #
      # Handle formula cases
      #

      # Handles the syntax `label ~ fn(.)`

      formula_lhs <- rlang::f_lhs(value)
      formula_rhs <- rlang::f_rhs(value)

      fn <- rlang::new_formula(lhs = NULL, rhs = formula_rhs)

      # Determine if the LHS contains a two-element vector with a label and
      # an ID value; the order if not named is label then ID
      if (
        !is.name(formula_lhs) &&
        is.character(rlang::eval_bare(formula_lhs)) &&
        length(rlang::eval_bare(formula_lhs)) == 2
      ) {

        lhs_vector <- rlang::eval_bare(formula_lhs)

        # Get the names of the vector
        lhs_vector_names <- rlang::names2(lhs_vector)

        # If the vector is partially named, fill in the missing name (but
        # only if it has one recognized name)
        if (
          "" %in% lhs_vector_names &&
          any(lhs_vector_names %in% c("id", "label"))
        ) {
          if ("id" %in% lhs_vector_names) {
            names(lhs_vector)[names(lhs_vector) == ""] <- "label"
          } else {
            names(lhs_vector)[names(lhs_vector) == ""] <- "id"
          }
        }

        if (rlang::is_named(lhs_vector)) {

          vector_names <- names(lhs_vector)

          if (!all(vector_names %in% c("id", "label"))) {

            rlang::abort(c(
              "If using a named vector on the lhs of a formula for a summary
              function label and ID, it must have the correct names:",
              "*" = "The \"label\" and \"id\" names must be used."
            ))
          }

          if (length(unique(vector_names)) == 1) {

            which_duplicate_name <- unique(vector_names)

            rlang::abort(c(
              "If using a named vector on the lhs of a formula for a summary",
              "function label and ID, it must have two distinct names:",
              "*" = paste0("The \"", which_duplicate_name, "\" name was used twice.")
            ))
          }

          label <- unname(lhs_vector["label"])
          id <- unname(lhs_vector["id"])

        } else {

          label <- lhs_vector[1]
          id <- lhs_vector[2]
        }

      } else if (
        is.name(formula_lhs) ||
        !is.list(rlang::eval_bare(formula_lhs))
      ) {

        lhs_chr <- as.character(formula_lhs)

        if (is.null(id)) {
          id <- lhs_chr

          if (length(id) < 1) {

            formula_label <- rlang::as_label(formula_rhs)
            formula_label <- gsub("\\(.*", "", formula_label)
            id <- formula_label
          }
        }

        if (length(lhs_chr) < 1) {
          label <- id
        } else {
          label <- lhs_chr
        }

      } else if (is.list(rlang::eval_bare(formula_lhs))) {

        lhs_list <- rlang::eval_bare(formula_lhs)

        if (length(lhs_list) == 2) {

          if (rlang::is_named(lhs_list)) {

            component_names <- names(lhs_list)

            if (!all(component_names %in% c("id", "label"))) {

              rlang::abort(c(
                "If using a named list on the lhs of a formula for a summary",
                "function label and ID, it must have the correct names:",
                "*" = "The \"label\" and \"id\" names must be used"
              ))
            }

            label <- lhs_list[["label"]]
            id <- lhs_list[["id"]]

          } else {

            label <- lhs_list[[1]]
            id <- lhs_list[[2]]
          }
        }

        if (length(lhs_list) == 1) {

          if (is.null(id)) {

            id <- label <- lhs_list[[1]]

            if (
              inherits(id, "from_markdown") ||
              inherits(id, "html")
            ) {

              id <- create_unique_id_vals(id, simplify = TRUE)

            } else {
              label <- id
            }
          }
        }
      }
    }

    list_i <- list(list(label = label, fn = fn))

    names(list_i) <- id

    summary_fns <- c(summary_fns, list_i)
  }

  summary_fns
}

normalize_fmt_fns <- function(fmt) {

  if (length(fmt) == 0) {
    return(NULL)
  }

  if (rlang::is_formula(fmt)) {
    fmt <-
      list(
        rlang::new_formula(
          lhs = rlang::f_lhs(fmt),
          rhs = rlang::f_rhs(fmt)
        )
      )
  }

  fmt
}
