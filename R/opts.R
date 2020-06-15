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
#' \if{html}{\figure{man_opt_footnote_marks_1.png}{options: width=100\%}}
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
#' `<gt_tbl> %>% tab_options(row.striping.include_table_body = TRUE|FALSE)`.
#'
#' @inheritParams fmt_number
#' @param row_striping A logical value to indicate whether row striping should
#'   be added or removed.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table with
#' # a number of table parts added; next, we
#' # add row striping to every second row with
#' # the `opt_row_striping()` function
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
#' \if{html}{\figure{man_opt_row_striping_1.png}{options: width=100\%}}
#'
#' @family Table Option Functions
#' @section Function ID:
#' 9-2
#'
#' @export
opt_row_striping <- function(data,
                             row_striping = TRUE) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  tab_options(data, row.striping.include_table_body = row_striping)
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
#' \if{html}{\figure{man_opt_align_table_header_1.png}{options: width=100\%}}
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
#' @param all_caps A logical value to indicate whether the text transformation
#'   to all caps should be performed (`TRUE`, the default) or reset to default
#'   values (`FALSE`) for the `locations` targeted.
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
#' \if{html}{\figure{man_opt_all_caps_1.png}{options: width=100\%}}
#'
#' @family Table Option Functions
#' @section Function ID:
#' 9-4
#'
#' @export
opt_all_caps <- function(data,
                         all_caps = TRUE,
                         locations = c("column_labels", "stub", "row_group")) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Ensure that all named locations are valid
  if (!all(locations %in% c("column_labels", "stub", "row_group"))) {
    stop("The available locations are `column_labels`, `stub`, and `row_group`.",
         call. = FALSE)
  }

  # Create a regex pattern to obtain arg names for all specific `locations`
  pattern <-
    paste0(
      "^(", paste(locations, collapse = "|"),
      ")\\.(text_transform|font\\.size|font\\.weight)"
    )

  # Obtain the `tab_options()` args vector with the `pattern`
  options_vec <- get_tab_options_arg_vec(pattern = pattern)

  if (all_caps) {

    values_vec <-
      dplyr::case_when(
        grepl("\\.font\\.size$", options_vec) ~ "80%",
        grepl("\\.font\\.weight$", options_vec) ~ "bolder",
        grepl("\\.text_transform$", options_vec) ~ "uppercase"
      )

    option_value_list <- create_option_value_list(options_vec, values_vec)
  } else {
    option_value_list <- create_default_option_value_list(options_vec)
  }

  tab_options_multi(data, option_value_list)
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
#' @section Figures:
#' \if{html}{\figure{man_opt_table_lines_1.png}{options: width=100\%}}
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

  # Normalize `extent` values to property values
  values_vec <- if (extent == "all") "solid" else extent

  # Get vector of `tab_options()` arg names for all table line styles
  options_vec <- get_tab_options_arg_vec(pattern = "\\.style$")

  if (values_vec %in% c("solid", "none")) {
    option_value_list <- create_option_value_list(options_vec, values_vec)
  } else {
    option_value_list <- create_default_option_value_list(options_vec)
  }

  tab_options_multi(data, option_value_list)
}

#' Option to wrap an outline around the entire table
#'
#' This function puts an outline of consistent `style`, `width`, and `color`
#' around the entire table. It'll write over any existing outside lines so long
#' as the `width` is larger that of the existing lines. The default value of
#' `style` (`"solid"`) will draw a solid outline, whereas a value of `"none"`
#' will remove any present outline.
#'
#' @inheritParams fmt_number
#' @param style,width,color The style, width, and color properties for the table
#'   outline. By default, these are `"solid"`, `px(3)` (or, `"3px"`), and
#'   `"#D3D3D3"`. If `"none"` is used then the outline is removed and any values
#'   provided for `width` and `color` will be ignored (i.e., not set).
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
#' # Remove the table outline with the
#' # `style = "none"` option
#' tab_2 <-
#'   tab_1 %>%
#'   opt_table_outline(style = "none")
#'
#' @section Figures:
#' \if{html}{\figure{man_opt_table_outline_1.png}{options: width=100\%}}
#'
#' \if{html}{\figure{man_opt_table_outline_2.png}{options: width=100\%}}
#'
#' @family Table Option Functions
#' @section Function ID:
#' 9-6
#'
#' @export
opt_table_outline <- function(data,
                              style = "solid",
                              width = px(3),
                              color = "#D3D3D3") {

  # Perform input object validation
  stop_if_not_gt(data = data)

  if (style == "none") {
    width <- NULL
    color <- NULL
  }

  params <-
    c(
      if (!is.null(style)) "style",
      if (!is.null(width)) "width",
      if (!is.null(color)) "color"
    )

  pattern <- paste0("^table\\.border.*?\\.(", paste(params, collapse = "|"), ")")

  # Get vector of `tab_options()` arg names for the table border styles
  options_vec <- get_tab_options_arg_vec(pattern = pattern)

  if (is.null(width)) width <- NA_character_
  if (is.null(color)) color <- NA_character_

  values_vec <-
    dplyr::case_when(
      grepl("^table\\.border\\..*?\\.style$", options_vec) ~ style,
      grepl("^table\\.border\\..*?\\.width$", options_vec) ~ width,
      grepl("^table\\.border\\..*?\\.color$", options_vec) ~ color
    )

  option_value_list <- create_option_value_list(options_vec, values_vec)
  tab_options_multi(data, option_value_list)
}


