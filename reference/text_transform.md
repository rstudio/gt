# Perform text transformations with a custom function

Text transforming in **gt** is the act of modifying formatted strings in
targeted cells. `text_transform()` provides the most flexibility of all
the `text_*()` functions in their family of functions. With it, you
target the cells to undergo modification in the `locations` argument
while also supplying a function to the `fn` argument. The function given
to `fn` should ideally at the very least take `x` as an input (it stands
for the character vector that is essentially the targeted cells) and
return a character vector of the same length as the input. Using the
construction `function(x) { .. }` for the function is recommended.

## Usage

``` r
text_transform(data, fn, locations = cells_body())
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- fn:

  *Function for text transformation*

  `<function>` // **required**

  The function to use for text transformation. It should include `x` as
  an argument and return a character vector of the same length as the
  input `x`.

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

Use a subset of the [`sp500`](https://gt.rstudio.com/reference/sp500.md)
dataset to create a **gt** table. Transform the text in the `date`
column using a function supplied to `text_transform()` (via the `fn`
argument). Note that the `x` in the `fn = function (x)` part consists
entirely of ISO 8601 date strings (which are acceptable as input to
[`vec_fmt_date()`](https://gt.rstudio.com/reference/vec_fmt_date.md) and
[`vec_fmt_datetime()`](https://gt.rstudio.com/reference/vec_fmt_datetime.md)).

    sp500 |>
      dplyr::slice_head(n = 10) |>
      dplyr::select(date, open, close) |>
      dplyr::arrange(-dplyr::row_number()) |>
      gt() |>
      fmt_currency() |>
      text_transform(
        fn = function(x) {
          paste0(
            "<strong>",
            vec_fmt_date(x, date_style = "m_day_year"),
            "</strong>",
            "&mdash;W",
            vec_fmt_datetime(x, format = "w")
          )
        },
        locations = cells_body(columns = date)
      ) |>
      cols_label(
        date = "Date and Week",
        open = "Opening Price",
        close = "Closing Price"
      )

![This image of a table was generated from the first code example in the
\`text_transform()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_text_transform_1.png)

Let's use a summarized version of the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset to create
a **gt** table. First, the numeric values in the `n` column are
formatted as spelled-out numbers with
[`fmt_spelled_num()`](https://gt.rstudio.com/reference/fmt_spelled_num.md).
The output values are indeed spelled out but exclusively with lowercase
letters. We actually want these words to begin with a capital letter and
end with a period. To make this possible, `text_transform()` will be
used since it can modify already-formatted text. Through the `fn`
argument, we provide a custom function that uses R's `toTitleCase()`
operating on `x` (the numbers-as-text strings) within
[`paste0()`](https://rdrr.io/r/base/paste.html) so that a period can be
properly placed.

    gtcars |>
      dplyr::filter(ctry_origin %in% c("Germany", "Italy", "Japan")) |>
      dplyr::count(mfr, ctry_origin, sort = TRUE) |>
      dplyr::arrange(ctry_origin) |>
      gt(rowname_col = "mfr", groupname_col = "ctry_origin") |>
      cols_label(n = "No. of Entries") |>
      tab_stub_indent(rows = everything(), indent = 2) |>
      cols_align(align = "center", columns = n) |>
      fmt_spelled_num() |>
      text_transform(
        fn = function(x) {
          paste0(tools::toTitleCase(x), ".")
        },
        locations = cells_body(columns = n)
      )

![This image of a table was generated from the second code example in
the \`text_transform()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_text_transform_2.png)

There may be occasions where you'd want to remove all text. Here in this
example based on the
[`pizzaplace`](https://gt.rstudio.com/reference/pizzaplace.md) dataset,
we generate a **gt** table that summarizes an entire year of data by
colorizing the daily sales revenue. Individual cell values are not
needed here (since the encoding by color suffices), so,
`text_transform()` is used to turn every value to an empty string: `""`.

    pizzaplace |>
      dplyr::group_by(date) |>
      dplyr::summarize(rev = sum(price)) |>
      dplyr::ungroup() |>
      dplyr::mutate(
        month = lubridate::month(date, label = TRUE),
        day_num = lubridate::mday(date)
      ) |>
      dplyr::select(-date) |>
      tidyr::pivot_wider(names_from = month, values_from = rev) |>
      gt(rowname_col = "day_num") |>
      data_color(
        method = "numeric",
        palette = "wesanderson::Zissou1",
        na_color = "white"
      ) |>
      text_transform(
        fn = function(x) "",
        locations = cells_body()
      ) |>
      opt_table_lines(extent = "none") |>
      opt_all_caps() |>
      cols_width(everything() ~ px(35)) |>
      cols_align(align = "center")

![This image of a table was generated from the third code example in the
\`text_transform()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_text_transform_3.png)

## Function ID

4-4

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other text transforming functions:
[`text_case_match()`](https://gt.rstudio.com/reference/text_case_match.md),
[`text_case_when()`](https://gt.rstudio.com/reference/text_case_when.md),
[`text_replace()`](https://gt.rstudio.com/reference/text_replace.md)
