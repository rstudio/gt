#' Print the table
#'
#' This facilitates printing of the HTML table to the R console.
#' @param x an object of class \code{gt_tbl}.
#' @keywords internal
#' @export
print.gt_tbl <- function(x, ..., view = interactive()) {

  html_tbl <- as.tags.gt_tbl(x, ...)

  # Use `print()` to print to the console
  print(html_tbl, browse = view, ...)
}

knitr_is_rtf_output <- function() {

  "rtf" %in% knitr::opts_knit$get("rmarkdown.pandoc.to")
}

#' Knit print the table
#'
#' This facilitates printing of the HTML table within a knitr code chunk.
#' @param x an object of class \code{gt_tbl}.
#' @keywords internal
knit_print.gt_tbl <- function(x, ...) {

  if (knitr_is_rtf_output()) {
    x <- as_rtf(x)
  } else if (knitr::is_latex_output()) {
    x <- as_latex(x)
  } else {
    # Default to HTML output
    x <- as.tags.gt_tbl(x, ...)
  }

  # Use `knit_print()` to print in a code chunk
  knitr::knit_print(x, ...)
}

#' @importFrom htmltools tags HTML tagList
as.tags.gt_tbl <- function(x, ...) {

  # Generate the HTML table
  html_table <- render_as_html(data = x)

  # Extract the `opts_df` data frame object from `x`
  opts_df <- attr(x, "opts_df", exact = TRUE)

  # Get the table ID from `opts_df`
  id <-
    opts_df %>%
    dplyr::filter(parameter == "table_id") %>%
    dplyr::pull(value)

  # If the ID hasn't been set, set `id` as NULL
  if (is.na(id)) {
    id <- NULL
  }

  # Compile the SCSS as CSS
  css <- compile_scss(data = x, id = id)

  # Attach the dependency to the HTML table
  html_tbl <- htmltools::tagList(
    htmltools::tags$style(htmltools::HTML(css)),
    tags$div(id = id, style = htmltools::css(`overflow-x` = "auto"), htmltools::HTML(html_table))
  )

  html_tbl
}
