test_that("pct() works correctly", {

  # Create a CSS percentage value string
  percentage <- pct(x = 50)

  # Expect that the value is formatted correctly
  expect_equal(percentage, "50%")

  # Expect an error if the value supplied is not numeric
  expect_error(
    pct(x = "50"))
})

test_that("px() works correctly", {

  # Create a CSS pixel value string
  pixels <- px(x = 50)

  # Expect that the value is formatted correctly
  expect_equal(pixels, "50px")

  # Expect an error if the value supplied is not numeric
  expect_error(px(x = "50"))
})

test_that("cells_group() emits a deprecation warning but works correctly", {

  # Expect a warning from the deprecated `cells_group()` function; it
  # still does return a useful list object
  expect_warning(
    out <- cells_group()
  )

  # Expect that the output from `cells_group()` is a list
  expect_type(out, "list")
})

test_that(" from_column() works correctly", {

  # Create a gt table based on `exibble` (with a few extra columns)
  tab <-
    exibble |>
    dplyr::mutate(
      i_integer = as.integer(1:8),
      i_real = as.numeric(1:8),
      tf = c(rep(TRUE, 4), rep(FALSE, 4)),
      locales = c("en", "de", "fr", "es", "it", "pt", "zh", "sv"),
      punct = c(rep(",", 4), rep(".", 4)),
      sys = c(rep("intl", 4), rep("ind", 4))
    ) |>
    gt(rowname_col = "row", groupname_col = "group")

  # Use `from_column()` on the `decimals` arg of `fmt_number()`
  expect_equal(
    (tab |>
       fmt_number(
         columns = num,
         decimals = from_column(column = "i_integer")
       ) |>
       render_formats_test("html")
    )[["num"]],
    c(
      "0.1", "2.22", "33.330", "444.4000", "5,550.00000", "NA",
      "777,000.0000000", "8,880,000.00000000"
    )
  )

  # This variation uses selected `rows` indices
  expect_equal(
    (tab |>
       fmt_number(
         columns = num,
         rows = c(2, 4, 6, 7),
         decimals = from_column(column = "i_integer")
       ) |>
       render_formats_test("html")
    )[["num"]],
    c(
      "1.111e-01", "2.22", "3.333e+01", "444.4000", "5.550e+03",
      "NA", "777,000.0000000", "8.880e+06"
    )
  )

  # Use `from_column()` with a newly created column (via `cols_add()`)
  expect_equal(
    (tab |>
       cols_add(i_integer_2 = i_integer * 2) |>
       fmt_number(
         columns = num,
         rows = c(2, 4, 6, 7),
         decimals = from_column(column = "i_integer_2")
       ) |>
       render_formats_test("html")
    )[["num"]],
    c(
      "1.111e-01", "2.2220", "3.333e+01", "444.40000000",
      "5.550e+03", "NA", "777,000.00000000000000", "8.880e+06"
    )
  )

  # Expect that the above won't work if `cols_add()` is invoked later
  expect_error(
    tab |>
      fmt_number(
        columns = num,
        rows = c(2, 4, 6, 7),
        decimals = from_column(column = "i_integer_2")
      ) |>
      cols_add(i_integer_2 = i_integer * 2)
  )

  # Use `from_column()` with a newly created column (via `cols_add()`); the
  # new column (`i_integer_2`) has NA values but they are handled in
  # `from_column()` with the `na_value` argument
  expect_equal(
    (tab |>
       cols_add(i_integer_2 = c(2, NA, NA, NA, NA, 3, 2, 1)) |>
       fmt_number(
         columns = num,
         rows = c(1, 2, 4, 6, 7),
         decimals = from_column(column = "i_integer_2", na_value = 5)
       ) |>
       render_formats_test("html")
    )[["num"]],
    c(
      "0.11", "2.22200", "3.333e+01", "444.40000", "5.550e+03",
      "NA", "777,000.00", "8.880e+06"
    )
  )

  # Expect that the `fn` argument of `from_column` can modify values taken
  # from `i_integer_2`; the replacement of NA values is the same as before
  expect_equal(
    (tab |>
       cols_add(i_integer_2 = c(2, NA, NA, NA, NA, 3, 2, 1)) |>
       fmt_number(
         columns = num,
         rows = c(1, 2, 4, 6, 7),
         decimals = from_column(
           column = "i_integer_2",
           na_value = 5,
           fn = function(x) x * 2
         )
       ) |>
       render_formats_test("html")
    )[["num"]],
    c(
      "0.1111", "2.22200", "3.333e+01", "444.40000", "5.550e+03",
      "NA", "777,000.0000", "8.880e+06"
    )
  )

  # Expect that the `fn` argument of `from_column` can modify replace NA
  # values in `i_integer_2`; the replacement of NA values through `na_value`
  # does nothing here
  expect_equal(
    (tab |>
       cols_add(i_integer_2 = c(2, NA, NA, NA, NA, 3, 2, 1)) |>
       fmt_number(
         columns = num,
         decimals = from_column(
           column = "i_integer_2",
           na_value = 5,
           fn = function(x) ifelse(is.na(x), 8, x)
         )
       ) |>
       render_formats_test("html")
    )[["num"]],
    c(
      "0.11", "2.22200000", "33.33000000", "444.40000000",
      "5,550.00000000", "NA", "777,000.00", "8,880,000.0"
    )
  )

  # Check that `sub_missing()` can still replace missing values after the
  # combination of `cols_add()`, `fmt_number()`/`from_column`
  expect_equal(
    (tab |>
       cols_add(i_integer_2 = c(2, NA, NA, NA, NA, 3, 2, 1)) |>
       fmt_number(
         columns = num,
         rows = c(1, 2, 4, 6, 7),
         decimals = from_column(
           column = "i_integer_2",
           na_value = 5,
           fn = function(x) x * 2
         )
       ) |>
       sub_missing(columns = num, missing_text = "5") |>
       render_formats_test("html")
    )[["num"]],
    c(
      "0.1111", "2.22200", "3.333e+01", "444.40000", "5.550e+03",
      "5", "777,000.0000", "8.880e+06"
    )
  )

  # Use `from_column()` to reference the same column that is being formatted
  expect_equal(
    (tab |>
       fmt_number(
         columns = i_integer,
         decimals = from_column(column = "i_integer")
       ) |>
       render_formats_test("html")
    )[["i_integer"]],
    c(
      "1.0", "2.00", "3.000", "4.0000", "5.00000",
      "6.000000", "7.0000000", "8.00000000"
    )
  )

  # Expect no difference when referencing a column with numeric values
  expect_equal(
    (tab |>
       fmt_number(
         columns = i_integer,
         decimals = from_column(column = "i_real")
       ) |>
       render_formats_test("html")
    )[["i_integer"]],
    c(
      "1.0", "2.00", "3.000", "4.0000", "5.00000",
      "6.000000", "7.0000000", "8.00000000"
    )
  )

  # Expect that multiple uses of `from_column()` will work without fail
  expect_equal(
    (tab |>
       fmt_number(
         columns = currency,
         decimals = from_column(column = "i_real"),
         use_seps = from_column(column = "tf"),
         scale_by = from_column(column = "i_integer"),
         force_sign = from_column(column = "tf")
       ) |>
       render_formats_test("html")
    )[["currency"]],
    c(
      "+50.0", "+35.90", "+4.170", "+260,400.0000", "6629.05000",
      "79.530000", "NA", "3.52000000"
    )
  )

  # A variation on the previous with multiple uses of `from_column()`
  expect_equal(
    (tab |>
       fmt_number(
         columns = currency,
         decimals = from_column(column = "i_real"),
         scale_by = from_column(column = "i_integer"),
         locale = from_column(column = "locales")
       ) |>
       render_formats_test("html")
    )[["currency"]],
    c(
      "50.0", "35,90", "4,170", "260.400,0000", "6.629,05000", "79,530000",
      "NA", "3,52000000"
    )
  )

  # Expect that even single-keyword based parameters (i.e., `system`) work
  expect_equal(
    (tab |>
       fmt_number(
         columns = num,
         scale_by = from_column(column = "i_integer", fn = function(x) x * 1e4),
         system = from_column(column = "sys")
       ) |>
       render_formats_test("html")
    )[["num"]],
    c(
      "1,111.00", "44,440.00", "999,900.00", "17,776,000.00", "27,75,00,000.00",
      "NA", "54,39,00,00,000.00", "7,10,40,00,00,000.00"
    )
  )

  # Expect that a combination of numbering systems with mark choices work well
  expect_equal(
    (tab |>
       fmt_number(
         columns = num,
         scale_by = from_column(column = "i_integer", fn = function(x) x * 1e4),
         system = from_column(column = "sys"),
         dec_mark = ".",
         sep_mark = "|"
       ) |>
       render_formats_test("html")
    )[["num"]],
    c(
      "1|111.00", "44|440.00", "999|900.00", "17|776|000.00", "27,75,00,000.00",
      "NA", "54,39,00,00,000.00", "7,10,40,00,00,000.00"
    )
  )

  # Perform a test with `fmt_integer()`
  expect_equal(
    (tab |>
       fmt_integer(
         columns = currency,
         scale_by = from_column(column = "i_integer"),
         force_sign = from_column(column = "tf")
       ) |>
       render_formats_test("html")
    )[["currency"]],
    c(
      "+50", "+36", "+4", "+260,400", "6,629", "80", "NA", "4"
    )
  )

  # Perform a test with `fmt_scientific()`
  if (getRversion() >= "4.4" && .Platform$OS.type == "windows") {
    value_sci <- "2.77 $\\times$ 10\\textsuperscript{9}"
  } else {
    value_sci <- "2.78 $\\times$ 10\\textsuperscript{9}"
  }
  expect_equal(
    (tab |>
       fmt_scientific(
         columns = num,
         scale_by = from_column(column = "i_integer", fn = function(x) x * 1e5),
         force_sign_m = from_column(column = "tf"),
         force_sign_n = from_column(column = "tf")
       ) |>
       render_formats_test("latex")
    )[["num"]],
    c(
      "+1.11 $\\times$ 10\\textsuperscript{+4}", "+4.44 $\\times$ 10\\textsuperscript{+5}",
      "+1.00 $\\times$ 10\\textsuperscript{+7}", "+1.78 $\\times$ 10\\textsuperscript{+8}",
      value_sci, "NA",
      "5.44 $\\times$ 10\\textsuperscript{11}", "7.10 $\\times$ 10\\textsuperscript{12}"
    )
  )

  # Perform a test with `fmt_engineering()`
  expect_equal(
    (tab |>
       fmt_engineering(
         columns = num,
         scale_by = from_column(column = "i_integer", fn = function(x) x * 1e5),
         force_sign_m = from_column(column = "tf"),
         force_sign_n = from_column(column = "tf")
       ) |>
       render_formats_test("latex")
    )[["num"]],
    c(
      "+11.11 $\\times$ 10\\textsuperscript{+3}", "+444.40 $\\times$ 10\\textsuperscript{+3}",
      "+10.00 $\\times$ 10\\textsuperscript{+6}", "+177.76 $\\times$ 10\\textsuperscript{+6}",
      "2.77 $\\times$ 10\\textsuperscript{9}", "NA", "543.90 $\\times$ 10\\textsuperscript{9}",
      "7.10 $\\times$ 10\\textsuperscript{12}"
    )
  )

  # Perform a test with `fmt_percent()`
  expect_equal(
    (tab |>
       fmt_percent(
         columns = currency,
         decimals = from_column(column = "i_real"),
         force_sign = from_column(column = "tf"),
         incl_space = from_column(column = "tf"),
         use_seps = from_column(column = "tf")
       ) |>
       render_formats_test("html")
    )[["currency"]],
    c(
      "+4,995.0 %", "+1,795.00 %", "+139.000 %", "+6,510,000.0000 %",
      "132581.00000%", "1325.500000%", "NA", "44.00000000%"
    )
  )

  # Perform a test with `fmt_partsper()`
  expect_equal(
    (tab |>
       cols_add(type = c("per-mille", "per-myriad", "pcm", "ppm", "ppb", "ppt", "ppq", "ppm")) |>
       fmt_partsper(
         columns = currency,
         to_units = from_column(column = "type"),
         decimals = from_column(column = "i_real"),
         force_sign = from_column(column = "tf"),
         incl_space = from_column(column = "tf"),
         use_seps = from_column(column = "tf")
       ) |>
       render_formats_test("html")
    )[["currency"]],
    c(
      "+49,950.0 ‰", "+179,500.00 ‱", "+139,000.000 pcm",
      "+65,100,000,000.0000 ppm", "1325810000000.00000ppb",
      "13255000000000.000000ppt", "NA", "440000.00000000ppm"
    )
  )

  # Perform a test with `fmt_fraction()`
  expect_equal(
    (tab |>
       cols_add(frac = i_real / 10) |>
       fmt_fraction(
         columns = frac,
         accuracy = from_column(column = "i_real"),
         layout = "inline"
       ) |>
       render_formats_test("html")
    )[["frac"]],
    c(
      "0", "0", "1/3", "1/2", "3/5", "2/3", "5/7", "3/4"
    )
  )

  # Perform a test with `fmt_currency()`
  expect_equal(
    (tab |>
       fmt_currency(
         columns = currency,
         force_sign = from_column(column = "tf"),
         locale = from_column(column = "locales")
       ) |>
       render_formats_test("html")
    )[["currency"]],
    c(
      "+$49.95", "+&#8364;17,95", "+&#8364;1,39", "+&#8364;65.100,00",
      "&#8364;1.325,81", "R$13,26", "NA", "kr0,44"
    )
  )

  # Perform a test with `fmt_roman()`
  expect_equal(
    (tab |>
       cols_add(case = c(rep("upper", 4), rep("lower", 4))) |>
       fmt_roman(
         columns = i_integer,
         case = from_column(column = "case")
       ) |>
       render_formats_test("html")
    )[["i_integer"]],
    c(
      "I", "II", "III", "IV", "v", "vi", "vii", "viii"
    )
  )

  # Perform a test with `fmt_index()`
  expect_equal(
    (tab |>
       cols_add(case = c(rep("upper", 4), rep("lower", 4))) |>
       fmt_index(
         columns = i_integer,
         case = from_column(column = "case")
       ) |>
       render_formats_test("html")
    )[["i_integer"]],
    c(
      "A", "B", "C", "D", "e", "f", "g", "h"
    )
  )

  # Perform a test with `fmt_spelled_num()`
  expect_equal(
    (tab |>
       cols_add(case = c(rep("upper", 4), rep("lower", 4))) |>
       fmt_spelled_num(
         columns = i_integer,
         locale = from_column(column = "locales")
       ) |>
       render_formats_test("html")
    )[["i_integer"]],
    c(
      "one", "zwei", "trois", "cuatro", "cinque",
      "seis", "七", "åtta"
    )
  )

  # Perform a test with `fmt_bytes()`
  expect_equal(
    (tab |>
       fmt_bytes(
         columns = num,
         force_sign = from_column(column = "tf")
       ) |>
       render_formats_test("html")
    )[["num"]],
    c(
      "0 B", "+2 B", "+33 B", "+444 B", "5.5 kB", "NA", "777 kB",
      "8.9 MB"
    )
  )

  # Perform a test with `fmt_date()`
  expect_equal(
    (tab |>
       fmt_date(
         columns = date,
         date_style = from_column(column = "i_real"),
         locale = from_column(column = "locales")
       ) |>
       render_formats_test("html")
    )[["date"]],
    c(
      "2015-01-15", "Sonntag, Februar 15, 2015", "dim., mars 15, 2015",
      "miércoles 15 abril 2015", "maggio 15, 2015", "jun. 15, 2015",
      NA, "15 augusti 2015"
    )
  )

  # Perform a test with `fmt_time()`
  expect_equal(
    (tab |>
       fmt_time(
         columns = time,
         rows = 1:3,
         time_style = from_column(column = "i_real"),
         locale = from_column(column = "locales")
       ) |>
       render_formats_test("html")
    )[["time"]],
    c(
      "13:35:00", "14:40", "3:45:00 PM", "16:50", "17:55", NA, "19:10", "20:20"
    )
  )

  # Perform a test with `fmt_datetime()`
  expect_equal(
    (tab |>
       fmt_datetime(
         columns = datetime,
         rows = 1:3,
         date_style = from_column(column = "i_integer"),
         time_style = from_column(column = "i_real"),
         locale = from_column(column = "locales")
       ) |>
       render_formats_test("html")
    )[["datetime"]],
    c(
      "2018-01-01 02:22:00", "Freitag, Februar 2, 2018 14:33",
      "sam., mars 3, 2018 3:44:00 AM", "2018-04-04 15:55", "2018-05-05 04:00",
      "2018-06-06 16:11", "2018-07-07 05:22", NA
    )
  )

  # Perform a test with `fmt_url()`
  expect_equal(
    (tab |>
       cols_add(url = towny$website[1:8]) |>
       fmt_url(
         columns = url,
         label = from_column(column = "char", na_value = "missing")
       ) |>
       render_formats_test("html")
    )[["url"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"https://addingtonhighlands.ca\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">apricot</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://adelaidemetcalfe.on.ca\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">banana</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://www.adjtos.ca\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">coconut</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://admastonbromley.com\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">durian</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://www.ajax.ca\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">missing</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://alberton.ca\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">fig</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://www.alfred-plantagenet.com\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">grapefruit</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://www.algonquinhighlands.ca\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">honeydew</a></span>"
    )
  )
})
