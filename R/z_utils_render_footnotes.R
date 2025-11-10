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


#' Resolve footnotes or styles
#'
#' @noRd
resolve_footnotes_styles <- function(data, tbl_type) {

  spanners <- dt_spanners_get(data = data)
  body <- dt_body_get(data = data)
  groups_rows_df <- dt_groups_rows_get(data = data)

  # Get the `footnote_marks` option from the options table
  footnote_marks <- dt_options_get_value(data = data, option = "footnotes_marks")

  # Get the `footnote_order` option from the options table
  footnote_order <- dt_options_get_value(data = data, option = "footnotes_order")

  rlang::arg_match0(tbl_type, c("footnotes", "styles"))

  if (tbl_type == "footnotes") {
    tbl <- dt_footnotes_get(data = data)
  } else {
    tbl <- dt_styles_get(data = data)
  }

  # Return `data` unchanged if there are no rows in `tbl`
  if (nrow(tbl) == 0L) {
    return(data)
  }

  # Obtain all of the visible (`"default"`), non-stub
  # column names for the table
  default_vars <- dt_boxhead_get_vars_default(data = data)

  cond <-
    (tbl$locname != "data" & tbl$locname != "columns_columns") |
    (tbl$colname %in% default_vars)

  tbl <- tbl[cond, ]

  # Return `data` unchanged if there are no rows in `tbl`
  if (nrow(tbl) == 0L) {
    return(data)
  }

  #
  # Pare down the rows in `tbl` to only those with active locations
  #

  # Filter `tbl` by elements preceding the data rows
  # (i.e., if element is not present but a reference is,
  # remove the footnote reference since it is not relevant)

  # Filter by `title`
  if (!dt_heading_has_title(data = data)) {
    tbl <- tbl[tbl$locname != "title", ]
  }

  # Filter by `subtitle`
  if (!dt_heading_has_subtitle(data = data)) {
    tbl <- tbl[tbl$locname != "subtitle", ]
  }

  # Filter by `grpname` in columns groups
  if ("columns_groups" %in% tbl[["locname"]]) { # remove conditional

    spanner_ids <- unique(unlist(spanners$spanner_id))

    tbl <- tbl[tbl$locname != "column_groups" | tbl$grpname %in% spanner_ids, , drop = FALSE]
  }

  # Filter by `grpname` in row groups
  if ("row_groups" %in% tbl[["locname"]]) {

    tbl <-
      vctrs::vec_rbind(
        tbl[tbl$locname != "row_groups", , drop = FALSE],
        tbl[tbl$locname == "row_groups" & tbl$grpname %in% groups_rows_df$group_id, , drop = FALSE]
      )
  }

  # Filter `tbl` by the remaining columns in `body` AND stub columns
  # Include stub columns so that stub footnotes are not filtered out
  default_vars <- dt_boxhead_get_vars_default(data = data)
  stub_vars <- dt_boxhead_get_var_by_type(data = data, type = "stub")
  tbl <- tbl[is.na(tbl$colname) | tbl$colname %in% c(default_vars, stub_vars), , drop = FALSE]

  # Return `data` unchanged if there are no rows in `tbl`
  if (nrow(tbl) == 0L) {
    return(data)
  }

  # Reorganize records that target the data rows
  if (any(tbl[["locname"]] %in% c("data", "stub"))) {

    data_cond <- tbl$locname %in% c("data", "stub")
    tbl_not_data <- tbl[!data_cond, ]

    tbl_data <- tbl[data_cond, ]

    if (nrow(tbl_data) > 0L) {

      # Re-map the `rownum` to the new row numbers for the data rows
      tbl_data$rownum <-
        rownum_translation(
          body = body,
          rownum_start = tbl_data$rownum
        )

      # Add a `colnum` column that's required for
      # arranging `tbl` in such a way that the order
      # of records moves from top-to-bottom, left-to-right

      # For stub footnotes, we need to set colnum based on the position
      # of each stub column (leftmost = most negative)
      tbl_data$colnum <- rep(NA_integer_, nrow(tbl_data))

      # Handle stub footnotes
      stub_mask <- tbl_data$locname == "stub"

      if (any(stub_mask)) {

        # Get stub columns in order
        stub_cols <- dt_boxhead_get_var_by_type(data = data, type = "stub")

        for (i in which(stub_mask)) {

          colname <- tbl_data$colname[i]

          if (is.na(colname)) {

            # Traditional stub footnotes without specific column
            tbl_data$colnum[i] <- 0L

          } else {

            # Find position of this column in stub columns
            stub_pos <- match(colname, stub_cols)

            if (is.na(stub_pos)) {

              tbl_data$colnum[i] <- 0L  # fallback

            } else {

              # Make leftmost column most negative
              tbl_data$colnum[i] <- -(length(stub_cols) - stub_pos + 1)
            }
          }
        }
      }

      # Handle data footnotes
      data_mask <- tbl_data$locname == "data"
      if (any(data_mask)) {
        tbl_data$colnum[data_mask] <- colname_to_colnum(data = data, colname = tbl_data$colname[data_mask])
      }
    }

    # Re-combine `tbl_data` with `tbl`
    tbl <- vctrs::vec_rbind(tbl_not_data, tbl_data)

  } else {
    tbl$colnum <- NA_integer_
  }

  # For the row groups, insert a `rownum` based on `groups_rows_df`
  if ("row_groups" %in% tbl[["locname"]]) {

    cond <- tbl$locname != "row_groups"
    tbl_not_row_groups <- tbl[cond, ]

    tbl_row_groups <-
      dplyr::inner_join(
        tbl[!cond, ],
        groups_rows_df,
        by = c("grpname" = "group_id")
      )

    tbl_row_groups$rownum <- tbl_row_groups$row_start - 0.1
    tbl_row_groups$colnum <- 1
    tbl_row_groups$row_start <- NULL
    tbl_row_groups$row_end <- NULL
    tbl_row_groups$group_label <- NULL

    # Re-combine `tbl_not_row_groups` with `tbl_row_groups`
    tbl <- vctrs::vec_rbind(tbl_not_row_groups, tbl_row_groups)
  }

  # For the summary cells, insert a `rownum` based
  # on `groups_rows_df`
  if ("summary_cells" %in% tbl[["locname"]]) {

    cond <- tbl$locname != "summary_cells"
    tbl_not_summary_cells <- tbl[cond,]

    tbl_summary_cells <-
      dplyr::inner_join(
        tbl[!cond & tbl$locname == "summary_cells", , drop = FALSE],
        groups_rows_df,
        by = c("grpname" = "group_id")
      )

    tbl_summary_cells$rownum <-
      tbl_summary_cells$rownum / 100 + tbl_summary_cells$row_end

    tbl_summary_cells$row_start <- NULL
    tbl_summary_cells$row_end <- NULL
    tbl_summary_cells$group_label <- NULL

    tbl_summary_cells$colnum <-
      colname_to_colnum(
        data,
        tbl_summary_cells$colname,
        missing_is_zero = TRUE
      )

    # Re-combine `tbl_not_summary_cells` with `tbl_summary_cells`
    tbl <- vctrs::vec_rbind(tbl_not_summary_cells, tbl_summary_cells)
  }

  # For the grand summary cells, insert a `colnum` based
  # on `groups_rows_df`
  if (6 %in% tbl[["locnum"]]) {

    cond <- tbl$locnum != 6
    tbl_not_g_summary_cells <- tbl[cond, ]

    tbl_g_summary_cells <- tbl[!cond, ]

    tbl_g_summary_cells$colnum <-
      colname_to_colnum(
        data = data,
        colname = tbl_g_summary_cells$colname,
        missing_is_zero = TRUE
      )

    # Re-combine `tbl_not_g_summary_cells`
    # with `tbl_g_summary_cells`
    tbl <-
      vctrs::vec_rbind(
        tbl_not_g_summary_cells, tbl_g_summary_cells
      )
  }

  # For the column label cells, insert a `colnum`
  # based on `boxh_df`
  if ("columns_columns" %in% tbl[["locname"]]) {

    cond <- tbl$locname != "columns_columns"
    tbl_not_column_cells <- tbl[cond, ]

    tmp <- tbl[!cond, ]
    tmp$colnum <- NULL
    tmp$rownum <- NULL

    default_variables <- vctrs::data_frame(
      colnum = seq(default_vars),
      colname = default_vars,
      rownum = -1L
    )

    tbl_column_cells <-
      dplyr::inner_join(tmp, default_variables, by = "colname")

    # Re-combine `tbl_not_column_cells`
    # with `tbl_column_cells`
    tbl <-
      vctrs::vec_rbind(
        tbl_not_column_cells,
        tbl_column_cells
      )
  }

  # For the column spanner label cells, insert a
  # `colnum` based on `boxh_df`
  if ("columns_groups" %in% tbl[["locname"]]) {

    tbl_not_col_spanner_cells <- tbl[tbl$locname != "columns_groups", ]

    spanner_id_names <- dt_spanners_get_ids(data = data)

    spanners_matrix_ids <-
      dt_spanners_print_matrix(
        data = data,
        include_hidden = FALSE,
        ids = TRUE,
        omit_columns_row = TRUE
      )

    spanner_id <- spanner_start_colname <- spanner_start_colnum <- level <- NULL # same as c()

    for (i in seq_along(spanner_id_names)) {

      if (spanner_id_names[i] %in% spanners_matrix_ids) {

        for (j in seq_len(nrow(spanners_matrix_ids))) {

          if (spanner_id_names[i] %in% spanners_matrix_ids[j, ]) {

            spanner_start_colname_i <-
              names(
                sort(
                  spanners_matrix_ids[j, ] == spanner_id_names[i],
                  decreasing = TRUE
                )[1]
              )

            spanner_start_colname <- c(spanner_start_colname, spanner_start_colname_i)

            spanner_start_colnum <-
              c(
                spanner_start_colnum,
                which(default_vars == spanner_start_colname_i)
              )

            level <-
              c(
                level,
                ((rev(seq_len(nrow(spanners_matrix_ids))) + 1) * (-1))[j]
              )

            spanner_id <- c(spanner_id, spanner_id_names[i])
          }
        }
      }
    }

    spanner_label_df <-
      data.frame(
        grpname = spanner_id,
        colname = spanner_start_colname,
        colnum = spanner_start_colnum,
        rownum = level,
        stringsAsFactors = FALSE
      )

    if (nrow(spanner_label_df) > 0L) {

      tmp <- tbl
      tmp[ c("colnum", "colname", "rownum")] <- NULL
      tmp <- tmp[tmp$locname == "columns_groups", ]

      tbl_column_spanner_cells <-
        dplyr::inner_join(tmp, spanner_label_df, by = "grpname")

      # Re-combine `tbl_not_col_spanner_cells` with `tbl_not_col_spanner_cells`
      tbl <-
        vctrs::vec_rbind(
          tbl_not_col_spanner_cells,
          tbl_column_spanner_cells
        )

    } else {
      tbl <- tbl_not_col_spanner_cells
    }
  }

  # For styles, sort the table rows by the standard order
  if (tbl_type == "styles") {

    order_of_tbl <- order(tbl$locnum, tbl$rownum, tbl$colnum)
    tbl <- tbl[order_of_tbl, , drop = FALSE]
  }

  # In the case of footnotes, populate table
  # column with footnote marks
  if (tbl_type == "footnotes") {

    # Don't sort if order is preserved
    if (footnote_order != "preserve_order") {

      # Sort all footnotes by visual position: locnum, rownum, colnum
      # This ensures left-to-right, top-to-bottom ordering of footnote marks
      # since we've already set proper colnum values for stub footnotes
      if (nrow(tbl) > 0L) {
        order_of_tbl <- order(tbl$locnum, tbl$rownum, tbl$colnum, na.last = TRUE)
        tbl <- tbl[order_of_tbl, , drop = FALSE]
      }
    }

    # Generate a lookup table with ID'd footnote
    # text elements (that are distinct) but preserve the sorted order
    footnotes_ordered <- tbl[tbl$locname != "none", "footnotes", drop = FALSE]

    # Create a lookup table that preserves the order from the sorted table
    # Use the order of first appearance in the sorted table
    lookup_tbl <-
      footnotes_ordered[!duplicated(footnotes_ordered$footnotes), , drop = FALSE]

    # Assign fs_id based on the order in the sorted table (1, 2, 3, ...)
    lookup_tbl$fs_id <- as.character(seq_len(nrow(lookup_tbl)))

    # Join the lookup table to `tbl`
    tbl <- dplyr::left_join(tbl, lookup_tbl, by = "footnotes")
    tbl$fs_id <- ifelse(tbl$locname == "none", NA_character_, tbl$fs_id)

    if (nrow(tbl) > 0L) {

      # Retain the row that only contain `locname == "none"`
      tbl_no_loc <- tbl[tbl$locname == "none", , drop = FALSE]

      # Modify `fs_id` to contain the footnote marks we need
      tbl <- tbl[tbl$locname != "none", , drop = FALSE]

      if (nrow(tbl) > 0L) {

        tbl$fs_id <- as.integer(tbl$fs_id)
        tbl$fs_id <- process_footnote_marks(tbl$fs_id, marks = footnote_marks)
      }

      if (footnote_order == "marks_first") {

        tbl <- vctrs::vec_rbind(tbl, tbl_no_loc)

      } else if (footnote_order == "preserve_order") {

        footnotes_all <- vctrs::vec_rbind(tbl_no_loc, tbl)

        # get original order from data
        order <- dplyr::select(data$`_footnotes`, locname, footnotes)

        # sort by original order
        tbl <-
          dplyr::left_join(
            order,
            footnotes_all,
            by = c("locname", "footnotes")
          ) |>
          dplyr::select(names(footnotes_all))

      } else {

        tbl <- vctrs::vec_rbind(tbl_no_loc, tbl)
      }
    }
  }

  if (tbl_type == "styles" && nrow(tbl) > 0L) {
    tbl <-
      dplyr::summarize(
        tbl,
        styles = list(as_style(styles)),
        .by =  c("locname", "grpname", "colname", "locnum", "rownum", "colnum")
      )
  }

  if (tbl_type == "footnotes") {
    data <- dt_footnotes_set(data = data, footnotes = tbl)
  } else {
    data <- dt_styles_set(data = data, styles = tbl)
  }

  data
}

