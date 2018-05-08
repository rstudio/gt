#' Add a table heading
#'
#' Add a title, headnote, and table number
#' information to the heading part of the table.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param title text to be used in the table title.
#' @param headnote text to be used as the table's
#' headnote.
#' @param table_number a number to use as the
#' table number.
#' @param font the name of the font to use for
#' the specified columns. This could be provided
#' as a vector of fonts where subsequent font names
#' provide fallbacks in the case that fonts are
#' not available.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr tibble
#' @export
tab_heading <- function(html_tbl,
                        title,
                        headnote = NULL,
                        table_number = NULL,
                        font = NULL) {

  if (is.null(headnote)) {
    headnote <- ""
  } else {
    headnote <-
      headnote %>% as.character()
  }

  if (is.null(table_number)) {
    table_number <- ""
  } else {
    table_number <-
      table_number %>% as.character()
  }

  if (is.null(font)) {
    font <- NA_character_
  } else {
    font <-
      font %>%
      paste(collapse = ", ")
  }

  html_tbl[["heading"]] <-
    dplyr::tibble(
      title = title,
      headnote = headnote,
      table_number = table_number,
      font = font)

  html_tbl
}


#' Add caption text to the stubhead
#'
#' Add a caption to the stubhead of a table. If
#' a stub does not exist, no change will be made
#' but a message to this effect will be emitted.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param caption the text to be used as the
#' stubhead caption.
#' @param alignment an option to modify the
#' alignment of the stubhead caption. By
#' default this is \code{left}. Other options
#' are \code{center} and \code{right}.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr tibble
#' @export
tab_stubhead_caption <- function(html_tbl,
                                 caption,
                                 alignment = NULL) {

  if (is.null(alignment) || !(alignment %in% c("left", "center", "right"))) {
    alignment <- "left"
  }

  # Add the stubhead caption, replacing any
  # previously set value
  html_tbl[["stubhead_caption"]] <-
    dplyr::tibble(
      caption_text = caption,
      alignment = alignment)

  html_tbl
}

#' Add a source note citation
#'
#' Add a source note citation to the source note
#' part of the table.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param source_note text to be used in the
#' source note.
#' @param lead_in a lead in word or phrase
#' indicating the citation as the source of the
#' tabulated data.
#' @param font the name of the font to use for
#' the specified columns. This could be provided
#' as a vector of fonts where subsequent font names
#' provide fallbacks in the case that fonts are
#' not available.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr add_row
#' @importFrom commonmark markdown_html
#' @importFrom stringr str_replace_all
#' @export
tab_source_note <- function(html_tbl,
                            source_note,
                            lead_in = NULL,
                            font = NULL) {

  source_note_str <-
    source_note %>%
    as.character() %>%
    commonmark::markdown_html() %>%
    stringr::str_replace_all("^<p>|</p>|\n", "")

  if (!is.null(lead_in)) {

    lead_in_str <-
      lead_in %>% as.character() %>%
      commonmark::markdown_html() %>%
      stringr::str_replace_all("^<p>|</p>|\n", "")

  } else {
    lead_in_str <- ""
  }

  if (is.null(font)) {

    font <- NA_character_
  } else {
    font <-
      font %>%
      paste(collapse = ", ")
  }

  html_tbl[["source_note"]] <-
    html_tbl[["source_note"]] %>%
    dplyr::add_row(
      index = (nrow(html_tbl[["source_note"]]) + 1L),
      source_note = source_note_str,
      lead_in = lead_in_str,
      font = font)

  html_tbl
}

#' Add one or more footnotes
#'
#' Add a footnote with a glyph attached to the
#' targeted cells, rows, or columns.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param glyph the type of glyph or the literal
#' glyph to associate with the targeted cells,
#' rows, or columns.
#' @param ... a series of named vectors for
#' specifying the mappings between footnotes and
#' the targeted cells, rows, or columns.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr tibble arrange bind_rows distinct filter mutate
#' @importFrom commonmark markdown_html
#' @importFrom stringr str_replace_all
#' @export
tab_footnote <- function(html_tbl,
                         glyph = "number",
                         ...,
                         .row = NULL,
                         .column = NULL) {


  x <- list(...)

  if (is.list(x) && is.list(x[[1]]) == 1 && length(x[[1]]) == 2) {

    row <- x[[1]][[1]] %>% as.integer()
    column <- x[[1]][[2]] %>% as.integer()
    footnote <-
      names(x)[1] %>%
      as.character() %>%
      commonmark::markdown_html() %>%
      stringr::str_replace_all("^<p>|</p>|\n", "")
  }

  if (is.list(x) && length(x) == 1 && length(x[[1]]) == 2 && inherits(x[[1]], "numeric")) {

    row <- x[[1]][[1]] %>% as.integer()
    column <- x[[1]][[2]] %>% as.integer()
    footnote <-
      names(x) %>%
      as.character() %>%
      commonmark::markdown_html() %>%
      stringr::str_replace_all("^<p>|</p>|\n", "")
  }

  footnote_tbl <-
    dplyr::bind_rows(
      html_tbl[["footnote"]],
      dplyr::tibble(
        index = (nrow(html_tbl[["footnote"]]) + 1L),
        type = glyph,
        glyph = glyph,
        row = row,
        column = column,
        footnote = footnote))

  footnote_number_tbl <-
    footnote_tbl %>%
    dplyr::arrange(row, column, index) %>%
    dplyr::distinct() %>%
    dplyr::filter(type == "number")

  if (nrow(footnote_number_tbl) > 0) {
    footnote_number_tbl <-
      footnote_number_tbl %>%
      dplyr::mutate(glyph = seq(nrow(footnote_number_tbl)) %>% as.character())
  }

  footnote_character_tbl <-
    footnote_tbl %>%
    dplyr::arrange(row, column, index) %>%
    dplyr::distinct() %>%
    dplyr::filter(type == "character")

  if (nrow(footnote_character_tbl) > 0) {
    footnote_character_tbl <-
      footnote_character_tbl %>%
      dplyr::mutate(glyph = letters[seq(nrow(footnote_character_tbl))])
  }

  footnote_tbl <-
    dplyr::bind_rows(
      footnote_number_tbl,
      footnote_character_tbl) %>%
    dplyr::arrange(row, column, index) %>%
    dplyr::distinct()

  html_tbl[["footnote"]] <- footnote_tbl
  html_tbl
}
