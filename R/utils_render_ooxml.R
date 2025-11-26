as_word_ooxml <- function(
  data,
  align = "center",
  caption_location = c("top", "bottom", "embed"),
  caption_align = "left",
  split = FALSE,
  keep_with_next = TRUE,
  autonum = TRUE
) {
  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  caption_location <- rlang::arg_match(caption_location)

  # Build all table data objects through a common pipeline
  data <- build_data(data, context = "word")

  embedded_heading <- identical(caption_location, "embed")
  xml <- as_ooxml_tbl("word", data,
      align = align,
      split = split,
      keep_with_next = keep_with_next,
      embedded_heading = embedded_heading,
      autonum = autonum
  )
  if (!embedded_heading) {
    heading <- create_table_caption_contents_ooxml("word", data,
      autonum = autonum,
      keep_with_next = if(caption_location == "bottom") FALSE else keep_with_next
    )
    if (identical(caption_location, "top")) {
      xml <- htmltools::tagList(!!!heading, xml)
    } else {
      xml <- htmltools::tagList(xml, !!!heading)
    }
  }

  paste(as.character(xml), collapse = "")
}

as_ooxml_tbl <- function(ooxml_type, data,
    align = "center",
    split = FALSE,
    keep_with_next = TRUE,
    embedded_heading = FALSE,
    autonum = TRUE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  tbl_properties <- create_table_properties_ooxml(ooxml_type, data = data, align = align)

  # <a:tblGrid> is not optional in pptx, so create_table_grid must set it
  #
  # things are different in word where we can have w:tblLayoutType="autofit" and then
  # not have a <w:tblGrid> node
  tbl_grid          <- create_table_grid_ooxml(ooxml_type, data = data)
  tbl_spanner_rows  <- create_spanner_rows_ooxml(ooxml_type, data = data, split = split, keep_with_next = keep_with_next)
  tbl_table_rows    <- create_table_rows_ooxml(ooxml_type, data = data, split = split, keep_with_next = keep_with_next)
  tbl_footnote_rows <- create_footnote_rows_ooxml(ooxml_type, data = data, split = split, keep_with_next = keep_with_next)

  tbl_heading_row  <- if (embedded_heading) {
    create_heading_row(ooxml_type, data = data,
      split = split,
      keep_with_next = keep_with_next,
      autonum = autonum
    )
  }

  ooxml_tbl(ooxml_type,
    properties = tbl_properties,
    grid       = tbl_grid,
    tbl_heading_row,
    !!!tbl_spanner_rows,
    !!!tbl_table_rows,
    !!!tbl_footnote_rows
  )
}

# table properties --------------------------------------------------------

create_table_properties_ooxml <- function(ooxml_type, data, align = c("center", "start", "end")) {
  # TODO: set layout as autofit when dt_boxhead_get()$column_width
  #       are all NULL and figure out equivalent in pptx
  ooxml_tbl_properties(ooxml_type,
    justify = align,
    width   = "100%"
  )
}


# table heading rows ------------------------------------------------------

create_heading_row <- function(ooxml_type, data, split = FALSE, keep_with_next = TRUE, autonum = TRUE) {
  if (!dt_heading_has_title(data = data)) {
    return(NULL)
  }

  heading <- dt_heading_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)
  styles_tbl <- dt_styles_get(data = data)
  stub_components <- dt_stub_components(data = data)
  subtitle_defined <- dt_heading_has_subtitle(data = data)

  header_title_style <-
    styles_tbl[styles_tbl$locname == "title", ]$styles[1][[1]]

  # Obtain the number of visible columns in the built table
  n_data_cols <- length(dt_boxhead_get_vars_default(data = data))
  n_stub_cols <- length(dt_boxhead_get_var_by_type(data, type = "stub"))
  n_cols <- n_data_cols + n_stub_cols

  # Get table options
  heading_border_bottom_color <- dt_options_get_value(data, option = "heading_border_bottom_color")

  paragraphs <- create_table_caption_contents_ooxml(ooxml_type, data,
    autonum = autonum, keep_with_next = keep_with_next
  )

  ooxml_tbl_row(ooxml_type, split = split,
    ooxml_tbl_cell(ooxml_type, !!!paragraphs,
      properties = ooxml_tbl_cell_properties(ooxml_type,
        borders  = list(
          top    = list(type = "solid", size = 2, color = heading_border_bottom_color),
          bottom = list(type = "solid", size = 2, color = heading_border_bottom_color)
        ),
        fill     = header_title_style[["cell_fill"]][["color"]],
        v_align  = header_title_style[["cell_text"]][["v_align"]],
        col_span = n_cols,
        margins  = list(
          top = list(width = 25)
        )
      )
    )
  )
}

