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
  expect_error(
    regexp = NA,
    exibble %>% gt() %>% rm_header()
  )
})

test_that("Stubhead labels can be removed using `rm_stubhead()`", {

  # Perform a snapshot test where an HTML table contains a stub
  # and a corresponding stubhead label
  exibble %>%
    gt(rowname_col = "row") %>%
    tab_stubhead(label = "Stubhead Label") %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that we can remove the stubhead label with `rm_stubhead()`
  exibble %>%
    gt(rowname_col = "row") %>%
    tab_stubhead(label = "Stubhead Label") %>%
    rm_stubhead() %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that removing the stubhead label creates a table no different than
  # one never having the label in the table object
  expect_equal(
    exibble %>%
      gt(rowname_col = "row") %>%
      tab_stubhead(label = "Stubhead Label") %>%
      rm_stubhead() %>%
      render_as_html(),
    exibble %>%
      gt(rowname_col = "row") %>%
      render_as_html()
  )

  # Expect that removing a non-existent stubhead label isn't different that
  # never having one in the table object
  expect_equal(
    exibble %>% gt(rowname_col = "row") %>% render_as_html(),
    exibble %>% gt(rowname_col = "row") %>% rm_stubhead() %>% render_as_html()
  )

  # If there isn't a stubhead label or even a stub in the input table
  # the function should return the data without any error
  expect_error(
    regexp = NA,
    exibble %>% gt(rowname_col = "row") %>% rm_stubhead()
  )
  expect_error(
    regexp = NA,
    exibble %>% gt() %>% rm_stubhead()
  )
})

test_that("Table source notes can be removed using `rm_source_notes()`", {

  # Perform a snapshot test where an HTML table contains two source notes
  exibble %>%
    gt() %>%
    tab_source_note(source_note = "Source Note 1") %>%
    tab_source_note(source_note = "Source Note 2") %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that we can remove both source notes with `rm_source_notes()`
  exibble %>%
    gt() %>%
    tab_source_note(source_note = "Source Note 1") %>%
    tab_source_note(source_note = "Source Note 2") %>%
    rm_source_notes() %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that we can remove the first source note with `rm_source_notes()`
  exibble %>%
    gt() %>%
    tab_source_note(source_note = "Source Note 1") %>%
    tab_source_note(source_note = "Source Note 2") %>%
    rm_source_notes(source_notes = 1) %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that we can remove the second source note with `rm_source_notes()`
  exibble %>%
    gt() %>%
    tab_source_note(source_note = "Source Note 1") %>%
    tab_source_note(source_note = "Source Note 2") %>%
    rm_source_notes(source_notes = 2) %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that we can remove both source notes with `rm_source_notes()`
  # in two different ways
  expect_equal(
    exibble %>%
      gt() %>%
      tab_source_note(source_note = "Source Note 1") %>%
      tab_source_note(source_note = "Source Note 2") %>%
      rm_source_notes() %>%
      render_as_html(),
    exibble %>%
      gt() %>%
      tab_source_note(source_note = "Source Note 1") %>%
      tab_source_note(source_note = "Source Note 2") %>%
      rm_source_notes(source_notes = 1:2) %>%
      render_as_html()
  )

  # Expect an error when providing any integer values that don't correspond
  # with the available source notes ([1, 2])
  expect_error(
    exibble %>%
      gt() %>%
      tab_source_note(source_note = "Source Note 1") %>%
      tab_source_note(source_note = "Source Note 2") %>%
      rm_source_notes(source_notes = 0:1)
  )
  expect_error(
    exibble %>%
      gt() %>%
      tab_source_note(source_note = "Source Note 1") %>%
      tab_source_note(source_note = "Source Note 2") %>%
      rm_source_notes(source_notes = 2:3)
  )
  expect_error(
    exibble %>%
      gt() %>%
      tab_source_note(source_note = "Source Note 1") %>%
      rm_source_notes(source_notes = 2)
  )
  expect_error(
    regexp = NA,
    exibble %>%
      gt() %>%
      tab_source_note(source_note = "Source Note 1") %>%
      tab_source_note(source_note = "Source Note 2") %>%
      rm_source_notes(source_notes = 1:2)
  )

  # Expect that a select expression that matches nothing will:
  # (1) not error, and
  # (2) return the data untouched (i.e., source notes unaffected)
  expect_error(
    regexp = NA,
    exibble %>%
      gt() %>%
      tab_source_note(source_note = "Source Note 1") %>%
      tab_source_note(source_note = "Source Note 2") %>%
      rm_source_notes(source_notes = matches("nothing"))
  )
  expect_equal(
    exibble %>%
      gt() %>%
      tab_source_note(source_note = "Source Note 1") %>%
      tab_source_note(source_note = "Source Note 2") %>%
      rm_source_notes(source_notes = matches("nothing")) %>%
      render_as_html(),
    exibble %>%
      gt() %>%
      tab_source_note(source_note = "Source Note 1") %>%
      tab_source_note(source_note = "Source Note 2") %>%
      render_as_html()
  )

  # If there are no source notes the function should return the
  # data no matter what the input value for `source_notes` is
  expect_error(
    regexp = NA,
    exibble %>%
      gt() %>%
      rm_source_notes(source_notes = 1:100)
  )
  expect_equal(
    exibble %>%
      gt() %>%
      rm_source_notes(source_notes = 1:100) %>%
      render_as_html(),
    exibble %>%
      gt() %>%
      render_as_html()
  )
})
