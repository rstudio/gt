# Format a vector containing Markdown text

Any Markdown-formatted text in the input vector will be transformed to
the appropriate output type.

## Usage

``` r
vec_fmt_markdown(
  x,
  md_engine = c("markdown", "commonmark"),
  output = c("auto", "plain", "html", "latex", "rtf", "word")
)
```

## Arguments

- x:

  *The input vector*

  `vector(numeric|integer)` // **required**

  This is the input vector that will undergo transformation to a
  character vector of the same length. Values within the vector will be
  formatted.

- md_engine:

  *Choice of Markdown engine*

  `singl-kw:[markdown|commonmark]` // *default:* `"markdown"`

  The engine preference for Markdown rendering. By default, this is set
  to `"markdown"` where **gt** will use the **markdown** package for
  Markdown conversion to HTML and LaTeX. The other option is
  `"commonmark"` and with that the **commonmark** package will be used.

- output:

  *Output format*

  `singl-kw:[auto|plain|html|latex|rtf|word]` // *default:* `"auto"`

  The output style of the resulting character vector. This can either be
  `"auto"` (the default), `"plain"`, `"html"`, `"latex"`, `"rtf"`, or
  `"word"`. In **knitr** rendering (i.e., Quarto or R Markdown), the
  `"auto"` option will choose the correct `output` value

## Value

A character vector.

## Examples

Create a vector of Markdown-based text snippets.

    text_vec <-
      c(
        "This **is** *Markdown*.",
        "Info on Markdown syntax can be found
    [here](https://daringfireball.net/projects/markdown/).",
        "The **gt** package has these datasets:
    - `countrypops`
    - `sza`
    - `gtcars`
    - `sp500`
    - `pizzaplace`
    - `exibble`"
      )

With `vec_fmt_markdown()` we can easily convert these to different
output types, like HTML

    vec_fmt_markdown(text_vec, output = "html")
    #> [1] "This <strong>is</strong> <em>Markdown</em>.</span>"
    #> [2] "Info on Markdown syntax can be found\n<a href=\"https://daringfireball.net/projects/markdown/\">here</a>.</span>"
    #> [3] "The <strong>gt</strong> package has these datasets:</p>\n<ul>\n<li><code>countrypops</code></li>\n<li><code>sza</code></li>\n<li><code>gtcars</code></li>\n<li><code>sp500</code></li>\n<li><code>pizzaplace</code></li>\n<li><code>exibble</code></li>\n</ul>"

or LaTeX

    vec_fmt_markdown(text_vec, output = "latex")
    #> [1] "This \\textbf{is} \\emph{Markdown}."
    #> [2] "Info on Markdown syntax can be found\n\\href{https://daringfireball.net/projects/markdown/}{here}."
    #> [3] "The \\textbf{gt} package has these datasets:\n\n\\begin{itemize}\n\\item \\texttt{countrypops}\n\n\\item \\texttt{sza}\n\n\\item \\texttt{gtcars}\n\n\\item \\texttt{sp500}\n\n\\item \\texttt{pizzaplace}\n\n\\item \\texttt{exibble}\n\n\\end{itemize}"

## Function ID

15-18

## Function Introduced

`v0.7.0` (Aug 25, 2022)

## See also

The variant function intended for formatting **gt** table data:
[`fmt_markdown()`](https://gt.rstudio.com/reference/fmt_markdown.md).

Other vector formatting functions:
[`vec_fmt_bytes()`](https://gt.rstudio.com/reference/vec_fmt_bytes.md),
[`vec_fmt_currency()`](https://gt.rstudio.com/reference/vec_fmt_currency.md),
[`vec_fmt_date()`](https://gt.rstudio.com/reference/vec_fmt_date.md),
[`vec_fmt_datetime()`](https://gt.rstudio.com/reference/vec_fmt_datetime.md),
[`vec_fmt_duration()`](https://gt.rstudio.com/reference/vec_fmt_duration.md),
[`vec_fmt_engineering()`](https://gt.rstudio.com/reference/vec_fmt_engineering.md),
[`vec_fmt_fraction()`](https://gt.rstudio.com/reference/vec_fmt_fraction.md),
[`vec_fmt_index()`](https://gt.rstudio.com/reference/vec_fmt_index.md),
[`vec_fmt_integer()`](https://gt.rstudio.com/reference/vec_fmt_integer.md),
[`vec_fmt_number()`](https://gt.rstudio.com/reference/vec_fmt_number.md),
[`vec_fmt_number_si()`](https://gt.rstudio.com/reference/vec_fmt_number_si.md),
[`vec_fmt_partsper()`](https://gt.rstudio.com/reference/vec_fmt_partsper.md),
[`vec_fmt_percent()`](https://gt.rstudio.com/reference/vec_fmt_percent.md),
[`vec_fmt_roman()`](https://gt.rstudio.com/reference/vec_fmt_roman.md),
[`vec_fmt_scientific()`](https://gt.rstudio.com/reference/vec_fmt_scientific.md),
[`vec_fmt_spelled_num()`](https://gt.rstudio.com/reference/vec_fmt_spelled_num.md),
[`vec_fmt_time()`](https://gt.rstudio.com/reference/vec_fmt_time.md)
