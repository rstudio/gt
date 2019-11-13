context("Ensuring that the `tab_options()` function works as expected")

# Create a table with rownames and four columns of values
tbl <-
  dplyr::tribble(
    ~groupname,    ~rowname, ~col_1, ~col_2, ~col_3, ~col_4,
    "2018-02-10",  "1",       767.6,  928.1,  382.0,  674.5,
    "2018-02-10",  "2",       403.3,  461.5,   15.1,  242.8,
    "2018-02-10",  "3",       686.4,   54.1,  282.7,   56.3,
    "2018-02-10",  "4",       662.6,  148.8,  984.6,  928.1,
    "2018-02-11",  "5",       198.5,   65.1,  127.4,  219.3,
    "2018-02-11",  "6",       132.1,  118.1,   91.2,  874.3,
    "2018-02-11",  "7",       349.7,  307.1,  566.7,  542.9,
    "2018-02-11",  "8",        63.7,  504.3,  152.0,  724.5,
    "2018-02-11",  "9",       105.4,  729.8,  962.4,  336.4,
    "2018-02-11",  "10",      924.2,  424.6,  740.8,  104.2)

# Create a table from `tbl` that has all the different components
data <-
  gt(tbl) %>%
  tab_header(
    title = "The Title",
    subtitle = "The Subtitle"
  ) %>%
  tab_stubhead(label = "Stubhead Caption") %>%
  tab_spanner(
    label = "Group 1",
    columns = vars(col_1, col_2)
  ) %>%
  tab_spanner(
    label = "Group 2",
    columns = vars(col_3, col_4)
  ) %>%
  tab_footnote(
    footnote = "Footnote #1",
    locations = cells_data(columns = 1, rows = 1)
  ) %>%
  tab_footnote(
    footnote = "Footnote #2",
    locations = cells_data(columns = 2, rows = 2)
  ) %>%
  tab_footnote(
    footnote = "Footnote #3",
    locations = cells_data(columns = 3, rows = 3)
  ) %>%
  tab_footnote(
    footnote = "Footnote #4",
    locations = cells_data(columns = 4, rows = 4)
  ) %>%
  tab_source_note("A source note for the table.")

# Extract the internal `opts_df` table so that comparisons can be made
opts_df_1 <- dt_options_get(data = data)

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
  skip_if_not_installed("xml2")
}

# Gets the HTML attr value from a single key
selection_value <- function(html, key) {

  selection <- paste0("[", key, "]")

  html %>%
    rvest::html_nodes(selection) %>%
    rvest::html_attr(key)
}

# Gets the inner HTML text from a single value
selection_text <- function(html, selection) {

  html %>%
    rvest::html_nodes(selection) %>%
    rvest::html_text()
}

