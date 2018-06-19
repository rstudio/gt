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
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and add a heading
#' # to describe the table
#' tab_create(tbl = mtcars) %>%
#'   theme_striped() %>%
#'   tab_heading(
#'     title = md("Data listing from **mtcars**"),
#'     headnote = md("`mtcars` is an R dataset")
#'     )
#' @importFrom dplyr tibble
#' @export
tab_heading <- function(html_tbl,
                        title,
                        headnote = NULL,
                        table_number = NULL,
                        font = NULL) {

  # Process the `title` text
  title <- title %>% process_text()

  # Process the `headnote` text
  if (is.null(headnote)) {
    headnote <- ""
  } else {
    headnote <-
      headnote %>% process_text()
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
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and add a caption
#' # to describe what is in the stub
#' tab_create(tbl = mtcars) %>%
#'   theme_striped() %>%
#'   tab_stubhead_caption(
#'     caption = md("car *make* and *model*")
#'     ) %>%
#'   cols_align_left(types = "character")
#' @importFrom dplyr tibble
#' @export
tab_stubhead_caption <- function(html_tbl,
                                 caption,
                                 alignment = NULL) {

  # Process the incoming text
  caption <- process_text(text = caption)

  # If alignment is not provided (or if the provided
  # is incorrect), set default alignment to `left`
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
#' @param font the name of the font to use for
#' the specified columns. This could be provided
#' as a vector of fonts where subsequent font names
#' provide fallbacks in the case that fonts are
#' not available.
#' @return an object of class \code{html_table}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and add a source note
#' # to describe the source of the data
#' tab_create(tbl = mtcars) %>%
#'   theme_striped() %>%
#'   tab_source_note(
#'     source_note = md("*Henderson and Velleman* (1981).")
#'     )
#' @importFrom dplyr add_row
#' @importFrom commonmark markdown_html
#' @importFrom stringr str_replace_all
#' @export
tab_source_note <- function(html_tbl,
                            source_note,
                            font = NULL) {

  # Sanitize input text and transform
  # markdown to HTML
  source_note_str <- process_text(text = source_note)

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
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and several footnotes
#' # to explain values in specified cells
#' tab_create(tbl = mtcars) %>%
#'   theme_striped() %>%
#'   tab_footnote(
#'     "Examples of poor gas mileage." =
#'       cells(row = c(22, 23), column = 2)
#'   ) %>%  # 10
#'   tab_footnote(
#'     "Really fast quarter mile" =
#'       cells(row = 18, column = 8)
#'   ) %>%  # 10
#'   tab_footnote(
#'     "Excellent gas mileage." =
#'       cells(row = 12, column = 2)
#'   )
#' @importFrom dplyr tibble arrange bind_rows distinct filter mutate
#' @importFrom commonmark markdown_html
#' @importFrom stringr str_replace_all
#' @export
tab_footnote <- function(html_tbl,
                         glyph = "number",
                         ...) {

  # Create bindings for specific variables
  index <- type <- NULL

  x <- list(...)

  if (is.list(x) &&
      is.list(x[[1]]) == 1 &&
      length(x[[1]]) == 2 &&
      inherits(x[[1]], "helper_cells")) {

    # Get the targeted row/column coordinates
    row <- x[[1]][[1]] %>% as.integer()
    column <- x[[1]][[2]] %>% as.integer()

    # Sanitize footnote text and transform
    # markdown to HTML
    footnote <-
      names(x)[1] %>%
      as.character() %>%
      process_text()
  }

  if (is.list(x) && length(x) == 1 && length(x[[1]]) == 2 && inherits(x[[1]], "numeric")) {

    # Get the targeted row/column coordinates
    row <- x[[1]][[1]] %>% as.integer()
    column <- x[[1]][[2]] %>% as.integer()

    # Sanitize footnote text and transform
    # markdown to HTML
    footnote <-
      names(x) %>%
      process_text()
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

  footnote_listing <-
    footnote_tbl %>%
    dplyr::arrange(row, column) %>%
    dplyr::select(footnote) %>%
    dplyr::distinct()

  footnote_number_tbl <-
    footnote_tbl %>%
    dplyr::arrange(row, column, index) %>%
    dplyr::distinct() %>%
    dplyr::filter(type == "number")

  if (nrow(footnote_number_tbl) > 0) {

    for (i in seq(nrow(footnote_listing))) {

      footnote_number_tbl[which(footnote_number_tbl$footnote %in% footnote_listing[i, 1]), ] <-
        footnote_number_tbl[which(footnote_number_tbl$footnote %in% footnote_listing[i, 1]), ] %>%
        dplyr::mutate(glyph = as.character(i))
    }
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
