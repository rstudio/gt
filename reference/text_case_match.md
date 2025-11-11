# Perform whole or partial text replacements with a 'switch'-like approach

`text_case_match()` provides a useful interface for a approach to
replacing table cells that behaves much like a switch statement. The
targeting of cell for transformation happens with the `.locations`
argument. Once overall targeting is handled, you need to supply a
sequence of two-sided formulas matching of the general form:
`<vector_old_text> ~ <new_text>`. In the left hand side (LHS) there
should be a character vector containing strings to match on. The right
hand side (RHS) should contain a single string (or something coercible
to a length one character vector). There's also the `.replace` argument
that changes the matching and replacing behavior. By default,
`text_case_match()` will try to match on entire strings and replace
those strings. This can be changed to a partial matching and replacement
strategy with the alternate option.

## Usage

``` r
text_case_match(
  .data,
  ...,
  .default = NULL,
  .replace = c("all", "partial"),
  .locations = cells_body()
)
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

  A sequence of two-sided formulas matching this general construction:
  `<old_text> ~ <new_text>`. The left hand side (LHS) determines which
  values to match on and it can be any length (allowing for `new_text`
  to replace different values of `old_text`). The right hand side (RHS)
  provides the replacement text (it must resolve to a single value of
  the `character` class).

- .default:

  *Default replacement text*

  `scalar<character>` // *default:* `NULL` (`optional`)

  The replacement text to use when cell values aren't matched by any of
  the LHS inputs. If `NULL`, the default, no replacement text will be
  used.

- .replace:

  *Method for text replacement*

  `singl-kw:[all|partial]` // *default:* `"all"`

  A choice in how the matching is to be done. The default `"all"` means
  that the `old_text` (on the LHS of formulas given in `...`) must match
  the cell text *completely*. With that option, the replacement will
  completely replace that matched text. With `"partial"`, the match will
  occur in all substrings of `old_text`. In this way, the replacements
  will act on those matched substrings.

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

Let's use the [`exibble`](https://gt.rstudio.com/reference/exibble.md)
dataset to create a simple, two-column **gt** table (keeping only the
`char` and `fctr` columns). In the `char` column, we'll transform the
`NA` value to `"elderberry"` using the `text_case_match()` function.
Over in the `fctr` column, some more sophisticated matches will be
performed using `text_case_match()`. That column has spelled out numbers
and we can produce these on the LHS with help from
[`vec_fmt_spelled_num()`](https://gt.rstudio.com/reference/vec_fmt_spelled_num.md).
The replacements will contain descriptive text. In this last call of
`text_case_match()`, we use a `.default` to replace text for any of
those non-matched cases.

    exibble |>
      dplyr::select(char, fctr) |>
      gt() |>
      text_case_match(
        NA ~ "elderberry",
        .locations = cells_body(columns = char)
      ) |>
      text_case_match(
        vec_fmt_spelled_num(1:4) ~ "one to four",
        vec_fmt_spelled_num(5:6) ~ "five or six",
        .default = "seven or more",
        .locations = cells_body(columns = fctr)
      )

![This image of a table was generated from the first code example in the
\`text_case_match()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_text_case_match_1.png)

Next, let's use a transformed version of the
[`towny`](https://gt.rstudio.com/reference/towny.md) dataset to create a
**gt** table. Transform the text in the `csd_type` column using
two-sided formulas supplied to `text_case_match()`. We can replace
matches on the LHS with Fontawesome icons furnished by the
**fontawesome** R package.

    towny |>
      dplyr::select(name, csd_type, population_2021) |>
      dplyr::filter(csd_type %in% c("city", "town")) |>
      dplyr::slice_max(population_2021, n = 5, by = csd_type) |>
      dplyr::arrange(csd_type) |>
      gt() |>
      fmt_integer() |>
      text_case_match(
        "city" ~ fontawesome::fa("city"),
        "town" ~ fontawesome::fa("house-chimney")
      ) |>
      cols_label(
        name = "City/Town",
        csd_type = "",
        population_2021 = "Population"
      )

![This image of a table was generated from the second code example in
the \`text_case_match()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_text_case_match_2.png)

## Function ID

4-3

## Function Introduced

`v0.9.0` (Mar 31, 2023)

## See also

Other text transforming functions:
[`text_case_when()`](https://gt.rstudio.com/reference/text_case_when.md),
[`text_replace()`](https://gt.rstudio.com/reference/text_replace.md),
[`text_transform()`](https://gt.rstudio.com/reference/text_transform.md)
