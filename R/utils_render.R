
# Utility function to generate column numbers from column names
#   Used in: `resolve_footnotes_styles()`
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

# Utility function to generate finalized row numbers
#   Used in: `resolve_footnotes_styles()`
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

# Common render pipeline functions ----------------------------------------

# If a vector is found (perhaps within a list) simply return the vector;
# otherwise return NA
get_optional_vector <- function(object) {

  if (!is.null(object)) {
    return(object)
  } else {
    return(NA_character_)
  }
}

# If a list is found (perhaps within another list) simply return that list;
# otherwise return an empty list
get_optional_list <- function(object) {

  if (!is.null(object)) {
    return(object)
  } else {
    return(list())
  }
}

# Initialize `output_df`
initialize_output_df <- function(data_df) {

  output_df <- data_df
  output_df[] <- NA_character_
  output_df
}

# Render any formatting directives available in the `formats` list
render_formats <- function(output_df,
                           data_df,
                           formats,
                           context) {

  # Render input data to output data where formatting
  # is specified
  for (i in seq(formats))  {

    # Determine if the formatter has a function relevant
    # to the context; if not, use the `default` function
    # (which should always be present)
    if (context %in% names(formats[[i]]$func)) {
      eval_func <- context
    } else {
      eval_func <- "default"
    }

    for (col in formats[[i]][["cols"]]) {

      # Perform rendering but only do so if the column is present
      if (col %in% colnames(data_df)) {

        output_df[[col]][formats[[i]]$rows] <-
          formats[[i]]$func[[eval_func]](
            data_df[[col]][formats[[i]]$rows])
      }
    }
  }

  output_df
}

# Testable version of the `render_formats()` function
render_formats_test <- function(data,
                                context) {

  data_attr <- attributes(data)

  # Move original data frame to `data_df`
  data_df <- as.data.frame(data)

  # Initialize `output_df`
  output_df <- initialize_output_df(data_df)

  # Get the `formats` list
  formats <- data_attr$formats

  # Render input data to output data where formatting
  # is specified
  for (i in seq(formats))  {

    # Determine if the formatter has a function relevant
    # to the context; if not, use the `default` function
    # (which should always be present)
    if (context %in% names(formats[[i]]$func)) {
      eval_func <- context
    } else {
      eval_func <- "default"
    }

    for (col in formats[[i]][["cols"]]) {

      # Perform rendering but only do so if the column is present
      if (col %in% colnames(data_df)) {

        output_df[[col]][formats[[i]]$rows] <-
          formats[[i]]$func[[eval_func]](
            data_df[[col]][formats[[i]]$rows])
      }
    }
  }

  output_df
}

# Move input data cells to `output_df` that didn't have any rendering applied
# during the `render_formats()` call
migrate_unformatted_to_output <- function(data_df,
                                          output_df) {

  for (colname in colnames(output_df)) {

    row_index <- is.na(output_df[[colname]])
    output_df[[colname]][row_index] <- as.character(data_df[[colname]][row_index])
  }

  output_df
}

# Function to obtain a reordering df for the data rows
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

  groups <- arrange_groups$groups

  indices <-
    lapply(stub_df$group, `%in%`, x = groups) %>%
    lapply(which) %>%
    unlist() %>%
    order()

  dplyr::tibble(
    rownum_start = seq_along(indices),
    rownum_final = indices)
}

# Function to obtain a reordering df for the table columns
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

# Function to reassemble the rows and columns of the `output_df`
# in a revised order
reassemble_output_df <- function(output_df,
                                 rows_df,
                                 columns_df) {

  rows <- rows_df$rownum_final

  cols <-
    subset(columns_df, !is.na(colnum_final))[
      order(subset(columns_df, !is.na(colnum_final))$colnum_final), ]$column_names

  output_df[rows, cols, drop = FALSE]
}

# Function to obtain a reordered version of `stub_df`
get_groupnames_rownames_df <- function(stub_df,
                                       rows_df) {

  stub_df[rows_df$rownum_final, c("groupname", "rowname")]
}

# Function to get a vector of boxhead group (spanner) names
get_boxhead_spanners_vec <- function(boxh_df) {

  boxhead_spanners <-
    boxh_df["group_label", ] %>% unlist() %>% unname()

  boxhead_spanners[which(!is.na(boxhead_spanners))]
}

# Function to create a data frame with group information and the
# associated row numbers in the rearranged representation
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

