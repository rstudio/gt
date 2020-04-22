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

  data <- data %>% build_data(context = "html")

  # Composition of HTML -----------------------------------------------------

  # Upgrade `_styles` to gain a `html_style` column with CSS style rules
  data <- add_css_styles(data = data)

  # Create the heading component
  heading_component <- create_heading_component(data = data, context = "html")

  # Create the columns component
  columns_component <- create_columns_component_h(data = data)

  # Create the body component
  #body_component <- create_body_component_h(data = data)
  body_component <- build_body(data$`_body`, type = "format")

  # Create the source notes component
  source_notes_component <- create_source_notes_component_h(data = data)

  # Create the footnotes component
  footnotes_component <- create_footnotes_component_h(data = data)

  # Get attributes for the gt table
  table_defs <- get_table_defs(data = data)

  # Compose the HTML table
  htmltools::tags$table(
    class = "gt_table",
    style = table_defs$table_style,
    table_defs$table_colgroups,
    heading_component,
    columns_component,
    body_component,
    source_notes_component,
    footnotes_component
  ) %>%
    as.character()

}
