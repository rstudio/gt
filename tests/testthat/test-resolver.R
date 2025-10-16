test_that("resolve_cols_i() and resolve_cols_c() work", {

  all_cols <- setNames(seq_along(names(exibble)), names(exibble))
  no_cols <- setNames(integer(0L), character(0L))

  expect_resolve_cols <- function(expr, expected, data = exibble, wrap = identity, ...) {
    wrap(expect_identical(resolve_cols_i({{ expr }}, data, ...), expected))
    wrap(expect_identical(resolve_cols_c({{ expr }}, data, ...), names(expected)))
  }
  expect_resolve_errors <- function(expr, regexp = NULL, data = exibble, ...) {
    expect_error(resolve_cols_i({{ expr }}, data, ...), regexp = regexp)
    expect_error(resolve_cols_c({{ expr }}, data, ...), regexp = regexp)
  }

  expect_resolve_cols(1, c(num = 1L))
  expect_resolve_cols(num, c(num = 1L))
  expect_resolve_cols("num", c(num = 1L))
  expect_resolve_cols(starts_with("n"), c(num = 1L))
  expect_resolve_cols(where(is.numeric), c(num = 1L, currency = 7L))
  expect_resolve_cols(everything(), all_cols)
  expect_resolve_cols(c(), no_cols)

  # Legacy
  expect_resolve_cols(NULL, all_cols, wrap = expect_warning)
  expect_resolve_cols(TRUE, all_cols, wrap = expect_warning)
  expect_resolve_cols(FALSE, no_cols, wrap = expect_warning)
  expect_resolve_cols(vars(num, currency), c(num = 1L, currency = 7L), wrap = expect_warning)

  # strictness
  expect_resolve_errors("foo")
  expect_resolve_cols("foo", no_cols, strict = FALSE)
  expect_resolve_errors(100L)
  expect_resolve_cols(100L, no_cols, strict = FALSE)
})

