#' Stylize your table with a colorful look
#'
#' @description
#'
#' With `opt_stylize()` you can quickly style your **gt** table with a carefully
#' curated set of background colors, line colors, and line styles. There are six
#' styles to choose from and they largely vary in the extent of coloring applied
#' to different table locations. Some have table borders applied, some apply
#' darker colors to the table stub and summary sections, and, some even have
#' vertical lines. In addition to choosing a `style` preset, there are six
#' `color` variations that each use a range of five color tints. Each of the
#' color tints have been fine-tuned to maximize the contrast between text and
#' its background. There are 36 combinations of `style` and `color` to choose
#' from.
#'
#' @inheritParams fmt_number
#' @param style Six numbered styles are available. Simply provide a number from
#'   `1` (the default) to `6` to choose a distinct look.
#' @param color There are six color variations: `"blue"` (the default),
#'   `"cyan"`, `"pink"`, `"green"`, `"red"`, and `"gray"`.
#' @param add_row_striping An option to enable row striping in the table body
#'   for the style chosen. By default, this is `TRUE`.
#'
#' @return an object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use `exibble` to create a **gt** table with a number of table parts added.
#' Then, use the `opt_stylize()` function to give the table some additional
#' style (using the `"cyan"` color variation and style number `6`).
#'
#' ```r
#' exibble |>
#'   gt(rowname_col = "row", groupname_col = "group") |>
#'   summary_rows(
#'     groups = "grp_a",
#'     columns = c(num, currency),
#'     fns = c("min", "max")
#'   ) |>
#'   grand_summary_rows(
#'     columns = currency,
#'     fns = total ~ sum(., na.rm = TRUE)
#'   ) |>
#'   tab_source_note(source_note = "This is a source note.") |>
#'   tab_footnote(
#'     footnote = "This is a footnote.",
#'     locations = cells_body(columns = 1, rows = 1)
#'   ) |>
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) |>
#'   opt_stylize(style = 6, color = "cyan")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_stylize_1.png")`
#' }}
#'
#' @family table option functions
#' @section Function ID:
#' 9-1
#'
#' @export
opt_stylize <- function(
    data,
    style = 1,
    color = "blue",
    add_row_striping = TRUE
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  if (!(length(style) == 1 && style %in% 1:6)) {
    cli::cli_abort("The `style` value must be a number in the range of 1 to 6.")
  }

  if (!(length(color) == 1 && color %in% unique(styles_colors_params$color))) {
    cli::cli_abort(c(
      "The `color` value must be one of seven specific colors:",
      "*" = "\"blue\", \"cyan\", \"pink\", \"green\", \"red\", or \"gray\""
    ))
  }

  # Get the set of parameters based on the `style` and `color` values
  params <-
    get_colorized_params(
      styles_colors_params = styles_colors_params,
      style = style,
      color = color
    )

  tbl_colorized <-
    tab_options(
      data,
      table.border.top.color = params$table_hlines_color,
      table.border.bottom.color = params$table_hlines_color,
      heading.border.bottom.color = params$location_hlines_color,
      column_labels.border.top.color = params$location_hlines_color,
      column_labels.border.bottom.color = params$location_hlines_color,
      row_group.border.top.color = params$location_hlines_color,
      row_group.border.bottom.color = params$location_hlines_color,
      summary_row.border.color = params$location_hlines_color,
      grand_summary_row.border.color = params$location_hlines_color,
      column_labels.background.color = params$column_labels_background_color,
      stub.background.color = params$stub_background_color,
      stub.border.style = params$stub_border_style,
      stub.border.color = params$stub_border_color,
      table_body.border.top.color = params$location_hlines_color,
      table_body.border.bottom.color = params$location_hlines_color,
      table_body.hlines.style = params$data_hlines_style,
      table_body.hlines.color = params$data_hlines_color,
      table_body.vlines.style = params$data_vlines_style,
      table_body.vlines.color = params$data_vlines_color,
      summary_row.background.color = params$summary_row_background_color,
      grand_summary_row.background.color = params$grand_summary_row_background_color,
      row.striping.background_color = params$row_striping_background_color
    )

  if (!is.na(params$table_outline_color)) {

    tbl_colorized <-
      opt_table_outline(
        tbl_colorized,
        width = px(3),
        color = params$table_outline_color
      )
  }

  if (add_row_striping) {
    tbl_colorized <- opt_row_striping(tbl_colorized)
  }

  tbl_colorized
}

