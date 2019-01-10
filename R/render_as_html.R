#' Transform a \pkg{gt} table object to an HTML table
#'
#' Take a \code{gt_tbl} table object and transform it to an HTML table.
#' @param data a table object that is created using the \code{gt()} function.
#' @return a character object with an HTML table
#' @import checkmate
#' @import rlang
#' @family table export functions
#' @noRd
render_as_html <- function(data) {

  # Build all table data objects through a common pipeline
  built_data <- data %>% build_data(context = "html")

  # Use HTML-specific builders to generate the HTML table code
  with(built_data, {

    # Composition of HTML -----------------------------------------------------

    # Add footnote glyphs to elements of the table columns
    boxh_df <-
      set_footnote_glyphs_columns(
        footnotes_resolved, boxh_df, output = "html")

    # Add footnote glyphs to the `data` rows
    output_df <-
      apply_footnotes_to_output(
        output_df, footnotes_resolved, output = "html")

    # Add footnote glyphs to the stub group cells
    groups_rows_df <-
      set_footnote_glyphs_stub_groups(
        footnotes_resolved, groups_rows_df, output = "html")

    # Add footnote glyphs to the `summary` cells
    list_of_summaries <-
      apply_footnotes_to_summary(
        list_of_summaries, footnotes_resolved)

    # Get styles for the data rows and split in the same fashion as
    # for the content of the data rows
    row_splits_styles <-
      apply_styles_to_output(
        output_df, styles_resolved, n_cols)

    # Extraction of body content as a vector
    body_content <- as.vector(t(output_df))

    # Split `body_content` by slices of rows
    row_splits_body <-
      split_body_content(
        body_content, n_cols)

    # Create an HTML fragment for the start of the table
    table_start <- create_table_start_h()

    # Create the heading component of the table
    heading_component <-
      create_heading_component(
        heading, footnotes_resolved, styles_resolved, n_cols, output = "html")

    # Create the columns component of the table
    columns_component <-
      create_columns_component_h(
        boxh_df, output_df, stub_available, spanners_present,
        styles_resolved, stubhead_label, col_alignment)

    # Create the body component of the table
    body_component <-
      create_body_component_h(
        row_splits_body, row_splits_styles, styles_resolved,
        groups_rows_df, col_alignment, stub_components, summaries_present,
        list_of_summaries, n_rows, n_cols)

    # Create the source note rows and handle any available footnotes
    source_note_component <-
      create_source_note_component_h(
        source_note, n_cols)

    # Create the footnote component of the table
    footnote_component <-
      create_footnote_component_h(
        footnotes_resolved, opts_df, n_cols)

    # Create an HTML fragment for the end of the table
    table_end <- create_table_end_h()

    # Compose the HTML table
    html_table <-
      paste0(
        table_start,
        heading_component,
        columns_component,
        body_component,
        source_note_component,
        footnote_component,
        table_end,
        collapse = "")

    html_table
  })
}
