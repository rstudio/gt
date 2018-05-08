#' Create gt table object
#'
#' Create a gt table object so that we can perform
#' styling transformations before transforming
#' the entire object to a display table. Using this
#' function is the first step in that process.
#' @param tbl a \code{data.frame} object or a
#' tibble.
#' @return an object of class \code{html_table}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset
#' tab <-
#'   tab_create(tbl = mtcars)
#'
#' # The resulting object can be used
#' # in transformations
#' tab_2 <-
#'   tab %>%
#'   theme_striped() %>%
#'   cols_align_right() %>%
#'   fmt_number(
#'     columns = c("drat", "wt", "qsec"),
#'     decimals = 1
#'     )
#'
#' # The object of this type can be
#' # displayed in the Viewer
#' tab_2
#' @importFrom purrr map_chr map_df
#' @importFrom dplyr as_tibble tibble select rename rename_at mutate filter pull
#' @importFrom dplyr bind_rows inner_join mutate_if select_if everything add_row
#' @importFrom tibble rownames_to_column
#' @export
tab_create <- function(tbl) {

  # Table ingest ------------------------------------------------------------

  # Perform conversion to tibble
  tbl <- tbl %>% as_tibble()

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

  # If the column `rowname` is available in `tbl`,
  # ensure it is placed at the start of the column series
  if ("rowname" %in% colnames(tbl)) {
    tbl <-
      tbl %>%
      dplyr::select(rowname, everything())
  }

  # If the column `groupname` is available in `tbl`,
  # ensure it is placed at the start of the column series
  if ("groupname" %in% colnames(tbl)) {
    tbl <-
      tbl %>%
      dplyr::select(groupname, everything())
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

  # Initialize metadata tbls ------------------------------------------------

  # Create an empty `transforms` tbl
  transforms <- gt:::empty_transforms_tbl()

  # Create an empty `formats` tbl
  formats <- gt:::empty_formats_tbl()

  # Create an empty `aesthetics` tbl
  aesthetics <- gt:::empty_aesthetics_tbl()

  # Create an empty `fonts` tbl
  fonts <- gt:::empty_fonts_tbl()

  # Create an empty `heading` tbl
  heading <- gt:::empty_heading_tbl()

  # Create an empty `footnote` tbl
  footnote <- gt:::empty_footnote_tbl()

  # Create an empty `source_note` tbl
  source_note <- gt:::empty_source_note_tbl()

  # Create an empty `stubhead_caption` tbl
  stubhead_caption <- gt:::empty_stubhead_caption_tbl()

  # Create an empty `stub_block` tbl
  stub_block <- gt:::empty_stub_block_tbl()

  # Create an empty `boxhead_panel` tbl
  boxhead_panel <- gt:::empty_boxhead_panel_tbl()

  # Set default fonts -------------------------------------------------------
  fonts <-
    fonts %>%
    dplyr::add_row(
      type = "all",
      font_1 = "Helvetica",
      font_2 = "Segoe UI",
      font_3 = "Arial",
      font_4 = "Sans-Serif")

  # Create the `html_table` list object -------------------------------------
  html_table <-
    list(
      transforms = transforms,
      formats = formats,
      aesthetics = aesthetics,
      fonts = fonts,
      source_tbl = tbl,
      modified_tbl = NULL,
      content_tbl = NULL,
      heading = heading,
      footnote = footnote,
      source_note = source_note,
      stubhead_caption = stubhead_caption,
      boxhead_panel = boxhead_panel,
      stub_block = stub_block,
      html_head = html_head)

  # Apply the `html_table` class
  attr(html_table, "class") <- "html_table"

  # Set the fonts immediately
  html_table <-
    fmt_font(
      html_tbl = html_table,
      font = c(
        html_table[["fonts"]] %>% dplyr::filter(type == "all") %>% dplyr::pull(font_1),
        html_table[["fonts"]] %>% dplyr::filter(type == "all") %>% dplyr::pull(font_2),
        html_table[["fonts"]] %>% dplyr::filter(type == "all") %>% dplyr::pull(font_3),
        html_table[["fonts"]] %>% dplyr::filter(type == "all") %>% dplyr::pull(font_4)))

  # Set the alignment immediately
  html_table <-
    cols_align_center(
      html_tbl = html_table)

  # Perform all `source_tbl` transform steps
  html_table <-
    all_tbl_transform_steps(
      html_tbl = html_table)

  html_table
}
