
create_summary_dfs <- function(data_attr) {

  if (is.null(data_attr$summary)) {
    return(data_attr)
  }

  summary_df_display_list <- list()
  summary_df_data_list <- list()

  for (i in seq(data_attr$summary)) {

    summary_attrs <- data_attr$summary[[i]]

    # Resolve the `missing_text`
    if (summary_attrs$missing_text == "---") {
      summary_attrs$missing_text <- "\u2014"
    } else if (missing_text == "--") {
      summary_attrs$missing_text <- "\u2013"
    }

    # Resolve the groups to consider
    if (isTRUE(summary_attrs$groups)) {
      groups <- unique(data_attr$stub_df$groupname)
    } else {
      groups <- summary_attrs$groups
    }

    # Resolve the columns to exclude
    if (isTRUE(summary_attrs$columns)) {
      columns <- character(0)
    } else {
      columns <- base::setdiff(colnames(data_attr$data_df), summary_attrs$columns)
    }

    # Combine `groupname` with the field data in order to
    # process data by groups
    groups_data_df <-
      cbind(
        data_attr$stub_df[
          seq(nrow(data_attr$stub_df)),
          c("groupname", "rowname")],
        data_attr$data_df)[, -2]

    # Get the registered function calls
    agg_funs <- summary_attrs$funs

    # Get the labels for each of the function calls
    labels <- agg_funs %>% names()

    summary_dfs <- dplyr::tibble()

    for (j in seq(agg_funs)) {

      # Get aggregation rows for each of the `agg_funs`
      summary_dfs <-
        dplyr::bind_rows(
          summary_dfs,
          groups_data_df %>%
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
      group_sym <- enquo(group)

      group_summary_data_df <-
        summary_dfs_data %>%
        dplyr::filter(groupname == !!group_sym)

      group_summary_display_df <-
        summary_dfs_display %>%
        dplyr::filter(groupname == !!group_sym) %>%
        mutate_all(funs(replace(., is.na(.), summary_attrs$missing_text)))

      summary_df_data_list <-
        c(summary_df_data_list,
          setNames(list(group_summary_data_df), group))

      summary_df_display_list <-
        c(summary_df_display_list,
          setNames(list(group_summary_display_df), group))
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

  data_attr$summary_df_data_list <- summary_df_data_list
  data_attr$summary_df_display_list <- summary_df_display_list

  data_attr
}
