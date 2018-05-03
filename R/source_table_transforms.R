
#' Transform an internal table's column to
#' a stub column
#' @param tbl an internal data table.
#' @param column the name of the column to
#' transform to the stub
#' @importFrom dplyr select everything mutate
#' @noRd
transform_to_stub <- function(tbl,
                              column) {

  column_index <- colnames(tbl) %in% column %>% which()

  colnames(tbl)[column_index] <- "rowname"

  tbl %>%
    dplyr::select("rowname", everything()) %>%
    dplyr::mutate(rowname = as.character(rowname))
}

#' Transform by moving selected columns to the
#' beginning of the column series
#' @param tbl an internal data table.
#' @param columns the columns to move.
#' @importFrom dplyr select everything
#' @noRd
transform_cols_move_to_start <- function(tbl,
                                         columns) {

  # Filter the vector of column names by the
  # column names actually in `tbl`
  columns <- columns[which(columns %in% colnames(tbl))]

  if (length(columns) > 0) {
    tbl %>% dplyr::select(columns, everything())
  } else {
    tbl
  }
}

#' Transform by moving selected columns to the
#' end of the column series
#' @param tbl an internal data table.
#' @param columns the columns to move.
#' @importFrom dplyr select
#' @noRd
transform_cols_move_to_end <- function(tbl,
                                       columns) {

  # Filter the vector of column names by the
  # column names actually in `tbl`
  columns <- columns[which(columns %in% colnames(tbl))]

  # Place the column names at the end
  columns <- c(base::setdiff(colnames(tbl), columns), columns)

  # Perform movement of columns using `dplyr::select()`
  if (length(columns) > 0) {
    tbl %>% dplyr::select(columns)
  } else {
    tbl
  }
}

#' Transform by removing selected columns
#' @param tbl an internal data table.
#' @param columns the columns to remove.
#' @importFrom dplyr select everything mutate
#' @noRd
transform_cols_remove <- function(tbl,
                                  columns) {

  # Filter the vector of column names by the
  # column names actually in `tbl`
  columns <- columns[which(columns %in% colnames(tbl))]

  # Remove the column names from the column list
  columns <- c(base::setdiff(colnames(tbl), columns))

  # Perform removal of columns using `dplyr::select()`
  if (length(columns) > 0) {
    tbl %>% dplyr::select(columns)
  } else {
    tbl
  }
}

#' Transform by moving selected columns to
#' a specified insertion point
#' @param tbl an internal data table.
#' @param columns the columns to remove.
#' @importFrom dplyr select everything
#' @noRd
transform_cols_move <- function(tbl,
                                columns,
                                after) {

  # Filter the vector of column names by the
  # column names actually in `tbl`
  columns <- columns[which(columns %in% colnames(tbl))]

  # Get the remaining column names in the table
  column_names <- base::setdiff(colnames(tbl), columns)

  # Get the column index for where the set
  # of `columns` should be inserted after
  column_index <- which(column_names == after)

  if (length(columns) > 0 & column_index != length(column_names)) {

    tbl %>%
      dplyr::select(
        column_names[1:column_index],
        columns,
        column_names[(column_index + 1):length(column_names)])

  } else if (length(columns) > 0 & column_index == length(column_names)) {

    tbl %>%
      dplyr::select(
        column_names[1:column_index],
        columns)

  } else {
    tbl
  }
}

#' Transform by reordering columns
#' @param tbl an internal data table.
#' @param columns the columns in the
#' revised ordering.
#' @importFrom dplyr select
#' @noRd
transform_cols_reorder <- function(tbl,
                                   columns) {

  # Reorder the table columns
  tbl %>% dplyr::select(columns)
}

