#' Generate a HTML fragment for the table heading part
#' @param title the text to be used in the table title.
#' @param headnote optional text to be used in the
#' table headnote.
#' @param border_top values to be used for the
#' \code{border-top} style property. This allows for
#' a horizontal rule at the top of the table.
#' @param border_bottom values to be used for the
#' \code{border-bottom} style property. This allows
#' for a horizontal rule below the table title or
#' the table headnote.
#' @param title_font_size the font size to use for
#' the table title.
#' @param title_padding the amount of padding to
#' use for the table title.
#' @param headnote_font_size the font size to use for
#' the table headnote.
#' @param headnote_padding the amount of padding to
#' use for the table headnote.
#' @return a character object with an HTML fragment.
generate_table_caption <- function(title,
                                   headnote = NULL,
                                   border_top = c("solid", "2px", "#A8A8A8"),
                                   border_bottom = c("solid", "2px", "#A8A8A8"),
                                   title_font_size = "115%",
                                   title_align = "center",
                                   title_padding = "3px",
                                   headnote_font_size = "85%",
                                   headnote_align = "center",
                                   headnote_padding = "3px") {


 if (!is.null(border_top)) {
  border_top <-
   paste(border_top, collapse = " ") %>%
   as.character() %>%
   paste0("border-top:", ., ";")
 } else {
  border_top <- NA_character_
 }

 if (!is.null(border_bottom)) {
  border_bottom <-
   paste(border_bottom, collapse = " ") %>%
   as.character() %>%
   paste0("border-bottom:", ., ";")
 } else {
  border_bottom <- NA_character_
 }

 if (!is.null(title_font_size)) {
  title_font_size <-
   paste(title_font_size, collapse = " ") %>%
   as.character() %>%
   paste0("font-size:", ., ";")
 } else {
  title_font_size <- NA_character_
 }

 if (!is.null(title_align)) {
   title_align <-
      paste(title_align, collapse = " ") %>%
      as.character() %>%
      paste0("text-align:", ., ";")
  } else {
    title_align <- NA_character_
  }

 if (!is.null(title_padding)) {
  title_padding <-
   paste(title_padding, collapse = " ") %>%
   as.character() %>%
   paste0("padding:", ., ";")
 } else {
  title_padding <- NA_character_
 }

 if (!is.null(headnote_font_size)) {
  headnote_font_size <-
   paste(headnote_font_size, collapse = " ") %>%
   as.character() %>%
   paste0("font-size:", ., ";")
 } else {
  headnote_font_size <- NA_character_
 }

  if (!is.null(headnote_align)) {
    headnote_align <-
      paste(headnote_align, collapse = " ") %>%
      as.character() %>%
      paste0("text-align:", ., ";")
  } else {
    headnote_align <- NA_character_
  }

 if (!is.null(headnote_padding)) {
  headnote_padding <-
   paste(headnote_padding, collapse = " ") %>%
   as.character() %>%
   paste0("padding:", ., ";")
 } else {
  headnote_padding <- NA_character_
 }

 # Generate title <caption> statement
 if (is.null(headnote)) {

  if (!all(is.na(c(border_top, border_bottom, title_font_size, title_align, title_padding)))) {
   caption <-
    paste(
     c(border_top, border_bottom, title_font_size, title_align, title_padding)[
      !is.na(c(border_top, border_bottom, title_font_size, title_align, title_padding))],
     collapse = "") %>%
    paste0("<caption style=\"", ., "\">", title, "</caption>\n")
  } else {
   caption <- paste0("<caption>", title, "</caption>\n")
  }
 }

 if (!is.null(headnote) || headnote != "") {

  if (!all(is.na(c(border_top, title_font_size, title_align, title_padding)))) {

   caption <-
    paste(
     c(border_top, title_font_size, title_align, title_padding)[
      !is.na(c(border_top, title_font_size, title_align, title_padding))],
     collapse = "") %>%
    paste0("<caption style=\"", ., "\">", title, "</caption>\n")

  } else {

   caption <- paste0("<caption>", title, "</caption>\n")

  }
 }

 # Generate headnote <caption> statement
 if (!is.null(headnote)) {

  if (!all(is.na(c(border_bottom, headnote_font_size, headnote_padding)))) {

   caption <-
    paste(
     caption,
     paste(
      c(border_bottom, headnote_font_size, headnote_align, headnote_padding)[
       !is.na(c(border_bottom, headnote_font_size, headnote_align, headnote_padding))],
      collapse = "") %>%
      paste0("<caption style=\"", ., "\">", headnote, "</caption>\n"),
     collapse = "")

  } else {

   caption <-
    paste(
     caption,
     paste0("<caption>", headnote, "</caption>\n"),
     collapse = "")
  }
 }

 caption
}
