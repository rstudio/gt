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

  dt_options <- dt_options_get(data = data)

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
    ~parameter,                          ~scss,  ~category,          ~type,     ~value,           ~bs_value,
    "empty",                             FALSE,  "empty",            "value",   list(),            NA_character_,
    "container_width",                   FALSE,  "container",        "px",      "auto",            NA_character_,
    "container_height",                  FALSE,  "container",        "px",      "auto",            NA_character_,
    "container_overflow_x",              FALSE,  "container",        "overflow","auto",            NA_character_,
    "container_overflow_y",              FALSE,  "container",        "overflow","auto",            NA_character_,
    "table_id",                          FALSE,  "table",            "value",   NA_character_,     NA_character_,
    "table_width",                        TRUE,  "table",            "px",      "auto",            NA_character_,
    "table_layout",                       TRUE,  "table",            "value",   "fixed",           NA_character_,
    "table_margin_left",                  TRUE,  "table",            "px",      "auto",            NA_character_,
    "table_margin_right",                 TRUE,  "table",            "px",      "auto",            NA_character_,
    "table_background_color",             TRUE,  "table",            "value",   "#FFFFFF",         "if($table-bg==null or alpha($table-bg)==0, $body-bg, $table-bg)",
    "table_additional_css",              FALSE,  "table",            "values",  character(0),      NA_character_,
    "table_font_names",                  FALSE,  "table",            "values",  default_fonts_vec, "$font-family-base",
    "table_font_size",                    TRUE,  "table",            "px",      "16px",            "$font-size-base",
    "table_font_weight",                  TRUE,  "table",            "value",   "normal",          NA_character_,
    "table_font_style",                   TRUE,   "table",           "value",   "normal",          NA_character_,
    "table_font_color",                   TRUE,  "table",            "value",   "#333333",         NA_character_,
    "table_font_color_light",             TRUE,  "table",            "value",   "#FFFFFF",         NA_character_,
    "table_border_top_include",          FALSE,  "table",            "logical", TRUE,              NA_character_,
    "table_border_top_style",             TRUE,  "table",            "value",   "solid",           NA_character_,
    "table_border_top_width",             TRUE,  "table",            "px",      "2px",             NA_character_,
    "table_border_top_color",             TRUE,  "table",            "value",   "#A8A8A8",         "mix($bg, $fg, 66%)",
    "table_border_right_style",           TRUE,  "table",            "value",   "none",            NA_character_,
    "table_border_right_width",           TRUE,  "table",            "px",      "2px",             NA_character_,
    "table_border_right_color",           TRUE,  "table",            "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "table_border_bottom_include",       FALSE,  "table",            "logical", TRUE,              NA_character_,
    "table_border_bottom_style",          TRUE,  "table",            "value",   "solid",           NA_character_,
    "table_border_bottom_width",          TRUE,  "table",            "px",      "2px",             NA_character_,
    "table_border_bottom_color",          TRUE,  "table",            "value",   "#A8A8A8",         "mix($bg, $fg, 66%)",
    "table_border_left_style",            TRUE,  "table",            "value",   "none",            NA_character_,
    "table_border_left_width",            TRUE,  "table",            "px",      "2px",             NA_character_,
    "table_border_left_color",            TRUE,  "table",            "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "heading_background_color",           TRUE,  "heading",          "value",   NA_character_,     NA_character_,
    "heading_align",                      TRUE,  "heading",          "value",   "center",          NA_character_,
    "heading_title_font_size",            TRUE,  "heading",          "px",      "125%",            NA_character_,
    "heading_title_font_weight",          TRUE,  "heading",          "value",   "initial",         NA_character_,
    "heading_subtitle_font_size",         TRUE,  "heading",          "px",      "85%",             NA_character_,
    "heading_subtitle_font_weight",       TRUE,  "heading",          "value",   "initial",         NA_character_,
    "heading_border_bottom_style",        TRUE,  "heading",          "value",   "solid",           NA_character_,
    "heading_border_bottom_width",        TRUE,  "heading",          "px",      "2px",             NA_character_,
    "heading_border_bottom_color",        TRUE,  "heading",          "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "heading_border_lr_style",            TRUE,  "heading",          "value",   "none",            NA_character_,
    "heading_border_lr_width",            TRUE,  "heading",          "px",      "1px",             NA_character_,
    "heading_border_lr_color",            TRUE,  "heading",          "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "column_labels_background_color",     TRUE,  "column_labels",    "value",   NA_character_,     NA_character_,
    "column_labels_font_size",            TRUE,  "column_labels",    "px",      "100%",            NA_character_,
    "column_labels_font_weight",          TRUE,  "column_labels",    "value",   "normal",          NA_character_,
    "column_labels_text_transform",       TRUE,  "column_labels",    "value",   "inherit",         NA_character_,
    "column_labels_vlines_style",         TRUE,  "table_body",       "value",   "none",            NA_character_,
    "column_labels_vlines_width",         TRUE,  "table_body",       "px",      "1px",             NA_character_,
    "column_labels_vlines_color",         TRUE,  "table_body",       "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "column_labels_border_top_style",     TRUE,  "column_labels",    "value",   "solid",           NA_character_,
    "column_labels_border_top_width",     TRUE,  "column_labels",    "px",      "2px",             NA_character_,
    "column_labels_border_top_color",     TRUE,  "column_labels",    "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "column_labels_border_bottom_style",  TRUE,  "column_labels",    "value",   "solid",           NA_character_,
    "column_labels_border_bottom_width",  TRUE,  "column_labels",    "px",      "2px",             NA_character_,
    "column_labels_border_bottom_color",  TRUE,  "column_labels",    "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "column_labels_border_lr_style",      TRUE,  "column_labels",    "value",   "none",            NA_character_,
    "column_labels_border_lr_width",      TRUE,  "column_labels",    "px",      "1px",             NA_character_,
    "column_labels_border_lr_color",      TRUE,  "column_labels",    "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "column_labels_hidden",              FALSE,  "column_labels",    "logical", FALSE,             NA_character_,
    "row_group_background_color",         TRUE,  "row_group",        "value",   NA_character_,     NA_character_,
    "row_group_font_size",                TRUE,  "row_group",        "px",      "100%",            NA_character_,
    "row_group_font_weight",              TRUE,  "row_group",        "value",   "initial",         NA_character_,
    "row_group_text_transform",           TRUE,  "row_group",        "value",   "inherit",         NA_character_,
    "row_group_padding",                  TRUE,  "row_group",        "px",      "8px",             NA_character_,
    "row_group_border_top_style",         TRUE,  "row_group",        "value",   "solid",           NA_character_,
    "row_group_border_top_width",         TRUE,  "row_group",        "px",      "2px",             NA_character_,
    "row_group_border_top_color",         TRUE,  "row_group",        "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "row_group_border_right_style",       TRUE,  "row_group",        "value",   "none",            NA_character_,
    "row_group_border_right_width",       TRUE,  "row_group",        "px",      "1px",             NA_character_,
    "row_group_border_right_color",       TRUE,  "row_group",        "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "row_group_border_bottom_style",      TRUE,  "row_group",        "value",   "solid",           NA_character_,
    "row_group_border_bottom_width",      TRUE,  "row_group",        "px",      "2px",             NA_character_,
    "row_group_border_bottom_color",      TRUE,  "row_group",        "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "row_group_border_left_style",        TRUE,  "row_group",        "value",   "none",            NA_character_,
    "row_group_border_left_width",        TRUE,  "row_group",        "px",      "1px",             NA_character_,
    "row_group_border_left_color",        TRUE,  "row_group",        "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "table_body_hlines_style",            TRUE,  "table_body",       "value",   "solid",           NA_character_,
    "table_body_hlines_width",            TRUE,  "table_body",       "px",      "1px",             NA_character_,
    "table_body_hlines_color",            TRUE,  "table_body",       "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "table_body_vlines_style",            TRUE,  "table_body",       "value",   "none",            NA_character_,
    "table_body_vlines_width",            TRUE,  "table_body",       "px",      "1px",             NA_character_,
    "table_body_vlines_color",            TRUE,  "table_body",       "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "table_body_border_top_style",        TRUE,  "table_body",       "value",   "solid",           NA_character_,
    "table_body_border_top_width",        TRUE,  "table_body",       "px",      "2px",             NA_character_,
    "table_body_border_top_color",        TRUE,  "table_body",       "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "table_body_border_bottom_style",     TRUE,  "table_body",       "value",   "solid",           NA_character_,
    "table_body_border_bottom_width",     TRUE,  "table_body",       "px",      "2px",             NA_character_,
    "table_body_border_bottom_color",     TRUE,  "table_body",       "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "data_row_padding",                   TRUE,  "data_row",         "px",      "8px",             NA_character_,
    "stub_background_color",              TRUE,  "stub",             "value",   NA_character_,     NA_character_,
    "stub_font_size",                     TRUE,  "stub",             "px",      "100%",            NA_character_,
    "stub_font_weight",                   TRUE,  "stub",             "value",   "initial",         NA_character_,
    "stub_text_transform",                TRUE,  "stub",             "value",   "inherit",         NA_character_,
    "stub_border_style",                  TRUE,  "stub",             "value",   "solid",           NA_character_,
    "stub_border_width",                  TRUE,  "stub",             "px",      "2px",             NA_character_,
    "stub_border_color",                  TRUE,  "stub",             "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "summary_row_padding",                TRUE,  "summary_row",      "px",      "8px",             NA_character_,
    "summary_row_background_color",       TRUE,  "summary_row",      "value",   NA_character_,     NA_character_,
    "summary_row_text_transform",         TRUE,  "summary_row",      "value",   "inherit",         NA_character_,
    "summary_row_border_style",           TRUE,  "summary_row",      "value",   "solid",           NA_character_,
    "summary_row_border_width",           TRUE,  "summary_row",      "px",      "2px",             NA_character_,
    "summary_row_border_color",           TRUE,  "summary_row",      "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "grand_summary_row_padding",          TRUE,  "grand_summary_row", "px",     "8px",             NA_character_,
    "grand_summary_row_background_color", TRUE,  "grand_summary_row", "value",  NA_character_,     NA_character_,
    "grand_summary_row_text_transform",   TRUE,  "grand_summary_row", "value",  "inherit",         NA_character_,
    "grand_summary_row_border_style",     TRUE,  "grand_summary_row", "value",  "double",          NA_character_,
    "grand_summary_row_border_width",     TRUE,  "grand_summary_row", "px",     "6px",             NA_character_,
    "grand_summary_row_border_color",     TRUE,  "grand_summary_row", "value",  "#D3D3D3",         "mix($bg, $fg, 83%)",
    "footnotes_font_size",                TRUE,  "footnotes",        "px",      "90%",             NA_character_,
    "footnotes_padding",                  TRUE,  "footnotes",        "px",      "4px",             NA_character_,
    "footnotes_background_color",         TRUE,  "footnotes",        "value",   NA_character_,     NA_character_,
    "footnotes_margin",                   TRUE,  "footnotes",        "px",      "0px",             NA_character_,
    "footnotes_border_bottom_style",      TRUE,  "footnotes",        "value",   "none",            NA_character_,
    "footnotes_border_bottom_width",      TRUE,  "footnotes",        "px",      "2px",             NA_character_,
    "footnotes_border_bottom_color",      TRUE,  "footnotes",        "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "footnotes_border_lr_style",          TRUE,  "footnotes",        "value",   "none",            NA_character_,
    "footnotes_border_lr_width",          TRUE,  "footnotes",        "px",      "2px",             NA_character_,
    "footnotes_border_lr_color",          TRUE,  "footnotes",        "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "footnotes_sep",                     FALSE,  "footnotes",        "value",   "<br />",          NA_character_,
    "footnotes_marks" ,                  FALSE,  "footnotes",        "values",  "numbers",         NA_character_,
    "source_notes_padding",               TRUE,  "source_notes",     "px",      "4px",             NA_character_,
    "source_notes_background_color",      TRUE,  "source_notes",     "value",   NA_character_,     NA_character_,
    "source_notes_font_size",             TRUE,  "source_notes",     "px",      "90%",             NA_character_,
    "source_notes_border_bottom_style",   TRUE,  "source_notes",     "value",   "none",            NA_character_,
    "source_notes_border_bottom_width",   TRUE,  "source_notes",     "px",      "2px",             NA_character_,
    "source_notes_border_bottom_color",   TRUE,  "source_notes",     "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "source_notes_border_lr_style",       TRUE,  "source_notes",     "value",   "none",            NA_character_,
    "source_notes_border_lr_width",       TRUE,  "source_notes",     "px",      "2px",             NA_character_,
    "source_notes_border_lr_color",       TRUE,  "source_notes",     "value",   "#D3D3D3",         "mix($bg, $fg, 83%)",
    "row_striping_background_color",      TRUE,  "row",              "value",   "rgba(128,128,128,0.05)", "$table-accent-bg",
    "row_striping_include_stub",         FALSE,  "row",              "logical", FALSE,             NA_character_,
    "row_striping_include_table_body",   FALSE,  "row",              "logical", FALSE,             NA_character_
  )[-1, ]


