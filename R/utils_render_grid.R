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


# Layout ------------------------------------------------------------------

# For grid, the `create_*_component_g` functions are used to get a long-format
# description of every cell in the table.
# The goal of these layout functions is to get a position layout of cells as a
# data.frame, along with their class and style information. The layout should
# contain the following columns:
#
# left <integer>:
# Left position of a cell counting such that left = 1 is the first column in the
# table.
#
# right <integer>:
# Right position of cell equal to or larger than the 'left' column. When
# 'right' > 'left', this corresponds to having an html 'colspan' attribute
# larger than 1.
#
# top <integer>:
# Top position of a cell counting such that top = 1 is the first row in the
# component. Note that that this applies to 'within-component' rows, and not
# the final table row. Final 'top' and 'bottom' values are assigned in the
# `combine_components()` function.
#
# bottom <integer>:
# Bottom position of a cell equal to or larger than the 'top' column. When
# 'bottom' > 'top', this corresponds to having an html 'rowspan' attribute
# larger than 1.
#
# label <character>:
# A text label to display in the cell. Note that while the label can contain
# html, it will not be rendered with markup unless the text grob function
# supports it, for example when using gridtext as follows:
# `as_gtable(..., text_grob = gridtext::richtext_grob)`
#
# classes <list of <character>>:
# One or multiple class names equivalent to the html class attributes that will
# determine which css classes are used to populate graphical parameters for
# the cell (font color, borders, padding etc.).
#
# style <character>:
# A style string as computed by `add_css_styles()` or `NA` when a cell has
# no set styling options
#
# name <character>:
# A base name to assign in the gtable. This makes it easier to use
# `gtable::gtable_filter()` to select some types of cells.

create_caption_component_g <- function(data) {

  table_caption <- dt_options_get_value(data = data, option = "table_caption")
  if (all(is.na(table_caption))) {
    return(NULL)
  }
  n_cols_total <- get_effective_number_of_columns(data = data)
  grid_layout(
    left    = 1,
    right   = n_cols_total,
    top     = 1,
    label   = table_caption,
    classes = list(c("gt_caption", "gt_center")),
    style   = NA_character_,
    name    = "caption"
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

    title_styles <- vctrs::vec_slice(styles_tbl$html_style, styles_tbl$locname == "title")

    if (length(title_styles) == 0) {
      title_styles <- NA_character_
    }
  }

  subtitle_styles <- NA_character_

  if (subtitle_defined && "subtitle" %in% styles_tbl$locname) {

    subtitle_styles <- vctrs::vec_slice(styles_tbl$html_style, styles_tbl$locname == "subtitle")

    if (length(subtitle_styles) == 0) {
      subtitle_styles <- NA_character_
    }
  }

  # The footnote marks are not great, but might look OK with {gridtext}
  footnote_title_marks <- ""

  if ("title" %in% footnotes_tbl$locname) {

    footnote_title_marks <-
      coalesce_marks(
        fn_tbl = footnotes_tbl,
        locname = "title"
      )

    footnote_title_marks <-
      footnote_mark_to_html(
        data = data,
        mark = footnote_title_marks
      )
  }

  footnote_subtitle_marks <- ""

  if (subtitle_defined && "subtitle" %in% footnotes_tbl$locname) {

    footnote_subtitle_marks <-
      coalesce_marks(
        fn_tbl = footnotes_tbl,
        locname = "subtitle"
      )

    footnote_subtitle_marks <-
      footnote_mark_to_html(
        data = data,
        mark = footnote_subtitle_marks
      )
  }

  title_text    <- paste0(heading$title, footnote_title_marks)
  subtitle_text <- paste0(heading$subtitle, footnote_subtitle_marks)

  title_classes <- c("gt_heading", "gt_title", "gt_font_normal")
  subtitle_classes <- sub("title", "subtitle", title_classes, fixed = TRUE)

  if (subtitle_defined) {
    subtitle_classes <- c("gt_bottom_border", subtitle_classes)
  } else {
    title_classes <- c("gt_bottom_border", title_classes)
  }

  n_cols_total <- get_effective_number_of_columns(data = data)

  out <-
    grid_layout(
      left    = 1,
      right   = n_cols_total,
      top     = c(1, 2),
      label   = c(title_text,    subtitle_text),
      classes = list(title_classes, subtitle_classes),
      style   = c(title_styles,  subtitle_styles),
      name    = c("title", "subtitle")
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

    stub_style <- NA_character_

    if (nrow(stubhead_style_attrs) > 0) {
      stub_style <- stubhead_style_attrs$html_style %||% NA_character_
    }

    stubhead_cell <-
      grid_layout(
        left = 1, right = length(stub_layout),
        bottom  = spanner_row_count + 1, top = 1,
        label   = stubh$label,
        classes = list(c("gt_col_heading", "gt_columns_bottom_border", "gt_left")),
        style   = stub_style,
        name    = "stubhead"
      )
  }

  spanner_cells <- NULL

  if (spanner_row_count > 0) {

    # We transpose spanners to easily compute RLE
    spanners <-
      t(dt_spanners_print_matrix(
        data = data,
        include_hidden = FALSE
      ))

    spanner_ids <-
      t(dt_spanners_print_matrix(
        data = data,
        include_hidden = FALSE,
        ids = TRUE
      ))

    index <- match(spanner_ids, spanner_ids)

    # recall spanners is transposed so taking `col(spanners)` gives us the row
    rle <-
      vctrs::vec_unrep(
        vctrs::data_frame(
          spanner = index,
          row = as.vector(col(spanners))
        )
      )

    # Annotate runs
    rle$end   <- stats::ave(rle$times, rle$key$row, FUN = cumsum)
    rle$start <- rle$end - rle$times + 1
    rle$id    <- spanner_ids[rle$key$spanner]

    # Filter out NA runs and non-spanner columns
    rle <- vctrs::vec_slice(rle, !is.na(rle$id))
    rle <- vctrs::vec_slice(rle, rle$key$row != spanner_row_count + 1)

    spanner_style <- rep(NA_character_, nrow(rle))

    if (nrow(spanner_style_attrs) > 0) {

      i <- match(rle$id, spanner_style_attrs$grpname)
      spanner_style[i] <- spanner_style_attrs$html_style
    }

    classes <- rep(list(c("gt_center", "gt_column_spanner")), nrow(rle))
    at_top <- rle$key$row == 1

    classes[at_top] <- lapply(
      classes[at_top], c,
      c("gt_columns_top_border", "gt_columns_spanner_outer")
    )

    spanner_cells <-
      grid_layout(
        left    = rle$start + length(stub_layout),
        right   = rle$end   + length(stub_layout),
        top     = rle$key$row,
        label   = spanners[rle$key$spanner],
        classes = classes,
        style   = spanner_style,
        name    = "spanner"
      )
  }

  column_style <- rep(NA_character_, length(headings_vars))
  column_style[column_style_attrs[["colnum"]]] <-
    column_style_attrs[["html_style"]]

  cols_alignment <- paste0("gt_", cols_alignment)

  classes <- lapply(cols_alignment, function(x) {
    c("gt_col_heading", "gt_columns_bottom_border", x)
  })

  column_cells <-
    grid_layout(
      left    = seq_along(headings_vars) + length(stub_layout),
      top     = spanner_row_count + 1,
      label   = headings_labels,
      classes = classes,
      style   = column_style,
      name    = "column_label"
    )

  vctrs::vec_c(stubhead_cell, spanner_cells, column_cells)
}

