.dt_stubhead_key <- "_stubhead"

dt_stubhead_get <- function(data) {

  dt__get(data, .dt_stubhead_key)
}

dt_stubhead_set <- function(data, stubhead) {

  dt__set(data, .dt_stubhead_key, stubhead)
}

dt_stubhead_init <- function(data) {

  list(
    label = NULL
  ) %>%
    dt_stubhead_set(data = data)
}

dt_stubhead_label <- function(data, label) {

  stubhead <- dt_stubhead_get(data = data)

  stubhead["label"] <- list(label = label)

  dt_stubhead_set(data = data, stubhead = stubhead)
}

dt_stubhead_build <- function(data, context) {

  stubhead <- dt_stubhead_get(data = data)

  stubhead <- lapply(stubhead, function(val) process_text(val, context = context))

  dt_stubhead_set(data = data, stubhead = stubhead)
}

dt_stubhead_has_label <- function(data) {

  stubhead <- dt_stubhead_get(data = data)

  length(stubhead$label) > 0 && !is.null(stubhead$label)
}
