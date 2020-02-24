#' Option to modify the set of footnote marks
#'
#' Alter the footnote marks for any footnotes that may be present in the table.
#' Either a vector of marks can be provided (including Unicode characters), or,
#' a specific keyword could be used to signify a preset sequence. This function
#' serves as a shortcut for using `tab_options(footnotes.marks = {marks})`
#'
#' We can supply a vector of that will represent the series of marks.
#' The series of footnote marks is recycled when its usage goes beyond the
#' length of the set. At each cycle, the marks are simply doubled, tripled, and
#' so on (e.g., `*` -> `**` -> `***`). The option exists for providing keywords
#' for certain types of footnote marks. The keywords are:
#'
#' \itemize{
#' \item `"numbers"`: numeric marks, they begin from 1 and these marks are not
#' subject to recycling behavior
#' \item `"letters"`: miniscule alphabetic marks, internally uses the `letters`
#' vector
#' which contains 26 lowercase letters of the Roman alphabet
#' \item `"LETTERS"`: majuscule alphabetic marks, using the `LETTERS` vector
#' which has 26 uppercase letters of the Roman alphabet
#' \item `"standard"`: symbolic marks, four symbols in total
#' \item `"extended"`: symbolic marks, extends the standard set by adding two
#' more symbols, making six
#' }
#'
#' @inheritParams fmt_number
#' @param marks Either a vector (that will represent the series of marks) or a
#'   keyword that represents a preset sequence of marks. The valid keywords are:
#'   `"numbers"` (for numeric marks), `"letters"` and `"LETTERS"` (for lowercase
#'   and uppercase alphabetic marks), `"standard"` (for a traditional set of
#'   four symbol marks), and `"extended"` (which adds two more symbols to the
#'   standard set).
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `sza` to create a gt table,
#' # adding three footnotes; call
#' # `opt_footnote_marks()` to specify
#' # which footnote marks to use
#' tab_1 <-
#'   sza %>%
#'   dplyr::group_by(latitude, tst) %>%
#'   dplyr::summarize(
#'     SZA.Max = max(sza),
#'     SZA.Min = min(sza, na.rm = TRUE)
#'   ) %>%
#'   dplyr::ungroup() %>%
#'   dplyr::filter(latitude == 30, !is.infinite(SZA.Min)) %>%
#'   dplyr::select(-latitude) %>%
#'   gt(rowname_col = "tst") %>%
#'   tab_spanner_delim(delim = ".") %>%
#'   fmt_missing(
#'     columns = everything(),
#'     missing_text = "90+"
#'   ) %>%
#'   tab_stubhead("TST") %>%
#'   tab_footnote(
#'     footnote = "True solar time.",
#'     locations = cells_stubhead()
#'   ) %>%
#'   tab_footnote(
#'     footnote = "Solar zenith angle.",
#'     locations = cells_column_spanners(spanners = "SZA")
#'   ) %>%
#'   tab_footnote(
#'     footnote = "The Lowest SZA.",
#'     locations = cells_stub(rows = "1200")
#'   ) %>%
#'   opt_footnote_marks(marks = "standard")
#'
#' @section Figures:
#' \if{html}{\figure{man_opt_footnote_marks_1.svg}{options: width=100\%}}
#'
#' @family table option functions
#'
#' @export
opt_footnote_marks <- function(data,
                               marks = NULL) {

  if (!is.null(marks)) {
    data <- tab_options(data, footnotes.marks = marks)
  }

  data
}

