#' Remove the table header
#'
#' @description
#' We can remove the table header from a **gt** table quite easily with
#' `rm_header()`. The table header is an optional table part (positioned above
#' the column labels) that can be added through the [tab_header()].
#'
#' This function for removal is useful if you have received a **gt** table
#' (perhaps through an API that returns **gt** objects) but would prefer that
#' the table not contain a header. This function is safe to use even if there is
#' no header part in the input `gt_tbl` object.
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

#' Remove the stubhead label
#'
#' @description
#' We can easily remove the stubhead label from a **gt** table with
#' `rm_stubhead()`. The stubhead location only exists if there is a table stub
#' and the text in that cell is added through the [tab_stubhead()] function.
#'
#' This function for removal is useful if you have received a **gt** table
#' (perhaps through an API that returns **gt** objects) but would prefer that
#' the table not contain any content in the stubhead. This function is safe to
#' use even if there is no stubhead label in the input `gt_tbl` object.
#'
#' @param data A table object of class `gt_tbl`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @family part removal functions
#' @section Function ID:
#' 10-2
#'
#' @export
rm_stubhead <- function(data) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Reinitialize the stubhead component of the `gt_tbl` object
  dt_stubhead_init(data = data)
}

#' Remove column spanner labels
#'
#' @description
#' If you would like to remove column spanner labels then the `rm_spanners()`
#' function can make this possible. Column spanner labels appear above the
#' column labels and can occupy several levels via stacking either though
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
#' @param data A table object of class `gt_tbl`.
#' @param spanners A specification of which spanner column labels should be
#'   removed. Those to be removed can be given as a vector of spanner ID values
#'   (every spanner column label has one, either set by the user or by **gt**
#'   when using [tab_spanner_delim()]). A select helper can also be used and, by
#'   default, this is `everything()` (whereby all spanner column labels will be
#'   removed).
#'
#' @return An object of class `gt_tbl`.
#'
#' @family part removal functions
#' @section Function ID:
#' 10-3
#'
#' @export
rm_spanners <- function(
    data,
    spanners = everything()
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

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
  spanners_i <-
    as.integer(
      resolve_vector_i(
        expr = {{ spanners }},
        vector = spanners_tbl[["spanner_id"]]
      )
    )

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
  spanners_tbl <- spanners_tbl[-spanners_i, ]

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

#' Remove table footnotes
#'
#' @description
#' If you have one or more footnotes that ought to be removed, the
#' `rm_footnotes()` function allows for such a selective removal. The table
#' footer is an optional table part that is positioned below the table body,
#' containing areas for both the footnotes and source notes.
#'
#' This function for removal is useful if you have received a **gt** table
#' (perhaps through an API that returns **gt** objects) but would prefer that
#' some or all of the footnotes be removed. This function is safe to use even if
#' there are no footnotes in the input `gt_tbl` object so long as select helpers
#' (such as the default `everything()`) are used instead of explicit integer
#' values.
#'
#' @param data A table object of class `gt_tbl`.
#' @param footnotes A specification of which footnotes should be removed.
#'   The footnotes to be removed can be given as a vector of integer values
#'   (they are stored as integer positions, in order of creation, starting at
#'   `1`). A select helper can also be used and, by default, this is
#'   `everything()` (whereby all footnotes will be removed).
#'
#' @return An object of class `gt_tbl`.
#'
#' @family part removal functions
#' @section Function ID:
#' 10-4
#'
#' @export
rm_footnotes <- function(
    data,
    footnotes = everything()
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

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
        vector = as.character(seq_len(footnotes_count))
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

#' Remove table source notes
#'
#' @description
#' If you have one or more source notes that ought to be removed, the
#' `rm_source_notes()` function allows for such a selective removal. The table
#' footer is an optional table part that is positioned below the table body,
#' containing areas for both the source notes and footnotes.
#'
#' This function for removal is useful if you have received a **gt** table
#' (perhaps through an API that returns **gt** objects) but would prefer that
#' some or all of the source notes be removed. This function is safe to use even
#' if there are no source notes in the input `gt_tbl` object so long as select
#' helpers (such as the default `everything()`) are used instead of explicit
#' integer values.
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
#' 10-5
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
