#' Interpret input text as Markdown-formatted text
#' @param text the text that is understood to contain
#' Markdown formatting.
#' @return a character object that is tagged for
#' a Markdown to HTML transformation.
#' @export
md <- function(text) {

  # Apply the `from_markdown` class
  attr(text, "class") <- "from_markdown"

  text
}

#' Interpret input text as HTML-formatted text
#' @param text the text that is understood to be
#' HTML text, which is to be preserved.
#' @return a character object that is tagged as an
#' HTML fragment that is not to be santized.
#' @export
html <- function(text) {

  # Apply the `from_markdown` class
  attr(text, "class") <- "preserve_html"

  text
}
