#' Generate a HTML fragment for the table heading part
#' @param tbl tbl the table that contains
#' the table caption data.
#' @param font values to be used for the \code{font-family}
#' style property.
#' @param border_top values to be used for the
#' \code{border-top} style property. This allows for
#' a horizontal rule at the top of the table.
#' @param border_bottom values to be used for the
#' \code{border-bottom} style property. This allows
#' for a horizontal rule below the table title or
#' the table headnote.
#' @param title_font_size the font size to use for
#' the table title.
#' @param title_align the alignment of text to use
#' in the table title.
#' @param title_padding the amount of padding to
#' use for the table title.
#' @param headnote_font_size the font size to use for
#' the table headnote.
#' @param headnote_align the alignment of text to use
#' in the table headnote.
#' @param headnote_padding the amount of padding to
#' use for the table headnote.
#' @return an HTML fragment containing the
#' table caption table part.
#' @importFrom commonmark markdown_html
#' @importFrom stringr str_replace_all
#' @noRd
to_html_table_caption <- function(tbl,
                                  font,
                                  border_top = NULL,
                                  border_bottom = NULL,
                                  title_font_size = NULL,
                                  title_align = NULL,
                                  title_padding = NULL,
                                  headnote_font_size = NULL,
                                  headnote_align = NULL,
                                  headnote_padding = NULL) {

  # Set defaults for styles
  border_top = c("solid", "2px", "#A8A8A8")
  border_bottom = c("solid", "2px", "#A8A8A8")
  title_font_size = "125%"
  title_align = "center"
  title_padding = "5px"
  headnote_font_size = "85%"
  headnote_align = "center"
  headnote_padding = "5px"

  # Extract the title and headnote
  title <- tbl$title
  headnote <- tbl$headnote

  # Set the `font-family` attribute
  font_family <-
    paste0("font-family:", font, ";")

  if (!is.null(border_top)) {
    border_top <-
      paste0(
        "border-top:",
        paste(border_top, collapse = " ") %>%
          as.character(),
        ";")
  } else {
    border_top <- NA_character_
  }

  if (!is.null(border_bottom)) {
    border_bottom <-
      paste0(
        "border-bottom:",
        paste(border_bottom, collapse = " ") %>%
          as.character(),
        ";")
  } else {
    border_bottom <- NA_character_
  }

  if (!is.null(title_font_size)) {
    title_font_size <-
      paste0(
        "font-size:",
        paste(title_font_size, collapse = " ") %>%
          as.character(),
        ";")
  } else {
    title_font_size <- NA_character_
  }

  if (!is.null(title_align)) {
    title_align <-
      paste0(
        "text-align:",
        paste(title_align, collapse = " ") %>%
          as.character(),
        ";")
  } else {
    title_align <- NA_character_
  }

  if (!is.null(title_padding)) {
    title_padding <-
      paste0(
        "padding:",
        paste(title_padding, collapse = " ") %>%
          as.character(),
        ";")
  } else {
    title_padding <- NA_character_
  }

  if (!is.null(headnote_font_size)) {
    headnote_font_size <-
      paste0(
        "font-size:",
        paste(headnote_font_size, collapse = " ") %>%
          as.character(),
        ";")
  } else {
    headnote_font_size <- NA_character_
  }

  if (!is.null(headnote_align)) {
    headnote_align <-
      paste0(
        "text-align:",
        paste(headnote_align, collapse = " ") %>%
          as.character(),
        ";")
  } else {
    headnote_align <- NA_character_
  }

  if (!is.null(headnote_padding)) {
    headnote_padding <-
      paste0(
        "padding:",
        paste(headnote_padding, collapse = " ") %>%
          as.character(),
        ";")
  } else {
    headnote_padding <- NA_character_
  }

  # Generate title <caption> statement
  if (is.null(headnote)) {

    if (!all(is.na(c(border_top, border_bottom, title_font_size, title_align, title_padding)))) {
      html_fragment <-
        paste0(
          "<caption style=\"",
          paste(
            c(font_family, border_top, border_bottom, title_font_size, title_align, title_padding)[
              !is.na(c(font_family, border_top, border_bottom, title_font_size, title_align, title_padding))],
            collapse = ""),
          "\">", title, "</caption>\n")
    } else {
      html_fragment <- paste0("<caption>", title, "</caption>\n")
    }
  }

  if (!is.null(headnote) || headnote != "") {

    if (!all(is.na(c(font_family, border_top, title_font_size, title_align, title_padding)))) {

      html_fragment <-
        paste0(
          "<caption style=\"",
          paste(
            c(font_family, border_top, title_font_size, title_align, title_padding)[
              !is.na(c(font_family, border_top, title_font_size, title_align, title_padding))],
            collapse = ""),
          "\">", title, "</caption>\n")

    } else {

      html_fragment <- paste0("<caption>", title, "</caption>\n")
    }
  }

  # Generate headnote <caption> statement
  if (!is.null(headnote)) {

    if (!all(is.na(c(font_family, border_bottom, headnote_font_size, headnote_padding)))) {

      html_fragment <-
        paste(
          html_fragment,
          paste(
            paste0(
              "<caption style=\"",
              c(font_family, border_bottom, headnote_font_size, headnote_align, headnote_padding)[
                !is.na(c(font_family, border_bottom, headnote_font_size, headnote_align, headnote_padding))],
              collapse = ""),
            "\">",
            headnote,
            "</caption>\n"),
          collapse = "")

    } else {

      html_fragment <-
        paste(
          html_fragment,
          paste0("<caption>", headnote, "</caption>\n"),
          collapse = "")
    }
  }

  html_fragment
}

