.dt_has_built_key <- "_has_built"

dt_has_built_set <- function(data, value) {

  attr(data, .dt_has_built_key) <- value
  data
}

dt_has_built_get <- function(data) {

  attr(data, .dt_has_built_key)
}

dt_has_built_init <- function(data) {

  dt_has_built_set(data = data, value = FALSE)
}

dt_has_built <- function(data) {

  isTRUE(dt_has_built_get(data = data))
}

dt_has_built_assert <- function(data) {

  if (!dt_has_built(data = data)) {
    stop("The build hasn't occurred; must call `build_data()` before retrieving.")
  }
}
