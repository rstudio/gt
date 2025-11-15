#------------------------------------------------------------------------------#
#
#                /$$
#               | $$
#     /$$$$$$  /$$$$$$
#    /$$__  $$|_  $$_/
#   | $$  \ $$  | $$
#   | $$  | $$  | $$ /$$
#   |  $$$$$$$  |  $$$$/
#    \____  $$   \___/
#    /$$  \ $$
#   |  $$$$$$/
#    \______/
#
#  This file is part of the 'rstudio/gt' project.
#
#  Copyright (c) 2018-2025 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


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

  # Set option to apply latex conversion in escape_latex()
  unicode_conversion <- dt_options_get_value(data = data, option = "latex_unicode_conversion")
  if(unicode_conversion){
    rlang::check_installed("withr","withr is needed to set the option that turns on the unicode conversion")
    withr::local_options(.new = list(gt.latex.unicode_convert = unicode_conversion))
  }

  # Build all table data objects through a common pipeline
  data <- build_data(data = data, context = "latex")

  # Composition of LaTeX ----------------------------------------------------

  # Create a df containing width types for each column
  colwidth_df <- create_colwidth_df_l(data = data)

  # Create a LaTeX fragment for the start of the table
  table_start <- create_table_start_l(data = data, colwidth_df = colwidth_df)

  # Create the caption component
  caption_component <- create_caption_component_l(data = data)

  # Create the heading component
  heading_component <- create_heading_component_l(data = data)

  # Create the columns component
  columns_component <- create_columns_component_l(data = data, colwidth_df = colwidth_df)

  # Create the body component
  body_component <- create_body_component_l(data = data, colwidth_df = colwidth_df)

  # Create the footnotes component
  footer_component <- create_footer_component_l(data = data)

  # Create a LaTeX fragment for the ending tabular statement
  table_end <- create_table_end_l(data = data)

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

  # create wrapping environment
  wrap_start_statement <- create_wrap_start_l(data = data)
  wrap_end_statement <- create_wrap_end_l(data = data)


  # Compose the LaTeX table
  if (dt_options_get_value(data = data, option = "latex_use_longtable")) {
    knitr::asis_output(
      paste0(
        wrap_start_statement,
        table_width_statement,
        fontsize_statement,
        table_start,
        caption_component,
        heading_component,
        columns_component,
        body_component,
        table_end,
        footer_component,
        wrap_end_statement,
        collapse = ""
      ),
      meta = latex_packages
    )
  } else {
    knitr::asis_output(
      paste0(
        wrap_start_statement,
        caption_component,
        heading_component,
        table_width_statement,
        fontsize_statement,
        table_start,
        columns_component,
        body_component,
        table_end,
        footer_component,
        wrap_end_statement,
        collapse = ""
      ),
      meta = latex_packages
    )
  }
  }

# as_rtf() ---------------------------------------------------------------------
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

  if (isTRUE(getOption("knitr.in.progress"))) {
    rtf_table <- knitr::raw_output(rtf_table)
  }

  rtf_table
}

# as_word() --------------------------------------------------------------------
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
#' @param autonum Automatic Table Numbering
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   A logical value that indicates whether a table should use Words built-in
#'   auto table numbering option in the caption.
#'   `Automatic Table Numbering`.
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
    keep_with_next = TRUE,
    autonum = TRUE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  caption_location <-
    rlang::arg_match0(
      caption_location,
      values = c("top", "bottom", "embed")
    )

  # Build all table data objects through a common pipeline
  value <- build_data(data = data, context = "word")

  gt_xml <- NULL # same as c()

  #
  # Composition of Word table OOXML
  #
  #
  header_xml <-
      as_word_tbl_header_caption(
        data = value,
        align = caption_align,
        split = split,
        keep_with_next = ifelse(caption_location == "bottom", FALSE, keep_with_next),
        autonum = autonum
      )

  if (caption_location == "top") {
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
    gt_xml <- c(gt_xml, header_xml)
  }

  gt_xml <- paste0(gt_xml, collapse = "")

  gt_xml
}

