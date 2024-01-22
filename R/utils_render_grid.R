
create_caption_component_g <- function(data) {

  table_caption <- dt_options_get_value(data = data, option = "table_caption")
  if (all(is.na(table_caption))) {
    return(NULL)
  }
  n_cols_total <- get_effective_number_of_columns(data = data)
  vctrs::data_frame(
    left = 1, right = n_cols_total,
    label = table_caption,
    classes = list(c("gt_caption", "gt_center")),
    style = list(NA),
    bottom = 1, top = 1
  )
}

create_heading_component_g <- function(data) {

  if (!dt_heading_has_title(data = data)) {
    return(NULL)
  }

  heading <- dt_heading_get(data = data)
  heading[lengths(heading) == 0] <- list("")

  styles_tbl <- dt_styles_get(data = data)
  subtitle_defined <- dt_heading_has_subtitle(data = data)

  footnotes_tbl <- dt_footnotes_get(data = data)
  footnote_title_marks <- NULL

  title_styles <- NA_character_
  if ("title" %in% styles_tbl$locname) {
    title_style_rows <- dplyr::filter(styles_tbl, locname == "title")
    if (nrow(title_style_rows) > 0) {
      title_styles <- title_style_rows$html_style
    }
  }

  subtitle_styles <- NA_character_
  if (subtitle_defined && "subtitle" %in% styles_tbl$locname) {
    subtitle_style_rows <- dplyr::filter(styles_tbl, locname == "subtitle")
    if (nrow(subtitle_style_rows) > 0) {
      subtitle_styles <- subtitle_style_rows$html_style
    }
  }

  if ("title" %in% footnotes_tbl$locname) {
    footnote_title_marks <-
      coalesce_marks(
        fn_tbl = footnotes_tbl,
        locname = "title"
      )
    browser()
  }
  if (subtitle_defined && "subtitle" %in% footnotes_tbl$locname) {
    footnote_subtitle_marks <-
      coalesce_marks(
        fn_tbl = footnotes_tbl,
        locname = "subtitle"
      )
    browser()
  }

  title_classes <- c("gt_heading", "gt_title", "gt_font_normal")
  subtitle_classes <- tidy_sub(title_classes, "title", "subtitle")

  if (!subtitle_defined) {
    title_classes <- c(title_classes, "gt_bottom_border")
  } else {
    subtitle_classes <- c(subtitle_classes, "gt_bottom_border")
  }

  n_cols_total <- get_effective_number_of_columns(data = data)

  out <- vctrs::data_frame(
    left = 1, right = n_cols_total,
    label = c(heading$title, heading$subtitle),
    classes = list(title_classes, subtitle_classes),
    style = list(title_styles, subtitle_styles),
    bottom = c(1, 2),
    top = c(1, 2)
  )
  vctrs::vec_slice(out, nzchar(out$label))
}

