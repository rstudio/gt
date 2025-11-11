# Perform highly targeted text replacement with a regex pattern

`text_replace()` provides a specialized interface for replacing text
fragments in table cells with literal text. You need to ensure that
you're targeting the appropriate cells with the `locations` argument.
Once that is done, the remaining two values to supply are the regex
pattern (`pattern`) and the replacement for all matched text
(`replacement`).

## Usage

``` r
text_replace(data, pattern, replacement, locations = cells_body())
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- pattern:

  *Regex pattern to match with*

  `scalar<character>` // **required**

  A regex pattern used to target text fragments in the cells resolved in
  locations.

- replacement:

  *Replacement text*

  `scalar<character>` // **required**

  The replacement text for any matched text fragments.

- locations:

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

Use the [`metro`](https://gt.rstudio.com/reference/metro.md) dataset to
create a **gt** table. With
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md), we'll
merge the `name` and `caption` columns together but only if `caption`
doesn't have an `NA` value (the special `pattern` syntax of
`"{1}<<({2})>>"` takes care of this). This merged content is now part of
the `name` column. We'd like to modify this further wherever there is
text in parentheses: (1) make that text italicized, and (2) introduce a
line break before the text in parentheses. We can do this with
`text_replace()`. The `pattern` value of `"\\((.*?)\\)"` will match on
text between parentheses, and the inner `"(.*?)"` is a capture group.
The `replacement` value of `"<br>(<em>\\1</em>)"` puts the capture group
text `"\\1"` within `<em>` tags, wraps literal parentheses around it,
and prepends a line break tag.

    metro |>
      dplyr::select(name, caption, lines) |>
      dplyr::slice(110:120) |>
      gt() |>
      cols_merge(
        columns = c(name, caption),
        pattern = "{1}<< ({2})>>"
      ) |>
      text_replace(
        locations = cells_body(columns = name),
        pattern = "\\((.*?)\\)",
        replacement = "<br>(<em>\\1</em>)"
      )

![This image of a table was generated from the first code example in the
\`text_replace()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_text_replace_1.png)

## Function ID

4-1

## Function Introduced

`v0.9.0` (Mar 31, 2023)

## See also

Other text transforming functions:
[`text_case_match()`](https://gt.rstudio.com/reference/text_case_match.md),
[`text_case_when()`](https://gt.rstudio.com/reference/text_case_when.md),
[`text_transform()`](https://gt.rstudio.com/reference/text_transform.md)
