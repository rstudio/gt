#' Modify gt table output options
#'
#' Change the options available in a table theme.
#' @inheritParams fmt_number
#' @param table.background.color the table's background color.
#' @param table.width the width of the table.
#' @param heading.background.color the background color of the table heading.
#' @param heading.title.font.size the font size of the title in the table
#' heading.
#' @param heading.title.background.color the background color of the title in
#' the table heading.
#' @param heading.headnote.font.size the font size of the headnote in the table
#' heading.
#' @param heading.headnote.background.color the background color of the headnote
#' in the table heading.
#' @param heading.border.top the parameters for the top border of the table
#' heading.
#' @param heading.border.bottom the parameters for the bottom border of the
#' table heading.
#' @param stub_heading.background.color the background color of the stub
#' heading.
#' @param stub_heading.border.top the parameters for the top border of the stub
#' heading.
#' @param stub_heading.border.bottom the parameters for the bottom border of the
#' stub heading.
#' @param stub_heading_field.background.color the background color of the stub
#' heading's field component.
#' @param stub_heading_field.border.top the parameters for the top border of the
#' stub heading's field component.
#' @param stub_heading_field.border.bottom the parameters for the bottom border
#' of the stub heading's field component.
#' @param field.border.top the parameters for the top border of the field.
#' @param field.border.bottom the parameters for the bottom border of the field.
#' @param row.padding the amount of padding in each row.
#' @param row.margin the size of the margin in each row.
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
                        table.background.color = NULL,
                        table.width = NULL,
                        heading.background.color = NULL,
                        heading.title.font.size = NULL,
                        heading.title.background.color = NULL,
                        heading.headnote.font.size = NULL,
                        heading.headnote.background.color = NULL,
                        heading.border.top = NULL,
                        heading.border.bottom = NULL,
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

  # table.background.color
  if (!is.null(table.background.color)) {

    opts_df[
      which(opts_df$parameter == "table_background_color"), 3] <-
      table.background.color
  }

  # row.striping.background.color
  if (!is.null(row.striping.background.color)) {

    opts_df[
      which(opts_df$parameter == "row_striping_background_color"), 3] <-
      row.striping.background.color
  }

  # Write the modified `opts_df` to the `data` attribute
  attr(data, "opts_df") <- opts_df

  data
}