# TODO: translate $headings-font-family to a new 'heading_title_font_family' option?
# TODO: translate $table-caption-color for footnotes/source_notes?
bslib_options_tbl <-
  dplyr::tribble(
    ~parameter,                         ~value,                                       ~value3,
    "table_background_color",           "$body-bg",                                   "$body-bg",
    "table_font_names",                 "$font-family-base",                          "$font-family-base",
    "table_font_size",                  "$font-size-base",                            "$font-size-base",
    "table_font_weight",                "$font-weight-base",                          NA_character_,
    "table_border_top_width",           "$table-border-width",                        NA_character_,
    "table_border_top_color",           "mix($table-color,$table-border-color,20%)",  "mix($bg, $fg, 66%)",
    "table_border_right_width",         "$table-border-width",                        NA_character_,
    "table_border_right_color",         "$table-border-color",                        "mix($bg, $fg, 83%)",
    "table_border_bottom_width",        "$table-border-width",                        NA_character_,
    "table_border_bottom_color",        "mix($table-color,$table-border-color,20%)",  "mix($bg, $fg, 66%)",
    "table_border_left_width",          "$table-border-width",                        NA_character_,
    "table_border_left_color",          "$table-border-color",                        "mix($bg, $fg, 83%)",
    "heading_title_font_size",          "$font-size-lg",                              "$font-size-large",
    "heading_title_font_weight",        "$table-th-font-weight",                      NA_character_,
    "heading_subtitle_font_size",       "$font-size-sm",                              "$font-size-small",
    "heading_border_bottom_width",      "$table-border-width",                        NA_character_,
    "heading_border_bottom_color",      "$table-border-color",                        "mix($bg, $fg, 83%)",
    "heading_border_lr_width",          "$table-border-width / 2",                    NA_character_,
    "heading_border_lr_color",          "$table-border-color",                        "mix($bg, $fg, 83%)",
    "column_labels_vlines_width",       "$table-border-width / 2",                    NA_character_,
    "column_labels_vlines_color",       "$table-border-color",                        "mix($bg, $fg, 83%)",
    "column_labels_border_top_width",   "$table-border-width",                        NA_character_,
    "column_labels_border_top_color",   "$table-border-color",                        "mix($bg, $fg, 83%)",
    "column_labels_border_bottom_width","$table-border-width",                        NA_character_,
    "column_labels_border_bottom_color","$table-border-color",                        "mix($bg, $fg, 83%)",
    "column_labels_border_lr_width",    "$table-border-width / 2",                    NA_character_,
    "column_labels_border_lr_color",    "$table-border-color",                        "mix($bg, $fg, 83%)",
    "row_group_border_top_width",       "$table-border-width",                        NA_character_,
    "row_group_border_top_color",       "$table-border-color",                        "mix($bg, $fg, 83%)",
    "row_group_border_right_width",     "$table-border-width / 2",                    NA_character_,
    "row_group_border_right_color",     "$table-border-color",                        "mix($bg, $fg, 83%)",
    "row_group_border_bottom_width",    "$table-border-width",                        NA_character_,
    "row_group_border_bottom_color",    "$table-border-color",                        "mix($bg, $fg, 83%)",
    "row_group_border_left_width",      "$table-border-width / 2",                    NA_character_,
    "row_group_border_left_color",      "$table-border-color",                        "mix($bg, $fg, 83%)",
    "table_body_hlines_width",          "$table-border-width / 2",                    NA_character_,
    "table_body_hlines_color",          "$table-border-color",                        "mix($bg, $fg, 83%)",
    "table_body_vlines_width",          "$table-border-width / 2",                    NA_character_,
    "table_body_vlines_color",          "$table-border-color",                        "mix($bg, $fg, 83%)",
    "table_body_border_top_width",      "$table-border-width",                        NA_character_,
    "table_body_border_top_color",      "$table-border-color",                        "mix($bg, $fg, 83%)",
    "table_body_border_bottom_width",   "$table-border-width",                        NA_character_,
    "table_body_border_bottom_color",   "$table-border-color",                        "mix($bg, $fg, 83%)",
    "data_row_padding",                 "$table-cell-padding",                        "$table-cell-padding",
    "stub_border_width",                "$table-border-width",                        NA_character_,
    "stub_border_color",                "$table-border-color",                        "mix($bg, $fg, 83%)",
    "summary_row_border_width",         "$table-border-width",                        NA_character_,
    "summary_row_border_color",         "$table-border-color",                        "mix($bg, $fg, 83%)",
    "grand_summary_row_border_width",   "$table-border-width * 3",                    NA_character_,
    "grand_summary_row_border_color",   "$table-border-color",                        "mix($bg, $fg, 83%)",
    "footnotes_border_bottom_width",    "$table-border-width",                        NA_character_,
    "footnotes_border_bottom_color",    "$table-border-color",                        "mix($bg, $fg, 83%)",
    "footnotes_border_lr_width",        "$table-border-width",                        NA_character_,
    "footnotes_border_lr_color",        "$table-border-color",                        "mix($bg, $fg, 83%)",
    "source_notes_border_bottom_width", "$table-border-width",                        NA_character_,
    "source_notes_border_bottom_color", "$table-border-color",                        "mix($bg, $fg, 83%)",
    "source_notes_border_lr_width",     "$table-border-width",                        NA_character_,
    "source_notes_border_lr_color",     "$table-border-color",                        "mix($bg, $fg, 83%)",
    "row_striping_background_color",    "$table-accent-bg",                           "$table-bg-accent"
  )
