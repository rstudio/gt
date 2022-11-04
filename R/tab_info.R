#' Understand what's been set inside of a **gt** table object
#'
#' @description
#' It can become increasingly difficult to recall the ID values associated with
#' different labels in a **gt** table. Further to this, there are also
#' situations where **gt** will generate ID values on your behalf (e.g., with
#' [tab_spanner_delim()], etc.) while ensuring that duplicate ID values aren't
#' produced. For the latter case, it is impossible to know what those ID values
#' are unless one were to carefully examine to correct component of the `gt_tbl`
#' object. Because it's essential to know these ID values for targeting purposes
#' (when styling with [tab_style()], adding footnote marks with
#' [tab_footnote()], etc.), the `tab_info()` function can help with all of this.
#' It summarizes (by location) the ID values and their labels and provides
#' additional pieces of useful information where needed. The product is an
#' informational **gt** table, designed for easy retrieval of the necessary
#' values.
#'
#' @inheritParams fmt_number
#'
#' @return An object of class `gt_tbl`.
#'
#' @family part creation/modification functions
#' @section Function ID:
#' 2-12
#'
#' @export
tab_info <- function(data) {

  data <- build_data(data = data, context = "html")

  boxhead <- dt_boxhead_get(data = data)
  stub_df <- dt_stub_df_get(data = data)
  span_df <- dt_spanners_get(data = data)
  groups_rows_df <- dt_groups_rows_get(data = data)

  stub_layout <- get_stub_layout(data = data)

  empty_tbl <-
    dplyr::tibble(
      id = character(0),
      i = integer(0),
      label = character(0),
      markdown = logical(0),
      type = character(0),
      location = character(0)
    )

  #
  # Columns
  #

  columns <- dplyr::select(boxhead, id = var, label = column_label, type)
  columns <- dplyr::filter(columns, type %in% c("default", "stub", "hidden"))
  columns <- dplyr::mutate(columns, label = unlist(label))
  columns <- dplyr::mutate(columns, markdown = FALSE)
  columns <- dplyr::mutate(columns, location = "Columns")
  columns <- dplyr::mutate(columns, i = seq_len(nrow(columns)))
  columns <- dplyr::select(columns, id, i, label, markdown, type, location)

  #
  # Rows
  #

  if ("rowname" %in% stub_layout) {

    body_df <- dt_body_get(data = data)

    rowname_col <- dt_boxhead_get_var_stub(data = data)

    row_name_vals <- dplyr::pull(dplyr::select(body_df, dplyr::all_of(rowname_col)), 1)

    rownames <- dplyr::select(stub_df, id = row_id, i = rownum_i)
    rownames <- dplyr::mutate(rownames, label = row_name_vals)
    rownames <- dplyr::mutate(rownames, type = NA_character_, markdown = FALSE)
    rownames <- dplyr::mutate(rownames, location = "Rows")
    rownames <- dplyr::select(rownames, id, i, label, markdown, type, location)

  } else if (nrow(stub_df) == 1) {

    rownames <-
      dplyr::tibble(
        id = "<< Single index value of 1 >>",
        i = NA_integer_,
        label = NA_character_,
        markdown = NA,
        type = NA_character_,
        location = "Rows"
      )

  } else if (nrow(stub_df) == 0) {

    rownames <-
      dplyr::tibble(
        id = "<< No rows in table >>",
        i = NA_integer_,
        label = NA_character_,
        markdown = NA,
        type = NA_character_,
        location = "Rows"
      )

  } else {

    rownum_i <- stub_df[["rownum_i"]]

    rownum_desc <- paste0("<< Index values ", min(rownum_i), " to ", max(rownum_i), " >>")

    rownames <-
      dplyr::tibble(
        id = rownum_desc,
        i = NA_integer_,
        label = NA_character_,
        markdown = NA,
        type = NA_character_,
        location = "Rows"
      )
  }

  #
  # Spanners
  #

  if (dt_spanners_exists(data = data)) {

    spanners <- dplyr::select(span_df, id = spanner_id, label = spanner_label, i = spanner_level)
    spanners <- dplyr::mutate(spanners, type = NA_character_, markdown = FALSE)
    spanners <- dplyr::mutate(spanners, i = as.integer(i))
    spanners <- dplyr::mutate(spanners, label = unlist(label))
    spanners <- dplyr::mutate(spanners, markdown = FALSE)
    spanners <- dplyr::mutate(spanners, location = "Spanners")
    spanners <- dplyr::select(spanners, id, i, label, markdown, type, location)

  } else {
    spanners <- empty_tbl
  }

  #
  # Row Groups
  #

  if ("group_label" %in% stub_layout) {

    groups_rows <- dt_row_groups_get(data = data)

    row_groups <- dplyr::select(stub_df, id = group_id, label = group_label)
    row_groups <- dplyr::group_by(row_groups, id)
    row_groups <- dplyr::filter(row_groups, dplyr::row_number() == 1)
    row_groups <- dplyr::mutate(row_groups, i = which(groups_rows %in% id))
    row_groups <- dplyr::mutate(row_groups, type = NA_character_, markdown = FALSE)
    row_groups <- dplyr::mutate(row_groups, label = unlist(label))
    row_groups <- dplyr::mutate(row_groups, location = "Row Groups")
    row_groups <- dplyr::select(row_groups, id, i, label, markdown, type, location)

  } else {
    row_groups <- empty_tbl
  }

  #
  # Summary Rows
  #

  summaries_present <- dt_summary_exists(data = data)

  if (summaries_present) {

    list_of_summaries <- extract_summary(data = data)

    # Group Summaries
    if (grand_summary_col %in% names(list_of_summaries$summary_df_data_list)) {

      group_id_vec <- groups_rows_df[["group_id"]]
      group_summary <- empty_tbl

      for (group_id in group_id_vec) {

        if (group_id %in% names(list_of_summaries$summary_df_data_list)) {

          group_summary_row_id <-
            list_of_summaries$summary_df_data_list[[group_id]][["rowname"]]

          group_summary_i <-
            dplyr::tibble(
              id = group_summary_row_id,
              i = seq_len(length(group_summary_row_id)),
              label = group_summary_row_id,
              markdown = NA,
              type = group_id,
              location = "Group Summary"
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
        list_of_summaries$summary_df_data_list[[grand_summary_col]][["rowname"]]

      grand_summary <-
        dplyr::tibble(
          id = grand_summary_row_id,
          i = seq_len(length(grand_summary_row_id)),
          label = grand_summary_row_id,
          markdown = NA,
          type = NA_character_,
          location = "Grand Summary"
        )
    } else {
      grand_summary <- empty_tbl
    }

    summaries <-
      dplyr::bind_rows(
        group_summary,
        grand_summary
      )

  }



  combined_tbl <-
    dplyr::bind_rows(
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
      markdown = "",
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
  gt_tbl <- opt_all_caps(data = gt_tbl, locations = c("row_group", "column_labels"))
  gt_tbl <- sub_missing(data = gt_tbl, columns = i, missing_text = "")
  gt_tbl <- sub_missing(data = gt_tbl, columns = c(id, label))
  gt_tbl <-
    tab_header(
      data = gt_tbl,
      title = md("Information on ID and Label Values")
    )
  gt_tbl <- opt_align_table_header(data = gt_tbl, align = "left")
  gt_tbl <- opt_table_lines(data = gt_tbl, extent = "none")
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
      table.border.bottom.style = "solid",
      table.border.bottom.width = px(1),
      table.border.bottom.color = "#F7F7F7",
      source_notes.font.size = px(10),
      source_notes.padding = px(6)
    )
  gt_tbl
}
