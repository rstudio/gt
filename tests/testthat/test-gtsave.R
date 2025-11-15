test_that("gtsave() errors with bad filename input", {

  expect_snapshot(error = TRUE, {

    # file extension doesn't correspond to a saving function
    gtsave(gt(exibble), filename = "exibble.bat")

    # no file extension is provided
    gtsave(gt(exibble), filename = "exibble")
  })
})

# gtsave inline css handling ----------------------
test_that("gtsave() creates an HTML file based on the extension", {

  gt_tbl <- gt(exibble)

  # filename with .html extension
  path_html <- tempfile(fileext = ".html")
  path_htm <- tempfile(fileext = ".htm")
  path_html_inline_css1 <- tempfile(fileext = ".html")
  path_html_inline_css2 <- tempfile(fileext = ".html")

  on.exit(unlink(path_html))
  on.exit(unlink(path_htm))
  on.exit(unlink(path_html_inline_css1))
  on.exit(unlink(path_html_inline_css2))

  expect_false(file.exists(path_html))
  expect_false(file.exists(path_htm))
  expect_false(file.exists(path_html_inline_css1))
  expect_false(file.exists(path_html_inline_css2))

  # Save a gt table to temp paths
  gtsave(gt_tbl, filename = path_html)
  gtsave(gt_tbl, filename = path_htm)
  gtsave(gt_tbl, filename = path_html_inline_css1, inline_css = TRUE)

  # Should produce the same output as the above
  gtsave(
    gt_tbl,
    filename = basename(path_html_inline_css2),
    path = dirname(path_html_inline_css2),
    inline_css = TRUE
  )

  file_exist <- file.exists(c(
    path_html,
    path_htm,
    path_html_inline_css1,
    path_html_inline_css2
  ))

  expect_setequal(file_exist, TRUE)
  skip_if_not(all(file_exist), "Some files failed to save")

  lines_html <- readLines(path_html)
  lines_htm <- readLines(path_htm)
  lines_html_inline_css1 <- readLines(path_html_inline_css1)
  lines_html_inline_css2 <- readLines(path_html_inline_css2)

  # Expect that all files are HTML
  expect_match(lines_html, "<!DOCTYPE html>", all = FALSE)
  expect_match(lines_htm, "<!DOCTYPE html>", all = FALSE)
  expect_match(lines_html_inline_css1, "<!DOCTYPE html>", all = FALSE)
  expect_match(lines_html_inline_css2, "<!DOCTYPE html>", all = FALSE)

  # Expect that the CSS styles are not inlined for first 2 tables
  expect_match(lines_html, "<style>#[a-z]{10} table \\{", all = FALSE)
  expect_match(lines_htm, "<style>#[a-z]{10} table \\{", all = FALSE)

  # Expect that CSS styles are inlined for the last 2 tables
  expect_match(lines_html_inline_css1, "style=\"-webkit-font-smoothing: antialiased;", all = FALSE)
  expect_match(lines_html_inline_css2, "style=\"-webkit-font-smoothing: antialiased;", all = FALSE)

  skip_on_cran()
  # Expect lines_html_inline_css1 and 2 to be the same (if we exclude id)
  expect_equal(
    sub("id=\"\\S+\" ", "", lines_html_inline_css1),
    sub("id=\"\\S+\" ", "", lines_html_inline_css2)
  )
})

# gtsave path handling with HTML ------------------------
test_that("gtsave() works for HTML with relative filename, default path", {

  skip_on_ci()
  skip_on_covr()

  path <- withr::local_tempfile(fileext = ".html")
  path <- normalizePath(path, winslash = "/", mustWork = FALSE)

  # Split path and get total number of path components
  split_path <- unlist(fs::path_split(path))
  path_n <- length(split_path)

  # Set working directory
  withr::local_dir(
    file.path(paste0(ifelse(.Platform$OS.type == "windows", split_path[1], ""), "/", paste(split_path[2:3], collapse = "/")))
  )

  # Write the file
  gtsave(
    gt(exibble),
    filename = file.path(paste(split_path[4:path_n], collapse = "/"))
  )
  expect_true(file.exists(path))

  expect_match(readLines(path), "<!DOCTYPE html>", all = FALSE)
})

