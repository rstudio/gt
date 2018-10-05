context("Ensuring that the modification of table options is correct")

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
  tab_heading(title = "The Title", headnote = "The Headnote") %>%
  tab_stubhead_caption(caption = "Stubhead Caption") %>%
  tab_boxhead_panel(group = "Group 1", columns = vars(col_1, col_2)) %>%
  tab_boxhead_panel(group = "Group 2", columns = vars(col_3, col_4)) %>%
  tab_footnote(
    footnote = "Footnote #1",
    locations = cells_data(columns = 1, rows = 1)) %>%
  tab_footnote(
    footnote = "Footnote #2",
    locations = cells_data(columns = 2, rows = 2)) %>%
  tab_footnote(
    footnote = "Footnote #3",
    locations = cells_data(columns = 3, rows = 3)) %>%
  tab_footnote(
    footnote = "Footnote #4",
    locations = cells_data(columns = 4, rows = 4)) %>%
  tab_source_note("A source note for the table.")

# Extract the internal `opts_df` table so that comparisons can be made
opts_df_1 <- attr(data, "opts_df", exact = TRUE)

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

  # Modify the `table.font.size`
  tbl_html <- data %>% tab_options(table.font.size = px(14))

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "table_font_size") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "table_font_size") %>% dplyr::pull(value)) %>%
    expect_equal(c("16px", "14px"))

  # Modify the `table.background.color`
  tbl_html <- data %>% tab_options(table.background.color = "yellow")

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "table_background_color") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "table_background_color") %>% dplyr::pull(value)) %>%
    expect_equal(c("#FFFFFF", "yellow"))

  # Modify the `table.width`
  tbl_html <- data %>% tab_options(table.width = pct(50))

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "table_width") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "table_width") %>% dplyr::pull(value)) %>%
    expect_equal(c("100%", "50%"))

  # Modify the `table.border.top.style`
  tbl_html <- data %>% tab_options(table.border.top.style = "dashed")

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "table_border_top_style") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "table_border_top_style") %>% dplyr::pull(value)) %>%
    expect_equal(c("solid", "dashed"))

  # Modify the `table.border.top.width`
  tbl_html <- data %>% tab_options(table.border.top.width = px(3))

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "table_border_top_width") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "table_border_top_width") %>% dplyr::pull(value)) %>%
    expect_equal(c("2px", "3px"))

  # Modify the `table.border.top.color`
  tbl_html <- data %>% tab_options(table.border.top.color = "orange")

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "table_border_top_color") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "table_border_top_color") %>% dplyr::pull(value)) %>%
    expect_equal(c("#A8A8A8", "orange"))

  # Modify the `heading.background.color`
  tbl_html <- data %>% tab_options(heading.background.color = "lightblue")

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "heading_background_color") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "heading_background_color") %>% dplyr::pull(value)) %>%
    expect_equal(c(NA_character_, "lightblue"))

  # Modify the `heading.title.font.size`
  tbl_html <- data %>% tab_options(heading.title.font.size = px(18))

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "heading_title_font_size") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "heading_title_font_size") %>% dplyr::pull(value)) %>%
    expect_equal(c("125%", "18px"))

  # Modify the `heading.headnote.font.size`
  tbl_html <- data %>% tab_options(heading.headnote.font.size = px(14))

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "heading_headnote_font_size") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "heading_headnote_font_size") %>% dplyr::pull(value)) %>%
    expect_equal(c("85%", "14px"))

  # Modify the `heading.border.bottom.style`
  tbl_html <- data %>% tab_options(heading.border.bottom.style = "dashed")

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "heading_border_bottom_style") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "heading_border_bottom_style") %>% dplyr::pull(value)) %>%
    expect_equal(c("solid", "dashed"))

  # Modify the `heading.border.bottom.width`
  tbl_html <- data %>% tab_options(heading.border.bottom.width = px(5))

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "heading_border_bottom_width") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "heading_border_bottom_width") %>% dplyr::pull(value)) %>%
    expect_equal(c("2px", "5px"))

  # Modify the `heading.border.bottom.color`
  tbl_html <- data %>% tab_options(heading.border.bottom.color = "purple")

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "heading_border_bottom_color") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "heading_border_bottom_color") %>% dplyr::pull(value)) %>%
    expect_equal(c("#A8A8A8", "purple"))

  # Modify the `boxhead.font.size`
  tbl_html <- data %>% tab_options(boxhead.font.size = px(18))

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "boxhead_font_size") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "boxhead_font_size") %>% dplyr::pull(value)) %>%
    expect_equal(c("16px", "18px"))

  # Modify the `boxhead.font.weight`
  tbl_html <- data %>% tab_options(boxhead.font.weight = "bold")

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "boxhead_font_weight") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "boxhead_font_weight") %>% dplyr::pull(value)) %>%
    expect_equal(c("initial", "bold"))

  # Modify the `boxhead.background.color`
  tbl_html <- data %>% tab_options(boxhead.background.color = "lightgray")

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "boxhead_background_color") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "boxhead_background_color") %>% dplyr::pull(value)) %>%
    expect_equal(c(NA_character_, "lightgray"))

  # Modify the `stub_group.background.color`
  tbl_html <- data %>% tab_options(stub_group.background.color = "green")

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "stub_group_background_color") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "stub_group_background_color") %>% dplyr::pull(value)) %>%
    expect_equal(c(NA_character_, "green"))

  # Modify the `stub_group.font.size`
  tbl_html <- data %>% tab_options(stub_group.font.size = px(18))

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "stub_group_font_size") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "stub_group_font_size") %>% dplyr::pull(value)) %>%
    expect_equal(c("16px", "18px"))

  # Modify the `stub_group.font.weight`
  tbl_html <- data %>% tab_options(stub_group.font.weight = "800")

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "stub_group_font_weight") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "stub_group_font_weight") %>% dplyr::pull(value)) %>%
    expect_equal(c("initial", "800"))

  # Modify the `stub_group.border.top.style`
  tbl_html <- data %>% tab_options(stub_group.border.top.style = "dashed")

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "stub_group_border_top_style") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "stub_group_border_top_style") %>% dplyr::pull(value)) %>%
    expect_equal(c("solid", "dashed"))

  # Modify the `stub_group.border.top.width`
  tbl_html <- data %>% tab_options(stub_group.border.top.width = px(5))

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "stub_group_border_top_width") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "stub_group_border_top_width") %>% dplyr::pull(value)) %>%
    expect_equal(c("2px", "5px"))

  # Modify the `stub_group.border.top.color`
  tbl_html <- data %>% tab_options(stub_group.border.top.color = "blue")

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "stub_group_border_top_color") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "stub_group_border_top_color") %>% dplyr::pull(value)) %>%
    expect_equal(c("#A8A8A8", "blue"))

  # Modify the `stub_group.border.bottom.style`
  tbl_html <- data %>% tab_options(stub_group.border.bottom.style = "dashed")

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "stub_group_border_bottom_style") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "stub_group_border_bottom_style") %>% dplyr::pull(value)) %>%
    expect_equal(c("solid", "dashed"))

  # Modify the `stub_group.border.bottom.width`
  tbl_html <- data %>% tab_options(stub_group.border.bottom.width = px(4))

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "stub_group_border_bottom_width") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "stub_group_border_bottom_width") %>% dplyr::pull(value)) %>%
    expect_equal(c("2px", "4px"))

  # Modify the `stub_group.border.bottom.color`
  tbl_html <- data %>% tab_options(stub_group.border.bottom.color = "orange")

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "stub_group_border_bottom_color") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "stub_group_border_bottom_color") %>% dplyr::pull(value)) %>%
    expect_equal(c("#A8A8A8", "orange"))

  # Modify the `field.border.top.style`
  tbl_html <- data %>% tab_options(field.border.top.style = "dotted")

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "field_border_top_style") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "field_border_top_style") %>% dplyr::pull(value)) %>%
    expect_equal(c("solid", "dotted"))

  # Modify the `field.border.top.width`
  tbl_html <- data %>% tab_options(field.border.top.width = px(5))

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "field_border_top_width") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "field_border_top_width") %>% dplyr::pull(value)) %>%
    expect_equal(c("2px", "5px"))

  # Modify the `field.border.top.color`
  tbl_html <- data %>% tab_options(field.border.top.color = "red")

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "field_border_top_color") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "field_border_top_color") %>% dplyr::pull(value)) %>%
    expect_equal(c("#A8A8A8", "red"))

  # Modify the `field.border.bottom.style`
  tbl_html <- data %>% tab_options(field.border.bottom.style = "dotted")

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "field_border_bottom_style") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "field_border_bottom_style") %>% dplyr::pull(value)) %>%
    expect_equal(c("solid", "dotted"))

  # Modify the `field.border.bottom.width`
  tbl_html <- data %>% tab_options(field.border.bottom.width = px(5))

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "field_border_bottom_width") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "field_border_bottom_width") %>% dplyr::pull(value)) %>%
    expect_equal(c("2px", "5px"))

  # Modify the `field.border.bottom.color`
  tbl_html <- data %>% tab_options(field.border.bottom.color = "red")

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "field_border_bottom_color") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "field_border_bottom_color") %>% dplyr::pull(value)) %>%
    expect_equal(c("#A8A8A8", "red"))

  # Modify the `row.padding`
  tbl_html <- data %>% tab_options(row.padding = px(8))

  # Compare before and after values
  c(opts_df_1 %>%
      dplyr::filter(parameter == "row_padding") %>% dplyr::pull(value),
    attr(tbl_html, "opts_df", exact = TRUE) %>%
      dplyr::filter(parameter == "row_padding") %>% dplyr::pull(value)) %>%
    expect_equal(c("10px", "8px"))


  # summary_row.background.color = "pink"
  # summary_row.padding = px(3)
  # summary_row.text_transform = "lowercase"
  # footnote.font.size = px(12)
  # footnote.padding = px(3)
  # sourcenote.font.size = px(12)
  # sourcenote.padding = px(3)



})

