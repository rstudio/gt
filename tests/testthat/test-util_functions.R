context("Ensuring that the common utility functions work as expected")

test_that("the `date_formats()` function works correctly", {

  # Expect that the `info_date_style()` function produces an
  # information table with certain classes
  expect_is(
    date_formats(),
    c("tbl_df", "tbl", "data.frame"))

  # Expect the tibble to be of specific dimensions
  expect_equal(
    date_formats() %>%
      dim(),
    c(14, 3))

  # Expect the tibble to have specific column names
  expect_equal(
    date_formats() %>%
      colnames(),
    c("format_number", "format_name", "format_code"))
})

test_that("the `time_formats()` util fcn works as expected", {

  # Expect that the `info_date_style()` function produces an
  # information table with certain classes
  expect_is(
    time_formats(),
    c("tbl_df", "tbl", "data.frame"))

  # Expect the tibble to be of specific dimensions
  expect_equal(
    time_formats() %>%
      dim(),
    c(5, 3))

  # Expect the tibble to have specific column names
  expect_equal(
    time_formats() %>%
      colnames(),
    c("format_number", "format_name", "format_code"))
})

test_that("the `get_date_format()` function works correctly", {

  # Expect specific `format_code` values for each
  # numeric `date_style` value passed in
  lapply(1:14, get_date_format) %>%
    unlist() %>%
    expect_equal(
      c("%F", "%A, %B %d, %Y", "%a, %b %d, %Y", "%A %d %B %Y",
        "%B %d, %Y", "%b %d, %Y", "%d %b %Y", "%d %B %Y", "%d %B",
        "%Y", "%B", "%d", "%Y/%m/%d", "%y/%m/%d"))

  # Expect specific `format_code` values for each
  # text-based `date_style` value passed in
  lapply(date_formats()$format_name, get_date_format) %>%
    unlist() %>%
    expect_equal(
      c("%F", "%A, %B %d, %Y", "%a, %b %d, %Y", "%A %d %B %Y",
        "%B %d, %Y", "%b %d, %Y", "%d %b %Y", "%d %B %Y", "%d %B",
        "%Y", "%B", "%d", "%Y/%m/%d", "%y/%m/%d"))
})

test_that("the `get_time_format()` function works correctly", {

  # Expect specific `format_code` values for each
  # numeric `date_style` value passed in
  lapply(1:5, get_time_format) %>%
    unlist() %>%
    expect_equal(
      c("%H:%M:%S", "%H:%M", "%I:%M:%S %P", "%I:%M %P", "%I %P"))

  # Expect specific `format_code` values for each
  # text-based `date_style` value passed in
  lapply(time_formats()$format_name, get_time_format) %>%
    unlist() %>%
    expect_equal(
      c("%H:%M:%S", "%H:%M", "%I:%M:%S %P", "%I:%M %P", "%I %P"))
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

  simple_text %>% expect_is("character")

  # Expect that text with the class `from_markdown` will
  # be returned from `process_text` as character-based
  # text that's been transformed to HTML
  process_text(text = md_text) %>%
    expect_equal("this is <em>text</em> interpreted as <strong>markdown</strong>")

  md_text %>% expect_is("from_markdown")
  process_text(text = md_text) %>% expect_is("character")

  # Expect that text with the class `html` will
  # be returned from `process_text` as character-based
  # text that's been transformed to HTML
  process_text(text = html_text) %>%
    expect_equal(as.character(html_text))

  html_text %>% expect_is(c("html", "character"))
  process_text(text = html_text) %>% expect_is(c("html", "character"))
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
  remove_html(html_text_1) %>% expect_is("character")

  # Call the `remove_html()` function on HTML text that's
  # classed as `html` and `character`
  html_text_2_removed <- remove_html(html_text_2)

  # Expect that the new object retains the html` and
  # `character` classes
  html_text_2_removed %>% expect_is(c("html", "character"))

  # Expect that the HTML tags have been removed from the
  # `html_text_2` string
  html_text_2_removed %>% as.character() %>%
    expect_equal(remove_html(html_text_1))
})

test_that("the `get_css_tbl()` function works correctly", {

  # Get a CSS table from a gt table based on the
  # `mtcars` dataset
  css_tbl <-
    gt(mtcars, rownames_to_stub = TRUE) %>%
    get_css_tbl()

  css_tbl %>% expect_is(c("tbl_df", "tbl", "data.frame"))

  css_tbl %>% dim() %>% expect_equal(c(228, 4))

  css_tbl %>%
    colnames() %>%
    expect_equal(c("selector", "type", "property", "value"))
})

