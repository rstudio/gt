test_that("date_formats() works correctly", {

  # Expect that `info_date_style()` is a tibble
  expect_s3_class(date_formats(), c("tbl_df", "tbl", "data.frame"))

  # Expect the tibble to be of specific dimensions
  expect_equal(dim(date_formats()), c(41, 4))

  # Expect the tibble to have specific column names
  expect_named(
    date_formats(),
    c("format_number", "format_name", "format_code", "flexible")
  )
})

test_that("time_formats() works correctly", {

  # Expect that `time_formats()` is a tibble
  expect_s3_class(time_formats(), c("tbl_df", "tbl", "data.frame"))

  # Expect the tibble to be of specific dimensions
  expect_equal(dim(time_formats()), c(25, 5))

  # Expect the tibble to have specific column names
  expect_named(
    time_formats(),
    c("format_number", "format_name", "format_code", "time_type", "flexible")
  )
})

test_that("get_date_format() works correctly", {

  # Expect specific `format_code` values for each
  # numeric `date_style` value passed in
  lapply(1:41, get_date_format) |>
    unlist() |>
    expect_equal(
      c(
        "y-MM-dd", "EEEE, MMMM d, y", "EEE, MMM d, y", "EEEE d MMMM y",
        "MMMM d, y", "MMM d, y", "d MMM y", "d MMMM y", "d MMMM", "d MMM",
        "y", "MMMM", "dd", "y/MM/dd", "yy/MM/dd", "y-'W'ww", "y-'Q'Q",
        "yMd", "yMEd", "yMMM", "yMMMM", "yMMMd", "yMMMEd", "GyMd", "GyMMMd",
        "GyMMMEd", "yM", "Md", "MEd", "MMMd", "MMMEd", "MMMMd", "GyMMM",
        "yQQQ", "yQQQQ", "Gy", "y", "M", "MMM", "d", "Ed"
      )
    )

  # Expect specific `format_code` values for each
  # text-based `date_style` value passed in
  lapply(date_formats()$format_name, get_date_format) |>
    unlist() |>
    expect_equal(
      c(
        "y-MM-dd", "EEEE, MMMM d, y", "EEE, MMM d, y", "EEEE d MMMM y",
        "MMMM d, y", "MMM d, y", "d MMM y", "d MMMM y", "d MMMM", "d MMM",
        "y", "MMMM", "dd", "y/MM/dd", "yy/MM/dd", "y-'W'ww", "y-'Q'Q",
        "yMd", "yMEd", "yMMM", "yMMMM", "yMMMd", "yMMMEd", "GyMd", "GyMMMd",
        "GyMMMEd", "yM", "Md", "MEd", "MMMd", "MMMEd", "MMMMd", "GyMMM",
        "yQQQ", "yQQQQ", "Gy", "y", "M", "MMM", "d", "Ed"
      )
    )
})

test_that("get_time_format() works correctly", {

  # Expect specific `format_code` values for each
  # numeric `date_style` value passed in
  lapply(1:25, get_time_format) |>
    unlist() |>
    expect_equal(
      c(
        "HH:mm:ss", "HH:mm", "h:mm:ss a", "h:mm a", "h a", "Hms", "Hm",
        "H", "EHm", "EHms", "Hmsv", "Hmv", "hms", "hm", "h", "Ehm", "Ehms",
        "EBhms", "Bhms", "EBhm", "Bhm", "Bh", "hmsv", "hmv", "ms"
      )
    )

  # Expect specific `format_code` values for each
  # text-based `date_style` value passed in
  lapply(time_formats()$format_name, get_time_format) |>
    unlist() |>
    expect_equal(
      c(
        "HH:mm:ss", "HH:mm", "h:mm:ss a", "h:mm a", "h a", "Hms", "Hm",
        "H", "EHm", "EHms", "Hmsv", "Hmv", "hms", "hm", "h", "Ehm", "Ehms",
        "EBhms", "Bhms", "EBhm", "Bhm", "Bh", "hmsv", "hmv", "ms"
      )
    )
})

