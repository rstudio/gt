# Create a table with rownames and four columns of values
tbl <-
  dplyr::tribble(
    ~col_1, ~col_2, ~col_3, ~col_4,
    767.6,  928.1,  382.0,  674.5,
    403.3,  461.5,   15.1,  242.8,
    686.4,   54.1,  282.7,   56.3,
    662.6,  148.8,  984.6,  928.1,
    198.5,   65.1,  127.4,  219.3,
    132.1,  118.1,   91.2,  874.3,
    349.7,  307.1,  566.7,  542.9,
    63.7,  504.3,  152.0,  724.5,
    105.4,  729.8,  962.4,  336.4,
    924.2,  424.6,  740.8,  104.2
  )

test_that("cols_merge() works correctly for LaTeX output tables", {

  # Create a `tbl_latex` object with `gt()`; merge two columns
  # with a `pattern`
  tbl_latex <-
    gt(mtcars_short) |>
    cols_merge(
      columns = c("drat", "wt"),
      hide_columns = "wt",
      pattern = "{1} ({2})"
    )

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    paste0(
      ".*21.0 & 6 & 160 & 110 & 3.90 \\(2.620\\) & 16.46 & 0 & 1 & 4 & 4",
      ".*21.0 & 6 & 160 & 110 & 3.90 \\(2.875\\) & 17.02 & 0 & 1 & 4 & 4",
      ".*22.8 & 4 & 108 & 93 & 3.85 \\(2.320\\) & 18.61 & 1 & 1 & 4 & 1",
      ".*21.4 & 6 & 258 & 110 & 3.08 \\(3.215\\) & 19.44 & 1 & 0 & 3 & 1",
      ".*18.7 & 8 & 360 & 175 & 3.15 \\(3.440\\) & 17.02 & 0 & 0 & 3 & 2.*"
    )
  )

  # Create a `tbl_latex` object with `gt()`; merge two columns
  # with a `pattern` and use `c()`
  tbl_latex <-
    gt(mtcars_short) |>
    cols_merge(
      columns = c(drat, wt),
      hide_columns = wt,
      pattern = "{1} ({2})"
    )

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    paste0(
      ".*21.0 & 6 & 160 & 110 & 3.90 \\(2.620\\) & 16.46 & 0 & 1 & 4 & 4",
      ".*21.0 & 6 & 160 & 110 & 3.90 \\(2.875\\) & 17.02 & 0 & 1 & 4 & 4",
      ".*22.8 & 4 & 108 & 93 & 3.85 \\(2.320\\) & 18.61 & 1 & 1 & 4 & 1",
      ".*21.4 & 6 & 258 & 110 & 3.08 \\(3.215\\) & 19.44 & 1 & 0 & 3 & 1",
      ".*18.7 & 8 & 360 & 175 & 3.15 \\(3.440\\) & 17.02 & 0 & 0 & 3 & 2.*"
      )
  )

  # Create a `tbl_latex` object with `gt()`; merge two columns, twice,
  # with two different `pattern`s; use `c()`
  tbl_latex <-
    gt(mtcars_short) |>
    cols_merge(
      columns = c(drat, wt),
      hide_columns = wt,
      pattern = "{1} ({2})"
    ) |>
    cols_merge(
      columns = c(gear, carb),
      hide_columns = carb,
      pattern = "{1}-{2}"
    )

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    paste0(
      ".*21.0 & 6 & 160 & 110 & 3.90 \\(2.620\\) & 16.46 & 0 & 1 & 4-4",
      ".*21.0 & 6 & 160 & 110 & 3.90 \\(2.875\\) & 17.02 & 0 & 1 & 4-4",
      ".*22.8 & 4 & 108 & 93 & 3.85 \\(2.320\\) & 18.61 & 1 & 1 & 4-1",
      ".*21.4 & 6 & 258 & 110 & 3.08 \\(3.215\\) & 19.44 & 1 & 0 & 3-1",
      ".*18.7 & 8 & 360 & 175 & 3.15 \\(3.440\\) & 17.02 & 0 & 0 & 3-2.*"
      )
    )
})

