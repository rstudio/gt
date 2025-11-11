# Extract the table body from a **gt** object

We can extract the body of a **gt** table, even at various stages of its
rendering, from a `gt_tbl` object using `extract_body()`. By default,
the data frame returned will have gone through all of the build stages
but we can intercept the table body after a certain build stage. Here
are the eight different build stages and some notes about each:

1.  `"init"`: the body table is initialized here, entirely with `NA`
    values. It's important to note that all columns of the are of the
    `character` type in this first stage. And all columns remain in the
    same order as the input data table.

2.  `"fmt_applied"`: Any cell values that have had formatting applied to
    them are migrated to the body table. All other cells remain as `NA`
    values. Depending on the `output` type, the formatting may also be
    different.

3.  `"sub_applied"`: Any cell values that have had substitution
    functions applied to them (whether or not they were previously
    formatted) are migrated to the body table or modified in place (if
    formatted). All cells that had neither been formatted nor undergone
    substitution remain as `NA` values.

4.  `"unfmt_included"`: All cells that either didn't have any formatting
    or any substitution operations applied are migrated to the body
    table. `NA` values now become the string `"NA"`, so, there aren't
    any true missing values in this body table.

5.  `"cols_merged"`: The result of column-merging operations (through
    [`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md) and
    related functions) is materialized here. Columns that were asked to
    be hidden will be present here (i.e., hiding columns doesn't remove
    them from the body table).

6.  `"body_reassembled"`: Though columns do not move positions rows can
    move to different positions, and this is usually due to migration to
    different row groups. At this stage, rows will be in the finalized
    order that is seen in the associated display table.

7.  `"text_transformed"`: Various `text_*()` functions in **gt** can
    operate on body cells (now fully formatted at this stage) and return
    transformed character values. After this stage, the effects of those
    functions are apparent.

8.  `"footnotes_attached"`: Footnote marks are attached to body cell
    values (either on the left or right of the content). This stage
    performs said attachment.

## Usage

``` r
extract_body(
  data,
  build_stage = NULL,
  incl_hidden_cols = FALSE,
  incl_stub_cols = TRUE,
  ...,
  output = c("html", "latex", "rtf", "word", "grid")
)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- build_stage:

  *The build stage of the formatted R data frame*

  `scalar<character>` // *default:* `NULL` (`optional`)

  When a **gt** undergoes rendering, the body of the table proceeds
  through several build stages. Providing a single stage name will yield
  a data frame that has been extracted after completed that stage. Here
  are the build stages in order: (1) `"init"`, (2) `"fmt_applied"`, (3)
  `"sub_applied"`, (4) `"unfmt_included"`, (5) `"cols_merged"`, (6)
  `"body_reassembled"`, (7) `"text_transformed"`, and (8)
  `"footnotes_attached"`. If not supplying a value for `build_stage`
  then the entire build for the table body (i.e., up to and including
  the `"footnotes_attached"` stage) will be performed before returning
  the data frame.

- incl_hidden_cols:

  *Should hidden columns be included?*

  `scalar<logical>` // *default:* `FALSE`

  Certain columns may be hidden from final display via
  [`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md). By
  default, those columns won't be part of the extracted data frame.
  However, we can choose to include them by using
  `incl_hidden_cols = TRUE`.

- incl_stub_cols:

  *Should stub columns be included?*

  `scalar<logical>` // *default:* `TRUE`

  Any stub columns in the **gt** object (which may consist of a grouping
  column and a column for row labels) are included in the extracted data
  for clarity but clearly marked with the names `"::group_id::"` and
  `"::rowname::"`. We can exclude them by setting
  `incl_stub_cols = FALSE`.

- ...:

  These dots are for future extensions and must be empty.

- output:

  *Output format*

  `singl-kw:[html|latex|rtf|word]` // *default:* `"html"`

  The output format of the resulting data frame. This can either be
  `"html"` (the default), `"latex"`, `"rtf"`, or `"word"`.

## Value

A data frame or tibble object containing the table body.

## Examples

Use a modified version of
[`sp500`](https://gt.rstudio.com/reference/sp500.md) the dataset to
create a **gt** table with row groups and row labels. Formatting will be
applied to the date- and currency-based columns.

    gt_tbl <-
      sp500 |>
      dplyr::filter(date >= "2015-01-05" & date <= "2015-01-16") |>
      dplyr::arrange(date) |>
      dplyr::mutate(week = paste0("W", strftime(date, format = "%V"))) |>
      dplyr::select(-adj_close, -volume) |>
      gt(
        rowname_col = "date",
        groupname_col = "week"
      ) |>
      fmt_date(columns = date, date_style = "day_month_year") |>
      fmt_currency(columns = c(open, high, low, close)) |>
      cols_hide(columns = c(high, low))

    gt_tbl

![This image of a table was generated from the first code example in the
\`extract_body()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_extract_body_1.png)

Using `extract_body()` on the **gt** object (`gt_tbl`) will provide us
with a tibble that contains the fully built data cells for the `output`
context (in this case, `"html"`).

    extract_body(gt_tbl)
    #> # A tibble: 10 x 4
    #>    `::group_id::` `::rowname::`   open      close
    #>    <chr>          <chr>           <chr>     <chr>
    #>  1 W02            5 January 2015  $2,054.44 $2,020.58
    #>  2 W02            6 January 2015  $2,022.15 $2,002.61
    #>  3 W02            7 January 2015  $2,005.55 $2,025.90
    #>  4 W02            8 January 2015  $2,030.61 $2,062.14
    #>  5 W02            9 January 2015  $2,063.45 $2,044.81
    #>  6 W03            12 January 2015 $2,046.13 $2,028.26
    #>  7 W03            13 January 2015 $2,031.58 $2,023.03
    #>  8 W03            14 January 2015 $2,018.40 $2,011.27
    #>  9 W03            15 January 2015 $2,013.75 $1,992.67
    #> 10 W03            16 January 2015 $1,992.25 $2,019.42

To provide us with a better frame of reference, the grouping and row
label values are provided as the first columns in the returned output.
We could suppress those in the output by setting
`incl_stub_cols = FALSE`.

    extract_body(gt_tbl, incl_stub_cols = FALSE)
    #> # A tibble: 10 x 2
    #>    open      close
    #>    <chr>     <chr>
    #>  1 $2,054.44 $2,020.58
    #>  2 $2,022.15 $2,002.61
    #>  3 $2,005.55 $2,025.90
    #>  4 $2,030.61 $2,062.14
    #>  5 $2,063.45 $2,044.81
    #>  6 $2,046.13 $2,028.26
    #>  7 $2,031.58 $2,023.03
    #>  8 $2,018.40 $2,011.27
    #>  9 $2,013.75 $1,992.67
    #> 10 $1,992.25 $2,019.42

The `high` and `low` columns were hidden via
[`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md) and so
they won't be shown in the returned data unless we use
`incl_hidden_cols = TRUE`.

    extract_body(
      gt_tbl,
      incl_stub_cols = FALSE,
      incl_hidden_cols = TRUE
    )
    #> # A tibble: 10 x 4
    #>    open      high      low       close
    #>    <chr>     <chr>     <chr>     <chr>
    #>  1 $2,054.44 $2,054.44 $2,017.34 $2,020.58
    #>  2 $2,022.15 $2,030.25 $1,992.44 $2,002.61
    #>  3 $2,005.55 $2,029.61 $2,005.55 $2,025.90
    #>  4 $2,030.61 $2,064.08 $2,030.61 $2,062.14
    #>  5 $2,063.45 $2,064.43 $2,038.33 $2,044.81
    #>  6 $2,046.13 $2,049.30 $2,022.58 $2,028.26
    #>  7 $2,031.58 $2,056.93 $2,008.25 $2,023.03
    #>  8 $2,018.40 $2,018.40 $1,988.44 $2,011.27
    #>  9 $2,013.75 $2,021.35 $1,991.47 $1,992.67
    #> 10 $1,992.25 $2,020.46 $1,988.12 $2,019.42

## Function ID

13-7

## Function Introduced

`v0.10.0` (October 7, 2023)

## See also

Other table export functions:
[`as_gtable()`](https://gt.rstudio.com/reference/as_gtable.md),
[`as_latex()`](https://gt.rstudio.com/reference/as_latex.md),
[`as_raw_html()`](https://gt.rstudio.com/reference/as_raw_html.md),
[`as_rtf()`](https://gt.rstudio.com/reference/as_rtf.md),
[`as_word()`](https://gt.rstudio.com/reference/as_word.md),
[`extract_cells()`](https://gt.rstudio.com/reference/extract_cells.md),
[`extract_summary()`](https://gt.rstudio.com/reference/extract_summary.md),
[`gtsave()`](https://gt.rstudio.com/reference/gtsave.md)
