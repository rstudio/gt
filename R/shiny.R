#------------------------------------------------------------------------------#
#
#                /$$
#               | $$
#     /$$$$$$  /$$$$$$
#    /$$__  $$|_  $$_/
#   | $$  \ $$  | $$
#   | $$  | $$  | $$ /$$
#   |  $$$$$$$  |  $$$$/
#    \____  $$   \___/
#    /$$  \ $$
#   |  $$$$$$/
#    \______/
#
#  This file is part of the 'rstudio/gt' project.
#
#  Copyright (c) 2018-2025 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


#nocov start

# render_gt() ------------------------------------------------------------------
#' A **gt** display table render function for use in Shiny
#'
#' @description
#'
#' With `render_gt()` we can create a reactive **gt** table that works
#' wonderfully once assigned to an output slot (with [gt_output()]). This
#' function is to be used within [Shiny](https://shiny.posit.co)'s `server()`
#' component. We have some options for controlling the size of the container
#' holding the **gt** table. The `width` and `height` arguments allow for sizing
#' the container, and the `align` argument allows us to align the table within
#' the container (some other fine-grained options for positioning are available
#' in [tab_options()]). If the table is interactive, the selected row indices
#' (relative to the underlying data, regardless of sorting) are available as
#' `input$id`, where `id` is the `outputId` used for this table in [gt_output()].
#' If the user has deselected all rows, the value is `0` (vs `NULL` when the
#' table initializes).
#'
#' @param expr *Expression*
#'
#'   `<expression>|obj:<data.frame>|obj:<tbl_df>`
#'
#'   An expression that creates a **gt** table object. For sake of convenience,
#'   a data frame or tibble can be used here (it will be automatically
#'   introduced to [gt()] with its default options).
#'
#' @param width,height *Dimensions of table container*
#'
#'   `scalar<numeric|integer|character>` // *default:* `NULL` (`optional`)
#'
#'   The width and height of the table's container. Either can be specified as a
#'   single-length character vector with units of pixels or as a percentage. If
#'   provided as a single-length numeric vector, it is assumed that the value is
#'   given in units of pixels. The [px()] and [pct()] helper functions can also
#'   be used to pass in numeric values and obtain values as pixel or percent
#'   units.
#'
#' @param align *Table alignment*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   The alignment of the table in its container. If `NULL`, the table will be
#'   center-aligned. Valid options for this are: `"center"`, `"left"`, and
#'   `"right"`.
#'
#' @param env *Evaluation environment*
#'
#'   `<environment>` // *default:* `parent.frame()`
#'
#'   The environment in which to evaluate the `expr`.
#'
#' @param quoted *Option to `quote()` `expr`*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   Is `expr` a quoted expression (with `quote()`)? This is useful if you want
#'   to save an expression in a variable.
#'
#' @param outputArgs *Output arguments*
#'
#'   `list` // *default:* `list()`
#'
#'   A list of arguments to be passed through to the implicit call to
#'   [gt_output()] when `render_gt()` is used in an interactive R Markdown
#'   document.
#'
#' @return An object of class `shiny.render.function`.
#'
#' @section Examples:
#'
#' Here is a Shiny app (contained within a single file) that (1) prepares a
#' **gt** table, (2) sets up the `ui` with [gt_output()], and (3) sets up the
#' `server` with a `render_gt()` that uses the `gt_tbl` object as the input
#' expression.
#'
#' ```r
#' library(shiny)
#'
#' gt_tbl <-
#'   gtcars |>
#'   gt() |>
#'   fmt_currency(columns = msrp, decimals = 0) |>
#'   cols_hide(columns = -c(mfr, model, year, mpg_c, msrp)) |>
#'   cols_label_with(columns = everything(), fn = toupper) |>
#'   data_color(columns = msrp, method = "numeric", palette = "viridis") |>
#'   sub_missing() |>
#'   opt_interactive(use_compact_mode = TRUE)
#'
#' ui <- fluidPage(
#'   gt_output(outputId = "table")
#' )
#'
#' server <- function(input, output, session) {
#'   output$table <- render_gt(expr = gt_tbl)
#' }
#'
#' shinyApp(ui = ui, server = server)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_render_gt_1.png")`
#' }}
#'
#' @family Shiny functions
#' @section Function ID:
#' 12-1
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
render_gt <- function(
    expr,
    width = NULL,
    height = NULL,
    align = NULL,
    env = parent.frame(),
    quoted = FALSE,
    outputArgs = list()
) {

  # Ensure that the shiny package is available
  rlang::check_installed("shiny", "to use `render_gt()`.")

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
        result <- gt(result)
      }

      # Modify some gt table options via `tab_options()`
      result <-
        tab_options(
          result,
          container.width = width,
          container.height = height,
          table.align = align
        )

      html_tbl <- htmltools::tagList(
        as.tags(result),
        shiny_deps(),
        initialize_shiny_gt(name)
      )

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

