#' Print the table
#'
#' This facilitates printing of the HTML table to the R console.
#'
#' @param x An object of class `gt_tbl`.
#' @param ... Any additional parameters.
#' @param view The value for `print()`s `browse` argument.
#'
#' @keywords internal
#'
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
#'
#' @param x An object of class `gt_tbl`.
#' @param ... Any additional parameters.
#'
#' @keywords internal
#' @noRd
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

#' Convert a **gt** table to an **htmltools** `tagList`
#'
#' This converts a **gt** table object to an **htmltools**
#' [htmltools::tagList()] object. The returned object is of the `shiny.tag.list`
#' class and using `as.character()` with that will render the HTML, resulting in
#' a length 1 character vector that contains the HTML table.
#'
#' @param x Object to be converted.
#' @param ... Any additional parameters.
#'
#' @keywords internal
#' @noRd
as.tags.gt_tbl <- function(x, ...) {

  # Generate the HTML table
  html_table <- render_as_html(data = x)

  # Get options related to the enclosing <div>
  id <- x %>% dt_options_get_value(option = "table_id")
  container_overflow_x <- x %>% dt_options_get_value(option = "container_overflow_x")
  container_overflow_y <- x %>% dt_options_get_value(option = "container_overflow_y")
  container_width <- x %>% dt_options_get_value(option = "container_width")
  container_height <- x %>% dt_options_get_value(option = "container_height")

  # If the ID hasn't been set, set `id` as NULL
  if (is.na(id)) {
    id <- NULL
  }

  # Compile the SCSS as CSS
  css <- compile_scss(data = x, id = id)

  # Attach the dependency to the HTML table
  html_tbl <-
    htmltools::tagList(
      htmltools::tags$style(htmltools::HTML(css)),
      htmltools::tags$div(
        id = id,
        style = htmltools::css(
          `overflow-x` = container_overflow_x,
          `overflow-y` = container_overflow_y,
          width = container_width,
          height = container_height
        ),
        htmltools::HTML(html_table)
      )
    )

  html_tbl
}