test_that("resolve_rows_l() and resolve_rows_i() both work", {

  mtcars_gt <- gt(mtcars, rownames_to_stub = TRUE)
  iris_gt <- gt(iris, rownames_to_stub = TRUE)

  exibble_gt_1 <- gt(exibble |> dplyr::mutate(row = ifelse(row == "row_8", "", row)), rowname_col = "row")
  row_names_1 <- c(paste0("row_", 1:7), "")

  exibble_gt_2 <- gt(dplyr::bind_rows(exibble, exibble), rowname_col = "char")
  row_names_2 <- rep(exibble$char, 2)

  #
  # `resolve_rows_l()`
  #

  expect_identical(resolve_rows_l(1, mtcars), c(TRUE, rep_len(FALSE, nrow(mtcars) - 1)))
  expect_identical(resolve_rows_l("Mazda RX4", mtcars), c(TRUE, rep_len(FALSE, nrow(mtcars) - 1)))
  expect_warning(expect_identical(resolve_rows_l(NULL, mtcars, null_means = "everything"), rep_len(TRUE, nrow(mtcars))))
  expect_identical(resolve_rows_l(everything(), mtcars), rep_len(TRUE, nrow(mtcars)))

  expect_identical(resolve_rows_l(1, mtcars_gt), c(TRUE, rep_len(FALSE, nrow(mtcars) - 1)))
  expect_identical(resolve_rows_l("Mazda RX4", mtcars_gt), c(TRUE, rep_len(FALSE, nrow(mtcars) - 1)))
  expect_warning(expect_identical(resolve_rows_l(NULL, mtcars_gt, null_means = "everything"), rep_len(TRUE, nrow(mtcars))))
  expect_identical(resolve_rows_l(everything(), mtcars_gt), rep_len(TRUE, nrow(mtcars)))

  # Select helpers
  expect_identical(resolve_rows_l(everything(), mtcars), rep_len(TRUE, nrow(mtcars)))
  expect_identical(resolve_rows_l(starts_with("Merc"), mtcars), c(rep(FALSE, 7), rep(TRUE, 7), rep(FALSE, 18)))
  expect_identical(resolve_rows_l(ends_with("SE", ignore.case = FALSE), mtcars), c(rep(FALSE, 11), TRUE, rep(FALSE, 20)))
  expect_identical(resolve_rows_l(matches("RX4"), mtcars), c(rep(TRUE, 2), rep(FALSE, 30)))
  expect_identical(resolve_rows_l(matches("RX[0-9]"), mtcars), c(rep(TRUE, 2), rep(FALSE, 30)))
  expect_identical(resolve_rows_l(contains("RX4"), mtcars), c(rep(TRUE, 2), rep(FALSE, 30)))
  expect_identical(resolve_rows_l(num_range(prefix = "", range = seq_len(nrow(iris))), iris), rep_len(TRUE, nrow(iris)))

  expect_identical(resolve_rows_l(everything(), mtcars_gt), rep_len(TRUE, nrow(mtcars)))
  expect_identical(resolve_rows_l(starts_with("Merc"), mtcars_gt), c(rep(FALSE, 7), rep(TRUE, 7), rep(FALSE, 18)))
  expect_identical(resolve_rows_l(ends_with("SE", ignore.case = FALSE), mtcars_gt), c(rep(FALSE, 11), TRUE, rep(FALSE, 20)))
  expect_identical(resolve_rows_l(matches("RX4"), mtcars_gt), c(rep(TRUE, 2), rep(FALSE, 30)))
  expect_identical(resolve_rows_l(matches("RX[0-9]"), mtcars_gt), c(rep(TRUE, 2), rep(FALSE, 30)))
  expect_identical(resolve_rows_l(contains("RX4"), mtcars_gt), c(rep(TRUE, 2), rep(FALSE, 30)))
  expect_identical(resolve_rows_l(num_range(prefix = "", range = seq_len(nrow(iris))), iris_gt), rep_len(TRUE, nrow(iris)))

  # Using row names with duplicates and NAs
  expect_identical(resolve_rows_l(1, exibble_gt_1), c(TRUE, rep_len(FALSE, length(row_names_1) - 1)))
  expect_identical(resolve_rows_l(c(1, 1), exibble_gt_1), c(TRUE, rep_len(FALSE, length(row_names_1) - 1)))
  expect_identical(resolve_rows_l("row_1", exibble_gt_1), c(TRUE, rep_len(FALSE, length(row_names_1) - 1)))
  expect_identical(resolve_rows_l(c("row_1", "row_1", "row_2", "row_1"), exibble_gt_1), c(TRUE, TRUE, rep(FALSE, 6)))
  expect_identical(resolve_rows_l("", exibble_gt_1), c(rep_len(FALSE, length(row_names_1) - 1), TRUE))
  expect_identical(resolve_rows_l(FALSE, exibble_gt_1), c(rep_len(FALSE, length(row_names_1))))
  expect_identical(resolve_rows_l(character(0L), exibble_gt_1), c(rep_len(FALSE, length(row_names_1))))
  expect_warning(expect_identical(resolve_rows_l(NULL, exibble_gt_1, null_means = "everything"), rep_len(TRUE, length(row_names_1))))
  expect_identical(resolve_rows_l(everything(), exibble_gt_1), rep_len(TRUE, length(row_names_1)))

  expect_identical(resolve_rows_l(TRUE, exibble_gt_1), rep_len(TRUE, length(row_names_1)))
  expect_identical(resolve_rows_l(rep(TRUE, 8), exibble_gt_1), rep_len(TRUE, length(row_names_1)))

  expect_error(resolve_rows_l(rep(TRUE, 6), exibble_gt_1))
  expect_error(resolve_rows_l("not a row", exibble_gt_1))
  expect_error(resolve_rows_l(c(10, 10, 1), exibble_gt_1))
  expect_error(resolve_rows_l(c("not", "present"), exibble_gt_1))
  expect_error(resolve_rows_l(dplyr::tibble(a = 2), exibble_gt_1))

  expect_identical(resolve_rows_l(1, exibble_gt_2), c(TRUE, rep_len(FALSE, length(row_names_2) - 1)))
  expect_identical(resolve_rows_l("apricot", exibble_gt_2), c(TRUE, rep(FALSE, length(row_names_2) - 1)))
  expect_warning(expect_identical(resolve_rows_l(NULL, exibble_gt_2, null_means = "everything"), rep_len(TRUE, length(row_names_2))))
  expect_identical(resolve_rows_l(everything(), exibble_gt_2), rep_len(TRUE, length(row_names_2)))

  #
  # `resolve_rows_i()`
  #

  expect_identical(resolve_rows_i(1, mtcars), 1L)
  expect_identical(resolve_rows_i("Mazda RX4 Wag", mtcars), 2L)
  expect_warning(expect_identical(resolve_rows_i(NULL, mtcars), seq_len(nrow(mtcars))))
  expect_identical(resolve_rows_i(everything(), mtcars), seq_len(nrow(mtcars)))

  expect_identical(resolve_rows_i(1, mtcars_gt), 1L)
  expect_identical(resolve_rows_i("Mazda RX4 Wag", mtcars_gt), 2L)
  expect_warning(expect_identical(resolve_rows_i(NULL, mtcars_gt), seq_len(nrow(mtcars))))
  expect_identical(resolve_rows_i(everything(), mtcars_gt), seq_len(nrow(mtcars)))

  # Select helpers
  expect_identical(resolve_rows_i(everything(), mtcars), seq_len(nrow(mtcars)))
  expect_identical(resolve_rows_i(starts_with("Merc"), mtcars), 8:14)
  expect_identical(resolve_rows_i(ends_with("SE", ignore.case = FALSE), mtcars), 12L)
  expect_identical(resolve_rows_i(matches("RX4"), mtcars), 1:2)
  expect_identical(resolve_rows_i(matches("RX[0-9]"), mtcars), 1:2)
  expect_identical(resolve_rows_i(contains("RX4"), mtcars), 1:2)
  expect_identical(resolve_rows_i(num_range(prefix = "", range = seq_len(nrow(iris))), iris), 1:150)

  expect_identical(resolve_rows_i(everything(), mtcars_gt), seq_len(nrow(mtcars)))
  expect_identical(resolve_rows_i(starts_with("Merc"), mtcars_gt), 8:14)
  expect_identical(resolve_rows_i(ends_with("SE", ignore.case = FALSE), mtcars_gt), 12L)
  expect_identical(resolve_rows_i(matches("RX4"), mtcars_gt), 1:2)
  expect_identical(resolve_rows_i(matches("RX[0-9]"), mtcars_gt), 1:2)
  expect_identical(resolve_rows_i(contains("RX4"), mtcars_gt), 1:2)
  expect_identical(resolve_rows_i(num_range(prefix = "", range = seq_len(nrow(iris))), iris_gt), 1:150)

  # Using row names with duplicates and NAs
  expect_identical(resolve_rows_i(1, exibble_gt_1), 1L)
  expect_identical(resolve_rows_i(c(1, 1), exibble_gt_1), 1L)
  expect_identical(resolve_rows_i("row_1", exibble_gt_1), 1L)
  expect_identical(resolve_rows_i(c("row_1", "row_1", "row_2", "row_1"), exibble_gt_1), 1:2)
  expect_identical(resolve_rows_i("", exibble_gt_1), 8L)
  expect_identical(resolve_rows_i(FALSE, exibble_gt_1), integer(0L))
  expect_identical(resolve_rows_i(character(0L), exibble_gt_1), integer(0L))
  expect_warning(expect_identical(resolve_rows_i(NULL, exibble_gt_1), 1:8))
  expect_identical(resolve_rows_i(everything(), exibble_gt_1), 1:8)
  expect_identical(resolve_rows_i(TRUE, exibble_gt_1), 1:8)
  expect_identical(resolve_rows_i(rep(TRUE, 8), exibble_gt_1), 1:8)

  expect_error(resolve_rows_i(rep(TRUE, 6), exibble_gt_1))
  expect_error(resolve_rows_i("not a row", exibble_gt_1))
  expect_error(resolve_rows_i(c(10, 10, 1), exibble_gt_1))
  expect_error(resolve_rows_i(c("not", "present"), exibble_gt_1))
  expect_error(resolve_rows_i(dplyr::tibble(a = 2), exibble_gt_1))

  expect_identical(resolve_rows_i(1, exibble_gt_2), 1L)
  expect_identical(resolve_rows_i("apricot", exibble_gt_2), 1L)
  expect_warning(expect_identical(resolve_rows_i(NULL, exibble_gt_2), 1:16))
  expect_identical(resolve_rows_i(everything(), exibble_gt_2), 1:16)

  expect_identical(resolve_rows_i(is.na(char), exibble_gt_1), 5L)
  expect_identical(resolve_rows_i(num > 4, exibble_gt_1), c(3:5, 7:8))
  expect_identical(resolve_rows_i(fctr == "six", exibble_gt_1), 6L)
  expect_identical(resolve_rows_i(currency == 20, exibble_gt_1), integer(0L))
})


