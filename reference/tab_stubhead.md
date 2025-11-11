# Add label text to the stubhead

We can add a label to the stubhead of a **gt** table with
`tab_stubhead()`. The stubhead is the lone part of the table that is
positioned left of the column labels, and above the stub. If a stub does
not exist, then there is no stubhead (so no visible change will be made
when using this function in that case). We have the flexibility to use
Markdown formatting for the stubhead label via the
[`md()`](https://gt.rstudio.com/reference/md.md) helper function.
Furthermore, if the table is intended for HTML output, we can use HTML
inside of [`html()`](https://gt.rstudio.com/reference/html.md) for the
stubhead label.

## Usage

``` r
tab_stubhead(data, label)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- label:

  *Stubhead label text*

  `vector<character>` // **required**

  The text to be used as the stubhead label(s). For tables with
  multi-column stubs, you can provide either a single label that spans
  all stub columns, or a vector of labels with one label for each stub
  column. We can optionally use
  [`md()`](https://gt.rstudio.com/reference/md.md) or
  [`html()`](https://gt.rstudio.com/reference/html.md) to style the text
  as Markdown or to retain HTML elements in the text.

## Value

An object of class `gt_tbl`.

## Examples

Using a small subset of the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset, we can
create a **gt** table with row labels. Since we have row labels in the
stub (via use of `rowname_col = "model"` in the
[`gt()`](https://gt.rstudio.com/reference/gt.md) function call) we have
a stubhead, so, let's add a stubhead label (`"car"`) with
`tab_stubhead()` to describe what's in the stub.

    gtcars |>
      dplyr::select(model, year, hp, trq) |>
      dplyr::slice(1:5) |>
      gt(rowname_col = "model") |>
      tab_stubhead(label = "car")

![This image of a table was generated from the first code example in the
\`tab_stubhead()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_stubhead_1.png)

The stubhead can contain all sorts of interesting content. How about an
icon for a car? We can make this happen with help from the
**fontawesome** package.

    gtcars |>
      dplyr::select(model, year, hp, trq) |>
      dplyr::slice(1:5) |>
      gt(rowname_col = "model") |>
      tab_stubhead(label = fontawesome::fa("car"))

![This image of a table was generated from the second code example in
the \`tab_stubhead()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_stubhead_2.png)

If the stub is two columns wide (made possible by using
`row_group_as_column = TRUE` in the
[`gt()`](https://gt.rstudio.com/reference/gt.md) statement), the
stubhead will be a merged cell atop those two stub columns representing
the row group and the row label. Here's an example of that type of
situation in a table that uses the
[`peeps`](https://gt.rstudio.com/reference/peeps.md) dataset.

    peeps |>
      dplyr::filter(country %in% c("POL", "DEU")) |>
      dplyr::group_by(country) |>
      dplyr::filter(dplyr::row_number() %in% 1:5) |>
      dplyr::ungroup() |>
      dplyr::mutate(name = paste0(toupper(name_family), ", ", name_given)) |>
      dplyr::select(name, address, city, postcode, country) |>
      gt(
        rowname_col = "name",
        groupname_col = "country",
        row_group_as_column = TRUE
      ) |>
      tab_stubhead(label = "Country Code / Person") |>
      tab_style(
        style = cell_text(transform = "capitalize"),
        locations = cells_column_labels()
      )

![This image of a table was generated from the third code example in the
\`tab_stubhead()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_stubhead_3.png)

For tables with multi-column stubs (created by specifying multiple
columns in `rowname_col`), you can provide either a single label that
spans all stub columns, or a vector of labels with one label for each
stub column. Here's an example using the
[`countrypops`](https://gt.rstudio.com/reference/countrypops.md) dataset
with a single spanning label:

    countrypops |>
      dplyr::filter(country_name %in% c("China", "India", "United States", "Indonesia")) |>
      dplyr::filter(year >= 2000) |>
      dplyr::select(country_name, country_code_2, year, population) |>
      gt(rowname_col = c("country_name", "country_code_2")) |>
      tab_stubhead(label = "Country Information") |>
      fmt_integer(columns = population)

Alternatively, you can provide a vector of labels, one for each stub
column. This allows for more descriptive and specific headers for each
column:

    countrypops |>
      dplyr::filter(country_name %in% c("China", "India", "United States", "Indonesia")) |>
      dplyr::filter(year >= 2000) |>
      dplyr::select(country_name, country_code_2, year, population) |>
      gt(rowname_col = c("country_name", "country_code_2")) |>
      tab_stubhead(label = c("Country", "Code")) |>
      fmt_integer(columns = population)

You can also use this approach with three or more stub columns. Here's
an example creating a hierarchical structure with region, country, and
year:

    countrypops |>
      dplyr::filter(country_name %in% c("China", "India", "United States", "Indonesia")) |>
      dplyr::filter(year %in% c(2000, 2010, 2020)) |>
      dplyr::mutate(
        region = dplyr::case_when(
          country_name %in% c("China", "India", "Indonesia") ~ "Asia",
          country_name == "United States" ~ "North America",
          TRUE ~ "Other"
        )
      ) |>
      dplyr::select(region, country_name, year, population) |>
      gt(rowname_col = c("region", "country_name", "year")) |>
      tab_stubhead(label = c("Region", "Country", "Year")) |>
      fmt_integer(columns = population)

## Function ID

2-5

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other part creation/modification functions:
[`tab_caption()`](https://gt.rstudio.com/reference/tab_caption.md),
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md),
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md),
[`tab_info()`](https://gt.rstudio.com/reference/tab_info.md),
[`tab_options()`](https://gt.rstudio.com/reference/tab_options.md),
[`tab_row_group()`](https://gt.rstudio.com/reference/tab_row_group.md),
[`tab_source_note()`](https://gt.rstudio.com/reference/tab_source_note.md),
[`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md),
[`tab_spanner_delim()`](https://gt.rstudio.com/reference/tab_spanner_delim.md),
[`tab_stub_indent()`](https://gt.rstudio.com/reference/tab_stub_indent.md),
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md),
[`tab_style_body()`](https://gt.rstudio.com/reference/tab_style_body.md)