# Function for merging pairs of columns together (in `output_df`) and
# transforming the dependent data frames (`boxh_df` and `columns_df`)
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

    # Remove the second column across key data frames
    boxh_df <-
      boxh_df[, -which(colnames(output_df) == value_2_col), drop = FALSE]

    output_df <-
      output_df[, -which(colnames(output_df) == value_2_col), drop = FALSE]

    # Mark the removed column as missing in `columns_df`
    columns_df[which(columns_df == value_2_col), "colnum_final"] <- NA_integer_
  }

  # Return a list with the modified data frames
  list(
    output_df = output_df,
    boxh_df = boxh_df,
    columns_df = columns_df)
}

# Create a list of summary data frames given a `summary_list` (a list
# of directives for making per-group summaries); the final list will
# provide `display` and `data` versions of the summaries, named by group
#' @import rlang
#' @importFrom dplyr select mutate everything bind_rows filter group_by
#' @importFrom dplyr summarize_all ungroup mutate_at slice mutate_all
#' @importFrom tidyr fill
#' @importFrom stats setNames
#' @noRd
create_summary_dfs <- function(summary_list,
                               data_df,
                               stub_df,
                               output_df) {

  if (length(summary_list) == 0) {
    return(list())
  }

  summary_df_display_list <- list()
  summary_df_data_list <- list()

  for (i in seq(summary_list)) {

    summary_attrs <- summary_list[[i]]

    # Resolve the `missing_text`
    if (summary_attrs$missing_text == "---") {
      summary_attrs$missing_text <- "\u2014"
    } else if (missing_text == "--") {
      summary_attrs$missing_text <- "\u2013"
    }

    # Resolve the groups to consider
    if (isTRUE(summary_attrs$groups)) {
      groups <- unique(stub_df$groupname)
    } else {
      groups <- summary_attrs$groups
    }

    # Resolve the columns to exclude
    if (isTRUE(summary_attrs$columns)) {
      columns <- character(0)
    } else {
      columns <- base::setdiff(colnames(output_df), summary_attrs$columns)
    }

    # Combine `groupname` with the field data in order to
    # process data by groups
    groups_data_df <-
      cbind(
        stub_df[
          seq(nrow(stub_df)),
          c("groupname", "rowname")],
        data_df)[, -2]

    # Get the registered function calls
    agg_funs <- summary_attrs$funs

    # Get the labels for each of the function calls
    labels <- agg_funs %>% names()

    # Initialize an empty tibble to bind to
    summary_dfs <- dplyr::tibble()

    for (j in seq(agg_funs)) {

      # Get aggregation rows for each of the `agg_funs`
      summary_dfs <-
        dplyr::bind_rows(
          summary_dfs,
          groups_data_df %>%
            dplyr::select(c("groupname", colnames(output_df))) %>%
            dplyr::filter(groupname %in% groups) %>%
            dplyr::group_by(groupname) %>%
            dplyr::summarize_all(.funs = agg_funs[[j]]) %>%
            dplyr::ungroup() %>%
            dplyr::mutate(rowname = labels[j]) %>%
            dplyr::select(groupname, rowname, dplyr::everything()))
    }

    # Exclude columns that are not requested by
    # filling those with NA values
    summary_dfs_data <-
      summary_dfs %>%
      dplyr::mutate_at(.vars = columns, .funs = function(x) {NA_real_})

    # Format the displayed summary lines
    summary_dfs_display <-
      summary_dfs %>%
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
      ) %>%
      dplyr::mutate_at(
        .vars = columns,
        .funs = function(x) {NA_character_})

    for (group in groups) {

      # Place data frame in separate list component by `group`
      group_sym <- rlang::enquo(group)

      group_summary_data_df <-
        summary_dfs_data %>%
        dplyr::filter(groupname == !!group_sym)

      group_summary_display_df <-
        summary_dfs_display %>%
        dplyr::filter(groupname == !!group_sym) %>%
        dplyr::mutate_all(funs(replace(., is.na(.), summary_attrs$missing_text)))

      summary_df_data_list <-
        c(summary_df_data_list,
          stats::setNames(list(group_summary_data_df), group))

      summary_df_display_list <-
        c(summary_df_display_list,
          stats::setNames(list(group_summary_display_df), group))
    }
  }

  # Condense data in summary_df_display_list in a
  # groupwise manner
  summary_df_display_list <-
    tapply(
      summary_df_display_list,
      names(summary_df_display_list),
      dplyr::bind_rows)


  for (i in seq(summary_df_display_list)) {

    arrangement <- unique(summary_df_display_list[[i]]$rowname)

    summary_df_display_list[[i]] <-
      summary_df_display_list[[i]] %>%
      dplyr::select(-groupname) %>%
      dplyr::group_by(rowname) %>%
      tidyr::fill(dplyr::everything(), .direction = "down") %>%
      tidyr::fill(dplyr::everything(), .direction = "up") %>%
      dplyr::slice(1) %>%
      dplyr::ungroup()

    summary_df_display_list[[i]] <-
      summary_df_display_list[[i]][
        match(arrangement, summary_df_display_list[[i]]$rowname), ]
  }

  list(
    summary_df_data_list = summary_df_data_list,
    summary_df_display_list = summary_df_display_list)
}

