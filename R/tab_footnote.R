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


# tab_footnote() ---------------------------------------------------------------
#' Add a table footnote
#'
#' @description
#'
#' `tab_footnote()` can make it a painless process to add a footnote to a
#' **gt** table. There are commonly two components to a footnote:
#' (1) a footnote mark that is attached to the targeted cell content, and (2)
#' the footnote text itself that is placed in the table's footer area. Each unit
#' of footnote text in the footer is linked to an element of text or otherwise
#' through the footnote mark. The footnote system in **gt** presents footnotes
#' in a way that matches the usual expectations, where:
#'
#' 1. footnote marks have a sequence, whether they are symbols, numbers, or
#' letters
#' 2. multiple footnotes can be applied to the same content (and marks are
#' always presented in an ordered fashion)
#' 3. footnote text in the footer is never exactly repeated, **gt** reuses
#' footnote marks where needed throughout the table
#' 4. footnote marks are ordered across the table in a consistent manner (left
#' to right, top to bottom)
#'
#' Each call of `tab_footnote()` will either add a different footnote to the
#' footer or reuse existing footnote text therein. One or more cells outside of
#' the footer are targeted using the [`cells_*()`][location-helper] helper
#' functions (e.g., [cells_body()], [cells_column_labels()], etc.). You can
#' choose to *not* attach a footnote mark by simply not specifying anything in
#' the `locations` argument.
#'
#' By default, **gt** will choose which side of the text to place the footnote
#' mark via the `placement = "auto"` option. You are, however, always free to
#' choose the placement of the footnote mark (either to the `"left` or `"right"`
#' of the targeted cell content).
#'
#' @inheritParams fmt_number
#'
#' @param footnote *Footnote text*
#'
#'   `scalar<character>` // **required**
#'
#'   The text to be used in the footnote. We can optionally use [md()] or [html()]
#'   to style the text as Markdown or to retain HTML elements in the footnote text.
#'
#' @param locations *Locations to target*
#'
#'   [`<locations expressions>`][location-helper] // *default:* `NULL` (`optional`)
#'
#'   The cell or set of cells to be associated with the footnote. Supplying any
#'   of the `cells_*()` helper functions is a useful way to target the location
#'   cells that are associated with the footnote text. These helper functions
#'   are: [cells_title()], [cells_stubhead()], [cells_column_spanners()],
#'   [cells_column_labels()], [cells_row_groups()], [cells_stub()],
#'   [cells_body()], [cells_summary()], [cells_grand_summary()],
#'   [cells_stub_summary()], and [cells_stub_grand_summary()]. Additionally, we
#'   can enclose several `cells_*()` calls within a `list()` if we wish to link
#'   the footnote text to different types of locations (e.g., body cells, row
#'   group labels, the table title, etc.).
#'
#' @param placement *Placement of the footnote mark*
#'
#'   `singl-kw:[auto|right|left]` // *default:* `"auto"`
#'
#'   Where to affix footnote marks to the table content. Two options for this
#'   are `"left` or `"right"`, where the placement is either to the absolute
#'   left or right of the cell content. By default, however, this option is set
#'   to `"auto"` whereby **gt** will choose a preferred left-or-right placement
#'   depending on the alignment of the cell content.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Formatting of footnote text and marks:
#'
#' There are several options for controlling the formatting of the footnotes,
#' their marks, and related typesetting in the footer. All of these options are
#' available within [tab_options()] and a subset of these are exposed in their
#' own `opt_*()` functions.
#'
#' ## Choosing the footnote marks
#'
#' We can modify the set of footnote marks with
#' `tab_options(..., footnotes.marks)` or `opt_footnote_marks(..., )`. What that
#' argument needs is a vector that will represent the series of marks. The
#' series of footnote marks is recycled when its usage goes beyond the length of
#' the set. At each cycle, the marks are simply doubled, tripled, and so on
#' (e.g., `*` -> `**` -> `***`). The option exists for providing keywords for
#' certain types of footnote marks. The keywords are:
#'
#' - `"numbers"`: numeric marks, they begin from `1` and these marks are not
#' subject to recycling behavior (this is the default)
#' - `"letters"`: minuscule alphabetic marks, internally uses the `letters`
#' vector which contains 26 lowercase letters of the Roman alphabet
#' - `"LETTERS"`: majuscule alphabetic marks, using the `LETTERS` vector
#' which has 26 uppercase letters of the Roman alphabet
#' - `"standard"`: symbolic marks, four symbols in total
#' - `"extended"`: symbolic marks, extends the standard set by adding two
#' more symbols, making six
#'
#' The symbolic marks are the: (1) Asterisk, (2) Dagger, (3) Double Dagger,
#' (4) Section Sign, (5) Double Vertical Line, and (6) Paragraph Sign; the
#' `"standard"` set has the first four, `"extended"` contains all.
#'
#' ## Defining footnote typesetting specifications
#'
#' A footnote spec consists of a string containing control characters for
#' formatting. They are separately defined for footnote marks beside footnote
#' text in the table footer (the `'spec_ftr'`) and for marks beside the targeted
#' cell content (the `'spec_ref'`).
#'
#' Not every type of formatting makes sense for footnote marks so the
#' specification is purposefully constrained to the following:
#'
#' - as superscript text (with the `"^"` control character) or regular-sized
#' text residing on the baseline
#' - bold text (with `"b"`), italicized text (with `"i"`), or unstyled text
#' (don't use either of the `"b"` or `"i"` control characters)
#' - enclosure in parentheses (use `"("` / `")"`) or square brackets (with
#' `"["` / `"]"`)
#' - a period following the mark (using `"."`); this is most commonly used in
#' the table footer
#'
#' With the aforementioned control characters we could, for instance, format
#' the footnote marks to be superscript text in bold type with `"^b"`. We might
#' want the marks in the footer to be regular-sized text in parentheses, so the
#' spec could be either `"()"` or `"(x)"` (you can optionally use `"x"` as a
#' helpful placeholder for the marks).
#'
#' These options can be set either in a [tab_options()] call (with the
#' `footnotes.spec_ref` and `footnotes.spec_ftr` arguments) or with
#' [opt_footnote_spec()] (using the `spec_ref` or `spec_ftr` arguments).
#'
#' ## Additional typesetting options for footnote text residing in the footer
#'
#' Within [tab_options()] there are two arguments that control the typesetting
#' of footnotes. With `footnotes.multiline`, we have a setting that determines
#' whether each footnote will start on a new line, or, whether they are combined
#' into a single block of text. The default for this is `TRUE`, but, if `FALSE`
#' we can control the separator between consecutive footnotes with the
#' `footnotes.sep` argument. By default, this is set to a single space character
#' (`" "`).
#'
#' @section Examples:
#'
#' Using a subset of the [`sza`] dataset, let's create a new **gt** table. The
#' body cells in the `sza` column will receive background color fills according
#' to their data values (with [data_color()]). After that, the use of
#' `tab_footnote()` lets us add a footnote to the `sza` column label (explaining
#' what the color gradient signifies).
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
#'     footnote = "Color indicates the solar zenith angle.",
#'     locations = cells_column_labels(columns = sza)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_footnote_1.png")`
#' }}
#'
#' Of course, we can add more than one footnote to the table, but, we have to
#' use several calls of `tab_footnote()`. This variation of the [`sza`] table
#' has three footnotes: one on the `"TST"` column label and two on the `"SZA"`
#' column label (these were capitalized with [opt_all_caps()]). We will
#' ultimately have three calls of `tab_footnote()` and while the order of calls
#' usually doesn't matter, it does have a subtle effect here since two footnotes
#' are associated with the same text content (try reversing the second and third
#' calls and observe the effect in the footer).
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
#'   opt_all_caps() |>
#'   cols_align(align = "center") |>
#'   cols_width(everything() ~ px(200)) |>
#'   tab_footnote(
#'     footnote = md("TST stands for *True Solar Time*."),
#'     locations = cells_column_labels(columns = tst)
#'   ) |>
#'   tab_footnote(
#'     footnote = md("SZA stands for *Solar Zenith Angle*."),
#'     locations = cells_column_labels(columns = sza)
#'   ) |>
#'   tab_footnote(
#'     footnote = "Higher Values indicate sun closer to horizon.",
#'     locations = cells_column_labels(columns = sza)
#'   ) |>
#'   tab_options(footnotes.multiline = FALSE)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_footnote_2.png")`
#' }}
#'
#' Text in the footer (both from footnotes and also from source notes) tends to
#' widen the table and, by extension, all the columns within it. We can limit
#' that by explicitly setting column width values, which is what was done above
#' with [cols_width()]. There can also be a correspondingly large amount of
#' vertical space taken up by the footer since footnotes will, by default, each
#' start on a new line. In the above example, we used
#' `tab_options(footnotes.multiline = FALSE)` to make it so that all footer text
#' is contained in a single block of text.
#'
#' Let's move on to another footnote-laden table, this one based on the
#' [`towny`] dataset. We have a header part, with a title and a subtitle. We
#' can choose which of these could be associated with a footnote and in this
#' case it is the `"subtitle"` (one of two options in the [cells_title()] helper
#' function). This table has a stub with row labels and some of those labels are
#' associated with a footnote. So long as row labels are unique, they can be
#' easily used as row identifiers in [cells_stub()]. The third footnote is
#' placed on the `"Density"` column label. Here, changing the order of the
#' `tab_footnote()` calls has no effect on the final table rendering.
#'
#' ```r
#' towny |>
#'   dplyr::filter(csd_type == "city") |>
#'   dplyr::select(name, density_2021, population_2021) |>
#'   dplyr::slice_max(population_2021, n = 10) |>
#'   gt(rowname_col = "name") |>
#'   tab_header(
#'     title = md("The 10 Largest Municipalities in `towny`"),
#'     subtitle = "Population values taken from the 2021 census."
#'   ) |>
#'   fmt_integer() |>
#'   cols_label(
#'     density_2021 = "Density",
#'     population_2021 = "Population"
#'   ) |>
#'   tab_footnote(
#'     footnote = "Part of the Greater Toronto Area.",
#'     locations = cells_stub(rows = c(
#'       "Toronto", "Mississauga", "Brampton", "Markham", "Vaughan"
#'     ))
#'   ) |>
#'   tab_footnote(
#'     footnote = md("Density is in terms of persons per km^2^."),
#'     locations = cells_column_labels(columns = density_2021)
#'   ) |>
#'   tab_footnote(
#'     footnote = "Census results made public on February 9, 2022.",
#'     locations = cells_title(groups = "subtitle")
#'   ) |>
#'   tab_source_note(source_note = md(
#'     "Data taken from the `towny` dataset (in the **gt** package)."
#'   )) |>
#'   opt_footnote_marks(marks = "letters")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_footnote_3.png")`
#' }}
#'
#' In the above table, we elected to change the footnote marks to letters
#' instead of the default numbers (done through [opt_footnote_marks()]). A
#' source note was also added; this was mainly to demonstrate that source notes
#' will be positioned beneath footnotes in the footer section.
#'
#' For our final example, let's make a relatively small table deriving from the
#' [`sp500`] dataset. The set of `tab_footnote()` calls used here (four of them)
#' have minor variations that allow for interesting expressions of footnotes.
#' Two of the footnotes target values in the body of the table (using the
#' [cells_body()] helper function to achieve this). On numeric values that
#' right-aligned, **gt** will opt to place the footnote on the left of the
#' content so as to not disrupt the alignment. However, the `placement` argument
#' can be used to force the positioning of the footnote mark after the content.
#' We can also opt to include footnotes that have no associated footnote marks
#' whatsoever. This is done by not providing anything to `locations`. These
#' 'markless' footnotes will precede the other footnotes in the footer section.
#'
#' ```r
#' sp500 |>
#'   dplyr::filter(date >= "2015-01-05" & date <="2015-01-10") |>
#'   dplyr::select(-c(adj_close, volume, high, low)) |>
#'   dplyr::mutate(change = close - open) |>
#'   dplyr::arrange(date) |>
#'   gt() |>
#'   tab_header(title = "S&P 500") |>
#'   fmt_date(date_style = "m_day_year") |>
#'   fmt_currency() |>
#'   cols_width(everything() ~ px(150)) |>
#'   tab_footnote(
#'     footnote = "More red days than green in this period.",
#'     locations = cells_column_labels(columns = change)
#'   ) |>
#'   tab_footnote(
#'     footnote = "Lowest opening value.",
#'     locations = cells_body(columns = open, rows = 3),
#'   ) |>
#'   tab_footnote(
#'     footnote = "Devastating losses on this day.",
#'     locations = cells_body(columns = change, rows = 1),
#'     placement = "right"
#'   ) |>
#'   tab_footnote(footnote = "All values in USD.") |>
#'   opt_footnote_marks(marks = "LETTERS") |>
#'   opt_footnote_spec(spec_ref = "i[x]", spec_ftr = "x.")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_footnote_4.png")`
#' }}
#'
#' Aside from changing the footnote marks to consist of `"LETTERS"`, we've also
#' changed the way the marks are formatted. In our use of [opt_footnote_spec()],
#' the `spec_ref` option governs the footnote marks across the table. Here, we
#' describe marks that are italicized and set between square brackets (with
#' `"i[x]"`). The `spec_ftr` argument is used for the footer representation of
#' the footnote marks. As described in the example with `"x."`, it is rendered
#' as a footnote mark followed by a period.
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-7
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
tab_footnote <- function(
    data,
    footnote,
    locations = NULL,
    placement = c("auto", "right", "left")
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  placement <- rlang::arg_match0(placement, values = c("auto", "right", "left"))
  rlang::check_required(footnote)

  if (is.null(locations)) {

    # We need to invoke `dt_footnotes_add()` here (and not use
    # `as_locations()`/`set_footnote()`) because there is no
    # method for NULL

    data <-
      dt_footnotes_add(
        data = data,
        locname = "none",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 0,
        rownum = NA_integer_,
        footnotes = footnote,
        placement = placement
      )

    return(data)
  }

  # Resolve into a list of locations
  locations <- as_locations(locations)

  # Resolve the locations of the targeted data cells and append
  # the footnotes
  for (loc in locations) {

    data <-
      withCallingHandlers(
        set_footnote(
          loc = loc,
          data = data,
          footnote = footnote,
          placement = placement
        ),
        error = function(e) {
          cli::cli_abort(
            "Can't add footnote {.val {footnote}}.",
            parent = e
          )
        })
  }

  data
}