create_columns_component_g <- function(data) {

  column_labels_hidden <-
    dt_options_get_value(
      data = data,
      option = "column_labels_hidden"
    )

  if (column_labels_hidden) {
    return(NULL)
  }

  stubh <- dt_stubhead_get(data = data)
  styles_tbl <- dt_styles_get(data = data)
  body <- dt_body_get(data = data)

  stub_layout <- get_stub_layout(data = data)
  spanner_row_count <-
    dt_spanners_matrix_height(
      data = data,
      omit_columns_row = TRUE
    )

  cols_alignment <- dt_boxhead_get_vars_align_default(data = data)

  rtl_detect <-
    vapply(
      body[dt_boxhead_get_vars_default(data = data)],
      FUN.VALUE = logical(1),
      USE.NAMES = FALSE,
      FUN = function(x) {
        any(grepl(rtl_modern_unicode_charset, x))
      }
    )

  to_right <- rtl_detect & cols_alignment != "center"
  cols_alignment[to_right] <- "right"

  headings_vars <- dt_boxhead_get_vars_default(data = data)
  headings_labels <- dt_boxhead_get_vars_labels_default(data = data)

  stubhead_style_attrs <- subset(styles_tbl, locname == "stubhead")
  spanner_style_attrs  <- subset(styles_tbl, locname == "columns_groups")
  column_style_attrs   <- subset(styles_tbl, locname == "columns_columns")

  # Layout stubhead
  stubhead_cell <- NULL
  if (length(stub_layout) > 0) {
    stub_style <- NA
    if (nrow(stubhead_style_attrs) > 0) {
      stub_style <- stubhead_style_attrs$html_style %||% NA
    }

    stubhead_cell <- vctrs::data_frame(
      left = 1, right = length(stub_layout),
      label = stubh$label,
      classes = list(c("gt_col_heading", "gt_columns_bottom_border", "gt_left")),
      style = as.list(stub_style),
      bottom = spanner_row_count + 1,
      top = 1
    )
  }

  spanner_cells <- NULL

  if (spanner_row_count > 0) {

    spanners <-
      dt_spanners_print_matrix(
        data = data,
        include_hidden = FALSE
      )

    spanner_ids <-
      dt_spanners_print_matrix(
        data = data,
        include_hidden = FALSE,
        ids = TRUE
      )

    index <- match(t(spanner_ids), t(spanner_ids))

    rle <- vctrs::vec_unrep(
      vctrs::data_frame(
        spanner = index,
        row = as.vector(col(t(spanners)))
      )
    )
    rle$end <- stats::ave(rle$times, rle$key$row, FUN = cumsum)
    rle$start <- rle$end - rle$times + 1
    rle <- vctrs::vec_slice(rle, rle$key$row != spanner_row_count + 1)
    rle <- vctrs::vec_slice(rle, !is.na(t(spanners)[rle$key$spanner]))

    spanner_style <- NA
    if (nrow(spanner_style_attrs) > 0) {
      spanner_style <-
        dplyr::filter(
          spanner_style_attrs,
          locname == "column_groups",
          grpname == t(spanner_ids)[rle$key$spanner]
        )
      spanner_style <- spanner_style$html_style
    }

    classes <- rep(list(c("gt_center", "gt_column_spanner")), nrow(rle))
    at_top <- rle$key$row == 1
    classes[at_top] <- lapply(
      classes[at_top], c,
      c("gt_columns_top_border", "gt_columns_spanner_outer")
    )

    spanner_cells <- vctrs::data_frame(
      left = rle$start + length(stub_layout),
      right = rle$end + length(stub_layout),
      label = t(spanners)[rle$key$spanner],
      classes = classes,
      style = as.list(spanner_style),
      bottom = rle$key$row, top = rle$key$row
    )
  }

  column_cells <- NULL
  column_style <-
    dplyr::filter(
      column_style_attrs,
      locname == "columns_columns",
      colnum  == seq_along(headings_vars)
    )
  if (nrow(column_style) < 1) {
    column_style <- NA
  }

  classes <- c("gt_col_heading", "gt_columns_bottom_border",
               paste0("gt_", cols_alignment))
  classes <- rep(list(classes), length(headings_vars))

  column_cells <- vctrs::data_frame(
    left  = seq_along(headings_vars) + length(stub_layout),
    right = seq_along(headings_vars) + length(stub_layout),
    label = headings_labels,
    classes = classes,
    style = as.list(column_style),
    top = spanner_row_count + 1,
    bottom = spanner_row_count + 1
  )

  vctrs::vec_c(stubhead_cell, spanner_cells, column_cells)
}