# Apply column names to column labels for any of those column labels not
# explicitly set
migrate_colnames_to_labels <- function(boxh_df) {

  for (colname in colnames(boxh_df)) {

    if (is.na(boxh_df["column_label", colname])) {
      boxh_df["column_label", colname] <- colname
    }
  }

  boxh_df
}

# Assign center alignment for all columns that haven't had alignment
# explicitly set
set_default_alignments <- function(boxh_df) {

  for (colname in colnames(boxh_df)) {
    if (is.na(boxh_df["column_align", colname])) {
      boxh_df["column_align", colname] <- "center"
    }
  }

  boxh_df
}

# Function to determine if there are any defined elements of a stub present
is_stub_available <- function(stub_df) {

  if (!all(is.na((stub_df)[["rowname"]])) ||
      !all(is.na((stub_df)[["groupname"]]))) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

# Function to determine if a title element has been defined
is_title_defined <- function(heading) {

  length(heading) > 0 && !is.null(heading$title)
}

# Function to determine if a headnote element has been defined
is_headnote_defined <- function(heading) {

  length(heading) > 0 && !is.null(heading$headnote) && heading$headnote != ""
}

# Function to determine if the `list_of_summaries` object contains
# processed summary data frames
are_summaries_present <- function(list_of_summaries) {

  if (length(list_of_summaries) == 0) {
    return(FALSE)
  } else {
    return(TRUE)
  }
}

# Function to determine if any group headings (spanners) are present
are_spanners_present <- function(boxh_df) {

  if (!all(is.na((boxh_df)["group_label", ] %>% t() %>% as.vector()))) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

# Function to get a vector of the stub components that are available
# within the `stub_df` data frame
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

# Function that checks `stub_components` and determines whether just the
# `rowname` part is available; TRUE indicates that we are working with a table
# with rownames
stub_component_is_rowname <- function(stub_components) {

  identical(stub_components, "rowname")
}

# Function that checks `stub_components` and determines whether just the
# `groupname` part is available; TRUE indicates that we are working with a table
# with groups but it doesn't have rownames
stub_component_is_groupname <- function(stub_components) {

  identical(stub_components, "groupname")
}

# Function that checks `stub_components` and determines whether the
# `rowname` and `groupname` parts are available; TRUE indicates that we are
# working with a table with rownames and groups
stub_component_is_rowname_groupname <- function(stub_components) {

  identical(stub_components, c("rowname", "groupname"))
}

# Resolve footnotes or styles
#' @importFrom dplyr filter bind_rows mutate inner_join select arrange select
#' @importFrom tibble rownames_to_column
#' @noRd
resolve_footnotes_styles <- function(output_df,
                                     boxh_df,
                                     groups_rows_df,
                                     arrange_groups,
                                     boxhead_spanners,
                                     title_defined,
                                     headnote_defined,
                                     footnotes_df = NULL,
                                     styles_df = NULL) {

  if (!is.null(styles_df) && is.null(footnotes_df)) {
    tbl <- styles_df
  } else if (is.null(styles_df) && !is.null(footnotes_df)) {
    tbl <- footnotes_df
  }

  # Pare down to the relevant records
  if (nrow(tbl) > 0) {

    # Filter `tbl` by elements preceeding the data rows (i.e., if element is not
    # present but a reference is, remove the footnote reference since it is not
    # relevant)

    # Filter by `title`
    if (title_defined == FALSE) {

      tbl <-
        tbl %>%
        dplyr::filter(locname != "title")
    }

    # Filter by `headnote`
    if (headnote_defined == FALSE) {

      tbl <-
        tbl %>%
        dplyr::filter(locname != "headnote")
    }

    # Filter by `grpname` in boxhead groups
    if ("boxhead_groups" %in% tbl[["locname"]]) { # remove conditional

      tbl <-
        tbl %>%
        dplyr::filter(locname != "boxhead_groups" | grpname %in% boxhead_spanners)
    }

    # Filter by `grpname` in stub groups
    if ("stub_groups" %in% tbl[["locname"]]) {

      tbl <-
        dplyr::bind_rows(
          tbl %>%
            dplyr::filter(locname != "stub_groups"),
          tbl %>%
            dplyr::filter(locname == "stub_groups") %>%
            dplyr::filter(grpname %in% arrange_groups$groups))
    }

    # Filter `tbl` by the remaining columns in `output_df`
    tbl <-
      tbl %>%
      dplyr::filter(colname %in% c(NA_character_, colnames(output_df)))
  }

  # Reorganize records that target the data rows
  if (5 %in% tbl[["locnum"]]) {

    tbl_not_data <-
      tbl %>%
      dplyr::filter(locnum != 5 | locname == "stub_groups")

    tbl_data <-
      tbl %>%
      dplyr::filter(locnum == 5 & locname != "stub_groups")

    if (nrow(tbl_data) > 0) {

      # Re-map the `rownum` to the new row numbers for the
      # data rows
      tbl_data <-
        tbl_data %>%
        dplyr::mutate(rownum = rownum_translation(
          output_df, rownum_start = rownum))

      # Add a `colnum` column that's required for arranging `tbl` in such a way
      # that the order of records moves from top-to-bottom, left-to-right
      tbl_data <-
        tbl_data %>%
        dplyr::mutate(colnum = colname_to_colnum(
          boxh_df = boxh_df, colname = colname)) %>%
        dplyr::mutate(colnum = ifelse(locname == "stub", 0, colnum))
    }

    # Re-combine `tbl_data` with `tbl`
    tbl <-
      dplyr::bind_rows(tbl_not_data, tbl_data)

  } else {
    tbl <-
      tbl %>%
      dplyr::mutate(colnum = NA_integer_)
  }

  # For the stub groups, insert a `rownum` based on groups_rows_df
  if ("stub_groups" %in% tbl[["locname"]]) {

    tbl_not_stub_groups <-
      tbl %>%
      dplyr::filter(locname != "stub_groups")

    tbl_stub_groups <-
      tbl %>%
      dplyr::filter(locname == "stub_groups") %>%
      dplyr::inner_join(
        groups_rows_df %>% dplyr::select(-group_label),
        by = c("grpname" = "group")) %>%
      dplyr::mutate(rownum = row - 0.1) %>%
      dplyr::select(-row, -row_end)

    # Re-combine `tbl_not_stub_groups`
    #   with `tbl_stub_groups`
    tbl <-
      dplyr::bind_rows(
        tbl_not_stub_groups, tbl_stub_groups)
  }

  # For the summary cells, insert a `rownum` based on groups_rows_df
  if ("summary_cells" %in% tbl[["locname"]]) {

    tbl_not_summary_cells <-
      tbl %>%
      dplyr::filter(locname != "summary_cells")

    tbl_summary_cells <-
      tbl %>%
      dplyr::filter(locname == "summary_cells") %>%
      dplyr::inner_join(
        groups_rows_df %>% dplyr::select(-group_label),
        by = c("grpname" = "group")) %>%
      dplyr::mutate(rownum = (rownum / 100) + row_end) %>%
      dplyr::select(-row, -row_end)

    # Re-combine `tbl_not_summary_cells`
    #   with `tbl_summary_cells`
    tbl <-
      dplyr::bind_rows(
        tbl_not_summary_cells, tbl_summary_cells)
  }

  if (!("colnum" %in% colnames(tbl))) {

    tbl <-
      tbl %>%
      dplyr::mutate(colnum = NA_integer_)
  }

  # Sort the table rows
  tbl <-
    tbl %>%
    dplyr::arrange(locnum, rownum, colnum)

  # Generate a lookup table with ID'd footnote
  # text elements (that are distinct)
  lookup_tbl <-
    tbl %>%
    dplyr::select(text) %>%
    dplyr::distinct() %>%
    tibble::rownames_to_column(var = "fs_id") %>%
    dplyr::mutate(fs_id = as.integer(fs_id))

  # Join the lookup table to `tbl`
  tbl <-
    tbl %>%
    dplyr::inner_join(lookup_tbl, by = "text")

  tbl
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
        dplyr::mutate(fs_id_coalesced = paste(fs_id, collapse = ",")) %>%
        dplyr::ungroup() %>%
        dplyr::select(grpname, fs_id_coalesced) %>%
        dplyr::distinct()

      for (i in seq(nrow(footnotes_boxhead_group_glyphs))) {

        column_indices <-
          which(boxh_df["group_label", ] == footnotes_boxhead_group_glyphs$grpname[i])

        text <- boxh_df["group_label", column_indices] %>% unlist() %>% unname() %>% unique()

        text <-
          paste0(
            text,
            footnote_glyph_to_html(
              footnotes_boxhead_group_glyphs$fs_id_coalesced[i]))

        boxh_df["group_label", column_indices] <- text
      }
    }

    if (nrow(footnotes_boxhead_column_tbl) > 0) {

      footnotes_boxhead_column_glyphs <-
        footnotes_boxhead_column_tbl %>%
        dplyr::group_by(colname) %>%
        dplyr::mutate(fs_id_coalesced = paste(fs_id, collapse = ",")) %>%
        dplyr::ungroup() %>%
        dplyr::select(colname, fs_id_coalesced) %>%
        dplyr::distinct()

      for (i in seq(nrow(footnotes_boxhead_column_glyphs))) {

        text <-
          boxh_df["column_label", footnotes_boxhead_column_glyphs$colname[i]]

        text <-
          paste0(
            text,
            footnote_glyph_to_html(
              footnotes_boxhead_column_glyphs$fs_id_coalesced[i]))

        boxh_df[
          "column_label", footnotes_boxhead_column_glyphs$colname[i]] <- text
      }
    }
  }

  boxh_df
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
      dplyr::mutate(fs_id_coalesced = paste(fs_id, collapse = ",")) %>%
      dplyr::ungroup() %>%
      dplyr::select(colname, rownum, fs_id_coalesced) %>%
      dplyr::distinct()

    for (i in seq(nrow(footnotes_data_glpyhs))) {

      text <-
        output_df[footnotes_data_glpyhs$rownum[i], footnotes_data_glpyhs$colname[i]]

      text <- paste0(text, footnote_glyph_to_html(footnotes_data_glpyhs$fs_id_coalesced[i]))

      output_df[
        footnotes_data_glpyhs$rownum[i], footnotes_data_glpyhs$colname[i]] <- text
    }
  }

  output_df
}