test_that("cols_merge_uncert() works correctly", {

  # Create a `tbl_latex` object with `gt()`; merge two columns
  # with `cols_merge_uncert()`
  tbl_latex <-
    gt(tbl) |>
    cols_merge_uncert(
      col_val = "col_1",
      col_uncert = "col_2"
    )

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    paste0(
      ".*767.6 ± 928.1 & 382.0 & 674.5",
      ".*403.3 ± 461.5 & 15.1 & 242.8",
      ".*686.4 ± 54.1 & 282.7 & 56.3",
      ".*662.6 ± 148.8 & 984.6 & 928.1",
      ".*198.5 ± 65.1 & 127.4 & 219.3",
      ".*132.1 ± 118.1 & 91.2 & 874.3",
      ".*349.7 ± 307.1 & 566.7 & 542.9",
      ".*63.7 ± 504.3 & 152.0 & 724.5",
      ".*105.4 ± 729.8 & 962.4 & 336.4",
      ".*924.2 ± 424.6 & 740.8 & 104.2.*"
      )
    )

  # Create a `tbl_latex` object with `gt()`; merge two columns
  # with `cols_merge_uncert()`
  tbl_latex <-
    gt(tbl) |>
    cols_merge_uncert(
      col_val = col_1,
      col_uncert = col_2
    )

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    paste0(
      ".*767.6 ± 928.1 & 382.0 & 674.5",
      ".*403.3 ± 461.5 & 15.1 & 242.8",
      ".*686.4 ± 54.1 & 282.7 & 56.3",
      ".*662.6 ± 148.8 & 984.6 & 928.1",
      ".*198.5 ± 65.1 & 127.4 & 219.3",
      ".*132.1 ± 118.1 & 91.2 & 874.3",
      ".*349.7 ± 307.1 & 566.7 & 542.9",
      ".*63.7 ± 504.3 & 152.0 & 724.5",
      ".*105.4 ± 729.8 & 962.4 & 336.4",
      ".*924.2 ± 424.6 & 740.8 & 104.2.*"
      )
    )

  # Create a `tbl_latex` object with `gt()`; merge two columns, twice,
  # with `cols_merge_uncert()`
  tbl_latex <-
    gt(tbl) |>
    cols_merge_uncert(
      col_val = col_1,
      col_uncert = col_2
    ) |>
    cols_merge_uncert(
      col_val = col_3,
      col_uncert = col_4
    )

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    paste0(
      ".*767.6 ± 928.1 & 382.0 ± 674.5",
      ".*403.3 ± 461.5 & 15.1 ± 242.8",
      ".*686.4 ± 54.1 & 282.7 ± 56.3",
      ".*662.6 ± 148.8 & 984.6 ± 928.1",
      ".*198.5 ± 65.1 & 127.4 ± 219.3",
      ".*132.1 ± 118.1 & 91.2 ± 874.3",
      ".*349.7 ± 307.1 & 566.7 ± 542.9",
      ".*63.7 ± 504.3 & 152.0 ± 724.5",
      ".*105.4 ± 729.8 & 962.4 ± 336.4",
      ".*924.2 ± 424.6 & 740.8 ± 104.2.*"
      )
  )
})

test_that("cols_merge_range() works correctly - R less than 4.1.3", {

  testthat::skip_if_not(getRversion() <= package_version("4.1.3"))

  # Create a `tbl_latex` object with `gt()`; merge two columns
  # with `cols_merge_range()`
  tbl_latex <-
    gt(tbl) |>
    cols_merge_range(
      col_begin = "col_1",
      col_end = "col_2"
    )

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    paste0(
      ".*767.6–928.1 & 382.0 & 674.5",
      ".*403.3–461.5 & 15.1 & 242.8",
      ".*686.4–54.1 & 282.7 & 56.3",
      ".*662.6–148.8 & 984.6 & 928.1",
      ".*198.5–65.1 & 127.4 & 219.3",
      ".*132.1–118.1 & 91.2 & 874.3",
      ".*349.7–307.1 & 566.7 & 542.9",
      ".*63.7–504.3 & 152.0 & 724.5",
      ".*105.4–729.8 & 962.4 & 336.4",
      ".*924.2–424.6 & 740.8 & 104.2.*"
    )
  )

  # Create a `tbl_latex` object with `gt()`; merge two columns
  # with `cols_merge_range()`
  tbl_latex <-
    gt(tbl) |>
    cols_merge_range(
      col_begin = col_1,
      col_end = col_2
    )

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    paste0(
      ".*767.6–928.1 & 382.0 & 674.5",
      ".*403.3–461.5 & 15.1 & 242.8",
      ".*686.4–54.1 & 282.7 & 56.3",
      ".*662.6–148.8 & 984.6 & 928.1",
      ".*198.5–65.1 & 127.4 & 219.3",
      ".*132.1–118.1 & 91.2 & 874.3",
      ".*349.7–307.1 & 566.7 & 542.9",
      ".*63.7–504.3 & 152.0 & 724.5",
      ".*105.4–729.8 & 962.4 & 336.4",
      ".*924.2–424.6 & 740.8 & 104.2.*"
    )
  )

  # Create a `tbl_latex` object with `gt()`; merge two columns, twice,
  # with `cols_merge_range()`
  tbl_latex <-
    gt(tbl) |>
    cols_merge_range(
      col_begin = col_1,
      col_end = col_2
    ) |>
    cols_merge_range(
      col_begin = col_3,
      col_end = col_4
    )

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    paste0(
      ".*767.6–928.1 & 382.0–674.5",
      ".*403.3–461.5 & 15.1–242.8",
      ".*686.4–54.1 & 282.7–56.3",
      ".*662.6–148.8 & 984.6–928.1",
      ".*198.5–65.1 & 127.4–219.3",
      ".*132.1–118.1 & 91.2–874.3",
      ".*349.7–307.1 & 566.7–542.9",
      ".*63.7–504.3 & 152.0–724.5",
      ".*105.4–729.8 & 962.4–336.4",
      ".*924.2–424.6 & 740.8–104.2.*"
    )
  )
})

