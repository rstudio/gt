library(tidyverse)

reactions <-
  readr::read_csv(
    file = "data-raw/reactions.csv",
    col_types =
      cols(
        cmpd_no = col_character(),
        cmpd_primary_name = col_character(),
        cmpd_smiles = col_character(),
        cmpd_inchi = col_character(),
        cmpd_inchikey = col_character(),
        cmpd_mwt = col_double(),
        cmpd_atomic_fml = col_character(),
        cmpd_struct_fml = col_character(),
        cmpd_type = col_integer(),
        feat_sep_db = col_integer(),
        feat_conj_db = col_integer(),
        feat_cuml_db = col_integer(),
        feat_triplbond = col_integer(),
        feat_non_arom_rings = col_integer(),
        feat_arom_rings = col_integer(),
        feat_multi_fct = col_integer(),
        feat_OH = col_integer(),
        feat_O = col_integer(),
        feat_CHO = col_integer(),
        feat_CO = col_integer(),
        feat_OCO = col_integer(),
        feat_OCOO = col_integer(),
        feat_acids = col_integer(),
        feat_OOH = col_integer(),
        feat_COOH = col_integer(),
        feat_COCHO = col_integer(),
        feat_COCO = col_integer(),
        feat_ONO2 = col_integer(),
        feat_OONO2 = col_integer(),
        feat_PANs = col_integer(),
        feat_NO2 = col_integer(),
        feat_ONO = col_integer(),
        feat_F = col_integer(),
        feat_Si = col_integer(),
        feat_P = col_integer(),
        feat_S = col_integer(),
        feat_Cl = col_integer(),
        feat_Br = col_integer(),
        feat_I = col_integer(),
        OH_k298 = col_double(),
        OH_unc = col_character(),
        OH_u_fac = col_double(),
        OH_A = col_double(),
        OH_B = col_double(),
        OH_n = col_double(),
        OH_t_low = col_double(),
        OH_t_high = col_double(),
        O3_k298 = col_double(),
        O3_unc = col_character(),
        O3_u_fac = col_double(),
        O3_A = col_double(),
        O3_B = col_double(),
        O3_n = col_double(),
        O3_t_low = col_double(),
        O3_t_high = col_double(),
        NO3_k298 = col_double(),
        NO3_unc = col_character(),
        NO3_u_fac = col_double(),
        NO3_A = col_double(),
        NO3_B = col_double(),
        NO3_n = col_double(),
        NO3_t_low = col_double(),
        NO3_t_high = col_double(),
        Cl_k298 = col_double(),
        Cl_unc = col_character(),
        Cl_u_fac = col_double(),
        Cl_A = col_double(),
        Cl_B = col_double(),
        Cl_n = col_double(),
        Cl_t_low = col_double(),
        Cl_t_high = col_double()
      )
  ) |>
  dplyr::mutate(across(starts_with("feat"), ~ tidyr::replace_na(.x, 0)))

extract_pct <- function(x) {
  as.numeric(sub("%", "", x, fixed = TRUE)) / 100
}

reactions <-
  reactions |>
  dplyr::mutate(
    OH_uncert = case_when(
      !is.na(OH_unc) ~ extract_pct(OH_unc),
      .default = NA_real_
    ),
    O3_uncert = case_when(
    !is.na(O3_unc) ~ extract_pct(O3_unc),
    .default = NA_real_
    ),
    NO3_uncert = case_when(
      !is.na(NO3_unc) ~ extract_pct(NO3_unc),
      .default = NA_real_
    ),
    Cl_uncert = case_when(
      !is.na(Cl_unc) ~ extract_pct(Cl_unc),
      .default = NA_real_
    )
  ) |>
  dplyr::select(-ends_with("unc"))

