dt__get <- function(data, key) {

  data[[key, exact = TRUE]]
}

dt__set <- function(data, key, value) {

  data[[key]] <- value

  data
}
