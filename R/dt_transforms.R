.dt_transforms_key <- "_transforms"

dt_transforms_get <- function(data) {

  attr(data, .dt_transforms_key, exact = TRUE)
}

dt_transforms_set <- function(data, transforms) {

  attr(data, .dt_transforms_key) <- transforms
  data
}

dt_transforms_init <- function(data) {

  list() %>%
    dt_transforms_set(transforms = ., data = data)
}

dt_transforms_add <- function(data, loc, fn) {

  existing_transforms <- dt_transforms_get(data = data)
  resolved <- resolve_location(loc = loc, data = data)

  transforms <-
    c(
      existing_transforms,
      list(
        list(
          resolved = resolved,
          fn = fn
        )
      )
    )

  dt_transforms_set(data = data, transforms = transforms)
}
