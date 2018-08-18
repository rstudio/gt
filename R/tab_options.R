#' Modify the table output options
#'
#' Modify the options available in a table theme.
#' @inheritParams fmt_number
#' @param table.font.size the table text font size. Can be specified as a
#' single-length character with units of pixels or as a percentage. If provided
#' as a single-length numeric vector, it is assumed that the value is given in
#' units of pixels.
#' @param table.background.color the table background color.
#' @param table.width the width of the table. Can be specified as a
#' single-length character with units of pixels or as a percentage. If provided
#' as a single-length numeric vector, it is assumed that the value is given in
#' units of pixels.
#' @param table.border.top.style the style of the table's top border.
#' @param table.border.top.width the width of the table's top border.
#' @param table.border.top.color the color of the table's top border.
#' @param heading.background.color the background color of the table heading.
#' @param heading.title.font.size the font size of the title in the table
#' heading.
#' @param heading.headnote.font.size the font size of the headnote in the table
#' heading.
#' @param heading.border.bottom.style the style of the heading's bottom border.
#' @param heading.border.bottom.width the width of the heading's bottom border.
#' @param heading.border.bottom.color the color of the heading's bottom border.
#' @param boxhead.background.color the background color of the boxhead.
#' @param boxhead.font.size the font size of the boxhead labels.
#' @param boxhead.font.weight the font weight of the boxhead labels.
#' @param stub_group.background.color the background color of the stub
#' heading.
#' @param stub_group.font.size the font size of the boxhead labels.
#' @param stub_group.font.weight the font weight of the boxhead labels.
#' @param stub_group.border.top the parameters for the top border of the stub
#' heading.
#' @param stub_group.border.bottom the parameters for the bottom border of the
#' stub heading.
#' @param stub_group_field.background.color the background color of the stub
#' heading's field component.
#' @param stub_group_field.border.top the parameters for the top border of the
#' stub heading's field component.
#' @param stub_group_field.border.bottom the parameters for the bottom border
#' of the stub heading's field component.
#' @param field.border.top the parameters for the top border of the field.
#' @param field.border.bottom the parameters for the bottom border of the field.
#' @param row.padding the amount of padding in each row.
#' @param row.striping.color the color of the background for the striped rows.
#' @param row.striping.include_stub an option for whether to include the stub
#' when striping rows.
#' @param row.striping.include_field an option for whether to include the field
#' when striping rows.
#' @param summary_row.background.color the background color of the summary rows.
#' @param summary_row.padding the amount of padding in each summary row.
#' @param summary_row.text_transform an option to apply text transformations to
#' the label text in each summary row.
#' @param footnote.font.size the font size of the footnotes in the footnote
#' section.
#' @param footnote.padding the amount of padding to apply to the footnote
#' section.
#' @param sourcenote.font.size the font size of the source notes in the source
#' note section.
#' @param sourcenote.padding the amount of padding to apply to the source note
#' section.
#' @family table-part creation/modification functions
#' @export
tab_options <- function(data,
                        table.font.size = NULL,
                        table.background.color = NULL,
                        table.width = NULL,
                        table.border.top.style = NULL,
                        table.border.top.width = NULL,
                        table.border.top.color = NULL,
                        heading.background.color = NULL,
                        heading.title.font.size = NULL,
                        heading.headnote.font.size = NULL,
                        heading.border.top.style = NULL,
                        heading.border.top.width = NULL,
                        heading.border.top.color = NULL,
                        heading.border.bottom.style = NULL,
                        heading.border.bottom.width = NULL,
                        heading.border.bottom.color = NULL,
                        stub_heading.background.color = NULL,
                        stub_heading.border.top = NULL,
                        stub_heading.border.bottom = NULL,
                        stub_heading_field.background.color = NULL,
                        stub_heading_field.border.top = NULL,
                        stub_heading_field.border.bottom = NULL,
                        field.border.top = NULL,
                        field.border.bottom = NULL,
                        row.padding = NULL,
                        row.margin = NULL,
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

    opts_df <- opts_df_set(
      opts_df, "heading_title_font_size", heading.title.font.size)
  }

  # heading.border.top.style
  if (!is.null(heading.border.top.style)) {

    opts_df <- opts_df_set(
      opts_df, "heading_border_top_style", heading.border.top.style)
  }

  # heading.border.top.width
  if (!is.null(heading.border.top.width)) {

    opts_df <- opts_df_set(
      opts_df, "heading_border_top_width", heading.border.top.width)
  }

  # heading.border.top.color
  if (!is.null(heading.border.top.color)) {

    opts_df <- opts_df_set(
      opts_df, "heading_border_top_color", heading.border.top.color)
  }

  # heading.headnote.font.size
  if (!is.null(heading.headnote.font.size)) {

    opts_df <- opts_df_set(
      opts_df, "heading_headnote_font_size", heading.headnote.font.size)
  }

  # stub_heading.background.color
  if (!is.null(stub_heading.background.color)) {

    opts_df <- opts_df_set(
      opts_df, "stub_heading_background_color", stub_heading.background.color)
  }

  # stub_heading.border.top
  if (!is.null(stub_heading.border.top)) {

    opts_df <- opts_df_set(
      opts_df, "stub_heading_border_top", stub_heading.border.top)
  }

  # stub_heading.border.bottom
  if (!is.null(stub_heading.border.bottom)) {

    opts_df <- opts_df_set(
      opts_df, "stub_heading_border_bottom", stub_heading.border.bottom)
  }

  # stub_heading_field.background.color
  if (!is.null(stub_heading_field.background.color)) {

    opts_df <- opts_df_set(
      opts_df, "stub_heading_field_background_color", stub_heading_field.background.color)
  }

  # stub_heading_field.border.top
  if (!is.null(stub_heading_field.border.top)) {

    opts_df <- opts_df_set(
      opts_df, "stub_heading_field_border_top", stub_heading_field.border.top)
  }

  # stub_heading_field.border.bottom
  if (!is.null(stub_heading_field.border.bottom)) {

    opts_df <- opts_df_set(
      opts_df, "stub_heading_field_border_bottom", stub_heading_field.border.bottom)
  }

  # field.border.top
  if (!is.null(field.border.top)) {

    opts_df <- opts_df_set(
      opts_df, "field_border_top", field.border.top)
  }

  # field.border.bottom
  if (!is.null(field.border.bottom)) {

    opts_df <- opts_df_set(
      opts_df, "field_border_bottom", field.border.bottom)
  }

  # row.padding
  if (!is.null(row.padding)) {

    opts_df <- opts_df_set(
      opts_df, "row_padding", row.padding)
  }

  # row.margin
  if (!is.null(row.margin)) {

    opts_df <- opts_df_set(
      opts_df, "row_margin", row.margin)
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

    opts_df <- opts_df_set(
      opts_df, "footnote_font_size", footnote.font.size)
  }

  # footnote.padding
  if (!is.null(footnote.padding)) {

    opts_df <- opts_df_set(
      opts_df, "footnote_padding", footnote.padding)
  }

  # sourcenote.font.size
  if (!is.null(sourcenote.font.size)) {

    opts_df <- opts_df_set(
      opts_df, "sourcenote_font_size", sourcenote.font.size)
  }

  # sourcenote.padding
  if (!is.null(sourcenote.padding)) {

    opts_df <- opts_df_set(
      opts_df, "sourcenote_padding", sourcenote.padding)
  }

  # Write the modified `opts_df` to the `data` attribute
  attr(data, "opts_df") <- opts_df

  data
}
