# Format Markdown text

Any Markdown-formatted text in the incoming cells will be transformed to
the appropriate output type during render when using `fmt_markdown()`.

## Usage

``` r
fmt_markdown(
  data,
  columns = everything(),
  rows = everything(),
  md_engine = c("markdown", "commonmark")
)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- columns:

  *Columns to target*

  [`<column-targeting expression>`](https://gt.rstudio.com/reference/rows-columns.md)
  // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  Can either be a series of column names provided in
  [`c()`](https://rdrr.io/r/base/c.html), a vector of column indices, or
  a select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).

- rows:

  *Rows to target*

  [`<row-targeting expression>`](https://gt.rstudio.com/reference/rows-columns.md)
  // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  In conjunction with `columns`, we can specify which of their rows
  should undergo formatting. The default
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)
  results in all rows in `columns` being formatted. Alternatively, we
  can supply a vector of row captions within
  [`c()`](https://rdrr.io/r/base/c.html), a vector of row indices, or a
  select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).
  We can also use expressions to filter down to the rows we need (e.g.,
  `[colname_1] > 100 & [colname_2] < 50`).

- md_engine:

  *Choice of Markdown engine*

  `singl-kw:[markdown|commonmark]` // *default:* `"markdown"`

  The engine preference for Markdown rendering. By default, this is set
  to `"markdown"` where **gt** will use the **markdown** package for
  Markdown conversion to HTML and LaTeX. The other option is
  `"commonmark"` and with that the **commonmark** package will be used.

## Value

An object of class `gt_tbl`.

## Compatibility of arguments with the [`from_column()`](https://gt.rstudio.com/reference/from_column.md) helper function

[`from_column()`](https://gt.rstudio.com/reference/from_column.md) can
be used with the `md_engine` argument of `fmt_markdown()` to obtain
varying parameter values from a specified column within the table. This
means that each row could be formatted a little bit differently.

Please note that for this argument (`md_engine`), a
[`from_column()`](https://gt.rstudio.com/reference/from_column.md) call
needs to reference a column that has data of the `character` type.
Additional columns for parameter values can be generated with
[`cols_add()`](https://gt.rstudio.com/reference/cols_add.md) (if not
already present). Columns that contain parameter data can also be hidden
from final display with
[`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md).

## Examples

