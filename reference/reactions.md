# Reaction rates for gas-phase atmospheric reactions of organic compounds

The `reactions` dataset contains kinetic data for second-order (two
body) gas-phase chemical reactions for 1,683 organic compounds. The
reaction-rate values and parameters within this dataset are useful for
studies of the atmospheric environment. Organic pollutants, which are
present in trace amounts in the atmosphere, have been extensively
studied by research groups since their persistence in the atmosphere
requires specific attention. Many researchers have reported kinetic data
on specific gas-phase reactions and these mainly involve oxidation
reactions with OH, nitrate radicals, ozone, and chlorine atoms.

This compilation of rate constant (*k*) data as contains the values for
rate constants at 298 K (in units of `cm^3 molecules^-1 s^-1`) as well
as parameters that allow for the calculation of rate constants at
different temperatures (the temperature dependence parameters: `A`, `B`,
and `n`). Uncertainty values/factors and temperature limits are also
provided here where information is available.

## Usage

``` r
reactions
```

## Format

A tibble with 1,683 rows and 39 variables:

- compd_name:

  The name of the primary compound undergoing reaction with OH, ozone,
  NO3, or Cl.

- cmpd_mwt:

  The molecular weight of the compound in units of g/mol.

- cmpd_formula:

  The chemical formula of the compound.

- cmpd_type:

  The category of compounds that the `compd_name` falls under.

- cmpd_smiles:

  The SMILES (simplified molecular-input line-entry system)
  representation for the compound.

- cmpd_inchi:

  The InChI (International Chemical Identifier) representation for the
  compound.

- cmpd_inchikey:

  The InChIKey, which is a hashed InChI value, has a fixed length of 27
  characters. These values can be used to more easily perform database
  searches of chemical compounds.

- OH_k298:

  Rate constant at 298 K for OH reactions.

- OH_uncert:

  Uncertainty as a percentage for certain OH reactions.

- OH_u_fac:

  Uncertainty as a plus/minus difference for certain OH reactions.

- OH_a, OH_b, OH_n:

  Extended temperature dependence parameters for bimolecular OH
  reactions, to be used in the Arrhenius expression:
  `k(T)=A exp(-B/T) (T/300)^n`. In that, `A` is expressed as cm^3
  molecules^-1 s^-1, `B` is in units of K, and `n` is dimensionless. Any
  `NA` values indicate that data is not available.

- OH_t_low, OH_t_high:

  The low and high temperature boundaries (in units of K) for which the
  `OH_a`, `OH_b`, and `OH_n` parameters are valid.

- O3_k298:

  Rate constant at 298 K for ozone reactions.

- O3_uncert:

  Uncertainty as a percentage for certain ozone reactions.

- O3_u_fac:

  Uncertainty as a plus/minus difference for certain ozone reactions.

- O3_a, O3_b, O3_n:

  Extended temperature dependence parameters for bimolecular ozone
  reactions, to be used in the Arrhenius expression:
  `k(T)=A exp(-B/T) (T/300)^n`. In that, `A` is expressed as cm^3
  molecules^-1 s^-1, `B` is in units of K, and `n` is dimensionless. Any
  `NA` values indicate that data is not available.

- O3_t_low, O3_t_high:

  The low and high temperature boundaries (in units of K) for which the
  `O3_a`, `O3_b`, and `O3_n` parameters are valid.

- NO3_k298:

  Rate constant at 298 K for NO3 reactions.

- NO3_uncert:

  Uncertainty as a percentage for certain NO3 reactions.

- NO3_u_fac:

  Uncertainty as a plus/minus difference for certain NO3 reactions.

- NO3_a, NO3_b, NO3_n:

  Extended temperature dependence parameters for bimolecular NO3
  reactions, to be used in the Arrhenius expression:
  `k(T)=A exp(-B/T) (T/300)^n`. In that, `A` is expressed as cm^3
  molecules^-1 s^-1, `B` is in units of K, and `n` is dimensionless. Any
  `NA` values indicate that data is not available.

- NO3_t_low, NO3_t_high:

  The low and high temperature boundaries (in units of K) for which the
  `NO3_a`, `NO3_b`, and `NO3_n` parameters are valid.

- Cl_k298:

  Rate constant at 298 K for Cl reactions.

- Cl_uncert:

  Uncertainty as a percentage for certain Cl reactions.

- Cl_u_fac:

  Uncertainty as a plus/minus difference for certain Cl reactions.

- Cl_a, Cl_b, Cl_n:

  Extended temperature dependence parameters for bimolecular Cl
  reactions, to be used in the Arrhenius expression:
  `k(T)=A exp(-B/T) (T/300)^n`. In that, `A` is expressed as cm^3
  molecules^-1 s^-1, `B` is in units of K, and `n` is dimensionless. Any
  `NA` values indicate that data is not available.

- Cl_t_low, Cl_t_high:

  The low and high temperature boundaries (in units of K) for which the
  `Cl_a`, `Cl_b`, and `Cl_n` parameters are valid.

## Dataset ID and Badge

DATA-14

