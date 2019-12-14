#' Output a **gt** object as RTF
#'
#' Get the RTF content from a `gt_tbl` object as as a single-element character
#' vector. This object can be used with `writeLines()` to generate a valid .rtf
#' file that can be opened by RTF readers.
#'
#' @param data a table object that is created using the `gt()` function.
#'
#' @examples
#' # Use `gtcars` to create a gt table;
#' # add a header and then export as
#' # RTF code
#' tab_rtf <-
#'   gtcars %>%
#'   dplyr::select(mfr, model) %>%
#'   dplyr::slice(1:2) %>%
#'   gt() %>%
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   ) %>%
#'   as_rtf()
#'
#' @family Export Functions
#'
#' @import rlang
#' @import checkmate
#' @export
as_rtf <- function(data) {

  # Build all table data objects through a common pipeline
  data <- data %>% build_data(context = "rtf")

  # Composition of RTF ------------------------------------------------------

  # Create a RTF fragment for the start of the table
  table_start <- rtf_head()

  # Create the heading component
  heading_component <- create_heading_component(data = data, context = "rtf")

  # Create the columns component
  columns_component <- create_columns_component_r(data = data)

  # Create the body component
  body_component <- create_body_component_r(data = data)

  # Create the footnotes component
  footnotes_component <- create_footnotes_component_r(data = data)

  # Create the source notes component
  source_notes_component <- create_source_notes_component_r(data = data)

  # Create a LaTeX fragment for the ending tabular statement
  table_end <- "}\n"

  # Compose the RTF table
  rtf_table <-
    paste0(
      table_start,
      heading_component,
      columns_component,
      body_component,
      footnotes_component,
      source_notes_component,
      table_end,
      collapse = ""
    )

  if (isTRUE(getOption('knitr.in.progress'))) {
    rtf_table <- rtf_table %>% knitr::raw_output()
  }

  rtf_table
}
