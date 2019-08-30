.dt_col_merge_key <- "_col_merge"

dt_col_merge_get <- function(data) {

  attr(data, .dt_col_merge_key, exact = TRUE)
}

dt_col_merge_set <- function(data, col_merge) {

  attr(data, .dt_col_merge_key) <- col_merge
  data
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

  list(
    vars = vars,
    type = type,
    pattern = pattern,
    ...
  )
}
