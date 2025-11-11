# A **gt** display table render function for use in Shiny

With `render_gt()` we can create a reactive **gt** table that works
wonderfully once assigned to an output slot (with
[`gt_output()`](https://gt.rstudio.com/reference/gt_output.md)). This
function is to be used within [Shiny](https://shiny.posit.co)'s
`server()` component. We have some options for controlling the size of
the container holding the **gt** table. The `width` and `height`
arguments allow for sizing the container, and the `align` argument
allows us to align the table within the container (some other
fine-grained options for positioning are available in
[`tab_options()`](https://gt.rstudio.com/reference/tab_options.md)). If
the table is interactive, the selected row indices (relative to the
underlying data, regardless of sorting) are available as `input$id`,
where `id` is the `outputId` used for this table in
[`gt_output()`](https://gt.rstudio.com/reference/gt_output.md). If the
user has deselected all rows, the value is `0` (vs `NULL` when the table
initializes).

## Usage

``` r
render_gt(
  expr,
  width = NULL,
  height = NULL,
  align = NULL,
  env = parent.frame(),
  quoted = FALSE,
  outputArgs = list()
)
```

## Arguments

- expr:

  *Expression*

  `<expression>|obj:<data.frame>|obj:<tbl_df>`

  An expression that creates a **gt** table object. For sake of
  convenience, a data frame or tibble can be used here (it will be
  automatically introduced to
  [`gt()`](https://gt.rstudio.com/reference/gt.md) with its default
  options).

- width, height:

  *Dimensions of table container*

  `scalar<numeric|integer|character>` // *default:* `NULL` (`optional`)

  The width and height of the table's container. Either can be specified
  as a single-length character vector with units of pixels or as a
  percentage. If provided as a single-length numeric vector, it is
  assumed that the value is given in units of pixels. The
  [`px()`](https://gt.rstudio.com/reference/px.md) and
  [`pct()`](https://gt.rstudio.com/reference/pct.md) helper functions
  can also be used to pass in numeric values and obtain values as pixel
  or percent units.

- align:

  *Table alignment*

  `scalar<character>` // *default:* `NULL` (`optional`)

  The alignment of the table in its container. If `NULL`, the table will
  be center-aligned. Valid options for this are: `"center"`, `"left"`,
  and `"right"`.

- env:

  *Evaluation environment*

  `<environment>` // *default:*
  [`parent.frame()`](https://rdrr.io/r/base/sys.parent.html)

  The environment in which to evaluate the `expr`.

- quoted:

  *Option to [`quote()`](https://rdrr.io/r/base/substitute.html) `expr`*

  `scalar<logical>` // *default:* `FALSE`

  Is `expr` a quoted expression (with
  [`quote()`](https://rdrr.io/r/base/substitute.html))? This is useful
  if you want to save an expression in a variable.

- outputArgs:

  *Output arguments*

  `list` // *default:* [`list()`](https://rdrr.io/r/base/list.html)

  A list of arguments to be passed through to the implicit call to
  [`gt_output()`](https://gt.rstudio.com/reference/gt_output.md) when
  `render_gt()` is used in an interactive R Markdown document.

## Value

An object of class `shiny.render.function`.

## Examples

Here is a Shiny app (contained within a single file) that (1) prepares a
**gt** table, (2) sets up the `ui` with
[`gt_output()`](https://gt.rstudio.com/reference/gt_output.md), and (3)
sets up the `server` with a `render_gt()` that uses the `gt_tbl` object
as the input expression.

    library(shiny)

    gt_tbl <-
      gtcars |>
      gt() |>
      fmt_currency(columns = msrp, decimals = 0) |>
      cols_hide(columns = -c(mfr, model, year, mpg_c, msrp)) |>
      cols_label_with(columns = everything(), fn = toupper) |>
      data_color(columns = msrp, method = "numeric", palette = "viridis") |>
      sub_missing() |>
      opt_interactive(use_compact_mode = TRUE)

    ui <- fluidPage(
      gt_output(outputId = "table")
    )

    server <- function(input, output, session) {
      output$table <- render_gt(expr = gt_tbl)
    }

    shinyApp(ui = ui, server = server)

![This image of a table was generated from the first code example in the
\`render_gt()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_render_gt_1.png)

## Function ID

12-1

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other Shiny functions:
[`gt_output()`](https://gt.rstudio.com/reference/gt_output.md),
[`gt_update_select()`](https://gt.rstudio.com/reference/gt_update_select.md)
