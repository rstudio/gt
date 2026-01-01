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


.dt_summary_key <- "_summary"

.dt_summary_build_key <- paste0(.dt_summary_key, "_build")

dt_summary_get <- function(data) {
  dt__get(data, .dt_summary_key)
}

dt_summary_df_get <- function(data) {
  dt__get(data, .dt_summary_build_key)
}

dt_summary_df_data_get <- function(data) {

  dt_has_built_assert(data = data)

  dt <- dt_summary_df_get(data)

  as.list(dt["summary_df_data_list"])
}

dt_summary_df_display_get <- function(data) {

  dt_has_built_assert(data = data)

  dt <- dt_summary_df_get(data)

  as.list(dt["summary_df_display_list"])
}

dt_summary_set <- function(data, summary) {
  dt__set(data, .dt_summary_key, summary)
}

dt_summary_data_set <- function(data, summary) {
  dt__set(data, .dt_summary_build_key, summary)
}

dt_summary_init <- function(data) {
  dt_summary_set(data = data, summary = list())
}

dt_summary_add <- function(data, summary) {

  summary_list <- dt_summary_get(data = data)
  summary_list <- append(summary_list, list(summary))

  dt_summary_set(data = data, summary = summary_list)
}

dt_summary_exists <- function(data) {
  length(dt_summary_get(data = data)) > 0
}

