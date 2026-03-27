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
#  Copyright (c) 2018-2026 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


footnote_mark_to_typst <- function(
    data,
    mark,
    location = c("ref", "ftr")
) {

  location <- match.arg(location)

  if (length(mark) == 1 && is.na(mark)) {
    return("")
  }

  spec <- get_footnote_spec_by_location(data = data, location = location)
  spec <- spec %||% "^i"

  if (grepl(".", spec, fixed = TRUE)) mark <- sprintf_unless_na("%s.", mark)
  if (grepl("b", spec, fixed = TRUE)) mark <- sprintf_unless_na("*%s*", mark)
  if (grepl("i", spec, fixed = TRUE)) mark <- sprintf_unless_na("_%s_", mark)
  if (grepl("\\(|\\[", spec)) mark <- sprintf_unless_na("(%s", mark)
  if (grepl("\\)|\\]", spec)) mark <- sprintf_unless_na("%s)", mark)

  if (grepl("^", spec, fixed = TRUE)) {
    mark <- sprintf_unless_na("#super[%s]", mark)
  }

  mark[is.na(mark)] <- ""
  mark
}

as_typst_string <- function(data, container = "auto", quarto = FALSE) {

  table_caption <- dt_options_get_value(data = data, option = "table_caption")
  has_caption <- !all(is.na(table_caption))
  styles_tbl <- dt_styles_get(data = data)
  heading_component <- create_heading_component_typst(data = data, styles_tbl = styles_tbl)
  footer_components <- create_footer_component_typst(data = data, styles_tbl = styles_tbl)
  has_heading <- length(heading_component) > 0L && any(nzchar(heading_component))
  has_footer <- length(footer_components) > 0L && any(nzchar(footer_components))
  has_auxiliary_content <- has_caption || has_heading || has_footer

  use_figure <-
    switch(
      container,
      auto = has_auxiliary_content,
      table = FALSE,
      figure = TRUE
    )

  table_component <- create_table_component_typst(data = data, styles_tbl = styles_tbl)
  main_component <-
    if (use_figure) {
      figure_body <-
        typst_compose_content(c(heading_component, table_component, footer_components))

      create_figure_component_typst(
        data = data,
        body_component = figure_body,
        caption = if (has_caption) table_caption else NULL,
        quarto = quarto
      )
    } else {
      table_component
    }

  components <- c(
    if (!use_figure) heading_component,
    main_component,
    if (!use_figure && has_caption) create_caption_component_typst(table_caption),
    if (!use_figure) footer_components
  )

  typst_compose_blocks(components)
}

create_heading_component_typst <- function(data, styles_tbl = dt_styles_get(data = data)) {

  heading <- dt_heading_get(data = data)
  heading_lines <- character(0L)

  if (!is.null(heading$title) && length(heading$title) > 0 && nzchar(heading$title)) {
    heading_lines <- c(
      heading_lines,
      typst_render_block_or_text(
        heading$title,
        style_obj = typst_style_for_heading(styles_tbl = styles_tbl, locname = "title")
      )
    )
  }

  if (!is.null(heading$subtitle) && length(heading$subtitle) > 0 && nzchar(heading$subtitle)) {
    heading_lines <- c(
      heading_lines,
      typst_render_block_or_text(
        heading$subtitle,
        style_obj = typst_style_for_heading(styles_tbl = styles_tbl, locname = "subtitle")
      )
    )
  }

  if (length(heading_lines) == 0) {
    return(character(0L))
  }

  heading_lines
}

create_caption_component_typst <- function(caption) {
  process_text(caption, context = "typst")
}

create_figure_component_typst <- function(
    data,
    body_component,
    caption = NULL,
    quarto = FALSE
) {

  lines <- c(
    "figure(",
    paste0("  ", gsub("\n", "\n  ", body_component, fixed = TRUE), ",")
  )

  if (!is.null(caption)) {
    if (quarto) {
      lines <- c(
        lines,
        "  caption: figure.caption(",
        "    position: top,",
        paste0("    ", typst_content_expr(process_text(caption, context = "typst"))),
        "  ),"
      )
    } else {
      lines <- c(
        lines,
        paste0("  caption: ", typst_content_expr(process_text(caption, context = "typst")), ",")
      )
    }
  }

  if (quarto) {
    lines <- c(
      lines,
      "  kind: \"quarto-float-tbl\",",
      "  supplement: \"Table\","
    )
  } else {
    lines <- c(lines, "  kind: table,")
  }

  lines <- c(lines, ")")
  paste(lines, collapse = "\n")
}

