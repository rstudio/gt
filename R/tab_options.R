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
#' @param table.font.size,heading.title.font.size,heading.headnote.font.size,boxhead.font.size,stub_group.font.size,footnote.font.size,sourcenote.font.size
#'   font sizes for the parent text element \code{table} and the following child
#'   elements: \code{heading.title}, \code{heading.headnote}, \code{boxhead},
#'   \code{stub_group}, \code{footnote}, and \code{sourcenote}. Can be specified
#'   as a single-length character vector with units of pixels
#'   (e.g., \code{12px}) or as a percentage (e.g., \code{80%}). If provided as a
#'   single-length numeric vector, it is assumed that the value is given in
#'   units of pixels. The \code{\link{px}()} and \code{\link{pct}()} helper
#'   functions can also be used to pass in numeric values and obtain values as
#'   pixel or percent units.
#' @param boxhead.font.weight,stub_group.font.weight the font weight of the
#'   \code{boxhead} and \code{stub_group} text element.
#' @param summary_row.text_transform an option to apply text transformations to
#' the label text in each summary row.
#' @param table.background.color,heading.background.color,boxhead.background.color,stub_group.background.color,summary_row.background.color,field.background.color
#'   background colors for the parent element \code{table} and the following
#'   child elements: \code{heading}, \code{boxhead}, \code{stub_group},
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
#' in each summary row.
#' @param footnote.padding,sourcenote.padding the amount of padding to apply to
#' the footnote and source note sections.
#' @param row.striping.include_stub an option for whether to include the stub
#' when striping rows.
#' @param row.striping.include_field an option for whether to include the field
#' when striping rows.
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
                        heading.headnote.font.size = NULL,
                        heading.border.bottom.style = NULL,
                        heading.border.bottom.width = NULL,
                        heading.border.bottom.color = NULL,
                        boxhead.background.color = NULL,
                        boxhead.font.size = NULL,
                        boxhead.font.weight = NULL,
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
                        row.striping.background.color = NULL,
                        row.striping.include.stub = NULL,
                        row.striping.include_field = NULL,
                        summary_row.background.color = NULL,
                        summary_row.padding = NULL,
                        summary_row.text_transform = NULL,
                        footnote.font.size = NULL,
                        footnote.padding = NULL,
                        sourcenote.font.size = NULL,
                        sourcenote.padding = NULL) {

  # Extract the `opts_df` data frame object from `data`
  opts_df <- attr(data, "opts_df", exact = TRUE)

  # table.font.size
  if (!is.null(table.font.size)) {

    if (is.numeric(table.font.size)) {
      table.font.size <- paste0(table.font.size, "px")
    }

    opts_df <- opts_df_set(
      opts_df, "table_font_size", table.font.size)
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

    opts_df <- opts_df_set(
      opts_df, "table_width", table.width)
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

  # heading.headnote.font.size
  if (!is.null(heading.headnote.font.size)) {

    if (is.numeric(heading.headnote.font.size)) {
      heading.headnote.font.size <- paste0(heading.headnote.font.size, "px")
    }

    opts_df <- opts_df_set(
      opts_df, "heading_headnote_font_size", heading.headnote.font.size)
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

  # boxhead.background.color
  if (!is.null(boxhead.background.color)) {

    opts_df <- opts_df_set(
      opts_df, "boxhead_background_color", boxhead.background.color)
  }

  # boxhead.font.size
  if (!is.null(boxhead.font.size)) {

    if (is.numeric(boxhead.font.size)) {
      boxhead.font.size <- paste0(boxhead.font.size, "px")
    }

    opts_df <- opts_df_set(
      opts_df, "boxhead_font_size", boxhead.font.size)
  }

  # boxhead.font.weight
  if (!is.null(boxhead.font.weight)) {

    opts_df <- opts_df_set(
      opts_df, "boxhead_font_weight", boxhead.font.weight)
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

    opts_df <- opts_df_set(
      opts_df, "row_padding", row.padding)
  }

  # row.striping.background.color
  if (!is.null(row.striping.background.color)) {

    opts_df <- opts_df_set(
      opts_df, "row_striping_background_color", row.striping.background.color)
  }

  # row.striping.include.stub
  if (!is.null(row.striping.include.stub)) {

    opts_df <- opts_df_set(
      opts_df, "row_striping_include_stub", row.striping.include.stub)
  }

  # row.striping.include_field
  if (!is.null(row.striping.include_field)) {

    opts_df <- opts_df_set(
      opts_df, "row_striping_include_field", row.striping.include_field)
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

    opts_df <- opts_df_set(
      opts_df, "summary_row_padding", summary_row.padding)
  }

  # summary_row.text_transform
  if (!is.null(summary_row.text_transform)) {

    opts_df <- opts_df_set(
      opts_df, "summary_row_text_transform", summary_row.text_transform)
  }

  # footnote.font.size
  if (!is.null(footnote.font.size)) {

    if (is.numeric(footnote.font.size)) {
      footnote.font.size <- paste0(footnote.font.size, "px")
    }

    opts_df <- opts_df_set(
      opts_df, "footnote_font_size", footnote.font.size)
  }

  # footnote.padding
  if (!is.null(footnote.padding)) {

    if (is.numeric(footnote.padding)) {
      footnote.padding <- paste0(footnote.padding, "px")
    }

    opts_df <- opts_df_set(
      opts_df, "footnote_padding", footnote.padding)
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

    opts_df <- opts_df_set(
      opts_df, "sourcenote_padding", sourcenote.padding)
  }

  # Write the modified `opts_df` to the `data` attribute
  attr(data, "opts_df") <- opts_df

  data
}
