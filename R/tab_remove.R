#' Remove the table header
#'
#' @description
#' We can remove the table header from a **gt** table quite easily with
#' `rm_header()`. The table header is an optional table part that is positioned
#' above the column labels. This function for removal is useful if you have
#' received a **gt** table (perhaps through an API that returns **gt** objects)
#' but would prefer that the table not contain a header.
#'
#' @param data A table object of class `gt_tbl`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @family part removal functions
#' @section Function ID:
#' 10-1
#'
#' @export
rm_header <- function(data) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Reinitialize the heading component of the `gt_tbl` object
  dt_heading_init(data = data)
}

#' Remove table source notes
#'
#' @description
#' If you have one or more source notes that ought to be removed, the
#' `rm_source_notes()` function allows for such a selective removal. The table
#' footer is an optional table part that is positioned below the table body,
#' containing areas for both the footnotes and the source notes. This function
#' for removal is useful if you have received a **gt** table (perhaps through an
#' API that returns **gt** objects) but would prefer that some or all of the
#' source notes be removed.
#'
#' @param data A table object of class `gt_tbl`.
#' @param source_notes A specification of which source notes should be removed.
#'   The source notes to be removed can be given as a vector of integer values
#'   (they are stored as integer positions, in order of creation, starting at
#'   `1`). A select helper can also be used and, by default, this is
#'   `everything()` (whereby all source notes will be removed).
#'
#' @return An object of class `gt_tbl`.
#'
#' @family part removal functions
#' @section Function ID:
#' 10-2
#'
#' @export
rm_source_notes <- function(
    data,
    source_notes = everything()
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

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
        vector = as.character(seq_len(source_notes_length))
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
