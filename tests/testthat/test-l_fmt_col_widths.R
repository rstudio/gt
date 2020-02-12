context("Ensuring that the calculations of table widths for LaTeX works properly")

test_that("the `fmt_header_latex()` function works correctly", {

  # Create a vector representing the calculated widths
  col_widths <- c(1, 2, 3, 4, 5, 6)

  header <- fmt_header_latex(col_widths)

  # Expect a fixed pattern representing the table header
  expect_true(grepl("\\begin{longtable}{p{1cm}p{2cm}p{3cm}p{4cm}p{5cm}p{6cm}} \n", header, fixed = TRUE))
})

test_that("the `type_setting()` function works correctly", {

  # Create a vector representing all font sizing options in pt.
  fs_pt <- c(5, 6, 7, 8, 9, 10, 11, 12)

  #Translate pt font sizing to LaTeX presets
  fs_tex <- paste(purrr::map_chr(fs_pt, type_setting), collapse = ' ')

  # Expect a fixed pattern representing all present options
  expect_true(grepl("\\tiny \n \\tiny \n \\tiny \n \\scriptsize \n \\scriptsize \n \\footnotesize \n \\small \n NA", fs_tex, fixed = TRUE))
})


test_that("the calculation of column widths works correctly", {

  # Create a table that where all the columns contain elements of the same character width.
  tbl <- dplyr::tribble(~hat, ~hot, ~hut,
                        1, 1, 1,
                        2, 2, 2)

  # Convert to gt table
  tbl_gt <- tbl %>% gt()

  # Convert to LaTeX character string
  tbl_tex <- tbl_gt %>% as_latex() %>% as.character()

  # Extract the calculated column widths
  col_widths <- unlist(qdapRegex::rm_between(tbl_tex, 'p{', '}', extract=TRUE))

  # Expect all calculated column widths to be equal to one another
  expect_equal(length(unique(col_widths)), 1)


  # Create a table where the first column width would need to be wider than the other columns
  tbl <- dplyr::tribble(~fjaldjfslaf, ~hot, ~hut,
                        'dfjlajdfkl', 1, 1,
                        'jfldsjalfk', 2, 2)

  # Convert to gt table
  tbl_gt <- tbl %>% gt()

  # Convert to LaTeX character string
  tbl_tex <- tbl_gt %>% as_latex() %>% as.character()

  # Extract the calculated column widths
  col_widths <- unlist(qdapRegex::rm_between(tbl_tex, 'p{', 'cm}', extract=TRUE))

  # Convert to dbl
  col_widths <- purrr::map_dbl(col_widths, as.numeric)

  # Expect the first value to be greater than the second and third values
  expect_true(col_widths[1] > col_widths[2] && col_widths[1] > col_widths[3])

  # Expect that the sum of the column widths is equal to 17.6 cm
  # 17.6 determined to be width of page
  expect_equal(sum(col_widths), 17.6)

  # Ensure that appropriate font sizing is being selected per length of table text
  # Create two tables, one with short text and another with long text

  long_tbl <- dplyr::tribble(~ababababababababababababababababa, ~cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd, ~efefefefefefefefefefefefefefefefefefefe, ~ghghghghghghghghghghghghghghghghgh, ~ijijijijijijijijijijijijijijijiji,
                             'ababababababababababababababababa', 'cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd', 'efefefefefefefefefefefefefefefefefefefe', 'ghghghghghghghghghghghghghghghghgh', 'ijijijijijijijijijijijijijijijiji',
                             'ababababababababababababababababa', 'cdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcdcd', 'efefefefefefefefefefefefefefefefefefefe', 'ghghghghghghghghghghghghghghghghgh', 'ijijijijijijijijijijijijijijijiji')

  short_tbl <- dplyr::tribble(~ababababababababababa, ~cdcdcdcdcdcdcdcdcdcdcdc, ~efefefefefefefefefe, ~ghghghghghghghghg, ~ijijijijijijijiji,
                              'ababababababababababa', 'cdcdcdcdcdcdcdcdcdcdcdc', 'efefefefefefefefefe', 'ghghghghghghghghg', 'ijijijijijijijiji',
                              'ababababababababababa', 'cdcdcdcdcdcdcdcdcdcdcdc', 'efefefefefefefefefe', 'ghghghghghghghghg', 'ijijijijijijijiji')

  # Convert to gt tables
  long_tbl_gt <- long_tbl %>% gt()
  short_tbl_gt <- short_tbl %>% gt()

  # Convert to LaTeX character string
  long_tbl_tex <- long_tbl_gt %>% as_latex() %>% as.character()
  short_tbl_tex <- short_tbl_gt %>% as_latex() %>% as.character()

  # sizes smallest to largest
  sizing_options <- c('tiny', 'scriptsize', 'footnotesize', 'small')

  # grab the first element of the character string (fontsize setting)
  long_fs <- unlist(strsplit(long_tbl_tex, '\n'))[1]
  short_fs <- unlist(strsplit(short_tbl_tex, '\n'))[1]

  # strip the leading \\ on the fontsize and trailing whitespace
  long_fs <- gsub('\\', '', trimws(long_fs), fixed = TRUE)
  short_fs <- gsub('\\', '', trimws(short_fs), fixed = TRUE)

  # find position in sizing_options vector
  long_pos <- which(sizing_options == long_fs)[[1]]
  short_pos <- which(sizing_options == short_fs)[[1]]

  # Expect the shorter width table to have a larger fontsize than the longer width

  expect_true(short_pos > long_pos)

})
