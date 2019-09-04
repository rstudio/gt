.dt_arrange_groups_key <- "_arrange_groups"

dt_arrange_groups_get <- function(data) {

  attr(data, .dt_arrange_groups_key, exact = TRUE)
}

dt_arrange_groups_set <- function(data, arrange_groups) {

  attr(data, .dt_arrange_groups_key) <- arrange_groups
  data
}

dt_arrange_groups_init <- function(data) {

  stub_df <- dt_stub_get(data = data)

  if (any(!is.na(stub_df[["groupname"]]))) {

    arrange_groups <- list(groups = unique(stub_df[["groupname"]]))

  } else {

    arrange_groups <- list(groups = character(0))
  }

  arrange_groups %>%
    dt_arrange_groups_set(arrange_groups = ., data = data)
}

dt_arrange_groups_vars <- function(data) {

  dt_arrange_groups_get(data = data) %>% .[[1]]
}
