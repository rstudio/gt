library(tidyverse)

tf_words <-
  readr::read_csv(
    file = "data-raw/tf_words.csv",
    col_types = cols(.default = col_character())
  )

# Drop spec() attribute
tf_words <- tf_words[]
