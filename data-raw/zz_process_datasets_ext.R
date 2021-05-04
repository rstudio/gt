library(usethis)

source("data-raw/X01-currencies.R")
source("data-raw/X02-currency_symbols.R")
source("data-raw/X03-locales.R")
source("data-raw/X04-palettes_strips.R")
source("data-raw/X05-google_fonts.R")
source("data-raw/X06-fractions.R")

# Create internal datasets (`sysdata.rda`)
usethis::use_data(
  currencies, currency_symbols, locales, palettes_strips,
  google_font_tbl, google_styles_tbl, google_axes_tbl,
  frac_1_d, frac_10_d, frac_100_d,
  frac_1_2, frac_1_4, frac_1_8, frac_1_16,
  frac_1_10, frac_1_100,
  internal = TRUE, overwrite = TRUE
)