test_that("validate_currency() works correctly", {

  # Expect that specific currency names supplied to
  # `validate_currency()` will all return NULL
  expect_null(
    unlist(lapply(currency_symbols$curr_symbol, validate_currency))
  )

  # Expect that invalid currency names supplied to
  # `validate_currency()` will result in an error
  expect_error(lapply(c("thaler", "tetarteron"), validate_currency))


  # Expect that specific currency codes supplied to
  # `validate_currency()` will all return NULL
  expect_null(
    unlist(lapply(currencies$curr_code, validate_currency))
  )

  # Expect that invalid currency codes supplied to
  # `validate_currency()` will result in an error
  expect_error(lapply(c("AAA", "ZZZ"), validate_currency))

  # Expect that specific currency codes (3-number)
  # supplied to `validate_currency()` will return NULL
  expect_null(
    unlist(lapply(currencies$curr_number, validate_currency))
  )

  expect_null(
    unlist(lapply(as.numeric(currencies$curr_number), validate_currency))
  )

  # Expect that invalid currency codes supplied to
  # `validate_currency()` will return an error
  expect_error(lapply(c(999, 998), validate_currency))
})

test_that("get_currency_str() works correctly", {

  # Expect that various currency codes (3-letter)
  # return a currency symbol
  get_currency_str(currency = "CAD") |>
    expect_equal("$")

  get_currency_str(currency = "DKK") |>
    expect_equal("kr.")

  get_currency_str(currency = "JPY") |>
    expect_equal("&#165;")

  get_currency_str(currency = "RUB") |>
    expect_equal("&#8381;")

  # Expect that various currency codes (3-number)
  # return a currency symbol
  get_currency_str(currency = "230") |>
    expect_equal("Br")

  get_currency_str(currency = "946") |>
    expect_equal("RON")

  get_currency_str(currency = "682") |>
    expect_equal("SR")

  get_currency_str(currency = "90") |>
    expect_equal("SI$")

  # Expect that various common currency names
  # return a currency symbol
  get_currency_str(currency = "pound") |>
    expect_equal("&#163;")

  get_currency_str(currency = "franc") |>
    expect_equal("&#8355;")

  get_currency_str(currency = "guarani") |>
    expect_equal("&#8370;")

  get_currency_str(currency = "hryvnia") |>
    expect_equal("&#8372;")

  # Expect that various currency codes (3-letter) can
  # return a currency code when an HTML entity would
  # otherwise be provided
  get_currency_str(currency = "CAD", fallback_to_code = TRUE) |>
    expect_equal("$")

  get_currency_str(currency = "DKK", fallback_to_code = TRUE) |>
    expect_equal("kr.")

  get_currency_str(currency = "JPY", fallback_to_code = TRUE) |>
    expect_equal("JPY")

  get_currency_str(currency = "RUB", fallback_to_code = TRUE) |>
    expect_equal("RUB")

  # Expect that various currency codes (3-number) can
  # return a currency code when an HTML entity would
  # otherwise be provided
  get_currency_str(currency = "532", fallback_to_code = TRUE) |>
    expect_equal("ANG")

  get_currency_str(currency = 533, fallback_to_code = TRUE) |>
    expect_equal("AWG")

  # Expect that when using common currency names we won't
  # get a currency code when an HTML entity would
  # otherwise be provided
  get_currency_str(currency = "pound", fallback_to_code = TRUE) |>
    expect_equal("&#163;")

  get_currency_str(currency = "franc", fallback_to_code = TRUE) |>
    expect_equal("&#8355;")

  get_currency_str(currency = "guarani", fallback_to_code = TRUE) |>
    expect_equal("&#8370;")

  get_currency_str(currency = "hryvnia", fallback_to_code = TRUE) |>
    expect_equal("&#8372;")

  # Expect the input value when the currency can't be
  # interpreted as a valid currency
  get_currency_str(currency = "thaler") |>
    expect_equal("thaler")
})

