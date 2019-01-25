context("Ensuring that the `gtsave()` function works as expected")

test_that("the `gtsave()` function creates an HTML file based on the extension", {

  # Create a filename with path, having the
  # .html extension
  path_1 <- tempfile(fileext = ".html")
  on.exit(unlink(path_1))

  # Expect that a file does not yet exist
  # on that path
  expect_false(file.exists(path_1))

  # Save a gt table based on the exibble dataset
  # as an HTML file to the `path_1`
  exibble %>%
    gt() %>%
    gtsave(filename = path_1)

  # Expect that the file has been created
  # on that path
  expect_true(file.exists(path_1))

  # Expect that the content of the file is HTML
  (path_1 %>%
      readLines())[1] %>%
    expect_match(
      "<!DOCTYPE html>",
      fixed = TRUE)

  # Expect that CSS styles are not inlined
  (path_1 %>%
      readLines())[9] %>%
    expect_match(
      "<style>html {",
      fixed = TRUE)

  # Create a filename with path, having the
  # .htm extension
  path_2 <- tempfile(fileext = ".htm")
  on.exit(unlink(path_2))

  # Expect that a file does not yet exist
  # on that path
  expect_false(file.exists(path_2))

  # Save a gt table based on the exibble dataset
  # as an HTML file to the `path_2`
  exibble %>%
    gt() %>%
    gtsave(filename = path_2)

  # Expect that the file has been created
  # on that path
  expect_true(file.exists(path_2))

  # Expect that the content of the file is HTML
  (path_2 %>%
      readLines())[1] %>%
    expect_match(
      "<!DOCTYPE html>",
      fixed = TRUE)

  # Expect that CSS styles are not inlined
  (path_2 %>%
      readLines())[9] %>%
    expect_match(
      "<style>html {",
      fixed = TRUE)

  # Create a filename with path, having the
  # .html extension
  path_3 <- tempfile(fileext = ".html")
  on.exit(unlink(path_3))

  # Expect that a file does not yet exist
  # on that path
  expect_false(file.exists(path_3))

  # Save a gt table based on the exibble dataset
  # as an HTML file to the `path_3`; ensure
  # that the CSS styles are indeed inlined
  exibble %>%
    gt() %>%
    gtsave(filename = path_3, inline_css = TRUE)

  # Expect that the content of the file is HTML
  (path_3 %>%
      readLines())[1] %>%
    expect_match(
      "<!DOCTYPE html>",
      fixed = TRUE)

  # Expect that CSS styles are indeed inlined
  (path_3 %>%
      readLines())[10] %>%
    expect_match(
      "<table style.*")
})

test_that("the `gtsave()` function creates a LaTeX file based on the extension", {

  # Create a filename with path, having the
  # .html extension
  path_1 <- tempfile(fileext = ".tex")
  on.exit(unlink(path_1))

  # Expect that a file does not yet exist
  # on that path
  expect_false(file.exists(path_1))

  # Save a gt table based on the exibble dataset
  # as a LaTeX file to the `path_1`
  exibble %>%
    gt() %>%
    gtsave(filename = path_1)

  # Expect that the file has been created
  # on that path
  expect_true(file.exists(path_1))

  # Expect that the content of the file is LaTeX
  (path_1 %>%
      readLines())[1] %>%
    expect_match(
      "\\captionsetup[table]{labelformat=empty,skip=1pt}",
      fixed = TRUE)

  # Create a filename with path, having the
  # .ltx extension
  path_2 <- tempfile(fileext = ".ltx")
  on.exit(unlink(path_2))

  # Expect that a file does not yet exist
  # on that path
  expect_false(file.exists(path_2))

  # Save a gt table based on the exibble dataset
  # as a LaTeX file to the `path_2`
  exibble %>%
    gt() %>%
    gtsave(filename = path_2)

  # Expect that the file has been created
  # on that path
  expect_true(file.exists(path_2))

  # Expect that the content of the file is LaTeX
  (path_2 %>%
      readLines())[1] %>%
    expect_match(
      "\\captionsetup[table]{labelformat=empty,skip=1pt}",
      fixed = TRUE)
})


test_that("the `gtsave()` function stops in some cases", {

  # Expect an error if the file extension doesn't
  # correspond to a saving function
  expect_error(exibble %>% gt() %>% gtsave(filename = "exibble.bat"))

  # Expect an error if no file extension is provided
  expect_error(exibble %>% gt() %>% gtsave(filename = "exibble"))
})
