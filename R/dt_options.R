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


.dt_options_key <- "_options"

dt_options_get <- function(data) {
  dt__get(data, .dt_options_key)
}

dt_options_set <- function(data, options) {
  dt__set(data, .dt_options_key, options)
}

dt_options_init <- function(data) {
  dt_options_set(data = data, options = dt_options_tbl)
}

dt_options_set_value <- function(data, option, value) {

  dt_options <- dt_options_get(data = data)
  dt_options$value[[which(dt_options$parameter == option)]] <- value

  dt_options_set(data = data, options = dt_options)
}

dt_options_get_value <- function(data, option) {
  dt_options <- dt_options_get(data = data)
  dt_options$value[[which(dt_options$parameter == option)]]
}

# Get a list of option values
dt_options_get_values <- function(data) {
  dt_options <- dt_options_get(data = data)[c("parameter", "value")]
  # Similar to tibble::deframe
  res <- vctrs::vec_set_names(dt_options$value, dt_options$parameter)
  class(res) <- c("gt_option", class(res))
  res
}

#' @export
`$.gt_option` <- function(x, name) {
  out <- .subset2(x, name)
  if (is.null(out)) {
    cli::cli_abort("Can't find option {.val {name}}.")
  }
  out
}

default_fonts_vec <-
  c(
    "system-ui", "Segoe UI", "Roboto", "Helvetica", "Arial", "sans-serif",
    "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji"
  )

default_page_size_vec <- c(10, 25, 50, 100)