Create a few Markdown-based text snippets.

    text_1a <- "
    ### This is Markdown.

    Markdown's syntax is comprised entirely of
    punctuation characters, which punctuation
    characters have been carefully chosen so as
    to look like what they mean... assuming
    you've ever used email.
    "

    text_1b <- "
    Info on Markdown syntax can be found
    [here](https://daringfireball.net/projects/markdown/).
    "

    text_2a <- "
    The **gt** package has these datasets:

     - `countrypops`
     - `sza`
     - `gtcars`
     - `sp500`
     - `pizzaplace`
     - `exibble`
    "

    text_2b <- "
    There's a quick reference [here](https://commonmark.org/help/).
    "

Arrange the text snippets as a tibble using
[`dplyr::tribble()`](https://tibble.tidyverse.org/reference/tribble.html),
then, create a **gt** table and format all columns with
`fmt_markdown()`.

    dplyr::tribble(
      ~Markdown, ~md,
      text_1a,   text_2a,
      text_1b,   text_2b,
    ) |>
      gt() |>
      fmt_markdown(columns = everything()) |>
      tab_options(table.width = px(400))

![This image of a table was generated from the first code example in the
\`fmt_markdown()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_markdown_1.png)

`fmt_markdown()` can also handle LaTeX math formulas enclosed in
`"$..$"` (inline math) and also `"$$..$$"` (display math). The following
table has body cells that contain mathematical formulas in display mode
(i.e., the formulas are surrounded by `"$$"`). Further to this, math can
be used within [`md()`](https://gt.rstudio.com/reference/md.md) wherever
there is the possibility to insert text into the table (e.g., with
[`cols_label()`](https://gt.rstudio.com/reference/cols_label.md),
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md), etc.).

    dplyr::tibble(
      idx = 1:5,
      l_time_domain =
        c(
          "$$1$$",
          "$${{\\bf{e}}^{a\\,t}}$$",
          "$${t^n},\\,\\,\\,\\,\\,n = 1,2,3, \\ldots$$",
          "$${t^p}, p > -1$$",
          "$$\\sqrt t$$"
        ),
      l_laplace_s_domain =
        c(
          "$$\\frac{1}{s}$$",
          "$$\\frac{1}{{s - a}}$$",
          "$$\\frac{{n!}}{{{s^{n + 1}}}}$$",
          "$$\\frac{{\\Gamma \\left( {p + 1} \\right)}}{{{s^{p + 1}}}}$$",
          "$$\\frac{{\\sqrt \\pi }}{{2{s^{\\frac{3}{2}}}}}$$"
        )
    ) |>
      gt(rowname_col = "idx") |>
      fmt_markdown() |>
      cols_label(
        l_time_domain = md(
          "Time Domain<br/>$\\small{f\\left( t \\right) =
          {\\mathcal{L}^{\\,\\, - 1}}\\left\\{ {F\\left( s \\right)} \\right\\}}$"
        ),
        l_laplace_s_domain = md(
          "$s$ Domain<br/>$\\small{F\\left( s \\right) =
          \\mathcal{L}\\left\\{ {f\\left( t \\right)} \\right\\}}$"
        )
      ) |>
      tab_header(
        title = md(
          "A (Small) Table of Laplace Transforms &mdash; $\\small{{\\mathcal{L}}}$"
        ),
        subtitle = md(
          "Five commonly used Laplace transforms and formulas.<br/><br/>"
        )
      ) |>
      cols_align(align = "center") |>
      opt_align_table_header(align = "left") |>
      cols_width(
        idx ~ px(50),
        l_time_domain ~ px(300),
        l_laplace_s_domain ~ px(600)
      ) |>
      opt_stylize(
        style = 2,
        color = "gray",
        add_row_striping = FALSE
      ) |>
      opt_table_outline(style = "invisible") |>
      tab_style(
        style = cell_fill(color = "gray95"),
        locations = cells_body(columns = l_time_domain)
      ) |>
      tab_options(
        heading.title.font.size = px(32),
        heading.subtitle.font.size = px(18),
        heading.padding = px(0),
        footnotes.multiline = FALSE,
        column_labels.border.lr.style = "solid",
        column_labels.border.lr.width = px(1)
      )

![This image of a table was generated from the second code example in
the \`fmt_markdown()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_markdown_2.png)

## Function ID

3-28

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

The vector-formatting version of this function:
[`vec_fmt_markdown()`](https://gt.rstudio.com/reference/vec_fmt_markdown.md).

Other data formatting functions:
[`data_color()`](https://gt.rstudio.com/reference/data_color.md),
[`fmt()`](https://gt.rstudio.com/reference/fmt.md),
[`fmt_auto()`](https://gt.rstudio.com/reference/fmt_auto.md),
[`fmt_bins()`](https://gt.rstudio.com/reference/fmt_bins.md),
[`fmt_bytes()`](https://gt.rstudio.com/reference/fmt_bytes.md),
[`fmt_chem()`](https://gt.rstudio.com/reference/fmt_chem.md),
[`fmt_country()`](https://gt.rstudio.com/reference/fmt_country.md),
[`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md),
[`fmt_date()`](https://gt.rstudio.com/reference/fmt_date.md),
[`fmt_datetime()`](https://gt.rstudio.com/reference/fmt_datetime.md),
[`fmt_duration()`](https://gt.rstudio.com/reference/fmt_duration.md),
[`fmt_email()`](https://gt.rstudio.com/reference/fmt_email.md),
[`fmt_engineering()`](https://gt.rstudio.com/reference/fmt_engineering.md),
[`fmt_flag()`](https://gt.rstudio.com/reference/fmt_flag.md),
[`fmt_fraction()`](https://gt.rstudio.com/reference/fmt_fraction.md),
[`fmt_icon()`](https://gt.rstudio.com/reference/fmt_icon.md),
[`fmt_image()`](https://gt.rstudio.com/reference/fmt_image.md),
[`fmt_index()`](https://gt.rstudio.com/reference/fmt_index.md),
[`fmt_integer()`](https://gt.rstudio.com/reference/fmt_integer.md),
[`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md),
[`fmt_number_si()`](https://gt.rstudio.com/reference/fmt_number_si.md),
[`fmt_partsper()`](https://gt.rstudio.com/reference/fmt_partsper.md),
[`fmt_passthrough()`](https://gt.rstudio.com/reference/fmt_passthrough.md),
[`fmt_percent()`](https://gt.rstudio.com/reference/fmt_percent.md),
[`fmt_roman()`](https://gt.rstudio.com/reference/fmt_roman.md),
[`fmt_scientific()`](https://gt.rstudio.com/reference/fmt_scientific.md),
[`fmt_spelled_num()`](https://gt.rstudio.com/reference/fmt_spelled_num.md),
[`fmt_tf()`](https://gt.rstudio.com/reference/fmt_tf.md),
[`fmt_time()`](https://gt.rstudio.com/reference/fmt_time.md),
[`fmt_units()`](https://gt.rstudio.com/reference/fmt_units.md),
[`fmt_url()`](https://gt.rstudio.com/reference/fmt_url.md),
[`sub_large_vals()`](https://gt.rstudio.com/reference/sub_large_vals.md),
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md),
[`sub_small_vals()`](https://gt.rstudio.com/reference/sub_small_vals.md),
[`sub_values()`](https://gt.rstudio.com/reference/sub_values.md),
[`sub_zero()`](https://gt.rstudio.com/reference/sub_zero.md)
