context("Testing of the helper functions")

test_that("the the `cells_title()` helper function works properly", {

  # Create a `cells_title` object with the `title` option
  helper_cells_title <- cells_title(groups = "title")

  # Expect this has the `cells_title` and `location_cells` classes
  helper_cells_title %>%
    expect_is(c("cells_title", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_title %>%
    length() %>%
    expect_equal(1)

  # Expect the list component to have the `quosure` and `formula` classes
  helper_cells_title[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the formula to be 'title'
  helper_cells_title[[1]][2] %>%
    as.character() %>%
    expect_equal("title")

  # Create a `cells_title` object with the `headnote` option
  helper_cells_title <- cells_title(groups = "headnote")

  # Expect this has the `cells_title` and `location_cells` classes
  helper_cells_title %>%
    expect_is(c("cells_title", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_title %>%
    length() %>%
    expect_equal(1)

  # Expect the list component to have the `quosure` and `formula` classes
  helper_cells_title[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the formula to be 'headnote'
  helper_cells_title[[1]][2] %>%
    as.character() %>%
    expect_equal("headnote")
})

test_that("the the `cells_boxhead()` helper function works properly", {

  # Create a `cells_boxhead` object with names provided to `columns`
  helper_cells_boxhead <- cells_boxhead(columns = c("col_1", "col_2"))

  # Expect this has the `cells_boxhead` and `location_cells` classes
  helper_cells_boxhead %>%
    expect_is(c("cells_boxhead", "location_cells"))

  # Expect the length of the object to be `2`
  helper_cells_boxhead %>%
    length() %>%
    expect_equal(2)

  # Expect that the object has the names `columns` and `groups`
  helper_cells_boxhead %>%
    names() %>%
    expect_equal(c("columns", "groups"))

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_boxhead[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the second list component to be NULL
  is.null(helper_cells_boxhead[[2]]) %>% expect_true()

  # Expect the RHS of the first component formula to contain the vector provided
  helper_cells_boxhead[[1]][2] %>%
    as.character() %>%
    expect_equal("c(\"col_1\", \"col_2\")")

  # Create a `cells_boxhead` object with names provided to `groups`
  helper_cells_boxhead <- cells_boxhead(groups = c("group_1", "group_2"))

  # Expect this has the `cells_boxhead` and `location_cells` classes
  helper_cells_boxhead %>%
    expect_is(c("cells_boxhead", "location_cells"))

  # Expect the length of the object to be `2`
  helper_cells_boxhead %>%
    length() %>%
    expect_equal(2)

  # Expect that the object has the names `columns` and `groups`
  helper_cells_boxhead %>%
    names() %>%
    expect_equal(c("columns", "groups"))

  # Expect the second list component to have the `quosure` and `formula` classes
  helper_cells_boxhead[[2]] %>% expect_is(c("quosure", "formula"))

  # Expect the first list component to be NULL
  is.null(helper_cells_boxhead[[1]]) %>% expect_true()

  # Expect the RHS of the second component formula to
  # contain the vector provided
  helper_cells_boxhead[[2]][2] %>%
    as.character() %>%
    expect_equal("c(\"group_1\", \"group_2\")")

  # Expect an error if values provided to both `columns` and `groups`
  expect_error(
    cells_boxhead(
      columns = c("col_1", "col_2"),
      groups = c("group_1", "group_2")))
})

test_that("the the `cells_group()` helper function works properly", {

  # Create a `cells_group` object with names provided to `groups`
  helper_cells_group <- cells_group(groups = c("group_1", "group_2"))

  # Expect this has the `cells_group` and `location_cells` classes
  helper_cells_group %>%
    expect_is(c("cells_group", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_group %>%
    length() %>%
    expect_equal(1)

  # Expect that the object has within it the name `groups`
  helper_cells_group %>%
    names() %>%
    expect_equal("groups")

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_group[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain the vector provided
  helper_cells_group[[1]][2] %>%
    as.character() %>%
    expect_equal("c(\"group_1\", \"group_2\")")
})

test_that("the the `cells_stub()` helper function works properly", {

  # Create a `cells_stub` object with names provided to `rows`
  helper_cells_stub <- cells_stub(rows = c("row_1", "row_2"))

  # Expect this has the `cells_stub` and `location_cells` classes
  helper_cells_stub %>%
    expect_is(c("cells_stub", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_stub %>%
    length() %>%
    expect_equal(1)

  # Expect that the object has within it the name `rows`
  helper_cells_stub %>%
    names() %>%
    expect_equal("rows")

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_stub[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain the vector provided
  helper_cells_stub[[1]][2] %>%
    as.character() %>%
    expect_equal("c(\"row_1\", \"row_2\")")
})

test_that("the the `cells_data()` helper function works properly", {

  # Create a `cells_data` object with names provided to `columns`
  helper_cells_data <- cells_data(columns = c("col_1", "col_2"))

  # Expect this has the `cells_data` and `location_cells` classes
  helper_cells_data %>%
    expect_is(c("cells_data", "location_cells"))

  # Expect the length of the object to be `2`
  helper_cells_data %>%
    length() %>%
    expect_equal(2)

  # Expect that the object has the names `columns` and `rows`
  helper_cells_data %>%
    names() %>%
    expect_equal(c("columns", "rows"))

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_data[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain the vector provided
  helper_cells_data[[1]][2] %>%
    as.character() %>%
    expect_equal("c(\"col_1\", \"col_2\")")

  # Create a `cells_data` object with names provided to `columns` and `rows`
  helper_cells_data <-
    cells_data(
      columns = c("col_1", "col_2"),
      rows = c("row_1", "row_2"))

  # Expect this has the `cells_data` and `location_cells` classes
  helper_cells_data %>%
    expect_is(c("cells_data", "location_cells"))

  # Expect the length of the object to be `2`
  helper_cells_data %>%
    length() %>%
    expect_equal(2)

  # Expect that the object has the names `columns` and `rows`
  helper_cells_data %>%
    names() %>%
    expect_equal(c("columns", "rows"))

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_data[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the second list component to have the `quosure` and `formula` classes
  helper_cells_data[[2]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain the vector provided
  helper_cells_data[[1]][2] %>%
    as.character() %>%
    expect_equal("c(\"col_1\", \"col_2\")")

  # Expect the RHS of the second component formula to contain
  # the vector provided
  helper_cells_data[[2]][2] %>%
    as.character() %>%
    expect_equal("c(\"row_1\", \"row_2\")")
})

test_that("the the `cells_summary()` helper function works properly", {

  # Create a `cells_summary` object with names provided to `columns`
  helper_cells_summary <-
    cells_summary(
      groups = "group_a",
      columns = c("col_1", "col_2"))

  # Expect this has the `cells_summary` and `location_cells` classes
  helper_cells_summary %>%
    expect_is(c("cells_summary", "location_cells"))

  # Expect the length of the object to be `3`
  helper_cells_summary %>%
    length() %>%
    expect_equal(3)

  # Expect that the object has the names `groups`, `columns`, and `rows`
  helper_cells_summary %>%
    names() %>%
    expect_equal(c("groups", "columns", "rows"))

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_summary[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the second list component to have the `quosure` and `formula` classes
  helper_cells_summary[[2]] %>% expect_is(c("quosure", "formula"))

  # Expect the third list component to have the `quosure` and `formula` classes
  helper_cells_summary[[3]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain
  # the vector provided
  helper_cells_summary[[1]][2] %>%
    as.character() %>%
    expect_equal("group_a")

  # Expect the RHS of the second component formula to contain
  # the vector provided
  helper_cells_summary[[2]][2] %>%
    as.character() %>%
    expect_equal("c(\"col_1\", \"col_2\")")
})

test_that("the the `pct()` helper function works properly", {

  # Create a CSS percentage value string
  percentage <- pct(x = 50)

  # Expect that the value is formatted correctly
  percentage %>% expect_equal("50%")

  # Expect an error if the value supplied is not numeric
  expect_error(
    pct(x = "50"))
})

test_that("the the `px()` helper function works properly", {

  # Create a CSS pixel value string
  pixels <- px(x = 50)

  # Expect that the value is formatted correctly
  pixels %>% expect_equal("50px")

  # Expect an error if the value supplied is not numeric
  expect_error(
    px(x = "50"))
})

test_that("the the `col_labels()` helper function works properly", {

  # Create a gt table from the `mtcars` dataset and apply new
  # labels to the `hp` and `qsec` columns
  gt_tbl <-
    gt(mtcars, rownames_to_stub = TRUE) %>%
    cols_label(
      labels = col_labels(
        hp = md("*HP*"), qsec = "QMT, seconds"))

  # Extract the internal `boxh_df` data frame
  boxh_df <- attr(gt_tbl, "boxh_df", exact = TRUE)

  # Expect specific, non-NA values for `column_label` in the `hp`
  # and `qsec` columns
  boxh_df["column_label", "hp"] %>%
    expect_equal("<em>HP</em>")

  boxh_df["column_label", "qsec"] %>%
    expect_equal("QMT, seconds")

  # Expect all other `column_label` values to be NA
  is.na(boxh_df["column_label", base::setdiff(colnames(mtcars), c("hp", "qsec"))] %>%
    unlist()) %>%
    all() %>%
    expect_true()
})

test_that("the the `apply_styles()` helper function works properly", {

  # Create a properly-formatted style string using the `apply_styles()` function
  styles_vec <-
    apply_styles(
      bkgd_color = "yellow",
      text_color = "green",
      text_font = "Courier",
      text_style = "normal",
      text_size = px(12),
      text_align = "right",
      text_indent = px(5),
      text_decorate = "line-through",
      text_transform = "uppercase")

  # Expect that the generated string matches the correct output string
  styles_vec %>%
    expect_equal("background-color:yellow;color:green;font-family:Courier;font-style:normal;font-size:12px;text-align:right;text-indent:5px;text-decoration:line-through;text-transform:uppercase;")
})
