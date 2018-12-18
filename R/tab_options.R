#' Modify the table output options
#'
#' Modify the options available in a table. These options are named by the
#' components, the subcomponents, and the element that can adjusted.
#' @inheritParams fmt_number
#' @param table.width the width of the table. Can be specified as a
#'   single-length character with units of pixels or as a percentage. If
#'   provided as a single-length numeric vector, it is assumed that the value is
#'   given in units of pixels. The \code{\link{px}()} and \code{\link{pct}()}
#'   helper functions can also be used to pass in numeric values and obtain
#'   values as pixel or percent units.
#' @param table.font.size,heading.title.font.size,heading.subtitle.font.size,column_labels.font.size,stub_group.font.size,footnote.font.size,sourcenote.font.size
#'   font sizes for the parent text element \code{table} and the following child
#'   elements: \code{heading.title}, \code{heading.subtitle}, \code{columns},
#'   \code{stub_group}, \code{footnote}, and \code{sourcenote}. Can be specified
#'   as a single-length character vector with units of pixels
#'   (e.g., \code{12px}) or as a percentage (e.g., \code{80\%}). If provided as a
#'   single-length numeric vector, it is assumed that the value is given in
#'   units of pixels. The \code{\link{px}()} and \code{\link{pct}()} helper
#'   functions can also be used to pass in numeric values and obtain values as
#'   pixel or percent units.
#' @param column_labels.font.weight,stub_group.font.weight the font weight of the
#'   \code{columns} and \code{stub_group} text element.
#' @param summary_row.text_transform an option to apply text transformations to
#' the label text in each summary row.
#' @param table.background.color,heading.background.color,column_labels.background.color,stub_group.background.color,summary_row.background.color
#'   background colors for the parent element \code{table} and the following
#'   child elements: \code{heading}, \code{columns}, \code{stub_group},
#'   \code{summary_row}, and \code{field}. A color name or a hexadecimal color
#'   code should be provided.
#' @param table.border.top.style,table.border.top.width,table.border.top.color
#'   the style, width, and color of the table's top border.
#' @param heading.border.bottom.style,heading.border.bottom.width,heading.border.bottom.color
#'   the style, width, and color of the heading's bottom border.
#' @param stub_group.border.top.style,stub_group.border.top.width,stub_group.border.top.color
#'   the style, width, and color of the stub heading's top border.
#' @param stub_group.border.bottom.style,stub_group.border.bottom.width,stub_group.border.bottom.color
#'   the style, width, and color of the stub heading's bottom border.
#' @param field.border.top.style,field.border.top.width,field.border.top.color
#'   the style, width, and color of the field's top border.
#' @param field.border.bottom.style,field.border.bottom.width,field.border.bottom.color
#'   the style, width, and color of the field's bottom border.
#' @param row.padding,summary_row.padding the amount of padding in each row and
#'   in each summary row.
#' @param footnote.sep the separating characters between adjacent footnotes in
#'   the footnotes section. The default value produces a linebreak.
#' @param footnote.glyph the set of sequential figures or characters used to
#'   identify the footnotes. We can either supply the keyword \code{"numbers"}
#'   (the default, indicating that we want numeric glyphs), the keywords
#'   \code{"letters"} or \code{"LETTERS"} (indicating that we want letters as
#'   glyphs, either lowercase or uppercase), or, a vector of character values
#'   representing the series of glyphs. A series of glyphs is recycled when its
#'   usage goes beyond the length of the set. At each cycle, the glyphs are
#'   simply combined (e.g., \code{*} -> \code{**} -> \code{***}).
#' @param footnote.padding,sourcenote.padding the amount of padding to apply to
#'   the footnote and source note sections.
#' @param row.striping.include_stub an option for whether to include the stub
#'   when striping rows.
#' @param row.striping.include_field an option for whether to include the field
#'   when striping rows.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Use `exibble` to create a gt table with
#' # all the main parts added; we can use this
#' # going forward to demo some `tab_options()`
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(
#'     -c(fctr, date, time, datetime)
#'   ) %>%
#'   gt(
#'     rowname_col = "row",
#'     groupname_col = "group"
#'   ) %>%
#'   tab_header(
#'     title = md("Data listing from **exibble**"),
#'     subtitle = md("`exibble` is an R dataset")
#'   ) %>%
#'   fmt_number(columns = vars(num)) %>%
#'   fmt_currency(columns = vars(currency)) %>%
#'   tab_footnote(
#'     footnote = "Using commas for separators.",
#'     locations = cells_data(
#'       columns = vars(num),
#'       rows = num > 1000)
#'   ) %>%
#'   tab_footnote(
#'     footnote = "Using commas for separators.",
#'     locations = cells_data(
#'       columns = vars(currency),
#'       rows = currency > 1000)
#'   ) %>%
#'   tab_footnote(
#'     footnote = "Alphabetical fruit.",
#'     locations = cells_column_labels(
#'       columns = vars(char))
#'   )
#'
#' # Modify the table width to 100% (which
#' # spans the entire content width area)
#' tab_2 <-
#'   tab_1 %>%
#'   tab_options(
#'     table.width = pct(100)
#'   )
#'
#' # Modify the table's background color
#' # to be "lightcyan"
#' tab_3 <-
#'   tab_1 %>%
#'   tab_options(
#'     table.background.color = "lightcyan"
#'   )
#'
#' # Use letters as the glyphs for footnote
#' # references; also, separate footnotes in
#' # the footer by spaces instead of newlines
#' tab_4 <-
#'   tab_1 %>%
#'   tab_options(
#'     footnote.sep = " ",
#'     footnote.glyph = letters
#'   )
#'
#' # Change the padding of data rows to 5px
#' tab_5 <-
#'   tab_1 %>%
#'   tab_options(
#'     row.padding = px(5)
#'   )
#'
#' # Reduce the size of the title and the
#' # subtitle text
#' tab_6 <-
#'   tab_1 %>%
#'   tab_options(
#'     heading.title.font.size = "small",
#'     heading.subtitle.font.size = "small"
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_options_1.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_tab_options_2.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_tab_options_3.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_tab_options_4.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_tab_options_5.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_tab_options_6.svg}{options: width=100\%}}
#'
#' @family table-part creation/modification functions
#' @export
tab_options <- function(data,
                        table.width = NULL,
                        table.font.size = NULL,
                        table.background.color = NULL,
                        table.border.top.style = NULL,
                        table.border.top.width = NULL,
                        table.border.top.color = NULL,
                        heading.background.color = NULL,
                        heading.title.font.size = NULL,
                        heading.subtitle.font.size = NULL,
                        heading.border.bottom.style = NULL,
                        heading.border.bottom.width = NULL,
                        heading.border.bottom.color = NULL,
                        column_labels.background.color = NULL,
                        column_labels.font.size = NULL,
                        column_labels.font.weight = NULL,
                        stub_group.background.color = NULL,
                        stub_group.font.size = NULL,
                        stub_group.font.weight = NULL,
                        stub_group.border.top.style = NULL,
                        stub_group.border.top.width = NULL,
                        stub_group.border.top.color = NULL,
                        stub_group.border.bottom.style = NULL,
                        stub_group.border.bottom.width = NULL,
                        stub_group.border.bottom.color = NULL,
                        field.border.top.style = NULL,
                        field.border.top.width = NULL,
                        field.border.top.color = NULL,
                        field.border.bottom.style = NULL,
                        field.border.bottom.width = NULL,
                        field.border.bottom.color = NULL,
                        row.padding = NULL,
                        summary_row.background.color = NULL,
                        summary_row.padding = NULL,
                        summary_row.text_transform = NULL,
                        footnote.sep = NULL,
                        footnote.glyph = NULL,
                        footnote.font.size = NULL,
                        footnote.padding = NULL,
                        sourcenote.font.size = NULL,
                        sourcenote.padding = NULL,
                        row.striping.include_stub = NULL,
                        row.striping.include_field = NULL) {

  # Extract the `opts_df` data frame object from `data`
  opts_df <- attr(data, "opts_df", exact = TRUE)

  # table.font.size
  if (!is.null(table.font.size)) {

    if (is.numeric(table.font.size)) {
      table.font.size <- paste0(table.font.size, "px")
    }

    opts_df <- opts_df_set(opts_df, "table_font_size", table.font.size)
  }

  # table.background.color
  if (!is.null(table.background.color)) {

    opts_df <- opts_df_set(
      opts_df, "table_background_color", table.background.color)
  }

  # table.width
  if (!is.null(table.width)) {

    if (is.numeric(table.width)) {
      table.width <- paste0(table.width, "px")
    }

    opts_df <- opts_df_set(opts_df, "table_width", table.width)
  }

  # table.border.top.style
  if (!is.null(table.border.top.style)) {

    opts_df <- opts_df_set(
      opts_df, "table_border_top_style", table.border.top.style)
  }

  # table.border.top.width
  if (!is.null(table.border.top.width)) {

    if (is.numeric(table.border.top.width)) {
      table.border.top.width <- paste0(table.border.top.width, "px")
    }

    opts_df <- opts_df_set(
      opts_df, "table_border_top_width", table.border.top.width)
  }

  # table.border.top.color
  if (!is.null(table.border.top.color)) {

    opts_df <- opts_df_set(
      opts_df, "table_border_top_color", table.border.top.color)
  }

  # heading.background.color
  if (!is.null(heading.background.color)) {

    opts_df <- opts_df_set(
      opts_df, "heading_background_color", heading.background.color)
  }

  # heading.title.font.size
  if (!is.null(heading.title.font.size)) {

    if (is.numeric(heading.title.font.size)) {
      heading.title.font.size <- paste0(heading.title.font.size, "px")
    }

    opts_df <- opts_df_set(
      opts_df, "heading_title_font_size", heading.title.font.size)
  }

  # heading.subtitle.font.size
  if (!is.null(heading.subtitle.font.size)) {

    if (is.numeric(heading.subtitle.font.size)) {
      heading.subtitle.font.size <- paste0(heading.subtitle.font.size, "px")
    }

    opts_df <- opts_df_set(
      opts_df, "heading_subtitle_font_size", heading.subtitle.font.size)
  }

  # heading.border.bottom.style
  if (!is.null(heading.border.bottom.style)) {

    opts_df <- opts_df_set(
      opts_df, "heading_border_bottom_style", heading.border.bottom.style)
  }

  # heading.border.bottom.width
  if (!is.null(heading.border.bottom.width)) {

    if (is.numeric(heading.border.bottom.width)) {
      heading.border.bottom.width <- paste0(heading.border.bottom.width, "px")
    }

    opts_df <- opts_df_set(
      opts_df, "heading_border_bottom_width", heading.border.bottom.width)
  }

  # heading.border.bottom.color
  if (!is.null(heading.border.bottom.color)) {

    opts_df <- opts_df_set(
      opts_df, "heading_border_bottom_color", heading.border.bottom.color)
  }

  # column_labels.background.color
  if (!is.null(column_labels.background.color)) {

    opts_df <- opts_df_set(
      opts_df, "column_labels_background_color", column_labels.background.color)
  }

  # column_labels.font.size
  if (!is.null(column_labels.font.size)) {

    if (is.numeric(column_labels.font.size)) {
      column_labels.font.size <- paste0(column_labels.font.size, "px")
    }

    opts_df <- opts_df_set(opts_df, "column_labels_font_size", column_labels.font.size)
  }

  # column_labels.font.weight
  if (!is.null(column_labels.font.weight)) {

    opts_df <- opts_df_set(opts_df, "column_labels_font_weight", column_labels.font.weight)
  }

  # stub_group.background.color
  if (!is.null(stub_group.background.color)) {

    opts_df <- opts_df_set(
      opts_df, "stub_group_background_color", stub_group.background.color)
  }

  # stub_group.font.size
  if (!is.null(stub_group.font.size)) {

    if (is.numeric(stub_group.font.size)) {
      stub_group.font.size <- paste0(stub_group.font.size, "px")
    }

    opts_df <- opts_df_set(
      opts_df, "stub_group_font_size", stub_group.font.size)
  }

  # stub_group.font.weight
  if (!is.null(stub_group.font.weight)) {

    opts_df <- opts_df_set(
      opts_df, "stub_group_font_weight", stub_group.font.weight)
  }

  # stub_group.border.top.style
  if (!is.null(stub_group.border.top.style)) {

    opts_df <- opts_df_set(
      opts_df, "stub_group_border_top_style", stub_group.border.top.style)
  }

  # stub_group.border.top.width
  if (!is.null(stub_group.border.top.width)) {

    if (is.numeric(stub_group.border.top.width)) {
      stub_group.border.top.width <- paste0(stub_group.border.top.width, "px")
    }

    opts_df <- opts_df_set(
      opts_df, "stub_group_border_top_width", stub_group.border.top.width)
  }

  # stub_group.border.top.color
  if (!is.null(stub_group.border.top.color)) {

    opts_df <- opts_df_set(
      opts_df, "stub_group_border_top_color", stub_group.border.top.color)
  }

  # stub_group.border.bottom.style
  if (!is.null(stub_group.border.bottom.style)) {

    opts_df <- opts_df_set(
      opts_df, "stub_group_border_bottom_style", stub_group.border.bottom.style)
  }

  # stub_group.border.bottom.width
  if (!is.null(stub_group.border.bottom.width)) {

    if (is.numeric(stub_group.border.bottom.width)) {
      stub_group.border.bottom.width <- paste0(stub_group.border.bottom.width, "px")
    }

    opts_df <- opts_df_set(
      opts_df, "stub_group_border_bottom_width", stub_group.border.bottom.width)
  }

  # stub_group.border.bottom.color
  if (!is.null(stub_group.border.bottom.color)) {

    opts_df <- opts_df_set(
      opts_df, "stub_group_border_bottom_color", stub_group.border.bottom.color)
  }

  # field.border.top.style
  if (!is.null(field.border.top.style)) {

    opts_df <- opts_df_set(
      opts_df, "field_border_top_style", field.border.top.style)
  }

  # field.border.top.width
  if (!is.null(field.border.top.width)) {

    if (is.numeric(field.border.top.width)) {
      field.border.top.width <- paste0(field.border.top.width, "px")
    }

    opts_df <- opts_df_set(
      opts_df, "field_border_top_width", field.border.top.width)
  }

  # field.border.top.color
  if (!is.null(field.border.top.color)) {

    opts_df <- opts_df_set(
      opts_df, "field_border_top_color", field.border.top.color)
  }

  # field.border.bottom.style
  if (!is.null(field.border.bottom.style)) {

    opts_df <- opts_df_set(
      opts_df, "field_border_bottom_style", field.border.bottom.style)
  }

  # field.border.bottom.width
  if (!is.null(field.border.bottom.width)) {

    if (is.numeric(field.border.bottom.width)) {
      field.border.bottom.width <- paste0(field.border.bottom.width, "px")
    }

    opts_df <- opts_df_set(
      opts_df, "field_border_bottom_width", field.border.bottom.width)
  }

  # field.border.bottom.color
  if (!is.null(field.border.bottom.color)) {

    opts_df <- opts_df_set(
      opts_df, "field_border_bottom_color", field.border.bottom.color)
  }

  # row.padding
  if (!is.null(row.padding)) {

    if (is.numeric(row.padding)) {
      row.padding <- paste0(row.padding, "px")
    }

    opts_df <- opts_df_set(opts_df, "row_padding", row.padding)
  }

  # summary_row.background.color
  if (!is.null(summary_row.background.color)) {

    opts_df <- opts_df_set(
      opts_df, "summary_row_background_color", summary_row.background.color)
  }

  # summary_row.padding
  if (!is.null(summary_row.padding)) {

    if (is.numeric(summary_row.padding)) {
      summary_row.padding <- paste0(summary_row.padding, "px")
    }

    opts_df <- opts_df_set(opts_df, "summary_row_padding", summary_row.padding)
  }

  # summary_row.text_transform
  if (!is.null(summary_row.text_transform)) {

    opts_df <- opts_df_set(
      opts_df, "summary_row_text_transform", summary_row.text_transform)
  }

  # footnote.sep
  if (!is.null(footnote.sep)) {

    opts_df <- opts_df_set(opts_df, "footnote_sep", footnote.sep)
  }

  # footnote.glyph
  if (!is.null(footnote.glyph)) {

    footnote.glyph <- paste0(footnote.glyph, collapse = ",")

    opts_df <- opts_df_set(opts_df, "footnote_glyph", footnote.glyph)
  }

  # footnote.font.size
  if (!is.null(footnote.font.size)) {

    if (is.numeric(footnote.font.size)) {
      footnote.font.size <- paste0(footnote.font.size, "px")
    }

    opts_df <- opts_df_set(opts_df, "footnote_font_size", footnote.font.size)
  }

  # footnote.padding
  if (!is.null(footnote.padding)) {

    if (is.numeric(footnote.padding)) {
      footnote.padding <- paste0(footnote.padding, "px")
    }

    opts_df <- opts_df_set(opts_df, "footnote_padding", footnote.padding)
  }

  # sourcenote.font.size
  if (!is.null(sourcenote.font.size)) {

    if (is.numeric(sourcenote.font.size)) {
      sourcenote.font.size <- paste0(sourcenote.font.size, "px")
    }

    opts_df <- opts_df_set(
      opts_df, "sourcenote_font_size", sourcenote.font.size)
  }

  # sourcenote.padding
  if (!is.null(sourcenote.padding)) {

    if (is.numeric(sourcenote.padding)) {
      sourcenote.padding <- paste0(sourcenote.padding, "px")
    }

    opts_df <- opts_df_set(opts_df, "sourcenote_padding", sourcenote.padding)
  }

  # row.striping.include.stub
  if (!is.null(row.striping.include_stub)) {

    opts_df <- opts_df_set(
      opts_df, "row_striping_include_stub", row.striping.include_stub)
  }

  # row.striping.include_field
  if (!is.null(row.striping.include_field)) {

    opts_df <- opts_df_set(
      opts_df, "row_striping_include_field", row.striping.include_field)
  }

  # Write the modified `opts_df` to the `data` attribute
  attr(data, "opts_df") <- opts_df

  data
}
