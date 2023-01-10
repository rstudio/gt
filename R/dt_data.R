.dt_data_key <- "_data"

dt_data_get <- function(data) {
  dt__get(data, .dt_data_key)
}

dt_data_set <- function(data, data_tbl) {
  dt__set(data, .dt_data_key, dplyr::as_tibble(data_tbl))
}

# rownames_to_column is a string; if not NA, it means the row.names(data_tbl)
# should be turned into a column with the name !!rownames_to_column
dt_data_init <- function(data, data_tbl, rownames_to_column = NA) {

  if (!is.na(rownames_to_column)) {

    data_rownames <- rownames(data_tbl)

    if (rownames_to_column %in% colnames(data_tbl)) {

      cli::cli_abort(c(
        "Reserved column name `{rownames_to_column}` was detected in the data.",
        "*" = "Please rename this column."
      ))
    }

    data_tbl <- dplyr::mutate(data_tbl, !!sym(rownames_to_column) := data_rownames)
    data_tbl <- dplyr::select(data_tbl, !!sym(rownames_to_column), dplyr::everything())
  }

  dt_data_set(data = data, data_tbl = data_tbl)
}
