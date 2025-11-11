# Add a table header

We can add a table header to the **gt** table with a title and even a
subtitle using `tab_header()`. A table header is an optional table part
that is positioned just above the column labels table part. We have the
flexibility to use Markdown or HTML formatting for the header's title
and subtitle with the [`md()`](https://gt.rstudio.com/reference/md.md)
and [`html()`](https://gt.rstudio.com/reference/html.md) helper
functions.

## Usage

``` r
tab_header(data, title, subtitle = NULL, preheader = NULL)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- title:

  *Header title*

  `scalar<character>` // **required**

  Text to be used in the table title. We can elect to use the
  [`md()`](https://gt.rstudio.com/reference/md.md) and
  [`html()`](https://gt.rstudio.com/reference/html.md) helper functions
  to style the text as Markdown or to retain HTML elements in the text.

- subtitle:

  *Header subtitle*

  `scalar<character>` // *default:* `NULL` (`optional`)

  Text to be used in the table subtitle. We can elect to use
  [`md()`](https://gt.rstudio.com/reference/md.md) or
  [`html()`](https://gt.rstudio.com/reference/html.md) helper functions
  to style the text as Markdown or to retain HTML elements in the text.

- preheader:

  *RTF preheader text*

  `vector<character>` // *default:* `NULL` (`optional`)

  Optional preheader content that is rendered above the table for RTF
  output. Can be supplied as a vector of text.

## Value

An object of class `gt_tbl`.

## Examples

Let's use a small portion of the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset to create
a **gt** table. A header part can be added to the table with the
`tab_header()` function. We'll add a title and the optional subtitle as
well. With [`md()`](https://gt.rstudio.com/reference/md.md), we can make
sure the Markdown formatting is interpreted and transformed.

    gtcars |>
      dplyr::select(mfr, model, msrp) |>
      dplyr::slice(1:5) |>
      gt() |>
      tab_header(
        title = md("Data listing from **gtcars**"),
        subtitle = md("`gtcars` is an R dataset")
      )

![This image of a table was generated from the first code example in the
\`tab_header()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_header_1.png)

If the table is intended solely as an HTML table, you could introduce
your own HTML elements into the header. You can even use the
**htmltools** package to help arrange and generate the HTML. Here's an
example of that, where two `<div>` elements are placed in a
[`htmltools::tagList()`](https://rstudio.github.io/htmltools/reference/tagList.html).

    gtcars |>
      dplyr::select(mfr, model, msrp) |>
      dplyr::slice(1:5) |>
      gt() |>
      tab_header(
        title =
          htmltools::tagList(
            htmltools::tags$div(
              htmltools::HTML(
                web_image("https://www.r-project.org/logo/Rlogo.png")
              ),
              style = htmltools::css(`text-align` = "center")
            ),
            htmltools::tags$div(
              "Data listing from ", htmltools::tags$strong("gtcars")
            )
          )
      )

![This image of a table was generated from the second code example in
the \`tab_header()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_header_2.png)

If using HTML but doing something far simpler, we can wrap our title or
subtitle inside [`html()`](https://gt.rstudio.com/reference/html.md) to
declare that the text provided is HTML.

    gtcars |>
      dplyr::select(mfr, model, msrp) |>
      dplyr::slice(1:5) |>
      gt() |>
      tab_header(
        title = html("Data listing from <strong>gtcars</strong>"),
        subtitle = html("From <span style='color:red;'>gtcars</span>")
      )

![This image of a table was generated from the third code example in the
\`tab_header()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_header_3.png)

Sometimes, aligning the heading elements to the left can improve the
presentation of a table. Here, we use the
[`nuclides`](https://gt.rstudio.com/reference/nuclides.md) dataset to
generate a display of natural abundance values for several stable
isotopes.
[`opt_align_table_header()`](https://gt.rstudio.com/reference/opt_align_table_header.md)
is used with `align = "left"` to make it so the title and subtitle are
left aligned in the header area.

    nuclides |>
      dplyr::filter(!is.na(abundance)) |>
      dplyr::filter(abundance != 1) |>
      dplyr::filter(z >= 1 & z <= 8) |>
      dplyr::mutate(element = paste0(element, ", **z = ", z, "**")) |>
      dplyr::mutate(nuclide = gsub("[0-9]+$", "", nuclide)) |>
      dplyr::select(nuclide, element, atomic_mass, abundance, abundance_uncert) |>
      gt(
        rowname_col = "nuclide",
        groupname_col = "element",
        process_md = TRUE
      ) |>
      tab_header(
        title = "Natural Abundance Values",
        subtitle = md("For elements having atomic numbers from `1` to `8`.")
      ) |>
      tab_stubhead(label = "Isotope") |>
      tab_stub_indent(
        rows = everything(),
        indent = 1
      ) |>
      fmt_chem(columns = stub()) |>
      fmt_number(
        columns = atomic_mass,
        decimals = 4,
        scale_by = 1 / 1e6
      ) |>
      fmt_percent(
        columns = contains("abundance"),
        decimals = 4
      ) |>
      cols_merge_uncert(
        col_val = abundance,
        col_uncert = abundance_uncert
      ) |>
      cols_label_with(fn = function(x) tools::toTitleCase(gsub("_", " ", x))) |>
      cols_width(
        stub() ~ px(70),
        atomic_mass ~ px(120),
        abundance ~ px(200)
      ) |>
      opt_align_table_header(align = "left") |>
      opt_vertical_padding(scale = 0.5)

![This image of a table was generated from the fourth code example in
the \`tab_header()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_header_4.png)

## Function ID

2-1

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other part creation/modification functions:
[`tab_caption()`](https://gt.rstudio.com/reference/tab_caption.md),
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md),
[`tab_info()`](https://gt.rstudio.com/reference/tab_info.md),
[`tab_options()`](https://gt.rstudio.com/reference/tab_options.md),
[`tab_row_group()`](https://gt.rstudio.com/reference/tab_row_group.md),
[`tab_source_note()`](https://gt.rstudio.com/reference/tab_source_note.md),
[`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md),
[`tab_spanner_delim()`](https://gt.rstudio.com/reference/tab_spanner_delim.md),
[`tab_stub_indent()`](https://gt.rstudio.com/reference/tab_stub_indent.md),
[`tab_stubhead()`](https://gt.rstudio.com/reference/tab_stubhead.md),
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md),
[`tab_style_body()`](https://gt.rstudio.com/reference/tab_style_body.md)
