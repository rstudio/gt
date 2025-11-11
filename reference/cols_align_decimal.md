# Align all numeric values in a column along the decimal mark

For numeric columns that contain values with decimal portions, it is
sometimes useful to have them lined up along the decimal mark for easier
readability. We can do this with `cols_align_decimal()` and provide any
number of columns (the function will skip over columns that don't
require this type of alignment).

## Usage

``` r
cols_align_decimal(data, columns = everything(), dec_mark = ".", locale = NULL)
```

## Arguments

- data:

  *The gt table or gt group data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

  OR

  `obj:<gt_group>` // **required**

  This is the **gt** group object that is commonly created through use
  of the [`gt_group()`](https://gt.rstudio.com/reference/gt_group.md)
  function.

- columns:

  *Columns to target*

  `<column-targeting expression>` // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  The columns for which decimal alignment should be applied. Can either
  be a series of column names provided in
  [`c()`](https://rdrr.io/r/base/c.html), a vector of column indices, or
  a select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).
  By default this is set to
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)
  which means that the decimal alignment affects all columns.

- dec_mark:

  *Decimal mark*

  `scalar<character>` // *default:* `"."`

  The character used as a decimal mark in the numeric values to be
  aligned. If a locale value was used when formatting the numeric values
  then `locale` is better to use and it will override any value here in
  `dec_mark`.

- locale:

  *Locale identifier*

  `scalar<character>` // *default:* `NULL` (`optional`)

  An optional locale identifier that can be used to obtain the type of
  decimal mark used in the numeric values to be aligned (according to
  the locale's formatting rules). Examples include `"en"` for English
  (United States) and `"fr"` for French (France). We can call
  [`info_locales()`](https://gt.rstudio.com/reference/info_locales.md)
  for a useful reference for all of the locales that are supported. A
  locale ID can be also set in the initial
  [`gt()`](https://gt.rstudio.com/reference/gt.md) function call (where
  it would be used automatically by any function with a `locale`
  argument) but a `locale` value provided here will override that global
  locale.

## Value

An object of class `gt_tbl`.

## Examples

Let's put together a two-column table to create a **gt** table. The
first column `char` just contains letters whereas the second column,
`num`, has a collection of numbers and `NA` values. We could format the
numbers with
[`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md) and
elect to drop the trailing zeros past the decimal mark with
`drop_trailing_zeros = TRUE`. This can leave formatted numbers that are
hard to scan through because the decimal mark isn't fixed horizontally.
We could remedy this and align the numbers by the decimal mark with
`cols_align_decimal()`.

    dplyr::tibble(
      char = LETTERS[1:9],
      num = c(1.2, -33.52, 9023.2, -283.527, NA, 0.401, -123.1, NA, 41)
    ) |>
      gt() |>
      fmt_number(
        columns = num,
        decimals = 3,
        drop_trailing_zeros = TRUE
      ) |>
      cols_align_decimal()

![This image of a table was generated from the first code example in the
\`cols_align_decimal()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_align_decimal_1.png)

## Function ID

5-2

## Function Introduced

`v0.8.0` (November 16, 2022)

## See also

Other column modification functions:
[`cols_add()`](https://gt.rstudio.com/reference/cols_add.md),
[`cols_align()`](https://gt.rstudio.com/reference/cols_align.md),
[`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md),
[`cols_label()`](https://gt.rstudio.com/reference/cols_label.md),
[`cols_label_with()`](https://gt.rstudio.com/reference/cols_label_with.md),
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md),
[`cols_merge_n_pct()`](https://gt.rstudio.com/reference/cols_merge_n_pct.md),
[`cols_merge_range()`](https://gt.rstudio.com/reference/cols_merge_range.md),
[`cols_merge_uncert()`](https://gt.rstudio.com/reference/cols_merge_uncert.md),
[`cols_move()`](https://gt.rstudio.com/reference/cols_move.md),
[`cols_move_to_end()`](https://gt.rstudio.com/reference/cols_move_to_end.md),
[`cols_move_to_start()`](https://gt.rstudio.com/reference/cols_move_to_start.md),
[`cols_nanoplot()`](https://gt.rstudio.com/reference/cols_nanoplot.md),
[`cols_unhide()`](https://gt.rstudio.com/reference/cols_unhide.md),
[`cols_units()`](https://gt.rstudio.com/reference/cols_units.md),
[`cols_width()`](https://gt.rstudio.com/reference/cols_width.md)