create_body_component_g <- function(data) {

  summaries_present <- dt_summary_exists(data = data)
  list_of_summaries <- dt_summary_df_get(data = data)
  groups_rows_df    <- dt_groups_rows_get(data = data)
  styles_tbl <- dt_styles_get(data = data)

  cell_matrix <- get_body_component_cell_matrix(data = data)

  n_rows       <- nrow(cell_matrix)
  n_cols_total <- get_effective_number_of_columns(data = data)
  n_data_cols  <- get_number_of_visible_data_columns(data = data)
  n_stub_cols  <- n_cols_total - n_data_cols

  col_names_id <-
    c(paste0("stub_", seq_len(n_stub_cols), recycle0 = TRUE),
      dt_boxhead_get_vars_default(data = data))

  stub_layout <- get_stub_layout(data = data)
  has_stub_column  <- "rowname"     %in% stub_layout
  has_two_col_stub <- "group_label" %in% stub_layout

  col_alignment <-
    c(dt_boxhead_get_alignments_in_stub(data = data),
      dt_boxhead_get_vars_align_default(data = data))
  alignment_classes <- paste0("gt_", col_alignment)

  if (anyNA(groups_rows_df$group_label)) {
    groups_rows_df <-
      dplyr::mutate(
        groups_rows_df,
        group_label = ifelse(is.na(group_label), "", group_label)
      )
  }

  table_stub_striped <-
    dt_options_get_value(data = data, option = "row_striping_include_stub")
  table_body_striped <-
    dt_options_get_value(data = data, option = "row_striping_include_table_body")
  extra_classes_1 <- rep_len(list("gt_row"), n_cols_total)
  extra_classes_2 <-
    rep_len(list(if (table_body_striped) "gt_striped" else "gt_row"), n_cols_total)

  if (length(stub_layout) > 0) {
    if ("rowname" %in% stub_layout) {
      row_label_col <- which(stub_layout == "rowname")
      extra_classes_1[row_label_col] <- list("gt_stub", "gt_row")
      extra_classes_2[row_label_col] <-
        list("gt_stub", "gt_row", if (table_stub_striped) "gt_striped" else NULL)
    }
  }

  row_span_vals <- rep_len(NA_integer_, n_cols_total)
  current_group_id <- character(0)
  n_groups <- nrow(groups_rows_df)

  group_headings <- lapply(
    seq_len(n_groups),
    function(i) {
      group_id <- groups_rows_df[["group_id"]][[i]]
      group_label <- groups_rows_df[["group_label"]][[i]]

      if (is.null(group_id) || has_two_col_stub) {
        return(NULL)
      }

      row_style_row_groups_tbl <-
        dt_styles_pluck(
          styles_tbl = styles_tbl,
          locname = "row_groups",
          grpname = group_id
        )

      row_style_group_heading_row <- row_style_row_groups_tbl[["grid_style"]]

      group_class <-
        if (group_label == "") {
          "gt_empty_group_heading"
        } else {
          "gt_group_heading"
        }

      browser()

    }
  )

  # Compute summary tables
  grand_summary_side <- summary_row_side(data = data, group_id = grand_summary_col)
  grand_summaries <-
    summary_rows_g(
      data = data,
      group_id = grand_summary_col,
      side_grand_summary = grand_summary_side
    )
  group_summaries <-
    summary_rows_g(data = data, group_id = groups_rows_df$group_id)
  summary_locations <- ifelse(
    groups_rows_df$summary_row_side == "top",
    groups_rows_df[["row_start"]],
    groups_rows_df[["row_end"]]
  )

  # Compute body rows
  has_rtl <- grepl(rtl_modern_unicode_charset, cell_matrix)
  non_center_alignments <- alignment_classes != "gt_center"

  cell_rows <- as.vector(row(cell_matrix))
  cell_cols <- as.vector(col(cell_matrix))
  cell_df <- vctrs::data_frame(
    left = cell_cols, right = cell_cols,
    label = as.vector(cell_matrix),
    classes = as.list(ifelse(
      has_rtl & rep(non_center_alignments, nrow(cell_matrix)),
      "gt_right", alignment_classes[cell_cols]
    )),
    style = list(NULL)
  )

  body_rows <- vctrs::vec_split(cell_df, cell_rows)$val

  group_ids <- rep_len(NA_character_, n_rows)
  row_classes <- rep_len(NA_character_, n_rows)

  idx <- is.na(groups_rows_df$group_id)
  groups_rows_df$group_id[idx] <- "NA"
  groups_rows_df$group_label[idx] <- "NA"

  group_idx <- rep(list(NULL), n_rows)
  group_ids <- rep_len(NA_character_, n_rows)
  for(i in seq_len(n_groups)) {
    start <- groups_rows_df$row_start[[i]]
    end <- groups_rows_df$row_end[[i]]
    group_idx[seq(start, end)] <- i
    group_ids[seq(start, end)] <- groups_rows_df$group_id[[i]]
  }
  groups_list <- as.list(groups_rows_df)

  for (i in seq_len(n_rows)) {
    this_row <- body_rows[[i]]

    row_span_vals_i <- row_span_vals

    g <- group_idx[[i]]
    group_id <- groups_list$group_id[g]
    group_row_start <- groups_list$row_start[g]
    group_row_end   <- groups_list$row_end[g]
    group_has_summary_rows <- groups_list$has_summary_rows[g]
    group_summary_row_side <- groups_list$summary_row_side[g]

    group_start <- !is.null(g) && group_row_start == i

    extra_classes <- if (i %% 2 == 0) extra_classes_2 else extra_classes_1

    indentation_stub <-
      dt_stub_indentation_at_position(
        data = data,
        i = i
      )

    if (!is.null(indentation_stub) && indentation_stub != 0) {
      extra_classes[[row_label_col]] <- c(
        extra_classes[[row_label_col]],
        paste0("gt_indent_", indentation_stub)
      )
    }

    styles_row <-
      dt_styles_pluck(
        styles_tbl = styles_tbl,
        locname = c("data", "stub"),
        rownum = i
      )

    row_styles <-
      build_row_styles(
        styles_resolved_row = styles_row,
        include_stub = has_stub_column,
        n_cols = n_data_cols
      )

    if (has_two_col_stub) {
      extra_classes[[1]] <- c(extra_classes[[1]], "gt_stub_row_group")
      summary_rows_group_df <-
        list_of_summaries[["summary_df_display_list"]][[group_id]]

      if (!is.null(summary_rows_group_df) && "rowname" %in% stub_layout) {
        summary_row_count <- nrow(summary_rows_group_df)
      } else {
        summary_row_count <- 0L
      }

      if (!(i %in% summary_locations && group_summary_row_side == "top")) {
        row_span_vals_i[[i]] <-
          group_row_end - group_row_start + 1 + summary_row_count
      }

      row_style_row_groups_tbl <-
        dt_styles_pluck(
          styles_tbl = styles_tbl,
          locname = "row_groups",
          grpname = group_id
        )
      row_style_group_heading_row <- row_style_row_groups_tbl[["grid_style"]]
      if (is_empty(row_style_group_heading_row)) {
        row_style_group_heading_row <- NA_character_
      }
      row_styles <- c(row_style_group_heading_row, row_styles)
    }

    this_row$classes <- Map(c, this_row$classes, extra_classes)
    this_row$style <- as.list(row_styles)

    if (
      summaries_present &&
      !is.null(group_has_summary_rows) &&
      group_has_summary_rows &&
      has_two_col_stub &&
      !is.null(group_summary_row_side) &&
      !is.na(group_summary_row_side) &&
      group_summary_row_side == "top"
    ) {
      if (group_start) {
        group_summaries[[g]] <- vctrs::vec_c(
          vctrs::vec_slice(this_row, 1),
          group_summaries[[g]]
        )
      }
      this_row <- vctrs::vec_slice(this_row, -1)
    }
    body_rows[[i]] <- this_row
    if (group_start) {
      row_classes[i] <- "gt_row_group_first"
    }
  }

  if (n_rows == 0) {
    body_rows <- list()
  }

  # Weave summaries, headings and body
  row_start <- groups_rows_df$row_start
  row_end   <- groups_rows_df$row_end

  rows <- body_rows

  if (identical(group_summary_row_side, "top")) {
    rows <- insert_before(rows, row_start, group_summaries)
    row_start <- row_start + seq_along(row_start) - 1L
    row_end   <- row_end + seq_along(row_end)
  }

  rows <- insert_before(rows, row_start, group_headings)
  row_start <- row_start + seq_along(row_start) - 1L
  row_end <- row_end + seq_along(row_end)

  if (identical(group_summary_row_side, "bottom")) {
    rows <- insert_after(rows, row_end, group_summaries)
    row_start <- row_start + seq_along(row_start) - 1L
    row_end <- row_end + seq_along(row_end)
  }

  if (sum(vctrs::list_sizes(grand_summaries)) > 0) {
    if (grand_summary_side == "top") {
      rows <- c(grand_summaries, rows)
    } else {
      rows <- c(rows, grand_summaries)
    }

  }

  sizes <- vctrs::list_sizes(rows)
  row_num <- cumsum(sizes > 0)

  rows <- vctrs::vec_c(!!!rows)
  rows$top <- rows$bottom <- rep(row_num, sizes)
  rows
}