shiny_deps <- function() {
  htmltools::htmlDependency(
    "gtShiny",
    "1.0.0",
    src = "shiny",
    package = "gt",
    script = "gtShiny.js"
  )
}

initialize_shiny_gt <- function(id) {
  htmltools::HTML(
    glue::glue("<script>gtShinyBinding.initialize('{id}');</script>")
  )
}

# gt_output() ------------------------------------------------------------------
#' Create a **gt** display table output element for Shiny
#'
#' @description
#'
#' Using `gt_output()` we can render a reactive **gt** table, a process
#' initiated by using [render_gt()] in the `server` component of a
#' Shiny app. `gt_output()` is to be used in the [Shiny](https://shiny.posit.co)
#' `ui` component, the position and context wherein this call is made determines
#' the where the **gt** table is rendered on the app page. It's important to
#' note that the ID given during [render_gt()] is needed as the `outputId` in
#' `gt_output()` (e.g., **server**: `output$<id> <- render_gt(...)`; **ui**:
#' `gt_output(outputId = "<id>")`).
#'
#' @param outputId *Shiny output ID*
#'
#'   `scalar<character>` // **required**
#'
#'   An output variable from which to read the table.
#'
#' @return An object of class `shiny.tag`.
#'
#' @section Examples:
#'
#' Here is a Shiny app (contained within a single file) that (1) prepares a
#' **gt** table, (2) sets up the `ui` with `gt_output()`, and (3) sets up the
#' `server` with a [render_gt()] that uses the `gt_tbl` object as the input
#' expression.
#'
#' ```r
#' library(shiny)
#'
#' gt_tbl <-
#'   gtcars |>
#'   gt() |>
#'   fmt_currency(columns = msrp, decimals = 0) |>
#'   cols_hide(columns = -c(mfr, model, year, mpg_c, msrp)) |>
#'   cols_label_with(columns = everything(), fn = toupper) |>
#'   data_color(columns = msrp, method = "numeric", palette = "viridis") |>
#'   sub_missing() |>
#'   opt_interactive(use_compact_mode = TRUE)
#'
#' ui <- fluidPage(
#'   gt_output(outputId = "table")
#' )
#'
#' server <- function(input, output, session) {
#'   output$table <- render_gt(expr = gt_tbl)
#' }
#'
#' shinyApp(ui = ui, server = server)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_render_gt_1.png")`
#' }}
#'
#' @family Shiny functions
#' @section Function ID:
#' 12-2
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
gt_output <- function(outputId) {

  # Ensure that the shiny package is available
  rlang::check_installed("shiny", "to use `gt_output()`.")

  shiny::htmlOutput(outputId, class = "gt_shiny")
}

# gt_update_select() -----------------------------------------------------------
#' Update a **gt** selection in Shiny
#'
#' @description
#'
#' Update the selection in an interactive **gt** table rendered using
#' [render_gt()]. The table must be interactive and have selection enabled (see
#' [opt_interactive()]).
#'
#' @param outputId *Shiny output ID*
#'
#'   `scalar<character>` // **required**
#'
#'   The id of the [gt_output()] element to update.
#' @param rows *Row indices*
#'
#'   `<integer>` // **required**
#'
#'   The id of the [gt_output()] element to update.
#' @param session *Shiny session*
#'
#'   `scalar<ShinySession>` // **required**
#'
#'   The session in which the [gt_output()] element can be found. You almost
#'   certainly want to leave this as the default value.
#'
#' @return A call to the JavaScript binding of the table.
#' @family Shiny functions
#' @section Function ID:
#' 12-3
#'
#' @export
gt_update_select <- function(outputId,
                             rows,
                             session = shiny::getDefaultReactiveDomain()) {
  session$sendInputMessage(outputId, rows - 1)
}

#nocov end
