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


#' Helper to target cells at `locations`
#'
#' @name location-helper
#' @description
#' This listing with locations corresponding roughly from top to
#' bottom of a table:
#'
#' - [cells_title()]: targets the table title or the table subtitle depending on
#' the value given to the `groups` argument (`"title"` or `"subtitle"`).
#' - [cells_stubhead()]: targets the stubhead location, a cell of which is only
#' available when there is a stub; a label in that location can be created by
#' using [tab_stubhead()].
#' - [cells_column_spanners()]*: targets the spanner column labels with the
#' `spanners` argument; spanner column labels appear above the column labels.
#' - [cells_column_labels()]*: targets the column labels with its `columns`
#' argument.
#' - [cells_row_groups()]*: targets the row group labels in any available row
#' groups using the `groups` argument.
#' - [cells_stub()]*: targets row labels in the table stub using the `rows`
#' argument.
#' - [cells_body()]*: targets data cells in the table body using intersections of
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
#' `*` are the only functions usable by the `text_*()` functions.
#'
#' # Note
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument (e.g., [tab_style()]), multiple locations
#' can be targeted by enclosing several `cells_*()` helper functions in a
#' `list()` (e.g., `list(cells_body(), cells_grand_summary())`).
#'
#' @family location helper functions
#'
#' @seealso
#' Functions with `locations` argument:
#'
#' * [tab_footnote()]
#' * [tab_style()]
#' * [text_transform()]
#' * [text_replace()]
#' * [text_case_when()]
#' * [text_case_match()]
#'
#' These functions contain more example of usage.
#' @keywords internal
NULL

# Specify rows / columns -------------------------------------------------------
#' Apply conditional formatting to cells with `rows` and `columns`
#'
#' @name rows-columns
#' @description
#'
#' To apply [styling][tab_style()] or [formatting][fmts], you can use the
#' `columns` and `rows` arguments. The syntax should be very familiar for dplyr
#' users as you can use the tidyselect specification.
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
#' By default all columns and rows are selected (with the `everything()`
#' defaults). Cell values that are incompatible with a given formatting function
#' will be skipped over, like `character` values and numeric `fmt_*()`
#' functions. So it's safe to select all columns with a particular formatting
#' function (only those values that can be formatted will be formatted), but,
#' you may not want that. One strategy is to format the bulk of cell values with
#' one formatting function and then constrain the columns for later passes with
#' other types of formatting (the last formatting done to a cell is what you get
#' in the final output).
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
#' in the table) and returns a logical vector. This is nice if you want to base
#' formatting on values in the column or another column, or, you'd like to use a
#' more complex predicate expression.
#'
#' @examples
#' gt_tbl <- gt(exibble)
#'
#' gt_tbl |>
#'   fmt_time(
#'     columns = contains("time") & !starts_with("date"),
#'      rows = num > 100 & group == "grp_b"
#'   )
#'
#' # Styling numeric columns based on range
#'
#' gt_tbl |>
#'   tab_style(
#'     style = cell_text(weight = "bold"),
#'     locations = cells_body(columns =  where(is.factor))
#'   )
#'
#' # Naming rows
#'
#' gt_tbl_rows <- gt(exibble, rowname_col = "row")
#'
#' gt_tbl_rows |>
#'   fmt_datetime(
#'     columns = datetime,
#'     rows = c("row_1", "row_8")
#'   )
NULL

# formatting principle ---------------------------------------------------------
#' Formatting functions
#'
#' All formatting functions in gt are quite consistent. All functions that start
#' with the common `fmt_*()` prefix have the following points in common
#'
#' Let's use the [exibble] data for this.
#'
#' @name fmts
#' @examples
#' gt_tbl <- gt(exibble)
#'
#' #
#' # They all have `columns` and `rows` to specify target cells and default to
#' # styling all compatible cells.
#' #
#' # By default, they apply styling to all compatible columns.
#'
#' # Will style all numeric columns
#' gt_tbl |> fmt_number()
#'
#' # will style the time column
#' gt_tbl |> fmt_time(columns = time)
#'
#' # Will style nothing since is only compatible with logical values
#' gt_tbl |> fmt_tf()
#'
#' #
#' # Their order has importance as the last styling will have priority.
#' #
#'
#' # Will style all numeric columns as integer
#' # fmt_number() will have no effect
#' gt_tbl |> fmt_number() |> fmt_integer()
#'
#' #
#' # Therefore, to apply different styling, it is important to specify columns or rows.
#' #
#'
#' # Will style all numeric columns as number and as currency the currency column.
#' # fmt_number() will have no effect
#' gt_tbl |> fmt_number() |> fmt_integer(currency)
NULL

# locale -----------------------------------------------------------------------
#' Localize formatting and symbols
#'
#' @description
#'
#' # Specify locale
#'
#' `gt()`, some `cols_*()` and `fmt_*()` functions have a `locale` argument.
#' You can pass `locale` as a 2 letters string or 4. (e.g. `"fr"` for French,
#' `"pt-BR"` for Brazilian Portuguese). gt also resolves different spellings
#' internally as much as possible. For example `"en_GB"` will work out of the
#' box.
#'
#' # Range of action of locale
#'
#' One of the advantage of using gt its consistency in using symbols and currencies
#' in multiple languages
#'
#' There are two ways to localize your results with gt.
#'
#' * Passing it **globally** `gt(locale = "<locale>")`
#'
#' Will localize everything possible in the `gt()` pipeline.
#'
#' * In individual `fmt_()` functions
#'
#' * Localize buttons in [opt_interactive()]
#'
#' Will only affect the output of one specific function (or override global setting).
#'
#' `locale` has very low precedence usually. As soon as you override some parameters,
#' `sep_mark`, `dec_mark`, `incl_space`, they will be override `locale`.
#'
#' @examples
#' # The Spanish locale uses `.` as thousands sep (English uses `,`) and uses
#' # a `,` as the decimal mark
#'
#' # Using the locale in `gt()` will format automatically all output in
#' # subsequent `fmt_*()` calls.
#' exibble |>
#'   gt(locale = "es-AR") |>
#'   fmt_number()
#'
#' # Only format currency as Mexican peso
#'
#' exibble |>
#'   gt(locale = "fr") |>
#'   fmt_currency(currency, locale = "es-MX")
#'
#' # will use the provided `sep_mark`
#' exibble |>
#'   gt(locale = "fr") |>
#'   fmt_currency(currency, sep_mark = "", locale = "es-MX")
#'
#' # Use your imagination, and mix and match.
#'
#' @seealso [info_locales()], [info_flags()]
#' @name locale
NULL
