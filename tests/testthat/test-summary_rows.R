context("Ensuring that the `summary_rows()` function works as expected")

# Create a table with group names, rownames, and two columns of values
tbl <-
  dplyr::tribble(
    ~groupname, ~rowname, ~value_1, ~value_2,
    "A",        "1",      NA,       260.1,
    "A",        "2",      184.3,    84.4,
    "A",        "3",      342.3,    126.3,
    "A",        "4",      234.9,    NA,
    "B",        "1",      190.9,    832.5,
    "B",        "2",      743.3,    281.2,
    "B",        "3",      252.3,    732.5,
    "B",        "4",      344.7,    NA,
    "C",        "1",      197.2,    818.0,
    "C",        "2",      284.3,    394.4)

test_that("the `summary_rows()` function works correctly", {

  # Create a table with summary rows for the `A` and `C` groups;
  # the 3 summary rows for these groups represent the mean, sum,
  # and standard deviation of `value`
  gt_tbl <-
    gt(tbl) %>%
    summary_rows(
      groups = c("A", "C"),
      columns = vars(value_1),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)))

  # Extract the internal `summary` object
  summary <- attr(gt_tbl, "summary", exact = TRUE)

  # Expect that the internal `summary` list object has
  # a length of `1` since there was only one call of `summary_rows()`
  length(summary) %>%
    expect_equal(1)

  # For the single list component in `summary`, expect specific
  # names within it
  summary[[1]] %>%
    names() %>%
    expect_equal(
      c("groups", "columns", "fns", "missing_text",
        "formatter", "formatter_options"))

  # Expect the `groups` provided in `summary[[1]]$groups`
  summary[[1]]$groups %>%
    expect_equal(c("A", "C"))

  # Expect the `columns` provided in `summary[[1]]$columns`
  summary[[1]]$columns %>%
    expect_equal("value_1")

  # Expect that `summary[[1]]$fns` is a `fun_list` object
  summary[[1]]$fns %>%
    expect_is("list")

  # Expect that the components of `summary[[1]]$fns` are quosures
  summary[[1]]$fns$average %>% expect_is("formula")
  summary[[1]]$fns$total %>% expect_is("formula")
  summary[[1]]$fns$`std dev` %>% expect_is("formula")

  # Expect that `summary[[1]]$missing_text` has a specific value
  summary[[1]]$missing_text %>%
    expect_equal("---")

  # Expect that `summary[[1]]$formatter` is a `function` object
  summary[[1]]$formatter %>%
    expect_is("function")

  # Expect that `summary[[1]]$formatter_options` is a list
  summary[[1]]$formatter_options %>%
    expect_is("list")

  # Create a table with summary rows for all groups and for `value_1`;
  # the 3 summary rows for these groups represent the mean, sum,
  # and the standard deviation
  gt_tbl <-
    gt(tbl) %>%
    summary_rows(
      columns = vars(value_1),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)))

  # Extract the internal `summary` object
  summary <- attr(gt_tbl, "summary", exact = TRUE)

  # Expect that the internal `summary` list object has
  # a length of `1` since there was only one call of `summary_rows()`
  length(summary) %>%
    expect_equal(1)

  # For the single list component in `summary`, expect specific
  # names within it
  summary[[1]] %>%
    names() %>%
    expect_equal(
      c("groups", "columns", "fns", "missing_text",
        "formatter", "formatter_options"))

  # Expect that `summary[[1]]$groups` is TRUE
  summary[[1]]$groups %>%
    expect_true()

  # Expect that `summary[[1]]$columns` is `value_1`
  summary[[1]]$columns %>%
    expect_equal("value_1")

  # Expect that `summary[[1]]$fns` is a `fun_list` object
  summary[[1]]$fns %>%
    expect_is("list")

  # Expect that the components of `summary[[1]]$fns` are quosures
  summary[[1]]$fns$average %>% expect_is("formula")
  summary[[1]]$fns$total %>% expect_is("formula")
  summary[[1]]$fns$`std dev` %>% expect_is("formula")

  # Expect that `summary[[1]]$missing_text` has a specific value
  summary[[1]]$missing_text %>%
    expect_equal("---")

  # Expect that `summary[[1]]$formatter` is a `function` object
  summary[[1]]$formatter %>%
    expect_is("function")

  # Expect that `summary[[1]]$formatter_options` is a list
  summary[[1]]$formatter_options %>%
    expect_is("list")

  # Create a table with two sets of summary rows for all groups
  # and all columns
  gt_tbl <-
    gt(tbl) %>%
    summary_rows(
      columns = vars(value_1, value_2),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE))) %>%
    summary_rows(
      columns = vars(value_1, value_2),
      fns = list(
        max = ~max(., na.rm = TRUE)))

  # Extract the internal `summary` object
  summary <- attr(gt_tbl, "summary", exact = TRUE)

  # Expect that the internal `summary` list object has
  # a length of `2 since there are two calls of `summary_rows()`
  length(summary) %>%
    expect_equal(2)

  # For the two list components in `summary`, expect specific
  # names within them
  summary[[1]] %>%
    names() %>%
    expect_equal(
      c("groups", "columns", "fns", "missing_text",
        "formatter", "formatter_options"))

  summary[[2]] %>%
    names() %>%
    expect_equal(
      c("groups", "columns", "fns", "missing_text",
        "formatter", "formatter_options"))

  # Expect that `summary[[1|2]]$groups` is TRUE
  summary[[1]]$groups %>%
    expect_true()

  summary[[2]]$groups %>%
    expect_true()

  # Expect that `summary[[1|2]]$columns` has specific values
  summary[[1]]$columns %>%
    expect_equal(c("value_1", "value_2"))

  summary[[2]]$columns %>%
    expect_equal(c("value_1", "value_2"))

  # Expect that `summary[[1|2]]$fns` is a `fun_list` object
  summary[[1]]$fns %>%
    expect_is("list")

  summary[[2]]$fns %>%
    expect_is("list")

  # Expect that the components of `summary[[1|2]]$fns` are quosures
  summary[[1]]$fns$average %>% expect_is("formula")
  summary[[1]]$fns$total %>% expect_is("formula")
  summary[[1]]$fns$`std dev` %>% expect_is("formula")
  summary[[2]]$fns$max %>% expect_is("formula")

  # Expect that `summary[[1|2]]$missing_text` has a specific value
  summary[[1]]$missing_text %>%
    expect_equal("---")

  summary[[2]]$missing_text %>%
    expect_equal("---")

  # Expect that `summary[[1|2]]$formatter` is a `function` object
  summary[[1]]$formatter %>%
    expect_is("function")

  summary[[2]]$formatter %>%
    expect_is("function")

  # Expect that `summary[[1|2]]$formatter_options` is a list
  summary[[1]]$formatter_options %>%
    expect_is("list")

  summary[[2]]$formatter_options %>%
    expect_is("list")

  # Create a table with summary rows for the `A` and `C` groups;
  # the 3 summary rows for these groups represent the mean, sum,
  # and standard deviation of `value`
  gt_tbl <-
    gt(tbl) %>%
    summary_rows(
      groups = c("A", "C"),
      columns = vars(value_1),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)))

  # Extract the summary data from `gt_tbl`
  summaries <- extract_summary(gt_tbl)

  # Expect that `summaries` is a list object
  summaries %>% expect_is("list")

  # Expect that `summaries` has a length of `2`
  summaries %>%
    length() %>%
    expect_equal(2)

  # Expect that `summaries` the names `A` and `C`
  summaries %>%
    names() %>%
    expect_equal(c("A", "C"))

  # Expect that each of the components contains a `tibble`
  summaries[[1]] %>%
    expect_is(c("tbl_df", "tbl", "data.frame"))

  summaries[[2]] %>%
    expect_is(c("tbl_df", "tbl", "data.frame"))

  # Expect an error in the case where `extract_summary()`
  # is called on a gt table object where there is no summary
  expect_error(
    gt(mtcars) %>%
      extract_summary())
})