# Helpers-----------------------------------
set_footnote <- function(loc, data, footnote, placement) {
  UseMethod("set_footnote")
}

#' @export
set_footnote.cells_title <- function(
    loc,
    data,
    footnote,
    placement
) {

  title_components <- rlang::eval_tidy(loc$groups)

  if ("title" %in% title_components) {

    data <-
      dt_footnotes_add(
        data = data,
        locname = "title",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 1,
        rownum = NA_integer_,
        footnotes = footnote,
        placement = placement
      )
  }

  if ("subtitle" %in% title_components) {

    data <-
      dt_footnotes_add(
        data = data,
        locname = "subtitle",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 2,
        rownum = NA_integer_,
        footnotes = footnote,
        placement = placement
      )
  }

  data
}

#' @export
set_footnote.cells_stubhead <- function(
    loc,
    data,
    footnote,
    placement
) {

  data <-
    dt_footnotes_add(
      data = data,
      locname = loc$groups,
      grpname = NA_character_,
      colname = NA_character_,
      locnum = 2.5,
      rownum = NA_integer_,
      footnotes = footnote,
      placement = placement
    )

  data
}

#' @export
set_footnote.cells_column_labels <- function(
    loc,
    data,
    footnote,
    placement
) {

  resolved <-
    resolve_cells_column_labels(
      data = data,
      object = loc,
      call = call("cells_column_labels")
    )

  cols <- resolved$columns

  colnames <- names(cols)

  data <-
    dt_footnotes_add(
      data = data,
      locname = "columns_columns",
      grpname = NA_character_,
      colname = colnames,
      locnum = 4,
      rownum = NA_integer_,
      footnotes = footnote,
      placement = placement
    )

  data
}

