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

as_typst_string <- function(data, container = "auto", label = NULL, breakable = FALSE, quarto = FALSE) {

  table_caption <- dt_options_get_value(data = data, option = "table_caption")
  has_caption <- !all(is.na(table_caption))
  styles_tbl <- dt_styles_get(data = data)
  heading_component <- create_heading_component_typst(data = data, styles_tbl = styles_tbl)
  footer_components <- create_footer_component_typst(data = data, styles_tbl = styles_tbl)
  has_heading <- length(heading_component) > 0L && any(nzchar(heading_component))
  has_footer <- length(footer_components) > 0L && any(nzchar(footer_components))
  has_auxiliary_content <- has_caption || has_heading || has_footer

  if (identical(container, "table") && has_auxiliary_content) {
    cli::cli_warn(c(
      "Auxiliary Typst table content is dropped when `container = \"table\"`.",
      "*" = "Titles, subtitles, captions, footnotes, and source notes require figure semantics in Typst."
    ))
    has_caption <- FALSE
    has_heading <- FALSE
    has_footer <- FALSE
    heading_component <- character(0L)
    footer_components <- character(0L)
    has_auxiliary_content <- FALSE
  }

  use_figure <-
    switch(
      container,
      auto = has_auxiliary_content,
      table = FALSE,
      figure = TRUE
    )

  table_component <- create_table_component_typst(data = data, styles_tbl = styles_tbl)
  heading_region <- typst_region_component(heading_component, spacing = "0.35em", force_stack = TRUE)
  footer_region <- typst_region_component(footer_components, spacing = "0.45em", force_stack = TRUE)

  main_component <-
    if (use_figure) {
      figure_body <-
        typst_compose_content(c(heading_region, table_component, footer_region))

      figure_component <-
        create_figure_component_typst(
        data = data,
        body_component = figure_body,
        caption = if (has_caption) table_caption else NULL,
        quarto = quarto
      )

      if (isTRUE(breakable)) {
        figure_kind <- if (quarto) "\"quarto-float-tbl\"" else "table"
        figure_component <- typst_make_figure_breakable(figure_component, kind = figure_kind)
      }

      figure_component
    } else {
      table_component
    }

  components <- c(
    if (!use_figure) heading_region,
    main_component,
    if (!use_figure && has_caption) create_caption_component_typst(table_caption),
    if (!use_figure) footer_region
  )

  output <- typst_compose_blocks(components)
  label_name <- typst_resolve_label(data = data, label = label, quarto = quarto)

  if (!is.null(label_name)) {
    output <- paste0(output, "\n<", label_name, ">")
  }

  output
}

as_typst_quarto_knit_output <- function(data) {

  table_caption <- dt_options_get_value(data = data, option = "table_caption")
  has_caption <- !all(is.na(table_caption))
  label_name <- typst_resolve_label(data = data, label = NULL, quarto = TRUE)

  if (!has_caption) {
    typst_output <- as_typst_string(
      data = data,
      container = "auto",
      label = if (!is.null(label_name)) label_name else FALSE,
      quarto = FALSE
    )

    return(
      paste0("\n```{=typst}\n", typst_output, "\n```\n\n")
    )
  }

  if (is.null(label_name)) {
    typst_output <- as_typst_string(
      data = data,
      container = "auto",
      label = FALSE,
      quarto = TRUE
    )

    return(
      paste0("\n```{=typst}\n", typst_output, "\n```\n\n")
    )
  }

  data_body <-
    dt_options_set_value(
      data = data,
      option = "table_caption",
      value = NA_character_
    )

  body_output <- as_typst_string(
    data = data_body,
    container = "table",
    label = FALSE,
    quarto = FALSE
  )

  caption_text <- typst_quarto_caption_markdown(table_caption)
  div_open <-
    if (!is.null(label_name)) {
      paste0("::: {#", label_name, "}")
    } else {
      ":::"
    }

  paste0(
    "\n",
    div_open,
    "\n\n```{=typst}\n",
    body_output,
    "\n```\n\n",
    caption_text,
    "\n:::\n\n"
  )
}

