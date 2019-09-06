.dt_arrange_groups_key <- "_arrange_groups"

dt_arrange_groups_get <- function(data, obj = NULL) {

  if (is.null(obj)) {
    attr(data, .dt_arrange_groups_key, exact = TRUE)
  } else if (obj == "groups") {
    attr(data, .dt_arrange_groups_key, exact = TRUE)$groups
  } else if (obj == "others") {
    attr(data, .dt_arrange_groups_key, exact = TRUE)$others
  }
}

dt_arrange_groups_set <- function(data, arrange_groups, obj = NULL) {

  if (is.null(obj)) {
    attr(data, .dt_arrange_groups_key) <- arrange_groups
  } else if (obj == "groups") {
    attr(data, .dt_arrange_groups_key)$groups <- arrange_groups
  } else if (obj == "others") {
    attr(data, .dt_arrange_groups_key)$others <- arrange_groups
  }

  data
}

dt_arrange_groups_init <- function(data) {

  stub_df <- dt_stub_get(data = data)

  if (any(!is.na(stub_df[["groupname"]]))) {
    groups <- unique(stub_df[["groupname"]])
  } else {
    groups <- character(0)
  }

  arrange_groups <-
    list(groups = groups, others = NA_character_)

  arrange_groups %>%
    dt_arrange_groups_set(arrange_groups = ., data = data)
}

dt_arrange_groups_vars <- function(data) {

  dt_arrange_groups_get(data = data) %>% .$groups
}
