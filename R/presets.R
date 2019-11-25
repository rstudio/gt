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
#' `color`.
#'
#' @inheritParams fmt_number
#' @param style Six numbered styles are available. Simply provide a number from
#'   `1` (the default) to `6` to choose a distinct look.
#' @param color There are seven color variations: `"blue"` (the default),
#'   `"orange"`, `"aqua"`, `"magenta"`, `"green"`, `"red"`, and `"gray"`.
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
         " * `\"blue\"`, `\"orange\"`, `\"aqua\"`, `\"magenta\"`, `\"green\"`, ",
         "`\"red\"`, or `\"gray\"`",
         call. = FALSE)
  }


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
    tab_options(
      table.background.color = "#FFFFFF",
      table.font.color = "#333333",
      table.font.color.light = "#FFFFFF",
      table.font.size = "16px",
      table.border.top.style = "solid",
      table.border.top.width = "2px",
      table.border.bottom.style = "solid",
      table.border.bottom.width = "2px",
      heading.background.color = "#FFFFFF",
      heading.title.font.size = "125%",
      heading.title.font.weight = "initial",
      heading.subtitle.font.size = "85%",
      heading.subtitle.font.weight = "initial",
      heading.border.bottom.style = "solid",
      heading.border.bottom.width = "2px",
      heading.border.lr.style = "none",
      heading.border.lr.width = "1px",
      heading.border.lr.color = "#D3D3D3",
      column_labels.font.size = "100%",
      column_labels.font.weight = "initial",
      column_labels.text_transform = "inherit",
      column_labels.border.top.style = "solid",
      column_labels.border.top.width = "2px",
      column_labels.border.bottom.style = "solid",
      column_labels.border.bottom.width = "2px",
      column_labels.border.lr.style = "none",
      column_labels.border.lr.width = "1px",
      column_labels.border.lr.color = "#D3D3D3",
      column_labels.hidden = FALSE,
      row_group.background.color = "#FFFFFF",
      row_group.font.size = "100%",
      row_group.font.weight = "initial",
      row_group.text_transform = "inherit",
      row_group.padding = "8px",
      row_group.border.top.style = "solid",
      row_group.border.top.width = "2px",
      row_group.border.bottom.style = "solid",
      row_group.border.bottom.width = "2px",
      row_group.border.left.style = "none",
      row_group.border.left.width = "1px",
      row_group.border.left.color = "#D3D3D3",
      row_group.border.right.style = "none",
      row_group.border.right.width = "1px",
      row_group.border.right.color = "#D3D3D3",
      table_body.hlines.width = "1px",
      table_body.vlines.width = "1px",
      table_body.border.top.style = "solid",
      table_body.border.top.width = "2px",
      table_body.border.bottom.style = "solid",
      table_body.border.bottom.width = "2px",
      stub.font.weight = "initial",
      stub.text_transform = "inherit",
      stub.border.width = "2px",
      data_row.padding = "8px",
      summary_row.text_transform = "inherit",
      summary_row.padding = "8px",
      summary_row.border.style = "solid",
      summary_row.border.width = "2px",
      grand_summary_row.text_transform = "inherit",
      grand_summary_row.padding = "8px",
      grand_summary_row.border.style = "double",
      grand_summary_row.border.width = "6px",
      footnotes.background.color = "#FFFFFF",
      footnotes.font.size = "90%",
      footnotes.padding = "4px",
      footnotes.border.bottom.style = "none",
      footnotes.border.bottom.width = "2px",
      footnotes.border.bottom.color = "#D3D3D3",
      footnotes.border.lr.style = "none",
      footnotes.border.lr.width = "2px",
      footnotes.border.lr.color = "#D3D3D3",
      source_notes.background.color = "#FFFFFF",
      source_notes.font.size = "90%",
      source_notes.padding = "4px",
      source_notes.border.bottom.style = "none",
      source_notes.border.bottom.width = "2px",
      source_notes.border.bottom.color = "#D3D3D3",
      source_notes.border.lr.style = "none",
      source_notes.border.lr.width = "2px",
      source_notes.border.lr.color = "#D3D3D3",
      row.striping.include_stub = FALSE,
      row.striping.include_table_body = FALSE
    ) %>%
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
      row.striping.background_color = params$row_striping_background_color,
    )

  if (!is.na(params$table_outline_color)) {

    tbl_colorized <-
      tbl_colorized %>%
      opt_add_table_outline(color = params$table_outline_color, width = px(3))
  }

  tbl_colorized
}

