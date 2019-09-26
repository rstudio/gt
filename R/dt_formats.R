.dt_formats_key <- "_formats"

dt_formats_get <- function(data) {

  attr(data, .dt_formats_key, exact = TRUE)
}

dt_formats_set <- function(data, formats) {

  attr(data, .dt_formats_key) <- formats
  data
}

dt_formats_init <- function(data) {

  list() %>%
    dt_formats_set(formats = ., data = data)
}

dt_formats_add <- function(data, formats) {

  data %>%
    dt_formats_get() %>%
    append(
      list(formats)
    ) %>%
    dt_formats_set(formats = ., data = data)
}

# This function is used in `dt_summary_build()` to get a
# formatter function for the computed summary cells
# The `data` provided is not the body data but generated
# summary data (from aggregation functions); this is
# guaranteed to have just one formatter (hence the `[[1]]`
# index used here)
dt_formats_summary_formatter <- function(data, context) {

  formatter <-
    data %>%
    dt_formats_get() %>%
    {.[[1]]$func}

  formatter[[context]] %||% formatter$default
}
