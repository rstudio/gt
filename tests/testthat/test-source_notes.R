# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
}

test_that("A gt table contains the expected source note", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains a source note
  tbl_html <-
    gt(mtcars_short) %>%
    tab_source_note(
      source_note = md("*Henderson and Velleman* (1981).")) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the inner HTML content is the source note text
  # with markup provided through the use of `md()`
  tbl_html %>%
    selection_text("[class='gt_sourcenote']") %>%
    expect_equal("Henderson and Velleman (1981).")

  # Add another source note to the `gt_tbl` object
  # Create a `tbl_html` object with `gt()`; this table
  # contains two source notes
  tbl_html <-
    gt(mtcars_short) %>%
    tab_source_note(
      source_note = md("*Henderson and Velleman* (1981).")) %>%
    tab_source_note(
      source_note = "This was in Motor Trend magazine, hence the `mt`.") %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the inner HTML content for the two source notes
  # is available
  tbl_html %>%
    selection_text("[class='gt_sourcenote']") %>%
    expect_equal(c(
      "Henderson and Velleman (1981).",
      "This was in Motor Trend magazine, hence the `mt`."
    ))
})

test_that("tab_source_note() works with `md()`/`html()`", {
  tab <- gt(exibble, rowname_col = "row", groupname_col = "group")
  # Expect the rendered source note to be
  # exactly as provided
  expect_match_html(
    tab_source_note(tab, source_note = "Source Note"),
    "Source Note"
  )

  # Expect the rendered source note to be in
  # HTML (through Markdown formatting)
  expect_match_html(
    tab_source_note(tab, source_note = md("*Source Note*")),
    "<em>Source Note</em>"
  )

  # Expect the rendered source note to be in
  # HTML (through HTML formatting)
  expect_match_html(
    tab_source_note(tab, source_note = html("<em>Source Note</em>")),
    "<em>Source Note</em>"
  )
})

# rm_source_notes() -----------------------------------------------------------
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
  expect_snapshot(error = TRUE, {
    t_sn <- exibble %>%
      gt() %>%
      tab_source_note(source_note = "Source Note 1") %>%
      tab_source_note(source_note = "Source Note 2")

    t_sn %>% rm_source_notes(source_notes = 0:1)
    t_sn %>% rm_source_notes(2:3)
    t_sn %>% rm_source_notes(3)
  })

  expect_no_error(
    exibble %>%
      gt() %>%
      tab_source_note(source_note = "Source Note 1") %>%
      tab_source_note(source_note = "Source Note 2") %>%
      rm_source_notes(source_notes = 1:2)
  )

  # Expect that a select expression that matches nothing will:
  # (1) not error, and
  # (2) return the data untouched (i.e., source notes unaffected)
  expect_no_error(
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
  expect_no_error(
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