summary_rows_g <- function(data, group_id, side_grand_summary = "bottom") {
  groups_rows_df    <- dt_groups_rows_get(data = data)

  list_of_summaries <- dt_summary_df_get(data = data)
  summaries_present <- dt_summary_exists(data = data)
  styles_tbl <- dt_styles_get(data = data)

  needs_summary <-
    summaries_present &
    (groups_rows_df$has_summary_rows %||% FALSE) &
    !is.na(groups_rows_df$summary_row_side %||% FALSE) &
    ((groups_rows_df$summary_row_side %||% "left") %in% c("top", "bottom"))

  if (!any(needs_summary)) {
    rep(list(NULL), nrow(groups_rows_df))
  }

  groups_rows_df <- groups_rows_df[needs_summary, , drop = FALSE]

  group_summary_vars <- dt_boxhead_get_vars_default(data = data)
  summary_row_type <- rep("", nrow(groups_rows_df))

  group_type <- !is.na(group_id) &
    group_id %in% names(list_of_summaries$summary_df_display_list) &
    group_id != grand_summary_col

  grand_type <- !is.na(group_id) &
    group_id == grand_summary_col

  summary_row_type <- rep("", max(length(group_type), length(grand_type)))

  summary_row_type[grand_type] <- "grand"
  summary_row_type[group_type] <- "group"

  summary_df <- vctrs::vec_c(!!!list_of_summaries$summary_df_display_list[group_id])
  summary_df <-
    dplyr::select(
      summary_df,
      dplyr::all_of(rowname_col_private),
      dplyr::all_of(group_summary_vars)
    )

  if (identical(summary_row_type, "grand")) {
    summary_row_type <- rep(summary_row_type, nrow(summary_df))
  }

  stub_layout <- get_stub_layout(data = data)

  # n_col <- n_col_total <- get_effective_number_of_columns(data = data)
  n_data_cols <- get_number_of_visible_data_columns(data = data)
  ncol <- ncol(summary_df)
  left <- right <- col(summary_df) + as.integer(length(stub_layout) > 1)

  if (all(summary_row_type == "grand") && length(stub_layout) > 1) {
    left[, 1] <- left[, 1] - 1
  }

  extra_classes <- matrix(list("gt_row"), nrow = nrow(summary_df), ncol)
  # extra_classes[, 1] <- lapply(extra_classes[, 1], function(x) c("gt_stub", x))
  extra_classes[, 1] <- lapply(extra_classes[, 1], c, "gt_stub")

  col_alignment <- c("left", dt_boxhead_get_vars_align_default(data = data))
  alignment_classes <- paste0("gt_", col_alignment)

  extra_classes[] <- Map(
    extra_classes,
    alignment_classes[as.vector(col(extra_classes))],
    f = c
  )

  styles <- matrix(list(NULL), nrow = nrow(summary_df), ncol)

  for (i in seq_len(nrow(summary_df))) {

    last_row_class <- "gt_last_summary_row"

    if (summary_row_type[i] == "grand") {

      styles_resolved_row <-
        dt_styles_pluck(
          styles_tbl = styles_tbl,
          locname = "grand_summary_cells",
          grpname = group_id[i],
          rownum = i
        )

      summary_row_class <- "gt_grand_summary_row"
      first_row_class <- "gt_first_grand_summary_row"

      if (side_grand_summary == "top") {
        first_row_class <- "gt_grand_summary_row"
        last_row_class <- "gt_last_grand_summary_row_top"
      }

    } else {

      styles_resolved_row <-
        dt_styles_pluck(
          styles_tbl = styles_tbl,
          locname = "summary_cells",
          grpname = group_id[i],
          rownum = i
        )

      summary_row_class <- "gt_summary_row"

      first_row_class <-
        if ("rowname" %in% stub_layout) {
          "gt_first_summary_row thick"
        } else {
          "gt_first_summary_row"
        }
    }

    row_styles <-
      build_row_styles(
        styles_resolved_row = styles_resolved_row,
        include_stub = TRUE,
        n_cols = n_data_cols
      )

    extra_class <- extra_classes[i, ]
    extra_class <- lapply(extra_class, function(x) c(summary_row_class, x))
    # extra_class <- lapply(extra_class, c, summary_row_class)
    if (i == 1) {
      extra_class <- lapply(extra_class, c, first_row_class)
    }
    if (i == nrow(summary_df)) {
      extra_class <- lapply(extra_class, c, last_row_class)
    }
    extra_classes[i, ] <- extra_class
    styles[i, ] <- row_styles
  }

  out <- vctrs::data_frame(
    left    = undim(left), right = undim(right),
    label   = unlist(summary_df, use.names = FALSE),
    classes = undim(extra_classes),
    style   = undim(styles)
  )

  vctrs::vec_split(out, as.vector(row(summary_df)))$val
}