get_colorized_params <- function(
    styles_colors_params,
    style,
    color
) {

  style_filter <- style
  color_filter <- color

  as.list(
    dplyr::filter(
      styles_colors_params,
      style == style_filter,
      color == color_filter
    )
  )
}

#' Option to modify the set of footnote marks
#'
#' @description
#'
#' Alter the footnote marks for any footnotes that may be present in the table.
#' Either a vector of marks can be provided (including Unicode characters), or,
#' a specific keyword could be used to signify a preset sequence. This function
#' serves as a shortcut for using `tab_options(footnotes.marks = {marks})`
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
#' @details
#'
#' We can supply a vector of that will represent the series of marks.
#' The series of footnote marks is recycled when its usage goes beyond the
#' length of the set. At each cycle, the marks are simply doubled, tripled, and
#' so on (e.g., `*` -> `**` -> `***`). The option exists for providing keywords
#' for certain types of footnote marks. The keywords are:
#'
#' - `"numbers"`: numeric marks, they begin from 1 and these marks are not
#' subject to recycling behavior
#' - `"letters"`: miniscule alphabetic marks, internally uses the `letters`
#' vector which contains 26 lowercase letters of the Roman alphabet
#' - `"LETTERS"`: majuscule alphabetic marks, using the `LETTERS` vector
#' which has 26 uppercase letters of the Roman alphabet
#' - `"standard"`: symbolic marks, four symbols in total
#' - `"extended"`: symbolic marks, extends the standard set by adding two
#' more symbols, making six
#'
#' @section Examples:
#'
#' Use [`sza`] to create a **gt** table, adding three footnotes. Call
#' `opt_footnote_marks()` to specify which footnote marks to use.
#'
#' ```r
#' sza |>
#'   dplyr::filter(latitude == 30) |>
#'   dplyr::group_by(tst) |>
#'   dplyr::summarize(
#'     SZA.Max = if (
#'       all(is.na(sza))) {
#'       NA
#'     } else {
#'       max(sza, na.rm = TRUE)
#'     },
#'     SZA.Min = if (
#'       all(is.na(sza))) {
#'       NA
#'     } else {
#'       min(sza, na.rm = TRUE)
#'     },
#'     .groups = "drop"
#'   ) |>
#'   gt(rowname_col = "tst") |>
#'   tab_spanner_delim(delim = ".") |>
#'   sub_missing(
#'     columns = everything(),
#'     missing_text = "90+"
#'   ) |>
#'   tab_stubhead(label = "TST") |>
#'   tab_footnote(
#'     footnote = "True solar time.",
#'     locations = cells_stubhead()
#'   ) |>
#'   tab_footnote(
#'     footnote = "Solar zenith angle.",
#'     locations = cells_column_spanners(
#'       spanners = "spanner-SZA.Max"
#'     )
#'   ) |>
#'   tab_footnote(
#'     footnote = "The Lowest SZA.",
#'     locations = cells_stub(rows = "1200")
#'   ) |>
#'   opt_footnote_marks(marks = "standard")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_footnote_marks_1.png")`
#' }}
#'
#' @family table option functions
#' @section Function ID:
#' 9-2
#'
#' @export
opt_footnote_marks <- function(
    data,
    marks
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Validate input for `marks`
  validate_marks(marks)

  tab_options(data = data, footnotes.marks = marks)
}

