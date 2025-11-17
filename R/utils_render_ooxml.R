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
  value <- build_data(data = data, context = "word")

  gt_xml <- NULL # same as c()

  #
  # Composition of Word table OOXML
  #
  # TODO: replace with ooxml code eventually
  header_xml <-
      as_word_tbl_header_caption(
        data = value,
        align = caption_align,
        split = split,
        keep_with_next = ifelse(caption_location == "bottom", FALSE, keep_with_next),
        autonum = autonum
      )

  if (caption_location == "top") {
    gt_xml <- c(gt_xml, header_xml)
  }

  tbl_xml <- as_ooxml_tbl("word",
      data = value,
      align = align,
      split = split,
      keep_with_next = keep_with_next,
      embedded_heading = identical(caption_location, "embed")
    )
  tbl_xml <- as.character(tbl_xml)

  gt_xml <- c(gt_xml, tbl_xml)

  if (caption_location == "bottom") {
    gt_xml <- c(gt_xml, header_xml)
  }

  gt_xml <- paste0(gt_xml, collapse = "")

  gt_xml

}

as_ooxml_tbl <- function(
    ooxml_type,
    data,
    align = "center",
    split = FALSE,
    keep_with_next = TRUE,
    embedded_heading = FALSE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  tbl_properties <- create_table_properties_ooxml(ooxml_type, data = data, align = align)

  # <a:tblGrid> is not optional in pptx, so create_table_grid must set it
  #
  # things are different in word where we can have w:tblLayoutType="autofit" and then
  # not have a <w:tblGrid> node
  tbl_grid         <- create_table_grid_ooxml(ooxml_type, data = data)
  tbl_spanner_rows <- create_spanner_rows_ooxml(ooxml_type, data = data, split = split)
  tbl_table_rows   <- create_table_rows_ooxml(ooxml_type, data = data, split = split)

  ooxml_tbl(ooxml_type,
    properties = tbl_properties,
    grid       = tbl_grid,
    !!!tbl_spanner_rows,
    !!!tbl_table_rows
  )
}


# table properties --------------------------------------------------------

create_table_properties_ooxml <- function(ooxml_type, data, align = c("center", "start", "end"), look = c("first row")) {
  # TODO: set layout as autofit when dt_boxhead_get()$column_width
  #       are all NULL and figure out equivalent in pptx
  ooxml_tbl_properties(ooxml_type,
    justify = align,
    # margins = list(left = 60, right = 60),
    width   = "100%",
    look    = look
  )
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

create_spanner_rows_ooxml <- function(ooxml_type, data, split = FALSE) {
  if (dt_options_get_value(data = data, option = "column_labels_hidden")) {
    return(NULL)
  }

  # Determine the finalized number of spanner rows
  spanner_row_count <- dt_spanners_matrix_height(data = data, omit_columns_row = FALSE)

  spanner_rows <- lapply(seq_len(spanner_row_count),
    create_spanner_row_ooxml,
    ooxml_type = ooxml_type, data = data, split = split
  )

  spanner_rows
}

create_spanner_row_ooxml <- function(ooxml_type, data, span_row_idx, split = FALSE) {
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

  stub_cell <- create_spanner_row_stub_cell_ooxml(ooxml_type, data, i = span_row_idx)

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

    cell_style <- vctrs::vec_slice(styles_tbl,
      styles_tbl$locname %in% c("columns_groups") & styles_tbl$grpname %in% spanner_row_ids[i]
    )
    cell_style <- cell_style$styles[1][[1]]

    borders <- list(
      left = if (i == 1) { list(color = column_labels_vlines_color) },
      right = if (i == (length(spanner_row_values) + 1 - colspans[i] )) { list(color = column_labels_vlines_color) },
      bottom = list(size = 2, color = column_labels_border_bottom_color),
      top = if (span_row_idx == 1) { list(size = 2, color = column_labels_border_top_color) }
    )

    cell_properties <- ooxml_tbl_cell_properties(ooxml_type,
      borders  = borders,
      fill     = cell_style[["cell_fill"]][["color"]],
      v_align  = cell_style[["cell_text"]][["v_align"]],
      col_span = colspans[i]
    )

    align <- cell_style[["cell_text"]][["align"]]
    if (is.null(align)) {
      if (span_row_idx == nrow(spanners)) {
        align <- col_alignment[i]
      } else {
        align <- "center"
      }
    }
    paragraph_properties <- ooxml_paragraph_properties(ooxml_type,
      align = align, cell_style = cell_style
    )

    ooxml_tbl_cell(ooxml_type, properties = cell_properties,
      ooxml_paragraph(ooxml_type, properties = paragraph_properties,
        ooxml_run(ooxml_type, properties = ooxml_run_properties(ooxml_type, cell_style = cell_style),
          ooxml_text(ooxml_type,
            spanner_row_values[i],
            space = cell_style[["cell_text"]][["whitespace"]] %||% "default"
          )
        )
      )
    )

  })

  ooxml_tbl_row(ooxml_type, split = split, is_header = TRUE,
    stub_cell, !!!cells
  )
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

  ooxml_tbl_cell(ooxml_type,
    properties = ooxml_tbl_cell_properties(ooxml_type, borders  = borders),
    ooxml_paragraph(ooxml_type, properties = ooxml_paragraph_properties(ooxml_type, align = "center"),
      ooxml_run(ooxml_type, properties = ooxml_run_properties(ooxml_type),
        ooxml_text(ooxml_type, "", space = "default")
      )
    )
  )
}