#' Option to define a custom font for the table
#'
#' @description
#' The `opt_table_font()` function makes it possible to define a custom font for
#' the entire **gt** table. The standard fallback fonts are still set by default
#' but the font defined here will take precedence. You could still have
#' different fonts in select locations in the table, and for that you would need
#' to use [tab_style()] in conjunction with the [cell_text()] helper function.
#'
#' We have the option to supply either a system font for the `font_name`, or, a
#' font available at the Google Fonts service by use of the [google_font()]
#' helper function.
#'
#' @inheritParams fmt_number
#' @param font Either the name of a font available in the user system or a call
#'   to [google_font()], which has a large selection of typefaces.
#' @param style The text style. Can be one of either `"normal"`, `"italic"`, or
#'   `"oblique"`.
#' @param weight The weight of the font. Can be a text-based keyword such as
#'   `"normal"`, `"bold"`, `"lighter"`, `"bolder"`, or, a numeric value between
#'   `1` and `1000`, inclusive. Note that only variable fonts may support the
#'   numeric mapping of weight.
#' @param add Should this font be added to the front of the already-defined
#'   fonts for the table? By default, this is `TRUE` and is recommended since
#'   the list serves as fallbacks when certain fonts are not available.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' if (interactive()) {
#'
#' # Use `sp500` to create a small gt table,
#' # using `fmt_currency()` to provide a
#' # dollar sign for the first row of monetary
#' # values; then, set a larger font size for
#' # the table and use the 'Merriweather' font
#' # (from Google Fonts, via `google_font()`)
#' # with two font fallbacks ('Cochin' and the
#' # catchall 'Serif' group)
#' tab_1 <-
#'   sp500 %>%
#'   dplyr::slice(1:10) %>%
#'   dplyr::select(-volume, -adj_close) %>%
#'   gt() %>%
#'   fmt_currency(
#'     columns = 2:5,
#'     rows = 1,
#'     currency = "USD",
#'     use_seps = FALSE
#'   ) %>%
#'   tab_options(table.font.size = px(18)) %>%
#'   opt_table_font(
#'     font = list(
#'       google_font(name = "Merriweather"),
#'       "Cochin", "Serif"
#'     )
#'   )
#'
#' # Use `sza` to create an eleven-row table;
#' # within `opt_table_font()`, set up a
#' # preferred list of sans-serif fonts that
#' # are commonly available in macOS (using
#' # part of the `default_fonts()` vector as
#' # a fallback)
#' # and Windows 10
#' tab_2 <-
#'   sza %>%
#'   dplyr::filter(
#'     latitude == 20 &
#'       month == "jan" &
#'       !is.na(sza)
#'   ) %>%
#'   dplyr::select(-latitude, -month) %>%
#'   gt() %>%
#'   opt_table_font(
#'     font = c(
#'       "Helvetica Neue", "Segoe UI",
#'       default_fonts()[-c(1:3)]
#'     )
#'   ) %>%
#'   opt_all_caps()
#'
#' }
#'
#' @section Figures:
#' \if{html}{\figure{man_opt_table_font_1.png}{options: width=100\%}}
#'
#' \if{html}{\figure{man_opt_table_font_2.png}{options: width=100\%}}
#'
#' @family Table Option Functions
#' @section Function ID:
#' 9-7
#'
#' @export
opt_table_font <- function(data,
                           font,
                           weight = NULL,
                           style = NULL,
                           add = TRUE) {

  existing_fonts <- dt_options_get_value(data = data, option = "table_font_names")
  existing_additional_css <- dt_options_get_value(data = data, option = "table_additional_css")

  font <- normalize_font_input(font_input = font)

  additional_css <- c(font$import_stmt, existing_additional_css)

  data <- tab_options(data = data, table.font.names = c(font$name, if (add) existing_fonts))
  data <- tab_options(data = data, table.additional_css = additional_css)

  if (!is.null(weight)) {

    if (is.numeric(weight)) weight <- as.character(weight)

    data <- tab_options(data = data, table.font.weight = weight)
    data <- tab_options(data = data, column_labels.font.weight = weight)
  }

  if (!is.null(style)) {
    data <- tab_options(data = data, table.font.style = style)
  }

  data
}