#' @noRd
set_footnote_marks_columns <- function(data, context = "html") {

  boxh <- dt_boxhead_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)

  # If there are any footnotes to apply to the columns,
  # process them individually for the spanner groups and
  # for the column label groups
  if (any(c("columns_columns", "columns_groups") %in% footnotes_tbl$locname)) {

    # Filter the spanner column footnotes
    footnotes_columns_groups_tbl <-
      footnotes_tbl[footnotes_tbl$locname == "columns_groups", ]

    # Filter the column label footnotes
    footnotes_columns_columns_tbl <-
      footnotes_tbl[footnotes_tbl$locname == "columns_columns", ]

    if (nrow(footnotes_columns_groups_tbl) > 0) {

      footnotes_columns_group_marks <-
        dplyr::mutate(
          footnotes_columns_groups_tbl,
          fs_id_coalesced = paste(sort(fs_id), collapse = ","),
          .by = "grpname"
        )

      footnotes_columns_group_marks <-
        dplyr::distinct(
          footnotes_columns_group_marks,
          grpname, fs_id_coalesced
        )

      for (i in seq_len(nrow(footnotes_columns_group_marks))) {

        spanners <- dt_spanners_get(data = data)

        spanner_labels <-
          as.vector(
            dt_spanners_print_matrix(
              data = data,
              omit_columns_row = TRUE
            )
          )

        spanner_ids <-
          as.vector(
            dt_spanners_print_matrix(
              data = data,
              ids = TRUE,
              omit_columns_row = TRUE
            )
          )

        vector_indices <-
          which(spanner_ids == footnotes_columns_group_marks$grpname[i])

        text <- unique(spanner_labels[vector_indices])

        text <-
          apply_footnotes_method[[context]](
            text,
            footnotes_dispatch[[context]](
              data = data,
              mark = footnotes_columns_group_marks$fs_id_coalesced[i]
            )
          )

        spanners_i <-
          which(
            unlist(spanners$spanner_id) == footnotes_columns_group_marks$grpname[i]
          )

        spanners[spanners_i, ][["built"]] <- text

        data <- dt_spanners_set(data = data, spanners = spanners)
      }
    }

    if (nrow(footnotes_columns_columns_tbl) > 0) {

      footnotes_columns_column_marks <-
        vctrs::vec_slice(
          footnotes_columns_columns_tbl,
          !is.na(footnotes_columns_columns_tbl$locname) &
            footnotes_columns_columns_tbl$locname == "columns_columns"
        )
      footnotes_columns_column_marks <-
        dplyr::mutate(
          footnotes_columns_column_marks,
          fs_id_coalesced = paste(sort(fs_id), collapse = ","),
          .by = "colname"
        )
      footnotes_columns_column_marks <-
        dplyr::distinct(
          footnotes_columns_column_marks, colname, fs_id_coalesced
        )

      for (i in seq_len(nrow(footnotes_columns_column_marks))) {

        text <-
          apply_footnotes_method[[context]](
            boxh$column_label[
              boxh$var == footnotes_columns_column_marks$colname[i]][[1]],
            footnotes_dispatch[[context]](
              data = data,
              mark = footnotes_columns_column_marks$fs_id_coalesced[i]
            )
          )

        boxh <-
          dplyr::mutate(
            boxh,
            column_label = dplyr::case_when(
              var == footnotes_columns_column_marks$colname[i] ~ list(text),
              .default = column_label
            )
          )

        data <- dt_boxhead_set(data = data, boxh = boxh)
      }
    }
  }

  data
}

