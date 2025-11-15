test_that("gt_preview() works correctly", {

  # Ensure that gt objects still work with `gt_preview()`
  expect_s3_class(
    gt_preview(mtcars),
    gt_preview(mtcars |> gt()) |> class(),
    exact = TRUE
  )

  # Create a basic preview of the `mtcars` dataset
  gt_tbl <- gt_preview(mtcars)

  built_tbl <-  build_data(gt_tbl, context = "html")
  output_tbl <- dt_body_get(built_tbl)

  # Expect that the output table has had rows removed
  nrow(mtcars) |> expect_gt(nrow(output_tbl))

  # Expect certain row names in `data_df`
  expect_equal(output_tbl$rowname, c("1", "2", "3", "4", "5", "6..31", "32"))

  # Expect mostly empty strings in the ellipsis row
  # (row `6` in this case)
  output_tbl[6, ] |>
    unlist() |>
    unname() |>
    expect_equal(c("6..31", rep("", ncol(mtcars))))

  # Create a preview table with non-default `top_n` and `bottom_n` values
  gt_tbl <- gt_preview(mtcars, top_n = 10, bottom_n = 5)

  built_tbl <- gt_tbl |> build_data(context = "html")
  output_tbl <- dt_body_get(data = built_tbl)

  # Expect a preview of the `mtcars` dataset with different `top_n`
  # and `bottom_n` values will result in a different row names
  expect_equal(
    output_tbl$rowname,
    c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
      "11..27", "28", "29", "30", "31", "32")
  )

  # Expect empty strings in the ellipsis row (row `11` in this case)
  output_tbl[11, ] |>
    unlist() |>
    unname() |>
    expect_equal(c("11..27", rep("", ncol(mtcars))))

  # Create a preview table with a 5-row version of `mtcars`
  gt_tbl <- gt_preview(mtcars[1:5, ])

  built_tbl <- build_data(gt_tbl, context = "html")
  output_tbl <- dt_body_get(built_tbl)

  # Expect a preview of this shortened `mtcars` dataset won't
  # have an ellipsis row
  expect_equal(output_tbl$rowname, c("1", "2", "3", "4", "5"))

  # Expect no empty strings along the `mpg` column
  expect_equal(output_tbl$mpg, c("21.0", "21.0", "22.8", "21.4", "18.7"))

  # Create a table that has `groupname` and `rowname` columns
  tbl <-
    dplyr::tribble(
      ~groupname, ~rowname, ~value,  ~value_2,
      "A",        "2",      184.3,   84.4,
      "A",        "3",      342.3,   126.3,
      "B",        "1",      190.9,   832.5,
      "B",        "2",      743.3,   281.2)

  # Create a preview table with the `tbl` table
  gt_tbl <- gt_preview(tbl)

  built_tbl <- build_data(gt_tbl, context = "html")
  output_tbl <- dt_body_get(built_tbl)

  # Expect that columns named `rowname` or `groupname` will
  # gain a leading `.` to demote them from acting as magic columns
  expect_named(
    output_tbl,
    c("rowname", ".groupname", ".rowname", "value", "value_2")
  )

  # Create a preview table that doesn't include row numbers
  gt_tbl <- gt_preview(mtcars, incl_rownums = FALSE)

  built_tbl <- gt_tbl |> build_data(context = "html")
  output_tbl <- dt_body_get(data = built_tbl)

  # Expect the column names to be equal to that of the
  # input data table
  expect_equal(
    colnames(output_tbl),
    colnames(mtcars)
  )

  # Expect no errors when using all gt datasets (plus a few more
  # from the datasets package) with the `gt_preview()` function
  expect_no_error(gt_preview(countrypops))
  expect_no_error(gt_preview(sza))
  expect_no_error(gt_preview(gtcars))
  expect_no_error(gt_preview(sp500))
  expect_no_error(gt_preview(pizzaplace))
  expect_no_error(gt_preview(exibble))
  expect_no_error(gt_preview(towny))
  expect_no_error(gt_preview(peeps))
  expect_no_error(gt_preview(films))
  expect_no_error(gt_preview(metro))
  expect_no_error(gt_preview(gibraltar))
  expect_no_error(gt_preview(constants))
  expect_no_error(gt_preview(illness))
  expect_no_error(gt_preview(reactions))
  expect_no_error(gt_preview(photolysis))
  expect_no_error(gt_preview(nuclides))
  expect_no_error(gt_preview(rx_adsl))
  expect_no_error(gt_preview(rx_addv))

  expect_no_error(gt_preview(datasets::airquality))
  expect_no_error(gt_preview(datasets::cars))
  expect_no_error(gt_preview(datasets::chickwts))
  expect_no_error(gt_preview(datasets::faithful))
  expect_no_error(gt_preview(datasets::iris))
  expect_no_error(gt_preview(datasets::LifeCycleSavings))
  expect_no_error(gt_preview(datasets::longley))
  expect_no_error(gt_preview(datasets::morley))
  expect_no_error(gt_preview(datasets::mtcars))
  expect_no_error(gt_preview(datasets::Orange))
  expect_no_error(gt_preview(datasets::pressure))
  expect_no_error(gt_preview(datasets::quakes))
  expect_no_error(gt_preview(datasets::rock))
  expect_no_error(gt_preview(datasets::sleep))
  expect_no_error(gt_preview(datasets::swiss))
  expect_no_error(gt_preview(datasets::USJudgeRatings))
})
