#' Use a preset table that has a colorful look
#'
#' This preset function applies a set of styles related to background colors,
#' line colors, and line styles. There are six `style`s to choose from, they
#' largely vary in the extent of coloring applied to different locations. Some
#' have table borders applied, some apply darker colors to the table stub and
#' summary sections, and, some even have vertical lines. In addition to `style`,
#' there are seven `color` variations that each use a range of five color tints.
#' Each of the color tints have been fine-tuned to maximize the contrast between
#' text and its background. In total, There are 42 combinations of `style` and
#' `color`. We can use the [info_preset_colorized()] function to get an
#' information table which has the names and previews for each of the color list
#' keywords.
#'
#' A preset function incorporates the idea of a 'table reset' in that all of the
#' options values available in [tab_options()] will be first reset to their
#' default values. A preset function will then apply the appropriate options
#' values to achieve the desired look. So, any additional tweaks through the use
#' of [tab_options()] or any of the `opt_*()` functions should be done after
#' calling a `preset_*()` function such as this one.
#'
#' @inheritParams fmt_number
#' @param style Six numbered styles are available. Simply provide a number from
#'   `1` (the default) to `6` to choose a distinct look.
#' @param color There are seven color variations: `"blue"` (the default),
#'   `"orange"`, `"aqua"`, `"pink"`, `"green"`, `"red"`, and `"gray"`.
#'
#' @return an object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table with
#' # a number of table parts added; then, use
#' # the `preset_colorized()` function to give
#' # the table some additional style (using
#' # the `"aqua"` color variation and style
#' # number `6`)
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
#'     locations = cells_data(columns = 1, rows = 1)
#'   ) %>%
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) %>%
#'   preset_colorized(style = 6, color = "aqua")
#'
#' @section Figures:
#' \if{html}{\figure{man_preset_colorized_1.svg}{options: width=100\%}}
#'
#' @family table preset functions
#'
#' @export
preset_colorized <- function(data,
                             style = 1,
                             color = "blue") {

  if (!(length(style) == 1 && style %in% 1:6)) {
    stop("The `style` value must be a number in the range of 1 to 6",
         call. = FALSE)
  }

  if (!(length(color) == 1 && color %in% names(preset_colors))) {
    stop("The `color` value must be one of seven specific colors:\n",
         " * `\"blue\"`, `\"orange\"`, `\"aqua\"`, `\"pink\"`, `\"green\"`, ",
         "`\"red\"`, or `\"gray\"`",
         call. = FALSE)
  }

  # Get the set of parameters based on the `style` and `color` values
  params <-
    get_colorized_params(
      styles_colors_params = styles_colors_params,
      style = style,
      color = color
    )

  # TODO: develop a function that performs a table reset; it
  #       only resets the table style parameters in `_options`
  tbl_colorized <-
    data %>%
    dt_options_init() %>%
    tab_options(
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
      tbl_colorized %>%
      opt_add_table_outline(color = params$table_outline_color, width = px(3))
  }

  tbl_colorized
}

#' Use preset table with background colors at different locations
#'
#' This preset function applies background colors to different locations in the
#' table. It relies either on a keyword for a color list, or, a
#' `location_color_list` object. Alternatively, a `location_color_list`
#' object can be generated with the [location_colors()] function.
#'
#' A preset function incorporates the idea of a 'table reset' in that all of the
#' options values available in [tab_options()] will be first reset to their
#' default values. A preset function will then apply the appropriate options
#' values to achieve the desired look. So, any additional tweaks through the use
#' of [tab_options()] or any of the `opt_*()` functions should be done after
#' calling a `preset_*()` function such as this one.
#'
#' @inheritParams fmt_number
#' @param colors A valid keyword for a color list, or, a `location_color_list`
#'   object. The color list keywords are: `"blues"`, `"grays"`, `"purples"`,
#'   `"pinks"`, `"greens"`, `"pastels"`, `"moonlight"`, `"beach"`,
#'   `"cappuccino"`, `"space_gray"`, and `"sand_and_sky"`. A
#'   `location_color_list` can be made by using the [location_colors()]
#'   function.
#'
#' @return an object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table with
#' # a number of table parts added; then, use
#' # the `preset_location_colors()` function
#' # to add `"space_gray"` background colors
#' # to various table locations
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
#'     locations = cells_data(columns = 1, rows = 1)
#'   ) %>%
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) %>%
#'   preset_location_colors(colors = "space_gray")
#'
#' @section Figures:
#' \if{html}{\figure{man_preset_location_colors_1.svg}{options: width=100\%}}
#'
#' @family table preset functions
#'
#' @export
preset_location_colors <- function(data,
                                   colors = "blues") {

  if (!(is.character(colors) &&
        length(colors) == 1 &&
        colors %in% names(colors_for_locations)) &&
      !inherits(colors, "location_color_list")) {

    stop("A `location_color_list` object must be supplied to `colors`:\n",
         " * Several of these are supplied; use `info_location_colors()` to find out more\n",
         " * It can be created by using the `location_colors()` function",
         call. = FALSE)
  }

  if (is.character(colors)) {
    colors <- colors_for_locations[[colors]]
  }

  # TODO: develop a function that performs a table reset; it
  #       only resets the table style parameters in `_options`
  tbl_location_colors <-
    data %>%
    dt_options_init() %>%
    tab_options(
      heading.background.color = colors$heading,
      column_labels.background.color = colors$column_labels,
      row_group.background.color = colors$row_groups,
      stub.background.color = colors$stub,
      table.background.color = colors$body,
      summary_row.background.color = colors$summary_rows,
      grand_summary_row.background.color = colors$grand_summary_rows,
      footnotes.background.color = colors$footnotes,
      source_notes.background.color = colors$source_notes
    )

  if (!is.null(colors$row_striping)) {

    tbl_location_colors <-
      tbl_location_colors %>%
      tab_options(row.striping.background_color = colors$row_striping)
  }

  tbl_location_colors
}

