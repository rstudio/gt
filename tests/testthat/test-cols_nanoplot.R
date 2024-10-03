test_that("cols_nanoplot() works without error ", {
  skip_on_cran()
  # options("lifecycle_verbosity" = "error")
  dat <- dplyr::slice_head(sp500, n = 100)
  tbl_gt <- gt(dat)
  expect_no_condition(
    cols_nanoplot(tbl_gt, columns = open:close)
  )
  expect_no_condition(
    cols_nanoplot(tbl_gt, columns = open:close, autohide = TRUE)
  )
  
  expect_no_warning({
    pizzaplace %>%
    dplyr::count(date, type, name = "sold") %>%
    tidyr::pivot_wider(names_from = type, values_from = sold) %>%
    dplyr::slice_head(n = 10) %>%
    gt(rowname_col = "date") %>%
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
    ) %>%
      # make sure the formatter works
      fmt_number()
  })
})
