test_that("the `sub_missing()` function works correctly", {

  # Create an input data frame with two columns, both numeric
  data_tbl <-
    data.frame(
      num_1 = c(NA, 74, NA, 93, NA, 76, NA),
      num_2 = c(34, 74, 23, 93, 35, 76, 57),
      stringsAsFactors = FALSE
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data_tbl)

  # Expect that the object has the correct classes
  expect_is(tab, c("gt_tbl", "data.frame"))

  # Extract vectors from the table object for comparison
  # to the original dataset
  num_1 <- (tab %>% dt_data_get())[["num_1"]]
  num_2 <- (tab %>% dt_data_get())[["num_2"]]

  # Expect the extracted values to match those of the
  # original dataset
  expect_equal(data_tbl$num_1, num_1)
  expect_equal(data_tbl$num_2, num_2)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(tab %>% sub_missing(columns = "num_3"))

  #
  # Format `date` in various date formats and verify the output
  #

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1") %>%
       render_formats_test(context = "default"))[["num_1"]],
    c("---", "74", "---", "93", "---", "76", "---")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("&mdash;", "74", "&mdash;", "93", "&mdash;", "76", "&mdash;")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", missing_text = "--") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("&ndash;", "74", "&ndash;", "93", "&ndash;", "76", "&ndash;")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", missing_text = "--") %>%
       render_formats_test(context = "default"))[["num_1"]],
    c("--", "74", "--", "93", "--", "76", "--")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", missing_text = "a") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("a", "74", "a", "93", "a", "76", "a")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_2") %>%
       render_formats_test(context = "default"))[["num_2"]],
    c("34", "74", "23", "93", "35", "76", "57")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", rows = num_2 < 50) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("&mdash;", "74", "&mdash;", "93", "&mdash;", "76", "NA")
  )

  # Format columns with `fmt_number()` then use
  # `sub_missing()` on all columns (the two functions
  # shouldn't wipe out formatting on cells)
  expect_equal(
    (tab %>%
       fmt_number(
         columns = everything(),
         decimals = 3
       ) %>%
       sub_missing(columns = everything()) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("&mdash;", "74.000", "&mdash;", "93.000", "&mdash;", "76.000", "&mdash;")
  )

  # Reverse the ordering: use `sub_missing()` first
  # then `fmt_number()`; expect the same output as before
  expect_equal(
    (tab %>%
       sub_missing(columns = everything()) %>%
       fmt_number(
         columns = everything(),
         decimals = 3
       ) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("&mdash;", "74.000", "&mdash;", "93.000", "&mdash;", "76.000", "&mdash;")
  )
})
