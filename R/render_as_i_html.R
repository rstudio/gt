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

  data <- build_data(data = data, context = "html")

  # Upgrade `_styles` to gain a `js_style` column with CSS style rules
  data <- add_css_styles(data = data)

  # caption_component <- create_caption_component_h(data = data)
  #
  # # Create the source notes component
  # source_notes_component <- create_source_notes_component_h(data = data)
  #
  # # Create the footnotes component
  # footnotes_component <- create_footnotes_component_h(data = data)
  #

  # Obtain the language from the `locale`, if provided
  locale <- dt_locale_get_value(data = data)

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
  column_widths <-
    dt_boxhead_get(data = data) %>%
    dplyr::filter(type %in% c("default", "stub")) %>%
    dplyr::arrange(dplyr::desc(type)) %>%
    dplyr::pull(column_width) %>%
    unlist()

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
  use_search <- opt_val(data = data, option = "ihtml_use_search")
  use_sorting <- opt_val(data = data, option = "ihtml_use_sorting")
  use_filters <- opt_val(data = data, option = "ihtml_use_filters")
  use_resizers <- opt_val(data = data, option = "ihtml_use_resizers")
  use_highlight <- opt_val(data = data, option = "ihtml_use_highlight")
  use_compact_mode <- opt_val(data = data, option = "ihtml_use_compact_mode")
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

  body_styles_tbl <-
    dt_styles_get(data = data) %>%
    dplyr::filter(locname %in% c("data", "stub")) %>%
    dplyr::arrange(colnum, rownum) %>%
    dplyr::select(colname, rownum, html_style)

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
      "const rowIndex = rowInfo.viewIndex + 1\n",
      body_style_rules,
      "}",
      collapse = ""
    )

  default_col_def <- reactable::colDef(style = reactable::JS(body_style_js_str))

  # Process the table heading, if available
  if (dt_heading_has_title(data = data)) {

    tbl_heading <- dt_heading_get(data = data)

    heading_component <-
      htmltools::div(
        class = "gt_table",
        style = htmltools::css(
          `border-top-style` = "solid",
          `border-top-width` = "2px",
          `border-top-color` = "#D3D3D3",
          `padding-bottom` = "8px"
        ),
        id = id,
        htmltools::div(
          id = id,
          class = "gt_heading gt_title gt_font_normal",
          style = htmltools::css(`text-size` = "bigger"),
          htmltools::HTML(tbl_heading$title)
        ),
        htmltools::div(
          id = id,
          class = "gt_heading gt_subtitle gt_bottom_border",
          htmltools::HTML(tbl_heading$subtitle)
        )
      )
  } else {
    heading_component <- ""
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
      defaultPageSize = 10,
      showPageSizeOptions = FALSE,
      pageSizeOptions = c(10, 25, 50, 100),
      paginationType = "numbers", # "numbers", "jump", or "simple"
      showPagination = NULL,
      showPageInfo = TRUE,
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
      showSortable = FALSE,
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
  x <- htmlwidgets::prependContent(x, heading_component)

  x
}
