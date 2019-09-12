
grand_summary_col <- "::GRAND_SUMMARY"

# Define the contexts
all_contexts <- c("html", "latex", "rtf", "default")

validate_contexts <- function(contexts) {

  if (!all(contexts %in% all_contexts)) {

    invalid_contexts <- base::setdiff(contexts, all_contexts)

    stop("All output contexts must be in the set of supported contexts\n",
         " * Supported: ", paste0(all_contexts, collapse = ", "), "\n",
         " * Invalid: ", paste0(invalid_contexts, collapse = ", "),
         call. = FALSE)
  }
}

# Utility function to generate column numbers from column names;
# used in: `resolve_footnotes_styles()`
colname_to_colnum <- function(data,
                              colname) {

  col_nums <- c()

  for (col in colname) {
    if (is.na(col)) {
      col_nums <- c(col_nums, NA_integer_)
    } else {
      col_nums <- c(col_nums, which(dt_boxhead_get_vars_default(data = data) == col))
    }
  }

  col_nums
}

# Utility function to generate finalized row numbers;
# used in: `resolve_footnotes_styles()`
rownum_translation <- function(body,
                               rownum_start) {

  rownum_final <- c()
  for (rownum_s in rownum_start) {
    rownum_final <-
      c(rownum_final,
        which(as.numeric(rownames(body)) == rownum_s))
  }

  rownum_final
}

#' Render any formatting directives available in the `formats` list
#'
#' @noRd
render_formats <- function(data,
                           context) {

  body <- dt_body_get(data = data)
  data_tbl <- dt_data_get(data = data)
  formats <- dt_formats_get(data = data)

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
      if (col %in% colnames(data_tbl)) {

        result <- fmt$func[[eval_func]](data_tbl[[col]][fmt$rows])

        # If any of the resulting output is `NA`, that
        # means we want to NOT make changes to those
        # particular cells' output (i.e. inherit the
        # results of the previous formatter).
        body[[col]][fmt$rows][!is.na(result)] <- stats::na.omit(result)
      }
    }
  }

  data <- dt_body_set(data = data, body = body)

  data
}

# Move input data cells to `body` that didn't have any rendering applied
# during the `render_formats()` call
migrate_unformatted_to_output <- function(data,
                                          context) {

  body <- dt_body_get(data = data)
  data_tbl <- dt_data_get(data = data)

  for (colname in colnames(body)) {

    row_index <- is.na(body[[colname]])

    if (inherits(data_tbl[[colname]], "list")) {

      # Use `lapply()` so that all values could be treated independently
      body[[colname]][row_index] <-
        lapply(
          data_tbl[[colname]][row_index],
          function(x) {
            x %>%
              format(
                drop0trailing = FALSE,
                trim = TRUE,
                justify = "none"
              ) %>%
              tidy_gsub("\\s+$", "") %>%
              process_text(context) %>%
              paste(collapse = ", ")
          }
        )

    } else {

      # No `lapply()` used: all values will be treated cohesively
      body[[colname]][row_index] <-
        format(
          data_tbl[[colname]][row_index],
          drop0trailing = FALSE,
          trim = TRUE,
          justify = "none"
        ) %>%
        process_text(context)
    }
  }

  data <- dt_body_set(data = data, body = body)

  data
}

#' Perform any text transformations
#'
#' @noRd
perform_text_transforms <- function(data) {

  transforms <- dt_transforms_get(data = data)

  for (transform in transforms) {

    data <-
      text_transform_at_location(
        loc = transform$resolved,
        data = data,
        fn = transform$fn
      )
  }

  data
}

#' Obtain a reordering df for the data rows
#'
#' @noRd
get_row_reorder_df <- function(groups,
                               stub_df) {

  # If there are no group, there there is no reordering
  # so just return a data frame where the starting row
  # indices match the final row indices
  if (length(groups) == 0) {

    indices <- seq_len(nrow(stub_df))

    return(
      dplyr::tibble(
        rownum_start = indices,
        rownum_final = indices
      )
    )
  }

  indices <-
    lapply(stub_df$groupname, `%in%`, x = groups) %>%
    lapply(which) %>%
    unlist() %>%
    order()

  dplyr::tibble(
    rownum_start = seq_along(indices),
    rownum_final = indices
  )
}