create_body_component_g <- function(data) {

  groups_rows_df    <- dt_groups_rows_get(data = data)

  # Create group headings
  group_headings <- group_headings_g(data = data)

  # Compute summary tables
  grand_summary_side <-
    summary_row_side(data = data, group_id = grand_summary_col)

  grand_summaries <-
    summary_rows_g(
      data = data,
      group_id = grand_summary_col,
      side_grand_summary = grand_summary_side
    )

  group_summaries <-
    summary_rows_g(data = data, group_id = groups_rows_df$group_id)

  rows <- body_cells_g(data = data)

  # Weave summaries, headings and body
  row_start <- groups_rows_df$row_start
  row_end   <- groups_rows_df$row_end

  if (!is.null(group_headings)) {

    rows <- insert_before(rows, row_start, group_headings)
    row_start <- row_start + cumsum(lengths(group_headings))
    row_end   <- row_end   + cumsum(lengths(group_headings))
  }

  summary_side <- groups_rows_df$summary_row_side
  summary_side <- summary_side[groups_rows_df$has_summary_rows][1]

  if (identical(summary_side, "top")) {

    rows <- insert_before(rows, row_start, group_summaries)
    row_start <- row_start + cumsum(lengths(group_summaries))
    row_end   <- row_end   + cumsum(lengths(group_summaries))
  }

  if (identical(summary_side, "bottom")) {

    rows <- insert_after(rows, row_end, group_summaries)
    row_start <- row_start + seq_along(row_start) - 1L
    row_end   <- row_end   + seq_along(row_end)
  }

  if (sum(vctrs::list_sizes(grand_summaries %||% list())) > 0) {

    if (grand_summary_side == "top") {
      rows <- c(grand_summaries[[1]], rows)
    } else {
      rows <- c(rows, grand_summaries[[1]])
    }
  }

  if (identical(rows, list())) {
    return(NULL)
  }

  sizes <- vctrs::list_sizes(rows)
  row_num <- rep(cumsum(sizes > 0), sizes)

  rows <- vctrs::vec_c(!!!rows)
  rows$top     <- rows$top    + row_num
  rows$bottom  <- rows$bottom + row_num
  rows$classes <- lapply(rows$classes, c, list("gt_row"))
  rows
}

group_headings_g <- function(data = data) {

  stub <- get_stub_layout(data = data)

  if ("group_label" %in% stub) {
    return(NULL)
  }

  styles_tbl     <- dt_styles_get(data = data)
  groups_rows_df <- dt_groups_rows_get(data = data)
  n_groups       <- nrow(groups_rows_df)
  n_cols_total   <- get_effective_number_of_columns(data = data)

  lapply(
    seq_len(n_groups),
    function(i) {
      group_id <- groups_rows_df[["group_id"]][[i]]
      group_label <- groups_rows_df[["group_label"]][[i]]

      row_style_row_groups_tbl <-
        dt_styles_pluck(
          styles_tbl = styles_tbl,
          locname = "row_groups",
          grpname = group_id
        )

      row_style_group_heading_row <- row_style_row_groups_tbl[["html_style"]]
      if (length(row_style_group_heading_row) == 0) {
        row_style_group_heading_row <- NA
      }

      group_class <-
        if (is.na(group_label) || group_label == "") {
          group_label <- ""
          "gt_empty_group_heading"
        } else {
          "gt_group_heading"
        }

      list(grid_layout(
        left = 1, right = n_cols_total,
        top = 0,
        label = group_label,
        classes = list(c(group_class, "gt_group_heading_row")),
        style = row_style_group_heading_row,
        name = "group_heading"
      ))
    }
  )
}

