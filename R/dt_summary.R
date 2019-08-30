.dt_summary_key <- "_summary"

dt_summary_get <- function(data) {

  attr(data, .dt_summary_key, exact = TRUE)
}

dt_summary_set <- function(data, summary) {

  attr(data, .dt_summary_key) <- summary
  data
}

dt_summary_init <- function(data) {

  list() %>%
    dt_summary_set(summary = ., data = data)
}

dt_summary_add <- function(data, summary) {

  data %>%
    dt_summary_get() %>%
    append(
      list(summary)
    ) %>%
    dt_summary_set(summary = ., data = data)
}
