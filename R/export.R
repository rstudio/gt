# as_raw_html() ----------------------------------------------------------------

#' Get the HTML content of a **gt** table
#'
#' @description
#'
#' Get the HTML content from a `gt_tbl` object as a single-element character
#' vector. By default, the generated HTML will have inlined styles, where CSS
#' styles (that were previously contained in CSS rule sets external to the
#' `<table> element`) are included as `style` attributes in the HTML table's
#' tags. This option is preferable when using the output HTML table in an
#' emailing context.
#'
#' @inheritParams gtsave
#'
#' @param inline_css *Use inline CSS*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   An option to supply styles to table elements as inlined CSS styles. This is
#'   useful when including the table HTML as part of an HTML email message body,
#'   since inlined styles are largely supported in email clients over using CSS
#'   in a `<style>` block.
#'
#' @section Examples:
#'
#' Use a subset of the [`gtcars`] dataset to create a **gt** table. Add a header
#' with [tab_header()] and then export the table as HTML code with inlined CSS
#' styles using `as_raw_html()`.
#'
#' ```r
#' tab_html <-
#'   gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice_head(n = 5) |>
#'   gt() |>
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   ) |>
#'   as_raw_html()
#' ```
#'
#' What's returned is a single-element vector containing the HTML for the table.
#' It has only the `<table>...</table>` part so it's not a complete HTML
#' document but rather an HTML fragment.
#'
#' @family table export functions
#' @section Function ID:
#' 13-2
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
as_raw_html <- function(
    data,
    inline_css = TRUE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  html_table <- as.character(as.tags(data))

  if (inline_css) {

    font_vec <- unique(dt_options_get_value(data = data, option = "table_font_names"))
    font_family_attr <- as_css_font_family_attr(font_vec = font_vec)

    html_table <-
      gsub(
        pattern = "<style>html \\{.*?\\}",
        replacement = "<style>",
        x = html_table
      )

    html_table <-
      gsub(
        pattern = ".gt_table {\n",
        replacement = paste0(".gt_table { \n  ", font_family_attr, "\n"),
        x = html_table,
        fixed = TRUE
      )

    # Create inline styles
    html_table <- juicyjuice::css_inline(html = html_table)
  }

  htmltools::HTML(html_table)
}

# as_latex() -------------------------------------------------------------------
#' Output a **gt** object as LaTeX
#'
#' @description
#'
#' Get the LaTeX content from a `gt_tbl` object as a `knit_asis` object. This
#' object contains the LaTeX code and attributes that serve as LaTeX
#' dependencies (i.e., the LaTeX packages required for the table). Using
#' `as.character()` on the created object will result in a single-element vector
#' containing the LaTeX code.
#'
#' @inheritParams gtsave
#'
#' @details
#'
#' LaTeX packages required to generate tables are:
#' `r paste0(gt:::latex_packages(), collapse = ", ")`.
#'
#' In the event packages are not automatically added during the render phase
#' of the document, please create and include a style file to load them.
#'
#' Inside the document's YAML metadata, please include:
#'
#' \preformatted{
#' output:
#'   pdf_document: # Change to appropriate LaTeX template
#'     includes:
#'       in_header: 'gt_packages.sty'
#' }
#'
#' The `gt_packages.sty` file would then contain the listed dependencies above:
#'
#' \preformatted{
#'   \usepackage{booktabs, caption, longtable, colortbl, array}
#' }
#'
#' @section Examples:
#'
#' Use a subset of the [`gtcars`] dataset to create a **gt** table. Add a header
#' with [tab_header()] and then export the table as LaTeX code using the
#' `as_latex()` function.
#'
#' ```r
#' tab_latex <-
#'   gtcars |>
#'   dplyr::select(mfr, model, msrp) |>
#'   dplyr::slice(1:5) |>
#'   gt() |>
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   ) |>
#'   as_latex()
#' ```
#'
#' What's returned is a `knit_asis` object, which makes it easy to include in R
#' Markdown documents that are knit to PDF. We can use `as.character()` to get
#' just the LaTeX code as a single-element vector.
#'
#' @family table export functions
#' @section Function ID:
#' 13-3
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
as_latex <- function(data) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Build all table data objects through a common pipeline
  data <- build_data(data = data, context = "latex")

  # Composition of LaTeX ----------------------------------------------------

  # Create a df containing width types for each column
  colwidth_df <- create_colwidth_df_l(data = data)

  # Create a LaTeX fragment for the start of the table
  table_start <- create_table_start_l(data = data, colwidth_df = colwidth_df)

  # Create the heading component
  heading_component <- create_heading_component_l(data = data)

  # Create the columns component
  columns_component <- create_columns_component_l(data = data, colwidth_df = colwidth_df)

  # Create the body component
  body_component <- create_body_component_l(data = data, colwidth_df = colwidth_df)

  # Create the footnotes component
  footer_component <- create_footer_component_l(data = data)

  # Create a LaTeX fragment for the ending tabular statement
  table_end <- create_table_end_l()

  # If the `rmarkdown` package is available, use the
  # `latex_dependency()` function to load latex packages
  # without requiring the user to do so
  if (rlang::is_installed("rmarkdown")) {
    latex_packages <- lapply(latex_packages(), rmarkdown::latex_dependency)
  } else {
    latex_packages <- NULL
  }

  table_width_statement <- derive_table_width_statement_l(data = data)

  # Allow user to set a font-size
  fontsize_statement <- create_fontsize_statement_l(data = data)


  # Compose the LaTeX table
  knitr::asis_output(
    paste0(
      "\\begingroup\n",
      table_width_statement,
      fontsize_statement,
      table_start,
      heading_component,
      columns_component,
      body_component,
      table_end,
      footer_component,
      "\\endgroup\n",
      collapse = ""
    ),
    meta = latex_packages
  )
}