#' Option to remove the top and bottom borders
#'
#' The top and bottom borders of a **gt** table can be removed entirely by
#' using the `opt_remove_top_bottom_borders()` function. The definition of what
#' constitutes a top and bottom border depends on which table parts are present
#' at the top and bottom (e.g., header, table columns, a footnote block, etc.).
#' Regardless of the available parts, there won't be any top of bottom
#' horizontal lines after using this function. This function serves as a
#' convenient shortcut for `<gt_tbl> %>%
#' tab_options(table.border.top.style = "hidden") %>%
#' tab_options(table.border.bottom.style = "hidden")`.
#'
#' @inheritParams fmt_number
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table with
#' # a number of table parts added; next, we
#' # remove the top and bottom borders with
#' # `opt_remove_top_bottom_borders()`
#' tab_1 <-
#'   exibble %>%
#'   gt(rowname_col = "row", groupname_col = "group") %>%
#'   summary_rows(
#'     groups = "grp_a",
#'     columns = vars(num, currency),
#'     fns = list(
#'       min = ~min(., na.rm = TRUE),
#'       max = ~max(., na.rm = TRUE)
#'     )) %>%
#'   grand_summary_rows(
#'     columns = vars(currency),
#'     fns = list(
#'       total = ~sum(., na.rm = TRUE)
#'     )) %>%
#'   tab_source_note(source_note = "This is a source note.") %>%
#'   tab_footnote(
#'     footnote = "This is a footnote.",
#'     locations = cells_body(columns = 1, rows = 1)
#'   ) %>%
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) %>%
#'   opt_remove_top_bottom_borders()
#'
#' @section Figures:
#' \if{html}{\figure{man_opt_remove_top_bottom_borders_1.svg}{options: width=100\%}}
#'
#' @family table option functions
#'
#' @export
opt_remove_top_bottom_borders <- function(data) {

  tab_options(
    data,
    table.border.top.style = "hidden",
    table.border.bottom.style = "hidden"
  )
}

#' Option to remove all lines from a table
#'
#' The `opt_lineless()` function effectively produces a table with no visible
#' lines. This is great as a blank slate for additive styling with
#' [tab_options()] or [tab_style()]. Or, use it in those cases where you are
#' using **gt** tables mostly for layout purposes.
#'
#' @inheritParams fmt_number
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table with
#' # a number of table parts added; then, use
#' # the `opt_lineless()` function to get
#' # an ultra-minimal table with no lining
#' tab_1 <-
#'   exibble %>%
#'   gt(rowname_col = "row", groupname_col = "group") %>%
#'   summary_rows(
#'     groups = "grp_a",
#'     columns = vars(num, currency),
#'     fns = list(
#'       min = ~min(., na.rm = TRUE),
#'       max = ~max(., na.rm = TRUE)
#'     )) %>%
#'   grand_summary_rows(
#'     columns = vars(currency),
#'     fns = list(
#'       total = ~sum(., na.rm = TRUE)
#'     )) %>%
#'   tab_source_note(source_note = "This is a source note.") %>%
#'   tab_footnote(
#'     footnote = "This is a footnote.",
#'     locations = cells_body(columns = 1, rows = 1)
#'   ) %>%
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) %>%
#'   opt_lineless()
#'
#' @section Figures:
#' \if{html}{\figure{man_preset_lineless_1.svg}{options: width=100\%}}
#'
#' @family table option functions
#'
#' @export
opt_lineless <- function(data) {

  tab_options(
    data,
    table.border.top.style = "none",
    heading.border.bottom.style = "none",
    column_labels.vlines.style = "none",
    column_labels.border.top.style = "none",
    column_labels.border.bottom.style = "none",
    row_group.border.top.style = "none",
    row_group.border.bottom.style = "none",
    stub.border.style = "none",
    table_body.border.top.style = "none",
    table_body.border.bottom.style = "none",
    table_body.hlines.style = "none",
    summary_row.border.style = "none",
    grand_summary_row.border.style = "none",
    footnotes.border.bottom.style = "none",
    source_notes.border.bottom.style = "none",
    table.border.bottom.style = "none"
  )
}


