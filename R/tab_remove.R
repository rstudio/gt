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


# rm_header() ------------------------------------------------------------------
#' Remove the table header
#'
#' @description
#'
#' We can remove the table header from a **gt** table quite easily with
#' `rm_header()`. The table header is an optional table part (positioned above
#' the column labels) that can be added through [tab_header()].
#'
#' This function for removal is useful if you have received a **gt** table
#' (perhaps through an API that returns **gt** objects) but would prefer that
#' the table not contain a header. This function is safe to use even if there is
#' no header part in the input `gt_tbl` object.
#'
#' @param data *The gt table data object*
#'
#'   `obj:<gt_tbl>` // **required**
#'
#'   This is the **gt** table object that is commonly created through use of the
#'   [gt()] function.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Let's use a subset of the [`gtcars`] dataset to create a **gt** table. A
#' header part can be added with [tab_header()]; with that, we get
#' a title and a subtitle for the table.
#'
#' ```r
#' gt_tbl <-
#'   gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice(1:5) |>
#'   gt() |>
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   )
#'
#' gt_tbl
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_header_1.png")`
#' }}
#'
#' If you decide that you don't want the header in the `gt_tbl` object, it can
#' be removed with `rm_header()`.
#'
#' ```r
#' rm_header(data = gt_tbl)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_header_2.png")`
#' }}
#'
#' @family part removal functions
#' @section Function ID:
#' 7-1
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @export
rm_header <- function(data) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Reinitialize the heading component of the `gt_tbl` object
  dt_heading_init(data = data)
}

# rm_stubhead() ----------------------------------------------------------------
#' Remove the stubhead label
#'
#' @description
#'
#' We can easily remove the stubhead label from a **gt** table with
#' `rm_stubhead()`. The stubhead location only exists if there is a table stub
#' and the text in that cell is added with [tab_stubhead()].
#'
#' This function for removal is useful if you have received a **gt** table
#' (perhaps through an API that returns **gt** objects) but would prefer that
#' the table not contain any content in the stubhead. This function is safe to
#' use even if there is no stubhead label in the input `gt_tbl` object.
#'
#' @inheritParams rm_header
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Using the [`gtcars`] dataset, we'll create a **gt** table. With
#' [tab_stubhead()], it's possible to add a stubhead label. This appears in the
#' top-left and can be used to describe what is in the stub.
#'
#' ```r
#' gt_tbl <-
#'   gtcars |>
#'   dplyr::select(model, year, hp, trq) |>
#'   dplyr::slice(1:5) |>
#'   gt(rowname_col = "model") |>
#'   tab_stubhead(label = "car")
#'
#' gt_tbl
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_stubhead_1.png")`
#' }}
#'
#' If you decide that you don't want the stubhead label in the `gt_tbl` object,
#' it can be removed with `rm_stubhead()`.
#'
#' ```r
#' rm_stubhead(data = gt_tbl)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_stubhead_2.png")`
#' }}
#'
#' @family part removal functions
#' @section Function ID:
#' 7-2
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @export
rm_stubhead <- function(data) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Reinitialize the stubhead component of the `gt_tbl` object
  dt_stubhead_init(data = data)
}

