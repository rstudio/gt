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
#  Copyright (c) 2018-2026 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


#' Transform a **gt** table object to an HTML table
#'
#' Take a `gt_tbl` table object and transform it to an HTML table.
#'
#' @param data A table object that is created using the `gt()` function.
#'
#' @return A character object with an HTML table.
#'
#' @noRd
render_as_html <- function(data) {

  data <- build_data(data = data, context = "html")

  # Upgrade `_styles` to gain a `html_style` column with CSS style rules
  data <- add_css_styles(data = data)

  #
  # Composition of HTML for each of the table components
  #

  caption_component <- create_caption_component_h(data = data)

  # Create the heading component
  heading_component <- create_heading_component_h(data = data)

  # Create the columns component
  columns_component <- create_columns_component_h(data = data)

  # Assemble the table head element
  table_head <-
    prepare_table_head(
      heading_component = heading_component,
      columns_component = columns_component
  )

  # Create the body component
  body_component <- create_body_component_h(data = data)

  # Create the combined footer component (source notes and footnotes)
  footer_component <- create_footer_component_h(data = data)

  # Get attributes for the gt table
  table_defs <- get_table_defs(data = data)

  # Determine whether Quarto processing of the table is enabled
  quarto_disable_processing <-
    dt_options_get_value(data = data, option = "quarto_disable_processing")

  # Determine whether bootstrap styling in Quarto should be enabled
  quarto_use_bootstrap <-
    dt_options_get_value(data = data, option = "quarto_use_bootstrap")

  #
  # Assemble all of the HTML fragments and generate a table
  #

  finalize_html_table(
    class = "gt_table",
    style = table_defs$table_style,
    quarto_disable_processing = quarto_disable_processing,
    quarto_use_bootstrap = quarto_use_bootstrap,
    caption_component,
    table_defs$table_colgroups,
    table_head,
    body_component,
    footer_component
  )
}

prepare_table_head <- function(
    heading_component,
    columns_component
) {

  if (
    all(
      (!is.list(heading_component) && heading_component == "") &&
      (!is.list(columns_component) && columns_component == "")
    )
  ) {
    table_head <- ""
  } else {
    table_head <-
      htmltools::tags$thead(
        if (!is.list(heading_component) && heading_component == "") NULL else heading_component,
        if (!is.list(columns_component) && columns_component == "") NULL else columns_component
      )
  }
  table_head
}

finalize_html_table <- function(
    class,
    style,
    quarto_disable_processing,
    quarto_use_bootstrap,
    ...) {

  quarto_disable_processing <- tolower(as.character(quarto_disable_processing))
  quarto_use_bootstrap <- tolower(as.character(quarto_use_bootstrap))

  html_tbl <-
    as.character(
      htmltools::tags$table(
        class = "gt_table",
        style = style,
        `data-quarto-disable-processing` = quarto_disable_processing,
        `data-quarto-bootstrap` = quarto_use_bootstrap,
        ...
      )
    )

  # Unescape single quotes that may present as HTML entities (this is
  # needed since the CSS inliner cannot parse "&#39;")
  html_tbl <- gsub("&#39;", "'", html_tbl, fixed = TRUE)

  # Remove invalid id.
  html_tbl <- gsub(' id=""', "", html_tbl, fixed = TRUE)
  html_tbl
}
