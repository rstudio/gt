#' Create an HTML table object that can be styled
#'
#' Create an HTML table object such that we can
#' perform styling transformations before transforming
#' the entire object to an HTML fragment. This is
#' the first step in the \code{build_html_table()} ->
#' \code{add_column_style()} -> \code{emit_html()}
#' pattern.
#' @param tbl a \code{data.frame} object or a
#' tibble.
#' @return an object of class \code{html_table}.
#' @examples
#' # Create an html table object using the
#' # iris dataset
#' html_table <- build_html_table(iris)
#'
#' # The resulting object can be used
#' # in transformations
#' html_table_transformed <-
#'   html_table %>%
#'   add_column_style(
#'     columns = 1,
#'     property = "color",
#'     values = "blue")
#'
#' # The object of this type can also be
#' # rendered in the Viewer
#' html_table_transformed %>%
#'   render_table()
#'
#' # Once the table has been transformed
#' # suitably, we can extract it as HTML
#' # using `emit_html()`
#' html_table_transformed %>%
#'   emit_html()
#' @importFrom purrr map_chr map_df
#' @importFrom dplyr as_tibble tibble select rename rename_at mutate select
#' @importFrom dplyr bind_rows inner_join mutate_if select_if everything
#' @importFrom tibble rownames_to_column
#' @export
build_html_table <- function(tbl) {

 # If column names contain data (i.e. not numbered),
 # then incorporate the rownames as a column (called
 # `rowname`)
 if (!(all(row.names(tbl) == 1:nrow(tbl) %>% as.character()))) {

  tbl <-
   tbl %>%
   tibble::rownames_to_column()
 }

 # Automatically transform `factor` columns to
 # `character` columns
 tbl <-
  tbl %>%
  dplyr::mutate_if(
   .predicate = function(x) class(x) == "factor",
   .funs = as.character)

 # Automatically select columns that are not
 # `list` columns
 tbl <-
  tbl %>%
  dplyr::select_if(
   .predicate = function(x) class(x) != "list")

 # Reorder `rowgroup` and `rowname` columns
 if ("rowname" %in% colnames(tbl)) {
  tbl <- tbl %>% dplyr::select(rowname, everything())
  rowname_available <- TRUE
 } else {
  rowname_available <- FALSE
 }

 if ("rowgroup" %in% colnames(tbl)) {
  tbl <- tbl %>% dplyr::select(rowgroup, everything())
  rowgroup_available <- TRUE
 } else {
  rowgroup_available <- FALSE
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
 # for the `table` component of the table
 table_table <-
  dplyr::tibble(
   t_part = NA_character_,
   t_subpart = NA_character_,
   content = NA_character_,
   type = "character",
   row = -3L,
   column = 0L,
   column_name = "_table_")

 # Create a tibble that contains basic metadata
 # for the `thead` component of the table
 table_thead <-
  dplyr::tibble(
   t_part = NA_character_,
   t_subpart = NA_character_,
   content = NA_character_,
   type = "character",
   row = -2L,
   column = 0L,
   column_name = "_thead_")

 # Create a tibble that contains basic metadata
 # for the `tbody` component of the table
 table_tbody <-
  dplyr::tibble(
   t_part = NA_character_,
   t_subpart = NA_character_,
   content = NA_character_,
   type = "character",
   row = -1L,
   column = 0L,
   column_name = "_tbody_")

 # Create a tibble that contains basic metadata
 # for the boxhead component of the table
 table_heading <-
  dplyr::tibble(content = data_col_names) %>%
  dplyr::mutate(type = "character") %>%
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
 # tibble from `table_heading`
 table_body <-
  table_body %>%
  dplyr::inner_join(
   table_heading %>% select(column, column_name),
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

  table_stub_head <-
   dplyr::tibble(
    t_part = "stub",
    t_subpart = "stub_head",
    content = "",
    type = "character",
    row = 0L,
    column = 0L,
    column_name = NA_character_)

  table_stub <-
   dplyr::bind_rows(table_stub_head, table_stub)

 }

 # Bind rows from `table_heading` and `table_body`
 html_table <-
  dplyr::bind_rows(
   table_table,
   table_thead,
   table_tbody,
   table_heading,
   table_body)

 # Bind the `table_stub` tbl if one is available
 if (exists("table_stub")) {

  html_table <-
   html_table %>%
   dplyr::bind_rows(table_stub) %>%
   dplyr::arrange(row, column)
 }

 # Create a `heading` tbl
 heading <-
   dplyr::tibble(
     title = NA_character_,
     headnote = NA_character_,
     table_number = NA_character_)

 # Create an empty `footnote` tbl
 footnote <-
   dplyr::tibble(
     index = NA_integer_,
     marker = NA_character_,
     footnote = NA_character_)[-1, ]

 # Create an empty `source_note` tbl
 source_note <-
   dplyr::tibble(
     index = NA_integer_,
     lead_in = NA_character_,
     source_note = NA_character_)[-1, ]

 # Create the list object for the html table
 html_table <-
  list(
    source_tbl = tbl,
    heading = heading,
    footnote = footnote,
    source_note = source_note,
    html_table = html_table)

 # Apply the `html_table` class
 attr(html_table, "class") <- "html_table"

 html_table
}
