#' A **gt** display table render function for use in Shiny
#'
#' With `render_gt()` we can create a reactive **gt** table that works
#' wonderfully once assigned to an output slot (with [gt_output()]). This
#' function is to be used within Shiny's `server()` component. We have some
#' options for controlling the size of the container holding the **gt** table.
#' The `width` and `height` arguments allow for sizing the container, and the
#' `align` argument allows us to align the table within the container (some
#' other fine-grained options for positioning are available in the
#' [tab_options()] function).
#'
#' We need to ensure that we have the **shiny** package installed first. This
#' is easily by using `install.packages("shiny")`. More information on creating
#' Shiny apps can be found at the \href{https://shiny.rstudio.com}{Shiny Site}.
#'
#' @param expr An expression that creates a **gt** table object. For sake of
#'   convenience, a data frame or tibble can be used here (it will be
#'   automatically introduced to [gt()] with its default options).
#' @param width,height The width and height of the table's container. Either can
#'   be specified as a single-length character with units of pixels or as a
#'   percentage. If provided as a single-length numeric vector, it is assumed
#'   that the value is given in units of pixels. The [px()] and [pct()] helper
#'   functions can also be used to pass in numeric values and obtain values as
#'   pixel or percent units.
#' @param align The alignment of the table in its container. By default, this is
#'   `"center"`. Other options are `"left"` and `"right"`.
#' @param env The environment in which to evaluate the `expr`.
#' @param quoted Is `expr` a quoted expression (with `quote()`)? This is useful
#'   if you want to save an expression in a variable.
#' @param outputArgs A list of arguments to be passed through to the implicit
#'   call to [gt_output()] when `render_gt` is used in an interactive R Markdown
#'   document.
#'
#' @examples
#' library(shiny)
#'
#' # Here is a Shiny app (contained within
#' # a single file) that (1) prepares a
#' # gt table, (2) sets up the `ui` with
#' # `gt_output()`, and (3) sets up the
#' # `server` with a `render_gt()` that
#' # uses the `gt_tbl` object as the input
#' # expression
#'
#' gt_tbl <-
#'   gtcars %>%
#'   gt() %>%
#'   cols_hide(contains("_"))
#'
#' ui <- fluidPage(
#'
#'   gt_output(outputId = "table")
#' )
#'
#' server <- function(input,
#'                    output,
#'                    session) {
#'
#'   output$table <-
#'     render_gt(
#'       expr = gt_tbl,
#'       height = px(600),
#'       width = px(600)
#'     )
#' }
#'
#' if (interactive()) {
#'   shinyApp(ui, server)
#' }
#'
#' @family Shiny functions
#' @section Function ID:
#' 12-1
#'
#' @export
render_gt <- function(expr,
                      width = NULL,
                      height = NULL,
                      align = NULL,
                      env = parent.frame(),
                      quoted = FALSE,
                      outputArgs = list()) {

  # Ensure that the shiny package is available
  check_shiny()

  # Install the expression as a function
  func <-
    shiny::installExprFunction(
      expr = expr,
      name = "func",
      eval.env = env,
      quoted = quoted
    )

  shiny::createRenderFunction(
    func = func,
    function(result, shinysession, name, ...) {
      if (is.null(result)) {
        return(NULL)
      }

      # If the `expr` is an object that doesn't inherit from `gt_tbl`,
      # simply use `gt()` with no options to create the gt table
      if (!inherits(result, "gt_tbl")) {
        result <- result %>% gt()
      }

      # Modify some gt table options via `tab_options()`
      result <-
        result %>%
        tab_options(
          container.width = width,
          container.height = height,
          table.align = align
        )

      html_tbl <- as.tags.gt_tbl(result)

      dependencies <-
        lapply(
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

#' Create a **gt** display table output element for Shiny
#'
#' Using `gt_output()` we can render a reactive **gt** table, a process
#' initiated by using the [render_gt()] function in the `server` component of a
#' Shiny app. The `gt_output()` call is to be used in the Shiny `ui` component,
#' the position and context wherein this call is made determines the where the
#' **gt** table is rendered on the app page. It's important to note that the
#' ID given during the [render_gt()] call is needed as the `outputId` in
#' `gt_output()` (e.g., **server**: `output$<id> <- render_gt(...)`; **ui**:
#' `gt_output(outputId = "<id>"`).
#'
#' We need to ensure that we have the **shiny** package installed first. This
#' is easily by using `install.packages("shiny")`. More information on creating
#' Shiny apps can be found at the \href{https://shiny.rstudio.com}{Shiny Site}.
#'
#' @param outputId An output variable from which to read the table.
#'
#' @examples
#' library(shiny)
#'
#' # Here is a Shiny app (contained within
#' # a single file) that (1) prepares a
#' # gt table, (2) sets up the `ui` with
#' # `gt_output()`, and (3) sets up the
#' # `server` with a `render_gt()` that
#' # uses the `gt_tbl` object as the input
#' # expression
#'
#' gt_tbl <-
#'   gtcars %>%
#'   gt() %>%
#'   cols_hide(contains("_"))
#'
#' ui <- fluidPage(
#'
#'   gt_output(outputId = "table")
#' )
#'
#' server <- function(input,
#'                    output,
#'                    session) {
#'
#'   output$table <-
#'     render_gt(
#'       expr = gt_tbl,
#'       height = px(600),
#'       width = px(600)
#'     )
#' }
#'
#' if (interactive()) {
#'   shinyApp(ui, server)
#' }
#'
#' @family Shiny functions
#' @section Function ID:
#' 12-2
#'
#' @export
gt_output <- function(outputId) {

  # Ensure that the shiny package is available
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
