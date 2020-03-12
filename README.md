
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gt <img src="man/figures/logo.svg" align="right" height="250px" />

[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![CRAN
status](https://www.r-pkg.org/badges/version/gt)](https://cran.r-project.org/package=gt)
[![Travis build
status](https://travis-ci.com/rstudio/gt.svg?token=P7T9dzi5RLEq9j2Yepx5&branch=master)](https://travis-ci.com/rstudio/gt)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/rstudio/gt?branch=master&svg=true)](https://ci.appveyor.com/project/rstudio/gt)
[![Coverage
status](https://codecov.io/gh/rstudio/gt/branch/master/graph/badge.svg)](https://codecov.io/github/rstudio/gt?branch=master)

With the **gt** package, anyone can make wonderful-looking tables using
the **R** programming language. The **gt** philosophy: we can construct
a wide variety of useful tables with a cohesive set of table parts.
These include the *table header*, the *stub*, the *column labels* and
*spanner column labels*, the *table body*, and the *table footer*.

<p align="center">

<img src="man/figures/gt_parts_of_a_table.svg" width="800px">

</p>

It all begins with preprocessed **table data** (be it a tibble or a data
frame). You then decide how to compose your **gt table** with the
elements and formatting you need for the task at hand. Finally, the
table is rendered by printing it at the console, including it in an R
Markdown document, or exporting to a file using `gtsave()`. Currently,
**gt** supports **HTML** output, with **LaTeX** and **RTF** planned for
the future.

<p align="center">

<img src="man/figures/gt_workflow_diagram.svg" width="800px">

</p>

The **gt** package is designed to be both straightforward yet powerful.
The emphasis is on simple functions for the everyday display table
needs. Here is a brief example of how to use **gt** to create a table
from the included `sp500` dataset:

``` r
library(gt)
library(tidyverse)
library(glue)

# Define the start and end dates for the data range
start_date <- "2010-06-07"
end_date <- "2010-06-14"

# Create a gt table based on preprocessed
# `sp500` table data
sp500 %>%
  dplyr::filter(date >= start_date & date <= end_date) %>%
  dplyr::select(-adj_close) %>%
  gt() %>%
  tab_header(
    title = "S&P 500",
    subtitle = glue::glue("{start_date} to {end_date}")
  ) %>%
  fmt_date(
    columns = vars(date),
    date_style = 3
  ) %>%
  fmt_currency(
    columns = vars(open, high, low, close),
    currency = "USD"
  ) %>%
  fmt_number(
    columns = vars(volume),
    suffixing = TRUE
  )
```

<p align="center">

<img src="man/figures/gt_sp500_table.svg" width="1200px">

</p>

There are six datasets included in **gt**: `countrypops`, `sza`,
`gtcars`, `sp500`, `pizzaplace`, and `exibble`. All of them are useful
for experimenting with **gt**’s functions.

<p align="center">

<img src="man/figures/gt_datasets.svg" width="800px">

</p>

Beyond this simple example, there are many functions available in **gt**
for creating super-customized tables.

<p align="center">

<img src="man/figures/gt_function_reference.png" width="100%">

</p>

Want to try this out? Then, take the **gt** Test Drive on **RStudio
Cloud**. It’s full of ready-to-run examples.

<p align="center">

<a href="https://rstudio.cloud/project/779965">
<img src="man/figures/gt-test-drive.svg" alt="RStudio Cloud Example" height="80px">
</a>

</p>

You can install the development version of **gt** from **GitHub**:

``` r
remotes::install_github("rstudio/gt")
```

If you encounter a bug, have usage questions, or want to share ideas to
make this package better, please feel free to file an
[issue](https://github.com/rstudio/gt/issues).

-----

<img src="man/figures/gt_tables.png">

-----

#### Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md).<br>By participating in this project you
agree to abide by its terms.

#### License

MIT © RStudio, PBC