create_spanner_row_stub_cell_ooxml <- function(ooxml_type, data, i = 1) {
  if (!dt_stub_df_exists(data = data)) {
    return(NULL)
  }

  styles_tbl <- dt_styles_get(data = data)
  column_labels_vlines_color        <- dt_options_get_value(data = data, option = "column_labels_vlines_color")
  column_labels_border_top_color    <- dt_options_get_value(data = data, option = "column_labels_border_top_color")
  column_labels_border_bottom_color <- dt_options_get_value(data = data, option = "column_labels_border_bottom_color")

  if (i == 1) {
    stubh <- dt_stubhead_get(data = data)

    cell_style <- styles_tbl[styles_tbl$locname %in% "stubhead", "styles", drop = TRUE]
    cell_style <- cell_style[1][[1]]

    borders <- list(
      top    = list(color = column_labels_border_top_color),
      bottom = list(size = 8, color = column_labels_border_bottom_color),
      left   = list(color = column_labels_vlines_color),
      right  = list(color = column_labels_vlines_color)
    )

    ooxml_tbl_cell(ooxml_type,
      ooxml_paragraph(ooxml_type,
        ooxml_run(ooxml_type,
          ooxml_text(ooxml_type,
            stubh$label,
            space = cell_style[["cell_text"]][["whitespace"]] %||% "default"
          ),
          properties = ooxml_run_properties(ooxml_type, cell_style = cell_style)
        )
      ),
      properties = ooxml_tbl_cell_properties(ooxml_type,
        borders  = borders,
        fill     = cell_style[["cell_fill"]][["color"]],
        v_align  = cell_style[["cell_text"]][["v_align"]],
        col_span = colspans[i]
      )
    )
  } else {
    spanner_row_count <- dt_spanners_matrix_height(data = data, omit_columns_row = FALSE)
    borders <- list(
      left   = list(color = column_labels_vlines_color),
      right  = list(color = column_labels_vlines_color),
      bottom = if (i == spanner_row_count) list(size = 8, color = column_labels_border_bottom_color)
    )
    ooxml_tbl_cell(ooxml_type,
      row_span = "continue",
      properties = ooxml_tbl_cell_properties(ooxml_type, borders = borders)
    )
  }

}


# table rows ---------------------------------------------------------------

create_table_rows_ooxml <- function(ooxml_type, data, split = FALSE) {
  body <- dt_body_get(data = data)

  out <- list()
  for (i in seq_len(nrow(body))) {
    rows <- list3(
      create_group_heading_row_ooxml(ooxml_type, data, i, split = split),
      create_summary_section_row_ooxml(ooxml_type, data, i, "top"),
      create_body_row_ooxml(ooxml_type, data, i, split = split),
      create_summary_section_row_ooxml(ooxml_type, data, i, "bottom")
    )
    out <- append(out, rows)
  }

  out
}