create_source_notes_component_g <- function(data) {

  source_notes <- dt_source_notes_get(data = data)
  if (is.null(source_notes)) {
    return(NULL)
  }

  styles_tbl <- dt_styles_get(data = data)

  n_cols_total <- get_effective_number_of_columns(data = data)

  style <- NA
  if ("source_notes" %in% styles_tbl$locname) {
    source_notes_style <- dplyr::filter(styles_tbl, locname == "source_notes")
    if (nrow(source_notes_style)) {
      style <- source_notes_style$html_style
    }
  }

  multiline <- dt_options_get_value(data = data, option = "source_notes_multiline")

  if (multiline) {
    separator <- "\n"
  } else {
    separator <- dt_options_get_value(data = data, option = "source_notes_sep")
    separator <- gsub(" (?= )", "\u00A0", separator, perl = TRUE)
  }

  source_notes <- paste(source_notes, collapse = separator)

  vctrs::data_frame(
    left = 1, right = n_cols_total,
    label = source_notes,
    classes = list("gt_sourcenotes"),
    style = as.list(style),
    bottom = 1,
    top = 1
  )
}

create_footnotes_component_g <- function(data) {

  footnotes_tbl <- dt_footnotes_get(data)
  if (nrow(footnotes_tbl) < 1) {
    return(NULL)
  }

  styles_tbl <- dt_styles_get(data = data)
  n_cols_total <- get_effective_number_of_columns(data = data)

  footnotes_tbl <- dplyr::distinct(dplyr::select(footnotes_tbl, fs_id, footnotes))

  style <- NA
  if ("footnotes" %in% styles_tbl$locname) {
    footnotes_style <- dplyr::filter(styles_tbl, locname == "footnotes")
    if (nrow(footnotes_style) > 0) {
      style <- footnotes_style$html_style
    }
  }

  multiline <- dt_options_get_value(data = data, option = "footnotes_multiline")

  footnote_ids  <- footnotes_tbl[["fs_id"]]
  footnote_text <- footnotes_tbl[["footnotes"]]

  marks <- vapply(
    footnote_ids,
    FUN = footnote_mark_to_html,
    FUN.VALUE = character(1),
    USE.NAMES = FALSE,
    data = data,
    location = "ftr"
  )
  marks[nzchar(marks)] <- paste0(marks[nzchar(marks)], " ")
  text <- vapply(
    footnote_text,
    FUN = process_text,
    FUN.VALUE = character(1),
    USE.NAMES = FALSE,
    context = "html"
  )
  text <- paste0(marks, text)

  if (multiline) {
    separator <- "\n"
  } else {
    separator <- dt_options_get_value(data = data, option = "footnotes_sep")
    separator <- gsub(" (?= )", "\u00A0", separator, perl = TRUE)
  }

  text <- paste(text, collapse = separator)

  vctrs::data_frame(
    left = 1, right = n_cols_total,
    label = text,
    classes = list("gt_footnotes"),
    style = as.list(style),
    bottom = 1,
    top = 1
  )
}

