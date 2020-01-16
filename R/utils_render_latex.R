
# Create a vector of LaTeX packages to use as table dependencies
latex_packages <- function() {
  c("amsmath", "booktabs", "caption", "longtable", "xcolor")
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
                            bottom_border = TRUE,
                            n_cols) {

  multi <- paste0("\\multicolumn{", n_cols, "}{l}{")
  paste0(
    ifelse(top_border, "\\midrule\n", ""),
    multi, group_name,
    "} \\\\ \n",
    ifelse(bottom_border, "\\midrule\n", ""),
    collapse = "")
}

#' @noRd
create_table_start_l <- function(data){
  header <- calc_column_width_l(data = data)
  separation <- '\\setlength{\\tabcolsep}{2pt}\n'
  if(is.na(header$type_size)){
    separation <- '\\setlength{\\tabcolsep}{3pt}\n'
    header$type_size <- ''
  }
  paste0(
    header$type_size,
    '\\setlength\\LTleft{-2.5cm}\n',
    '\\setlength\\LTright{0pt plus 1fill minus 1fill}\n',
    '\\setlength\\LTcapwidth{18cm}\n',
    separation,
    '\\captionsetup[table]{labelformat=empty,skip=0pt}\n',
    header$header
  )
}
# create_table_start_l <- function(data) {
#
#   col_alignment <-
#     dt_boxhead_get(data = data) %>%
#     dplyr::filter(type == "default") %>%
#     dplyr::pull(column_align)
#
#   # TODO: ensure that number of alignment tabs is correct
#   if (dt_stub_df_exists(data = data)) {
#     col_alignment <- c("left", col_alignment)
#   }
#
#   paste0(
#     "\\captionsetup[table]{labelformat=empty,skip=1pt}\n",
#     "\\begin{longtable}{",
#     col_alignment %>% substr(1, 1) %>% paste(collapse = ""),
#     "}\n",
#     collapse = ""
#   )
# }

#' Create the columns component of a table
#'
#' @noRd
create_columns_component_l <- function(data) {

  boxh <- dt_boxhead_get(data = data)
  stubh <- dt_stubhead_get(data = data)
  stub_available <- dt_stub_df_exists(data = data)
  spanners_present <- dt_spanners_exists(data = data)
  styles_tbl <- dt_styles_get(data = data)

  # Get the headings
  #headings <- boxh$column_label %>% unlist()

  headings_vars <- boxh %>% dplyr::filter(type == "default") %>% dplyr::pull(var)
  headings_labels <- dt_boxhead_get_vars_labels_default(data = data)
  headings_labels <- purrr::map_chr(headings_labels, function(.){fmt_latex_math(gsub("\\", "", ., fixed=TRUE))})

  key <- as.list(headings_labels)
  names(key) <- headings_vars
  headings_labels <- lapply(headings_vars, latex_style_headings, styles_df = styles_tbl, key = key)  %>% unlist(use.names = FALSE)

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

    stubl <- fmt_latex_math(gsub("\\", "", stubh$label, fixed=TRUE))
    stublabel <- style_stubhead_l(styles_tbl, stubl)

    headings_labels <- prepend_vec(headings_labels, stublabel)
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

    # Promote column labels to the group level wherever the
    # spanner label is NA
    spanners[is.na(spanners)] <- headings_vars[is.na(spanners)]

    if (stub_available) {
      spanners <- c(NA_character_, spanners)
    }

    spanners_lengths <- rle(spanners)

    multicol <- c()
    cmidrule <- c()

    spanners_lengths$values <- purrr::map_chr(spanners_lengths$values, function(.){
      if(is.na(.)){
        ''
      } else {
        latex_style_spanners(fmt_latex_math(gsub("\\", "", ., fixed=TRUE)), styles_df = styles_tbl)
      }
    })

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
create_body_component_l <- function(data) {

  boxh <- dt_boxhead_get(data = data)
  styles_tbl <- dt_styles_get(data = data)
  body <- dt_body_get(data = data)
  summaries_present <- dt_summary_exists(data = data)
  list_of_summaries <- dt_summary_df_get(data = data)
  groups_rows_df <- dt_groups_rows_get(data = data)
  stub_components <- dt_stub_components(data = data)

  n_data_cols <- dt_boxhead_get_vars_default(data = data) %>% length()
  n_rows <- nrow(body)

  # Get the column alignments for the data columns (this
  # doesn't include the stub alignment)
  col_alignment <-
    boxh %>%
    dplyr::filter(type == "default") %>%
    dplyr::pull(column_align)

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
  if (any(is.na(groups_rows_df$group))) {

    groups_rows_df <-
      groups_rows_df %>%
      dplyr::mutate(
        group_label = ifelse(
          is.na(group_label), "\\vspace*{-5mm}", group_label)) %>%
      dplyr::mutate(
        group_label = gsub("^NA", "\\textemdash", group_label))
  }

  groups_rows_df$group_label <- purrr::map_chr(groups_rows_df$group_label, function(.){style_group_rows_latex(fmt_latex_math(.),  styles_tbl)})
  group_rows <- create_group_rows(n_rows, groups_rows_df, context = "latex", n_cols = n_cols)

  if (stub_available) {
    default_vars <- c("::rowname", default_vars)

    body <-
      dt_stub_df_get(data = data) %>%
      dplyr::select(rowname) %>%
      dplyr::rename(`::rowname` = rowname) %>%
      cbind(body)
  }


  # Split `body_content` by slices of rows and create data rows
  body_content <- as.vector(t(body[, default_vars]))
  body_content <- purrr::map_chr(body_content, function(.){fmt_latex_math(gsub("\\", "", ., fixed=TRUE))})
  row_splits <- split(body_content, ceiling(seq_along(body_content) / n_cols))
  row_splits <- style_data_latex(row_splits, styles_tbl)
  data_rows <- create_data_rows(n_rows, row_splits, context = "latex")

  summary_rows <-
    create_summary_rows(
      n_rows = n_rows,
      n_cols = n_cols,
      list_of_summaries = list_of_summaries,
      groups_rows_df = groups_rows_df,
      stub_available = stub_available,
      summaries_present = summaries_present,
      context = "latex"
    )

  summary_rows <- purrr::map_chr(summary_rows, fmt_latex_math)
  paste0(paste(collapse = "", paste0(group_rows, data_rows, summary_rows)), "\\bottomrule\n \\\\ \n")
}

#' @noRd
create_table_end_l <- function() {

  paste0(
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
    "\\begin{minipage}{18cm}\n",
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
      "\\begin{minipage}{18cm}\n",
      paste0(
        source_note %>% as.character(), "\\\\ \n", collapse = ""),
      "\\end{minipage}\n", collapse = "")

  source_note_component
}
