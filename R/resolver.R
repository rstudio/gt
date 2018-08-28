#' Resolve the `data_cells` object once it has access to the `data` object
#' @param data a table object that is created using the \code{\link{gt}()}
#'   function.
#' @param object the list object created by the \code{data_cells()} function.
#' @import rlang
#' @importFrom tibble rownames_to_column
#' @importFrom dplyr filter arrange
#' @noRd
resolve_data_cells <- function(data,
                               object) {

  # Get the `data_df` data frame from `data`
  data_df <- as.data.frame(data)

  # Get the `stub_df` data frame from `data`
  stub_df <- attr(data, "stub_df", exact = TRUE)

  # Obtain the `columns` and `rows` components of
  # object created by the `data_cells()` function
  object_columns <- object$columns
  object_rows <- object$rows
  where <- object$where

  # Collect the column names and column indices
  # from `data_df`
  colnames <- names(data_df)
  colnums <- seq(names(data_df))

  # Collect the rownames and row indices
  # from `stub_df`
  rownames <- stub_df$rowname
  rownums <- seq(nrow(stub_df))

  #
  # Resolution of columns and rows as integer vectors
  # providing the positions of the matched variables
  #

  resolved_columns <- resolve_vars(object_columns, colnames)
  resolved_rows <- resolve_vars(object_rows, rownames)

  #
  # Further resolution of columns and rows as integer
  # vector by resolving the `where` clause and filtering
  # the positions of the matched variables
  #

  if (!is.null(where %>% rlang::get_expr())) {

    data_df_rows <-
      (data_df %>%
         tibble::rownames_to_column() %>%
         dplyr::filter(!!!(object$where)))[["rowname"]] %>%
      as.numeric()

    constrained <-
      data.frame(columns = resolved_columns, rows = resolved_rows) %>%
      dplyr::filter(rows %in% data_df_rows)

    resolved_columns <- constrained$columns
    resolved_rows <- constrained$rows
  }

  # Get all possible combinations with `expand.grid()`
  expansion <-
    expand.grid(resolved_columns, resolved_rows, stringsAsFactors = FALSE) %>%
    dplyr::arrange(Var1)

  # Create a list object
  cells_resolved <- list(columns = expansion[[1]], rows = expansion[[2]])

  # Apply the `data_cells` class
  attr(cells_resolved, "class") <- "data_cells_resolved"

  cells_resolved
}

#' Resolve variables for rows and columns using expressions
#' @import tidyselect
#' @noRd
resolve_vars <- function(var_expr, var_names) {

  var_nums <- seq(var_names)

  if (is.null(var_expr)) {

    # Resolve vars when `var_expr` is NULL
    resolved <-
      tidyselect::everything(vars = var_names)

  } else if (inherits(var_expr, "call") &&
             (var_expr[1] %>% as.character()) == "starts_with") {

    # Resolve vars with a `starts_with` object
    resolved <-
      tidyselect::starts_with(
        match = var_expr[[2]], vars = var_names)

  } else if (inherits(var_expr, "call") &&
             (var_expr[1] %>% as.character()) == "ends_with") {

    # Resolve vars with a `ends_with` object
    resolved <-
      tidyselect::ends_with(
        match = var_expr[[2]], vars = var_names)

  } else if (inherits(var_expr, "call") &&
             (var_expr[1] %>% as.character()) == "contains") {

    # Resolve vars with a `contains` object
    resolved <-
      tidyselect::contains(
        match = var_expr[[2]], vars = var_names)

  } else if (inherits(var_expr, "call") &&
             (var_expr[1] %>% as.character()) == "matches") {

    # Resolve vars with a `matches` object
    resolved <-
      tidyselect::matches(
        match = var_expr[[2]], vars = var_names)

  } else if (inherits(var_expr, "call") &&
             (var_expr[1] %>% as.character()) == "one_of") {

    # Resolve vars with a `one_of` object
    resolved <-
      tidyselect::one_of(var_expr[[2]], .vars = var_names)

  } else if (inherits(var_expr, "call") &&
             (var_expr[1] %>% as.character()) == "everything") {

    # Resolve vars with a `everything` object
    resolved <-
      tidyselect::everything(vars = var_names)

  } else if (inherits(var_expr, "call") &&
             (var_expr[1] %>% as.character()) == ":") {

    # Resolve vars with a numeric range
    resolved <-
      tidyselect::one_of(
        seq(
          var_expr[2] %>% as.character() %>% as.numeric(),
          var_expr[3] %>% as.character() %>% as.numeric()) %>%
          as.character(),
        .vars = var_nums %>% as.character())

  } else if (inherits(var_expr, "character") &&
             length(var_expr) == 1) {

    # Resolve vars with a character vector object
    resolved <-
      tidyselect::one_of(var_expr, .vars = var_names)

  } else if (inherits(var_expr, "call") &&
             (var_expr[1] %>% as.character()) == "c") {

    # Resolve names within `c()`
    resolved <-
      tidyselect::one_of(
        (var_expr %>% as.character())[-1],
        .vars = var_names)

  } else if (inherits(var_expr, "call") &&
             (var_expr[1] %>% as.character()) == "vars") {

    # Resolve vars provided within `vars()`
    resolved <-
      tidyselect::one_of(
        (var_expr %>% as.character())[-1],
        .vars = var_names)

  } else if (inherits(var_expr, c("numeric", "integer"))) {

    # Resolve vars with a numeric vector object
    resolved <- base::intersect(var_expr, var_nums)
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
