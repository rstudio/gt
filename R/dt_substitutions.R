.dt_substitutions_key <- "_substitutions"

dt_substitutions_get <- function(data) {

  dt__get(data, .dt_substitutions_key)
}

dt_substitutions_set <- function(data, substitutions) {

  dt__set(data, .dt_substitutions_key, substitutions)
}

dt_substitutions_init <- function(data) {

  list() %>%
    dt_substitutions_set(substitutions = ., data = data)
}

dt_substitutions_add <- function(data, substitutions) {

  data %>%
    dt_substitutions_get() %>%
    append(
      list(substitutions)
    ) %>%
    dt_substitutions_set(substitutions = ., data = data)
}
