check_quarto <- function() {
  Sys.getenv("QUARTO_MESSAGES_FILE") != ""
}

check_knitr <- function() {

  if (!requireNamespace("knitr", quietly = TRUE)) {

    cli::cli_abort(c(
      "Please install the knitr package.",
      "*" = "Use `install.packages(\"knitr\")`."
    ))
  }
}

quarto_api_send <- function(message, ...) {

  # Ensure that the knitr package is available
  check_knitr()

  # Generate a JSON-formatted line
  line <-
    jsonlite::toJSON(
      list(
        message = message,
        cell_name = knitr::opts_current$get("label"),
        payload = list(...)
      ),
      auto_unbox = TRUE
    )

  file <- Sys.getenv("QUARTO_MESSAGES_FILE")

  write(line, file, append = TRUE)
}
