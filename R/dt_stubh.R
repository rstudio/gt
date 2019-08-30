.dt_stubh_key <- "_stubh"

dt_stubh_get <- function(data) {

  attr(data, .dt_stubh_key, exact = TRUE)
}

dt_stubh_set <- function(data, stubh) {

  attr(data, .dt_stubh_key) <- stubh
  data
}

dt_stubh_init <- function(data) {

  list(
    label = NULL
  ) %>%
    dt_stubh_set(data = data)
}

dt_stubh_label <- function(data, label) {

  stubh <- dt_stubh_get(data = data)

  stubh["label"] <- list(label = label)

  dt_stubh_set(data = data, stubh = stubh)
}

dt_stubh_build <- function(data, context) {

  stubh <- dt_stubh_get(data = data)

  stubh <- lapply(stubh, function(val) process_text(val, context = context))

  dt_stubh_set(data = data, stubh = stubh)
}

dt_stubh_has_label <- function(data) {

  stubh <- dt_stubh_get(data = data)

  length(stubh) > 0 && !is.null(stubh$label)
}
