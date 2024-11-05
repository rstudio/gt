test_that("random_id() does not affect random seed", {

  withr::with_seed(123, {
    r1 <- runif(1)
  })

  withr::with_seed(123, {
    id <- random_id()
    r2 <- runif(1)
  })

  expect_equal(r1, r2)

})