test_that("the `inline_html_styles()` function works correctly", {

  # Create a simple gt table from `mtcars`
  data <- gt(mtcars)

  # Get the CSS tibble and the raw HTML
  css_tbl <- data %>% get_css_tbl()
  html <- data %>% as_raw_html(inline_css = FALSE)

  # Get the inlined HTML using `inline_html_styles()`
  inlined_html <- inline_html_styles(html = html, css_tbl = css_tbl)

  # Expect that certain portions of `inlined_html` have
  # inlined CSS rules
  expect_true(
    grepl(
      paste0(
        "style=\"font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', ",
        "Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', ",
        "'Droid Sans', Arial, sans-serif; display: table; border-collapse: ",
        "collapse; margin-left: auto; margin-right: auto; color: #333333; ",
        "font-size: 16px; font-weight: normal; font-style: normal; ",
        "background-color: #FFFFFF; width: auto; ",
        "border-top-style: solid; border-top-width: 2px; ",
        "border-top-color: #A8A8A8; border-right-style: none; ",
        "border-right-width: 2px; border-right-color: #D3D3D3; ",
        "border-bottom-style: solid; border-bottom-width: 2px; ",
        "border-bottom-color: #A8A8A8; border-left-style: none; ",
        "border-left-width: 2px; border-left-color: #D3D3D3;"
      ),
      inlined_html
    )
  )

  expect_true(
    grepl(
      paste0(
        "padding-top: 8px; padding-bottom: 8px; padding-left: 5px; ",
        "padding-right: 5px; margin: 10px; border-top-style: solid; ",
        "border-top-width: 1px; border-top-color: #D3D3D3; ",
        "border-left-style: none; border-left-width: 1px; ",
        "border-left-color: #D3D3D3; border-right-style: none; ",
        "border-right-width: 1px; border-right-color: #D3D3D3; ",
        "vertical-align: middle; overflow-x: hidden; text-align: right; ",
        "font-variant-numeric: tabular-nums;"
      ),
      inlined_html
    )
  )

  # Augment the gt table with custom styles
  data <-
    data %>%
    tab_style(
      style = cell_text(size = px(10)),
      locations = cells_body(columns = TRUE)
    )

  # Get the CSS tibble and the raw HTML
  css_tbl <- data %>% get_css_tbl()
  html <- data %>% as_raw_html(inline_css = FALSE)

  # Get the inlined HTML using `inline_html_styles()`
  inlined_html <- inline_html_styles(html = html, css_tbl = css_tbl)

  # Expect that the style rule from `tab_style` is a listed value along with
  # the inlined rules derived from the CSS classes
  expect_true(
    grepl(
      paste0(
        "<td style=\"padding-top: 8px; padding-bottom: 8px; ",
        "padding-left: 5px; padding-right: 5px; margin: 10px; ",
        "border-top-style: solid; border-top-width: 1px; ",
        "border-top-color: #D3D3D3; border-left-style: none; ",
        "border-left-width: 1px; border-left-color: #D3D3D3; ",
        "border-right-style: none; border-right-width: 1px; ",
        "border-right-color: #D3D3D3; vertical-align: middle; ",
        "overflow-x: hidden; text-align: right; ",
        "font-variant-numeric: tabular-nums; font-size: 10px;"
      ),
      inlined_html
    )
  )

  # Create a gt table with a custom style in the title and subtitle
  # (left alignment of text)
  data <-
    gt(mtcars) %>%
    tab_header(
      title = "The title",
      subtitle = "The subtitle"
    ) %>%
    tab_style(
      style = cell_text(align = "left"),
      locations = list(
        cells_title(groups = "title"),
        cells_title(groups = "subtitle")
      )
    )

  # Get the CSS tibble and the raw HTML
  css_tbl <- data %>% get_css_tbl()
  html <- data %>% as_raw_html(inline_css = FALSE)

  # Get the inlined HTML using `inline_html_styles()`
  inlined_html <- inline_html_styles(html = html, css_tbl = css_tbl)

  # Expect that the `colspan` attr is preserved in both <th> elements
  # and that the `text-align:left` rule is present
  expect_true(
    grepl("th colspan=\"11\" style=.*?text-align: left;", inlined_html)
  )
})

test_that("the `as_locations()` function works correctly", {

  # Define `locations` as a `cells_body` object
  locations <-
    cells_body(
      columns = vars(hp),
      rows = c("Datsun 710", "Valiant"))

  # Expect certain structural features for a `locations` object
  locations %>% length() %>% expect_equal(2)
  locations[[1]] %>% length() %>% expect_equal(2)
  locations[[1]] %>% expect_is(c("quosure", "formula"))
  locations[[2]] %>% expect_is(c("quosure", "formula"))

  # Upgrade `locations` to a list of locations
  locations_list <- as_locations(locations)

  # Expect certain structural features for this `locations_list` object
  locations_list %>% length() %>% expect_equal(1)
  locations_list[[1]] %>% length() %>% expect_equal(2)
  locations_list[[1]] %>% expect_is(c("cells_body", "location_cells"))

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