#' @importFrom dplyr filter group_by mutate ungroup select distinct
#' @importFrom htmltools htmlEscape
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
      dplyr::mutate(fs_id_coalesced = paste(fs_id, collapse = ",")) %>%
      dplyr::ungroup() %>%
      dplyr::select(grpname, fs_id_coalesced) %>%
      dplyr::distinct()

    for (i in seq(nrow(footnotes_stub_groups_glyphs))) {

      row_index <-
        which(groups_rows_df[, "group_label"] == footnotes_stub_groups_glyphs$grpname[i])

      text <- htmltools::htmlEscape(groups_rows_df[row_index, "group_label"])

      text <-
        paste0(
          text,
          footnote_glyph_to_html(
            footnotes_stub_groups_glyphs$fs_id_coalesced[i]))

      groups_rows_df[row_index, "group_label"] <- text
    }
  }

  groups_rows_df
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
    dplyr::mutate(fs_id_coalesced = paste(fs_id, collapse = ",")) %>%
    dplyr::ungroup() %>%
    dplyr::select(grpname, colname, row, fs_id_coalesced) %>%
    dplyr::distinct()

  for (i in seq(nrow(footnotes_data_glpyhs))) {

    text <-
      summary_df_list[[footnotes_data_glpyhs[i, ][["grpname"]]]][[
        footnotes_data_glpyhs$row[i], footnotes_data_glpyhs$colname[i]]]

    text <-
      paste0(text, footnote_glyph_to_html(footnotes_data_glpyhs$fs_id_coalesced[i]))

    summary_df_list[[footnotes_data_glpyhs[i, ][["grpname"]]]][[
      footnotes_data_glpyhs$row[i], footnotes_data_glpyhs$colname[i]]] <- text
  }

  list_of_summaries$summary_df_display_list <- summary_df_list

  list_of_summaries
}
