#' @importFrom stats setNames
#' @noRd
create_footnote_component_latex <- function(footnotes_resolved,
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
create_boxhead_component_latex <- function(boxh_df,
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
latex_head <- function() {

  paste0(
    "\\captionsetup[table]{labelformat=empty}\n",
    "\\begin{table}[h]\n",
    "\\begin{minipage}{\\linewidth}\n",
    collapse = "")
}

#' @noRd
latex_bottom_table <- function() {
  "\\bottomrule\n"
}

#' @noRd
latex_tail <- function() {

  paste0(
    "\\end{tabular}\n",
    "\\end{minipage}\n",
    collapse = "")
}

#' @noRd
latex_end_table <- function() {

  "\\end{table}\n"
}

#' @noRd
latex_tabular <- function(col_alignment) {

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
latex_title <- function(title) {

  paste0("\\caption{", title, "}\n")
}

#' @noRd
latex_heading_row <- function(content) {

  paste0(
    paste(paste(content, collapse = " & "), "\\\\ \n"),
    "\\midrule\n",
    collapse = "")
}