#' Generate a HTML fragment for the source note part
#' @param tbl the table that contains
#' the source note data.
#' @param font the font family to use for the
#' source notes.
#' @param font_size the font size to use for the
#' source notes.
#' @param padding the amount of padding to use for
#' the source notes.
#' @return an HTML fragment containing the
#' source notes table part.
#' @importFrom dplyr arrange mutate pull
#' @importFrom stringr str_squish
#' @importFrom glue glue
#' @noRd
to_html_source_notes <- function(tbl,
                                 span_amount,
                                 font = NULL,
                                 font_size = NULL,
                                 padding = NULL) {

  # Create bindings for specific variables
  index <- source_note <- content <- NULL

  # Ensure that the ordering of the table is correct
  tbl <- tbl %>% dplyr::arrange(index)

  font <- "Helvetica"
  font_size <- "90%"
  padding <- "3px"

  if (!is.null(font)) {
    font_family <-
      paste(font, collapse = " ") %>%
      as.character() %>%
      paste0("font-family:", ., ";")
  } else {
    font_family <- NA_character_
  }

  if (!is.null(font_size)) {
    font_size <-
      paste(font_size, collapse = " ") %>%
      as.character() %>%
      paste0("font-size:", ., ";")
  } else {
    font_size <- NA_character_
  }

  if (!is.null(padding)) {
    padding <-
      paste(padding, collapse = " ") %>%
      as.character() %>%
      paste0("padding:", ., ";")
  } else {
    padding <- NA_character_
  }

  # Generate the styles
  styles_str <-
    paste(
      c(font_family, font_size, padding)[
        !is.na(c(font_family, font_size, padding))],
      collapse = "")

  # Generate the tag content for all source notes
  content_str <-
    tbl %>%
    dplyr::mutate(
      content = source_note %>%
        as.character() %>% stringr::str_squish()) %>%
    dplyr::pull(content)

  # Generate the `html_fragment` object
  html_fragment <-
    paste0(
      "<tfoot>\n",
      glue::glue(
        "<tr>\n<td colspan=\"{span_amount}\" style=\"{styles}\">{content}</td>\n  </tr>\n",
        styles = styles_str,
        content = content_str) %>%
        as.character() %>%
        paste(collapse = "\n"),
      "\n</tfoot>\n")

  html_fragment
}

#' Generate a HTML fragment for the footnote part
#' @param tbl the table that contains
#' the footnote note data.
#' @param font the font family to use for the
#' footnotes.
#' @param font_size the font size to use for the
#' footnotes.
#' @param padding the amount of padding to use for
#' the footnotes.
#' @return an HTML fragment containing the
#' footnotes table part.
#' @importFrom dplyr arrange mutate pull select distinct
#' @importFrom stringr str_squish
#' @importFrom glue glue
#' @noRd
to_html_footnotes <- function(tbl,
                              span_amount,
                              font = NULL,
                              font_size = NULL,
                              padding = NULL) {

  # Create bindings for specific variables
  glyph <- footnote <- content <- NULL

  # Ensure that the ordering of the table is correct
  tbl <-
    tbl %>%
    dplyr::select(glyph, footnote) %>%
    dplyr::arrange(glyph) %>%
    dplyr::distinct()

  if (is.null(font)) {
    font <-
      paste(
        c(default_font_1(), default_font_2(), default_font_3(), default_font_4()),
        collapse = ",")
  } else {
    font <- paste(font, collapse = ",")
  }

  if (is.null(font_size)) {
    font_size <- "90%"
  }

  if (is.null(padding)) {
    padding <- "2px"
  }

  # Generate the styles
  styles_str <-
    paste(
      paste0("font-family:", font, ";"),
      paste0("font-size:", font_size, ";"),
      paste0("padding:", padding, ";"),
      collapse = "")

  # Generate the tag content for all footnotes
  content_str <-
    tbl %>%
    dplyr::mutate(
      content = paste0("<sup style='font-size:65%'><em>", glyph, "</em></sup> ", footnote) %>%
        as.character() %>%
        stringr::str_squish()) %>%
    dplyr::pull(content)

  # Use a one-line style for footnotes
  content_str <- paste(content_str, collapse = "&nbsp;&nbsp;")

  # Generate the `html_fragment` object
  html_fragment <-
    paste0(
      "<tfoot>\n",
      glue::glue(
        "<tr>\n<td colspan=\"{span_amount}\" style=\"{styles}\">{content}</td>\n  </tr>\n",
        styles = styles_str,
        content = content_str) %>%
        as.character() %>%
        paste(collapse = "\n"),
      "\n</tfoot>\n")

  html_fragment
}