create_table_component_typst <- function(data, styles_tbl = dt_styles_get(data = data)) {

  column_spec <- typst_columns_spec(data = data)
  align_spec <- typst_align_spec(data = data)
  header_rows <- create_header_rows_typst(data = data, styles_tbl = styles_tbl)
  body_rows <- create_body_rows_typst(data = data, styles_tbl = styles_tbl)
  fill_plan <- typst_table_fill_plan(header_rows = header_rows, body_rows = body_rows)

  contents <- c(
    render_header_rows_typst(header_rows = header_rows, fill_plan = fill_plan),
    render_body_rows_typst(body_rows = body_rows, fill_plan = fill_plan)
  )

  if (length(contents) == 0) {
    contents <- "[]"
  }

  table_lines <- c(
    "table(",
    paste0("  columns: ", column_spec, ","),
    paste0("  align: ", align_spec, ","),
    if (!is.null(fill_plan$fill_spec)) paste0("  fill: ", fill_plan$fill_spec, ","),
    paste0("  ", paste(contents, collapse = ",\n  ")),
    ")"
  )

  paste(table_lines, collapse = "\n")
}

create_header_rows_typst <- function(data, styles_tbl = dt_styles_get(data = data)) {

  c(
    create_spanner_rows_typst(data = data, styles_tbl = styles_tbl),
    create_column_label_rows_typst(data = data, styles_tbl = styles_tbl)
  )
}

create_spanner_rows_typst <- function(data, styles_tbl = dt_styles_get(data = data)) {

  spanner_matrix <- dt_spanners_print_matrix(data = data, omit_columns_row = TRUE)

  if (is.null(spanner_matrix) || length(spanner_matrix) == 0) {
    return(list())
  }

  if (is.null(dim(spanner_matrix))) {
    spanner_matrix <- matrix(spanner_matrix, nrow = 1L)
  }

  visible_columns <- typst_visible_columns(data = data)
  default_vars <- dt_boxhead_get_vars_default(data = data)

  if (length(default_vars) == 0) {
    return(list())
  }

  spanner_matrix <- spanner_matrix[, default_vars, drop = FALSE]
  prefix <- rep(NA_character_, sum(visible_columns$type %in% c("row_group", "stub")))

  rows <- list()

  for (i in seq_len(nrow(spanner_matrix))) {
    values <- c(prefix, unname(spanner_matrix[i, ]))
    rows <- c(
      rows,
      list(
        list(
          kind = "header",
          row_kind = "spanner",
          cells = typst_cellspecs_from_runs(
            values = values,
            data = data,
            styles_tbl = styles_tbl,
            level = i,
            default_vars = default_vars,
            strong = FALSE
          )
        )
      )
    )
  }

  rows
}

create_column_label_rows_typst <- function(data, styles_tbl = dt_styles_get(data = data)) {

  visible_columns <- typst_visible_columns(data = data)

  if (nrow(visible_columns) == 0) {
    return(list())
  }

  cells <-
    lapply(
      seq_len(nrow(visible_columns)),
      function(i) {
        style_obj <-
          if (visible_columns$type[i] == "stub" && !all(is.na(dt_boxhead_get_var_stub(data = data)))) {
            typst_style_for_stubhead(styles_tbl = styles_tbl)
          } else {
            typst_style_for_column_label(styles_tbl = styles_tbl, colname = visible_columns$var[i])
          }

        list(
          text = visible_columns$label[i],
          style = style_obj,
          colspan = 1L,
          align = NULL,
          strong = FALSE
        )
      }
    )

  list(list(kind = "header", row_kind = "labels", cells = cells))
}