dt_summary_build <- function(data, context) {

  summary_list <- dt_summary_get(data = data)
  body <- dt_body_get(data = data)
  data_tbl <- dt_data_get(data = data)
  stub_df <- dt_stub_df_get(data = data)

  # If the `summary_list` object is an empty list,
  # return an empty list as the `list_of_summaries`
  if (length(summary_list) == 0) {
    return(dt_summary_data_set(data = data, list()))
  }

  # Create empty lists that are to contain summary
  # data frames for display and for data collection
  # purposes
  summary_df_display_list <- list()
  summary_df_data_list <- list()

  for (i in seq_along(summary_list)) {

    summary_attrs <- summary_list[[i]]

    groups <- summary_attrs$groups
    columns <- summary_attrs$columns
    fns <- summary_attrs$fns
    fmt_exprs <- summary_attrs$fmt
    missing_text <- summary_attrs$missing_text
    side <- summary_attrs$side

    # Resolve the `missing_text`
    missing_text <-
      context_missing_text(missing_text = missing_text, context = context)

    assert_rowgroups <- function() {

      if (all(is.na(stub_df$group_id))) {

        cli::cli_abort(c(
          "There are no row groups in the gt object.",
          "*" = "Use {.fn grand_summary_rows} to create a grand summary, or",
          "*" = "Define row groups using `gt(groupname_col = ...)` or {.fn tab_row_group}."
        ))
      }
    }

    # Resolve the groups to consider; if
    # `groups` is TRUE then we are to obtain
    # summary row data for all groups
    if (isTRUE(groups)) {

      assert_rowgroups()

      groups <- unique(stub_df$group_id)

    } else if (is_string(groups, ":GRAND_SUMMARY:")) {

      # If groups is given as ":GRAND_SUMMARY:" then use a
      # special group (`::GRAND_SUMMARY`)
      groups <- grand_summary_col

    } else if (is.character(groups)) {

      assert_rowgroups()

      # Get the names of row groups available in the gt object
      groups_available <- unique(stub_df$group_id)

      if (!all(groups %in% groups_available)) {

        not_present_groups <-
          base::setdiff(groups, groups_available)

        # Stop function if one or more `groups`
        # are not present in the gt table
        cli::cli_abort(c(
          "All `groups` should be available in the gt object.",
          "*" = "The following groups are absent: {not_present_groups}."
        ))
      }
    }

    # Resolve the columns to exclude
    columns_excl <-
      base::setdiff(
        base::setdiff(
          colnames(body),
          c("groupname", rowname_col_private)
        ),
        columns
      )

    # Combine `groupname` with the table body data in order to
    # process data by groups
    if (identical(groups, grand_summary_col)) {

      select_data_tbl <-
        dplyr::mutate(data_tbl, !!group_id_col_private := .env$grand_summary_col, .before = 0)

    } else {

      select_data_tbl <-
        dplyr::bind_cols(
          dplyr::select(stub_df, !!group_id_col_private := group_id),
          data_tbl[stub_df$rownum_i, ]
        )
    }

    # Get the labels for each of the `fns`
    labels <-
      lapply(
        fns,
        FUN = function(x) {
          x[["label"]]
        }
      )

    summary_dfs_data <-
      dplyr::bind_rows(
        lapply(
          seq_along(fns),
          FUN = function(j) {

            group_label <- labels[j]
            id_value <- names(labels[j])
            fn_formula <- fns[[j]]$fn

            if (length(groups) == 1 && groups == "::GRAND_SUMMARY") {

              NULL

            } else {

              # Filter to only the groups targeted in the group-wise case
              select_data_tbl <-
                vctrs::vec_slice(
                  select_data_tbl,
                  select_data_tbl[[group_id_col_private]] %in% groups
                )
            }

            # Group by the `::group_id::` column
            select_data_tbl <-
              dplyr::group_by(
                select_data_tbl,
                .data[[group_id_col_private]]
              )

            # TODO find a way to switch to across()
            # https://github.com/tidyverse/dplyr/issues/6707
            select_data_tbl <-
              dplyr::ungroup(
                dplyr::summarize_at(
                  select_data_tbl,
                  columns,
                  .funs = fn_formula
                )
              )

            # Replace NaN by NA
            select_data_tbl[is.na(select_data_tbl)] <- NA

            select_data_tbl <-
              dplyr::mutate(
                select_data_tbl,
                !!rowname_col_private := as.character(group_label),
                !!row_id_col_private := as.character(id_value)
              )

            select_data_tbl <-
              dplyr::relocate(
                select_data_tbl,
                dplyr::all_of(c(
                  group_id_col_private,
                  row_id_col_private,
                  rowname_col_private
                ))
              )

            select_data_tbl
          }
        )
      )

    # Add those columns that were not part of
    # the aggregation, filling those with NA values
    summary_dfs_data[, c(
      columns_excl, base::setdiff(columns, colnames(summary_dfs_data))
    )] <- NA_real_

    summary_dfs_data <-
      summary_dfs_data[c(
        group_id_col_private,
        row_id_col_private,
        rowname_col_private,
        colnames(body)
      )]

    #
    # Format with formatting formulae
    #

    summary_dfs_display_gt <-
      gt(
        dplyr::select(summary_dfs_data, -dplyr::all_of(rowname_col_private)),
        rowname_col = "::row_id::",
        locale = resolve_locale(data = data, locale = NULL)
      )

    # Replace NaN with NA
    summary_dfs_display_gt[["_data"]][is.na(summary_dfs_display_gt[["_data"]])] <-
      NA

    summary_dfs_display_gt[["_stub_df"]]$row_id <-
      gsub("__[0-9]*", "", summary_dfs_display_gt[["_stub_df"]]$row_id)

    for (k in seq_along(fmt_exprs)) {

      # Obtain the LHS fo the formatting expression; this would either
      # contain a group directive or nothing (returned as NULL)
      format_lhs <- rlang::f_lhs(fmt_exprs[[k]])

      # Determine if we are actually formatting a grand summary section;
      # in that case we'd want to ignore any supplied group directive
      group_is_grand_summary <-
        identical(groups, "::GRAND_SUMMARY")

      if (!is.null(format_lhs) && !group_is_grand_summary) {

        # Perform group-wise formatting based on groups resolved in the
        # supplied group directive

        # Resolve the group names
        groups_directive <-
          resolve_groups(
            expr = !!format_lhs,
            vector = groups
          )

        if (!is.null(rlang::f_lhs(fmt_exprs[[k]]))) {
          rlang::f_lhs(fmt_exprs[[k]]) <- NULL
        }

        if (length(groups_directive) > 0) {

          for (group in groups_directive) {

            # For each resolved group, the RHS formula expression needs to be
            # altered to contain a `rows` argument that maps the rows to be
            # formatted to the group

            fmt_expr_lines <- deparse(rlang::f_rhs(fmt_exprs[[k]]))
            fmt_expr_lines <- trimws(fmt_expr_lines, "left", " ")
            format_fn_grp <- paste(fmt_expr_lines, collapse = "")

            fmt_expr_names <- names(rlang::f_rhs(fmt_exprs[[k]]))
            fmt_expr_values <- as.character(rlang::f_rhs(fmt_exprs[[k]]))

            fmt_expr_components <- fmt_expr_values
            names(fmt_expr_components) <- fmt_expr_names
            fmt_expr_components <- fmt_expr_components[nzchar(fmt_expr_names)]

            if ("rows" %in% names(fmt_expr_components)) {

              rows_val <- unname(fmt_expr_components[names(fmt_expr_components) == "rows"])

              if (!grepl("\"", rows_val, fixed = TRUE)) {
                rows_val <- paste0("\"", rows_val, "\"")
              }

              rows_val_replace <- paste0("`::row_id::` %in% ", rows_val)

              format_fn_rows_val_replace <-
                paste0(
                  rows_val_replace,
                  " & ",
                  paste0("`::group_id::` == \"", group, "\"")
                )

              format_fn_grp <- gsub(rows_val, format_fn_rows_val_replace, format_fn_grp, fixed = TRUE)

            } else {

              format_fn_grp <- gsub(")$", paste0(", rows = `::group_id::` == \"", group, "\")"), format_fn_grp)
            }

            # Ensure that the expression is reconstructed as a formula and then
            # transformed to a closure
            format_fn_grp <- rlang::as_closure(stats::as.formula(paste0("~", format_fn_grp)))

            # Perform the formatting on this gt table with closure
            summary_dfs_display_gt <- format_fn_grp(summary_dfs_display_gt)
          }
        }

      } else {

        # Perform group-wise formatting across all groups

        # Ensure that LHS is forced as NULL (only important in the case
        # that a group directive was supplied and the formatting is for
        # a grand summary)
        if (!is.null(rlang::f_lhs(fmt_exprs[[k]]))) {
          rlang::f_lhs(fmt_exprs[[k]]) <- NULL
        }

        # Ensure that the expression (a RHS formula) is made a closure
        format_fn <- rlang::as_closure(fmt_exprs[[k]])

        # Perform the formatting on this gt table with closure
        summary_dfs_display_gt <- format_fn(summary_dfs_display_gt)
      }
    }

    summary_dfs_display <-
      dt_body_get(data = build_data(summary_dfs_display_gt, context = context))

    summary_dfs_display[["::group_id::"]] <- summary_dfs_data[["::group_id::"]]
    summary_dfs_display[["::row_id::"]] <- summary_dfs_data[["::row_id::"]]

    summary_dfs_display[summary_dfs_display == "NA"] <- NA

    summary_dfs_display$`::rowname::` <- NA_character_

    labels_processed <- unlist(lapply(labels, FUN = process_text, context = context))

    for (i in seq_len(nrow(summary_dfs_display))) {
      summary_dfs_display[i, ][[rowname_col_private]] <-
        unname(labels_processed[names(labels_processed) == summary_dfs_display[i, ][["::row_id::"]]])
    }

    # set columns that we exclude as NA
    summary_dfs_display[, columns_excl] <- NA_character_

    for (group in groups) {

      # vctrs::vec_slice is a fast replacement of dplyr::filter
      # but handles is.na() a little bit less fast.
      group_summary_data_df <-
        vctrs::vec_slice(
          summary_dfs_data,
          !is.na(summary_dfs_data[[group_id_col_private]]) &
            summary_dfs_data[[group_id_col_private]] == group
          )

      group_summary_display_df <-
        vctrs::vec_slice(
          summary_dfs_display,
          !is.na(summary_dfs_display[[group_id_col_private]]) &
            summary_dfs_display[[group_id_col_private]] == group
        )

      group_summary_display_df$`::side::` <- side

      summary_df_data_list <-
        c(
          summary_df_data_list,
          stats::setNames(list(group_summary_data_df), group)
        )

      summary_df_display_list_i <-
        stats::setNames(list(group_summary_display_df), group)

      summary_df_display_list <-
        c(summary_df_display_list, summary_df_display_list_i)
    }
  }

  # Condense data in `summary_df_display_list` in a groupwise manner
  summary_df_display_list <-
    tapply(
      summary_df_display_list,
      names(summary_df_display_list),
      dplyr::bind_rows
    )

  for (i in seq_along(summary_df_display_list)) {
    arrangement <-
      unique(summary_df_display_list[[i]][, rowname_col_private, drop = TRUE])

    # remove ::group_id:: from data
    summary_df_display_list[[i]][[group_id_col_private]] <- NULL
    # find location of last_no_na for each row name
    summary_df_display_list[[i]] <-
      dplyr::summarise(
        .data = summary_df_display_list[[i]],
        dplyr::across(
          dplyr::everything(),
          .fns = last_non_na
          ),
        .by = dplyr::all_of(rowname_col_private)
      )

    temp_df <- summary_df_display_list[[i]][
      match(arrangement, summary_df_display_list[[i]][[rowname_col_private]]), ]

    summary_df_display_list[[i]] <- replace(temp_df, is.na(temp_df), missing_text)
  }

  # Return a list of lists, each of which have summary data frames for
  # display and for data collection purposes
  list_of_summaries <-
    list(
      summary_df_data_list = summary_df_data_list,
      summary_df_display_list = summary_df_display_list
    )

  dt_summary_data_set(data = data, summary = list_of_summaries)
}

grand_summary_col <- "::GRAND_SUMMARY"
rowname_col_private <- "::rowname::"
side_col_private <- "::side::"
row_id_col_private <- "::row_id::"
group_id_col_private <- "::group_id::"
