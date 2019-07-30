#' Print the table
#'
#' This facilitates printing of the HTML table to the R console.
#' @param x An object of class `gt_tbl`.
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
#' @param x An object of class `gt_tbl`.
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

#' Convert a gt table to ab htmltools tagList
#'
#' This converts a gt table object to an \pkg{htmltools} [htmltools::tagList()]
#' object. The returned object is of the `shiny.tag.list` class and using
#' `as.character()` with that will render the HTML, resulting in a length 1
#' character vector that contains the HTML table.
#'
#' @param x Object to be converted.
#' @param ... Any additional parameters.
#'
#' @export
as.tags.gt_tbl <- function(x, ...) {

  # Generate the HTML table
  html_table <- render_as_html(data = x)

  # Extract the `opts_df` data frame object from `x`
  opts_df <- attr(x, "opts_df", exact = TRUE)

  # Get options related to the enclosing <div>
  id <- opts_df_get(opts_df, option = "table_id")
  container_overflow_x <- opts_df_get(opts_df, option = "container_overflow_x")
  container_overflow_y <- opts_df_get(opts_df, option = "container_overflow_y")
  container_width <- opts_df_get(opts_df, option = "container_width")
  container_height <- opts_df_get(opts_df, option = "container_height")

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
        htmltools::HTML(html_table))
    )

  html_tbl
}