test_that("resolve_vector_l() and resolve_vector_i() both work", {

  vector_x <- c(colnames(exibble), NA_character_, "", colnames(exibble)[1:2])

  #
  # `resolve_vector_l()`
  #

  expect_identical(resolve_vector_l(1, vector_x), c(TRUE, rep_len(FALSE, length(vector_x) - 1)))
  expect_identical(resolve_vector_l("fctr", vector_x), c(FALSE, FALSE, TRUE, rep(FALSE, 10)))
  expect_warning(expect_identical(resolve_vector_l(NULL, vector_x), rep_len(TRUE, length(vector_x))))
  expect_identical(resolve_vector_l(everything(), vector_x), rep_len(TRUE, length(vector_x)))

  expect_identical(resolve_vector_l("", vector_x), c(rep(FALSE, 10), TRUE, FALSE, FALSE))
  expect_identical(resolve_vector_l(NA_character_, vector_x), c(rep(FALSE, 9), TRUE, FALSE, FALSE, FALSE))

  # Select helpers
  expect_identical(resolve_vector_l(everything(), vector_x), rep_len(TRUE, length(vector_x)))
  expect_identical(resolve_vector_l(starts_with("d"), vector_x), c(rep(FALSE, 3), TRUE, FALSE, TRUE, rep(FALSE, 7)))
  expect_identical(resolve_vector_l(ends_with("time", ignore.case = FALSE), vector_x), c(rep(FALSE, 4), TRUE, TRUE, rep(FALSE, 7)))
  expect_identical(resolve_vector_l(matches("im"), vector_x), c(rep(FALSE, 4), TRUE, TRUE, rep(FALSE, 7)))
  expect_identical(resolve_vector_l(contains("o"), vector_x), c(rep(FALSE, 7), TRUE, TRUE,  rep(FALSE, 4)))

  expect_error(resolve_vector_l(rep(TRUE, 6), vector_x))
  expect_error(resolve_vector_l("not valid", vector_x))
  expect_error(resolve_vector_l(c(90, 90, 1), vector_x))
  expect_error(resolve_vector_l(c("not", "present"), vector_x))
  expect_error(resolve_vector_l(dplyr::tibble(a = 2), vector_x))

  #
  # `resolve_vector_i()`
  #

  expect_identical(resolve_vector_i(1, vector_x), 1L)
  expect_identical(resolve_vector_i("fctr", vector_x), 3L)
  expect_warning(expect_identical(resolve_vector_i(NULL, vector_x), 1:13))
  expect_identical(resolve_vector_i(everything(), vector_x), 1:13)
  expect_identical(resolve_vector_i("", vector_x), 11L)
  expect_identical(resolve_vector_i(NA_character_, vector_x), 10L)

  # Select helpers
  expect_identical(resolve_vector_i(everything(), vector_x), 1:13)
  expect_identical(resolve_vector_i(starts_with("d"), vector_x), c(4L, 6L))
  expect_identical(resolve_vector_i(ends_with("time", ignore.case = FALSE), vector_x), 5:6)
  expect_identical(resolve_vector_i(matches("im"), vector_x), 5:6)
  expect_identical(resolve_vector_i(contains("o"), vector_x), 8:9)

  expect_error(resolve_vector_i(rep(TRUE, 6), vector_x))
  expect_error(resolve_vector_i("not valid", vector_x))
  expect_error(resolve_vector_i(c(90, 90, 1), vector_x))
  expect_error(resolve_vector_i(c("not", "present"), vector_x))
  expect_error(resolve_vector_i(dplyr::tibble(a = 2), vector_x))
})
