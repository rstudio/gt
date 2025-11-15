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
  has_footer_section <- !is.null(source_notes) || nrow(footnotes) >= 1

  # Determine if the rendered table should have a header section
  has_header_section <- dt_heading_has_title(data = data)

  # Determine if there are tab spanners
  has_tab_spanners <- dt_spanners_exists(data = data)

  # Obtain the language from the `locale`, if provided
  locale <- normalize_locale(dt_locale_get_value(data = data))
  # Generate a `lang_defs` object to pass to the `language` argument
  lang_defs <- get_ihtml_translations(locale)

  column_groups <- dt_boxhead_get_vars_groups(data = data)
  # if dt_boxhead_get_vars_groups is fixed, this will no longer be necessary.
  if (identical(column_groups, NA_character_)) {
    column_groups <- NULL
  }

  # Derive styling for the stubhead
  stubhead_style <-  dt_styles_get(data)
  if (!is.null(stubhead_style)) {
    stubhead_style <- stubhead_style[stubhead_style$locname == "stubhead"]
    if (nrow(stubhead_style) == 0) {
      stubhead_style <- NULL
    } else {
      stubhead_style <- stubhead_style$html_style
    }
  }

  rownames_to_stub <- stub_rownames_has_column(data)
  # value to use for rowname_col or groupname_col title
  # Will use it for rowname_col only if groupname_col is undefined.
  # Will use it only for the first groupname_col.
  stub_label <- dt_stubhead_get(data)$label

  if (is.null(stub_label)) {
    # No label if stubhead label is undefined.
    rowname_label <- ""
    groupname_label <- ""
  } else if (!is.null(column_groups)) {
    rowname_label <- ""
    groupname_label <- stub_label
  } else {
    rowname_label <- stub_label
    groupname_label <- NULL
  }

  # Apply the stubhead styling to row group heading
  if (is.null(column_groups)) {
    rowname_header_style <- stubhead_style
    rwo_group_header_style <- NULL
  } else {
    # Since row names don't appear under the row group column, style it (even if it is different in non-intereactive)
    rowname_header_style   <- stubhead_style
    row_group_header_style <- stubhead_style
  }

  # Obtain the underlying data table (including group rows)
  data_tbl0 <- dt_data_get(data = data)

  # Only preserve columns that are not hidden (group cols will be added later)
  data_tbl_vars <- dt_boxhead_get_vars_default(data = data)
  data_tbl <- data_tbl0[, data_tbl_vars, drop = FALSE]

  #nocov start
  if (ncol(data_tbl) < 1) {
    # Stop function if there are no visible columns
    cli::cli_abort(c(
      "When displaying an interactive gt table, there must be at least one visible column.",
      "*" = "Check that the input data table has at least one column,",
      "*" = "Failing that, look at whether all columns have been inadvertently hidden."
    ))
  }
  #nocov end

  # use of special .rownames doesn't work.
  # Workaround https://github.com/glin/reactable/issues/378
  # rstudio/gt#1702
  if (rownames_to_stub) {
    rowname_col <- dt_boxhead_get_var_stub(data)
    if (length(rowname_col) == 1) {
      # avoid base R error when setting duplicate row names.
      row_names <-  as.character(data$`_data`[[rowname_col]])
      # Convert to NA string to avoid wrong output.
      # TODO figure out if there is a way to get the sub_missing value.
      # With data$`_substitutions`
      row_names <- dplyr::coalesce(row_names, "NA")
      attr(data_tbl, "row.names") <- row_names
    } else {
      rownames_to_stub <- FALSE
    }
  }

  # Obtain column label attributes
  column_names  <- dt_boxhead_get_vars_default(data = data)
  column_labels <- dt_boxhead_get_vars_labels_default(data = data)
  column_alignments <- dt_boxhead_get_vars_align_default(data = data)

  # Obtain widths for each visible column label
  boxh <- dt_boxhead_get(data = data)
  column_widths <- boxh[boxh$type %in% c("default", "stub"), , drop = FALSE]
  # ensure that stub is first
  column_widths <- column_widths[order(column_widths$type, decreasing = TRUE), "column_width", drop = TRUE]
  column_widths <- unlist(column_widths)

  # Transform any column widths to integer values
  if (!is.null(column_widths)) {

    column_widths <-
      vapply(
        column_widths,
        FUN.VALUE = integer(1L),
        USE.NAMES = FALSE,
        FUN = function(x) {
          if (grepl("px", x, fixed = TRUE)) {
            x <- as.integer(gsub("px", "", x, fixed = TRUE))
          } else {
            x <- NA_integer_
          }
          x
        }
      )
  }

  # Get all options settable in `tab_options()`
  tbl_opts <- dt_options_get_values(data)

  # Get specific options values
  height <- tbl_opts$ihtml_height
  use_pagination <- tbl_opts$ihtml_use_pagination
  use_pagination_info <- tbl_opts$ihtml_use_pagination_info
  use_search <- tbl_opts$ihtml_use_search
  use_sorting <- tbl_opts$ihtml_use_sorting
  use_filters <- tbl_opts$ihtml_use_filters
  use_resizers <- tbl_opts$ihtml_use_resizers
  use_highlight <- tbl_opts$ihtml_use_highlight
  use_compact_mode <- tbl_opts$ihtml_use_compact_mode
  use_text_wrapping <- tbl_opts$ihtml_use_text_wrapping
  use_page_size_select <- tbl_opts$ihtml_use_page_size_select
  page_size_default <- tbl_opts$ihtml_page_size_default
  page_size_values <- tbl_opts$ihtml_page_size_values
  pagination_type <- tbl_opts$ihtml_pagination_type
  selection_mode <- tbl_opts$ihtml_selection_mode
  if (is.na(selection_mode)) selection_mode <- NULL
  onClick <- if (!is.null(selection_mode)) "select"

  use_row_striping <- tbl_opts$row_striping_include_table_body
  row_striping_color <- tbl_opts$row_striping_background_color

  table_width <- tbl_opts$table_width
  table_background_color <- tbl_opts$table_background_color
  table_font_names <- tbl_opts$table_font_names
  table_font_color <- tbl_opts$table_font_color

  column_labels_border_top_style <- tbl_opts$column_labels_border_top_style
  column_labels_border_top_width <- tbl_opts$column_labels_border_top_width
  column_labels_border_top_color <- tbl_opts$column_labels_border_top_color
  column_labels_border_bottom_style <- tbl_opts$column_labels_border_bottom_style
  column_labels_border_bottom_width <- tbl_opts$column_labels_border_bottom_width
  column_labels_border_bottom_color <- tbl_opts$column_labels_border_bottom_color
  # Don't allow NA
  column_labels_background_color <- tbl_opts$column_labels_background_color
  # Apply stub font weight to
  stub_font_weight <- tbl_opts$stub_font_weight

  if (is.na(column_labels_background_color)) {
    # apply all column labels formatting to both heading + groupCol styling (nothing specific for spanners styling in gt?)
    column_labels_background_color <- "transparent"
  }
  # Part of #1307
  borderless_borders <- tbl_opts$table_body_hlines_style == "none"

  column_labels_font_weight <- tbl_opts$column_labels_font_weight
  # Apply font weight to groupname_col title
  row_group_font_weight <- tbl_opts$row_group_font_weight
  table_body_font_weight <- tbl_opts$table_font_weight
  # for row names + summary label
  stub_font_weight <- tbl_opts$stub_font_weight
  # #1693 table font size
  table_font_size <- tbl_opts$table_font_size

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

  if (rownames_to_stub) {
    # Create colDef row name with special ".rownames" from reactable.
    row_name_col_def <- list(reactable::colDef(
      name = rowname_label,
      # make sure the cells_stubhead() footnote renders properly.
      html = TRUE,
      style = list(
        fontWeight = stub_font_weight
      ),
      # part of the stubhead
      headerStyle = rowname_header_style
      # TODO pass on other attributes of row names column if necessary.
    ))
    names(row_name_col_def) <- ".rownames"
  } else {
    row_name_col_def <- NULL
  }

  #
  # Determine which columns will undergo some formatting
  #

  formats <- dt_formats_get(data = data)

  # Get a list of vectors that include columns taking part
  # in some formatting operation
  formatted_columns <-
    lapply(
      formats,
      FUN = function(x) {

        columns <- x$cols
        rows <- x$rows
        compat <- x$compat

        compat_columns <- c()

        for (col in columns) {

          if (
            col %in% colnames(data_tbl) &&
            is_compatible_formatter(
              table = data_tbl,
              column = col,
              rows = rows,
              compat = compat
            )
          ) {
            compat_columns <- c(compat_columns, col)
          }

        }
        compat_columns
      }
    )

  # Flatten this list of vectors to a single vector of unique column names
  formatted_columns <- unique(flatten_list(formatted_columns))

  # Format col_merge cols #1785
  col_merge_cols <- dt_col_merge_get_vars(data)
  formatted_columns <- c(formatted_columns, col_merge_cols)

  # format substitutions #1759
  substitution <- dt_substitutions_get(data)
  if (length(substitution) > 0) {
    sub_cols <- substitution[[1]]$cols
    formatted_columns <- c(formatted_columns, sub_cols)
  }

  # take unique values
  formatted_columns <- unique(formatted_columns)
  # Create a list of column definitions
  col_defs <-
    lapply(
      seq_along(column_names),
      FUN = function(x) {

        # Only perform extraction of formatted cells if there is an
        # indication that formatting will be performed on a column`
        # or if it is the result of column merge.
        if (column_names[x] %in% formatted_columns) {

          formatted_cells <-
            extract_cells(
              data = data,
              columns = column_names[x],
              output = "html"
            )

          cell_fn <- function(value, index) formatted_cells[index]
        } else {
          cell_fn <- NULL
        }

        reactable::colDef(
          cell = cell_fn,
          name = column_labels[x],
          align = column_alignments[x],
          # Has no effect with sub_missing
          na = "NA",
          # TODO support `summary_rows()` via `aggregate` #1359
          # TODO support `grand_summary_rows()` via `footer`. #1359
          width = if (is.null(column_widths) || is.na(column_widths[x])) NULL else column_widths[x],
          html = TRUE
        )
      }
    )
  names(col_defs) <- column_names

  # Customize groupname_col and add to data_tbl
  if (!is.null(column_groups)) {
    # FIXME how should row_groups_as_column behave?
    # FIXME find a way to remove borders to act like it is the value for the group
    # should it just be a normal row at the left?
    group_col_defs <- list()
    # Hack from glin/reactable#94 to hide the number of observations
    grp_fn <- reactable::JS("
      function(cellInfo) {
        return cellInfo.value
      }")
    for (i in seq_along(column_groups)) {
      if (i == 1) {
        # Use the stubhead label for the first group
        group_label <- groupname_label
        row_group_header_style <- stubhead_style
      } else {
        # by default, don't name groupname_col for consistency with non-interactive
        group_label <- ""
        row_group_header_style <- stubhead_style
      }

      group_col_defs[[i]] <-
        reactable::colDef(
          name = group_label,
          # make sure the cells_stubhead() footnote renders properly.
          html = TRUE,
          style = list(
            `font-weight` = row_group_font_weight
          ),
          headerStyle = row_group_header_style,
          # The total number of rows is wrong in colGroup, possibly due to the JS fn
          grouped = grp_fn,
          # FIXME Should groups be sticky? (or provide a way to do this)
          sticky = NULL
      )

    }
    names(group_col_defs) <- column_groups

    groupname_col <- column_groups
    # for defaultExpanded = TRUE
    expand_groupname_col <- TRUE
    # modify data_tbl to include
    data_tbl <- vctrs::vec_cbind(
      data_tbl,
      data_tbl0[ , groupname_col, drop = FALSE]
    )

  }  else {
    groupname_col <- NULL
    group_col_defs <- NULL
    expand_groupname_col <- FALSE
  }
  #
  # Generate custom styles for `defaultColDef`
  #

  # Add group colDef and rowname colDef to general col_def
  col_defs <- c(col_defs, group_col_defs, row_name_col_def)

  styles_tbl <- dt_styles_get(data = data)
  body_styles_tbl <- vctrs::vec_slice(styles_tbl, styles_tbl$locname %in% c("data", "stub"))
  body_styles_tbl <- dplyr::arrange(body_styles_tbl, colnum, rownum)
  body_styles_tbl <- dplyr::select(body_styles_tbl, "colname", "rownum", "html_style")

  # Generate styling rule per combination of `colname` and
  # `rownum` in `body_styles_tbl`
  body_style_rules <-
    vapply(
      seq_len(nrow(body_styles_tbl)), FUN.VALUE = character(1L), USE.NAMES = FALSE,
      FUN = function(x) {

        colname <- body_styles_tbl[x, ][["colname"]]
        rownum <- body_styles_tbl[x, ][["rownum"]]
        html_style <- body_styles_tbl[x, ][["html_style"]]
        html_style <- unlist(strsplit(html_style, "; ", fixed = TRUE))
        html_style <- gsub("(-)\\s*(.)", "\\U\\2", html_style, perl = TRUE)
        html_style <- gsub("(:)\\s*(.*)", ": '\\2'", html_style, perl = TRUE)
        html_style <- paste(html_style, collapse = ", ")
        html_style <- gsub(";'$", "'", html_style)

        paste0(
          "if (colInfo.id === '", colname, "' & rowIndex === ", rownum, ") {\n",
          "  return { ", html_style, " }\n",
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

  # TODO if `sub_missing()` is enabled globally, just use `na = ` here!
  default_col_def <-
    reactable::colDef(
      style = reactable::JS(body_style_js_str),
      minWidth = 125,
      # Has no effect with sub_missing()
      na = "NA",
      width = NULL
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
      source_notes_component <- create_source_notes_component_ihtml(data = data)
    } else {
      source_notes_component <- NULL
    }

    if (!is.null(footnotes)) {
      footnotes_component <- create_footnotes_component_ihtml(data = data)
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

  # Generate the column groups, if there are any tab_spanners
  colgroups_def <- NULL

  if (has_tab_spanners) {

    hidden_columns <- dt_boxhead_get_var_by_type(data = data, type = "hidden")
    spanners_df <- dt_spanners_get(data = data)
    col_groups <- vctrs::vec_slice(
      spanners_df, spanners_df$spanner_level == 1
    )

    for (i in seq_len(nrow(col_groups))) {

      columns_group_i <- unlist(col_groups[i, ][["vars"]])

      columns_group_i_diff <- base::setdiff(columns_group_i, hidden_columns)

      col_groups[i, ][["vars"]][[1]] <- columns_group_i_diff
    }

    if (max(dt_spanners_get(data = data)$spanner_level) > 1) {
      first_colgroups <- base::paste0(col_groups$built, collapse = "|")

      cli::cli_warn(c(
        "Interactive tables support a single spanner level.",
        "*" = "Currently there are {max(dt_spanners_get(data = data)$spanner_level)} levels of tab spanners.",
        "i" = "Only the first level will be used for the interactive table, that is: [{first_colgroups}]"
      ))
    }

    colgroups_def <-
      apply(
        col_groups, 1,
        FUN = function(x) {
          reactable::colGroup(
            name = x$spanner_label,
            columns = x$vars,
            header = x$built,
            html = TRUE,
            align = NULL,
            headerVAlign = NULL,
            # TODO #194
            sticky = NULL,
            headerClass = NULL,
            headerStyle = list(
              fontWeight = "normal",
              backgroundColor = column_labels_background_color,
              borderBottomStyle = column_labels_border_bottom_style,
              borderBottomWidth = column_labels_border_bottom_width,
              borderBottomColor = column_labels_border_bottom_color,
              borderLeftStyle =  column_labels_border_bottom_style,
              borderLeftWidth =  "4px",
              borderLeftColor =  "transparent",
              borderRightStyle = column_labels_border_bottom_style,
              borderRightWidth = "4px",
              borderRightColor = "transparent"
            )
          )
        }
      )
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
        `font-family` = font_family_str,
        #1693
        fontSize = if (is.na(table_font_size)) NULL else table_font_size
      ),
      tableStyle = list(
        borderTopStyle = column_labels_border_top_style,
        borderTopWidth = column_labels_border_top_width,
        borderTopColor = column_labels_border_top_color
      ),
      # cells_column_labels()
      headerStyle = list(
        fontWeight = column_labels_font_weight,
        backgroundColor = column_labels_background_color,
        borderBottomStyle = column_labels_border_bottom_style,
        borderBottomWidth = column_labels_border_bottom_width,
        borderBottomColor = column_labels_border_bottom_color
      ),
      # individually defined for the margins left+right
      # cells_spanner_labels() styling
      groupHeaderStyle =  list(
        fontWeight = column_labels_font_weight,
        backgroundColor = column_labels_background_color,
        borderBottomStyle = column_labels_border_bottom_style,
        borderBottomWidth = column_labels_border_bottom_width,
        borderBottomColor = column_labels_border_bottom_color
      ),
      tableBodyStyle = NULL,
      # stub styling?
      # rowGroupStyle = list(
      #   fontWeight = row_group_font_weight
      # ),
      rowStyle = NULL,
      rowStripedStyle = NULL,
      rowHighlightStyle = NULL,
      rowSelectedStyle = NULL,
      # cells_body styling
      cellStyle = list(
        fontWeight = table_body_font_weight
      ),
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
      columnGroups = colgroups_def,
      rownames = rownames_to_stub,
      groupBy = groupname_col,
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
      showPagination = use_pagination,
      showPageInfo = use_pagination_info,
      minRows = 1,
      paginateSubRows = FALSE,
      details = NULL,
      defaultExpanded = expand_groupname_col,
      selection = selection_mode,
      selectionId = NULL,
      defaultSelected = NULL,
      onClick = onClick,
      highlight = use_highlight,
      outlined = FALSE,
      bordered = FALSE,
      # equivalent to opt_table_lines(extent = "none")
      borderless = borderless_borders,
      striped = use_row_striping,
      compact = use_compact_mode,
      wrap = use_text_wrapping,
      showSortIcon = TRUE,
      showSortable = FALSE,
      class = NULL,
      style = NULL,
      rowClass = NULL,
      rowStyle = NULL,
      fullWidth = TRUE,
      width = table_width,
      height = height,
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

create_source_notes_component_ihtml <- function(data) {

  source_notes <- dt_source_notes_get(data = data)

  if (is.null(source_notes)) {
    return("")
  }

  styles_tbl <- dt_styles_get(data = data)

  # Get the style attrs for the source notes
  if ("source_notes" %in% styles_tbl$locname) {

    source_notes_style <-
      vctrs::vec_slice(
        styles_tbl$html_style,
        !is.na(styles_tbl$locname) & styles_tbl$locname == "source_notes"
      )

    source_notes_styles <-
      if (length(source_notes_style) > 0) {
        paste(source_notes_style, collapse = " ")
      } else {
        NULL
      }

  } else {
    source_notes_styles <- NULL
  }

  tbl_opts <- dt_options_get_values(data)
  # Get the source note multiline option
  multiline <- tbl_opts$source_notes_multiline

  # Get the source note separator option
  separator <- tbl_opts$source_notes_sep

  # Handle the multiline source notes case (each footnote takes up one line)
  if (multiline) {
    # Create the source notes component as a series of `<div>`s (one per
    # source note) inside of a `<div>`
    return(
      htmltools::tags$div(
        class = "gt_sourcenotes",
        lapply(
          source_notes,
          function(x) {
            htmltools::tags$div(
              class = "gt_sourcenote",
              style = source_notes_styles,
              htmltools::HTML(x)
            )
          }
        )
      )
    )
  }

  # Perform HTML escaping on the separator text and transform space
  # characters to non-breaking spaces
  separator <- gsub(" (?= )", "&nbsp;", separator, perl = TRUE)

  # Create the source notes component as a set of nested `<div>`s
  htmltools::tags$div(
    class = "gt_sourcenotes",
    style = source_notes_styles,
    htmltools::tags$div(
      class = "gt_sourcenote",
      htmltools::tags$div(
        style = htmltools::css(`padding-bottom` = "2px"),
        htmltools::HTML(paste(source_notes, collapse = separator))
      )
    )
  )
}

create_footnotes_component_ihtml <- function(data) {

  footnotes_tbl <- dt_footnotes_get(data = data)

  # If the `footnotes_resolved` object has no
  # rows, then return an empty footnotes component
  if (nrow(footnotes_tbl) == 0) {
    return("")
  }

  styles_tbl <- dt_styles_get(data = data)

  # Get the distinct set of `fs_id` & `footnotes` values in the `footnotes_tbl`
  footnotes_tbl <- dplyr::distinct(footnotes_tbl, fs_id, footnotes)

  # Get the style attrs for the footnotes
  if ("footnotes" %in% styles_tbl$locname) {

    footnotes_style <- styles_tbl[styles_tbl$locname == "footnotes", ]

    footnotes_styles <-
      if (nrow(footnotes_style) > 0) {
        paste(footnotes_style$html_style, collapse = " ")
      } else {
        NULL
      }

  } else {
    footnotes_styles <- NULL
  }

  tbl_opts <- dt_options_get_values(data)
  # Get the footnote multiline option
  multiline <- tbl_opts$footnotes_multiline

  # Get the footnote separator option
  separator <- tbl_opts$footnotes_sep

  # Obtain vectors of footnote ID values (prerendered glyphs) and
  # the associated text
  footnote_ids <- footnotes_tbl[["fs_id"]]
  footnote_text <- footnotes_tbl[["footnotes"]]

  # Create a vector of HTML footnotes
  footnotes <-
    unlist(
      mapply(
        SIMPLIFY = FALSE,
        USE.NAMES = FALSE,
        footnote_ids,
        footnote_text,
        FUN = function(x, footnote_text) {
          as.character(
            htmltools::tagList(
              htmltools::HTML(
                paste0(
                  footnote_mark_to_html(
                    data = data,
                    mark = x,
                    location = "ftr"
                  ),
                  " ",
                  process_text(footnote_text, context = "html")
                ),
                .noWS = c("after", "before")
              )
            )
          )
        }
      )
    )

  # Handle the multiline footnotes case (each footnote takes up one line)
  if (multiline) {

    # Create the footnotes component as a series of `<div>`s (one per
    # footnote) inside of a `<div>`
    return(
      htmltools::tags$div(
        class = "gt_footnotes",
        lapply(
          footnotes,
          function(x) {
            htmltools::tags$div(
              class = "gt_footnote",
              style = footnotes_styles,
              htmltools::HTML(x)
            )
          }
        )
      )
    )
  }

  # Perform HTML escaping on the separator text and transform space
  # characters to non-breaking spaces
  separator <- gsub(" (?= )", "&nbsp;", separator, perl = TRUE)

  # Create the footnotes component as a set of nested `<div>`s
  htmltools::tags$div(
    class = "gt_footnotes",
    style = footnotes_styles,
    htmltools::tags$div(
      class = "gt_footnote",
      htmltools::tags$div(
        style = htmltools::css(`padding-bottom` = "2px"),
        htmltools::HTML(paste(footnotes, collapse = separator))
      )
    )
  )
}

get_ihtml_translations <- function(locale) {
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
  lang_defs
}