#' @export
set_footnote.cells_column_spanners <- function(
    loc,
    data,
    footnote,
    placement
) {

  resolved <-
    resolve_cells_column_spanners(
      data = data,
      object = loc,
      call = call("cells_column_spanners")
    )

  groups <- resolved$spanners

  data <-
    dt_footnotes_add(
      data = data,
      locname = "columns_groups",
      grpname = groups,
      colname = NA_character_,
      locnum = 3,
      rownum = NA_integer_,
      footnotes = footnote,
      placement = placement
    )

  data
}

#' @export
set_footnote.cells_row_groups <- function(
    loc,
    data,
    footnote,
    placement
) {

  row_groups <- dt_row_groups_get(data = data)

  # Resolve row groups
  resolved_row_groups_idx <-
    resolve_vector_i(
      expr = !!loc$groups,
      vector = row_groups,
      item_label = "row group"
    )

  groups <- row_groups[resolved_row_groups_idx]

  data <-
    dt_footnotes_add(
      data = data,
      locname = "row_groups",
      grpname = groups,
      colname = NA_character_,
      locnum = 5,
      rownum = NA_integer_,
      footnotes = footnote,
      placement = placement
    )

  data
}

#' @export
set_footnote.cells_body <- function(
    loc,
    data,
    footnote,
    placement
) {

  resolved <-
    resolve_cells_body(
      data = data,
      object = loc,
      call = call("cells_body")
    )

  rows <- resolved$rows

  colnames <- resolved$colnames

  data <-
    dt_footnotes_add(
      data = data,
      locname = "data",
      grpname = NA_character_,
      colname = colnames,
      locnum = 5,
      rownum = rows,
      footnotes = footnote,
      placement = placement
    )

  data
}

