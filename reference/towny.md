# Populations of all municipalities in Ontario from 1996 to 2021

A dataset containing census population data from six census years (1996
to 2021) for all 414 of Ontario's local municipalities. The Municipal
Act of Ontario (2001) defines a local municipality as "a single-tier
municipality or a lower-tier municipality". There are 173 single-tier
municipalities and 241 lower-tier municipalities representing 99 percent
of Ontario's population and 17 percent of its land use.

In the `towny` dataset we include information specific to each
municipality such as location (in the `latitude` and `longitude`
columns), their website URLs, their classifications, and land area sizes
according to 2021 boundaries. Additionally, there are computed columns
containing population density values for each census year and population
change values from adjacent census years.

## Usage

``` r
towny
```

## Format

A tibble with 414 rows and 25 variables:

- name:

  The name of the municipality.

- website:

  The website for the municipality. This is `NA` if there isn't an
  official site.

- status:

  The status of the municipality. This is either `"lower-tier"` or
  `"single-tier"`. A single-tier municipality, which takes on all
  municipal duties outlined in the Municipal Act and other Provincial
  laws, is independent of an upper-tier municipality. Part of an
  upper-tier municipality is a lower-tier municipality. The upper-tier
  and lower-tier municipalities are responsible for carrying out the
  duties laid out in the Municipal Act and other provincial laws.

- csd_type:

  The Census Subdivision Type. This can be one of `"village"`, `"town"`,
  `"township"`, `"municipality"`, or `"city"`.

- census_div:

  The Census division, of which there are 49. This is made up of
  single-tier municipalities, regional municipalities, counties, and
  districts.

- latitude, longitude:

  The location of the municipality, given as latitude and longitude
  values in decimal degrees.

- land_area_km2:

  The total area of the local municipality in square kilometers.

- population_1996, population_2001, population_2006, population_2011,
  population_2016, population_2021:

  Population values for each municipality from the 1996 to 2021 census
  years.

- density_1996, density_2001, density_2006, density_2011, density_2016,
  density_2021:

  Population density values, calculated as persons per square kilometer,
  for each municipality from the 1996 to 2021 census years.

- pop_change_1996_2001_pct, pop_change_2001_2006_pct,
  pop_change_2006_2011_pct, pop_change_2011_2016_pct,
  pop_change_2016_2021_pct:

  Population changes between adjacent pairs of census years, from 1996
  to 2021.

## Dataset ID and Badge

DATA-7

![This image of that of a dataset
badge.](https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_towny.png)

## Dataset Introduced

`v0.9.0` (Mar 31, 2023)

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
[`sza`](https://gt.rstudio.com/reference/sza.md)

## Examples

``` r
dplyr::glimpse(towny)
#> Rows: 414
#> Columns: 25
#> $ name                     <chr> "Addington Highlands", "Adelaide Metcalfe", "…
#> $ website                  <chr> "https://addingtonhighlands.ca", "https://ade…
#> $ status                   <chr> "lower-tier", "lower-tier", "lower-tier", "lo…
#> $ csd_type                 <chr> "township", "township", "township", "township…
#> $ census_div               <chr> "Lennox and Addington", "Middlesex", "Simcoe"…
#> $ latitude                 <dbl> 45.00000, 42.95000, 44.13333, 45.52917, 43.85…
#> $ longitude                <dbl> -77.25000, -81.70000, -79.93333, -76.89694, -…
#> $ land_area_km2            <dbl> 1293.99, 331.11, 371.53, 519.59, 66.64, 116.6…
#> $ population_1996          <int> 2429, 3128, 9359, 2837, 64430, 1027, 8315, 16…
#> $ population_2001          <int> 2402, 3149, 10082, 2824, 73753, 956, 8593, 18…
#> $ population_2006          <int> 2512, 3135, 10695, 2716, 90167, 958, 8654, 19…
#> $ population_2011          <int> 2517, 3028, 10603, 2844, 109600, 864, 9196, 2…
#> $ population_2016          <int> 2318, 2990, 10975, 2935, 119677, 969, 9680, 2…
#> $ population_2021          <int> 2534, 3011, 10989, 2995, 126666, 954, 9949, 2…
#> $ density_1996             <dbl> 1.88, 9.45, 25.19, 5.46, 966.84, 8.81, 21.22,…
#> $ density_2001             <dbl> 1.86, 9.51, 27.14, 5.44, 1106.74, 8.20, 21.93…
#> $ density_2006             <dbl> 1.94, 9.47, 28.79, 5.23, 1353.05, 8.22, 22.09…
#> $ density_2011             <dbl> 1.95, 9.14, 28.54, 5.47, 1644.66, 7.41, 23.47…
#> $ density_2016             <dbl> 1.79, 9.03, 29.54, 5.65, 1795.87, 8.31, 24.71…
#> $ density_2021             <dbl> 1.96, 9.09, 29.58, 5.76, 1900.75, 8.18, 25.39…
#> $ pop_change_1996_2001_pct <dbl> -0.0111, 0.0067, 0.0773, -0.0046, 0.1447, -0.…
#> $ pop_change_2001_2006_pct <dbl> 0.0458, -0.0044, 0.0608, -0.0382, 0.2226, 0.0…
#> $ pop_change_2006_2011_pct <dbl> 0.0020, -0.0341, -0.0086, 0.0471, 0.2155, -0.…
#> $ pop_change_2011_2016_pct <dbl> -0.0791, -0.0125, 0.0351, 0.0320, 0.0919, 0.1…
#> $ pop_change_2016_2021_pct <dbl> 0.0932, 0.0070, 0.0013, 0.0204, 0.0584, -0.01…
```
