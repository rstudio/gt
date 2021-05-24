
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
create_table_start_l <- function(data) {

  col_alignment <-
    dt_boxhead_get(data = data) %>%
    dplyr::filter(type == "default") %>%
    dplyr::pull(column_align)

  # TODO: ensure that number of alignment tabs is correct
  if (dt_stub_df_exists(data = data)) {
    col_alignment <- c("left", col_alignment)
  }

  paste0(
    "\\captionsetup[table]{labelformat=empty,skip=1pt}\n",
    "\\begin{longtable}{",
    col_alignment %>% substr(1, 1) %>% paste(collapse = ""),
    "}\n",
    collapse = ""
  )
}

#' Create the columns component of a table
#'
#' @noRd
create_columns_component_l <- function(data) {

  boxh <- dt_boxhead_get(data = data)
  stubh <- dt_stubhead_get(data = data)
  stub_available <- dt_stub_df_exists(data = data)
  spanners_present <- dt_spanners_exists(data = data)

  # Get the headings
  #headings <- boxh$column_label %>% unlist()

  headings_vars <- boxh %>% dplyr::filter(type == "default") %>% dplyr::pull(var)
  headings_labels <- dt_boxhead_get_vars_labels_default(data = data)

  # TODO: Implement hidden boxhead in LaTeX
  # # Should the column labels be hidden?
  # column_labels_hidden <-
  #   dt_options_get_value(data = data, option = "column_labels_hidden")
  #
  # if (column_labels_hidden) {
  #   return("")
  # }

  # If `stub_available` == TRUE, then replace with a set stubhead
  # label or nothing
  if (isTRUE(stub_available) && length(stubh$label) > 0) {

    headings_labels <- prepend_vec(headings_labels, stubh$label)
    headings_vars <- prepend_vec(headings_vars, "::stub")

  } else if (isTRUE(stub_available)) {

    headings_labels <- prepend_vec(headings_labels, "")
    headings_vars <- prepend_vec(headings_vars, "::stub")
  }

  table_col_headings <-
    paste0(latex_heading_row(content = headings_labels), collapse = "")

  if (spanners_present) {

    # Get vector of group labels (spanners)
    spanners <- dt_spanners_print(data = data, include_hidden = FALSE)
    spanner_ids <- dt_spanners_print(data = data, include_hidden = FALSE, ids = TRUE)

    if (stub_available) {
      spanners <- c(NA_character_, spanners)
      spanner_ids <- c(NA_character_, spanner_ids)
    }

    spanners_rle <- unclass(rle(spanner_ids))

    # We need a parallel vector of spanner labels and this could
    # be part of the `spanners_rle` list
    spanners_rle$labels <- spanners[cumsum(spanners_rle$lengths)]

    begins <- (cumsum(utils::head(c(0, spanners_rle$lengths), -1)) + 1)[!is.na(spanners_rle$values)]
    ends <- cumsum(spanners_rle$lengths)[!is.na(spanners_rle$values)]
    cmidrule <- paste0("\\cmidrule(lr){", begins, "-", ends, "}")

    is_spanner_na <- is.na(spanners_rle$values)
    is_spanner_single <- spanners_rle$lengths == 1

    multicol <-
      ifelse(
        is_spanner_na, "",
        ifelse(
          is_spanner_single, spanners_rle$labels,
          sprintf(
            "\\multicolumn{%d}{c}{%s}", spanners_rle$lengths, spanners_rle$labels
          )
        )
      )

    multicol <- paste0(paste(multicol, collapse = " & "), " \\\\ \n")
    cmidrule <- paste0(paste(cmidrule, collapse = " "), "\n")

    table_col_spanners <- paste(multicol, cmidrule, collapse = "")

  } else {
    table_col_spanners <- ""
  }

  paste0("\\toprule\n", table_col_spanners, table_col_headings)
}

