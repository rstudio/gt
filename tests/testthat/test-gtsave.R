test_that("The `gtsave()` function creates an HTML file based on the extension", {

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
      readLines()) %>% paste(collapse = "\n") %>%
    tidy_grepl("<!DOCTYPE html>") %>%
    expect_true()

  # Expect that CSS styles are not inlined
  (path_1 %>%
      readLines()) %>% paste(collapse = "\n") %>%
    tidy_grepl("<style>#[a-z]{10} table \\{") %>%
    expect_true()

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
      readLines()) %>% paste(collapse = "\n") %>%
    tidy_grepl("<!DOCTYPE html>") %>%
    expect_true()

  # Expect that CSS styles are not inlined
  (path_2 %>%
      readLines()) %>% paste(collapse = "\n") %>%
    tidy_grepl("<style>#[a-z]{10} table \\{") %>%
    expect_true()

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
      readLines()) %>% paste(collapse = "\n") %>%
    tidy_grepl("<!DOCTYPE html>") %>%
    expect_true()

  # Expect that CSS styles are inlined
  (path_3 %>%
      readLines()) %>% paste(collapse = "\n") %>%
    tidy_grepl("style=\"-webkit-font-smoothing: antialiased;") %>%
    expect_true()

  # Create a filename with path, having the
  # .html extension
  path_4 <- tempfile(fileext = ".html")
  on.exit(unlink(path_4))

  # Expect that a file does not yet exist
  # on that path
  expect_false(file.exists(path_4))

  # Save a gt table based on the exibble dataset
  # as an HTML file to the `path_4`; use the
  # basename and dirname with `gtsave()`
  exibble %>%
    gt() %>%
    gtsave(
      filename = basename(path_4),
      path = dirname(path_4),
      inline_css = TRUE
    )

  # Expect that the content of the file is HTML
  (path_4 %>%
      readLines()) %>% paste(collapse = "\n") %>%
    tidy_grepl("<!DOCTYPE html>") %>%
    expect_true()

  # Expect that CSS styles are inlined
  (path_4 %>%
      readLines()) %>% paste(collapse = "\n") %>%
    tidy_grepl("style=\"-webkit-font-smoothing: antialiased;") %>%
    expect_true()
})

test_that("HTML saving with `gtsave()` is successful with different path defs", {

  skip_on_ci()
  skip_on_covr()

  #
  # [#1] Relative filename, default path
  #

  # Form final path, check for non-existence
  path_1 <- tempfile(fileext = ".html")
  on.exit(unlink(path_1))
  expect_false(file.exists(path_1))

  # Get initial working directory
  wd_i <- getwd()

  # Split path and get total number of path components
  split_path <- fs::path_split(path_1) %>% unlist()
  path_n <- length(split_path)

  # Set working directory
  setwd(file.path(paste0("/", paste(split_path[2:3], collapse = "/"))))

  # Write the file
  exibble %>%
    gt() %>%
    gtsave(filename = file.path(paste(split_path[4:path_n], collapse = "/")))

  # Check for existence
  expect_true(file.exists(path_1))
  expect_true(
    path_1 %>% readLines() %>% paste(collapse = "\n") %>%
      tidy_grepl("<!DOCTYPE html>")
  )

  # Reset to initial working directory
  setwd(wd_i)

  #
  # [#2] Relative filename, relative path
  #

  # Form final path, check for non-existence
  path_2 <- tempfile(fileext = ".html")
  on.exit(unlink(path_2))
  expect_false(file.exists(path_2))

  # Get initial working directory
  wd_i <- getwd()

  # Split path and get total number of path components
  split_path <- fs::path_split(path_2) %>% unlist()
  path_n <- length(split_path)

  # Set working directory
  setwd(file.path(paste0("/", paste(split_path[2:3], collapse = "/"))))

  # Write the file
  exibble %>%
    gt() %>%
    gtsave(
      filename = file.path(paste(split_path[7:path_n], collapse = "/")),
      path =  file.path(paste(split_path[4:6], collapse = "/"))
    )

  # Check for existence
  expect_true(file.exists(path_2))
  expect_true(
    path_2 %>% readLines() %>% paste(collapse = "\n") %>%
      tidy_grepl("<!DOCTYPE html>")
  )

  # Reset to initial working directory
  setwd(wd_i)

  # [#3] Absolute filename, absolute path (expect that `path` is ignored)

  # Form final path, check for non-existence
  path_3 <- tempfile(fileext = ".html")
  on.exit(unlink(path_3))
  expect_false(file.exists(path_3))

  # Write the file
  exibble %>%
    gt() %>%
    gtsave(
      filename = path_3,
      path = "/this/path/is/not/real"
    )

  # Check for existence
  expect_true(file.exists(path_3))
  expect_true(
    path_3 %>% readLines() %>% paste(collapse = "\n") %>%
      tidy_grepl("<!DOCTYPE html>")
  )

  # [#4] Filename starting with ~/, absolute path (expect that path is ignored)

  # Form final path, check for non-existence
  path_4 <- tempfile(tmpdir = "~", fileext = ".html")
  on.exit(unlink(path_4))
  expect_false(file.exists(path_4))

  # Write the file
  exibble %>%
    gt() %>%
    gtsave(
      filename = path_4,
      path = "/this/path/is/not/real"
    )

  # Check for existence
  expect_true(file.exists(path_4))
  expect_true(
    path_4 %>% readLines() %>% paste(collapse = "\n") %>%
      tidy_grepl("<!DOCTYPE html>")
  )

  # [#5] Using ~

  # Form final path, check for non-existence
  path_5 <- tempfile(tmpdir = "~", fileext = ".html")
  on.exit(unlink(path_5))
  expect_false(file.exists(path_5))

  # Write the file
  exibble %>%
    gt() %>%
    gtsave(
      filename = basename(path_5),
      path = "~"
    )

  # Check for existence
  expect_true(file.exists(path_5))
  expect_true(
    path_5 %>% readLines() %>% paste(collapse = "\n") %>%
      tidy_grepl("<!DOCTYPE html>")
  )
})

