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
    if (is.na(data_attr$boxh_df[2, colname])) {
      data_attr$boxh_df[2, colname] <- colname
    }
  }

  data_attr
}

#' Assign center alignment for all columns that haven't had alignment
#' explicitly set
#' @noRd
set_default_alignments <- function(data_attr) {

  for (colname in colnames(data_attr$boxh_df)) {
    if (is.na(data_attr$boxh_df[3, colname])) {
      data_attr$boxh_df[3, colname] <- "center"
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

#' Are there any spanners present?
#' @noRd
are_spanners_present <- function(data_attr) {

  if (!all(is.na((data_attr$boxh_df)[1,] %>% t() %>% as.vector()))) {
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
    stub_components <- c(stub_components, "row_name")
  }

  if (any(!is.na(data_attr$stub_df[["groupname"]]))) {
    stub_components <- c(stub_components, "group_name")
  }

  stub_components
}

stub_component_is_rowname <- function(stub_components) {

  identical(stub_components, "row_name")
}

stub_component_is_groupname <- function(stub_components) {

  identical(stub_components, "group_name")
}

stub_component_is_rowname_groupname <- function(stub_components) {

  identical(stub_components, c("row_name", "group_name"))
}

#' Create a data frame with the rows that the group rows
#' should appear above
#' @noRd
get_groups_rows <- function(extracted,
                            ordering) {

  groups_rows <-
    data.frame(
      group = rep(NA_character_, length(ordering)),
      row = rep(NA_integer_, length(ordering)),
      stringsAsFactors = FALSE)

  for (i in seq(ordering)) {
    the_match <- match(ordering[i], extracted[, 1])
    groups_rows[i, 1] <- ordering[i]
    groups_rows[i, 2] <- the_match
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

    data_attr$fmts_df <-
      data_attr$fmts_df[
        , -which(colnames(data_attr$output_df) == value_2_col), drop = FALSE]

    data_attr$foot_df <-
      data_attr$foot_df[
        , -which(colnames(data_attr$output_df) == value_2_col), drop = FALSE]

    data_attr$output_df <-
      data_attr$output_df[
        , -which(colnames(data_attr$output_df) == value_2_col), drop = FALSE]
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

#' Used to splice in summary lines into the final gt table
#' @importFrom dplyr bind_rows select group_by everything ungroup
#' @importFrom dplyr mutate mutate_if mutate_all summarize_at funs
#' @noRd
integrate_summary_lines <- function(data_attr) {

  if (is.null(data_attr$summary)) {
    return(data_attr)
  }

  for (i in seq(data_attr$summary)) {

    summary_attrs <- data_attr$summary[[i]]

    groups_data_df <- cbind(data_attr$stub_df, data_attr$data_df)
    agg_funs <- summary_attrs$funs
    labels <- summary_attrs$labels

    summary_lines <- groups_data_df[0, ]

    for (j in seq(agg_funs)) {

      summary_lines <-
        dplyr::bind_rows(
          summary_lines,
          groups_data_df %>%
            dplyr::group_by(groupname) %>%
            dplyr::summarize_at(.vars = 3:ncol(groups_data_df), .funs = agg_funs[[j]]) %>%
            dplyr::ungroup() %>%
            dplyr::mutate(rowname = paste0("::summary_", labels[j])) %>%
            dplyr::select(groupname, rowname, dplyr::everything()))
    }

    # Filter by the groups requested
    if (!is.null(summary_attrs$groups)) {

      summary_lines <-
        summary_lines %>%
        subset(groupname %in% summary_attrs$groups)
    }

    # Place empty strings in any columns not requested for aggregation
    if (!is.null(summary_attrs$columns)) {

      empty_cols <-
        base::setdiff(
          colnames(summary_lines),
          c("groupname", "rowname", summary_attrs$columns))

      summary_lines[, which(colnames(summary_lines) %in% empty_cols)] <- ""
    }

    # Format the summary values and cast values as character
    summary_lines <-
      summary_lines %>%
      dplyr::mutate_if(
        .predicate = is.numeric,
        .funs = function(x) {
          formatC(
            x,
            digits = summary_attrs$decimals,
            mode = "double",
            big.mark = summary_attrs$sep_mark,
            decimal.mark = summary_attrs$dec_mark,
            format = "f",
            drop0trailing = FALSE)}
      ) %>%
      dplyr::mutate_all(dplyr::funs(as.character))

    summary_lines_na <- summary_lines
    summary_lines_na[] <- NA_character_

    data_attr$fmts_df <- rbind(data_attr$fmts_df, summary_lines_na[, -c(1:2)])
    data_attr$foot_df <- rbind(data_attr$foot_df, summary_lines_na[, -c(1:2)])
    data_attr$stub_df <- rbind(data_attr$stub_df, summary_lines[, 1:2])
    data_attr$output_df <- rbind(data_attr$output_df, summary_lines[, -c(1:2)])
  }

  data_attr
}

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
        subset(extracted, `:group_name:` == ordering[i]))

    fmts_df_reorder <-
      rbind(
        fmts_df_reorder,
        subset(data_attr$fmts_df, `:group_name:` == ordering[i]))

    foot_df_reorder <-
      rbind(
        foot_df_reorder,
        subset(data_attr$foot_df, `:group_name:` == ordering[i]))
  }

  rownames(extracted_reorder) <- NULL
  rownames(fmts_df_reorder) <- NULL
  rownames(foot_df_reorder) <- NULL

  data_attr$fmts_df <- fmts_df_reorder[, -c(1:2)]
  data_attr$foot_df <- foot_df_reorder[, -c(1:2)]
  extracted <- extracted_reorder

  list(data_attr = data_attr, extracted = extracted)
}

#' @noRd
footnotes_to_list <- function(data_attr,
                              has_stub,
                              list_object = NULL) {

  if (is.null(list_object)) {
    list_ <- list()
  } else {
    list_ <- list_object
  }

  if (has_stub) {

    dec_vec <- as.vector(t(cbind(data_attr$stub_df, data_attr$foot_df)[, -1]))

  } else {

    dec_vec <- as.vector(t(data_attr$foot_df))
  }

  for (i in seq(dec_vec)) {

    match <- regmatches(dec_vec[i], gregexpr("::foot_\\d+?", dec_vec[i])) %>% unlist()

    if (length(match) == 0) {
      match <- NA_character_
    } else {
      match <- tidy_gsub(match, "::foot_", "")
    }

    list_$footnotes[i] <- list(match)
  }

  list_
}

#' @importFrom stats setNames
#' @noRd
create_footnote_component <- function(data_attr,
                                      list_footnotes,
                                      body_content,
                                      n_cols) {

  if (is.null(data_attr$footnote)) {
    return(
      list(footnote_component = "",
           body_content = body_content))
  }

  glyphs_footnotes <- c()

  for (i in seq(list_footnotes$footnotes)) {

    if (any(!is.na(list_footnotes$footnotes[[i]]))) {

      footnote_glyph <- c()
      footnote_indices <- list_footnotes$footnotes[[i]]

      for (j in seq(footnote_indices)) {

        footnote_text <-
          data_attr$footnote[[1]][
            which(names(data_attr$footnote[[1]]) == footnote_indices[j])] %>%
          unname()

        # Check if the footnote text has been seen before
        if (!(footnote_text %in% glyphs_footnotes)) {
          glyphs_footnotes <-
            c(glyphs_footnotes, stats::setNames(footnote_text, footnote_indices[j]))
        }

        footnote_glyph <-
          c(footnote_glyph, unname(which(glyphs_footnotes == footnote_text)))
      }

      body_content[i] <-
        paste0(
          body_content[i],
          ifelse(grepl("</sup>$", body_content[i]), " ", ""),
          "<sup class='gt_super font_italic'>",
          paste(footnote_glyph, collapse = ","),
          "</sup>")
    }
  }

  # Create the footnotes block
  footnote_component <-
    paste0(
      "<tfoot data-type='table_footnotes'>\n",
      "<tr data-type='table_footnote'>\n<td colspan='", n_cols,
      "' class='footnote'>",
      paste0(
        "<sup class='gt_super'><em>", seq(glyphs_footnotes),
        "</em></sup> ", unname(glyphs_footnotes),
        collapse = "<br />"),
      "</td>\n</tr>\n</tfoot>")

  list(footnote_component = footnote_component,
       body_content = body_content)
}

#' @noRd
create_heading_component <- function(data_attr,
                                     n_cols) {

  if (is.null(data_attr$heading)) {
    return("")
  }

  heading_component <-
    paste0(
      "<thead>\n<tr data-type='table_headings'>\n",
      "<th data-type='table_heading' class='heading title font_normal center' colspan='",
      n_cols, "'>", data_attr$heading$title ,"</th>\n</tr>\n")

  if ("headnote" %in% names(data_attr$heading)) {

    heading_component <-
      paste0(
        heading_component,
        paste0(
          "<tr data-type='table_headings'>\n",
          "<th data-type='table_headnote' ",
          "class='heading headnote font_normal center bottom_border' colspan='",
          n_cols, "'>", data_attr$heading$headnote ,"</th>\n</tr>\n"))
  }

  paste0(
    heading_component,
    paste0(
      "<tr>\n<th class='spacer' colspan='", n_cols, "'></th>\n</tr>\n"))
}

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

#' @noRd
create_table_body <- function(row_splits,
                              row_splits_styles,
                              groups_rows,
                              col_alignment,
                              stub_available,
                              n_rows,
                              n_cols) {

  body_rows <- c()

  for (i in 1:n_rows) {

    if (!is.null(groups_rows) &&
        i %in% groups_rows$row) {

      # Process 'group' rows
      body_rows <-
        c(body_rows,
          paste0(
            "<tr>\n",
            "<td data-type='group' class='stub_heading'>",
            groups_rows[which(groups_rows$row %in% i), 1][[1]],
            "</td>\n<td class='stub_heading_field' colspan='",
            n_cols - 1, "'></td>\n</tr>\n"))
    }

    if (grepl("::summary_", row_splits[i][[1]][[1]])) {

      # Process 'summary' rows
      body_rows <-
        c(body_rows,
          paste0(
            "<tr data-type='summary' data-row='", i,"'>\n",
            paste0(
              "<td class='stub row summary_row ", col_alignment[1], "'>",
              tidy_gsub(row_splits[i][[1]][1], "::summary_", ""),
              "</td>"), "\n",
            paste0(
              "<td class='row summary_row ", col_alignment[-1], "'>",
              row_splits[i][[1]][-1],
              "</td>", collapse = "\n"),
            "\n</tr>\n"))

    } else {

      if (stub_available) {

        # Process 'data' rows where a stub is present
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

        # Process 'data' rows where no stub is present
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
                                   extracted,
                                   stub_available,
                                   spanners_present) {

  # Get the available property names
  property_names <-
    base::setdiff(
      names(data_attr),
      c("row.names", "class", "names", "boxh_df", "stub_df",
        "fmts_df", "foot_df", "output_df", "data_df", "formats"))

  # Compose the HTML heading
  headings <- names(extracted)

  # Merge the heading labels
  headings_rev <- headings %>% rev()
  labels_rev <- data_attr$boxh_df[2, ] %>% unname() %>% unlist() %>% rev()

  for (i in seq(labels_rev)) {
    headings_rev[i] <- labels_rev[i]
  }
  headings <- rev(headings_rev)

  # If `stub_available` == TRUE, then replace with a set stubhead
  #   caption or nothing
  if (stub_available &&
      "stubhead_caption" %in% property_names &&
      ":row_name:" %in% headings) {

    headings[which(headings == ":row_name:")] <-
      data_attr$stubhead_caption[[1]]

  } else if (":row_name:" %in% headings) {

    headings[which(headings == ":row_name:")] <- ""
  }

  if (spanners_present == FALSE) {

    table_col_headings <-
      paste0(
        "<tr>\n",
        paste0(
          "<th class='col_heading' rowspan='1' colspan='1'>",
          headings, "</th>", collapse = "\n"),
        "\n</tr>\n")

  } else {

    # spanners
    spanners <- data_attr$boxh_df[1, ] %>% unlist() %>% unname()

    first_set <- c()
    second_set <- c()
    headings_stack <- c()

    if (stub_available) {
      first_set <-
        c(first_set,
          paste0(
            "<th data-type='column_heading' class='col_heading' rowspan='2' colspan='1'>",
            headings[1], "</th>"))

      headings <- headings[-1]
    }

    for (i in seq(headings)) {

      if (is.na(spanners[i])) {

        first_set <-
          c(first_set,
            paste0(
              "<th data-type='column_heading' class='col_heading' rowspan='2' colspan='1'>",
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

          if (spanner_adjacent) class <- paste0(class, " sep_right")

          first_set <-
            c(first_set,
              paste0(
                "<th data-type='column_heading' class='col_heading ",
                class, "' rowspan='1' colspan='",
                colspan, "'>", spanners[i], "</th>"))
        }
      }
    }

    first_set <- paste(first_set, collapse = "\n")

    remaining_headings <- headings[!(headings %in% headings_stack)]

    second_set <-
      paste0(
        "<th data-type='column_heading' class='col_heading' rowspan='1' colspan='1'>",
        remaining_headings, "</th>",
        collapse = "\n")

    # Create the `table_col_headings` HTML component
    table_col_headings <-
      paste0(
        "<tr>\n",
        first_set, "\n</tr>\n<tr>\n",
        second_set, "\n</tr>\n")

    table_col_headings
  }
}

create_table_start <- function(groups_rows,
                               n_rows,
                               n_cols) {

  paste0(
    "<!--gt table start-->\n",
    "<table ",
    "data-nrow='", n_rows, "' ",
    "data-ncol='", n_cols, "' ",
    "data-ngroup='", get_n_groups(groups_rows), "' ",
    "class='gt_table'>\n")
}

create_table_end <- function() {

  "</table>\n<!--gt table end-->\n"
}