#' Option to add or remove row striping
#'
#' @description
#'
#' By default, a **gt** table does not have row striping enabled. However, this
#' function allows us to easily enable or disable striped rows in the table
#' body. This function serves as a convenient shortcut for
#' `<gt_tbl> |> tab_options(row.striping.include_table_body = TRUE|FALSE)`.
#'
#' @inheritParams fmt_number
#' @param row_striping A logical value to indicate whether row striping should
#'   be added or removed.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table with a number of table parts added.
#' Next, we add row striping to every second row with the `opt_row_striping()`
#' function.
#'
#' ```r
#' exibble |>
#'   gt(rowname_col = "row", groupname_col = "group") |>
#'   summary_rows(
#'     groups = "grp_a",
#'     columns = c(num, currency),
#'     fns = c("min", "max")
#'   ) |>
#'   grand_summary_rows(
#'     columns = currency,
#'     fns = total ~ sum(., na.rm = TRUE)
#'   ) |>
#'   tab_source_note(source_note = "This is a source note.") |>
#'   tab_footnote(
#'     footnote = "This is a footnote.",
#'     locations = cells_body(columns = 1, rows = 1)
#'   ) |>
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) |>
#'   opt_row_striping()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_row_striping_1.png")`
#' }}
#'
#' @family table option functions
#' @section Function ID:
#' 9-3
#'
#' @export
opt_row_striping <- function(
    data,
    row_striping = TRUE
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  tab_options(
    data = data,
    row.striping.include_table_body = row_striping
  )
}

#' Option to align the table header
#'
#' @description
#'
#' By default, a table header added to a **gt** table has center alignment
#' for both the title and the subtitle elements. This function allows us to
#' easily set the horizontal alignment of the title and subtitle to the left
#' or right by using the `"align"` argument. This function serves as a
#' convenient shortcut for `<gt_tbl> |> tab_options(heading.align = <align>)`.
#'
#' @inheritParams fmt_number
#' @param align The alignment of the title and subtitle elements in the table
#' header. Options are `"left"` (the default), `"center"`, or `"right"`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table with a number of table parts added.
#' The header (consisting of the title and the subtitle) are to be aligned to
#' the left with the `opt_align_table_header()` function.
#'
#' ```r
#' exibble |>
#'   gt(rowname_col = "row", groupname_col = "group") |>
#'   summary_rows(
#'     groups = "grp_a",
#'     columns = c(num, currency),
#'     fns = c("min", "max")
#'   ) |>
#'   grand_summary_rows(
#'     columns = currency,
#'     fns = total ~ sum(., na.rm = TRUE)
#'   ) |>
#'   tab_source_note(source_note = "This is a source note.") |>
#'   tab_footnote(
#'     footnote = "This is a footnote.",
#'     locations = cells_body(columns = 1, rows = 1)
#'   ) |>
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) |>
#'   opt_align_table_header(align = "left")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_align_table_header_1.png")`
#' }}
#'
#' @family table option functions
#' @section Function ID:
#' 9-4
#'
#' @export
opt_align_table_header <- function(
    data,
    align = c("left", "center", "right")
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  align <- rlang::arg_match(align)

  tab_options(
    data = data,
    heading.align = align
  )
}

