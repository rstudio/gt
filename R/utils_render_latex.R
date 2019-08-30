
# Create a vector of LaTeX packages to use as table dependencies
latex_packages <- function() {
  c("amsmath", "booktabs", "caption", "longtable")
}

# Transform a footnote mark to a LaTeX representation as a superscript
footnote_mark_to_latex <- function(mark) {

  paste0("\\textsuperscript{", mark, "}")
}

#' @noRd
latex_body_row <- function(content,
                           type) {

  if (type == "row") {

    return(
      paste(paste(content, collapse = " & "), "\\\\ \n"))

  } else if (type == "group") {

    return(
      paste(paste(content, collapse = " & "), "\\\\ \n"))
  }
}

#' @noRd
latex_heading_row <- function(content) {

  paste0(
    paste(paste(content, collapse = " & "), "\\\\ \n"),
    "\\midrule\n",
    collapse = "")
}

#' @noRd
latex_group_row <- function(group_name,
                            top_border = TRUE,
                            bottom_border = TRUE) {

  paste0(
    ifelse(top_border, "\\midrule\n", ""),
    "\\multicolumn{1}{l}{", group_name,
    "} \\\\ \n",
    ifelse(bottom_border, "\\midrule\n", ""),
    collapse = "")
}

#' @noRd
create_table_start_l <- function(col_alignment) {

  paste0(
    "\\captionsetup[table]{labelformat=empty,skip=1pt}\n",
    "\\begin{longtable}{",
    col_alignment %>% substr(1, 1) %>% paste(collapse = ""),
    "}\n",
    collapse = "")
}

#' Create the columns component of a table
#'
#' @noRd
create_columns_component_l <- function(data) {

  boxh <- dt_boxh_get(data = data)
  output_tbl <- dt_output_tbl_get(data = data)
  stub_available <- attr(data, "stub_available", exact = TRUE)
  spanners_present <- attr(data, "spanners_present", exact = TRUE)
  stubh <- dt_stubh_get(data = data)

  col_alignment <- boxh$column_align

  # Get the headings
  headings <- boxh$column_label %>% unlist()

  # If `stub_available` == TRUE, then replace with a set stubhead
  #   caption or nothing
  if (stub_available && length(stubh$label) > 0) {

    headings <- prepend_vec(headings, stubh$label)

  } else if (stub_available) {

    headings <- prepend_vec(headings, "")
  }

  table_col_headings <- paste0(latex_heading_row(content = headings), collapse = "")

  if (spanners_present) {

    # Get vector of group labels (spanners)
    spanners <- dt_spanners_print(data = data)

    # Promote column labels to the group level wherever the
    # spanner label is NA
    spanners[is.na(spanners)] <- headings[is.na(spanners)]

    if (stub_available) {
      spanners <- c(NA_character_, spanners)
    }

    spanners_lengths <- rle(spanners)

    multicol <- c()
    cmidrule <- c()

    for (i in seq(spanners_lengths$lengths)) {

      if (spanners_lengths$lengths[i] > 1) {

        if (length(multicol) > 0 &&
            grepl("\\\\multicolumn", multicol[length(multicol)])) {
          multicol <- c(multicol, "& ")
        }

        multicol <-
          c(multicol,
            paste0(
              "\\multicolumn{", spanners_lengths$lengths[i],
              "}{c}{",
              spanners_lengths$values[i],
              "} "))

        cmidrule <-
          c(cmidrule,
            paste0(
              "\\cmidrule(lr){",
              sum(spanners_lengths$lengths[1:i]) - spanners_lengths$lengths[i] + 1,
              "-",
              sum(spanners_lengths$lengths[1:i]),
              "}"))

      } else {
        multicol <- c(multicol, "& ")
      }

    }

    multicol <- paste0(paste(multicol, collapse = ""), "\\\\ \n")
    cmidrule <- paste0(paste(cmidrule, collapse = ""), "\n")

    table_col_spanners <- paste(multicol, cmidrule, collapse = "")

  } else {

    table_col_spanners <- ""
  }

  paste0("\\toprule\n", table_col_spanners, table_col_headings)
}

#' @noRd
create_body_component_l <- function(data,
                                    row_splits) {

  boxh <- dt_boxh_get(data = data)
  output_tbl <- dt_output_tbl_get(data = data)
  groups_rows_df <- attr(data, "groups_rows_df", exact = TRUE)
  col_alignment <- col_alignment <- boxh$column_align
  stub_available <- attr(data, "stub_available", exact = TRUE)
  summaries_present <- attr(data, "summaries_present", exact = TRUE)
  list_of_summaries <- attr(data, "list_of_summaries", exact = TRUE)

  n_rows <- nrow(output_tbl)
  n_cols <- ncol(output_tbl)

  # Replace an NA group with an empty string
  if (any(is.na(groups_rows_df$group))) {

    groups_rows_df <-
      groups_rows_df %>%
      dplyr::mutate(
        group_label = ifelse(
          is.na(group_label), "\\vspace*{-5mm}", group_label)) %>%
      dplyr::mutate(
        group_label = gsub("^NA", "\\textemdash", group_label))
  }

  group_rows <-
    create_group_rows(
      n_rows, groups_rows_df, context = "latex")

  data_rows <-
    create_data_rows(
      n_rows, row_splits, context = "latex")

  summary_rows <-
    create_summary_rows(
      n_rows, n_cols, list_of_summaries, groups_rows_df,
      stub_available, summaries_present, context = "latex")

  paste(collapse = "", paste0(group_rows, data_rows, summary_rows))
}

#' @noRd
create_table_end_l <- function() {

  paste0(
    "\\bottomrule\n",
    "\\end{longtable}\n",
    collapse = "")
}

#' @noRd
create_footnote_component_l <- function(data) {

  footnotes_tbl <- dt_footnotes_get(data = data)
  opts_df <- dt_options_get(data = data)

  # If the `footnotes_resolved` object has no
  # rows, then return an empty footnotes component
  if (nrow(footnotes_tbl) == 0) {
    return("")
  }

  footnotes_tbl <-
    footnotes_tbl %>%
    dplyr::select(fs_id, text) %>%
    dplyr::distinct()

  # Get the separator option from `opts_df`
  separator <- opts_df %>%
    dplyr::filter(parameter == "footnote_sep") %>%
    dplyr::pull(value)

  # Convert an HTML break tag to a Latex line break
  separator <-
    separator %>%
    tidy_gsub("<br\\s*?(/|)>", "\\newline") %>%
    tidy_gsub("&nbsp;", " ")

  # Create the footnotes block
  footnote_component <-
    paste0(
      "\\vspace{-5mm}\n",
      "\\begin{minipage}{\\linewidth}\n",
      paste0(
        footnote_mark_to_latex(footnotes_tbl[["fs_id"]]),
        footnotes_tbl[["text"]] %>%
          unescape_html() %>%
          markdown_to_latex(), " \\\\ \n", collapse = ""),
      "\\end{minipage}\n", collapse = "")

  footnote_component
}

#' @noRd
create_source_note_component_l <- function(data) {

  source_note <- dt_source_notes_get(data = data)

  # If the `footnotes_resolved` object has no
  # rows, then return an empty footnotes component
  if (length(source_note) == 0) {
    return("")
  }

  source_note <- source_note[[1]]

  # Create the source notes block
  source_note_component <-
    paste0(
      "\\begin{minipage}{\\linewidth}\n",
      paste0(
        source_note %>% as.character(), "\\\\ \n", collapse = ""),
      "\\end{minipage}\n", collapse = "")

  source_note_component
}
