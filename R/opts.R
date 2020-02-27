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
#' @param marks Either a character vector of length greater than 1 (that will
#'   represent the series of marks) or a single keyword that represents a preset
#'   sequence of marks. The valid keywords are: `"numbers"` (for numeric marks),
#'   `"letters"` and `"LETTERS"` (for lowercase and uppercase alphabetic marks),
#'   `"standard"` (for a traditional set of four symbol marks), and `"extended"`
#'   (which adds two more symbols to the standard set).
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
#' @family Table Option Functions
#' @section Function ID:
#' 9-1
#'
#' @export
opt_footnote_marks <- function(data,
                               marks) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Validate input for `marks`
  validate_marks(marks)

  tab_options(data, footnotes.marks = marks)
}

#' Option to add or remove row striping
#'
#' By default, a **gt** table does not have row striping enabled. However, this
#' function allows us to easily enable or disable striped rows in the table
#' body. This function serves as a convenient shortcut for
#' `<gt_tbl> %>% tab_options(row.striping.include_table_body = <active>)`.
#'
#' @inheritParams fmt_number
#' @param active A logical value to indicate whether the row striping option
#'   should be active or inactive.
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
#'   opt_row_striping()
#'
#' @section Figures:
#' \if{html}{\figure{man_opt_row_striping_1.svg}{options: width=100\%}}
#'
#' @family Table Option Functions
#' @section Function ID:
#' 9-2
#'
#' @export
opt_row_striping <- function(data,
                             active = TRUE) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  tab_options(data, row.striping.include_table_body = active)
}

#' Option to align the table header
#'
#' By default, a table header added to a **gt** table has center alignment
#' for both the title and the subtitle elements. This function allows us to
#' easily set the horizontal alignment of the title and subtitle to the left
#' or right by using the `"align"` argument. This function serves as a
#' convenient shortcut for `<gt_tbl> %>% tab_options(heading.align = <align>)`.
#'
#' @inheritParams fmt_number
#' @param align The alignment of the title and subtitle elements in the table
#' header. Options are `"left"` (the default), `"center"`, or `"right"`.
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
#' @family Table Option Functions
#' @section Function ID:
#' 9-3
#'
#' @export
opt_align_table_header <- function(data,
                                   align = c("left", "center", "right")) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  align <- match.arg(align)

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
#' @param active A logical value to indicate whether the text transformation to
#'   all caps should be active or inactive for the `locations` targeted.
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
#' @family Table Option Functions
#' @section Function ID:
#' 9-4
#'
#' @export
opt_all_caps <- function(data,
                         active = TRUE,
                         locations = c("column_labels", "stub", "row_group")) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Ensure that all named locations are valid
  if (!all(locations %in% c("column_labels", "stub", "row_group"))) {
    stop("The available locations are `column_labels`, `stub`, and `row_group`.",
         call. = FALSE)
  }

  if ("column_labels" %in% locations) {

    if (active) {

      data <-
        tab_options(
          data,
          column_labels.text_transform = "uppercase",
          column_labels.font.size = pct(80),
          column_labels.font.weight = "bolder"
        )

    } else {

      data <-
        tab_options(
          data,
          column_labels.text_transform = dt_options_get_default_value("column_labels_text_transform"),
          column_labels.font.size = dt_options_get_default_value("column_labels_font_size"),
          column_labels.font.weight = dt_options_get_default_value("column_labels_font_weight")
        )
    }
  }

  if ("stub" %in% locations) {

    if (active) {

      data <-
        tab_options(
          data,
          stub.text_transform = "uppercase",
          stub.font.size = pct(80),
          stub.font.weight = "bolder"
        )

    } else {

      data <-
        tab_options(
          data,
          stub.text_transform = dt_options_get_default_value("stub_text_transform"),
          stub.font.size = dt_options_get_default_value("stub_font_size"),
          stub.font.weight = dt_options_get_default_value("stub_font_weight")
        )
    }
  }

  if ("row_group" %in% locations) {

    if (active) {

      data <-
        tab_options(
          data,
          row_group.text_transform = "uppercase",
          row_group.font.size = pct(80),
          row_group.font.weight = "bolder"
        )

    } else {

      data <-
        tab_options(
          data,
          row_group.text_transform = dt_options_get_default_value("row_group_text_transform"),
          row_group.font.size = dt_options_get_default_value("row_group_font_size"),
          row_group.font.weight = dt_options_get_default_value("row_group_font_weight")
        )
    }
  }

  data
}

