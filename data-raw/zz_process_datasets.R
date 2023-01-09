library(usethis)

source("data-raw/01-countrypops.R")
source("data-raw/02-sza.R")
source("data-raw/03-gtcars.R")
source("data-raw/04-sp500.R")
source("data-raw/05-pizzaplace.R")
source("data-raw/06-exibble.R")
source("data-raw/07-gt_clinical.R")
source("data-raw/08-towny.R")

# Create external datasets
usethis::use_data(
  countrypops, sza, gtcars, sp500,
  pizzaplace, exibble, gt_adsl, towny,
  internal = FALSE, overwrite = TRUE
)
