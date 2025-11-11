# Perform whole text replacements using a 'case-when'-expression approach

`text_case_when()` provides a useful interface for a case-by-case
approach to replacing entire table cells. First off, you have to make
sure you're targeting the appropriate cells with the `.locations`
argument. Following that, you supply a sequence of two-sided formulas
matching of the general form: `<logical_stmt> ~ <new_text>`. In the left
hand side (LHS) there should be a predicate statement that evaluates to
a logical vector of length one (i.e., either `TRUE` or `FALSE`). To
refer to the values undergoing transformation, you need to use the `x`
variable.

## Usage

``` r
text_case_when(.data, ..., .default = NULL, .locations = cells_body())
```

## Arguments

- .data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- ...:

  *Matching expressions*

  `<multiple expressions>` // **required**

  A sequence of two-sided formulas. The left hand side (LHS) determines
  which values match this case. The right hand side (RHS) provides the
  replacement text (it must resolve to a value of the `character`
  class). The LHS inputs must evaluate to logical vectors.

- .default:

  *Default replacement text*

  `scalar<character>` // *default:* `NULL` (`optional`)

  The replacement text to use when cell values aren't matched by any of
  the LHS inputs. If `NULL`, the default, no replacement text will be
  used.

- .locations:

  *Locations to target*

  [`<locations expressions>`](https://gt.rstudio.com/reference/location-helper.md)
  // *default:*
  [`cells_body()`](https://gt.rstudio.com/reference/cells_body.md)

  The cell or set of cells to be associated with the text
  transformation. Only
  [`cells_column_spanners()`](https://gt.rstudio.com/reference/cells_column_spanners.md),
  [`cells_column_labels()`](https://gt.rstudio.com/reference/cells_column_labels.md),
  [`cells_row_groups()`](https://gt.rstudio.com/reference/cells_row_groups.md),
  [`cells_stub()`](https://gt.rstudio.com/reference/cells_stub.md), and
  [`cells_body()`](https://gt.rstudio.com/reference/cells_body.md) can
  be used here. We can enclose several of these calls within a
  [`list()`](https://rdrr.io/r/base/list.html) if we wish to make the
  transformation happen at different locations.

## Value

An object of class `gt_tbl`.

## Examples

Use a portion of the
[`metro`](https://gt.rstudio.com/reference/metro.md) dataset to create a
**gt** table. We'll use `text_case_when()` to supply pairs of predicate
statements and replacement text. For the `connect_rer` column, we will
perform a count of pattern matches with
[`stringr::str_count()`](https://stringr.tidyverse.org/reference/str_count.html)
and determine which cells have 1, 2, or 3 matched patterns. For each of
these cases, descriptive replacement text is provided. Here, we use a
`.default` value to replace the non-matched cases with an empty string
(`""`). Finally, we use
[`cols_label()`](https://gt.rstudio.com/reference/cols_label.md) to
modify the labels of the three columns.

    metro |>
      dplyr::slice_max(passengers, n = 10) |>
      dplyr::select(name, lines, connect_rer) |>
      gt() |>
      text_case_when(
        stringr::str_count(x, pattern = "[ABCDE]") == 1 ~ "One connection.",
        stringr::str_count(x, pattern = "[ABCDE]") == 2 ~ "Two connections.",
        stringr::str_count(x, pattern = "[ABCDE]") == 3 ~ "Three connections.",
        .default = "", .locations = cells_body(columns = connect_rer)
      ) |>
      cols_label(
        name = "Station",
        lines = "Lines Serviced",
        connect_rer = "RER Connections"
      )

![This image of a table was generated from the first code example in the
\`text_case_when()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_text_case_when_1.png)

## Function ID

4-2

## Function Introduced

`v0.9.0` (Mar 31, 2023)

## See also

Other text transforming functions:
[`text_case_match()`](https://gt.rstudio.com/reference/text_case_match.md),
[`text_replace()`](https://gt.rstudio.com/reference/text_replace.md),
[`text_transform()`](https://gt.rstudio.com/reference/text_transform.md)
