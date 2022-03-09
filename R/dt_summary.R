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

  dt_summary_set(summary = list(), data = data)
}

dt_summary_add <- function(data, summary) {

  data %>%
    dt_summary_get() %>%
    append(list(summary)) %>%
    dt_summary_set(summary = ., data = data)
}

dt_summary_exists <- function(data) {

  length(dt_summary_get(data = data)) > 0
}

dt_summary_build <- function(data,
                             context) {

  # TODO: is `dt_body_get()` necessary here? `dt_boxh_vars_default()` could be used
  summary_list <- dt_summary_get(data = data)
  body <- dt_body_get(data = data)
  data_tbl <- dt_data_get(data = data)
  stub_df <- dt_stub_df_get(data = data)
  boxh_df <- dt_boxhead_get(data = data)

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

  for (i in seq(summary_list)) {

    summary_attrs <- summary_list[[i]]

    groups <- summary_attrs$groups
    columns <- summary_attrs$columns
    fns <- summary_attrs$fns
    missing_text <- summary_attrs$missing_text
    formatter <- summary_attrs$formatter
    formatter_options <- summary_attrs$formatter_options
    labels <- summary_attrs$summary_labels

    if (length(labels) != length(unique(labels))) {

      stop(
        "All summary labels must be unique:\n",
        " * Review the names provided in `fns`\n",
        " * These labels are in conflict: ",
        paste0(labels, collapse = ", "), ".",
        call. = FALSE
      )
    }

    # Resolve the `missing_text`
    missing_text <-
      context_missing_text(missing_text = missing_text, context = context)

    assert_rowgroups <- function() {

      if (all(is.na(stub_df$group_id))) {

        stop(
          "There are no row groups in the gt object:\n",
          " * Use `groups = NULL` to create a grand summary\n",
          " * Define row groups using `gt()` or `tab_row_group()`",
          call. = FALSE
        )
      }
    }

    # Resolve the groups to consider; if
    # `groups` is TRUE then we are to obtain
    # summary row data for all groups
    if (isTRUE(groups)) {

      assert_rowgroups()

      groups <- unique(stub_df$group_id)

    } else if (!is.null(groups) && is.character(groups)) {

      assert_rowgroups()

      # Get the names of row groups available
      # in the gt object
      groups_available <- unique(stub_df$group_id)

      if (any(!(groups %in% groups_available))) {

        # Stop function if one or more `groups`
        # are not present in the gt table
        stop("All `groups` should be available in the gt object:\n",
             " * The following groups aren't present: ",
             paste0(
               base::setdiff(groups, groups_available),
               collapse = ", "
             ), "\n",
             call. = FALSE)
      }

    } else if (is.null(groups)) {

      # If groups is given as NULL (the default)
      # then use a special group (`::GRAND_SUMMARY`)
      groups <- grand_summary_col
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
        dplyr::select(data_tbl, .env$columns) %>%
        dplyr::mutate(!!group_id_col_private := .env$grand_summary_col) %>%
        dplyr::select(.env$group_id_col_private, .env$columns)

    } else {

      select_data_tbl <-
        dplyr::bind_cols(
          dplyr::select(stub_df, !!group_id_col_private := .data$group_id),
          data_tbl[stub_df$rownum_i, columns]
        )
    }

    # Get the registered function calls
    agg_funs <- lapply(fns, rlang::as_closure)

    summary_dfs_data <-
      dplyr::bind_rows(
        lapply(
          seq_along(agg_funs),
          FUN = function(j) {

            group_label <- labels[j]

            select_data_tbl %>%
              dplyr::filter(.data[[group_id_col_private]] %in% .env$groups) %>%
              dplyr::group_by(.data[[group_id_col_private]]) %>%
              dplyr::summarize_all(.funs = agg_funs[[j]]) %>%
              dplyr::ungroup() %>%
              dplyr::mutate(!!rowname_col_private := .env$group_label) %>%
              dplyr::select(
                .env$group_id_col_private, .env$rowname_col_private,
                dplyr::everything()
              )
          }
        )
      )

    # Add those columns that were not part of
    # the aggregation, filling those with NA values
    summary_dfs_data[, columns_excl] <- NA_real_

    summary_dfs_data <-
      dplyr::select(
        summary_dfs_data, .env$group_id_col_private, .env$rowname_col_private,
        colnames(body)
      )

    # Format the displayed summary lines
    summary_dfs_display <-
      dplyr::mutate_at(
        summary_dfs_data,
        .vars = columns,
        .funs = function(x) {

          # This creates a gt structure so that the
          # formatter can be easily extracted by using
          # the regular `dt_*()` methods
          summary_data <-
            gt(
              data.frame(x = x),
              locale = resolve_locale(data = data, locale = NULL)
            )

          format_data <-
            do.call(
              summary_attrs$formatter,
              append(
                list(
                  summary_data,
                  columns = "x"
                ),
                summary_attrs$formatter_options
              )
            )

          formatter <-
            dt_formats_summary_formatter(
              data = format_data,
              context = context
            )

          formatter(x)
        }
      ) %>%
      dplyr::mutate_at(
        .vars = columns_excl,
        .funs = function(x) {NA_character_}
      )

    for (group in groups) {

      group_summary_data_df <-
        dplyr::filter(summary_dfs_data, .data[[group_id_col_private]] == .env$group)

      group_summary_display_df <-
        dplyr::filter(summary_dfs_display, .data[[group_id_col_private]] == .env$group)

      summary_df_data_list <-
        c(
          summary_df_data_list,
          stats::setNames(list(group_summary_data_df), group)
        )

      summary_df_display_list <-
        c(
          summary_df_display_list,
          stats::setNames(list(group_summary_display_df), group)
        )
    }
  }

  # Condense data in `summary_df_display_list` in a groupwise manner
  summary_df_display_list <-
    tapply(
      summary_df_display_list,
      names(summary_df_display_list),
      dplyr::bind_rows
    )

  for (i in seq(summary_df_display_list)) {

    arrangement <-
      unique(summary_df_display_list[[i]][, rowname_col_private, drop = TRUE])

    summary_df_display_list[[i]] <-
      summary_df_display_list[[i]] %>%
      dplyr::select(-.env$group_id_col_private) %>%
      dplyr::group_by(.data[[rowname_col_private]]) %>%
      dplyr::summarize_all(last_non_na)

    summary_df_display_list[[i]] <-
      summary_df_display_list[[i]][
        match(arrangement, summary_df_display_list[[i]][[rowname_col_private]]), ] %>%
      replace(is.na(.), missing_text)
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
group_id_col_private <- "::group_id::"
