latex_cache <- new.env(parent = emptyenv())
latex_cache$shrink <- NULL
latex_cache$line.breaks <- TRUE
latex_cache$column.sep <- NULL
latex_cache$footnotes.align <- 'l'
latex_cache$sourcenotes.align <- 'l'
latex_cache$env <- rlang::caller_env()


#' Clear cache for test chart and package info
#'
reset_latex_cache <- function() {
  latex_cache$shrink <- NULL
  latex_cache$line.breaks <- TRUE
  latex_cache$column.sep <- NULL
  latex_cache$footnotes.align <- 'l'
  latex_cache$sourcenotes.align <- 'l'
}

#' @export
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
