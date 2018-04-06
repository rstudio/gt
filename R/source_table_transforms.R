
# Transform an internal table's column to
# a stub column
#' @param tbl an internal data table.
#' @param column the name of the column to
#' transform to the stub
#' @importFrom dplyr rename select everything mutate
#' @noRd
transform_to_stub <- function(tbl,
                              column) {

  tbl %>%
    dplyr::rename("rowname" = column) %>%
    dplyr::select("rowname", everything()) %>%
    dplyr::mutate(rowname = as.character(rowname))
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
  if (transform_type == "to_stub") {

    tbl <-
      transform_to_stub(
        tbl = tbl,
        column = transform_vars[1])
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

    transformed_tbl <-
      indices %>%
      purrr::map(.f = function(x) {
        tbl_transform_step(
          tbl = html_tbl[["source_tbl"]],
          transforms = all_transforms,
          index = x)})

    html_tbl[["modified_tbl"]] <-
      transformed_tbl[[length(transformed_tbl)]] %>%
      dplyr::as_tibble()

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

