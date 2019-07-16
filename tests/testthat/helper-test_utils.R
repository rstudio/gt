tidy_grepl <- function(x, pattern) {

  vapply(
    pattern,
    FUN = function(pattern) {
      grepl(pattern = pattern, x = x)
    },
    FUN.VALUE = logical(1),
    USE.NAMES = FALSE
  )
}