# Cells -------------------------------------------------------------------

render_grid_cell <- function(
  label,
  class,
  text_grob = grid::textGrob,
  cell_grob = grid::segmentsGrob
) {

  margin <- class$margin %||% grid::unit(c(0, 0, 0, 0), "pt")

  grobs <- list()
  width <- 0
  height <- 0

  if (nzchar(label)) {
    hjust <- class$hjust %||% 0
    vjust <- class$vjust %||% 0

    x <- (1 - hjust) * margin[4] - hjust * margin[2]
    y <- (1 - vjust) * margin[3] - vjust * margin[1]
    x <- grid::unit(hjust, "npc") + x
    y <- grid::unit(vjust, "npc") + y

    text <- text_grob(
      x = x, y = y, label = label,
      hjust = hjust, vjust = vjust,
      gp = class$text_gp
    )

    width <- grid_width(text) + sum(grid_width(margin[c(2, 4)]))
    height <- grid_height(text) + sum(grid_height(margin[c(1, 3)]))

    grobs <- c(grobs, list(text))
  }

  if (sum(lengths(class$cell_gp))) {
    grobs <- c(list(grid::rectGrob(
      gp = grid::gpar(fill = class$cell_gp$fill, col = NA)
    )), grobs)
  }

  if (nrow(class$border_xy) > 0) {
    grobs <- c(grobs, list(inject(cell_grob(
      !!!class$border_xy, gp = class$border_gp
    ))))
  }

  if (length(grobs) == 0) {
    return(NULL)
  }
  grobs <- inject(grid::gList(!!!grobs))

  grid::gTree(
    children = grobs,
    width  = width,
    height = height,
    cl = "gt_grid_cell"
  )
}

.grid_unit <- "cm"

grid_width <- function(x) {
  if (grid::is.grob(x)) {
    x <- grid::grobWidth(x)
  }
  grid::convertWidth(x, .grid_unit, valueOnly = TRUE)
}

grid_height <- function(x) {
  if (grid::is.grob(x)) {
    x <- grid::grobHeight(x)
  }
  grid::convertHeight(x, .grid_unit, valueOnly = TRUE)
}

# Parsers -----------------------------------------------------------------

parse_lwd <- function(x) {
  parse_px_to_pt(x) / 96 * 72.27
}

parse_lty <- function(x) {
  unname(.border_style[x])
}

.border_style <- c("solid" = 1, "dashed" = 2, "dotted" = 3, hidden = NA, double = 1)