#' Add summary lines to the table
#' @param tbl an internal data table.
#' @param groups the groups to use when summarizing.
#' @param columns the columns to summarize.
#' @param fcn the name of a function to apply per
#' group per column.
#' @param summary_labels the labels to use in
#' the stub for the created summary rows.
#' @importFrom dplyr group_by summarize_at arrange bind_cols bind_rows
#' @importFrom dplyr tibble distinct mutate select row_number everything
#' @importFrom dplyr rename case_when
#' @importFrom rlang sym UQ
#' @noRd
transform_add_summary <- function(tbl,
                                  group,
                                  columns,
                                  fcns,
                                  summary_labels) {

  if (!is.na(group)) {

    # If a grouping column is provided then
    # group by that column
    summary_lines <-
      tbl %>%
      dplyr::group_by(rlang::UQ(rlang::sym(group))) %>%
      dplyr::summarize_at(.vars = columns, .funs = fcns)

    # Arrange data such that the grouped data
    # is contigious
    tbl <-
      tbl %>%
      dplyr::arrange(rlang::UQ(rlang::sym(group)))

  } else {

    # If a group column is not provided then all rows are
    # to be considered as a single group
    summary_lines <-
      tbl %>%
      dplyr::group_by() %>%
      dplyr::summarize_at(.vars = columns, .funs = fcns)
  }

  # Create a table of summary lines; one line per group
  summary_lines <-
    dplyr::bind_cols(
      dplyr::tibble(
        `::group::` = rep(paste(group, collapse = "::"), nrow(summary_lines)),
        `::summary_label::` = summary_labels),
      summary_lines)

  # Use `distinct()` on `summary_lines` to
  # ensure that there are no exact duplicate rows;
  # add an index column that ensures that the summary
  # lines retain their ordering and also appear last
  # when combined with their groups of source data
  summary_lines <-
    summary_lines %>%
    dplyr::distinct() %>%
    dplyr::mutate(index = row_number() + 10000) %>%
    dplyr::select(index, everything())

  # Combine the summary lines with the source
  # data using `bind_rows()`; arrange by groups and
  # by line index
  tbl <-
    dplyr::bind_rows(
      summary_lines,
      tbl %>%
        dplyr::mutate(index = row_number()) %>%
        dplyr::select(index, everything())) %>%
    dplyr::arrange(rlang::UQ(rlang::sym(group)), index) %>%
    dplyr::select(-`::group::`, -index)

  if ("rowname" %in% colnames(tbl)) {

    # The rowname column extant in `tbl` indicates the
    # presence of a stub; this statement coalesces the
    # summary label with the row labels (or row captions)
    tbl <-
      tbl %>%
      dplyr::select(rowname, everything()) %>%
      dplyr::mutate(rowname = case_when(
        !is.na(`::summary_label::`) ~ `::summary_label::`,
        is.na(`::summary_label::`) ~ rowname)) %>%
      dplyr::select(-`::summary_label::`) %>%
      dplyr::select(rlang::UQ(rlang::sym(group)), everything()) %>%
      dplyr::rename(groupname = rlang::UQ(rlang::sym(group))) %>%
      dplyr::mutate(groupname = paste0(
        group, ": ", as.character(groupname))) %>%
      dplyr::select(groupname, rowname, everything())


  } else {

    # This case is for the situation where no stub
    # exists in the table; no coalescing is required,
    # we simply make the summary label column the
    # `rowname` column and use empty strings in place
    # of the NAs
    tbl <-
      tbl %>%
      dplyr::rename(rowname = `::summary_label::`) %>%
      dplyr::mutate(rowname = case_when(
        is.na(rowname) ~ "",
        !is.na(rowname) ~ rowname)) %>%
      dplyr::rename(groupname = rlang::UQ(rlang::sym(group))) %>%
      dplyr::mutate(groupname = paste0(
        group, ": ", as.character(groupname))) %>%
      dplyr::select(groupname, rowname, everything())
  }

  tbl
}


