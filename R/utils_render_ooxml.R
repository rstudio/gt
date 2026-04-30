as_pptx_ooxml <- function(
  data,
  align = "center",
  caption_location = c("top", "bottom", "embed"),
  caption_align = "left",
  autonum = FALSE,
  table_width = NULL
) {
  if (isTRUE(autonum)) {
    cli::cli_abort("{.arg autonum} is not supported bby pptx")
  }

  as_ooxml("pptx", data,
    align = align, caption_location = caption_location,
    caption_align = caption_align,
    autonum = autonum,
    table_width = table_width
  )
}

as_word_ooxml <- function(
  data,
  align = "center",
  caption_location = c("top", "bottom", "embed"),
  caption_align = "left",
  split = FALSE,
  keep_with_next = TRUE,
  autonum = TRUE
) {
  as_ooxml("word", data,
    align = align, caption_location = caption_location,
    caption_align = caption_align, split = split, keep_with_next = keep_with_next,
    autonum = autonum
  )
}

as_ooxml <- function(ooxml_type,
  data,
  align = "center",
  caption_location = c("top", "bottom", "embed"),
  caption_align = "left",
  split = FALSE,
  keep_with_next = TRUE,
  autonum = TRUE,
  table_width = NULL
) {
  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  caption_location <- rlang::arg_match(caption_location)

  # Build all table data objects through a common pipeline
  data <- build_data(data, context = paste0("ooxml/", ooxml_type))

  embedded_heading <- identical(caption_location, "embed")
  xml <- tagList3(as_ooxml_tbl(ooxml_type, data,
      align = align,
      split = split,
      keep_with_next = keep_with_next,
      embedded_heading = embedded_heading,
      table_width = table_width
  ))
  if (!embedded_heading) {
    heading <- create_table_caption_contents_ooxml(ooxml_type, data,
      autonum = autonum,
      keep_with_next = if(caption_location == "bottom") FALSE else keep_with_next
    )
    if (identical(caption_location, "top")) {
      xml <- tagList3(!!!heading, !!!xml)
    } else {
      xml <- tagList3(!!!xml, !!!heading)
    }
  }
  gsub('xmlns:[[:alnum:]]+="[^"]*"[[:space:]]*', '', sapply(xml, as.character))

}

as_ooxml_tbl <- function(ooxml_type, data,
    align = "center",
    split = FALSE,
    keep_with_next = TRUE,
    embedded_heading = FALSE,
    table_width = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  tbl_properties <- create_table_properties_ooxml(ooxml_type, data = data, align = align)
  tbl_grid            <- create_table_grid_ooxml(ooxml_type, data = data, table_width = table_width)
  tbl_spanner_rows    <- create_spanner_rows_ooxml(ooxml_type, data = data, split = split, keep_with_next = keep_with_next)
  tbl_table_rows      <- create_table_rows_ooxml(ooxml_type, data = data, split = split, keep_with_next = keep_with_next)
  tbl_footnote_rows   <- create_footnote_rows_ooxml(ooxml_type, data = data, split = split, keep_with_next = keep_with_next)
  tbl_sourcenote_rows <- create_sourcenote_rows_ooxml(ooxml_type, data = data, split = split, keep_with_next = keep_with_next)

  tbl_heading_row  <- if (embedded_heading) {
    create_heading_row(ooxml_type, data = data,
      split = split,
      keep_with_next = keep_with_next,
      autonum = FALSE
    )
  }

  tbl_grand_summary_top_rows <- create_table_grand_summary_rows(ooxml_type, data = data, split = split, keep_with_next = keep_with_next, loc = "top")
  tbl_grand_summary_bottom_rows <- create_table_grand_summary_rows(ooxml_type, data = data, split = split, keep_with_next = keep_with_next, loc = "bottom")

  ooxml_tbl(ooxml_type,
    properties = tbl_properties,
    grid       = tbl_grid,
    tbl_heading_row,
    !!!tbl_spanner_rows,
    !!!tbl_grand_summary_top_rows,
    !!!tbl_table_rows,
    !!!tbl_footnote_rows,
    !!!tbl_sourcenote_rows,
    !!!tbl_grand_summary_bottom_rows
  )
}

