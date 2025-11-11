# An ADDV-flavored clinical trial toy dataset

This tibble contains artificial protocol deviation data for 180 subjects
in the Intent-to-Treat (ITT) population of the `GT01` study. The dataset
contains the usual parameters (`PARAM`, `PARAMCD`) for an addv. There is
summary parameter (`PARCAT1 == "OVERALL"`) for each subject of the
`GT01` ITT-population, indicating whether or not at least one major
protocol deviation (PD) occurred throughout the course of the study for
the respective subject. Individual records for protocol deviations per
subject exist, indicating which specific type of PD occurred. The
additional flag `CRIT1FL`, shows whether a PD was related to COVID-19 or
not.

Although the data was intentionally created to mimic a typical clinical
trial dataset following the CDISC format, it might not strictly comply
with CDISC ADaM rules. The intent is to showcase the workflow for
clinical table creation rather than creating a fully CDISC-compliant
ADaM dataset.

## Usage

``` r
rx_addv
```

## Format

A tibble with 291 rows and 20 variables:

- STUDYID, STUDYIDN:

  The unique study identifier and its numeric version.

- USUBJID:

  The unique subject identifier.

- TRTA, TRTAN:

  The study intervention and its numeric version, which is either
  `"Placebo"` (`1`), `"Drug 1"` (`2`), or `NA` (`3`), missing for screen
  failures).

- ITTFL:

  Intent-to-Treat (ITT) population flag, where `"Y"` indicates a subject
  belongs to the ITT population and `"N"` indicates a subject is not in
  the ITT population.

- AGE:

  The age of a subject at baseline in years.

- AAGEGR1:

  The analysis age group, indicating if a subject was strictly younger
  than 40 years at baseline or older.

- SEX:

  Sex of a subject. Can be either `"Male"`, `"Female"` or
  `"Undifferentiated"`.

- ETHNIC:

  Ethnicity of a subject. Can be either `"Hispanic or Latino"`,
  `"Not Hispanic or Latino"` or missing (`""`).

- BLBMI:

  Body Mass Index (BMI) of a subject at baseline in kg/m2.

- DVTERM:

  The Protocol Deviation Term.

- PARAMCD, PARAM:

  The Parameter Code and decoded parameter description for the protocol
  deviation.

- PARCAT1:

  Parameter category. Can be `"OVERALL"` for derived PD summaries or
  `"PROTOCOL DEVIATION"` for individual PDs.

- DVCAT:

  Category for PD, indicating whether the PD is a major one or not.

- ACAT1:

  Analysis category 1. Only populated for individual PDs, not for
  summary scores. High level category for PDs.

- AVAL:

  Analysis Value. Either `0` or `1`.

- CRIT1, CRIT1FL:

  Analysis Criterion 1 and analysis criterion 1 flag, indicating whether
  PD is related to COVID-19 or not.

## Dataset ID and Badge

DATA-18

![This image of that of a dataset
badge.](https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_rx_addv.png)

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
[`rx_adsl`](https://gt.rstudio.com/reference/rx_adsl.md),
[`sp500`](https://gt.rstudio.com/reference/sp500.md),
[`sza`](https://gt.rstudio.com/reference/sza.md),
[`towny`](https://gt.rstudio.com/reference/towny.md)

## Examples

``` r
dplyr::glimpse(rx_addv)
#> Rows: 291
#> Columns: 20
#> $ STUDYID  <chr> "GT01", "GT01", "GT01", "GT01", "GT01", "GT01", "GT01", "GT01…
#> $ STUDYIDN <chr> "4001", "4001", "4001", "4001", "4001", "4001", "4001", "4001…
#> $ USUBJID  <chr> "GT1001", "GT1002", "GT1002", "GT1003", "GT1003", "GT1003", "…
#> $ TRTA     <fct> Placebo, Placebo, Placebo, Placebo, Placebo, Placebo, Placebo…
#> $ TRTAN    <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
#> $ ITTFL    <chr> "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "…
#> $ AGE      <int> 41, 39, 39, 38, 38, 38, 45, 45, 35, 35, 35, 35, 35, 42, 35, 3…
#> $ AAGEGR1  <fct> >=40, <40, <40, <40, <40, <40, >=40, >=40, <40, <40, <40, <40…
#> $ SEX      <fct> Male, Female, Female, Male, Male, Male, Male, Male, Female, F…
#> $ ETHNIC   <fct> Not Hispanic or Latino, Not Hispanic or Latino, Not Hispanic …
#> $ BLBMI    <dbl> 33.35073, 30.45862, 30.45862, 22.85986, 22.85986, 22.85986, 2…
#> $ DVTERM   <chr> "", "", "Lab values not taken at month 3", "", "{gt} Question…
#> $ PARAMCD  <fct> PDANYM, PDANYM, PDEV02, PDANYM, PDEV01, PDEV02, PDANYM, PDEV0…
#> $ PARAM    <fct> At least one major Protocol Deviation, At least one major Pro…
#> $ PARCAT1  <chr> "OVERALL", "OVERALL", "PROTOCOL DEVIATION", "OVERALL", "PROTO…
#> $ DVCAT    <chr> "", "", "Major", "", "Major", "Major", "", "Major", "", "", "…
#> $ ACAT1    <chr> "", "", "Study Procedures Criteria Deviations", "", "Study Pr…
#> $ AVAL     <dbl> 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1…
#> $ CRIT1    <chr> "COVID-19 Related", "COVID-19 Related", "COVID-19 Related", "…
#> $ CRIT1FL  <chr> "N", "N", "N", "N", "N", "N", "N", "N", "N", "Y", "N", "N", "…
```