#' Use a preset table look with no lines
#'
#' This preset function effectively produces a table where all possible lines
#' and row striping are not visible. This is great as a blank slate for additive
#' styling with [tab_options()] or [tab_style()]. Or, use it in those cases
#' where you are using \pkg{gt} tables mostly for layout purposes.
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
    tab_options(
      table.background.color = "#FFFFFF",
      table.font.color = "#333333",
      table.font.color.light = "#FFFFFF",
      table.font.size = "16px",
      table.border.top.style = "solid",
      table.border.top.width = "2px",
      table.border.bottom.style = "solid",
      table.border.bottom.width = "2px",
      heading.background.color = "#FFFFFF",
      heading.title.font.size = "125%",
      heading.title.font.weight = "initial",
      heading.subtitle.font.size = "85%",
      heading.subtitle.font.weight = "initial",
      heading.border.bottom.style = "solid",
      heading.border.bottom.width = "2px",
      heading.border.lr.style = "none",
      heading.border.lr.width = "1px",
      heading.border.lr.color = "#D3D3D3",
      column_labels.font.size = "100%",
      column_labels.font.weight = "initial",
      column_labels.text_transform = "inherit",
      column_labels.border.top.style = "solid",
      column_labels.border.top.width = "2px",
      column_labels.border.bottom.style = "solid",
      column_labels.border.bottom.width = "2px",
      column_labels.border.lr.style = "none",
      column_labels.border.lr.width = "1px",
      column_labels.border.lr.color = "#D3D3D3",
      column_labels.hidden = FALSE,
      row_group.background.color = "#FFFFFF",
      row_group.font.size = "100%",
      row_group.font.weight = "initial",
      row_group.text_transform = "inherit",
      row_group.padding = "8px",
      row_group.border.top.style = "solid",
      row_group.border.top.width = "2px",
      row_group.border.bottom.style = "solid",
      row_group.border.bottom.width = "2px",
      row_group.border.left.style = "none",
      row_group.border.left.width = "1px",
      row_group.border.left.color = "#D3D3D3",
      row_group.border.right.style = "none",
      row_group.border.right.width = "1px",
      row_group.border.right.color = "#D3D3D3",
      table_body.hlines.width = "1px",
      table_body.vlines.width = "1px",
      table_body.border.top.style = "solid",
      table_body.border.top.width = "2px",
      table_body.border.bottom.style = "solid",
      table_body.border.bottom.width = "2px",
      stub.font.weight = "initial",
      stub.text_transform = "inherit",
      stub.border.width = "2px",
      data_row.padding = "8px",
      summary_row.text_transform = "inherit",
      summary_row.padding = "8px",
      summary_row.border.style = "solid",
      summary_row.border.width = "2px",
      grand_summary_row.text_transform = "inherit",
      grand_summary_row.padding = "8px",
      grand_summary_row.border.style = "double",
      grand_summary_row.border.width = "6px",
      footnotes.background.color = "#FFFFFF",
      footnotes.font.size = "90%",
      footnotes.padding = "4px",
      footnotes.border.bottom.style = "none",
      footnotes.border.bottom.width = "2px",
      footnotes.border.bottom.color = "#D3D3D3",
      footnotes.border.lr.style = "none",
      footnotes.border.lr.width = "2px",
      footnotes.border.lr.color = "#D3D3D3",
      source_notes.background.color = "#FFFFFF",
      source_notes.font.size = "90%",
      source_notes.padding = "4px",
      source_notes.border.bottom.style = "none",
      source_notes.border.bottom.width = "2px",
      source_notes.border.bottom.color = "#D3D3D3",
      source_notes.border.lr.style = "none",
      source_notes.border.lr.width = "2px",
      source_notes.border.lr.color = "#D3D3D3",
      row.striping.include_stub = FALSE,
      row.striping.include_table_body = FALSE
    ) %>%
    tab_options(
      row.striping.include_table_body = FALSE,
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

# Colors for the `preset_colorized()` function
preset_colors <-
  list(
    gray =    c("#F4F4F4", "#D5D5D5", "#929292", "#5F5F5F", "#000000"),
    blue =    c("#EDF7FC", "#89D3FE", "#00A1FF", "#0076BA", "#004D80"),
    orange =  c("#FFFFDB", "#FEFC66", "#FAE231", "#F8BA00", "#FF9400"),
    aqua =    c("#EBFBF9", "#A5FEF2", "#14E6CF", "#01A99D", "#007C77"),
    magenta = c("#FCF2F7", "#FF8CC6", "#EF5FA7", "#CB2A7B", "#99195F"),
    green =   c("#EDF6E8", "#9AFD69", "#60D937", "#1EB100", "#027101"),
    red =     c("#FEEDEC", "#FF968D", "#FF644E", "#ED220D", "#B51800")
  )

get_all_preset_colors_at_index <- function(index) {

  preset_colors %>%
    vapply(
      FUN.VALUE = character(1),
      USE.NAMES = FALSE,
      FUN = function(x) x[[index]]
    )
}

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

