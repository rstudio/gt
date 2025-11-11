# Update a **gt** selection in Shiny

Update the selection in an interactive **gt** table rendered using
[`render_gt()`](https://gt.rstudio.com/reference/render_gt.md). The
table must be interactive and have selection enabled (see
[`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md)).

## Usage

``` r
gt_update_select(outputId, rows, session = shiny::getDefaultReactiveDomain())
```

## Arguments

- outputId:

  *Shiny output ID*

  `scalar<character>` // **required**

  The id of the
  [`gt_output()`](https://gt.rstudio.com/reference/gt_output.md) element
  to update.

- rows:

  *Row indices*

  `<integer>` // **required**

  The id of the
  [`gt_output()`](https://gt.rstudio.com/reference/gt_output.md) element
  to update.

- session:

  *Shiny session*

  `scalar<ShinySession>` // **required**

  The session in which the
  [`gt_output()`](https://gt.rstudio.com/reference/gt_output.md) element
  can be found. You almost certainly want to leave this as the default
  value.

## Value

A call to the JavaScript binding of the table.

## Function ID

12-3

## See also

Other Shiny functions:
[`gt_output()`](https://gt.rstudio.com/reference/gt_output.md),
[`render_gt()`](https://gt.rstudio.com/reference/render_gt.md)
