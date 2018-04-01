

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
    colnames(tbl) %>% setdiff(c("rowname", "rowgroup"))

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
      table_boxhead %>% select(column, column_name),
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
        content = tbl %>% pull(rowname),
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

  html_table
}
