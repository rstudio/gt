# Helper function for adding a local image

We can flexibly add a local image (i.e., an image residing on disk)
inside of a table with `local_image()` function. The function provides a
convenient way to generate an HTML fragment using an on-disk PNG or SVG.
Because this function is currently HTML-based, it is only useful for
HTML table output. To use this function inside of data cells, it is
recommended to use
[`text_transform()`](https://gt.rstudio.com/reference/text_transform.md)
first. With that function, we can specify which data cells to target and
then include a `local_image()` call within the required user-defined
function (for the `fn` argument). If we want to include an image in
other places (e.g., in the header, within footnote text, etc.) we need
to use `local_image()` within the
[`html()`](https://gt.rstudio.com/reference/html.md) helper function.

By itself, the function creates an HTML image tag with an image URI
embedded within. We can easily experiment with a local PNG or SVG image
that's available in the **gt** package using the
[`test_image()`](https://gt.rstudio.com/reference/test_image.md)
function. Using that, the call
`local_image(file = test_image(type = "png"))` evaluates to:

`<img src=<data URI> style=\"height:30px;\">`

where a height of `30px` is a default height chosen to work well within
the heights of most table rows.

## Usage

``` r
local_image(filename, height = 30)
```

## Arguments

- filename:

  *Path to image file*

  `scalar<character>` // **required**

  A local path to an image file on disk.

- height:

  *Height of image*

  `scalar<numeric|integer>` // *default:* `30`

  The absolute height of the image in the table cell (in `"px"` units).
  By default, this is set to `"30px"`.

## Value

A character object with an HTML fragment that can be placed inside of a
cell.

## Examples

Create a tibble that contains heights of an image in pixels (one column
as a string, the other as numerical values), then, create a **gt**
table. Use
[`text_transform()`](https://gt.rstudio.com/reference/text_transform.md)
to insert a local test image (PNG) image with the various sizes.

    dplyr::tibble(
      pixels = px(seq(10, 35, 5)),
      image = seq(10, 35, 5)
    ) |>
      gt() |>
      text_transform(
        locations = cells_body(columns = image),
        fn = function(x) {
          local_image(
            filename = test_image(type = "png"),
            height = as.numeric(x)
          )
        }
      )

![This image of a table was generated from the first code example in the
\`local_image()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_local_image_1.png)

## Function ID

9-2

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other image addition functions:
[`ggplot_image()`](https://gt.rstudio.com/reference/ggplot_image.md),
[`test_image()`](https://gt.rstudio.com/reference/test_image.md),
[`web_image()`](https://gt.rstudio.com/reference/web_image.md)
