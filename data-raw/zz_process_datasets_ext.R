library(usethis)

source("data-raw/X01-currencies.R")
source("data-raw/X02-currency_symbols.R")
source("data-raw/X03-locales.R")
source("data-raw/X04-palettes_strips.R")

# Create internal datasets (`sysdata.rda`)
usethis::use_data(
  currencies, currency_symbols, locales, palettes_strips,
  internal = TRUE, overwrite = TRUE
)