#' Option to expand or contract vertical padding
#'
#' @description
#'
#' Increase or decrease the vertical padding throughout all locations of a
#' **gt** table by use of a `scale` factor, which here is defined by a real
#' number between `0` and `3`. This function serves as a shortcut for setting
#' the following eight options in [tab_options()]:
#'
#' - `heading.padding`
#' - `column_labels.padding`
#' - `data_row.padding`
#' - `row_group.padding`
#' - `summary_row.padding`
#' - `grand_summary_row.padding`
#' - `footnotes.padding`
#' - `source_notes.padding`
#'
#' @inheritParams fmt_number
#' @param scale A scale factor by which the vertical padding will be adjusted.
#'   Must be a number between `0` and `3`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table with a number of table parts added.
#' Contract the vertical padding across the entire table with
#' `opt_vertical_padding()`.
#'
#'
#' ```r
#' exibble |>
#'   gt(rowname_col = "row", groupname_col = "group") |>
#'   summary_rows(
#'     groups = "grp_a",
#'     columns = c(num, currency),
#'     fns = c("min", "max")
#'   ) |>
#'   grand_summary_rows(
#'     columns = currency,
#'     fns = total ~ sum(., na.rm = TRUE)
#'   ) |>
#'   tab_source_note(source_note = "This is a source note.") |>
#'   tab_footnote(
#'     footnote = "This is a footnote.",
#'     locations = cells_body(columns = 1, rows = 1)
#'   ) |>
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) |>
#'   opt_vertical_padding(scale = 0.25)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_vertical_padding_1.png")`
#' }}
#'
#' @family table option functions
#' @section Function ID:
#' 9-5
#'
#' @export
opt_vertical_padding <- function(
    data,
    scale = 1
) {

  option_value_list <-
    get_padding_option_value_list(
      scale = scale,
      type = "vertical"
    )

  tab_options_multi(
    data = data,
    options = option_value_list
  )
}

#' Option to expand or contract horizontal padding
#'
#' @description
#'
#' Increase or decrease the horizontal padding throughout all locations of a
#' **gt** table by use of a `scale` factor, which here is defined by a real
#' number between `0` and `3`. This function serves as a shortcut for setting
#' the following eight options in [tab_options()]:
#'
#' - `heading.padding.horizontal`
#' - `column_labels.padding.horizontal`
#' - `data_row.padding.horizontal`
#' - `row_group.padding.horizontal`
#' - `summary_row.padding.horizontal`
#' - `grand_summary_row.padding.horizontal`
#' - `footnotes.padding.horizontal`
#' - `source_notes.padding.horizontal`
#'
#' @inheritParams fmt_number
#' @param scale A scale factor by which the horizontal padding will be adjusted.
#'   Must be a number between `0` and `3`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table with a number of table parts added.
#' Expand the horizontal padding across the entire table with
#' `opt_horizontal_padding()`.
#'
#' ```r
#' exibble |>
#'   gt(rowname_col = "row", groupname_col = "group") |>
#'   summary_rows(
#'     groups = "grp_a",
#'     columns = c(num, currency),
#'     fns = c("min", "max")
#'   ) |>
#'   grand_summary_rows(
#'     columns = currency,
#'     fns = total ~ sum(., na.rm = TRUE)
#'   ) |>
#'   tab_source_note(source_note = "This is a source note.") |>
#'   tab_footnote(
#'     footnote = "This is a footnote.",
#'     locations = cells_body(columns = 1, rows = 1)
#'   ) |>
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) |>
#'   opt_horizontal_padding(scale = 3)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_horizontal_padding_1.png")`
#' }}
#'
#' @family table option functions
#' @section Function ID:
#' 9-6
#'
#' @export
opt_horizontal_padding <- function(
    data,
    scale = 1
) {

  option_value_list <-
    get_padding_option_value_list(
      scale = scale,
      type = "horizontal"
    )

  tab_options_multi(
    data = data,
    options = option_value_list
  )
}

get_padding_option_value_list <- function(scale, type) {

  # Stop if `scale` is beyond an acceptable range
  if (scale < 0 | scale > 3) {
    cli::cli_abort(
      "The value provided for `scale` ({scale}) must be between `0` and `3`."
    )
  }

  pattern <- if (type == "vertical") "_padding" else  "_padding_horizontal"

  # Get the padding parameters from `dt_options_tbl` that relate
  # to the `type` (either vertical or horizontal padding)
  padding_params <-
    dplyr::pull(
      dplyr::filter(dt_options_tbl, grepl(paste0(pattern, "$"), parameter)),
      parameter
    )

  padding_options <- dplyr::filter(dt_options_tbl, parameter %in% padding_params)
  padding_options <- dplyr::select(padding_options, parameter, value)
  padding_options <-
    dplyr::mutate(
      padding_options,
      parameter = gsub(pattern, gsub("_", ".", pattern, fixed = TRUE), parameter, fixed = TRUE)
    )
  padding_options <- dplyr::mutate(padding_options, value = unlist(value))
  padding_options <- dplyr::mutate(padding_options, px = as.numeric(gsub("px", "", value)))
  padding_options <- dplyr::mutate(padding_options, px = px * scale)

  create_option_value_list(
    padding_options$parameter,
    paste0(padding_options$px, "px")
  )
}

