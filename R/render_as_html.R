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

    # Add footnote glyphs to elements of the table columns
    boxh_df <-
      set_footnote_glyphs_columns(
        footnotes_resolved, boxh_df, output = "html"
      )

    # Add footnote glyphs to the stubhead label
    stubhead_label <-
      set_footnote_glyphs_stubhead_label(
        footnotes_resolved, stubhead_label, output = "html")

    # Add footnote glyphs to the `data` rows
    output_df <-
      apply_footnotes_to_output(
        output_df, footnotes_resolved, output = "html"
      )

    # Add footnote glyphs to the stub group cells
    groups_rows_df <-
      set_footnote_glyphs_stub_groups(
        footnotes_resolved, groups_rows_df, output = "html"
      )

    # Add footnote glyphs to the `summary` cells
    list_of_summaries <-
      apply_footnotes_to_summary(list_of_summaries, footnotes_resolved)

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
        heading, footnotes_resolved, styles_resolved, n_cols,
        subtitle_defined, output = "html"
      )

    # Create the columns component of the table
    columns_component <-
      create_columns_component_h(
        boxh_df, output_df, stub_available, spanners_present,
        styles_resolved, stubhead_label, col_alignment, opts_df
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
    source_note_component <- create_source_note_component_h(source_note, n_cols)

    # Create the footnote component of the table
    footnote_component <-
      create_footnote_component_h(footnotes_resolved, opts_df, n_cols)

    # Compose the HTML table
    htmltools::tags$table(
      class = "gt_table",
      heading_component,
      columns_component,
      body_component,
      source_note_component,
      footnote_component
    ) %>%
      as.character()
  })
}
