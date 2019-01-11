#' Save a \pkg{gt} table as a file
#'
#' The \code{gtsave()} function makes it easy to save a \pkg{gt} table to a
#' file. The function guesses the file type by the extension provided in the
#' output filename, producing either an HTML, LaTeX, or RTF file.
#'
#' Output filenames with either the \code{.html} or \code{.htm} extensions will
#' produce an HTML document. In this case, we can pass a \code{TRUE} or
#' \code{FALSE} value to the \code{inline_css} option to obtain an HTML document
#' with inlined CSS styles (the default is \code{FALSE}). More details on CSS
#' inlining are available at \code{\link{as_raw_html}()}.
#'
#' If the output filename is either of \code{.tex}, \code{.ltx}, or \code{.rnw},
#' a LaTeX document is produced. An output filename of \code{.rtf} will generate
#' an RTF document. The LaTeX and RTF saving function don't have any options to
#' pass to \code{...}.
#'
#' @param data a table object that is created using the \code{\link{gt}()}
#'   function.
#' @param filename the file name to create on disk. Ensure that an extension
#'   compatible with the output types is provided (\code{.html}, \code{.tex},
#'   \code{.ltx}, \code{.rtf}). If a custom save function is provided then the
#'   file extension is disregarded.
#' @param ... all other options passed to the appropriate internal saving
#'   function.
#' @export
gtsave <- function(data, filename, ...) {

  # Input object validation
  stop_if_not_gt(data)

  # Get the lowercased file extension
  file_ext <- gtsave_file_ext(filename)

  # Stop function if a file extension is not provided
  if (file_ext == "") {

    stop("A file extension is required in the provided filename.\n",
         " * We can use `", filename, "` + either of `.html`/`.htm`, `.tex`/`.ltx`/`.rnw`, or `.rtf`",
         call. = FALSE)
  }

  # Use the appropriate save function based
  # on the filename extension
  switch(file_ext,
         htm = gt_save_html(data, filename, ...),
         html = gt_save_html(data, filename, ...),
         ltx = gt_save_latex(data, filename, ...),
         rnw = gt_save_latex(data, filename, ...),
         tex = gt_save_latex(data, filename, ...),
         rtf = gt_save_rtf(data, filename, ...),
         {
           stop("The file extension used (`.", file_ext, "`) doesn't have an ",
                "associated saving function.\n",
                " * We can use either of `.html`/`.htm`, `.tex`/`.ltx`/`.rnw`, or `.rtf`",
                call. = FALSE)
         }
  )
}

# Saving function for an HTML file
#' @importFrom htmltools as.tags save_html HTML
#' @noRd
gt_save_html <- function(data, filename, ..., inline_css = FALSE) {

  if (inline_css) {

    data %>%
      as_raw_html(inline_css = inline_css) %>%
      htmltools::HTML() %>%
      htmltools::save_html(filename)

  } else {

    data %>%
      htmltools::as.tags() %>%
      htmltools::save_html(filename)
  }
}

# Saving function for a LaTeX file
gt_save_latex <- function(data, filename, ...) {

  data %>%
    as_latex() %>%
    writeLines(con = filename)
}

# Saving function for an RTF file
gt_save_rtf <- function(data, filename, ...) {

  data %>%
    as_rtf() %>%
    writeLines(con = filename)
}

#' @importFrom tools file_ext
#' @noRd
gtsave_file_ext <- function(filename) {

  tools::file_ext(filename) %>% tolower()
}
