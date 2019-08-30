#' Output a \pkg{gt} object as LaTeX
#'
#' Get the LaTeX content from a `gt_tbl` object as a `knit_asis` object. This
#' object contains the LaTeX code and attributes that serve as LaTeX
#' dependencies (i.e., the LaTeX packages required for the table). Using
#' `as.character()` on the created object will result in a single-element vector
#' containing the LaTeX code.
#'
#' @param data A table object that is created using the [gt()] function.
#' @examples
#' # Use `gtcars` to create a gt table;
#' # add a header and then export as
#' # an object with LaTeX code
#' tab_latex <-
#'   gtcars %>%
#'   dplyr::select(mfr, model, msrp) %>%
#'   dplyr::slice(1:5) %>%
#'   gt() %>%
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   ) %>%
#'   as_latex()
#'
#' # `tab_latex` is a `knit_asis` object,
#' # which makes it easy to include in
#' # R Markdown documents that are knit to
#' # PDF; we can use `as.character()` to
#' # get just the LaTeX code as a single-
#' # element vector
#' tab_latex %>%
#'   as.character() %>%
#'   cat()
#'
#' @family table export functions
#' @export
as_latex <- function(data) {

  # Build all table data objects through a common pipeline
  data <- data %>% build_data(context = "html")

  # Composition of LaTeX ----------------------------------------------------

  output_tbl <- dt_output_tbl_get(data = data)

  n_cols <- ncol(output_tbl)

  col_alignment <- dt_boxh_get(data = data) %>% .$column_align

  # Extraction of body content as a vector ----------------------------------
  body_content <- as.vector(t(output_tbl))

  # Composition of LaTeX ----------------------------------------------------

  # Split `body_content` by slices of rows
  row_splits <- split(body_content, ceiling(seq_along(body_content) / n_cols))

  # Create a LaTeX fragment for the start of the table
  table_start <- create_table_start_l(col_alignment = col_alignment)

  # Create the heading component of the table
  heading_component <- create_heading_component(data = data, context = "latex")

  # Create the columns component of the table
  columns_component <- create_columns_component_l(data = data)

  # Create the body component of the table
  body_component <-
    create_body_component_l(
      data = data,
      row_splits = row_splits
    )

  # Create a LaTeX fragment for the ending tabular statement
  table_end <- create_table_end_l()

  # Create the footnote component of the table
  footnote_component <- create_footnote_component_l(data = data)

  # Create the source note component of the table
  source_note_component <- create_source_note_component_l(data = data)

  # If the `rmarkdown` package is available, use the
  # `latex_dependency()` function to load latex packages
  # without requiring the user to do so
  if (requireNamespace("rmarkdown", quietly = TRUE)) {

    latex_packages <-
      lapply(latex_packages(), rmarkdown::latex_dependency)

  } else {
    latex_packages <- NULL
  }

  # Compose the LaTeX table
  paste0(
    table_start,
    heading_component,
    columns_component,
    body_component,
    table_end,
    footnote_component,
    source_note_component,
    collapse = "") %>%
    knitr::asis_output(meta = latex_packages)
}