#' Option to set table lines to different extents
#'
#' The `opt_table_lines()` function sets table lines in one of three possible
#' ways: (1) all possible table lines drawn (`"all"`), (2) no table lines at all
#' (`"none"`), and (3) resetting to the default line styles (`"default"`). This
#' is great if you want to start off with lots of lines and subtract just a few
#' of them with [tab_options()] or [tab_style()]. Or, use it to start with a
#' completely lineless table, adding individual lines as needed.
#'
#' @inheritParams fmt_number
#' @param extent The extent to which lines will be visible in the table. Options
#' are `"all"`, `"none"`, or `"default"`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table with
#' # a number of table parts added; then, use
#' # the `opt_table_lines()` function to
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
#'   opt_table_lines()
#'
#' @family Table Option Functions
#' @section Function ID:
#' 9-5
#'
#' @export
opt_table_lines <- function(data,
                            extent = c("all", "none", "default")) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  extent <- match.arg(extent)

  if (extent == "all") {

    data <-
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

  if (extent == "none") {

    data <-
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

  if (extent == "default") {

    data <-
      tab_options(
        data,
        table.border.top.style = dt_options_get_default_value("table_border_top_style"),
        table.border.left.style = dt_options_get_default_value("table_border_left_style"),
        table.border.right.style = dt_options_get_default_value("table_border_right_style"),
        heading.border.bottom.style = dt_options_get_default_value("heading_border_bottom_style"),
        heading.border.lr.style = dt_options_get_default_value("heading_border_lr_style"),
        column_labels.vlines.style = dt_options_get_default_value("column_labels_vlines_style"),
        column_labels.border.top.style = dt_options_get_default_value("column_labels_border_top_style"),
        column_labels.border.lr.style = dt_options_get_default_value("column_labels_border_lr_style"),
        column_labels.border.bottom.style = dt_options_get_default_value("column_labels_border_bottom_style"),
        row_group.border.top.style = dt_options_get_default_value("row_group_border_top_style"),
        row_group.border.bottom.style = dt_options_get_default_value("row_group_border_bottom_style"),
        row_group.border.left.style = dt_options_get_default_value("row_group_border_left_style"),
        row_group.border.right.style = dt_options_get_default_value("row_group_border_right_style"),
        stub.border.style = dt_options_get_default_value("stub_border_style"),
        table_body.border.top.style = dt_options_get_default_value("table_body_border_top_style"),
        table_body.border.bottom.style = dt_options_get_default_value("table_body_border_bottom_style"),
        table_body.hlines.style = dt_options_get_default_value("table_body_hlines_style"),
        table_body.vlines.style = dt_options_get_default_value("table_body_vlines_style"),
        summary_row.border.style = dt_options_get_default_value("summary_row_border_style"),
        grand_summary_row.border.style = dt_options_get_default_value("grand_summary_row_border_style"),
        footnotes.border.bottom.style = dt_options_get_default_value("footnotes_border_bottom_style"),
        footnotes.border.lr.style = dt_options_get_default_value("footnotes_border_lr_style"),
        source_notes.border.lr.style = dt_options_get_default_value("source_notes_border_lr_style"),
        source_notes.border.bottom.style = dt_options_get_default_value("source_notes_border_bottom_style"),
        table.border.bottom.style = dt_options_get_default_value("table_border_bottom_style")
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
#' from the [tab_options()] function. Using `active = FALSE` will reset table
#' outlines to their defaults.
#'
#' @inheritParams fmt_number
#' @param active A logical value to indicate whether the table outlines should
#' be applied or removed (i.e., reset to defaults).
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
#' # using `opt_table_outline()`
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
#'   opt_table_outline()
#'
#' @section Figures:
#' \if{html}{\figure{man_opt_table_outline_1.svg}{options: width=100\%}}
#'
#' @family Table Option Functions
#' @section Function ID:
#' 9-6
#'
#' @export
opt_table_outline <- function(data,
                              active = TRUE,
                              style = "solid",
                              width = px(3),
                              color = "#D3D3D3") {

  # Perform input object validation
  stop_if_not_gt(data = data)

  if (active) {

    data <-
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
        table.border.right.color = color
      )

  } else {

    data <-
      tab_options(
        data,
        table.border.top.style = dt_options_get_default_value("table_border_top_style"),
        table.border.top.width = dt_options_get_default_value("table_border_top_width"),
        table.border.top.color = dt_options_get_default_value("table_border_top_color"),
        table.border.bottom.style = dt_options_get_default_value("table_border_bottom_style"),
        table.border.bottom.width = dt_options_get_default_value("table_border_bottom_width"),
        table.border.bottom.color = dt_options_get_default_value("table_border_bottom_color"),
        table.border.left.style = dt_options_get_default_value("table_border_left_style"),
        table.border.left.width = dt_options_get_default_value("table_border_left_width"),
        table.border.left.color = dt_options_get_default_value("table_border_left_color"),
        table.border.right.style = dt_options_get_default_value("table_border_right_style"),
        table.border.right.width = dt_options_get_default_value("table_border_right_width"),
        table.border.right.color = dt_options_get_default_value("table_border_right_color")
      )
  }

  data
}