test_that("HTML saving with `gt_save_html()` with different path defs works", {

  skip_on_ci()
  skip_on_covr()

  #
  # [#1] Relative filename, default path
  #

  # Form final path, check for non-existence
  path_1 <- tempfile(fileext = ".html")
  on.exit(unlink(path_1))
  expect_false(file.exists(path_1))

  # Get initial working directory
  wd_i <- getwd()

  # Split path and get total number of path components
  split_path <- fs::path_split(path_1) %>% unlist()
  path_n <- length(split_path)

  # Set working directory
  setwd(file.path(paste0("/", paste(split_path[2:3], collapse = "/"))))

  # Write the file
  exibble %>%
    gt() %>%
    gt_save_html(filename = file.path(paste(split_path[4:path_n], collapse = "/")))

  # Check for existence
  expect_true(file.exists(path_1))
  expect_true(
    path_1 %>% readLines() %>% paste(collapse = "\n") %>%
      tidy_grepl("<!DOCTYPE html>")
  )

  # Reset to initial working directory
  setwd(wd_i)

  #
  # [#2] Relative filename, relative path
  #

  # Form final path, check for non-existence
  path_2 <- tempfile(fileext = ".html")
  on.exit(unlink(path_2))
  expect_false(file.exists(path_2))

  # Get initial working directory
  wd_i <- getwd()

  # Split path and get total number of path components
  split_path <- fs::path_split(path_2) %>% unlist()
  path_n <- length(split_path)

  # Set working directory
  setwd(file.path(paste0("/", paste(split_path[2:3], collapse = "/"))))

  # Write the file
  exibble %>%
    gt() %>%
    gt_save_html(
      filename = file.path(paste(split_path[7:path_n], collapse = "/")),
      path =  file.path(paste(split_path[4:6], collapse = "/"))
    )

  # Check for existence
  expect_true(file.exists(path_2))
  expect_true(
    path_2 %>% readLines() %>% paste(collapse = "\n") %>%
      tidy_grepl("<!DOCTYPE html>")
  )

  # Reset to initial working directory
  setwd(wd_i)

  # [#3] Absolute filename, absolute path (expect that `path` is ignored)

  # Form final path, check for non-existence
  path_3 <- tempfile(fileext = ".html")
  on.exit(unlink(path_3))
  expect_false(file.exists(path_3))

  # Write the file
  exibble %>%
    gt() %>%
    gt_save_html(
      filename = path_3,
      path = "/this/path/is/not/real"
    )

  # Check for existence
  expect_true(file.exists(path_3))
  expect_true(
    path_3 %>% readLines() %>% paste(collapse = "\n") %>%
      tidy_grepl("<!DOCTYPE html>")
  )

  # [#4] Filename starting with ~/, absolute path (expect that path is ignored)

  # Form final path, check for non-existence
  path_4 <- tempfile(tmpdir = "~", fileext = ".html")
  on.exit(unlink(path_4))
  expect_false(file.exists(path_4))

  # Write the file
  exibble %>%
    gt() %>%
    gt_save_html(
      filename = path_4,
      path = "/this/path/is/not/real"
    )

  # Check for existence
  expect_true(file.exists(path_4))
  expect_true(
    path_4 %>% readLines() %>% paste(collapse = "\n") %>%
      tidy_grepl("<!DOCTYPE html>")
  )

  # [#5] Using ~

  # Form final path, check for non-existence
  path_5 <- tempfile(tmpdir = "~", fileext = ".html")
  on.exit(unlink(path_5))
  expect_false(file.exists(path_5))

  # Write the file
  exibble %>%
    gt() %>%
    gt_save_html(
      filename = basename(path_5),
      path = "~"
    )

  # Check for existence
  expect_true(file.exists(path_5))
  expect_true(
    path_5 %>% readLines() %>% paste(collapse = "\n") %>%
      tidy_grepl("<!DOCTYPE html>")
  )
})