create_table_caption_contents_ooxml <- function(ooxml_type, data, autonum = TRUE, keep_with_next = TRUE) {
  if (!dt_heading_has_title(data = data)) {
    return(NULL)
  }
  htmltools::tagList(
    create_heading_row_title_paragraph(ooxml_type, data, autonum = autonum, keep_with_next = keep_with_next),
    create_heading_row_subtitle_paragraph(ooxml_type, data, keep_with_next = keep_with_next)
  )
}

create_heading_row_title_paragraph <- function(ooxml_type, data, autonum = TRUE, keep_with_next = TRUE) {
  heading <- dt_heading_get(data = data)

  styles_tbl <- dt_styles_get(data = data)
  header_title_style <- styles_tbl[styles_tbl$locname == "title", ]$styles[1][[1]]

  table_font_color <- dt_options_get_value(data, option = "table_font_color")

  paragraphs <- process_cell_content_ooxml(ooxml_type, heading$title,
    cell_style = header_title_style,
    whitespace = "default",

    size_default  = 24,
    color_default = table_font_color,

    paragraph_style = "caption",
    keep_with_next  = keep_with_next,
    align_default   = "center"
  )

  # TODO: footnote marks

  if (autonum) {
    autonum_nodes <- as_xml_node(ooxml_table_autonum(ooxml_type,
      font = header_title_style[["cell_text"]][["font"]] %||% "Calibri",
      size = 24
    ))

    for (i in seq_len(length(autonum_nodes))) {
      xml_add_child(paragraphs[[1]], autonum_nodes[[i]], .where = i)
    }
  }

  to_tags(paragraphs)
}

create_heading_row_subtitle_paragraph <- function(ooxml_type, data, keep_with_next = TRUE) {
  if (!dt_heading_has_subtitle(data = data)) {
    return(NULL)
  }

  styles_tbl <- dt_styles_get(data = data)
  heading <- dt_heading_get(data = data)
  table_font_color <- dt_options_get_value(data, option = "table_font_color")

  header_subtitle_style <- styles_tbl[styles_tbl$locname == "subtitle", ]$styles[1][[1]]

  paragraphs <- process_cell_content_ooxml(ooxml_type, heading$subtitle,
    cell_style = header_subtitle_style,
    whitespace = "default",

    size_default  = 16,
    color_default = table_font_color,

    paragraph_style = "caption",
    keep_with_next  = keep_with_next,
    align_default   = "center"
  )

  to_tags(paragraphs)
}


# footnote rows -----------------------------------------------------------

create_footnote_rows_ooxml <- function(ooxml_type, data, split = split, keep_with_next = keep_with_next) {
  footnotes_tbl <- dt_footnotes_get(data = data)
  if (nrow(footnotes_tbl) == 0L) {
    return(NULL)
  }

  n_data_cols <- length(dt_boxhead_get_vars_default(data = data))
  n_stub_cols <- length(dt_boxhead_get_var_by_type(data, type = "stub"))
  n_cols <- n_data_cols + n_stub_cols

  cell_style <- dt_styles_get(data = data)
  cell_style <- cell_style[cell_style$locname == "footnotes", "styles", drop = TRUE]
  cell_style <- cell_style[1][[1]]

  footnotes_tbl <- dplyr::distinct(footnotes_tbl, fs_id, footnotes)

  separator <- dt_options_get_value(data = data, option = "footnotes_sep")

  footnote_ids <- footnotes_tbl[["fs_id"]]
  footnote_text <- footnotes_tbl[["footnotes"]]

  footnote_rows <- lapply(seq_along(footnote_ids), function(i) {
    # in the build stage, we don't process markdown for footnote text
    # So, we process it now https://github.com/rstudio/gt/issues/1892
    footnote_xml <- process_text_ooxml(footnote_text[[i]], ooxml_type)

    # TODO: footnote marks for the subtitle

    content <- process_cell_content_ooxml(ooxml_type, footnote_xml,
      cell_style = cell_style,
      keep_with_next = keep_with_next
    )

    ooxml_tbl_row(ooxml_type, split = split,
      ooxml_tbl_cell(ooxml_type, !!!to_tags(content),
        properties = ooxml_tbl_cell_properties(ooxml_type,
          fill     = cell_style[["cell_fill"]][["color"]],
          v_align  = cell_style[["cell_text"]][["v_align"]],
          col_span = n_cols
        )
      )
    )
  })

  tagList(!!!footnote_rows)

}