test_that("the internal `opts_df` table can be correctly modified", {

  # Check that specific suggested packages are available
  check_suggests()

  # Modify the `table.width`
  tbl_html <- data %>% tab_options(table.width = pct(50))

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_width"),
    dt_options_get_value(data = tbl_html, option = "table_width")
  ) %>%
    expect_equal(c("auto", "50%"))

  # Modify the `table.width` option using just a numeric value
  tbl_html <- data %>% tab_options(table.width = 500)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_width"),
    dt_options_get_value(data = tbl_html, option = "table_width")
  ) %>%
    expect_equal(c("auto", "500px"))

  # Modify the `container.height` option using a numeric value
  tbl_html <- data %>% tab_options(container.height = 300)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "container_height"),
    dt_options_get_value(data = tbl_html, option = "container_height")
  ) %>%
    expect_equal(c("auto", "300px"))

  # Modify the `container.width` option using a numeric value
  tbl_html <- data %>% tab_options(container.width = 300)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "container_width"),
    dt_options_get_value(data = tbl_html, option = "container_width")
  ) %>%
    expect_equal(c("auto", "300px"))

  # Modify the `table.align` option (using the `"left"` option)
  tbl_html <- data %>% tab_options(table.align = "left")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_margin_left"),
    dt_options_get_value(data = data, option = "table_margin_right"),
    dt_options_get_value(data = tbl_html, option = "table_margin_left"),
    dt_options_get_value(data = tbl_html, option = "table_margin_right")
  ) %>%
    expect_equal(c("auto", "auto", "0", "auto"))

  # Modify the `table.align` option (using the `"center"` option)
  tbl_html <- data %>% tab_options(table.align = "center")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_margin_left"),
    dt_options_get_value(data = data, option = "table_margin_right"),
    dt_options_get_value(data = tbl_html, option = "table_margin_left"),
    dt_options_get_value(data = tbl_html, option = "table_margin_right")
  ) %>%
    expect_equal(c("auto", "auto", "auto", "auto"))

  # Modify the `table.align` option (using the `"right"` option)
  tbl_html <- data %>% tab_options(table.align = "right")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_margin_left"),
    dt_options_get_value(data = data, option = "table_margin_right"),
    dt_options_get_value(data = tbl_html, option = "table_margin_left"),
    dt_options_get_value(data = tbl_html, option = "table_margin_right")
  ) %>%
    expect_equal(c("auto", "auto", "auto", "0"))

  # Modify the `table.font.size`
  tbl_html <- data %>% tab_options(table.font.size = px(14))

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_font_size"),
    dt_options_get_value(data = tbl_html, option = "table_font_size")
  ) %>%
    expect_equal(c("16px", "14px"))

  # Modify the `table.font.size` option using just a numeric value
  tbl_html <- data %>% tab_options(table.font.size = 14)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_font_size"),
    dt_options_get_value(data = tbl_html, option = "table_font_size")
  ) %>%
    expect_equal(c("16px", "14px"))

  # Modify the `table.background.color`
  tbl_html <- data %>% tab_options(table.background.color = "yellow")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_background_color"),
    dt_options_get_value(data = tbl_html, option = "table_background_color")
  ) %>%
    expect_equal(c("#FFFFFF", "yellow"))

  # Modify the `table.border.top.style`
  tbl_html <- data %>% tab_options(table.border.top.style = "dashed")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_border_top_style"),
    dt_options_get_value(data = tbl_html, option = "table_border_top_style")
  ) %>%
    expect_equal(c("solid", "dashed"))

  # Modify the `table.border.top.width`
  tbl_html <- data %>% tab_options(table.border.top.width = px(3))

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_border_top_width"),
    dt_options_get_value(data = tbl_html, option = "table_border_top_width")
  ) %>%
    expect_equal(c("2px", "3px"))

  # Modify the `table.border.top.width` option using just a numeric value
  tbl_html <- data %>% tab_options(table.border.top.width = 3)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_border_top_width"),
    dt_options_get_value(data = tbl_html, option = "table_border_top_width")
  ) %>%
    expect_equal(c("2px", "3px"))

  # Modify the `table.border.top.color`
  tbl_html <- data %>% tab_options(table.border.top.color = "orange")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_border_top_color"),
    dt_options_get_value(data = tbl_html, option = "table_border_top_color")
  ) %>%
    expect_equal(c("#A8A8A8", "orange"))

  # Modify the `heading.background.color`
  tbl_html <- data %>% tab_options(heading.background.color = "lightblue")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "heading_background_color"),
    dt_options_get_value(data = tbl_html, option = "heading_background_color")
  ) %>%
    expect_equal(c(NA_character_, "lightblue"))

  # Modify the `heading.title.font.size`
  tbl_html <- data %>% tab_options(heading.title.font.size = px(18))

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "heading_title_font_size"),
    dt_options_get_value(data = tbl_html, option = "heading_title_font_size")
  ) %>%
    expect_equal(c("125%", "18px"))

  # Modify the `heading.title.font.size` option using just a numeric value
  tbl_html <- data %>% tab_options(heading.title.font.size = 18)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "heading_title_font_size"),
    dt_options_get_value(data = tbl_html, option = "heading_title_font_size")
  ) %>%
    expect_equal(c("125%", "18px"))

  # Modify the `heading.subtitle.font.size`
  tbl_html <- data %>% tab_options(heading.subtitle.font.size = px(14))

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "heading_subtitle_font_size"),
    dt_options_get_value(data = tbl_html, option = "heading_subtitle_font_size")
  ) %>%
    expect_equal(c("85%", "14px"))

  # Modify the `heading.subtitle.font.size` option using just a numeric value
  tbl_html <- data %>% tab_options(heading.subtitle.font.size = 14)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "heading_subtitle_font_size"),
    dt_options_get_value(data = tbl_html, option = "heading_subtitle_font_size")
  ) %>%
    expect_equal(c("85%", "14px"))

  # Modify the `heading.border.bottom.style`
  tbl_html <- data %>% tab_options(heading.border.bottom.style = "dashed")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "heading_border_bottom_style"),
    dt_options_get_value(data = tbl_html, option = "heading_border_bottom_style")
  ) %>%
    expect_equal(c("solid", "dashed"))

  # Modify the `heading.border.bottom.width`
  tbl_html <- data %>% tab_options(heading.border.bottom.width = px(5))

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "heading_border_bottom_width"),
    dt_options_get_value(data = tbl_html, option = "heading_border_bottom_width")
  ) %>%
    expect_equal(c("2px", "5px"))

  # Modify the `heading.border.bottom.width` option using just a numeric value
  tbl_html <- data %>% tab_options(heading.border.bottom.width = 5)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "heading_border_bottom_width"),
    dt_options_get_value(data = tbl_html, option = "heading_border_bottom_width")
  ) %>%
    expect_equal(c("2px", "5px"))

  # Modify the `heading.border.bottom.color`
  tbl_html <- data %>% tab_options(heading.border.bottom.color = "purple")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "heading_border_bottom_color"),
    dt_options_get_value(data = tbl_html, option = "heading_border_bottom_color")
  ) %>%
    expect_equal(c("#D3D3D3", "purple"))

  # Modify the `column_labels.font.size`
  tbl_html <- data %>% tab_options(column_labels.font.size = px(18))

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "column_labels_font_size"),
    dt_options_get_value(data = tbl_html, option = "column_labels_font_size")
  ) %>%
    expect_equal(c("100%", "18px"))

  # Modify the `column_labels.font.size` option using just a numeric value
  tbl_html <- data %>% tab_options(column_labels.font.size = 18)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "column_labels_font_size"),
    dt_options_get_value(data = tbl_html, option = "column_labels_font_size")
  ) %>%
    expect_equal(c("100%", "18px"))

  # Modify the `column_labels.font.weight`
  tbl_html <- data %>% tab_options(column_labels.font.weight = "bold")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "column_labels_font_weight"),
    dt_options_get_value(data = tbl_html, option = "column_labels_font_weight")
  ) %>%
    expect_equal(c("initial", "bold"))

  # Modify the `column_labels.background.color`
  tbl_html <- data %>% tab_options(column_labels.background.color = "lightgray")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "column_labels_background_color"),
    dt_options_get_value(data = tbl_html, option = "column_labels_background_color")
  ) %>%
    expect_equal(c(NA_character_, "lightgray"))

  # Modify the `row_group.background.color`
  tbl_html <- data %>% tab_options(row_group.background.color = "green")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "row_group_background_color"),
    dt_options_get_value(data = tbl_html, option = "row_group_background_color")
  ) %>%
    expect_equal(c(NA_character_, "green"))

  # Modify the `row_group.font.size`
  tbl_html <- data %>% tab_options(row_group.font.size = px(18))

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "row_group_font_size"),
    dt_options_get_value(data = tbl_html, option = "row_group_font_size")
  ) %>%
    expect_equal(c("100%", "18px"))

  # Modify the `row_group.font.size` option using just a numeric value
  tbl_html <- data %>% tab_options(row_group.font.size = 18)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "row_group_font_size"),
    dt_options_get_value(data = tbl_html, option = "row_group_font_size")
  ) %>%
    expect_equal(c("100%", "18px"))

  # Modify the `row_group.font.weight`
  tbl_html <- data %>% tab_options(row_group.font.weight = "800")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "row_group_font_weight"),
    dt_options_get_value(data = tbl_html, option = "row_group_font_weight")
  ) %>%
    expect_equal(c("initial", "800"))

  # Modify the `row_group.border.top.style`
  tbl_html <- data %>% tab_options(row_group.border.top.style = "dashed")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "row_group_border_top_style"),
    dt_options_get_value(data = tbl_html, option = "row_group_border_top_style")
  ) %>%
    expect_equal(c("solid", "dashed"))

  # Modify the `row_group.border.top.width`
  tbl_html <- data %>% tab_options(row_group.border.top.width = px(5))

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "row_group_border_top_width"),
    dt_options_get_value(data = tbl_html, option = "row_group_border_top_width")
  ) %>%
    expect_equal(c("2px", "5px"))

  # Modify the `row_group.border.top.width` option using just a numeric value
  tbl_html <- data %>% tab_options(row_group.border.top.width = 5)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "row_group_border_top_width"),
    dt_options_get_value(data = tbl_html, option = "row_group_border_top_width")
  ) %>%
    expect_equal(c("2px", "5px"))

  # Modify the `row_group.border.top.color`
  tbl_html <- data %>% tab_options(row_group.border.top.color = "blue")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "row_group_border_top_color"),
    dt_options_get_value(data = tbl_html, option = "row_group_border_top_color")
  ) %>%
    expect_equal(c("#D3D3D3", "blue"))

  # Modify the `row_group.border.bottom.style`
  tbl_html <- data %>% tab_options(row_group.border.bottom.style = "dashed")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "row_group_border_bottom_style"),
    dt_options_get_value(data = tbl_html, option = "row_group_border_bottom_style")
  ) %>%
    expect_equal(c("solid", "dashed"))

  # Modify the `row_group.border.bottom.width`
  tbl_html <- data %>% tab_options(row_group.border.bottom.width = px(4))

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "row_group_border_bottom_width"),
    dt_options_get_value(data = tbl_html, option = "row_group_border_bottom_width")
  ) %>%
    expect_equal(c("2px", "4px"))

  # Modify the `row_group.border.bottom.width` option using just a numeric value
  tbl_html <- data %>% tab_options(row_group.border.bottom.width = 4)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "row_group_border_bottom_width"),
    dt_options_get_value(data = tbl_html, option = "row_group_border_bottom_width")
  ) %>%
    expect_equal(c("2px", "4px"))

  # Modify the `row_group.border.bottom.color`
  tbl_html <- data %>% tab_options(row_group.border.bottom.color = "orange")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "row_group_border_bottom_color"),
    dt_options_get_value(data = tbl_html, option = "row_group_border_bottom_color")
  ) %>%
    expect_equal(c("#D3D3D3", "orange"))

  # Modify the `table_body.border.top.style`
  tbl_html <- data %>% tab_options(table_body.border.top.style = "dotted")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_body_border_top_style"),
    dt_options_get_value(data = tbl_html, option = "table_body_border_top_style")
  ) %>%
    expect_equal(c("solid", "dotted"))

  # Modify the `table_body.border.top.width`
  tbl_html <- data %>% tab_options(table_body.border.top.width = px(5))

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_body_border_top_width"),
    dt_options_get_value(data = tbl_html, option = "table_body_border_top_width")
  ) %>%
    expect_equal(c("2px", "5px"))

  # Modify the `table_body.border.top.width` option using just a numeric value
  tbl_html <- data %>% tab_options(table_body.border.top.width = 5)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_body_border_top_width"),
    dt_options_get_value(data = tbl_html, option = "table_body_border_top_width")
  ) %>%
    expect_equal(c("2px", "5px"))

  # Modify the `table_body.border.top.color`
  tbl_html <- data %>% tab_options(table_body.border.top.color = "red")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_body_border_top_color"),
    dt_options_get_value(data = tbl_html, option = "table_body_border_top_color")
  ) %>%
    expect_equal(c("#D3D3D3", "red"))

  # Modify the `table_body.border.bottom.style`
  tbl_html <- data %>% tab_options(table_body.border.bottom.style = "dotted")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_body_border_bottom_style"),
    dt_options_get_value(data = tbl_html, option = "table_body_border_bottom_style")
  ) %>%
    expect_equal(c("solid", "dotted"))

  # Modify the `table_body.border.bottom.width`
  tbl_html <- data %>% tab_options(table_body.border.bottom.width = px(5))

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_body_border_bottom_width"),
    dt_options_get_value(data = tbl_html, option = "table_body_border_bottom_width")
  ) %>%
    expect_equal(c("2px", "5px"))

  # Modify the `table_body.border.bottom.width` option using just a numeric value
  tbl_html <- data %>% tab_options(table_body.border.bottom.width = 5)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_body_border_bottom_width"),
    dt_options_get_value(data = tbl_html, option = "table_body_border_bottom_width")
  ) %>%
    expect_equal(c("2px", "5px"))

  # Modify the `table_body.border.bottom.color`
  tbl_html <- data %>% tab_options(table_body.border.bottom.color = "red")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "table_body_border_bottom_color"),
    dt_options_get_value(data = tbl_html, option = "table_body_border_bottom_color")
  ) %>%
    expect_equal(c("#D3D3D3", "red"))

  # Modify the `row.padding`
  tbl_html <- data %>% tab_options(data_row.padding = px(8))

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "data_row_padding"),
    dt_options_get_value(data = tbl_html, option = "data_row_padding")
  ) %>%
    expect_equal(c("8px", "8px"))

  # Modify the `row.padding` option using just a numeric value
  tbl_html <- data %>% tab_options(data_row.padding = 6)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "data_row_padding"),
    dt_options_get_value(data = tbl_html, option = "data_row_padding")
  ) %>%
    expect_equal(c("8px", "6px"))

  # Modify the `summary_row.background.color`
  tbl_html <- data %>% tab_options(summary_row.background.color = "pink")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "summary_row_background_color"),
    dt_options_get_value(data = tbl_html, option = "summary_row_background_color")
  ) %>%
    expect_equal(c(NA_character_, "pink"))

  # Modify the `summary_row.padding`
  tbl_html <- data %>% tab_options(summary_row.padding = px(4))

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "summary_row_padding"),
    dt_options_get_value(data = tbl_html, option = "summary_row_padding")
  ) %>%
    expect_equal(c("8px", "4px"))

  # Modify the `summary_row.padding` option using just a numeric value
  tbl_html <- data %>% tab_options(summary_row.padding = 4)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "summary_row_padding"),
    dt_options_get_value(data = tbl_html, option = "summary_row_padding")
  ) %>%
    expect_equal(c("8px", "4px"))

  # Modify the `summary_row.text_transform`
  tbl_html <- data %>% tab_options(summary_row.text_transform = "lowercase")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "summary_row_text_transform"),
    dt_options_get_value(data = tbl_html, option = "summary_row_text_transform")
  ) %>%
    expect_equal(c("inherit", "lowercase"))

  # Modify the `grand_summary_row.background.color`
  tbl_html <- data %>% tab_options(grand_summary_row.background.color = "pink")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "grand_summary_row_background_color"),
    dt_options_get_value(data = tbl_html, option = "grand_summary_row_background_color")
  ) %>%
    expect_equal(c(NA_character_, "pink"))

  # Modify the `grand_summary_row.padding`
  tbl_html <- data %>% tab_options(grand_summary_row.padding = px(4))

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "grand_summary_row_padding"),
    dt_options_get_value(data = tbl_html, option = "grand_summary_row_padding")
  ) %>%
    expect_equal(c("8px", "4px"))

  # Modify the `grand_summary_row.padding` option using just a numeric value
  tbl_html <- data %>% tab_options(grand_summary_row.padding = 4)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "grand_summary_row_padding"),
    dt_options_get_value(data = tbl_html, option = "grand_summary_row_padding")
  ) %>%
    expect_equal(c("8px", "4px"))

  # Modify the `grand_summary_row.text_transform`
  tbl_html <- data %>% tab_options(grand_summary_row.text_transform = "lowercase")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "grand_summary_row_text_transform"),
    dt_options_get_value(data = tbl_html, option = "grand_summary_row_text_transform")
  ) %>%
    expect_equal(c("inherit", "lowercase"))

  # Modify the `footnote.font.size`
  tbl_html <- data %>% tab_options(footnotes.font.size = px(12))

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "footnotes_font_size"),
    dt_options_get_value(data = tbl_html, option = "footnotes_font_size")
  ) %>%
    expect_equal(c("90%", "12px"))

  # Modify the `footnote.font.size` option using just a numeric value
  tbl_html <- data %>% tab_options(footnotes.font.size = 12)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "footnotes_font_size"),
    dt_options_get_value(data = tbl_html, option = "footnotes_font_size")
  ) %>%
    expect_equal(c("90%", "12px"))

  # Modify the `footnote.padding`
  tbl_html <- data %>% tab_options(footnotes.padding = px(3))

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "footnotes_padding"),
    dt_options_get_value(data = tbl_html, option = "footnotes_padding")
  ) %>%
    expect_equal(c("4px", "3px"))

  # Modify the `footnote.padding` option using just a numeric value
  tbl_html <- data %>% tab_options(footnotes.padding = 3)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "footnotes_padding"),
    dt_options_get_value(data = tbl_html, option = "footnotes_padding")
  ) %>%
    expect_equal(c("4px", "3px"))

  # Modify the `source_notes.font.size`
  tbl_html <- data %>% tab_options(source_notes.font.size = px(12))

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "source_notes_font_size"),
    dt_options_get_value(data = tbl_html, option = "source_notes_font_size")
  ) %>%
    expect_equal(c("90%", "12px"))

  # Modify the `source_notes.font.size` option using just a numeric value
  tbl_html <- data %>% tab_options(source_notes.font.size = 12)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "source_notes_font_size"),
    dt_options_get_value(data = tbl_html, option = "source_notes_font_size")
  ) %>%
    expect_equal(c("90%", "12px"))

  # Modify the `source_notes.padding`
  tbl_html <- data %>% tab_options(source_notes.padding = px(3))

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "source_notes_padding"),
    dt_options_get_value(data = tbl_html, option = "source_notes_padding")
  ) %>%
    expect_equal(c("4px", "3px"))

  # Modify the `source_notes.padding` option using just a numeric value
  tbl_html <- data %>% tab_options(source_notes.padding = 3)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "source_notes_padding"),
    dt_options_get_value(data = tbl_html, option = "source_notes_padding")
  ) %>%
    expect_equal(c("4px", "3px"))

  # Modify the `row.striping.include_stub` option
  tbl_html <- data %>% tab_options(row.striping.include_stub = TRUE)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "row_striping_include_stub"),
    dt_options_get_value(data = tbl_html, option = "row_striping_include_stub")
  ) %>%
    expect_equal(c(FALSE, TRUE))

  # Modify the `row.striping.include_table_body` option
  tbl_html <- data %>% tab_options(row.striping.include_table_body = FALSE)

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "row_striping_include_table_body"),
    dt_options_get_value(data = tbl_html, option = "row_striping_include_table_body")
  ) %>%
    expect_equal(c(TRUE, FALSE))

  # Modify the `footnote.marks` option
  tbl_html <- data %>% tab_options(footnotes.marks = "LETTERS")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "footnotes_marks"),
    dt_options_get_value(data = tbl_html, option = "footnotes_marks")
  ) %>%
    expect_equal(c("numbers", "LETTERS"))

  # Modify the `footnotes.sep` option
  tbl_html <- data %>% tab_options(footnotes.sep = " ")

  # Compare before and after values
  c(dt_options_get_value(data = data, option = "footnotes_sep"),
    dt_options_get_value(data = tbl_html, option = "footnotes_sep")
  ) %>%
    expect_equal(c("<br />", " "))
})

