#' Output a gt table object as LateX
#'
#' Take a \code{gt_tbl} table object and emit LateX.
#' @param data a table object that is created using the \code{gt()} function.
#' @import rlang
#' @importFrom dplyr mutate group_by summarize ungroup rename arrange
#' @importFrom stats setNames
#' @examples
#' \dontrun{
#' # Create a `gt` table using the `sleep`
#' # dataset and output as Latex
#' gt(data = sleep) %>%
#'   as_latex()
#' }
#' @family table export functions
#' @export
as_latex <- function(data) {

  # Build all table data objects through a common pipeline
  built_data <- data %>% build_data()

  # Use Latex-specific builders to generate the Latex table code
  with(built_data, {


    # Add footnote glyphs to boxhead elements
    boxh_df <-
      set_footnote_glyphs_boxhead(footnotes_resolved, boxh_df, output = "latex")

    # Add footnote glyphs to the `data` rows
    output_df <-
      apply_footnotes_to_output(output_df, footnotes_resolved, output = "latex")

    # Add footnote glyphs to stub group title elements
    groups_rows_df <-
      set_footnote_glyphs_stub_groups(
        footnotes_resolved, groups_rows_df, output = "latex")

    # Add footnote glyphs to the `summary` rows
    list_of_summaries <-
      apply_footnotes_to_summary(list_of_summaries, footnotes_resolved)

    # Extraction of body content as a vector ----------------------------------
    body_content <- as.vector(t(output_df))

    # Composition of LateX ----------------------------------------------------

    # Split `body_content` by slices of rows
    row_splits <- split(body_content, ceiling(seq_along(body_content)/n_cols))

    # Create a Latex fragment for the start of the table
    table_start <- latex_head()

    # Create a heading component of the table and handle any available footnotes
    heading_component <-
      create_heading_component(
        heading, footnotes_resolved, n_cols = n_cols, output = "latex")

    # Create a Latex fragment for the tabular statement
    tabular_start <- latex_tabular(col_alignment = col_alignment)

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
        length(stubhead_caption) > 0 &&
        "rowname" %in% headings) {

      headings[which(headings == "rowname")] <- stubhead_caption$stubhead_caption

    } else if ("rowname" %in% headings) {

      headings[which(headings == "rowname")] <- ""
    }

    table_col_headings <-
      paste0(latex_heading_row(content = headings), collapse = "")

    if (spanners_present) {

      # spanners
      spanners <- boxh_df[1, ] %>% t() %>% as.vector()

      if (stub_available) {
        spanners <- c(NA_character_, spanners)
      }

      for (i in seq(spanners)) {
        if (is.na(spanners[i])) {
          spanners[i] <- headings[i]
        }
      }

      spanners_lengths <- rle(spanners)

      multicol <- c()
      cmidrule <- c()

      for (i in seq(spanners_lengths$lengths)) {

        if (spanners_lengths$lengths[i] > 1) {

          multicol <-
            c(multicol,
              paste0(
                "\\multicolumn{", spanners_lengths$lengths[i],
                "}{c}{",
                spanners_lengths$values[i] %>% tidy_gsub("_", "\\\\_"),
                "}"))

          cmidrule <-
            c(cmidrule,
              paste0(
                "\\cmidrule{",
                sum(spanners_lengths$lengths[1:i]) - spanners_lengths$lengths[i] + 1,
                "-",
                sum(spanners_lengths$lengths[1:i]),
                "}"))

        } else {
          multicol <- c(multicol, " & ")
        }

      }

      multicol <- paste0(paste(multicol, collapse = ""), "\\\\ \n")
      cmidrule <- paste0(paste(cmidrule, collapse = ""), "\n")

      boxhead_component <- paste(multicol, cmidrule, collapse = "")
    } else {
      boxhead_component <- ""
    }

    body_rows <- c()
    for (i in 1:n_rows) {

      # Process group rows
      if (!is.null(groups_rows_df) &&
          i %in% groups_rows_df$row) {

        if (i == 1) {

          body_rows <-
            c(body_rows,
              latex_group_row(
                groups_rows_df[which(groups_rows_df$row %in% i), 1][[1]],
                top_border = FALSE))

        } else if (i == n_rows) {

          body_rows <-
            c(body_rows,
              latex_group_row(
                groups_rows_df[which(groups_rows_df$row %in% i), 1][[1]],
                bottom_border = FALSE))

        } else {

          body_rows <-
            c(body_rows,
              latex_group_row(
                groups_rows_df[which(groups_rows_df$row %in% i), 1][[1]]))
        }
      }

      # Process "data" rows
      body_rows <-
        c(body_rows, latex_body_row(row_splits[[i]], type = "row"))

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

            if (j == 1) {
              body_rows <- c(body_rows, "\\midrule \n")
            }

            body_rows <-
              c(body_rows, latex_body_row(row_splits_summary[[j]], type = "row"))
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
          data_attr$source_note %>% as.character(), "\\\\ \n",
          collapse = "")
    } else {
      source_note_rows <- ""
    }

    # footnote_component <- ""

    # Handle any available footnotes
    footnote_component <-
      create_footnote_component_latex(footnotes_resolved, opts_df)

    table_bottom <- latex_bottom_table()

    table_end <- latex_tail()

    end_table <- latex_end_table()

    # Compose the Latex table
    latex_table <-
      paste0(
        table_start,
        heading_component,
        tabular_start,
        boxhead_component,
        table_col_headings,
        body_component,
        table_bottom,
        table_end,
        footnote_component,
        source_note_rows,
        end_table,
        collapse = "") %>%
      knitr::asis_output() %>%
      knitr::knit_print()

    latex_table
  })
}
