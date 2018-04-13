
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
transform_move_columns_to_start <- function(tbl,
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
transform_move_columns_to_end <- function(tbl,
                                          columns) {

  # Filter the vector of column names by the
  # column names actually in `tbl`
  columns <- columns[which(columns %in% colnames(tbl))]

  if (length(columns) > 0) {
    tbl %>% dplyr::select(-columns, columns)
  } else {
    tbl
  }
}

#' Transform by removing selected columns
#' @param tbl an internal data table.
#' @param columns the columns to remove.
#' @importFrom dplyr select everything mutate
#' @noRd
transform_remove_columns <- function(tbl,
                                     columns) {

  # Filter the vector of column names by the
  # column names actually in `tbl`
  columns <- columns[which(columns %in% colnames(tbl))]

  if (length(columns) > 0) {
    tbl %>% dplyr::select(-columns)
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
transform_move_columns <- function(tbl,
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
transform_reorder_columns <- function(tbl,
                                      columns) {

  # Reorder the table columns
  tbl %>% dplyr::select(columns)
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
      transforms$transform_v3[index])

  # Detect and perform the correct table transform --------------------------

  # `to_stub` table transform
  if (transform_type == "add_stub") {

    tbl <-
      transform_to_stub(
        tbl = tbl,
        column = transform_vars[1])

    return(tbl)
  }

  # `move_columns_to_start` table transform
  if (transform_type == "move_columns_to_start") {

    columns <-
      stringr::str_split(
        transform_vars[1],
        pattern = "::") %>%
      unlist()

    tbl <-
      transform_move_columns_to_start(
        tbl = tbl,
        columns = columns)

    return(tbl)
  }

  # `move_columns_to_end` table transform
  if (transform_type == "move_columns_to_end") {

    columns <-
      stringr::str_split(
        transform_vars[1],
        pattern = "::") %>%
      unlist()

    tbl <-
      transform_move_columns_to_end(
        tbl = tbl,
        columns = columns)

    return(tbl)
  }

  # `remove_columns` table transform
  if (transform_type == "remove_columns") {

    columns <-
      stringr::str_split(
        transform_vars[1],
        pattern = "::") %>%
      unlist()

    tbl <-
      transform_remove_columns(
        tbl = tbl,
        columns = columns)

    return(tbl)
  }

  # `move_columns` table transform
  if (transform_type == "move_columns") {

    columns <-
      stringr::str_split(
        transform_vars[1],
        pattern = "::") %>%
      unlist()

    after <- transform_vars[2]

    tbl <-
      transform_move_columns(
        tbl = tbl,
        columns = columns,
        after = after)

    return(tbl)
  }

  # `reorder_columns` table transform
  if (transform_type == "reorder_columns") {

    columns <-
      stringr::str_split(
        transform_vars[1],
        pattern = "::") %>%
      unlist()

    tbl <-
      transform_reorder_columns(
        tbl = tbl,
        columns = columns)

    return(tbl)
  }

  tbl
}

#' Perform all tbl transform steps
#' @param html_tbl an html table object
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
#' @param tbl an internal data table.
#' @importFrom dplyr select everything tibble mutate
#' @importFrom dplyr arrange inner_join bind_rows
#' @importFrom purrr map_chr map_df
#' @noRd
create_html_table_tbl <- function(tbl) {

  # Reorder `rowgroup` and `rowname` columns
  if ("rowname" %in% colnames(tbl)) {
    tbl <- tbl %>% dplyr::select(rowname, everything())
    rowname_available <- TRUE
  } else {
    rowname_available <- FALSE
  }

  # Get the column names for the data columns
  data_col_names <-
    colnames(tbl) %>% base::setdiff(c("rowname", "rowgroup"))

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
    dplyr::mutate(t_subpart = NA_character_) %>%
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
        row = 1:nrow(tbl),
        column = 0L,
        column_name = NA_character_)

    table_stubhead <-
      dplyr::tibble(
        t_part = "stub",
        t_subpart = "stubhead",
        content = "",
        type = "character",
        row = 0L,
        column = 0L,
        column_name = NA_character_)

    table_stub <-
      dplyr::bind_rows(table_stubhead, table_stub)
  }

  # Bind rows from `table_boxhead` and `table_body`
  html_table <-
    dplyr::bind_rows(
      table_boxhead,
      table_body)

  # Bind the `table_stub` tbl if one is available
  if (exists("table_stub")) {

    html_table <-
      html_table %>%
      dplyr::bind_rows(table_stub) %>%
      dplyr::arrange(row, column)
  }

  # Reorder the table columns
  html_table <-
    html_table %>%
    dplyr::select(
      t_part, t_subpart, type, row, column, column_name, content)

  html_table
}

