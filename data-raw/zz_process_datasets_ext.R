library(usethis)

source("data-raw/X01-currencies.R")
source("data-raw/X02-currency_symbols.R")
source("data-raw/X03-locales.R")
source("data-raw/X04-palettes_strips.R")
source("data-raw/X05-google_fonts.R")
source("data-raw/X06-css_colors.R")
source("data-raw/X07-fractions.R")
source("data-raw/X08-durations.R")
source("data-raw/X09-styles_colors_params.R")
source("data-raw/X10-spelled_num.R")

# Create internal datasets (`sysdata.rda`)
usethis::use_data(
  currencies, currency_symbols, locales, default_locales,
  palettes_strips, google_font_tbl, google_styles_tbl, google_axes_tbl,
  css_colors, fractions, durations, styles_colors_params,
  spelled_num, flag_tbl,
  internal = TRUE, overwrite = TRUE
)