body_cells_g <- function(data) {

  summaries_present <- dt_summary_exists(data = data)
  groups <- dt_groups_rows_get(data = data)
  styles_tbl <- dt_styles_get(data = data)

  cell_matrix <- get_body_component_cell_matrix(data = data)
  cell_rows   <- as.vector(row(cell_matrix))
  cell_cols   <- as.vector(col(cell_matrix))
  row_seq     <- seq_len(nrow(cell_matrix))

  n_rows <- nrow(cell_matrix)
  n_cols_total <- get_effective_number_of_columns(data = data)

  stub_layout <- get_stub_layout(data = data)
  has_two_col_stub <- "group_label" %in% stub_layout

  odd_class <- even_class <- rep_len(list(NULL), n_cols_total)

  # Set striping
  striped_stub <-
    dt_options_get_value(data = data, option = "row_striping_include_stub")

  striped_body <-
    dt_options_get_value(data = data, option = "row_striping_include_table_body")

  if (striped_body) {
    even_class <- rep(list("gt_striped"), n_cols_total)
  }

  # Set stub class
  row_label_col <- which(stub_layout == "rowname")

  if (length(row_label_col) > 0) {

    odd_class[[row_label_col]] <- "gt_stub"

    if (striped_stub) {
      even_class[[row_label_col]] <- c("gt_stub", "gt_striped")
    } else {
      even_class[[row_label_col]] <- "gt_stub"
    }
  }

  # Weave even/odd classes into matrix
  cell_classes <- rep_len(list(odd_class, even_class), n_rows)
  cell_classes <- inject(rbind(!!!cell_classes))

  # Set column alignment
  align_class <-
    c(
      dt_boxhead_get_alignments_in_stub(data = data),
      dt_boxhead_get_vars_align_default(data = data)
    )
  align_class <- paste0("gt_", align_class)[cell_cols]

  # Adjust alignment for RtL script
  has_rtl <- grepl(rtl_modern_unicode_charset, cell_matrix)
  align_class[has_rtl & align_class != "gt_center"] <- "gt_right"

  # Set stub indentation
  indent_class <- first_class <-  matrix(list(NULL), n_rows, n_cols_total)

  if (length(row_label_col) > 0) {

    stub_indent <- dt_stub_df_get(data = data)
    stub_indent <-
      vctrs::vec_slice(stub_indent %||% list(), stub_indent$indent > 0)

    if (NROW(stub_indent) > 0) {
      i <- match(row_seq, stub_indent$rownum_i)
      i <- i[!is.na(i)]
      indent_class[i, row_label_col] <- paste0("gt_indent_", stub_indent$indent)
    }
  }

  # Set first in group
  first_group <- which(row_seq %in% groups$row_start)
  first_class[first_group, ] <- "gt_row_group_first"

  # Combine classes
  classes <- Map(c, first_class, indent_class, cell_classes, align_class)

  # Set style for data/stub cells
  style <- matrix(NA_character_, n_rows, n_cols_total)

  cell_style <-
    dt_styles_pluck(
      styles_tbl = styles_tbl,
      locname = c("data", "stub")
    )

  style_col <- cell_style$colnum + length(stub_layout)

  style[cbind(cell_style$rownum, style_col)] <- cell_style$html_style

  # Set style for row group labels
  if (has_two_col_stub) {

    cell_style <-
      dt_styles_pluck(
        styles_tbl = styles_tbl,
        locname = "row_groups"
      )

    style_row <- with(groups, row_start[match(cell_style$grpname, group_id)])

    style[style_row, 1] <- cell_style$html_style

    # Override group label
    cell_matrix[first_group, 1] <- groups$group_label
  }

  # Set layout
  layout <-
    grid_layout(
      left  = cell_cols,
      top   = 0, # will be completed later
      label = undim(cell_matrix),
      classes = undim(classes),
      style = undim(style),
      name  = "body_cell"
    )

  if (has_two_col_stub) {

    # Set stub row group(s)
    group_cell <- which(cell_rows %in% groups$row_start & cell_cols == 1)
    group <- match(cell_rows[group_cell], groups$row_start)
    extra_rows <- (groups$row_end - groups$row_start + 1)[group]
    layout$bottom[group_cell] <- extra_rows
    layout$classes[group_cell] <-
      lapply(layout$classes[group_cell], c, "gt_stub_row_group")

    # Shift upward if summaries on top
    i <-
      summaries_present &
      (groups$has_summary_rows %||% FALSE) &
      (groups$summary_row_side %||% "bottom" == "top") &
      rep(TRUE, nrow(groups)) # ensures correct length if columns are missing

    i[is.na(i)] <- FALSE

    group_cell <- group_cell[i]

    layout[group_cell, c("top", "bottom")] <-
      layout[group_cell, c("top", "bottom")] - 1

    # Delete empty cells
    delete <- which(!(cell_rows %in% groups$row_start) & cell_cols == 1)

    if (rlang::has_length(delete)) {

      # Don't attempt delete doesn't have length
      # will likely occur in the case of all groups of length 1 #1803
      layout <- vctrs::vec_slice(layout, -delete)
      cell_rows <- vctrs::vec_slice(cell_rows, -delete)
    }
  }

  # Split by row
  rows <- vector("list", n_rows)
  layout <- vctrs::vec_split(layout, cell_rows)

  rows[layout$key] <- layout$val
  rows
}