create_body_rows_typst <- function(data, styles_tbl = dt_styles_get(data = data)) {

  body_matrix <- get_body_component_cell_matrix(data = data)

  if (is.null(dim(body_matrix))) {
    body_matrix <- matrix(body_matrix, nrow = NROW(body_matrix))
  }

  n_cols <- if (length(body_matrix) > 0) NCOL(body_matrix) else max(1L, nrow(typst_visible_columns(data = data)))
  rows <- list()
  groups_rows_df <- dt_groups_rows_get(data = data)
  has_group_headings <- nrow(groups_rows_df) > 0L && !stub_group_names_has_column(data = data)
  visible_columns <- typst_visible_columns(data = data)

  grand_summary <- create_summary_component_typst(
    data = data,
    group_id = grand_summary_col,
    styles_tbl = styles_tbl,
    visible_columns = visible_columns
  )

  if (!is.null(grand_summary) && identical(grand_summary$side, "top")) {
    rows <- c(rows, grand_summary$rows)
  }

  if (has_group_headings) {

    for (i in seq_len(nrow(groups_rows_df))) {

      rows <- c(
        rows,
        list(
          list(
            kind = "body",
            row_kind = "row_group",
            group_id = groups_rows_df$group_id[i],
            cells = list(
              list(
                text = groups_rows_df$group_label[i],
                style = typst_style_for_row_group(styles_tbl = styles_tbl, grpname = groups_rows_df$group_id[i]),
                colspan = n_cols,
                align = "left",
                strong = TRUE
              )
            )
          )
        )
      )

      group_summary <- create_summary_component_typst(
        data = data,
        group_id = groups_rows_df$group_id[i],
        styles_tbl = styles_tbl,
        visible_columns = visible_columns
      )

      if (!is.null(group_summary) && identical(group_summary$side, "top")) {
        rows <- c(rows, group_summary$rows)
      }

      for (rownum in seq(groups_rows_df$row_start[i], groups_rows_df$row_end[i])) {
        rows <- c(
          rows,
          list(
            typst_body_row_spec(
              values = body_matrix[rownum, , drop = TRUE],
              rownum = rownum,
              visible_columns = visible_columns,
              styles_tbl = styles_tbl
            )
          )
        )
      }

      if (!is.null(group_summary) && identical(group_summary$side, "bottom")) {
        rows <- c(rows, group_summary$rows)
      }
    }

  } else if (nrow(body_matrix) > 0) {

    for (i in seq_len(nrow(body_matrix))) {
      rows <- c(
        rows,
        list(
          typst_body_row_spec(
            values = body_matrix[i, , drop = TRUE],
            rownum = i,
            visible_columns = visible_columns,
            styles_tbl = styles_tbl
          )
        )
      )
    }
  }

  if (!is.null(grand_summary) && identical(grand_summary$side, "bottom")) {
    rows <- c(rows, grand_summary$rows)
  }

  rows
}

create_summary_component_typst <- function(
    data,
    group_id,
    styles_tbl = dt_styles_get(data = data),
    visible_columns = typst_visible_columns(data = data)
) {

  summary_list <- dt_summary_df_get(data = data)$summary_df_display_list

  if (!group_id %in% names(summary_list)) {
    return(NULL)
  }

  summary_df <- summary_list[[group_id]]

  if (nrow(summary_df) < 1L) {
    return(NULL)
  }

  data_vars <- visible_columns$var[visible_columns$type == "default"]
  stub_slots <- sum(visible_columns$type %in% c("row_group", "stub"))
  rows <- list()
  locname <- if (identical(group_id, grand_summary_col)) "grand_summary_cells" else "summary_cells"

  for (i in seq_len(nrow(summary_df))) {

    cells <- rep("", nrow(visible_columns))

    if (stub_slots > 0L) {
      cells[stub_slots] <- summary_df[[rowname_col_private]][i]
    }

    if (length(data_vars) > 0L) {
      cells[(stub_slots + 1L):length(cells)] <- unname(as.character(summary_df[i, data_vars, drop = TRUE]))
    }

    cell_specs <-
      lapply(
        seq_along(cells),
        function(j) {
          col_meta <- visible_columns[j, , drop = FALSE]
          style_obj <-
            if (col_meta$type == "default") {
              typst_style_for_summary_cell(
                styles_tbl = styles_tbl,
                locname = locname,
                grpname = group_id,
                colname = col_meta$var,
                rownum = i
              )
            } else {
              NULL
            }

          list(
            text = cells[j],
            style = style_obj,
            colspan = 1L,
            align = NULL,
            strong = FALSE
          )
        }
      )

    rows <- c(
      rows,
      list(
        list(
          kind = "body",
          row_kind = if (identical(group_id, grand_summary_col)) "grand_summary" else "summary",
          group_id = group_id,
          cells = cell_specs
        )
      )
    )
  }

  list(
    rows = rows,
    side = unique(summary_df[["::side::"]])[[1]]
  )
}

create_footer_component_typst <- function(data, styles_tbl = dt_styles_get(data = data)) {

  components <- character(0L)

  footnotes_tbl <- dt_footnotes_get(data = data)

  if (nrow(footnotes_tbl) > 0L) {
    footnotes_tbl <- dplyr::arrange(footnotes_tbl, fs_id)
    footnotes_tbl <- dplyr::distinct(footnotes_tbl, fs_id, footnotes)
    footnotes <- paste0(
      "[", footnotes_tbl$fs_id, "] ",
      vapply(footnotes_tbl$footnotes, process_text, character(1L), context = "typst")
    )
    components <- c(
      components,
      vapply(
        footnotes,
        function(text) {
          typst_note_block(
            text = text,
            style_obj = typst_style_for_note(styles_tbl = styles_tbl, locname = "footnotes")
          )
        },
        character(1L)
      )
    )
  }

  source_notes <- dt_source_notes_get(data = data)

  if (length(source_notes) > 0L) {
    components <- c(
      components,
      vapply(
        source_notes,
        function(text) {
          typst_note_block(
            text = text,
            style_obj = typst_style_for_note(styles_tbl = styles_tbl, locname = "source_notes")
          )
        },
        character(1L)
      )
    )
  }

  components
}