#' Option to create lines everywhere in a table
#'
#' The `opt_fully_lined()` function yields a table where all possible lines are
#' visible. This is great if you want to start off with lots of lines and
#' subtract just a few of them with [tab_options()] or [tab_style()]. Or, use it
#' in those cases where you absolutely need to have boundaries between pieces of
#' information.
#'
#' @inheritParams fmt_number
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table with
#' # a number of table parts added; then, use
#' # the `opt_fully_lined()` function to
#' # haves lines everywhere there can possibly
#' # be lines
#' tab_1 <-
#'   exibble %>%
#'   gt(rowname_col = "row", groupname_col = "group") %>%
#'   summary_rows(
#'     groups = "grp_a",
#'     columns = vars(num, currency),
#'     fns = list(
#'       min = ~min(., na.rm = TRUE),
#'       max = ~max(., na.rm = TRUE)
#'     )) %>%
#'   grand_summary_rows(
#'     columns = vars(currency),
#'     fns = list(
#'       total = ~sum(., na.rm = TRUE)
#'     )) %>%
#'   tab_source_note(source_note = "This is a source note.") %>%
#'   tab_footnote(
#'     footnote = "This is a footnote.",
#'     locations = cells_body(columns = 1, rows = 1)
#'   ) %>%
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) %>%
#'   opt_fully_lined()
#'
#' @section Figures:
#' \if{html}{\figure{man_preset_fully_lined_1.svg}{options: width=100\%}}
#'
#' @family table option functions
#'
#' @export
opt_fully_lined <- function(data) {

  tab_options(
    data,
    table.border.top.style = "solid",
    table.border.left.style = "solid",
    table.border.right.style = "solid",
    heading.border.bottom.style = "solid",
    heading.border.lr.style = "solid",
    column_labels.vlines.style = "solid",
    column_labels.border.top.style = "solid",
    column_labels.border.bottom.style = "solid",
    column_labels.border.lr.style = "solid",
    row_group.border.top.style = "solid",
    row_group.border.bottom.style = "solid",
    row_group.border.left.style = "solid",
    row_group.border.right.style = "solid",
    stub.border.style = "solid",
    table_body.border.top.style = "solid",
    table_body.border.bottom.style = "solid",
    table_body.hlines.style = "solid",
    table_body.vlines.style = "solid",
    summary_row.border.style = "solid",
    footnotes.border.bottom.style = "solid",
    footnotes.border.lr.style = "solid",
    source_notes.border.lr.style = "solid",
    table.border.bottom.style = "solid"
  )
}

#' Option to add row striping
#'
#' By default, a **gt** table does not have row striping enabled. However,
#' this function allows us to easily enable striped rows in the table body. This
#' function serves as a convenient shortcut for `<gt_tbl> %>%
#' tab_options(row.striping.include_table_body = TRUE)`.
#'
#' @inheritParams fmt_number
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table with
#' # a number of table parts added; next, we
#' # add row striping to every second row with
#' # the `opt_add_row_striping()` function
#' tab_1 <-
#'   exibble %>%
#'   gt(rowname_col = "row", groupname_col = "group") %>%
#'   summary_rows(
#'     groups = "grp_a",
#'     columns = vars(num, currency),
#'     fns = list(
#'       min = ~min(., na.rm = TRUE),
#'       max = ~max(., na.rm = TRUE)
#'     )) %>%
#'   grand_summary_rows(
#'     columns = vars(currency),
#'     fns = list(
#'       total = ~sum(., na.rm = TRUE)
#'     )) %>%
#'   tab_source_note(source_note = "This is a source note.") %>%
#'   tab_footnote(
#'     footnote = "This is a footnote.",
#'     locations = cells_body(columns = 1, rows = 1)
#'   ) %>%
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) %>%
#'   opt_add_row_striping()
#'
#' @section Figures:
#' \if{html}{\figure{man_opt_add_row_striping_1.svg}{options: width=100\%}}
#'
#' @family table option functions
#'
#' @export
opt_add_row_striping <- function(data) {

  tab_options(data, row.striping.include_table_body = TRUE)
}

#' Option to align the table header
#'
#' By default, a table header added to a \pkg{gt} table has center alignment
#' for both the title and the subtitle elements. This function allows us to
#' easily set the horizontal alignment of the title and subtitle to the left
#' or right by using the `"align"` argument. This function serves as a
#' convenient shortcut for `<gt_tbl> %>% tab_options(heading.align = <align>)`.
#'
#' @inheritParams fmt_number
#' @param align The alignment of the title and subtitle elements in the table
#' header. Options are `"center"` (the default), `"left"`, or `"right"`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table with
#' # a number of table parts added; the header
#' # (consisting of the title and the subtitle)
#' # are to be aligned to the left with the
#' # `opt_align_table_header()` function
#' tab_1 <-
#'   exibble %>%
#'   gt(rowname_col = "row", groupname_col = "group") %>%
#'   summary_rows(
#'     groups = "grp_a",
#'     columns = vars(num, currency),
#'     fns = list(
#'       min = ~min(., na.rm = TRUE),
#'       max = ~max(., na.rm = TRUE)
#'     )) %>%
#'   grand_summary_rows(
#'     columns = vars(currency),
#'     fns = list(
#'       total = ~sum(., na.rm = TRUE)
#'     )) %>%
#'   tab_source_note(source_note = "This is a source note.") %>%
#'   tab_footnote(
#'     footnote = "This is a footnote.",
#'     locations = cells_body(columns = 1, rows = 1)
#'   ) %>%
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) %>%
#'   opt_align_table_header(align = "left")
#'
#' @section Figures:
#' \if{html}{\figure{man_opt_align_table_header_1.svg}{options: width=100\%}}
#'
#' @family table option functions
#'
#' @export
opt_align_table_header <- function(data,
                                   align = c("center", "left", "right")) {

  align <- match.arg(align)

  # Ensure that the value for `align` is valid
  if (!is.character(align) && length(align) != 1) {
    stop("The value for `align` must be a single character value.",
         call. = FALSE)
  }

  # Ensure that an allowed value for `align` is provided
  if (!(align %in% c("left", "center", "right"))) {
    stop("The allowed values for `align` are `left`, `center`, and `right`.",
         call. = FALSE)
  }

  tab_options(data, heading.align = align)
}