summary_rows_g <- function(data, group_id, side_grand_summary = "bottom") {

  if (is.null(group_id)) {
    return(NULL)
  }

  groups_rows_df    <- dt_groups_rows_get(data = data)

  list_of_summaries <- dt_summary_df_get(data = data)
  summaries_present <- dt_summary_exists(data = data)
  styles_tbl <- dt_styles_get(data = data)

  needs_summary <-
    summaries_present &
    (((groups_rows_df$has_summary_rows %||% FALSE) &
    !is.na(groups_rows_df$summary_row_side %||% FALSE) &
    ((groups_rows_df$summary_row_side %||% "left") %in% c("top", "bottom"))) |
    (group_id == grand_summary_col))


  if (!any(needs_summary)) {
    return(NULL)
  }

  groups_rows_df <- groups_rows_df[needs_summary, , drop = FALSE]

  group_summary_vars <- dt_boxhead_get_vars_default(data = data)
  summary_row_type <- rep("", nrow(groups_rows_df))

  group_type <-
    !is.na(group_id) &
    group_id %in% names(list_of_summaries$summary_df_display_list) &
    group_id != grand_summary_col

  grand_type <-
    !is.na(group_id) &
    group_id == grand_summary_col

  summary_row_type <- rep("", max(length(group_type), length(grand_type)))

  summary_row_type[grand_type] <- "grand"
  summary_row_type[group_type] <- "group"

  summary_df <- list_of_summaries$summary_df_display_list[group_id]

  n_rows <- vctrs::list_sizes(summary_df)

  if (sum(n_rows) < 1) {
    return(NULL)
  }

  summary_df <- vctrs::vec_c(!!!summary_df)
  summary_df <-
    dplyr::select(
      summary_df,
      dplyr::all_of(c(rowname_col_private, group_summary_vars)),
    )

  summary_row_type <- rep(summary_row_type, n_rows)

  stub_layout <- get_stub_layout(data = data)

  n_data_cols <- get_number_of_visible_data_columns(data = data)
  ncol <- ncol(summary_df)
  left <- right <- col(summary_df) + as.integer(length(stub_layout) > 1)

  if (all(summary_row_type == "grand")) {

    if (length(stub_layout) > 1) {
      left[, 1] <- left[, 1] - 1
    }

    if (length(group_id) < length(summary_row_type)) {
      group_id <- rep(group_id, length(summary_row_type))
    }
  }

  extra_classes <- matrix(list(NULL), nrow = nrow(summary_df), ncol)
  extra_classes[, 1] <- lapply(extra_classes[, 1], c, "gt_stub")

  col_alignment <- c("left", dt_boxhead_get_vars_align_default(data = data))
  alignment_classes <- paste0("gt_", col_alignment)

  extra_classes[] <-
    Map(
      extra_classes,
      alignment_classes[as.vector(col(extra_classes))],
      f = c
    )

  styles <- matrix(NA, nrow = nrow(summary_df), ncol)

  is_first <- is_last <- rep(FALSE, sum(n_rows))
  is_first[c(1, cumsum(n_rows)[-length(n_rows)] + 1)] <- TRUE
  is_last[cumsum(n_rows)] <- TRUE

  inner_row <- unlist(lapply(n_rows, seq_len), use.names = FALSE)

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
          grprow = inner_row[i]
        )

      summary_row_class <- "gt_summary_row"

      first_row_class <-
        if ("rowname" %in% stub_layout) {
          "gt_first_summary_row.thick"
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

    if (is_first[i]) {
      extra_class <- lapply(extra_class, c, first_row_class)
    }

    if (is_last[i]) {
      extra_class <- lapply(extra_class, c, last_row_class)
    }

    extra_classes[i, ] <- extra_class
    styles[i, ] <- row_styles
  }

  if (all(summary_row_type == "grand")) {
    name <- "grand_summary"
  } else {
    name <- "group_summary"
  }

  out <-
    grid_layout(
      left    = undim(left),
      right   = undim(right),
      top     = 0,
      label   = unlist(summary_df, use.names = FALSE),
      classes = undim(extra_classes),
      style   = undim(styles),
      name    = name
    )

  out <- vctrs::vec_split(out, as.vector(row(summary_df)))$val
  vctrs::vec_chop(out, sizes = n_rows)
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

    source_notes_style <- vctrs::vec_slice(styles_tbl, styles_tbl$locname == "source_notes")

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

  grid_layout(
    left    = 1,
    right   = n_cols_total,
    top     = 1,
    label   = source_notes,
    classes = list(c("gt_sourcenotes", "gt_sourcenote")),
    style   = style,
    name    = "source_notes"
  )
}

