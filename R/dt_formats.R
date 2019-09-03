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
