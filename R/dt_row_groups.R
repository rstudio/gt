.dt_row_groups_key <- "_row_groups"

dt_row_groups_get <- function(data) {

  dt__get(data, .dt_row_groups_key)
}

dt_row_groups_set <- function(data, row_groups) {

  dt__set(data, .dt_row_groups_key, row_groups)
}

dt_row_groups_init <- function(data) {

  stub_df <- dt_stub_df_get(data = data)

  if (any(!is.na(stub_df[["groupname"]]))) {
    row_groups <- unique(stub_df[["groupname"]])
  } else {
    row_groups <- character(0)
  }

  data <-
    row_groups %>%
    dt_row_groups_set(data = data)

  data
}