#' Option to use all caps in select table locations
#'
#' Sometimes an all-capitalized look is suitable for a table. With the
#' `opt_all_caps()` function, we can transform characters in the column labels,
#' the stub, and in all row groups in this way (and there's control over which
#' of these locations are transformed).
#'
#' This function serves as a convenient shortcut for `<gt_tbl> %>%
#' tab_options(<location>.text_transform = "uppercase", <location>.font.size =
#' pct(80), <location>.font.weight = "bolder")` (for all `locations` selected).
#'
#' @inheritParams fmt_number
#' @param locations Which locations should undergo this text transformation? By
#'   default it includes all of the `"column_labels"`, the `"stub"`, and the
#'   `"row_group"` locations. However, we could just choose one or two of those.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table with
#' # a number of table parts added; all text
#' # in the column labels, the stub, and in
#' # all row groups is to be transformed to
#' # all caps using `opt_all_caps()`
#' tab_1 <-
#'   exibble %>%
#'   gt(rowname_col = "row", groupname_col = "group") %>%
#'   summary_rows(
#'     groups = "grp_a",
#'     columns = vars(num, currency),
#'     fns = list(
#'       min = ~min(., na.rm = TRUE),
#'       max = ~max(., na.rm = TRUE)
#'     )) %>%
#'   grand_summary_rows(
#'     columns = vars(currency),
#'     fns = list(
#'       total = ~sum(., na.rm = TRUE)
#'     )) %>%
#'   tab_source_note(source_note = "This is a source note.") %>%
#'   tab_footnote(
#'     footnote = "This is a footnote.",
#'     locations = cells_body(columns = 1, rows = 1)
#'   ) %>%
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) %>%
#'   opt_all_caps()
#'
#' @section Figures:
#' \if{html}{\figure{man_opt_all_caps_1.svg}{options: width=100\%}}
#'
#' @family table option functions
#'
#' @export
opt_all_caps <- function(data,
                         locations = c("column_labels", "stub", "row_group")) {

  # Ensure that all named locations are valid
  if (!all(locations %in% c("column_labels", "stub", "row_group"))) {
    stop("The available locations are `column_labels`, `stub`, and `row_group`.",
         call. = FALSE)
  }

  if ("column_labels" %in% locations) {

    data <-
      tab_options(
        data,
        column_labels.text_transform = "uppercase",
        column_labels.font.size = pct(80),
        column_labels.font.weight = "bolder"
      )
  }

  if ("stub" %in% locations) {

    data <-
      tab_options(
        data,
        stub.text_transform = "uppercase",
        stub.font.size = pct(80),
        stub.font.weight = "bolder"
      )
  }

  if ("row_group" %in% locations) {

    data <-
      tab_options(
        data,
        row_group.text_transform = "uppercase",
        row_group.font.size = pct(80),
        row_group.font.weight = "bolder"
      )
  }

  data
}