# table properties --------------------------------------------------------

create_table_properties_ooxml <- function(ooxml_type, data, align = c("center", "start", "end")) {
  ooxml_tbl_properties(ooxml_type, justify = align, width = "auto")
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

  header_title_style <- styles_tbl[styles_tbl$locname == "title", ]$styles[1][[1]]

  # Obtain the number of visible columns in the built table
  n_data_cols <- length(dt_boxhead_get_vars_default(data = data))
  n_stub_cols <- length(dt_boxhead_get_var_by_type(data, type = "stub"))
  n_cols <- n_data_cols + n_stub_cols

  # Get table options
  heading_border_bottom_color <- dt_options_get_value(data, option = "heading_border_bottom_color")

  paragraphs <- create_table_caption_contents_ooxml(ooxml_type, data,
    autonum = autonum, keep_with_next = keep_with_next
  )

  ooxml_tbl_row(ooxml_type, split = split, is_header = TRUE,
    ooxml_tbl_cell(ooxml_type, !!!paragraphs, col_span = n_cols,
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

  footnotes_tbl <- dt_footnotes_get(data = data)
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

  if ("title" %in% footnotes_tbl$locname) {
    footnote_title_marks <-coalesce_marks(fn_tbl = footnotes_tbl, locname = "title")

    footnote_title_marks <- footnote_mark_to_ooxml(ooxml_type, data, mark = footnote_title_marks)
    footnote_title_marks <- as_xml_node(footnote_title_marks)[[1L]]

    xml_add_child(paragraphs, footnote_title_marks)
  }

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
  footnotes_tbl <- dt_footnotes_get(data = data)
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

  if ("subtitle" %in% footnotes_tbl$locname) {
    footnote_subtitle_marks <- coalesce_marks(fn_tbl = footnotes_tbl, locname = "subtitle")

    footnote_subtitle_marks <- footnote_mark_to_ooxml(ooxml_type, data, mark = footnote_subtitle_marks)
    footnote_subtitle_marks <- as_xml_node(footnote_subtitle_marks)[[1L]]

    xml_add_child(paragraphs, footnote_subtitle_marks)
  }


  to_tags(paragraphs)
}


# grand summary rows ------------------------------------------------------

create_table_grand_summary_rows <- function(ooxml_type, data, split, keep_with_next, loc = "top") {
  if (!dt_summary_exists(data = data)) {
    return(NULL)
  }

  list_of_summaries <- dt_summary_df_get(data = data)
  if (!grand_summary_col %in% names(list_of_summaries$summary_df_display_list)) {
    return(NULL)
  }

  grand_summary_loc <- unique(list_of_summaries$summary_df_display_list[[grand_summary_col]][["::side::"]])
  if (grand_summary_loc != loc) {
    return(NULL)
  }

  styles_tbl <- dt_styles_get(data = data)
  summary_styles <- vctrs::vec_slice(styles_tbl,
    styles_tbl$locname %in% "grand_summary_cells" &
      styles_tbl$grpname %in% c("::GRAND_SUMMARY")
  )

  boxh <- dt_boxhead_get(data = data)

  list_of_summaries <- dt_summary_df_get(data = data)
  table_body_hlines_color <- dt_options_get_value(data = data, option = "table_body_hlines_color")
  table_body_vlines_color <- dt_options_get_value(data = data, option = "table_body_vlines_color")

  # Obtain all of the visible (`"default"`), non-stub column names
  # for the table from the `boxh` object
  default_vars <- boxh[boxh$type == "default", "var", drop = TRUE]

  summary_df <- dplyr::select(
    list_of_summaries$summary_df_display_list[[grand_summary_col]],
    dplyr::all_of(c(rowname_col_private, default_vars))
  )

  rows <- lapply(seq_len(nrow(summary_df)), function(j) {

    df_row_j <- unname(unlist(summary_df[j, ]))
    cells <- lapply(seq_along(df_row_j), function(y) {

      cell_style <- dplyr::filter(
        summary_styles,
        rownum == j, colnum == y - 1
      )
      cell_style <- cell_style$styles[1L][[1L]]

      content <- process_cell_content_ooxml(ooxml_type, df_row_j[y],
        cell_style     = cell_style,
        keep_with_next = keep_with_next
      )
      ooxml_tbl_cell(ooxml_type, !!!to_tags(content),
        properties = ooxml_tbl_cell_properties(ooxml_type,
          borders  = list(
            top    = list(size = if (j == 1) 8 else 1, color = table_body_hlines_color),
            bottom = list(size = if (j == nrow(summary_df)) 8 else 1, color = table_body_hlines_color),
            left   = list(color = table_body_vlines_color),
            right  = list(color = table_body_vlines_color)
          ),
          fill     = cell_style[["cell_fill"]][["color"]],
          v_align  = cell_style[["cell_text"]][["v_align"]],
          margins  = list(
            top = list(width = 50)
          )
        )
      )
    })
    ooxml_tbl_row(ooxml_type, split = split, is_header = FALSE, !!!cells)
  })

  tagList3(!!!rows)
}


# footnote rows -----------------------------------------------------------

create_footnote_rows_ooxml <- function(ooxml_type, data, split, keep_with_next) {
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
    footnote_xml <- parse_to_ooxml(
      process_text_ooxml(footnote_text[[i]], ooxml_type = ooxml_type),
      ooxml_type = ooxml_type
    )

    # footnote marks
    if (!is.na(footnote_ids[i]) && !identical(footnote_ids[i], "")) {

      footnote_id_xml <- footnote_mark_to_ooxml(ooxml_type = ooxml_type,
        data = data, mark = footnote_ids[i], location = "ftr"
      )

      xml_add_child(footnote_xml, as_xml_node(footnote_id_xml, create_ns = TRUE), .where = 1)
    }

    content <- process_cell_content_ooxml(ooxml_type, footnote_xml,
      cell_style = cell_style,
      keep_with_next = keep_with_next
    )

    cell <- ooxml_tbl_cell(ooxml_type, !!!to_tags(content), col_span = n_cols,
      properties = ooxml_tbl_cell_properties(ooxml_type,
        fill     = cell_style[["cell_fill"]][["color"]],
        v_align  = cell_style[["cell_text"]][["v_align"]],
        col_span = n_cols
      )
    )

    merge_cells <- ooxml_merge_cells(ooxml_type, n_cols - 1)

    ooxml_tbl_row(ooxml_type, split = split,
      cell, !!!merge_cells
    )
  })

  tagList3(!!!footnote_rows)
}

