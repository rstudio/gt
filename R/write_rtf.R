#' Save a gt table object as an RTF file
#'
#' Take a \code{gt_tbl} table object and render it to an RTF file with the
#' extension \code{.rtf}.
#' @param data a table object that is created using the \code{gt()} function.
#' @param file a filename to use for writing out the RTF file.
#' @importFrom rlang %||%
#' @examples
#' \dontrun{
#' # Create a `gt` table using the `sleep`
#' # dataset and then write the table to
#' # an RTF file
#' gt(data = sleep) %>%
#'   write_rtf(file = "sleep.rtf")
#' }
#' @family table export functions
#' @export
write_rtf <- function(data, file) {

  # Preparation Work --------------------------------------------------------

  # Extract all attributes from the data object into `data_attr`;
  #   this will be one of the main objects going forward
  data_attr <- attributes(data)

  # Create `output_df` with rendered values
  data_attr$output_df <- render_formats(data, context = "rtf")

  # Move input data cells to `output_df` that didn't have
  #   any rendering applied during `render_formats()`
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
  data_attr <- integrate_summary_lines(data_attr)

  # If a summary lines were processed, they were added to
  #   `data_attr`; incorporate that data frame as a `data` attr
  if ("summary_df" %in% names(data_attr)) {
    attr(data, "summary_df") <- data_attr$summary_df
  }

  # Perform any necessary column merge operations
  data_attr <- perform_col_merge(data_attr)

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
    #   `list_footnotes` object
    list_footnotes <- footnotes_to_list(data_attr, has_stub = FALSE)

  } else if (stub_component_is_rowname(stub_components)) {

    # Extract the table (case of table with a stub w/ only row names)
    colnames(data_attr$stub_df)[2] <- ":row_name:"
    extracted <- cbind(data_attr$stub_df, data_attr$output_df)[, -1]

    col_alignment <- c("right", data_attr$boxh_df[3, ] %>% unlist() %>% unname())
    groups_rows <- NULL

    # Extract footnote references and place them into the
    #   `list_footnotes` object
    list_footnotes <- footnotes_to_list(data_attr, has_stub = TRUE)

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
    #   `list_footnotes` object
    list_footnotes <- footnotes_to_list(data_attr, has_stub = TRUE)

  } else if (stub_component_is_rowname_groupname(stub_components)) {

    # Extract the table (case of table with a stub of row and group names)
    colnames(data_attr$stub_df) <- c(":group_name:", ":row_name:")

    # Combine stub with output table to form `extracted`
    extracted <- cbind(data_attr$stub_df, data_attr$output_df)

    # Replace NA values in the `:group_name:` column
    extracted[which(is.na(extracted[, 1])), 1] <- data_attr$others_group[[1]] %||% "Others"

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
    # `list_footnotes` object
    list_footnotes <- footnotes_to_list(data_attr, has_stub = TRUE)
  }

  # Extract the body content as a vector
  body_content <- as.vector(t(extracted))

  # Get the number of rows, columns, and cells in `extracted`
  n_rows <- nrow(extracted)
  n_cols <- ncol(extracted)

  # Get the number of cells in `body_content`
  n_cells <- length(body_content)

  # Composition of RTF ------------------------------------------------------

  # Handle any available footnotes
  body_footnotes <-
    create_footnote_component_rtf(
      data_attr, list_footnotes, body_content, n_cols)

  body_content <- body_footnotes$body_content
  footnote_component <- body_footnotes$footnote_component

  # Create a heading
  if ("heading" %in% property_names) {

    if (data_attr$heading[["headnote"]] != "") {

      heading_component <-
        rtf_title_headnote(
          title = data_attr$heading[["title"]] %>% remove_html(),
          headnote = data_attr$heading[["headnote"]] %>% remove_html(),
          n_cols = n_cols)

    } else {

      heading_component <-
        rtf_title(
          title = data_attr$heading[["title"]] %>% remove_html(),
          n_cols = n_cols)
    }
  } else {
    heading_component <- ""
  }

  if ("source_note" %in% property_names) {

    # Create a source note
    source_note_rows <-
      paste0(
        "\\pard\\pardeftab720\\sl288\\slmult1\\partightenfactor0\n",
        paste0(
          "\\cf2 \\strokec2 ", remove_html(data_attr$source_note[[1]]), "\\\n",
          collapse = ""),
        collapse = "")
  } else {
    source_note_rows <- ""
  }

  # Split the body_content by slices of rows
  row_splits <- split(body_content, ceiling(seq_along(body_content)/n_cols))

  body_rows <- c()
  for (i in 1:n_rows) {

    if (!is.null(groups_rows) && i %in% groups_rows$row) {

      body_rows <-
        c(body_rows,
          rtf_body_row(
            c(
              groups_rows[which(groups_rows$row %in% i), 1][[1]],
              rep("", n_cols - 1)), type = "group"))
    }

    if (i != length(row_splits)) {
      body_rows <-
        c(body_rows, rtf_body_row(row_splits[[i]], type = "row"))
    } else {
      body_rows <-
        c(body_rows, rtf_last_body_row(content = row_splits[[i]]))
    }
  }

  body_rows <- paste0(body_rows, collapse = "")

  table_start <- rtf_head()

  table_end <- "}\n"

  # Get the headings
  headings <- names(extracted)

  # Merge the heading labels
  headings_rev <- headings %>% rev()
  labels_rev <- data_attr$boxh_df[2, ] %>% unname() %>% t() %>% as.vector() %>% rev()

  for (i in seq(labels_rev)) {
    headings_rev[i] <- labels_rev[i]
  }
  headings <- rev(headings_rev)

  # If `stub_available` == TRUE, then replace with a set stubhead
  # caption or nothing
  if (stub_available &&
      "stubhead_caption" %in% property_names &&
      ":row_name:" %in% headings) {
    headings[which(headings == ":row_name:")] <-
      data_attr$stubhead_caption[[1]]
  } else if (":row_name:" %in% headings) {
    headings[which(headings == ":row_name:")] <- ""
  }

  # Remove any HTML tags from `headings`
  headings <- remove_html(headings)

  if (spanners_present == FALSE) {

    table_col_headings <-
      paste0(rtf_heading_row(content = headings), collapse = "")

  } else {

    # spanners
    spanners <- data_attr$boxh_df[1, ] %>% t() %>% as.vector()

    # Remove any HTML tags from `spanners`
    spanners <- remove_html(spanners)

    if (stub_available) {
      spanners <- c(NA_character_, spanners)
    }

    for (i in seq(spanners)) {
      if (is.na(spanners[i])) {
        spanners[i] <- headings[i]
      }
    }

    spanners_lengths <- rle(spanners)

    table_col_headings <-
      rtf_heading_group_row(
        spanners_lengths = spanners_lengths,
        headings = headings,
        spanners = spanners)
  }

  # Compose the RTF table
  rtf_table <-
    paste0(
      table_start,
      heading_component,
      table_col_headings,
      body_rows,
      source_note_rows,
      footnote_component,
      table_end,
      collapse = "")

  # Ensure that the filename has the extension `.rtf`
  if (!grepl("\\.rtf", file)) {
    file <- paste0(file, ".rtf")
  }

  # Write the RTF lines to a file
  rtf_table %>% writeLines(file)
}