test_that("the `opts_df` getter/setter functions properly", {

  # Obtain a local copy of the internal `_options` table
  dt_options_get(data = data) %>% expect_is("tbl_df")

  # Get a value
  dt_options_get_value(data = data, option = "footnotes_font_size") %>%
    expect_equal("90%")

  # Set a value, then immediately get it
  dt_options_set_value(
    data = data,
    option = "footnotes_font_size",
    value = "60%"
  ) %>%
    dt_options_get_value(option = "footnotes_font_size") %>%
    expect_equal("60%")
})

test_that("all column labels can be entirely hidden from view", {

  # Expect that the option `column_labels.hidden = TRUE` will
  # remove the expected node with the classes of `gt_col_heading`
  # and `gt_right` (i.e., the column labels)
  expect_length(
    tbl %>%
      dplyr::select(col_1, col_2, col_3, col_4) %>%
      gt() %>%
      tab_options(column_labels.hidden = TRUE) %>%
      render_as_html() %>%
      xml2::read_html() %>%
      selection_text("[class='gt_col_heading gt_right']"),
    0)

  # Expect that not hiding the column labels yields a length
  # four vector when using the same search
  expect_length(
    tbl %>%
      dplyr::select(col_1, col_2, col_3, col_4) %>%
      gt() %>%
      render_as_html() %>%
      xml2::read_html() %>%
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']"),
    4)
})