#' Process an internal table with a single
#' transform directive given in the internal
#' \code{transforms} table.
#' @param tbl an internal data table.
#' @param transforms the internal
#' \code{transforms} table.
#' @param index the \code{index} value in
#' the internal \code{transforms} table.
#' @noRd
tbl_transform_step <- function(tbl,
                               transforms,
                               index) {

  transform_type <- transforms$transform_type[index]

  transform_vars <-
    c(transforms$transform_v1[index],
      transforms$transform_v2[index],
      transforms$transform_v3[index],
      transforms$transform_v4[index])

  # Detect and perform the correct table transform --------------------------

  # `tab_stub` table transform
  if (transform_type == "tab_stub") {

    tbl <-
      transform_to_stub(
        tbl = tbl,
        column = transform_vars[1])

    return(tbl)
  }

  # `cols_move_to_start` table transform
  if (transform_type == "cols_move_to_start") {

    columns <-
      stringr::str_split(
        transform_vars[1],
        pattern = "::") %>%
      unlist()

    tbl <-
      transform_cols_move_to_start(
        tbl = tbl,
        columns = columns)

    return(tbl)
  }

  # `cols_move_to_end` table transform
  if (transform_type == "cols_move_to_end") {

    columns <-
      stringr::str_split(
        transform_vars[1],
        pattern = "::") %>%
      unlist()

    tbl <-
      transform_cols_move_to_end(
        tbl = tbl,
        columns = columns)

    return(tbl)
  }

  # `cols_remove` table transform
  if (transform_type == "cols_remove") {

    columns <-
      stringr::str_split(
        transform_vars[1],
        pattern = "::") %>%
      unlist()

    tbl <-
      transform_cols_remove(
        tbl = tbl,
        columns = columns)

    return(tbl)
  }

  # `cols_move` table transform
  if (transform_type == "cols_move") {

    columns <-
      stringr::str_split(
        transform_vars[1],
        pattern = "::") %>%
      unlist()

    after <- transform_vars[2]

    tbl <-
      transform_cols_move(
        tbl = tbl,
        columns = columns,
        after = after)

    return(tbl)
  }

  # `cols_reorder` table transform
  if (transform_type == "cols_reorder") {

    columns <-
      stringr::str_split(
        transform_vars[1],
        pattern = "::") %>%
      unlist()

    tbl <-
      transform_cols_reorder(
        tbl = tbl,
        columns = columns)

    return(tbl)
  }

  # `add_summary` table transform
  if (transform_type == "add_summary") {

    group <- transform_vars[1]

    columns <-
      stringr::str_split(
        transform_vars[2],
        pattern = "::") %>%
      unlist()

    fcns <-
      stringr::str_split(
        transform_vars[3],
        pattern = "::") %>%
      unlist()

    summary_labels <-
      stringr::str_split(
        transform_vars[4],
        pattern = "::") %>%
      unlist()

    tbl <-
      transform_add_summary(
        tbl = tbl,
        group = group,
        columns = columns,
        fcns = fcns,
        summary_labels = summary_labels)

    return(tbl)
  }

  tbl
}

#' Perform all tbl transform steps
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @importFrom dplyr pull as_tibble
#' @importFrom purrr map
#' @noRd
all_tbl_transform_steps <- function(html_tbl) {

  all_transforms <- html_tbl[["transforms"]]

  if (nrow(all_transforms) > 0) {

    indices <- all_transforms %>% dplyr::pull(index)

    for (i in seq(indices)) {

      if (i == 1) {

        html_tbl[["modified_tbl"]] <-
          tbl_transform_step(
            tbl = html_tbl[["source_tbl"]],
            transforms = all_transforms,
            index = i)

      } else {

        html_tbl[["modified_tbl"]] <-
          tbl_transform_step(
            tbl = html_tbl[["modified_tbl"]],
            transforms = all_transforms,
            index = i)
      }
    }

  } else {

    html_tbl[["modified_tbl"]] <-
      html_tbl[["source_tbl"]] %>%
      dplyr::as_tibble()
  }

  html_tbl
}


