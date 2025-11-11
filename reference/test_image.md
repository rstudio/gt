# Generate a path to a test image

Two test images are available within the **gt** package. Both contain
the same imagery (sized at 200px by 200px) but one is a PNG file while
the other is an SVG file. This function is most useful when paired with
[`local_image()`](https://gt.rstudio.com/reference/local_image.md) since
we test various sizes of the test image within that function.

## Usage

``` r
test_image(type = c("png", "svg"))
```

## Arguments

- type:

  *The image type*

  `singl-kw:[png|svg]` // *default:* `"png"`

  The type of image to produce here can either be `"png"` (the default)
  or `"svg"`.

## Value

A character vector with a single path to an image file.

## Function ID

9-4

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other image addition functions:
[`ggplot_image()`](https://gt.rstudio.com/reference/ggplot_image.md),
[`local_image()`](https://gt.rstudio.com/reference/local_image.md),
[`web_image()`](https://gt.rstudio.com/reference/web_image.md)
