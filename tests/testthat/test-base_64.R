test_that("the `get_file_ext()` function works correctly", {

  # Expect that filenames with various extensions are
  # work with `get_file_ext()` to return the file extension
  get_file_ext(file = "file.svg") %>% expect_equal("svg")
  get_file_ext(file = "file.001.svg") %>% expect_equal("svg")
  get_file_ext(file = "file.001..svg") %>% expect_equal("svg")
  get_file_ext(file = "_file.jpg") %>% expect_equal("jpg")
  get_file_ext(file = "file.png") %>% expect_equal("png")
  get_file_ext(file = "file.gif") %>% expect_equal("gif")
})


