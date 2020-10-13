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
    stop("The `tbl_type` must be either `\"footnotes\"` or `\"styles\"`")
  }

  # Return `data` unchanged if there are no rows in `tbl`
  if (nrow(tbl) == 0) {
    return(data)
  }

  # Filter table to include only the `default` vars
  # in the `data` and `columns_columns` locnames
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

  # Pare down to the relevant records
  if (nrow(tbl) > 0) {

    # Filter `tbl` by elements preceeding the data rows
    # (i.e., if element is not present but a reference is,
    # remove the footnote reference since it is not relevant)

    # Filter by `title`
    if (!dt_heading_has_title(data = data)) {

      tbl <-
        tbl %>%
        dplyr::filter(locname != "title")
    }

    # Filter by `subtitle`
    if (!dt_heading_has_subtitle(data = data)) {

      tbl <-
        tbl %>%
        dplyr::filter(locname != "subtitle")
    }

    # Filter by `grpname` in columns groups
    if ("columns_groups" %in% tbl[["locname"]]) { # remove conditional

      spanner_labels <-
        spanners$spanner_label %>%
        unlist() %>%
        unique()

      tbl <-
        tbl %>%
        dplyr::filter(
          locname != "columns_groups" | grpname %in% spanner_labels
        )
    }

    # Filter by `grpname` in row groups
    if ("row_groups" %in% tbl[["locname"]]) {

      tbl <-
        dplyr::bind_rows(
          tbl %>%
            dplyr::filter(locname != "row_groups"),
          tbl %>%
            dplyr::filter(locname == "row_groups") %>%
            dplyr::filter(grpname %in% groups_rows_df$group)
        )
    }

    # Filter `tbl` by the remaining columns in `body`
    tbl <-
      tbl %>%
      dplyr::filter(
        colname %in% c(NA_character_, dt_boxhead_get_vars_default(data = data))
      )
  }

  # Reorganize records that target the data rows
  if (any(tbl[["locname"]] %in% c("data", "stub"))) {

    tbl_not_data <-
      tbl %>%
      dplyr::filter(!(locname %in% c("data", "stub")))

    tbl_data <-
      tbl %>%
      dplyr::filter(locname %in% c("data", "stub"))

    if (nrow(tbl_data) > 0) {

      # Re-map the `rownum` to the new row numbers for the
      # data rows
      tbl_data <-
        tbl_data %>%
        dplyr::mutate(
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
        dplyr::mutate(colnum = ifelse(locname == "stub", 0, colnum))
    }

    # Re-combine `tbl_data` with `tbl`
    tbl <- dplyr::bind_rows(tbl_not_data, tbl_data)

  } else {

    tbl <-
      tbl %>%
      dplyr::mutate(colnum = NA_integer_)
  }

  # For the row groups, insert a `rownum` based on `groups_rows_df`
  if ("row_groups" %in% tbl[["locname"]]) {

    tbl_not_row_groups <-
      tbl %>%
      dplyr::filter(locname != "row_groups")

    tbl_row_groups <-
      tbl %>%
      dplyr::filter(locname == "row_groups") %>%
      dplyr::inner_join(
        groups_rows_df %>% dplyr::select(-group_label),
        by = c("grpname" = "group")
      ) %>%
      dplyr::mutate(rownum = row - 0.1) %>%
      dplyr::mutate(colnum = 1) %>%
      dplyr::select(-row, -row_end)

    # Re-combine `tbl_not_row_groups`
    # with `tbl_row_groups`
    tbl <-
      dplyr::bind_rows(
        tbl_not_row_groups, tbl_row_groups
      )
  }

  # For the summary cells, insert a `rownum` based
  # on `groups_rows_df`
  if ("summary_cells" %in% tbl[["locname"]]) {

    tbl_not_summary_cells <-
      tbl %>%
      dplyr::filter(locname != "summary_cells")

    tbl_summary_cells <-
      tbl %>%
      dplyr::filter(locname == "summary_cells") %>%
      dplyr::inner_join(
        groups_rows_df %>% dplyr::select(-group_label),
        by = c("grpname" = "group")
      ) %>%
      dplyr::mutate(rownum = (rownum / 100) + row_end) %>%
      dplyr::select(-row, -row_end) %>%
      dplyr::mutate(colnum = colname_to_colnum(data = data, colname = colname))

    # Re-combine `tbl_not_summary_cells`
    # with `tbl_summary_cells`
    tbl <-
      dplyr::bind_rows(
        tbl_not_summary_cells, tbl_summary_cells
      )
  }

  # For the grand summary cells, insert a `colnum` based
  # on `groups_rows_df`
  if (6 %in% tbl[["locnum"]]) {

    tbl_not_g_summary_cells <-
      tbl %>%
      dplyr::filter(locnum != 6)

    tbl_g_summary_cells <-
      tbl %>%
      dplyr::filter(locnum == 6) %>%
      dplyr::mutate(colnum = colname_to_colnum(data = data, colname = colname))

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

    tbl_not_column_cells <-
      tbl %>%
      dplyr::filter(locname != "columns_columns")

    tbl_column_cells <-
      tbl %>%
      dplyr::select(-colnum) %>%
      dplyr::filter(locname == "columns_columns") %>%
      dplyr::inner_join(
        dplyr::tibble(
          colnum = seq(default_vars),
          colname = default_vars
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

    vars_default <- seq_along(dt_boxhead_get_vars_default(data = data))
    spanners_labels <- dt_spanners_print(data = data, include_hidden = FALSE)

    group_label_df <-
      dplyr::tibble(
        colnum = seq(vars_default),
        grpname = spanners_labels
      ) %>%
      dplyr::group_by(grpname) %>%
      dplyr::summarize(colnum = min(colnum))

    tbl_not_col_spanner_cells <-
      tbl %>%
      dplyr::filter(locname != "columns_groups")

    tbl_column_spanner_cells <-
      tbl %>%
      dplyr::select(-colnum) %>%
      dplyr::filter(locname == "columns_groups") %>%
      dplyr::inner_join(group_label_df, by = "grpname")

    # Re-combine `tbl_not_col_spanner_cells`
    # with `tbl_not_col_spanner_cells`
    tbl <-
      dplyr::bind_rows(
        tbl_not_col_spanner_cells,
        tbl_column_spanner_cells
      )
  }

  # Sort the table rows
  tbl <-
    tbl %>%
    dplyr::arrange(locnum, rownum, colnum)

  # In the case of footnotes, populate table
  # column with footnote marks
  if (tbl_type == "footnotes") {

    # Generate a lookup table with ID'd footnote
    # text elements (that are distinct)
    lookup_tbl <-
      tbl %>%
      dplyr::select(footnotes) %>%
      dplyr::distinct() %>%
      tibble::rownames_to_column(var = "fs_id") %>%
      dplyr::mutate(fs_id = as.integer(fs_id))

    # Join the lookup table to `tbl`
    tbl <-
      tbl %>%
      dplyr::inner_join(lookup_tbl, by = "footnotes")

    if (nrow(tbl) > 0) {

      # Modify `fs_id` to contain the footnote marks we need
      tbl <-
        tbl %>%
        dplyr::mutate(
          fs_id = process_footnote_marks(
            x = fs_id,
            marks = footnote_marks
          )
        )
    }
  }

  if (tbl_type == "styles") {

    if (nrow(tbl) > 0) {

      tbl <-
        tbl %>%
        dplyr::group_by(
          .dots = colnames(.) %>% base::setdiff(c("styles", "text"))) %>%
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

  # If there are any footnotes to apply to the columns,
  # process them individually for the spanner groups and
  # for the column label groups
  if (any(c("columns_columns", "columns_groups") %in% footnotes_tbl$locname)) {

    footnotes_tbl <-
      footnotes_tbl %>%
      dplyr::filter(locname %in% c("columns_columns", "columns_groups"))

    # Filter the spanner column footnotes
    footnotes_columns_group_tbl <-
      footnotes_tbl %>%
      dplyr::filter(!is.na(grpname))

    # Filter the column label footnotes
    footnotes_columns_column_tbl <-
      footnotes_tbl %>%
      dplyr::filter(!is.na(colname))

    if (nrow(footnotes_columns_group_tbl) > 0) {

      footnotes_columns_group_marks <-
        footnotes_columns_group_tbl %>%
        dplyr::group_by(grpname) %>%
        dplyr::mutate(fs_id_coalesced = paste(fs_id, collapse = ",")) %>%
        dplyr::ungroup() %>%
        dplyr::select(grpname, fs_id_coalesced) %>%
        dplyr::distinct()

      for (i in seq(nrow(footnotes_columns_group_marks))) {

        spanners <- dt_spanners_get(data = data)
        spanner_labels <- dt_spanners_print(data = data)

        column_indices <-
          which(spanner_labels == footnotes_columns_group_marks$grpname[i])

        text <- spanner_labels[column_indices] %>% unique()

        if (context == "html") {

          text <-
            paste0(
              text,
              footnote_mark_to_html(
                footnotes_columns_group_marks$fs_id_coalesced[i])
            )

        } else if (context == "rtf") {

          text <-
            paste0(
              text,
              footnote_mark_to_rtf(
                footnotes_columns_group_marks$fs_id_coalesced[i])
            )

        } else if (context == "latex") {

          text <-
            paste0(
              text,
              footnote_mark_to_latex(
                footnotes_columns_group_marks$fs_id_coalesced[i])
            )
        }

        spanners_i <-
          which(
            (spanners$spanner_label %>% unlist()) == footnotes_columns_group_marks$grpname[i])

        spanners[spanners_i, ][["built"]] <- text

        data <- dt_spanners_set(data = data, spanners = spanners)
      }
    }

    if (nrow(footnotes_columns_column_tbl) > 0) {

      footnotes_columns_column_marks <-
        footnotes_columns_column_tbl %>%
        dplyr::group_by(colname) %>%
        dplyr::mutate(fs_id_coalesced = paste(fs_id, collapse = ",")) %>%
        dplyr::ungroup() %>%
        dplyr::select(colname, fs_id_coalesced) %>%
        dplyr::distinct()

      for (i in seq(nrow(footnotes_columns_column_marks))) {

        # TODO: make this work with column labels
        text <-
          boxh %>%
          dplyr::filter(var == footnotes_columns_column_marks$colname[i]) %>%
          dplyr::pull(column_label) %>%
          .[[1]]

        if (context == "html") {

          text <-
            paste0(
              text,
              footnote_mark_to_html(
                footnotes_columns_column_marks$fs_id_coalesced[i])
            )

        } else if (context == "rtf") {

          text <-
            paste0(
              text,
              footnote_mark_to_rtf(
                footnotes_columns_column_marks$fs_id_coalesced[i])
            )

        } else if (context == "latex") {

          text <-
            paste0(
              text,
              footnote_mark_to_latex(
                footnotes_columns_column_marks$fs_id_coalesced[i])
            )
        }

        boxh <-
          boxh %>%
          dplyr::mutate(column_label = dplyr::case_when(
            var == footnotes_columns_column_marks$colname[i] ~ list(text),
            TRUE ~ column_label
          ))

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

    footnotes_tbl <-
      footnotes_tbl %>%
      dplyr::filter(locname == "stubhead")

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
    footnotes_tbl %>%
    dplyr::filter(locname %in% c("data", "stub"))

  if (nrow(footnotes_tbl_data) > 0) {

    if ("stub" %in% footnotes_tbl_data$locname &&
        !is.na(dt_boxhead_get_var_stub(data))) {

      boxhead_var_stub <- dt_boxhead_get_var_stub(data)

      footnotes_tbl_data[
        which(is.na(footnotes_tbl_data$colname)), "colname"] <- boxhead_var_stub
    }

    footnotes_data_marks <-
      footnotes_tbl_data %>%
      dplyr::group_by(rownum, colnum) %>%
      dplyr::mutate(fs_id_coalesced = paste(fs_id, collapse = ",")) %>%
      dplyr::ungroup() %>%
      dplyr::select(colname, rownum, fs_id_coalesced) %>%
      dplyr::distinct()

    for (i in seq(nrow(footnotes_data_marks))) {

      text <-
        body[footnotes_data_marks$rownum[i], footnotes_data_marks$colname[i]]

      if (context == "html") {

        text <-
          paste0(text, footnote_mark_to_html(
            footnotes_data_marks$fs_id_coalesced[i])
          )

      } else if (context == "rtf") {

        text <-
          paste0(text, footnote_mark_to_rtf(
            footnotes_data_marks$fs_id_coalesced[i])
          )

      } else if (context == "latex") {

        text <-
          paste0(text, footnote_mark_to_latex(
            footnotes_data_marks$fs_id_coalesced[i])
          )
      }

      body[
        footnotes_data_marks$rownum[i], footnotes_data_marks$colname[i]] <- text
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

  footnotes_row_groups_tbl <-
    footnotes_tbl %>%
    dplyr::filter(locname == "row_groups")

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
        which(groups_rows_df[, "group"] == footnotes_row_groups_marks$grpname[i])

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

  data <- dt_groups_rows_set(data = data, groups_rows = groups_rows_df)

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

    footnotes_tbl_data <-
      footnotes_tbl %>%
      dplyr::filter(locname == "summary_cells")

    footnotes_data_marks <-
      footnotes_tbl_data %>%
      dplyr::mutate(row = as.integer(round((rownum - floor(rownum)) * 100, 0))) %>%
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

    footnotes_tbl_data <-
      footnotes_tbl %>%
      dplyr::filter(locname == "grand_summary_cells")

    footnotes_data_marks <-
      footnotes_tbl_data %>%
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

  data <- dt_summary_data_set(data = data, summary = list_of_summaries)
  data
}