test_that("gt_save_html() works with relative filename, default path", {

  # the test is the same as above, but only change gtsave() with gt_save_html()
  skip_on_ci()
  skip_on_covr()

  # Form final path, check for non-existence
  path <- withr::local_tempfile(fileext = ".html")
  path <- normalizePath(path, winslash = "/", mustWork = FALSE)

  # Split path and get total number of path components
  split_path <- unlist(fs::path_split(path))
  path_n <- length(split_path)

  # Set working directory
  withr::local_dir(
    file.path(paste0(ifelse(.Platform$OS.type == "windows", split_path[1], ""), "/", paste(split_path[2:3], collapse = "/")))
  )

  # Write the file
  gt_save_html(
    gt(exibble),
    filename = file.path(paste(split_path[4:path_n], collapse = "/"))
  )
  expect_true(file.exists(path))

  expect_match(readLines(path), "<!DOCTYPE html>", all = FALSE)
})

test_that("gtsave() works for HTML with relative filename, relative path", {

  skip_on_ci()
  skip_on_covr()

  # Form final path, check for non-existence
  path <- withr::local_tempfile(fileext = ".html")
  path <- normalizePath(path, winslash = "/", mustWork = FALSE)

  # Split path and get total number of path components
  split_path <- unlist(fs::path_split(path))
  path_n <- length(split_path)

  # Set working directory
  withr::local_dir(
    file.path(paste0(ifelse(.Platform$OS.type == "windows", split_path[1], ""), "/", paste(split_path[2:3], collapse = "/")))
  )

  # Write the file
  gtsave(
    gt(exibble),
    filename = file.path(paste(split_path[7:path_n], collapse = "/")),
    path =  file.path(paste(split_path[4:6], collapse = "/"))
  )
  expect_true(file.exists(path))

  expect_match(readLines(path), "<!DOCTYPE html>", all = FALSE)
})

test_that("gt_save_html() works with relative filename, relative path", {

  # the test is the same as above, but only change gtsave() with gt_save_html()
  skip_on_ci()
  skip_on_covr()

  # Form final path, check for non-existence
  path <- withr::local_tempfile(fileext = ".html")
  path <- normalizePath(path, winslash = "/", mustWork = FALSE)

  # Split path and get total number of path components
  split_path <- unlist(fs::path_split(path))
  path_n <- length(split_path)

  # Set working directory
  withr::local_dir(
    file.path(paste0(ifelse(.Platform$OS.type == "windows", split_path[1], ""), "/", paste(split_path[2:3], collapse = "/")))
  )

  # Write the file
  gt_save_html(
    gt(exibble),
    filename = file.path(paste(split_path[7:path_n], collapse = "/")),
    path =  file.path(paste(split_path[4:6], collapse = "/"))
  )
  expect_true(file.exists(path))

  expect_match(readLines(path), "<!DOCTYPE html>", all = FALSE)
})

test_that("gtsave() works for HTML with absolute filename, absolute path (expect that `path` is ignored)", {

  skip_on_ci()
  skip_on_covr()

  # Form final path, check for non-existence
  path <- withr::local_tempfile(fileext = ".html")

  # Write the file
  gtsave(gt(exibble), filename = path, path = "/this/path/is/not/real")
  expect_true(file.exists(path))

  expect_match(readLines(path), "<!DOCTYPE html>", all = FALSE)
})

test_that("gt_save_html() works with absolute filename, absolute path (expect that `path` is ignored)", {

  # the test is the same as above, but only change gtsave() with gt_save_html()
  skip_on_ci()
  skip_on_covr()

  # Form final path, check for non-existence
  path <- withr::local_tempfile(fileext = ".html")

  # Write the file
  gt_save_html(gt(exibble), filename = path, path = "/this/path/is/not/real")
  expect_true(file.exists(path))

  expect_match(readLines(path), "<!DOCTYPE html>", all = FALSE)
})

test_that("gtsave() works for HTML with filename starting with ~/, absolute path (expect that path is ignored)", {

  skip_on_ci()
  skip_on_covr()
  skip_on_os("windows")

  # Form final path, check for non-existence
  path <- withr::local_tempfile(tmpdir = "~", fileext = ".html")

  gtsave(gt(exibble), filename = path, path = "/this/path/is/not/real")
  expect_true(file.exists(path))

  expect_match(readLines(path), "<!DOCTYPE html>", all = FALSE)
})

