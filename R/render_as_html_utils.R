#' Move input data cells to `output_df` that didn't have any rendering applied
#' during `render_formats()`
#' @noRd
migrate_unformatted_to_output <- function(data_df,
                                          output_df) {

  for (colname in colnames(output_df)) {

    row_index <- is.na(output_df[[colname]])
    output_df[[colname]][row_index] <- as.character(data_df[[colname]][row_index])
  }

  output_df
}

#' Apply column names to column labels for any of those column labels not
#' explicitly set
#' @noRd
migrate_colnames_to_labels <- function(boxh_df) {

  for (colname in colnames(boxh_df)) {

    if (is.na(boxh_df["column_label", colname])) {
      boxh_df["column_label", colname] <- colname
    }
  }

  boxh_df
}

#' Assign center alignment for all columns that haven't had alignment
#' explicitly set
#' @noRd
set_default_alignments <- function(boxh_df) {

  for (colname in colnames(boxh_df)) {
    if (is.na(boxh_df["column_align", colname])) {
      boxh_df["column_align", colname] <- "center"
    }
  }

  boxh_df
}

#' Is there any defined elements of a stub present?
#' @noRd
is_stub_available <- function(stub_df) {

  if (!all(is.na((stub_df)[["rowname"]])) ||
      !all(is.na((stub_df)[["groupname"]]))) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

#' @noRd
is_title_defined <- function(heading) {

  length(heading) > 0 && !is.null(heading$title)
}

#' @noRd
is_headnote_defined <- function(heading) {

  length(heading) > 0 && !is.null(heading$headnote) && heading$headnote != ""
}

#' Is there any group names defined in the stub?
#' @noRd
are_groups_present <- function(stub_df) {

  if (!all(is.na((stub_df)[["groupname"]]))) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

#' Are there any processed summary dfs available?
#' @noRd
are_summaries_present <- function(list_of_summaries) {

  if (length(list_of_summaries) == 0) {
    return(FALSE)
  } else {
    return(TRUE)
  }
}

#' Are there any spanners present?
#' @noRd
are_spanners_present <- function(boxh_df) {

  if (!all(is.na((boxh_df)["group_label", ] %>% t() %>% as.vector()))) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

#' Get the stub components that are available
#' @noRd
get_stub_components <- function(stub_df) {

  stub_components <- c()

  if (any(!is.na(stub_df[["rowname"]]))) {
    stub_components <- c(stub_components, "rowname")
  }

  if (any(!is.na(stub_df[["groupname"]]))) {
    stub_components <- c(stub_components, "groupname")
  }

  stub_components
}

stub_component_is_rowname <- function(stub_components) {

  identical(stub_components, "rowname")
}

stub_component_is_groupname <- function(stub_components) {

  identical(stub_components, "groupname")
}

stub_component_is_rowname_groupname <- function(stub_components) {

  identical(stub_components, c("rowname", "groupname"))
}

#' Create a data frame with the rows that the group rows
#' should appear above
#' @noRd
get_groups_rows_df <- function(arrange_groups,
                               groups_df) {

  ordering <- arrange_groups[[1]]

  groups_rows_df <-
    data.frame(
      group = rep(NA_character_, length(ordering)),
      group_label = rep(NA_character_, length(ordering)),
      row = rep(NA_integer_, length(ordering)),
      row_end = rep(NA_integer_, length(ordering)),
      stringsAsFactors = FALSE)

  for (i in seq(ordering)) {

    matched <- match(ordering[i], groups_df[, "groupname"])

    count_matched <- length(which(groups_df[, "groupname"] == ordering[i]))

    groups_rows_df[i, "group"] <- ordering[i]
    groups_rows_df[i, "group_label"] <- ordering[i]
    groups_rows_df[i, "row"] <- matched
    groups_rows_df[i, "row_end"] <- matched + count_matched - 1
  }

  groups_rows_df
}

#' Get the number of stub groups in the table
#' @noRd
get_n_groups <- function(groups_rows) {

  if (!is.null(groups_rows)) {
    return(nrow(groups_rows))
  } else {
    return(0)
  }
}

#' Used to merge two columns together in the final gt table
#' @noRd
perform_col_merge <- function(col_merge,
                              data_df,
                              output_df,
                              boxh_df,
                              columns_df) {

  if (length(col_merge) == 0) {
    return(
      list(
        output_df = output_df,
        boxh_df = boxh_df,
        columns_df = columns_df)
    )
  }

  for (i in seq(col_merge[[1]])) {

    pattern <- col_merge[["pattern"]][i]
    value_1_col <- col_merge[["col_1"]][i] %>% unname()
    value_2_col <- col_merge[["col_1"]][i] %>% names()

    values_1 <-
      output_df[, which(colnames(output_df) == value_1_col)]

    values_2 <-
      output_df[, which(colnames(output_df) == value_2_col)]

    values_1_data <-
      data_df[, which(colnames(data_df) == value_1_col)]

    values_2_data <-
      data_df[, which(colnames(data_df) == value_2_col)]

    for (j in seq(values_1)) {

      if (!is.na(values_1[j]) && !grepl("NA", values_1[j]) &&
          !is.na(values_2[j]) && !grepl("NA", values_2[j]) &&
          !is.na(values_1_data[j]) && !is.na(values_2_data[j])) {

        values_1[j] <-
          pattern %>%
          tidy_gsub("\\{1\\}", values_1[j]) %>%
          tidy_gsub("\\{2\\}", values_2[j])
      }
    }

    output_df[, which(colnames(output_df) == value_1_col)] <- values_1

    # Remove the second column across key dfs
    boxh_df <-
      boxh_df[, -which(colnames(output_df) == value_2_col), drop = FALSE]

    output_df <-
      output_df[, -which(colnames(output_df) == value_2_col), drop = FALSE]

    columns_df[which(columns_df == value_2_col), "colnum_final"] <- NA_integer_
  }

  list(
    output_df = output_df,
    boxh_df = boxh_df,
    columns_df = columns_df)
}

#' @importFrom dplyr tibble
#' @noRd
get_row_reorder_df <- function(arrange_groups,
                               stub_df) {

  # If there are no group, there there is no reordering
  # so just return a data frame where the starting row
  # indices match the final row indices
  if (length(arrange_groups$groups) == 0) {

    indices <- seq_len(nrow(stub_df))

    return(
      dplyr::tibble(
        rownum_start = indices,
        rownum_final = indices)
    )
  }

  groups <- arrange_groups$groups # try using match to shorten this

  indices <-
    lapply(stub_df$group, `%in%`, x = groups) %>%
    lapply(which) %>%
    unlist() %>%
    order()

  dplyr::tibble(
    rownum_start = seq_along(indices),
    rownum_final = indices)
}

#' @noRd
#' @importFrom dplyr tibble mutate full_join rename
get_column_reorder_df <- function(cols_df,
                                  boxh_df) {

  colnames_final_tbl <-
    dplyr::tibble(colnames_final = colnames(boxh_df)) %>%
    dplyr::mutate(colnum_final = seq(ncol(boxh_df)))

  cols_df %>%
    dplyr::mutate(colnum_start = seq(nrow(cols_df))) %>%
    dplyr::full_join(
      colnames_final_tbl, by = c("colnames_start" = "colnames_final")) %>%
    dplyr::rename(column_names = colnames_start)
}

#' @noRd
get_groupnames_rownames_df <- function(stub_df,
                                       rows_df) {

  stub_df[rows_df$rownum_final, c("groupname", "rowname")]
}

# Utility function to generate column numbers from column names
#' @noRd
colname_to_colnum <- function(boxh_df,
                              colname) {

  cnames <- c()

  for (i in seq(colname)) {
    if (is.na(colname[i])) {
      cnames <- c(cnames, NA_integer_)
    } else {
      cnames <- c(cnames, which(colnames(boxh_df) == colname[i]))
    }
  }

  cnames
}

#' @noRd
rownum_translation <- function(output_df,
                               rownum_start) {

  rownum_final <- c()

  for (i in seq_along(rownum_start)) {

    rownum_final <-
      c(rownum_final,
        which(as.numeric(rownames(output_df)) == rownum_start[i]))
  }

  rownum_final
}

#' @noRd
get_boxhead_spanners_vec <- function(boxh_df) {

  boxhead_spanners <-
    boxh_df["group_label", ] %>% unlist() %>% unname()

  boxhead_spanners[which(!is.na(boxhead_spanners))]
}


#' @noRd
footnote_glyph_to_html <- function(footnote_glyph) {

  paste0("<sup class='gt_super font_italic'>", footnote_glyph, "</sup>")
}

#' @noRd
create_source_note_rows <- function(source_note,
                                    n_cols) {

  if (length(source_note) == 0) {
    return("")
  }

  paste0(
    "<tfoot data-type='source_notes'>\n",
    paste0(
      "<tr>\n<td colspan='", n_cols + 1 ,
      "' class='sourcenote'>", source_note$source_note,
      "</td>\n</tr>\n",
      collapse = ""),
    "</tfoot>\n")
}

#' @noRd
split_body_content <- function(body_content,
                               n_cols) {

  split(body_content, ceiling(seq_along(body_content) / n_cols))
}

#' @importFrom dplyr mutate filter pull
#' @noRd
create_table_body <- function(row_splits_body,
                              row_splits_styles,
                              groups_rows_df,
                              col_alignment,
                              stub_components,
                              summaries_present,
                              list_of_summaries,
                              n_rows,
                              n_cols) {


  if (is.null(stub_components)) {
    stub_available <- FALSE
  } else if (stub_component_is_groupname(stub_components)) {
    stub_available <- FALSE
  } else {
    stub_available <- TRUE
  }

  # Replace an NA group with an empty string
  if (any(is.na(groups_rows_df$group))) {

    groups_rows_df <-
      groups_rows_df %>%
      dplyr::mutate(group_label = ifelse(is.na(group_label), "", group_label)) %>%
      dplyr::mutate(group_label = gsub("^NA", "\u2014", group_label))
  }

  body_rows <- c()

  for (i in 1:n_rows) {

    if (!is.null(groups_rows_df) &&
        i %in% groups_rows_df$row) {

      # Process "group" rows
      body_rows <-
        c(body_rows,
          paste0(
            "<tr>\n",
            "<td data-type='group' colspan='", n_cols ,"' class='group_heading'>",
            groups_rows_df[which(groups_rows_df$row %in% i), "group_label"][[1]],
            "</td>\n",
            "</tr>\n"))

    }

    if (stub_available) {

      # Process "data" rows where a stub is present
      body_rows <-
        c(body_rows,
          paste0(
            "<tr data-type='data' data-row='", i,"'>\n",
            paste0(
              "<td class='stub row ", col_alignment[1], "' ",
              "style='", row_splits_styles[[i]][1],
              "'>", row_splits_body[[i]][1],
              "</td>"), "\n",
            paste0(
              "<td class='row ", col_alignment[-1], "' ",
              "style='", row_splits_styles[[i]][-1],
              "'>", row_splits_body[[i]][-1],
              "</td>", collapse = "\n"),
            "\n</tr>\n") %>%
            tidy_gsub(" style=''", ""))

    } else {

      # Process "data" rows where no stub is present
      body_rows <-
        c(body_rows,
          paste0(
            "<tr data-type='data' data-row='", i,"'>\n",
            paste0(
              "<td class='row ", col_alignment, "' ",
              "style='", row_splits_styles[[i]],
              "'>", row_splits_body[[i]],
              "</td>", collapse = "\n"),
            "\n</tr>\n"))
    }

    if (stub_available && summaries_present &&
        i %in% groups_rows_df$row_end) {

      group <-
        groups_rows_df %>%
        dplyr::filter(row_end == i) %>%
        dplyr::pull(group)

      if (any(group %in% names(list_of_summaries$summary_df_display_list))) {

        summary_df <-
          list_of_summaries$summary_df_display_list[[
            which(names(list_of_summaries$summary_df_display_list) == group)]] %>%
          as.data.frame(stringsAsFactors = FALSE)

        body_content_summary <- as.vector(t(summary_df))

        row_splits_summary <-
          split_body_content(
            body_content = body_content_summary,
            n_cols = n_cols)

        # Provide CSS classes for leading and non-leading summary rows
        summary_row_classes_first <- "summary_row first_summary_row "
        summary_row_classes <- "summary_row "

        summary_row_lines <- c()

        for (j in seq(length(row_splits_summary))) {

          summary_row_lines <-
            c(summary_row_lines,
              paste0(
                "<tr data-type='summary' data-group='", group,
                "' data-summary-row='", j,"'>\n",
                paste0(
                  "<td class='stub row ",
                  ifelse(j == 1, summary_row_classes_first, summary_row_classes),
                  col_alignment[1], "'>", row_splits_summary[[j]][1],
                  "</td>"), "\n",
                paste0(
                  "<td class='row ",
                  ifelse(j == 1, summary_row_classes_first, summary_row_classes),
                  col_alignment[-1], "'>",
                  row_splits_summary[[j]][-1],
                  "</td>", collapse = "\n"),
                "\n</tr>\n")
            )
        }

        body_rows <- c(body_rows, summary_row_lines)
      }
    }
  }

  # Create a single-length vector by collapsing all vector components
  body_rows <- body_rows %>% paste(collapse = "")

  # Create the `table_body` HTML component
  paste0(
    "<tbody class='table_body striped'>\n",
    body_rows,
    "</tbody>\n")
}

create_column_headings <- function(boxh_df,
                                   output_df,
                                   stub_available,
                                   spanners_present,
                                   stubhead_caption,
                                   col_alignment) {

  # Compose the HTML heading
  headings <- names(output_df)

  # Merge the heading labels
  headings_rev <- headings %>% rev()

  labels_rev <-
    boxh_df["column_label", ] %>%
    unname() %>% unlist() %>% rev()

  for (i in seq(labels_rev)) {
    headings_rev[i] <- labels_rev[i]
  }
  headings <- rev(headings_rev)

  # If `stub_available` == TRUE, then replace with a set stubhead
  #   caption or nothing
  if (stub_available &&
      length(stubhead_caption) > 0 &&
      "rowname" %in% headings) {

    headings[which(headings == "rowname")] <- stubhead_caption$stubhead_caption

  } else if ("rowname" %in% headings) {

    headings[which(headings == "rowname")] <- ""
  }

  if (spanners_present == FALSE) {

    table_col_headings <-
      paste0(
        "<tr>\n",
        paste0(
          "<th class='col_heading ", col_alignment, "' rowspan='1' colspan='1'>",
          headings, "</th>", collapse = "\n"),
        "\n</tr>\n")

  } else {

    # spanners
    spanners <-
      boxh_df["group_label", ] %>%
      unlist() %>%
      unname()

    first_set <- c()
    second_set <- c()
    headings_stack <- c()

    if (stub_available) {

      first_set <-
        c(first_set,
          paste0(
            "<th data-type='column_heading' ",
            "class='col_heading ", col_alignment[1],
            "' rowspan='2' colspan='1'>",
            headings[1], "</th>"))

      headings <- headings[-1]
    }

    for (i in seq(headings)) {

      if (is.na(spanners[i])) {

        first_set <-
          c(first_set,
            paste0(
              "<th data-type='column_heading' ",
              "class='col_heading center' rowspan='2' colspan='1'>",
              headings[i], "</th>"))

        headings_stack <- c(headings_stack, headings[i])

      } else if (!is.na(spanners[i])) {

        if (i > 1) {
          if (is.na(spanners[i - 1])) {
            same_spanner <- FALSE
          } else if (spanners[i] == spanners[i - 1]) {
            same_spanner <- TRUE
          } else {
            same_spanner <- FALSE
          }
        } else {
          same_spanner <- FALSE
        }

        if (!same_spanner) {

          class <- "column_spanner"

          colspan <- 1L

          for (j in 1:length(spanners)) {

            if (is.na(spanners[i + j])) {
              spanner_adjacent <- FALSE
              break
            } else if (duplicated(spanners)[i + j]) {
              colspan <- colspan + 1L
            } else {
              spanner_adjacent <- ifelse(!is.na(spanners[i + j]), TRUE, FALSE)
              break
            }
          }

          if (spanner_adjacent) {
            class <- paste0(class, " sep_right")
          }

          first_set <-
            c(first_set,
              paste0(
                "<th data-type='column_heading' class='col_heading ",
                class, " ", ifelse(colspan > 1, "center", col_alignment[-1][i]),
                "' rowspan='1' colspan='",
                colspan, "'>", spanners[i], "</th>"))
        }
      }
    }

    first_set <- paste(first_set, collapse = "\n")

    remaining_headings <- headings[!(headings %in% headings_stack)]

    col_alignment <- col_alignment[-1][!(headings %in% headings_stack)]

    second_set <-
      paste0(
        "<th data-type='column_heading' class='col_heading ",
        col_alignment, "' rowspan='1' colspan='1'>",
        remaining_headings, "</th>",
        collapse = "\n")

    # Create the `table_col_headings` HTML component
    table_col_headings <-
      paste0(
        "<tr>\n",
        first_set, "\n</tr>\n<tr>\n",
        second_set, "\n</tr>\n")
  }

  table_col_headings
}

create_table_start <- function(groups_rows_df,
                               n_rows,
                               n_cols) {

  paste0(
    "<!--gt table start-->\n",
    "<table ",
    "data-nrow='", n_rows, "' ",
    "data-ncol='", n_cols, "' ",
    "data-ngroup='", get_n_groups(groups_rows_df), "' ",
    "class='gt_table'>\n")
}

create_table_end <- function() {

  "</table>\n<!--gt table end-->\n"
}

# Resolve footnotes
#' @importFrom dplyr filter bind_rows mutate inner_join select arrange select
#' @importFrom tibble rownames_to_column
#' @noRd
resolve_footnotes <- function(footnotes_df,
                              output_df,
                              boxh_df,
                              groups_rows_df,
                              arrange_groups,
                              boxhead_spanners,
                              title_defined,
                              headnote_defined) {

  footnotes_tbl <- footnotes_df

  # Pare down footnotes records
  if (nrow(footnotes_tbl) > 0) {

    # Filter `footnotes_tbl` by elements preceeding the
    # data rows (i.e., if element is not present but a footnote
    # reference is, remove the footnote reference since it is
    # not relevant)

    # Filter by `title`
    if (title_defined == FALSE) {

      footnotes_tbl <-
        footnotes_tbl %>%
        dplyr::filter(locname != "title")
    }

    # Filter by `headnote`
    if (headnote_defined == FALSE) {

      footnotes_tbl <-
        footnotes_tbl %>%
        dplyr::filter(locname != "headnote")
    }

    # Filter by `grpname` in boxhead groups
    if ("boxhead_groups" %in% footnotes_tbl[["locname"]]) { # remove conditional

      footnotes_tbl <-
        footnotes_tbl %>%
        dplyr::filter(locname != "boxhead_groups" | grpname %in% boxhead_spanners)
    }

    # Filter by `grpname` in stub groups
    if ("stub_groups" %in% footnotes_tbl[["locname"]]) {

      footnotes_tbl <-
        dplyr::bind_rows(
          footnotes_tbl %>%
            dplyr::filter(locname != "stub_groups"),
          footnotes_tbl %>%
            dplyr::filter(locname == "stub_groups") %>%
            dplyr::filter(grpname %in% arrange_groups$groups))
    }

    # Filter `footnotes_tbl` by the remaining columns in `output_df`
    footnotes_tbl <-
      footnotes_tbl %>%
      dplyr::filter(colname %in% c(NA_character_, colnames(output_df)))
  }

  # Reorganize footnotes targeting the data rows
  if (5 %in% footnotes_tbl[["locnum"]]) {

    footnotes_tbl_not_data <-
      footnotes_tbl %>%
      dplyr::filter(locnum != 5 | locname == "stub_groups")

    footnotes_tbl_data <-
      footnotes_tbl %>%
      dplyr::filter(locnum == 5 & locname != "stub_groups")

    if (nrow(footnotes_tbl_data) > 0) {

      # Re-map the `rownum` to the new row numbers for the
      # data rows
      footnotes_tbl_data <-
        footnotes_tbl_data %>%
        dplyr::mutate(rownum = rownum_translation(
          output_df, rownum_start = rownum))

      # Add a `colnum` column that's required for arranging
      # `footnotes_tbl` in such a way that the order of footnotes
      # moves top-to-bottom, left-to-right
      footnotes_tbl_data <-
        footnotes_tbl_data %>%
        dplyr::mutate(colnum = colname_to_colnum(
          boxh_df = boxh_df, colname = colname)) %>%
        dplyr::mutate(colnum = ifelse(locname == "stub", 0, colnum))
    }

    # Re-combine `footnotes_tbl_data` with `footnotes_tbl`
    footnotes_tbl <-
      dplyr::bind_rows(footnotes_tbl_not_data, footnotes_tbl_data)

  } else {
    footnotes_tbl <-
      footnotes_tbl %>%
      dplyr::mutate(colnum = NA_integer_)
  }

  # For the stub groups, insert a `rownum` based on groups_rows_df
  if ("stub_groups" %in% footnotes_tbl[["locname"]]) {

    footnotes_tbl_not_stub_groups <-
      footnotes_tbl %>%
      dplyr::filter(locname != "stub_groups")

    footnotes_tbl_stub_groups <-
      footnotes_tbl %>%
      dplyr::filter(locname == "stub_groups") %>%
      dplyr::inner_join(
        groups_rows_df %>% dplyr::select(-group_label),
        by = c("grpname" = "group")) %>%
      dplyr::mutate(rownum = row - 0.1) %>%
      dplyr::select(-row, -row_end)

    # Re-combine `footnotes_tbl_not_stub_groups`
    #   with `footnotes_tbl_stub_groups`
    footnotes_tbl <-
      dplyr::bind_rows(
        footnotes_tbl_not_stub_groups, footnotes_tbl_stub_groups)
  }

  # For the summary cells, insert a `rownum` based on groups_rows_df
  if ("summary_cells" %in% footnotes_tbl[["locname"]]) {

    footnotes_tbl_not_summary_cells <-
      footnotes_tbl %>%
      dplyr::filter(locname != "summary_cells")

    footnotes_tbl_summary_cells <-
      footnotes_tbl %>%
      dplyr::filter(locname == "summary_cells") %>%
      dplyr::inner_join(
        groups_rows_df %>% dplyr::select(-group_label),
        by = c("grpname" = "group")) %>%
      dplyr::mutate(rownum = (rownum / 100) + row_end) %>%
      dplyr::select(-row, -row_end)

    # Re-combine `footnotes_tbl_not_summary_cells`
    #   with `footnotes_tbl_summary_cells`
    footnotes_tbl <-
      dplyr::bind_rows(
        footnotes_tbl_not_summary_cells, footnotes_tbl_summary_cells)
  }

  if (!("colnum" %in% colnames(footnotes_tbl))) {

    footnotes_tbl <-
      footnotes_tbl %>%
      dplyr::mutate(colnum = NA_integer_)
  }

  # Sort the footnote occurrences
  footnotes_tbl <-
    footnotes_tbl %>%
    dplyr::arrange(locnum, rownum, colnum)

  # Generate a lookup table with ID'd footnote
  # text elements (that are distinct)
  footnote_text_tbl <-
    footnotes_tbl %>%
    dplyr::select(text) %>%
    dplyr::distinct() %>%
    tibble::rownames_to_column(var = "ft_id") %>%
    dplyr::mutate(ft_id = as.integer(ft_id))

  # Join the lookup table to `footnotes_tbl`
  footnotes_tbl <-
    footnotes_tbl %>%
    dplyr::inner_join(footnote_text_tbl, by = "text")

  footnotes_tbl
}

# Apply footnotes to the data rows
#' @importFrom dplyr filter group_by mutate ungroup select distinct
#' @noRd
apply_footnotes_to_output <- function(output_df,
                                      footnotes_resolved) {

  # `data` location
  footnotes_tbl_data <-
    footnotes_resolved %>%
    dplyr::filter(locname %in% c("data", "stub"))

  if (nrow(footnotes_tbl_data) > 0) {

    if ("stub" %in% footnotes_tbl_data$locname &&
        "rowname" %in% colnames(output_df)) {

      footnotes_tbl_data[
        which(is.na(footnotes_tbl_data$colname)), "colname"] <-
        "rowname"
    }

    footnotes_data_glpyhs <-
      footnotes_tbl_data %>%
      dplyr::group_by(rownum, colnum) %>%
      dplyr::mutate(ft_id_coalesced = paste(ft_id, collapse = ",")) %>%
      dplyr::ungroup() %>%
      dplyr::select(colname, rownum, ft_id_coalesced) %>%
      dplyr::distinct()

    for (i in seq(nrow(footnotes_data_glpyhs))) {

      text <-
        output_df[footnotes_data_glpyhs$rownum[i], footnotes_data_glpyhs$colname[i]]

      text <- paste0(text, footnote_glyph_to_html(footnotes_data_glpyhs$ft_id_coalesced[i]))

      output_df[
        footnotes_data_glpyhs$rownum[i], footnotes_data_glpyhs$colname[i]] <- text
    }
  }

  output_df
}


# Apply footnotes to the summary rows
#' @importFrom dplyr filter group_by mutate ungroup select distinct
#' @noRd
apply_footnotes_to_summary <- function(list_of_summaries,
                                       footnotes_resolved) {

  summary_df_list <- list_of_summaries$summary_df_display_list

  if (!("summary_cells" %in% footnotes_resolved$locname)) {
    return(list_of_summaries)
  }

  footnotes_tbl_data <-
    footnotes_resolved %>%
    dplyr::filter(locname == "summary_cells")

  footnotes_data_glpyhs <-
    footnotes_tbl_data %>%
    dplyr::mutate(row = as.integer(round((rownum - floor(rownum)) * 100, 0))) %>%
    dplyr::group_by(grpname, row, colnum) %>%
    dplyr::mutate(ft_id_coalesced = paste(ft_id, collapse = ",")) %>%
    dplyr::ungroup() %>%
    dplyr::select(grpname, colname, row, ft_id_coalesced) %>%
    dplyr::distinct()

  for (i in seq(nrow(footnotes_data_glpyhs))) {

    text <-
      summary_df_list[[footnotes_data_glpyhs[i, ][["grpname"]]]][[
        footnotes_data_glpyhs$row[i], footnotes_data_glpyhs$colname[i]]]

    text <-
      paste0(text, footnote_glyph_to_html(footnotes_data_glpyhs$ft_id_coalesced[i]))

    summary_df_list[[footnotes_data_glpyhs[i, ][["grpname"]]]][[
      footnotes_data_glpyhs$row[i], footnotes_data_glpyhs$colname[i]]] <- text
  }

  list_of_summaries$summary_df_display_list <- summary_df_list

  list_of_summaries
}

#' @importFrom dplyr arrange select distinct
#' @noRd
create_footnote_component <- function(footnotes_resolved,
                                      n_cols) {

  # If the `footnotes_resolved` object has no
  # rows, then return an empty footnotes component
  if (nrow(footnotes_resolved) == 0) {
    return("")
  }

  footnotes_tbl <-
    footnotes_resolved %>%
    dplyr::arrange(ft_id) %>%
    dplyr::select(ft_id, text) %>%
    dplyr::distinct()

  # Create the footnotes block
  footnote_component <-
    paste0(
      "<tfoot data-type='table_footnotes'>\n",
      "<tr data-type='table_footnote'>\n<td colspan='",
      n_cols,
      "' class='footnote'>",
      paste0(
        "<sup class='gt_super'><em>", footnotes_tbl[["ft_id"]],
        "</em></sup> ", footnotes_tbl[["text"]],
        collapse = "<br />"),
      "</td>\n</tr>\n</tfoot>")

  footnote_component
}

#' @importFrom dplyr filter group_by mutate ungroup select distinct
#' @noRd
create_heading_component <- function(heading,
                                     footnotes_resolved,
                                     n_cols) {

  if (length(heading) == 0) {
    return("")
  }

  # Get the resolved footnotes
  footnotes_tbl <- footnotes_resolved

  # Get the footnote glyphs for the title
  if ("title" %in% footnotes_tbl$locname) {

    footnote_title_glyphs <-
      footnotes_tbl %>%
      dplyr::filter(locname == "title") %>%
      dplyr::group_by() %>%
      dplyr::mutate(ft_id_coalesced = paste(ft_id, collapse = ",")) %>%
      dplyr::ungroup() %>%
      dplyr::select(ft_id_coalesced) %>%
      dplyr::distinct()

    footnote_title_glyphs <-
      footnote_glyph_to_html(footnote_title_glyphs$ft_id_coalesced)

  } else {
    footnote_title_glyphs <- ""
  }

  # Get the footnote glyphs for the headnote
  if ("headnote" %in% footnotes_tbl$locname) {

    footnote_headnote_glyphs <-
      footnotes_tbl %>%
      dplyr::filter(locname == "headnote") %>%
      dplyr::group_by() %>%
      dplyr::mutate(ft_id_coalesced = paste(ft_id, collapse = ",")) %>%
      dplyr::ungroup() %>%
      dplyr::select(ft_id_coalesced) %>%
      dplyr::distinct()

    footnote_headnote_glyphs <-
      footnote_glyph_to_html(footnote_headnote_glyphs$ft_id_coalesced)

  } else {
    footnote_headnote_glyphs <- ""
  }

  heading_component <-
    paste0(
      "<thead>\n<tr data-type='table_headings'>\n",
      "<th data-type='table_heading' class='heading title font_normal center' colspan='",
      n_cols, "'>",
      heading$title, footnote_title_glyphs, "</th>\n</tr>\n")

  if ("headnote" %in% names(heading)) {

    heading_component <-
      paste0(
        heading_component,
        paste0(
          "<tr data-type='table_headings'>\n",
          "<th data-type='table_headnote' ",
          "class='heading headnote font_normal center bottom_border' colspan='",
          n_cols, "'>",
          heading$headnote, footnote_headnote_glyphs, "</th>\n</tr>\n"))
  }

  heading_component
}

#' @importFrom dplyr filter group_by mutate ungroup select distinct
#' @noRd
set_footnote_glyphs_boxhead <- function(footnotes_resolved,
                                        boxh_df) {

  # Get the resolved footnotes
  footnotes_tbl <- footnotes_resolved

  # Get the `boxh_df` object
  boxh_df <- boxh_df

  # If there are any footnotes to apply to the boxhead,
  # process them individually for the spanner groups and
  # for the column label groups
  if (any(c("boxhead_columns", "boxhead_groups") %in% footnotes_tbl$locname)) {

    footnotes_tbl <-
      footnotes_tbl %>%
      dplyr::filter(locname %in% c("boxhead_columns", "boxhead_groups"))

    # Filter the boxhead spanner group footnotes
    footnotes_boxhead_group_tbl <-
      footnotes_tbl %>%
      dplyr::filter(!is.na(grpname))

    # Filter the boxhead column label footnotes
    footnotes_boxhead_column_tbl <-
      footnotes_tbl %>%
      dplyr::filter(!is.na(colname))

    if (nrow(footnotes_boxhead_group_tbl) > 0) {

      footnotes_boxhead_group_glyphs <-
        footnotes_boxhead_group_tbl %>%
        dplyr::group_by(grpname) %>%
        dplyr::mutate(ft_id_coalesced = paste(ft_id, collapse = ",")) %>%
        dplyr::ungroup() %>%
        dplyr::select(grpname, ft_id_coalesced) %>%
        dplyr::distinct()

      for (i in seq(nrow(footnotes_boxhead_group_glyphs))) {

        column_indices <-
          which(boxh_df["group_label", ] == footnotes_boxhead_group_glyphs$grpname[i])

        text <- boxh_df["group_label", column_indices] %>% unlist() %>% unname() %>% unique()

        text <-
          paste0(
            text,
            footnote_glyph_to_html(
              footnotes_boxhead_group_glyphs$ft_id_coalesced[i]))

        boxh_df["group_label", column_indices] <- text
      }
    }

    if (nrow(footnotes_boxhead_column_tbl) > 0) {

      footnotes_boxhead_column_glyphs <-
        footnotes_boxhead_column_tbl %>%
        dplyr::group_by(colname) %>%
        dplyr::mutate(ft_id_coalesced = paste(ft_id, collapse = ",")) %>%
        dplyr::ungroup() %>%
        dplyr::select(colname, ft_id_coalesced) %>%
        dplyr::distinct()

      for (i in seq(nrow(footnotes_boxhead_column_glyphs))) {

        text <-
          boxh_df["column_label", footnotes_boxhead_column_glyphs$colname[i]]

        text <-
          paste0(
            text,
            footnote_glyph_to_html(
              footnotes_boxhead_column_glyphs$ft_id_coalesced[i]))

        boxh_df[
          "column_label", footnotes_boxhead_column_glyphs$colname[i]] <- text
      }
    }
  }

  boxh_df
}

#' @importFrom dplyr filter group_by mutate ungroup select distinct
#' @noRd
set_footnote_glyphs_stub_groups <- function(footnotes_resolved,
                                            groups_rows_df) {

  # Get the resolved footnotes
  footnotes_tbl <- footnotes_resolved

  if (!("stub_groups" %in% footnotes_tbl$locname)) {

    return(groups_rows_df)
  }

  footnotes_stub_groups_tbl <-
    footnotes_tbl %>%
    dplyr::filter(locname == "stub_groups")

  if (nrow(footnotes_stub_groups_tbl) > 0) {

    footnotes_stub_groups_glyphs <-
      footnotes_stub_groups_tbl %>%
      dplyr::group_by(grpname) %>%
      dplyr::mutate(ft_id_coalesced = paste(ft_id, collapse = ",")) %>%
      dplyr::ungroup() %>%
      dplyr::select(grpname, ft_id_coalesced) %>%
      dplyr::distinct()

    for (i in seq(nrow(footnotes_stub_groups_glyphs))) {

      row_index <-
        which(groups_rows_df[, "group_label"] == footnotes_stub_groups_glyphs$grpname[i])

      text <- groups_rows_df[row_index, "group_label"]

      text <-
        paste0(
          text,
          footnote_glyph_to_html(
            footnotes_stub_groups_glyphs$ft_id_coalesced[i]))

      groups_rows_df[row_index, "group_label"] <- text
    }
  }

  groups_rows_df
}