parse_px_to_pt <- function(px, ppi = 72) {
  mult <- 0.75 / 72 * ppi
  as.numeric(gsub("px$", "", px)) * mult
}

parse_fontfamily <- function(family) {
  if (is.null(family)) {
    return(NULL)
  }
  if (grepl(",", family)) {
    family <- strsplit(family, ",")[[1]][1]
  }

  family[family == "system-ui"] <- ""
  family[1]
}

parse_border <- function(style, width, color, side) {
  if (is.null(style) || is.null(width) || is.null(color)) {
    return(NULL)
  }
  list(
    lwd = parse_lwd(width),
    lty = parse_lty(style),
    col = rgba_to_hex(color),
    side = side
  )
}

parse_fontface <- function(weight = "plain", style = "plain") {
  is_italic <- style  %in% c("italic", "oblique")
  if (is.numeric(weight)) {
    is_bold <- weight >= 600
  } else {
    is_bold <- weight %in% c("bold", "bolder")
  }
  face <- rep("plain", max(length(weight), length(style)))
  face[ is_italic &  is_bold] <- "bold.italic"
  face[ is_italic & !is_bold] <- "italic"
  face[!is_italic &  is_bold] <- "bold"
  face
}

parse_hjust <- function(hjust) {
  new <- match(hjust, c("left", "right")) - 1
  new[is.na(new)] <- 0.5
  new
}

parse_vjust <- function(vjust) {
  new <- match(vjust, c("bottom", "top")) - 1
  new[is.na(new)] <- 0.5
  new
}

parse_fontsize <- function(size, base) {

  new_size <- rep(base[1], length(size))

  # Parse percentages relative to base
  pct <- grep("\\%$", size)
  if (length(pct) > 0) {
    new_size[pct] <- as.numeric(gsub("\\%$", "", size[pct])) / 100 * base
  }

  # Parse pixels
  px <- grep("px$", size)
  if (length(px) > 0) {
    new_size[px] <- parse_px_to_pt(size[px])
  }

  # Parse absolute size keywords
  abs <- which(size %in% names(.abs_size_keys))
  if (length(abs) > 0) {
    new_size[abs] <- unname(.abs_size_keys[size[abs]]) * base
  }

  # Return updated sizes
  # If not pixel, percentage or keyword, size will be base
  new_size
}

# Taken from absolute size keyword mapping table
# https://drafts.csswg.org/css-fonts/#absolute-size-mapping
.abs_size_keys <- c("xx-small" = 3/5, "x-small" = 3/4, "small" = 6/9,
                    "medium" = 1, "large" = 6/5, "x-large" = 6/5,
                    "xx-large" = 2, "xxx-large" = 3)

.trbl <- c("top", "right", "bottom", "left")

.border_join <- vctrs::data_frame(
  # side = .trbl,
  x0 = c(0, 1, 1, 0),
  x1 = c(1, 1, 0, 0),
  y0 = c(1, 1, 0, 0),
  y1 = c(1, 0, 0, 1)
)

combine_borders <- function(top, right, bottom, left) {
  borders <- lapply(list(top, right, bottom, left), as.data.frame)
  borders <- vctrs::vec_c(!!!borders)
  missing <- rowSums(vapply(borders, is.na, logical(nrow(borders)))) > 0
  borders <- vctrs::vec_slice(borders, !missing)
  gp <- grid::gpar(lwd = borders$lwd, lty = borders$lty, col = borders$col)
  coords <- .border_join[match(borders$side, .trbl), ]
  list(gp = gp, coords = coords)
}

# Helpers -----------------------------------------------------------------

undim <- function(x) {
  dim(x) <- NULL
  x
}

insert_before <- function(x, i, value) {
  new <- vctrs::vec_init(x, length(x) + length(i))
  i <- i + seq_along(i) - 1
  new[i] <- value
  new[-i] <- x
  new
}

insert_after <- function(x, i, value) {
  new <- vctrs::vec_init(x, length(x) + length(i))
  i <- i + seq_along(i)
  new[i] <- value
  new[-i] <- x
  new
}

defaults <- function(x, y) c(x, y[setdiff(names(y), names(x))])

# Classes -----------------------------------------------------------------