#' Option to use all caps in select table locations
#'
#' @description
#'
#' Sometimes an all-capitalized look is suitable for a table. With the
#' `opt_all_caps()` function, we can transform characters in the column labels,
#' the stub, and in all row groups in this way (and there's control over which
#' of these locations are transformed).
#'
#' This function serves as a convenient shortcut for `<gt_tbl> |>
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
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table with a number of table parts added.
#' All text in the column labels, the stub, and in all row groups is to be
#' transformed to all caps using `opt_all_caps()`.
#'
#' ```r
#' exibble |>
#'   gt(rowname_col = "row", groupname_col = "group") |>
#'   summary_rows(
#'     groups = "grp_a",
#'     columns = c(num, currency),
#'     fns = c("min", "max")
#'   ) |>
#'   grand_summary_rows(
#'     columns = currency,
#'     fns = total ~ sum(., na.rm = TRUE)
#'   ) |>
#'   tab_source_note(source_note = "This is a source note.") |>
#'   tab_footnote(
#'     footnote = "This is a footnote.",
#'     locations = cells_body(columns = 1, rows = 1)
#'   ) |>
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) |>
#'   opt_all_caps()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_all_caps_1.png")`
#' }}
#'
#' @family table option functions
#' @section Function ID:
#' 9-7
#'
#' @export
opt_all_caps <- function(
    data,
    all_caps = TRUE,
    locations = c("column_labels", "stub", "row_group")
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Ensure that all named locations are valid
  if (!all(locations %in% c("column_labels", "stub", "row_group"))) {
    cli::cli_abort(
      "The available locations are `column_labels`, `stub`, and `row_group`."
    )
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

  tab_options_multi(
    data = data,
    options = option_value_list
  )
}

#' Option to set table lines to different extents
#'
#' @description
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
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table with a number of table parts added.
#' Then, use the `opt_table_lines()` function to haves lines everywhere there
#' can possibly be lines.
#'
#' ```r
#' exibble |>
#'   gt(rowname_col = "row", groupname_col = "group") |>
#'   summary_rows(
#'     groups = "grp_a",
#'     columns = c(num, currency),
#'     fns = c("min", "max")
#'   ) |>
#'   grand_summary_rows(
#'     columns = currency,
#'     fns = total ~ sum(., na.rm = TRUE)
#'   ) |>
#'   tab_source_note(source_note = "This is a source note.") |>
#'   tab_footnote(
#'     footnote = "This is a footnote.",
#'     locations = cells_body(columns = 1, rows = 1)
#'   ) |>
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) |>
#'   opt_table_lines()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_table_lines_1.png")`
#' }}
#'
#' @family table option functions
#' @section Function ID:
#' 9-8
#'
#' @export
opt_table_lines <- function(
    data,
    extent = c("all", "none", "default")
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  extent <- rlang::arg_match(extent)

  # Normalize `extent` values to property values
  values_vec <- if (extent == "all") "solid" else extent

  # Get vector of `tab_options()` arg names for all table line styles
  options_vec <- get_tab_options_arg_vec(pattern = "\\.style$")

  if (values_vec %in% c("solid", "none")) {
    option_value_list <- create_option_value_list(options_vec, values_vec)
  } else {
    option_value_list <- create_default_option_value_list(options_vec)
  }

  tab_options_multi(
    data = data,
    options = option_value_list
  )
}