test_that("gt_save_html() works with filename starting with ~/, absolute path (expect that path is ignored)", {

  # the test is the same as above, but only change gtsave() with gt_save_html()
  skip_on_ci()
  skip_on_covr()
  skip_on_os("windows")

  # Form final path, check for non-existence
  path <- withr::local_tempfile(tmpdir = "~", fileext = ".html")

  gt_save_html(gt(exibble), filename = path, path = "/this/path/is/not/real")
  expect_true(file.exists(path))

  expect_match(readLines(path), "<!DOCTYPE html>", all = FALSE)
})

test_that("gtsave() works for HTML using ~", {

  skip_on_ci()
  skip_on_covr()
  skip_on_os("windows")

  # Form final path, check for non-existence
  path <- withr::local_tempfile(tmpdir = "~", fileext = ".html")

  gtsave(gt(exibble), filename = basename(path), path = "~")
  expect_true(file.exists(path))

  expect_match(readLines(path), "<!DOCTYPE html>", all = FALSE)
})

test_that("gt_save_html() works using ~", {

  skip_on_ci()
  skip_on_covr()
  skip_on_os("windows")

  # Form final path, check for non-existence
  path <- withr::local_tempfile(tmpdir = "~", fileext = ".html")

  gt_save_html(gt(exibble), filename = basename(path), path = "~")
  expect_true(file.exists(path))

  expect_match(readLines(path), "<!DOCTYPE html>", all = FALSE)
})

# gtsave() and LaTeX -----------------------------------------------------------

test_that("gtsave() creates a LaTeX file for .tex files", {

  skip()
  skip_on_ci()

  # Create a filename with path, having the
  # .tex extension
  path_1 <- tempfile(fileext = ".tex")
  on.exit(unlink(path_1))

  # Expect that a file does not yet exist
  # on that path
  expect_false(file.exists(path_1))

  # Save a gt table as a LaTeX file to the `path_1`
  gtsave(gt(exibble), filename = path_1)
  expect_true(file.exists(path_1))

  # Expect that the content of the file is LaTeX
  expect_match(
    readLines(path_1, n = 1L),
    "\\captionsetup[table]{labelformat=empty,skip=1pt}",
    fixed = TRUE
  )
})

test_that("gtsave() creates LaTeX file for .ltx files", {

  # TODO delete this test if outdated or fix it and unskip
  skip()
  skip_on_ci()

  # Create a filename with path, having the
  # .ltx extension
  path_2 <- tempfile(fileext = ".ltx")
  on.exit(unlink(path_2))

  # Expect that a file does not yet exist
  # on that path
  expect_false(file.exists(path_2))

  # Save a gt table based to LaTeX
  gtsave(gt(exibble), filename = path_2)
  expect_true(file.exists(path_2))

  # Expect that the content of the file is LaTeX
  expect_match(
    readLines(path_2, n = 1L),
    "\\captionsetup[table]{labelformat=empty,skip=1pt}",
    fixed = TRUE
  )
})

# gtsave() and docx ------------------------------------------------------------

test_that("gtsave() creates docx files as expected", {

  skip_on_ci()
  skip_on_covr()

  gt_exibble <- gt(exibble)

  temp_docx <- file.path(tempdir(), "test.docx")
  on.exit(unlink(temp_docx))
  expect_false(file.exists(temp_docx))

  gtsave(gt_exibble, filename = "test.docx", path = tempdir())

  expect_true(file.exists(temp_docx))

  temp_docx_xml <- xml2::read_xml(unz(temp_docx, "word/document.xml"))

  temp_docx_xml |>
    xml2::xml_find_first(".//w:tbl") |>
    as.character() |>
    expect_snapshot()
})

test_that("gtsave() creates docx files when a table has special characters (#121)", {

  skip_on_ci()
  skip_on_covr()

  temp_docx <- file.path(tempdir(), "test.docx")
  on.exit(unlink(temp_docx))
  expect_false(file.exists(temp_docx))

  # Save gt to docx
  tbl <- gt(data.frame(a = c("<", "b"), b = 1:2, stringsAsFactors = FALSE))

  gtsave(tbl, filename = "test.docx", path = tempdir())

  expect_true(file.exists(temp_docx))

  temp_docx_xml <- xml2::read_xml(unz(temp_docx, "word/document.xml"))
  temp_docx_out <- as.character(xml2::xml_find_first(temp_docx_xml, ".//w:tbl"))

  expect_snapshot(temp_docx_out)
})
