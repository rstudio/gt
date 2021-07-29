#' Transform a **gt** table object to its intermediate representation (IR)
#'
#' Take a `gt_tbl` table object and transform it to valid gt IR text.
#'
#' @param data A table object that is created using the `gt()` function.
#'
#' @return A character object.
#'
#' @noRd
render_to_ir <- function(data,
                         target = c("html", "latex", "rtf")) {

  target <- match.arg(target)

  data <- build_data(data = data, context = target)

  # Composition of IR -------------------------------------------------------

  # Upgrade `_styles` to gain a `html_style` column with CSS style rules
  data <- add_css_styles(data = data)

  # Create the column group component
  colgroup_component <- create_col_group_ir(data = data)

  # Create the heading component
  heading_component <- create_heading_ir(data = data)

  # Create the columns component
  columns_component <- create_columns_ir(data = data)

  # Create the body component
  body_component <- create_body_ir(data = data) # TODO

  # Create the footer component
  footer_component <- create_footer_ir(data = data) # TODO

  # Compose the IR
  ir <-
    combine_as_ir(
      table_defs = table_defs,
      colgroup_component = colgroup_component,
      caption_component = caption_component,
      heading_component = heading_component,
      columns_component = columns_component,
      body_component = body_component,
      footer_component = footer_component
    )

  ir
}
