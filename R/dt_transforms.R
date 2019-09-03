.dt_transforms_key <- "_transforms"

dt_transforms_get <- function(data) {

  attr(data, .dt_transforms_key, exact = TRUE)
}

dt_transforms_set <- function(data, transforms) {

  attr(data, .dt_transforms_key) <- list(transforms)
  data
}

dt_transforms_init <- function(data) {

  list() %>%
    dt_transforms_set(transforms = ., data = data)
}

dt_transforms_add <- function(data, transforms) {

  transforms_a <- data %>% dt_transforms_get()

  transforms <-
    c(
      transforms_a,
      list(transforms)
    )

  dt_transforms_set(data = data, transforms = transforms)
}
