#' Print the table
#' @description This facilitates printing of the
#' HTML table to the R console.
#' @param x an object of class \code{gt_tbl}.
#' @keywords internal
#' @importFrom htmltools tagList htmlDependency attachDependencies HTML
#' @export
print.gt_tbl <- function(x, ..., view = interactive()) {

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

  # Use `print()` to print to the console
  print(html_tbl, browse = view, ...)
}
