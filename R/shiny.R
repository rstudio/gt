#' @export
render_gt <- function(expr, env = parent.frame(), quoted = FALSE, outputArgs = list()) {
  func <- installExprFunction(expr, "func", eval.env = env, quoted = quoted)

  createRenderFunction(
    func,
    function(result, shinysession, name, ...) {
      if (is.null(result)) {
        return(NULL)
      }

      html_tbl <- as.tags.gt_tbl(result)
      dependencies <- lapply(
        htmltools::resolveDependencies(htmltools::findDependencies(html_tbl)),
        shiny::createWebDependency
      )
      names(dependencies) <- NULL

      list(
        html = htmltools::doRenderTags(html_tbl),
        deps = dependencies
      )
    },
    gt_output, outputArgs
  )
}

#' @export
gt_output <- function(outputId) {
  shiny::htmlOutput(outputId)
}
