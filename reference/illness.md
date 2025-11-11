# Lab tests for one suffering from an illness

A dataset with artificial daily lab data for a patient with Yellow Fever
(YF). The table comprises laboratory findings for the patient from day 3
of illness onset until day 9 (after which the patient died). YF viral
DNA was found in serum samples from day 3, where the viral load reached
14,000 copies per mL. Several medical interventions were taken to help
the patient, including the administration of fresh frozen plasma,
platelets, red cells, and coagulation factor VIII. The patient also
received advanced support treatment in the form of mechanical
ventilation and plasmapheresis. Though the patient's temperature
remained stable during their illness, unfortunately, the patient's
condition did not improve. On days 7 and 8, the patient's health
declined further, with symptoms such as nosebleeds, gastrointestinal
bleeding, and hematoma.

## Usage

``` r
illness
```

## Format

A tibble with 39 rows and 11 variables:

- test:

  The name of the test.

- units:

  The measurement units for the test.

- day_3,day_4,day_5,day_6,day_7,day_8,day_9:

  Measurement values associated with each test administered from days 3
  to 9. An `NA` value indicates that the test could not be performed
  that day.

- norm_l,norm_u:

  Lower and upper bounds for the normal range associated with the test.

## Details

The various tests are identified in the `test` column. The following
listing provides the full names of any abbreviations seen in that
column.

- `"WBC"`: white blood cells.

- `"RBC"`: red blood cells.

- `"Hb"`: hemoglobin.

- `"PLT"`: platelets.

- `"ALT"`: alanine aminotransferase.

- `"AST"`: aspartate aminotransferase.

- `"TBIL"`: total bilirubin.

- `"DBIL"`: direct bilirubin.

- `"NH3"`: hydrogen nitride.

- `"PT"`: prothrombin time.

- `"APTT"`: activated partial thromboplastin time.

- `"PTA"`: prothrombin time activity.

- `"DD"`: D-dimer.

- `"FDP"`: fibrinogen degradation products.

- `"LDH"`: lactate dehydrogenase.

- `"HBDH"`: hydroxybutyrate dehydrogenase.

- `"CK"`: creatine kinase.

- `"CKMB"`: the MB fraction of creatine kinase.

- `"BNP"`: B-type natriuretic peptide.

- `"MYO"`: myohemoglobin.

- `"TnI"`: troponin inhibitory.

- `"CREA"`: creatinine.

- `"BUN"`: blood urea nitrogen.

- `"AMY"`: amylase.

- `"LPS"`: lipase.

- `"K"`: kalium.

- `"Na"`: sodium.

- `"Cl"`: chlorine.

- `"Ca"`: calcium.

- `"P"`: phosphorus.

- `"Lac"`: lactate, blood.

- `"CRP"`: c-reactive protein.

- `"PCT"`: procalcitonin.

- `"IL-6"`: interleukin-6.

- `"CD3+CD4+"`: CD4+T lymphocytes.

- `"CD3+CD8+"`: CD8+T lymphocytes.

## Dataset ID and Badge

DATA-13

![This image of that of a dataset
badge.](https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_illness.png)

## Dataset Introduced

`v0.10.0` (October 7, 2023)

## See also

Other datasets:
[`constants`](https://gt.rstudio.com/reference/constants.md),
[`countrypops`](https://gt.rstudio.com/reference/countrypops.md),
[`exibble`](https://gt.rstudio.com/reference/exibble.md),
[`films`](https://gt.rstudio.com/reference/films.md),
[`gibraltar`](https://gt.rstudio.com/reference/gibraltar.md),
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md),
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
dplyr::glimpse(illness)
#> Rows: 39
#> Columns: 11
#> $ test   <chr> "Viral load", "WBC", "Neutrophils", "RBC", "Hb", "PLT", "ALT", …
#> $ units  <chr> "copies per mL", "x10^9 / L", "x10^9 / L", "x10^12 / L", "g / L…
#> $ day_3  <dbl> 12000.000, 5.260, 4.870, 5.720, 153.000, 67.000, 12835.000, 236…
#> $ day_4  <dbl> 4200.000, 4.260, 4.720, 5.980, 135.000, 38.600, 12632.000, 2136…
#> $ day_5  <dbl> 1600.000, 9.920, 7.920, 4.230, 126.000, 27.400, 6426.700, 14730…
#> $ day_6  <dbl> 830.000, 10.490, 18.210, 4.830, 115.000, 26.200, 4263.100, 8691…
#> $ day_7  <dbl> 760.000, 24.770, 22.080, 4.120, 75.000, 74.100, 1623.700, 2189.…
#> $ day_8  <dbl> 520.000, 30.260, 27.170, 2.680, 87.000, 36.200, 672.600, 1145.0…
#> $ day_9  <dbl> 250.000, 19.030, 16.590, 3.320, 95.000, 25.600, 512.400, 782.50…
#> $ norm_l <dbl> NA, 4.0, 2.0, 4.0, 120.0, 100.0, 9.0, 15.0, 0.0, 0.0, 10.0, 9.4…
#> $ norm_u <dbl> NA, 10.000, 8.000, 5.500, 160.000, 300.000, 50.000, 40.000, 18.…
```
