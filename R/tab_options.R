#' Modify the table output options
#'
#' Modify the options available in a table. These options are named by the
#' components, the subcomponents, and the element that can adjusted.
#'
#' @inheritParams fmt_number
#' @param container.width,container.height The width and height of the table's
#'   container. Can be specified as a single-length character with units of
#'   pixels or as a percentage. If provided as a single-length numeric vector,
#'   it is assumed that the value is given in units of pixels. The [px()] and
#'   [pct()] helper functions can also be used to pass in numeric values and
#'   obtain values as pixel or percent units.
#' @param container.overflow.x,container.overflow.y Options to enable scrolling
#'   in the horizontal and vertical directions when the table content overflows
#'   the container dimensions. Using `TRUE` (the default for both) means that
#'   horizontal or vertical scrolling is enabled to view the entire table in
#'   those directions. With `FALSE`, the table may be clipped if the table width
#'   or height exceeds the `container.width` or `container.height`.
#' @param table.width The width of the table. Can be specified as a
#'   single-length character with units of pixels or as a percentage. If
#'   provided as a single-length numeric vector, it is assumed that the value is
#'   given in units of pixels. The [px()] and [pct()] helper functions can also
#'   be used to pass in numeric values and obtain values as pixel or percent
#'   units.
#' @param table.align The horizontal alignment of the table in its container. By
#'   default, this is `"center"`. Other options are `"left"` and `"right"`. This
#'   will automatically set `table.margin.left` and `table.margin.right` to the
#'   appropriate values.
#' @param table.margin.left,table.margin.right The size of the margins on the
#'   left and right of the table within the container. Can be specified as a
#'   single-length character with units of pixels or as a percentage. If
#'   provided as a single-length numeric vector, it is assumed that the value is
#'   given in units of pixels. The [px()] and [pct()] helper functions can also
#'   be used to pass in numeric values and obtain values as pixel or percent
#'   units. Using `table.margin.left` or `table.margin.right` will overwrite any
#'   values set by `table.align`.
#' @param table.background.color,heading.background.color,column_labels.background.color,row_group.background.color,stub.background.color,summary_row.background.color,grand_summary_row.background.color,footnotes.background.color,source_notes.background.color
#'   Background colors for the parent element `table` and the following child
#'   elements: `heading`, `column_labels`, `row_group`, `stub`, `summary_row`,
#'   `grand_summary_row`, `footnotes`, and `source_notes`. A color name or a
#'   hexadecimal color code should be provided.
#' @param table.font.color,table.font.color.light
#'   The text color used throughout the table. There are two variants:
#'   `table.font.color` is for text overlaid on lighter background colors, and
#'   `table.font.color.light` is automatically used when text needs to be
#'   overlaid on darker background colors. A color name or a hexadecimal color
#'   code should be provided.
#' @param table.font.size,heading.title.font.size,heading.subtitle.font.size,column_labels.font.size,row_group.font.size,stub.font.size,footnotes.font.size,source_notes.font.size
#'   The font sizes for the parent text element `table` and the following child
#'   elements: `heading.title`, `heading.subtitle`, `column_labels`,
#'   `row_group`, `stub`, `footnotes`, and `source_notes`. Can be specified as a
#'   single-length character vector with units of pixels (e.g., `12px`) or as a
#'   percentage (e.g., `80\%`). If provided as a single-length numeric vector,
#'   it is assumed that the value is given in units of pixels. The [px()] and
#'   [pct()] helper functions can also be used to pass in numeric values and
#'   obtain values as pixel or percentage units.
#' @param heading.title.font.weight,heading.subtitle.font.weight,column_labels.font.weight,row_group.font.weight,stub.font.weight
#'   The font weights of the `heading.title`, `heading.subtitle`,
#'   `column_labels`, `row_group`, and `stub` text elements. Can be a text-based
#'   keyword such as `"normal"`, `"bold"`, `"lighter"`, `"bolder"`, or, a
#'   numeric value between `1` and `1000`, inclusive. Note that only variable
#'   fonts may support the numeric mapping of weight.
#' @param heading.align Controls the horizontal alignment of the heading title
#'   and subtitle. We can either use `"center"`, `"left"`, or `"right"`.
#' @param column_labels.text_transform,row_group.text_transform,stub.text_transform,summary_row.text_transform,grand_summary_row.text_transform
#'   Options to apply text transformations to the `column_labels`, `row_group`,
#'   `stub`, `summary_row`, and `grand_summary_row` text elements. Either of the
#'   `"uppercase"`, `"lowercase"`, or `"capitalize"` keywords can be used.
#' @param data_row.padding,row_group.padding,summary_row.padding,grand_summary_row.padding,footnotes.padding,source_notes.padding
#'   The amount of vertical padding to incorporate in the `data_row`,
#'   `row_group`, `summary_row`, `grand_summary_row`, `footnotes`, and
#'   `source_notes` locations.
#' @param table.border.top.style,table.border.top.width,table.border.top.color,table.border.right.style,table.border.right.width,table.border.right.color,table.border.bottom.style,table.border.bottom.width,table.border.bottom.color,table.border.left.style,table.border.left.width,table.border.left.color
#'   The style, width, and color properties of the table's absolute top, right,
#'   bottom, and left borders.
#' @param heading.border.bottom.style,heading.border.bottom.width,heading.border.bottom.color
#'   The style, width, and color properties of the header's bottom border. This
#'   border shares space with that of the `column_labels` location. If the
#'   `width` of this border is larger, then it will be the visible border.
#' @param heading.border.lr.style,heading.border.lr.width,heading.border.lr.color
#'   The style, width, and color properties for the left and right borders of
#'   the `heading` location.
#' @param column_labels.border.top.style,column_labels.border.top.width,column_labels.border.top.color
#'   The style, width, and color properties for the top border of the
#'   `column_labels` location. This border shares space with that of the
#'   `heading` location. If dthe `width` of this border is larger, then it will
#'   be the visible border.
#' @param column_labels.border.bottom.style,column_labels.border.bottom.width,column_labels.border.bottom.color
#'   The style, width, and color properties for the bottom border of the
#'   `column_labels` location.
#' @param column_labels.border.lr.style,column_labels.border.lr.width,column_labels.border.lr.color
#'   The style, width, and color properties for the left and right borders of
#'   the `column_labels` location.
#' @param column_labels.hidden An option to hide the column labels. If providing
#'   `TRUE` then the entire `column_labels` location won't be seen and the table
#'   header (if present) will collapse downward.
#' @param row_group.border.top.style,row_group.border.top.width,row_group.border.top.color,row_group.border.bottom.style,row_group.border.bottom.width,row_group.border.bottom.color,row_group.border.left.style,row_group.border.left.width,row_group.border.left.color,row_group.border.right.style,row_group.border.right.width,row_group.border.right.color
#'   The style, width, and color properties for all top, bottom, left, and right
#'   borders of the `row_group` location.
#' @param table_body.hlines.style,table_body.hlines.width,table_body.hlines.color,table_body.vlines.style,table_body.vlines.width,table_body.vlines.color
#'   The style, width, and color properties for all horizontal lines ('hlines')
#'   and vertical lines ('vlines') in the `table_body`.
#' @param table_body.border.top.style,table_body.border.top.width,table_body.border.top.color,table_body.border.bottom.style,table_body.border.bottom.width,table_body.border.bottom.color
#'   The style, width, and color properties for all top and bottom borders of
#'   the `table_body` location.
#' @param stub.border.style,stub.border.width,stub.border.color
#'   The style, width, and color properties for the vertical border of the table
#'   stub.
#' @param summary_row.border.style,summary_row.border.width,summary_row.border.color
#'   The style, width, and color properties for all horizontal borders of the
#'   `summary_row` location.
#' @param grand_summary_row.border.style,grand_summary_row.border.width,grand_summary_row.border.color
#'   The style, width, and color properties for the top borders of the
#'   `grand_summary_row` location.
#' @param footnotes.border.bottom.style,footnotes.border.bottom.width,footnotes.border.bottom.color
#'   The style, width, and color properties for the bottom border of the
#'   `footnotes` location.
#' @param footnotes.border.lr.style,footnotes.border.lr.width,footnotes.border.lr.color
#'   The style, width, and color properties for the left and right borders of
#'   the `footnotes` location.
#' @param footnotes.sep The separating characters between adjacent footnotes in
#'   the footnotes section. The default value produces a linebreak.
#' @param footnotes.marks The set of sequential marks used to reference and
#'   identify each of the footnotes (same input as the [opt_footnote_marks()]
#'   function. We can supply a vector that represents the series of footnote
#'   marks. This vector is recycled when its usage goes beyond the length of the
#'   set. At each cycle, the marks are simply combined (e.g., `*` -> `**` ->
#'   `***`). The option exists for providing keywords for certain types of
#'   footnote marks. The keyword `"numbers"` (the default, indicating that we
#'   want to use numeric marks). We can use lowercase `"letters"` or uppercase
#'   `"LETTERS"`. There is the option for using a traditional symbol set where
#'   `"standard"` provides four symbols, and, `"extended"` adds two more
#'   symbols, making six.
#' @param source_notes.border.bottom.style,source_notes.border.bottom.width,source_notes.border.bottom.color
#'   The style, width, and color properties for the bottom border of the
#'   `source_notes` location.
#' @param source_notes.border.lr.style,source_notes.border.lr.width,source_notes.border.lr.color
#'   The style, width, and color properties for the left and right borders of
#'   the `source_notes` location.
#' @param row.striping.background_color The background color for striped table
#'   body rows. A color name or a hexadecimal color code should be provided.
#' @param row.striping.include_stub An option for whether to include the stub
#'   when striping rows.
#' @param row.striping.include_table_body An option for whether to include the
#'   table body when striping rows.
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
#' # Use letters as the marks for footnote
#' # references; also, separate footnotes in
#' # the footer by spaces instead of newlines
#' tab_4 <-
#'   tab_1 %>%
#'   tab_options(
#'     footnotes.sep = " ",
#'     footnotes.marks = letters
#'   )
#'
#' # Change the padding of data rows to 5px
#' tab_5 <-
#'   tab_1 %>%
#'   tab_options(
#'     data_row.padding = px(5)
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
#'
#' @export
tab_options <- function(data,
                        container.width = NULL,
                        container.height = NULL,
                        container.overflow.x = NULL,
                        container.overflow.y = NULL,
                        table.width = NULL,
                        table.align = NULL,
                        table.margin.left = NULL,
                        table.margin.right = NULL,
                        table.background.color = NULL,
                        table.font.color = NULL,
                        table.font.color.light = NULL,
                        table.font.size = NULL,
                        table.border.top.style = NULL,
                        table.border.top.width = NULL,
                        table.border.top.color = NULL,
                        table.border.right.style = NULL,
                        table.border.right.width = NULL,
                        table.border.right.color = NULL,
                        table.border.bottom.style = NULL,
                        table.border.bottom.width = NULL,
                        table.border.bottom.color = NULL,
                        table.border.left.style = NULL,
                        table.border.left.width = NULL,
                        table.border.left.color = NULL,
                        heading.background.color = NULL,
                        heading.align = NULL,
                        heading.title.font.size = NULL,
                        heading.title.font.weight = NULL,
                        heading.subtitle.font.size = NULL,
                        heading.subtitle.font.weight = NULL,
                        heading.border.bottom.style = NULL,
                        heading.border.bottom.width = NULL,
                        heading.border.bottom.color = NULL,
                        heading.border.lr.style = NULL,
                        heading.border.lr.width = NULL,
                        heading.border.lr.color = NULL,
                        column_labels.background.color = NULL,
                        column_labels.font.size = NULL,
                        column_labels.font.weight = NULL,
                        column_labels.text_transform = NULL,
                        column_labels.border.top.style = NULL,
                        column_labels.border.top.width = NULL,
                        column_labels.border.top.color = NULL,
                        column_labels.border.bottom.style = NULL,
                        column_labels.border.bottom.width = NULL,
                        column_labels.border.bottom.color = NULL,
                        column_labels.border.lr.style = NULL,
                        column_labels.border.lr.width = NULL,
                        column_labels.border.lr.color = NULL,
                        column_labels.hidden = NULL,
                        row_group.background.color = NULL,
                        row_group.font.size = NULL,
                        row_group.font.weight = NULL,
                        row_group.text_transform = NULL,
                        row_group.padding = NULL,
                        row_group.border.top.style = NULL,
                        row_group.border.top.width = NULL,
                        row_group.border.top.color = NULL,
                        row_group.border.bottom.style = NULL,
                        row_group.border.bottom.width = NULL,
                        row_group.border.bottom.color = NULL,
                        row_group.border.left.style = NULL,
                        row_group.border.left.width = NULL,
                        row_group.border.left.color = NULL,
                        row_group.border.right.style = NULL,
                        row_group.border.right.width = NULL,
                        row_group.border.right.color = NULL,
                        table_body.hlines.style = NULL,
                        table_body.hlines.width = NULL,
                        table_body.hlines.color = NULL,
                        table_body.vlines.style = NULL,
                        table_body.vlines.width = NULL,
                        table_body.vlines.color = NULL,
                        table_body.border.top.style = NULL,
                        table_body.border.top.width = NULL,
                        table_body.border.top.color = NULL,
                        table_body.border.bottom.style = NULL,
                        table_body.border.bottom.width = NULL,
                        table_body.border.bottom.color = NULL,
                        stub.background.color = NULL,
                        stub.font.size = NULL,
                        stub.font.weight = NULL,
                        stub.text_transform = NULL,
                        stub.border.style = NULL,
                        stub.border.width = NULL,
                        stub.border.color = NULL,
                        data_row.padding = NULL,
                        summary_row.background.color = NULL,
                        summary_row.text_transform = NULL,
                        summary_row.padding = NULL,
                        summary_row.border.style = NULL,
                        summary_row.border.width = NULL,
                        summary_row.border.color = NULL,
                        grand_summary_row.background.color = NULL,
                        grand_summary_row.text_transform = NULL,
                        grand_summary_row.padding = NULL,
                        grand_summary_row.border.style = NULL,
                        grand_summary_row.border.width = NULL,
                        grand_summary_row.border.color = NULL,
                        footnotes.background.color = NULL,
                        footnotes.font.size = NULL,
                        footnotes.padding = NULL,
                        footnotes.border.bottom.style = NULL,
                        footnotes.border.bottom.width = NULL,
                        footnotes.border.bottom.color = NULL,
                        footnotes.border.lr.style = NULL,
                        footnotes.border.lr.width = NULL,
                        footnotes.border.lr.color = NULL,
                        footnotes.sep = NULL,
                        footnotes.marks = NULL,
                        source_notes.background.color = NULL,
                        source_notes.font.size = NULL,
                        source_notes.padding = NULL,
                        source_notes.border.bottom.style = NULL,
                        source_notes.border.bottom.width = NULL,
                        source_notes.border.bottom.color = NULL,
                        source_notes.border.lr.style = NULL,
                        source_notes.border.lr.width = NULL,
                        source_notes.border.lr.color = NULL,
                        row.striping.background_color = NULL,
                        row.striping.include_stub = NULL,
                        row.striping.include_table_body = NULL) {

  # TODO: add helper functions to divide the options into those by location
  # TODO: add helper functions to divide the options into those by parameter

  # Extract the options table from `data`
  opts_df <- dt_options_get(data = data)

  arg_names <- formals(tab_options) %>% names() %>% base::setdiff("data")
  arg_vals <- mget(arg_names)
  arg_vals <- arg_vals[!vapply(arg_vals, FUN = is.null, FUN.VALUE = logical(1))]
  arg_vals <- arg_vals %>% set_super_options()

  new_df <-
    dplyr::tibble(
      parameter = names(arg_vals) %>% tidy_gsub(".", "_", fixed = TRUE),
      value = unname(arg_vals)) %>%
    dplyr::left_join(
      opts_df %>% dplyr::select(parameter, type),
      by = "parameter"
    ) %>%
    dplyr::mutate(
      value = mapply(
        preprocess_tab_option,
        option = value, var_name = parameter, type = type,
        SIMPLIFY = FALSE)
    ) %>%
    dplyr::select(-type)

  # This rearranges the rows in the `opts_df` table, but this
  # shouldn't be a problem
  opts_df <-
    dplyr::bind_rows(
      new_df %>%
        dplyr::inner_join(
          opts_df %>% dplyr::select(-value),
          by = "parameter"
        ),
      opts_df %>%
        dplyr::anti_join(new_df, by = "parameter")
    )

  # Write the modified options table back to `data`
  data <- dt_options_set(data = data, options = opts_df)

  data
}