test_that("get_currency_exponent() works correctly", {

  # Expect that various currency codes (3-letter)
  # return a currency exponent
  bif_exp <- get_currency_exponent(currency = "BIF")
  expect_equal(bif_exp, 0)

  aed_exp <- get_currency_exponent(currency = "AED")
  expect_equal(aed_exp, 2)

  tnd_exp <- get_currency_exponent(currency = "TND")
  expect_equal(tnd_exp, 3)

  clf_exp <- get_currency_exponent(currency = "CLF")
  # other code
  clf_exp2 <- get_currency_exponent(currency = 990)
  expect_equal(clf_exp, 4)
  expect_equal(clf_exp2, 4)

  # Expect that various currency codes (3-number)
  # return a currency exponent
  awg_exp <- get_currency_exponent(currency = "533")
  expect_equal(awg_exp, 2)

  clp_exp <- get_currency_exponent(currency = "152")
  expect_equal(clp_exp, 0)

  yer_exp <- get_currency_exponent(currency = 886)
  expect_equal(yer_exp, 2)

  # Expect an exponent of 0 if the currency
  # exponent field is NA
  lapply(
    currencies$curr_code[is.na(currencies$exponent)],
    get_currency_exponent) |>
    unlist() |>
    expect_equal(rep(0, 7))
})

test_that("process_text() works correctly", {

  # Create the `simple_text` variable, which is text
  # with the class `character`
  simple_text <- "this is simple text"

  # Create the `md_text` variable, which is markdown text
  # with the class `from_markdown` (via the `md()` helper)
  md_text <- md("this is *text* interpreted as **markdown**")
  expect_s3_class(md_text, "from_markdown")
  expect_type(md_text, "character")

  # Create the `html_text` variable, which is HTML text with
  # the classes `html`/`character` (via the `html()` helper)
  html_text <- html("this is <em>text</em> that's <strong>HTML</strong>")
  expect_s3_class(html_text, "html")
  expect_type(html_text, "character")

  # Expect that text with the class `character` will
  # be returned from `process_text` as is
  processed <- process_text(text = simple_text)
  expect_equal(processed, simple_text)
  expect_type(processed, "character")

  # Expect that text with the class `from_markdown` will
  # be returned from `process_text` as character-based
  # text that's been transformed to HTML

  processed_md <- process_text(text = md_text)
  expect_type(processed_md, "character")
  expect_equal(processed_md, "<span class='gt_from_md'>this is <em>text</em> interpreted as <strong>markdown</strong></span>")

  # Expect that text with the class `html` will
  # be returned from `process_text` as character-based
  # text that's been transformed to HTML
  processed_html <- process_text(text = html_text)
  expect_type(processed_html, "character")
  expect_equal(processed_html, html_text, ignore_attr = TRUE)
})

test_that("apply_pattern_fmt_x() works correctly", {

  # Set formatted values in a character vector
  x <- c("23.4%", "32.6%", "9.15%")

  # Expect that the default pattern `{x}` does not
  # modify the values in `x`
  apply_pattern_fmt_x(pattern = "{x}", values = x) |>
    expect_equal(x)

  # Expect that a pattern that appends literal text
  # will work
  apply_pattern_fmt_x(pattern = "{x}:n", values = x) |>
    expect_equal(paste0(x, ":n"))

  # Expect that a pattern that appends and prepends
  # literal text will work
  apply_pattern_fmt_x(pattern = "+{x}:n", values = x) |>
    expect_equal(paste0("+", x, ":n"))

  # Expect that multiple instances of `{x}` will
  # create copies of `x` within the output strings
  apply_pattern_fmt_x(pattern = "{x}, ({x})", values = x) |>
    expect_equal(paste0(x, ", (", x, ")"))
})

test_that("remove_html() works correctly", {

  # Create the `html_text_1` variable, which is HTML text
  # with the `character` class
  html_text_1 <- "<p>this is <em>text</em> that's <strong>HTML</strong></p>"

  # Create the `html_text_2` variable, which is HTML text
  # with the `html` and `character` classes (via `html()`)
  html_text_2 <- html("this is <em>text</em> that's <strong>HTML</strong>")

  # Expect that the `character` text object has had the
  # HTML tags removed
  html_text_1_removed <- remove_html(html_text_1)
  expect_equal(html_text_1_removed, "this is text that's HTML")

  # Expect that the `character` text object retains the
  # `character` class after transformation
  expect_type(html_text_1_removed, "character")

  # Call `remove_html()` on HTML text that's
  # classed as `html` and `character`
  html_text_2_removed <- remove_html(html_text_2)

  # Expect that the new object retains the html` and
  # `character` classes
  expect_s3_class(html_text_2_removed, "html")
  expect_type(html_text_2_removed, "character")

  # Expect that the HTML tags have been removed from the
  # `html_text_2` string
  html_text_2_removed |> as.character() |>
    expect_equal(remove_html(html_text_1))
})