#' Generate OOXML for the table caption
#'
#' @param data A processed table object that is created using the `build_data()`
#' function.
#' @param align left (default), center or right.
#' @param split TRUE or FALSE (default) indicating whether activate Word option
#' 'Allow row to break across pages'.
#' @param keep_with_next  TRUE (default) or FALSE indicating whether a table
#' should use Word option 'keep rows together' is activated when TRUE.
#' @param autonum TRUE (default) of FALSE indicating whether a table should usee
#' Word's automatic table numbering in the caption
#'
#' @noRd
as_word_tbl_header_caption <- function(
    data,
    align = "left",
    split = FALSE,
    keep_with_next = TRUE,
    autonum = TRUE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Composition of caption OOXML -----------------------------------------------

  # Create the table caption
  caption_xml <-
    create_table_caption_component_xml(
      data = data,
      align = align,
      keep_with_next = keep_with_next,
      autonum = autonum
    )

  caption_xml
}

#' Generate OOXML for the table body
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

# as_gtable() ------------------------------------------------------------------
#' Transform a **gt** table to a `gtable` object
#'
#' @description
#'
#' `as_gtable()` performs the transformation of a `gt_tbl` object to a
#' [`gtable`][gtable::gtable()] object.
#'
#' @inheritParams gtsave
#'
#' @param plot *Render through the graphics device?*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   The `plot` option determines whether the `gtable` object should be rendered
#'   on the graphics device.
#'
#' @param text_grob *Function for drawing text*
#'
#'   `function` // *default:* `grid::textGrob`
#'
#'   A `function` which will be used to draw text. Defaults to
#'   `grid::textGrob()` but can be swapped to `gridtext::richtext_grob()` to
#'   better render HTML content.
#'
#' @return A `gtable` object.
#'
#' @family table export functions
#' @section Function ID:
#' 13-6
#'
#' @section Function Introduced:
#' `v0.11.0` (July 9, 2024)
#'
#' @export
as_gtable <- function(data, plot = FALSE, text_grob = grid::textGrob) {

  data <- build_data(data = data, context = "grid")
  data <- add_css_styles(data = data)

  caption_component <- create_caption_component_g(data = data)
  heading_component <- create_heading_component_g(data = data)
  columns_component <- create_columns_component_g(data = data)
  body_component <- create_body_component_g(data = data)
  source_notes_component <- create_source_notes_component_g(data = data)
  footnotes_component <- create_footnotes_component_g(data = data)

  layout <-
    combine_components(
      caption = caption_component,
      heading = heading_component,
      columns = columns_component,
      body = body_component,
      source = source_notes_component,
      footnotes = footnotes_component
    )

  layout$grobs <-
    render_grobs(
      layout = layout,
      data = data,
      text_grob = text_grob
    )

  gtable <- finalize_gtable(layout, data)

  if (isTRUE(plot)) {
    plot(gtable)
  }

  gtable
}

as.gtable.gt_tbl <- function(x, ...) as_gtable(x, ...)

combine_components <- function(
    caption = NULL,
    heading = NULL,
    columns = NULL,
    body = NULL,
    source = NULL,
    footnotes = NULL
) {

  vertical <- c("top", "bottom")
  n <- n_caption <- max(caption$bottom %||% 0)

  if (!is.null(heading)) {
    heading[vertical] <- heading[vertical] + n
    n <- max(heading$bottom %||% n)
  }

  if (!is.null(columns)) {
    columns[vertical] <- columns[vertical] + n
    n <- max(columns$bottom %||% n)
  }

  body_start <- n

  if (!is.null(body)) {
    body[vertical] <- body[vertical] + n
    n <- max(body$bottom %||% n)
  }

  body_end <- n

  if (!is.null(footnotes)) {
    footnotes[vertical] <- footnotes[vertical] + n
    n <- max(footnotes$bottom %||% n)
  }

  if (!is.null(source)) {
    source[vertical] <- source[vertical] + n
  }

  n_cols <- max(body$right)

  # A table body typically renders top and bottom borders for the
  # body part; we implement this as a large cell without a label
  table_body <-
    grid_layout(
      left = 1,
      right = n_cols,
      label = "",
      classes = list("gt_table_body"),
      style = "background-color: transparent",
      top = body_start + 1,
      bottom = body_end,
      name = "table_body"
    )

  # The table itself renders top and bottom borders for everything excluding
  # the caption
  table <-
    grid_layout(
      left = 1,
      right = n_cols,
      label = "",
      classes = list("gt_table"),
      style = "background-color: transparent",
      top = n_caption + 1,
      bottom = max(source$bottom %||% n),
      name = "table"
    )

  vctrs::vec_c(
    caption, heading, columns, body,
    source, footnotes, table_body, table
  )
}

