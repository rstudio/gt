tab <- gt(exibble, rowname_col = "row", groupname_col = "group")

test_that("tab_header() works with `md()`/`html()`", {

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

test_that("tab_spanner() works with `md()`/`html()`", {

  # Expect the rendered spanner label to be
  # exactly as provided
  expect_match_html(
    tab_spanner(tab, label = "date/time", columns = c(date, time, datetime)),
    ">date/time<"
  )

  # Expect the rendered spanner label to be in
  # HTML (through Markdown formatting)
   expect_match_html(
     tab_spanner(tab, label = md("*date*/*time*"), columns = c(date, time, datetime)),
     "><em>date</em>/<em>time</em><"
  )

  # Expect the rendered spanner label to be in
  # HTML (through HTML formatting)
   expect_match_html(
     tab_spanner(tab, label = html("<em>date</em>/<em>time</em>"), columns = c(date, time, datetime)),
     "><em>date</em>/<em>time</em><"
   )
})

test_that("cols_label() works with `md()`/`html()`", {

    # Expect the rendered column labels to be
    # exactly as provided
    tab2 <-
      tab |>
      tab_spanner(
        label = "date/time",
        columns = c(date, time, datetime)
      ) |>
      cols_label(
        num  = "Number",
        char = "Character",
        fctr = "Factor",
        date = "Date",
        time = "Time",
        datetime = "Date-Time",
        currency = "Currency"
      )

    expect_match_html(
      tab2,
      c(">Number<", ">Character<", ">Factor<", ">Date<", ">Time<", ">Date-Time<", ">Currency<")
    )

    # Expect the rendered column labels to be in
    # HTML (through Markdown formatting)
    tab3 <-
      tab |>
      tab_spanner(
        label = "date/time",
        columns = c(date, time, datetime)
      ) |>
      cols_label(
        num  = md("**Number**"),
        char = md("`Character`"),
        fctr = md("*Factor*"),
        date = md("**Date**"),
        time = md("`Time`"),
        datetime = md("*Date-Time*"),
        currency = md("**Currency**")
      )

    expect_match_html(
      tab3,
      c(
        "><strong>Number</strong><",
        "><code>Character</code><",
        "><em>Factor</em><",
        "><strong>Date</strong><",
        "><code>Time</code><",
        "><em>Date-Time</em><",
        "><strong>Currency</strong><"
        )
    )

    # Expect the rendered column labels to be in
    # HTML (through HTML formatting)
    tab4 <-
      tab |>
      tab_spanner(
        label = "date/time",
        columns = c(date, time, datetime)
      ) |>
      cols_label(
        num  = html("<strong>Number</strong>"),
        char = html("<code>Character</code>"),
        fctr = html("<em>Factor</em>"),
        date = html("<strong>Date</strong>"),
        time = html("<code>Time</code>"),
        datetime = html("<em>Date-Time</em>"),
        currency = html("<strong>Currency</strong>")
      )

    expect_match_html(
      tab4,
      c(
        "><strong>Number</strong><",
        "><code>Character</code><",
        "><em>Factor</em><",
        "><strong>Date</strong><",
        "><code>Time</code><",
        "><em>Date-Time</em><",
        "><strong>Currency</strong><"
        )
    )
})

test_that("tab_footnote() works with `md()`/`html()`", {

  # Expect the rendered footnote to be
  # exactly as provided
  expect_match_html(
    tab_footnote(tab, footnote = "Footnote", locations = cells_body(columns = 1, rows = 1)),
    "Footnote"
  )

  # Expect the rendered foonote to be in
  # HTML (through Markdown formatting)
  expect_match_html(
    tab_footnote(tab, footnote = md("**Footnote**"), locations = cells_body(columns = 1, rows = 1)),
    "<strong>Footnote</strong>"
  )

  # Expect the rendered footnote to be in
  # HTML (through HTML formatting)
  expect_match_html(
    tab_footnote(tab, footnote = html("<strong>Footnote</strong>"), locations = cells_body(columns = 1, rows = 1)),
    "<strong>Footnote</strong>"
  )
})

test_that("tab_source_note() works with `md()`/`html()`", {

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
