context("Ensuring that the `cells_*()` functions work as expected")

test_that("the `cells_title()` function works correctly", {

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
  helper_cells_title[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal("title")

  # Create a `cells_title` object with the `subtitle` option
  helper_cells_title <- cells_title(groups = "subtitle")

  # Expect this has the `cells_title` and `location_cells` classes
  helper_cells_title %>%
    expect_is(c("cells_title", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_title %>%
    length() %>%
    expect_equal(1)

  # Expect the list component to have the `quosure` and `formula` classes
  helper_cells_title[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the formula to be 'subtitle'
  helper_cells_title[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal("subtitle")
})

test_that("the `cells_column_labels()` function works correctly", {

  # Create a `cells_column_labels` object with names provided to `columns`
  helper_cells_column_labels <-
    cells_column_labels(columns = c("col_1", "col_2"))

  # Expect this has the `cells_column_labels` and `location_cells` classes
  helper_cells_column_labels %>%
    expect_is(c("cells_column_labels", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_column_labels %>%
    length() %>%
    expect_equal(1)

  # Expect that the object has the name `columns`
  helper_cells_column_labels %>%
    names() %>%
    expect_equal("columns")

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_column_labels[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the formula to contain the vector provided
  helper_cells_column_labels[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("col_1", "col_2"))

  # Create a `cells_column_labels` object with names provided to `groups`
  helper_cells_column_spanners <-
    cells_column_spanners(spanners = c("group_1", "group_2"))

  # Expect this has the `cells_column_spanners` and `location_cells` classes
  helper_cells_column_spanners %>%
    expect_is(c("cells_column_spanners", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_column_spanners %>%
    length() %>%
    expect_equal(1)

  # Expect that the object has the name `spanners`
  helper_cells_column_spanners %>%
    names() %>%
    expect_equal("spanners")

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_column_spanners[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the first list component to be not be NULL
  is.null(helper_cells_column_spanners[[1]]) %>% expect_false()

  # Expect the RHS to contain the vector provided
  helper_cells_column_spanners[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("group_1", "group_2"))
})

test_that("the `cells_group()` function works correctly", {

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
  helper_cells_group[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("group_1", "group_2"))
})

test_that("the `cells_stub()` function works correctly", {

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
  helper_cells_stub[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("row_1", "row_2"))
})

test_that("the `cells_body()` function works correctly", {

  # Create a `cells_body` object with names provided to `columns`
  helper_cells_body <- cells_body(columns = c("col_1", "col_2"))

  # Expect this has the `cells_body` and `location_cells` classes
  helper_cells_body %>%
    expect_is(c("cells_body", "location_cells"))

  # Expect the length of the object to be `2`
  helper_cells_body %>%
    length() %>%
    expect_equal(2)

  # Expect that the object has the names `columns` and `rows`
  helper_cells_body %>%
    names() %>%
    expect_equal(c("columns", "rows"))

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_body[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain the vector provided
  helper_cells_body[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("col_1", "col_2"))

  # Create a `cells_body` object with names provided to `columns` and `rows`
  helper_cells_body <-
    cells_body(
      columns = c("col_1", "col_2"),
      rows = c("row_1", "row_2")
    )

  # Expect this has the `cells_body` and `location_cells` classes
  helper_cells_body %>%
    expect_is(c("cells_body", "location_cells"))

  # Expect the length of the object to be `2`
  helper_cells_body %>%
    length() %>%
    expect_equal(2)

  # Expect that the object has the names `columns` and `rows`
  helper_cells_body %>%
    names() %>%
    expect_equal(c("columns", "rows"))

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_body[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the second list component to have the `quosure` and `formula` classes
  helper_cells_body[[2]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain the vector provided
  helper_cells_body[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("col_1", "col_2"))

  # Expect the RHS of the second component formula to contain
  # the vector provided
  helper_cells_body[[2]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("row_1", "row_2"))
})

test_that("the `cells_summary()` function works correctly", {

  # Create a `cells_summary` object with names provided to `columns`
  helper_cells_summary <-
    cells_summary(
      groups = "group_a",
      columns = c("col_1", "col_2")
    )

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
  helper_cells_summary[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal("group_a")

  # Expect the RHS of the second component formula to contain
  # the vector provided
  helper_cells_summary[[2]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("col_1", "col_2"))

  # Create a `cells_summary` object with
  # columns in `vars()` provided to `columns`
  helper_cells_summary <-
    cells_summary(
      groups = "group_a",
      columns = vars(col_1, col_2)
    )

  # Expect the RHS of the second component formula to contain
  # the vector provided
  helper_cells_summary[[2]] %>%
    rlang::eval_tidy() %>%
    vapply(rlang::as_name, USE.NAMES = FALSE, character(1)) %>%
    expect_equal(c("col_1", "col_2"))
})

test_that("the `cells_grand_summary()` function works correctly", {

  # Create a `cells_grand_summary` object with names provided to `columns`
  helper_cells_grand_summary <-
    cells_grand_summary(
      columns = c("col_1", "col_2")
    )

  # Expect this has the `cells_summary` and `location_cells` classes
  helper_cells_grand_summary %>%
    expect_is(c("cells_grand_summary", "location_cells"))

  # Expect the length of the object to be `2`
  helper_cells_grand_summary %>%
    length() %>%
    expect_equal(2)

  # Expect that the object has the names `columns` and `rows`
  helper_cells_grand_summary %>%
    names() %>%
    expect_equal(c("columns", "rows"))

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_grand_summary[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the second list component to have the `quosure` and `formula` classes
  helper_cells_grand_summary[[2]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain
  # the vector provided
  helper_cells_grand_summary[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("col_1", "col_2"))

  # Create a `cells_grand_summary` object with
  # columns in `vars()` provided to `columns`
  helper_cells_grand_summary <-
    cells_grand_summary(
      columns = vars(col_1, col_2)
    )

  # Expect the RHS of the first component formula to contain
  # the vector provided
  helper_cells_grand_summary[[1]] %>%
    rlang::eval_tidy() %>%
    vapply(rlang::as_name, USE.NAMES = FALSE, character(1)) %>%
    expect_equal(c("col_1", "col_2"))
})

test_that("the `cells_stubhead()` function works correctly", {

  # Create a `cells_stubhead` object
  helper_cells_stubhead <- cells_stubhead()

  # Expect this has the `cells_stubhead` and `location_cells` classes
  helper_cells_stubhead %>%
    expect_is(c("cells_stubhead", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_stubhead %>%
    length() %>%
    expect_equal(1)

  # Expect that the object has the single name `groups`
  helper_cells_stubhead %>%
    names() %>%
    expect_equal("groups")

  # Expect the first list component to have the `character`
  helper_cells_stubhead[[1]] %>% expect_is("character")

  # Expect a specific value for the single list component
  helper_cells_stubhead[[1]] %>%
    expect_equal("stubhead")
})
