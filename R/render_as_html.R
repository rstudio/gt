#' Transform a gt table object to an HTML table
#'
#' Take a \code{gt_tbl} table object and transform it to an HTML table.
#' @param data a table object that is created using the \code{gt()} function.
#' @return a character object with an HTML table
#' @import checkmate
#' @import rlang
#' @family table export functions
#' @noRd
render_as_html <- function(data) {
  checkmate::assert_class(data, "gt_tbl")

  # Preprocessing -----------------------------------------------------------

  # Extract all attributes from the data object into `data_attr`;
  #   this will be one of the main objects going forward
  data_attr <- attributes(data)

  # Check the names of objects in `data_attr`
  checkmate::assert_names(
    x = names(data_attr),
    must.include = c(
      "names", "row.names", "class", "boxh_df", "stub_df",
      "footnotes_df", "styles_df", "rows_df", "cols_df",
      "arrange_groups", "opts_df", "formats"))

  # Move original data frame to `data_df`
  data_df <- as.data.frame(data)

  # Get the `boxh_df` data frame
  boxh_df <- data_attr$boxh_df

  # Get the `stub_df` data frame
  stub_df <- data_attr$stub_df

  # Get the `opts_df` data frame
  opts_df <- data_attr$opts_df

  # Get the `footnotes_df` data frame
  footnotes_df <- data_attr$footnotes_df

  # Get the `styles_df` data frame
  styles_df <- data_attr$styles_df

  # Get the `rows_df` data frame
  rows_df <- data_attr$rows_df

  # Get the `cols_df` data frame
  cols_df <- data_attr$cols_df

  # Get the `formats` list
  formats <- data_attr$formats

  # Get the `transforms` list
  transforms <- data_attr$transforms

  # Get the `arrange_groups` vector
  arrange_groups <- data_attr$arrange_groups

  # Get the `others_group` vector
  others_group <- data_attr$others_group[[1]] %||% NA_character_

  # Get the `heading` object
  heading <- data_attr$heading

  # Get the `stubhead_caption` object
  stubhead_caption <- data_attr$stubhead_caption

  # Get the `source_note` object
  source_note <- data_attr$source_note

  # Get the `col_merge` object
  col_merge <- data_attr$col_merge

  # Get the `summary_list` object
  summary_list <- data_attr$summary

  # Initialize `output_df`
  output_df <- initialize_output_df(data_df)

  # Create `output_df` with rendered values
  output_df <- render_formats(output_df, data_df, formats, context = "html")

  # Move input data cells to `output_df` that didn't have
  #   any rendering applied during `render_formats()`
  output_df <- migrate_unformatted_to_output(data_df, output_df)

  # Get the reordering df (`rows_df`) for the data rows
  rows_df <- get_row_reorder_df(arrange_groups, stub_df)

  # Get the `columns_df` data frame for the data columns
  columns_df <- get_column_reorder_df(cols_df, boxh_df)

  # Reassemble the rows and columns of `data_df` in the correct order
  output_df <- reassemble_output_df(output_df, rows_df, columns_df)

  # Get the `groups_df` data frame, which is a rearranged representation
  # of the stub `groupname` and `rowname` columns
  groups_df <- get_groupnames_rownames_df(stub_df, rows_df)

  # Get a `boxhead_spanners` vector, which has the unique, non-NA
  # boxhead spanner labels
  boxhead_spanners <- get_boxhead_spanners_vec(boxh_df)

  # Replace NA values in the `groupname` column if there is a reserved
  #   label for the unlabeled group
  groups_df[is.na(groups_df[, "groupname"]), "groupname"] <- others_group

  # Create the `groups_rows_df` data frame, which provides information
  #   on which rows the group rows should appear above
  groups_rows_df <- get_groups_rows_df(arrange_groups, groups_df)

  # Apply column names to column labels for any of those column labels not
  # explicitly set
  boxh_df <- migrate_colnames_to_labels(boxh_df)

  # Assign center alignment for all columns that haven't had alignment
  # explicitly set
  # TODO: consider default alignments based on content
  boxh_df <- set_default_alignments(boxh_df)

  data_attr$boxh_df <- boxh_df
  data_attr$stub_df <- stub_df
  data_attr$cols_df <- cols_df
  data_attr$data_df <- data_df
  data_attr$arrange_groups <- arrange_groups
  data_attr$output_df <- output_df

  # TODO: text_transform
  for (transform in transforms) {
    data_attr <- text_transform_at_location(
      loc = transform$resolved,
      data_attr = data_attr,
      func = transform$func)
  }

  output_df <- data_attr$output_df
  boxh_df <- data_attr$boxh_df

  # Perform any necessary column merge operations
  col_merge_output <-
    perform_col_merge(col_merge, data_df, output_df, boxh_df, columns_df)

  # Rewrite `output_df`, `boxh_df`, and `columns_df` as a result of merging
  output_df <- col_merge_output$output_df
  boxh_df <- col_merge_output$boxh_df
  columns_df <- col_merge_output$columns_df

  # Create the `list_of_summaries` list of lists
  list_of_summaries <-
    create_summary_dfs(summary_list, data_df, stub_df, output_df)

  # Determine if there is a populated stub
  stub_available <- is_stub_available(stub_df)

  # Determine if the title has been defined
  title_defined <- is_title_defined(heading)

  # Determine if a headnote has been defined
  headnote_defined <- is_headnote_defined(heading)

  # Determine if there are any summaries present
  summaries_present <- are_summaries_present(list_of_summaries)

  # Determine if there are any spanners present
  spanners_present <- are_spanners_present(boxh_df)

  # Get the available stub components, if any
  stub_components <- get_stub_components(stub_df)

  # Define the `col_alignment` vector, which is a
  #   vector of column alignment values for all of
  #   the relevant columns in a table
  col_alignment <-
    boxh_df["column_align", ] %>%
    unlist() %>% unname()

  if (stub_component_is_rowname(stub_components) ||
      stub_component_is_rowname_groupname(stub_components)) {

    # Combine reordered stub with output table
    output_df <- cbind(groups_df["rowname"], output_df)

    # Define the `col_alignment` vector, which is a
    #   vector of column alignment values for all of
    #   the relevant columns in a table
    col_alignment <- c("right", col_alignment)
  }

  # Get the number of rows, columns, and cells in the `output_df`
  n_rows <- nrow(output_df)
  n_cols <- ncol(output_df)

  # Footnotes ---------------------------------------------------------------

  # Resolve and tidy footnotes
  footnotes_resolved <-
    resolve_footnotes_styles(
      output_df, boxh_df, groups_rows_df, opts_df, arrange_groups,
      boxhead_spanners, title_defined, headnote_defined,
      footnotes_df = footnotes_df, styles_df = NULL)

  # Add footnote glyphs to boxhead elements
  boxh_df <-
    set_footnote_glyphs_boxhead(footnotes_resolved, boxh_df)

  # Add footnote glyphs to the `data` rows
  output_df <-
    apply_footnotes_to_output(output_df, footnotes_resolved)

  # Add footnote glyphs to stub group title elements
  groups_rows_df <-
    set_footnote_glyphs_stub_groups(footnotes_resolved, groups_rows_df)

  # Add footnote glyphs to the `summary` rows
  list_of_summaries <-
    apply_footnotes_to_summary(list_of_summaries, footnotes_resolved)

  # Custom styles -----------------------------------------------------------

  # Resolve the styles table
  styles_resolved <-
    resolve_footnotes_styles(
      output_df, boxh_df, groups_rows_df, opts_df, arrange_groups,
      boxhead_spanners, title_defined, headnote_defined,
      footnotes_df = NULL, styles_df = styles_df)

  # Extraction of body content as a vector ----------------------------------

  body_content <- as.vector(t(output_df))

  # Composition of HTML -----------------------------------------------------

  # Split `body_content` by slices of rows
  row_splits_body <- split_body_content(body_content, n_cols)

  # Get styles for the data rows and split in the same fashion as
  # for the content of the data rows
  row_splits_styles <-
    apply_styles_to_output(output_df, styles_resolved, n_cols)

  # Create an HTML fragment for the start of the table
  table_start <- create_table_start()

  # Create a heading component of the table and handle any available footnotes
  heading_component <-
    create_heading_component(
      heading, footnotes_resolved, styles_resolved, n_cols)

  # Create the boxhead component of the table
  boxhead_component <-
    create_boxhead_component(
      boxh_df, output_df, stub_available, spanners_present,
      styles_resolved, stubhead_caption, col_alignment)

  # Create the body component of the table
  body_component <-
    create_body_component(
      row_splits_body, row_splits_styles, styles_resolved,
      groups_rows_df, col_alignment, stub_components, summaries_present,
      list_of_summaries, n_rows, n_cols)

  # Create the source note rows and handle any available footnotes
  source_note_rows <- create_source_note_rows(source_note, n_cols)

  # Handle any available footnotes
  footnote_component <-
    create_footnote_component(footnotes_resolved, opts_df, n_cols)

  # Create an HTML fragment for the end of the table
  table_end <- create_table_end()

  # Compose the HTML table
  html_table <-
    paste0(
      table_start,
      heading_component,
      boxhead_component,
      body_component,
      source_note_rows,
      footnote_component,
      table_end,
      collapse = "")

  html_table
}
