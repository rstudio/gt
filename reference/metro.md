# The stations of the Paris Metro

A dataset with information on all 321 Paris Metro stations as of August
2025. Each record represents a station, describing which Metro lines are
serviced by the station, which other connections are available, and
annual passenger volumes. Basic location information is provided for
each station in terms of where they reside on a municipal level, and,
through latitude/longitude coordinate values.

The system has 16 lines (numbered from 1 to 14, with two additional
lines: 3bis and 7bis) and covers over 200 kilometers of track. The Metro
runs on standard gauge tracks (1,435 mm) and operates using a variety of
rolling stock, including rubber-tired trains and steel-wheeled trains
(which are far more common).

The Metro is operated by the RATP, which also operates other transit
systems in the region, including buses, trams, and the RER. The RER is
an important component of the region's transit infrastructure, and
several RER stations have connectivity with the Metro. This integration
allows passengers to transfer between those two systems seamlessly. The
Metro also has connections to the Transilien rail network, tramway
stations, several major train stations (e.g., Gare du Nord, Gare de
l'Est, etc.), and many bus lines.

## Usage

``` r
metro
```

## Format

A tibble with 321 rows and 11 variables:

- name:

  The name of the station.

- caption:

  In some cases, a station will have a caption that might describe a
  nearby place of interest. This is `NA` if there isn't a caption for
  the station name.

- lines:

  All Metro lines associated with the station. This is a
  `character`-based, comma-separated series of line names.

- connect_rer:

  Station connections with the RER. The RER system has five lines (A, B,
  C, D, and E) with 257 stations and several interchanges with the
  Metro.

- connect_tram:

  Connections with tramway lines. This system has twelve lines in
  operation (T1, T2, T3a, T3b, T4, T5, T6, T7, T8, T9, T11, and T13)
  with 235 stations.

- connect_transilien:

  Connections with Transilien lines. This system has eight lines in
  operation (H, J, K, L, N, P, R, and U).

- connect_other:

  Other connections with transportation infrastructure such as regional,
  intercity, night, and high-speed trains (typically at railway
  stations).

- latitude, longitude:

  The location of the station, given as latitude and longitude values in
  decimal degrees.

- location:

  The arrondissement of Paris or municipality in which the station
  resides. For some stations located at borders, the grouping of
  locations will be presented as a comma-separated series

- passengers:

  The total number of Metro station entries during 2021. Some of the
  newest stations in the Metro system do not have this data, thus they
  show `NA` values.

## Dataset ID and Badge

DATA-10

![This image of that of a dataset
badge.](https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_metro.png)

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
dplyr::glimpse(metro)
#> Rows: 321
#> Columns: 11
#> $ name               <chr> "Argentine", "Bastille", "Bérault", "Champs-Élysées…
#> $ caption            <chr> NA, NA, NA, "Grand Palais", NA, NA, NA, NA, NA, NA,…
#> $ lines              <chr> "1", "1, 5, 8", "1", "1, 13", "1, 2, 6", "1", "1, 4…
#> $ connect_rer        <chr> NA, NA, NA, NA, "A", NA, "A, B, D", NA, NA, NA, "A,…
#> $ connect_tramway    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ connect_transilien <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "R", NA, NA…
#> $ connect_other      <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "TGV, TGV L…
#> $ passengers         <int> 2079212, 8069243, 2106827, 1909005, 4291663, 361773…
#> $ latitude           <dbl> 48.87528, 48.85308, 48.84528, 48.86750, 48.87389, 4…
#> $ longitude          <dbl> 2.290000, 2.369077, 2.428333, 2.313500, 2.295000, 2…
#> $ location           <chr> "Paris 16th, Paris 17th", "Paris 4th, Paris 11th, P…
```