#' @export
set_footnote.cells_stub <- function(
    loc,
    data,
    footnote,
    placement
) {

  resolved <- resolve_cells_stub(data = data, object = loc)

  columns <- resolved$columns
  rows <- resolved$rows

  # Get all stub variables for fallback
  stub_vars <- dt_boxhead_get_var_by_type(data = data, type = "stub")

  # Validate that specified columns are actually stub columns
  if (!is.null(loc$columns)) {
    # Check if columns were specified but none were resolved; this happens
    # when the user specifies non-stub columns
    if (length(columns) == 0) {
      # Try to extract the originally requested column names for error messaging
      requested_cols_expr <- loc$columns
      requested_cols_str <- if (rlang::is_quosure(requested_cols_expr)) {
        tryCatch({
          # Try to extract simple column names from the quosure
          expr_str <- rlang::as_string(rlang::quo_get_expr(requested_cols_expr))
          # Remove quotes if present
          gsub('^"|"$', '', expr_str)
        }, error = function(e) {
          "specified column(s)"
        })
      } else {
        "specified column(s)"
      }

      available_stub_cols <- if (length(stub_vars) > 0) {
        paste0("Available stub columns: ", paste(stub_vars, collapse = ", "))
      } else {
        "This table has no stub columns."
      }

      cli::cli_abort(
        c(
          "The {requested_cols_str} column{?s} specified in `cells_stub()` {?is/are} not {?a/} stub column{?s}.",
          "i" = "`cells_stub()` can only target columns that are part of the table stub.",
          "i" = available_stub_cols,
          "i" = "To target non-stub columns, use `cells_body()` instead."
        )
      )
    }

    # Also check if any resolved columns are not in stub
    if (length(columns) > 0) {
      non_stub_cols <- setdiff(columns, stub_vars)

      if (length(non_stub_cols) > 0) {
        available_stub_cols <- if (length(stub_vars) > 0) {
          paste0("Available stub columns: ", paste(stub_vars, collapse = ", "))
        } else {
          "This table has no stub columns."
        }

        cli::cli_abort(
          c(
            "Column{?s} {.val {non_stub_cols}} {?is/are} not stub column{?s}.",
            "i" = "cells_stub() can only target columns that are part of the table stub.",
            "i" = available_stub_cols,
            "i" = "To target non-stub columns, use cells_body() instead."
          )
        )
      }
    }
  }

  # Check if this is traditional usage (no columns parameter)
  # vs. new usage (explicit columns parameter provided)
  is_traditional_usage <- is.null(loc$columns)

  if (is_traditional_usage) {
    # For backward compatibility: traditional cells_stub() usage without columns parameter
    # Use the original "stub" locname for compatibility with existing code
    data <-
      dt_footnotes_add(
        data = data,
        locname = "stub",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 5,
        rownum = rows,
        footnotes = footnote,
        placement = placement
      )
  } else {
    # New usage: per-column stub footnotes
    # If no stub columns are resolved, apply to all stub columns (backward compatibility)
    if (length(columns) == 0) {
      if (!all(is.na(stub_vars))) {
        columns <- stub_vars
      }
    }

    # For multi-column stub footnotes, we use "stub" locname for consolidation
    # but pass the specific column names to ensure footnotes are targeted correctly
    data <-
      dt_footnotes_add(
        data = data,
        locname = "stub",
        grpname = NA_character_,
        colname = columns,
        locnum = 5,
        rownum = rows,
        footnotes = footnote,
        placement = placement
      )
  }

  data
}

