dt_spanners_key <- "_spanners"

dt_spanners_get <- function(data) {

  attr(data, dt_spanners_key, exact = TRUE)
}

dt_spanners_set <- function(data, spanners) {

  attr(data, dt_spanners_key) <- spanners
  data
}

dt_spanners_init <- function(data) {

  empty_list <- lapply(seq_along(names(data)), function(x) NULL)

  dplyr::tibble(
    # Column names that are part of the spanner
    vars = list(),
    # The spanner label
    spanner_label = list(),
    # Should be columns be gathered under a single spanner label?
    gather = logical(0)
  ) %>%
    dt_spanners_set(spanners = ., data = data)
}

dt_spanners_add <- function(data, vars, spanner_label, gather) {

  data %>%
    dt_spanners_get() %>%
    dplyr::bind_rows(
      dplyr::tibble(
        vars = list(vars),
        spanner_label = list(spanner_label),
        gather = gather
      )
    ) %>%
    dt_spanners_set(data = data)
}
