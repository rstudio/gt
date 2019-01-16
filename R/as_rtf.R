#' Output a \pkg{gt} object as RTF
#'
#' Get the RTF content from a \code{gt_tbl} object as as a single-element
#' character vector. This object can be used with \code{writeLines()} to
#' generate a valid .rtf file that can be opened by RTF readers.
#'
#' @param data a table object that is created using the \code{gt()} function.
#' @examples
#' # Use `gtcars` to create a gt table;
#' # add a header and then export as
#' # RTF code
#' tab_rtf <-
#'   gtcars %>%
#'   dplyr::select(mfr, model) %>%
#'   dplyr::slice(1:2) %>%
#'   gt() %>%
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   ) %>%
#'   as_rtf()
#'
#' # `tab_rtf` is a single element character
#' # vector
#' tab_rtf %>% cat()
#'
#' @family table export functions
#' @import rlang
#' @import checkmate
#' @export
as_rtf <- function(data) {
  checkmate::assert_class(data, "gt_tbl")

  context <- "latex"

  # Preparation Work --------------------------------------------------------

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

  # Get the `heading` object
  heading <- data_attr$heading

  # Get the `stubhead_label` object
  stubhead_label <- data_attr$stubhead_label

  # Get the `source_note` object
  source_note <- data_attr$source_note

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
  output_df <- migrate_unformatted_to_output(data_df, output_df, context)

  # Get the reordering df (`rows_df`) for the data rows
  rows_df <- get_row_reorder_df(arrange_groups, stub_df)

  # Get the `columns_df` data frame for the data columns
  columns_df <- get_column_reorder_df(cols_df, boxh_df)

  # Reassemble the rows and columns of `data_df` in the correct order
  output_df <- reassemble_output_df(output_df, rows_df, columns_df)

  # Get the `groups_df` data frame, which is a rearranged representation
  # of the stub `groupname` and `rowname` columns
  groups_df <- get_groupnames_rownames_df(stub_df, rows_df)

  # Get a `columns_spanners` vector, which has the unique, non-NA
  # column spanner labels
  columns_spanners <- get_columns_spanners_vec(boxh_df)

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

  # Apply column names to column labels for any of those column labels not
  # explicitly set
  boxh_df <- migrate_colnames_to_labels(boxh_df, col_labels, context)

  # Assign default alignment for all columns that haven't had alignment
  # explicitly set
  boxh_df <- set_default_alignments(boxh_df)

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

  # Determine if a subtitle has been defined
  subtitle_defined <- is_subtitle_defined(heading)

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
      columns_spanners, title_defined, subtitle_defined,
      footnotes_df = footnotes_df, styles_df = NULL)

  # Add footnote glyphs to elements of the table columns
  boxh_df <-
    set_footnote_glyphs_columns(footnotes_resolved, boxh_df, output = "rtf")

  # Add footnote glyphs to the `data` rows
  output_df <-
    apply_footnotes_to_output(output_df, footnotes_resolved, output = "rtf")

  # Add footnote glyphs to stub group title elements
  groups_rows_df <-
    set_footnote_glyphs_stub_groups(
      footnotes_resolved, groups_rows_df, output = "rtf")

  # Add footnote glyphs to the `summary` rows
  list_of_summaries <-
    apply_footnotes_to_summary(list_of_summaries, footnotes_resolved)

  body_content <- as.vector(t(output_df))

  # Split `body_content` by slices of rows
  row_splits_body <- split_body_content(body_content, n_cols)

  # Composition of RTF ------------------------------------------------------

  # Create an RTF fragment for the start of the table
  table_start <- rtf_head()

  # Create a heading component of the table and handle any available footnotes
  heading_component <-
    create_heading_component(
      heading, footnotes_resolved, n_cols = n_cols, output = "rtf")

  # Get the headings
  headings <- names(output_df)

  # Merge the heading labels
  headings_rev <- headings %>% rev()
  labels_rev <- boxh_df[2, ] %>% unname() %>% t() %>% as.vector() %>% rev()

  for (i in seq(labels_rev)) {
    headings_rev[i] <- labels_rev[i]
  }
  headings <- rev(headings_rev)

  # If `stub_available` == TRUE, then replace with a set stubhead
  #   caption or nothing
  if (stub_available &&
      length(stubhead_label) > 0 &&
      "rowname" %in% headings) {

    headings[which(headings == "rowname")] <- stubhead_label$stubhead_label

  } else if ("rowname" %in% headings) {

    headings[which(headings == "rowname")] <- ""
  }

  # Remove any HTML tags from `headings`
  headings <- remove_html(headings)

  if (spanners_present == FALSE) {

    columns_component <-
      paste0(rtf_heading_row(content = headings), collapse = "")

  } else {

    # spanners
    spanners <- boxh_df[1, ] %>% t() %>% as.vector()

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

    columns_component <-
      rtf_heading_group_row(
        spanners_lengths = spanners_lengths,
        headings = headings,
        spanners = spanners)
  }

  # Create the body component of the table
  # Split the body_content by slices of rows
  row_splits <- split(body_content, ceiling(seq_along(body_content)/n_cols))

  body_rows <- c()
  for (i in 1:n_rows) {

    # Process group rows
    if (!is.null(groups_rows_df) &&
        i %in% groups_rows_df$row) {

      body_rows <-
        c(body_rows,
          rtf_body_row(
            c(
              groups_rows_df[which(groups_rows_df$row %in% i), 1][[1]],
              rep("", n_cols - 1)), type = "group"))
    }

    # Process "data" rows
    if (i != length(row_splits)) {
      body_rows <-
        c(body_rows, rtf_body_row(row_splits[[i]], type = "row"))
    } else {
      body_rows <-
        c(body_rows, rtf_last_body_row(content = row_splits[[i]]))
    }

    # Process summary rows
    if (stub_available && summaries_present &&
        i %in% groups_rows_df$row_end) {

      group <-
        groups_rows_df %>%
        dplyr::filter(row_end == i) %>%
        dplyr::pull(group)

      if (group %in% names(list_of_summaries$summary_df_display_list)) {

        summary_df <-
          list_of_summaries$summary_df_display_list[[
            which(names(list_of_summaries$summary_df_display_list) == group)]] %>%
          as.data.frame(stringsAsFactors = FALSE)

        body_content_summary <-
          as.vector(t(summary_df)) %>%
          tidy_gsub("\u2014", "-")

        row_splits_summary <-
          split_body_content(
            body_content = body_content_summary,
            n_cols = n_cols)

        for (j in seq(length(row_splits_summary))) {

          body_rows <-
            c(body_rows, rtf_body_row(row_splits_summary[[j]], type = "row"))
        }
      }
    }
  }

  body_component <- paste0(body_rows, collapse = "")

  # Create the source note rows and handle any available footnotes
  if (length(source_note) != 0) {

    # Create a source note
    source_note_rows <-
      paste0(
        "\\pard\\pardeftab720\\sl288\\slmult1\\partightenfactor0\n",
        paste0(
          "\\cf0 \\strokec2 ", remove_html(data_attr$source_note[[1]]), "\\\n",
          collapse = ""),
        collapse = "")
  } else {
    source_note_rows <- ""
  }

  # Handle any available footnotes
  footnote_component <-
    create_footnote_component_rtf(footnotes_resolved, opts_df)

  table_end <- "}\n"

  # Compose the RTF table
  rtf_table <-
    paste0(
      table_start,
      heading_component,
      columns_component,
      body_component,
      footnote_component,
      source_note_rows,
      table_end,
      collapse = "")

  if (isTRUE(getOption('knitr.in.progress'))) {
    rtf_table <- rtf_table %>% knitr::raw_output()
  }

  rtf_table
}