dt_options_tbl <-
  dplyr::tribble(
    ~parameter,                          ~scss,  ~category,          ~type,     ~value,
    "empty",                             FALSE,  "empty",            "value",   list(),
    "table_id",                          FALSE,  "table",            "value",   NA_character_,
    "table_caption",                     FALSE,  "table",            "value",   NA_character_,
    "table_width",                        TRUE,  "table",            "px",      "auto",
    "table_layout",                       TRUE,  "table",            "value",   "fixed",
    "table_margin_left",                  TRUE,  "table",            "px",      "auto",
    "table_margin_right",                 TRUE,  "table",            "px",      "auto",
    "table_background_color",             TRUE,  "table",            "value",   "#FFFFFF",
    "table_additional_css",              FALSE,  "table",            "values",  character(0L),
    "table_font_names",                  FALSE,  "table",            "values",  default_fonts_vec,
    "table_font_size",                    TRUE,  "table",            "px",      "16px",
    "table_font_weight",                  TRUE,  "table",            "value",   "normal",
    "table_font_style",                   TRUE,  "table",            "value",   "normal",
    "table_font_color",                   TRUE,  "table",            "value",   "#333333",
    "table_font_color_light",             TRUE,  "table",            "value",   "#FFFFFF",
    "table_border_top_include",          FALSE,  "table",            "logical", TRUE,
    "table_border_top_style",             TRUE,  "table",            "value",   "solid",
    "table_border_top_width",             TRUE,  "table",            "px",      "2px",
    "table_border_top_color",             TRUE,  "table",            "value",   "#A8A8A8",
    "table_border_right_style",           TRUE,  "table",            "value",   "none",
    "table_border_right_width",           TRUE,  "table",            "px",      "2px",
    "table_border_right_color",           TRUE,  "table",            "value",   "#D3D3D3",
    "table_border_bottom_include",       FALSE,  "table",            "logical", TRUE,
    "table_border_bottom_style",          TRUE,  "table",            "value",   "solid",
    "table_border_bottom_width",          TRUE,  "table",            "px",      "2px",
    "table_border_bottom_color",          TRUE,  "table",            "value",   "#A8A8A8",
    "table_border_left_style",            TRUE,  "table",            "value",   "none",
    "table_border_left_width",            TRUE,  "table",            "px",      "2px",
    "table_border_left_color",            TRUE,  "table",            "value",   "#D3D3D3",
    "heading_background_color",           TRUE,  "heading",          "value",   NA_character_,
    "heading_align",                      TRUE,  "heading",          "value",   "center",
    "heading_title_font_size",            TRUE,  "heading",          "px",      "125%",
    "heading_title_font_weight",          TRUE,  "heading",          "value",   "initial",
    "heading_subtitle_font_size",         TRUE,  "heading",          "px",      "85%",
    "heading_subtitle_font_weight",       TRUE,  "heading",          "value",   "initial",
    "heading_padding",                    TRUE,  "heading",          "px",      "4px",
    "heading_padding_horizontal",         TRUE,  "heading",          "px",      "5px",
    "heading_border_bottom_style",        TRUE,  "heading",          "value",   "solid",
    "heading_border_bottom_width",        TRUE,  "heading",          "px",      "2px",
    "heading_border_bottom_color",        TRUE,  "heading",          "value",   "#D3D3D3",
    "heading_border_lr_style",            TRUE,  "heading",          "value",   "none",
    "heading_border_lr_width",            TRUE,  "heading",          "px",      "1px",
    "heading_border_lr_color",            TRUE,  "heading",          "value",   "#D3D3D3",
    "column_labels_background_color",     TRUE,  "column_labels",    "value",   NA_character_,
    "column_labels_font_size",            TRUE,  "column_labels",    "px",      "100%",
    "column_labels_font_weight",          TRUE,  "column_labels",    "value",   "normal",
    "column_labels_text_transform",       TRUE,  "column_labels",    "value",   "inherit",
    "column_labels_padding",              TRUE,  "column_labels",    "px",      "5px",
    "column_labels_padding_horizontal",   TRUE,  "column_labels",    "px",      "5px",
    "column_labels_vlines_style",         TRUE,  "table_body",       "value",   "none",
    "column_labels_vlines_width",         TRUE,  "table_body",       "px",      "1px",
    "column_labels_vlines_color",         TRUE,  "table_body",       "value",   "#D3D3D3",
    "column_labels_border_top_style",     TRUE,  "column_labels",    "value",   "solid",
    "column_labels_border_top_width",     TRUE,  "column_labels",    "px",      "2px",
    "column_labels_border_top_color",     TRUE,  "column_labels",    "value",   "#D3D3D3",
    "column_labels_border_bottom_style",  TRUE,  "column_labels",    "value",   "solid",
    "column_labels_border_bottom_width",  TRUE,  "column_labels",    "px",      "2px",
    "column_labels_border_bottom_color",  TRUE,  "column_labels",    "value",   "#D3D3D3",
    "column_labels_border_lr_style",      TRUE,  "column_labels",    "value",   "none",
    "column_labels_border_lr_width",      TRUE,  "column_labels",    "px",      "1px",
    "column_labels_border_lr_color",      TRUE,  "column_labels",    "value",   "#D3D3D3",
    "column_labels_hidden",              FALSE,  "column_labels",    "logical", FALSE,
    "column_labels_units_pattern",       FALSE,  "column_labels",    "value",   "{1}, {2}",
    "row_group_background_color",         TRUE,  "row_group",        "value",   NA_character_,
    "row_group_font_size",                TRUE,  "row_group",        "px",      "100%",
    "row_group_font_weight",              TRUE,  "row_group",        "value",   "initial",
    "row_group_text_transform",           TRUE,  "row_group",        "value",   "inherit",
    "row_group_padding",                  TRUE,  "row_group",        "px",      "8px",
    "row_group_padding_horizontal",       TRUE,  "row_group",        "px",      "5px",
    "row_group_border_top_style",         TRUE,  "row_group",        "value",   "solid",
    "row_group_border_top_width",         TRUE,  "row_group",        "px",      "2px",
    "row_group_border_top_color",         TRUE,  "row_group",        "value",   "#D3D3D3",
    "row_group_border_right_style",       TRUE,  "row_group",        "value",   "none",
    "row_group_border_right_width",       TRUE,  "row_group",        "px",      "1px",
    "row_group_border_right_color",       TRUE,  "row_group",        "value",   "#D3D3D3",
    "row_group_border_bottom_style",      TRUE,  "row_group",        "value",   "solid",
    "row_group_border_bottom_width",      TRUE,  "row_group",        "px",      "2px",
    "row_group_border_bottom_color",      TRUE,  "row_group",        "value",   "#D3D3D3",
    "row_group_border_left_style",        TRUE,  "row_group",        "value",   "none",
    "row_group_border_left_width",        TRUE,  "row_group",        "px",      "1px",
    "row_group_border_left_color",        TRUE,  "row_group",        "value",   "#D3D3D3",
    "row_group_default_label",           FALSE,  "row_group",        "value",   NA_character_,
    "row_group_as_column",               FALSE,  "row_group",        "logical", FALSE,
    "table_body_hlines_style",            TRUE,  "table_body",       "value",   "solid",
    "table_body_hlines_width",            TRUE,  "table_body",       "px",      "1px",
    "table_body_hlines_color",            TRUE,  "table_body",       "value",   "#D3D3D3",
    "table_body_vlines_style",            TRUE,  "table_body",       "value",   "none",
    "table_body_vlines_width",            TRUE,  "table_body",       "px",      "1px",
    "table_body_vlines_color",            TRUE,  "table_body",       "value",   "#D3D3D3",
    "table_body_border_top_style",        TRUE,  "table_body",       "value",   "solid",
    "table_body_border_top_width",        TRUE,  "table_body",       "px",      "2px",
    "table_body_border_top_color",        TRUE,  "table_body",       "value",   "#D3D3D3",
    "table_body_border_bottom_style",     TRUE,  "table_body",       "value",   "solid",
    "table_body_border_bottom_width",     TRUE,  "table_body",       "px",      "2px",
    "table_body_border_bottom_color",     TRUE,  "table_body",       "value",   "#D3D3D3",
    "data_row_padding",                   TRUE,  "data_row",         "px",      "8px",
    "data_row_padding_horizontal",        TRUE,  "data_row",         "px",      "5px",
    "stub_background_color",              TRUE,  "stub",             "value",   NA_character_,
    "stub_font_size",                     TRUE,  "stub",             "px",      "100%",
    "stub_font_weight",                   TRUE,  "stub",             "value",   "initial",
    "stub_text_transform",                TRUE,  "stub",             "value",   "inherit",
    "stub_border_style",                  TRUE,  "stub",             "value",   "solid",
    "stub_border_width",                  TRUE,  "stub",             "px",      "2px",
    "stub_border_color",                  TRUE,  "stub",             "value",   "#D3D3D3",
    "stub_indent_length",                 TRUE,  "stub",             "px",      "5px",
    "stub_row_group_background_color",    TRUE,  "stub",             "value",   NA_character_,
    "stub_row_group_font_size",           TRUE,  "stub",             "px",      "100%",
    "stub_row_group_font_weight",         TRUE,  "stub",             "value",   "initial",
    "stub_row_group_text_transform",      TRUE,  "stub",             "value",   "inherit",
    "stub_row_group_border_style",        TRUE,  "stub",             "value",   "solid",
    "stub_row_group_border_width",        TRUE,  "stub",             "px",      "2px",
    "stub_row_group_border_color",        TRUE,  "stub",             "value",   "#D3D3D3",
    "summary_row_padding",                TRUE,  "summary_row",      "px",      "8px",
    "summary_row_padding_horizontal",     TRUE,  "summary_row",      "px",      "5px",
    "summary_row_background_color",       TRUE,  "summary_row",      "value",   NA_character_,
    "summary_row_text_transform",         TRUE,  "summary_row",      "value",   "inherit",
    "summary_row_border_style",           TRUE,  "summary_row",      "value",   "solid",
    "summary_row_border_width",           TRUE,  "summary_row",      "px",      "2px",
    "summary_row_border_color",           TRUE,  "summary_row",      "value",   "#D3D3D3",
    "grand_summary_row_padding",          TRUE,  "grand_summary_row", "px",     "8px",
    "grand_summary_row_padding_horizontal",TRUE, "grand_summary_row", "px",     "5px",
    "grand_summary_row_background_color", TRUE,  "grand_summary_row", "value",  NA_character_,
    "grand_summary_row_text_transform",   TRUE,  "grand_summary_row", "value",  "inherit",
    "grand_summary_row_border_style",     TRUE,  "grand_summary_row", "value",  "double",
    "grand_summary_row_border_width",     TRUE,  "grand_summary_row", "px",     "6px",
    "grand_summary_row_border_color",     TRUE,  "grand_summary_row", "value",  "#D3D3D3",
    "footnotes_font_size",                TRUE,  "footnotes",        "px",      "90%",
    "footnotes_padding",                  TRUE,  "footnotes",        "px",      "4px",
    "footnotes_padding_horizontal",       TRUE,  "footnotes",        "px",      "5px",
    "footnotes_background_color",         TRUE,  "footnotes",        "value",   NA_character_,
    "footnotes_margin",                   TRUE,  "footnotes",        "px",      "0px",
    "footnotes_border_bottom_style",      TRUE,  "footnotes",        "value",   "none",
    "footnotes_border_bottom_width",      TRUE,  "footnotes",        "px",      "2px",
    "footnotes_border_bottom_color",      TRUE,  "footnotes",        "value",   "#D3D3D3",
    "footnotes_border_lr_style",          TRUE,  "footnotes",        "value",   "none",
    "footnotes_border_lr_width",          TRUE,  "footnotes",        "px",      "2px",
    "footnotes_border_lr_color",          TRUE,  "footnotes",        "value",   "#D3D3D3",
    "footnotes_marks",                   FALSE,  "footnotes",        "values",  "numbers",
    "footnotes_spec_ref",                FALSE,  "footnotes",        "values",  "^i",
    "footnotes_spec_ftr",                FALSE,  "footnotes",        "values",  "^i",
    "footnotes_multiline",               FALSE,  "footnotes",        "logical", TRUE,
    "footnotes_sep",                     FALSE,  "footnotes",        "value",   " ",
    "footnotes_order",                   FALSE,  "footnotes",        "value",   "marks_last",
    "source_notes_padding",               TRUE,  "source_notes",     "px",      "4px",
    "source_notes_padding_horizontal",    TRUE,  "source_notes",     "px",      "5px",
    "source_notes_background_color",      TRUE,  "source_notes",     "value",   NA_character_,
    "source_notes_font_size",             TRUE,  "source_notes",     "px",      "90%",
    "source_notes_border_bottom_style",   TRUE,  "source_notes",     "value",   "none",
    "source_notes_border_bottom_width",   TRUE,  "source_notes",     "px",      "2px",
    "source_notes_border_bottom_color",   TRUE,  "source_notes",     "value",   "#D3D3D3",
    "source_notes_border_lr_style",       TRUE,  "source_notes",     "value",   "none",
    "source_notes_border_lr_width",       TRUE,  "source_notes",     "px",      "2px",
    "source_notes_border_lr_color",       TRUE,  "source_notes",     "value",   "#D3D3D3",
    "source_notes_multiline",            FALSE,  "source_notes",     "logical", TRUE,
    "source_notes_sep",                  FALSE,  "source_notes",     "value",   " ",
    "row_striping_background_color",      TRUE,  "row",              "value",   "rgba(128,128,128,0.05)",
    "row_striping_include_stub",         FALSE,  "row",              "logical", FALSE,
    "row_striping_include_table_body",   FALSE,  "row",              "logical", FALSE,
    "container_width",                   FALSE,  "container",        "px",      "auto",
    "container_height",                  FALSE,  "container",        "px",      "auto",
    "container_padding_x",               FALSE,  "container",        "px",      "0px",
    "container_padding_y",               FALSE,  "container",        "px",      "10px",
    "container_overflow_x",              FALSE,  "container",        "overflow","auto",
    "container_overflow_y",              FALSE,  "container",        "overflow","auto",
    "ihtml_active",                      FALSE,  "interactive",      "logical", FALSE,
    "ihtml_height",                      FALSE,  "interactive",      "px",      "auto",
    "ihtml_use_pagination",              FALSE,  "interactive",      "logical", TRUE,
    "ihtml_use_pagination_info",         FALSE,  "interactive",      "logical", TRUE,
    "ihtml_use_sorting",                 FALSE,  "interactive",      "logical", TRUE,
    "ihtml_use_search",                  FALSE,  "interactive",      "logical", FALSE,
    "ihtml_use_filters",                 FALSE,  "interactive",      "logical", FALSE,
    "ihtml_use_resizers",                FALSE,  "interactive",      "logical", FALSE,
    "ihtml_use_highlight",               FALSE,  "interactive",      "logical", FALSE,
    "ihtml_use_compact_mode",            FALSE,  "interactive",      "logical", FALSE,
    "ihtml_use_text_wrapping",           FALSE,  "interactive",      "logical", TRUE,
    "ihtml_use_page_size_select",        FALSE,  "interactive",      "logical", FALSE,
    "ihtml_page_size_default",           FALSE,  "interactive",      "values",  10,
    "ihtml_page_size_values",            FALSE,  "interactive",      "values",  default_page_size_vec,
    "ihtml_pagination_type",             FALSE,  "interactive",      "value",   "numbers",
    "ihtml_selection_mode",              FALSE,  "interactive",      "value",   NA_character_,
    "page_orientation",                  FALSE,  "page",             "value",   "portrait",
    "page_numbering",                    FALSE,  "page",             "logical", FALSE,
    "page_header_use_tbl_headings",      FALSE,  "page",             "logical", FALSE,
    "page_footer_use_tbl_notes",         FALSE,  "page",             "logical", FALSE,
    "page_width",                        FALSE,  "page",             "value",   "8.5in",
    "page_height",                       FALSE,  "page",             "value",   "11.0in",
    "page_margin_left",                  FALSE,  "page",             "value",   "1.0in",
    "page_margin_right",                 FALSE,  "page",             "value",   "1.0in",
    "page_margin_top",                   FALSE,  "page",             "value",   "1.0in",
    "page_margin_bottom",                FALSE,  "page",             "value",   "1.0in",
    "page_header_height",                FALSE,  "page",             "value",   "0.5in",
    "page_footer_height",                FALSE,  "page",             "value",   "0.5in",
    "quarto_disable_processing",         FALSE,  "quarto",           "logical", FALSE,
    "quarto_use_bootstrap",              FALSE,  "quarto",           "logical", FALSE,
    "latex_use_longtable",               FALSE,  "latex",            "logical", FALSE,
    "latex_header_repeat",               FALSE,  "latex",            "logical", FALSE,
    "stub_separate",                     FALSE,  "stub",             "logical",  TRUE,
    "latex_toprule",                     FALSE,  "latex",            "logical",  TRUE,
    "latex_bottomrule",                  FALSE,  "latex",            "logical",  TRUE,
    "latex_tbl_pos",                     FALSE,  "latex",            "value",   "t",
    "latex_unicode_conversion",          FALSE,  "latex",            "logical", FALSE,
  )[-1, ]
