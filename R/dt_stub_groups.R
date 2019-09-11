.dt_stub_groups_key <- "_stub_groups"

dt_stub_groups_get <- function(data) {

  attr(data, .dt_stub_groups_key, exact = TRUE)
}

dt_stub_groups_set <- function(data, stub_groups) {

  attr(data, .dt_stub_groups_key) <- stub_groups

  data
}

dt_stub_groups_init <- function(data) {

  stub_df <- dt_stub_df_get(data = data)

  if (any(!is.na(stub_df[["groupname"]]))) {
    stub_groups <- unique(stub_df[["groupname"]])
  } else {
    stub_groups <- character(0)
  }

  data <-
    stub_groups %>%
    dt_stub_groups_set(data = data)

  data
}