#' Option to wrap an outline around the entire table
#'
#' @description
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
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table with a number of table parts added.
#' Have an outline wrap around the entire table by using `opt_table_outline()`.
#'
#' ```r
#' tab_1 <-
#'   exibble |>
#'   gt(rowname_col = "row", groupname_col = "group") |>
#'   summary_rows(
#'     groups = "grp_a",
#'     columns = c(num, currency),
#'     fns = c("min", "max")
#'   ) |>
#'   grand_summary_rows(
#'     columns = currency,
#'     fns = total ~ sum(., na.rm = TRUE)
#'   ) |>
#'   tab_source_note(source_note = "This is a source note.") |>
#'   tab_footnote(
#'     footnote = "This is a footnote.",
#'     locations = cells_body(columns = 1, rows = 1)
#'   ) |>
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) |>
#'   opt_table_outline()
#'
#' tab_1
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_table_outline_1.png")`
#' }}
#'
#' Remove the table outline with the `style = "none"` option.
#'
#' ```r
#' tab_1 |> opt_table_outline(style = "none")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_table_outline_2.png")`
#' }}
#'
#' @family table option functions
#' @section Function ID:
#' 9-9
#'
#' @export
opt_table_outline <- function(
    data,
    style = "solid",
    width = px(3),
    color = "#D3D3D3"
) {

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

  tab_options_multi(
    data = data,
    options = option_value_list
  )
}

#' Option to define a custom font for the table
#'
#' @description
#'
#' The `opt_table_font()` function makes it possible to define a custom font for
#' the entire **gt** table. The standard fallback fonts are still set by default
#' but the font defined here will take precedence. You could still have
#' different fonts in select locations in the table, and for that you would need
#' to use [tab_style()] in conjunction with the [cell_text()] helper function.
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
#' @details
#'
#' We have the option to supply either a system font for the `font_name`, or, a
#' font available at the Google Fonts service by use of the [google_font()]
#' helper function.
#'
#' @section Examples:
#'
#' Use [`sp500`] to create a small **gt** table, using [fmt_currency()] to
#' provide a dollar sign for the first row of monetary values. Then, set a
#' larger font size for the table and use the `"Merriweather"` font (from
#' *Google Fonts*, via [google_font()]) with two font fallbacks (`"Cochin"` and
#' the catchall `"Serif"` group).
#'
#' ```r
#' sp500 |>
#'   dplyr::slice(1:10) |>
#'   dplyr::select(-volume, -adj_close) |>
#'   gt() |>
#'   fmt_currency(
#'     columns = 2:5,
#'     rows = 1,
#'     currency = "USD",
#'     use_seps = FALSE
#'   ) |>
#'   tab_options(table.font.size = px(18)) |>
#'   opt_table_font(
#'     font = list(
#'       google_font(name = "Merriweather"),
#'       "Cochin", "Serif"
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_table_font_1.png")`
#' }}
#'
#' Use [`sza`] to create an eleven-row table. Within `opt_table_font()`, set up
#' a preferred list of sans-serif fonts that are commonly available in macOS
#' (using part of the [default_fonts()] vector as a fallback).
#'
#' ```r
#' sza |>
#'   dplyr::filter(
#'     latitude == 20 &
#'       month == "jan" &
#'       !is.na(sza)
#'   ) |>
#'   dplyr::select(-latitude, -month) |>
#'   gt() |>
#'   opt_table_font(
#'     font = c(
#'       "Helvetica Neue", "Segoe UI",
#'       default_fonts()[-c(1:3)]
#'     )
#'   ) |>
#'   opt_all_caps()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_table_font_2.png")`
#' }}
#'
#' @family table option functions
#' @section Function ID:
#' 9-10
#'
#' @export
opt_table_font <- function(
    data,
    font,
    weight = NULL,
    style = NULL,
    add = TRUE
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  existing_fonts <-
    dt_options_get_value(
      data = data,
      option = "table_font_names"
    )

  existing_additional_css <-
    dt_options_get_value(
      data = data,
      option = "table_additional_css"
    )

  font <- normalize_font_input(font_input = font)

  additional_css <- c(font$import_stmt, existing_additional_css)

  data <-
    tab_options(
      data = data,
      table.font.names = c(font$name, if (add) existing_fonts)
    )

  data <-
    tab_options(
      data = data,
      table.additional_css = additional_css
    )

  if (!is.null(weight)) {

    if (is.numeric(weight)) weight <- as.character(weight)

    data <-
      tab_options(
        data = data,
        table.font.weight = weight
      )

    data <-
      tab_options(
        data = data,
        column_labels.font.weight = weight
      )
  }

  if (!is.null(style)) {

    data <-
      tab_options(
        data = data,
        table.font.style = style
      )
  }

  data
}

