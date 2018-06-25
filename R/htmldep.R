#' An HTML dependency for the stylesheet
#' @importFrom htmltools htmlDependency
#' @export
html_dependency_gt_css <- function() {

  htmltools::htmlDependency(
    name = "gt",
    version = "0.1.0",
    src = system_file(file = "css"),
    stylesheet = "gt.css")
}