#' Set footnote marks for the stubhead
#'
#' @noRd
set_footnote_marks_stubhead <- function(data, context = "html") {

  footnotes_tbl <- dt_footnotes_get(data = data)
  stubhead <- dt_stubhead_get(data = data)

  label <- stubhead$label

  if ("stubhead" %in% footnotes_tbl$locname) {

    footnotes_tbl <- footnotes_tbl[footnotes_tbl$locname == "stubhead", ]

    if (nrow(footnotes_tbl) > 0) {

      footnotes_stubhead_marks <-
        dplyr::mutate(
          footnotes_tbl,
          fs_id_coalesced = paste(sort(fs_id), collapse = ","),
          .by = "grpname"
        )
      footnotes_stubhead_marks <-
        dplyr::distinct(footnotes_stubhead_marks, grpname, fs_id_coalesced)
      footnotes_stubhead_marks <- footnotes_stubhead_marks$fs_id_coalesced

      label <-
        paste0(
          label,
          footnotes_dispatch[[context]](
            data = data,
            mark = footnotes_stubhead_marks
          )
        )
    }
  }

  dt_stubhead_label(data = data, label = label)
}

#' Apply footnotes to the data rows
#'
#' @noRd
apply_footnotes_to_output <- function(data, context = "html") {

  body <- dt_body_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)

  # `data` location
  footnotes_tbl_data <-
    footnotes_tbl[footnotes_tbl$locname %in% c("data", "stub"), ]

  if (nrow(footnotes_tbl_data) > 0) {

    if (
      "stub" %in% footnotes_tbl_data$locname &&
      length(dt_boxhead_get_var_stub(data)) > 0
    ) {

      boxhead_var_stub <- dt_boxhead_get_var_stub(data = data)

      # For stub footnotes with NA colname, this indicates legacy usage
      # where footnotes should be applied to all stub columns
      na_colname_indices <-
        which(
          is.na(footnotes_tbl_data$colname) &
          footnotes_tbl_data$locname == "stub"
        )

      if (length(na_colname_indices) > 0) {

        # For multi-column stubs, legacy footnotes (without specific columns)
        # should only be applied to the first stub column for
        # backward compatibility
        footnotes_tbl_data$colname[na_colname_indices] <- boxhead_var_stub[1]
      }
    }

    # Ensure fs_id column exists (it should be added by resolve_footnotes_styles)
    if (!"fs_id" %in% names(footnotes_tbl_data)) {

      # Add a temporary fs_id based on row numbers as fallback
      footnotes_tbl_data$fs_id <-
        as.character(seq_len(nrow(footnotes_tbl_data)))
    }

    footnotes_data_marks <-
      dplyr::mutate(
        footnotes_tbl_data,
        fs_id_coalesced = paste(fs_id, collapse = ","),
        .by = if (any(footnotes_tbl_data$locname == "stub")) {
          # For stub footnotes, group by rownum, colnum, and colname to ensure
          # footnotes are targeted correctly to specific stub columns
          c("rownum", "colnum", "colname")
        } else {
          # For non-stub footnotes, use the original grouping
          c("rownum", "colnum")
        }
      )
    footnotes_data_marks <-
      dplyr::distinct(
        footnotes_data_marks, colname, rownum, locname,
        placement, fs_id_coalesced,
        .keep_all = TRUE
      )

    # Get the correct footnote rendering functions
    withCallingHandlers(
      footnotes_dispatch[[context]],
      error = function(e) cli::cli_abort("Can't find the correct rendering function for context = {.val {context}}", parent = e)
    )
    withCallingHandlers(
      apply_footnotes_method[[context]],
      error = function(e) cli::cli_abort("Can't find the correct rendering function for footnotes for context = {.val {context}}", parent = e)
    )

    for (i in seq_len(nrow(footnotes_data_marks))) {

      text <-
        body[[footnotes_data_marks$rownum[i], footnotes_data_marks$colname[i]]]

      colname   <- footnotes_data_marks[i, "colname", drop = TRUE]
      rownum    <- footnotes_data_marks[i, "rownum", drop = TRUE]
      placement <- footnotes_data_marks[i, "placement", drop = TRUE]

      footnote_placement <-
        resolve_footnote_placement(
          data = data,
          colname = colname,
          rownum = rownum,
          input_placement = placement,
          cell_content = text,
          context = context
        )

      mark <-
        footnotes_dispatch[[context]](
          data = data,
          mark = footnotes_data_marks$fs_id_coalesced[i]
        )

      if (footnote_placement == "right") {
        text <- place_footnote_on_right(text, mark, context)
      } else {
        # footnote_placement = "left"
        text <- place_footnote_on_left(text, mark, context)
      }

      body[footnotes_data_marks$rownum[i], footnotes_data_marks$colname[i]] <- text
    }
  }

  dt_body_set(data = data, body = body)
}