# rm_spanners() ----------------------------------------------------------------
#' Remove column spanner labels
#'
#' @description
#'
#' If you would like to remove column spanner labels then the `rm_spanners()`
#' function can make this possible. Column spanner labels appear above the
#' column labels and can occupy several levels via stacking either through
#' [tab_spanner()] or [tab_spanner_delim()]. Spanner column labels are
#' distinguishable and accessible by their ID values.
#'
#' This function for removal is useful if you have received a **gt** table
#' (perhaps through an API that returns **gt** objects) but would prefer that
#' some or all of the column spanner labels be removed. This function is safe to
#' use even if there are no column spanner labels in the input `gt_tbl` object
#' so long as select helpers (such as the default `everything()`) are used
#' instead of explicit ID values.
#'
#' @inheritParams rm_header
#'
#' @param spanners *Spanners to remove*
#'
#'   `<spanner-targeting expression>` // *default:* `everything()`
#'
#'   A specification of which spanner column labels should be removed. Those to
#'   be removed can be given as a vector of spanner ID values (every spanner
#'   column label has one, either set by the user or by **gt** when using
#'   [tab_spanner_delim()]). A select helper can also be used and, by default,
#'   this is `everything()` (whereby all spanner column labels will be removed).
#'
#' @param levels *Spanner levels to remove*
#'
#'   `scalar<numeric|integer>` // *default:* `NULL` (`optional`)
#'
#'   Instead of removing spanner column labels by ID values, entire levels of
#'   spanners can instead be removed. Supply a numeric vector of level values
#'   (the first level is `1`) and, if they are present, they will be removed.
#'   Any input given to `level` will mean that `spanners` is ignored.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use a portion of the [`gtcars`] dataset to create a **gt** table. With
#' [tab_spanner()], we can group several related columns together under a
#' spanner column. In this example, that is done with several [tab_spanner()]
#' calls in order to create two levels of spanner column labels.
#'
#' ```r
#' gt_tbl <-
#'   gtcars |>
#'   dplyr::select(
#'     -mfr, -trim, bdy_style, drivetrain,
#'     -drivetrain, -trsmn, -ctry_origin
#'   ) |>
#'   dplyr::slice(1:8) |>
#'   gt(rowname_col = "model") |>
#'   tab_spanner(label = "HP", columns = c(hp, hp_rpm)) |>
#'   tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) |>
#'   tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) |>
#'   tab_spanner(
#'     label = "Performance",
#'     columns = c(
#'       hp, hp_rpm, trq, trq_rpm,
#'       mpg_c, mpg_h
#'     )
#'   )
#'
#' gt_tbl
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_spanners_1.png")`
#' }}
#'
#' If you decide that you don't want any of the spanners in the `gt_tbl` object,
#' they can all be removed with `rm_spanners()`.
#'
#' ```r
#' rm_spanners(data = gt_tbl)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_spanners_2.png")`
#' }}
#'
#' Individual spanner column labels can be removed by ID value. In all the above
#' uses of [tab_spanner()], the `label` value *is* the ID value (you can
#' alternately set a different ID value though the `id` argument). Let's remove
#' the `"HP"` and `"MPG"` spanner column labels with `rm_spanners()`.
#'
#' ```r
#' rm_spanners(data = gt_tbl, spanners = c("HP", "MPG"))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_spanners_3.png")`
#' }}
#'
#' We can also remove spanner column labels by level with `rm_spanners()`.
#' Provide a vector of one or more values greater than or equal to `1` (the
#' first level starts there). In the next example, we'll remove the first level
#' of spanner column labels. Any levels not being removed will collapse down
#' accordingly.
#'
#' ```r
#' rm_spanners(data = gt_tbl, levels = 1)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_spanners_4.png")`
#' }}
#'
#' @family part removal functions
#' @section Function ID:
#' 7-3
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @export
rm_spanners <- function(
    data,
    spanners = everything(),
    levels = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Obtain the spanners table (may be an empty table if no spanners
  # have been produced by `tab_spanner()` or `tab_spanner_delim`)
  spanners_tbl <- dt_spanners_get(data = data)

  # Obtain the number of rows within the spanners table; this may be
  # zero but the number indicates the number of distinct spanners
  spanners_count <- nrow(spanners_tbl)

  # If there are no spanners, return the gt object unchanged
  if (spanners_count < 1) {
    return(data)
  }

  # Get a vector of integer values that indicates which spanners
  # in the `spanners_tbl` are to be targeted for removal; this
  # uses tidyselect and will error if character values are provided
  # and they don't all correspond to `spanner_id` values of
  # the `spanners_tbl`
  if (is.null(levels)) {

    spanners_i <-
      as.integer(
        resolve_vector_i(
          expr = {{ spanners }},
          vector = spanners_tbl[["spanner_id"]],
          "spanner"
        )
      )

    remove_by <- "id"

  } else {

    # Ensure that `levels` is numeric vector
    if (!is.numeric(levels)) {
      cli::cli_abort(
        "If using {.arg levels} to remove spanners, it must be a numeric vector."
      )
    }

    # Transform the `levels` vector to an integer vector
    spanners_i <- as.integer(levels)

    remove_by <- "level"
  }

  # In cases where a select helper is used and there are no
  # integer values in the resultant vector, return the gt
  # object unchanged
  if (length(spanners_i) < 1) {
    return(data)
  }

  # Given that the `spanners_i` vector is not empty and
  # corresponds to row indices in `spanners_tbl`, use that
  # integer vector to remove components (i.e., spanners)
  # from `spanners_tbl`
  if (remove_by == "id") {
    spanners_tbl <- spanners_tbl[-spanners_i, ]
  }

  # If `levels` was used then the `spanner_tbl` will undergo
  # a filtering via those values in the `spanner_level` column
  if (remove_by == "level") {
    spanners_tbl <- spanners_tbl[!(spanners_tbl$spanner_level %in% spanners_i), ]
  }

  # We may either obtain an empty or non-empty `spanners_tbl`;
  # in the first case, re-initialize the spanners table component and,
  # in the latter case, set the changed `spanners_tbl` within
  # the gt object
  if (nrow(spanners_tbl) < 1) {
    data <- dt_spanners_init(data = data)
  } else {
    data <- dt_spanners_set(data = data, spanners = spanners_tbl)
  }

  data
}

# rm_footnotes() ---------------------------------------------------------------
#' Remove table footnotes
#'
#' @description
#'
#' If you have one or more footnotes that ought to be removed, `rm_footnotes()`
#' allows for such a selective removal. The table footer is an optional table
#' part that is positioned below the table body, containing areas for both the
#' footnotes and source notes.
#'
#' This function for removal is useful if you have received a **gt** table
#' (perhaps through an API that returns **gt** objects) but would prefer that
#' some or all of the footnotes be removed. This function is safe to use even if
#' there are no footnotes in the input `gt_tbl` object so long as select helpers
#' (such as the default `everything()`) are used instead of explicit integer
#' values.
#'
#' @inheritParams rm_header
#'
#' @param footnotes *Footnotes to remove*
#'
#'   `scalar<numeric|integer>|everything()` // *default:* `everything()`
#'
#'   A specification of which footnotes should be removed. The footnotes to be
#'   removed can be given as a vector of integer values (they are stored as
#'   integer positions, in order of creation, starting at `1`). A select helper
#'   can also be used and, by default, this is `everything()` (whereby all
#'   footnotes will be removed).
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use a subset of the [`sza`] dataset to create a **gt** table. Color the `sza`
#' column using [data_color()], then, use [tab_footnote()] twice to
#' add two footnotes (each one targeting a different column label).
#'
#' ```r
#' gt_tbl <-
#'   sza |>
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
#'     locations = cells_column_labels(
#'       columns = sza
#'     )
#'   ) |>
#'   tab_footnote(
#'     footnote = "
#'     The true solar time at the given latitude
#'     and date (first of month) for which the
#'     solar zenith angle is calculated.
#'     ",
#'     locations = cells_column_labels(
#'       columns = tst
#'     )
#'   ) |>
#'   cols_width(everything() ~ px(150))
#'
#' gt_tbl
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_footnotes_1.png")`
#' }}
#'
#' If you decide that you don't want the footnotes in the `gt_tbl` object,
#' they can be removed with `rm_footnotes()`.
#'
#' ```r
#' rm_footnotes(data = gt_tbl)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_footnotes_2.png")`
#' }}
#'
#' Individual footnotes can be selectively removed. Footnotes are identified by
#' their index values. To remove the footnote concerning true solar time
#' (footnote `2`, since it was supplied to **gt** after the other footnote) we
#' would give the correct index value to `footnotes`.
#'
#' ```r
#' rm_footnotes(data = gt_tbl, footnotes = 2)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_footnotes_3.png")`
#' }}
#'
#' @family part removal functions
#' @section Function ID:
#' 7-4
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @export
rm_footnotes <- function(
    data,
    footnotes = everything()
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Obtain the footnotes table (may be an empty table if no footnotes
  # have been produced by `tab_footnote()`)
  footnotes_tbl <- dt_footnotes_get(data = data)

  # Obtain the number of rows within the footnotes table; this may be
  # zero but the number indicates the number of distinct footnotes
  footnotes_count <- nrow(footnotes_tbl)

  # If there are no footnotes, return the gt object unchanged
  if (footnotes_count < 1) {
    return(data)
  }

  # Get a vector of integer values that indicates which footnotes
  # are to be targeted for removal; this uses tidyselect and will
  # error if integer values are provided and they don't all
  # correspond to row indices of the `footnotes_tbl`
  footnotes_i <-
    as.integer(
      resolve_vector_i(
        expr = {{ footnotes }},
        vector = as.character(seq_len(footnotes_count)),
        "footnote"
      )
    )

  # In cases where a select helper is used and there are no
  # integer values in the resultant vector, return the gt
  # object unchanged
  if (length(footnotes_i) < 1) {
    return(data)
  }

  # Given that the `footnotes_i` vector is not empty and
  # corresponds to row indices in `footnotes_tbl`, use that
  # integer vector to remove components (i.e., footnotes)
  # from `footnotes_tbl`
  footnotes_tbl <- footnotes_tbl[-footnotes_i, ]

  # We may either obtain an empty or non-empty `footnotes_tbl`;
  # in the first case, re-initialize the footnotes table component and,
  # in the latter case, set the changed `footnotes_tbl` within
  # the gt object
  if (nrow(footnotes_tbl) < 1) {
    data <- dt_footnotes_init(data = data)
  } else {
    data <- dt_footnotes_set(data = data, footnotes = footnotes_tbl)
  }

  data
}

# rm_source_notes() ------------------------------------------------------------
#' Remove table source notes
#'
#' @description
#'
#' If you have one or more source notes that ought to be removed,
#' `rm_source_notes()` allows for such a selective removal. The table footer is
#' an optional table part that is positioned below the table body, containing
#' areas for both the source notes and footnotes.
#'
#' This function for removal is useful if you have received a **gt** table
#' (perhaps through an API that returns **gt** objects) but would prefer that
#' some or all of the source notes be removed. This function is safe to use even
#' if there are no source notes in the input `gt_tbl` object so long as select
#' helpers (such as the default `everything()`) are used instead of explicit
#' integer values.
#'
#' @inheritParams rm_header
#'
#' @param source_notes *Source notes to remove*
#'
#'   `scalar<numeric|integer>|everything()` // *default:* `everything()`
#'
#'   A specification of which source notes should be removed. The source notes
#'   to be removed can be given as a vector of integer values (they are stored
#'   as integer positions, in order of creation, starting at `1`). A select
#'   helper can also be used and, by default, this is `everything()` (whereby
#'   all source notes will be removed).
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use a subset of the [`gtcars`] dataset to create a **gt** table.
#' [tab_source_note()] is used to add a source note to the table footer that
#' cites the data source (or, it could just be arbitrary text). We'll use the
#' function twice, in effect adding two source notes to the footer.
#'
#' ```r
#' gt_tbl <-
#'   gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice(1:5) |>
#'   gt() |>
#'   tab_source_note(source_note = "Data from the 'edmunds.com' site.") |>
#'   tab_source_note(source_note = "Showing only the first five rows.") |>
#'   cols_width(everything() ~ px(120))
#'
#' gt_tbl
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_source_notes_1.png")`
#' }}
#'
#' If you decide that you don't want the source notes in the `gt_tbl` object,
#' they can be removed with `rm_source_notes()`.
#'
#' ```r
#' rm_source_notes(data = gt_tbl)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_source_notes_2.png")`
#' }}
#'
#' Individual source notes can be selectively removed. Source notes are
#' identified by their index values. To remove the source note concerning the
#' extent of the data (source note `2`, since it was supplied to **gt** after
#' the other source note) we would give the correct index value to
#' `source_notes`.
#'
#' ```r
#' rm_source_notes(data = gt_tbl, source_notes = 2)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_source_notes_3.png")`
#' }}
#'
#' @family part removal functions
#' @section Function ID:
#' 7-5
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @export
rm_source_notes <- function(
    data,
    source_notes = everything()
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Obtain the source notes list (may be an empty list
  # if no source notes have been produced by `tab_source_note()`)
  source_notes_list <- dt_source_notes_get(data = data)

  # Obtain the length of the source notes list; this may be empty
  # but the length indicates the number of distinct source notes
  source_notes_length <- length(source_notes_list)

  # If there are no source notes, return the gt object unchanged
  if (source_notes_length < 1) {
    return(data)
  }

  # Get a vector of integer values that indicates which source
  # notes are to be targeted for removal; this uses tidyselect
  # and will error if integer values are provided and they don't
  # all correspond to indices of the `source_notes_list`
  source_notes_i <-
    as.integer(
      resolve_vector_i(
        expr = {{ source_notes }},
        vector = as.character(seq_len(source_notes_length)),
        "source note"
      )
    )

  # In cases where a select helper is used and there are no
  # integer values in the resultant vector, return the gt
  # object unchanged
  if (length(source_notes_i) < 1) {
    return(data)
  }

  # Given that the `source_notes_i` vector is not empty and
  # corresponds to indices in `source_notes_list`, use that
  # integer vector to remove components (i.e., source notes)
  # from `source_notes_list`
  source_notes_list <- source_notes_list[-source_notes_i]

  # We may either obtain an empty or non-empty `source_notes_list`;
  # in the first case, re-initialize the source notes component and,
  # in the latter case, set the changed `source_notes_list` within
  # the gt object
  if (length(source_notes_list) < 1) {
    data <- dt_source_notes_init(data = data)
  } else {
    data <- dt_source_notes_set(data = data, source_notes = source_notes_list)
  }

  data
}

# rm_caption() -----------------------------------------------------------------
#' Remove the table caption
#'
#' @description
#'
#' We can easily remove the caption text from a **gt** table with
#' `rm_caption()`. The caption may exist if it were set through the [gt()]
#' `caption` argument or via [tab_caption()].
#'
#' This function for removal is useful if you have received a **gt** table
#' (perhaps through an API that returns **gt** objects) but would prefer that
#' the table not have a caption at all. This function is safe to use even if
#' there is no table caption set in the input `gt_tbl` object.
#'
#' @inheritParams rm_header
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use a portion of the [`gtcars`] dataset to create a **gt** table. We'll add a
#' header part with [tab_header()], and, a caption will also be added via
#' [tab_caption()].
#'
#' ```r
#' gt_tbl <-
#'   gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice(1:5) |>
#'   gt() |>
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   ) |>
#'   tab_caption(caption = md("**gt** table example."))
#'
#' gt_tbl
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_caption_1.png")`
#' }}
#'
#' If you decide that you don't want the caption in the `gt_tbl` object, it can
#' be removed with `rm_caption()`.
#'
#' ```r
#' rm_caption(data = gt_tbl)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rm_caption_2.png")`
#' }}
#'
#' @family part removal functions
#' @section Function ID:
#' 7-6
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @export
rm_caption <- function(data) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Reset the `table_caption` parameter value to an NA value inside
  # the `_options` component of the `gt_tbl` object
  dt_options_set_value(
    data = data,
    option = "table_caption",
    value = NA_character_
  )
}
