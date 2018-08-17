gt_options_default <- function() {

  dplyr::tribble(
    ~parameter,                           ~category,             ~value,
    "table_font_size",                    "table",               "16px",
    "table_background_color",             "table",               "#FFFFFF",
    "table_width",                        "table",               "100%",
    "heading_background_color",           "heading",             NA_character_,
    "heading_title_font_size",            "heading",             "125%",
    "heading_headnote_font_size",         "heading",             "85%",
    "heading_border_top",                 "heading",             "solid 2px #A8A8A8",
    "heading_border_bottom",              "heading",             "solid 2px #A8A8A8",
    "stub_heading_background_color",      "stub_heading",        NA_character_,
    "stub_heading_border_top",            "stub_heading",        "2px solid #A8A8A8",
    "stub_heading_border_bottom",         "stub_heading",        "1px solid #BDBDBD",
    "stub_heading_field_background_color","stub_heading_field",  NA_character_,
    "stub_heading_field_border_top",      "stub_heading_field",  "2px solid #A8A8A8",
    "stub_heading_field_border_bottom",   "stub_heading_field",  "1px solid #BDBDBD",
    "field_border_top",                   "field",               "solid 2px #A8A8A8",
    "field_border_bottom",                "field",               "solid 2px #A8A8A8",
    "row_padding",                        "row",                 "10px",
    "row_margin",                         "row",                 "10px",
    "row_striping_background_color",      "row",                 "#F5F5F5",
    "row_striping_include_stub",          "row",                 "TRUE",
    "row_striping_include_field",         "row",                 "TRUE",
    "summary_row_background_color",       "summary_row",         NA_character_,
    "summary_row_padding",                "summary_row",         "6px",
    "summary_row_text_transform",         "summary_row",         "uppercase",
    "footnote_font_size",                 "footnote",            "90%",
    "footnote_padding",                   "footnote",            "4px",
    "sourcenote_font_size",               "sourcenote",          "90%",
    "sourcenote_padding",                 "sourcenote",          "4px") %>%
    as.data.frame()
}