place_footnote_on_left <- function(text, mark, context) {

  if (context == "html" && startsWith(text, "<div class='gt_from_md'><p>")) {
    # #1013
    text <-
      paste0(
        "<div class='gt_from_md'><p>",
        mark, "\U000A0",
        gsub("<div class='gt_from_md'><p>", "", text, fixed = TRUE)
      )

  } else if (context == "html" && startsWith(text, "<div data-qmd-base64")) {

    # FIXME #1773, figure out how to tweak the regex (in Quarto)
    text <- paste(mark, text, sep = "\U000A0")

  } else if (context == "word" || context == "latex") {

    text <- apply_footnotes_method[[context]](text, mark, position = "left")

  } else if (context == "html" || context == "grid") {

    # Footnote placement on the left of the cell text; ensure that a
    # non-breaking space (added here as Unicode's 'NO-BREAK SPACE',
    # "U+00A0") separates the marks from the text content
    text <- paste(mark, text, sep = "\U000A0")

  } else if (context == "rtf") {
    text <- paste(mark, text)
  }

  text
}

place_footnote_on_right <- function(text, mark, context) {

  # Footnote placement on the right of the cell text
  if (context != "html") {
    return(apply_footnotes_method[[context]](text, mark))
  }

  if (endsWith(text, "</p>\n</div>")) {
    # regular html from_markdown #1013
    text <-
      paste0(
        gsub("</p>\n</div>", "", text, fixed = TRUE),
        mark,
        "</p></div>"
      )

  } else if (endsWith(text, "</p>\n</div></div>")) {

    # Processing html (This code may not be valid as of #1860)
    # FIXME possibly the place where we could fix #1773
    text <- apply_footnotes_method[[context]](text, mark)

  } else {

    text <- apply_footnotes_method[[context]](text, mark)
  }

  text
}


