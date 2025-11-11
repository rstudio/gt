# Nuclide data

The `nuclides` dataset contains information on all known nuclides,
providing data on nuclear structure and decay modes across 118 elements.
There is data here on natural abundances, atomic mass, spin, half-life,
and more. The typical users for such a dataset include researchers in
fields such as nuclear physics, radiochemistry, and nuclear medicine.

## Usage

``` r
nuclides
```

## Format

A tibble with 3,383 rows and 29 variables:

- nuclide:

  The symbol for the nuclide.

- z, n:

  The number of protons and neutrons.

- element:

  The element symbol.

- radius, radius_uncert:

  The charge radius and its associated uncertainty. In units of fm.

- abundance, abundance_uncert:

  The abundance of the stable isotope as a mole fraction (in relation to
  other stable isotopes of the same element). Values are provided for
  the nuclide only if `is_stable` is `TRUE`.

- is_stable:

  Is the nuclide a stable isotope?

- half_life, half_life_uncert:

  The nuclide's half life represented as seconds.

- isospin:

  The isospin, or the quantum number related to the up and down quark
  content of the particle.

- decay_1, decay_2, decay_3:

  The 1st, 2nd, and 3rd decay modes.

- decay_1_pct, decay_1_pct_uncert, decay_2_pct, decay_2_pct_uncert,
  decay_3_pct, decay_3_pct_uncert:

  The branching proportions for the 1st, 2nd, and 3rd decays (along with
  uncertainty values).

- magnetic_dipole, magnetic_dipole_uncert:

  The magnetic dipole and its associated uncertainty. Expressed in units
  of micro N, or nuclear magneton values.

- electric_quadrupole, electric_quadrupole_uncert:

  The electric quadrupole and its associated uncertainty. In units of
  barn (b).

- atomic_mass, atomic_mass_uncert:

  The atomic mass and its associated uncertainty. In units of micro AMU.

- mass_excess, mass_excess_uncert:

  The mass excess and its associated uncertainty. In units of keV.

## Dataset ID and Badge

DATA-16

![This image of that of a dataset
badge.](https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_nuclides.png)

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
dplyr::glimpse(nuclides)
#> Rows: 3,383
#> Columns: 29
#> $ nuclide                    <chr> "^{1}_{1}H0", "^{2}_{1}H1", "^{3}_{1}H2", "…
#> $ z                          <int> 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2…
#> $ n                          <int> 0, 1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6, 7, 8…
#> $ element                    <chr> "H", "H", "H", "H", "H", "H", "H", "He", "H…
#> $ radius                     <dbl> 0.8783, 2.1421, 1.7591, NA, NA, NA, NA, 1.9…
#> $ radius_uncert              <dbl> 0.0086, 0.0088, 0.0363, NA, NA, NA, NA, 0.0…
#> $ abundance                  <dbl> 0.999855, 0.000145, NA, NA, NA, NA, NA, 0.0…
#> $ abundance_uncert           <dbl> 0.000078, 0.000078, NA, NA, NA, NA, NA, 0.0…
#> $ is_stable                  <lgl> TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FAL…
#> $ half_life                  <dbl> NA, NA, 3.887813e+08, NA, 8.608259e-23, 2.9…
#> $ half_life_uncert           <dbl> NA, NA, 6.311385e+05, NA, 6.496799e-24, 8.3…
#> $ isospin                    <chr> NA, NA, NA, "1", NA, NA, NA, NA, "0", "1/2"…
#> $ decay_1                    <chr> NA, NA, "B-", "N", "2N", NA, NA, NA, NA, "N…
#> $ decay_1_pct                <dbl> NA, NA, 1, 1, 1, NA, NA, NA, NA, NA, 1, NA,…
#> $ decay_1_pct_uncert         <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ decay_2                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ decay_2_pct                <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ decay_2_pct_uncert         <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ decay_3                    <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ decay_3_pct                <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ decay_3_pct_uncert         <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ magnetic_dipole            <dbl> 2.7928474, 0.8574382, 2.9789625, NA, NA, NA…
#> $ magnetic_dipole_uncert     <dbl> 9.0e-09, 5.0e-09, 1.4e-08, NA, NA, NA, NA, …
#> $ electric_quadrupole        <dbl> NA, 0.0028578, NA, NA, NA, NA, NA, NA, NA, …
#> $ electric_quadrupole_uncert <dbl> NA, 3e-07, NA, NA, NA, NA, NA, NA, NA, NA, …
#> $ atomic_mass                <dbl> 1007825, 2014102, 3016049, 4026432, 5035311…
#> $ atomic_mass_uncert         <dbl> 0.000014, 0.000015, 0.000080, 107.354000, 9…
#> $ mass_excess                <dbl> 7288.971, 13135.723, 14949.811, 24621.129, …
#> $ mass_excess_uncert         <dbl> 0.000013, 0.000015, 0.000080, 100.000000, 8…
```
