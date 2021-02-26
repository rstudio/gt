test_that("resolve_cols", {
  # resolve_cols_i
  # resolve_cols_c

  all_cols <- setNames(seq_along(names(exibble)), names(exibble))
  no_cols <- setNames(integer(0), character(0))

  expect_resolve_cols <- function(expr, expected, data = exibble, wrap = identity, ...) {
    wrap(expect_identical(resolve_cols_i({{expr}}, data, ...), expected))
    wrap(expect_identical(resolve_cols_c({{expr}}, data, ...), names(expected)))
  }
  expect_resolve_errors <- function(expr, regexp = NULL, data = exibble, ...) {
    expect_error(resolve_cols_i({{expr}}, data, ...), regexp = regexp)
    expect_error(resolve_cols_c({{expr}}, data, ...), regexp = regexp)
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

test_that("resolve_rows", {
  # resolve_rows_i
  # resolve_rows_l
})
