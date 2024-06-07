library(tidyverse)

films <-
  readr::read_csv(
    file = "data-raw/films.csv",
    col_types =
      cols(
        year = col_integer(),
        title = col_character(),
        original_title = col_character(),
        director = col_character(),
        languages = col_character(),
        countries_of_origin = col_character(),
        run_time = col_character(),
        imdb_url = col_character()
      )
  )

# Drop spec() attribute
films <- films[]