# table grid --------------------------------------------------------------

create_table_grid_ooxml <- function(ooxml_type, data) {
  boxh <- dt_boxhead_get(data = data)

  widths <- boxh[boxh$type %in% c("default", "stub"), , drop = FALSE]
  # returns vector of column widths where `stub` is first
  widths <- dplyr::arrange(widths, dplyr::desc(type))$column_width

  # widths may be NULL, pct(), px() ...
  ooxml_tbl_grid(ooxml_type, !!!widths)
}

# spanner rows ------------------------------------------------------------

create_spanner_rows_ooxml <- function(ooxml_type, data, split = FALSE, keep_with_next = TRUE) {
  if (dt_options_get_value(data = data, option = "column_labels_hidden")) {
    return(NULL)
  }

  # Determine the finalized number of spanner rows
  spanner_row_count <- dt_spanners_matrix_height(data = data, omit_columns_row = FALSE)

  spanner_rows <- lapply(seq_len(spanner_row_count),
    create_spanner_row_ooxml,
    ooxml_type = ooxml_type, data = data, split = split, keep_with_next = keep_with_next
  )

  spanner_rows
}

create_spanner_row_ooxml <- function(ooxml_type, data, span_row_idx, split = FALSE, keep_with_next = TRUE) {
  styles_tbl <- dt_styles_get(data = data)
  column_labels_vlines_color        <- dt_options_get_value(data = data, option = "column_labels_vlines_color")
  column_labels_border_top_color    <- dt_options_get_value(data = data, option = "column_labels_border_top_color")
  column_labels_border_bottom_color <- dt_options_get_value(data = data, option = "column_labels_border_bottom_color")

  spanners    <- dt_spanners_print_matrix(data, include_hidden = FALSE)
  spanner_ids <- dt_spanners_print_matrix(data, include_hidden = FALSE, ids = TRUE)
  spanner_row_values <- spanners[span_row_idx,]
  spanner_row_ids <- spanner_ids[span_row_idx,]

  spanners_rle <- rle(spanner_row_ids)
  sig_cells <- c(1, utils::head(cumsum(spanners_rle$lengths) + 1, -1))
  colspans <- ifelse(
    seq_along(spanner_row_values) %in% sig_cells,
    spanners_rle$lengths[match(seq_along(spanner_row_ids), sig_cells)],
    0
  )

  stub_cells <- create_spanner_row_stub_cells_ooxml(ooxml_type, data,
    i = span_row_idx,
    keep_with_next = keep_with_next,
    colspans = colspans
  )

  col_alignment <- get_col_alignment(data)

  cells <- lapply(seq_along(spanner_row_values), \(i) {
    if (colspans[i] == 0) {
      return (NULL)
    }

    if (is.na(spanner_row_ids[i])) {
      cell <- create_spanner_row_empty_cell_ooxml(ooxml_type, data,
        span_row_idx = span_row_idx,
        span_column_idx = i,
        n = length(spanner_row_values)
      )
      return(cell)
    }

    if (span_row_idx == nrow(spanners)) {
      # TODO: check this is ok, or split into create_spanner_row_ooxml()
      #       and create_colnames_row_ooxml()
      cell_style <- vctrs::vec_slice(styles_tbl,
        styles_tbl$locname %in% c("columns_columns") & styles_tbl$colname %in% spanner_row_ids[i]
      )
    } else {
      cell_style <- vctrs::vec_slice(styles_tbl,
        styles_tbl$locname %in% c("columns_groups") & styles_tbl$grpname %in% spanner_row_ids[i]
      )
    }
    cell_style <- cell_style$styles[1][[1]]

    borders <- list(
      left   = if (i == 1) { list(color = column_labels_vlines_color) },
      right  = if (i == (length(spanner_row_values) + 1 - colspans[i] )) { list(color = column_labels_vlines_color) },
      bottom = list(size = 2, color = column_labels_border_bottom_color),
      top    = if (span_row_idx == 1) { list(size = 2, color = column_labels_border_top_color) }
    )

    content <- process_cell_content_ooxml(ooxml_type, spanner_row_values[i],
      cell_style     = cell_style,
      align_default  = if (span_row_idx == nrow(spanners)) col_alignment[i] else "center",

      keep_with_next = keep_with_next
    )

    ooxml_tbl_cell(ooxml_type, properties = ooxml_tbl_cell_properties(ooxml_type,
        borders  = borders,
        fill     = cell_style[["cell_fill"]][["color"]],
        v_align  = cell_style[["cell_text"]][["v_align"]],
        col_span = colspans[i]
      ),
      !!!to_tags(content)
    )

  })

  ooxml_tbl_row(ooxml_type, split = split, is_header = TRUE, !!!stub_cells, !!!cells)
}