create_footnotes_component_g <- function(data) {

  footnotes_tbl <- dt_footnotes_get(data)

  if (nrow(footnotes_tbl) < 1) {
    return(NULL)
  }

  styles_tbl <- dt_styles_get(data = data)
  n_cols_total <- get_effective_number_of_columns(data = data)

  footnotes_tbl <- dplyr::distinct(footnotes_tbl, fs_id, footnotes)

  style <- NA

  if ("footnotes" %in% styles_tbl$locname) {

    footnotes_style <- vctrs::vec_slice(styles_tbl, styles_tbl$locname == "footnotes")

    if (nrow(footnotes_style) > 0) {
      style <- footnotes_style$html_style
    }
  }

  multiline <- dt_options_get_value(data = data, option = "footnotes_multiline")

  footnote_ids  <- footnotes_tbl[["fs_id"]]
  footnote_text <- footnotes_tbl[["footnotes"]]

  marks <-
    vapply(
      footnote_ids,
      FUN = footnote_mark_to_grid,
      FUN.VALUE = character(1L),
      USE.NAMES = FALSE,
      data = data,
      location = "ftr"
    )
  marks[nzchar(marks)] <- paste0(marks[nzchar(marks)], " ")

  text <-
    vapply(
      footnote_text,
      FUN = process_text,
      FUN.VALUE = character(1L),
      USE.NAMES = FALSE,
      context = "grid"
    )
  text <- paste0(marks, text)

  if (multiline) {
    separator <- "\n"
  } else {
    separator <- dt_options_get_value(data = data, option = "footnotes_sep")
    separator <- gsub(" (?= )", "\u00A0", separator, perl = TRUE)
  }

  text <- paste(text, collapse = separator)

  grid_layout(
    left    = 1,
    right   = n_cols_total,
    top     = 1,
    label   = text,
    classes = list(c("gt_footnotes", "gt_footnote")),
    style   = style,
    name    = "footnotes"
  )
}

#' Transform a footnote mark to a grid representation
#'
#' @noRd
footnote_mark_to_grid <- function(
    data,
    mark,
    location = c("ref", "ftr")
) {

  location <- match.arg(location)

  if (is.na(mark)) {
    return("")
  }

  spec <- get_footnote_spec_by_location(data = data, location = location)

  if (is.null(spec)) {
    spec <- "^i"
  }

  # Generate the CSS classes needed on the basis of whether the
  # mark is one or more asterisk characters or anything else
  if (!grepl("^[\\*]+?$", mark)) {
    sup_class <- "gt_footnote_marks"
  } else {
    sup_class <- "gt_footnote_marks gt_asterisk"
  }

  is_sup <- grepl("^", spec, fixed = TRUE)

  if (grepl(".", spec, fixed = TRUE)) mark <- paste0(mark, ".")
  if (grepl("(", spec, fixed = TRUE)) mark <- paste0("(", mark)
  if (grepl("[", spec, fixed = TRUE)) mark <- paste0("[", mark)
  if (grepl(")", spec, fixed = TRUE)) mark <- paste0(mark, ")")
  if (grepl("]", spec, fixed = TRUE)) mark <- paste0(mark, "]")

  # Not supported in grid
  if (grepl("i", spec, fixed = TRUE)) {
    font_style <- "italic"
  } else {
    font_style <- "normal"
  }

  if (grepl("b", spec, fixed = TRUE)) {
    font_weight <- "bold"
  } else {
    font_weight <- "normal"
  }

  # return mark as plain text (all styling is ignored)
  mark
}


# Cells -------------------------------------------------------------------

# This is the main function that takes a label and a style and returns
# a graphical object for display in a gtable.
# Note that 'style' is not an html style attribute but a combination of class
# and style attributes parsed by `grid_resolve_style()`,
render_grid_cell <- function(
  label,
  style,
  text_grob = grid::textGrob,
  cell_grob = grid::segmentsGrob
) {

  margin <- style$margin %||% grid::unit(c(0, 0, 0, 0), "pt")

  grobs <- list()
  width <- 0
  height <- 0

  if (nzchar(label)) {

    if (grepl("<svg.*>.*</svg>", label)) {
      content <- render_grid_svg(label, style, margin)
    } else {
      content <- render_grid_text(label, style, margin, text_grob)
    }

    width  <- grid_width(content)  + sum(grid_width(margin[c(2, 4)]))
    height <- grid_height(content) + sum(grid_height(margin[c(1, 3)]))

    grobs <- c(grobs, list(content))
  }

  if (sum(lengths(style$cell_gp))) {
    background <- grid::rectGrob(gp = style$cell_gp)
    grobs <- c(list(background), grobs)
  }

  if (!is.null(style$border_xy) && nrow(style$border_xy) > 0) {
    borders <- inject(cell_grob(!!!style$border_xy, gp = style$border_gp))
    grobs <- c(grobs, list(borders))
  }

  if (length(grobs) == 0) {
    return(NULL)
  }
  grobs <- inject(grid::gList(!!!grobs))

  # For efficiency reasons, we do not convert width and height to a proper
  # grid unit yet.
  grid::gTree(
    children = grobs,
    width  = width,
    height = height,
    cl = "gt_grid_cell"
  )
}

