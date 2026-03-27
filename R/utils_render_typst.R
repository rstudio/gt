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
  heading_component <- create_heading_component_typst(data = data)
  footer_components <- create_footer_component_typst(data = data)
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

  table_component <- create_table_component_typst(data = data)
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

create_heading_component_typst <- function(data) {

  heading <- dt_heading_get(data = data)
  heading_lines <- character(0L)

  if (!is.null(heading$title) && length(heading$title) > 0 && nzchar(heading$title)) {
    heading_lines <- c(
      heading_lines,
      heading$title
    )
  }

  if (!is.null(heading$subtitle) && length(heading$subtitle) > 0 && nzchar(heading$subtitle)) {
    heading_lines <- c(
      heading_lines,
      heading$subtitle
    )
  }

  if (length(heading_lines) == 0) {
    return(character(0L))
  }

  paste(heading_lines, collapse = "\n\n")
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

create_table_component_typst <- function(data) {

  column_spec <- typst_columns_spec(data = data)
  align_spec <- typst_align_spec(data = data)

  contents <- c(
    create_header_component_typst(data = data),
    create_body_component_typst(data = data)
  )

  if (length(contents) == 0) {
    contents <- "[]"
  }

  table_lines <- c(
    "table(",
    paste0("  columns: ", column_spec, ","),
    paste0("  align: ", align_spec, ","),
    paste0("  ", paste(contents, collapse = ",\n  ")),
    ")"
  )

  paste(table_lines, collapse = "\n")
}

create_header_component_typst <- function(data) {

  rows <- c(
    create_spanner_component_typst(data = data),
    create_column_labels_component_typst(data = data)
  )

  rows[nzchar(rows)]
}

create_spanner_component_typst <- function(data) {

  spanner_matrix <- dt_spanners_print_matrix(data = data, omit_columns_row = TRUE)

  if (is.null(spanner_matrix) || length(spanner_matrix) == 0) {
    return(character(0L))
  }

  if (is.null(dim(spanner_matrix))) {
    spanner_matrix <- matrix(spanner_matrix, nrow = 1L)
  }

  visible_columns <- typst_visible_columns(data = data)
  default_vars <- dt_boxhead_get_vars_default(data = data)

  if (length(default_vars) == 0) {
    return(character(0L))
  }

  spanner_matrix <- spanner_matrix[, default_vars, drop = FALSE]
  prefix <- rep(NA_character_, sum(visible_columns$type %in% c("row_group", "stub")))

  rows <- character(0L)

  for (i in seq_len(nrow(spanner_matrix))) {
    values <- c(prefix, unname(spanner_matrix[i, ]))
    rows <- c(
      rows,
      paste0("table.header(", paste(typst_cells_from_runs(values, strong = FALSE), collapse = ", "), ")")
    )
  }

  rows
}

create_column_labels_component_typst <- function(data) {

  visible_columns <- typst_visible_columns(data = data)

  if (nrow(visible_columns) == 0) {
    return(character(0L))
  }

  labels <- vapply(visible_columns$label, typst_content_expr, character(1L))

  paste0("table.header(", paste(labels, collapse = ", "), ")")
}

create_body_component_typst <- function(data) {

  body_matrix <- get_body_component_cell_matrix(data = data)

  if (is.null(dim(body_matrix))) {
    body_matrix <- matrix(body_matrix, nrow = NROW(body_matrix))
  }

  n_cols <- if (length(body_matrix) > 0) NCOL(body_matrix) else max(1L, nrow(typst_visible_columns(data = data)))
  rows <- character(0L)
  groups_rows_df <- dt_groups_rows_get(data = data)
  has_group_headings <- nrow(groups_rows_df) > 0L && !stub_group_names_has_column(data = data)

  grand_summary <- create_summary_component_typst(data = data, group_id = grand_summary_col)

  if (!is.null(grand_summary) && identical(grand_summary$side, "top")) {
    rows <- c(rows, grand_summary$rows)
  }

  if (has_group_headings) {

    for (i in seq_len(nrow(groups_rows_df))) {

      rows <- c(
        rows,
        typst_span_cell(
          text = groups_rows_df$group_label[i],
          colspan = n_cols,
          align = "left",
          strong = TRUE
        )
      )

      group_summary <- create_summary_component_typst(data = data, group_id = groups_rows_df$group_id[i])

      if (!is.null(group_summary) && identical(group_summary$side, "top")) {
        rows <- c(rows, group_summary$rows)
      }

      for (rownum in seq(groups_rows_df$row_start[i], groups_rows_df$row_end[i])) {
        rows <- c(rows, typst_body_row(body_matrix[rownum, , drop = TRUE]))
      }

      if (!is.null(group_summary) && identical(group_summary$side, "bottom")) {
        rows <- c(rows, group_summary$rows)
      }
    }

  } else if (nrow(body_matrix) > 0) {

    for (i in seq_len(nrow(body_matrix))) {
      rows <- c(rows, typst_body_row(body_matrix[i, , drop = TRUE]))
    }
  }

  if (!is.null(grand_summary) && identical(grand_summary$side, "bottom")) {
    rows <- c(rows, grand_summary$rows)
  }

  rows
}

create_summary_component_typst <- function(data, group_id) {

  summary_list <- dt_summary_df_get(data = data)$summary_df_display_list

  if (!group_id %in% names(summary_list)) {
    return(NULL)
  }

  summary_df <- summary_list[[group_id]]

  if (nrow(summary_df) < 1L) {
    return(NULL)
  }

  visible_columns <- typst_visible_columns(data = data)
  data_vars <- visible_columns$var[visible_columns$type == "default"]
  stub_slots <- sum(visible_columns$type %in% c("row_group", "stub"))
  rows <- character(0L)

  for (i in seq_len(nrow(summary_df))) {

    cells <- rep("", nrow(visible_columns))

    if (stub_slots > 0L) {
      cells[stub_slots] <- summary_df[[rowname_col_private]][i]
    }

    if (length(data_vars) > 0L) {
      cells[(stub_slots + 1L):length(cells)] <- unname(as.character(summary_df[i, data_vars, drop = TRUE]))
    }

    rows <- c(rows, typst_body_row(cells))
  }

  list(
    rows = rows,
    side = unique(summary_df[["::side::"]])[[1]]
  )
}

create_footer_component_typst <- function(data) {

  components <- character(0L)

  footnotes_tbl <- dt_footnotes_get(data = data)

  if (nrow(footnotes_tbl) > 0L) {
    footnotes_tbl <- dplyr::arrange(footnotes_tbl, fs_id)
    footnotes_tbl <- dplyr::distinct(footnotes_tbl, fs_id, footnotes)
    footnotes <- paste0(
      "[", footnotes_tbl$fs_id, "] ",
      vapply(footnotes_tbl$footnotes, process_text, character(1L), context = "typst")
    )
    components <- c(components, vapply(footnotes, typst_note_block, character(1L)))
  }

  source_notes <- dt_source_notes_get(data = data)

  if (length(source_notes) > 0L) {
    components <- c(components, vapply(source_notes, typst_note_block, character(1L)))
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

typst_body_row <- function(values) {
  paste(vapply(values, typst_content_expr, character(1L)), collapse = ", ")
}

typst_span_cell <- function(text, colspan, align = NULL, strong = FALSE) {

  modifiers <- c(
    if (colspan > 1L) paste0("colspan: ", colspan),
    if (!is.null(align)) paste0("align: ", align)
  )

  content <- typst_content_expr(text)

  if (strong) {
    content <- typst_wrap_strong(content)
  }

  if (length(modifiers) == 0) {
    return(paste0("table.cell(", content, ")"))
  }

  paste0("table.cell(", paste(modifiers, collapse = ", "), ")", content)
}

typst_note_block <- function(text) {
  paste0("block", typst_content_expr(text))
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
