#' A \pkg{gt} display table render function for use in Shiny
#'
#' @param expr An expression that creates a \pkg{gt} table object.
#' @param width,height The width and height of the table. Can be specified as a
#'   single-length character with units of pixels or as a percentage. If
#'   provided as a single-length numeric vector, it is assumed that the value is
#'   given in units of pixels. The [px()] and [pct()] helper functions can also
#'   be used to pass in numeric values and obtain values as pixel or percent
#'   units.
#' @param align The alignment of the table in its container. By default, this is
#'   `"center"`. Other options are `"left"` and `"right"`.
#' @param env The environment in which to evaluate the `expr`.
#' @param quoted Is `expr` a quoted expression (with `quote()`)? This is useful
#'   if you want to save an expression in a variable.
#' @param outputArgs A list of arguments to be passed through to the implicit
#'   call to [gt_output()] when `render_gt` is used in an interactive R Markdown
#'   document.
#' @family Shiny functions
#' @importFrom htmltools resolveDependencies findDependencies doRenderTags
#' @export
render_gt <- function(expr,
                      width = NULL,
                      height = NULL,
                      align = NULL,
                      env = parent.frame(),
                      quoted = FALSE,
                      outputArgs = list()) {

  check_shiny()

  # If the `expr` is an object that inherits from `data.frame`,
  # simply use `gt()` with no options to create the gt table
  if (inherits(expr, "data.frame")) {
    expr <- expr %>% gt()
  }

  # Modify some gt table options via `tab_options()`
  expr <-
    expr %>%
    tab_options(
      table.width = width,
      table.height = height,
      table.align = align
    )

  # Install the expression as a function
  func <-
    shiny::installExprFunction(
      expr,
      name = "func",
      eval.env = env,
      quoted = quoted
    )

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
#'
#' @param outputId An output variable from which to read the table.
#' @return A \pkg{gt} table output element that can be included in a panel.
#' @family Shiny functions
#' @export
gt_output <- function(outputId) {

  check_shiny()

  shiny::htmlOutput(outputId)
}

check_shiny <- function() {

  if (!requireNamespace("shiny", quietly = TRUE)) {

    stop("Please install the *shiny* package before using this function:\n",
         "* Use `install.packages(\"shiny\")`",
         call. = FALSE)
  }
}