compound_types <-
  dplyr::tribble(
    ~cmpd_type, ~cmpd_desc,
  1, "normal alkane",
  2, "branched alkane",
  3, "cyclic alkane",
  4, "terminal monoalkene",
  5, "acyclic internal monoalkene",
  6, "cyclic monoalkene",
  7, "acyclic conjugated dialkene",
  8, "acyclic di-/polyalkene",
  9, "cyclic di-/polyalkene",
  10, "alkyne",
  11, "allene",
  12, "non-aromatic hydrocarbon with varying double bond types",
  13, "alkylbenzene",
  14, "polycyclic aromatic hydrocarbon",
  15, "aromatic hydrocarbon with extra double or triple bonds",
  16, "alcohol or glycol",
  17, "ether",
  18, "aldehyde",
  19, "ketone",
  20, "ester",
  21, "carboxylic acid",
  22, "hydroperoxide",
  23, "peroxide",
  24, "alcohol or glycol ether",
  25, "alcohol ketone",
  26, "alcohol or glycolester",
  27, "alcohol or glycol ether ester",
  28, "alpha-dicarbonyl",
  29, "saturated mixed oxygenate",
  30, "unsaturated alcohol",
  31, "unsaturated ether",
  32, "furan",
  33, "unsaturated ester",
  34, "unsaturated aldehyde",
  35, "unsaturated ketone",
  36, "unsaturated non-aromatic oxygenate",
  37, "phenol",
  38, "aromatic aldehyde",
  39, "aromatic ketone",
  40, "aromatic ester",
  41, "aromatic ether",
  42, "aromatic oxygenate",
  43, "mixed oxygenate",
  44, "nitrate",
  45, "nitro organic",
  46, "nitrite",
  47, "nitroso organic",
  48, "hydroxy nitrate",
  49, "PAN compound",
  50, "unsaturated PAN compound",
  51, "oxygenate nitrate",
  52, "unsaturated nitrate",
  53, "unsaturated nitro compound",
  54, "unsaturated nitrite or nitroso compound",
  55, "unsaturated hydroxy nitrate",
  56, "nitrophenol",
  57, "unsaturated or aromatic hydroxy nitrate",
  58, "unsaturated or aromatic mixed oxygenate or nitrate",
  59, "mixed nitro, nitroso, or nitrite",
  60, "haloalkane (separated)",
  61, "haloalkane (multiple)",
  62, "unsaturated halogen-containing hydrocarbon (halogens separated)",
  63, "unsaturated halogen-containing hydrocarbon (multiple halogens)",
  64, "aromatic halogen-containing hydrocarbon (halogens separated)",
  65, "aromatic halogen-containing hydrocarbon (multiple halogens)",
  66, "saturated halogen-containing oxygenate (halogens separated)",
  67, "saturated halogen-containing oxygenate (multiple halogens)",
  68, "unsaturated halogen-containing oxygenate (halogens separated)",
  69, "unsaturated halogen-containing oxygenate (multiple halogens)",
  70, "aromatic halogen-containing oxygenate (halogens separated)",
  71, "aromatic halogen-containing oxygenate (multiple halogens)",
  72, "saturated halogen-containing oxidized nitrogen compound (halogens separated)",
  73, "saturated halogen-containing oxidized nitrogen compound (multiple halogens)",
  74, "unsaturated halogen-containing oxidized nitrogen compound (halogens separated)",
  75, "unsaturated halogen-containing oxidized nitrogen compound (multiple halogens)",
  76, "aromatic halogen-containing oxidized nitrogen compound (halogens separated)",
  77, "aromatic halogen-containing oxidized nitrogen compound (multiple halogens)",
  78, "alkyl amine",
  79, "amine",
  80, "ketene",
  81, "nitrile",
  82, "mercaptan",
  83, "sulfide",
  84, "sulfoxide",
  998, "inorganic cmpd.",
  999, "unclassified"
  )

reactions <-
  reactions |>
  dplyr::inner_join(compound_types, by = c("cmpd_type" = "cmpd_type")) |>
  dplyr::relocate(cmpd_desc, .after = cmpd_struct_fml) |>
  dplyr::relocate(OH_uncert, .before = OH_u_fac) |>
  dplyr::relocate(O3_uncert, .before = O3_u_fac) |>
  dplyr::relocate(NO3_uncert, .before = NO3_u_fac) |>
  dplyr::relocate(Cl_uncert, .before = Cl_u_fac) |>
  dplyr::select(-cmpd_type, -cmpd_no, -cmpd_struct_fml, -starts_with("feat")) |>
  dplyr::rename(cmpd_name = cmpd_primary_name) |>
  dplyr::rename(cmpd_formula = cmpd_atomic_fml) |>
  dplyr::rename(cmpd_type = cmpd_desc) |>
  dplyr::relocate(cmpd_mwt, cmpd_formula, cmpd_type, .after = cmpd_name)
