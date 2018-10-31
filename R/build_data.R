# Build common table components from a `gt_tbl` object
#' @import rlang
#' @noRd
build_data <- function(data, context) {

  checkmate::assert_class(data, "gt_tbl")

  # Extract all attributes from the data object into `data_attr`;
  #   this will be one of the main objects going forward
  data_attr <- attributes(data)

  # Check the names of objects in `data_attr`
  checkmate::assert_names(
    x = names(data_attr),
    must.include = c(
      "names", "row.names", "class", "boxh_df", "stub_df",
      "footnotes_df", "styles_df", "rows_df", "cols_df",
      "col_labels", "arrange_groups", "opts_df", "formats"))

  # Move original data frame to `data_df`
  data_df <- as.data.frame(data)

  #
  # Obtain initial data frame objects from `data_attr`
  #

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

  #
  # Obtain initial list objects from `data_attr`
  #

  # Get the `col_labels` list
  col_labels <- data_attr$col_labels

  # Get the `grp_labels` list
  grp_labels <- data_attr$grp_labels

  # Get the `formats` list
  formats <- data_attr$formats

  # Get the `transforms` list
  transforms <- data_attr$transforms

  # Get the `arrange_groups` vector
  arrange_groups <- data_attr$arrange_groups

  # Get the `others_group` vector
  others_group <- data_attr$others_group[[1]] %||% NA_character_

  # Get and process the `heading` object
  heading <- data_attr$heading %>% process_heading(context)

  # Get and process the `stubhead_caption` object
  stubhead_caption <- data_attr$stubhead_caption %>% process_stubhead_caption(context)

  # Get and process the `source_note` object
  source_note <- data_attr$source_note %>% process_source_notes(context)

  # Get the `col_merge` object
  col_merge <- data_attr$col_merge

  # Get the `summary_list` object
  summary_list <- data_attr$summary

  # Initialize `output_df`
  output_df <- initialize_output_df(data_df)

  # Create `output_df` with rendered values
  output_df <- render_formats(output_df, data_df, formats, context)

  # Move input data cells to `output_df` that didn't have
  # any rendering applied during `render_formats()`
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

  # Process column labels and migrate those to `boxh_df`
  boxh_df <- migrate_colnames_to_labels(boxh_df, col_labels, context)

  # Process group labels and migrate those to `boxh_df`
  boxh_df <- migrate_grpnames_to_labels(boxh_df, grp_labels, context)

  # Assign default alignment for all columns that haven't had alignment
  # explicitly set
  boxh_df <- set_default_alignments(boxh_df)

  # Get a `boxhead_spanners` vector, which has the unique, non-NA
  # boxhead spanner labels
  boxhead_spanners <- get_boxhead_spanners_vec(boxh_df)

  # Create the `groups_rows_df` data frame, which provides information
  # on which rows the group rows should appear above
  groups_rows_df <- get_groups_rows_df(arrange_groups, groups_df)

  # Replace NA values in the `groupname` column if there is a reserved
  # label for the unlabeled group
  groups_df[is.na(groups_df[, "groupname"]), "groupname"] <- others_group

  # Replace NA values in the `group` and `group_label` columns of
  # `group_rows_df`
  if (!is.na(others_group)) {
    groups_rows_df[
      is.na(groups_rows_df[, "group"]),
      c("group", "group_label")] <- others_group
  }

  data_attr$boxh_df <- boxh_df
  data_attr$stub_df <- stub_df
  data_attr$cols_df <- cols_df
  data_attr$data_df <- data_df
  data_attr$arrange_groups <- arrange_groups
  data_attr$output_df <- output_df

  # Text transformation
  for (transform in transforms) {
    data_attr <- text_transform_at_location(
      loc = transform$resolved,
      data_attr = data_attr,
      fn = transform$fn)
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

  # Resolution of footnotes and styles --------------------------------------

  # Resolve and tidy footnotes
  footnotes_resolved <-
    resolve_footnotes_styles(
      output_df, boxh_df, groups_rows_df, opts_df, arrange_groups,
      boxhead_spanners, title_defined, headnote_defined,
      footnotes_df = footnotes_df, styles_df = NULL)

  # Resolve the styles table
  styles_resolved <-
    resolve_footnotes_styles(
      output_df, boxh_df, groups_rows_df, opts_df, arrange_groups,
      boxhead_spanners, title_defined, headnote_defined,
      footnotes_df = NULL, styles_df = styles_df)

  list(
    data_df = data_df,
    boxh_df = boxh_df,
    stub_df = stub_df,
    opts_df = opts_df,
    footnotes_df = footnotes_df,
    styles_df = styles_df,
    output_df = output_df,
    rows_df = rows_df,
    cols_df = cols_df,
    columns_df = columns_df,
    formats = formats,
    transforms = transforms,
    arrange_groups = arrange_groups,
    others_group = others_group,
    groups_df = groups_df,
    groups_rows_df = groups_rows_df,
    heading = heading,
    boxhead_spanners = boxhead_spanners,
    source_note = source_note,
    stubhead_caption = stubhead_caption,
    stub_components = stub_components,
    col_alignment = col_alignment,
    col_merge = col_merge,
    col_merge_output = col_merge_output,
    list_of_summaries = list_of_summaries,
    summary_list = summary_list,
    footnotes_resolved = footnotes_resolved,
    styles_resolved = styles_resolved,
    stub_available = stub_available,
    title_defined = title_defined,
    headnote_defined = headnote_defined,
    spanners_present = spanners_present,
    summaries_present = summaries_present,
    n_rows = n_rows,
    n_cols = n_cols)
}
