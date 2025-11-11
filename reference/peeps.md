# A table of personal information for people all over the world

The `peeps` dataset contains records for one hundred people residing in
ten different countries. Each person in the table has address
information along with their email address and phone number. There are
also personal characteristics like date of birth, height, and weight.
This data has been synthesized, and so the names within the table have
not been taken or based on individuals in real life. The street
addresses were generated from actual street names within real geographic
localities, however, the street numbers were assigned randomly from a
constrained number set. While these records do not relate to real
people, efforts were made to make the data as realistic as possible.

## Usage

``` r
peeps
```

## Format

A tibble with 100 rows and 14 variables:

- name_given, name_family:

  The given and family name of individual.

- address:

  The street address of the individual.

- city:

  The name of the city or locality in which the individual resides.

- state_prov:

  The state or province associated with the `city` and `address`. This
  is `NA` for individuals residing in countries where subdivision data
  is not needed for generating a valid mailing address.

- postcode:

  The post code associated with the `city` and `address`.

- country:

  The 3-letter ISO 3166-1 country code representative of the
  individual's country.

- email_addr:

  The individual's email address.

- phone_number, country_code:

  The individual's phone number and the country code associated with the
  phone number.

- gender:

  The gender of the individual.

- dob:

  The individual's date of birth (DOB) in the ISO 8601 form of
  `YYYY-MM-DD`.

- height_cm, weight_kg:

  The height and weight of the individual in centimeters (cm) and
  kilograms (kg), respectively.

## Dataset ID and Badge

DATA-8

![This image of that of a dataset
badge.](https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_peeps.png)

## Dataset Introduced

`v0.11.0` (July 9, 2024)

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
dplyr::glimpse(peeps)
#> Rows: 100
#> Columns: 14
#> $ name_given   <chr> "Ruth", "Peter", "Fanette", "Judyta", "Leonard", "Maymun"…
#> $ name_family  <chr> "Conte", "Möller", "Gadbois", "Borkowska", "Jacobs", "Kho…
#> $ address      <chr> "4299 Bobcat Drive", "3705 Hidden Pond Road", "4200 Swick…
#> $ city         <chr> "Baileys Crossroads", "Red Boiling Springs", "New Orleans…
#> $ state_prov   <chr> "MD", "TN", "LA", "NY", "CA", "OH", "IN", "MA", "CA", "TX…
#> $ postcode     <chr> "22041", "37150", "70112", "14125", "90036", "45013", "46…
#> $ country      <chr> "USA", "USA", "USA", "USA", "USA", "USA", "USA", "USA", "…
#> $ email_addr   <chr> "rcconte@example.com", "pmoeller@example.com", "fan_gadbo…
#> $ phone_number <chr> "240-783-7630", "615-699-3517", "985-205-2970", "585-948-…
#> $ country_code <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 32, 32, 32, 32, 32, 32, 32,…
#> $ gender       <chr> "female", "male", "female", "female", "male", "male", "fe…
#> $ dob          <date> 1949-03-16, 1939-11-22, 1970-12-20, 1965-07-19, 1985-10-…
#> $ height_cm    <int> 153, 175, 167, 156, 177, 172, 168, 165, 181, 187, 164, 15…
#> $ weight_kg    <dbl> 76.4, 74.9, 61.6, 54.5, 113.2, 88.4, 63.5, 61.3, 99.7, 10…
```
