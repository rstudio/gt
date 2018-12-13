# Utility function to generate column numbers from column names;
# used in: `resolve_footnotes_styles()`
colname_to_colnum <- function(boxh_df,
                              colname) {

  cnames <- c()
  for (col in colname) {
    if (is.na(col)) {
      cnames <- c(cnames, NA_integer_)
    } else {
      cnames <- c(cnames, which(colnames(boxh_df) == col))
    }
  }

  cnames
}

# Utility function to generate finalized row numbers;
# used in: `resolve_footnotes_styles()`
rownum_translation <- function(output_df,
                               rownum_start) {

  rownum_final <- c()
  for (rownum_s in rownum_start) {
    rownum_final <-
      c(rownum_final,
        which(as.numeric(rownames(output_df)) == rownum_s))
  }

  rownum_final
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
  for (fmt in formats)  {

    # Determine if the formatter has a function relevant
    # to the context; if not, use the `default` function
    # (which should always be present)
    if (context %in% names(fmt$func)) {
      eval_func <- context
    } else {
      eval_func <- "default"
    }

    for (col in fmt[["cols"]]) {

      # Perform rendering but only do so if the column is present
      if (col %in% colnames(data_df)) {

        output_df[[col]][fmt$rows] <-
          fmt$func[[eval_func]](data_df[[col]][fmt$rows])
      }
    }
  }

  output_df
}

# Move input data cells to `output_df` that didn't have any rendering applied
# during the `render_formats()` call
migrate_unformatted_to_output <- function(data_df,
                                          output_df,
                                          context) {

  for (colname in colnames(output_df)) {

    row_index <- is.na(output_df[[colname]])

    if (inherits(data_df[[colname]], "list")) {

      # Use `lapply()` so that all values could be treated independently
      output_df[[colname]][row_index] <-
        lapply(
          data_df[[colname]][row_index],
          function(x) {
            x %>%
              format(
                drop0trailing = FALSE,
                trim = TRUE,
                justify = "none") %>%
              tidy_gsub("\\s+$", "") %>%
              process_text(context) %>%
              paste(collapse = ", ")
          }
        )

    } else {

      # No `lapply()` used: all values will be treated cohesively
      output_df[[colname]][row_index] <-
        format(
          data_df[[colname]][row_index],
          drop0trailing = FALSE,
          trim = TRUE,
          justify = "none"
        ) %>%
        process_text(context)
    }
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

# Function to get a vector of columns group (spanner) names
get_columns_spanners_vec <- function(boxh_df) {

  columns_spanners <-
    boxh_df["group_label", ] %>% unlist() %>% unname()

  columns_spanners[which(!is.na(columns_spanners))]
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

    if (!is.na(ordering[i])) {
      rows_matched <- which(groups_df[, "groupname"] == ordering[i])
    } else {
      rows_matched <- which(is.na(groups_df[, "groupname"]))
    }

    groups_rows_df[i, "group"] <- groups_rows_df[i, "group_label"] <- ordering[i]
    groups_rows_df[i, "row"] <- min(rows_matched)
    groups_rows_df[i, "row_end"] <- max(rows_matched)
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
#' @importFrom dplyr summarize_all ungroup mutate_at slice
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
    agg_funs <- summary_attrs$fns %>% lapply(rlang::as_function)

    # Get the names if any were provided
    labels <- names(summary_attrs$fns) %>% process_text()

    # If names weren't provided at all, handle this case by
    # creating a vector of NAs that will be replaced later with
    # derived names
    if (length(labels) < 1) {
      labels <- rep(NA_character_, length(summary_attrs$fns))
    }

    # If one or more names not provided then replace the empty
    # string with NA
    labels[labels == ""] <- NA_character_

    # Get the labels for each of the function calls
    derived_labels <-
      summary_attrs$fns %>%
      lapply(derive_summary_label) %>%
      unlist() %>%
      unname() %>%
      make.names(unique = TRUE)

    # Replace missing labels with derived labels
    labels[is.na(labels)] <- derived_labels[is.na(labels)]

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
        dplyr::filter(groupname == !!group_sym)

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
        match(arrangement, summary_df_display_list[[i]]$rowname), ] %>%
      replace(is.na(.), summary_attrs$missing_text)
  }

  list(
    summary_df_data_list = summary_df_data_list,
    summary_df_display_list = summary_df_display_list)
}