create_spanner_row_empty_cell_ooxml <- function(ooxml_type, data, span_row_idx = 1, span_column_idx = 1, n) {
  column_labels_vlines_color        <- dt_options_get_value(data = data, option = "column_labels_vlines_color")
  column_labels_border_top_color    <- dt_options_get_value(data = data, option = "column_labels_border_top_color")
  column_labels_border_bottom_color <- dt_options_get_value(data = data, option = "column_labels_border_bottom_color")

  borders <- list(
    left  = if (span_column_idx == 1L) { list(color = column_labels_vlines_color) },
    right = if (span_column_idx == n)  { list(color = column_labels_vlines_color) },
    top   = if (span_row_idx == 1)     { list(color = column_labels_border_top_color) }
  )

  content <- process_cell_content_ooxml(ooxml_type, "", align = "center")

  ooxml_tbl_cell(ooxml_type, !!!to_tags(content),
    properties = ooxml_tbl_cell_properties(ooxml_type, borders  = borders),
  )
}

create_spanner_row_stub_cells_ooxml <- function(ooxml_type, data, i = 1, keep_with_next = TRUE, colspans = NULL) {
  if (!dt_stub_df_exists(data = data)) {
    return(NULL)
  }

  styles_tbl <- dt_styles_get(data = data)
  column_labels_vlines_color        <- dt_options_get_value(data = data, option = "column_labels_vlines_color")
  column_labels_border_top_color    <- dt_options_get_value(data = data, option = "column_labels_border_top_color")
  column_labels_border_bottom_color <- dt_options_get_value(data = data, option = "column_labels_border_bottom_color")

  stubh <- dt_stubhead_get(data = data)
  boxh <- dt_boxhead_get(data = data)
  spanners <- dt_spanners_print_matrix(data, include_hidden = FALSE)

  n_stub_cols   <- length(dt_boxhead_get_var_by_type(data, type = "stub"))
  n_stubh_label <- length(stubh$label)
  single_stub_label <- n_stubh_label <= 1
  stub_offset       <- if(single_stub_label) 1 else n_stub_cols

  headings_vars <- vctrs::vec_slice(boxh$var, boxh$type == "default")
  headings_labels <- dt_boxhead_get_vars_labels_default(data = data)

  label <- if (n_stubh_label == 0) "" else stubh$label
  headings_labels <- prepend_vec(headings_labels, label)
  if (single_stub_label) {
    headings_vars <- prepend_vec(headings_vars, "::stub")
    stubhead_label_alignment <- "left"
  } else {
    headings_vars <- prepend_vec(headings_vars, rep("::stub", n_stub_cols))
    stubhead_label_alignment <- rep("left", n_stub_cols)
  }

  if (i == 1) {
    cell_style <- styles_tbl[styles_tbl$locname %in% "stubhead", "styles", drop = TRUE]
    cell_style <- cell_style[1][[1]]

    borders <- list(
      top    = list(color = column_labels_border_top_color),
      bottom = list(size = 8, color = column_labels_border_bottom_color),
      left   = list(color = column_labels_vlines_color),
      right  = list(color = column_labels_vlines_color)
    )

    if (single_stub_label) {

      content <- process_cell_content_ooxml(ooxml_type, headings_labels[1],
        cell_style = cell_style,
        keep_with_next = keep_with_next,
        align_default = stubhead_label_alignment[1],
        size_default  = 20
      )

      tagList(ooxml_tbl_cell(ooxml_type, !!!to_tags(content),
        properties = ooxml_tbl_cell_properties(ooxml_type,
          borders  = borders,
          fill     = cell_style[["cell_fill"]][["color"]],
          v_align  = cell_style[["cell_text"]][["v_align"]],
          col_span = if (n_stub_cols > 1) n_stub_cols,
          row_span = if (nrow(spanners) > 1) "restart"
        )
      ))
    } else {
      cells <- lapply(seq_len(n_stub_cols), \(j) {
        content <- process_cell_content_ooxml(ooxml_type, headings_labels[j],
          cell_style = cell_style,
          keep_with_next = keep_with_next,
          align_default = stubhead_label_alignment[j],
          size_default  = 20
        )

        ooxml_tbl_cell(ooxml_type, !!!to_tags(content),
          properties = ooxml_tbl_cell_properties(ooxml_type,
            borders  = borders,
            fill     = cell_style[["cell_fill"]][["color"]],
            v_align  = cell_style[["cell_text"]][["v_align"]],
            row_span =  if (nrow(spanners) > 1) "restart"
          )
        )
      })
      tagList(!!!cells)
    }
  } else {
    spanner_row_count <- dt_spanners_matrix_height(data = data, omit_columns_row = FALSE)
    borders <- list(
      left   = list(color = column_labels_vlines_color),
      right  = list(color = column_labels_vlines_color),
      bottom = if (i == spanner_row_count) list(size = 8, color = column_labels_border_bottom_color)
    )

    content <- process_cell_content_ooxml(ooxml_type, "", keep_with_next = keep_with_next)

    if (single_stub_label) {
      tagList(
        ooxml_tbl_cell(ooxml_type, !!!to_tags(content),
          properties = ooxml_tbl_cell_properties(ooxml_type,
            borders = borders,
            row_span = "continue",
            col_span = if (n_stub_cols > 1) n_stub_cols
          )
        )
      )
    } else {
      cells <- lapply(seq_len(n_stub_cols), \(j) {
        ooxml_tbl_cell(ooxml_type, !!!to_tags(content),
          properties = ooxml_tbl_cell_properties(ooxml_type,
            borders = borders,
            row_span = "continue"
          )
        )
      })
      tagList(!!!cells)
    }
  }

}


