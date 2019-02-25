context("Ensuring that the `summary_rows()` function works as expected")

# Create a table based on `sp500`, with
# group names, rownames, and four
# columns of values
tbl <-
  sp500 %>%
  dplyr::filter(
    date >= "2015-01-05" &
      date <="2015-01-16"
  ) %>%
  dplyr::arrange(date) %>%
  dplyr::mutate(
    week = paste0(
      "W", strftime(date, format = "%V"))
  ) %>%
  dplyr::select(-adj_close, -volume) %>%
  gt(
    rowname_col = "date",
    groupname_col = "week"
  )

test_that("the `summary_rows()` can make groupwise summaries", {

  # Create a table with summary rows for
  # the `W02` group; the 3 summary rows for
  # this group represent the mean, sum,
  # and standard deviation of all numeric
  # columns
  gt_tbl <-
    tbl %>%
    summary_rows(
      groups = "W02",
      columns = vars(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)))

  # Extract the internal `summary` object
  summary <- attr(gt_tbl, "summary", exact = TRUE)

  # Expect that the internal `summary` list
  # object has a length of `1` since there was
  # only one call of `summary_rows()`
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
    expect_equal("W02")

  # Expect the `columns` provided in `summary[[1]]$columns`
  summary[[1]]$columns %>%
    expect_equal(c("open", "high", "low", "close"))

  # Expect that `summary[[1]]$fns` is a `list` object
  summary[[1]]$fns %>%
    expect_is("list")

  # Expect that the components of `summary[[1]]$fns` are formulas
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

  # Expect that `summary[[1]]$formatter_options` is
  # of length 0
  summary[[1]]$formatter_options %>%
    length() %>%
    expect_equal(0)

  # Create a table with summary rows for
  # the `W02` group; the 3 summary rows for
  # this group represent the mean, sum,
  # and standard deviation of only the
  # `open` column
  gt_tbl <-
    tbl %>%
    summary_rows(
      groups = "W02",
      columns = vars(open),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)))

  # Extract the internal `summary` object
  summary <- attr(gt_tbl, "summary", exact = TRUE)

  # Expect the `groups` provided in `summary[[1]]$groups`
  summary[[1]]$groups %>%
    expect_equal("W02")

  # Expect the `columns` provided in `summary[[1]]$columns`
  summary[[1]]$columns %>%
    expect_equal("open")

  # Expect that `summary[[1]]$fns` is a `list` object
  summary[[1]]$fns %>%
    expect_is("list")

  # Expect that the components of `summary[[1]]$fns` are formulas
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

  # Expect that `summary[[1]]$formatter_options` is
  # of length 0
  summary[[1]]$formatter_options %>%
    length() %>%
    expect_equal(0)

  # Create a table with summary rows for
  # the `W02` and `W03` groups; the 3 summary
  # rows for these groups represent the mean,
  # sum, and standard deviation of only the
  # `open` column
  gt_tbl <-
    tbl %>%
    summary_rows(
      groups = c("W02", "W03"),
      columns = vars(open),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)))

  # Extract the internal `summary` object
  summary <- attr(gt_tbl, "summary", exact = TRUE)

  # Expect the `groups` provided in `summary[[1]]$groups`
  summary[[1]]$groups %>%
    expect_equal(c("W02", "W03"))

  # Expect the `columns` provided in `summary[[1]]$columns`
  summary[[1]]$columns %>%
    expect_equal("open")

  # Expect that `summary[[1]]$fns` is a `list` object
  summary[[1]]$fns %>%
    expect_is("list")

  # Expect that the components of `summary[[1]]$fns` are formulas
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

  # Expect that `summary[[1]]$formatter_options` is
  # of length 0
  summary[[1]]$formatter_options %>%
    length() %>%
    expect_equal(0)

  # Create a table with summary rows for
  # the `W02` and `W03` groups (using
  # `groups = TRUE`); the 3 summary rows for
  # these groups represent the mean,
  # sum, and standard deviation of only the
  # `open` column
  gt_tbl <-
    tbl %>%
    summary_rows(
      groups = TRUE,
      columns = vars(open),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)))

  # Extract the internal `summary` object
  summary <- attr(gt_tbl, "summary", exact = TRUE)

  # Expect the `groups` provided in `summary[[1]]$groups`
  # to be `TRUE`
  summary[[1]]$groups %>%
    expect_true()

  # Expect the `columns` provided in `summary[[1]]$columns`
  summary[[1]]$columns %>%
    expect_equal("open")

  # Expect that `summary[[1]]$fns` is a `list` object
  summary[[1]]$fns %>%
    expect_is("list")

  # Expect that the components of `summary[[1]]$fns` are formulas
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

  # Expect that `summary[[1]]$formatter_options` is
  # of length 0
  summary[[1]]$formatter_options %>%
    length() %>%
    expect_equal(0)

  # Create a table with two sets of summary rows for all groups
  # and all columns
  gt_tbl <-
    tbl %>%
    summary_rows(
      groups = TRUE,
      columns = vars(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      )
    ) %>%
    summary_rows(
      groups = TRUE,
      columns = vars(open, high, low, close),
      fns = list(
        max = ~max(., na.rm = TRUE)
      )
    )

  # Extract the internal `summary` object
  summary <- attr(gt_tbl, "summary", exact = TRUE)

  # Expect that the internal `summary` list
  # object has a length of `2` since there
  # were two calls of `summary_rows()`
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
    expect_equal(c("open", "high", "low", "close"))

  summary[[2]]$columns %>%
    expect_equal(c("open", "high", "low", "close"))

  # Expect that `summary[[1|2]]$fns` is a `list` object
  summary[[1]]$fns %>%
    expect_is("list")

  summary[[2]]$fns %>%
    expect_is("list")

  # Expect that the components of `summary[[1|2]]$fns` are formulas
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

  # Expect that `summary[[1|2]]$formatter_options` are both
  # of length 0
  summary[[1]]$formatter_options %>%
    length() %>%
    expect_equal(0)

  summary[[2]]$formatter_options %>%
    length() %>%
    expect_equal(0)

  # Create a table with two sets of summary rows for all groups
  # and all columns
  gt_tbl <-
    tbl %>%
    summary_rows(
      groups = TRUE,
      columns = vars(open, high),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      )
    ) %>%
    summary_rows(
      groups = TRUE,
      columns = vars(low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      )
    )

  # Extract the internal `summary` object
  summary <- attr(gt_tbl, "summary", exact = TRUE)

  # Expect that the internal `summary` list
  # object has a length of `2` since there
  # were two calls of `summary_rows()`
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
    expect_equal(c("open", "high"))

  summary[[2]]$columns %>%
    expect_equal(c("low", "close"))

  # Expect that `summary[[1|2]]$fns` is a `list` object
  summary[[1]]$fns %>%
    expect_is("list")

  summary[[2]]$fns %>%
    expect_is("list")

  # Expect that the components of `summary[[1|2]]$fns` are formulas
  summary[[1]]$fns$average %>% expect_is("formula")
  summary[[1]]$fns$total %>% expect_is("formula")
  summary[[1]]$fns$`std dev` %>% expect_is("formula")
  summary[[2]]$fns$average %>% expect_is("formula")
  summary[[2]]$fns$total %>% expect_is("formula")
  summary[[2]]$fns$`std dev` %>% expect_is("formula")

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

  # Expect that `summary[[1|2]]$formatter_options` are both
  # of length 0
  summary[[1]]$formatter_options %>%
    length() %>%
    expect_equal(0)

  summary[[2]]$formatter_options %>%
    length() %>%
    expect_equal(0)
})

