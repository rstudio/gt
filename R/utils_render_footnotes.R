#' Resolve footnotes or styles
#'
#' @noRd
resolve_footnotes_styles <- function(data,
                                     tbl_type) {

  boxh <- dt_boxhead_get(data = data)
  spanners <- dt_spanners_get(data = data)
  body <- dt_body_get(data = data)
  groups_rows_df <- dt_groups_rows_get(data = data)

  # Get the `footnote_marks` option from the options table
  footnote_marks <- dt_options_get_value(data = data, option = "footnotes_marks")

  if (tbl_type == "footnotes") {
    tbl <- dt_footnotes_get(data = data)
  } else if (tbl_type == "styles") {
    tbl <- dt_styles_get(data = data)
  } else {
    cli::cli_abort("The `tbl_type` must be either \"footnotes\" or \"styles\".")
  }

  # Return `data` unchanged if there are no rows in `tbl`
  if (nrow(tbl) == 0) {
    return(data)
  }

  # Obtain all of the visible (`"default"`), non-stub
  # column names for the table
  default_vars <- dt_boxhead_get_vars_default(data = data)

  tbl <-
    dplyr::bind_rows(
      tbl %>% dplyr::filter(!(locname %in% c("data", "columns_columns"))),
      tbl %>%
        dplyr::filter(locname %in% c("data", "columns_columns")) %>%
        dplyr::filter(colname %in% default_vars)
    )

  # Return `data` unchanged if there are no rows in `tbl`
  if (nrow(tbl) == 0) {
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

    tbl <- dplyr::filter(tbl, locname != "title")
  }

  # Filter by `subtitle`
  if (!dt_heading_has_subtitle(data = data)) {

    tbl <- dplyr::filter(tbl, locname != "subtitle")
  }

  # Filter by `grpname` in columns groups
  if ("columns_groups" %in% tbl[["locname"]]) { # remove conditional

    spanner_ids <- unique(unlist(spanners$spanner_id))

    tbl <-
      dplyr::filter(
        tbl,
        locname != "columns_groups" | grpname %in% spanner_ids
      )
  }

  # Filter by `grpname` in row groups
  if ("row_groups" %in% tbl[["locname"]]) {

    tbl <-
      dplyr::bind_rows(
        dplyr::filter(tbl, locname != "row_groups"),
        tbl %>%
          dplyr::filter(locname == "row_groups") %>%
          dplyr::filter(grpname %in% groups_rows_df$group_id)
      )
  }

  # Filter `tbl` by the remaining columns in `body`
  tbl <-
    dplyr::filter(
      tbl,
      colname %in% c(NA_character_, dt_boxhead_get_vars_default(data = data))
    )

  # Return `data` unchanged if there are no rows in `tbl`
  if (nrow(tbl) == 0) {
    return(data)
  }

  # Reorganize records that target the data rows
  if (any(tbl[["locname"]] %in% c("data", "stub"))) {

    tbl_not_data <- dplyr::filter(tbl, !(locname %in% c("data", "stub")))

    tbl_data <- dplyr::filter(tbl, locname %in% c("data", "stub"))

    if (nrow(tbl_data) > 0) {

      # Re-map the `rownum` to the new row numbers for the
      # data rows
      tbl_data <-
        dplyr::mutate(
          tbl_data,
          rownum = rownum_translation(
            body = body,
            rownum_start = rownum)
        )

      # Add a `colnum` column that's required for
      # arranging `tbl` in such a way that the order
      # of records moves from top-to-bottom, left-to-right
      tbl_data <-
        tbl_data %>%
        dplyr::mutate(colnum = colname_to_colnum(data = data, colname = colname)) %>%
        dplyr::mutate(colnum = ifelse(locname == "stub", 0L, colnum))
    }

    # Re-combine `tbl_data` with `tbl`
    tbl <- dplyr::bind_rows(tbl_not_data, tbl_data)

  } else {

    tbl <- dplyr::mutate(tbl, colnum = NA_integer_)
  }

  # For the row groups, insert a `rownum` based on `groups_rows_df`
  if ("row_groups" %in% tbl[["locname"]]) {

    tbl_not_row_groups <- dplyr::filter(tbl, locname != "row_groups")

    tbl_row_groups <-
      tbl %>%
      dplyr::filter(locname == "row_groups") %>%
      dplyr::inner_join(
        groups_rows_df %>% dplyr::select(-group_label),
        by = c("grpname" = "group_id")
      ) %>%
      dplyr::mutate(rownum = row_start - 0.1) %>%
      dplyr::mutate(colnum = 1) %>%
      dplyr::select(-row_start, -row_end)

    # Re-combine `tbl_not_row_groups`
    # with `tbl_row_groups`
    tbl <- dplyr::bind_rows(tbl_not_row_groups, tbl_row_groups)
  }

  # For the summary cells, insert a `rownum` based
  # on `groups_rows_df`
  if ("summary_cells" %in% tbl[["locname"]]) {

    tbl_not_summary_cells <- dplyr::filter(tbl, locname != "summary_cells")

    tbl_summary_cells <-
      tbl %>%
      dplyr::filter(locname == "summary_cells") %>%
      dplyr::inner_join(
        groups_rows_df %>% dplyr::select(-group_label),
        by = c("grpname" = "group_id")
      ) %>%
      dplyr::mutate(rownum = (rownum / 100) + row_end) %>%
      dplyr::select(-row_start, -row_end) %>%
      dplyr::mutate(colnum = colname_to_colnum(
        data = data,
        colname = colname,
        missing_is_zero = TRUE
      ))

    # Re-combine `tbl_not_summary_cells`
    # with `tbl_summary_cells`
    tbl <- dplyr::bind_rows(tbl_not_summary_cells, tbl_summary_cells)
  }

  # For the grand summary cells, insert a `colnum` based
  # on `groups_rows_df`
  if (6 %in% tbl[["locnum"]]) {

    tbl_not_g_summary_cells <- dplyr::filter(tbl, locnum != 6)

    tbl_g_summary_cells <-
      tbl %>%
      dplyr::filter(locnum == 6) %>%
      dplyr::mutate(colnum = colname_to_colnum(
        data = data,
        colname = colname,
        missing_is_zero = TRUE
      ))

    # Re-combine `tbl_not_g_summary_cells`
    # with `tbl_g_summary_cells`
    tbl <-
      dplyr::bind_rows(
        tbl_not_g_summary_cells, tbl_g_summary_cells
      )
  }

  # For the column label cells, insert a `colnum`
  # based on `boxh_df`
  if ("columns_columns" %in% tbl[["locname"]]) {

    tbl_not_column_cells <- dplyr::filter(tbl, locname != "columns_columns")

    tbl_column_cells <-
      tbl %>%
      dplyr::select(-colnum, -rownum) %>%
      dplyr::filter(locname == "columns_columns") %>%
      dplyr::inner_join(
        dplyr::tibble(
          colnum = seq(default_vars),
          colname = default_vars,
          rownum = -1L
        ),
        by = "colname"
      )

    # Re-combine `tbl_not_column_cells`
    # with `tbl_column_cells`
    tbl <-
      dplyr::bind_rows(
        tbl_not_column_cells,
        tbl_column_cells
      )
  }

  # For the column spanner label cells, insert a
  # `colnum` based on `boxh_df`
  if ("columns_groups" %in% tbl[["locname"]]) {

    tbl_not_col_spanner_cells <- dplyr::filter(tbl, locname != "columns_groups")

    vars_default <- seq_along(dt_boxhead_get_vars_default(data = data))

    spanner_id_names <- dt_spanners_get_ids(data = data)

    spanners_matrix_ids <-
      dt_spanners_print_matrix(
        data = data,
        include_hidden = FALSE,
        ids = TRUE,
        omit_columns_row = TRUE
      )

    spanner_id <- spanner_start_colname <- spanner_start_colnum <- level <- c()

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
      dplyr::tibble(
        grpname = spanner_id,
        colname = spanner_start_colname,
        colnum = spanner_start_colnum,
        rownum = level
      )

    if (nrow(spanner_label_df) > 0) {

      tbl_column_spanner_cells <-
        tbl %>%
        dplyr::select(-colnum, -colname, -rownum) %>%
        dplyr::filter(locname == "columns_groups") %>%
        dplyr::inner_join(spanner_label_df, by = "grpname")

      # Re-combine `tbl_not_col_spanner_cells` with `tbl_not_col_spanner_cells`
      tbl <-
        dplyr::bind_rows(
          tbl_not_col_spanner_cells,
          tbl_column_spanner_cells
        )

    } else {
      tbl <- tbl_not_col_spanner_cells
    }
  }

  # Sort the table rows
  tbl <- dplyr::arrange(tbl, locnum, rownum, colnum)

  # In the case of footnotes, populate table
  # column with footnote marks
  if (tbl_type == "footnotes") {

    # Generate a lookup table with ID'd footnote
    # text elements (that are distinct)
    lookup_tbl <-
      tbl %>%
      dplyr::filter(locname != "none") %>%
      dplyr::select(footnotes) %>%
      dplyr::distinct() %>%
      tibble::rownames_to_column(var = "fs_id")

    # Join the lookup table to `tbl`
    tbl <-
      dplyr::left_join(tbl, lookup_tbl, by = "footnotes") %>%
      dplyr::mutate(fs_id = ifelse(locname == "none", NA_character_, fs_id))

    if (nrow(tbl) > 0) {

      # Retain the row that only contain `locname == "none"`
      tbl_no_loc <- dplyr::filter(tbl, locname == "none")

      # Modify `fs_id` to contain the footnote marks we need
      tbl <- dplyr::filter(tbl, locname != "none")

      if (nrow(tbl) > 0) {

        tbl <-
          dplyr::mutate(
            tbl,
            fs_id = process_footnote_marks(
              x = as.integer(fs_id),
              marks = footnote_marks
            )
          )
      }

      tbl <- dplyr::bind_rows(tbl_no_loc, tbl)
    }
  }

  if (tbl_type == "styles") {

    if (nrow(tbl) > 0) {

      tbl <-
        tbl %>%
        dplyr::group_by(locname, grpname, colname, locnum, rownum, colnum) %>%
        dplyr::summarize(styles = list(as_style(styles))) %>%
        dplyr::ungroup()
    }
  }

  if (tbl_type == "footnotes") {
    data <- dt_footnotes_set(data = data, footnotes = tbl)
  } else {
    data <- dt_styles_set(data = data, styles = tbl)
  }

  data
}