typst_visible_columns <- function(data) {

  boxh <- dt_boxhead_get(data = data)
  vars <- character(0L)
  types <- character(0L)

  if (stub_group_names_has_column(data = data)) {
    group_var <- dt_boxhead_get_vars_groups(data = data)
    vars <- c(vars, group_var)
    types <- c(types, "row_group")
  }

  stub_vars <- dt_boxhead_get_var_stub(data = data)

  if (!all(is.na(stub_vars))) {
    vars <- c(vars, stub_vars)
    types <- c(types, rep("stub", length(stub_vars)))
  }

  default_vars <- dt_boxhead_get_vars_default(data = data)
  vars <- c(vars, default_vars)
  types <- c(types, rep("default", length(default_vars)))

  labels <- vapply(
    vars,
    FUN.VALUE = character(1L),
    FUN = function(var) {
      as.character(boxh$column_label[boxh$var == var][[1]])
    }
  )

  align <- vapply(
    vars,
    FUN.VALUE = character(1L),
    FUN = function(var) dt_boxhead_get_alignment_by_var(data = data, var = var)
  )

  widths <- lapply(
    vars,
    FUN = function(var) boxh$column_width[boxh$var == var][[1]]
  )

  vctrs::data_frame(
    var = vars,
    type = types,
    label = labels,
    align = align,
    width = widths
  )
}

typst_columns_spec <- function(data) {

  visible_columns <- typst_visible_columns(data = data)

  if (nrow(visible_columns) == 0) {
    return("1")
  }

  widths <- vapply(visible_columns$width, typst_column_width_value, character(1L))

  if (all(widths == "auto")) {
    as.character(length(widths))
  } else {
    paste0("(", paste(widths, collapse = ", "), ")")
  }
}

typst_column_width_value <- function(width) {

  if (is.null(width) || length(width) == 0 || is.na(width)) {
    return("auto")
  }

  width <- as.character(width)[1]

  if (width %in% c("auto", "min-content", "max-content")) {
    return("auto")
  }

  if (grepl("^[0-9.]+%$", width)) {
    return(width)
  }

  if (grepl("^[0-9.]+fr$", width)) {
    return(width)
  }

  if (grepl("^[0-9.]+px$", width)) {
    width_num <- as.numeric(sub("px$", "", width))
    return(paste0(formatC(width_num * 0.75, digits = 15, format = "fg"), "pt"))
  }

  if (grepl("^[0-9.]+(pt|cm|mm|in|em)$", width)) {
    return(width)
  }

  "auto"
}

typst_align_spec <- function(data) {

  visible_columns <- typst_visible_columns(data = data)

  if (nrow(visible_columns) == 0) {
    return("(left)")
  }

  alignments <- visible_columns$align
  alignments[!alignments %in% c("left", "center", "right")] <- "left"

  paste0("(", paste(alignments, collapse = ", "), ")")
}

typst_cells_from_runs <- function(values, strong = FALSE) {

  cells <- character(0L)
  i <- 1L

  while (i <= length(values)) {

    value <- values[i]
    run_length <- 1L

    while (
      i + run_length <= length(values) &&
      identical(is.na(values[i + run_length]), is.na(value)) &&
      identical(values[i + run_length], value)
    ) {
      run_length <- run_length + 1L
    }

    text <- if (is.na(value)) "" else value

    cells <- c(
      cells,
      typst_span_cell(
        text = text,
        colspan = run_length,
        align = if (nzchar(text)) "center" else NULL,
        strong = strong && nzchar(text)
      )
    )

    i <- i + run_length
  }

  cells
}

