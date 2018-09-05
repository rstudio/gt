#' Move input data cells to `output_df` that didn't have any rendering applied
#' during `render_formats()`
#' @noRd
migrate_unformatted_to_output <- function(data,
                                          output_df) {

  for (colname in colnames(output_df)) {

    row_index <- is.na(output_df[[colname]])
    output_df[[colname]][row_index] <- as.character(data[[colname]][row_index])
  }

  output_df
}

#' Apply column names to column labels for any of those column labels not
#' explicitly set
#' @noRd
migrate_colnames_to_labels <- function(data_attr) {

  for (colname in colnames(data_attr$boxh_df)) {

    if (is.na(data_attr$boxh_df["column_label", colname])) {
      data_attr$boxh_df["column_label", colname] <- colname
    }
  }

  data_attr
}

#' Assign center alignment for all columns that haven't had alignment
#' explicitly set
#' @noRd
set_default_alignments <- function(data_attr) {

  for (colname in colnames(data_attr$boxh_df)) {
    if (is.na(data_attr$boxh_df["column_align", colname])) {
      data_attr$boxh_df["column_align", colname] <- "center"
    }
  }

  data_attr
}

#' Is there any defined elements of a stub present?
#' @noRd
is_stub_available <- function(data_attr) {

  if (!all(is.na((data_attr$stub_df)[["rowname"]])) ||
      !all(is.na((data_attr$stub_df)[["groupname"]]))) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

#' Is there any group names defined in the stub?
#' @noRd
are_groups_present <- function(data_attr) {

  if (!all(is.na((data_attr$stub_df)[["groupname"]]))) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

#' Are there any processed summary dfs available?
#' @noRd
are_summaries_present <- function(data_attr) {

  if ("summary_df_display_list" %in% names(data_attr)) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

#' Are there any spanners present?
#' @noRd
are_spanners_present <- function(data_attr) {

  if (!all(is.na((data_attr$boxh_df)["group_label", ] %>% t() %>% as.vector()))) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

#' Get the stub components that are available
#' @noRd
get_stub_components <- function(data_attr) {

  stub_components <- c()

  if (any(!is.na(data_attr$stub_df[["rowname"]]))) {
    stub_components <- c(stub_components, "rowname")
  }

  if (any(!is.na(data_attr$stub_df[["groupname"]]))) {
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
get_groups_rows_df <- function(data_attr) {

  ordering <- data_attr$arrange_groups[[1]]

  groups_rows <-
    data.frame(
      group = rep(NA_character_, length(ordering)),
      group_label = rep(NA_character_, length(ordering)),
      row = rep(NA_integer_, length(ordering)),
      row_end = rep(NA_integer_, length(ordering)),
      stringsAsFactors = FALSE)

  for (i in seq(ordering)) {

    matched <- match(ordering[i], data_attr$groups_df[, "groupname"])

    count_matched <-
      length(which(data_attr$groups_df[, "groupname"] == ordering[i]))

    groups_rows[i, "group"] <- ordering[i]
    groups_rows[i, "group_label"] <- ordering[i]
    groups_rows[i, "row"] <- matched
    groups_rows[i, "row_end"] <- matched + count_matched - 1
  }

  groups_rows
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
perform_col_merge <- function(data_attr) {

  if (is.null(data_attr$col_merge)) {
    return(data_attr)
  }

  for (i in seq(data_attr$col_merge[[1]])) {

    pattern <- data_attr$col_merge[["pattern"]][i]
    value_1_col <- data_attr$col_merge[["col_1"]][i] %>% unname()
    value_2_col <- data_attr$col_merge[["col_1"]][i] %>% names()

    values_1 <-
      data_attr$output_df[, which(colnames(data_attr$output_df) == value_1_col)]

    values_2 <-
      data_attr$output_df[, which(colnames(data_attr$output_df) == value_2_col)]

    values_1_data <-
      data_attr$data_df[, which(colnames(data_attr$data_df) == value_1_col)]

    values_2_data <-
      data_attr$data_df[, which(colnames(data_attr$data_df) == value_2_col)]

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

    data_attr$output_df[
      , which(colnames(data_attr$output_df) == value_1_col)] <- values_1

    # Remove the second column across key dfs
    data_attr$boxh_df <-
      data_attr$boxh_df[
        , -which(colnames(data_attr$output_df) == value_2_col), drop = FALSE]

    data_attr$output_df <-
      data_attr$output_df[
        , -which(colnames(data_attr$output_df) == value_2_col), drop = FALSE]

    data_attr$columns_df[
      which(data_attr$columns_df == value_2_col),
      "colnum_final"] <- NA_integer_
  }

  data_attr
}

#' Used to merge two columns together in the final gt table
#' @noRd
obtain_group_ordering <- function(data_attr,
                                  extracted) {

  ordering <- data_attr$arrange_groups$groups
  all_groups <- unique(extracted[, 1])
  ordering <- c(ordering, base::setdiff(all_groups, ordering))
  ordering
}

#' TODO: refactor entirely
#' Used to splice in summary lines into the final gt table
#' @importFrom dplyr bind_rows select group_by everything ungroup arrange
#' @importFrom dplyr mutate mutate_at summarize_at funs slice filter
#' @importFrom tidyr fill
#' @noRd
integrate_summary_lines <- function(data_attr) {

  if (is.null(data_attr$summary)) {
    return(data_attr)
  }

  # Process summary lines to add as the `summary_df` data frame
  # to `data_attr`
  labels_vector <- c()

  for (i in seq(data_attr$summary)) {

    summary_attrs <- data_attr$summary[[i]]

    # Resolve the groups to consider
    if (isTRUE(summary_attrs$groups)) {
      groups <- unique(data_attr$stub_df$groupname)
    } else {
      groups <- summary_attrs$groups
    }

    # Resolve the columns to consider
    if (isTRUE(summary_attrs$columns)) {
      columns <- colnames(data_attr$data_df)
    } else {
      columns <- summary_attrs$columns
    }

    # Combine stub with the field data in order to
    # process data by groups
    groups_data_df <-
      cbind(
        data_attr$stub_df[1:nrow(data_attr$data_df), c("groupname", "rowname")],
        data_attr$data_df)

    # Get the registered function calls
    agg_funs <- summary_attrs$funs

    # Get the labels for each of the function calls
    labels <- agg_funs %>% names()

    summary_lines_display <- groups_data_df[0, ]
    summary_lines_storage <- groups_data_df[0, ]

    # Modify the column classes to be all "character" in
    # summary_lines_display
    summary_lines_display <-
      summary_lines_display %>%
      lapply(function(x) as.character(x)) %>%
      as.data.frame(stringsAsFactors = FALSE)

    for (j in seq(agg_funs)) {

      # Get aggregation rows for each of the `agg_funs`
      agg_rows <-
        groups_data_df %>%
        dplyr::filter(groupname %in% groups) %>%
        dplyr::select(groupname, !!!columns) %>%
        dplyr::group_by(groupname) %>%
        dplyr::summarize_at(.vars = columns, .funs = agg_funs[[j]]) %>%
        dplyr::ungroup() %>%
        dplyr::mutate(rowname = paste0("::summary_", labels[j])) %>%
        dplyr::select(groupname, rowname, dplyr::everything())

      # If any of the aggregated values are classed
      # differently than numeric, append column names
      # with a class identifier suffix
      col_classes_agg_cols <-
        agg_rows[, 3:ncol(agg_rows)] %>%
        lapply(class) %>%
        unlist() %>%
        unname() %>%
        class_shortener() %>%
        tidy_gsub("^", "_") %>%
        tidy_gsub("_dbl", "")

      # Create a copy of `agg_rows` for use in `summary_lines_storage`
      agg_rows_storage <- agg_rows

      # Suffix any column names in `agg_rows_storage` should the
      # `col_classes_agg_cols` should be anything but `numeric`
      colnames(agg_rows_storage)[3:ncol(agg_rows_storage)] <-
        paste0(
          colnames(agg_rows_storage)[3:ncol(agg_rows_storage)],
          col_classes_agg_cols)

      # Format the displayed summary lines
      agg_rows <-
        agg_rows %>%
        dplyr::mutate_at(
          .vars = summary_attrs$columns,
          .funs = function(x) {

            format_data <-
              do.call(
                summary_attrs$formatter,
                append(list(
                  data.frame(x = x),
                  columns = "x"),
                  summary_attrs$formatter_options))

            formatter <- attr(format_data, "formats")[[1]]$func

            if ("html" %in% names(formatter)) {
              formatter$html(x)
            } else {
              formatter$default(x)
            }
          }
        )

      # Bind rows in the displayed summary lines
      summary_lines_display <-
        dplyr::bind_rows(summary_lines_display, agg_rows)

      # Bind rows in the stored summary lines
      summary_lines_storage <-
        dplyr::bind_rows(summary_lines_storage, agg_rows_storage)
    }

    # Place empty strings in any columns not requested for aggregation
    summary_lines_display[is.na(summary_lines_display)] <- ""

    # Adding `summary_df` to the data object for later retrieval
    data_attr$summary_df <-
      dplyr::bind_rows(
        data_attr$summary_df,
        summary_lines_storage)

    summary_lines_na <- summary_lines_display
    summary_lines_na[] <- NA_character_

    data_attr$output_df <- rbind(data_attr$output_df, summary_lines_display[, -c(1:2)])

    data_attr$fmts_df <- rbind(data_attr$fmts_df, summary_lines_na[, -c(1:2)])

    data_attr$foot_df <- rbind(data_attr$foot_df, summary_lines_na[, -c(1:2)])

    data_attr$stub_df <-
      rbind(data_attr$stub_df,
            cbind(
              data.frame(
                fmts = rep(NA_character_, nrow(summary_lines_display)),
                foot = rep(NA_character_, nrow(summary_lines_display)),
                stringsAsFactors = FALSE),
              summary_lines_display[, 1:2]))

    for (k in seq(labels)) {
      labels_vector <-
        c(labels_vector, rep(labels[k], length(summary_attrs$groups)))
    }
  }

  # Apply labels to the `summary_df` that is stored in data_attr
  data_attr$summary_df$rowname <- labels_vector

  # Extract summary part of `output_df` for additional
  # processing of rows
  summary_part <-
    cbind(data_attr$stub_df[c("groupname", "rowname")], data_attr$output_df) %>%
    dplyr::filter(grepl("::summary_", rowname))

  # Transform `""` to NA for subsequent fill operations
  summary_part[summary_part == ""] <- NA_character_

  # Squash rows with common `groupname`` and `rowname`
  squashed_summary_rows <-
    summary_part %>%
    dplyr::arrange(groupname, rowname) %>%
    dplyr::group_by(groupname, rowname) %>%
    tidyr::fill(dplyr::everything(), .direction = "down") %>%
    tidyr::fill(dplyr::everything(), .direction = "up") %>%
    dplyr::slice(1) %>%
    dplyr::ungroup()

  # Fill NA values with empty strings
  squashed_summary_rows[is.na(squashed_summary_rows)] <- ""

  # Determine how many rows have been removed as a result
  # of the squashing procedure
  n_rows_removed <-
    nrow(summary_part) - nrow(squashed_summary_rows)

  # If it is found that rows are removed (i.e., some
  # squashing had occurred), reprocess the data_attr
  # data frames
  if (n_rows_removed > 0) {

    data_attr$output_df <-
      dplyr::bind_rows(
        data_attr$output_df[seq(nrow(data_attr$data_df)), ],
        squashed_summary_rows[, -c(1:2)])

    data_attr$fmts_df <-
      data_attr$fmts_df[seq(nrow(data_attr$output_df)), ]

    data_attr$foot_df <-
      data_attr$foot_df[seq(nrow(data_attr$output_df)), ]

    data_attr$stub_df <-
      dplyr::bind_rows(
        data_attr$stub_df[seq(nrow(data_attr$data_df)), ],
        squashed_summary_rows[, c(1:2)])
  }

  data_attr
}

#' @importFrom dplyr tibble
#' @noRd
arrange_dfs <- function(data_attr,
                        extracted,
                        ordering) {

  data_attr$fmts_df <- cbind(extracted[, 1:2], data_attr$fmts_df)
  data_attr$foot_df <- cbind(extracted[, 1:2], data_attr$foot_df)

  extracted_reorder <- fmts_df_reorder <- foot_df_reorder <- extracted[0, ]

  for (i in seq(ordering)) {

    extracted_reorder <-
      rbind(
        extracted_reorder,
        subset(extracted, groupname == ordering[i]))

    fmts_df_reorder <-
      rbind(
        fmts_df_reorder,
        subset(data_attr$fmts_df, groupname == ordering[i]))

    foot_df_reorder <-
      rbind(
        foot_df_reorder,
        subset(data_attr$foot_df, groupname == ordering[i]))
  }

  rows_df_modified <-
    dplyr::tibble(
      rownum_start = as.integer(seq(nrow(extracted_reorder))),
      rownum_final = as.integer(rownames(extracted_reorder)))

  rownames(extracted_reorder) <- NULL
  rownames(fmts_df_reorder) <- NULL
  rownames(foot_df_reorder) <- NULL

  data_attr$fmts_df <- fmts_df_reorder[, -c(1:2)]
  data_attr$foot_df <- foot_df_reorder[, -c(1:2)]
  extracted <- extracted_reorder

  list(
    data_attr = data_attr,
    extracted = extracted,
    rows_df_modified = rows_df_modified)
}

#' @importFrom dplyr tibble
#' @noRd
get_row_reorder_df <- function(data_attr) {

  # If there are no group, there there is no reordering
  # so just return a data frame where the starting row
  # indices match the final row indices
  if (length(data_attr$arrange_groups$groups) == 0) {

    indices <- seq_len(nrow(data_attr$stub_df))

    return(
      dplyr::tibble(
        rownum_start = indices,
        rownum_final = indices)
    )
  }

  groups <- data_attr$arrange_groups$groups

  indices <-
    lapply(data_attr$stub_df$group, `%in%`, x = groups) %>%
    lapply(which) %>%
    unlist() %>%
    order()

  dplyr::tibble(
    rownum_start = seq_along(indices),
    rownum_final = indices)
}

#' @noRd
#' @importFrom dplyr tibble mutate full_join rename
get_column_reorder_df <- function(data_attr) {

  colnames_final_tbl <-
    dplyr::tibble(colnames_final = colnames(data_attr$boxh_df)) %>%
    dplyr::mutate(colnum_final = seq(ncol(data_attr$boxh_df)))

  data_attr$cols_df %>%
    dplyr::mutate(colnum_start = seq(nrow(data_attr$cols_df))) %>%
    dplyr::full_join(
      colnames_final_tbl, by = c("colnames_start" = "colnames_final")) %>%
    dplyr::rename(column_names = colnames_start)
}

#' @noRd
get_groupnames_rownames_df <- function(data_attr) {

  data_attr$stub_df[data_attr$rows_df$rownum_final, c("groupname", "rowname")]
}

# Utility function to generate column numbers from column names
#' @noRd
colname_to_colnum <- function(data_attr, colname) {

  cnames <- c()

  for (i in seq(colname)) {
    if (is.na(colname[i])) {
      cnames <- c(cnames, NA_integer_)
    } else {
      cnames <- c(cnames, which(colnames(data_attr$boxh_df) == colname[i]))
    }
  }

  cnames
}

#' @noRd
rownum_translation <- function(data_attr, rownum_start) {

  rownum_final <- c()

  for (i in seq_along(rownum_start)) {

    rownum_final <-
      c(rownum_final,
        which(as.numeric(rownames(data_attr$output_df)) == rownum_start[i]))
  }

  rownum_final
}

#' @noRd
is_title_defined <- function(data_attr) {

  !is.null(data_attr$heading$title)
}

#' @noRd
is_headnote_defined <- function(data_attr) {

  !is.null(data_attr$heading$headnote) &&
    data_attr$heading$headnote != ""
}

#' @noRd
get_boxhead_spanners_vec <- function(data_attr) {

  boxhead_spanners <-
    data_attr$boxh_df["group_label", ] %>% unlist() %>% unname()

  boxhead_spanners[which(!is.na(boxhead_spanners))]
}


#' @noRd
footnote_glyph_to_html <- function(footnote_glyph) {

  paste0("<sup class='gt_super font_italic'>", footnote_glyph, "</sup>")
}


# body_footnotes_to_list <- function(data_attr,
#                                    has_stub,
#                                    list_object = NULL) {
#
#   if (is.null(list_object)) {
#     list_ <- list()
#   } else {
#     list_ <- list_object
#   }
#
#   if (has_stub) {
#
#     dec_vec <-
#       as.vector(t(cbind(data_attr$stub_df["foot"], data_attr$foot_df)))
#
#   } else {
#
#     dec_vec <- as.vector(t(data_attr$foot_df))
#   }
#
#   for (i in seq(dec_vec)) {
#
#     match <- regmatches(dec_vec[i], gregexpr("::foot_\\d+?", dec_vec[i])) %>% unlist()
#
#     if (length(match) == 0) {
#       match <- NA_character_
#     } else {
#       match <- tidy_gsub(match, "::foot_", "")
#     }
#
#     list_$footnotes[i] <- list(match)
#   }
#
#   list_
# }
#
#
# boxh_footnotes_to_list <- function(data_attr,
#                                    has_groups,
#                                    list_object = NULL) {
#
#   if (is.null(list_object)) {
#     list_ <- list()
#   } else {
#     list_ <- list_object
#   }
#
#   if (has_groups) {
#
#     dec_vec <- as.vector(t(data_attr$boxh_df[c("group_foot", "column_foot"), ]))
#
#   } else {
#
#     dec_vec <- as.vector(t(data_attr$boxh_df["column_foot", ]))
#   }
#
#   for (i in seq(dec_vec)) {
#
#     match <- regmatches(dec_vec[i], gregexpr("::foot_\\d+?", dec_vec[i])) %>% unlist()
#
#     if (length(match) == 0) {
#       match <- NA_character_
#     } else {
#       match <- tidy_gsub(match, "::foot_", "")
#     }
#
#     list_$boxh_footnotes[i] <- list(match)
#   }
#
#   list_
# }
#
#
# create_footnote_component <- function(data_attr,
#                                       list_footnotes,
#                                       body_content,
#                                       n_cols) {
#
#   # If no `footnote` object is available in `data_attr`
#   # then return an empty `footnote_component` and the
#   # `body_content` unchanged
#   if (is.null(data_attr$footnote)) {
#     return(
#       list(footnote_component = "",
#            body_content = body_content))
#   }
#
#   # Get any of the footnotes in the boxhead
#   data_attr$boxh_df[c("group_foot", "column_foot"), ]
#
#   glyphs_footnotes <- c()
#
#   # Process footnotes in the stub and in the field
#   for (i in seq(list_footnotes$footnotes)) {
#
#     if (any(!is.na(list_footnotes$footnotes[[i]]))) {
#
#       footnote_glyph <- c()
#       footnote_indices <- list_footnotes$footnotes[[i]]
#
#       for (j in seq(footnote_indices)) {
#
#         footnote_text <-
#           data_attr$footnote[[1]][
#             which(names(data_attr$footnote[[1]]) == footnote_indices[j])] %>%
#           unname()
#
#         # Check if the footnote text has been seen before
#         if (!(footnote_text %in% glyphs_footnotes)) {
#           glyphs_footnotes <-
#             c(glyphs_footnotes, stats::setNames(footnote_text, footnote_indices[j]))
#         }
#
#         footnote_glyph <-
#           c(footnote_glyph, unname(which(glyphs_footnotes == footnote_text)))
#       }
#
#       body_content[i] <-
#         paste0(
#           body_content[i],
#           ifelse(grepl("</sup>$", body_content[i]), " ", ""),
#           "<sup class='gt_super font_italic'>",
#           paste(footnote_glyph, collapse = ","),
#           "</sup>")
#     }
#   }
#
#   # Create the footnotes block
#   footnote_component <-
#     paste0(
#       "<tfoot data-type='table_footnotes'>\n",
#       "<tr data-type='table_footnote'>\n<td colspan='", n_cols,
#       "' class='footnote'>",
#       paste0(
#         "<sup class='gt_super'><em>", seq(glyphs_footnotes),
#         "</em></sup> ", unname(glyphs_footnotes),
#         collapse = "<br />"),
#       "</td>\n</tr>\n</tfoot>")
#
#   list(footnote_component = footnote_component,
#        body_content = body_content)
# }
#
#
# create_heading_component <- function(data_attr,
#                                      n_cols) {
#
#   if (is.null(data_attr$heading)) {
#     return("")
#   }
#
#   heading_component <-
#     paste0(
#       "<thead>\n<tr data-type='table_headings'>\n",
#       "<th data-type='table_heading' class='heading title font_normal center' colspan='",
#       n_cols, "'>", data_attr$heading$title ,"</th>\n</tr>\n")
#
#   if ("headnote" %in% names(data_attr$heading)) {
#
#     heading_component <-
#       paste0(
#         heading_component,
#         paste0(
#           "<tr data-type='table_headings'>\n",
#           "<th data-type='table_headnote' ",
#           "class='heading headnote font_normal center bottom_border' colspan='",
#           n_cols, "'>", data_attr$heading$headnote ,"</th>\n</tr>\n"))
#   }
#
#   heading_component
# }

#' @noRd
create_source_note_rows <- function(data_attr,
                                    n_cols) {

  if (is.null(data_attr$source_note)) {
    return("")
  }

  paste0(
    "<tfoot data-type='source_notes'>\n",
    paste0(
      "<tr>\n<td colspan='", n_cols + 1 ,
      "' class='sourcenote'>", data_attr$source_note[[1]],
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
create_table_body <- function(row_splits,
                              row_splits_styles,
                              groups_rows_df,
                              col_alignment,
                              stub_components,
                              summary_list,
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
      dplyr::mutate(group = ifelse(is.na(group), "", group))
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
            groups_rows_df[which(groups_rows_df$row %in% i), 1][[1]],
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
              "style='", row_splits_styles[i][[1]][1],
              "'>", row_splits[i][[1]][1],
              "</td>"), "\n",
            paste0(
              "<td class='row ", col_alignment[-1], "' ",
              "style='", row_splits_styles[i][[1]][-1],
              "'>", row_splits[i][[1]][-1],
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
              "style='", row_splits_styles[i][[1]],
              "'>", row_splits[i][[1]],
              "</td>", collapse = "\n"),
            "\n</tr>\n"))
    }

    if (stub_available &&
        !is.null(summary_list) &&
        i %in% groups_rows_df$row_end) {

      group <-
        groups_rows_df %>%
        dplyr::filter(row_end == i) %>%
        dplyr::pull(group)

      if (group %in% names(summary_list)) {

        summary_df <-
          summary_list[[which(names(summary_list) == group)]] %>%
          as.data.frame(stringsAsFactors = FALSE)

        #rownames(summary_df) <- as.character(i + seq(nrow(summary_df)) / 100)

        body_content_summary <- as.vector(t(summary_df))

        row_splits_summary <-
          split_body_content(body_content = body_content_summary, n_cols = n_cols)

        # Provide CSS class for leading and non-leading
        #   summary rows
        summary_row_classes_first <- "summary_row first_summary_row "
        summary_row_classes <- "summary_row "

        summary_row_lines <- c()

        for (j in seq(length(row_splits_summary))) {

          summary_row_lines <-
            c(summary_row_lines,
              paste0(
                "<tr data-type='summary' data-row='", i,"'>\n",
                paste0(
                  "<td class='stub row ",
                  ifelse(j == 1, summary_row_classes_first, summary_row_classes),
                  col_alignment[1], "'>",
                  tidy_gsub(row_splits_summary[j][[1]][1], "::summary_", ""),
                  "</td>"), "\n",
                paste0(
                  "<td class='row ",
                  ifelse(j == 1, summary_row_classes_first, summary_row_classes),
                  col_alignment[-1], "'>",
                  row_splits_summary[j][[1]][-1],
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

create_column_headings <- function(data_attr,
                                   col_alignment,
                                   stub_available,
                                   spanners_present) {

  # Compose the HTML heading
  headings <- names(data_attr$output_df)

  # Merge the heading labels
  headings_rev <- headings %>% rev()

  labels_rev <-
    data_attr$boxh_df["column_label", ] %>%
    unname() %>% unlist() %>% rev()

  for (i in seq(labels_rev)) {
    headings_rev[i] <- labels_rev[i]
  }
  headings <- rev(headings_rev)

  # If `stub_available` == TRUE, then replace with a set stubhead
  #   caption or nothing
  if (stub_available &&
      "stubhead_caption" %in% names(data_attr) &&
      "rowname" %in% headings) {

    headings[which(headings == "rowname")] <- data_attr$stubhead_caption[[1]]

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
      data_attr$boxh_df["group_label", ] %>%
      unlist() %>% unname()

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
#' @importFrom dplyr filter bind_rows mutate inner_join select arrange
#' @importFrom tibble rownames_to_column
#' @noRd
resolve_footnotes <- function(data_attr,
                              groups_rows_df) {

  footnotes_tbl <- data_attr$footnotes_df

  # Pare down footnotes records
  if (nrow(footnotes_tbl) > 0) {

    # Filter `footnotes_tbl` by elements preceeding the
    # data rows (i.e., if element is not present but a footnote
    # reference is, remove the footnote reference since it is
    # not relevant)

    # Filter by `title`
    if (!is_title_defined(data_attr = data_attr)) {

      footnotes_tbl <-
        footnotes_tbl %>%
        dplyr::filter(locnum != 1)
    }

    # Filter by `headnote`
    if (!is_headnote_defined(data_attr = data_attr)) {

      footnotes_tbl <-
        footnotes_tbl %>%
        dplyr::filter(locnum != 2)
    }

    # Filter by `grpname` in boxhead groups
    if ("boxhead_groups" %in% footnotes_tbl[["locname"]]) {

      footnotes_tbl <-
        dplyr::bind_rows(
          footnotes_tbl %>%
            dplyr::filter(locname != "boxhead_groups"),
          footnotes_tbl %>%
            dplyr::filter(locname == "boxhead_groups") %>%
            dplyr::filter(grpname %in% data_attr$boxhead_spanners))
    }

    # Filter by `grpname` in stub groups
    if ("stub_groups" %in% footnotes_tbl[["locname"]]) {

      footnotes_tbl <-
        dplyr::bind_rows(
          footnotes_tbl %>%
            dplyr::filter(locname != "stub_groups"),
          footnotes_tbl %>%
            dplyr::filter(locname == "stub_groups") %>%
            dplyr::filter(grpname %in% data_attr$arrange_groups$groups))
    }

    # Filter `footnotes_tbl` by the remaining columns
    # in `data_attr$output_df`
    footnotes_tbl <-
      footnotes_tbl %>%
      dplyr::filter(colname %in% c(NA_character_, colnames(data_attr$output_df)))
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
          data_attr = data_attr, rownum_start = rownum))

      # Add a `colnum` column that's required for arranging
      # `footnotes_tbl` in such a way that the order of footnotes
      # moves top-to-bottom, left-to-right
      footnotes_tbl_data <-
        footnotes_tbl_data %>%
        dplyr::mutate(colnum = colname_to_colnum(
          data_attr = data_attr, colname = colname)) %>%
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
      dplyr::inner_join(groups_rows_df, by = c("grpname" = "group")) %>%
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
      dplyr::inner_join(groups_rows_df, by = c("grpname" = "group")) %>%
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
apply_footnotes_to_data <- function(data_attr) {

  output_df <- data_attr$output_df

  # `data` location
  footnotes_tbl_data <-
    data_attr$footnotes_resolved %>%
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
apply_footnotes_to_summary <- function(data_attr) {

  summary_df_list <- data_attr$summary_df_display_list

  if (!("summary_cells" %in% data_attr$footnotes_resolved$locname)) {
    return(summary_df_list)
  }

  footnotes_tbl_data <-
    data_attr$footnotes_resolved %>%
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

  summary_df_list
}

#' @importFrom dplyr arrange select distinct
#' @noRd
create_footnote_component <- function(data_attr) {

  # If the `footnotes_resolved` object in `data_attr` has no
  # rows, then return an empty footnotes component
  if (nrow(data_attr$footnotes_resolved) == 0) {
    return("")
  }

  footnotes_tbl <-
    data_attr$footnotes_resolved %>%
    dplyr::arrange(ft_id) %>%
    dplyr::select(ft_id, text) %>%
    dplyr::distinct()

  # Create the footnotes block
  footnote_component <-
    paste0(
      "<tfoot data-type='table_footnotes'>\n",
      "<tr data-type='table_footnote'>\n<td colspan='",
      ncol(data_attr$output_df),
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
create_heading_component <- function(data_attr) {

  if (is.null(data_attr$heading)) {
    return("")
  }

  # Get the resolved footnotes
  footnotes_tbl <- data_attr$footnotes_resolved

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
      ncol(data_attr$output_df), "'>",
      data_attr$heading$title, footnote_title_glyphs, "</th>\n</tr>\n")

  if ("headnote" %in% names(data_attr$heading)) {

    heading_component <-
      paste0(
        heading_component,
        paste0(
          "<tr data-type='table_headings'>\n",
          "<th data-type='table_headnote' ",
          "class='heading headnote font_normal center bottom_border' colspan='",
          ncol(data_attr$output_df), "'>",
          data_attr$heading$headnote, footnote_headnote_glyphs, "</th>\n</tr>\n"))
  }

  heading_component
}

#' @importFrom dplyr filter group_by mutate ungroup select distinct
#' @noRd
set_footnote_glyphs_boxhead <- function(data_attr) {

  # Get the resolved footnotes
  footnotes_tbl <- data_attr$footnotes_resolved

  # Get the `boxh_df` object
  boxh_df <- data_attr$boxh_df

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
set_footnote_glyphs_stub_groups <- function(data_attr,
                                            groups_rows_df) {

  # Get the resolved footnotes
  footnotes_tbl <- data_attr$footnotes_resolved

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
        which(groups_rows_df[, "group"] == footnotes_stub_groups_glyphs$grpname[i])

      text <- groups_rows_df[row_index, "group"]

      text <-
        paste0(
          text,
          footnote_glyph_to_html(
            footnotes_stub_groups_glyphs$ft_id_coalesced[i]))

      groups_rows_df[row_index, "group"] <- text
    }
  }

  groups_rows_df
}
