latex_cache <- new.env(parent = emptyenv())
latex_cache$shrink <- NULL
latex_cache$line.breaks <- TRUE
latex_cache$column.sep <- NULL
latex_cache$footnotes.align <- 'l'
latex_cache$sourcenotes.align <- 'l'
latex_cache$env <- rlang::caller_env()


# Clear cache for test chart and package info
reset_latex_cache <- function() {
  latex_cache$shrink <- NULL
  latex_cache$line.breaks <- TRUE
  latex_cache$column.sep <- NULL
  latex_cache$footnotes.align <- 'l'
  latex_cache$sourcenotes.align <- 'l'
}

#' Additional formatting options for as_latex()
#' @param shrink The percentage to shrink the width by. Accepts a value < 1. Default is to stretch the table to full width of the page.
#' @param line.breaks Allow/do not allow line breaks in the table. Default is to allow for line breaks under two circumstances: 1.) When the text of the table at the smallest point size (5pt) cannot fit to the width of the page. 2.) A minimal number of line breaks are required to make point size larger. In the first condition, setting this parameter to FALSE will not affect the output. In the second, the font size will be scaled down to remove the minimal breaks.
#' @param column.sep set the column separator
#' @param footnotes.align direction to align footnotes
#' @param sourcenotes.align direction to align footnotes
#' @export
#'
latex_tab.options <- function(shrink = NULL,
                              line.breaks = TRUE,
                              column.sep = NULL,
                              footnotes.align = 'l',
                              sourcenotes.align = 'l'){

  latex_cache$shrink <- shrink
  latex_cache$line.breaks <- line.breaks
  latex_cache$column.sep <- column.sep
  latex_cache$footnotes.align <- footnotes.align
  latex_cache$sourcenotes.align <- sourcenotes.align
}
