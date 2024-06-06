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
source("data-raw/X11-flags.R")
source("data-raw/X12-country_names.R")
source("data-raw/X13-country_names_additional.R")
source("data-raw/X14-tf_words.R")

# Create internal datasets (`sysdata.rda`)
usethis::use_data(
  currencies, currency_symbols, locales, default_locales,
  palettes_strips, google_font_tbl, google_styles_tbl, google_axes_tbl,
  css_colors, fractions, durations, styles_colors_params,
  spelled_num, flag_tbl, country_names, country_names_additional, tf_words,
  internal = TRUE, overwrite = TRUE
)