render_grobs <- function(
    layout, data,
    text_grob = grid::textGrob,
    cell_grob = grid::segmentsGrob
) {
  if (any(grepl("<svg.*>.*</svg>", layout$label))) {
    rlang::check_installed("rsvg", "for rendering SVG cells.")
  }

  style <- grid_resolve_style(layout = layout, data = data)

  Map(
    label = layout$label,
    style = style,
    f = render_grid_cell,
    MoreArgs = list(
      text_grob = text_grob,
      cell_grob = cell_grob
    ),
    USE.NAMES = FALSE
  )
}

finalize_gtable <- function(layout, data) {

  rlang::check_installed("gtable", "to render as a gtable.")

  widths  <- grid_layout_widths(layout, data)
  heights <- grid_layout_heights(layout)

  name <- layout$name

  name <-
    stats::ave(name, name, FUN = function(nm) {

      if (length(nm) == 1) {
        return(nm)
      }

      paste0(nm, "_", seq_along(nm))
    })

  gtable <- gtable::gtable(widths = widths, heights = heights)
  gtable <- gtable::gtable_add_grob(
    gtable, layout$grobs, name = name, clip = "off",
    t = layout$top, l = layout$left, b = layout$bottom, r = layout$right
  )
  gtable <- grid_align_gtable(gtable, data)
  class(gtable) <- union("gt_gtable", class(gtable))
  gtable
}

#' @export
plot.gt_gtable <- function(x, ...) {
  grid::grid.newpage()
  grid::grid.draw(x)
}

grid_layout_heights <- function(layout) {

  heights <- vapply(layout$grobs, `[[`, numeric(1), "height")

  rows <- vctrs::vec_group_loc(layout[, c("top", "bottom")])
  rows$height <- vapply(rows$loc, function(i) max(heights[i]), numeric(1))

  is_single <- rows$key$top == rows$key$bottom
  singles <- rows[is_single, ]
  spanner <- rows[!is_single, ]

  heights <- rep_len(0, max(layout$bottom))
  heights[singles$key$top] <- singles$height
  spanner <- spanner[order(spanner$key$top, spanner$key$bottom), ]

  for (i in seq_len(nrow(spanner))) {

    top <- spanner$key$top[i]
    bottom <- spanner$key$bottom[i]
    single_size <- sum(heights[top:bottom])
    extra_height <- spanner$height[i] - single_size

    if (extra_height < 0) {
      next
    }

    extra_height <- extra_height / (bottom - top + 1)
    heights[top:bottom] <- heights[top:bottom] + extra_height
  }

  grid::unit(heights, .grid_unit)
}

grid_align_gtable <- function(gtable, data) {

  left  <- dt_options_get_value(data, "table_margin_left")
  right <- dt_options_get_value(data, "table_margin_right")

  if (left == "auto") {

    left <- grid::unit(0.5, "null")

  } else if (endsWith(left, "%")) {

    left <- as.numeric(sub("\\%$", "", left)) / 100
    left <- grid::unit(left * 0.5, "null")

  } else {

    left <- grid::unit(parse_px_to_pt(left), "pt")
  }

  if (right == "auto") {

    right <- grid::unit(0.5, "null")

  } else if (endsWith(right, "%")) {

    right <- as.numeric(sub("\\%$", "", right)) / 100
    right <- grid::unit(right * 0.5, "null")

  } else {

    right <- grid::unit(parse_px_to_pt(left), "pt")
  }

  gtable <- gtable::gtable_add_cols(gtable, left,  pos = 0)
  gtable <- gtable::gtable_add_cols(gtable, right, pos = -1)
  gtable
}