migrate_labels <- function(row_val) {
  function(
    boxh_df,
    labels,
    context) {

    for (label_name in names(labels)) {

      if (label_name %in% colnames(boxh_df)) {
        boxh_df[row_val, label_name] <-
          process_text(labels[[label_name]], context)
      }
    }

    boxh_df
  }
}

# Process text of finalized column labels and migrate the
# processed text to `boxh_df`
migrate_colnames_to_labels <- migrate_labels("column_label")

# Process text of finalized column group labels and migrate the
# processed text to `boxh_df`
migrate_grpnames_to_labels <- migrate_labels("group_label")



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

  if (!all(is.na((stub_df)[["rowname"]]))) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

# Function to determine if a title element has been defined
is_title_defined <- function(heading) {

  length(heading) > 0 && !is.null(heading$title)
}

# Function to determine if a subtitle element has been defined
is_subtitle_defined <- function(heading) {

  length(heading) > 0 && !is.null(heading$subtitle) && heading$subtitle != ""
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

# Process the `heading` object
process_heading <- function(heading, context) {

  if (!is.null(heading)) {
    title <- heading$title %>% process_text(context)
    subtitle <- heading$subtitle %>% process_text(context)

    return(list(title = title, subtitle = subtitle))
  }
}

# Process the `stubhead_caption` object
process_stubhead_label <- function(caption, context) {

  if (!is.null(caption)) {
    stubhead_label <- caption$stubhead_label %>% process_text(context)

    return(list(stubhead_label = stubhead_label))
  }
}

# Process the `source_note` object
process_source_notes <- function(source_note, context) {

  if (!is.null(source_note)) {

    source_notes <- c()
    for (sn in source_note) {

      source_notes <- c(source_notes, process_text(sn, context))
    }

    return(list(source_note = source_notes))
  }
}

# Function to build a vector of `group` rows in the table field
create_group_rows <- function(n_rows,
                              groups_rows_df,
                              context = "latex") {

  lapply(seq(n_rows), function(x) {

    if (!(x %in% groups_rows_df$row)) {
      return("")
    }

    if (context == "latex") {

      latex_group_row(
        group_name = groups_rows_df[
          which(groups_rows_df$row %in% x), "group_label"][[1]],
        top_border = x != 1, bottom_border = x != n_rows)
    }
  }) %>%
    unlist() %>%
    unname()
}

# Function to build a vector of `data` rows in the table field
create_data_rows <- function(n_rows,
                             row_splits,
                             context = "latex") {

  lapply(seq(n_rows), function(x) {

    if (context == "latex") {

      latex_body_row(content = row_splits[[x]], type = "row")
    }

  }) %>%
    unlist() %>%
    unname()
}

# Function to build a vector of `summary` rows in the table field
create_summary_rows <- function(n_rows,
                                n_cols,
                                list_of_summaries,
                                groups_rows_df,
                                stub_available,
                                summaries_present,
                                context = "latex") {

  lapply(seq(n_rows), function(x) {

    if (!stub_available ||
        !summaries_present ||
        !(x %in% groups_rows_df$row_end)) {
      return("")
    }

    group <-
      groups_rows_df %>%
      dplyr::filter(row_end == x) %>%
      dplyr::pull(group)

    if (!(group %in% names(list_of_summaries$summary_df_display_list))) {
      return("")
    }

    summary_df <-
      list_of_summaries$summary_df_display_list[[group]] %>%
      as.data.frame(stringsAsFactors = FALSE)

    body_content_summary <-
      as.vector(t(summary_df))

    if (context == "latex") {
      body_content_summary <- body_content_summary %>%
        tidy_gsub("\u2014", "---")
    }

    row_splits_summary <-
      split_body_content(
        body_content = body_content_summary,
        n_cols = n_cols)

    if (length(row_splits_summary) > 0) {

      if (context == "latex") {

        top_line <- "\\midrule \n"

        s_rows <-
          paste(
            vapply(
              row_splits_summary, latex_body_row, character(1), type = "row"),
            collapse = "")

        s_rows <- paste0(top_line, s_rows)
      }

    } else {
      s_rows <- ""
    }
  }) %>%
    unlist() %>%
    unname()
}
