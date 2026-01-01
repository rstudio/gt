#------------------------------------------------------------------------------#
#
#                /$$
#               | $$
#     /$$$$$$  /$$$$$$
#    /$$__  $$|_  $$_/
#   | $$  \ $$  | $$
#   | $$  | $$  | $$ /$$
#   |  $$$$$$$  |  $$$$/
#    \____  $$   \___/
#    /$$  \ $$
#   |  $$$$$$/
#    \______/
#
#  This file is part of the 'rstudio/gt' project.
#
#  Copyright (c) 2018-2026 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


# opt_stylize() ----------------------------------------------------------------
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
#'
#' @param style *Table style*
#'
#'   `scalar<numeric|integer>(1>=val>=6)` // *default:* `1`
#'
#'   Six numbered styles are available. Simply provide a number from `1` (the
#'   default) to `6` to choose a distinct look.
#'
#' @param color *Color variation*
#'
#'   `scalar<character>` // *default:* `"blue"`
#'
#'   There are six color variations: `"blue"`, `"cyan"`, `"pink"`, `"green"`,
#'   `"red"`, and `"gray"`.
#'
#' @param add_row_striping *Allow row striping*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   An option to enable row striping in the table body for the `style` chosen.
#'
#' @return an object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use `exibble` to create a **gt** table with a number of table parts added.
#' Then, use `opt_stylize()` to give the table some additional style
#' (using the `"cyan"` color variation and style number `6`).
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
#' 10-1
#'
#' @section Function Introduced:
#' `v0.7.0` (Aug 25, 2022)
#'
#' @export
opt_stylize <- function(
    data,
    style = 1,
    color = "blue",
    add_row_striping = TRUE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  if (!(length(style) == 1 && style %in% 1:6)) {
    cli::cli_abort("The `style` value must be a number in the range of 1 to 6.")
  }

  if (!(length(color) == 1 && color %in% unique(styles_colors_params$color))) {
    cli::cli_abort(c(
      "The `color` value must be one of six specific colors:",
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

  res <-
    vctrs::vec_slice(
      styles_colors_params,
      styles_colors_params$style == style &
        styles_colors_params$color == color
    )
  as.list(res)
}

# opt_interactive() ------------------------------------------------------------
#' Option to put interactive elements in an HTML table
#'
#' @description
#'
#' By default, a **gt** table rendered as HTML will essentially be a 'static'
#' table. However, we can make it 'interactive' and configure those interactive
#' HTML options through the `opt_interactive()` function. Making an HTML table
#' interactive entails the enabling of controls for pagination, global search,
#' filtering, sorting, and more.
#'
#' This function serves as a shortcut for setting the following options in
#' [tab_options()]:
#'
#' - `ihtml.active`
#' - `ihtml.use_pagination`
#' - `ihtml.use_pagination_info`
#' - `ihtml.use_sorting`
#' - `ihtml.use_search`
#' - `ihtml.use_filters`
#' - `ihtml.use_resizers`
#' - `ihtml.use_highlight`
#' - `ihtml.use_compact_mode`
#' - `ihtml.use_page_size_select`
#' - `ihtml.page_size_default`
#' - `ihtml.page_size_values`
#' - `ihtml.pagination_type`
#' - `ihtml.height`
#' - `ihtml.selection_mode`
#'
#' @inheritParams fmt_number
#'
#' @param active *Display interactive HTML table*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   The `active` option will either enable or disable interactive features for
#'   an HTML table. The individual features of an interactive HTML table are
#'   controlled by the other options.
#'
#' @param use_pagination *Display pagination controls*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   This is the option for using pagination controls (below the table body). By
#'   default, this is `TRUE` and it will allow the use to page through table
#'   content.
#'
#' @param use_pagination_info *Display pagination info*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   If `use_pagination` is `TRUE` then the `use_pagination_info` option can be
#'   used to display informational text regarding the current page view (this is
#'   set to `TRUE` by default).
#'
#' @param use_sorting *Provide column sorting controls*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   This option provides controls for sorting column values. By default, this
#'   is `TRUE`.
#'
#' @param use_search *Provide a global search field*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   The `use_search` option places a search field for globally filtering rows
#'   to the requested content. By default, this is `FALSE`.
#'
#' @param use_filters *Display filtering fields*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   The `use_filters` option places search fields below each column header and
#'   allows for filtering by column. By default, this is `FALSE`.
#'
#' @param use_resizers *Allow column resizing*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   This option allows for the interactive resizing of columns. By default,
#'   this is `FALSE`.
#'
#' @param use_highlight *Enable row highlighting on hover*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   The `use_highlight` option highlights individual rows upon hover. By
#'   default, this is `FALSE`.
#'
#' @param use_compact_mode *Use compact mode*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   To reduce vertical padding and thus make the table consume less vertical
#'   space the `use_compact_mode` option can be used. By default, this is
#'   `FALSE`.
#'
#' @param use_text_wrapping *Use text wrapping*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   The `use_text_wrapping` option controls whether text wrapping occurs
#'   throughout the table. This is `TRUE` by default and with that text will be
#'   wrapped to multiple lines. If `FALSE`, text will be truncated to a single
#'   line.
#'
#' @param use_page_size_select *Allow for page size selection*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   The `use_page_size_select` option lets us display a dropdown menu for the
#'   number of rows to show per page of data.
#'
#' @param page_size_default *Change the default page size*
#'
#'   `scalar<numeric|integer>` // *default:* `10`
#'
#'   The default page size (initially set as `10`) can be modified with
#'   `page_size_default` and this works whether or not `use_page_size_select` is
#'   set to `TRUE`.
#'
#' @param page_size_values *Set of page-size values*
#'
#'   `vector<numeric|integer>` // *default:* `c(10, 25, 50, 100)`
#'
#'   By default, this is the vector `c(10, 25, 50, 100)` which corresponds to
#'   options for `10`, `25`, `50`, and `100` rows of data per page. To modify
#'   these page-size options, provide a numeric vector to `page_size_values`.
#'
#' @param pagination_type *Change pagination mode*
#'
#'   `scalar<character>` // *default:* `"numbers"`
#'
#'   When using pagination the `pagination_type` option lets us select between
#'   one of three options for the layout of pagination controls. The default is
#'   `"numbers"`, where a series of page-number buttons is presented along with
#'   'previous' and 'next' buttons. The `"jump"` option provides an input field
#'   with a stepper for the page number. With `"simple"`, only the 'previous'
#'   and 'next' buttons are displayed.
#'
#' @param height *Height of interactive HTML table*
#'
#'   Height of the table in pixels. Defaults to `"auto"` for automatic sizing.
#'
#' @param selection_mode *Allow row selection*
#'
#'    `scalar<character>` // *default:* `NULL`
#'
#'    The `selection_mode` options allows users to select rows by clicking them.
#'    When this option is `"single"`, clicking another value toggles selection
#'    of the previously selected row off. When this option is `"multiple"`,
#'    multiple rows can be selected at once. Selected values are available in
#'    Shiny apps when `selection_mode` is not `NULL` and the table is used in
#'    [render_gt()].
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use select columns from the [`towny`] dataset to create a **gt** table with a
#' header (through [tab_header()]) and a source note (through
#' [tab_source_note()]). Next, we will add interactive HTML features (and
#' otherwise activate interactive HTML mode) through `opt_interactive()`. It'll
#' just be the default set of interactive options.
#'
#' ```r
#' towny |>
#'   dplyr::select(name, census_div, starts_with("population")) |>
#'   gt() |>
#'   fmt_integer() |>
#'   cols_label_with(fn = function(x) sub("population_", "", x)) |>
#'   cols_width(
#'     name ~ px(200),
#'     census_div ~ px(200)
#'   ) |>
#'   tab_header(
#'     title = "Populations of Municipalities",
#'     subtitle = "Census values from 1996 to 2021."
#'   ) |>
#'   tab_source_note(source_note = md("Data taken from the `towny` dataset.")) |>
#'   opt_interactive()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_interactive_1.png")`
#' }}
#'
#' Interactive tables can have styled body cells. Here, we use the [`gtcars`]
#' dataset to create an interactive **gt** table. Using [tab_style()] and
#' [data_color()] we can flexibly style body cells throughout the table.
#'
#' ```r
#' gtcars |>
#'   gt() |>
#'   cols_width(everything() ~ px(130)) |>
#'   tab_style(
#'     style = cell_fill(color = "gray95"),
#'     locations = cells_body(columns = c(mfr, model))
#'   ) |>
#'   data_color(
#'     columns = c(starts_with("hp"), starts_with("trq")),
#'     method = "numeric",
#'     palette = "viridis"
#'   ) |>
#'   cols_hide(columns = trim) |>
#'   opt_interactive()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_interactive_2.png")`
#' }}
#'
#' @family table option functions
#' @section Function ID:
#' 10-2
#'
#' @section Function Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
#' @export
opt_interactive <- function(
    data,
    active = TRUE,
    use_pagination = TRUE,
    use_pagination_info = TRUE,
    use_sorting = TRUE,
    use_search = FALSE,
    use_filters = FALSE,
    use_resizers = FALSE,
    use_highlight = FALSE,
    use_compact_mode = FALSE,
    use_text_wrapping = TRUE,
    use_page_size_select = FALSE,
    page_size_default = 10,
    page_size_values = c(10, 25, 50, 100),
    pagination_type = c("numbers", "jump", "simple"),
    height = "auto",
    selection_mode = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  pagination_type <-
    rlang::arg_match0(pagination_type, values = c("numbers", "jump", "simple"))

  tab_options(
    data = data,
    ihtml.active = active,
    ihtml.use_pagination = use_pagination,
    ihtml.use_pagination_info = use_pagination_info,
    ihtml.use_sorting = use_sorting,
    ihtml.use_search = use_search,
    ihtml.use_filters = use_filters,
    ihtml.use_resizers = use_resizers,
    ihtml.use_highlight = use_highlight,
    ihtml.use_compact_mode = use_compact_mode,
    ihtml.use_text_wrapping = use_text_wrapping,
    ihtml.use_page_size_select = use_page_size_select,
    ihtml.page_size_default = page_size_default,
    ihtml.page_size_values = page_size_values,
    ihtml.pagination_type = pagination_type,
    ihtml.height = height,
    ihtml.selection_mode = selection_mode
  )
}

# opt_footnote_marks() ---------------------------------------------------------
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
#'
#' @param marks *Sequence of footnote marks*
#'
#'   `vector<character>` // *default:* `"numbers"`
#'
#'   Either a character vector of length greater than 1 (that will represent the
#'   series of marks) or a single keyword that represents a preset sequence of
#'   marks. The valid keywords are: `"numbers"` (for numeric marks), `"letters"`
#'   and `"LETTERS"` (for lowercase and uppercase alphabetic marks),
#'   `"standard"` (for a traditional set of four symbol marks), and `"extended"`
#'   (which adds two more symbols to the standard set).
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Specification of footnote marks:
#'
#' We can supply a vector that will represent the series of marks. The series of
#' footnote marks is recycled when its usage goes beyond the length of the set.
#' At each cycle, the marks are simply doubled, tripled, and so on (e.g., `*` ->
#' `**` -> `***`). The option exists for providing keywords for certain types of
#' footnote marks. The keywords are:
#'
#' - `"numbers"`: numeric marks, they begin from 1 and these marks are not
#' subject to recycling behavior
#' - `"letters"`: minuscule alphabetic marks, internally uses the `letters`
#' vector which contains 26 lowercase letters of the Roman alphabet
#' - `"LETTERS"`: majuscule alphabetic marks, using the `LETTERS` vector
#' which has 26 uppercase letters of the Roman alphabet
#' - `"standard"`: symbolic marks, four symbols in total
#' - `"extended"`: symbolic marks, extends the standard set by adding two
#' more symbols, making six
#'
#' The symbolic marks are the: (1) Asterisk, (2) Dagger, (3) Double Dagger,
#' (4) Section Sign, (5) Double Vertical Line, and (6) Paragraph Sign; the
#' `"standard"` set has the first four, `"extended"` contains all.
#'
#' @section Examples:
#'
#' Use a summarized version of the [`sza`] dataset to create a **gt** table,
#' adding three footnotes (with three calls of [tab_footnote()]). We can modify
#' the footnote marks to use with the `opt_footnote_marks()` function. With the
#' keyword `"standard"` we get four commonly-used typographic marks.
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
#' 10-3
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
opt_footnote_marks <- function(
    data,
    marks = "numbers"
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Validate input for `marks`
  validate_marks(marks)

  tab_options(data = data, footnotes.marks = marks)
}

# opt_footnote_spec() ----------------------------------------------------------
#' Option to specify the formatting of footnote marks
#'
#' @description
#'
#' Modify the way footnote marks are formatted. This can be performed for those
#' footnote marks that alight to the targeted text in cells in various locations
#' in the table or the footnote marks that appear in the table footer. A simple
#' specification string can be provided for either or both types of marks in
#' `opt_footnote_spec()` . This function serves as a shortcut for using either
#' of `tab_options(footnotes.spec_ref = {spec})` or
#' `tab_options(footnotes.spec_ftr = {spec})`.
#'
#' @inheritParams fmt_number
#'
#' @param spec_ref,spec_ftr *Specifications for formatting of footnote marks*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   Specification of the footnote marks when behaving as footnote references
#'   and as marks in the footer section of the table. This is a string
#'   containing spec characters. The default is the spec string `"^i"`, which is
#'   superscript text set in italics.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Specification rules for the formatting of footnote marks:
#'
#' A footnote spec consists of a string containing control characters for
#' formatting. Not every type of formatting makes sense for footnote marks so
#' the specification is purposefully constrained to the following:
#'
#' - as superscript text (with the `"^"` control character) or regular-sized
#' text residing on the baseline
#' - bold text (with `"b"`), italicized text (with `"i"`), or unstyled text
#' (don't use either of the `"b"` or `"i"` control characters)
#' - enclosure in parentheses (use `"("` / `")"`) or square brackets (with
#' `"["` / `"]"`)
#' - a period following the mark (using `"."`); this is most commonly used in
#' the table footer
#'
#' With the aforementioned control characters we could, for instance, format
#' the footnote marks to be superscript text in bold type with `"^b"`. We might
#' want the marks in the footer to be regular-sized text in parentheses, so the
#' spec could be either `"()"` or `"(x)"` (you can optionally use `"x"` as a
#' helpful placeholder for the marks).
#'
#' @section Examples:
#'
#' Use a modified version of [`sp500`] the dataset to create a **gt** table with
#' row labels. We'll add two footnotes using the `tab_footnote()` function. We
#' can call `opt_footnote_spec()` to specify that the marks of the footnote
#' reference should be superscripts in bold, and, the marks in the footer
#' section should be enclosed in parentheses.
#'
#' ```r
#' sp500 |>
#'   dplyr::filter(date >= "1987-10-14" & date <= "1987-10-25") |>
#'   dplyr::select(date, open, close, volume) |>
#'   dplyr::mutate(difference = close - open) |>
#'   dplyr::mutate(change = (close - open) / open) |>
#'   dplyr::mutate(day = vec_fmt_datetime(date, format = "E")) |>
#'   dplyr::arrange(-dplyr::row_number()) |>
#'   gt(rowname_col = "date") |>
#'   fmt_currency() |>
#'   fmt_number(columns = volume, suffixing = TRUE) |>
#'   fmt_percent(columns = change) |>
#'   cols_move_to_start(columns = day) |>
#'   cols_width(
#'     stub() ~ px(130),
#'     day ~ px(50),
#'     everything() ~ px(100)
#'   ) |>
#'   tab_footnote(
#'     footnote = "Commerce report on trade deficit.",
#'     locations = cells_stub(rows = 1)
#'   ) |>
#'   tab_footnote(
#'     footnote = "Black Monday market crash, representing the greatest
#'     one-day percentage decline in U.S. stock market history.",
#'     locations = cells_body(columns = change, rows = change < -0.15)
#'   ) |>
#'   opt_footnote_spec(spec_ref = "^xb", spec_ftr = "(x)")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_footnote_spec_1.png")`
#' }}
#'
#' @family table option functions
#' @section Function ID:
#' 10-4
#'
#' @section Function Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
#' @export
opt_footnote_spec <- function(
    data,
    spec_ref = NULL,
    spec_ftr = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  if (!is.null(spec_ref)) {
    data <- tab_options(data = data, footnotes.spec_ref = spec_ref)
  }

  if (!is.null(spec_ftr)) {
    data <- tab_options(data = data, footnotes.spec_ftr = spec_ftr)
  }

  data
}

# opt_footnote_order() ---------------------------------------------------------
#' Option to modify the order of footnotes
#'
#' @description
#'
#' We can alter the order in which marked footnotes appear in relation to any
#' unmarked footnotes in the footer section of the table. A single keyword is to
#' be supplied and it will determine whether marked footnotes should appear:
#' (1) before unmarked, (2) after unmarked, or (3) in call order.
#'
#' @inheritParams fmt_number
#'
#' @param order *Method for ordering footnote marks*
#'
#'   `scalar<character>` // *default:* `"marks_last"`
#'
#'   A keyword provided here will determine how marked footnotes will be
#'   arranged in relation to unmarked footnotes. Use either: `"marks_last"`,
#'   `"marks_first"`, or `"preserve_order"`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Specification of footnote order:
#'
#' The keywords are:
#'
#' - `"marks_last"`: marked footnotes should appear beneath unmarked in the
#' table (default)
#' - `"marks_first"`: marked footnotes should appear before unmarked in the
#' table
#' - `"preserve_order"`: footnotes will appear in the order they were specified
#' in [tab_footnote()]
#'
#' @section Examples:
#'
#' Use a summarized version of the [`sza`] dataset to create a **gt** table,
#' adding three marked footnotes and one unmarked (with four calls of
#' [tab_footnote()]). We can modify the order of footnotes with the
#' `opt_footnote_order()` function.
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
#'   tab_footnote(
#'     footnote = "Values calculated on the first of every month."
#'   ) |>
#'   opt_footnote_order(order = "marks_first")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_footnote_order_1.png")`
#' }}
#'
#' @family table option functions
#' @section Function ID:
#' 10-5
#'
#' @section Function Introduced:
#' `v0.1.1.9000` (September 22, 2025)
#'
#' @export
opt_footnote_order <- function(
    data,
    order = "marks_last"
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Validate input for `order`
  validate_footnote_order(order)

  tab_options(data = data, footnotes.order = order)
}


# opt_row_striping() -----------------------------------------------------------
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
#'
#' @param row_striping *Use alternating row stripes*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   A logical value to indicate whether row striping should be added or
#'   removed.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use the [`exibble`] dataset to create a **gt** table with a number of table
#' parts added (using functions like [summary_rows()], [grand_summary_rows()],
#' and more). Following that, we'll add row striping to every second row with
#' `opt_row_striping()`.
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
#' 10-6
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
opt_row_striping <- function(
    data,
    row_striping = TRUE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  tab_options(
    data = data,
    row.striping.include_table_body = row_striping
  )
}

# opt_align_table_header() -----------------------------------------------------
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
#'
#' @param align *Header alignment*
#'
#'   `singl-kw:[left|center|right]` // *default:* `"left"`
#'
#'   The alignment of the title and subtitle elements in the table header.
#'   Options are `"left"` (the default), `"center"`, or `"right"`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use the [`exibble`] dataset to create a **gt** table with a number of table
#' parts added (using functions like [summary_rows()], [grand_summary_rows()],
#' and more). Following that, we'll align the header contents (consisting of the
#' title and the subtitle) to the left with the `opt_align_table_header()`
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
#'   opt_align_table_header(align = "left")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_align_table_header_1.png")`
#' }}
#'
#' @family table option functions
#' @section Function ID:
#' 10-7
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
opt_align_table_header <- function(
    data,
    align = c("left", "center", "right")
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  align <- rlang::arg_match0(align, values = c("left", "center", "right"))

  tab_options(
    data = data,
    heading.align = align
  )
}

# opt_vertical_padding() -------------------------------------------------------
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
#'
#' @param scale *Scale factor*
#'
#'   `scalar<numeric|integer>(0>=val>=3)` // *default:* `1`
#'
#'   A scale factor by which the vertical padding will be adjusted. Must be a
#'   number between `0` and `3`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use the [`exibble`] dataset to create a **gt** table with a number of table
#' parts added (using functions like [summary_rows()], [grand_summary_rows()],
#' and more). Following that, we'll lessen the amount of vertical padding across
#' the entire table with `opt_vertical_padding()`. Using a `scale` value of
#' `0.25` (down from the default of `1`) means the vertical space will be
#' greatly reduced, resulting in a more compact table.
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
#' 10-8
#'
#' @section Function Introduced:
#' `v0.4.0` (February 15, 2022)
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

# opt_horizontal_padding() -----------------------------------------------------
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
#'
#' @param scale *Scale factor*
#'
#'   `scalar<numeric|integer>(0>=val>=3)` // *default:* `1`
#'
#'   A scale factor by which the horizontal padding will be adjusted. Must be a
#'   number between `0` and `3`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use the [`exibble`] dataset to create a **gt** table with a number of table
#' parts added (using functions like [summary_rows()], [grand_summary_rows()],
#' and more). Following that, we'll increase the amount of horizontal padding
#' across the entire table with `opt_horizontal_padding()`. Using a `scale`
#' value of `3` (up from the default of `1`) means the horizontal space will
#' be greatly increased, resulting in a more spacious table.
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
#' 10-9
#'
#' @section Function Introduced:
#' `v0.4.0` (February 15, 2022)
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
  check_number_decimal(scale, min = 0, max = 3)

  pattern <- if (type == "vertical") "_padding" else  "_padding_horizontal"

  # Get the padding parameters from `dt_options_tbl` that relate
  # to the `type` (either vertical or horizontal padding)
  padding_params <-
    vctrs::vec_slice(
      dt_options_tbl$parameter,
      endsWith(dt_options_tbl$parameter, pattern)
    )

  padding_options <-
    vctrs::vec_slice(
      dt_options_tbl[, c("parameter", "value")],
      dt_options_tbl$parameter %in% padding_params
    )

  replacement <- gsub("_", ".", pattern, fixed = TRUE)

  padding_options$parameter <- gsub(pattern, replacement, padding_options$parameter, fixed = TRUE)
  padding_options$value <- unlist(padding_options$value)
  padding_options$px <- as.numeric(gsub("px", "", padding_options$value, fixed = TRUE))
  padding_options$px <- padding_options$px * scale

  create_option_value_list(
    padding_options$parameter,
    paste0(padding_options$px, "px")
  )
}

# opt_all_caps() ---------------------------------------------------------------
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
#'
#' @param all_caps *Use all-caps transformation*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   A logical value to indicate whether the text transformation to all caps
#'   should be performed (`TRUE`, the default) or reset to default values
#'   (`FALSE`) for the `locations` targeted.
#'
#' @param locations *Locations to target*
#'
#'   `mult-kw:[column_labels|stub|row_group]` // *default:* `c("column_labels", "stub", "row_group")`
#'
#'   Which locations should undergo this text transformation? By default it
#'   includes all of the `"column_labels"`, the `"stub"`, and the `"row_group"`
#'   locations. However, we could just choose one or two of those.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use the [`exibble`] dataset to create a **gt** table with a number of table
#' parts added (using functions like [summary_rows()], [grand_summary_rows()],
#' and more). Following that, we'll ensure that all text in the column labels,
#' the stub, and in all row groups is transformed to all caps using
#' `opt_all_caps()`.
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
#' 10-10
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
opt_all_caps <- function(
    data,
    all_caps = TRUE,
    locations = c("column_labels", "stub", "row_group")
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

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
        endsWith(options_vec, ".font.size") ~ "80%",
        endsWith(options_vec, ".font.weight") ~ "bolder",
        endsWith(options_vec, ".text_transform") ~ "uppercase"
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

# opt_table_lines() ------------------------------------------------------------
#' Option to set table lines to different extents
#'
#' @description
#'
#' `opt_table_lines()` sets table lines in one of three possible ways:
#' (1) all possible table lines drawn (`"all"`), (2) no table lines at all
#' (`"none"`), and (3) resetting to the default line styles (`"default"`). This
#' is great if you want to start off with lots of lines and subtract just a few
#' of them with [tab_options()] or [tab_style()]. Or, use it to start with a
#' completely lineless table, adding individual lines as needed.
#'
#' @inheritParams fmt_number
#'
#' @param extent *Extent of lines added*
#'
#'   `singl-kw:[all|none|default]` // *default:* `"all"`
#'
#'   The extent to which lines will be visible in the table. Options are
#'   `"all"`, `"none"`, or `"default"`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use the [`exibble`] dataset to create a **gt** table with a number of table
#' parts added (using functions like [summary_rows()], [grand_summary_rows()],
#' and more). Following that, we'll use the `opt_table_lines()` function to
#' generate lines everywhere there can possibly be lines (the default for the
#' `extent` argument is `"all"`).
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
#' 10-11
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
opt_table_lines <- function(
    data,
    extent = c("all", "none", "default")
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  extent <- rlang::arg_match0(extent, values = c("all", "none", "default"))

  # Normalize `extent` values to property values
  values_vec <- if (extent == "all") "solid" else extent

  # Get vector of `tab_options()` arg names for all table line styles
  options_vec <- get_tab_options_arg_vec(pattern = "\\.style$")
  # Remove font.style from affected options
  options_vec <- grep("font", options_vec, value = TRUE, invert = TRUE)

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

# opt_table_outline() ----------------------------------------------------------
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
#'
#' @param style *Outline style property*
#'
#'   `scalar<character>` // *default:* `"solid"`
#'
#'   The style property for the table outline. By default, this is `"solid"`. If
#'   `"none"` is used then the outline is removed and any values provided for
#'   `width` and `color` will be ignored (i.e., not set).
#'
#' @param width *Outline width value*
#'
#'   `scalar<character>` // *default:* `px(3)`
#'
#'   The width property for the table outline. By default, this is `px(3)` (or,
#'   `"3px"`).
#'
#' @param color *Color of outline*
#'
#'   `scalar<character>` // *default:* `"#D3D3D3"`
#'
#'   The color of the table outline. By default, this is `"#D3D3D3"`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Use the [`exibble`] dataset to create a **gt** table with a number of table
#' parts added (using functions like [summary_rows()], [grand_summary_rows()],
#' and more). Following that, let's make it so that we have an outline wrap
#' around the entire table by using the `opt_table_outline()` function.
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
#' 10-12
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
opt_table_outline <- function(
    data,
    style = "solid",
    width = px(3),
    color = "#D3D3D3"
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

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

  width <- width %||% NA_character_
  color <- color %||% NA_character_

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

# opt_table_font() -------------------------------------------------------------
#' Options to define font choices for the entire table
#'
#' @description
#'
#' `opt_table_font()` makes it possible to define fonts used for an entire
#' **gt** table. Any font names supplied in `font` will (by default, with
#' `add = TRUE`) be placed before the names present in the existing font stack
#' (i.e., they will take precedence). You can choose to base the font stack on
#' those provided by [system_fonts()] by providing a valid keyword for a themed
#' set and optionally prepending `font` values to that.
#'
#' Take note that you could still have entirely different fonts in specific
#' locations of the table. For that you would need to use [tab_style()] or
#' [tab_style_body()] in conjunction with [cell_text()].
#'
#' @inheritParams fmt_number
#'
#' @param font *Default table fonts*
#'
#'   `vector<character>|list|obj:<font_css>` // *default:* `NULL` (`optional`)
#'
#'   One or more font names available as system or web fonts. These can be
#'   combined with a `c()` or a `list()`. To choose fonts from the
#'   *Google Fonts* service, we can call the [google_font()] helper function.
#'
#' @param stack *Name of font stack*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   A name that is representative of a font stack (obtained via internally via
#'   the [system_fonts()] helper function). If provided, this new stack will
#'   replace any defined fonts and any `font` values will be prepended.
#'
#' @param size *Text size*
#'
#'   `scalar<character|numeric|integer>` // *default:* `NULL` (`optional`)
#'
#'   The text size for the entire table can be set by providing a `size` value.
#'   Can be specified as a single-length character vector with units of pixels
#'   (e.g., `12px`) or as a percentage (e.g., `80%`). If provided as a
#'   single-length numeric vector, it is assumed that the value is given in
#'   units of pixels. The [px()] and [pct()] helper functions can also be used
#'   to pass in numeric values and obtain values as pixel or percentage units.
#'
#' @param style *Text style*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An option to modify the text style. Can be one of either `"normal"`,
#'   `"italic"`, or `"oblique"`.
#'
#' @param weight *Text weight*
#'
#'   `scalar<character|numeric|integer>` // *default:* `NULL` (`optional`)
#'
#'   Option to set the weight of the font. Can be a text-based keyword such as
#'   `"normal"`, `"bold"`, `"lighter"`, `"bolder"`, or, a numeric value between
#'   `1` and `1000`, inclusive. Please note that typefaces have varying support
#'   for the numeric mapping of weight.
#'
#' @param color *Text color*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   The `color` option defines the text color used throughout the table. A
#'   color name or a hexadecimal color code should be provided.
#'
#' @param add *Add to existing fonts*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   Should fonts be added to the beginning of any already-defined fonts for the
#'   table? By default, this is `TRUE` and is recommended since those fonts
#'   already present can serve as fallbacks when everything specified in `font`
#'   is not available. If a `stack` is provided, then `add` will automatically
#'   set to `FALSE`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Possibilities for the `font` argument:
#'
#' We have the option to supply one or more font names for the `font` argument.
#' They can be enclosed in `c()` or a `list()`. You can generate this list or
#' vector with a combination of font names, and you can freely use
#'  [google_font()], [default_fonts()], and [system_fonts()] to help compose
#'  your font family.
#'
#' @section Possibilities for the `stack` argument:
#'
#' There are several themed font stacks available via the [system_fonts()]
#' helper function. That function can be used to generate all or a segment of a
#' vector supplied to the `font` argument. However, using the `stack` argument
#' with one of the 15 keywords for the font stacks available in
#' `system_fonts()`, we could be sure that the typeface class will work across
#' multiple computer systems. Any of the following keywords can be used:
#'
#' - `"system-ui"`
#' - `"transitional"`
#' - `"old-style"`
#' - `"humanist"`
#' - `"geometric-humanist"`
#' - `"classical-humanist"`
#' - `"neo-grotesque"`
#' - `"monospace-slab-serif"`
#' - `"monospace-code"`
#' - `"industrial"`
#' - `"rounded-sans"`
#' - `"slab-serif"`
#' - `"antique"`
#' - `"didone"`
#' - `"handwritten"`
#'
#' @section Examples:
#'
#' Use a subset of the [`sp500`] dataset to create a small **gt** table. We'll
#' use [fmt_currency()] to display a dollar sign for the first row of monetary
#' values. The `"Merriweather"` font (from *Google Fonts*, via [google_font()])
#' with two system font fallbacks (`"Cochin"` and the generic `"serif"`).
#'
#' ```r
#' sp500 |>
#'   dplyr::slice(1:10) |>
#'   dplyr::select(-volume, -adj_close) |>
#'   gt() |>
#'   fmt_currency(
#'     rows = 1,
#'     use_seps = FALSE
#'   ) |>
#'   opt_table_font(
#'     font = list(
#'       google_font(name = "Merriweather"),
#'       "Cochin", "serif"
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_table_font_1.png")`
#' }}
#'
#' With the [`sza`] dataset we'll create a two-column, eleven-row table. Within
#' `opt_table_font()`, the `stack` argument will be supplied with the
#' `"rounded-sans"` font stack. This sets up a family of fonts with rounded,
#' curved letterforms that should be locally available in different computing
#' environments.
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
#'   opt_table_font(stack = "rounded-sans") |>
#'   opt_all_caps()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_opt_table_font_2.png")`
#' }}
#'
#' @family table option functions
#' @section Function ID:
#' 10-13
#'
#' @section Function Introduced:
#' `v0.2.2` (August 5, 2020)
#'
#' @export
opt_table_font <- function(
    data,
    font = NULL,
    stack = NULL,
    size = NULL,
    weight = NULL,
    style = NULL,
    color = NULL,
    add = TRUE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

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

  if (!is.null(font)) {

    font <- normalize_font_input(font_input = font)
    additional_css <- c(font$import_stmt, existing_additional_css)

    data <-
      tab_options(
        data = data,
        table.additional_css = additional_css
      )
  }

  if (!is.null(stack)) {

    font_stack <- system_fonts(name = stack)

    data <-
      tab_options(
        data = data,
        table.font.names = c(font$name, font_stack)
      )

  } else {

    data <-
      tab_options(
        data = data,
        table.font.names = c(font$name, if (add) existing_fonts)
      )
  }

  if (!is.null(size)) {

    data <-
      tab_options(
        data = data,
        table.font.size = size
      )

  }

  if (!is.null(weight)) {

    if (is.numeric(weight)) {
      weight <- as.character(weight)
    }

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

  if (!is.null(color)) {

    data <-
      tab_options(
        data = data,
        table.font.color = color
      )
  }

  data
}

# opt_css() --------------------------------------------------------------------
#' Option to add custom CSS for the table
#'
#' @description
#'
#' `opt_css()` makes it possible to add CSS to a **gt** table. This  CSS will be
#' added after the compiled CSS that **gt** generates automatically when the
#' object is transformed to an HTML output table. You can supply `css` as a
#' vector of lines or as a single string.
#'
#' @inheritParams fmt_number
#'
#' @param css *CSS declarations*
#'
#'   `scalar<character>` // **required**
#'
#'   The CSS to include as part of the rendered table's `<style>` element.
#'
#' @param add *Add to existing CSS*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   If `TRUE`, the default, the CSS is added to any already-defined CSS
#'   (typically from previous calls of [opt_table_font()], `opt_css()`, or,
#'   directly setting CSS the `table.additional_css` value in [tab_options()]).
#'   If this is set to `FALSE`, the CSS provided here will replace any
#'   previously-stored CSS.
#'
#' @param allow_duplicates *Allow for CSS duplication*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   When this is `FALSE` (the default), the CSS provided here won't be added
#'   (provided that `add = TRUE`) if it is seen in the already-defined CSS.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Let's use the [`exibble`] dataset to create a simple, two-column **gt** table
#' (keeping only the `num` and `currency` columns). Through use of the
#' `opt_css()` function, we can insert CSS rulesets as as string. We need to
#' ensure that the table ID is set explicitly (we've done so here with the
#' ID value of `"one"`, setting it in the [gt()] function).
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
#' 10-14
#'
#' @section Function Introduced:
#' `v0.2.2` (August 5, 2020)
#'
#' @export
opt_css <- function(
    data,
    css,
    add = TRUE,
    allow_duplicates = FALSE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

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
