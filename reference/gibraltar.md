# Weather conditions in Gibraltar, May 2023

The `gibraltar` dataset has meteorological data for the Gibraltar
Airport Station from May 1 to May 31, 2023. Gibraltar is a British
Overseas Territory and city located at the southern end of the Iberian
Peninsula, on the Bay of Gibraltar. This weather station is located at
the airport (GIB), where it's at an elevation of 5 meters above mean sea
level (AMSL).

## Usage

``` r
gibraltar
```

## Format

A tibble with 1,431 rows and 10 variables:

- date, time:

  The date and time of the observation.

- temp, dew_point:

  The air temperature and dew point values, both in degrees Celsius.

- humidity:

  The relative humidity as a value between `0` and `1`

- wind_dir, wind_speed, wind_gust:

  Observations related to wind. The wind direction is given as the
  typical 'blowing from' value, simplified to one of 16 compass
  directions. The wind speed is provided in units of meters per second.
  If there was a measurable wind gust, the maximum gust speed is
  recorded as m/s values (otherwise the value is `0`).

- pressure:

  The atmospheric pressure in hectopascals (hPa).

- condition:

  The weather condition.

## Dataset ID and Badge

DATA-11

![This image of that of a dataset
badge.](https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_gibraltar.png)

## Dataset Introduced

`v0.11.0` (July 9, 2024)

## See also

Other datasets:
[`constants`](https://gt.rstudio.com/reference/constants.md),
[`countrypops`](https://gt.rstudio.com/reference/countrypops.md),
[`exibble`](https://gt.rstudio.com/reference/exibble.md),
[`films`](https://gt.rstudio.com/reference/films.md),
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
dplyr::glimpse(gibraltar)
#> Rows: 1,431
#> Columns: 10
#> $ date       <date> 2023-05-01, 2023-05-01, 2023-05-01, 2023-05-01, 2023-05-01…
#> $ time       <chr> "00:20", "00:50", "01:20", "01:50", "02:20", "02:50", "03:2…
#> $ temp       <dbl> 18.9, 18.9, 17.8, 18.9, 18.9, 17.8, 17.8, 17.8, 18.9, 18.9,…
#> $ dew_point  <dbl> 12.8, 13.9, 13.9, 13.9, 12.8, 12.8, 12.8, 12.8, 12.2, 12.2,…
#> $ humidity   <dbl> 0.68, 0.73, 0.77, 0.73, 0.68, 0.73, 0.73, 0.73, 0.64, 0.64,…
#> $ wind_dir   <chr> "W", "WSW", "W", "W", "WSW", "WSW", "W", "SW", "SW", "WSW",…
#> $ wind_speed <dbl> 6.7, 7.2, 6.7, 6.7, 6.7, 6.7, 7.2, 6.3, 4.0, 3.1, 3.6, 2.2,…
#> $ wind_gust  <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,…
#> $ pressure   <dbl> 1015.2, 1015.2, 1014.6, 1014.6, 1014.6, 1014.6, 1014.6, 101…
#> $ condition  <chr> "Fair", "Fair", "Fair", "Fair", "Fair", "Fair", "Fair", "Fa…
```
