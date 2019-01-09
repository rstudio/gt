#' Save a \pkg{gt} table as a file
#'
#' The \code{gtsave()} function makes it easy to save a \pkg{gt} table to a
#' file. The function guesses the file type by the extension provided in the
#' output filename. It's also possible to create a custom output solution by
#' providing a function to the \code{save_fn} argument. Just be sure to use
#' \code{(data, filename, ...)} in the function signature.
#' @param data a table object that is created using the \code{\link{gt}()}
#'   function.
#' @param filename the file name to create on disk. Ensure that an extension
#'   compatible with the output types is provided (\code{.html}, \code{.tex},
#'   \code{.ltx}, \code{.rtf}). If a custom save function is provided then the
#'   file extension is disregarded.
#' @param save_fn a custom save function to allow for saving the table object
#'   through some means not already provided.
#' @param ... all other options passed to the \code{save_fn} function.
#' @export
gtsave <- function(data, filename, save_fn = NULL, ...) {

  # Input object validation
  stop_if_not_gt(data)

  # Filename parsing and method selection
  if (is.function(save_fn)) {

    return(save_fn(data, filename, ...))
  }

  # Attach extension as the first class value
  class(data) <- c(gtsave_file_ext(filename), class(data))

  UseMethod("gtsave", data)
}

gtsave.default <- gtsave.gt_tbl <- function(data, filename, ...) {

  stop("`gtsave.", gtsave_file_ext(filename),
       "(data, filename, ...)` has not been implemented.",
       call. = FALSE)
}

#' @importFrom htmltools as.tags save_html
#' @export
#' @noRd
gtsave.html <- function(data, filename, ..., inline_css = TRUE) {

  data %>%
    htmltools::as.tags() %>%
    htmltools::save_html(filename)
}

#' @export
#' @noRd
gtsave.tex <- function(data, filename, ...) {

  data %>%
    as_latex() %>%
    writeLines(con = filename)
}

#' @export
#' @noRd
gtsave.rtf <- function(data, filename, ...) {

  data %>%
    as_rtf() %>%
    writeLines(con = filename)
}

#' @export
#' @noRd
gtsave.htm <- gtsave.html

#' @export
#' @noRd
gtsave.ltx <- gtsave.tex

#' @export
#' @noRd
gtsave.rnw <- gtsave.tex

#' @importFrom tools file_ext
#' @noRd
gtsave_file_ext <- function(filename) {

  tools::file_ext(filename) %>% tolower()
}
