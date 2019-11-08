.dt_stub_others_key <- "_stub_others"

dt_stub_others_get <- function(data) {

  dt__get(data, .dt_stub_others_key)
}

dt_stub_others_set <- function(data, stub_others) {

  dt__set(data, .dt_stub_others_key, stub_others)
}

dt_stub_others_init <- function(data) {

  data <-
    NA_character_ %>%
    dt_stub_others_set(data = data)

  data
}
