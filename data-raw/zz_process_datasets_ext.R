library(usethis)

source("data-raw/X01-currencies.R")
source("data-raw/X02-currency_symbols.R")
source("data-raw/X03-locales.R")
source("data-raw/X04-palettes_strips.R")
source("data-raw/X05-google_fonts.R")
source("data-raw/X06-css_colors.R")
source("data-raw/X07-fractions.R")
source("data-raw/X08-durations.R")

# Create internal datasets (`sysdata.rda`)
usethis::use_data(
  currencies, currency_symbols, locales, palettes_strips,
  google_font_tbl, google_styles_tbl, google_axes_tbl,
  css_colors, fractions, durations,
  internal = TRUE, overwrite = TRUE
)