typst_cellspecs_from_runs <- function(values, data, styles_tbl, level, default_vars, strong = FALSE) {

  cells <- list()
  i <- 1L
  prefix_count <- length(values) - length(default_vars)

  while (i <= length(values)) {

    value <- values[i]
    run_length <- 1L

    while (
      i + run_length <= length(values) &&
      identical(is.na(values[i + run_length]), is.na(value)) &&
      identical(values[i + run_length], value)
    ) {
      run_length <- run_length + 1L
    }

    text <- if (is.na(value)) "" else value
    align <- if (nzchar(text)) "center" else NULL
    style_obj <- NULL

    if (nzchar(text) && i > prefix_count) {
      start_default <- i - prefix_count
      end_default <- start_default + run_length - 1L
      style_obj <-
        typst_style_for_spanner(
          data = data,
          styles_tbl = styles_tbl,
          level = level,
          default_vars = default_vars,
          start = start_default,
          end = end_default
        )
    }

    cells <- c(
      cells,
      list(
        list(
          text = text,
          style = style_obj,
          colspan = run_length,
          align = align,
          strong = strong && nzchar(text)
        )
      )
    )

    i <- i + run_length
  }

  cells
}

typst_body_row_spec <- function(values, rownum, visible_columns, styles_tbl) {

  cells <-
    lapply(
      seq_along(values),
      function(i) {
        col_meta <- visible_columns[i, , drop = FALSE]
        style_obj <- typst_style_for_body_cell(
          styles_tbl = styles_tbl,
          col_meta = col_meta,
          rownum = rownum
        )

        list(
          text = values[i],
          style = style_obj,
          colspan = 1L,
          align = NULL,
          strong = FALSE
        )
      }
    )

  list(kind = "body", row_kind = "data", rownum = rownum, cells = cells)
}

render_header_rows_typst <- function(header_rows, fill_plan) {
  vapply(
    seq_along(header_rows),
    function(i) {
      paste0(
        "table.header(",
        paste(
          vapply(
            header_rows[[i]]$cells,
            typst_render_cell_spec,
            character(1L),
            row_index = i - 1L,
            fill_plan = fill_plan
          ),
          collapse = ", "
        ),
        ")"
      )
    },
    character(1L)
  )
}

render_body_rows_typst <- function(body_rows, fill_plan) {
  header_count <- length(fill_plan$header_rows)
  vapply(
    seq_along(body_rows),
    function(i) {
      paste(
        vapply(
          body_rows[[i]]$cells,
          typst_render_cell_spec,
          character(1L),
          row_index = header_count + i - 1L,
          fill_plan = fill_plan
        ),
        collapse = ", "
      )
    },
    character(1L)
  )
}

typst_render_cell_spec <- function(cell, row_index, fill_plan) {

  style_obj <- cell$style %||% list()
  suppress_fill <- typst_fill_is_lifted(
    fill_plan = fill_plan,
    row_index = row_index,
    style_obj = style_obj
  )

  typst_span_cell(
    text = cell$text,
    style_obj = style_obj,
    colspan = cell$colspan %||% 1L,
    align = cell$align,
    strong = isTRUE(cell$strong),
    suppress_fill = suppress_fill
  )
}

typst_span_cell <- function(text, style_obj = NULL, colspan = 1L, align = NULL, strong = FALSE, suppress_fill = FALSE) {

  effective_align <- align %||% style_obj[["cell_text"]][["align"]] %||% NULL
  stroke_expr <- typst_stroke_expr(style_obj)

  modifiers <- c(
    if (colspan > 1L) paste0("colspan: ", colspan),
    if (!is.null(effective_align)) paste0("align: ", effective_align),
    if (!suppress_fill && !is.null(style_obj[["cell_fill"]][["color"]])) {
      paste0("fill: ", typst_color_expr(style_obj[["cell_fill"]][["color"]]))
    },
    if (!is.null(stroke_expr)) paste0("stroke: ", stroke_expr)
  )

  content <- typst_styled_content_expr(text = text, style_obj = style_obj, strong = strong)

  if (length(modifiers) == 0) {
    return(content)
  }

  paste0("table.cell(", paste(modifiers, collapse = ", "), ")", content)
}

typst_note_block <- function(text, style_obj = NULL) {
  modifiers <- typst_block_modifiers(style_obj)
  paste0("block", modifiers, typst_styled_content_expr(text = text, style_obj = style_obj, strong = FALSE))
}

typst_content_expr <- function(text) {

  text <- text %||% ""

  if (length(text) == 0 || is.na(text) || identical(text, "NA")) {
    text <- ""
  }

  paste0("[", text, "]")
}

typst_wrap_strong <- function(content_expr) {
  inner <- sub("^\\[(.*)\\]$", "\\1", content_expr)
  paste0("[*", inner, "*]")
}

typst_inner_from_content_expr <- function(content_expr) {
  sub("^\\[(.*)\\]$", "\\1", content_expr)
}

