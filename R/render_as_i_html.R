#' Transform a **gt** table object to an HTML table
#'
#' Take a `gti_tbl` table object and transform it to an HTML table.
#'
#' @param data A table object that is created using the `gt()` function.
#'
#' @return A character object with an HTML table.
#'
#' @noRd
render_as_ihtml <- function(data, id) {

  # Get the built data for the table body in the HTML context
  data <- build_data(data = data, context = "html")

  # Upgrade the `_styles` component to give it a `html_style` column
  # with CSS style rules
  data <- add_css_styles(data = data)

  # Get any available source notes or footnotes in the table
  source_notes <- dt_source_notes_get(data = data)
  footnotes <- dt_footnotes_get(data = data)

  # Determine if the rendered table should have a footer section
  has_footer_section <- !is.null(source_notes) || nrow(footnotes) > 1

  # Determine if the rendered table should have a header section
  has_header_section <- dt_heading_has_title(data = data)

  # Obtain the language from the `locale`, if provided
  locale <- dt_locale_get_value(data = data)

  # TODO: generate a language options object to pass to `language` option
  if (is.null(locale)) {
    lang <- "en"
  } else {
    lang <- gsub("(.)?_.*", "\\1", locale)
  }

  # Obtain the rendered HTML table body
  html_body <- dt_body_get(data = data)

  # Obtain column label attributes
  column_names  <- dt_boxhead_get_vars_default(data = data)
  column_labels <- dt_boxhead_get_vars_labels_default(data = data)
  column_alignments <- dt_boxhead_get_vars_align_default(data = data)

  # Obtain widths for each visible column label
  boxh <- dt_boxhead_get(data = data)
  column_widths <- dplyr::filter(boxh, type %in% c("default", "stub"))
  column_widths <- dplyr::pull(dplyr::arrange(column_widths, dplyr::desc(type)), column_width)
  column_widths <- unlist(column_widths)

  # Transform any column widths to integer values
  if (!is.null(column_widths)) {

    column_widths <-
      vapply(
        column_widths,
        FUN.VALUE = integer(1),
        USE.NAMES = FALSE,
        FUN = function(x) {
          if (grepl("px", x)) {
            x <- as.integer(gsub("px", "", x))
          } else {
            x <- NA_integer_
          }
          x
        }
      )
  }

  # Get options settable in `tab_options()`
  opt_val <- dt_options_get_value
  use_pagination <- opt_val(data = data, option = "ihtml_use_pagination")
  use_pagination_info <- opt_val(data = data, option = "ihtml_use_pagination_info")
  use_search <- opt_val(data = data, option = "ihtml_use_search")
  use_sorting <- opt_val(data = data, option = "ihtml_use_sorting")
  use_filters <- opt_val(data = data, option = "ihtml_use_filters")
  use_resizers <- opt_val(data = data, option = "ihtml_use_resizers")
  use_highlight <- opt_val(data = data, option = "ihtml_use_highlight")
  use_compact_mode <- opt_val(data = data, option = "ihtml_use_compact_mode")
  use_page_size_select <- opt_val(data = data, option = "ihtml_use_page_size_select")
  page_size_default <- opt_val(data = data, option = "ihtml_page_size_default")
  page_size_values <- opt_val(data = data, option = "ihtml_page_size_values")
  pagination_type <- opt_val(data = data, option = "ihtml_pagination_type")

  use_row_striping <- opt_val(data = data, option = "row_striping_include_table_body")
  row_striping_color <- opt_val(data = data, option = "row_striping_background_color")
  table_width <- opt_val(data = data, option = "table_width")
  table_background_color <- opt_val(data = data, option = "table_background_color")
  table_font_style <- opt_val(data = data, option = "table_font_names")
  table_font_color <- opt_val(data = data, option = "table_font_color")

  if (table_width == "auto") table_width <- NULL

  # Create a list of column definitions
  col_defs <-
    lapply(
      seq_along(column_names),
      FUN = function(x) {
        reactable::colDef(
          name = column_labels[x],
          align = column_alignments[x],
          headerStyle = list(`font-weight` = "normal"),
          width = if (is.null(column_widths) || is.na(column_widths[x])) NULL else column_widths[x],
          html = TRUE
        )
      }
    )
  names(col_defs) <- column_names

  #
  # Generate custom styles for `defaultColDef`
  #

  styles_tbl <- dt_styles_get(data = data)
  body_styles_tbl <- dplyr::filter(styles_tbl, locname %in% c("data", "stub"))
  body_styles_tbl <- dplyr::arrange(body_styles_tbl, colnum, rownum)
  body_styles_tbl <- dplyr::select(body_styles_tbl, colname, rownum, html_style)

  # Generate styling rule per combination of `colname` and
  # `rownum` in `body_styles_tbl`
  body_style_rules <-
    vapply(
      seq_len(nrow(body_styles_tbl)), FUN.VALUE = character(1), USE.NAMES = FALSE,
      FUN = function(x) {

        colname <- body_styles_tbl[x, ][["colname"]]
        rownum <- body_styles_tbl[x, ][["rownum"]]
        html_style <- body_styles_tbl[x, ][["html_style"]]
        html_style <- unlist(strsplit(html_style, "; "))
        html_style <- gsub("(-)\\s*(.)", "\\U\\2", html_style, perl = TRUE)
        html_style <- gsub("(:)\\s*(.*)", ": '\\2'", html_style, perl = TRUE)
        html_style <- paste(html_style, collapse = ", ")
        html_style <- gsub(";'$", "'", html_style)

        paste0(
          "if (colInfo.id === '", colname, "' & rowIndex === ", rownum, ") {\n",
          "  return { ", html_style , " }\n",
          "}\n\n"
        )
      }
    )

  body_style_rules <- paste(body_style_rules, collapse = "")

  body_style_js_str <-
    paste0(
      "function(rowInfo, colInfo) {\n",
      "const rowIndex = rowInfo.index + 1\n",
      body_style_rules,
      "}",
      collapse = ""
    )

  default_col_def <- reactable::colDef(style = reactable::JS(body_style_js_str))

  # Generate the table header if there are any heading components
  if (has_header_section) {

    tbl_heading <- dt_heading_get(data = data)

    heading_component <-
      htmltools::div(
        style = htmltools::css(
          `border-top-style` = "solid",
          `border-top-width` = "2px",
          `border-top-color` = "#D3D3D3",
          `padding-bottom` = if (use_search) "8px" else NULL
        ),
        htmltools::div(
          class = "gt_heading gt_title gt_font_normal",
          style = htmltools::css(`text-size` = "bigger"),
          htmltools::HTML(tbl_heading$title)
        ),
        htmltools::div(
          class = paste(
            "gt_heading", "gt_subtitle",
            if (use_search) "gt_bottom_border" else NULL
          ),
          htmltools::HTML(tbl_heading$subtitle)
        )
      )

  } else {
    heading_component <- NULL
  }

  # Generate the table footer if there are any footer components
  if (has_footer_section) {

    if (!is.null(source_notes)) {
      source_notes_component <- create_source_notes_component_h(data = data)
    } else {
      source_notes_component <- NULL
    }

    if (!is.null(footnotes)) {
      footnotes_component <- create_footnotes_component_h(data = data)
    } else {
      footnotes_component <- NULL
    }

    footer_component <-
      htmltools::div(
        style = htmltools::css(
          `border-top-style` = "solid",
          `border-top-width` = "2px",
          `border-top-color` = "#D3D3D3",
          `border-bottom-style` = "solid",
          `border-bottom-width` = "2px",
          `border-bottom-color` = "#D3D3D3",
          `padding-top` = "6px",
          `padding-bottom` = "6px",
          `padding-left` = "10px",
          `padding-right` = "10px"
        ),
        htmltools::div(source_notes_component),
        htmltools::div(footnotes_component)
      )

  } else {
    footer_component <- NULL
  }

  # Generate the default theme for the table
  tbl_theme <-
    reactable::reactableTheme(
      color = table_font_color,
      backgroundColor = table_background_color,
      borderColor = NULL,
      borderWidth = NULL,
      stripedColor = row_striping_color,
      highlightColor = NULL,
      cellPadding = NULL,
      style = list(
        fontFamily = table_font_style
      ),
      tableStyle = NULL,
      headerStyle = list(
        borderTopStyle = "solid",
        borderTopWidth = "2px",
        borderTopColor = "#D3D3D3"
      ),
      groupHeaderStyle = NULL,
      tableBodyStyle = NULL,
      rowGroupStyle = NULL,
      rowStyle = NULL,
      rowStripedStyle = NULL,
      rowHighlightStyle = NULL,
      rowSelectedStyle = NULL,
      cellStyle = NULL,
      footerStyle = NULL,
      inputStyle = NULL,
      filterInputStyle = NULL,
      searchInputStyle = NULL,
      selectStyle = NULL,
      paginationStyle = NULL,
      pageButtonStyle = NULL,
      pageButtonHoverStyle = NULL,
      pageButtonActiveStyle = NULL,
      pageButtonCurrentStyle = NULL
    )

  # Create the htmlwidget
  x <-
    reactable::reactable(
      data = html_body,
      columns = col_defs,
      columnGroups = NULL,
      rownames = NULL,
      groupBy = NULL,
      sortable = use_sorting,
      resizable = use_resizers,
      filterable = use_filters,
      searchable = use_search,
      searchMethod = NULL,
      defaultColDef = default_col_def,
      defaultColGroup = NULL,
      defaultSortOrder = "asc",
      defaultSorted = NULL,
      pagination = use_pagination,
      defaultPageSize = page_size_default,
      showPageSizeOptions = use_page_size_select,
      pageSizeOptions = page_size_values,
      paginationType = pagination_type,
      showPagination = TRUE,
      showPageInfo = use_pagination_info,
      minRows = 1,
      paginateSubRows = FALSE,
      details = NULL,
      defaultExpanded = FALSE,
      selection = NULL,
      selectionId = NULL,
      defaultSelected = NULL,
      onClick = NULL,
      highlight = use_highlight,
      outlined = FALSE,
      bordered = FALSE,
      borderless = FALSE,
      striped = use_row_striping,
      compact = use_compact_mode,
      wrap = TRUE,
      showSortIcon = TRUE,
      showSortable = TRUE,
      class = NULL,
      style = NULL,
      rowClass = NULL,
      rowStyle = NULL,
      fullWidth = TRUE,
      width = table_width,
      height = "auto",
      theme = tbl_theme,
      language = NULL,
      elementId = id,
      static = FALSE
    )

  # Prepend the `heading_component` to the widget content
  if (!is.null(heading_component)) {
    x <- htmlwidgets::prependContent(x, heading_component)
  }

  # Append the `footer_component` to the widget content
  if (!is.null(footer_component)) {
    x <- htmlwidgets::appendContent(x, footer_component)
  }

  x
}
