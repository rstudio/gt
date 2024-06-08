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
