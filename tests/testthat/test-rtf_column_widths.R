test_that("The `col_width_resolver_rtf()` function works correctly", {

  tw <- function(x) {
    paste0(x, "tw")
  }

  page_body_width_portrait <- 12240L - 1440L - 1440L

  expect_error(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = "-1tw",
      col_widths = "1tw",
      n_cols = 1
    )
  )

  expect_error(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = "1tw",
      col_widths = "-1tw",
      n_cols = 1
    )
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = "auto",
      col_widths = NULL,
      n_cols = 3
    ),
    c(3120, 3120, 3120)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = "1000tw",
      col_widths = NULL,
      n_cols = 3
    ),
    c(333, 333, 333)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(900),
      col_widths = tw(c(200, 200, 200)),
      n_cols = 3
    ),
    c(200, 200, 200)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(1200),
      col_widths = pct(c(100, 200, 300)),
      n_cols = 3
    ),
    c(200, 400, 600)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(1200),
      col_widths = c(pct(c(100, 200, 300)), "", ""),
      n_cols = 5
    ),
    c(200, 400, 600, 0, 0)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(1200),
      col_widths = c(pct(c(10, 20, 30)), "", ""),
      n_cols = 5
    ),
    c(120, 240, 360, 240, 240)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(1000),
      col_widths = c("500tw", "50%", "50%"),
      n_cols = 3
    ),
    c(500, 250, 250)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(1000),
      col_widths = c("500tw", "10%", "10%"),
      n_cols = 3
    ),
    c(500, 250, 250)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(1000),
      col_widths = c("500tw", "10%", "10%", "", ""),
      n_cols = 5
    ),
    c(500, 100, 100, 150, 150)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(1000),
      col_widths = c("500tw", "25%", "25%", "", ""),
      n_cols = 5
    ),
    c(500, 250, 250, 0, 0)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(100),
      col_widths = rep_len("50tw", 3),
      n_cols = 3
    ),
    c(50, 50, 50)
  )

  expect_identical(
    col_width_resolver_rtf(
      page_body_width = page_body_width_portrait,
      table_width = tw(100),
      col_widths = rep_len("0%", 3),
      n_cols = 3
    ),
    c(0, 0, 0)
  )
})

test_that("The `parse_length_str()` function works correctly", {

  lengths_vec_list <-
    list(
      c("20px", "20px", "20px", "20px"),
      c("20px", "20px", "", ""),
      c("20%", "20%", "30%", "40%"),
      c("", "", "", ""),
      c("20px", "20%", "20px", "20%"),
      c("20%", "20px", "", "30px"),
      c("1.2in", "230pt", "3.03cm", "502.1mm"),
      c("400tw", "", "20%", "301mm")
    )

  value_vec_list <-
    list(
      c(20, 20, 20, 20),
      c(20, 20, NA, NA),
      c(20, 20, 30, 40),
      rep(NA_real_, 4),
      c(20, 20, 20, 20),
      c(20, 20, NA, 30),
      c(1.2, 230, 3.03, 502.1),
      c(400, NA, 20, 301)
    )

  unit_vec_list <-
    list(
      c("px", "px", "px", "px"),
      c("px", "px", NA, NA),
      c("%", "%", "%", "%"),
      rep(NA_character_, 4),
      c("px", "%", "px", "%"),
      c("%", "px", NA, "px"),
      c("in", "pt", "cm", "mm"),
      c("tw", NA, "%", "mm")
    )

  for (i in seq_along(lengths_vec_list)) {

    lengths_tbl <-
      parse_length_str(
        lengths_vec = lengths_vec_list[[i]],
        allow_negative = FALSE
      )

    expect_type(lengths_tbl, "list")
    expect_s3_class(lengths_tbl, "data.frame")
    expect_equal(lengths_tbl[["value"]], value_vec_list[[i]])
    expect_equal(lengths_tbl[["unit"]], unit_vec_list[[i]])
  }

  expect_error(
    parse_length_str(
      lengths_vec = "-6px",
      allow_negative = FALSE
    )
  )

  parse_length_str(
    lengths_vec = "-6px",
    allow_negative = TRUE
  ) %>%
    {
      expect_equal(.[["value"]], -6)
      expect_equal(.[["unit"]], "px")
    }

  parse_length_str(
    lengths_vec = character(0L),
    allow_negative = TRUE
  ) %>%
    {
      expect_type(., "list")
      expect_s3_class(., "data.frame")
      expect_equal(nrow(.), 0)
    }

  # The `parse_length_str()` function doesn't check for valid
  # units so anything that fits the `(%|[a-z]+)` will work
  parse_length_str(
    lengths_vec = "6.234points"
  ) %>%
    {
      expect_equal(.[["value"]], 6.234)
      expect_equal(.[["unit"]], "points")
    }

  # NA values cannot be used
  expect_error(
    parse_length_str(
      lengths_vec = NA_character_,
      allow_negative = TRUE
    )
  )
})

test_that("The `abs_len_to_twips()` function works correctly", {

  lengths_vec_list <-
    list(
      c("20px", "20px", "20px", "20px"),
      c("20px", "20px", "", ""),
      c("20%", "20%", "30%", "40%"),
      c("", "", "", ""),
      c("20px", "20%", "20px", "20%"),
      c("20%", "20px", "", "30px"),
      c("1.2in", "230pt", "3.03cm", "502.1mm"),
      c("400tw", "", "20%", "301mm")
    )

  value_vec_list <-
    list(
      rep(300, 4),
      c(300, 300, NA, NA),
      c(20, 20, 30, 40),
      rep(NA_real_, 4),
      c(300, 20, 300, 20),
      c(20, 300, NA, 450),
      c(1728, 4600, 1717.795, 28465.51),
      c(400, NA, 20, 17064.57)
    )

  unit_vec_list <-
    list(
      rep("tw", 4),
      c("tw", "tw", NA, NA),
      rep("%", 4),
      rep(NA_character_, 4),
      c("tw", "%", "tw", "%"),
      c("%", "tw", NA, "tw"),
      rep("tw", 4),
      c("tw", NA, "%", "tw")
    )

  for (i in seq_along(lengths_vec_list)) {

    lengths_tbl <-
      abs_len_to_twips(parse_length_str(lengths_vec_list[[i]]))

    expect_type(lengths_tbl, "list")
    expect_s3_class(lengths_tbl, "data.frame")
    expect_equal(lengths_tbl[["value"]], value_vec_list[[i]], tolerance = 0.1)
    expect_equal(lengths_tbl[["unit"]], unit_vec_list[[i]])
  }
})