render_grid_text <- function(label, style, margin, text_grob) {

  hjust <- style$hjust %||% 0
  vjust <- style$vjust %||% 0

  x <- (1 - hjust) * margin[4] - hjust * margin[2]
  y <- (1 - vjust) * margin[3] - vjust * margin[1]
  x <- grid::unit(hjust, "npc") + x
  y <- grid::unit(vjust, "npc") + y

  text_grob(
    label, x = x, y = y,
    hjust = hjust, vjust = vjust,
    gp = style$text_gp
  )
}

render_grid_svg <- function(label, style, margin) {

  # Delete title
  # Titles may contain contain html that cannot be interpreted by rsvg,
  # and they cannot be displayed interactively in {grid} anyway.
  label <- gsub("<title(.*?)</title>", "", label)

  svg_string <- regexpr("<svg(.*?)>.*</svg>", label)
  svg_string <- regmatches(label, svg_string)
  svg_string <- gsub("\n", "", svg_string)
  svg_string <- trimws(svg_string)

  svg_style <- regexpr("style=\"(.*?)\"", svg_string)
  svg_style <- regmatches(svg_string, svg_style)
  svg_style <- gsub("^style=\"|\"$", "", svg_style)
  svg_style <- strsplit(svg_style, ";", fixed = TRUE)
  svg_style <- trimws(unlist(svg_style))

  width <- height <- NULL

  # Try if any height is declared in style attribute
  if (any(grepl("^height:", svg_style))) {

    height <- gsub("^height:", "", svg_style[grep("^height:", svg_style)])
    height <-
      grid::unit(
        parse_fontsize(height, style$text_gp$fontsize),
        .grid_unit
      )
  }

  # Try if any width is declared in style attribute
  if (any(grepl("^width:", svg_style))) {

    width <- sub("^width:", "", svg_style[grep("^width:", svg_style)])
    width <- grid::unit(
      parse_fontsize(width, style$text_gp$fontsize),
      .grid_unit
    )
  }

  if (is.null(width) || is.null(height)) {

    # If style attribute was incomplete; try to derive width/height from viewbox
    viewbox <-
      regexpr("viewBox=\"(.*?)\"", svg_string) %>%
      regmatches(x = svg_string) %>%
      gsub(pattern = "^viewBox=\"|\"$", replacement = "") %>%
      strsplit(" ") %>%
      unlist() %>%
      as.numeric()

    if (length(viewbox) != 4) {

      viewbox <- c(0, 0, 0, 0)

      svg_tag <-
        regexpr("^<svg(.*?)>", svg_string) %>%
        regmatches(x = svg_string)

      if (grepl("width", svg_tag, fixed = TRUE) && grepl("height", svg_tag, fixed = TRUE)) {

        # Try extract width from tag
        w <-
          regexpr("width=(.*?) ", svg_tag) %>%
          regmatches(x = svg_tag)

        viewbox[3] <-
          regexpr("\\d+", w) %>%
          regmatches(x = w) %>%
          as.numeric()

        # Try extract height from tag
        h <-
          regexpr("height=(.*?) ", svg_tag) %>%
          regmatches(x = svg_tag)

        viewbox[4] <-
          regexpr("\\d+", h) %>%
          regmatches(x = h) %>%
          as.numeric()

      } else {
        viewbox <- c(0, 0, 20, 20)
      }
    }

    dx <- abs(diff(range(viewbox[c(1, 3)])))
    dy <- abs(diff(range(viewbox[c(2, 4)])))
    asp <- dy / dx

    # If one of height/width is known, set other based on aspect ratio
    if (is.null(height) && !is.null(width)) {

      height <- width * asp
    } else if (!is.null(height)) {

      width  <- height / asp

    } else {

      # Interpret view box as pixels
      width <- grid::unit(dx * 0.75, "pt")
      height <- grid::unit(dy * 0.75, "pt")
    }
  }

  hjust <- style$hjust %||% 0
  vjust <- style$vjust %||% 0

  x <- (1 - hjust) * margin[4] - hjust * margin[2]
  y <- (1 - vjust) * margin[3] - vjust * margin[1]
  x <- grid::unit(hjust, "npc") + x
  y <- grid::unit(vjust, "npc") + y

  w <- ceiling(grid::convertUnit(width,  "in", valueOnly = TRUE) * 300)

  raster <- try_fetch(
    {
        # charToRaw("") return character(0)
        charToRaw(svg_string) %>%
        rsvg::rsvg_nativeraster(width = w) %>%
        grid::rasterGrob(
          width = width, height = height,
          x = x, y = y, hjust = hjust, vjust = vjust
        )
    },
    error = function(...) {
      zero <- grid::unit(0, .grid_unit)
      grid::rasterGrob(NA, width = zero, height = zero)
    }
  )

  raster

}

# This is just a data.frame wrapper to set standard columns for the layout.
grid_layout <- function(
    left,
    right = left,
    top,
    bottom = top,
    label,
    classes,
    style,
    name
) {
  vctrs::data_frame(
    left    = left,
    right   = right,
    top     = top,
    bottom  = bottom,
    label   = label,
    classes = classes,
    style   = style,
    name    = name,
    .name_repair = "minimal"
  )
}

# This is a parameter setting in which units to measure graphical objects.
# This can be any absolute unit, but is set to "pt" so that grid can easily
# combine it with parsed pixels (also in "pt" units).
.grid_unit <- "pt"

