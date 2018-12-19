#' A \pkg{gt} display table render function for use in Shiny
#' @param expr an expression that creates a \code{gt} table object.
#' @param env the environment in which to evaluate the \code{expr}.
#' @param quoted is expr a quoted expression (with \code{quote()})? This is
#'   useful if you want to save an expression in a variable.
#' @param outputArgs A list of arguments to be passed through to the implicit
#'   call to \code{\link{gt_output}()} when \code{render_gt} is used in an
#'   interactive R Markdown document.
#' @seealso \link{gt_output}()
#' @family Shiny functions
#' @importFrom htmltools resolveDependencies findDependencies doRenderTags
#' @export
render_gt <- function(expr,
                      env = parent.frame(),
                      quoted = FALSE,
                      outputArgs = list()) {

  check_shiny()

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

#' Create a \pkg{gt} display table output element for Shiny
#' @param outputId an output variable from which to read the table.
#' @return A \pkg{gt} table output element that can be included in a panel.
#' @seealso \link{render_gt}()
#' @family Shiny functions
#' @export
gt_output <- function(outputId) {

  check_shiny()

  shiny::htmlOutput(outputId)
}

check_shiny <- function() {

  if (!requireNamespace("shiny", quietly = TRUE)) {

    stop("Please install the shiny package before using this function\n\n\t",
         "install.packages(\"shiny\")", call. = FALSE)
  }
}