#' @noRd
set_footnote_marks_columns <- function(data,
                                       context = "html") {

  boxh <- dt_boxhead_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)

  # Get the correct `footnote_mark_to_*()` function for the context
  footnote_mark_fn <-
    switch(
      context,
      html = footnote_mark_to_html,
      latex = footnote_mark_to_latex,
      rtf = footnote_mark_to_rtf
    )

  # If there are any footnotes to apply to the columns,
  # process them individually for the spanner groups and
  # for the column label groups
  if (any(c("columns_columns", "columns_groups") %in% footnotes_tbl$locname)) {

    footnotes_tbl <-
      dplyr::filter(
        footnotes_tbl,
        locname %in% c("columns_columns", "columns_groups")
      )

    # Filter the spanner column footnotes
    footnotes_columns_groups_tbl <-
      dplyr::filter(footnotes_tbl, locname == "columns_groups")

    # Filter the column label footnotes
    footnotes_columns_columns_tbl <-
      dplyr::filter(footnotes_tbl, locname == "columns_columns")

    if (nrow(footnotes_columns_groups_tbl) > 0) {

      footnotes_columns_group_marks <-
        footnotes_columns_groups_tbl %>%
        dplyr::group_by(grpname) %>%
        dplyr::mutate(fs_id_coalesced = paste(fs_id, collapse = ",")) %>%
        dplyr::ungroup() %>%
        dplyr::select(grpname, fs_id_coalesced) %>%
        dplyr::distinct()

      for (i in seq(nrow(footnotes_columns_group_marks))) {

        spanners <- dt_spanners_get(data = data)
        spanner_labels <- dt_spanners_print_matrix(data = data, omit_columns_row = TRUE) %>% as.vector()
        spanner_ids <- dt_spanners_print_matrix(data = data, ids = TRUE, omit_columns_row = TRUE) %>% as.vector()
        vector_indices <- which(spanner_ids == footnotes_columns_group_marks$grpname[i])

        text <- unique(spanner_labels[vector_indices])
        text <- paste0(text, footnote_mark_fn(footnotes_columns_group_marks$fs_id_coalesced[i]))

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
        footnotes_columns_columns_tbl %>%
        dplyr::filter(locname == "columns_columns") %>%
        dplyr::group_by(colname) %>%
        dplyr::mutate(fs_id_coalesced = paste(fs_id, collapse = ",")) %>%
        dplyr::ungroup() %>%
        dplyr::select(colname, fs_id_coalesced) %>%
        dplyr::distinct()

      for (i in seq(nrow(footnotes_columns_column_marks))) {

        text <-
          boxh %>%
          dplyr::filter(var == footnotes_columns_column_marks$colname[i]) %>%
          dplyr::pull(column_label) %>%
          .[[1]]

        text <- paste0(text, footnote_mark_fn(footnotes_columns_column_marks$fs_id_coalesced[i]))

        boxh <-
          dplyr::mutate(
            boxh,
            column_label = dplyr::case_when(
              var == footnotes_columns_column_marks$colname[i] ~ list(text),
              TRUE ~ column_label
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
set_footnote_marks_stubhead <- function(data,
                                        context = "html") {

  footnotes_tbl <- dt_footnotes_get(data = data)
  stubhead <- dt_stubhead_get(data = data)

  label <- stubhead$label

  if ("stubhead" %in% footnotes_tbl$locname) {

    footnotes_tbl <- dplyr::filter(footnotes_tbl, locname == "stubhead")

    if (nrow(footnotes_tbl) > 0) {

      footnotes_stubhead_marks <-
        footnotes_tbl %>%
        dplyr::group_by(grpname) %>%
        dplyr::mutate(fs_id_coalesced = paste(fs_id, collapse = ",")) %>%
        dplyr::ungroup() %>%
        dplyr::select(grpname, fs_id_coalesced) %>%
        dplyr::distinct() %>%
        dplyr::pull(fs_id_coalesced)

      if (context == "html") {

        label <-
          paste0(label, footnote_mark_to_html(footnotes_stubhead_marks))

      } else if (context == "rtf") {

        label <-
          paste0(label, footnote_mark_to_rtf(footnotes_stubhead_marks))

      } else if (context == "latex") {

        label <-
          paste0(label, footnote_mark_to_latex(footnotes_stubhead_marks))
      }
    }
  }

  dt_stubhead_label(data = data, label = label)
}

#' Apply footnotes to the data rows
#'
#' @noRd
apply_footnotes_to_output <- function(data,
                                      context = "html") {

  body <- dt_body_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)

  # `data` location
  footnotes_tbl_data <-
    dplyr::filter(footnotes_tbl, locname %in% c("data", "stub"))

  if (nrow(footnotes_tbl_data) > 0) {

    if ("stub" %in% footnotes_tbl_data$locname &&
        # FIXME: Check for length(...) > 0 instead of !is.na
        !is.na(dt_boxhead_get_var_stub(data))) {

      boxhead_var_stub <- dt_boxhead_get_var_stub(data = data)

      footnotes_tbl_data[
        which(is.na(footnotes_tbl_data$colname)), "colname"] <- boxhead_var_stub
    }

    footnotes_data_marks <-
      footnotes_tbl_data %>%
      dplyr::group_by(rownum, colnum) %>%
      dplyr::mutate(fs_id_coalesced = paste(fs_id, collapse = ",")) %>%
      dplyr::ungroup() %>%
      dplyr::select(colname, rownum, locname, placement, fs_id_coalesced) %>%
      dplyr::distinct()

    for (i in seq(nrow(footnotes_data_marks))) {

      text <-
        body[[footnotes_data_marks$rownum[i], footnotes_data_marks$colname[i]]]

      colname <- dplyr::pull(footnotes_data_marks[i, ], "colname")
      rownum <- dplyr::pull(footnotes_data_marks[i, ], "rownum")
      location <- dplyr::pull(footnotes_data_marks[i, ], "locname")
      placement <- dplyr::pull(footnotes_data_marks[i, ], "placement")

      footnote_placement <-
        resolve_footnote_placement(
          data = data,
          colname = colname,
          rownum = rownum,
          input_placement = placement,
          cell_content = text,
          context = context
        )

      if (context == "html") {
        mark <- footnote_mark_to_html(footnotes_data_marks$fs_id_coalesced[i])
      } else if (context == "rtf") {
        mark <- footnote_mark_to_rtf(footnotes_data_marks$fs_id_coalesced[i])
      } else if (context == "latex") {
        mark <- footnote_mark_to_latex(footnotes_data_marks$fs_id_coalesced[i])
      }

      if (footnote_placement == "right") {
        text <- paste0(text, mark)
      } else {
        text <- paste0(mark, " ", text)
      }

      body[footnotes_data_marks$rownum[i], footnotes_data_marks$colname[i]] <- text
    }
  }

  data <- dt_body_set(data = data, body = body)

  data
}

#' @noRd
set_footnote_marks_row_groups <- function(data,
                                          context = "html") {

  groups_rows_df <- dt_groups_rows_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)

  footnotes_row_groups_tbl <- dplyr::filter(footnotes_tbl, locname == "row_groups")

  if (nrow(footnotes_row_groups_tbl) > 0) {

    footnotes_row_groups_marks <-
      footnotes_row_groups_tbl %>%
      dplyr::group_by(grpname) %>%
      dplyr::mutate(fs_id_coalesced = paste(fs_id, collapse = ",")) %>%
      dplyr::ungroup() %>%
      dplyr::select(grpname, fs_id_coalesced) %>%
      dplyr::distinct()

    for (i in seq(nrow(footnotes_row_groups_marks))) {

      row_index <-
        which(groups_rows_df[, "group_id"] == footnotes_row_groups_marks$grpname[i])

      text <- groups_rows_df[row_index, "group_label"]

      if (context == "html") {

        text <-
          paste0(
            text,
            footnote_mark_to_html(
              footnotes_row_groups_marks$fs_id_coalesced[i])
          )

      } else if (context == "rtf") {

        text <-
          paste0(
            text,
            footnote_mark_to_rtf(
              footnotes_row_groups_marks$fs_id_coalesced[i])
          )

      } else if (context == "latex") {

        text <-
          paste0(
            text,
            footnote_mark_to_latex(
              footnotes_row_groups_marks$fs_id_coalesced[i])
          )
      }

      groups_rows_df[row_index, "group_label"] <- text
    }
  }

  data <-
    dt_groups_rows_set(
      data = data,
      groups_rows = groups_rows_df
    )

  data
}

#' Apply footnotes to the summary rows
#'
#' @noRd
apply_footnotes_to_summary <- function(data,
                                       context = "html") {

  list_of_summaries <- dt_summary_df_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)

  summary_df_list <- list_of_summaries$summary_df_display_list

  # if (!("summary_cells" %in% footnotes_tbl$locname |
  #       "grand_summary_cells" %in% footnotes_tbl$locname)) {
  #   return(list_of_summaries)
  # }

  if ("summary_cells" %in% footnotes_tbl$locname) {

    footnotes_tbl_data <- dplyr::filter(footnotes_tbl, locname == "summary_cells")

    footnotes_data_marks <-
      footnotes_tbl_data %>%
      dplyr::mutate(row = as.integer(round((rownum - floor(rownum)) * 100, 0))) %>%
      dplyr::mutate(colname = ifelse(is.na(colname), "rowname", colname)) %>%
      dplyr::group_by(grpname, row, colnum) %>%
      dplyr::mutate(fs_id_coalesced = paste(fs_id, collapse = ",")) %>%
      dplyr::ungroup() %>%
      dplyr::select(grpname, colname, row, fs_id_coalesced) %>%
      dplyr::distinct()

    for (i in seq(nrow(footnotes_data_marks))) {

      text <-
        summary_df_list[[footnotes_data_marks[i, ][["grpname"]]]][[
          footnotes_data_marks$row[i], footnotes_data_marks$colname[i]]]

      if (context == "html") {

        text <-
          paste0(text, footnote_mark_to_html(footnotes_data_marks$fs_id_coalesced[i]))

      } else if (context == "rtf") {

        text <-
          paste0(text, footnote_mark_to_rtf(footnotes_data_marks$fs_id_coalesced[i]))

      } else if (context == "latex") {

        text <-
          paste0(text, footnote_mark_to_latex(footnotes_data_marks$fs_id_coalesced[i]))
      }

      summary_df_list[[footnotes_data_marks[i, ][["grpname"]]]][[
        footnotes_data_marks$row[i], footnotes_data_marks$colname[i]]] <- text
    }

    list_of_summaries$summary_df_display_list <- summary_df_list
  }

  if ("grand_summary_cells" %in% footnotes_tbl$locname) {

    footnotes_tbl_data <- dplyr::filter(footnotes_tbl, locname == "grand_summary_cells")

    footnotes_data_marks <-
      footnotes_tbl_data %>%
      dplyr::mutate(colname = ifelse(is.na(colname), "rowname", colname)) %>%
      dplyr::group_by(rownum, colnum) %>%
      dplyr::mutate(fs_id_coalesced = paste(fs_id, collapse = ",")) %>%
      dplyr::ungroup() %>%
      dplyr::select(colname, rownum, fs_id_coalesced) %>%
      dplyr::distinct()

    for (i in seq(nrow(footnotes_data_marks))) {

      text <-
        summary_df_list[[grand_summary_col]][[
          footnotes_data_marks$rownum[i], footnotes_data_marks$colname[i]]]

      if (context == "html") {

        text <-
          paste0(text, footnote_mark_to_html(footnotes_data_marks$fs_id_coalesced[i]))

      } else if (context == "rtf") {

        text <-
          paste0(text, footnote_mark_to_rtf(footnotes_data_marks$fs_id_coalesced[i]))

      } else if (context == "latex") {

        text <-
          paste0(text, footnote_mark_to_latex(footnotes_data_marks$fs_id_coalesced[i]))
      }

      summary_df_list[[grand_summary_col]][[
        footnotes_data_marks$rownum[i], footnotes_data_marks$colname[i]]] <- text
    }

    list_of_summaries$summary_df_display_list[[grand_summary_col]] <-
      summary_df_list[[grand_summary_col]]
  }

  data <-
    dt_summary_data_set(
      data = data,
      summary = list_of_summaries
    )

  data
}
