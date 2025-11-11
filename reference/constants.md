# The fundamental physical constants

This dataset contains values for over 300 basic fundamental constants in
nature. The values originate from the 2018 adjustment which is based on
the latest relevant precision measurements and improvements of
theoretical calculations. Such work has been carried out under the
authority of the *Task Group on Fundamental Constants* (TGFC) of the
*Committee on Data of the International Science Council* (CODATA). These
updated values became available on May 20, 2019. They are published at
<https://physics.nist.gov/cuu/Constants/index.html>, a website of the
*Fundamental Constants Data Center* of the *National Institute of
Standards and Technology* (NIST), Gaithersburg, Maryland, USA.

## Usage

``` r
constants
```

## Format

A tibble with 354 rows and 4 variables:

- name:

  The name of the constant.

- value:

  The value of the constant.

- uncert:

  The uncertainty associated with the value. If `NA` then the value is
  seen as an 'exact' value (e.g., an electron volt has the exact value
  of 1.602 176 634 e-19 J).

- sf_value,sf_uncert:

  The number of significant figures associated with the value and any
  uncertainty value.

- units:

  The units associated with the constant.

## Dataset ID and Badge

DATA-12

![This image of that of a dataset
badge.](https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_constants.png)

## Dataset Introduced

`v0.10.0` (October 7, 2023)

## See also

Other datasets:
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
[`sza`](https://gt.rstudio.com/reference/sza.md),
[`towny`](https://gt.rstudio.com/reference/towny.md)

## Examples

``` r
dplyr::glimpse(constants)
#> Rows: 354
#> Columns: 6
#> $ name      <chr> "alpha particle-electron mass ratio", "alpha particle mass",…
#> $ value     <dbl> 7.294300e+03, 6.644657e-27, 5.971920e-10, 3.727379e+03, 4.00…
#> $ uncert    <dbl> 2.4e-07, 2.0e-36, 1.8e-19, 1.1e-06, 6.3e-11, 1.2e-12, 2.2e-1…
#> $ sf_value  <dbl> 12, 11, 11, 11, 13, 11, 12, 13, 9, 12, 12, 11, 11, 11, 12, 1…
#> $ sf_uncert <dbl> 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, …
#> $ units     <chr> NA, "kg", "J", "MeV", "u", "kg mol^-1", NA, NA, "m", "kg", "…
```
