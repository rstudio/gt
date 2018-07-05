#' Knit print the table
#' @description This facilitates printing of the
#' HTML table within a knitr code chunk.
#' @param x an object of class \code{gt_tbl}.
#' @keywords internal
#' @importFrom knitr knit_print
#' @importFrom htmltools tagList htmlDependency attachDependencies HTML
#' @export
knit_print.gt_tbl <- function(x, ...) {

  # Generation of the HTML table
  html_table <- process_html(tbl = x)

  # Create the htmlDependency
  dep <- htmltools::htmlDependency(
    name = 'gt',
    version = '0.1',
    src = system_file(file = 'css'),
    stylesheet = 'gt.css')

  # Attach the dependency to the HTML table
  html_tbl <-
    htmltools::attachDependencies(htmltools::tagList(htmltools::HTML(html_table)), dep)

  # Use `knit_print()` to print in a code chunk
  knitr::knit_print(html_tbl, ...)
}