test_that("cols_merge_range() works correctly - R greater than 4.1.3", {

  testthat::skip_if_not(getRversion() > package_version("4.1.3"))

  # Create a `tbl_latex` object with `gt()`; merge two columns
  # with `cols_merge_range()`
  tbl_latex <-
    gt(tbl) |>
    cols_merge_range(
      col_begin = "col_1",
      col_end = "col_2"
    )

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    paste0(
      ".*767.6–928.1 & 382.0 & 674.5",
      ".*403.3–461.5 & 15.1 & 242.8",
      ".*686.4–54.1 & 282.7 & 56.3",
      ".*662.6–148.8 & 984.6 & 928.1",
      ".*198.5–65.1 & 127.4 & 219.3",
      ".*132.1–118.1 & 91.2 & 874.3",
      ".*349.7–307.1 & 566.7 & 542.9",
      ".*63.7–504.3 & 152.0 & 724.5",
      ".*105.4–729.8 & 962.4 & 336.4",
      ".*924.2–424.6 & 740.8 & 104.2.*"
    )
  )

  # Create a `tbl_latex` object with `gt()`; merge two columns
  # with `cols_merge_range()`
  tbl_latex <-
    gt(tbl) |>
    cols_merge_range(
      col_begin = col_1,
      col_end = col_2
    )

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    paste0(
      ".*767.6–928.1 & 382.0 & 674.5",
      ".*403.3–461.5 & 15.1 & 242.8",
      ".*686.4–54.1 & 282.7 & 56.3",
      ".*662.6–148.8 & 984.6 & 928.1",
      ".*198.5–65.1 & 127.4 & 219.3",
      ".*132.1–118.1 & 91.2 & 874.3",
      ".*349.7–307.1 & 566.7 & 542.9",
      ".*63.7–504.3 & 152.0 & 724.5",
      ".*105.4–729.8 & 962.4 & 336.4",
      ".*924.2–424.6 & 740.8 & 104.2.*"
    )
  )

  # Create a `tbl_latex` object with `gt()`; merge two columns, twice,
  # with `cols_merge_range()`
  tbl_latex <-
    gt(tbl) |>
    cols_merge_range(
      col_begin = col_1,
      col_end = col_2
    ) |>
    cols_merge_range(
      col_begin = col_3,
      col_end = col_4
    )

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    paste0(
      ".*767.6–928.1 & 382.0–674.5",
      ".*403.3–461.5 & 15.1–242.8",
      ".*686.4–54.1 & 282.7–56.3",
      ".*662.6–148.8 & 984.6–928.1",
      ".*198.5–65.1 & 127.4–219.3",
      ".*132.1–118.1 & 91.2–874.3",
      ".*349.7–307.1 & 566.7–542.9",
      ".*63.7–504.3 & 152.0–724.5",
      ".*105.4–729.8 & 962.4–336.4",
      ".*924.2–424.6 & 740.8–104.2.*"
    )
  )
})
