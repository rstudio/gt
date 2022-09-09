test_that("tab_caption", {
  # Normal setting of a caption can be extracted
  foo <- gt(mtcars, caption="A")
  expect_equal(dt_options_get_value(data = foo, option = "table_caption"), "A")
  # No caption results in NULL
  foo <- gt(mtcars)
  expect_null(dt_options_get_value(data = foo, option = "table_caption"))
  # Setting with tab_caption works
  foo <- tab_caption(gt(mtcars), "B")
  expect_equal(dt_options_get_value(data = foo, option = "table_caption"), "B")
  # You can get the caption back out
  expect_equal(tab_caption(foo), "B")
  # captions may be removed
  foo <- gt(mtcars, caption="A")
  expect_equal(tab_caption(foo), "A")
  expect_null(tab_caption(tab_caption(foo, caption = NULL)))
})
