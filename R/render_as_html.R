#' Transform a gt table object to an HTML table
#'
#' Take a \code{gt_tbl} table object and transform it to an HTML table.
#' @param data a table object that is created using the \code{gt()} function.
#' @return a character object with an HTML table
#' @importFrom dplyr mutate group_by summarize ungroup rename arrange
#' @importFrom stringr str_extract_all str_replace
#' @importFrom stats setNames
#' @importFrom rlang %||%
#' @family table export functions
#' @noRd
render_as_html <- function(data) {

  # Extract all attributes from the data object into `data_attr`;
  #   this will be one of the main objects going forward
  data_attr <- attributes(data)

  # Create `output_df` with rendered values
  data_attr$output_df <- render_formats(data, context = "html")

  # Move input data cells to `output_df` that didn't have
  # any rendering applied during `render_formats()`
  data_attr$output_df <-
    migrate_unformatted_to_output(
      data = data,
      output_df = data_attr$output_df)

  # Move original data frame to `data_attr$data_df`
  data_attr$data_df <- as.data.frame(data)

  # Get the available property names
  property_names <-
    base::setdiff(
      names(data_attr),
      c("row.names", "class", "names", "boxh_df", "stub_df",
        "fmts_df", "foot_df", "output_df", "data_df", "formats"))

  # Integrate any summary lines available
  if ("summary_auto" %in% property_names) {
    data_attr <- integrate_summary_lines(data_attr)
  }

  # Perform any necessary column merge operations
  if ("col_merge" %in% property_names) {
    data_attr <- perform_col_merge(data_attr)
  }

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

  # Create three new objects:
  #   - `extracted` - a data frame that will provide data for the
  #      HTML table cells
  #   - `col_alignment` - a vector of alignment values (e.g., `center`,
  #     `left`, `right`) that species the alignment of stub and cell values
  #   - `groups_rows` - a data frame that species where group rows will
  #      be inserted (is NULL except for scenario # 4, below)
  # These objects will be create within each of the following scenarios:
  #   1. table doesn't contain a stub
  #   2. table contains a stub, but it only has rownames
  #   3. table contains a stub, but it only has groupnames
  #   4. table contains a stub with both rownames and groupnames
  if (is.null(stub_components)) {

    # Extract the table (case of table with no stub)
    extracted <- data_attr$output_df

    col_alignment <- data_attr$boxh_df[3, ] %>% unlist() %>% unname()
    groups_rows <- NULL

    # Extract footnote references and place them into the
    # `list_decorators` object
    list_decorators <- footnotes_to_list(data_attr, has_stub = FALSE)

  } else if (stub_component_is_rowname(stub_components)) {

    # Extract the table (case of table with a stub w/ only row names)
    colnames(stub_df)[2] <- ":row_name:"
    extracted <- cbind(data_attr$stub_df, data_attr$output_df)[, -1]

    col_alignment <- c("right", data_attr$boxh_df[3, ] %>% unlist() %>% unname())
    groups_rows <- NULL

    # Extract footnote references and place them into the
    # `list_decorators` object
    list_decorators <- footnotes_to_list(data_attr, has_stub = TRUE)

  } else if (stub_component_is_groupname(stub_components)) {

    # Extract the table (case of table with a stub w/ only group names)
    colnames(data_attr$stub_df)[1] <- ":group_name:"

    # Combine `:group_name:` column in stub with the output
    #   table to form `extracted`
    extracted <- cbind(data_attr$stub_df, data_attr$output_df)[, -2]

    # Replace NA values in the `:group_name:` column
    extracted[which(is.na(extracted[, 1])), 1] <- data_attr$others_group[[1]] %||% "Others"

    if ("arrange_groups" %in% property_names) {

      # Obtain the `ordering` object, which is a vector that specifies
      #   the order of the groups
      ordering <- obtain_group_ordering(data_attr, extracted)

      # Modify the `extracted` data frame (and associated data frames
      #   in `data_attr`) so that rows are rearranged according to
      #   the group names available in `ordering`
      arranged <- arrange_dfs(data_attr, extracted, ordering)

      # Reassign the transformed `extracted` and `data_attr` objects
      extracted <- arranged$extracted
      data_attr <- arranged$data_attr

    } else {
      ordering <- obtain_group_ordering(data_attr, extracted)
    }

    # Create the `groups_rows` data frame, which provides information
    #   on which rows the group rows should appear above
    groups_rows <- get_groups_rows(extracted, ordering)

    # Remove the `:group_name:` column from the `extracted` data frame
    extracted <- extracted[, -1]

    # Define the `col_alignment` vector, which is a
    #   vector of column alignment values for all of
    #   the relevant columns in a table
    col_alignment <- data_attr$boxh_df[3, ] %>% unlist() %>% unname()

    # Extract footnote references and place them into the
    # `list_decorators` object
    list_decorators <- footnotes_to_list(data_attr, has_stub = TRUE)

  } else if (stub_component_is_rowname_groupname(stub_components)) {

    # Extract the table (case of table with a stub of row and group names)
    colnames(data_attr$stub_df) <- c(":group_name:", ":row_name:")

    # Combine stub with output table to form `extracted`
    extracted <- cbind(data_attr$stub_df, data_attr$output_df)

    # Replace NA values in the `:group_name:` column
    extracted[which(is.na(extracted[, 1])), 1] <- data_attr$others_group[[1]] %||% "Others"

    if ("arrange_groups" %in% property_names) {

      # Obtain the `ordering` object, which is a vector that specifies
      #   the order of the groups
      ordering <- obtain_group_ordering(data_attr, extracted)

      # Modify the `extracted` data frame (and associated data frames
      #   in `data_attr`) so that rows are rearranged according to
      #   the group names available in `ordering`
      arranged <- arrange_dfs(data_attr, extracted, ordering)

      # Reassign the transformed `extracted` and `data_attr` objects
      extracted <- arranged$extracted
      data_attr <- arranged$data_attr

    } else {
      ordering <- obtain_group_ordering(data_attr, extracted)
    }

    # Create the `groups_rows` data frame, which provides information
    #   on which rows the group rows should appear above
    groups_rows <- get_groups_rows(extracted, ordering)

    # Remove the `:group_name:` column from the `extracted` data frame
    extracted <- extracted[, -1]

    # Define the `col_alignment` vector, which is a
    #   vector of column alignment values for all of
    #   the relevant columns in a table
    # Here, we are hardcoding a `right` alignment
    #   for the stub column
    col_alignment <- c("right", data_attr$boxh_df[3, ] %>% unlist() %>% unname())

    # Extract footnote references and place them into the
    # `list_decorators` object
    list_decorators <- footnotes_to_list(data_attr, has_stub = TRUE)
  }

  # Extract the body content as a vector
  body_content <- as.vector(t(extracted))

  # Get the number of rows, columns, and cells in `extracted`
  n_rows <- nrow(extracted)
  n_cols <- ncol(extracted)

  # Get the number of cells in `body_content`
  n_cells <- length(body_content)

  # Handle any available footnotes
  if ("footnote" %in% property_names) {

    body_footnotes <-
      create_footnote_component(
        data_attr, list_decorators, body_content, n_cols)

    body_content <- body_footnotes$body_content
    footnote_component <- body_footnotes$footnote_component

  } else {
    footnote_component <- ""
  }

  # Create a heading
  if ("heading" %in% property_names) {

    heading_component <-
      create_heading_component(
        data_attr, n_cols)

  } else {
    heading_component <- ""
  }

  # heading_component <-
  #   paste0(
  #     heading_component,
  #     paste0(
  #       "<tr>\n<th class='spacer' colspan='", n_cols, "'></th>\n</tr>\n"))

  if ("source_note" %in% property_names) {

    # Create a source note
    source_note_rows <-
      create_source_note_rows(data_attr, n_cols)

  } else {
    source_note_rows <- ""
  }

  # Split the body_content by slices of rows
  row_splits <- split_body_content(body_content, n_cols)

  # Create the table body
  table_body <-
    create_table_body(
      row_splits,
      groups_rows,
      col_alignment,
      n_rows,
      n_cols)

  # Create the table column headings
  table_col_headings <-
    create_column_headings(
      data_attr,
      extracted,
      stub_available,
      spanners_present,
      property_names)

  # Create an HTML fragment for the start of the table
  table_start <- create_table_start(groups_rows, n_rows, n_cols)

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
