# Build common table components from a `gt_tbl` object
#' @import rlang
#' @noRd
build_data <- function(data, context) {

  checkmate::assert_class(data, "gt_tbl")

  # Extract all attributes from the data object into `data_attr`;
  #   this will be one of the main objects going forward
  data_attr <- attributes(data)

  # # Check the names of objects in `data_attr`
  # checkmate::assert_names(
  #   x = names(data_attr),
  #   must.include = c(
  #     "_boxh", "_spanners",
  #     "names", "row.names", "class", "stub_df",
  #     "footnotes_df", "styles_df", "rows_df", "cols_df",
  #     "arrange_groups", "opts_df",
  #     "formats", "transforms")
  # )

  # Create `output_tbl` with rendered values; move
  # input data cells to `output_tbl` that didn't have
  # any rendering applied during `render_formats()`;
  # Reassemble the rows and columns of `output_tbl` in
  # the correct order
  data <-
    data %>%
    dt_data_tbl_init() %>%
    dt_output_tbl_init() %>%
    render_formats(context = context) %>%
    migrate_unformatted_to_output(context = context) %>%
    perform_col_merge(context = context) %>%
    #perform_text_transforms() %>% # TODO: make this work
    reassemble_output_tbl() %>%
    reorder_stub_df() %>%
    reorder_footnotes() %>%
    reorder_styles()

  # Use `dt_*_build()` methods
  data <-
    data %>%
    dt_boxh_build(context = context) %>%
    dt_spanners_build(context = context) %>%
    dt_heading_build(context = context) %>%
    dt_stubh_build(context = context) %>%
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

  # TODO: Fix text transform functionality
  # data_attr$boxh_df <- boxh_df
  # data_attr$stub_df <- stub_df
  # data_attr$cols_df <- cols_df
  # data_attr$data_df <- data_df
  # data_attr$arrange_groups <- arrange_groups
  # data_attr$output_df <- output_df
  #
  # # Text transformation
  # for (transform in transforms) {
  #
  #   data_attr <-
  #     text_transform_at_location(
  #       loc = transform$resolved,
  #       data_attr = data_attr,
  #       fn = transform$fn
  #     )
  # }
  #
  # output_df <- data_attr$output_df
  # boxh_df <- data_attr$boxh_df

  # Create the `list_of_summaries` list of lists
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

  # Add footnote marks to the stub group cells
  data <- set_footnote_marks_stub_groups(data = data, context = context)

  # Add footnote marks to the `summary` cells
  # TODO: `context` is missing in `apply_footnotes_to_summary()`
  data <- apply_footnotes_to_summary(data = data)

  data
}
