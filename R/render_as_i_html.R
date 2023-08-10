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
#  Copyright (c) 2018-2023 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


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

  # Generate a `lang_defs` object to pass to the `language` argument
  if (is.null(locale) || locale == "en") {

    lang_defs <- reactable::reactableLang()

  } else {

    locale_data <- locales[locales$locale == locale, ][1, ]

    if (is.na(locale_data[["no_table_data_text"]])) {

      lang_defs <- reactable::reactableLang()

    } else {

      lang_defs <-
        reactable::reactableLang(
          sortLabel = locale_data[["sort_label_text"]],
          filterPlaceholder = "",
          filterLabel = locale_data[["filter_label_text"]],
          searchPlaceholder = locale_data[["search_placeholder_text"]],
          searchLabel = locale_data[["search_placeholder_text"]],
          noData = locale_data[["no_table_data_text"]],
          pageNext = locale_data[["page_next_text"]],
          pagePrevious = locale_data[["page_previous_text"]],
          pageNumbers = locale_data[["page_numbers_text"]],
          pageInfo = gsub("\\\\u2013", "\u2013", locale_data[["page_info_text"]]),
          pageSizeOptions = locale_data[["page_size_options_text"]],
          pageNextLabel = locale_data[["page_next_label_text"]],
          pagePreviousLabel = locale_data[["page_previous_label_text"]],
          pageNumberLabel = locale_data[["page_number_label_text"]],
          pageJumpLabel = locale_data[["page_jump_label_text"]],
          pageSizeOptionsLabel = locale_data[["page_size_options_label_text"]],
          groupExpandLabel = "Toggle group",
          detailsExpandLabel = "Toggle details",
          selectAllRowsLabel = "Select all rows",
          selectAllSubRowsLabel = "Select all rows in group",
          selectRowLabel = "Select row"
        )
    }
  }

  # Obtain the underlying data table
  data_tbl <- dt_data_get(data = data)

  #
  # Only preserve columns that are not hidden
  #

  data_tbl_vars <- dt_boxhead_get_vars_default(data = data)
  data_tbl <- data_tbl[, data_tbl_vars, drop = FALSE]

  #nocov start

  # Stop function if there are no visible columns
  if (ncol(data_tbl) < 1) {

    cli::cli_abort(c(
      "When displaying an interactive gt table, there must be at least one visible column.",
      "*" = "Check that the input data table has at least one column,",
      "*" = "Failing that, look at whether all columns have been inadvertently hidden."
    ))
  }

  #nocov end

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
  use_text_wrapping <- opt_val(data = data, option = "ihtml_use_text_wrapping")
  use_page_size_select <- opt_val(data = data, option = "ihtml_use_page_size_select")
  page_size_default <- opt_val(data = data, option = "ihtml_page_size_default")
  page_size_values <- opt_val(data = data, option = "ihtml_page_size_values")
  pagination_type <- opt_val(data = data, option = "ihtml_pagination_type")

  use_row_striping <- opt_val(data = data, option = "row_striping_include_table_body")
  row_striping_color <- opt_val(data = data, option = "row_striping_background_color")

  table_width <- opt_val(data = data, option = "table_width")
  table_background_color <- opt_val(data = data, option = "table_background_color")
  table_font_names <- opt_val(data = data, option = "table_font_names")
  table_font_color <- opt_val(data = data, option = "table_font_color")

  column_labels_border_top_style <- opt_val(data = data, option = "column_labels_border_top_style")
  column_labels_border_top_width <- opt_val(data = data, option = "column_labels_border_top_width")
  column_labels_border_top_color <- opt_val(data = data, option = "column_labels_border_top_color")
  column_labels_border_bottom_style <- opt_val(data = data, option = "column_labels_border_bottom_style")
  column_labels_border_bottom_width <- opt_val(data = data, option = "column_labels_border_bottom_width")
  column_labels_border_bottom_color <- opt_val(data = data, option = "column_labels_border_bottom_color")

  emoji_symbol_fonts <-
    c(
      "Apple Color Emoji", "Segoe UI Emoji",
      "Segoe UI Symbol", "Noto Color Emoji"
    )

  table_font_names <- base::setdiff(table_font_names, emoji_symbol_fonts)

  font_family_str <-
    as_css_font_family_attr(
      font_vec = table_font_names,
      value_only = TRUE
    )

  if (table_width == "auto") table_width <- NULL

  # Create a list of column definitions
  col_defs <-
    lapply(
      seq_along(column_names),
      FUN = function(x) {

        formatted_cells <-
          extract_cells(
            data = data,
            columns = column_names[x],
            output = "html"
          )

        reactable::colDef(
          cell = function(value, index) formatted_cells[index],
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

  default_col_def <-
    reactable::colDef(
      style = reactable::JS(body_style_js_str)
    )

  # Generate the table header if there are any heading components
  if (has_header_section) {

    tbl_heading <- dt_heading_get(data = data)

    heading_component <-
      htmltools::div(
        style = htmltools::css(
          `font-family` = font_family_str,
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
          `font-family` = font_family_str,
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
        fontFamily = font_family_str
      ),
      tableStyle = NULL,
      headerStyle = list(
        borderTopStyle = column_labels_border_top_style,
        borderTopWidth = column_labels_border_top_width,
        borderTopColor = column_labels_border_top_color,
        borderBottomStyle = column_labels_border_bottom_style,
        borderBottomWidth = column_labels_border_bottom_width,
        borderBottomColor = column_labels_border_bottom_color

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
      data = data_tbl,
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
      wrap = use_text_wrapping,
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
      language = lang_defs,
      elementId = id,
      static = FALSE
    )

  #nocov start

  # Prepend the `heading_component` to the widget content
  if (!is.null(heading_component)) {
    x <- htmlwidgets::prependContent(x, heading_component)
  }

  # Append the `footer_component` to the widget content
  if (!is.null(footer_component)) {
    x <- htmlwidgets::appendContent(x, footer_component)
  }

  #nocov end

  x
}
