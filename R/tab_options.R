#' Modify the table output options
#'
#' Modify the options available in a table. These options are named by the
#' components, the subcomponents, and the element that can adjusted.
#' @inheritParams fmt_number
#' @param container.width,container.height The width and height of the table's
#'   container. Can be specified as a single-length character with units of
#'   pixels or as a percentage. If provided as a single-length numeric vector,
#'   it is assumed that the value is given in units of pixels. The [px()] and
#'   [pct()] helper functions can also be used to pass in numeric values and
#'   obtain values as pixel or percent units.
#' @param table.width The width of the table. Can be specified as a
#'   single-length character with units of pixels or as a percentage. If
#'   provided as a single-length numeric vector, it is assumed that the value is
#'   given in units of pixels. The [px()] and [pct()] helper functions can also
#'   be used to pass in numeric values and obtain values as pixel or percent
#'   units.
#' @param table.align The alignment of the table in its container. By default,
#'   this is `"center"`. Other options are `"left"` and `"right"`.
#' @param table.font.size,heading.title.font.size,heading.subtitle.font.size,column_labels.font.size,row_group.font.size,footnote.font.size,sourcenote.font.size
#'   Font sizes for the parent text element `table` and the following child
#'   elements: `heading.title`, `heading.subtitle`, `columns`, `row_group`,
#'   `footnote`, and `sourcenote`. Can be specified as a single-length character
#'   vector with units of pixels (e.g., `12px`) or as a percentage (e.g.,
#'   `80\%`). If provided as a single-length numeric vector, it is assumed that
#'   the value is given in units of pixels. The [px()] and [pct()] helper
#'   functions can also be used to pass in numeric values and obtain values as
#'   pixel or percent units.
#' @param column_labels.font.weight,row_group.font.weight the font weight of
#'   the `columns` and `row_group` text element.
#' @param summary_row.text_transform,grand_summary_row.text_transform an option
#'   to apply text transformations to the label text in each summary row.
#' @param table.background.color,heading.background.color,column_labels.background.color,row_group.background.color,summary_row.background.color,grand_summary_row.background.color
#'   background colors for the parent element `table` and the following child
#'   elements: `heading`, `columns`, `row_group`, `summary_row`, and
#'   `table_body`. A color name or a hexadecimal color code should be provided.
#' @param table.border.top.style,table.border.top.width,table.border.top.color
#'   The style, width, and color of the table's top border.
#' @param heading.border.bottom.style,heading.border.bottom.width,heading.border.bottom.color
#'   The style, width, and color of the heading's bottom border.
#' @param row_group.border.top.style,row_group.border.top.width,row_group.border.top.color
#'   The style, width, and color of the row group's top border.
#' @param row_group.border.bottom.style,row_group.border.bottom.width,row_group.border.bottom.color
#'   The style, width, and color of the row group's bottom border.
#' @param table_body.border.top.style,table_body.border.top.width,table_body.border.top.color
#'   The style, width, and color of the table body's top border.
#' @param table_body.border.bottom.style,table_body.border.bottom.width,table_body.border.bottom.color
#'   the style, width, and color of the table body's bottom border.
#' @param row.padding,summary_row.padding,grand_summary_row.padding the amount
#'   of padding in each row and in each type of summary row.
#' @param footnote.sep the separating characters between adjacent footnotes in
#'   the footnotes section. The default value produces a linebreak.
#' @param footnote.glyph The set of sequential figures or characters used to
#'   identify the footnotes. We can either supply the keyword `"numbers"` (the
#'   default, indicating that we want numeric glyphs), the keywords `"letters"`
#'   or `"LETTERS"` (indicating that we want letters as glyphs, either lowercase
#'   or uppercase), or, a vector of character values representing the series of
#'   glyphs. A series of glyphs is recycled when its usage goes beyond the
#'   length of the set. At each cycle, the glyphs are simply combined (e.g., `*`
#'   -> `**` -> `***`).
#' @param footnote.padding,sourcenote.padding The amount of padding to apply to
#'   the footnote and source note sections.
#' @param row.striping.include_stub An option for whether to include the stub
#'   when striping rows.
#' @param row.striping.include_table_body An option for whether to include the
#'   table body when striping rows.
#' @param column_labels.hidden An option to hide the column labels.
#' @return an object of class `gt_tbl`.
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
                        container.width = NULL,
                        container.height = NULL,
                        table.width = NULL,
                        table.align = NULL,
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
                        column_labels.hidden = NULL,
                        row_group.background.color = NULL,
                        row_group.font.size = NULL,
                        row_group.font.weight = NULL,
                        row_group.border.top.style = NULL,
                        row_group.border.top.width = NULL,
                        row_group.border.top.color = NULL,
                        row_group.border.bottom.style = NULL,
                        row_group.border.bottom.width = NULL,
                        row_group.border.bottom.color = NULL,
                        table_body.border.top.style = NULL,
                        table_body.border.top.width = NULL,
                        table_body.border.top.color = NULL,
                        table_body.border.bottom.style = NULL,
                        table_body.border.bottom.width = NULL,
                        table_body.border.bottom.color = NULL,
                        row.padding = NULL,
                        summary_row.background.color = NULL,
                        summary_row.padding = NULL,
                        summary_row.text_transform = NULL,
                        grand_summary_row.background.color = NULL,
                        grand_summary_row.padding = NULL,
                        grand_summary_row.text_transform = NULL,
                        footnote.sep = NULL,
                        footnote.glyph = NULL,
                        footnote.font.size = NULL,
                        footnote.padding = NULL,
                        sourcenote.font.size = NULL,
                        sourcenote.padding = NULL,
                        row.striping.include_stub = NULL,
                        row.striping.include_table_body = NULL) {

  # Extract the `opts_df` data frame object from `data`
  opts_df <- attr(data, "opts_df", exact = TRUE)

  # container.width
  if (!is.null(container.width)) {
    if (is.numeric(container.width)) container.width <- px(container.width)
    opts_df <- opts_df_set(opts_df, "container_width", container.width)
  }

  # container.height
  if (!is.null(container.height)) {
    if (is.numeric(container.height)) container.height <- px(container.height)
    opts_df <- opts_df_set(opts_df, "container_height", container.height)
  }

  # table.width
  if (!is.null(table.width)) {
    if (is.numeric(table.width)) table.width <- px(table.width)
    opts_df <- opts_df_set(opts_df, "table_width", table.width)
  }

  # table.align
  if (!is.null(table.align)) {

    if (table.align == "center") {
      opts_df <- opts_df_set(opts_df, "margin_left", "auto")
      opts_df <- opts_df_set(opts_df, "margin_right", "auto")
    }

    if (table.align == "left") {
      opts_df <- opts_df_set(opts_df, "margin_left", "0")
      opts_df <- opts_df_set(opts_df, "margin_right", "auto")
    }

    if (table.align == "right") {
      opts_df <- opts_df_set(opts_df, "margin_left", "auto")
      opts_df <- opts_df_set(opts_df, "margin_right", "0")
    }
  }

  # table.font.size
  if (!is.null(table.font.size)) {
    if (is.numeric(table.font.size)) table.font.size <- px(table.font.size)
    opts_df <- opts_df_set(opts_df, "table_font_size", table.font.size)
  }

  # table.background.color
  if (!is.null(table.background.color)) {
    opts_df <- opts_df_set(
      opts_df, "table_background_color", table.background.color)
  }

  # table.border.top.style
  if (!is.null(table.border.top.style)) {
    opts_df <- opts_df_set(
      opts_df, "table_border_top_style", table.border.top.style)
  }

  # table.border.top.width
  if (!is.null(table.border.top.width)) {
    if (is.numeric(table.border.top.width)) {
      table.border.top.width <- px(table.border.top.width)
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
      heading.title.font.size <- px(heading.title.font.size)
    }
    opts_df <- opts_df_set(
      opts_df, "heading_title_font_size", heading.title.font.size)
  }

  # heading.subtitle.font.size
  if (!is.null(heading.subtitle.font.size)) {
    if (is.numeric(heading.subtitle.font.size)) {
      heading.subtitle.font.size <- px(heading.subtitle.font.size)
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
      heading.border.bottom.width <- px(heading.border.bottom.width)
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
    opts_df <-
      opts_df_set(
        opts_df, "column_labels_background_color", column_labels.background.color
      )
  }

  # column_labels.font.size
  if (!is.null(column_labels.font.size)) {
    if (is.numeric(column_labels.font.size)) {
      column_labels.font.size <- px(column_labels.font.size)
    }
    opts_df <-
      opts_df_set(opts_df, "column_labels_font_size", column_labels.font.size)
  }

  # column_labels.font.weight
  if (!is.null(column_labels.font.weight)) {
    opts_df <-
      opts_df_set(opts_df, "column_labels_font_weight", column_labels.font.weight)
  }

  # column_labels.hidden
  if (!is.null(column_labels.hidden)) {
    opts_df <-
      opts_df_set(opts_df, "column_labels_hidden", column_labels.hidden)
  }

  # row_group.background.color
  if (!is.null(row_group.background.color)) {
    opts_df <-
      opts_df_set(
        opts_df, "row_group_background_color", row_group.background.color
      )
  }

  # row_group.font.size
  if (!is.null(row_group.font.size)) {
    if (is.numeric(row_group.font.size)) {
      row_group.font.size <- px(row_group.font.size)
    }
    opts_df <-
      opts_df_set(opts_df, "row_group_font_size", row_group.font.size)
  }

  # row_group.font.weight
  if (!is.null(row_group.font.weight)) {
    opts_df <-
      opts_df_set(opts_df, "row_group_font_weight", row_group.font.weight)
  }

  # row_group.border.top.style
  if (!is.null(row_group.border.top.style)) {
    opts_df <-
      opts_df_set(opts_df, "row_group_border_top_style", row_group.border.top.style)
  }

  # row_group.border.top.width
  if (!is.null(row_group.border.top.width)) {
    if (is.numeric(row_group.border.top.width)) {
      row_group.border.top.width <- px(row_group.border.top.width)
    }
    opts_df <-
      opts_df_set(opts_df, "row_group_border_top_width", row_group.border.top.width)
  }

  # row_group.border.top.color
  if (!is.null(row_group.border.top.color)) {
    opts_df <-
      opts_df_set(opts_df, "row_group_border_top_color", row_group.border.top.color)
  }

  # row_group.border.bottom.style
  if (!is.null(row_group.border.bottom.style)) {
    opts_df <-
      opts_df_set(
        opts_df, "row_group_border_bottom_style", row_group.border.bottom.style
      )
  }

  # row_group.border.bottom.width
  if (!is.null(row_group.border.bottom.width)) {
    if (is.numeric(row_group.border.bottom.width)) {
      row_group.border.bottom.width <- px(row_group.border.bottom.width)
    }
    opts_df <-
      opts_df_set(
        opts_df, "row_group_border_bottom_width", row_group.border.bottom.width
      )
  }

  # row_group.border.bottom.color
  if (!is.null(row_group.border.bottom.color)) {
    opts_df <-
      opts_df_set(
        opts_df, "row_group_border_bottom_color", row_group.border.bottom.color
      )
  }

  # table_body.border.top.style
  if (!is.null(table_body.border.top.style)) {
    opts_df <-
      opts_df_set(
        opts_df, "table_body_border_top_style", table_body.border.top.style
      )
  }

  # table_body.border.top.width
  if (!is.null(table_body.border.top.width)) {
    if (is.numeric(table_body.border.top.width)) {
      table_body.border.top.width <- px(table_body.border.top.width)
    }
    opts_df <-
      opts_df_set(
        opts_df, "table_body_border_top_width", table_body.border.top.width
      )
  }

  # table_body.border.top.color
  if (!is.null(table_body.border.top.color)) {
    opts_df <-
      opts_df_set(
        opts_df, "table_body_border_top_color", table_body.border.top.color
      )
  }

  # table_body.border.bottom.style
  if (!is.null(table_body.border.bottom.style)) {
    opts_df <-
      opts_df_set(
        opts_df, "table_body_border_bottom_style", table_body.border.bottom.style
      )
  }

  # table_body.border.bottom.width
  if (!is.null(table_body.border.bottom.width)) {
    if (is.numeric(table_body.border.bottom.width)) {
      table_body.border.bottom.width <- px(table_body.border.bottom.width)
    }
    opts_df <-
      opts_df_set(
        opts_df, "table_body_border_bottom_width", table_body.border.bottom.width
      )
  }

  # table_body.border.bottom.color
  if (!is.null(table_body.border.bottom.color)) {
    opts_df <-
      opts_df_set(
        opts_df, "table_body_border_bottom_color", table_body.border.bottom.color
      )
  }

  # row.padding
  if (!is.null(row.padding)) {
    if (is.numeric(row.padding)) row.padding <- px(row.padding)
    opts_df <- opts_df_set(opts_df, "row_padding", row.padding)
  }

  # summary_row.background.color
  if (!is.null(summary_row.background.color)) {
    opts_df <-
      opts_df_set(
        opts_df, "summary_row_background_color", summary_row.background.color
      )
  }

  # summary_row.padding
  if (!is.null(summary_row.padding)) {
    if (is.numeric(summary_row.padding)) {
      summary_row.padding <- px(summary_row.padding)
    }
    opts_df <- opts_df_set(opts_df, "summary_row_padding", summary_row.padding)
  }

  # summary_row.text_transform
  if (!is.null(summary_row.text_transform)) {
    opts_df <-
      opts_df_set(
        opts_df, "summary_row_text_transform", summary_row.text_transform
      )
  }

  # grand_summary_row.background.color
  if (!is.null(grand_summary_row.background.color)) {
    opts_df <-
      opts_df_set(
        opts_df, "grand_summary_row_background_color", grand_summary_row.background.color
      )
  }

  # grand_summary_row.padding
  if (!is.null(grand_summary_row.padding)) {
    if (is.numeric(grand_summary_row.padding)) {
      grand_summary_row.padding <- px(grand_summary_row.padding)
    }
    opts_df <-
      opts_df_set(
        opts_df, "grand_summary_row_padding", grand_summary_row.padding
      )
  }

  # grand_summary_row.text_transform
  if (!is.null(grand_summary_row.text_transform)) {
    opts_df <-
      opts_df_set(
        opts_df, "grand_summary_row_text_transform", grand_summary_row.text_transform
      )
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
      footnote.font.size <- px(footnote.font.size)
    }
    opts_df <- opts_df_set(opts_df, "footnote_font_size", footnote.font.size)
  }

  # footnote.padding
  if (!is.null(footnote.padding)) {
    if (is.numeric(footnote.padding)) footnote.padding <- px(footnote.padding)
    opts_df <- opts_df_set(opts_df, "footnote_padding", footnote.padding)
  }

  # sourcenote.font.size
  if (!is.null(sourcenote.font.size)) {
    if (is.numeric(sourcenote.font.size)) {
      sourcenote.font.size <- px(sourcenote.font.size)
    }
    opts_df <-
      opts_df_set(opts_df, "sourcenote_font_size", sourcenote.font.size)
  }

  # sourcenote.padding
  if (!is.null(sourcenote.padding)) {
    if (is.numeric(sourcenote.padding)) {
      sourcenote.padding <- px(sourcenote.padding)
    }
    opts_df <- opts_df_set(opts_df, "sourcenote_padding", sourcenote.padding)
  }

  # row.striping.include.stub
  if (!is.null(row.striping.include_stub)) {
    opts_df <-
      opts_df_set(
        opts_df, "row_striping_include_stub", row.striping.include_stub
      )
  }

  # row.striping.include_table_body
  if (!is.null(row.striping.include_table_body)) {
    opts_df <-
      opts_df_set(
        opts_df, "row_striping_include_table_body", row.striping.include_table_body
      )
  }

  # Write the modified `opts_df` to the `data` attribute
  attr(data, "opts_df") <- opts_df

  data
}
