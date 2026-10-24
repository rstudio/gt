#------------------------------------------------------------------------------#
#
#                /$$
#               | $$
#     /$$$$$$  /$$$$$$
#    /$$__  $$|_  $$_/
#   | $$  \ $$  | $$
#   | $$  | $$  | $$ /$$
#   |  $$$$$$$  |  $$$$/
#    \____  $$   \___/
#    /$$  \ $$
#   |  $$$$$$/
#    \______/
#
#  This file is part of the 'rstudio/gt' project.
#
#  Copyright (c) 2018-2026 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


check_quarto <- function() {
  Sys.getenv("QUARTO_BIN_PATH") != ""
}

process_md_quarto <- function(text, md_engine_fn) {
  # exclude "" and NA #1769
  non_na_text <- text[nzchar(text, keepNA = FALSE)]

  non_na_text_processed <-
    vapply(
      non_na_text,
      FUN.VALUE = character(1L),
      USE.NAMES = FALSE,
      FUN = function(text) {
        md_engine_fn[[1]](text = text)
      }
    )

  # Remove paragraph
  non_na_text_processed <- gsub("^<p>|</p>\n$", "", non_na_text_processed)

  # Use base64 encoding on the unprocessed text
  # https://github.com/quarto-dev/quarto-cli/issues/11932#issuecomment-2609871584
  # to avoid issues with escaping internal double
  # quotes; used in conjunction with the 'data-qmd-base64' attribute
  # that is recognized by Quarto
  non_na_text <-
    vapply(
      non_na_text,
      FUN.VALUE = character(1L),
      USE.NAMES = FALSE,
      FUN = function(text) {
        # charToRaw("") returns character(0)
        base64enc::base64encode(charToRaw(as.character(text)))
      }
    )

  # Tweak start and end of non_na_text
  # Use block containers when Markdown contains block-level HTML; Quarto
  # otherwise parses lists as inline content and duplicates their text.
  block_tags <-
    paste0(
      "address|article|aside|blockquote|div|dl|fieldset|figure|footer|",
      "h[1-6]|header|hr|main|nav|ol|p|pre|section|table|ul"
    )

  block_content <-
    grepl(
      paste0("<(", block_tags, ")([[:space:]>])"),
      non_na_text_processed
    )

  container_tag <- ifelse(block_content, "div", "span")

  non_na_text <-
    paste0(
      "<", container_tag, " data-qmd-base64=\"", non_na_text, "\">"
    )

  non_na_text <-
    paste0(
      non_na_text, "<", container_tag, " class='gt_from_md'>",
      non_na_text_processed, "</", container_tag, "></", container_tag, ">"
    )

  text[nzchar(text, keepNA = FALSE)] <- non_na_text
  text
}