# source notes ------------------------------------------------------------

create_sourcenote_rows_ooxml <- function(ooxml_type, data, split = split, keep_with_next = keep_with_next) {
  source_notes <- dt_source_notes_get(data = data)

  if (is.null(source_notes)) {
    return(NULL)
  }

  n_data_cols <- length(dt_boxhead_get_vars_default(data = data))
  n_stub_cols <- length(dt_boxhead_get_var_by_type(data, type = "stub"))
  n_cols <- n_data_cols + n_stub_cols

  cell_style <- dt_styles_get(data = data)
  cell_style <- cell_style[cell_style$locname == "source_notes", "styles", drop = TRUE]
  cell_style <- cell_style[1][[1]]

  source_note_rows <- lapply(source_notes, function(note) {
    source_note_xml <- parse_to_ooxml(note, ooxml_type = ooxml_type)

    content <- process_cell_content_ooxml(ooxml_type, source_note_xml,
      cell_style = cell_style,
      keep_with_next = keep_with_next
    )

    merge_cells <- merge_cells <- ooxml_merge_cells(ooxml_type, n_cols - 1)

    cell <- ooxml_tbl_cell(ooxml_type, !!!to_tags(content), col_span = n_cols,
      properties = ooxml_tbl_cell_properties(ooxml_type,
        fill     = cell_style[["cell_fill"]][["color"]],
        v_align  = cell_style[["cell_text"]][["v_align"]],
        col_span = n_cols
      )
    )
    ooxml_tbl_row(ooxml_type, split = split,
      cell, !!!merge_cells
    )
  })

  tagList(!!!source_note_rows)
}



