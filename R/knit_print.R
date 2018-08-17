#' Knit print the table
#' @description This facilitates printing of the HTML table within a knitr
#' code chunk.
#' @param x an object of class \code{gt_tbl}.
#' @keywords internal
#' @importFrom knitr knit_print
#' @importFrom htmltools tagList htmlDependency attachDependencies HTML
#' @export
knit_print.gt_tbl <- function(x, ...) {

  # Generate the HTML table
  html_table <- render_as_html(data = x)

  # Generate the SCSS lines, compile, and write the CSS
  # to disk as `compiled.css`
  create_css(data = x)

  # Create the htmlDependency
  dep <- htmltools::htmlDependency(
    name = "gt",
    version = "0.1",
    src = c(file = getwd()),
    stylesheet = "compiled.css")

  # Attach the dependency to the HTML table
  html_tbl <-
    htmltools::attachDependencies(
      htmltools::tagList(
        htmltools::HTML(html_table)), dep)

  # Use `knit_print()` to print in a code chunk
  knitr::knit_print(html_tbl, ...)
}
