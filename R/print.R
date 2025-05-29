#------------------------------------------------------------------------------#
#
#                /$$
#               | $$
#     /$$$$$$  /$$$$$$
#    /$$__  $$|_  $$_/
#   | $$  \ $$  | $$
#   | $$  | $$  | $$ /$$
#   |  $$$$$$$  |  $$$$/
#    \____  $$   \___/
#    /$$  \ $$
#   |  $$$$$$/
#    \______/
#
#  This file is part of the 'rstudio/gt' project.
#
#  Copyright (c) 2018-2025 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


#' Print a **gt** table
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

  if (check_dbnb()) {
    return(rlang::exec("displayHTML", as_raw_html(x)))
  }

  html_tbl <- as.tags(x, ...)

  # Use `print()` to print to the console
  print(html_tbl, browse = view, ...)
}

#' Print a collection of **gt** tables
#'
#' This facilitates printing of multiple HTML tables (in a `gt_group` object) to
#' the R console.
#'
#' @param x An object of class `gt_group`.
#' @param ... Any additional parameters.
#' @param view The value for `print()`s `browse` argument.
#'
#' @keywords internal
#' @rdname print.gt_tbl
#' @export
print.gt_group <- function(x, ..., view = interactive()) {

  html_tbls <- htmltools::tagList()

  seq_tbls <- seq_len(nrow(x$gt_tbls))

  for (i in seq_tbls) {

    html_tbl_i <- as.tags(grp_pull(x, which = i), ...)
    html_tbls <- htmltools::tagList(html_tbls, html_tbl_i)
  }

  # Use `print()` to print to the console
  print(html_tbls, browse = view, ...)
}

#nocov start

#' Knit print a **gt** table
#'
#' This facilitates printing of the HTML table within a knitr code chunk.
#'
#' @param x An object of class `gt_tbl`.
#' @param ... Any additional parameters.
#'
#' @noRd
#' @exportS3Method knitr::knit_print
knit_print.gt_tbl <- function(x, ..., inline = FALSE) {

  # TODO: Add print method for interactive HTML table

  if (knitr_is_rtf_output()) {

    x <- as_rtf(x)

  } else if (knitr::is_latex_output()) {

    x <- as_latex(x)

  } else if (knitr_is_word_output()) {

    x <-
      knitr::asis_output(
        paste("```{=openxml}", as_word(x), "```\n\n", sep = "\n")
      )

  } else {

    # Default to HTML output
    x <- as.tags(x, ...)
  }

  # Use `knit_print()` to print in a code chunk
  knitr::knit_print(x, ..., inline = FALSE)
}

#' Knit print a collection of **gt** tables
#'
#' This facilitates printing of multiple HTML tables (in a `gt_group` object)
#' within a knitr code chunk.
#'
#' @param x An object of class `gt_group`.
#' @param ... Any additional parameters.
#'
#' @noRd
#' @exportS3Method knitr::knit_print
knit_print.gt_group <- function(x, ...) {

  if (knitr_is_rtf_output()) {

    # TODO: make this work for RTF
    x <- as_rtf(x)

  } else if (knitr::is_latex_output()) {

    # TODO: make this work for LaTeX
    x <- as_latex(x)

  } else if (knitr_is_word_output()) {

    word_tbls <- NULL

    seq_tbls <- seq_len(nrow(x$gt_tbls))

    for (i in seq_tbls) {
      word_tbl_i <- as_word(grp_pull(x, which = i), ...)
      word_tbls <- c(word_tbls, word_tbl_i)
    }

    word_tbls_combined <- paste(word_tbls, collapse = page_break_word())

    x <-
      knitr::asis_output(
        paste("```{=openxml}", word_tbls_combined, "```\n\n", sep = "\n")
      )

  } else {

    html_tbls <- htmltools::tagList()

    seq_tbls <- seq_len(nrow(x$gt_tbls))

    for (i in seq_tbls) {

      html_tbl_i <- as.tags(grp_pull(x, which = i), ...)
      html_tbls <- htmltools::tagList(html_tbls, html_tbl_i)
    }

    return(knitr::knit_print(html_tbls, ...))
  }

  # Use `knit_print()` to print in a code chunk
  knitr::knit_print(x, ...)
}

#nocov end

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
#' @noRd
#' @importFrom htmltools as.tags
#' @export
as.tags.gt_tbl <- function(x, ...) {

  table_id <- dt_options_get_value(x, option = "table_id")
  ihtml <- dt_options_get_value(x, option = "ihtml_active")

  if (is.na(table_id)) {
    id <- random_id()
  } else {
    id <- table_id
  }

  # Compile the SCSS as CSS
  css <- compile_scss(data = x, id = id)

  if (ihtml) {

    # Generate an interactive HTML table
    html_table <- render_as_ihtml(data = x, id = id)

  } else {

    # Generate a static HTML table
    html_table <- htmltools::HTML(render_as_html(data = x))
  }

  # Get options related to the enclosing <div>
  container_padding_x <- dt_options_get_value(x, option = "container_padding_x")
  container_padding_y <- dt_options_get_value(x, option = "container_padding_y")
  container_overflow_x <- dt_options_get_value(x, option = "container_overflow_x")
  container_overflow_y <- dt_options_get_value(x, option = "container_overflow_y")
  container_width <- dt_options_get_value(x, option = "container_width")
  container_height <- dt_options_get_value(x, option = "container_height")

  # Attach the dependency to the HTML table
  html_tbl <-
    htmltools::tags$div(
      id = id,
      class = if (ihtml) ".gt_table" else NULL,
      htmltools::tags$style(htmltools::HTML(css)),
      style = htmltools::css(
        `padding-left` = container_padding_x,
        `padding-right` = container_padding_x,
        `padding-top` = container_padding_y,
        `padding-bottom` = container_padding_y,
        `overflow-x` = container_overflow_x,
        `overflow-y` = container_overflow_y,
        width = container_width,
        height = container_height
      ),
      html_table
    )

  html_tbl
}

#' Print RTF text
#'
#' @param x Object to be printed.
#' @param ... Any additional parameters.
#'
#' @rdname print.gt_tbl
#' @export
print.rtf_text <- function(x, ...) {

  cat(paste(x, collapse = "\n"))
}

knitr_is_rtf_output <- function() {
  "rtf" %in% knitr::opts_knit$get("rmarkdown.pandoc.to")
}

knitr_is_word_output <- function() {
  "docx" %in% knitr::opts_knit$get("rmarkdown.pandoc.to")
}

page_break_word <- function() {
  "\n\n<w:p><w:r><w:br w:type=\"page\" /></w:r></w:p>\n\n"
}
