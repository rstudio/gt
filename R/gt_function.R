#' Create an HTML table object that can be styled
#'
#' Create an HTML table object such that we can
#' perform styling transformations before transforming
#' the entire object to an HTML fragment. This is
#' the first step in the \code{gt()} -> ... ->
#' \code{emit_html()} pattern.
#' @param tbl a \code{data.frame} object or a
#' tibble.
#' @return an object of class \code{html_table}.
#' @examples
#' # Create an html table object using the
#' # iris dataset
#' html_table <- gt(tbl = iris)
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
gt <- function(tbl) {


  # Table ingest ------------------------------------------------------------

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

  # Determine if the `rowgroup` column is available in `tbl`
  if ("rowgroup" %in% colnames(tbl)) {
    tbl <- tbl %>% dplyr::select(rowgroup, everything())
    rowgroup_available <- TRUE
  } else {
    rowgroup_available <- FALSE
  }

  # The <head>, <thead>, and <tbody> elements -------------------------------

  # Create the `html_head` tbl that contains basic metadata
  # for the <table>, <thead>, and <tbody> components
  # of the HTML table
  html_head <-
    dplyr::tibble(
      t_part = NA_character_,
      t_subpart = NA_character_,
      content = NA_character_,
      type = "character",
      row = c(-3:-1),
      column = 0L,
      column_name = c("_table_", "_thead_", "_tbody_"))

  # Create `html_table` -----------------------------------------------------

  html_table <- create_html_table_tbl(tbl = tbl)

  # Initialize metadata tbls ------------------------------------------------

  # Create an empty `transform_opts` tbl
  transform_opts <-
    dplyr::tibble(
      type = NA_character_,
      transform = NA_character_,
      enabled = NA)[-1, ]

  # Create an empty `heading` tbl
  heading <-
    dplyr::tibble(
      title = NA_character_,
      headnote = NA_character_,
      table_number = NA_character_)[-1, ]

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

  # Create an empty `stubhead_caption` tbl
  stubhead_caption <-
    dplyr::tibble(
      caption_text = NA_character_,
      alignment = NA_character_)[-1, ]

  # Create an empty `boxhead_panel` tbl
  boxhead_panel <-
    dplyr::tibble(
      column_name = NA_character_,
      spanner_heading = NA_character_,
      column_heading = NA_character_)[-1, ]

  # Create the list object for the html table
  html_table <-
    list(
      source_tbl = tbl,
      transform_opts = transform_opts,
      heading = heading,
      footnote = footnote,
      source_note = source_note,
      stubhead_caption = stubhead_caption,
      boxhead_panel = boxhead_panel,
      html_head = html_head,
      html_table = html_table)

  # Apply the `html_table` class
  attr(html_table, "class") <- "html_table"

  html_table
}