![This image of that of a dataset
badge.](https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_reactions.png)

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
[`peeps`](https://gt.rstudio.com/reference/peeps.md),
[`photolysis`](https://gt.rstudio.com/reference/photolysis.md),
[`pizzaplace`](https://gt.rstudio.com/reference/pizzaplace.md),
[`rx_addv`](https://gt.rstudio.com/reference/rx_addv.md),
[`rx_adsl`](https://gt.rstudio.com/reference/rx_adsl.md),
[`sp500`](https://gt.rstudio.com/reference/sp500.md),
[`sza`](https://gt.rstudio.com/reference/sza.md),
[`towny`](https://gt.rstudio.com/reference/towny.md)

## Examples

``` r
dplyr::glimpse(reactions)
#> Rows: 1,683
#> Columns: 39
#> $ cmpd_name     <chr> "methane", "formaldehyde", "methanol", "fluoromethane", …
#> $ cmpd_mwt      <dbl> 16.04, 30.03, 32.04, 34.03, 46.03, 48.02, 48.04, 50.49, …
#> $ cmpd_formula  <chr> "CH4", "CH2O", "CH4O", "CH3F", "CH2O2", "CHOF", "CH4O2",…
#> $ cmpd_type     <chr> "normal alkane", "aldehyde", "alcohol or glycol", "haloa…
#> $ cmpd_smiles   <chr> "C", "C=O", "CO", "CF", "OC=O", "FC=O", "COO", "CCl", "F…
#> $ cmpd_inchi    <chr> "InChI=1S/CH4/h1H4", "InChI=1S/CH2O/c1-2/h1H2", "InChI=1…
#> $ cmpd_inchikey <chr> "VNWKTOKETHGBQD-UHFFFAOYSA-N", "WSFSSNUMVMOOMR-UHFFFAOYS…
#> $ OH_k298       <dbl> 6.36e-15, 8.50e-12, 8.78e-13, 1.97e-14, 4.50e-13, NA, 1.…
#> $ OH_uncert     <dbl> 0.10, 0.20, 0.10, 0.10, NA, NA, NA, 0.20, 0.10, 0.21, 0.…
#> $ OH_u_fac      <dbl> NA, NA, NA, NA, 1.4, NA, 2.0, NA, NA, NA, NA, NA, NA, NA…
#> $ OH_A          <dbl> 3.62e-13, 5.40e-12, 2.32e-13, 1.99e-13, 4.50e-13, NA, 5.…
#> $ OH_B          <dbl> 1200.3487, -135.0000, -402.0000, 685.4204, NA, NA, -190.…
#> $ OH_n          <dbl> 2.179936, NA, 2.720000, 2.040182, NA, NA, NA, NA, 1.8600…
#> $ OH_t_low      <dbl> 200, 200, 210, 240, 290, NA, 220, 220, 220, 298, 298, NA…
#> $ OH_t_high     <dbl> 2025, 300, 1344, 1800, 450, NA, 430, 330, 1800, 671, 393…
#> $ O3_k298       <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
#> $ O3_uncert     <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
#> $ O3_u_fac      <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
#> $ O3_A          <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
#> $ O3_B          <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
#> $ O3_n          <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
#> $ O3_t_low      <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
#> $ O3_t_high     <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
#> $ NO3_k298      <dbl> NA, 5.5e-16, 1.3e-16, NA, NA, NA, NA, NA, NA, NA, NA, NA…
#> $ NO3_uncert    <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
#> $ NO3_u_fac     <dbl> NA, 1.6, 3.0, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
#> $ NO3_A         <dbl> NA, NA, 9.4e-13, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ NO3_B         <dbl> NA, NA, 2650, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…
#> $ NO3_n         <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, …
#> $ NO3_t_low     <dbl> NA, NA, 250, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ NO3_t_high    <dbl> NA, NA, 370, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,…
#> $ Cl_k298       <dbl> 1.00e-13, 7.20e-11, 5.10e-11, 3.60e-13, 1.90e-13, 1.90e-…
#> $ Cl_uncert     <dbl> 0.15, 0.15, 0.20, NA, NA, 0.11, NA, 0.10, 0.15, NA, 0.14…
#> $ Cl_u_fac      <dbl> NA, NA, NA, 1.4, 1.4, NA, 3.0, NA, NA, NA, NA, NA, 2.0, …
#> $ Cl_A          <dbl> 6.60e-12, 8.10e-11, 5.10e-11, 4.90e-12, NA, NA, NA, 4.32…
#> $ Cl_B          <dbl> 1240.0, 34.0, 0.0, 781.0, NA, NA, NA, 646.4, 1591.0, NA,…
#> $ Cl_n          <dbl> NA, NA, NA, NA, NA, NA, NA, 1.3057, NA, NA, NA, NA, NA, …
#> $ Cl_t_low      <dbl> 200, 200, 225, 200, NA, NA, NA, 222, 250, NA, NA, 220, 2…
#> $ Cl_t_high     <dbl> 300, 500, 950, 300, NA, NA, NA, 843, 300, NA, NA, 330, 3…
```
