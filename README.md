
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gt <img src="man/figures/logo.svg" align="right" height="250px" />

<!-- badges: start -->

[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![CRAN
status](https://www.r-pkg.org/badges/version/gt)](https://cran.r-project.org/package=gt)
[![R build
status](https://github.com/rstudio/gt/workflows/R-CMD-check/badge.svg)](https://github.com/rstudio/gt/actions?workflow=R-CMD-check)
[![Coverage
status](https://codecov.io/gh/rstudio/gt/branch/master/graph/badge.svg)](https://codecov.io/github/rstudio/gt?branch=master)
<!-- badges: end -->

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

Beyond this simple example, there are many functions available in **gt**
for creating super-customized tables.

Want to try this out? Then, take the **gt** Test Drive on **RStudio
Cloud**. It’s full of ready-to-run examples.

<p align="center">

<a href="https://rstudio.cloud/project/779965">
<img src="man/figures/gt-test-drive.svg" alt="RStudio Cloud Example" height="80px">
</a>

</p>

The **gt** package can be installed from **CRAN** with:

``` r
install.packages("gt")
```

You can also choose to install the development version of **gt** from
**GitHub**:

``` r
devtools::install_github("rstudio/gt")
```

If you encounter a bug, have usage questions, or want to share ideas to
make this package better, please feel free to file an
[issue](https://github.com/rstudio/gt/issues).

-----

#### How **gt** fits in with Other Packages that Generate Display Tables

The **gt** package joins a burgeoning collection of packages for display
table generation. Why another? We feel that there is enough room in this
space to innovate further. Here are some of the ways that **gt**
contributes to this ecosystem:

  - the interface is high-level and declarative (general instructions
    versus very specific)
  - the formatting options are ‘batteries included’ (scientific
    notation, uncertainty, ranges, percentages, suffixes, localized
    currency, dates/times + much more)
  - there is excellent, pain-free support for footnotes
  - the output is ‘camera-ready’
  - it will eventually support multiple output formats (including LaTeX)
    with the same declarative interface
  - the API closely follows tidyverse conventions by adhering to the
    [tidyverse style guide](https://style.tidyverse.org)
  - a focus on making the package documentation and examples the best
    they can be
  - rigorous QA/QC measures: high test coverage for automated tests, and
    thorough manual testing by QA engineers (with every proposed code
    change)

While **gt** is trying to do something different with its own interface,
it may not suit your specific needs. Here is a listing of leading
table-making **R** packages, with links to their respective project
pages:

**knitr** ([GITHUB](https://github.com/yihui/knitr), [WEBSITE](https://yihui.org/knitr/)) —
**kableExtra** ([GITHUB](https://github.com/haozhu233/kableExtra), [WEBSITE](https://haozhu233.github.io/kableExtra/)) —
**formattable** ([GITHUB](https://github.com/renkun-ken/formattable), [WEBSITE](https://renkun-ken.github.io/formattable/)) —
**DT** ([GITHUB](https://github.com/rstudio/DT), [WEBSITE](https://rstudio.github.io/DT/)) —
**pander** ([GITHUB](https://github.com/Rapporter/pander), [WEBSITE](http://rapporter.github.io/pander)) —
**huxtable** ([GITHUB](https://github.com/hughjonesd/huxtable), [WEBSITE](https://hughjonesd.github.io/huxtable/)) —
**reactable** ([GITHUB](https://github.com/glin/reactable), [WEBSITE](https://glin.github.io/reactable/)) —
**flextable** ([GITHUB](https://github.com/davidgohel/flextable), [WEBSITE](https://davidgohel.github.io/flextable/)) —
**pixiedust** ([GITHUB](https://github.com/nutterb/pixiedust)) —
**tangram** ([GITHUB](https://github.com/spgarbet/tangram)) —
**ztable** ([GITHUB](https://github.com/cardiomoon/ztable)) —
**condformat** ([GITHUB](https://github.com/zeehio/condformat)) —
**stargazer** ([CRAN](https://CRAN.R-project.org/package=stargazer)) —
**xtable** ([CRAN](https://CRAN.R-project.org/package=xtable))

#### Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/1/0/0).<br>By
participating in this project you agree to abide by its terms.

#### License

MIT © RStudio, PBC
