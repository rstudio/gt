context("Ensuring that the `row_group_order()` function works as expected")

test_that("the `row_group_order()` function works correctly", {

  # Create a table with group names, rownames, and four columns of values
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

  # Create a `tbl_html` that arranges the groups by the
  # latter calendar date first
  html_tbl <-
    gt(tbl) %>%
    row_group_order(groups = c("2018-02-11", "2018-02-10"))

  # Expect that the internal vector `arrange_groups` has the
  # groups in the order specified
  attr(html_tbl, "arrange_groups", exact = TRUE)$groups %>%
    expect_equal(c("2018-02-11", "2018-02-10"))

  # Create a `tbl_html` that arranges the groups by the
  # latter calendar date first using group indices
  html_tbl <-
    gt(tbl) %>%
    row_group_order(groups = c(2, 1))

  # Expect that the internal vector `arrange_groups` has the
  # groups in the order specified
  attr(html_tbl, "arrange_groups", exact = TRUE)$groups %>%
    expect_equal(c("2018-02-11", "2018-02-10"))

  # Expect an error if input for `groups` is not a character or
  # numeric vector
  expect_error(
    gt(tbl) %>%
      row_group_order(groups = c(TRUE, FALSE)))

  # Expect that any value in `groups` that doesn't correspond
  # to a group name or valid index will result in an error
  expect_error(
    gt(tbl) %>%
      row_group_order(groups = c("2018-02-13", "2018-02-10")))

  expect_error(
    gt(tbl) %>%
      row_group_order(groups = c(3, 1)))
})
