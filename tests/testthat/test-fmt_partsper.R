test_that("fmt_partsper() works correctly", {

  # Create an input data frame two columns: one
  # character-based and one that is numeric
  data_tbl <-
    data.frame(
      char = "a",
      num = c(10^(0:-18), NA, Inf, -Inf),
      stringsAsFactors = FALSE
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data = data_tbl)

  # Extract vectors from the table object for comparison
  # to the original dataset
  char <- dt_data_get(tab)[["char"]]
  num <- dt_data_get(tab)[["num"]]

  # Expect the extracted values to match those of the original dataset
  expect_equal(data_tbl$char, char)

  expect_equal(data_tbl$num, num)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(tab |> fmt_partsper(columns = num_2))

  # Expect an error when using a locale that does not exist
  expect_error(tab |> fmt_partsper(columns = num_2, locale = "aa_bb"))

  # Format the `num` column to per mille values in the "html" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "per-mille") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "1,000.00‰", "100.00‰", "10.00‰", "1.00‰", "0.10‰",
      "0.01‰", "0.00‰", "0.00‰", "0.00‰", "0.00‰", "0.00‰",
      "0.00‰", "0.00‰", "0.00‰", "0.00‰", "0.00‰", "0.00‰",
      "0.00‰", "0.00‰", "NA", "Inf‰", paste0("\U02212", "Inf‰")
    )
  )

  # Format the `num` column to per mille values in the "latex" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "per-mille") |>
       render_formats_test(context = "latex"))[["num"]],
    c(
      "1,000.00\\textperthousand", "100.00\\textperthousand",
      "10.00\\textperthousand", "1.00\\textperthousand",
      "0.10\\textperthousand", "0.01\\textperthousand",
      "0.00\\textperthousand", "0.00\\textperthousand",
      "0.00\\textperthousand", "0.00\\textperthousand",
      "0.00\\textperthousand", "0.00\\textperthousand",
      "0.00\\textperthousand", "0.00\\textperthousand",
      "0.00\\textperthousand", "0.00\\textperthousand",
      "0.00\\textperthousand", "0.00\\textperthousand",
      "0.00\\textperthousand", "NA", "Inf\\textperthousand",
      "-Inf\\textperthousand"
    )
  )

  # Format the `num` column to per mille values in the "rtf" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "per-mille") |>
       render_formats_test(context = "rtf"))[["num"]],
    c(
      "1,000.00\\'89", "100.00\\'89", "10.00\\'89", "1.00\\'89",
      "0.10\\'89", "0.01\\'89", "0.00\\'89", "0.00\\'89", "0.00\\'89",
      "0.00\\'89", "0.00\\'89", "0.00\\'89", "0.00\\'89", "0.00\\'89",
      "0.00\\'89", "0.00\\'89", "0.00\\'89", "0.00\\'89", "0.00\\'89",
      "NA", "Inf\\'89", "-Inf\\'89"
    )
  )

  # Format the `num` column to per myriad values in the "html" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "per-myriad") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "10,000.00‱", "1,000.00‱", "100.00‱", "10.00‱", "1.00‱",
      "0.10‱", "0.01‱", "0.00‱", "0.00‱", "0.00‱", "0.00‱",
      "0.00‱", "0.00‱", "0.00‱", "0.00‱", "0.00‱", "0.00‱",
      "0.00‱", "0.00‱", "NA", "Inf‱", paste0("\U02212", "Inf‱")
    )
  )

  # Format the `num` column to per myriad values in the "latex" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "per-myriad") |>
       render_formats_test(context = "latex"))[["num"]],
    c(
      "10,000.00\\textpertenthousand", "1,000.00\\textpertenthousand",
      "100.00\\textpertenthousand", "10.00\\textpertenthousand",
      "1.00\\textpertenthousand", "0.10\\textpertenthousand",
      "0.01\\textpertenthousand", "0.00\\textpertenthousand",
      "0.00\\textpertenthousand", "0.00\\textpertenthousand",
      "0.00\\textpertenthousand", "0.00\\textpertenthousand",
      "0.00\\textpertenthousand", "0.00\\textpertenthousand",
      "0.00\\textpertenthousand", "0.00\\textpertenthousand",
      "0.00\\textpertenthousand", "0.00\\textpertenthousand",
      "0.00\\textpertenthousand", "NA", "Inf\\textpertenthousand",
      "-Inf\\textpertenthousand"
    )
  )

  # Format the `num` column to per myriad values in the "rtf" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "per-myriad") |>
       render_formats_test(context = "rtf"))[["num"]],
    c(
      "10,000.00\\uc0\\u8241", "1,000.00\\uc0\\u8241", "100.00\\uc0\\u8241",
      "10.00\\uc0\\u8241", "1.00\\uc0\\u8241", "0.10\\uc0\\u8241",
      "0.01\\uc0\\u8241", "0.00\\uc0\\u8241", "0.00\\uc0\\u8241",
      "0.00\\uc0\\u8241", "0.00\\uc0\\u8241", "0.00\\uc0\\u8241",
      "0.00\\uc0\\u8241", "0.00\\uc0\\u8241", "0.00\\uc0\\u8241",
      "0.00\\uc0\\u8241", "0.00\\uc0\\u8241", "0.00\\uc0\\u8241",
      "0.00\\uc0\\u8241", "NA", "Inf\\uc0\\u8241", "-Inf\\uc0\\u8241"
    )
  )

  # Format the `num` column to pcm values in the "html" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "pcm") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "100,000.00 pcm", "10,000.00 pcm", "1,000.00 pcm", "100.00 pcm",
      "10.00 pcm", "1.00 pcm", "0.10 pcm", "0.01 pcm", "0.00 pcm",
      "0.00 pcm", "0.00 pcm", "0.00 pcm", "0.00 pcm", "0.00 pcm", "0.00 pcm",
      "0.00 pcm", "0.00 pcm", "0.00 pcm", "0.00 pcm", "NA", "Inf pcm",
      paste0("\U02212", "Inf pcm")
    )
  )

  # Format the `num` column to pcm values in the "latex" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "pcm") |>
       render_formats_test(context = "latex"))[["num"]],
    c(
      "100,000.00 pcm", "10,000.00 pcm",
      "1,000.00 pcm", "100.00 pcm", "10.00 pcm",
      "1.00 pcm", "0.10 pcm", "0.01 pcm",
      "0.00 pcm", "0.00 pcm", "0.00 pcm",
      "0.00 pcm", "0.00 pcm", "0.00 pcm",
      "0.00 pcm", "0.00 pcm", "0.00 pcm",
      "0.00 pcm", "0.00 pcm", "NA",
      "Inf pcm", "-Inf pcm"
    )
  )

  # Format the `num` column to pcm values in the "rtf" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "pcm") |>
       render_formats_test(context = "rtf"))[["num"]],
    c(
      "100,000.00 pcm", "10,000.00 pcm", "1,000.00 pcm", "100.00 pcm",
      "10.00 pcm", "1.00 pcm", "0.10 pcm", "0.01 pcm", "0.00 pcm",
      "0.00 pcm", "0.00 pcm", "0.00 pcm", "0.00 pcm", "0.00 pcm", "0.00 pcm",
      "0.00 pcm", "0.00 pcm", "0.00 pcm", "0.00 pcm", "NA", "Inf pcm",
      "-Inf pcm"
    )
  )

  # Format the `num` column to ppm values in the "html" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "ppm") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "1,000,000.00 ppm", "100,000.00 ppm", "10,000.00 ppm", "1,000.00 ppm",
      "100.00 ppm", "10.00 ppm", "1.00 ppm", "0.10 ppm", "0.01 ppm",
      "0.00 ppm", "0.00 ppm", "0.00 ppm", "0.00 ppm", "0.00 ppm", "0.00 ppm",
      "0.00 ppm", "0.00 ppm", "0.00 ppm", "0.00 ppm", "NA", "Inf ppm",
      paste0("\U02212", "Inf ppm")
    )
  )

  # Format the `num` column to ppm values in the "latex" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "ppm") |>
       render_formats_test(context = "latex"))[["num"]],
    c(
      "1,000,000.00 ppm", "100,000.00 ppm",
      "10,000.00 ppm", "1,000.00 ppm",
      "100.00 ppm", "10.00 ppm",
      "1.00 ppm", "0.10 ppm", "0.01 ppm",
      "0.00 ppm", "0.00 ppm", "0.00 ppm",
      "0.00 ppm", "0.00 ppm", "0.00 ppm",
      "0.00 ppm", "0.00 ppm", "0.00 ppm",
      "0.00 ppm", "NA", "Inf ppm", "-Inf ppm"
    )
  )

  # Format the `num` column to ppm values in the "rtf" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "ppm") |>
       render_formats_test(context = "rtf"))[["num"]],
    c(
      "1,000,000.00 ppm", "100,000.00 ppm", "10,000.00 ppm", "1,000.00 ppm",
      "100.00 ppm", "10.00 ppm", "1.00 ppm", "0.10 ppm", "0.01 ppm",
      "0.00 ppm", "0.00 ppm", "0.00 ppm", "0.00 ppm", "0.00 ppm", "0.00 ppm",
      "0.00 ppm", "0.00 ppm", "0.00 ppm", "0.00 ppm", "NA", "Inf ppm",
      "-Inf ppm"
    )
  )

  # Format the `num` column to ppb values in the "html" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "ppb") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "1,000,000,000.00 ppb", "100,000,000.00 ppb", "10,000,000.00 ppb",
      "1,000,000.00 ppb", "100,000.00 ppb", "10,000.00 ppb", "1,000.00 ppb",
      "100.00 ppb", "10.00 ppb", "1.00 ppb", "0.10 ppb", "0.01 ppb",
      "0.00 ppb", "0.00 ppb", "0.00 ppb", "0.00 ppb", "0.00 ppb", "0.00 ppb",
      "0.00 ppb", "NA", "Inf ppb", paste0("\U02212", "Inf ppb")
    )
  )

  # Format the `num` column to ppb values in the "latex" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "ppb") |>
       render_formats_test(context = "latex"))[["num"]],
    c(
      "1,000,000,000.00 ppb", "100,000,000.00 ppb",
      "10,000,000.00 ppb", "1,000,000.00 ppb",
      "100,000.00 ppb", "10,000.00 ppb", "1,000.00 ppb",
      "100.00 ppb", "10.00 ppb", "1.00 ppb",
      "0.10 ppb", "0.01 ppb", "0.00 ppb",
      "0.00 ppb", "0.00 ppb", "0.00 ppb",
      "0.00 ppb", "0.00 ppb", "0.00 ppb",
      "NA", "Inf ppb", "-Inf ppb"
    )
  )

  # Format the `num` column to ppb values in the "rtf" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "ppb") |>
       render_formats_test(context = "rtf"))[["num"]],
    c(
      "1,000,000,000.00 ppb", "100,000,000.00 ppb", "10,000,000.00 ppb",
      "1,000,000.00 ppb", "100,000.00 ppb", "10,000.00 ppb", "1,000.00 ppb",
      "100.00 ppb", "10.00 ppb", "1.00 ppb", "0.10 ppb", "0.01 ppb",
      "0.00 ppb", "0.00 ppb", "0.00 ppb", "0.00 ppb", "0.00 ppb", "0.00 ppb",
      "0.00 ppb", "NA", "Inf ppb", "-Inf ppb"
    )
  )

  # Format the `num` column to ppt values in the "html" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "ppt") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "1,000,000,000,000.00 ppt", "100,000,000,000.00 ppt", "10,000,000,000.00 ppt",
      "1,000,000,000.00 ppt", "100,000,000.00 ppt", "10,000,000.00 ppt",
      "1,000,000.00 ppt", "100,000.00 ppt", "10,000.00 ppt", "1,000.00 ppt",
      "100.00 ppt", "10.00 ppt", "1.00 ppt", "0.10 ppt", "0.01 ppt",
      "0.00 ppt", "0.00 ppt", "0.00 ppt", "0.00 ppt", "NA", "Inf ppt",
      paste0("\U02212", "Inf ppt")
    )
  )

  # Format the `num` column to ppt values in the "latex" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "ppt") |>
       render_formats_test(context = "latex"))[["num"]],
    c(
      "1,000,000,000,000.00 ppt", "100,000,000,000.00 ppt",
      "10,000,000,000.00 ppt", "1,000,000,000.00 ppt",
      "100,000,000.00 ppt", "10,000,000.00 ppt",
      "1,000,000.00 ppt", "100,000.00 ppt", "10,000.00 ppt",
      "1,000.00 ppt", "100.00 ppt", "10.00 ppt",
      "1.00 ppt", "0.10 ppt", "0.01 ppt",
      "0.00 ppt", "0.00 ppt", "0.00 ppt",
      "0.00 ppt", "NA", "Inf ppt", "-Inf ppt"
    )
  )

  # Format the `num` column to ppt values in the "rtf" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "ppt") |>
       render_formats_test(context = "rtf"))[["num"]],
    c(
      "1,000,000,000,000.00 ppt", "100,000,000,000.00 ppt", "10,000,000,000.00 ppt",
      "1,000,000,000.00 ppt", "100,000,000.00 ppt", "10,000,000.00 ppt",
      "1,000,000.00 ppt", "100,000.00 ppt", "10,000.00 ppt", "1,000.00 ppt",
      "100.00 ppt", "10.00 ppt", "1.00 ppt", "0.10 ppt", "0.01 ppt",
      "0.00 ppt", "0.00 ppt", "0.00 ppt", "0.00 ppt", "NA", "Inf ppt",
      "-Inf ppt"
    )
  )

  # Format the `num` column to ppq values in the "html" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "ppq") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "1,000,000,000,000,000.00 ppq", "100,000,000,000,000.00 ppq",
      "10,000,000,000,000.00 ppq", "1,000,000,000,000.00 ppq", "100,000,000,000.00 ppq",
      "10,000,000,000.00 ppq", "1,000,000,000.00 ppq", "100,000,000.00 ppq",
      "10,000,000.00 ppq", "1,000,000.00 ppq", "100,000.00 ppq", "10,000.00 ppq",
      "1,000.00 ppq", "100.00 ppq", "10.00 ppq", "1.00 ppq", "0.10 ppq",
      "0.01 ppq", "0.00 ppq", "NA", "Inf ppq", paste0("\U02212", "Inf ppq")
    )
  )

  # Format the `num` column to ppq values in the "latex" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "ppq") |>
       render_formats_test(context = "latex"))[["num"]],
    c(
      "1,000,000,000,000,000.00 ppq", "100,000,000,000,000.00 ppq",
      "10,000,000,000,000.00 ppq", "1,000,000,000,000.00 ppq",
      "100,000,000,000.00 ppq", "10,000,000,000.00 ppq",
      "1,000,000,000.00 ppq", "100,000,000.00 ppq",
      "10,000,000.00 ppq", "1,000,000.00 ppq",
      "100,000.00 ppq", "10,000.00 ppq", "1,000.00 ppq",
      "100.00 ppq", "10.00 ppq", "1.00 ppq",
      "0.10 ppq", "0.01 ppq", "0.00 ppq",
      "NA", "Inf ppq", "-Inf ppq"
    )
  )

  # Format the `num` column to ppq values in the "rtf" context
  expect_equal(
    (tab |>
       fmt_partsper(columns = num, to_units = "ppq") |>
       render_formats_test(context = "rtf"))[["num"]],
    c(
      "1,000,000,000,000,000.00 ppq", "100,000,000,000,000.00 ppq",
      "10,000,000,000,000.00 ppq", "1,000,000,000,000.00 ppq", "100,000,000,000.00 ppq",
      "10,000,000,000.00 ppq", "1,000,000,000.00 ppq", "100,000,000.00 ppq",
      "10,000,000.00 ppq", "1,000,000.00 ppq", "100,000.00 ppq", "10,000.00 ppq",
      "1,000.00 ppq", "100.00 ppq", "10.00 ppq", "1.00 ppq", "0.10 ppq",
      "0.01 ppq", "0.00 ppq", "NA", "Inf ppq", "-Inf ppq"
    )
  )

  # Expect that a column with NAs will work fine with `fmt_partsper()`,
  # it'll just produce NA values
  na_col_tbl <- dplyr::tibble(a = rep(NA_real_, 10), b = 1:10) |> gt()

  # Expect a returned object of class `gt_tbl` with various
  # uses of `fmt_partsper()`
  expect_no_error(
    na_col_tbl |> fmt_partsper(columns = a) |> as_raw_html()
  )

  expect_no_error(
    na_col_tbl |>
      fmt_partsper(columns = a, rows = 1:5) |> as_raw_html()
  )

  expect_no_error(
    na_col_tbl |>
      fmt_partsper(columns = a, pattern = "a{x}b") |> as_raw_html()
  )

  # Expect that two columns being formatted (one entirely NA) will work
  expect_equal(
    (na_col_tbl |>
       fmt_partsper(columns = a) |>
       fmt_partsper(columns = b) |> render_formats_test("html"))[["b"]],
    c(
      "1,000.00‰", "2,000.00‰", "3,000.00‰", "4,000.00‰",
      "5,000.00‰", "6,000.00‰", "7,000.00‰", "8,000.00‰",
      "9,000.00‰", "10,000.00‰"
    )
  )
})
