.dt_locale_key <- "_locale"

dt_locale_get <- function(data) {
  dt__get(data, .dt_locale_key)
}

dt_locale_set <- function(data, locale) {
  dt__set(data, .dt_locale_key, locale)
}

dt_locale_init <- function(data, locale = NULL) {
  locale <- list(locale = locale)
  dt_locale_set(data = data, locale = locale)
}

dt_locale_get_value <- function(data) {
  dt_locale_get(data = data)$locale
}