# Function for converting a width or unit to plain numeric.
grid_width <- function(x) {

  if (grid::is.grob(x)) {
    x <- grid::grobWidth(x)
  }

  grid::convertWidth(x, .grid_unit, valueOnly = TRUE)
}

# Function for converting a height or unit to plain numeric.
grid_height <- function(x) {

  if (grid::is.grob(x)) {
    x <- grid::grobHeight(x)
  }

  grid::convertHeight(x, .grid_unit, valueOnly = TRUE)
}

# Parsers -----------------------------------------------------------------

# Parser for line width
parse_lwd <- function(x) {
  parse_px_to_pt(x) / 96 * 72.27
}

# Parser for line type
parse_lty <- function(x) {
  unname(.border_style[x])
}

# Line type translation lookup-table
.border_style <-
  c("solid" = 1, "dashed" = 2, "dotted" = 3, hidden = NA, double = 1)

# Translating pixels to points, roughly: pt = 0.75 * pt
parse_px_to_pt <- function(px, ppi = 96) {

  mult <- 72.27 / ppi
  as.numeric(gsub("px$", "", px)) * mult
}

# Grid shouldn't have a vector of font families for a label, so we pick the
# first from the families.
parse_fontfamily <- function(family) {

  if (is.null(family)) {
    return(NULL)
  }

  if (grepl(",", family)) {
    family <- strsplit(family, ",")[[1]][1]
  }

  family[family == "system-ui"] <- ""
  family <- gsub("^\\'|\\'$", "", family) # unquote
  family[1]
}

# Convenience function to parse a single border
parse_border <- function(style, width, color, side) {

  if (is.null(style) || is.null(width) || is.null(color)) {
    return(NULL)
  }

  vctrs::data_frame(
    lwd = parse_lwd(width),
    lty = parse_lty(style),
    col = rgba_to_hex(color),
    side = side,
    .name_repair = "minimal"
  )
}

# Grid has fewer options for weight/style and these are collapsed in the
# fontface parameter.
parse_fontface <- function(weight = "plain", style = "plain") {

  is_italic <- style %in% c("italic", "oblique")

  if (is.numeric(weight)) {

    is_bold <- weight >= 600

  } else {
    is_bold <- weight %in% c("bold", "bolder")
  }

  face <- rep("plain", max(length(weight), length(style)))
  face[is_italic &  is_bold] <- "bold.italic"
  face[is_italic & !is_bold] <- "italic"
  face[!is_italic & is_bold] <- "bold"
  face
}

# Functions for text alignment
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

