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


# tab_info() -------------------------------------------------------------------
#' Understand what's been set inside of a **gt** table object
#'
#' @description
#'
#' It can become increasingly difficult to recall the ID values associated with
#' different labels in a **gt** table. Further to this, there are also
#' situations where **gt** will generate ID values on your behalf (e.g., with
#' [tab_spanner_delim()], etc.) while ensuring that duplicate ID values aren't
#' produced. For the latter case, it is impossible to know what those ID values
#' are unless one were to carefully examine to correct component of the `gt_tbl`
#' object.
#'
#' Because it's so essential to know these ID values for targeting purposes
#' (when styling with [tab_style()], adding footnote marks with
#' [tab_footnote()], etc.), `tab_info()` can help with all of this. It
#' summarizes (by location) all of the table's ID values and their associated
#' labels. The product is an informational **gt** table, designed for easy
#' retrieval of the necessary values.
#'
#' @inheritParams fmt_number
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Let's use a portion of the [`gtcars`] dataset to create a **gt** table. We'll
#' use [tab_spanner()] to group two columns together under a spanner column with
#' the ID and label `"performance"`. Finally, we can use`tab_info()` in a
#' separate, interactive statement so that we can inspect a table that
#' summarizes the ID values any associated label text for all parts of the
#' table.
#'
#' ```r
#' gt_tbl <-
#'   gtcars |>
#'   dplyr::select(model, year, starts_with("hp"), msrp) |>
#'   dplyr::slice(1:4) |>
#'   gt(rowname_col = "model") |>
#'   tab_spanner(
#'     label = "performance",
#'     columns = starts_with("hp")
#'   )
#'
#' gt_tbl |> tab_info()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_tab_info_1.png")`
#' }}
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-12
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @export
tab_info <- function(data) {

  empty_tbl <-
    data.frame(
      id = character(0L),
      i = integer(0L),
      label = character(0L),
      type = character(0L),
      location = character(0L),
      stringsAsFactors = FALSE
    )

  built_data <- build_data(data, context = "html")

  #
  # Columns
  #

  boxhead <- dt_boxhead_get(data = data)

  columns <- dplyr::select(boxhead, id = "var", label = "column_label", "type")
  columns <- columns[columns$type %in% c("default", "stub", "hidden"), ]
  columns$label <- unlist(columns$label)
  columns$location <- "Columns"
  columns$i <- seq_len(nrow(columns))
  columns <- columns[, c("id", "i", "label", "type", "location")]

  #
  # Rows
  #

  stub_df <- dt_stub_df_get(data = data)
  stub_layout <- get_stub_layout(data = built_data)

  if ("rowname" %in% stub_layout) {

    data_df <- dt_data_get(data = data)

    rowname_col <- dt_boxhead_get_var_stub(data = data)

    row_name_vals <- data_df[ , rowname_col[1], drop = TRUE]

    rownames <- dplyr::select(stub_df, id = "row_id", i = "rownum_i")
    rownames$label <-  row_name_vals
    rownames$type <-  NA_character_
    rownames$location <-  "Rows"
    rownames <- rownames[, c("id", "i", "label", "type", "location")]

  } else if (nrow(stub_df) == 1) {

    rownames <-
      data.frame(
        id = "<< Single index value of 1 >>",
        i = NA_integer_,
        label = NA_character_,
        type = NA_character_,
        location = "Rows",
        stringsAsFactors = FALSE
      )

  } else if (nrow(stub_df) == 0) {

    rownames <-
      data.frame(
        id = "<< No rows in table >>",
        i = NA_integer_,
        label = NA_character_,
        type = NA_character_,
        location = "Rows",
        stringsAsFactors = FALSE
      )

  } else {

    rownum_i <- stub_df[["rownum_i"]]

    rownum_desc <- paste0("<< Index values ", min(rownum_i), " to ", max(rownum_i), " >>")

    rownames <-
      data.frame(
        id = rownum_desc,
        i = NA_integer_,
        label = NA_character_,
        type = NA_character_,
        location = "Rows",
        stringsAsFactors = FALSE
      )
  }

  #
  # Spanners
  #

  if (dt_spanners_exists(data = data)) {

    span_df <- dt_spanners_get(data = data)

    spanners <- dplyr::select(span_df, id = "spanner_id", label = "spanner_label", i = "spanner_level")
    spanners$type <- NA_character_
    spanners$i <- as.integer(spanners$i)
    spanners$label <- unlist(spanners$label)
    spanners$location <- "Spanners"
    spanners <- spanners[, c("id", "i", "label", "type", "location")]

  } else {
    spanners <- empty_tbl
  }

  #
  # Row Groups
  #

  if ("group_label" %in% stub_layout) {

    groups_rows <- dt_row_groups_get(data = data)

    row_groups <- dplyr::select(stub_df, id = "group_id", label = "group_label")
    row_groups <- dplyr::filter(row_groups, dplyr::row_number() == 1, .by = "id")
    row_groups <- dplyr::mutate(row_groups, i = which(groups_rows %in% id))
    row_groups$type <- NA_character_
    row_groups$label <- unlist(row_groups$label)
    row_groups$location <- "Row Groups"
    row_groups <- row_groups[c("id", "i", "label", "type", "location")]

  } else {
    row_groups <- empty_tbl
  }

  #
  # Summary Rows
  #

  summaries_present <- dt_summary_exists(data = data)

  if (summaries_present) {

    list_of_summaries <- extract_summary(data = data)
    groups_rows_df <- dt_groups_rows_get(data = built_data)

    # Group Summaries
    if (grand_summary_col %in% names(list_of_summaries$summary_df_data_list)) {

      group_id_vec <- groups_rows_df[["group_id"]]
      group_summary <- empty_tbl

      for (group_id in group_id_vec) {

        if (group_id %in% names(list_of_summaries$summary_df_data_list)) {

          group_summary_row_id <-
            names(list_of_summaries$summary_df_data_list[[group_id]][["rowname"]])

          group_summary_i <-
            vctrs::vec_rbind(
              vctrs::data_frame(
                id = group_id,
                i = NA_integer_,
                label = NA_character_,
                type = "::group_id::",
                location = "Group Summary"
              ),
              vctrs::data_frame(
                id = group_summary_row_id,
                i = seq_along(group_summary_row_id),
                label = group_summary_row_id,
                type = group_id,
                location = "Group Summary"
              )
            )

          group_summary <-
            dplyr::bind_rows(
              group_summary,
              group_summary_i
            )

        }
      }
    } else {
      group_summary <- empty_tbl
    }

    # Grand Summary
    if (grand_summary_col %in% names(list_of_summaries$summary_df_data_list)) {

      grand_summary_row_id <-
        names(list_of_summaries$summary_df_data_list[[grand_summary_col]][["rowname"]])

      grand_summary <-
        vctrs::data_frame(
          id = grand_summary_row_id,
          i = seq_along(grand_summary_row_id),
          label = grand_summary_row_id,
          type = NA_character_,
          location = "Grand Summary"
        )
    } else {
      grand_summary <- empty_tbl
    }

    summaries <-
      vctrs::vec_rbind(
        group_summary,
        grand_summary
      )

  } else {
    summaries <- empty_tbl
  }

  #
  # Combine the tables for each part together
  #

  combined_tbl <-
    vctrs::vec_rbind(
      columns,
      rownames,
      spanners,
      row_groups,
      summaries
    )

  #
  # Generate the gt table for output
  #

  gt_tbl <- gt(combined_tbl, rowname_col = "id", groupname_col = "location")
  gt_tbl <- tab_stubhead(data = gt_tbl, label = "ID")
  gt_tbl <-
    cols_label(
      .data = gt_tbl,
      label = "Label",
      i = md("*Idx*  \n*Lvl*"),
      type = ""
    )
  gt_tbl <-
    cols_width(
      .data = gt_tbl,
      id ~ px(250),
      label ~ px(280),
      i ~ px(50),
      everything() ~ px(30)
    )
  gt_tbl <-
    tab_style(
      data = gt_tbl,
      style = cell_text(font = google_font("IBM Plex Mono"), size = px(14)),
      locations = list(cells_body(columns = c(i, label)), cells_stub())
    )
  gt_tbl <-
    tab_style(
      data = gt_tbl,
      style = cell_borders(sides = c("top", "bottom"), color = "lightblue"),
      locations = list(
        cells_stub(rows = type == "::group_id::"),
        cells_body(rows = type == "::group_id::")
      )
    )
  gt_tbl <- opt_all_caps(data = gt_tbl, locations = c("row_group", "column_labels"))
  gt_tbl <- sub_missing(data = gt_tbl, columns = i, missing_text = "")
  gt_tbl <- sub_missing(data = gt_tbl, columns = c(id, label), missing_text = "")
  gt_tbl <-
    tab_header(
      data = gt_tbl,
      title = md("Information on ID and Label Values")
    )
  gt_tbl <- opt_align_table_header(data = gt_tbl, align = "left")
  gt_tbl <- opt_table_lines(data = gt_tbl, extent = "none")
  gt_tbl <- cols_hide(data = gt_tbl, columns = type)
  gt_tbl <-
    tab_options(
      data = gt_tbl,
      table.width = px(800),
      row_group.padding = px(12),
      data_row.padding = px(4),
      table_body.hlines.style = "solid",
      table_body.hlines.width = px(1),
      table_body.hlines.color = "#F7F7F7",
      row_group.border.top.style = "solid",
      row_group.border.top.width = px(1),
      row_group.border.bottom.width = px(1),
      table_body.border.bottom.style = "solid",
      table_body.border.bottom.width = px(1),
      table.border.bottom.style = "solid",
      table.border.bottom.width = px(1),
      table.border.bottom.color = "#F7F7F7",
      source_notes.font.size = px(10),
      source_notes.padding = px(6)
    )

  gt_tbl
}