set_classes <- function(layout, data) {

  css  <- parse_css(data = data)
  base_size <- parse_px_to_pt(css$gt_table["font-size"])

  classes <- layout$classes
  lens <- lengths(classes)
  classes <- unlist(classes)

  content <- vctrs::vec_chop(css[classes], sizes = lens)
  content <- lapply(content, Reduce, f = defaults, right = TRUE)
  # content <- lapply(content, function(x) Reduce())

  has_style <- which(!vapply(layout$style, anyNA, logical(1)))
  style <- lapply(layout$style[has_style], function(style) {
    split <- trimws(strsplit(style, ";")[[1]])
    split <- strsplit(split, ": ", fixed = TRUE)
    keep  <- lengths(split) == 2
    name  <- vapply(split[keep], `[[`, character(1), i = 1)
    value <- vapply(split[keep], `[[`, character(1), i = 2)
    names(value) <- name
    value
  })

  content[has_style] <- Map(defaults, x = style, y = content[has_style])
  content <- Map(defaults, x = content, y = list(css$gt_table))
  content <- lapply(content, class_to_grid, base_size = base_size)
  content
}

.required_fields <-
  c("background-color", "border-bottom-color", "border-bottom-style",
    "border-bottom-width", "border-left-color", "border-left-style",
    "border-left-width", "border-right-color", "border-right-style",
    "border-right-width", "border-top-color", "border-top-style",
    "border-top-width", "color", "font-family", "font-size", "font-style",
    "font-weight", "margin", "margin-left", "margin-right",
    "padding-bottom", "padding-left", "padding-right", "padding-top",
    "text-align", "text-indent", "text-transform", "vertical-align",
    "width")

class_to_grid <- function(values, base_size) {
  values <- as.list(values)
  missing <- setdiff(.required_fields, names(values))
  values[missing] <- list(NULL)

  names(values) <- gsub("-", "_", names(values), fixed = TRUE)
  out <- with(values, list(
    text_gp = grid::gpar(
      fontfamily = parse_fontfamily(font_family),
      fontsize   = parse_fontsize(font_size, base_size),
      fontface   = parse_fontface(font_weight, font_style),
      col = rgba_to_hex(color)
    ),
    # vjust = 0.5,
    vjust = parse_vjust(vertical_align %||% "bottom"),
    hjust = parse_hjust(text_align %||% "left"),
    cell_gp = grid::gpar(
      fill = rgba_to_hex(background_color)
    ),
    margin = grid::unit(parse_px_to_pt(c(
      padding_top %||% 0, padding_right %||% 0,
      padding_bottom %||% 0, padding_left %||% 0
    )), "pt"),
    border = list(
      top = parse_border(
        style = border_top_style,
        width = border_top_width,
        color = border_top_color,
        side  = "top"
      ),
      bottom = parse_border(
        style = border_bottom_style,
        width = border_bottom_width,
        color = border_bottom_color,
        side  = "bottom"
      ),
      left = parse_border(
        style = border_left_style,
        width = border_left_width,
        color = border_left_color,
        side  = "left"
      ),
      right = parse_border(
        style = border_right_style,
        width = border_right_width,
        color = border_right_color,
        side  = "right"
      )
    )
  ))
  out[c("border_gp", "border_xy")] <- combine_borders(
    out$border$top, out$border$right, out$border$bottom, out$border$left
  )
  out[["border"]] <- NULL
  out
}

parse_css <- function(data) {

  # Compile css class definitions
  css <- compile_scss(data = data)
  css <- strsplit(css, "\n")[[1]]

  # Find first and last line of definitions
  start <- grep("\\{$", css)
  end   <- which(css == "}")
  if (!length(start) == length(end)) {
    cli::cli_abort("Formatting in {.fn compile_css} is unexpected.")
  }

  # Format class names
  names <- css[start] # start of definition
  n <- nchar(names)
  names <- substr(names, start = 2, stop = n - 2)

  # Clean up whitespace and trailing semicolons
  css <- trimws(css)
  css <- gsub(";", "", css)

  # Split up key-value pairs
  split <- strsplit(css, ": ", fixed = TRUE)
  split[lengths(split) == 2] <- lapply(split[lengths(split) == 2], function(x) {
    out <- x[2]
    names(out) <- x[[1]]
    out
  })

  # Get indices of key-value pairs per class
  # +1 to start to skip class name
  # -1 to end to skip closing bracket
  classes <- Map(`:`, start + 1, end - 1)
  names(classes) <- names
  classes <- lapply(classes, function(x) unlist(split[x], FALSE))
  classes <- classes[grepl("^gt_", names(classes))]

  # There are two entries for gt_table that we merge here
  is_table <- which(names(classes) == "gt_table")
  table <- Reduce(defaults, classes[is_table])
  c(classes[-is_table], list(gt_table = table))
}

