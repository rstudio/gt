library(usethis)

source("data-raw/01-countrypops.R")
source("data-raw/02-sza.R")
source("data-raw/03-gtcars.R")
source("data-raw/04-sp500.R")
source("data-raw/05-pizzaplace.R")
source("data-raw/06-exibble.R")
source("data-raw/07-towny.R")
source("data-raw/08-peeps.R")
source("data-raw/09-metro.R")
source("data-raw/10-gibraltar.R")
source("data-raw/11-constants.R")
source("data-raw/12-illness.R")
source("data-raw/13-reactions.R")
source("data-raw/14-photolysis.R")
source("data-raw/15-nuclides.R")
source("data-raw/16-gt_clinical.R")

# Create external datasets
usethis::use_data(
  countrypops, sza, gtcars, sp500,
  pizzaplace, exibble, towny, peeps, metro,
  gibraltar, constants, illness, reactions,
  photolysis, nuclides, rx_adsl, rx_addv,
  internal = FALSE, overwrite = TRUE
)
