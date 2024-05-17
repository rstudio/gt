library(tidyverse)

photolysis <-
  readr::read_csv(
    file = "data-raw/photolysis.csv",
    col_types =
      cols(
        cmpd_name = col_character(),
        cmpd_formula = col_character(),
        products = col_character(),
        type = col_character(),
        l = col_double(),
        m = col_double(),
        n = col_double(),
        quantum_yield = col_double(),
        wavelength_nm = col_character(),
        sigma_298_cm2 = col_character()
      )
  )

