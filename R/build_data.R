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


# Build common table components from a `gt_tbl` object
build_data <- function(data, context) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # For an empty table, ensure that some basic
  # messaging is in place
  if (is_gt_tbl_empty(data = data)) {
    data <- adjust_gt_tbl_empty(data = data)
  }

  # Build summary columns before building the body
  # (summary columns modify the underlying data)
  data <- dt_summary_cols_build(data = data, context = context)

  # Create `body` with rendered values; move
  # input data cells to `body` that didn't have
  # any rendering applied during `render_formats()`;
  # Reassemble the rows and columns of `body` in
  # the correct order
  data <- dt_body_build(data = data)
  data <- render_formats(data = data, skip_compat_check = FALSE, context = context)
  data <- render_substitutions(data = data, context = context)
  data <- migrate_unformatted_to_output(data = data, context = context)
  data <- perform_col_merge(data = data, context = context)

  # Reorder stub_df first (handles group ordering and row_order() directives),
 # then reassemble body using the reordered stub_df
  data <- reorder_stub_df(data = data)
  data <- dt_body_reassemble(data = data)

  data <- reorder_footnotes(data = data)
  data <- reorder_styles(data = data)

  data <- perform_text_transforms(data = data)

  # Use `dt_*_build()` methods
  data <- dt_boxhead_build(data = data, context = context)
  data <- dt_spanners_build(data = data, context = context)
  data <- dt_heading_build(data = data, context = context)
  data <- dt_stubhead_build(data = data, context = context)
  data <- dt_stub_df_build(data = data, context = context)
  data <- dt_source_notes_build(data = data, context = context)
  data <- dt_summary_build(data = data, context = context)
  data <- dt_groups_rows_build(data = data, context = context)

  # Resolution of footnotes and styles --------------------------------------

  # Resolve footnotes and styles
  data <- resolve_footnotes_styles(data = data, tbl_type = "footnotes")
  data <- resolve_footnotes_styles(data = data, tbl_type = "styles")

  # Add footnote marks to elements of the table columns
  data <- set_footnote_marks_columns(data = data, context = context)

  # Add footnote marks to the stubhead label
  data <- set_footnote_marks_stubhead(data = data, context = context)

  # Add footnote marks to the `data` rows
  data <- apply_footnotes_to_output(data = data, context = context)

  # Add footnote marks to the row group cells
  data <- set_footnote_marks_row_groups(data = data, context = context)

  # Add footnote marks to the `summary` cells
  data <- apply_footnotes_to_summary(data = data, context = context)

  # Set the `_has_built` flag to `TRUE`
  data <- dt_has_built_set(data = data, value = TRUE)

  data
}


# Faster implementation that avoids some operations
# for vec_*() functions
# only build the body correctly.
build_data_body <- function(data, context) {

  data <- dt_body_build(data = data)
  data <- render_formats(data = data, skip_compat_check = TRUE, context = context)
  data <- migrate_unformatted_to_output(data = data, context = context)

  data
}
