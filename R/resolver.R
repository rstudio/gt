#' Helper for targeting multiple data cells
#'
#' This function is to be used to target individual data cells through the
#'   intersections of columns and rows. Thus, we provide targeting directives
#'   separately for columns and for rows.
#' @param columns,rows either a vector of column/row names, a vector of
#'   column/rows indices, column names provided in \code{\link{vars}()}, row
#'   captions provided \code{c()}, or a helper function focused on selections.
#'   The select helper functions are: \code{\link{starts_with}()},
#'   \code{\link{ends_with}()}, \code{\link{contains}()},
#'   \code{\link{matches}()}, \code{\link{one_of}()}, and
#'   \code{\link{everything}()}.
#' @param where a conditional expression that operates across all data cells
#'   captured by \code{columns} and \code{rows} to further constrain the
#'   selection of data cells.
#' @return a list object of class \code{data_cells}.
#' @import rlang
#' @export
data_cells <- function(columns = NULL,
                       rows = NULL,
                       where = NULL) {

  # Capture expressions for the `columns` and `rows` arguments
  col_expr <- rlang::enexpr(columns)
  row_expr <- rlang::enexpr(rows)

  # `enquo()`` the `where` argument value
  where <- rlang::enquo(where)

  # Create the `data_cells` object
  data_cells <-
    list(
      columns = col_expr,
      rows = row_expr,
      where = where)

  # Apply the `data_cells` class
  attr(data_cells, "class") <- "data_cells"

  data_cells
}

#' Resolve the `data_cells` object once it has access to the `data` object
#' @param data a table object that is created using the \code{\link{gt}()}
#'   function.
#' @import rlang
#' @importFrom tibble rownames_to_column
#' @importFrom dplyr filter arrange
#' @importFrom tidyselect starts_with ends_with contains matches one_of
#' @noRd
resolve_data_cells <- function(data, object) {

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