# table rows ---------------------------------------------------------------

create_table_rows_ooxml <- function(ooxml_type, data, split = FALSE, keep_with_next = TRUE) {
  body <- dt_body_get(data = data)

  hierarchical_stub_info <- calculate_hierarchical_stub_rowspans(data)

  out <- list()
  for (i in seq_len(nrow(body))) {
    rows <- list3(
      create_group_heading_row_ooxml(ooxml_type, data, i, split = split, keep_with_next = keep_with_next),
      create_summary_section_row_ooxml(ooxml_type, data, i, "top", keep_with_next = keep_with_next),
      create_body_row_ooxml(ooxml_type, data, i, split = split, keep_with_next = keep_with_next, hierarchical_stub_info = hierarchical_stub_info),
      create_summary_section_row_ooxml(ooxml_type, data, i, "bottom", keep_with_next = keep_with_next)
    )
    out <- append(out, rows)
  }

  out
}

create_group_heading_row_ooxml <- function(ooxml_type, data, i, split = FALSE, keep_with_next = TRUE) {
  groups_rows_df <- dt_groups_rows_get(data = data)
  if (is.null(groups_rows_df) || !i %in% groups_rows_df$row_start) {
    return(NULL)
  }
  styles_tbl <- dt_styles_get(data = data)

  row_group_border_top_color    <- dt_options_get_value(data = data, option = "row_group_border_top_color")
  row_group_border_bottom_color <- dt_options_get_value(data = data, option = "row_group_border_bottom_color")
  row_group_border_left_color   <- dt_options_get_value(data = data, option = "row_group_border_left_color")
  row_group_border_right_color  <- dt_options_get_value(data = data, option = "row_group_border_right_color")

  group_row   <- which(groups_rows_df$row_start %in% i)
  group_label <- groups_rows_df[group_row, "group_label"][[1]]

  cell_style <- vctrs::vec_slice(styles_tbl,
    styles_tbl$locname == "row_groups" & styles_tbl$rownum == (i - 0.1)
  )
  cell_style <- cell_style$styles[1][[1]]

  content <- process_cell_content_ooxml(ooxml_type, group_label,
    cell_style = cell_style,
    keep_with_next = keep_with_next
  )


  ooxml_tbl_row(ooxml_type, split = split,
    ooxml_tbl_cell(ooxml_type, !!!to_tags(content),
      properties = ooxml_tbl_cell_properties(ooxml_type,
        borders  = NULL, # TODO: = borders
        fill     = cell_style[["cell_fill"]][["color"]],
        v_align  = cell_style[["cell_text"]][["v_align"]],
        col_span = NULL, # TODO: = colspans[i],
        margins  = list(
          top = list(width = 25)
          # TODO: mark with cell_margin() as in the old xml variant
          #       also should this come from somewhere or just be abritrary 25 as here
        )
      )
    )
  )
}

