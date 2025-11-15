library(tidyverse)

nuclides <-
  readr::read_csv(
    file = "data-raw/nuclides.csv",
    col_types =
      cols(
        z = col_integer(),
        n = col_integer(),
        element = col_character(),
        radius = col_double(),
        radius_uncert = col_double(),
        abundance = col_double(),
        abundance_uncert = col_double(),
        is_stable = col_logical(),
        half_life = col_double(),
        half_life_uncert = col_double(),
        isospin = col_character(),
        decay_1 = col_character(),
        decay_1_pct = col_double(),
        decay_1_pct_uncert = col_double(),
        decay_2 = col_character(),
        decay_2_pct = col_double(),
        decay_2_pct_uncert = col_double(),
        decay_3 = col_character(),
        decay_3_pct = col_double(),
        decay_3_pct_uncert = col_double(),
        magnetic_dipole = col_double(),
        magnetic_dipole_uncert = col_double(),
        electric_quadrupole = col_double(),
        electric_quadrupole_uncert = col_double(),
        atomic_mass = col_double(),
        atomic_mass_uncert = col_double(),
        mass_excess = col_double(),
        mass_excess_uncert = col_double()
      )
  ) |>
  dplyr::mutate(
    dplyr::across(dplyr::contains("pct"), ~ . / 100),
    dplyr::across(dplyr::contains("abundance"), ~ . / 100),
    nuclide = paste0("^{", z + n, "}_{", z, "}", element, n)
  ) |>
  dplyr::relocate(nuclide, .before = z)
