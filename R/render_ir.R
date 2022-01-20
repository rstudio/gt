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
  body_component <- create_body_ir(data = data)

  # Create the source notes component
  source_notes_component <- create_source_notes_ir(data = data)

  # Create the footnotes component
  footnotes_component <- create_footnotes_ir(data = data)

  # Compose the IR
  combine_as_ir(
    data = data,
    target = target,
    colgroup_component = colgroup_component,
    heading_component = heading_component,
    columns_component = columns_component,
    body_component = body_component,
    source_notes_component = source_notes_component,
    footnotes_component = footnotes_component
  )
}

get_tr_count_from_component <- function(html_string) {

  length(
    xml2::xml_find_all(
      xml2::read_html(
        as.character(html_string)),
      xpath = ".//tr"
    )
  )
}
