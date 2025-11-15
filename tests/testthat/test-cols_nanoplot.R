test_that("cols_nanoplot() works without error ", {

  skip_on_cran()

  tbl_gt <- gt(dplyr::slice_head(sp500, n = 100))

  expect_no_condition(
    cols_nanoplot(tbl_gt, columns = open:close)
  )

  expect_no_condition(
    cols_nanoplot(tbl_gt, columns = open:close, autohide = TRUE)
  )

  expect_no_warning({
    pizzaplace |>
    dplyr::count(date, type, name = "sold") |>
    tidyr::pivot_wider(names_from = type, values_from = sold) |>
    dplyr::slice_head(n = 10) |>
    gt(rowname_col = "date") |>
    cols_nanoplot(
      columns = c(chicken, classic, supreme, veggie),
      plot_type = "bar",
      autohide = FALSE,
      new_col_name = "pizzas_sold",
      new_col_label = "Sales by Type",
      options = nanoplot_options(
        show_data_line = FALSE,
        show_data_area = FALSE,
        data_bar_stroke_color = "transparent",
        data_bar_fill_color = c("brown", "gold", "purple", "green")
      )
    ) |>
      # make sure the formatter works
      fmt_number()
  })
})

test_that("check cols_nanoplot is applied to gt_group objects", {

  # Create a `gt_group` object of two `gt_tbl`s
  # create gt group example
  gt_tbl <- gt(mtcars_short)
  gt_group <- gt_group(gt_tbl, gt_tbl)

  # apply nanoplot to table and group
  nano_gt_tbl <-
    gt_tbl |>
    cols_nanoplot(
      columns = mpg,
      plot_type = "bar",
      autohide = FALSE
    )

  nano_gt_group <-
    gt_group |>
    cols_nanoplot(
      columns = mpg,
      plot_type = "bar",
      autohide = FALSE
    )

  # Expect identical if function applied before or after group is constructed
  # expect_identical(nano_gt_group, gt_group(nano_gt_tbl, nano_gt_tbl))

  # Expect identical doesn't like the tidyselect, comparing nanoplots directly
  group_plot1 <- nano_gt_group$gt_tbls$gt_tbl[[1]]$`_data`$nanoplots
  group_plot2 <- nano_gt_group$gt_tbls$gt_tbl[[2]]$`_data`$nanoplots
  tbl_plot <- nano_gt_tbl$`_data`$nanoplots

  expect_identical(group_plot1, tbl_plot)
  expect_identical(group_plot2, tbl_plot)
})