#' Option to wrap an outline around the entire table
#'
#' This function puts an outline of consistent `style`, `width`, and `color`
#' around the entire table. It'll write over any existing outside lines so long
#' as the `width` is larger that of the existing lines.
#'
#' This function serves as a convenient shortcut for a large number of options
#' from the [tab_options()] function. The complementary `opt_*()` function is
#' [opt_remove_table_outline()], which removes any table outlines.
#'
#' @inheritParams fmt_number
#' @param style,width,color The style, width, and color properties for the table
#'   outline. By default, these are `"solid"`, `px(3)` (or, `"3px"`), and
#'   `"#D3D3D3"`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table with
#' # a number of table parts added; have an
#' # outline wrap around the entire table by
#' # using `opt_add_table_outline()`
#' tab_1 <-
#'   exibble %>%
#'   gt(rowname_col = "row", groupname_col = "group") %>%
#'   summary_rows(
#'     groups = "grp_a",
#'     columns = vars(num, currency),
#'     fns = list(
#'       min = ~min(., na.rm = TRUE),
#'       max = ~max(., na.rm = TRUE)
#'     )) %>%
#'   grand_summary_rows(
#'     columns = vars(currency),
#'     fns = list(
#'       total = ~sum(., na.rm = TRUE)
#'     )) %>%
#'   tab_source_note(source_note = "This is a source note.") %>%
#'   tab_footnote(
#'     footnote = "This is a footnote.",
#'     locations = cells_body(columns = 1, rows = 1)
#'   ) %>%
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) %>%
#'   opt_add_table_outline()
#'
#' @section Figures:
#' \if{html}{\figure{man_opt_add_table_outline_1.svg}{options: width=100\%}}
#'
#' @family table option functions
#'
#' @export
opt_add_table_outline <- function(data,
                                  style = "solid",
                                  width = px(3),
                                  color = "#D3D3D3") {

  tab_options(
    data,
    table.border.top.style = style,
    table.border.top.width = width,
    table.border.top.color = color,
    table.border.bottom.style = style,
    table.border.bottom.width = width,
    table.border.bottom.color = color,
    table.border.left.style = style,
    table.border.left.width = width,
    table.border.left.color = color,
    table.border.right.style = style,
    table.border.right.width = width,
    table.border.right.color = color,
    heading.border.lr.style = style,
    heading.border.lr.width = width,
    heading.border.lr.color = color,
    column_labels.border.lr.style = style,
    column_labels.border.lr.width = width,
    column_labels.border.lr.color = color,
    row_group.border.left.style = style,
    row_group.border.left.width = width,
    row_group.border.left.color = color,
    row_group.border.right.style = style,
    row_group.border.right.width = width,
    row_group.border.right.color = color,
    table_body.border.top.style = style,
    table_body.border.top.width = width,
    table_body.border.bottom.style = style,
    table_body.border.bottom.width = width,
    footnotes.border.lr.style = style,
    footnotes.border.lr.width = width,
    footnotes.border.lr.color = color,
    source_notes.border.lr.style = style,
    source_notes.border.lr.width = width,
    source_notes.border.lr.color = color
  )
}

#' Option to completely remove any table outlines
#'
#' This function removes any table outlines that may exist around the entire
#' table. It won't annihilate the `width` and `color` attributes but simply sets
#' the relevant line styles to `"none"`.
#'
#' This function serves as a convenient shortcut for a large number of options
#' from the [tab_options()] function. The complementary `opt_*()` function is
#' [opt_add_table_outline()], which adds a table outline.
#'
#' @inheritParams fmt_number
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table with
#' # a number of table parts added; apply a
#' # table preset and then remove the table
#' # outlines with `opt_remove_table_outline()`
#' tab_1 <-
#'   exibble %>%
#'   gt(rowname_col = "row", groupname_col = "group") %>%
#'   summary_rows(
#'     groups = "grp_a",
#'     columns = vars(num, currency),
#'     fns = list(
#'       min = ~min(., na.rm = TRUE),
#'       max = ~max(., na.rm = TRUE)
#'     )) %>%
#'   grand_summary_rows(
#'     columns = vars(currency),
#'     fns = list(
#'       total = ~sum(., na.rm = TRUE)
#'     )) %>%
#'   tab_source_note(source_note = "This is a source note.") %>%
#'   tab_footnote(
#'     footnote = "This is a footnote.",
#'     locations = cells_body(columns = 1, rows = 1)
#'   ) %>%
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) %>%
#'   preset_colorized(style = 5, color = "blue") %>%
#'   opt_remove_table_outline()
#'
#' @section Figures:
#' \if{html}{\figure{man_opt_remove_table_outline_1.svg}{options: width=100\%}}
#'
#' @family table option functions
#'
#' @export
opt_remove_table_outline <- function(data) {

  tab_options(
    data,
    table.border.top.style = "none",
    table.border.bottom.style = "none",
    table.border.left.style = "none",
    table.border.right.style = "none",
    heading.border.lr.style = "none",
    column_labels.border.lr.style = "none",
    row_group.border.left.style = "none",
    row_group.border.right.style = "none",
    table_body.border.top.style = "none",
    table_body.border.bottom.style = "none",
    footnotes.border.lr.style = "none",
    source_notes.border.lr.style = "none"
  )
}