#' Option to add custom CSS for the table
#'
#' The `opt_css()` function makes it possible to add CSS to a **gt** table. This
#' CSS will be added after the compiled CSS that **gt** generates automatically
#' when the object is transformed to an HTML output table. You can supply `css`
#' as a vector of lines or as a single string.
#'
#' @inheritParams fmt_number
#' @param css The CSS to include as part of the rendered table's `<style>`
#'   element.
#' @param add If `TRUE`, the default, the CSS is added to any already-defined
#'   CSS (typically from previous calls of [opt_table_font()], `opt_css()`, or,
#'   directly setting CSS the `table.additional_css` value in [tab_options()]).
#'   If this is set to `FALSE`, the CSS provided here will replace any
#'   previously-stored CSS.
#' @param allow_duplicates When this is `FALSE` (the default), the CSS provided
#'   here won't be added (provided that `add = TRUE`) if it is seen in the
#'   already-defined CSS.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table and
#' # format the data in both columns; with
#' # `opt_css()` insert CSS rulesets as
#' # as string and be sure to set the table
#' # ID explicitly (here as "one")
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(num, currency) %>%
#'   gt(id = "one") %>%
#'   fmt_currency(
#'     columns = vars(currency),
#'     currency = "HKD"
#'   ) %>%
#'   fmt_scientific(
#'     columns = vars(num)
#'   ) %>%
#'   opt_css(
#'     css = "
#'     #one .gt_table {
#'       background-color: skyblue;
#'     }
#'     #one .gt_row {
#'       padding: 20px 30px;
#'     }
#'     #one .gt_col_heading {
#'       text-align: center !important;
#'     }
#'     "
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_opt_css_1.png}{options: width=100\%}}
#'
#' @family Table Option Functions
#' @section Function ID:
#' 9-8
#'
#' @export
opt_css <- function(data,
                    css,
                    add = TRUE,
                    allow_duplicates = FALSE) {

  existing_additional_css <-
    dt_options_get_value(data = data, option = "table_additional_css")

  css <- paste(css, collapse = "\n")

  if (!add && !allow_duplicates && css %in% existing_additional_css) {
    return(data)
  }

  additional_css <- c(existing_additional_css, css)

  tab_options(data = data, table.additional_css = additional_css)
}

normalize_font_input <- function(font_input) {

  if (!inherits(font_input, "character") &&
      !inherits(font_input, "list") &&
      !inherits(font_input, "font_css")) {
    stop("Values provided to `font` must either be a list or a character vector.",
         call. = FALSE)
  }

  if (inherits(font_input, "character")) {
    font_input <- list(font_input)
  }

  # Unlist a list of lists; this normalizes the value for `font_input`
  # in the cases where multiple fonts were provided in `c()` and `list()`
  if (any(vapply(font_input, is.list, FUN.VALUE = logical(1)))) {
    font_input <- unlist(font_input, recursive = FALSE)
  }

  if (is.null(names(font_input))) {
    font_names <- unlist(font_input)
    import_stmts <- ""
  } else {
    font_names <- unique(unname(unlist(font_input[names(font_input) %in% c("name", "")])))
    import_stmts <- unique(unname(unlist(font_input[names(font_input) %in% "import_stmt"])))
  }

  font_list <-
    list(
      name = font_names,
      import_stmt = import_stmts
    )

  class(font_list) <- "font_css"
  font_list
}

# Create an option-value list with a vector of arg names from the
# `tab_options()` function and either one value or n-length values
# corresponding to those options
create_option_value_list <- function(tab_options_args, values) {

  # Validate the length of the `values` vector
  if (length(values) == 1) {
    values <- rep_len(values, length(tab_options_args))
  } else if (length(values) != length(tab_options_args)) {
    stop("The length of the `values` vector must be 1 or the length of `tab_options_args`")
  }

  stats::setNames(object = values, tab_options_args) %>% as.list()
}

create_default_option_value_list <- function(tab_options_args) {

  lapply(stats::setNames(, tab_options_args), function(x) {
    dt_options_get_default_value(tidy_gsub(x, ".", "_", fixed = TRUE))
  })
}

dt_options_get_default_value <- function(option) {

  # Validate the provided `option` value
  if (length(option) != 1) {
    stop("A character vector of length one must be provided")
  }
  if (!(option %in% dt_options_tbl$parameter)) {
    stop("The `option` provided is invalid")
  }

  dt_options_tbl$value[[which(dt_options_tbl$parameter == option)]]
}

# Get vector of argument names (excluding `data`) from `tab_options`
#' @include tab_create_modify.R
tab_options_arg_names <- formals(tab_options) %>% names() %>% base::setdiff("data")

# Create vector of all args from `tab_options()` by
# use of a regex pattern
get_tab_options_arg_vec <- function(pattern) {
  grep(pattern = pattern, tab_options_arg_names, value = TRUE)
}

# Validate any vector of `tab_options()` argument names
validate_tab_options_args <- function(tab_options_args) {

  if (!all(tab_options_args %in% tab_options_arg_names)) {
    stop("All `tab_options_args` must be valid names.")
  }
}

# Do multiple calls of `tab_options()` with an option-value list (`options`)
tab_options_multi <- function(data, options) {

  # Validate the names of the `options`
  validate_tab_options_args(names(options))

  do.call(tab_options, c(list(data = data), options))
}
