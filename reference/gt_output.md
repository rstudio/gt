# Create a **gt** display table output element for Shiny

Using `gt_output()` we can render a reactive **gt** table, a process
initiated by using
[`render_gt()`](https://gt.rstudio.com/reference/render_gt.md) in the
`server` component of a Shiny app. `gt_output()` is to be used in the
[Shiny](https://shiny.posit.co) `ui` component, the position and context
wherein this call is made determines the where the **gt** table is
rendered on the app page. It's important to note that the ID given
during [`render_gt()`](https://gt.rstudio.com/reference/render_gt.md) is
needed as the `outputId` in `gt_output()` (e.g., **server**:
`output$<id> <- render_gt(...)`; **ui**:
`gt_output(outputId = "<id>")`).

## Usage

``` r
gt_output(outputId)
```

## Arguments

- outputId:

  *Shiny output ID*

  `scalar<character>` // **required**

  An output variable from which to read the table.

## Value

An object of class `shiny.tag`.

## Examples

Here is a Shiny app (contained within a single file) that (1) prepares a
**gt** table, (2) sets up the `ui` with `gt_output()`, and (3) sets up
the `server` with a
[`render_gt()`](https://gt.rstudio.com/reference/render_gt.md) that uses
the `gt_tbl` object as the input expression.

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

12-2

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other Shiny functions:
[`gt_update_select()`](https://gt.rstudio.com/reference/gt_update_select.md),
[`render_gt()`](https://gt.rstudio.com/reference/render_gt.md)
