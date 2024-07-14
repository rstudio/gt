
# tab_source_note() ------------------------------------------------------------
#' Add a source note citation
#'
#' @description
#'
#' Add a source note to the footer part of the **gt** table. A source note is
#' useful for citing the data included in the table. Several can be added to the
#' footer, simply use multiple calls of `tab_source_note()` and they will be
#' inserted in the order provided. We can use Markdown formatting for the note,
#' or, if the table is intended for HTML output, we can include HTML formatting.
#'
#' @inheritParams fmt_number
#'
#' @param source_note *Source note text*
#'
#'   `scalar<character>` // **required**
#'
#'   Text to be used in the source note. We can optionally use [md()] and
#'   [html()] to style the text as Markdown or to retain HTML elements
#'   in the text.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' With three columns from the [`gtcars`] dataset, let's create a **gt** table.
#' We can use `tab_source_note()` to add a source note to the table
#' footer. Here we are citing the data source but this function can be used for
#' any text you'd prefer to display in the footer section.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice(1:5) |>
#'   gt() |>
#'   tab_source_note(source_note = "From edmunds.com")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_source_note_1.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-8
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
tab_source_note <- function(
    data,
    source_note
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  dt_source_notes_add(
    data = data,
    source_note = source_note
  )
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