#' @export
set_footnote.cells_summary <- function(
    loc,
    data,
    footnote,
    placement
) {

  add_summary_location_row(
    loc = loc,
    data = data,
    style = footnote,
    placement = placement,
    df_type = "footnotes_df"
  )
}

#' @export
set_footnote.cells_grand_summary <- function(
    loc,
    data,
    footnote,
    placement
) {

  add_grand_summary_location_row(
    loc = loc,
    data = data,
    style = footnote,
    placement = placement,
    df_type = "footnotes_df"
  )
}

#' @export
set_footnote.cells_stub_summary <- function(
    loc,
    data,
    footnote,
    placement
) {

  add_summary_location_row(
    loc = loc,
    data = data,
    style = footnote,
    placement = placement,
    df_type = "footnotes_df"
  )
}

set_footnote.cells_stub_grand_summary <- function(
    loc,
    data,
    footnote,
    placement
) {

  add_grand_summary_location_row(
    loc = loc,
    data = data,
    style = footnote,
    placement = placement,
    df_type = "footnotes_df"
  )
}

#' @export
set_footnote.cells_source_notes <- function(
    loc,
    data,
    footnote,
    placement
) {

  cli::cli_abort(
    "Footnotes cannot be applied to source notes.",
    call = call("cells_source_notes")
  )
}

#' @export
set_footnote.cells_footnotes <- function(
    loc,
    data,
    footnote,
    placement
) {

  cli::cli_abort(
    "Footnotes cannot be applied to other footnotes.",
    call = call("cells_footnotes")
  )
}