#' @noRd
create_body_component_l <- function(data) {

  boxh <- dt_boxhead_get(data = data)
  body <- dt_body_get(data = data)

  summaries_present <- dt_summary_exists(data = data)
  list_of_summaries <- dt_summary_df_get(data = data)
  groups_rows_df <- dt_groups_rows_get(data = data)
  stub_components <- dt_stub_components(data = data)

  styles_tbl <- dt_styles_get(data = data)

  n_data_cols <- dt_boxhead_get_vars_default(data = data) %>% length()
  n_rows <- nrow(body)

  # Get the column alignments for the data columns (this
  # doesn't include the stub alignment)
  col_alignment <- boxh[boxh$type == "default", ][["column_align"]]

  # Get the column headings for the visible (e.g., `default`) columns
  default_vars <- dt_boxhead_get_vars_default(data = data)

  if ("rowname" %in% names(body)) {
    default_vars <- c("rowname", default_vars)
  }

  # Determine whether the stub is available through analysis
  # of the `stub_components`
  stub_available <- dt_stub_components_has_rowname(stub_components)

  if (stub_available) {
    n_cols <- n_data_cols + 1
  } else {
    n_cols <- n_data_cols
  }

  # Get the sequence of column numbers in the table body (these
  # are the visible columns in the table exclusive of the stub)
  column_series <- seq(n_cols)

  # Replace an NA group with an empty string
  if (any(is.na(groups_rows_df$group_label))) {

    groups_rows_df <-
      groups_rows_df %>%
      dplyr::mutate(
        group_label = ifelse(
          is.na(group_label), "\\vspace*{-5mm}", group_label)) %>%
      dplyr::mutate(
        group_label = gsub("^NA", "\\textemdash", group_label))
  }

  group_rows <- create_group_rows(n_rows, groups_rows_df)

  if (stub_available && "__GT_ROWNAME_PRIVATE__" %in% names(body)) {
    default_vars <- c("__GT_ROWNAME_PRIVATE__", default_vars)
  }

  # Split `body_content` by slices of rows and create data rows
  body_content <- as.vector(t(body[, default_vars]))
  row_splits <- split(body_content, ceiling(seq_along(body_content) / n_cols))
  data_rows <- create_data_rows(n_rows = n_rows, row_splits)

  summary_rows <-
    create_summary_rows(
      n_rows = n_rows,
      n_cols = n_cols,
      list_of_summaries = list_of_summaries,
      groups_rows_df = groups_rows_df,
      stub_available = stub_available,
      summaries_present = summaries_present
    )

  grand_summary_rows <-
    create_grand_summary_rows(
      n_cols = n_cols,
      list_of_summaries = list_of_summaries,
      stub_available = stub_available
    )

  paste(
    paste(
      paste0(group_rows, data_rows, summary_rows),
      collapse = ""
    ),
    grand_summary_rows,
    collapse = ""
  )
}

#' @noRd
create_table_end_l <- function() {

  paste0(
    "\\bottomrule\n",
    "\\end{longtable}\n",
    collapse = "")
}

#' @noRd
create_footnotes_component_l <- function(data) {

  footnotes_tbl <- dt_footnotes_get(data = data)
  opts_df <- dt_options_get(data = data)

  # If the `footnotes_resolved` object has no
  # rows, then return an empty footnotes component
  if (nrow(footnotes_tbl) == 0) {
    return("")
  }

  footnotes_tbl <-
    footnotes_tbl %>%
    dplyr::select(fs_id, footnotes) %>%
    dplyr::distinct()

  # Get the separator option from `opts_df`
  separator <-
    opts_df %>%
    dplyr::filter(parameter == "footnotes_sep") %>%
    dplyr::pull(value)

  # Convert an HTML break tag to a Latex line break
  separator <-
    separator %>%
    tidy_gsub("<br\\s*?(/|)>", "\\newline") %>%
    tidy_gsub("&nbsp;", " ")

  # Create the footnotes block
  paste0(
    "\\vspace{-5mm}\n",
    "\\begin{minipage}{\\linewidth}\n",
    paste0(
      footnote_mark_to_latex(footnotes_tbl[["fs_id"]]),
      footnotes_tbl[["footnotes"]] %>%
        unescape_html() %>%
        markdown_to_latex(), " \\\\ \n", collapse = ""),
    "\\end{minipage}\n",
    collapse = ""
  )
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
