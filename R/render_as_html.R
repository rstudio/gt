#' Transform a gt table object to an HTML table
#'
#' Take a \code{gt_tbl} table object and transform it to an HTML table.
#' @param data a table object that is created using the \code{gt()} function.
#' @return a character object with an HTML table
#' @import rlang
#' @family table export functions
#' @noRd
render_as_html <- function(data) {

  # Preprocessing -----------------------------------------------------------

  # Extract all attributes from the data object into `data_attr`;
  #   this will be one of the main objects going forward
  data_attr <- attributes(data)

  # Create `output_df` with rendered values
  data_attr$output_df <- render_formats(data, context = "html")

  # Move input data cells to `output_df` that didn't have
  #   any rendering applied during `render_formats()`
  data_attr$output_df <-
    migrate_unformatted_to_output(
      data = data,
      output_df = data_attr$output_df)

  # Move original data frame to `data_attr$data_df`
  data_attr$data_df <- as.data.frame(data)

  # Get the reordering df for the data rows
  data_attr$rows_df <- get_row_reorder_df(data_attr = data_attr)

  # Get the reordering df for the data columns
  data_attr$columns_df <- get_column_reorder_df(data_attr = data_attr)

  # Reassemble the rows and columns of
  # `data_df` in the correct order
  data_attr$output_df <-
    data_attr$output_df[
      data_attr$rows_df$rownum_final,
      data_attr$columns_df %>%
        dplyr::filter(!is.na(colnum_final)) %>%
        dplyr::arrange(colnum_final) %>%
        dplyr::pull(column_names)]

  # Get a `groups_df` data frame, which is a rearranged representation
  # of the stub `groupname` and `rowname` columns
  data_attr$groups_df <- get_groupnames_rownames_df(data_attr = data_attr)

  # Get a `boxhead_spanners` vector, which has the unique, non-NA
  # boxhead spanner labels
  data_attr$boxhead_spanners <- get_boxhead_spanners_vec(data_attr = data_attr)

  # Replace NA values in the `groupname` column if there is a reserved
  #   'Others' label for the unlabeled group
  data_attr$groups_df[
    which(is.na(data_attr$groups_df[, "groupname"])), "groupname"] <-
    data_attr$others_group[[1]] %||% NA_character_

  # Create the `groups_rows` data frame, which provides information
  #   on which rows the group rows should appear above
  groups_rows_df <- get_groups_rows_df(data_attr)

  # Perform any necessary column merge operations
  data_attr <- perform_col_merge(data_attr)

  # TODO: build a list of `summary_df`
  # Integrate any summary lines available
  #data_attr <- integrate_summary_lines(data_attr)

  # If a summary lines were processed, they were added to
  #   `data_attr`; incorporate that data frame as a `data` attr
  # if ("summary_df" %in% names(data_attr)) {
  #   attr(data, "summary_df") <- data_attr$summary_df
  # }

  # Apply column names to column labels for any of
  #   those column labels not explicitly set
  # Assign center alignment for all columns
  #   that haven't had alignment explicitly set
  data_attr <- data_attr %>%
    migrate_colnames_to_labels() %>%
    set_default_alignments()

  # Determine if there is a populated stub
  stub_available <- data_attr %>% is_stub_available()

  # Determine if there are any groups present
  groups_present <- data_attr %>% are_groups_present()

  # Determine if there are any spanners present
  spanners_present <- data_attr %>% are_spanners_present()

  # Get the available stub components, if any
  stub_components <- data_attr %>% get_stub_components()

  # These objects will be create within each of the following scenarios:
  #   1. table doesn't contain a stub
  #   2. table contains a stub, but it only has rownames
  #   3. table contains a stub, but it only has groupnames
  #   4. table contains a stub with both rownames and groupnames
  if (is.null(stub_components)) {

    # Extract the table (case of table with no stub)
    # extracted <- data_attr$output_df

    col_alignment <-
      data_attr$boxh_df["column_align", ] %>%
      unlist() %>% unname()


  } else if (stub_component_is_rowname(stub_components)) {

    # Combine reordered stub with output table
    data_attr$output_df <-
      cbind(data_attr$groups_df["rowname"], data_attr$output_df)

    # Define the `col_alignment` vector, which is a
    #   vector of column alignment values for all of
    #   the relevant columns in a table
    # Here, we are hardcoding a `right` alignment
    #   for the stub column
    col_alignment <-
      c("right", data_attr$boxh_df["column_align", ] %>%
          unlist() %>% unname())


  } else if (stub_component_is_groupname(stub_components)) {

    # Define the `col_alignment` vector, which is a
    #   vector of column alignment values for all of
    #   the relevant columns in a table
    col_alignment <-
      data_attr$boxh_df["column_align", ] %>%
      unlist() %>% unname()

  } else if (stub_component_is_rowname_groupname(stub_components)) {

    # Combine reordered stub with output table
    data_attr$output_df <-
      cbind(data_attr$groups_df["rowname"], data_attr$output_df)

    # Define the `col_alignment` vector, which is a
    #   vector of column alignment values for all of
    #   the relevant columns in a table
    # Here, we are hardcoding a `right` alignment
    #   for the stub column
    col_alignment <-
      c("right", data_attr$boxh_df["column_align", ] %>%
          unlist() %>% unname())
  }

  # Footnotes ---------------------------------------------------------------

  # Resolve and tidy footnotes
  data_attr$footnotes_resolved <-
    resolve_footnotes(
      data_attr = data_attr,
      groups_rows_df = groups_rows_df)

  # Apply footnotes to the `data` rows
  data_attr$output_df <- apply_footnotes_to_data(data_attr = data_attr)

  # Add footnote glyphs to boxhead elements
  data_attr$boxh_df <- set_footnote_glyphs_boxhead(data_attr = data_attr)

  # Add footnote glyphs to stub group title elements
  groups_rows_df <-
    set_footnote_glyphs_stub_groups(
      data_attr = data_attr, groups_rows_df = groups_rows_df)

  # Extract the body content as a vector
  body_content <- as.vector(t(data_attr$output_df))

  # Get the number of rows, columns, and cells in the `output_df`
  n_rows <- nrow(data_attr$output_df)
  n_cols <- ncol(data_attr$output_df)

  # Get the number of cells in `body_content`
  n_cells <- length(body_content)

  # Composition of HTML -----------------------------------------------------

  # Handle any available footnotes
  footnote_component <- create_footnote_component(data_attr = data_attr)

  # Create a heading and handle any available footnotes
  heading_component <- create_heading_component(data_attr = data_attr)

  # Create the source note rows and handle any available footnotes
  source_note_rows <- create_source_note_rows(data_attr, n_cols)

  # Split the body_content by slices of rows
  row_splits <- split_body_content(body_content, n_cols)

  # Split any custom style attributes
  row_splits_styles <-
    as.vector(
      t(
        cbind(data.frame(empty = rep(NA_character_, n_rows)),
              data_attr$fmts_df))) %>%
    tidy_gsub("::style_", "")

  row_splits_styles[is.na(row_splits_styles)] <- ""

  row_splits_styles <- row_splits_styles %>% split_body_content(n_cols)

  # Create an HTML fragment for the start of the table
  table_start <-
    create_table_start(
      groups_rows_df,
      n_rows,
      n_cols)

  # Create the table column headings
  table_col_headings <-
    create_column_headings(
      data_attr,
      col_alignment,
      stub_available,
      spanners_present)

  # Create the table body
  table_body <-
    create_table_body(
      row_splits,
      row_splits_styles,
      groups_rows_df,
      col_alignment,
      stub_components,
      n_rows,
      n_cols)

  # Create an HTML fragment for the end of the table
  table_end <- create_table_end()

  # Compose the HTML table
  html_table <-
    paste0(
      table_start,
      heading_component,
      table_col_headings,
      table_body,
      source_note_rows,
      footnote_component,
      table_end,
      collapse = "")

  html_table
}
