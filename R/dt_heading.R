.dt_heading_key <- "_heading"

dt_heading_get <- function(data) {

  dt__get(data, .dt_heading_key)
}

dt_heading_set <- function(data, heading) {

  dt__set(data, .dt_heading_key, heading)
}

dt_heading_init <- function(data) {

  list(
    title = NULL,
    subtitle = NULL
  ) %>%
    dt_heading_set(heading = ., data = data)
}

dt_heading_title_subtitle <- function(data, title, subtitle) {

  heading <- dt_heading_get(data = data)

  heading[c("title", "subtitle")] <-
    list(title = title, subtitle = subtitle)

  dt_heading_set(data = data, heading = heading)
}

dt_heading_build <- function(data, context) {

  heading <- dt_heading_get(data = data)

  heading <- lapply(heading, function(val) process_text(val, context = context))

  dt_heading_set(data = data, heading = heading)
}

dt_heading_has_title <- function(data) {

  heading <- dt_heading_get(data = data)

  length(heading) > 0 && length(heading$title) > 0 && !is.null(heading$title)
}

dt_heading_has_subtitle <- function(data) {

  heading <- dt_heading_get(data = data)

  length(heading) > 0 && length(heading$subtitle) > 0 && !is.null(heading$subtitle)
}