create_summary_section_row_ooxml <- function(ooxml_type, data, i, side = c("top", "bottom"), keep_with_next = TRUE) {
  styles_tbl <- dt_styles_get(data = data)
  summaries_present <- dt_summary_exists(data = data)
  groups_rows_df <- dt_groups_rows_get(data = data)

  if (!summaries_present || nrow(groups_rows_df) == 0) {
    return(NULL)
  }

  group_info <- groups_rows_df[i >= groups_rows_df$row_start & i <= groups_rows_df$row_end, ]
  group_summary_row_side <- unique(group_info[, "summary_row_side"])[[1]]

  if (group_summary_row_side != rlang::arg_match(side)) {
    return(NULL)
  }

  group_row_add_row_loc <- group_info[,ifelse(group_summary_row_side == "top", "row_start", "row_end")][[1]]

  if (i != group_row_add_row_loc) {
    return(NULL)
  }

  summary_styles <- vctrs::vec_slice(styles_tbl,
    styles_tbl$locname %in% c("summary_cells") &
    styles_tbl$grpname %in% group_info[["group_id"]]
  )
  summary_styles$rownum <- ceiling(summary_styles$rownum * 100 - i * 100)

  # summary_section <- summary_rows_xml(
  #   list_of_summaries = list_of_summaries,
  #   boxh = boxh,
  #   group_id = group_info[["group_id"]],
  #   locname = "summary_cells",
  #   col_alignment = col_alignment,
  #   table_body_hlines_color = table_body_hlines_color,
  #   table_body_vlines_color = table_body_vlines_color,
  #   styles = summary_styles,
  #   split = split,
  #   keep_with_next = keep_with_next
  # )
  # summary_section

  NULL
}


## body row ----------------------------------------------------------------

create_body_row_ooxml <- function(ooxml_type, data, i, split = FALSE, keep_with_next = TRUE, hierarchical_stub_info = NULL) {
  vars <- dt_boxhead_get_vars_default(data = data)
  data_cells <- lapply(seq_along(vars), \(j) {
    create_body_row_data_cell_ooxml(ooxml_type, data, i = i, j = j, keep_with_next = keep_with_next)
  })

  stub_cells <- create_body_row_stub_cells_ooxml(ooxml_type, data, i, keep_with_next = keep_with_next, hierarchical_stub_info = hierarchical_stub_info)
  ooxml_tbl_row(ooxml_type, split = split, !!!stub_cells, !!!data_cells)
}