preprocess_tab_option <- function(option, var_name, type) {

  # Perform pre-processing on the option depending on `type`
  option <-
    switch(type,
           overflow = {
             if (isTRUE(option)) {
               "auto"
             } else if (isFALSE(option)) {
               "hidden"
             } else {
               option
             }
           },
           px = {
             if (is.numeric(option)) {
               px(option)
             } else {
               option
             }
           },
           option
    )

  # Perform checkmate assertions by `type`
  switch(type,
         logical = checkmate::assert_logical(
           option, len = 1, any.missing = FALSE, .var.name = var_name),
         overflow =,
         px =,
         value = checkmate::assert_character(
           option, len = 1, any.missing = FALSE, .var.name = var_name),
         values = checkmate::assert_character(
           option, min.len = 1, any.missing = FALSE, .var.name = var_name)
  )

  option
}

set_super_options <- function(arg_vals) {

  if ("table.align" %in% names(arg_vals)) {

    table_align_val <- arg_vals$table.align

    arg_vals$table.align <- NULL

    if (!(table_align_val %in% c("left", "center", "right"))) {
      stop("The chosen option for `table.align` (`", table_align_val, "`) is invalid\n",
           " * We can use either of `left`, `center`, or `right`.",
           call. = FALSE)
    }

    arg_vals$table.margin.left <- arg_vals$table.margin.left %||%
      switch(table_align_val,
             center = "auto",
             left = "0",
             right = "auto")

    arg_vals$table.margin.right <- arg_vals$table.margin.right %||%
      switch(table_align_val,
             center = "auto",
             left = "auto",
             right = "0")
  }

  arg_vals
}
