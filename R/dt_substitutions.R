.dt_substitutions_key <- "_substitutions"

dt_substitutions_get <- function(data) {
  dt__get(data, .dt_substitutions_key)
}

dt_substitutions_set <- function(data, substitutions) {
  dt__set(data, .dt_substitutions_key, substitutions)
}

dt_substitutions_init <- function(data) {
  dt_substitutions_set(data = data, substitutions = list())
}

dt_substitutions_add <- function(data, substitutions) {

  substitutions_list <- dt_substitutions_get(data = data)

  substitutions <- append(substitutions_list, values = list(substitutions))

  dt_substitutions_set(data = data, substitutions = substitutions)
}