#' Output a **gt** object as RTF
#'
#' @description
#'
#' Get the RTF content from a `gt_tbl` object as as a single-element character
#' vector. This object can be used with `writeLines()` to generate a valid .rtf
#' file that can be opened by RTF readers.
#'
#' @inheritParams gtsave
#'
#' @param incl_open,incl_close *Include opening/closing braces*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   Options that govern whether the opening or closing `"{"` and `"}"` should
#'   be included. By default, both options are `TRUE`.
#'
#' @param incl_header *Include RTF header*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   Should the RTF header be included in the output? By default, this is
#'   `TRUE`.
#'
#' @param incl_page_info *Include RTF page information*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   Should the RTF output include directives for the document pages? This is
#'   `TRUE` by default.
#'
#' @param incl_body *Include RTF body*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   An option to include the body of RTF document. By default, this is `TRUE`.
#'
#' @section Examples:
#'
#' Use a subset of the [`gtcars`] dataset to create a **gt** table. Add a header
#' with [tab_header()] and then export the table as RTF code using the
#' `as_rtf()` function.
#'
#' ```r
#' tab_rtf <-
#'   gtcars |>
#'   dplyr::select(mfr, model) |>
#'   dplyr::slice(1:2) |>
#'   gt() |>
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   ) |>
#'   as_rtf()
#' ```
#'
#' @family table export functions
#' @section Function ID:
#' 13-4
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
as_rtf <- function(
    data,
    incl_open = TRUE,
    incl_header = TRUE,
    incl_page_info = TRUE,
    incl_body = TRUE,
    incl_close = TRUE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  if (dt_options_get_value(data = data, option = "page_numbering")) {

    data <-
      dt_options_set_value(
        data = data,
        option = "page_header_use_tbl_headings",
        value = TRUE
      )
  }

  page_header_use_tbl_headings <-
    dt_options_get_value(data = data, option = "page_header_use_tbl_headings")

  # Build all table data objects through a common pipeline
  data <- build_data(data = data, context = "rtf")

  # Composition of RTF ------------------------------------------------------

  # Create the heading component
  heading_component <- create_heading_component_rtf(data = data)

  # Create the columns component
  columns_component <- create_columns_component_rtf(data = data)

  # Create the body component
  body_component <- create_body_component_rtf(data = data)

  # Create the footer component
  footer_component <- create_footer_component_rtf(data = data)

  # Create the page footer component
  page_footer_component <- create_page_footer_component_rtf(data = data)

  # Compose the RTF table
  rtf_table <-
    as_rtf_string(
      rtf_file(
        data = data,
        document = {
          rtf_table(
            rows = c(
              if (page_header_use_tbl_headings) rtf_raw("{\\header\n\n") else "",
              heading_component,
              columns_component,
              if (page_header_use_tbl_headings) rtf_raw("}\n\n") else "",
              body_component,
              footer_component,
              page_footer_component
            )
          )
        }
      ),
      incl_open = incl_open,
      incl_header = incl_header,
      incl_page_info = incl_page_info,
      incl_body = incl_body,
      incl_close = incl_close
    )

  if (isTRUE(getOption('knitr.in.progress'))) {
    rtf_table <- knitr::raw_output(rtf_table)
  }

  rtf_table
}

