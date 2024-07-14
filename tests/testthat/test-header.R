# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
}

test_that("A gt table contains the expected heading components", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains a title
  tbl_html <-
    gt(mtcars_short) %>%
    tab_header(title = "test heading") %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the `table_heading` content is 'test heading'
  tbl_html %>%
    selection_text("[class='gt_heading gt_title gt_font_normal gt_bottom_border']") %>%
    expect_equal("test heading")

  # Expect that the number of rows with `class='gt_row gt_right'` is `5`
  (tbl_html %>%
      selection_text("[class='gt_row gt_right']") %>%
      length()/ncol(mtcars_short)) %>%
    expect_equal(5)

  # Expect that the number of rows with `class='gt_row gt_right gt_striped'` is `0`
  (tbl_html %>%
      selection_text("[class='gt_row gt_right gt_striped']") %>%
      length()/ncol(mtcars_short)) %>%
    expect_equal(0)

  # Create a `gt_tbl` object with `gt()`; this table
  # contains a title and a subtitle
  tbl_html <-
    gt(mtcars_short) %>%
    tab_header(
      title = "test title",
      subtitle = "test subtitle") %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the `table_heading` content is 'test heading'
  tbl_html %>%
    selection_text(selection = "[class='gt_heading gt_title gt_font_normal']") %>%
    expect_equal("test title")

  # Expect that the `table_heading` content is 'test subtitle'
  tbl_html %>%
    selection_text("[class='gt_heading gt_subtitle gt_font_normal gt_bottom_border']") %>%
    expect_equal("test subtitle")

  # Perform a snapshot test where an HTML table contains only a title
  mtcars_short %>%
    gt() %>%
    tab_header(title = "test title") %>%
    render_as_html() %>%
    expect_snapshot()

  # Perform a snapshot test where an HTML table contains a title and a subtitle
  mtcars_short %>%
    gt() %>%
    tab_header(title = "test title", subtitle = "test subtitle") %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that providing a subtitle value with an empty
  # string won't produce a subtitle line
  mtcars_short %>%
    gt() %>%
    tab_header(title = "test title", subtitle = "") %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that providing a subtitle value with a series
  # a space characters also won't produce a subtitle line
  mtcars_short %>%
    gt() %>%
    tab_header(title = "test title", subtitle = "   ") %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect an error if only a subtitle is provided to `tab_header()`
  expect_error(
    mtcars_short %>%
      gt() %>%
      tab_header(subtitle = "test subtitle")
  )
})

test_that("tab_header() works with `md()`/`html()`", {
  tab <- gt(exibble, rowname_col = "row", groupname_col = "group")

  # Expect the rendered title and subtitle to be
  # exactly as provided
  expect_match_html(
    tab_header(tab, title = "Title", subtitle = "Subtitle"),
    c(">Title<", ">Subtitle<")
  )

  # Expect the rendered title and subtitle to be in
  # HTML (through Markdown formatting)
  expect_match_html(
    tab_header(tab, title = md("**Title**"), subtitle = md("**Subtitle**")),
    c("><strong>Title</strong><", "><strong>Subtitle</strong><")
  )

  # Expect the rendered title and subtitle to be in
  # HTML (through HTML formatting)
  html_title <- html("<strong>Title</strong>")
  html_subtitle <-  html("<strong>Subtitle</strong>")
  expect_match_html(
    tab_header(tab, title = html_title, subtitle = html_subtitle),
    c("><strong>Title</strong>", "<strong>Subtitle</strong><")
  )
})

test_that("A table header can be removed using `rm_header()`", {

  # Perform a snapshot test where an HTML table contains a title and a subtitle
  exibble %>%
    gt() %>%
    tab_header(title = "test title", subtitle = "test subtitle") %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that we can remove the title and subtitle with `rm_header()`
  exibble %>%
    gt() %>%
    tab_header(title = "test title", subtitle = "") %>%
    rm_header() %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that removing a header creates a table no different than
  # one never having a header in the table object
  expect_equal(
    exibble %>%
      gt() %>%
      tab_header(title = "test title", subtitle = "test subtitle") %>%
      rm_header() %>%
      render_as_html(),
    exibble %>%
      gt() %>%
      render_as_html()
  )

  # Expect that removing a non-existent header isn't different that
  # never having one in the table object
  expect_equal(
    exibble %>% gt() %>% render_as_html(),
    exibble %>% gt() %>% rm_header() %>% render_as_html()
  )

  # If there isn't a header in the input table the function should
  # return the data without any error
  expect_no_error(
    exibble %>% gt() %>% rm_header()
  )
})