# table grid --------------------------------------------------------------

create_table_grid_ooxml <- function(ooxml_type, data, table_width = NULL) {
  boxh <- dt_boxhead_get(data = data)

  widths <- boxh[boxh$type %in% c("default", "stub"), , drop = FALSE]
  # returns vector of column widths where `stub` is first
  widths <- dplyr::arrange(widths, dplyr::desc(type))$column_width %>%
    lapply(unlist)

  # widths may be NULL, pct(), px() ...
  ooxml_tbl_grid(ooxml_type, !!!widths, table_width = table_width)
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

  boxh <- dt_boxhead_get(data = data)
  headings_vars <- vctrs::vec_slice(boxh$var, boxh$type == "default")
  headings_labels <- dt_boxhead_get_vars_labels_default(data = data)

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

  values <- if (span_row_idx == nrow(spanners)) {
    headings_labels
  } else {
    spanner_row_values
  }

  cells <- lapply(seq_along(values), \(i) {
    # NA check FIRST - empty placeholder cells, not hMerge cells
    if (is.na(spanner_row_ids[i])) {
      cell <- create_spanner_row_empty_cell_ooxml(ooxml_type, data,
        span_row_idx    = span_row_idx,
        span_column_idx = i,
        n               = length(values),
        col_var         = headings_vars[i]
      )
      return(cell)
    }

    if (colspans[i] == 0) {
      # hMerge continuation cell - carry top/bottom borders from the group-start spanner
      group_start_i    <- max(which(colspans[seq_len(i)] > 0))
      group_spanner_id <- spanner_row_ids[group_start_i]
      cont_borders     <- NULL
      if (!is.na(group_spanner_id) && span_row_idx < nrow(spanners)) {
        cs_rows <- vctrs::vec_slice(styles_tbl,
          styles_tbl$locname %in% "columns_groups" & styles_tbl$grpname %in% group_spanner_id
        )
        if (nrow(cs_rows) > 0) {
          cs_cont <- do.call(c, cs_rows$styles)
          bt <- cs_cont[["cell_border_top"]]
          bb <- cs_cont[["cell_border_bottom"]]
          cont_borders <- list(
            top    = if (!is.null(bt)) list(color = bt[["color"]], size = convert_to_px(bt[["width"]] %||% "2px"), type = bt[["style"]] %||% "solid"),
            bottom = if (!is.null(bb)) list(color = bb[["color"]], size = convert_to_px(bb[["width"]] %||% "2px"), type = bb[["style"]] %||% "solid")
          )
        }
      }
      return(ooxml_merge_cell(ooxml_type, borders = cont_borders))
    }

    if (is.na(spanner_row_ids[i])) {
      cell <- create_spanner_row_empty_cell_ooxml(ooxml_type, data,
        span_row_idx    = span_row_idx,
        span_column_idx = i,
        n               = length(values),
        col_var         = headings_vars[i]
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
    # Merge all style rows for this cell (each tab_style border side is a separate row)
    cell_style <- do.call(c, cell_style$styles)

    border_top    <- cell_style[["cell_border_top"]]
    border_bottom <- cell_style[["cell_border_bottom"]]
    border_left   <- cell_style[["cell_border_left"]]
    border_right  <- cell_style[["cell_border_right"]]

    # left border: show on every spanner group start (colspans[i] > 0)
    is_group_start <- colspans[i] > 0

    borders <- list(
      left   = if (!is.null(border_left)) {
        list(color = border_left[["color"]] %||% column_labels_vlines_color,
             size  = convert_to_px(border_left[["width"]] %||% "1px"),
             type  = border_left[["style"]] %||% "solid")
      } else if (is_group_start) {
        list(color = column_labels_vlines_color)
      },
      right  = if (!is.null(border_right)) {
        list(color = border_right[["color"]] %||% column_labels_vlines_color,
             size  = convert_to_px(border_right[["width"]] %||% "1px"),
             type  = border_right[["style"]] %||% "solid")
      } else if (i == (length(spanner_row_values) + 1 - colspans[i])) {
        list(color = column_labels_vlines_color)
      },
      bottom = if (!is.null(border_bottom)) {
        list(color = border_bottom[["color"]] %||% column_labels_border_bottom_color,
             size  = convert_to_px(border_bottom[["width"]] %||% "2px"),
             type  = border_bottom[["style"]] %||% "solid")
      } else if (nchar(column_labels_border_bottom_color) > 0) {
        list(size = 2, color = column_labels_border_bottom_color)
      },
      top    = if (!is.null(border_top)) {
        list(color = border_top[["color"]] %||% column_labels_border_top_color,
             size  = convert_to_px(border_top[["width"]] %||% "2px"),
             type  = border_top[["style"]] %||% "solid")
      } else if (span_row_idx == 1L && nchar(column_labels_border_top_color) > 0) {
        list(color = column_labels_border_top_color)
      }
    )

    content <- process_cell_content_ooxml(ooxml_type, values[i],
      cell_style     = cell_style,
      align_default  = if (span_row_idx == nrow(spanners)) col_alignment[i] else "center",

      keep_with_next = keep_with_next
    )
    ooxml_tbl_cell(ooxml_type, col_span = colspans[i], properties = ooxml_tbl_cell_properties(ooxml_type,
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

create_spanner_row_empty_cell_ooxml <- function(ooxml_type, data, span_row_idx = 1, span_column_idx = 1, n,
                                                col_var = NULL) {
  # Empty cells are visual placeholders only - no borders
  content <- process_cell_content_ooxml(ooxml_type, "", align = "center")
  ooxml_tbl_cell(ooxml_type, !!!to_tags(content),
    properties = ooxml_tbl_cell_properties(ooxml_type, borders = NULL),
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
      bottom = list(size = 2, color = column_labels_border_bottom_color),
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

      tagList(ooxml_tbl_cell(ooxml_type, !!!to_tags(content), col_span = if (n_stub_cols > 1) n_stub_cols,
        properties = ooxml_tbl_cell_properties(ooxml_type,
          borders  = borders,
          fill     = cell_style[["cell_fill"]][["color"]],
          v_align  = cell_style[["cell_text"]][["v_align"]],
          col_span = if (n_stub_cols > 1) n_stub_cols,
          row_span = nrow(spanners)
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
            row_span = nrow(spanners)
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
      bottom = if (i == spanner_row_count) list(size = 2, color = column_labels_border_bottom_color)
    )

    content <- process_cell_content_ooxml(ooxml_type, "", keep_with_next = keep_with_next)

    if (single_stub_label) {
      tagList(
        ooxml_tbl_cell(ooxml_type, !!!to_tags(content), col_span = if (n_stub_cols > 1) n_stub_cols,
          properties = ooxml_tbl_cell_properties(ooxml_type,
            borders  = borders,
            v_merge  = TRUE,
            col_span = if (n_stub_cols > 1) n_stub_cols
          )
        )
      )
    } else {
      cells <- lapply(seq_len(n_stub_cols), \(j) {
        ooxml_tbl_cell(ooxml_type, !!!to_tags(content),
          properties = ooxml_tbl_cell_properties(ooxml_type,
            borders = borders,
            v_merge = TRUE
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
      !!!create_summary_section_row_ooxml(ooxml_type, data, i, "top", split = split, keep_with_next = keep_with_next),
      create_body_row_ooxml(ooxml_type, data, i, split = split, keep_with_next = keep_with_next, hierarchical_stub_info = hierarchical_stub_info),
      !!!create_summary_section_row_ooxml(ooxml_type, data, i, "bottom", split = split, keep_with_next = keep_with_next)
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

  row_group_border_top_color    <- dt_options_get_value(data, option = "row_group_border_top_color")
  row_group_border_bottom_color <- dt_options_get_value(data, option = "row_group_border_bottom_color")
  row_group_border_left_color   <- dt_options_get_value(data, option = "row_group_border_left_color")
  row_group_border_right_color  <- dt_options_get_value(data, option = "row_group_border_right_color")

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

  n_data_cols <- length(dt_boxhead_get_vars_default(data = data))
  n_stub_cols <- length(dt_boxhead_get_var_by_type(data, type = "stub"))
  n_cols <- n_data_cols + n_stub_cols

  main_cell <- ooxml_tbl_cell(ooxml_type, !!!to_tags(content), col_span = n_cols,
    properties = ooxml_tbl_cell_properties(ooxml_type,
      borders  = list(
        top    = if (nchar(row_group_border_top_color)    > 0) list(color = row_group_border_top_color),
        bottom = if (nchar(row_group_border_bottom_color) > 0) list(color = row_group_border_bottom_color),
        left   = if (nchar(row_group_border_left_color)   > 0) list(color = row_group_border_left_color),
        right  = if (nchar(row_group_border_right_color)  > 0) list(color = row_group_border_right_color)
      ),
      fill     = cell_style[["cell_fill"]][["color"]],
      v_align  = cell_style[["cell_text"]][["v_align"]],
      col_span = n_cols,
      margins  = list(
        top = list(width = 25)
      )
    )
  )

  merge_cells <- ooxml_merge_cells(ooxml_type, n_cols - 1)

  ooxml_tbl_row(ooxml_type, split = split,
    main_cell,
    !!!merge_cells
  )

}

create_summary_section_row_ooxml <- function(ooxml_type, data, i, side = c("top", "bottom"), keep_with_next = TRUE, split = FALSE) {
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

  boxh <- dt_boxhead_get(data = data)

  list_of_summaries <- dt_summary_df_get(data = data)
  table_body_hlines_color <- dt_options_get_value(data = data, option = "table_body_hlines_color")
  table_body_vlines_color <- dt_options_get_value(data = data, option = "table_body_vlines_color")

  summary_styles <- vctrs::vec_slice(styles_tbl,
    styles_tbl$locname %in% c("summary_cells") &
    styles_tbl$grpname %in% group_info[["group_id"]]
  )
  summary_styles$rownum <- ceiling(summary_styles$rownum * 100 - i * 100)

  # Obtain all of the visible (`"default"`), non-stub column names
  # for the table from the `boxh` object
  default_vars <- boxh[boxh$type == "default", "var", drop = TRUE]

  group_id <- group_info[["group_id"]]
  if (!group_id %in% names(list_of_summaries$summary_df_display_list)) {
    return(NULL)
  }

  summary_df <- dplyr::select(
    list_of_summaries$summary_df_display_list[[group_id]],
    dplyr::all_of(c(rowname_col_private, default_vars))
  )

  rows <- lapply(seq_len(nrow(summary_df)), function(j) {

    df_row_j <- unname(unlist(summary_df[j, ]))
    cells <- lapply(seq_along(df_row_j), function(y) {

      cell_style <- dplyr::filter(
        summary_styles,
        rownum == j, colnum == y - 1
      )
      cell_style <- cell_style$styles[1L][[1L]]

      content <- process_cell_content_ooxml(ooxml_type, df_row_j[y],
        cell_style     = cell_style,
        keep_with_next = keep_with_next
      )
      ooxml_tbl_cell(ooxml_type, !!!to_tags(content),
        properties = ooxml_tbl_cell_properties(ooxml_type,
          borders  = list(
            top    = list(size = if (j == 1) 8 else 1, color = table_body_hlines_color),
            bottom = list(size = if (j == nrow(summary_df)) 8 else 1, color = table_body_hlines_color),
            left   = list(color = table_body_vlines_color),
            right  = list(color = table_body_vlines_color)
          ),
          fill     = cell_style[["cell_fill"]][["color"]],
          v_align  = cell_style[["cell_text"]][["v_align"]],
          margins  = list(
            top = list(width = 50)
          )
        )
      )
    })
    ooxml_tbl_row(ooxml_type, split = split, is_header = FALSE, !!!cells)
  })

  rows
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

  if (stub_available) {

    stub_col_names <- dt_boxhead_get_var_by_type(data, type = "stub")
    n_stub_cols   <- length(stub_col_names)

    lapply(seq_len(n_stub_cols), \(j) {

      stub_name <- stub_col_names[[j]]
      cell_style <- get_cell_style_ooxml(styles_tbl, c("stub", "stub_column"), i = i, colname = stub_name)
      text <- as.character(body[i, stub_name])
      span <- hierarchical_stub_info[[stub_name]][["rowspans"]][i] %||% 1
      mask <- hierarchical_stub_info[[stub_name]][["display_mask"]][i] %||% FALSE


      create_body_row_cell_ooxml(ooxml_type, data,
        cell_style = cell_style,
        text = text,
        keep_with_next = keep_with_next,
        row_span = if (j < n_stub_cols) {
          if (span > 1) {
            span
          } else if (!mask){
            0
          } else {
            1
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

  cell_style <- get_cell_style_ooxml(styles_tbl, "data", i = i, j = j)

  boxh  <- dt_boxhead_get(data = data)

  text <- as.character(body[i, var])

  create_body_row_cell_ooxml(ooxml_type, data, text,
    cell_style = cell_style,
    align = cell_style[["cell_text"]][["align"]] %||% vctrs::vec_slice(boxh$column_align, boxh$type == "default")[j],
    keep_with_next = keep_with_next
  )
}

slice_cell_style_tbl <- function(styles_tbl, location, i = NULL, j = NULL, colname = NULL){

  slice_bool <-  styles_tbl$locname %in% location

  if(!rlang::is_empty(i)){
    slice_bool <- slice_bool & styles_tbl$rownum == i
  }

  if(!rlang::is_empty(j)){
    slice_bool <- slice_bool & styles_tbl$colnum == j
  }

  if(!rlang::is_empty(colname)){
    slice_bool <- slice_bool & styles_tbl$colname == colname
  }

  vctrs::vec_slice(styles_tbl,slice_bool)$styles[1][[1]]

}

get_cell_style_ooxml <- function(styles_tbl, location, i = NULL, j = NULL, colname = NULL){

  cell_style <- slice_cell_style_tbl(styles_tbl, location = location, i = i, j = j, colname = colname)

  ## check border for cell below if bottom border isn't set
  if(is.null(cell_style[["cell_border_bottom"]])){
    cell_style[["cell_border_bottom"]] <- slice_cell_style_tbl(styles_tbl, location = location, i = i + 1 , j = j, colname = colname)[["cell_border_top"]]
  }

  ## check border for cell to the right if right border isn't set
  if(is.null(cell_style[["cell_border_right"]])){
    cell_style[["cell_border_right"]] <- slice_cell_style_tbl(styles_tbl, location = location, i = i, j = j + 1, colname = colname)[["cell_border_left"]]
  }

  cell_style
}


create_body_row_cell_ooxml <- function(ooxml_type, data, text, cell_style, align = cell_style[["cell_text"]][["align"]], keep_with_next = TRUE, col_span = NULL, row_span = NULL) {


  # table_border_bottom_color <- dt_options_get_value(data, option = "table_border_bottom_color")
  # table_border_top_color    <- dt_options_get_value(data, option = "table_border_top_color")

  content <- process_cell_content_ooxml(ooxml_type, text,
    cell_style     = cell_style,
    keep_with_next = keep_with_next,
    align          = align
  )

  borders <- get_border_attribute_list(cell_style, data)

  ooxml_tbl_cell(ooxml_type, !!!to_tags(content),
    properties = ooxml_tbl_cell_properties(ooxml_type,
      borders  = borders,
      fill     = cell_style[["cell_fill"]][["color"]],
      v_align  = cell_style[["cell_text"]][["v_align"]],
      margins  = NULL,
      row_span = row_span
    ),
    col_span = col_span,
    row_span = row_span
  )
}

get_border_attribute_list <- function(cell_style, data){

  table_body_hlines_color   <- dt_options_get_value(data, option = "table_body_hlines_color")
  table_body_vlines_color   <- dt_options_get_value(data, option = "table_body_vlines_color")

  border_id <- c("top", "bottom", "left", "right")

  borders <- lapply(border_id, function(id) {
    border_styling <- cell_style[[paste0("cell_border_", id)]]
    default_color  <- if (id %in% c("top", "bottom")) table_body_hlines_color else table_body_vlines_color

    color <- border_styling[["color"]] %||% default_color
    if (is.null(color) || color == "") return(NULL)

    list(
      color = color,
      size  = convert_to_px(border_styling[["width"]] %||% "1.333px"),
      type  = border_styling[["style"]] %||% "solid"
    )
  })
  names(borders) <- border_id
  borders
}

# tools ------------------------------------------------------------------------

get_col_alignment <- function(data) {
  boxh <- dt_boxhead_get(data = data)
  vctrs::vec_slice(boxh$column_align, boxh$type == "default")
}

# Transform a footnote mark to an XML representation
footnote_mark_to_ooxml <- function(ooxml_type, data, mark, location = c("ref", "ftr")) {

  switch_ooxml(ooxml_type,
    word = footnote_mark_to_ooxml_word(data, mark = mark, location = location),
    pptx = footnote_mark_to_ooxml_pptx(data, mark = mark, location = location)
  )
}

paste_footnote_ooxml <- function(ooxml_type, text, footmark_xml, position = "right") {
  text_xml <- parse_to_ooxml(text, ooxml_type = ooxml_type)

  position <- rlang::arg_match(position, values = c("left", "right"))
  footmark_xml <- as_xml_node(footmark_xml)[[1L]]

  if (position == "right") {
    xml_add_child(text_xml, footmark_xml)
  } else {
    xml_add_child(text_xml, footmark_xml, .where = 1)
  }
  paste0("<md_container>", as.character(text_xml), "</md_container>")
}

ooxml_merge_cells <- function(ooxml_type, n) {
  if (ooxml_type != "pptx" || n == 0) {
    return(NULL)
  }
  lapply(seq_len(n), function(i) {
    ooxml_merge_cell(ooxml_type)
  })
}

ooxml_merge_cell <- function(ooxml_type, borders = NULL) {
  if (ooxml_type != "pptx") {
    return(NULL)
  }

  ooxml_tag("a:tc", tag_class = "ooxml_tbl_cell", hMerge = "1",
    ooxml_tag("a:txBody",
      ooxml_tag("a:bodyPr"),
      ooxml_tag("a:lstStyle"),
      ooxml_tag("a:p",
        ooxml_tag("a:endParaRPr")
      )
    ),
    ooxml_tbl_cell_properties(ooxml_type, borders = borders)
  )
}