#' Use a preset table look with no lines
#'
#' This preset function effectively produces a table with no visible lines. This
#' is great as a blank slate for additive styling with [tab_options()] or
#' [tab_style()]. Or, use it in those cases where you are using \pkg{gt} tables
#' mostly for layout purposes.
#'
#' A preset function incorporates the idea of a 'table reset' in that all of the
#' options values available in [tab_options()] will be first reset to their
#' default values. A preset function will then apply the appropriate options
#' values to achieve the desired look. So, any additional tweaks through the use
#' of [tab_options()] or any of the `opt_*()` functions should be done after
#' calling a `preset_*()` function such as this one.
#'
#' @inheritParams fmt_number
#'
#' @return an object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table with
#' # a number of table parts added; then, use
#' # the `preset_lineless()` function to get
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
#'     locations = cells_data(columns = 1, rows = 1)
#'   ) %>%
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) %>%
#'   preset_lineless()
#'
#' @section Figures:
#' \if{html}{\figure{man_preset_lineless_1.svg}{options: width=100\%}}
#'
#' @family table preset functions
#'
#' @export
preset_lineless <- function(data) {

  # TODO: develop a function that performs a table reset; it
  #       only resets the table style parameters in `_options`
  data %>%
    dt_options_init() %>%
    tab_options(
      table.border.top.style = "none",
      heading.border.bottom.style = "none",
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

#' Use a preset table look with no lines
#'
#' This preset function yields a table where all possible lines are visible.
#' This is great if you want to start off with lots of lines and subtract just a
#' few of them with [tab_options()] or [tab_style()]. Or, use it in those cases
#' where you absolutely need to have boundaries between pieces of information.
#'
#' A preset function incorporates the idea of a 'table reset' in that all of the
#' options values available in [tab_options()] will be first reset to their
#' default values. A preset function will then apply the appropriate options
#' values to achieve the desired look. So, any additional tweaks through the use
#' of [tab_options()] or any of the `opt_*()` functions should be done after
#' calling a `preset_*()` function such as this one.
#'
#' @inheritParams fmt_number
#'
#' @return an object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table with
#' # a number of table parts added; then, use
#' # the `preset_fully_lined()` function to
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
#'     locations = cells_data(columns = 1, rows = 1)
#'   ) %>%
#'   tab_header(
#'     title = "The title of the table",
#'     subtitle = "The table's subtitle"
#'   ) %>%
#'   preset_fully_lined()
#'
#' @section Figures:
#' \if{html}{\figure{man_preset_fully_lined_1.svg}{options: width=100\%}}
#'
#' @family table preset functions
#'
#' @export
preset_fully_lined <- function(data) {

  # TODO: develop a function that performs a table reset; it
  #       only resets the table style parameters in `_options`
  data %>%
    dt_options_init() %>%
    tab_options(
      table.border.top.style = "solid",
      table.border.left.style = "solid",
      table.border.right.style = "solid",
      heading.border.bottom.style = "solid",
      heading.border.lr.style = "solid",
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

# Colors for the `preset_location_colors()` function
colors_for_locations <-
  list(
    blues = location_colors(
      column_labels = "#1976D2", row_groups = "#BDBDBD",
      stub = "#2196F3", body = "#BBDEFB",
      summary_rows = "#757575", grand_summary_rows = "#607D8B"
    ),
    grays = location_colors(
      column_labels = "#616161", row_groups = "#BDBDBD",
      stub = "#9E9E9E", body = "#F5F5F5",
      summary_rows = "#757575", grand_summary_rows = "#212121"
    ),
    purples = location_colors(
      column_labels = "#7B1FA2", row_groups = "#BDBDBD",
      stub = "#9C27B0", body = "#E1BEE7",
      summary_rows = "#757575", grand_summary_rows = "#7C4DFF"
    ),
    pinks = location_colors(
      column_labels = "#C2185B", row_groups = "#BDBDBD",
      stub = "#E91E63", body = "#F8BBD0",
      summary_rows = "#757575", grand_summary_rows = "#9E9E9E"
    ),
    greens = location_colors(
      column_labels = "#388E3C", row_groups = "#BDBDBD",
      stub = "#4CAF50", body = "#C8E6C9",
      summary_rows = "#757575", grand_summary_rows = "#8BC34A"
    ),
    pastels = location_colors(
      column_labels = "#FFDEF2", row_groups = "#FFF0E4",
      stub = "#E2EEFF", body = "#FFFFE3",
      summary_rows = "#DDFFFC", grand_summary_rows = "#F2E2FF"
    ),
    moonlight = location_colors(
      column_labels = "#0E9AA7", row_groups = "#DDDDDD",
      stub = "#3DA4AB", body = "#F6CD61",
      summary_rows = "#FE8A71", grand_summary_rows = "#4A4E4D"
    ),
    beach = location_colors(
      column_labels = "#2AB7CA", row_groups = "#E6E6EA",
      stub = "#E6E6EA", body = "#F4F4F8",
      summary_rows = "#FED766", grand_summary_rows = "#FE4A49"
    ),
    cappuccino = location_colors(
      column_labels = "#854442", row_groups = "#FFF4E6",
      stub = "#BE9B7B", body = "#FFF4E6",
      summary_rows = "#4B3832", grand_summary_rows = "#3C2F2F"
    ),
    space_gray = location_colors(
      column_labels = "#65737E", row_groups = "#DDDDDD",
      stub = "#A7ADBA", body = "#C0C5CE",
      summary_rows = "#4F5B66", grand_summary_rows = "#343D46"
    ),
    sand_and_sky = location_colors(
      column_labels = "#FFeFD7", row_groups = "#FFFEF9",
      stub = "#FFF6E9", body = "#FFFEF9",
      summary_rows = "#E3F0FF", grand_summary_rows = "#D2E7FF"
    )
  )

# Colors for the `preset_colorized()` function
preset_colors <-
  list(
    gray =    c("#F4F4F4", "#D5D5D5", "#929292", "#5F5F5F", "#000000"),
    blue =    c("#EDF7FC", "#89D3FE", "#00A1FF", "#0076BA", "#004D80"),
    orange =  c("#FFFFDB", "#FEFC66", "#FAE231", "#F8BA00", "#FF9400"),
    aqua =    c("#EBFBF9", "#A5FEF2", "#14E6CF", "#01A99D", "#007C77"),
    pink =    c("#FCF2F7", "#FF8CC6", "#EF5FA7", "#CB2A7B", "#99195F"),
    green =   c("#EDF6E8", "#9AFD69", "#60D937", "#1EB100", "#027101"),
    red =     c("#FEEDEC", "#FF968D", "#FF644E", "#ED220D", "#B51800")
  )

# Function for getting a vector of preset colors at a specified 'level'
get_all_preset_colors_at_index <- function(index) {

  preset_colors %>%
    vapply(
      FUN.VALUE = character(1),
      USE.NAMES = FALSE,
      FUN = function(x) x[[index]]
    )
}

# A tibble that contains all style and color parameters for the
# themed tables generated by the `preset_colorized()` function
styles_colors_params <-
  dplyr::tibble() %>%
  dplyr::bind_rows(
    dplyr::tibble( # style 1
      color = preset_colors %>% names(),
      style = 1,
      table_hlines_color = get_all_preset_colors_at_index(5),
      location_hlines_color = get_all_preset_colors_at_index(4),
      column_labels_background_color = "#FFFFFF",
      stub_background_color = get_all_preset_colors_at_index(4),
      stub_border_style = "solid",
      stub_border_color = get_all_preset_colors_at_index(4),
      data_hlines_style = "none",
      data_hlines_color = get_all_preset_colors_at_index(2),
      data_vlines_style = "none",
      data_vlines_color = get_all_preset_colors_at_index(2),
      summary_row_background_color = "#FFFFFF",
      grand_summary_row_background_color = get_all_preset_colors_at_index(2),
      row_striping_background_color = preset_colors$gray[[1]],
      table_outline_color = NA_character_
    )
  ) %>%
  dplyr::bind_rows(
    dplyr::tibble( # style 2
      color = preset_colors %>% names(),
      style = 2,
      table_hlines_color = preset_colors$gray[[2]],
      location_hlines_color = preset_colors$gray[[2]],
      column_labels_background_color = get_all_preset_colors_at_index(5),
      stub_background_color = "#FFFFFF",
      stub_border_style = "solid",
      stub_border_color = preset_colors$gray[[4]],
      data_hlines_style = "solid",
      data_hlines_color = get_all_preset_colors_at_index(2),
      data_vlines_style = "solid",
      data_vlines_color = get_all_preset_colors_at_index(2),
      summary_row_background_color = get_all_preset_colors_at_index(2),
      grand_summary_row_background_color = get_all_preset_colors_at_index(3),
      row_striping_background_color = preset_colors$gray[[1]],
      table_outline_color = preset_colors$gray[[2]]
    )
  ) %>%
  dplyr::bind_rows(
    dplyr::tibble( # style 3
      color = preset_colors %>% names(),
      style = 3,
      table_hlines_color = preset_colors$gray[[3]],
      location_hlines_color = preset_colors$gray[[3]],
      column_labels_background_color = get_all_preset_colors_at_index(5),
      stub_background_color = preset_colors$gray[[2]],
      stub_border_style = "none",
      stub_border_color = "#FFFFFF",
      data_hlines_style = "dashed",
      data_hlines_color = preset_colors$gray[[3]],
      data_vlines_style = "none",
      data_vlines_color = preset_colors$gray[[3]],
      summary_row_background_color = "#FFFFFF",
      grand_summary_row_background_color = preset_colors$gray[[2]],
      row_striping_background_color = preset_colors$gray[[1]],
      table_outline_color = NA_character_
    )
  ) %>%
  dplyr::bind_rows(
    dplyr::tibble( # style 4
      color = preset_colors %>% names(),
      style = 4,
      table_hlines_color = preset_colors$gray[[2]],
      location_hlines_color = preset_colors$gray[[2]],
      column_labels_background_color = get_all_preset_colors_at_index(4),
      stub_background_color = preset_colors$gray[[3]],
      stub_border_style = "dashed",
      stub_border_color = preset_colors$gray[[2]],
      data_hlines_style = "dashed",
      data_hlines_color = preset_colors$gray[[2]],
      data_vlines_style = "dashed",
      data_vlines_color = preset_colors$gray[[2]],
      summary_row_background_color = "#FFFFFF",
      grand_summary_row_background_color = get_all_preset_colors_at_index(4),
      row_striping_background_color = preset_colors$gray[[1]],
      table_outline_color = preset_colors$gray[[2]]
    )
  ) %>%
  dplyr::bind_rows(
    dplyr::tibble( # style 5
      color = preset_colors %>% names(),
      style = 5,
      table_hlines_color = preset_colors$gray[[2]],
      location_hlines_color = preset_colors$gray[[2]],
      column_labels_background_color = get_all_preset_colors_at_index(5),
      stub_background_color = preset_colors$gray[[3]],
      stub_border_style = "solid",
      stub_border_color = preset_colors$gray[[2]],
      data_hlines_style = "solid",
      data_hlines_color = preset_colors$gray[[2]],
      data_vlines_style = "solid",
      data_vlines_color = preset_colors$gray[[2]],
      summary_row_background_color = preset_colors$gray[[4]],
      grand_summary_row_background_color = preset_colors$gray[[3]],
      row_striping_background_color = preset_colors$gray[[1]],
      table_outline_color = preset_colors$gray[[2]]
    )
  ) %>%
  dplyr::bind_rows(
    dplyr::tibble( # style 6
      color = preset_colors %>% names(),
      style = 6,
      table_hlines_color = preset_colors$gray[[4]],
      location_hlines_color = preset_colors$gray[[4]],
      column_labels_background_color = get_all_preset_colors_at_index(4),
      stub_background_color = get_all_preset_colors_at_index(2),
      stub_border_style = "solid",
      stub_border_color = preset_colors$gray[[2]],
      data_hlines_style = "none",
      data_hlines_color = preset_colors$gray[[2]],
      data_vlines_style = "none",
      data_vlines_color = preset_colors$gray[[2]],
      summary_row_background_color = "#FFFFFF",
      grand_summary_row_background_color = preset_colors$gray[[2]],
      row_striping_background_color = get_all_preset_colors_at_index(1),
      table_outline_color = NA_character_
    )
  )

get_colorized_params <- function(styles_colors_params,
                                 style,
                                 color) {

  style_filter <- style
  color_filter <- color

  styles_colors_params %>%
    dplyr::filter(style == style_filter, color == color_filter) %>%
    as.list()
}
