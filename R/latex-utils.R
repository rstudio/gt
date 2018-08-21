#' @importFrom stats setNames
#' @noRd
create_footnote_component_latex <- function(data_attr,
                                            list_footnotes,
                                            body_content,
                                            n_cols) {

  if (is.null(data_attr$footnote)) {
    return(
      list(footnote_component = "",
           body_content = body_content))
  }

  glyphs_footnotes <- c()

  for (i in seq(list_footnotes$footnotes)) {

    if (any(!is.na(list_footnotes$footnotes[[i]]))) {

      footnote_glyph <- c()
      footnote_indices <- list_footnotes$footnotes[[i]]

      for (j in seq(footnote_indices)) {

        footnote_text <-
          data_attr$footnote[[1]][
            which(names(data_attr$footnote[[1]]) == footnote_indices[j])] %>%
          unname()

        # Check if the footnote text has been seen before
        if (!(footnote_text %in% glyphs_footnotes)) {
          glyphs_footnotes <-
            c(glyphs_footnotes, stats::setNames(footnote_text, footnote_indices[j]))
        }

        footnote_glyph <-
          c(footnote_glyph, unname(which(glyphs_footnotes == footnote_text)))
      }

      body_content[i] <-
        paste0(body_content[i], " (", paste(footnote_glyph, collapse = ","), ")")
    }
  }


  body_content
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
