context("LaTeX -- Ensuring that the `cols_align*()` functions work as expected")

# Create a shorter version of `mtcars`
mtcars_short <- mtcars[1:5, ]

# Create a data frame based on the internal `sp500.csv`
sp500 <-
  read.csv(
    system.file("extdata", "sp500.csv", package = "gt"),
    stringsAsFactors = FALSE)

test_that("the `cols_align()` function works correctly", {

  # Create a `tbl_latex` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns are aligned left
  tbl_latex <-
    gt(data = mtcars_short) %>%
    cols_align(align = "left", columns = vars(mpg, cyl, drat)) %>%
    as_latex() %>% as.character()

  # Expect a characteristic pattern
  grepl(".*begin\\{longtable\\}\\{llrrlrrrrrr\\}.*", tbl_latex) %>%
    expect_true()

  # Create a `tbl_latex` object with `gt()`; columns `1` (`mpg`),
  # `2` (`cyl`), and `3` (`disp`) are aligned right
  tbl_latex <-
    gt(data = mtcars_short) %>%
    cols_align(align = "left", columns = 1:3) %>%
    as_latex() %>% as.character()

  # Expect a characteristic pattern
  grepl(".*begin\\{longtable\\}\\{lllrrrrrrrr\\}.*", tbl_latex) %>%
    expect_true()

  # Create a `tbl_latex` object with `gt()`; align all
  # columns to the left
  tbl_latex <-
    gt(data = mtcars_short) %>%
    cols_align(align = "left") %>%
    as_latex() %>% as.character()

  # Expect a characteristic pattern
  grepl(".*begin\\{longtable\\}\\{lllllllllll\\}.*", tbl_latex) %>%
    expect_true()

  # Create a `tbl_latex` object with `gt()`; align all
  # columns (using `columns = TRUE`) to the left
  tbl_latex <-
    gt(data = mtcars_short) %>%
    cols_align(align = "left", columns = TRUE) %>%
    as_latex() %>% as.character()

  # Expect a characteristic pattern
  grepl(".*begin\\{longtable\\}\\{lllllllllll\\}.*", tbl_latex) %>%
    expect_true()

  # Create a `tbl_latex` object with the `sp500` data
  # frame and `auto`-align all columns
  tbl_latex <-
    gt(data = sp500) %>%
    cols_align(align = "auto") %>%
    as_latex() %>% as.character()

  # Expect a characteristic pattern
  grepl(".*begin\\{longtable\\}\\{lrrrrr\\}.*", tbl_latex) %>%
    expect_true()
})