typst_styled_content_expr <- function(text, style_obj = NULL, strong = FALSE) {

  style_obj <- style_obj %||% list()
  inner <- typst_inner_from_content_expr(typst_content_expr(typst_apply_text_transform(text, style_obj)))

  weight <- style_obj[["cell_text"]][["weight"]]
  style <- style_obj[["cell_text"]][["style"]]
  decorate <- style_obj[["cell_text"]][["decorate"]]
  color <- style_obj[["cell_text"]][["color"]]
  size <- style_obj[["cell_text"]][["size"]]

  if (!is.null(color)) {
    inner <- paste0("#text(fill: ", typst_color_expr(color), ")[", inner, "]")
  }

  if (!is.null(decorate) && identical(decorate, "underline")) {
    inner <- paste0("#underline[", inner, "]")
  }

  if (!is.null(style) && style %in% c("italic", "oblique")) {
    inner <- paste0("#emph[", inner, "]")
  }

  if ((isTRUE(strong) && !identical(weight, "normal")) || (!is.null(weight) && weight %in% c("bold", "bolder"))) {
    inner <- paste0("#strong[", inner, "]")
  }

  if (!is.null(size)) {
    inner <- paste0("#text(size: ", typst_size_expr(size), ")[", inner, "]")
  }

  paste0("[", inner, "]")
}

typst_color_expr <- function(color) {
  color <- as.character(color)[1]
  if (startsWith(color, "#")) {
    return(paste0("rgb(\"", color, "\")"))
  }
  color
}

typst_consolidate_cell_styles <- function(styles_df) {

  styles_col <- styles_df[["styles"]]

  if (length(styles_col) == 0L) {
    return(list())
  }

  if (length(styles_col) == 1L) {
    return(styles_col[[1L]])
  }

  out_style <- list()

  for (i in seq_along(styles_col)) {
    for (j in names(styles_col[[i]])) {
      if (!j %in% names(out_style)) out_style[[j]] <- list()
      for (k in names(styles_col[[i]][[j]])) {
        out_style[[j]] <- append(out_style[[j]], styles_col[[i]][[j]][k])
      }
    }
  }

  out_style
}

typst_style_for_column_label <- function(styles_tbl, colname) {
  typst_consolidate_cell_styles(
    vctrs::vec_slice(
      styles_tbl,
      styles_tbl$locname == "columns_columns" & styles_tbl$colname == colname
    )
  )
}

typst_style_for_spanner <- function(data, styles_tbl, level, default_vars, start, end) {
  spanners <- dt_spanners_get(data = data)
  vars_slice <- default_vars[start:end]

  idx <-
    which(
      spanners$spanner_level == level &
        vapply(spanners$vars, identical, logical(1L), y = vars_slice)
    )

  if (length(idx) < 1L) {
    return(list())
  }

  grpname <- spanners$spanner_id[[idx[[1L]]]]
  typst_consolidate_cell_styles(
    vctrs::vec_slice(
      styles_tbl,
      styles_tbl$locname == "columns_groups" & styles_tbl$grpname == grpname
    )
  )
}

typst_style_for_heading <- function(styles_tbl, locname) {
  typst_consolidate_cell_styles(
    vctrs::vec_slice(styles_tbl, styles_tbl$locname == locname)
  )
}

typst_style_for_stubhead <- function(styles_tbl) {
  typst_consolidate_cell_styles(
    vctrs::vec_slice(styles_tbl, styles_tbl$locname == "stubhead")
  )
}

typst_style_for_row_group <- function(styles_tbl, grpname) {
  typst_consolidate_cell_styles(
    vctrs::vec_slice(
      styles_tbl,
      styles_tbl$locname == "row_groups" & styles_tbl$grpname == grpname
    )
  )
}

typst_style_for_summary_cell <- function(styles_tbl, locname, grpname, colname, rownum = NULL) {
  styles_df <-
    vctrs::vec_slice(
      styles_tbl,
      styles_tbl$locname == locname &
        styles_tbl$grpname == grpname &
        styles_tbl$colname == colname
    )

  if (!is.null(rownum) && nrow(styles_df) > 1L && "rownum" %in% names(styles_df)) {
    styles_df <- vctrs::vec_slice(styles_df, round(styles_df$rownum) == rownum)
  }

  typst_consolidate_cell_styles(styles_df)
}

typst_style_for_note <- function(styles_tbl, locname) {
  typst_consolidate_cell_styles(
    vctrs::vec_slice(styles_tbl, styles_tbl$locname == locname)
  )
}