# test_that("the `gtsave()` function creates a LaTeX file based on the extension", {

  # # Create a filename with path, having the
  # # .html extension
  # path_1 <- tempfile(fileext = ".tex")
  # on.exit(unlink(path_1))
  #
  # # Expect that a file does not yet exist
  # # on that path
  # expect_false(file.exists(path_1))
  #
  # # Save a gt table based on the exibble dataset
  # # as a LaTeX file to the `path_1`
  # exibble %>%
  #   gt() %>%
  #   gtsave(filename = path_1)
  #
  # # Expect that the file has been created
  # # on that path
  # expect_true(file.exists(path_1))
  #
  # # Expect that the content of the file is LaTeX
  # (path_1 %>%
  #     readLines())[1] %>%
  #   expect_match(
  #     "\\captionsetup[table]{labelformat=empty,skip=1pt}",
  #     fixed = TRUE)
  #
  # # Create a filename with path, having the
  # # .ltx extension
  # path_2 <- tempfile(fileext = ".ltx")
  # on.exit(unlink(path_2))
  #
  # # Expect that a file does not yet exist
  # # on that path
  # expect_false(file.exists(path_2))
  #
  # # Save a gt table based on the exibble dataset
  # # as a LaTeX file to the `path_2`
  # exibble %>%
  #   gt() %>%
  #   gtsave(filename = path_2)
  #
  # # Expect that the file has been created
  # # on that path
  # expect_true(file.exists(path_2))
  #
  # # Expect that the content of the file is LaTeX
  # (path_2 %>%
  #     readLines())[1] %>%
  #   expect_match(
  #     "\\captionsetup[table]{labelformat=empty,skip=1pt}",
  #     fixed = TRUE)
# })

test_that("The `gtsave()` function stops in some cases", {

  # Expect an error if the file extension doesn't
  # correspond to a saving function
  expect_error(exibble %>% gt() %>% gtsave(filename = "exibble.bat"))

  # Expect an error if no file extension is provided
  expect_error(exibble %>% gt() %>% gtsave(filename = "exibble"))
})

test_that("The `gtsave()` function creates docx files as expected", {

  skip_on_ci()
  skip_on_covr()

  gt_exibble <- exibble %>% gt()

  temp_docx <- file.path(tempdir(),"test.docx")
  on.exit(unlink(temp_docx))
  expect_false(file.exists(temp_docx))

  gtsave(gt_exibble, filename = "test.docx", path = tempdir())

  # Check for existence
  expect_true(file.exists(temp_docx))

  temp_docx_xml <- xml2::read_xml(unz(temp_docx,"word/document.xml"))

  temp_docx_xml %>%
    xml2::xml_find_first(".//w:tbl") %>%
    as.character() %>%
    expect_snapshot()
})

test_that("The `gtsave()` fn creates docx files even when a table has special characters", {

  skip_on_ci()
  skip_on_covr()

  # addresses issue raised in gh issue #121

  gt_exibble <-
    data.frame(
      a = c("<", "b"),
      b = 1:2,
      stringsAsFactors = FALSE
    ) %>%
    gt()

  temp_docx <- file.path(tempdir(),"test.docx")
  on.exit(unlink(temp_docx))
  expect_false(file.exists(temp_docx))

  gtsave(gt_exibble, filename = "test.docx", path = tempdir())

  # Check for existence
  expect_true(file.exists(temp_docx))

  temp_docx_xml <- xml2::read_xml(unz(temp_docx,"word/document.xml"))

  temp_docx_xml %>%
    xml2::xml_find_first(".//w:tbl") %>%
    as.character() %>%
    expect_snapshot()
})