#' Obtain a reordering df for the table columns
#'
#' @noRd
get_column_reorder_df <- function(data) {

  data_tbl <- dt_data_get(data = data)
  column_names <- dt_boxhead_get_vars(data = data)

  cols_df <- dplyr::tibble(colnames_start = colnames(data_tbl))

  colnames_final_tbl <-
    dplyr::tibble(colnames_final = column_names) %>%
    dplyr::mutate(colnum_final = seq(column_names))

  cols_df %>%
    dplyr::mutate(colnum_start = seq(nrow(cols_df))) %>%
    dplyr::full_join(
      colnames_final_tbl, by = c("colnames_start" = "colnames_final")
    ) %>%
    dplyr::rename(column_names = colnames_start)
}

# Function to recode the `rownum` value in the footnotes table
reorder_footnotes <- function(data) {

  stub_df <- dt_stub_df_get(data = data)
  footnotes_tbl <- dt_footnotes_get(data = data)

  rownum_final <- stub_df$rownum_i %>% as.numeric()

  for (i in seq_len(nrow(footnotes_tbl))) {

    if (!is.na(footnotes_tbl[i, ][["rownum"]]) &&
        footnotes_tbl[i, ][["locname"]] %in% c("data", "stub")) {

      footnotes_tbl[i, ][["rownum"]] <-
        which(rownum_final == footnotes_tbl[i, ][["rownum"]])
    }
  }

  dt_footnotes_set(data = data, footnotes = footnotes_tbl)
}

# Function to recode the `rownum` value in the styles table
reorder_styles <- function(data) {

  stub_df <- dt_stub_df_get(data = data)
  styles_tbl <- dt_styles_get(data = data)

  rownum_final <-
    stub_df %>%
    dplyr::pull(rownum_i) %>%
    as.numeric()

  for (i in seq_len(nrow(styles_tbl))) {
    if (!is.na(styles_tbl[i, ][["rownum"]])) {

      styles_tbl[i, ][["rownum"]] <-
        which(rownum_final == styles_tbl[i, ][["rownum"]])
    }
  }

  data <- dt_styles_set(data = data, styles = styles_tbl)

  data
}

#' Create a data frame with row group information
#'
#' @noRd
get_groups_rows_df <- function(data,
                               context) {

  stub_df <- dt_stub_df_get(data = data)
  ordering <- dt_stub_groups_get(data = data)

  others_group <- dt_stub_others_get(data = data)

  groups_rows_df <-
    data.frame(
      group = rep(NA_character_, length(ordering)),
      group_label = rep(NA_character_, length(ordering)),
      row = rep(NA_integer_, length(ordering)),
      row_end = rep(NA_integer_, length(ordering)),
      stringsAsFactors = FALSE
    )

  for (i in seq(ordering)) {

    if (!is.na(ordering[i])) {
      rows_matched <- which(stub_df$groupname == ordering[i])
    } else {
      rows_matched <- which(is.na(stub_df$groupname))
    }

    groups_rows_df[i, "group"] <- ordering[i]
    groups_rows_df[i, "group_label"] <- ordering[i]

    groups_rows_df[i, "row"] <- min(rows_matched)
    groups_rows_df[i, "row_end"] <- max(rows_matched)
  }

  groups_rows_df <-
    groups_rows_df %>%
    dplyr::mutate(group_label = process_text(group_label, context))

  if (nrow(groups_rows_df) > 0) {

    others_group <- dt_stub_others_get(data = data) %||% NA_character_

    groups_rows_df[
      is.na(groups_rows_df[, "group"]),
      c("group", "group_label")] <- others_group
  }

  attr(data, "groups_rows_df") <- groups_rows_df

  data
}