create_heading_component_typst <- function(data, styles_tbl = dt_styles_get(data = data)) {

  heading <- dt_heading_get(data = data)
  heading_lines <- character(0L)

  if (!is.null(heading$title) && length(heading$title) > 0 && nzchar(heading$title)) {
    heading_lines <- c(
      heading_lines,
      typst_render_block_or_text(
        heading$title,
        style_obj = typst_style_for_heading(styles_tbl = styles_tbl, locname = "title"),
        force_block = TRUE
      )
    )
  }

  if (!is.null(heading$subtitle) && length(heading$subtitle) > 0 && nzchar(heading$subtitle)) {
    heading_lines <- c(
      heading_lines,
      typst_render_block_or_text(
        heading$subtitle,
        style_obj = typst_style_for_heading(styles_tbl = styles_tbl, locname = "subtitle"),
        force_block = TRUE
      )
    )
  }

  if (length(heading_lines) == 0) {
    return(character(0L))
  }

  heading_lines
}

create_caption_component_typst <- function(caption) {
  typst_render_block_or_text(
    process_text(caption, context = "typst"),
    force_block = TRUE
  )
}

create_figure_component_typst <- function(
    data,
    body_component,
    caption = NULL,
    quarto = FALSE
) {

  body_component <-
    if (quarto) {
      typst_content_block_argument(body_component)
    } else {
      body_component
    }

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
  visible_columns <- typst_visible_columns(data = data)
  header_rows <- create_header_rows_typst(data = data, styles_tbl = styles_tbl)
  body_rows <- create_body_rows_typst(data = data, styles_tbl = styles_tbl)
  fill_plan <- typst_table_fill_plan(
    header_rows = header_rows,
    body_rows = body_rows,
    n_cols = max(1L, nrow(visible_columns))
  )

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
    if (!is.null(fill_plan$stroke_spec)) paste0("  stroke: ", fill_plan$stroke_spec, ","),
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
          colname <-
            if (col_meta$type == "default") {
              col_meta$var
            } else if (col_meta$type == "stub" && j == stub_slots) {
              NA_character_
            } else {
              NULL
            }

          style_obj <-
            if (!is.null(colname)) {
              typst_style_for_summary_cell(
                styles_tbl = styles_tbl,
                locname = locname,
                grpname = group_id,
                colname = colname,
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
      col_positions <- cumsum(c(1L, vapply(header_rows[[i]]$cells, function(cell) cell$colspan %||% 1L, integer(1L))))
      paste0(
        "table.header(",
        paste(
          vapply(
            seq_along(header_rows[[i]]$cells),
            function(j) {
              typst_render_cell_spec(
                header_rows[[i]]$cells[[j]],
                row_index = i - 1L,
                col_start = col_positions[[j]],
                fill_plan = fill_plan
              )
            },
            character(1L)
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
      col_positions <- cumsum(c(1L, vapply(body_rows[[i]]$cells, function(cell) cell$colspan %||% 1L, integer(1L))))
      paste(
        vapply(
          seq_along(body_rows[[i]]$cells),
          function(j) {
            typst_render_cell_spec(
              body_rows[[i]]$cells[[j]],
              row_index = header_count + i - 1L,
              col_start = col_positions[[j]],
              fill_plan = fill_plan
            )
          },
          character(1L)
        ),
        collapse = ", "
      )
    },
    character(1L)
  )
}

typst_render_cell_spec <- function(cell, row_index, col_start, fill_plan) {

  style_obj <- cell$style %||% list()
  suppress_fill <- typst_fill_is_lifted(
    fill_plan = fill_plan,
    row_index = row_index,
    col_start = col_start,
    colspan = cell$colspan %||% 1L,
    style_obj = style_obj
  )
  suppress_stroke <- typst_stroke_is_lifted(
    fill_plan = fill_plan,
    row_index = row_index,
    col_start = col_start,
    colspan = cell$colspan %||% 1L,
    style_obj = style_obj
  )

  typst_span_cell(
    text = cell$text,
    style_obj = style_obj,
    colspan = cell$colspan %||% 1L,
    align = cell$align,
    strong = isTRUE(cell$strong),
    suppress_fill = suppress_fill,
    suppress_stroke = suppress_stroke
  )
}

typst_span_cell <- function(text, style_obj = NULL, colspan = 1L, align = NULL, strong = FALSE, suppress_fill = FALSE, suppress_stroke = FALSE) {

  effective_align <-
    typst_cell_align_expr(
      h_align = align %||% style_obj[["cell_text"]][["align"]] %||% NULL,
      v_align = style_obj[["cell_text"]][["v_align"]] %||% NULL
    )
  stroke_expr <- typst_stroke_expr(style_obj)

  modifiers <- c(
    if (colspan > 1L) paste0("colspan: ", colspan),
    if (!is.null(effective_align)) paste0("align: ", effective_align),
    if (!suppress_fill && !is.null(style_obj[["cell_fill"]][["color"]])) {
      paste0("fill: ", typst_color_expr(style_obj[["cell_fill"]][["color"]]))
    },
    if (!suppress_stroke && !is.null(stroke_expr)) paste0("stroke: ", stroke_expr)
  )

  content <- typst_styled_content_expr(text = text, style_obj = style_obj, strong = strong)

  if (length(modifiers) == 0) {
    return(content)
  }

  paste0("table.cell(", paste(modifiers, collapse = ", "), ")", content)
}

typst_note_block <- function(text, style_obj = NULL) {
  typst_render_block_or_text(
    text = text,
    style_obj = style_obj,
    force_block = TRUE
  )
}

typst_region_component <- function(components, spacing = "0.35em", force_stack = FALSE) {

  components <- components[!is.na(components) & nzchar(components)]

  if (length(components) == 0L) {
    return(character(0L))
  }

  if (length(components) == 1L && !isTRUE(force_stack)) {
    return(components[[1L]])
  }

  paste0(
    "stack(dir: ttb, spacing: ", spacing, ", ",
    paste(vapply(components, typst_component_argument, character(1L)), collapse = ", "),
    ")"
  )
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
  inner <-
    typst_inner_from_content_expr(
      typst_content_expr(
        typst_apply_whitespace(
          text = typst_apply_text_transform(text, style_obj),
          whitespace = style_obj[["cell_text"]][["whitespace"]] %||% NULL
        )
      )
    )

  font <- style_obj[["cell_text"]][["font"]]
  weight <- style_obj[["cell_text"]][["weight"]]
  style <- style_obj[["cell_text"]][["style"]]
  stretch <- style_obj[["cell_text"]][["stretch"]]
  decorate <- style_obj[["cell_text"]][["decorate"]]
  color <- style_obj[["cell_text"]][["color"]]
  size <- style_obj[["cell_text"]][["size"]]
  weight_expr <- typst_weight_expr(weight)
  if (!is.null(color)) {
    inner <- paste0("#text(fill: ", typst_color_expr(color), ")[", inner, "]")
  }

  inner <- typst_apply_text_decoration(inner, decorate)

  if (!is.null(style) && style %in% c("italic", "oblique")) {
    inner <- paste0("#emph[", inner, "]")
  }

  if ((isTRUE(strong) && is.null(weight_expr)) || (typst_is_bold_weight(weight) && is.null(weight_expr))) {
    inner <- paste0("#strong[", inner, "]")
  }

  font_expr <- typst_font_expr(font)
  stretch_expr <- typst_stretch_expr(stretch)
  outer_text_args <- typst_text_args(
    size = if (!is.null(size)) typst_size_expr(size) else NULL,
    font = font_expr,
    stretch = stretch_expr,
    weight = weight_expr
  )

  if (length(outer_text_args) > 0L) {
    inner <- paste0("#text(", paste(outer_text_args, collapse = ", "), ")[", inner, "]")
  }

  paste0("[", inner, "]")
}

typst_text_args <- function(fill = NULL, size = NULL, font = NULL, stretch = NULL, weight = NULL) {
  c(
    if (!is.null(fill)) paste0("fill: ", fill),
    if (!is.null(size)) paste0("size: ", size),
    if (!is.null(font)) paste0("font: ", font),
    if (!is.null(stretch)) paste0("stretch: ", stretch),
    if (!is.null(weight)) paste0("weight: ", weight)
  )
}

typst_apply_whitespace <- function(text, whitespace = NULL) {

  text <- text %||% ""

  if (is.null(whitespace) || identical(whitespace, "normal") || !nzchar(text)) {
    return(text)
  }

  whitespace <- as.character(whitespace)[1]

  switch(
    whitespace,
    nowrap = typst_nowrap_text(text),
    pre = typst_preserve_text(text, wrap = FALSE),
    "pre-wrap" = typst_preserve_text(text, wrap = TRUE),
    text
  )
}

typst_nowrap_text <- function(text) {

  text <- gsub("\r\n?", "\n", text)
  text <- gsub("\n+", " ", text)
  gsub(" ", "~", text, fixed = TRUE)
}

typst_preserve_text <- function(text, wrap = TRUE) {

  text <- gsub("\r\n?", "\n", text)
  lines <- strsplit(text, "\n", fixed = TRUE)[[1]]

  rendered_lines <-
    vapply(lines, typst_preserve_line, character(1L), wrap = wrap, USE.NAMES = FALSE)

  paste(rendered_lines, collapse = "#linebreak()")
}

typst_preserve_line <- function(text, wrap = TRUE) {

  if (!nzchar(text)) {
    return("")
  }

  chars <- strsplit(text, "", fixed = TRUE)[[1]]
  out <- character(0L)
  i <- 1L

  while (i <= length(chars)) {

    if (identical(chars[[i]], " ")) {
      j <- i

      while (j <= length(chars) && identical(chars[[j]], " ")) {
        j <- j + 1L
      }

      run_length <- j - i

      out <- c(
        out,
        if (wrap && run_length > 0L) {
          paste0(" ", strrep("~", max(0L, run_length - 1L)))
        } else {
          strrep("~", run_length)
        }
      )

      i <- j
      next
    }

    if (identical(chars[[i]], "\t")) {
      out <- c(
        out,
        if (wrap) " ~" else "~~"
      )
      i <- i + 1L
      next
    }

    out <- c(out, chars[[i]])
    i <- i + 1L
  }

  paste0(out, collapse = "")
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
  col_match <-
    if (is.null(colname) || is.na(colname)) {
      is.na(styles_tbl$colname)
    } else {
      styles_tbl$colname == colname
    }

  styles_df <-
    vctrs::vec_slice(
      styles_tbl,
      styles_tbl$locname == locname &
        styles_tbl$grpname == grpname &
        col_match
    )

  if (!is.null(rownum) && nrow(styles_df) > 1L && "rownum" %in% names(styles_df)) {
    row_targets <- sort(unique(styles_df$rownum))
    row_target <- row_targets[[min(rownum, length(row_targets))]]
    styles_df <- vctrs::vec_slice(styles_df, styles_df$rownum == row_target)
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

typst_render_block_or_text <- function(text, style_obj = NULL, force_block = FALSE) {
  style_obj <- style_obj %||% list()
  modifiers <- typst_block_modifiers(style_obj)
  rendered <- typst_render_block_text(text = text, style_obj = style_obj)
  rendered <- typst_wrap_block_region(rendered, style_obj)

  if (identical(modifiers, "") && !isTRUE(force_block)) {
    return(rendered)
  }

  paste0("block", modifiers, "[", rendered, "]")
}

typst_make_figure_breakable <- function(component, kind) {
  paste0(
    "context {\n",
    "  show figure.where(kind: ", kind, "): set block(breakable: true)\n",
    "  ", gsub("\n", "\n  ", component, fixed = TRUE), "\n",
    "}"
  )
}

typst_resolve_label <- function(data, label = NULL, quarto = FALSE) {

  if (isFALSE(label)) {
    return(NULL)
  }

  label_value <-
    if (is.null(label)) {
      dt_options_get_value(data = data, option = "table_id")
    } else {
      label
    }

  if (length(label_value) == 0L || all(is.na(label_value))) {
    return(NULL)
  }

  label_value <- as.character(label_value)[1]
  label_value <- gsub("[^A-Za-z0-9_.:-]+", "-", label_value)
  label_value <- gsub("^-+|-+$", "", label_value)
  label_value <- gsub("-{2,}", "-", label_value)

  if (!nzchar(label_value)) {
    return(NULL)
  }

  if (quarto && !startsWith(label_value, "tbl-")) {
    label_value <- paste0("tbl-", label_value)
  }

  label_value
}

typst_block_modifiers <- function(style_obj = NULL) {
  style_obj <- style_obj %||% list()
  stroke_expr <- typst_stroke_expr(style_obj)
  args <- c(
    if (!is.null(style_obj[["cell_fill"]][["color"]])) {
      paste0("fill: ", typst_color_expr(style_obj[["cell_fill"]][["color"]]))
    },
    if (!is.null(stroke_expr)) {
      paste0("stroke: ", stroke_expr)
    },
    if (!is.null(style_obj[["cell_fill"]][["color"]]) || !is.null(stroke_expr)) {
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

typst_apply_text_decoration <- function(inner, decorate = NULL) {

  if (is.null(decorate) || !nzchar(decorate)) {
    return(inner)
  }

  decorate_parts <- strsplit(decorate, "\\s+")[[1]]

  for (part in decorate_parts) {
    inner <-
      switch(
        part,
        underline = paste0("#underline[", inner, "]"),
        overline = paste0("#overline[", inner, "]"),
        "line-through" = paste0("#strike[", inner, "]"),
        inner
      )
  }

  inner
}

typst_is_bold_weight <- function(weight) {

  if (is.null(weight)) {
    return(FALSE)
  }

  if (is.numeric(weight)) {
    return(weight >= 600)
  }

  weight %in% c("bold", "bolder")
}

typst_weight_expr <- function(weight) {

  if (is.null(weight)) {
    return(NULL)
  }

  if (is.numeric(weight)) {
    mapped <-
      dplyr::case_when(
        weight <= 200 ~ "\"light\"",
        weight <= 400 ~ "\"regular\"",
        weight <= 500 ~ "\"medium\"",
        weight <= 600 ~ "\"semibold\"",
        weight <= 800 ~ "\"bold\"",
        TRUE ~ "\"black\""
      )

    return(mapped[[1L]])
  }

  switch(
    as.character(weight)[1],
    lighter = "\"light\"",
    normal = NULL,
    bold = "\"bold\"",
    bolder = "\"black\"",
    NULL
  )
}

typst_font_expr <- function(font) {

  if (is.null(font) || length(font) == 0L) {
    return(NULL)
  }

  fonts <- as.character(font)
  if (length(fonts) == 1L && grepl(",", fonts, fixed = TRUE)) {
    fonts <- trimws(unlist(strsplit(fonts, ",", fixed = TRUE)))
  }
  fonts <- gsub("^['\"]|['\"]$", "", fonts)
  fonts <- fonts[!is.na(fonts) & nzchar(fonts)]

  if (length(fonts) == 0L) {
    return(NULL)
  }

  fonts <- gsub("\\\\", "\\\\\\\\", fonts)
  fonts <- gsub("\"", "\\\\\"", fonts, fixed = TRUE)
  font_items <- paste0("\"", fonts, "\"")

  if (length(font_items) == 1L) {
    return(font_items)
  }

  paste0("(", paste(font_items, collapse = ", "), ")")
}

typst_stretch_expr <- function(stretch) {

  if (is.null(stretch) || length(stretch) == 0L) {
    return(NULL)
  }

  if (is.numeric(stretch)) {
    stretch_value <- as.numeric(stretch)[1]
    if (is.na(stretch_value)) {
      return(NULL)
    }
    return(paste0(formatC(stretch_value, digits = 15, format = "fg"), "%"))
  }

  stretch <- as.character(stretch)[1]

  if (grepl("^[0-9.]+%$", stretch)) {
    return(stretch)
  }

  mapped_values <- c(
    "ultra-condensed" = "50%",
    "extra-condensed" = "62.5%",
    "condensed" = "75%",
    "semi-condensed" = "87.5%",
    "normal" = "100%",
    "semi-expanded" = "112.5%",
    "expanded" = "125%",
    "extra-expanded" = "150%",
    "ultra-expanded" = "200%"
  )

  mapped <- unname(mapped_values[stretch])

  if (length(mapped) == 1L && !is.na(mapped)) {
    return(mapped)
  }

  NULL
}

typst_wrap_block_region <- function(rendered, style_obj = NULL) {

  style_obj <- style_obj %||% list()
  align <- typst_cell_align_expr(style_obj[["cell_text"]][["align"]] %||% NULL, NULL)
  indent <- style_obj[["cell_text"]][["indent"]]

  if (!is.null(indent)) {
    rendered <- paste0("#pad(left: ", typst_length_expr(indent), ")[", rendered, "]")
  }

  if (!is.null(align) && align %in% c("left", "center", "right")) {
    rendered <- paste0("#align(", align, ")[", rendered, "]")
  }

  rendered
}

typst_cell_align_expr <- function(h_align = NULL, v_align = NULL) {

  h_expr <-
    switch(
      h_align %||% "",
      left = "left",
      center = "center",
      right = "right",
      NULL
    )

  v_expr <-
    switch(
      v_align %||% "",
      top = "top",
      middle = "horizon",
      bottom = "bottom",
      NULL
    )

  if (!is.null(h_expr) && !is.null(v_expr)) {
    return(paste0(v_expr, " + ", h_expr))
  }

  h_expr %||% v_expr
}

typst_size_expr <- function(size) {
  if (is.null(size)) {
    return("1em")
  }

  if (is.numeric(size)) {
    return(paste0(formatC(size * 0.75, digits = 15, format = "fg"), "pt"))
  }

  size <- as.character(size)[1]
  mapped_values <- c(
    "xx-small" = "0.6em",
    "x-small" = "0.75em",
    "small" = "0.9em",
    "medium" = "1em",
    "large" = "1.2em",
    "x-large" = "1.4em",
    "xx-large" = "1.7em",
    "xxx-large" = "2em"
  )
  mapped <- unname(mapped_values[size])

  if (length(mapped) == 1L && !is.na(mapped)) {
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

  # Preserve explicit per-side borders exactly as resolved from `gt` styles.
  # If neighboring cells both specify a shared edge, emit both; do not
  # suppress or merge borders heuristically in the Typst renderer.
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

typst_row_fill_color <- function(fill_values) {
  fills <- unique(fill_values[nzchar(fill_values)])
  if (length(fills) == 1L && length(fill_values) > 0L && all(nzchar(fill_values))) {
    return(fills[[1L]])
  }
  ""
}

typst_expand_row_fill_values <- function(row, n_cols) {

  fills <- character(0L)

  for (cell in row$cells) {
    fill_color <- cell$style[["cell_fill"]][["color"]] %||% ""
    fills <- c(fills, rep(fill_color, cell$colspan %||% 1L))
  }

  if (length(fills) < n_cols) {
    fills <- c(fills, rep("", n_cols - length(fills)))
  }

  fills[seq_len(n_cols)]
}

typst_table_fill_plan <- function(header_rows, body_rows, n_cols) {

  all_rows <- c(header_rows, body_rows)

  if (length(all_rows) == 0L) {
    return(list(fill_spec = NULL, row_fill_map = list(), col_fill_map = list(), default_fill = NULL, header_rows = seq_along(header_rows)))
  }

  fill_grid <-
    do.call(
      rbind,
      lapply(all_rows, typst_expand_row_fill_values, n_cols = n_cols)
    )
  stroke_grid <-
    do.call(
      rbind,
      lapply(all_rows, typst_expand_row_stroke_values, n_cols = n_cols)
    )

  default_fill <- NULL
  body_data_idx <- which(vapply(body_rows, `[[`, character(1L), "row_kind") == "data")
  if (length(body_data_idx) > 0L) {
    data_grid <- fill_grid[length(header_rows) + body_data_idx, , drop = FALSE]
    data_fills <- unique(data_grid[nzchar(data_grid)])
    if (length(data_fills) == 1L && all(nzchar(data_grid)) && all(data_grid == data_fills[[1L]])) {
      default_fill <- data_fills[[1L]]
      fill_grid[length(header_rows) + body_data_idx, ] <- ""
    }
  }

  row_fill_map <- list()
  for (i in seq_len(nrow(fill_grid))) {
    fill_color <- typst_row_fill_color(fill_grid[i, ])
    if (nzchar(fill_color)) {
      row_fill_map[[as.character(i - 1L)]] <- fill_color
      fill_grid[i, ] <- ""
    }
  }

  col_fill_map <- list()
  for (j in seq_len(n_cols)) {
    col_vals <- fill_grid[, j]
    fills <- unique(col_vals[nzchar(col_vals)])
    if (length(fills) == 1L && all(col_vals == "" | col_vals == fills[[1L]]) && any(nzchar(col_vals))) {
      col_fill_map[[as.character(j - 1L)]] <- fills[[1L]]
      fill_grid[, j] <- ""
    }
  }

  clauses <- character(0L)

  if (length(row_fill_map) > 0L) {
    row_ids <- as.integer(names(row_fill_map))
    clauses <- c(
      clauses,
      vapply(
        seq_along(row_ids),
        FUN.VALUE = character(1L),
        FUN = function(i) {
          paste0("if y == ", row_ids[[i]], " { ", typst_color_expr(row_fill_map[[i]]), " }")
        }
      )
    )
  }

  if (length(col_fill_map) > 0L) {
    col_ids <- as.integer(names(col_fill_map))
    clauses <- c(
      clauses,
      vapply(
        seq_along(col_ids),
        FUN.VALUE = character(1L),
        FUN = function(i) {
          paste0("if x == ", col_ids[[i]], " { ", typst_color_expr(col_fill_map[[i]]), " }")
        }
      )
    )
  }

  if (!is.null(default_fill)) {
    clauses <- c(clauses, paste0("{ ", typst_color_expr(default_fill), " }"))
  } else {
    clauses <- c(clauses, "{ none }")
  }

  fill_spec <-
    if (length(clauses) > 1L) {
      paste0("(x, y) => ", paste(clauses[-length(clauses)], collapse = " else "), " else ", clauses[[length(clauses)]])
    } else if (!is.null(default_fill)) {
      typst_color_expr(default_fill)
    } else {
      NULL
    }

  stroke_values <- unique(stroke_grid[nzchar(stroke_grid)])
  stroke_spec <-
    if (
      length(stroke_values) == 1L &&
        length(stroke_grid) > 0L &&
        all(nzchar(stroke_grid))
    ) {
      stroke_values[[1L]]
    } else {
      NULL
    }

  list(
    fill_spec = fill_spec,
    stroke_spec = stroke_spec,
    row_fill_map = row_fill_map,
    col_fill_map = col_fill_map,
    default_fill = default_fill,
    header_rows = seq_along(header_rows)
  )
}

typst_fill_is_lifted <- function(fill_plan, row_index, col_start, colspan, style_obj) {
  fill_color <- style_obj[["cell_fill"]][["color"]] %||% ""

  if (!nzchar(fill_color)) {
    return(FALSE)
  }

  row_lifted <- fill_plan$row_fill_map[[as.character(row_index)]]
  if (!is.null(row_lifted) && identical(fill_color, row_lifted)) {
    return(TRUE)
  }

  cols <- seq.int(col_start - 1L, length.out = colspan)
  col_lifted <- vapply(cols, function(col) fill_plan$col_fill_map[[as.character(col)]] %||% "", character(1L))

  if (length(col_lifted) > 0L && all(nzchar(col_lifted)) && all(col_lifted == fill_color)) {
    return(TRUE)
  }

  if (!is.null(fill_plan$default_fill) && identical(fill_color, fill_plan$default_fill)) {
    return(TRUE)
  }

  FALSE
}

typst_expand_row_stroke_values <- function(row, n_cols) {

  strokes <- character(0L)

  for (cell in row$cells) {
    stroke_value <- typst_stroke_expr(cell$style)
    strokes <- c(strokes, rep(stroke_value %||% "", cell$colspan %||% 1L))
  }

  if (length(strokes) < n_cols) {
    strokes <- c(strokes, rep("", n_cols - length(strokes)))
  }

  strokes[seq_len(n_cols)]
}

typst_stroke_is_lifted <- function(fill_plan, row_index, col_start, colspan, style_obj) {

  stroke_expr <- typst_stroke_expr(style_obj)

  if (is.null(fill_plan$stroke_spec) || is.null(stroke_expr)) {
    return(FALSE)
  }

  identical(fill_plan$stroke_spec, stroke_expr)
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

  paste0(
    "#stack(dir: ttb, spacing: 0.9em",
    if (length(components) > 0L) ", " else "",
    paste(vapply(components, typst_component_argument, character(1L)), collapse = ", "),
    ")"
  )
}

typst_compose_content <- function(components) {

  components <- components[!is.na(components) & nzchar(components)]

  if (length(components) == 0) {
    return("[]")
  }

  if (length(components) == 1L) {
    return(typst_component_argument(components[[1L]]))
  }

  paste0(
    "stack(dir: ttb, spacing: 0.9em, ",
    paste(vapply(components, typst_component_argument, character(1L)), collapse = ", "),
    ")"
  )
}

typst_component_needs_eval <- function(component) {

  if (startsWith(component, "#")) {
    return(FALSE)
  }

  if (startsWith(component, "[")) {
    return(FALSE)
  }

  grepl("^[A-Za-z][A-Za-z0-9_.]*\\s*(\\(|\\[|\\{)", component)
}

typst_component_argument <- function(component) {

  if (startsWith(component, "#")) {
    component <- sub("^#", "", component)
  }

  if (startsWith(component, "[")) {
    return(component)
  }

  if (typst_component_needs_eval(component)) {
    return(component)
  }

  typst_content_expr(component)
}

typst_content_block_argument <- function(component) {

  if (startsWith(component, "[")) {
    return(component)
  }

  if (startsWith(component, "#")) {
    component <- sub("^#", "", component)
  }

  rendered <-
    if (typst_component_needs_eval(component)) {
      paste0("#", component)
    } else {
      component
    }

  paste0(
    "[\n  ",
    gsub("\n", "\n  ", rendered, fixed = TRUE),
    "\n]"
  )
}

typst_quarto_caption_markdown <- function(caption) {

  caption_text <- as.character(caption)[1]

  if (is.na(caption_text) || !nzchar(caption_text)) {
    return("")
  }

  caption_text
}
