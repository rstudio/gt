test_that("the `date_formats()` function works correctly", {

  # Expect that the `info_date_style()` function produces an
  # information table with certain classes
  expect_s3_class(date_formats(), c("tbl_df", "tbl", "data.frame"))

  # Expect the tibble to be of specific dimensions
  expect_equal(dim(date_formats()), c(41, 4))

  # Expect the tibble to have specific column names
  expect_equal(
    colnames(date_formats()),
    c("format_number", "format_name", "format_code", "flexible")
  )
})

test_that("the `time_formats()` util fcn works as expected", {

  # Expect that the `info_date_style()` function produces an
  # information table with certain classes
  expect_s3_class(time_formats(), c("tbl_df", "tbl", "data.frame"))

  # Expect the tibble to be of specific dimensions
  expect_equal(dim(time_formats()), c(25, 5))

  # Expect the tibble to have specific column names
  expect_equal(
    colnames(time_formats()),
    c("format_number", "format_name", "format_code", "time_type", "flexible")
  )
})

test_that("the `get_date_format()` function works correctly", {

  # Expect specific `format_code` values for each
  # numeric `date_style` value passed in
  lapply(1:41, get_date_format) %>%
    unlist() %>%
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
  lapply(date_formats()$format_name, get_date_format) %>%
    unlist() %>%
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

test_that("the `get_time_format()` function works correctly", {

  # Expect specific `format_code` values for each
  # numeric `date_style` value passed in
  lapply(1:25, get_time_format) %>%
    unlist() %>%
    expect_equal(
      c(
        "HH:mm:ss", "HH:mm", "h:mm:ss a", "h:mm a", "h a", "Hms", "Hm",
        "H", "EHm", "EHms", "Hmsv", "Hmv", "hms", "hm", "h", "Ehm", "Ehms",
        "EBhms", "Bhms", "EBhm", "Bhm", "Bh", "hmsv", "hmv", "ms"
      )
    )

  # Expect specific `format_code` values for each
  # text-based `date_style` value passed in
  lapply(time_formats()$format_name, get_time_format) %>%
    unlist() %>%
    expect_equal(
      c(
        "HH:mm:ss", "HH:mm", "h:mm:ss a", "h:mm a", "h a", "Hms", "Hm",
        "H", "EHm", "EHms", "Hmsv", "Hmv", "hms", "hm", "h", "Ehm", "Ehms",
        "EBhms", "Bhms", "EBhm", "Bhm", "Bh", "hmsv", "hmv", "ms"
      )
    )
})

test_that("the `validate_currency()` function works correctly", {

  # Expect that specific currency names supplied to
  # `validate_currency()` will all return NULL
  expect_null(
    lapply(currency_symbols$curr_symbol, validate_currency) %>%
      unlist()
  )

  # Expect that invalid currency names supplied to
  # `validate_currency()` will result in an error
  expect_error(lapply(c("thaler", "tetarteron"), validate_currency))


  # Expect that specific currency codes supplied to
  # `validate_currency()` will all return NULL
  expect_null(
    lapply(currencies$curr_code, validate_currency) %>%
      unlist()
  )

  # Expect that invalid currency codes supplied to
  # `validate_currency()` will result in an error
  expect_error(lapply(c("AAA", "ZZZ"), validate_currency))

  # Expect that specific currency codes (3-number)
  # supplied to `validate_currency()` will return NULL
  expect_null(
    lapply(currencies$curr_number, validate_currency) %>%
      unlist()
  )

  expect_null(
    lapply(as.numeric(currencies$curr_number), validate_currency) %>%
      unlist()
  )

  # Expect that invalid currency codes supplied to
  # `validate_currency()` will return an error
  expect_error(lapply(c(999, 998), validate_currency))
})

test_that("the `get_currency_str()` function works correctly", {

  # Expect that various currency codes (3-letter)
  # return a currency symbol
  get_currency_str(currency = "CAD") %>%
    expect_equal("$")

  get_currency_str(currency = "DKK") %>%
    expect_equal("kr.")

  get_currency_str(currency = "JPY") %>%
    expect_equal("&#165;")

  get_currency_str(currency = "RUB") %>%
    expect_equal("&#8381;")

  # Expect that various currency codes (3-number)
  # return a currency symbol
  get_currency_str(currency = "230") %>%
    expect_equal("Br")

  get_currency_str(currency = "946") %>%
    expect_equal("RON")

  get_currency_str(currency = "682") %>%
    expect_equal("SR")

  get_currency_str(currency = "90") %>%
    expect_equal("SI$")

  # Expect that various common currency names
  # return a currency symbol
  get_currency_str(currency = "pound") %>%
    expect_equal("&#163;")

  get_currency_str(currency = "franc") %>%
    expect_equal("&#8355;")

  get_currency_str(currency = "guarani") %>%
    expect_equal("&#8370;")

  get_currency_str(currency = "hryvnia") %>%
    expect_equal("&#8372;")

  # Expect that various currency codes (3-letter) can
  # return a currency code when an HTML entity would
  # otherwise be provided
  get_currency_str(currency = "CAD", fallback_to_code = TRUE) %>%
    expect_equal("$")

  get_currency_str(currency = "DKK", fallback_to_code = TRUE) %>%
    expect_equal("kr.")

  get_currency_str(currency = "JPY", fallback_to_code = TRUE) %>%
    expect_equal("JPY")

  get_currency_str(currency = "RUB", fallback_to_code = TRUE) %>%
    expect_equal("RUB")

  # Expect that various currency codes (3-number) can
  # return a currency code when an HTML entity would
  # otherwise be provided
  get_currency_str(currency = "532", fallback_to_code = TRUE) %>%
    expect_equal("ANG")

  get_currency_str(currency = 533, fallback_to_code = TRUE) %>%
    expect_equal("AWG")

  # Expect that when using common currency names we won't
  # get a currency code when an HTML entity would
  # otherwise be provided
  get_currency_str(currency = "pound", fallback_to_code = TRUE) %>%
    expect_equal("&#163;")

  get_currency_str(currency = "franc", fallback_to_code = TRUE) %>%
    expect_equal("&#8355;")

  get_currency_str(currency = "guarani", fallback_to_code = TRUE) %>%
    expect_equal("&#8370;")

  get_currency_str(currency = "hryvnia", fallback_to_code = TRUE) %>%
    expect_equal("&#8372;")

  # Expect the input value when the currency can't be
  # interpreted as a valid currency
  get_currency_str(currency = "thaler") %>%
    expect_equal("thaler")
})

test_that("the `get_currency_exponent()` function works correctly", {

  # Expect that various currency codes (3-letter)
  # return a currency exponent
  get_currency_exponent(currency = "BIF") %>%
    expect_equal(0)

  get_currency_exponent(currency = "AED") %>%
    expect_equal(2)

  get_currency_exponent(currency = "TND") %>%
    expect_equal(3)

  get_currency_exponent(currency = "CLF") %>%
    expect_equal(4)

  # Expect that various currency codes (3-number)
  # return a currency exponent
  get_currency_exponent(currency = "533") %>%
    expect_equal(2)

  get_currency_exponent(currency = "152") %>%
    expect_equal(0)

  get_currency_exponent(currency = 990) %>%
    expect_equal(4)

  get_currency_exponent(currency = 886) %>%
    expect_equal(2)

  # Expect an exponent of 0 if the currency
  # exponent field is NA
  lapply(
    currencies$curr_code[is.na(currencies$exponent)],
    get_currency_exponent) %>%
    unlist() %>%
    expect_equal(rep(0, 7))
})

test_that("the `process_text()` function works correctly", {

  # Create the `simple_text` variable, which is text
  # with the class `character`
  simple_text <- "this is simple text"

  # Create the `md_text` variable, which is markdown text
  # with the class `from_markdown` (via the `md()` helper)
  md_text <- md("this is *text* interpreted as **markdown**")

  # Create the `html_text` variable, which is HTML text with
  # the classes `html`/`character` (via the `html()` helper)
  html_text <- html("this is <em>text</em> that's <strong>HTML</strong>")

  # Expect that text with the class `character` will
  # be returned from `process_text` as is
  process_text(text = simple_text) %>%
    expect_equal(simple_text)

  simple_text %>% expect_type("character")

  # Expect that text with the class `from_markdown` will
  # be returned from `process_text` as character-based
  # text that's been transformed to HTML
  process_text(text = md_text) %>%
    expect_equal("this is <em>text</em> interpreted as <strong>markdown</strong>")

  md_text %>% expect_s3_class("from_markdown")
  process_text(text = md_text) %>% expect_type("character")

  # Expect that text with the class `html` will
  # be returned from `process_text` as character-based
  # text that's been transformed to HTML
  process_text(text = html_text) %>%
    expect_equal(as.character(html_text))

  html_text %>% expect_s3_class("html")
  html_text %>% expect_type("character")
  process_text(text = html_text) %>% expect_type("character")
})

test_that("the `apply_pattern_fmt_x()` function works correctly", {

  # Set formatted values in a character vector
  x <- c("23.4%", "32.6%", "9.15%")

  # Expect that the default pattern `{x}` does not
  # modify the values in `x`
  apply_pattern_fmt_x(pattern = "{x}", values = x) %>%
    expect_equal(x)

  # Expect that a pattern that appends literal text
  # will work
  apply_pattern_fmt_x(pattern = "{x}:n", values = x) %>%
    expect_equal(paste0(x, ":n"))

  # Expect that a pattern that appends and prepends
  # literal text will work
  apply_pattern_fmt_x(pattern = "+{x}:n", values = x) %>%
    expect_equal(paste0("+", x, ":n"))

  # Expect that multiple instances of `{x}` will
  # create copies of `x` within the output strings
  apply_pattern_fmt_x(pattern = "{x}, ({x})", values = x) %>%
    expect_equal(paste0(x, ", (", x, ")"))
})

test_that("the `remove_html()` function works correctly", {

  # Create the `html_text_1` variable, which is HTML text
  # with the `character` class
  html_text_1 <- "<p>this is <em>text</em> that's <strong>HTML</strong></p>"

  # Create the `html_text_2` variable, which is HTML text
  # with the `html` and `character` classes (via `html()`)
  html_text_2 <- html("this is <em>text</em> that's <strong>HTML</strong>")

  # Expect that the `character` text object has had the
  # HTML tags removed
  remove_html(html_text_1) %>%
    expect_equal("this is text that's HTML")

  # Expect that the `character` text object retains the
  # `character` class after transformation
  remove_html(html_text_1) %>% expect_type("character")

  # Call the `remove_html()` function on HTML text that's
  # classed as `html` and `character`
  html_text_2_removed <- remove_html(html_text_2)

  # Expect that the new object retains the html` and
  # `character` classes
  html_text_2_removed %>% expect_s3_class("html")
  html_text_2_removed %>% expect_type("character")

  # Expect that the HTML tags have been removed from the
  # `html_text_2` string
  html_text_2_removed %>% as.character() %>%
    expect_equal(remove_html(html_text_1))
})

test_that("the `as_locations()` function works correctly", {

  # Define `locations` as a `cells_body` object
  locations <-
    cells_body(
      columns = hp,
      rows = c("Datsun 710", "Valiant")
    )

  # Expect certain structural features for a `locations` object
  locations %>% length() %>% expect_equal(2)
  locations[[1]] %>% length() %>% expect_equal(2)
  locations[[1]] %>% expect_s3_class(c("quosure", "formula"))
  locations[[2]] %>% expect_s3_class(c("quosure", "formula"))

  # Upgrade `locations` to a list of locations
  locations_list <- as_locations(locations)

  # Expect certain structural features for this `locations_list` object
  locations_list %>% length() %>% expect_equal(1)
  locations_list[[1]] %>% length() %>% expect_equal(2)
  locations_list[[1]] %>% expect_s3_class(c("cells_body", "location_cells"))

  # Define locations as a named vector
  locations <-
    c(
      columns = "hp",
      rows = c("Datsun 710", "Valiant"))

  # Expect an error with `locations` object structured in this way
  expect_error(
    as_locations(locations))
})

test_that("the `process_footnote_marks()` function works correctly", {

  process_footnote_marks(
    x = 1:10,
    marks = "numbers") %>%
    expect_equal(as.character(1:10))

  process_footnote_marks(
    x = as.character(1:10),
    marks = "numbers") %>%
    expect_equal(as.character(1:10))

  process_footnote_marks(
    x = 1:10,
    marks = "numbers") %>%
    expect_equal(as.character(1:10))

  process_footnote_marks(
    x = 1:10,
    marks = as.character(1:5)) %>%
    expect_equal(c("1", "2", "3", "4", "5", "11", "22", "33", "44", "55"))

  process_footnote_marks(
    x = 1:10,
    marks = "letters") %>%
    expect_equal(letters[1:10])

  process_footnote_marks(
    x = 1:10,
    marks = letters) %>%
    expect_equal(letters[1:10])

  process_footnote_marks(
    x = 1:10,
    marks = "LETTERS") %>%
    expect_equal(LETTERS[1:10])

  process_footnote_marks(
    x = 1:10,
    marks = LETTERS) %>%
    expect_equal(LETTERS[1:10])

  process_footnote_marks(
    x = 1:10,
    marks = c("⁕", "‖", "†", "§", "¶")) %>%
    expect_equal(
      c("\u2055", "‖", "†", "§", "¶",
        "\u2055\u2055", "‖‖", "††", "§§", "¶¶"))
})

test_that("the `tidy_gsub()/tidy_gsub()` functions work with Unicode chars", {

  expect_true(identical(tidy_sub(".", ".", "\u00B1", fixed = TRUE), "\u00B1"))
  expect_true(identical(tidy_gsub(".", ".", "\u00B1", fixed = TRUE), "\u00B1"))
})

test_that("the `glue_gt()` function works in a safe manner", {

  lst <- list(a = "foo", b = c("bar", "baz"))

  # Basically works
  expect_identical(
    glue_gt(lst, "{a}/{b}") %>% as.character(),
    c("foo/bar", "foo/baz")
  )
  expect_identical(
    glue_gt(as.data.frame(lst, stringsAsFactors = FALSE), "{a}/{b}") %>% as.character(),
    c("foo/bar", "foo/baz")
  )
  expect_identical(
    glue_gt(dplyr::as_tibble(lst), "{a}/{b}") %>% as.character(),
    c("foo/bar", "foo/baz")
  )

  # Treats expressions as symbols
  expect_error(glue_gt(lst, "{a + b}"))
  expect_error(glue_gt(lst, "{print(a)}"))
  expect_error(glue_gt(lst, "{ a }"))
  expect_error(glue_gt(lst, "{`a`}"))

  expect_identical(
    glue_gt(list("a+b" = "foo"), "test {a+b} test") %>% as.character(),
    "test foo test"
  )

  # Objects should not be sought in the environment
  z <- "hello"
  expect_error(glue_gt(list(), "{z}"))
  expect_error(glue_gt(list(), "{.Random.seed}"))
  expect_error(glue_gt(list(), "{letters}"))

  expect_identical(glue_gt(list(), "a", "b") %>% as.character(), "ab")
})

test_that("The `check_spanner_id_unique()` function works properly", {

  gt_tbl_1 <- gt(exibble)

  gt_tbl_2 <-
    gt(exibble) %>%
    tab_spanner(label = "a", columns = num)

  gt_tbl_3 <-
    gt(exibble, rowname_col = "row", groupname_col = "group") %>%
    tab_spanner(label = "a", columns = c(num, char))

  # Don't expect an error when checking for unique spanner IDs
  # in a gt table with no spanner column labels
  expect_error(
    regexp = NA,
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

test_that("the `get_file_ext()` function works correctly", {

  # Expect that filenames with various extensions are
  # work with `get_file_ext()` to return the file extension
  get_file_ext(file = "file.svg") %>% expect_equal("svg")
  get_file_ext(file = "file.001.svg") %>% expect_equal("svg")
  get_file_ext(file = "file.001..svg") %>% expect_equal("svg")
  get_file_ext(file = "_file.jpg") %>% expect_equal("jpg")
  get_file_ext(file = "file.png") %>% expect_equal("png")
  get_file_ext(file = "file.gif") %>% expect_equal("gif")
})

test_that("The `resolve_secondary_pattern()` function works properly", {

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
