# Build common table components from a `gt_tbl` object
#' @import rlang
#' @noRd
build_data <- function(data, context) {

  checkmate::assert_class(data, "gt_tbl")
  # Create `body` with rendered values; move
  # input data cells to `body` that didn't have
  # any rendering applied during `render_formats()`;
  # Reassemble the rows and columns of `body` in
  # the correct order
  data <-
    data %>%
    dt_body_build() %>%
    render_formats(context = context) %>%
    migrate_unformatted_to_output(context = context) %>%
    perform_col_merge(context = context) %>%
    perform_text_transforms()

  data <-
    data %>%
    dt_body_reassemble() %>%
    reorder_stub_df() %>%
    reorder_footnotes() %>%
    reorder_styles()

  # Use `dt_*_build()` methods
  data <-
    data %>%
    dt_boxhead_build(context = context) %>%
    dt_spanners_build(context = context) %>%
    dt_heading_build(context = context) %>%
    dt_stubhead_build(context = context) %>%
    dt_source_notes_build(context = context) %>%
    dt_summary_build(context = context) %>%
    dt_groups_rows_build(context = context)

  # Resolution of footnotes and styles --------------------------------------

  # Resolve footnotes and styles
  data <-
    data %>%
    resolve_footnotes_styles(tbl_type = "footnotes") %>%
    resolve_footnotes_styles(tbl_type = "styles")

  # Add footnote marks to elements of the table columns
  data <- set_footnote_marks_columns(data = data, context = context)

  # Add footnote marks to the stubhead label
  data <- set_footnote_marks_stubhead(data = data, context = context)

  # Add footnote marks to the `data` rows
  data <- apply_footnotes_to_output(data = data, context = context)

  # Add footnote marks to the row group cells
  data <- set_footnote_marks_row_groups(data = data, context = context)

  # Add footnote marks to the `summary` cells
  # TODO: `context` is missing in `apply_footnotes_to_summary()`
  data <- apply_footnotes_to_summary(data = data, context = context)

  data <- dt_has_built_set(data = data, value = TRUE)

  data
}