typst_style_for_body_cell <- function(styles_tbl, col_meta, rownum) {

  if (col_meta$type == "default") {
    return(
      typst_consolidate_cell_styles(
        vctrs::vec_slice(
          styles_tbl,
          styles_tbl$locname == "data" &
            styles_tbl$colname == col_meta$var &
            styles_tbl$rownum == rownum
        )
      )
    )
  }

  if (col_meta$type == "stub") {
    styles_df <- vctrs::vec_slice(
      styles_tbl,
      styles_tbl$rownum == rownum &
        (
          styles_tbl$locname == "stub" |
            (styles_tbl$locname == "stub_column" & styles_tbl$colname == col_meta$var)
        )
    )
    return(typst_consolidate_cell_styles(styles_df))
  }

  list()
}

typst_render_block_text <- function(text, style_obj = NULL) {
  typst_inner_from_content_expr(
    typst_styled_content_expr(text = text, style_obj = style_obj, strong = FALSE)
  )
}

typst_render_block_or_text <- function(text, style_obj = NULL) {
  style_obj <- style_obj %||% list()
  modifiers <- typst_block_modifiers(style_obj)
  rendered <- typst_render_block_text(text = text, style_obj = style_obj)

  if (identical(modifiers, "")) {
    return(rendered)
  }

  paste0("block", modifiers, "[", rendered, "]")
}

typst_block_modifiers <- function(style_obj = NULL) {
  style_obj <- style_obj %||% list()
  args <- c(
    if (!is.null(style_obj[["cell_fill"]][["color"]])) {
      paste0("fill: ", typst_color_expr(style_obj[["cell_fill"]][["color"]]))
    },
    if (!is.null(typst_stroke_expr(style_obj))) {
      paste0("stroke: ", typst_stroke_expr(style_obj))
    },
    if (!is.null(style_obj[["cell_fill"]][["color"]]) || !is.null(typst_stroke_expr(style_obj))) {
      "inset: 6pt"
    }
  )

  if (length(args) == 0L) {
    return("")
  }

  paste0("(", paste(args, collapse = ", "), ")")
}

typst_apply_text_transform <- function(text, style_obj = NULL) {
  style_obj <- style_obj %||% list()
  transform <- style_obj[["cell_text"]][["transform"]]

  if (is.null(transform) || is.na(text) || !nzchar(text)) {
    return(text)
  }

  switch(
    transform,
    uppercase = toupper(text),
    lowercase = tolower(text),
    capitalize = str_title_case(text),
    text
  )
}

typst_size_expr <- function(size) {
  if (is.null(size)) {
    return("1em")
  }

  if (is.numeric(size)) {
    return(paste0(formatC(size * 0.75, digits = 15, format = "fg"), "pt"))
  }

  size <- as.character(size)[1]
  mapped <- c(
    "xx-small" = "0.6em",
    "x-small" = "0.75em",
    "small" = "0.9em",
    "medium" = "1em",
    "large" = "1.2em",
    "x-large" = "1.4em",
    "xx-large" = "1.7em",
    "xxx-large" = "2em"
  )[[size]]

  if (!is.null(mapped)) {
    return(mapped)
  }

  if (grepl("^[0-9.]+px$", size)) {
    size_num <- as.numeric(sub("px$", "", size))
    return(paste0(formatC(size_num * 0.75, digits = 15, format = "fg"), "pt"))
  }

  if (grepl("^[0-9.]+(pt|cm|mm|in|em)$", size)) {
    return(size)
  }

  "1em"
}

typst_stroke_expr <- function(style_obj = NULL) {
  style_obj <- style_obj %||% list()
  border_keys <- c("cell_border_left", "cell_border_right", "cell_border_top", "cell_border_bottom")
  parts <- character(0L)

  for (key in border_keys) {
    border <- style_obj[[key]]
    if (is.null(border)) next

    side <- border[["side"]] %||% sub("^cell_border_", "", key)
    color <- border[["color"]] %||% "#000000"
    width <- border[["width"]] %||% "1px"
    style <- border[["style"]] %||% "solid"

    dash <- switch(
      style,
      dashed = ', dash: "dashed"',
      dotted = ', dash: "dotted"',
      ""
    )

    parts <- c(
      parts,
      paste0(
        side, ": (paint: ", typst_color_expr(color),
        ", thickness: ", typst_length_expr(width),
        dash, ")"
      )
    )
  }

  if (length(parts) == 0L) {
    return(NULL)
  }

  paste0("(", paste(parts, collapse = ", "), ")")
}

