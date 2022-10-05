test_that("A table header can be removed using `rm_header()`", {

  exibble %>% gt() %>% tab_header("title", "subtitle")

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
    exibble %>% gt() %>% tab_header(title = "test title", subtitle = "test subtitle") %>% rm_header %>% render_as_html(),
    exibble %>% gt() %>% render_as_html()
  )

  # Expect that removing a non-existent header isn't different that
  # never having one in the table object
  expect_equal(
    exibble %>% gt() %>% render_as_html(),
    exibble %>% gt() %>% rm_header() %>% render_as_html()
  )
})