#' @noRd
set_footnote_marks_row_groups <- function(data, context = "html") {

  groups_rows_df <- dt_groups_rows_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)

  footnotes_row_groups_tbl <-
    footnotes_tbl[footnotes_tbl$locname == "row_groups", ]

  if (nrow(footnotes_row_groups_tbl) > 0) {

    footnotes_row_groups_marks <-
      dplyr::mutate(
        footnotes_row_groups_tbl,
        fs_id_coalesced = paste(sort(fs_id), collapse = ","),
        .by = "grpname"
      )

    # will only remain
    footnotes_row_groups_marks <-
      dplyr::distinct(footnotes_row_groups_marks, fs_id_coalesced, grpname)

    for (i in seq_len(nrow(footnotes_row_groups_marks))) {

      row_index <-
        which(groups_rows_df[, "group_id"] == footnotes_row_groups_marks$grpname[i])

      groups_rows_df[row_index, "group_label"] <-
        apply_footnotes_method[[context]](
          groups_rows_df[row_index, "group_label"],
          footnotes_dispatch[[context]](
            data = data,
            mark = footnotes_row_groups_marks$fs_id_coalesced[i]
          )
        )
    }
  }

  dt_groups_rows_set(
    data = data,
    groups_rows = groups_rows_df
  )
}

