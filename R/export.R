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
#  Copyright (c) 2018-2024 gt authors
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

  if (isTRUE(getOption('knitr.in.progress'))) {
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

#' Generate OOXML for the table caption
#'
#' @param data A processed table object that is created using the `build_data()`
#' function.
#' @param align left (default), center or right.
#' @param split TRUE or FALSE (default) indicating whether activate Word option
#' 'Allow row to break across pages'.
#' @param keep_with_next  TRUE (default) or FALSE indicating whether a table
#' should use Word option 'keep rows together' is activated when TRUE.
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

  } else if (grepl("\\%$", left)) {

    left <- as.numeric(sub("\\%$", "", left)) / 100
    left <- grid::unit(left * 0.5, "null")

  } else {

    left <- grid::unit(parse_px_to_pt(left), "pt")
  }

  if (right == "auto") {

    right <- grid::unit(0.5, "null")

  } else if (grepl("\\%$", right)) {

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

  widths <- vapply(layout$grobs, `[[`, numeric(1), "width")

  columns <- vctrs::vec_group_loc(layout[, c("left", "right")])
  columns$width <- vapply(columns$loc, function(i) max(widths[i]), numeric(1L))

  is_single <- columns$key$left == columns$key$right
  singles <- columns[is_single, ]
  spanner <- columns[!is_single, ]

  widths <- rep_len(0, max(layout$right))
  widths[singles$key$left] <- singles$width

  # Enlarge columns if fixed column widths have been set
  column_width <- unlist(dt_boxhead_get(data)$column_width)
  fixed    <- integer(0)
  relative <- rep(NA_real_, length(widths))

  if (any(nzchar(column_width)) && length(column_width) == length(widths)) {
    fixed <- which(endsWith(column_width, "px"))
    if (length(fixed) > 0) {
      widths[fixed] <- pmax(parse_px_to_pt(column_width[fixed]), widths[fixed])
    }
    pct <- which(endsWith(column_width, "%"))
    if (length(pct) > 0) {
      relative[pct] <- as.numeric(sub("\\%$", "", column_width[pct])) / 100
    }
  }
  pct <- which(!is.na(relative))

  spanner <- spanner[order(spanner$key$left, spanner$key$right), ]

  for (i in seq_len(nrow(spanner))) {

    left <- spanner$key$left[i]
    right <- spanner$key$right[i]
    single_size <- sum(widths[left:right])
    extra_width <- spanner$width[i] - single_size

    if (extra_width < 0) {
      next
    }
    extra_width <- extra_width / (right - left + 1)
    widths[left:right] <- widths[left:right] + extra_width
  }

  total_width <- dt_options_get_value(data, "table_width")

  if (grepl("px$", total_width)) {

    total_width <- parse_px_to_pt(total_width)
    extra_width <- total_width - sum(widths)

    if (extra_width <= 0 || length(fixed) == length(widths)) {
      return(grid::unit(widths, .grid_unit))
    }

    change <- setdiff(seq_along(widths), fixed)
    widths[change] <- widths[change] + extra_width / (length(widths[change]))
    widths <- grid::unit(widths, .grid_unit)
    if (length(pct) > 0) {
      widths[pct] <- grid::unit(relative[pct], "npc")
    }
    return(widths)
  }

  if (grepl("\\%$", total_width)) {

    # Set the total width in npc units
    total_width <- as.numeric(sub("\\%$", "", total_width)) / 100
    change <- setdiff(seq_along(widths), fixed)
    extra_width <- rep_len(0, length(widths))
    extra_width[change] <- total_width / length(change)
    extra_width <- grid::unit(extra_width, "npc")

    # Subtract the size of fixed columns from the npc units
    extra_width[change] <- extra_width[change] -
      grid::unit(sum(widths[fixed]) / length(change), .grid_unit)

    # Take pairwise max between minimal size and relative size
    widths <- grid::unit.pmax(grid::unit(widths, .grid_unit), extra_width)
    if (length(pct) > 0) {
      widths[pct] <- grid::unit(relative[pct], "npc")
    }
    return(widths)
  }
  grid::unit(
    ifelse(is.na(relative), widths, relative),
    ifelse(is.na(relative), .grid_unit, "npc")
  )
}
