.dt_options_key <- "_options"

dt_options_get <- function(data) {

  dt__get(data, .dt_options_key)
}

dt_options_set <- function(data, options) {

  dt__set(data, .dt_options_key, options)
}

dt_options_init <- function(data) {

  dt_options_tbl %>% dt_options_set(options = ., data = data)
}

dt_options_set_value <- function(data, option, value) {

  dt_options <-
    data %>%
    dt_options_get()

  dt_options$value[[which(dt_options$parameter == option)]] <- value

  dt_options %>%
    dt_options_set(options = ., data = data)
}

dt_options_get_value <- function(data, option) {

  dt_options <-
    data %>%
    dt_options_get()

  dt_options$value[[which(dt_options$parameter == option)]]
}

default_fonts_vec <-
  c(
    "-apple-system", "BlinkMacSystemFont", "Segoe UI", "Roboto",
    "Oxygen", "Ubuntu", "Cantarell", "Helvetica Neue", "Fira Sans",
    "Droid Sans", "Arial", "sans-serif"
  )

dt_options_tbl <-
  dplyr::tribble(
    ~parameter,                          ~scss,  ~category,          ~type,     ~value,
    "empty",                             FALSE,  "empty",            "value",   list(),
    "container_width",                   FALSE,  "container",        "px",      "auto",
    "container_height",                  FALSE,  "container",        "px",      "auto",
    "container_overflow_x",              FALSE,  "container",        "overflow","auto",
    "container_overflow_y",              FALSE,  "container",        "overflow","auto",
    "table_id",                          FALSE,  "table",            "value",   NA_character_,
    "table_width",                        TRUE,  "table",            "px",      "auto",
    "table_layout",                       TRUE,  "table",            "value",   "fixed",
    "table_margin_left",                  TRUE,  "table",            "px",      "auto",
    "table_margin_right",                 TRUE,  "table",            "px",      "auto",
    "table_background_color",             TRUE,  "table",            "value",   "#FFFFFF",
    "table_additional_css",              FALSE,  "table",            "values",  character(0),
    "table_font_names",                  FALSE,  "table",            "values",  default_fonts_vec,
    "table_font_size",                    TRUE,  "table",            "px",      "16px",
    "table_font_weight",                  TRUE,  "table",            "value",   "normal",
    "table_font_style",                   TRUE,   "table",           "value",   "normal",
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
    "row_group_background_color",         TRUE,  "row_group",        "value",   NA_character_,
    "row_group_font_size",                TRUE,  "row_group",        "px",      "100%",
    "row_group_font_weight",              TRUE,  "row_group",        "value",   "initial",
    "row_group_text_transform",           TRUE,  "row_group",        "value",   "inherit",
    "row_group_padding",                  TRUE,  "row_group",        "px",      "8px",
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
    "stub_background_color",              TRUE,  "stub",             "value",   NA_character_,
    "stub_font_size",                     TRUE,  "stub",             "px",      "100%",
    "stub_font_weight",                   TRUE,  "stub",             "value",   "initial",
    "stub_text_transform",                TRUE,  "stub",             "value",   "inherit",
    "stub_border_style",                  TRUE,  "stub",             "value",   "solid",
    "stub_border_width",                  TRUE,  "stub",             "px",      "2px",
    "stub_border_color",                  TRUE,  "stub",             "value",   "#D3D3D3",
    "summary_row_padding",                TRUE,  "summary_row",      "px",      "8px",
    "summary_row_background_color",       TRUE,  "summary_row",      "value",   NA_character_,
    "summary_row_text_transform",         TRUE,  "summary_row",      "value",   "inherit",
    "summary_row_border_style",           TRUE,  "summary_row",      "value",   "solid",
    "summary_row_border_width",           TRUE,  "summary_row",      "px",      "2px",
    "summary_row_border_color",           TRUE,  "summary_row",      "value",   "#D3D3D3",
    "grand_summary_row_padding",          TRUE,  "grand_summary_row", "px",     "8px",
    "grand_summary_row_background_color", TRUE,  "grand_summary_row", "value",  NA_character_,
    "grand_summary_row_text_transform",   TRUE,  "grand_summary_row", "value",  "inherit",
    "grand_summary_row_border_style",     TRUE,  "grand_summary_row", "value",  "double",
    "grand_summary_row_border_width",     TRUE,  "grand_summary_row", "px",     "6px",
    "grand_summary_row_border_color",     TRUE,  "grand_summary_row", "value",  "#D3D3D3",
    "footnotes_font_size",                TRUE,  "footnotes",        "px",      "90%",
    "footnotes_padding",                  TRUE,  "footnotes",        "px",      "4px",
    "footnotes_background_color",         TRUE,  "footnotes",        "value",   NA_character_,
    "footnotes_margin",                   TRUE,  "footnotes",        "px",      "0px",
    "footnotes_border_bottom_style",      TRUE,  "footnotes",        "value",   "none",
    "footnotes_border_bottom_width",      TRUE,  "footnotes",        "px",      "2px",
    "footnotes_border_bottom_color",      TRUE,  "footnotes",        "value",   "#D3D3D3",
    "footnotes_border_lr_style",          TRUE,  "footnotes",        "value",   "none",
    "footnotes_border_lr_width",          TRUE,  "footnotes",        "px",      "2px",
    "footnotes_border_lr_color",          TRUE,  "footnotes",        "value",   "#D3D3D3",
    "footnotes_sep",                     FALSE,  "footnotes",        "value",   "<br />",
    "footnotes_marks" ,                  FALSE,  "footnotes",        "values",  "numbers",
    "source_notes_padding",               TRUE,  "source_notes",     "px",      "4px",
    "source_notes_background_color",      TRUE,  "source_notes",     "value",   NA_character_,
    "source_notes_font_size",             TRUE,  "source_notes",     "px",      "90%",
    "source_notes_border_bottom_style",   TRUE,  "source_notes",     "value",   "none",
    "source_notes_border_bottom_width",   TRUE,  "source_notes",     "px",      "2px",
    "source_notes_border_bottom_color",   TRUE,  "source_notes",     "value",   "#D3D3D3",
    "source_notes_border_lr_style",       TRUE,  "source_notes",     "value",   "none",
    "source_notes_border_lr_width",       TRUE,  "source_notes",     "px",      "2px",
    "source_notes_border_lr_color",       TRUE,  "source_notes",     "value",   "#D3D3D3",
    "row_striping_background_color",      TRUE,  "row",              "value",   "rgba(128,128,128,0.05)",
    "row_striping_include_stub",         FALSE,  "row",              "logical", FALSE,
    "row_striping_include_table_body",   FALSE,  "row",              "logical", FALSE,
  )[-1, ]
