
#' Collapse all styles provided as individual columns
#' to a single `style_attrs` column with a style information
#' for each table cell
#' @noRd
transmute_style_attrs <- function(html_table_component) {

  col_begin_styles <- 8

  if (ncol(html_table_component) >= col_begin_styles) {

    for (i in col_begin_styles:ncol(html_table_component)) {

      if (i == col_begin_styles) {
        style_names <- colnames(html_table_component)[col_begin_styles:ncol(html_table_component)]
      }

      for (j in 1:nrow(html_table_component)) {

        if (is.na(html_table_component[j, i])) {

          html_table_component[j, i] <- ""

        } else {

          html_table_component[j, i] <-
            paste0(colnames(html_table_component)[i], ":", html_table_component[j, i] %>% dplyr::pull(), ";")
        }
      }
    }
  }

  if (ncol(html_table_component) >= col_begin_styles) {

    table_content_styles <-
      html_table_component %>%
      tidyr::unite(col = style_attrs, col_begin_styles:ncol(html_table_component), sep = "")

  } else {

    table_content_styles <-
      html_table_component %>%
      dplyr::mutate(style_attrs = "")
  }

  table_content_styles
}
