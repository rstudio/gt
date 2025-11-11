# Helper function for adding an image from the web

We can flexibly add a web image inside of a table with `web_image()`.
The function provides a convenient way to generate an HTML fragment with
an image URL. Because this function is currently HTML-based, it is only
useful for HTML table output. To use this function inside of data cells,
it is recommended to use
[`text_transform()`](https://gt.rstudio.com/reference/text_transform.md).
With that function, we can specify which data cells to target and then
include a `web_image()` call within the required user-defined function
(for the `fn` argument). If we want to include an image in other places
(e.g., in the header, within footnote text, etc.) we need to wrap
`web_image()` inside
[`html()`](https://gt.rstudio.com/reference/html.md).

By itself, the function creates an HTML image tag, so, the call
`web_image("http://example.com/image.png")` evaluates to:

`<img src=\"http://example.com/image.png\" style=\"height:30px;\">`

where a height of `30px` is a default height chosen to work well within
the heights of most table rows.

## Usage

``` r
web_image(url, height = 30)
```

## Arguments

- url:

  *An image URL*

  `scalar<character>` // **required**

  A url that resolves to an image file.

- height:

  *Height of image*

  `scalar<numeric|integer>` // *default:* `30`

  The absolute height of the image in the table cell (in `"px"` units).
  By default, this is set to `"30px"`.

## Value

A character object with an HTML fragment that can be placed inside of a
cell.

## Examples

Get the PNG-based logo for the R Project from an image URL.

    r_png_url <- "https://www.r-project.org/logo/Rlogo.png"

Create a tibble that contains heights of an image in pixels (one column
as a string, the other as numerical values), then, create a **gt**
table. Use
[`text_transform()`](https://gt.rstudio.com/reference/text_transform.md)
to insert the R logo PNG image with the various sizes.

    dplyr::tibble(
      pixels = px(seq(10, 35, 5)),
      image = seq(10, 35, 5)
    ) |>
      gt() |>
      text_transform(
        locations = cells_body(columns = image),
        fn = function(x) {
          web_image(
            url = r_png_url,
            height = as.numeric(x)
          )
        }
      )

![This image of a table was generated from the first code example in the
\`web_image()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_web_image_1.png)

Get the SVG-based logo for the R Project from an image URL.

    r_svg_url <- "https://www.r-project.org/logo/Rlogo.svg"

Create a tibble that contains heights of an image in pixels (one column
as a string, the other as numerical values), then, create a **gt**
table. Use
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md) to
insert the **R** logo SVG image once in the title and five times in the
subtitle.

    dplyr::tibble(
      pixels = px(seq(10, 35, 5)),
      image = seq(10, 35, 5)
    ) |>
      gt() |>
      tab_header(
        title = html(
          "<strong>R Logo</strong>",
          web_image(
            url = r_svg_url,
            height = px(50)
          )
        ),
        subtitle = html(
          web_image(
            url = r_svg_url,
            height = px(12)
          ) |>
            rep(5)
        )
      )

![This image of a table was generated from the second code example in
the \`web_image()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_web_image_2.png)

## Function ID

9-1

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other image addition functions:
[`ggplot_image()`](https://gt.rstudio.com/reference/ggplot_image.md),
[`local_image()`](https://gt.rstudio.com/reference/local_image.md),
[`test_image()`](https://gt.rstudio.com/reference/test_image.md)
