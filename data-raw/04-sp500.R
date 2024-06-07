library(tidyverse)

sp500 <- readr::read_csv(file = "data-raw/sp500.csv")

# Drop spec attribute
sp500 <- sp500[]
