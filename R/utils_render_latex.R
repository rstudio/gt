# Transform a footnote glyph to a Latex representation as a superscript
footnote_glyph_to_latex <- function(footnote_glyph) {

  paste0(
    "\\textsuperscript{", footnote_glyph, "}")
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
create_table_start_l <- function() {

  paste0(
    "\\captionsetup[table]{labelformat=empty}\n",
    "\\begin{table}[h]\n",
    "\\begin{minipage}{\\linewidth}\n",
    collapse = "")
}

#' @noRd
create_tabular_start_l <- function(col_alignment) {

  paste0(
    "\\centering",
    "\\vspace*{-3mm}",
    "\\begin{tabular}{",
    col_alignment %>% substr(1, 1) %>% paste(collapse = ""),
    "}\n",
    "\\toprule\n",
    collapse = "")
}

#' @noRd
create_boxhead_component_l <- function(boxh_df,
                                       output_df,
                                       stub_available,
                                       spanners_present,
                                       stubhead_caption,
                                       col_alignment) {

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

    table_col_spanners <- paste(multicol, cmidrule, collapse = "")

  } else {

    table_col_spanners <- ""
  }

  paste0(table_col_spanners, table_col_headings)
}

#' @importFrom dplyr mutate filter pull
#' @noRd
create_body_component_l <- function(row_splits,
                                    groups_rows_df,
                                    col_alignment,
                                    stub_available,
                                    summaries_present,
                                    list_of_summaries,
                                    n_rows,
                                    n_cols) {

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

  body_rows <- c()
  for (i in 1:n_rows) {

    # Process group rows
    if (!is.null(groups_rows_df) &&
        i %in% groups_rows_df$row) {

      if (i == 1) {

        body_rows <-
          c(body_rows,
            latex_group_row(
              groups_rows_df[which(groups_rows_df$row %in% i), "group_label"][[1]],
              top_border = FALSE))

      } else if (i == n_rows) {

        body_rows <-
          c(body_rows,
            latex_group_row(
              groups_rows_df[which(groups_rows_df$row %in% i), "group_label"][[1]],
              bottom_border = FALSE))

      } else {

        body_rows <-
          c(body_rows,
            latex_group_row(
              groups_rows_df[which(groups_rows_df$row %in% i), "group_label"][[1]]))
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

  paste0(body_rows, collapse = "")
}

#' @noRd
create_tabular_end_l <- function() {

  paste0(
    "\\bottomrule\n",
    "\\end{tabular}\n",
    "\\end{minipage}\n",
    collapse = "")
}

#' @importFrom stats setNames
#' @noRd
create_footnote_component_l <- function(footnotes_resolved,
                                        opts_df) {

  # If the `footnotes_resolved` object has no
  # rows, then return an empty footnotes component
  if (nrow(footnotes_resolved) == 0) {
    return("")
  }

  footnotes_tbl <-
    footnotes_resolved %>%
    dplyr::select(fs_id, text) %>%
    dplyr::distinct()

  # Get the separator option from `opts_df`
  separator <- opts_df %>%
    dplyr::filter(parameter == "footnote_sep") %>%
    dplyr::pull(value)

  # Convert common HTML tags/entities to plaintext
  separator <-
    separator %>%
    tidy_gsub("<br\\s*?(/|)>", "\n") %>%
    tidy_gsub("&nbsp;", " ")

  # Create the footnotes block
  footnote_component <-
    paste0(
      "\\begin{minipage}{\\linewidth}\n",
      paste0(
        footnote_glyph_to_latex(footnotes_tbl[["fs_id"]]),
        footnotes_tbl[["text"]] %>%
          unescape_html() %>%
          escape_latex(), " \\\\ \n", collapse = ""),
      "\\end{minipage}\n", collapse = "")

  footnote_component
}

#' @noRd
create_source_note_component_l <- function(source_note) {

  if (length(source_note) != 0) {

    # Create a source note
    source_note_rows <-
      paste0(
        source_note %>% as.character(), "\\\\ \n",
        collapse = "")
  } else {
    source_note_rows <- ""
  }

  source_note_rows
}

#' @noRd
create_table_end_l <- function() {

  "\\end{table}\n"
}