create_group_heading_row_ooxml <- function(ooxml_type, data, i, split = FALSE) {
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

  ooxml_tbl_row(ooxml_type, split = split,
    ooxml_tbl_cell(ooxml_type,
      ooxml_paragraph(ooxml_type,
        ooxml_run(ooxml_type,
          ooxml_text(ooxml_type, group_label,
            space = cell_style[["cell_text"]][["whitespace"]] %||% "default"
          ),
          properties = ooxml_run_properties(ooxml_type, cell_style = cell_style)
        )
      ),
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

# TODO
create_summary_section_row_ooxml <- function(ooxml_type, data, i, side = c("top", "bottom")) {
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

create_body_row_ooxml <- function(ooxml_type, data, i, split = FALSE) {
  vars <- dt_boxhead_get_vars_default(data = data)
  data_cells <- lapply(seq_along(vars), \(j) {
    create_body_row_data_cell_ooxml(ooxml_type, data, i = i, j = j)
  })

  ooxml_tbl_row(ooxml_type, split = split,
    create_body_row_stub_cell_ooxml(ooxml_type, data, i),
    !!!data_cells
  )
}

create_body_row_stub_cell_ooxml <- function(ooxml_type, data, i) {
  stub_components   <- dt_stub_components(data = data)
  summaries_present <- dt_summary_exists(data = data)
  stub_available    <- dt_stub_components_has_rowname(stub_components) || summaries_present

  if (stub_available) {
    body <- dt_body_get(data = data)
    styles_tbl <- dt_styles_get(data = data)

    cell_style <- vctrs::vec_slice(styles_tbl,
      styles_tbl$locname == "stub" & styles_tbl$rownum == i
    )
    cell_style <- cell_style$styles[1][[1]]
    text <- as.character(body[i, dt_boxhead_get_var_stub(data = data)])

    create_body_row_cell_ooxml(ooxml_type, data, cell_style = cell_style, text = text)
  }
}

create_body_row_data_cell_ooxml <- function(ooxml_type, data, i, j) {
  body <- dt_body_get(data = data)
  styles_tbl <- dt_styles_get(data = data)

  var <- dt_boxhead_get_vars_default(data = data)[j]

  cell_style <- vctrs::vec_slice(styles_tbl,
    styles_tbl$locname %in% "data" & styles_tbl$rownum == i & styles_tbl$colnum == j
  )
  cell_style <- cell_style$styles[1][[1]]

  boxh  <- dt_boxhead_get(data = data)

  text <- as.character(body[i, j])
  create_body_row_cell_ooxml(ooxml_type, data, text,
    cell_style = cell_style,
    align = cell_style[["cell_text"]][["align"]] %||% vctrs::vec_slice(boxh$column_align, boxh$type == "default")[j]
  )
}


create_body_row_cell_ooxml <- function(ooxml_type, data, text, cell_style, align = cell_style[["cell_text"]][["align"]]) {
  table_body_hlines_color   <- dt_options_get_value(data, option = "table_body_hlines_color")
  table_body_vlines_color   <- dt_options_get_value(data, option = "table_body_vlines_color")
  table_border_bottom_color <- dt_options_get_value(data, option = "table_border_bottom_color")
  table_border_top_color    <- dt_options_get_value(data, option = "table_border_top_color")

  paragraph_properties <- ooxml_paragraph_properties(ooxml_type, cell_style = cell_style)
  ooxml_tbl_cell(ooxml_type,
    ooxml_paragraph(ooxml_type, properties = paragraph_properties,
      ooxml_run(ooxml_type, properties = ooxml_run_properties(ooxml_type, cell_style = cell_style),
        ooxml_text(ooxml_type, text,
          space = cell_style[["cell_text"]][["whitespace"]] %||% "default"
        )
      )
    ),
    properties = ooxml_tbl_cell_properties(ooxml_type,
      borders  = list(
        top    = list(color = table_body_hlines_color),
        bottom = list(color = table_body_hlines_color),
        left   = list(color = table_body_vlines_color),
        right  = list(color = table_body_vlines_color)
      ),
      fill     = cell_style[["cell_fill"]][["color"]],
      v_align  = cell_style[["cell_text"]][["v_align"]],
      margins  = NULL # TODO: is there something in cell_style for it ?
    )
  )
}

# tools ------------------------------------------------------------------------

get_col_alignment <- function(data) {
  boxh <- dt_boxhead_get(data = data)
  vctrs::vec_slice(boxh$column_align, boxh$type == "default")
}


