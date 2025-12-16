# Twice hourly solar zenith angles by month & latitude

This dataset contains solar zenith angles (in degrees, with the range of
0-90) every half hour from 04:00 to 12:00, true solar time. This set of
values is calculated on the first of every month for 4 different
northern hemisphere latitudes. For determination of afternoon values,
the presented tabulated values are symmetric about noon.

## Usage

``` r
sza
```

## Format

A tibble with 816 rows and 4 variables:

- latitude:

  The latitude in decimal degrees for the observations.

- month:

  The measurement month. All calculations where conducted for the first
  day of each month.

- tst:

  The true solar time at the given `latitude` and date (first of
  `month`) for which the solar zenith angle is calculated.

- sza:

  The solar zenith angle in degrees, where `NA`s indicate that sunrise
  hadn't yet occurred by the `tst` value.

## Details

The solar zenith angle (SZA) is one measure that helps to describe the
sun's path across the sky. It's defined as the angle of the sun relative
to a line perpendicular to the earth's surface. It is useful to
calculate the SZA in relation to the true solar time. True solar time
relates to the position of the sun with respect to the observer, which
is different depending on the exact longitude. For example, two hours
before the sun crosses the meridian (the highest point it would reach
that day) corresponds to a true solar time of 10 a.m. The SZA has a
strong dependence on the observer's latitude. For example, at a latitude
of 50 degrees N at the start of January, the noontime SZA is 73.0 but a
different observer at 20 degrees N would measure the noontime SZA to be
43.0 degrees.

## Dataset ID and Badge

DATA-2

![This image of that of a dataset
badge.](https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_sza.png)

## Dataset Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other datasets:
[`constants`](https://gt.rstudio.com/reference/constants.md),
[`countrypops`](https://gt.rstudio.com/reference/countrypops.md),
[`exibble`](https://gt.rstudio.com/reference/exibble.md),
[`films`](https://gt.rstudio.com/reference/films.md),
[`gibraltar`](https://gt.rstudio.com/reference/gibraltar.md),
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md),
[`illness`](https://gt.rstudio.com/reference/illness.md),
[`metro`](https://gt.rstudio.com/reference/metro.md),
[`nuclides`](https://gt.rstudio.com/reference/nuclides.md),
[`peeps`](https://gt.rstudio.com/reference/peeps.md),
[`photolysis`](https://gt.rstudio.com/reference/photolysis.md),
[`pizzaplace`](https://gt.rstudio.com/reference/pizzaplace.md),
[`reactions`](https://gt.rstudio.com/reference/reactions.md),
[`rx_addv`](https://gt.rstudio.com/reference/rx_addv.md),
[`rx_adsl`](https://gt.rstudio.com/reference/rx_adsl.md),
[`sp500`](https://gt.rstudio.com/reference/sp500.md),
[`towny`](https://gt.rstudio.com/reference/towny.md)

## Examples

``` r
dplyr::glimpse(sza)
#> Rows: 816
#> Columns: 4
#> $ latitude <dbl> 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 2…
#> $ month    <fct> jan, jan, jan, jan, jan, jan, jan, jan, jan, jan, jan, jan, j…
#> $ tst      <chr> "0400", "0430", "0500", "0530", "0600", "0630", "0700", "0730…
#> $ sza      <dbl> NA, NA, NA, NA, NA, NA, 84.9, 78.7, 72.7, 66.1, 61.5, 56.5, 5…
```
