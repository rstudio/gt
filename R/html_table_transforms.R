

#' HTT: apply_alignment_left()
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @return an object of class \code{html_table}.
#' @noRd
htt_alignment_left <- function(html_tbl,
                               transform) {

  if (is.na(transform)) {

    html_tbl <-
      html_tbl %>%
      add_column_style(
        property = "text-align",
        values = "left")

    return(html_tbl)
  }
}

#' HTT: apply_alignment_...()
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr filter pull
#' @noRd
htt_alignment <- function(html_tbl,
                          transform,
                          align_type) {

  if (is.na(transform)) {

    html_tbl <-
      html_tbl %>%
      add_column_style(
        property = "text-align",
        values = align_type)

    return(html_tbl)

  } else {

    transform_vector <-
      decode_col_type_transform(
        transform_text = transform)

    if (names(transform_vector)[1] == "column") {

      html_tbl <-
        html_tbl %>%
        add_column_style(
          columns = transform_vector %>% unname(),
          property = "text-align",
          values = align_type)

      return(html_tbl)
    }

    if (names(transform_vector)[1] == "type") {

      column_indices <- vector(mode = "integer")

      if ("numeric" %in% transform_vector) {

      # Get column indices for numeric columns
        column_indices <-
          c(column_indices,
            html_tbl[["html_table"]] %>%
              dplyr::filter(row > 0) %>%
              dplyr::filter(type == "numeric") %>%
              dplyr::pull(column) %>%
              unique())
      }

      if ("integer" %in% transform_vector) {

        # Get column indices for numeric columns
        column_indices <-
          c(column_indices,
            html_tbl[["html_table"]] %>%
              dplyr::filter(row > 0) %>%
              dplyr::filter(type == "integer") %>%
              dplyr::pull(column) %>%
              unique())
      }

      if ("character" %in% transform_vector) {

        # Get column indices for numeric columns
        column_indices <-
          c(column_indices,
            html_tbl[["html_table"]] %>%
              dplyr::filter(row > 0) %>%
              dplyr::filter(type == "character") %>%
              dplyr::pull(column) %>%
              unique())
      }

      if (length(column_indices) > 0) {

        html_tbl <-
          html_tbl %>%
          add_column_style(
            columns = column_indices,
            property = "text-align",
            values = align_type)
      }

      return(html_tbl)
    }
  }
}


#' HTT: apply_theme_striped()
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @return an object of class \code{html_table}.
#' @noRd
htt_theme_striped <- function(html_tbl) {

  html_tbl %>%
    add_table_style(
      property = "border-collapse",
      values = "collapse") %>%
    add_table_style(
      property = "width",
      values = "100%") %>%
    add_style_to_row_0(
      property = "border-bottom",
      values = "2px solid #A8A8A8") %>%
    add_style_to_row_0(
      property = "border-top",
      values = "2px solid #A8A8A8") %>%
    add_style_to_row_0(
      property = "padding",
      values = "10px") %>%
    add_style_to_row_0(
      property = "margin",
      values = "10px") %>%
    add_style_to_rows(
      property = "padding",
      values = "10px") %>%
    add_style_to_rows(
      property = "padding",
      values = "10px") %>%
    add_style_to_row_n(
      property = "border-bottom",
      values = "2px solid #A8A8A8") %>%
    add_style_every_n_rows(
      every_n = 2,
      property = "background",
      values = "#E5E6EB")
}

#' HTT: apply_theme_minimal()
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @return an object of class \code{html_table}.
#' @noRd
htt_theme_minimal <- function(html_tbl) {

  html_tbl %>%
    add_table_style(
      property = "border-collapse",
      values = "collapse") %>%
    add_table_style(
      property = "width",
      values = "100%") %>%
    add_style_to_row_0(
      property = "border-bottom",
      values = "2px solid #A8A8A8") %>%
    add_style_to_row_0(
      property = "border-top",
      values = "2px solid #A8A8A8") %>%
    add_style_to_row_0(
      property = "padding",
      values = "10px") %>%
    add_style_to_row_0(
      property = "margin",
      values = "10px") %>%
    add_style_to_rows(
      property = "padding",
      values = "10px") %>%
    add_style_to_rows(
      property = "padding",
      values = "10px") %>%
    add_style_to_row_n(
      property = "border-bottom",
      values = "2px solid #A8A8A8")
}

#' HTT: apply_theme_classical()
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @return an object of class \code{html_table}.
#' @noRd
htt_theme_classical <- function(html_tbl) {

  html_tbl %>%
    add_table_style(
      property = "border-collapse",
      values = "collapse") %>%
    add_table_style(
      property = "width",
      values = "100%") %>%
    add_style_to_row_0(
      property = "border-bottom",
      values = "2px solid #A8A8A8") %>%
    add_style_to_row_0(
      property = "border-top",
      values = "4px double #A8A8A8") %>%
    add_style_to_column_0(
      property = "border-right",
      values = "2px solid #A8A8A8") %>%
    add_style_to_columns(
      property = "border-right",
      values = "2px solid #A8A8A8",
      include_col_n = FALSE) %>%
    add_style_to_row_0(
      property = "padding",
      values = "10px") %>%
    add_style_to_row_0(
      property = "margin",
      values = "10px") %>%
    add_style_to_rows(
      property = "padding",
      values = "3px") %>%
    add_style_to_rows(
      property = "padding",
      values = "3px") %>%
    add_style_to_row_n(
      property = "border-bottom",
      values = "2px solid #A8A8A8")
}


#' HTT: add_stubhead_caption()
#' @param html_table_component the HTML table
#' component that contains style attribute columns.
#' @param caption_text the text to be used as the
#' stubhead caption.
#' @param alignment the alignment of the
#' stubhead caption.
#' @importFrom dplyr mutate case_when
#' @noRd
htt_add_stubhead_caption <- function(html_table_component,
                                     caption_text,
                                     alignment) {

  html_table_component <-
    html_table_component %>%
    dplyr::mutate(content = case_when(
      t_subpart == "stubhead" ~ caption_text,
      is.character(t_subpart) ~ content))


  if ("text-align" %in% colnames(html_table_component)) {

    html_table_component <-
      html_table_component %>%
      dplyr::mutate(`text-align` = case_when(
        t_subpart == "stubhead" ~ alignment,
        is.character(t_subpart) ~ `text-align`))

  } else {

    html_table_component <-
      html_table_component %>%
      dplyr::mutate(`text-align` = case_when(
        t_subpart == "stubhead" ~ alignment))
  }

  html_table_component
}