create_body_row_stub_cells_ooxml <- function(ooxml_type, data, i, keep_with_next = TRUE, hierarchical_stub_info = NULL) {
  stub_components   <- dt_stub_components(data = data)
  summaries_present <- dt_summary_exists(data = data)
  body <- dt_body_get(data = data)
  styles_tbl <- dt_styles_get(data = data)

  stub_available    <- dt_stub_components_has_rowname(stub_components) || summaries_present
  n_stub_cols   <- length(dt_boxhead_get_var_by_type(data, type = "stub"))

  if (stub_available) {

    cell_style <- vctrs::vec_slice(styles_tbl,
      styles_tbl$locname == "stub" & styles_tbl$rownum == i
    )
    cell_style <- cell_style$styles[1][[1]]

    lapply(seq_len(n_stub_cols), \(j) {
      text <- as.character(body[i, dt_boxhead_get_var_stub(data = data)[j]])

      create_body_row_cell_ooxml(ooxml_type, data,
        cell_style = cell_style,
        text = text,
        keep_with_next = keep_with_next,
        row_span = if (j < n_stub_cols) {
          span <- hierarchical_stub_info[[j]]$rowspans[i]
          mask <- hierarchical_stub_info[[j]]$display_mask[i]

          if (span > 1) {
            "restart"
          } else if (!mask){
            "continue"
          }
        }
      )
    })
  }
}

create_body_row_data_cell_ooxml <- function(ooxml_type, data, i, j, keep_with_next = TRUE) {
  body <- dt_body_get(data = data)
  styles_tbl <- dt_styles_get(data = data)

  var <- dt_boxhead_get_vars_default(data = data)[j]

  cell_style <- vctrs::vec_slice(styles_tbl,
    styles_tbl$locname %in% "data" & styles_tbl$rownum == i & styles_tbl$colnum == j
  )
  cell_style <- cell_style$styles[1][[1]]

  boxh  <- dt_boxhead_get(data = data)

  text <- as.character(body[i, var])

  create_body_row_cell_ooxml(ooxml_type, data, text,
    cell_style = cell_style,
    align = cell_style[["cell_text"]][["align"]] %||% vctrs::vec_slice(boxh$column_align, boxh$type == "default")[j],
    keep_with_next = keep_with_next
  )
}


create_body_row_cell_ooxml <- function(ooxml_type, data, text, cell_style, align = cell_style[["cell_text"]][["align"]], keep_with_next = TRUE, row_span = NULL) {
  table_body_hlines_color   <- dt_options_get_value(data, option = "table_body_hlines_color")
  table_body_vlines_color   <- dt_options_get_value(data, option = "table_body_vlines_color")
  table_border_bottom_color <- dt_options_get_value(data, option = "table_border_bottom_color")
  table_border_top_color    <- dt_options_get_value(data, option = "table_border_top_color")

  content <- process_cell_content_ooxml(ooxml_type, text,
    cell_style     = cell_style,
    keep_with_next = keep_with_next,
    align          = align
  )

  ooxml_tbl_cell(ooxml_type, !!!to_tags(content),
    properties = ooxml_tbl_cell_properties(ooxml_type,
      borders  = list(
        top    = list(color = table_body_hlines_color),
        bottom = list(color = table_body_hlines_color),
        left   = list(color = table_body_vlines_color),
        right  = list(color = table_body_vlines_color)
      ),
      fill     = cell_style[["cell_fill"]][["color"]],
      v_align  = cell_style[["cell_text"]][["v_align"]],
      margins  = NULL,
      row_span = row_span
    )
  )
}

# tools ------------------------------------------------------------------------

get_col_alignment <- function(data) {
  boxh <- dt_boxhead_get(data = data)
  vctrs::vec_slice(boxh$column_align, boxh$type == "default")
}