#' Output a **gt** object as Word
#'
#' @description
#'
#' Get the Open Office XML table tag content from a `gt_tbl` object as a
#' single-element character vector.
#'
#' @inheritParams gtsave
#'
#' @param align *Table alignment*
#'
#'   `scalar<character>` // *default:* `"center"`
#'
#'   An option for table alignment. Can either be `"center"`, `"left"`, or
#'   `"right"`.
#'
#' @param caption_location *Caption location*
#'
#'   `singl-kw:[top|bottom|embed]` // *default:* `"top"`
#'
#'   Determines where the caption should be positioned. This can either be
#'   `"top"`, `"bottom"`, or `"embed"`.
#'
#' @param caption_align *Caption alignment*
#'
#'   Determines the alignment of the caption. This is
#'   either `"left"` (the default), `"center"`, or `"right"`. This option is
#'   only used when `caption_location` is not set as `"embed"`.
#'
#' @param split *Allow splitting of a table row across pages*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   A logical value that indicates whether to activate the Word option
#'   `Allow row to break across pages`.
#'
#' @param keep_with_next *Keeping rows together*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   A logical value that indicates whether a table should use Word option
#'   `Keep rows together`.
#'
#' @section Examples:
#'
#' Use a subset of the [`gtcars`] dataset to create a **gt** table. Add a header
#' with [tab_header()] and then export the table as OOXML code for Word using
#' `as_word()`
#'
#' ```r
#' tab_rtf <-
#'   gtcars |>
#'   dplyr::select(mfr, model) |>
#'   dplyr::slice(1:2) |>
#'   gt() |>
#'   tab_header(
#'     title = md("Data listing from **gtcars**"),
#'     subtitle = md("`gtcars` is an R dataset")
#'   ) |>
#'   as_word()
#' ```
#'
#' @family table export functions
#' @section Function ID:
#' 13-5
#'
#' @section Function Introduced:
#' `v0.7.0` (August 25, 2022)
#'
#' @export
as_word <- function(
    data,
    align = "center",
    caption_location = c("top", "bottom", "embed"),
    caption_align = "left",
    split = FALSE,
    keep_with_next = TRUE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  caption_location <- rlang::arg_match(caption_location)

  # Build all table data objects through a common pipeline
  value <- build_data(data = data, context = "word")

  gt_xml <- NULL # same as c()

  #
  # Composition of Word table OOXML
  #

  if (caption_location == "top") {

    header_xml <-
      as_word_tbl_header_caption(
        data = value,
        align = caption_align,
        split = split,
        keep_with_next = keep_with_next
      )

    gt_xml <- c(gt_xml, header_xml)
  }

  tbl_xml <-
    as_word_tbl_body(
      data = value,
      align = align,
      split = split,
      keep_with_next = keep_with_next,
      embedded_heading = identical(caption_location, "embed")
    )

  gt_xml <- c(gt_xml, tbl_xml)

  if (caption_location == "bottom") {

    # Set `keep_with_next` to FALSE here to prevent it trying to keep
    # with non-table content
    header_xml <-
      as_word_tbl_header_caption(
        data = value,
        align = caption_align,
        split = split,
        keep_with_next = FALSE
      )

    gt_xml <- c(gt_xml, header_xml)
  }

  gt_xml <- paste0(gt_xml, collapse = "")

  gt_xml
}

#' Generate ooxml for the table caption
#'
#' @param data A processed table object that is created using the `build_data()` function.
#' @param align left (default), center or right.
#' @param split TRUE or FALSE (default) indicating whether activate Word option 'Allow row to break across pages'.
#' @param keep_with_next  TRUE (default) or FALSE indicating whether a table should use Word option 'keep rows
#' together' is activated when TRUE
#'
#' @noRd
as_word_tbl_header_caption <- function(
    data,
    align = "left",
    split = FALSE,
    keep_with_next = TRUE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Composition of caption OOXML -----------------------------------------------

  # Create the table caption
  caption_xml <-
    create_table_caption_component_xml(
      data = data,
      align = align,
      keep_with_next = keep_with_next
    )

  caption_xml
}

#' Generate ooxml for the table body
#'
#' @param data A processed table object that is created using the `build_data()`
#'   function.
#' @param align left, center (default) or right.
#' @param split TRUE or FALSE (default) indicating whether activate Word option
#'   'Allow row to break across pages'.
#' @param keep_with_next  TRUE (default) or FALSE indicating whether a table
#'   should use Word option 'keep rows together' is activated when TRUE
#' @param embedded_heading  TRUE or FALSE (default) indicating whether a table
#'   should add the title and subtitle at the top of the table.
#'
#' @noRd
as_word_tbl_body <- function(
    data,
    align = "center",
    split = FALSE,
    keep_with_next = TRUE,
    embedded_heading = FALSE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Composition of table Word OOXML
  #

  # Create the table properties component
  table_props_component <-
    create_table_props_component_xml(data = data, align = align)

  # # Create the heading component
  if (embedded_heading) {

    heading_component <-
      create_heading_component_xml(
        data = data,
        split = split,
        keep_with_next = keep_with_next
      )

  } else {
    heading_component <- NULL
  }

  # Create the columns component
  columns_component <-
    create_columns_component_xml(
      data = data,
      split = split,
      keep_with_next = keep_with_next
    )

  # Create the body component
  body_component <-
    create_body_component_xml(
      data = data,
      split = split,
      keep_with_next = keep_with_next
    )

  # Create the footnotes component
  footnotes_component <-
    create_footnotes_component_xml(
      data = data,
      split = split,
      keep_with_next = keep_with_next
    )

  # Create the source notes component
  source_notes_component <-
    create_source_notes_component_xml(
      data = data,
      split = split,
      keep_with_next = keep_with_next
    )

  # Compose the Word OOXML table
  word_tbl <-
    xml_tbl(
      paste0(
        table_props_component,
        heading_component,
        columns_component,
        body_component,
        footnotes_component,
        source_notes_component,
        collapse = ""
      )
    )

  as.character(word_tbl)
}
