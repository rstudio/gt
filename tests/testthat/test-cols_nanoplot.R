test_that("multiplication works", {
  skip_on_cran()
  # options("lifecycle_verbosity" = "error")
  dat <- dplyr::slice_head(sp500, n = 100)
  tbl_gt <- gt(dat)
  expect_no_error(
    cols_nanoplot(tbl_gt, columns = open:close)
  )
  expect_no_error(
    cols_nanoplot(tbl_gt, columns = open:close, autohide = TRUE)
  )
})