#' Apply footnotes to the summary rows
#'
#' @noRd
apply_footnotes_to_summary <- function(data, context = "html") {

  list_of_summaries <- dt_summary_df_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)

  # make sure rownames are recognized to add footnote marks
  # to cells_stub_grand_summary() / cells_stub_summary() #1832
  # dplyr::coalesce()
  footnotes_tbl$colname[is.na(footnotes_tbl$colname)] <- rowname_col_private
  summary_df_list <- list_of_summaries$summary_df_display_list

  if ("summary_cells" %in% footnotes_tbl$locname) {

    footnotes_tbl_data <- vctrs::vec_slice(
      footnotes_tbl,
      footnotes_tbl$locname == "summary_cells"
    )

    footnotes_tbl_data$row <- round((footnotes_tbl_data$rownum - floor(footnotes_tbl_data$rownum)) * 100, 0)
    footnotes_tbl_data$row <- as.integer(footnotes_tbl_data$row)

    footnotes_data_marks <-
      dplyr::mutate(
        footnotes_tbl_data,
        fs_id_coalesced = paste(sort(fs_id), collapse = ","),
        .by = c("grpname", "row", "colnum"),
      )

    footnotes_data_marks <-
      dplyr::distinct(footnotes_data_marks, grpname, colname, row, fs_id_coalesced)

    for (i in seq_len(nrow(footnotes_data_marks))) {

      summary_df_list[[footnotes_data_marks[i, ][["grpname"]]]][[
        footnotes_data_marks$row[i], footnotes_data_marks$colname[i]]] <-
        apply_footnotes_method[[context]](
          summary_df_list[[footnotes_data_marks[i, ][["grpname"]]]][[
            footnotes_data_marks$row[i], footnotes_data_marks$colname[i]]],
          footnotes_dispatch[[context]](
            data = data,
            mark = footnotes_data_marks$fs_id_coalesced[i]
          )
        )
    }

    list_of_summaries$summary_df_display_list <- summary_df_list
  }

  if ("grand_summary_cells" %in% footnotes_tbl$locname) {

    footnotes_tbl_data <-
      vctrs::vec_slice(
        footnotes_tbl,
        footnotes_tbl$locname == "grand_summary_cells"
      )

    footnotes_data_marks <-
      dplyr::mutate(
        footnotes_tbl_data,
        fs_id_coalesced = paste(sort(fs_id), collapse = ","),
        .by = c("rownum", "colnum")
      )

    footnotes_data_marks <-  dplyr::distinct(footnotes_data_marks, colname, rownum, fs_id_coalesced)

    for (i in seq_len(nrow(footnotes_data_marks))) {

      summary_df_list[[grand_summary_col]][[
        footnotes_data_marks$rownum[i], footnotes_data_marks$colname[i]
      ]] <-
        apply_footnotes_method[[context]](
          summary_df_list[[grand_summary_col]][[
            footnotes_data_marks$rownum[i], footnotes_data_marks$colname[i]]],
          footnotes_dispatch[[context]](
            data = data,
            mark = footnotes_data_marks$fs_id_coalesced[i]
          )
        )
    }

    list_of_summaries$summary_df_display_list[[grand_summary_col]] <-
      summary_df_list[[grand_summary_col]]
  }

  dt_summary_data_set(
    data = data,
    summary = list_of_summaries
  )
}

footnotes_dispatch <-
  list(
    html = footnote_mark_to_html,
    rtf = footnote_mark_to_rtf,
    grid = footnote_mark_to_grid,
    latex = footnote_mark_to_latex,
    word = footnote_mark_to_xml
  )

apply_footnotes_method <-
  list(
    html = paste0,
    rtf = paste0,
    grid = paste0,
    latex = paste_footnote_latex,
    word = paste_footnote_xml
  )
