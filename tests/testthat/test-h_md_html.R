tab <-
  exibble %>%
  gt(rowname_col = "row", groupname_col = "group")

test_that("The `tab_header()` function works with `md()`/`html()`", {

  # Expect the rendered title and subtitle to be
  # exactly as provided
  tab %>%
    tab_header(title = "Title", subtitle = "Subtitle") %>%
    render_as_html() %>%
    tidy_grepl(pattern = c(">Title<", ">Subtitle<")) %>%
    all() %>%
    expect_true()

  # Expect the rendered title and subtitle to be in
  # HTML (through Markdown formatting)
  tab %>%
    tab_header(title = md("**Title**"), subtitle = md("**Subtitle**")) %>%
    render_as_html() %>%
    tidy_grepl(
      pattern = c("><strong>Title</strong><", "><strong>Subtitle</strong><")) %>%
    all() %>%
    expect_true()

  # Expect the rendered title and subtitle to be in
  # HTML (through HTML formatting)
  tab %>%
    tab_header(
      title = html("<strong>Title</strong>"),
      subtitle = html("<strong>Subtitle</strong>")
    ) %>%
    render_as_html() %>%
    tidy_grepl(
      pattern = c("><strong>Title</strong>", "<strong>Subtitle</strong><")) %>%
    all() %>%
    expect_true()
})

test_that("The `tab_spanner()` function works with `md()`/`html()`", {

  # Expect the rendered spanner label to be
  # exactly as provided
  tab %>%
    tab_spanner(
      label = "date/time",
      columns = c(date, time, datetime)
    ) %>%
    render_as_html() %>%
    tidy_grepl(pattern = c(">date/time<")) %>%
    expect_true()

  # Expect the rendered spanner label to be in
  # HTML (through Markdown formatting)
  tab %>%
    tab_spanner(
      label = md("*date*/*time*"),
      columns = c(date, time, datetime)
    ) %>%
    render_as_html() %>%
    tidy_grepl(pattern = c("><em>date</em>/<em>time</em><")) %>%
    expect_true()

  # Expect the rendered spanner label to be in
  # HTML (through HTML formatting)
  tab %>%
    tab_spanner(
      label = html("<em>date</em>/<em>time</em>"),
      columns = c(date, time, datetime)
    ) %>%
    render_as_html() %>%
    tidy_grepl(pattern = c("><em>date</em>/<em>time</em><")) %>%
    expect_true()
})

test_that("The `cols_label()` function works with `md()`/`html()`", {

  # Expect the rendered column labels to be
  # exactly as provided
  tab %>%
    tab_spanner(
      label = "date/time",
      columns = c(date, time, datetime)
    ) %>%
    cols_label(
      num  = "Number",
      char = "Character",
      fctr = "Factor",
      date = "Date",
      time = "Time",
      datetime = "Date-Time",
      currency = "Currency"
    ) %>%
    render_as_html() %>%
    tidy_grepl(pattern = c(
      ">Number<",
      ">Character<",
      ">Factor<",
      ">Date<",
      ">Time<",
      ">Date-Time<",
      ">Currency<")
    ) %>%
    all() %>%
    expect_true()

  # Expect the rendered column labels to be in
  # HTML (through Markdown formatting)
  tab %>%
    tab_spanner(
      label = "date/time",
      columns = c(date, time, datetime)
    ) %>%
    cols_label(
      num  = md("**Number**"),
      char = md("`Character`"),
      fctr = md("*Factor*"),
      date = md("**Date**"),
      time = md("`Time`"),
      datetime = md("*Date-Time*"),
      currency = md("**Currency**")
    ) %>%
    render_as_html() %>%
    tidy_grepl(pattern = c(
      "><strong>Number</strong><",
      "><code>Character</code><",
      "><em>Factor</em><",
      "><strong>Date</strong><",
      "><code>Time</code><",
      "><em>Date-Time</em><",
      "><strong>Currency</strong><")
    ) %>%
    all() %>%
    expect_true()

  # Expect the rendered column labels to be in
  # HTML (through HTML formatting)
  tab %>%
    tab_spanner(
      label = "date/time",
      columns = c(date, time, datetime)
    ) %>%
    cols_label(
      num  = html("<strong>Number</strong>"),
      char = html("<code>Character</code>"),
      fctr = html("<em>Factor</em>"),
      date = html("<strong>Date</strong>"),
      time = html("<code>Time</code>"),
      datetime = html("<em>Date-Time</em>"),
      currency = html("<strong>Currency</strong>")
    ) %>%
    render_as_html() %>%
    tidy_grepl(pattern = c(
      "><strong>Number</strong><",
      "><code>Character</code><",
      "><em>Factor</em><",
      "><strong>Date</strong><",
      "><code>Time</code><",
      "><em>Date-Time</em><",
      "><strong>Currency</strong><")
    ) %>%
    all() %>%
    expect_true()
})

test_that("The `tab_footnote()` function works with `md()`/`html()`", {

  # Expect the rendered footnote to be
  # exactly as provided
  tab %>%
    tab_footnote(
      footnote = "Footnote",
      locations = cells_body(columns = 1, rows = 1)
    ) %>%
    render_as_html() %>%
    tidy_grepl(pattern = "Footnote") %>%
    expect_true()

  # Expect the rendered foonote to be in
  # HTML (through Markdown formatting)
  tab %>%
    tab_footnote(
      footnote = md("**Footnote**"),
      locations = cells_body(columns = 1, rows = 1)
    ) %>%
    render_as_html() %>%
    tidy_grepl(pattern = "<strong>Footnote</strong>") %>%
    expect_true()

  # Expect the rendered footnote to be in
  # HTML (through HTML formatting)
  tab %>%
    tab_footnote(
      footnote = html("<strong>Footnote</strong>"),
      locations = cells_body(columns = 1, rows = 1)
    ) %>%
    render_as_html() %>%
    tidy_grepl(pattern = "<strong>Footnote</strong>") %>%
    expect_true()
})

test_that("The `tab_source_note()` function works with `md()`/`html()`", {

  # Expect the rendered source note to be
  # exactly as provided
  tab %>%
    tab_source_note(source_note = "Source Note") %>%
    render_as_html() %>%
    tidy_grepl(pattern = "Source Note") %>%
    expect_true()

  # Expect the rendered source note to be in
  # HTML (through Markdown formatting)
  tab %>%
    tab_source_note(source_note = md("*Source Note*")) %>%
    render_as_html() %>%
    tidy_grepl(pattern = "<em>Source Note</em>") %>%
    expect_true()

  # Expect the rendered source note to be in
  # HTML (through HTML formatting)
  tab %>%
    tab_source_note(source_note = html("<em>Source Note</em>")) %>%
    render_as_html() %>%
    tidy_grepl(pattern = "<em>Source Note</em>") %>%
    expect_true()
})
