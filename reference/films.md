# Feature films in competition at the Cannes Film Festival

Each entry in the `films` is a feature film that appeared in the
official selection during a festival year (starting in 1946 and active
to the present day). The `year` column refers to the year of the
festival and this figure doesn't always coincide with the release year
of the film. The film's title reflects the most common title of the film
in English, where the `original_title` column provides the title of the
film in its spoken language (transliterated to Roman script where
necessary).

## Usage

``` r
films
```

## Format

A tibble with 1,873 rows and 8 variables:

- year:

  The year of the festival in which the film was in competition.

- title,original_title:

  The `title` field provides the film title used for English-speaking
  audiences. The `original_title` field is populated when `title`
  differs greatly from the non-English original.

- director:

  The director or set of co-directors for the film. Multiple directors
  are separated by a comma.

- languages:

  The languages spoken in the film in the order of appearance. This
  consists of ISO 639 language codes (primarily as two-letter codes, but
  using three-letter codes where necessary).

- countries_of_origin:

  The country or countries of origin for the production. Here, 2-letter
  ISO 3166-1 country codes (set in uppercase) are used.

- run_time:

  The run time of the film in hours and minutes. This is given as a
  string in the format `[x]h [y]m`.

- imdb_url:

  The URL of the film's information page in the Internet Movie Database
  (IMDB).

## Dataset ID and Badge

DATA-9

![This image of that of a dataset
badge.](https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_films.png)

## Dataset Introduced

`v0.11.0` (July 9, 2024)

## See also

Other datasets:
[`constants`](https://gt.rstudio.com/reference/constants.md),
[`countrypops`](https://gt.rstudio.com/reference/countrypops.md),
[`exibble`](https://gt.rstudio.com/reference/exibble.md),
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
dplyr::glimpse(films)
#> Rows: 1,873
#> Columns: 8
#> $ year                <int> 1946, 1946, 1946, 1946, 1946, 1946, 1946, 1946, 19…
#> $ title               <chr> "The Lovers", "Anna and the King of Siam", "Blood …
#> $ original_title      <chr> "Amanti in fuga", NA, "Blod och eld", "Brevet fra …
#> $ director            <chr> "Giacomo Gentilomo", "John Cromwell", "Anders Henr…
#> $ languages           <chr> "it", "en", "sv", "da", "en,fr", "en", "pt", "ru",…
#> $ countries_of_origin <chr> "IT", "US", "SE", "DK", "GB", "GB", "PT", "SU", "D…
#> $ run_time            <chr> "1h 30m", "2h 8m", "1h 40m", "1h 18m", "1h 26m", "…
#> $ imdb_url            <chr> "https://www.imdb.com/title/tt0038297/", "https://…
```