#' Perform merging of column contents
#'
#' This merges column content together with a pattern and possibly with a `type`
#' that specifies additional operations
#'
#' @noRd
perform_col_merge <- function(data,
                              context) {

  col_merge <- dt_col_merge_get(data = data)
  body <- dt_body_get(data = data)

  if (length(col_merge) == 0) {
    return(data)
  }

  for (i in seq(col_merge)) {

    type <- col_merge[[i]]$type

    if (type == "merge") {

      mutated_column <- col_merge[[i]]$vars[1]
      mutated_column_sym <- sym(mutated_column)

      columns <- col_merge[[i]]$vars
      pattern <- col_merge[[i]]$pattern

      # Convert any index positions in the pattern
      # to the column names specified
      for (j in seq(columns)) {

        pattern <-
          tidy_gsub(
            x = pattern,
            pattern = paste0("\\{", j, "\\}"),
            replacement = paste0("{", columns[j], "}")
          )
      }

      body <-
        body %>%
        dplyr::mutate(
          !!mutated_column_sym := glue::glue(pattern) %>% as.character()
        )
    }

    if (type == "merge_range") {

      mutated_column <- col_merge[[i]]$vars[1]
      mutated_column_sym <- sym(mutated_column)

      second_column <- col_merge[[i]]$vars[2]
      second_column_sym <- sym(second_column)

      columns <- col_merge[[i]]$vars

      sep <- col_merge[[i]]$sep %>% context_dash_mark(context = context)

      pattern <-
        col_merge[[i]]$pattern %>%
        tidy_gsub("{sep}", sep, fixed = TRUE)

      # Convert any index positions in the pattern
      # to the column names specified
      for (j in seq(columns)) {

        pattern <-
          tidy_gsub(
            x = pattern,
            pattern = paste0("\\{", j, "\\}"),
            replacement = paste0("{", columns[j], "}")
          )
      }

      data_tbl <- dt_data_get(data = data)

      na_1_rows <- which(is.na(data_tbl %>% dplyr::pull(!!mutated_column_sym)))
      na_2_rows <- which(is.na(data_tbl %>% dplyr::pull(!!second_column_sym)))

      no_na_rows <-
        seq_along(body %>% dplyr::pull(!!mutated_column_sym)) %>%
        base::setdiff(na_1_rows) %>%
        base::setdiff(na_2_rows)

      body <-
        body %>%
        dplyr::mutate(
          !!mutated_column_sym := dplyr::case_when(
            dplyr::row_number() %in% no_na_rows ~ glue::glue(pattern) %>% as.character(),
            TRUE ~ !!mutated_column_sym
          )
        )
    }
  }

  data <- dt_body_set(data = data, body = body)

  data
}

# Function to get a vector of the stub components that are available
# within the `stub_df` data frame
get_stub_components <- function(data) {

  stub_df <- dt_stub_df_get(data = data)

  stub_components <- c()

  if (any(!is.na(stub_df[["rowname"]]))) {
    stub_components <- c(stub_components, "rowname")
  }

  if (any(!is.na(stub_df[["groupname"]]))) {
    stub_components <- c(stub_components, "groupname")
  }

  attr(data, "stub_components") <- stub_components

  data
}

get_column_alignment <- function(data) {

  column_alignment <-
    dt_boxhead_get(data = data) %>%
    dplyr::filter(type == "default") %>%
    dplyr::pull(column_align)

  stub_components <- attr(data, "stub_components", exact = TRUE)

  if (stub_component_is_rowname(stub_components = stub_components) ||
      stub_component_is_rowname_groupname(stub_components = stub_components)) {

    column_alignment <- c("left", column_alignment)
  }

  attr(data, "column_alignment") <- column_alignment

  data
}

combine_stub_with_data <- function(data) {

  body <- dt_body_get(data = data)
  stub_df <- dt_stub_df_get(data = data)

  stub_components <- attr(data, "stub_components", exact = TRUE)

  if (stub_component_is_rowname(stub_components = stub_components) ||
      stub_component_is_rowname_groupname(stub_components = stub_components)) {

    rownames <- stub_df %>% dplyr::select(rowname)

    # Combine reordered stub with output table
    body <- dplyr::bind_cols(rownames, body)
  }

  data <- dt_body_set(data = data, body = body)

  data
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

# Function to build a vector of `group` rows in the table body
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

# Function to build a vector of `data` rows in the table body
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

# Function to build a vector of `summary` rows in the table body
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

#' Suitably replace `NA` values in the `groups_df` data frame
#'
#' @param groups_df The `groups_df` data frame.
#' @param others_group The `others_group` vector.
#' @noRd
replace_na_groups_df <- function(groups_df,
                                 others_group) {

  if (nrow(groups_df) > 0) {
    groups_df[is.na(groups_df[, "groupname"]), "groupname"] <- others_group
  }

  groups_df
}

#' Suitably replace `NA` values in the `groups_rows_df` data frame
#'
#' @param groups_rows_df The `groups_rows_df` data frame.
#' @param others_group The `others_group` vector.
#' @noRd
replace_na_groups_rows_df <- function(groups_rows_df,
                                      others_group) {

  if (nrow(groups_rows_df) > 0) {
    groups_rows_df[
      is.na(groups_rows_df[, "group"]),
      c("group", "group_label")] <- others_group
  }

  groups_rows_df
}

last_non_na <- function(vect) {

  # Retrieve last non-NA value
  positions <- which(!is.na(vect))

  if (length(positions) == 0) {
    return(NA_character_)
  } else {
    return(vect[max(positions)])
  }
}