#' Option to add custom CSS for the table
#'
#' @description
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
#' @section Examples:
#'
#' Use [`exibble`] to create a **gt** table and format the data in both columns.
#' With `opt_css()`, insert CSS rulesets as as string and be sure to set the
#' table ID explicitly (here as `"one"`).
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, currency) |>
#'   gt(id = "one") |>
#'   fmt_currency(
#'     columns = currency,
#'     currency = "HKD"
#'   ) |>
#'   fmt_scientific(columns = num) |>
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
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_css_1.png")`
#' }}
#'
#' @family table option functions
#' @section Function ID:
#' 9-11
#'
#' @export
opt_css <- function(
    data,
    css,
    add = TRUE,
    allow_duplicates = FALSE
) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  existing_additional_css <-
    dt_options_get_value(
      data = data,
      option = "table_additional_css"
    )

  css <- paste(css, collapse = "\n")

  if (!add && !allow_duplicates && css %in% existing_additional_css) {
    return(data)
  }

  additional_css <- c(existing_additional_css, css)

  tab_options(
    data = data,
    table.additional_css = additional_css
  )
}

normalize_font_input <- function(font_input) {

  if (
    !inherits(font_input, "character") &&
    !inherits(font_input, "list") &&
    !inherits(font_input, "font_css")
  ) {
    cli::cli_abort(
      "Values provided to `font` must either be a list or a character vector."
    )
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

    cli::cli_abort(
      "The length of the `values` vector must be `1` or the length of
      `tab_options_args`."
    )
  }

  as.list(stats::setNames(object = values, tab_options_args))
}

create_default_option_value_list <- function(tab_options_args) {

  lapply(
    stats::setNames(, tab_options_args),
    FUN = function(x) {
      dt_options_get_default_value(tidy_gsub(x, ".", "_", fixed = TRUE))
    }
  )
}

dt_options_get_default_value <- function(option) {

  # Validate the provided `option` value
  if (length(option) != 1) {
    cli::cli_abort("A character vector of length one must be provided.")
  }
  if (!(option %in% dt_options_tbl$parameter)) {
    cli::cli_abort("The `option` provided is invalid.")
  }

  dt_options_tbl$value[[which(dt_options_tbl$parameter == option)]]
}

# Get vector of argument names (excluding `data`) from `tab_options`
#' @include tab_create_modify.R
tab_options_arg_names <- base::setdiff(names(formals(tab_options)), "data")

# Create vector of all args from `tab_options()` by
# use of a regex pattern
get_tab_options_arg_vec <- function(pattern) {
  grep(pattern = pattern, tab_options_arg_names, value = TRUE)
}

# Validate any vector of `tab_options()` argument names
validate_tab_options_args <- function(tab_options_args) {

  if (!all(tab_options_args %in% tab_options_arg_names)) {
    cli::cli_abort("All `tab_options_args` must be valid names.")
  }
}

# Do multiple calls of `tab_options()` with an option-value list (`options`)
tab_options_multi <- function(data, options) {

  # Validate the names of the `options`
  validate_tab_options_args(names(options))

  do.call(tab_options, c(list(data = data), options))
}
