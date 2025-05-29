<div align="center">

<a href="https://gt.rstudio.com/"><img src="man/figures/logo.svg" width="350px"/></a>

<!-- badges: start -->
[![CRAN status](https://www.r-pkg.org/badges/version/gt)](https://CRAN.R-project.org/package=gt)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![R-CMD-check](https://github.com/rstudio/gt/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/rstudio/gt/actions/workflows/R-CMD-check.yaml)
[![Codecov test coverage](https://codecov.io/gh/rstudio/gt/graph/badge.svg)](https://app.codecov.io/gh/rstudio/gt)

[![Best Practices](https://bestpractices.coreinfrastructure.org/projects/5593/badge)](https://bestpractices.coreinfrastructure.org/projects/5593)
[![The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Monthly Downloads](https://cranlogs.r-pkg.org/badges/gt)](https://CRAN.R-project.org/package=gt)
[![Total Downloads](https://cranlogs.r-pkg.org/badges/grand-total/gt)](https://CRAN.R-project.org/package=gt)

[![Follow on Bluesky](https://img.shields.io/badge/Bluesky-0285FF?logo=bluesky&logoColor=0285FF&label=Follow%20on&color=0285FF)](https://bsky.app/profile/gt-package.bsky.social)
[![Posit Cloud](https://img.shields.io/badge/Posit%20Cloud-gt%20Test%20Drive-blue?style=social&logo=rstudio&logoColor=75AADB)](https://rstudio.cloud/project/779965)

[![Discord](https://img.shields.io/discord/1086103944280952992?color=%237289da&label=Discord)](https://discord.com/invite/Ux7nrcXHVV)

[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.1%20adopted-ff69b4.svg)](https://www.contributor-covenant.org/version/2/1/code_of_conduct.html)
<!-- badges: end -->
<hr style="color:transparent" />
<br />
</div>

With the **gt** package, anyone can make wonderful-looking tables using
the **R** programming language. The **gt** philosophy: we can construct
a wide variety of useful tables with a cohesive set of table parts.
These include the *table header*, the *stub*, the *column labels* and
*spanner column labels*, the *table body*, and the *table footer*.

<div align="center">
<img src="man/figures/gt_parts_of_a_table.svg" width="800px">
</div>

It all begins with **table data** (be it a tibble or a data frame). You
then decide how to compose your **gt table** with the elements and
formatting you need for the task at hand. Finally, the table is rendered
by printing it at the console, including it in an R Markdown document,
or exporting to a file using `gtsave()`. Currently, **gt** supports the
**HTML**, **LaTeX**, and **RTF** output formats.

<div align="center">
<img src="man/figures/gt_workflow_diagram.svg" width="800px">
</div>

<hr />

The **gt** package is designed to be both straightforward yet powerful.
The emphasis is on simple functions for the everyday display table
needs. Here is a brief example of how to use **gt** to create a table
from the included `sp500` dataset:

``` r
library(gt)

# Define the start and end dates for the data range
start_date <- "2010-06-07"
end_date <- "2010-06-14"

# Create a gt table based on preprocessed
# `sp500` table data
sp500 |>
  dplyr::filter(date >= start_date & date <= end_date) |>
  dplyr::select(-adj_close) |>
  gt() |>
  tab_header(
    title = "S&P 500",
    subtitle = glue::glue("{start_date} to {end_date}")
  ) |>
  fmt_currency() |>
  fmt_date(columns = date, date_style = "wd_m_day_year") |>
  fmt_number(columns = volume, suffixing = TRUE)
```

<div align="center">
<img src="man/figures/gt_sp500_table.svg" width="800px">
</div>

<br>

There are 18 datasets provided by **gt**: `countrypops`, `sza`, `gtcars`, `sp500`, `pizzaplace`, `exibble`, `towny`, `peeps`, `films`, `metro`, `gibraltar`, `constants`, `illness`, `reactions`, `photolysis`, `nuclides`, `rx_adsl`, and `rx_addv`.

<div align="center" style="padding-top:20px">
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_countrypops.svg" style="width:15%;">
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_sza.svg" style="width:15%;">
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_gtcars.svg" style="width:15%;">
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_sp500.svg" style="width:15%;">
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_pizzaplace.svg" style="width:15%;">
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_exibble.svg" style="width:15%;">
</div>
<div align="center" style="padding-top:10px;padding-bottom:10px">
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_towny.svg" style="width:15%;">
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_peeps.svg" style="width:15%;">
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_films.svg" style="width:15%;">
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_metro.svg" style="width:15%;">
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_gibraltar.svg" style="width:15%;">
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_constants.svg" style="width:15%;">
</div>
<div align="center" style="padding-bottom:20px">
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_illness.svg" style="width:15%;">
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_reactions.svg" style="width:15%;">
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_photolysis.svg" style="width:15%;">
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_nuclides.svg" style="width:15%;">
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_rx_adsl.svg" style="width:15%;">
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_rx_addv.svg" style="width:15%;">
</div>

<br>

All of this tabular data is great for experimenting with **gt**’s functions and we make extensive use of these datasets in our documentation.

Beyond the functions shown in the simple `sp500`-based example, there are many functions available in **gt** for creating super-customized tables. Check out the [documentation website](https://gt.rstudio.com/) to get started via introductory articles for making **gt** tables. There's a handy *Reference* section that has detailed help for every function in the package.

[![Documentation Site](https://img.shields.io/badge/Project%20Website-Documentation%20and%20Reference-blue?style=social)](https://gt.rstudio.com/)

With the **gt** *Test Drive*, you can try **gt** in the *Posit Cloud* environment that features the RStudio IDE and a large collection of ready-to-run examples. Visit the publicly available [*Posit Cloud* project](https://rstudio.cloud/project/779965) and try out the package in your browser. There's no charge to use this platform and you'll learn **a lot** about what the package can do!

[![Posit Cloud](https://img.shields.io/badge/Posit%20Cloud-gt%20Test%20Drive-blue?style=social&logo=rstudio&logoColor=75AADB)](https://rstudio.cloud/project/779965)

<hr style="color:transparent" />

<div align="center">
<img src="https://raw.githubusercontent.com/rstudio/gt/master/images/gt_table_examples.gif">
</div>

<hr style="color:transparent" />

Let's talk about making tables with **gt**! There are a few locations where there is much potential for discussion.

One such place is in [*GitHub Discussions*](https://github.com/rstudio/gt/discussions). This discussion board is especially great for Q&A, and many people have had their problems solved in there.

[![GitHub Discussions](https://img.shields.io/badge/GitHub%20Discussions-Ask%20about%20anything-blue?style=social&logo=github&logoColor=gray)](https://github.com/rstudio/gt/discussions)

Another fine venue for discussion is in the [`gt_package` *Discord server*](https://discord.com/invite/Ux7nrcXHVV). This is a good option for asking about the development of **gt**, pitching ideas that may become features, and sharing your table creations!

[![Discord Server](https://img.shields.io/badge/Discord-Chat%20with%20us-blue?style=social&logo=discord&logoColor=purple)](https://discord.com/invite/Ux7nrcXHVV)

Finally, there is the [`gt-package` *Bluesky account*](https://bsky.app/profile/gt-package.bsky.social). There you'll find posts about **gt** (including sneak previews about in-development features) and other table-generation packages.

[![Follow on Bluesky](https://img.shields.io/badge/Bluesky-0285FF?logo=bluesky&logoColor=0285FF&label=Follow%20on&color=0285FF)](https://bsky.app/profile/gt-package.bsky.social)

These are all great places to ask questions about how to use the package, discuss
some ideas, engage with others, and much more!

## INSTALLATION

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

## Packages that use or extend **gt**

There are several **R** packages that either use **gt** to generate tabular outputs or extend **gt** in amazing ways. Here is a short list of some of these great packages:

  - **gtsummary** ([GITHUB](https://github.com/ddsjoberg/gtsummary), [WEBSITE](https://www.danieldsjoberg.com/gtsummary/))
  - **gtExtras** ([GITHUB](https://github.com/jthomasmock/gtExtras), [WEBSITE](https://jthomasmock.github.io/gtExtras/))
  - **pointblank** ([GITHUB](https://github.com/rstudio/pointblank), [WEBSITE](https://rstudio.github.io/pointblank/))
  - **tfrmt** ([GITHUB](https://github.com/GSK-Biostatistics/tfrmt), [WEBSITE](https://gsk-biostatistics.github.io/tfrmt/))
  - **gto** ([GITHUB](https://github.com/GSK-Biostatistics/gto))

-----

## Code of Conduct

Please note that the gt project is released with a [contributor code of
conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct.html).<br>By
participating in this project you agree to abide by its terms.

## 📄 License

**gt** is licensed under the MIT license. See the
[`LICENSE.md`](LICENSE.md) file for more details.

© Posit Software, PBC.

## 🏛️ Governance

This project is primarily maintained by [Rich Iannone](https://bsky.app/profile/richmeister.bsky.social). Other authors may occasionally assist with some of these duties.

<hr>

<div align="center">
<img src="man/figures/gt_tables_footer.png" width="100%">
</div>

<hr>
