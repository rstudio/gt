#' Print the table
#' @description This facilitates printing of the HTML table to the R console.
#' @param x an object of class \code{gt_tbl}.
#' @keywords internal
#' @export
print.gt_tbl <- function(x, ..., view = interactive()) {

  html_tbl <- as.tags.gt_tbl(x, ...)

  # Use `print()` to print to the console
  print(html_tbl, browse = view, ...)
}

#' Knit print the table
#' @description This facilitates printing of the HTML table within a knitr
#'   code chunk.
#' @param x an object of class \code{gt_tbl}.
#' @keywords internal
knit_print.gt_tbl <- function(x, ...) {

  html_tbl <- as.tags.gt_tbl(x, ...)

  # Use `knit_print()` to print in a code chunk
  knitr::knit_print(html_tbl, ...)
}

#' @importFrom htmltools tags HTML tagList
as.tags.gt_tbl <- function(x, ...) {

  # Generate the HTML table
  html_table <- render_as_html(data = x)

  # Generate the SCSS lines, compile, and write the CSS
  # to disk as `compiled.css`
  css <- compile_scss(data = x)

  # Attach the dependency to the HTML table
  html_tbl <- htmltools::tagList(
    htmltools::tags$style(htmltools::HTML(css)),
    htmltools::HTML(html_table)
  )

  html_tbl
}
