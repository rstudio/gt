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
          remove_html() %>%
          tidy_gsub("_", "\\\\_"),  " \\\\ \n", collapse = ""),
      "\\end{minipage}\n", collapse = "")

  footnote_component
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
    "\\begin{table}[h]\n",
    collapse = "")
}

#' @noRd
latex_tail <- function() {

  paste0(
    "\\bottomrule\n",
    "\\end{tabular}\n",
    "\\end{minipage}\n",
    "\\end{table}\n",
    collapse = "")
}

#' @noRd
latex_tabular <- function(col_alignment) {

  paste0(
    "\\begin{minipage}{\\linewidth}\n",
    "\\centering",
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

latex_heading_row <- function(content) {

  paste0(
    paste(paste(content, collapse = " & "), "\\\\ \n"),
    "\\midrule\n",
    collapse = "")
}