test_that("as_locations() works correctly", {

  # Define `locations` as a `cells_body` object
  locations <-
    cells_body(
      columns = hp,
      rows = c("Datsun 710", "Valiant")
    )

  # Expect certain structural features for a `locations` object
  expect_length(locations, 2)
  # Each location has length 2
  expect_length(locations[[1]], 2)
  expect_length(locations[[2]], 2)
  expect_s3_class(locations[[1]], c("quosure", "formula"))
  expect_s3_class(locations[[2]], c("quosure", "formula"))

  # Upgrade `locations` to a list of locations
  locations_list <- as_locations(locations)

  # Expect certain structural features for this `locations_list` object
  expect_length(locations_list, 1)
  expect_length(locations_list[[1]], 2)
  expect_s3_class(locations_list[[1]], c("cells_body", "location_cells"))

  # Define locations as a named vector
  locations <-
    c(columns = "hp", rows = c("Datsun 710", "Valiant"))

  # Expect an error with `locations` object structured in this way
  expect_error(as_locations(locations))
})

test_that("process_footnote_marks() works correctly", {

  process_footnote_marks(
    x = 1:10,
    marks = "numbers") |>
    expect_equal(as.character(1:10))

  process_footnote_marks(
    x = as.character(1:10),
    marks = "numbers") |>
    expect_equal(as.character(1:10))

  process_footnote_marks(
    x = 1:10,
    marks = "numbers") |>
    expect_equal(as.character(1:10))

  process_footnote_marks(
    x = 1:10,
    marks = as.character(1:5)) |>
    expect_equal(c("1", "2", "3", "4", "5", "11", "22", "33", "44", "55"))

  process_footnote_marks(
    x = 1:10,
    marks = "letters") |>
    expect_equal(letters[1:10])

  process_footnote_marks(
    x = 1:10,
    marks = letters) |>
    expect_equal(letters[1:10])

  process_footnote_marks(
    x = 1:10,
    marks = "LETTERS") |>
    expect_equal(LETTERS[1:10])

  process_footnote_marks(
    x = 1:10,
    marks = LETTERS) |>
    expect_equal(LETTERS[1:10])

  process_footnote_marks(
    x = 1:10,
    marks = c("⁕", "‖", "†", "§", "¶")) |>
    expect_equal(
      c("\u2055", "‖", "†", "§", "¶",
        "\u2055\u2055", "‖‖", "††", "§§", "¶¶"))
})

test_that("glue_gt() works in a safe manner", {

  lst <- list(a = "foo", b = c("bar", "baz"))

  # Basically works
  expect_identical(
    as.character(glue_gt(lst, "{a}/{b}")),
    c("foo/bar", "foo/baz")
  )
  expect_identical(
    glue_gt(as.data.frame(lst, stringsAsFactors = FALSE), "{a}/{b}") |> as.character(),
    c("foo/bar", "foo/baz")
  )
  expect_identical(
    as.character(glue_gt(dplyr::as_tibble(lst), "{a}/{b}")),
    c("foo/bar", "foo/baz")
  )

  # Treats expressions as symbols
  expect_error(glue_gt(lst, "{a + b}"))
  expect_error(glue_gt(lst, "{print(a)}"))
  expect_error(glue_gt(lst, "{ a }"))
  expect_error(glue_gt(lst, "{`a`}"))

  expect_identical(
    glue_gt(list("a+b" = "foo"), "test {a+b} test") |> as.character(),
    "test foo test"
  )

  # Objects should not be sought in the environment
  z <- "hello"
  expect_error(glue_gt(list(), "{z}"))
  expect_error(glue_gt(list(), "{.Random.seed}"))
  expect_error(glue_gt(list(), "{letters}"))

  expect_identical(glue_gt(list(), "a", "b") |> as.character(), "ab")
})