grid_layout_widths <- function(layout, data) {
  # This aims to follow §17.5.2.2 of
  # https://www.w3.org/TR/CSS21/tables.html#auto-table-layout
  # with the adjustment that we only care about *minimum* widths, as we
  # cannot dynamically reflow cell content in grid.

  # Step 1: Calculate the minimum content width (MCW) of each cell.
  # We already added this information to grobs during their construction
  mcw <- vapply(layout$grobs, `[[`, numeric(1), "width")

  # Step 2: For each column, determine minimum column width from the cells
  # that span that column.
  columns  <- vctrs::vec_group_loc(layout[, c("left", "right")])
  columns$min_width <- vapply(columns$loc, function(i) max(mcw[i]), numeric(1L))
  # For now, we only care about 1-cell columns, we deal with spans later
  singles <- vctrs::vec_slice(columns, columns$key$left == columns$key$right)
  width_fix <- width_rel <- rep(0L, max(layout$right))
  width_fix[singles$key$left] <- singles$min_width
  orig_width <- width_fix

  # (or the column width, whichever is largest)
  set_width <- unlist(dt_boxhead_get(data)$column_width)
  is_rel <- grep("\\%$", set_width)
  if (length(is_rel) > 0) {
    rel <- rep(0L, length(width_rel))
    rel[is_rel] <- as.numeric(gsub("\\%$", "", set_width[is_rel])) / 100
    width_rel <- pmax(width_rel, rel)
    width_fix[is_rel] <- 0
    set_width[is_rel] <- ""
  }
  is_fix <- which(nzchar(set_width))
  if (length(is_fix) > 0) {
    fix <- rep(0L, length(width_fix))
    fix[is_fix] <- parse_px_to_pt(set_width[is_fix])
    width_fix <- pmax(width_fix, fix)
  }

  # Step 3: For each cell that spans more than one column, increase the column
  # widths it spans so that together, they are at least as wide as the cell.
  spans <- vctrs::vec_slice(columns, columns$key$left != columns$key$right)
  spans <- vctrs::vec_slice(spans, order(spans$key$left, spans$key$right))
  spans <- vctrs::vec_slice(spans, spans$min_width > 0)

  for (i in vctrs::vec_seq_along(spans)) {
    left  <- spans$key$left[i]
    right <- spans$key$right[i]
    idx   <- left:right
    current_width <- sum(width_fix[idx])
    extra_width <- spans$min_width[i] - current_width
    if (extra_width <= 0) {
      next
    }
    # Distribute additional width over columns
    width_fix[idx] <- width_fix[idx] + extra_width / (right - left + 1)
  }

  # We skip step 4 because I don't think column groups are recognized.
  # Instead, we are going to integrate the total table width setting
  total_width <- dt_options_get_value(data, "table_width")

  # The thought here is that when the total width is more than the sum
  # of column widths, the extra width is distributed over the columns.
  # When the total width is less, it becomes the minimum width required by all
  # columns.

  # Total width is a percentage
  if (grepl("\\%$", total_width)) {
    total_width <- as.numeric(gsub("\\%$", "", total_width)) / 100

    # A percentage value for a column width is relative to the table width
    width_rel <- width_rel * total_width

    # Distribute extra width over the columns
    available_width <- total_width - sum(width_rel)
    not_rel <- setdiff(seq_along(width_rel), is_rel)
    width_rel[not_rel] <- pmax(available_width / length(not_rel), 0)

  } else if (grepl("px$", total_width)) {
    # Total width is absolute
    total_width <- parse_px_to_pt(total_width)

    # Distribute extra width over the columns
    available_width <- total_width * (1 - sum(width_rel)) - sum(width_fix)
    not_rel <- setdiff(seq_along(width_fix), is_rel)
    available_width <- pmax(available_width / length(not_rel), 0)
    width_fix[not_rel] <- width_fix[not_rel] + available_width

    # Translate relative units to absolute units
    width_fix[is_rel]  <- width_rel[is_rel] * total_width
    width_rel <- rep(0, length(width_fix))
  } else if (length(is_rel) > 0 && sum(width_rel) > 0) {
    # We have a mixture of relative and absolute units and no total width goal

    # Compute theoretical total width if we scale everything
    # based on fixed widths
    frac_rel <- sum(width_rel)
    sum_fix <- sum(width_fix) / (1 - frac_rel)

    # Compute theoretical total width if we scale everything
    # based on relative widths
    mult <- width_rel[is_rel] / min(width_rel[is_rel])
    sum_rel <- sum(mult * orig_width[is_rel]) / frac_rel

    # The actual width we use is the maximum
    total_width <- max(sum_rel, sum_fix)

    # Redistribute residual width over non-fixed and non-relative columns
    available_width <- max(total_width * (1 - frac_rel) - sum(width_fix), 0)
    # available_width <- max(total_width - sum(width_fix) - sum_rel * frac_rel, 0)
    spread <- setdiff(seq_along(width_fix), union(is_rel, is_fix))
    width_fix[spread] <- width_fix[spread] + available_width / length(spread)

    # Translate relative units
    width_fix[is_rel] <- width_rel[is_rel] * total_width
    width_rel <- rep(0, length(width_fix))
  }

  # Combine absolute and relative units
  width <- grid::unit(width_fix, .grid_unit)
  if (sum(width_rel) > 0) {
    width <- grid::unit.pmax(width, grid::unit(width_rel, "npc"))
  }
  width
}
