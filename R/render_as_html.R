#' Transform a \pkg{gt} table object to an HTML table
#'
#' Take a `gt_tbl` table object and transform it to an HTML table.
#' @param data A table object that is created using the `gt()` function.
#' @return A character object with an HTML table.
#' @family table export functions
#' @noRd
render_as_html <- function(data) {

  # Build all table data objects through a common pipeline
  built_data <- data %>% build_data(context = "html")

  # Use HTML-specific builders to generate the HTML table code
  with(built_data, {

    # Composition of HTML -----------------------------------------------------

    # Add footnote marks to elements of the table columns
    boxh_df <-
      set_footnote_marks_columns(
        footnotes_resolved = footnotes_resolved,
        boxh_df = boxh_df,
        output = "html"
      )

    # Add footnote marks to the stubhead label
    stubhead <-
      set_footnote_marks_stubhead(
        footnotes_resolved = footnotes_resolved,
        stubhead = stubhead,
        output = "html"
      )

    # Add footnote marks to the `data` rows
    output_df <-
      apply_footnotes_to_output(
        output_df = output_df,
        footnotes_resolved = footnotes_resolved,
        output = "html"
      )

    # Add footnote marks to the stub group cells
    groups_rows_df <-
      set_footnote_marks_stub_groups(
        footnotes_resolved = footnotes_resolved,
        groups_rows_df = groups_rows_df,
        output = "html"
      )

    # Add footnote marks to the `summary` cells
    list_of_summaries <-
      apply_footnotes_to_summary(
        list_of_summaries = list_of_summaries,
        footnotes_resolved = footnotes_resolved
      )

    # Upgrade `styles_resolved` to gain a `html_style`
    # column with style rules
    if (nrow(styles_resolved) > 0) {
      styles_resolved <-
        styles_resolved %>%
        dplyr::mutate(
          html_style = vapply(
            styles_appended, function(x) styles_to_html(x), character(1))
        )
    }

    # Create the heading component of the table
    heading_component <-
      create_heading_component(
        heading = heading,
        footnotes_resolved = footnotes_resolved,
        styles_resolved = styles_resolved,
        n_cols = n_cols,
        subtitle_defined = subtitle_defined,
        output = "html"
      )

    # Create the columns component of the table
    columns_component <-
      create_columns_component_h(
        boxh_df = boxh_df,
        output_df = output_df,
        stub_available = stub_available,
        spanners_present = spanners_present,
        styles_resolved = styles_resolved,
        stubhead = stubhead,
        col_alignment = col_alignment,
        opts_df = opts_df
      )

    # Create the body component of the table
    body_component <-
      create_body_component_h(
        output_df = output_df,
        styles_resolved = styles_resolved,
        groups_rows_df = groups_rows_df,
        col_alignment = col_alignment,
        stub_components = stub_components,
        summaries_present = summaries_present,
        list_of_summaries = list_of_summaries,
        n_rows = n_rows,
        n_cols = n_cols,
        opts_df = opts_df
      )

    # Create the source note rows and handle any available footnotes
    source_note_component <-
      create_source_note_component_h(
        source_note = source_note,
        n_cols = n_cols
      )

    # Create the footnote component of the table
    footnote_component <-
      create_footnote_component_h(
        footnotes_resolved = footnotes_resolved,
        opts_df = opts_df,
        n_cols = n_cols
      )

    # Get attributes for the gt table
    table_defs <- get_table_defs(boxh_df)

    # Compose the HTML table
    htmltools::tags$table(
      class = "gt_table",
      style = table_defs$table_style,
      table_defs$table_colgroups,
      heading_component,
      columns_component,
      body_component,
      source_note_component,
      footnote_component
    ) %>%
      as.character()
  })
}