test_that("check_spanner_id_unique() works properly", {

  gt_tbl_1 <- gt(exibble)

  gt_tbl_2 <-
    gt(exibble) |>
    tab_spanner(label = "a", columns = num)

  gt_tbl_3 <-
    gt(exibble, rowname_col = "row", groupname_col = "group") |>
    tab_spanner(label = "a", columns = c(num, char))

  # Don't expect an error when checking for unique spanner IDs
  # in a gt table with no spanner column labels
  expect_no_error(
    check_spanner_id_unique(data = gt_tbl_1, spanner_id = "a")
  )

  # Expect an error when reusing a spanner ID value (the `label` value
  # is used as the `id` value)
  expect_error(
    check_spanner_id_unique(data = gt_tbl_2, spanner_id = "a")
  )

  # Expect an error if creating a spanner ID that is the same as
  # a column name
  expect_error(
    check_spanner_id_unique(data = gt_tbl_1, spanner_id = "num")
  )
  expect_error(
    check_spanner_id_unique(data = gt_tbl_2, spanner_id = "num")
  )
  expect_error(
    check_spanner_id_unique(data = gt_tbl_2, spanner_id = "num")
  )
  expect_error(
    check_spanner_id_unique(data = gt_tbl_3, spanner_id = "row")
  )
  expect_error(
    check_spanner_id_unique(data = gt_tbl_3, spanner_id = "group")
  )
})

test_that("get_file_ext() returns the correct file extension", {

  expect_equal(get_file_ext("filess.svg"), "svg")
  expect_equal(get_file_ext("filess.svg"), "svg")
  expect_equal(get_file_ext("fi.001.svg"), "svg")
  expect_equal(get_file_ext("fi.01..svg"), "svg")
  expect_equal(get_file_ext("_files.jpg"), "jpg")
  expect_equal(get_file_ext("filess.png"), "png")
  expect_equal(get_file_ext("filess.gif"), "gif")
})

test_that("resolve_secondary_pattern() works properly", {

  # Define function to test input and output of the
  # `resolve_secondary_pattern()` util function
  expect_secondary_pattern <- function(x, expectation) {
    expect_equal(resolve_secondary_pattern(x), expectation)
  }

  # Generate a list of input `x` values and expected output values
  secondary_pattern_tests <-
    list(
      c("<< a >><< b >>", " a  b "),
      c("<< a >><< ::missing_val:: >>", " a "),
      c("<< ::missing_val:: >><< b >>", " b "),
      c("<< ::missing_val:: >><< ::missing_val:: >>", ""),
      c("<<<< ::missing_val:: >><< ::missing_val:: >>>>", ""),
      c("<<a>><<c<< - ::missing_val::>>>>", "ac"),
      c("<<a>><< (c<< - d>>)>>", "a (c - d)"),
      c("<<a>><< (c<< - ::missing_val::>>)>>", "a (c)"),
      c("<<a>><< (::missing_val::<< - d>>)>>", "a"),
      c("<<a>><< (::missing_val::<< - ::missing_val::>>)>>", "a"),
      c("<<::missing_val::>><< (c<< - d>>)>>", " (c - d)"),
      c("<<::missing_val::<< (c<< - d>>)>>>>", ""),
      c("<<>>", ""),
      c("<<>><<>>", ""),
      c("<<a>>", "a"),
      c("<<<>>", "<"),
      c("<<>>>", ">"),
      c("", ""),
      c("a", "a"),
      c("<>", "<>"),
      c(">>a<<", ">>a<<"),
      c("<<<<a>>*::missing_val::*>>", ""),
      c("<<<<*::missing_val::*>> b >>", " b "),
      c("x<< <<a>> <<b>> *::missing_val::*>>y", "xy"),
      c("a<< ::missing_val::/::missing_val::>>b", "ab"),
      c("a ::missing_val:: ::missing_val:: b", "a ::missing_val:: ::missing_val:: b")
    )

  # Iterate through list with `expect_secondary_pattern()` in `lapply()` stmt
  secondary_pattern_tests_out <-
    lapply(
      seq_along(secondary_pattern_tests),
      FUN = function(x) {
        expect_secondary_pattern(
          secondary_pattern_tests[[x]][1],
          secondary_pattern_tests[[x]][2]
        )
      }
    )
})
