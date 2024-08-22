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
#  Copyright (c) 2018-2024 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


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
          fs_id_coalesced = paste(fs_id, collapse = ","),
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
          fs_id_coalesced = paste(fs_id, collapse = ","),
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
          fs_id_coalesced = paste(fs_id, collapse = ","),
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
        fs_id_coalesced = paste(fs_id, collapse = ","),
        .by = "grpname"
      )
    # will only remain
    footnotes_row_groups_marks <- dplyr::distinct(footnotes_row_groups_marks, fs_id_coalesced, grpname)

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
      # FIXME: Check for length(...) > 0 instead of !is.na
      !is.na(dt_boxhead_get_var_stub(data))
    ) {

      boxhead_var_stub <- dt_boxhead_get_var_stub(data = data)

      footnotes_tbl_data$colname[is.na(footnotes_tbl_data$colname)] <-
        boxhead_var_stub
    }

    footnotes_data_marks <-
      dplyr::mutate(
        footnotes_tbl_data,
        fs_id_coalesced = paste(fs_id, collapse = ","),
        .by = c("rownum", "colnum")
      )
    footnotes_data_marks <-
      dplyr::distinct(footnotes_data_marks, colname, rownum, locname, placement, fs_id_coalesced)

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
    # FIXME #1737, figure out how to tweak the regex (in Quarto)
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
    # Processing html
    # FIXME possibly the place where we could fix #1773
    text <- apply_footnotes_method[[context]](text, mark)
  } else {
    text <- apply_footnotes_method[[context]](text, mark)
  }
  text
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
  footnotes_tbl$colname[is.na(footnotes_tbl$colname)] <- "::rowname::"
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
        fs_id_coalesced = paste(fs_id, collapse = ","),
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
        fs_id_coalesced = paste(fs_id, collapse = ","),
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
