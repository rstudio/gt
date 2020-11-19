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

  # Composition of HTML -----------------------------------------------------

  # Upgrade `_styles` to gain a `html_style` column with CSS style rules
  data <- add_css_styles(data = data)

  # Create the heading component
  heading_component <- create_heading_component(data = data, context = "html")

  # Create the columns component
  columns_component <- create_columns_component_h(data = data)

  # Create the body component
  body_component <- create_body_component_h(data = data)

  # Create the source notes component
  source_notes_component <- create_source_notes_component_h(data = data)

  # Create the footnotes component
  footnotes_component <- create_footnotes_component_h(data = data)

  # Get attributes for the gt table
  table_defs <- get_table_defs(data = data)

  # Create the table caption if available
  table_caption <- dt_options_get_value(data = data, option = "table_caption")

  if (!is.na(table_caption)) {

    # Reference Implementation (knitr): knitr/table.R
    # kable_caption = function(label, caption, format) {
    #   # create a label for bookdown if applicable
    #   if (is.null(label)) label = opts_current$get('label')
    #   if (!is.null(caption) && !is.na(caption)) caption = paste0(
    #     create_label('tab:', label, latex = (format == 'latex')), caption
    #   )
    #   caption
    # }
    #
    # `create_label()`: knitr/utils.R
    # # create \label{x} or (\#x); the latter is current an internal hack for bookdown
    # create_label = function(..., latex = FALSE) {
    #   if (isTRUE(opts_knit$get('bookdown.internal.label'))) {
    #     lab1 = '(\\#'; lab2 = ')'
    #   } else if (latex) {
    #     lab1 = '\\label{'; lab2 = '}'
    #   } else {
    #     return('')  # we don't want the label at all
    #   }
    #   paste(c(lab1, ..., lab2), collapse = '')
    # }

    # Reference Implementation (bookdown): bookdown/html.R
    # resolve_refs_html = function(content, global = FALSE) {
    #   content = resolve_ref_links_html(content)
    #
    #   res = parse_fig_labels(content, global)
    #   content = res$content
    #   ref_table = c(res$ref_table, parse_section_labels(content))
    #
    #   # look for @ref(label) and resolve to actual figure/table/section numbers
    #   m = gregexpr('(?<!\\\\)@ref\\(([-:[:alnum:]]+)\\)', content, perl = TRUE)
    #   refs = regmatches(content, m)
    #   for (i in seq_along(refs)) {
    #     if (length(refs[[i]]) == 0) next
    #     # strip off html tags when resolve numbers in <img>'s alt attribute because
    #     # the numbers may contain double quotes, e.g. <img alt="<a
    #     # href="#foo">1.2</a>"" width=...
    #     ref = ref_to_number(refs[[i]], ref_table, FALSE)
    #     if (is_img_line(content[i])) ref = strip_html(ref)
    #     refs[[i]] = ref
    #   }
    #   regmatches(content, m) = refs
    #   content
    # }
    #
    # `resolve_ref_links_html()`
    #
    # `parse_fig_labels()`
    #
    # `parse_section_labels()`
    #
    # `ref_to_number()`
    #
    # `is_img_line()`
    #
    # `strip_html()`

    # TODO: Create the <span> tag
    chunk_name <- "chunk_name" # <- TODO: get the chunk name
    span_id <- paste0("tab:", chunk_name)
    table_number <- "1.1" # <- TODO: get the table number
    span_content <- paste0("Table ", table_number, ": ")

    # TODO: Create the <caption> tag
    caption_component <-
      htmltools::tags$caption(
        htmltools::tags$span(
          id = span_id,
          span_content
        ),
        table_caption
      )

    heading_component <- ""
  } else {
    caption_component <- ""
  }

  # Compose the HTML table
  as.character(
    htmltools::tags$table(
      class = "gt_table",
      style = table_defs$table_style,
      caption_component,
      table_defs$table_colgroups,
      heading_component,
      columns_component,
      body_component,
      source_notes_component,
      footnotes_component
    )
  )
}