test_that("the row striping options work correctly", {

  # Expect that the option `row.striping.include_stub = FALSE`
  # will result in no CSS class combinations of `gt_stub` and
  # `gt_striped`
  expect_length(
    tbl %>%
      gt() %>%
      tab_options(row.striping.include_stub = FALSE) %>%
      render_as_html() %>%
      xml2::read_html() %>%
      selection_text("[class='gt_row gt_left gt_stub gt_striped']"),
    0)

  # Expect that the option `row.striping.include_stub = TRUE` will
  # result in a particular class combination for every second
  # stub cell (includes `gt_striped`)
  expect_length(
    tbl %>%
      gt() %>%
      tab_options(row.striping.include_stub = TRUE) %>%
      render_as_html() %>%
      xml2::read_html() %>%
      selection_text("[class='gt_row gt_left gt_stub gt_striped']"),
    5)

  # Expect that the option `row.striping.include_table_body = TRUE` will
  # result in a particular class combination for every second
  # stub cell (includes `gt_striped`)
  expect_length(
    tbl %>%
      gt() %>%
      tab_options(row.striping.include_table_body = TRUE) %>%
      render_as_html() %>%
      xml2::read_html() %>%
      selection_text("[class='gt_row gt_right gt_striped']"),
    20)

  # Expect that the options `row.striping.include_table_body = TRUE`
  # and `row.striping.include_stub = TRUE` will result in cells that
  # have either of two class combinations for every second stub cell
  # (both include `gt_striped`)
  expect_length(
    c(
      tbl %>%
      gt() %>%
      tab_options(
        row.striping.include_stub = TRUE,
        row.striping.include_table_body = TRUE) %>%
      render_as_html() %>%
      xml2::read_html() %>%
      selection_text("[class='gt_row gt_left gt_stub gt_striped']"),
      tbl %>%
        gt() %>%
        tab_options(
          row.striping.include_stub = TRUE,
          row.striping.include_table_body = TRUE) %>%
        render_as_html() %>%
        xml2::read_html() %>%
        selection_text("[class='gt_row gt_right gt_striped']")
      ),
    25)

  # Expect that the options `row.striping.include_table_body = FALSE`
  # and `row.striping.include_stub = FALSE` will result in cells that
  # have neither of two class combinations in every second stub cell
  # (with `gt_striped`)
  expect_length(
    c(
      tbl %>%
        gt() %>%
        tab_options(
          row.striping.include_stub = FALSE,
          row.striping.include_table_body = FALSE) %>%
        render_as_html() %>%
        xml2::read_html() %>%
        selection_text("[class='gt_row gt_left gt_stub gt_striped']"),
      tbl %>%
        gt() %>%
        tab_options(
          row.striping.include_stub = FALSE,
          row.striping.include_table_body = FALSE) %>%
        render_as_html() %>%
        xml2::read_html() %>%
        selection_text("[class='gt_row gt_right gt_striped']")
    ),
    0)
})