test_that("the `summary_rows()` can make grand summaries", {

  # Create a table with a grand summary;
  # the 3 summary rows for represent the
  # mean, sum, and standard deviation of
  # all numeric columns
  gt_tbl <-
    tbl %>%
    summary_rows(
      groups = NULL,
      columns = vars(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)))

  # Extract the internal `summary` object
  summary <- attr(gt_tbl, "summary", exact = TRUE)

  # Expect that the internal `summary` list
  # object has a length of `1` since there was
  # only one call of `summary_rows()`
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
  # is NULL
  summary[[1]]$groups %>%
    expect_null()

  # Expect the `columns` provided in `summary[[1]]$columns`
  # provide names for all columns
  summary[[1]]$columns %>%
    expect_equal(c("open", "high", "low", "close"))

  # Expect that `summary[[1]]$fns` is a `list` object
  summary[[1]]$fns %>%
    expect_is("list")

  # Expect that the components of `summary[[1]]$fns` are formulas
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

  # Create a table with a grand summary;
  # the 3 summary rows for represent the
  # mean, sum, and standard deviation of
  # all numeric columns; split into 2 calls
  # that allow for different formatting
  # options
  gt_tbl <-
    tbl %>%
    summary_rows(
      groups = NULL,
      columns = vars(open, high),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)),
      formatter = fmt_number,
      decimals = 3) %>%
    summary_rows(
      groups = NULL,
      columns = vars(low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)),
      formatter = fmt_number,
      decimals = 5)

  # Extract the internal `summary` object
  summary <- attr(gt_tbl, "summary", exact = TRUE)

  # Expect that the internal `summary` list
  # object has a length of `2` since there
  # were two calls of `summary_rows()`
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
    expect_null()

  summary[[2]]$groups %>%
    expect_null()

  # Expect that `summary[[1|2]]$columns` has specific values
  summary[[1]]$columns %>%
    expect_equal(c("open", "high"))

  summary[[2]]$columns %>%
    expect_equal(c("low", "close"))

  # Expect that `summary[[1|2]]$fns` is a `list` object
  summary[[1]]$fns %>%
    expect_is("list")

  summary[[2]]$fns %>%
    expect_is("list")

  # Expect that the functions used in each call
  # are the same
  expect_identical(summary[[1]]$fns, summary[[1]]$fns)

  # Expect that the components of `summary[[1|2]]$fns` are formulas
  summary[[1]]$fns$average %>% expect_is("formula")
  summary[[1]]$fns$total %>% expect_is("formula")
  summary[[1]]$fns$`std dev` %>% expect_is("formula")
  summary[[2]]$fns$average %>% expect_is("formula")
  summary[[2]]$fns$total %>% expect_is("formula")
  summary[[2]]$fns$`std dev` %>% expect_is("formula")

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

  # Expect that the formatters used in each call
  # are the same
  expect_identical(summary[[1]]$formatter, summary[[2]]$formatter)

  # Expect that `summary[[1|2]]$formatter_options` is a list
  summary[[1]]$formatter_options %>%
    expect_is("list")

  summary[[2]]$formatter_options %>%
    expect_is("list")

  # Expect that `summary[[1|2]]$formatter_options` are both
  # of length 1
  summary[[1]]$formatter_options %>%
    length() %>%
    expect_equal(1)

  summary[[2]]$formatter_options %>%
    length() %>%
    expect_equal(1)

  # Expect that `summary[[1|2]]$formatter_options`
  # are both named `decimals`
  summary[[1]]$formatter_options %>%
    names() %>%
    expect_equal("decimals")

  summary[[2]]$formatter_options %>%
    names() %>%
    expect_equal("decimals")

  # Expect that the `summary[[1|2]]$formatter_options`
  # `decimals` options have specific values
  summary[[1]]$formatter_options[[1]] %>%
    expect_equal(3)

  summary[[2]]$formatter_options[[1]] %>%
    expect_equal(5)

  # Create a table with groupwsie summaries
  # and a grand summary; all summary rows
  # represent the mean, sum, and standard
  # deviation of all numeric columns;
  gt_tbl <-
    tbl %>%
    summary_rows(
      groups = TRUE,
      columns = vars(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE))
    ) %>%
    summary_rows(
      groups = NULL,
      columns = vars(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE))
    )

  # Extract the internal `summary` object
  summary <- attr(gt_tbl, "summary", exact = TRUE)

  # Expect that the internal `summary` list
  # object has a length of `2` since there
  # were two calls of `summary_rows()`
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

  # Expect that `summary[[1]]$groups` is TRUE
  summary[[1]]$groups %>%
    expect_true()

  # Expect that `summary[[1]]$groups` is NULL
  summary[[2]]$groups %>%
    expect_null()

  # Expect that `summary[[1|2]]$columns` has specific values
  summary[[1]]$columns %>%
    expect_equal(c("open", "high", "low", "close"))

  summary[[2]]$columns %>%
    expect_equal(c("open", "high", "low", "close"))

  # Expect that `summary[[1|2]]$fns` is a `list` object
  summary[[1]]$fns %>%
    expect_is("list")

  summary[[2]]$fns %>%
    expect_is("list")

  # Expect that the functions used in each call
  # are the same
  expect_identical(summary[[1]]$fns, summary[[1]]$fns)

  # Expect that the components of `summary[[1|2]]$fns` are formulas
  summary[[1]]$fns$average %>% expect_is("formula")
  summary[[1]]$fns$total %>% expect_is("formula")
  summary[[1]]$fns$`std dev` %>% expect_is("formula")
  summary[[2]]$fns$average %>% expect_is("formula")
  summary[[2]]$fns$total %>% expect_is("formula")
  summary[[2]]$fns$`std dev` %>% expect_is("formula")

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

  # Expect that the formatters used in each call
  # are the same
  expect_identical(summary[[1]]$formatter, summary[[2]]$formatter)

  # Expect that `summary[[1|2]]$formatter_options` is a list
  summary[[1]]$formatter_options %>%
    expect_is("list")

  summary[[2]]$formatter_options %>%
    expect_is("list")

  # Expect that `summary[[1|2]]$formatter_options` are both
  # of length 0
  summary[[1]]$formatter_options %>%
    length() %>%
    expect_equal(0)

  summary[[2]]$formatter_options %>%
    length() %>%
    expect_equal(0)
})