#' Transform a tibble of data to a row-wise
#' table representation suitable for supporting
#' cell-specific metadata
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @importFrom dplyr select everything mutate tibble as_tibble
#' @importFrom dplyr rename_at arrange inner_join bind_rows pull
#' @importFrom dplyr group_by summarize distinct full_join
#' @importFrom tibble rownames_to_column
#' @importFrom purrr map_chr map_df
#' @noRd
create_html_table_tbl <- function(html_tbl) {

  tbl <- html_tbl[["modified_tbl"]]

  # Determine if the `rowname` column is available
  if ("rowname" %in% colnames(tbl)) {

    tbl <-
      tbl %>%
      dplyr::select(rowname, everything())

    rowname_available <- TRUE

  } else {

    rowname_available <- FALSE
  }

  # Determine if the `groupname` column is available
  if ("groupname" %in% colnames(tbl)) {

    tbl <-
      tbl %>%
      dplyr::select(groupname, everything())

    groupname_available <- TRUE

  } else {

    groupname_available <- FALSE
  }

  # Get the column names for the data columns
  data_col_names <-
    colnames(tbl) %>% base::setdiff(c("rowname", "groupname"))

  # Get the column indices for the data columns
  data_col_indices <-
    (colnames(tbl) %in% data_col_names) %>% which()

  # Obtain a vector of column types from `tbl`
  data_col_classes <-
    data_col_indices %>%
    purrr::map_chr(
      .f = function(x) tbl[[x]] %>% class())

  # Create a tibble that contains basic metadata
  # for the boxhead component of the table
  table_boxhead <-
    dplyr::tibble(content = data_col_names) %>%
    dplyr::mutate(type = data_col_classes) %>%
    dplyr::mutate(row = 0L) %>%
    dplyr::mutate(column = 1:nrow(.)) %>%
    dplyr::mutate(column_name = content) %>%
    dplyr::mutate(t_part = "boxhead") %>%
    dplyr::mutate(t_subpart = "col_heading") %>%
    dplyr::select(t_part, t_subpart, everything())

  # Create a tibble that contains basic metadata
  # for the table body component of the table
  table_body <-
    seq(nrow(tbl)) %>%
    purrr::map_df(
      .f = function(x) {
        tbl[x, data_col_indices] %>% t() %>%
          dplyr::as_tibble() %>%
          dplyr::rename_at(.vars = 1, .funs = function(x) "content") %>%
          dplyr::mutate(content = as.character(content)) %>%
          dplyr::mutate(type = data_col_classes) %>%
          dplyr::mutate(row = x) %>%
          dplyr::mutate(column = 1:nrow(.))})

  # Join in the column names into the `table_body`
  # tibble from `table_boxhead`
  table_body <-
    table_body %>%
    dplyr::inner_join(
      table_boxhead %>% dplyr::select(column, column_name),
      by = "column") %>%
    dplyr::mutate(t_part = "field") %>%
    dplyr::mutate(t_subpart = "data") %>%
    dplyr::select(t_part, t_subpart, everything())

  # Create a tibble that contains basic metadata
  # for the table stub
  if (rowname_available) {

    table_stub <-
      dplyr::tibble(
        t_part = "stub",
        t_subpart = "row_caption",
        content = tbl %>% dplyr::pull(rowname),
        type = "character",
        row = as.numeric(1:nrow(tbl)),
        column = 0.,
        column_name = NA_character_) %>%
      dplyr::mutate(t_subpart = ifelse(
        grepl("^~", content), "summary_caption", "row_caption")) %>%
      dplyr::mutate(content = ifelse(
        grepl("^~", content), gsub("^~", "", content), content))

    table_stubhead <-
      dplyr::tibble(
        t_part = "stub",
        t_subpart = "stubhead",
        content = "",
        type = "character",
        row = 0.,
        column = 0.,
        column_name = NA_character_)

    table_stub <-
      dplyr::bind_rows(table_stubhead, table_stub)
  }

  if (rowname_available & groupname_available) {

    group_headings_and_rows <-
      tbl %>%
      dplyr::select(groupname) %>%
      tibble::rownames_to_column() %>%
      dplyr::mutate(rowname = as.numeric(rowname)) %>%
      dplyr::group_by(groupname) %>%
      dplyr::summarize(
        row = min(rowname) - 0.05)

    table_stub_group_headings <-
      dplyr::tibble(
        t_part = "stub",
        t_subpart = "group_heading",
        content = group_headings_and_rows %>% dplyr::pull(groupname),
        type = "character",
        row = group_headings_and_rows %>% dplyr::pull(row),
        column = 0.,
        column_name = NA_character_)

    # Bind `table_stub_group_headings` with `table_stub`
    table_stub <-
      dplyr::bind_rows(table_stub, table_stub_group_headings) %>%
      dplyr::arrange(row, column)

    # Create blank cells for rows with group headings
    blank_field_cells <-
      table_body %>%
      dplyr::mutate(t_subpart = "group_heading") %>%
      dplyr::mutate(content = "") %>%
      dplyr::select(-row) %>%
      dplyr::distinct() %>%
      dplyr::mutate(k = 1) %>%
      dplyr::full_join(
        group_headings_and_rows %>%
          dplyr::select(row) %>% dplyr::mutate(k = 1),
        by = "k") %>%
      dplyr::select(-k)

    # Bind `blank_field_cells` with `table_body`
    table_body <-
      dplyr::bind_rows(table_stub, blank_field_cells, table_body) %>%
      dplyr::arrange(row, column)
  }

  # Bind rows from `table_boxhead` and `table_body`
  html_table <-
    dplyr::bind_rows(
      table_boxhead,
      table_body) %>%
    dplyr::arrange(row, column)

  # Reorder the table columns
  html_table <-
    html_table %>%
    dplyr::select(
      t_part, t_subpart, type, row, column, column_name, content)

  html_tbl[["html_table"]] <- html_table
  html_tbl
}

