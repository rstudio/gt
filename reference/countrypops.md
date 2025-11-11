# Yearly populations of countries from 1960 to 2024

A dataset that presents yearly, total populations of countries. Total
population is based on counts of all residents regardless of legal
status or citizenship. Country identifiers include the English-language
country names, and the 2- and 3-letter ISO 3166-1 country codes. Each
row contains a `population` value for a given `year` (from 1960 to
2024). Any `NA` values within `population` indicate the non-existence of
the entity during that year.

## Usage

``` r
countrypops
```

## Format

A tibble with 13,975 rows and 5 variables:

- country_name:

  The name of the country.

- country_code_2, country_code_3:

  The 2- and 3-letter ISO 3166-1 country codes.

- year:

  The year for the population estimate.

- population:

  The population estimate, midway through the year.

## Source

<https://data.worldbank.org/indicator/SP.POP.TOTL>

## Dataset ID and Badge

DATA-1

![This image of that of a dataset
badge.](https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_countrypops.png)

## Dataset Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other datasets:
[`constants`](https://gt.rstudio.com/reference/constants.md),
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
