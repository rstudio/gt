#' @importFrom rlang UQ
#' @importFrom tibble rownames_to_column
#' @importFrom dplyr filter
#' @noRd
resolve_rows <- function(data,
                         rows) {

  if (inherits(rows, "rownames_with")) {

    rows <-
      which(
        grepl(paste(rows$pattern, collapse = "|"),
              attr(data, "stub_df", exact = TRUE)[["rowname"]]))

  } else if (inherits(rows, "quosure")) {

    rows <-
      (data %>%
         tibble::rownames_to_column() %>%
         dplyr::filter(rlang::UQ(rows)))[["rowname"]] %>%
      as.numeric()

  } else if (is.numeric(rows)) {

    rows <- rows[rows %in% 1:nrow(data)]

  } else if (is.character(rows) &&
             all(!is.na(attr(data, "stub_df")[["rowname"]]))) {

    rows <- which(attr(data, "stub_df")[["rowname"]] %in% rows)
  }

  rows
}

#' @noRd
resolve_columns <- function(data, columns) {

  if (inherits(columns, "quosures")) {
    columns <- columns %>% lapply(`[[`, 2) %>% as.character()
  }

  if (inherits(columns, "columns_with")) {

    columns <- colnames(data)[
      which(grepl(paste(columns$pattern, collapse = "|"), colnames(data)))]

  } else if (is.numeric(columns)) {

    columns <- colnames(data)[columns]

  } else if (is.character(columns)) {

    columns <- columns[columns %in% colnames(data)]
  }

  columns
}

#' @noRd
column_row_resolution <- function(data, columns, rows) {

  # If nothing is provided for rows, assume
  # that all rows are in the selection
  if (is.null(rows)) {
    rows <- TRUE
  }

  # Resolve the columns to be targeted
  columns <- resolve_columns(data = data, columns = columns)

  # Resolve the rows to be targeted
  rows <- resolve_rows(data = data, rows = rows)

  resolved <- list(columns = columns, rows = rows)

  if (length(rows) == 0 || length(columns) == 0) {
    class(resolved) <- c("no_intersection", class(resolved))
  }

  resolved
}

#' @noRd
no_intersection <- function(resolved) {
  inherits(resolved, "no_intersection")
}

#' @noRd
is_target_in_table <- function(data, location) {

  if (is.numeric(location$row) &&
      !(location$row %in% 1:nrow(data))) {
    return(FALSE)
  }
  if (is.character(location$row) &&
      !(location$row %in% attr(data, "stub_df")[["rowname"]])) {
    return(FALSE)
  }
  if (is.numeric(location$column) &&
      !(location$column %in% 1:ncol(data))) {
    return(FALSE)
  }
  if (is.character(location$column) &&
      !(location$column %in% colnames(data))) {
    return(FALSE)
  } else {
    return(TRUE)
  }
}
