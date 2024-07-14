library(tidyverse)

gtcars <- readr::read_csv(file = "data-raw/gtcars.csv")

# Drop spec() attribute
gtcars <- gtcars[]