typst_length_expr <- function(value) {
  if (is.null(value) || length(value) == 0 || is.na(value)) {
    return("1pt")
  }

  if (is.numeric(value)) {
    return(paste0(trimws(formatC(value * 0.75, digits = 15, format = "fg")), "pt"))
  }

  value <- as.character(value)[1]

  if (grepl("^[0-9.]+px$", value)) {
    value_num <- as.numeric(sub("px$", "", value))
    return(paste0(trimws(formatC(value_num * 0.75, digits = 15, format = "fg")), "pt"))
  }

  if (grepl("^[0-9.]+(pt|cm|mm|in|em)$", value)) {
    return(value)
  }

  "1pt"
}

typst_row_fill_color <- function(row) {
  fills <- unique(
    vapply(
      row$cells,
      FUN.VALUE = character(1L),
      FUN = function(cell) cell$style[["cell_fill"]][["color"]] %||% ""
    )
  )
  fills <- fills[nzchar(fills)]

  if (length(fills) == 1L && length(row$cells) > 0) {
    return(fills[[1L]])
  }

  ""
}

typst_table_fill_plan <- function(header_rows, body_rows) {

  row_fill_map <- list()
  header_fill_rows <- integer(0L)

  if (length(header_rows) > 0L) {
    for (i in seq_along(header_rows)) {
      fill_color <- typst_row_fill_color(header_rows[[i]])
      if (nzchar(fill_color)) {
        row_fill_map[[as.character(i - 1L)]] <- fill_color
        header_fill_rows <- c(header_fill_rows, i)
      }
    }
  }

  body_data_idx <- which(vapply(body_rows, `[[`, character(1L), "row_kind") == "data")

  if (length(body_data_idx) >= 2L) {
    fills <- vapply(body_rows[body_data_idx], typst_row_fill_color, character(1L))
    if (all(nzchar(fills))) {
      unique_fills <- unique(fills)
      if (length(unique_fills) <= 2L) {
        alternating <- all(fills == unique_fills[(seq_along(fills) - 1L) %% length(unique_fills) + 1L])
        if (alternating) {
          for (i in seq_along(body_data_idx)) {
            row_fill_map[[as.character(length(header_rows) + body_data_idx[i] - 1L)]] <- fills[[i]]
          }
        }
      }
    }
  }

  fill_spec <- NULL
  if (length(row_fill_map) > 0L) {
    row_ids <- as.integer(names(row_fill_map))
    clauses <-
      vapply(
        seq_along(row_ids),
        FUN.VALUE = character(1L),
        FUN = function(i) {
          paste0("if y == ", row_ids[[i]], " { ", typst_color_expr(row_fill_map[[i]]), " }")
        }
      )
    fill_spec <- paste0("(x, y) => ", paste(clauses, collapse = " else "), " else { none }")
  }

  list(
    fill_spec = fill_spec,
    row_fill_map = row_fill_map,
    header_rows = seq_along(header_rows)
  )
}

typst_fill_is_lifted <- function(fill_plan, row_index, style_obj) {
  fill_color <- style_obj[["cell_fill"]][["color"]] %||% ""
  lifted <- fill_plan$row_fill_map[[as.character(row_index)]]
  nzchar(fill_color) && !is.null(lifted) && identical(fill_color, lifted)
}

typst_compose_blocks <- function(components) {

  components <- components[!is.na(components) & nzchar(components)]

  if (length(components) == 0) {
    return("")
  }

  if (length(components) == 1) {
    component <- components[[1]]
    if (!typst_component_needs_eval(component)) {
      return(component)
    }
    return(paste0("#", component))
  }

  rendered_components <-
    vapply(
      components,
      FUN.VALUE = character(1L),
      FUN = function(component) {
        if (!typst_component_needs_eval(component)) {
          component
        } else {
          paste0("#", component)
        }
      }
    )

  paste0(
    "#block[\n",
    paste(
      rendered_components,
      collapse = "\n\n"
    ),
    "\n]"
  )
}

typst_compose_content <- function(components) {

  components <- components[!is.na(components) & nzchar(components)]

  if (length(components) == 0) {
    return("[]")
  }

  rendered_components <-
    vapply(
      components,
      FUN.VALUE = character(1L),
      FUN = function(component) {
        if (!typst_component_needs_eval(component)) {
          component
        } else {
          paste0("#", component)
        }
      }
    )

  paste0(
    "[\n",
    paste(rendered_components, collapse = "\n\n"),
    "\n]"
  )
}

typst_component_needs_eval <- function(component) {

  if (startsWith(component, "#")) {
    return(FALSE)
  }

  if (startsWith(component, "[")) {
    return(FALSE)
  }

  grepl("^[A-Za-z][A-Za-z0-9_.]*\\s*(\\(|\\[)", component)
}