# While grid has the 'cex' parameter for relative fontsize, it is tricky
# to assign this correctly. Instead we just resolve relative fontsizes by
# setting the font relative to the 'gt_table' font size.
parse_fontsize <- function(size, base) {

  # if fontsize is not set by the user, it will be NULL here; use the base fontsize
  if (is.null(size)) {
    return(base)
  }

  new_size <- rep(base[1], length(size))

  # Parse percentages relative to base
  pct <- grep("\\%$", size)
  if (length(pct) > 0) {
    new_size[pct] <- as.numeric(gsub("\\%$", "", size[pct])) / 100 * base
  }

  em <- grep("em$", size)
  if (length(em) > 0) {
    new_size[em] <- as.numeric(gsub("rem$|em$", "", size[em])) * base
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
.abs_size_keys <-
  c(
    "xx-small" = 3 / 5, "x-small" = 3 / 4, "small" = 6 / 9,
    "medium" = 1, "large" = 6 / 5, "x-large" = 6 / 5,
    "xx-large" = 2, "xxx-large" = 3
  )

# Position keywords
.trbl <- c("top", "right", "bottom", "left")

# Function for resolving individual borders into cell-wise borders
combine_borders <- function(top, right, bottom, left) {

  borders <- vctrs::vec_c(top, right, bottom, left)

  if (vctrs::vec_size(borders) < 1) {
    return(NULL)
  }

  borders <- vctrs::vec_slice(borders, vctrs::vec_detect_complete(borders))

  if (nrow(borders) < 1) {
    return(NULL)
  }

  gp <-
    grid::gpar(
      lwd = borders$lwd,
      lty = borders$lty,
      col = borders$col,
      lineend = "butt"
    )

  coords <- .border_join[match(borders$side, .trbl), ]
  list(gp = gp, coords = coords)
}

# Cached border positions
.border_join <-
  vctrs::data_frame(
  # Order is top right bottom left
    x0 = c(0, 1, 1, 0),
    x1 = c(1, 1, 0, 0),
    y0 = c(1, 1, 0, 0),
    y1 = c(1, 0, 0, 1)
  )

# Function for changing a style string to key-value pairs.
parse_style <- function(style) {

  if (!is.character(style)) {
    print(style)
  }

  style <- trimws(strsplit(style, ";")[[1]])
  style <- strsplit(style, ":", fixed = TRUE)
  valid <- lengths(style) == 2
  keys   <- trimws(vapply(style[valid], `[[`, character(1L), i = 1))
  values <- trimws(vapply(style[valid], `[[`, character(1L), i = 2))

  names(values) <- keys
  values
}

# Helpers -----------------------------------------------------------------

undim <- function(x) {
  dim(x) <- NULL
  x
}

insert_before <- function(x, i, value) {

  lens <- lengths(value)

  if (sum(lens) == 0) {
    return(x)
  }

  new <- vctrs::vec_init(x, length(x) + sum(lens))
  i <- rep(i, lens)
  i <- i + seq_along(i) - 1
  new[i] <- unlist(value, recursive = FALSE)
  new[-i] <- x
  new
}

insert_after <- function(x, i, value) {

  lens <- lengths(value)

  if (sum(lens) == 0) {
    return(x)
  }

  new <- vctrs::vec_init(x, length(x) + sum(lens))
  i <- rep(i, lens)
  i <- i + seq_along(i)
  new[i] <- unlist(value, recursive = FALSE)
  new[-i] <- x
  new
}

defaults <- function(x, y) c(x, y[setdiff(names(y), names(x))])

# Classes -----------------------------------------------------------------

grid_resolve_style <- function(layout, data) {

  # Fill in css parameters
  css <- parse_css(data = data)

  # For reasons unknown to me, rows have declared margins but these
  # Don't appear to be enforced if I inspect html pages
  css$gt_row["margin"] <- "0"

  # Translate classes to the css parameters
  classes <- layout$classes
  lens    <- lengths(classes)
  classes <- unlist(classes)
  content <- vctrs::vec_chop(css[classes], sizes = lens)

  # Merge classes
  content <- lapply(content, Reduce, f = defaults, right = TRUE)

  # Merge in style field
  has_style <- which(!is.na(layout$style))
  style <- lapply(layout$style[has_style], parse_style)
  content[has_style] <- Map(defaults, x = style, y = content[has_style])

  # Set defaults from gt_table, except borders
  default <- css$gt_table
  default <- default[!grepl("border", names(default))]
  content <- Map(defaults, x = content, y = list(default))

  # Translate to grid parameters
  base_size <- parse_px_to_pt(css$gt_table["font-size"])
  content   <- lapply(content, class_to_grid, base_size = base_size)
  content
}

.required_fields <-
  c(
    "background-color", "border-bottom-color", "border-bottom-style",
    "border-bottom-width", "border-left-color", "border-left-style",
    "border-left-width", "border-right-color", "border-right-style",
    "border-right-width", "border-top-color", "border-top-style",
    "border-top-width", "color", "font-family", "font-size", "font-style",
    "font-weight", "margin", "margin-left", "margin-right",
    "padding-bottom", "padding-left", "padding-right", "padding-top",
    "text-align", "text-indent", "text-transform", "vertical-align", "width"
  )

class_to_grid <- function(values, base_size) {

  values <- as.list(values)
  missing <- setdiff(.required_fields, names(values))
  values[missing] <- list(NULL)

  names(values) <- gsub("-", "_", names(values), fixed = TRUE)

  out <-
    with(values, list(
      text_gp = grid::gpar(
        fontfamily = parse_fontfamily(font_family),
        fontsize   = parse_fontsize(font_size, base_size),
        fontface   = parse_fontface(font_weight, font_style),
        col        = rgba_to_hex(color)
      ),
      vjust = parse_vjust(vertical_align %||% "bottom"),
      hjust = parse_hjust(text_align %||% "left"),
      margin = grid::unit(parse_px_to_pt(
        c(
          padding_top    %||% 0, padding_right %||% 0,
          padding_bottom %||% 0, padding_left  %||% 0
        )
      ), "pt")
  ))

  borders <- lapply(.trbl, function(side) {

    fields <- paste0("border_", side, "_", c("style", "width", "color"))

    parse_border(
      style = values[[fields[1]]],
      width = values[[fields[2]]],
      color = values[[fields[3]]],
      side  = side
    )
  })

  out[c("border_gp", "border_xy")] <- inject(combine_borders(!!!borders))

  if (!is.null(values$margin)) {

    margin <- parse_px_to_pt(values$margin)
    out$margin <- out$margin + grid::unit(margin / 2, "pt")
  }

  if (!is.null(values$text_indent)) {

    indent <- parse_px_to_pt(values$text_indent)
    out$margin[4] <- out$margin[4] + grid::unit(indent, "pt")
  }

  if (!is.null(values$background_color)) {

    background  <- rgba_to_hex(values$background_color)
    out$cell_gp <- grid::gpar(fill = background, col = NA)
  }

  out[["border"]] <- NULL
  out
}

# This is a very dumb css parser that is only suitable to parse the css output
# of the gt_styles_default.scss file
parse_css <- function(data) {

  # Compile css class definitions
  css <- compile_scss(data = data)
  css <- strsplit(css, "\n")[[1]]

  # Find first and last line of definitions
  start <- grep("\\{$", css)
  end   <- which(css == "}")

  if (length(start) != length(end)) {
    cli::cli_abort("Formatting in {.fn compile_css} is unexpected.")
  }

  # Format class names
  names <- css[start] # start of definition
  n <- nchar(names)
  names <- substr(names, start = 2, stop = n - 2)

  # Clean up whitespace and trailing semicolons
  css <- trimws(css)
  css <- gsub(";", "", css, fixed = TRUE)

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
  classes <- classes[startsWith(names(classes), "gt_")]

  # There are two entries for gt_table that we merge here
  is_table <- which(names(classes) == "gt_table")
  table <- Reduce(defaults, classes[is_table])
  c(classes[-is_table], list(gt_table = table))
}

#' @export
plot.gt_tbl <- function(x, y, ...) {
  plot(as_gtable(x))
}
