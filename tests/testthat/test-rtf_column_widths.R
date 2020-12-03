test_that("column widths are expressed correctly for RTF", {

  local_edition(3)

  tw <- function(x) {
    paste0(x, "tw")
  }

  expect_error(
    col_width_resolver_rtf(
      table_width = "-1tw",
      col_widths = "1tw",
      n_cols = 1
    )
  )

  expect_error(
    col_width_resolver_rtf(
      table_width = "1tw",
      col_widths = "-1tw",
      n_cols = 1
    )
  )

  expect_identical(
    col_width_resolver_rtf(
      table_width = "auto",
      col_widths = NULL,
      n_cols = 3
    ),
    c(3156, 3156, 3156)
  )

  expect_identical(
    col_width_resolver_rtf(
      table_width = "1000tw",
      col_widths = NULL,
      n_cols = 3
    ),
    c(333, 333, 333)
  )

  expect_identical(
    col_width_resolver_rtf(
      table_width = tw(900),
      col_widths = tw(c(200, 200, 200)),
      n_cols = 3
    ),
    c(200, 200, 200)
  )

  expect_identical(
    col_width_resolver_rtf(
      table_width = tw(1200),
      col_widths = pct(c(100, 200, 300)),
      n_cols = 3
    ),
    c(200, 400, 600)
  )

  expect_identical(
    col_width_resolver_rtf(
      table_width = tw(1200),
      col_widths = c(pct(c(100, 200, 300)), "", ""),
      n_cols = 5
    ),
    c(200, 400, 600, 0, 0)
  )

  expect_identical(
    col_width_resolver_rtf(
      table_width = tw(1200),
      col_widths = c(pct(c(10, 20, 30)), "", ""),
      n_cols = 5
    ),
    c(120, 240, 360, 240, 240)
  )

  expect_identical(
    col_width_resolver_rtf(
      table_width = tw(1000),
      col_widths = c("500tw", "50%", "50%"),
      n_cols = 3
    ),
    c(500, 250, 250)
  )

  expect_identical(
    col_width_resolver_rtf(
      table_width = tw(1000),
      col_widths = c("500tw", "10%", "10%"),
      n_cols = 3
    ),
    c(500, 250, 250)
  )

  expect_identical(
    col_width_resolver_rtf(
      table_width = tw(1000),
      col_widths = c("500tw", "10%", "10%", "", ""),
      n_cols = 5
    ),
    c(500, 100, 100, 150, 150)
  )

  expect_identical(
    col_width_resolver_rtf(
      table_width = tw(1000),
      col_widths = c("500tw", "25%", "25%", "", ""),
      n_cols = 5
    ),
    c(500, 250, 250, 0, 0)
  )

  expect_identical(
    col_width_resolver_rtf(
      table_width = tw(100),
      col_widths = rep_len("50tw", 3),
      n_cols = 3
    ),
    c(50, 50, 50)
  )

  expect_identical(
    col_width_resolver_rtf(
      table_width = tw(100),
      col_widths = rep_len("0%", 3),
      n_cols = 3
    ),
    c(0, 0, 0)
  )
})
