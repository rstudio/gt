library(usethis)

source("data-raw/01-countrypops.R")
source("data-raw/02-sza.R")
source("data-raw/03-gtcars.R")
source("data-raw/04-sp500.R")
source("data-raw/05-pizzaplace.R")
source("data-raw/06-exibble.R")

# Create external datasets
usethis::use_data(
  countrypops, sza, gtcars, sp500, pizzaplace, exibble,
  internal = FALSE, overwrite = TRUE
)
