#' A gt display table render function for use in Shiny
#' @param expr an expression that creates a \code{gt} table object.
#' @param env the environment in which to evaluate the \code{expr}.
#' @param quoted is expr a quoted expression (with \code{quote()})? This is
#'   useful if you want to save an expression in a variable.
#' @param outputArgs A list of arguments to be passed through to the implicit
#'   call to \code{\link{gt_output}()} when \code{render_gt} is used in an
#'   interactive R Markdown document.
#' @seealso gt_output
#' @importFrom htmltools resolveDependencies findDependencies doRenderTags
#' @export
render_gt <- function(expr,
                      env = parent.frame(),
                      quoted = FALSE,
                      outputArgs = list()) {

  func <-
    shiny::installExprFunction(
      expr, "func", eval.env = env, quoted = quoted)

  shiny::createRenderFunction(
    func,
    function(result, shinysession, name, ...) {
      if (is.null(result)) {
        return(NULL)
      }

      html_tbl <- as.tags.gt_tbl(result)

      dependencies <- lapply(
        htmltools::resolveDependencies(htmltools::findDependencies(html_tbl)),
        shiny::createWebDependency)

      names(dependencies) <- NULL

      list(
        html = htmltools::doRenderTags(html_tbl),
        deps = dependencies)
    },
    gt_output, outputArgs
  )
}

#' Create a gt display table output element for Shiny
#' @params outputId an output variable from which to read the table.
#' @return A gt table output element that can be included in a panel.
#' @seealso render_gt
#' @export
gt_output <- function(outputId) {

  shiny::htmlOutput(outputId)
}
