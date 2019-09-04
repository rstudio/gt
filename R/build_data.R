# Build common table components from a `gt_tbl` object
#' @import rlang
#' @noRd
build_data <- function(data, context) {

  checkmate::assert_class(data, "gt_tbl")

  # # Check the names of objects in `data`
  # checkmate::assert_names(
  #   x = names(data_attr),
  #   must.include = c(
  #     "_boxh", "_spanners",
  #     "names", "row.names", "class", "stub_df",
  #     "footnotes_df", "styles_df", "rows_df", "cols_df",
  #     "arrange_groups", "opts_df",
  #     "formats", "transforms")
  # )

  # Create `body` with rendered values; move
  # input data cells to `body` that didn't have
  # any rendering applied during `render_formats()`;
  # Reassemble the rows and columns of `body` in
  # the correct order
  data <-
    data %>%
    render_formats(context = context) %>%
    migrate_unformatted_to_output(context = context) %>%
    perform_col_merge(context = context) %>%
    perform_text_transforms() %>%
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
    dt_source_notes_build(context = context)

  # Get a `columns_spanners` vector, which has the unique, non-NA
  # spanner column labels
  data <- get_columns_spanners_vec(data = data)

  # TODO: Make `dt_groups.R`
  # Add in the `groups_rows_df` table, which provides information
  # on which rows the group row labels should appear above
  data <-
    get_groups_rows_df(
      data = data,
      context = context
    )

  # Create the `list_of_summaries` list of lists
  # TODO: create `dt_summaries_build()` function
  data <-
    create_summary_dfs(
      data = data,
      context = context
    )

  # Determine if there is a populated stub
  data <- is_stub_available(data = data)

  # Determine if there are any summaries present
  data <- are_summaries_present(data = data)

  # Determine if there are any spanners present
  data <- are_spanners_present(data = data)

  # Get the available stub components, if any
  data <- get_stub_components(data = data)

  # Define the `col_alignment` vector, which is a
  # vector of column alignment values for all of
  # the relevant columns in a table
  data <- get_column_alignment(data = data)

  data <- combine_stub_with_data(data = data)

  # Resolution of footnotes and styles --------------------------------------

  #
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
  data <- apply_footnotes_to_summary(data = data)

  data
}
