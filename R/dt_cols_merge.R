.dt_col_merge_key <- "_col_merge"

dt_col_merge_get <- function(data) {

  dt__get(data, .dt_col_merge_key)
}

dt_col_merge_set <- function(data, col_merge) {

  dt__set(data, .dt_col_merge_key, col_merge)
}

dt_col_merge_init <- function(data) {

  list() %>%
    dt_col_merge_set(col_merge = ., data = data)
}

dt_col_merge_add <- function(data, col_merge) {

  data %>%
    dt_col_merge_get() %>%
    append(
      list(col_merge)
    ) %>%
    dt_col_merge_set(col_merge = ., data = data)
}

dt_col_merge_entry <- function(vars, type, pattern = NULL, ...) {

  if (!(type %in% c("merge", "merge_range", "merge_uncert"))) {
    stop("Invalid `type` provided.")
  }

  list(
    vars = vars,
    type = type,
    pattern = pattern,
    ...
  )
}
