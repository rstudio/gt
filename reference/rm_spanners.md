# Remove column spanner labels

If you would like to remove column spanner labels then the
`rm_spanners()` function can make this possible. Column spanner labels
appear above the column labels and can occupy several levels via
stacking either through
[`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md) or
[`tab_spanner_delim()`](https://gt.rstudio.com/reference/tab_spanner_delim.md).
Spanner column labels are distinguishable and accessible by their ID
values.

This function for removal is useful if you have received a **gt** table
(perhaps through an API that returns **gt** objects) but would prefer
that some or all of the column spanner labels be removed. This function
is safe to use even if there are no column spanner labels in the input
`gt_tbl` object so long as select helpers (such as the default
[`everything()`](https://tidyselect.r-lib.org/reference/everything.html))
are used instead of explicit ID values.

## Usage

``` r
rm_spanners(data, spanners = everything(), levels = NULL)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- spanners:

  *Spanners to remove*

  `<spanner-targeting expression>` // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  A specification of which spanner column labels should be removed.
  Those to be removed can be given as a vector of spanner ID values
  (every spanner column label has one, either set by the user or by
  **gt** when using
  [`tab_spanner_delim()`](https://gt.rstudio.com/reference/tab_spanner_delim.md)).
  A select helper can also be used and, by default, this is
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)
  (whereby all spanner column labels will be removed).

- levels:

  *Spanner levels to remove*

  `scalar<numeric|integer>` // *default:* `NULL` (`optional`)

  Instead of removing spanner column labels by ID values, entire levels
  of spanners can instead be removed. Supply a numeric vector of level
  values (the first level is `1`) and, if they are present, they will be
  removed. Any input given to `level` will mean that `spanners` is
  ignored.

## Value

An object of class `gt_tbl`.

## Examples

Use a portion of the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset to create
a **gt** table. With
[`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md), we
can group several related columns together under a spanner column. In
this example, that is done with several
[`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md) calls
in order to create two levels of spanner column labels.

    gt_tbl <-
      gtcars |>
      dplyr::select(
        -mfr, -trim, bdy_style, drivetrain,
        -drivetrain, -trsmn, -ctry_origin
      ) |>
      dplyr::slice(1:8) |>
      gt(rowname_col = "model") |>
      tab_spanner(label = "HP", columns = c(hp, hp_rpm)) |>
      tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) |>
      tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) |>
      tab_spanner(
        label = "Performance",
        columns = c(
          hp, hp_rpm, trq, trq_rpm,
          mpg_c, mpg_h
        )
      )

    gt_tbl

![This image of a table was generated from the first code example in the
\`rm_spanners()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rm_spanners_1.png)

If you decide that you don't want any of the spanners in the `gt_tbl`
object, they can all be removed with `rm_spanners()`.

    rm_spanners(data = gt_tbl)

![This image of a table was generated from the second code example in
the \`rm_spanners()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rm_spanners_2.png)

Individual spanner column labels can be removed by ID value. In all the
above uses of
[`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md), the
`label` value *is* the ID value (you can alternately set a different ID
value though the `id` argument). Let's remove the `"HP"` and `"MPG"`
spanner column labels with `rm_spanners()`.

    rm_spanners(data = gt_tbl, spanners = c("HP", "MPG"))

![This image of a table was generated from the third code example in the
\`rm_spanners()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rm_spanners_3.png)

We can also remove spanner column labels by level with `rm_spanners()`.
Provide a vector of one or more values greater than or equal to `1` (the
first level starts there). In the next example, we'll remove the first
level of spanner column labels. Any levels not being removed will
collapse down accordingly.

    rm_spanners(data = gt_tbl, levels = 1)

![This image of a table was generated from the fourth code example in
the \`rm_spanners()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rm_spanners_4.png)

## Function ID

7-3

## Function Introduced

`v0.8.0` (November 16, 2022)

## See also

Other part removal functions:
[`rm_caption()`](https://gt.rstudio.com/reference/rm_caption.md),
[`rm_footnotes()`](https://gt.rstudio.com/reference/rm_footnotes.md),
[`rm_header()`](https://gt.rstudio.com/reference/rm_header.md),
[`rm_source_notes()`](https://gt.rstudio.com/reference/rm_source_notes.md),
[`rm_stubhead()`](https://gt.rstudio.com/reference/rm_stubhead.md)
