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
  expect_no_error(
    exibble %>% gt(rowname_col = "row") %>% rm_stubhead()
  )
  expect_no_error(
    exibble %>% gt() %>% rm_stubhead()
  )
})

test_that("Spanner column labels can be removed using `rm_spanners()`", {

  # Perform a snapshot test where an HTML table contains spanners over
  # two different levels (`1` and `2`)
  gtcars %>%
    dplyr::select(
      -mfr, -trim, bdy_style, drivetrain,
      -drivetrain, -trsmn, -ctry_origin
    ) %>%
    dplyr::slice(1:8) %>%
    gt(rowname_col = "model") %>%
    tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
    tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
    tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
    tab_spanner(
      label = "Performance",
      columns = c(
        hp, hp_rpm, trq, trq_rpm,
        mpg_c, mpg_h
      )
    ) %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that all spanner column labels can be removed with `rm_spanners()`
  gtcars %>%
    dplyr::select(
      -mfr, -trim, bdy_style, drivetrain,
      -drivetrain, -trsmn, -ctry_origin
    ) %>%
    dplyr::slice(1:8) %>%
    gt(rowname_col = "model") %>%
    tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
    tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
    tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
    tab_spanner(
      label = "Performance",
      columns = c(
        hp, hp_rpm, trq, trq_rpm,
        mpg_c, mpg_h
      )
    ) %>%
    rm_spanners() %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that spanners selected via ID can be selectively removed
  gtcars %>%
    dplyr::select(
      -mfr, -trim, bdy_style, drivetrain,
      -drivetrain, -trsmn, -ctry_origin
    ) %>%
    dplyr::slice(1:8) %>%
    gt(rowname_col = "model") %>%
    tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
    tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
    tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
    tab_spanner(
      label = "Performance",
      columns = c(
        hp, hp_rpm, trq, trq_rpm,
        mpg_c, mpg_h
      )
    ) %>%
    rm_spanners(spanners = "HP") %>%
    render_as_html() %>%
    expect_snapshot()

  gtcars %>%
    dplyr::select(
      -mfr, -trim, bdy_style, drivetrain,
      -drivetrain, -trsmn, -ctry_origin
    ) %>%
    dplyr::slice(1:8) %>%
    gt(rowname_col = "model") %>%
    tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
    tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
    tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
    tab_spanner(
      label = "Performance",
      columns = c(
        hp, hp_rpm, trq, trq_rpm,
        mpg_c, mpg_h
      )
    ) %>%
    rm_spanners(spanners = "Torque") %>%
    render_as_html() %>%
    expect_snapshot()

  gtcars %>%
    dplyr::select(
      -mfr, -trim, bdy_style, drivetrain,
      -drivetrain, -trsmn, -ctry_origin
    ) %>%
    dplyr::slice(1:8) %>%
    gt(rowname_col = "model") %>%
    tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
    tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
    tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
    tab_spanner(
      label = "Performance",
      columns = c(
        hp, hp_rpm, trq, trq_rpm,
        mpg_c, mpg_h
      )
    ) %>%
    rm_spanners(spanners = "MPG") %>%
    render_as_html() %>%
    expect_snapshot()

  gtcars %>%
    dplyr::select(
      -mfr, -trim, bdy_style, drivetrain,
      -drivetrain, -trsmn, -ctry_origin
    ) %>%
    dplyr::slice(1:8) %>%
    gt(rowname_col = "model") %>%
    tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
    tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
    tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
    tab_spanner(
      label = "Performance",
      columns = c(
        hp, hp_rpm, trq, trq_rpm,
        mpg_c, mpg_h
      )
    ) %>%
    rm_spanners(spanners = "Performance") %>%
    render_as_html() %>%
    expect_snapshot()

  gtcars %>%
    dplyr::select(
      -mfr, -trim, bdy_style, drivetrain,
      -drivetrain, -trsmn, -ctry_origin
    ) %>%
    dplyr::slice(1:8) %>%
    gt(rowname_col = "model") %>%
    tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
    tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
    tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
    tab_spanner(
      label = "Performance",
      columns = c(
        hp, hp_rpm, trq, trq_rpm,
        mpg_c, mpg_h
      )
    ) %>%
    rm_spanners(spanners = c("HP", "Torque", "MPG")) %>%
    render_as_html() %>%
    expect_snapshot()

  gtcars %>%
    dplyr::select(
      -mfr, -trim, bdy_style, drivetrain,
      -drivetrain, -trsmn, -ctry_origin
    ) %>%
    dplyr::slice(1:8) %>%
    gt(rowname_col = "model") %>%
    tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
    tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
    tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
    tab_spanner(
      label = "Performance",
      columns = c(
        hp, hp_rpm, trq, trq_rpm,
        mpg_c, mpg_h
      )
    ) %>%
    rm_spanners(spanners = c("HP", "Torque", "MPG", "Performance")) %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that all spanner column labels of targeted levels can be
  # removed from the table
  gtcars %>%
    dplyr::select(
      -mfr, -trim, bdy_style, drivetrain,
      -drivetrain, -trsmn, -ctry_origin
    ) %>%
    dplyr::slice(1:8) %>%
    gt(rowname_col = "model") %>%
    tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
    tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
    tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
    tab_spanner(
      label = "Performance",
      columns = c(
        hp, hp_rpm, trq, trq_rpm,
        mpg_c, mpg_h
      )
    ) %>%
    rm_spanners(levels = 1) %>%
    render_as_html() %>%
    expect_snapshot()

  gtcars %>%
    dplyr::select(
      -mfr, -trim, bdy_style, drivetrain,
      -drivetrain, -trsmn, -ctry_origin
    ) %>%
    dplyr::slice(1:8) %>%
    gt(rowname_col = "model") %>%
    tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
    tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
    tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
    tab_spanner(
      label = "Performance",
      columns = c(
        hp, hp_rpm, trq, trq_rpm,
        mpg_c, mpg_h
      )
    ) %>%
    rm_spanners(levels = 2) %>%
    render_as_html() %>%
    expect_snapshot()

  gtcars %>%
    dplyr::select(
      -mfr, -trim, bdy_style, drivetrain,
      -drivetrain, -trsmn, -ctry_origin
    ) %>%
    dplyr::slice(1:8) %>%
    gt(rowname_col = "model") %>%
    tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
    tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
    tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
    tab_spanner(
      label = "Performance",
      columns = c(
        hp, hp_rpm, trq, trq_rpm,
        mpg_c, mpg_h
      )
    ) %>%
    rm_spanners(levels = 1:2) %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that select helpers can be used to target the ID values
  # of the spanner column labels
  expect_equal(
    gtcars %>%
      dplyr::select(
        -mfr, -trim, bdy_style, drivetrain,
        -drivetrain, -trsmn, -ctry_origin
      ) %>%
      dplyr::slice(1:8) %>%
      gt(rowname_col = "model") %>%
      tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
      tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
      tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
      tab_spanner(
        label = "Performance",
        columns = c(
          hp, hp_rpm, trq, trq_rpm,
          mpg_c, mpg_h
        )
      ) %>%
      rm_spanners(spanners = "Performance") %>%
      render_as_html(),
    gtcars %>%
      dplyr::select(
        -mfr, -trim, bdy_style, drivetrain,
        -drivetrain, -trsmn, -ctry_origin
      ) %>%
      dplyr::slice(1:8) %>%
      gt(rowname_col = "model") %>%
      tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
      tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
      tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
      tab_spanner(
        label = "Performance",
        columns = c(
          hp, hp_rpm, trq, trq_rpm,
          mpg_c, mpg_h
        )
      ) %>%
      rm_spanners(spanners = starts_with("Perf")) %>%
      render_as_html()
  )

  # Expect that a select expression that matches nothing will:
  # (1) not error, and
  # (2) return the data untouched (i.e., spanners unaffected)
  expect_no_error(
    gtcars %>%
      dplyr::select(
        -mfr, -trim, bdy_style, drivetrain,
        -drivetrain, -trsmn, -ctry_origin
      ) %>%
      dplyr::slice(1:8) %>%
      gt(rowname_col = "model") %>%
      tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
      tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
      tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
      tab_spanner(
        label = "Performance",
        columns = c(
          hp, hp_rpm, trq, trq_rpm,
          mpg_c, mpg_h
        )
      ) %>%
      rm_spanners(spanners = matches("nothing"))
  )
  expect_equal(
    gtcars %>%
      dplyr::select(
        -mfr, -trim, bdy_style, drivetrain,
        -drivetrain, -trsmn, -ctry_origin
      ) %>%
      dplyr::slice(1:8) %>%
      gt(rowname_col = "model") %>%
      tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
      tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
      tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
      tab_spanner(
        label = "Performance",
        columns = c(
          hp, hp_rpm, trq, trq_rpm,
          mpg_c, mpg_h
        )
      ) %>%
      rm_spanners(spanners = matches("nothing")) %>%
      render_as_html(),
    gtcars %>%
      dplyr::select(
        -mfr, -trim, bdy_style, drivetrain,
        -drivetrain, -trsmn, -ctry_origin
      ) %>%
      dplyr::slice(1:8) %>%
      gt(rowname_col = "model") %>%
      tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
      tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
      tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
      tab_spanner(
        label = "Performance",
        columns = c(
          hp, hp_rpm, trq, trq_rpm,
          mpg_c, mpg_h
        )
      ) %>%
      render_as_html()
  )

  # Expect that `TRUE` has the same effect as `everything()` when used as
  # a value for the `spanners` argument
  expect_equal(
    gtcars %>%
      dplyr::select(
        -mfr, -trim, bdy_style, drivetrain,
        -drivetrain, -trsmn, -ctry_origin
      ) %>%
      dplyr::slice(1:8) %>%
      gt(rowname_col = "model") %>%
      tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
      tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
      tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
      tab_spanner(
        label = "Performance",
        columns = c(
          hp, hp_rpm, trq, trq_rpm,
          mpg_c, mpg_h
        )
      ) %>%
      rm_spanners(spanners = everything()) %>%
      render_as_html(),
    gtcars %>%
      dplyr::select(
        -mfr, -trim, bdy_style, drivetrain,
        -drivetrain, -trsmn, -ctry_origin
      ) %>%
      dplyr::slice(1:8) %>%
      gt(rowname_col = "model") %>%
      tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
      tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
      tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
      tab_spanner(
        label = "Performance",
        columns = c(
          hp, hp_rpm, trq, trq_rpm,
          mpg_c, mpg_h
        )
      ) %>%
      rm_spanners(spanners = TRUE) %>%
      render_as_html()
  )

  # Don't expect an error if targeting levels (in the `levels` arg of
  # `rm_spanners()`) that aren't present
  expect_no_error(
    gtcars %>%
      dplyr::select(
        -mfr, -trim, bdy_style, drivetrain,
        -drivetrain, -trsmn, -ctry_origin
      ) %>%
      dplyr::slice(1:8) %>%
      gt(rowname_col = "model") %>%
      tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
      tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
      tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
      tab_spanner(
        label = "Performance",
        columns = c(
          hp, hp_rpm, trq, trq_rpm,
          mpg_c, mpg_h
        )
      ) %>%
      rm_spanners(levels = 5) %>%
      render_as_html()
  )

  # Do expect an error if the `levels` vector isn't a numeric one
  expect_snapshot(error = TRUE,
    gtcars %>%
      dplyr::select(
        -mfr, -trim, bdy_style, drivetrain,
        -drivetrain, -trsmn, -ctry_origin
      ) %>%
      dplyr::slice(1:8) %>%
      gt(rowname_col = "model") %>%
      tab_spanner(label = "HP", columns = c(hp, hp_rpm)) %>%
      tab_spanner(label = "Torque", columns = c(trq, trq_rpm)) %>%
      tab_spanner(label = "MPG", columns = c(mpg_c, mpg_h)) %>%
      tab_spanner(
        label = "Performance",
        columns = c(
          hp, hp_rpm, trq, trq_rpm,
          mpg_c, mpg_h
        )
      ) %>%
      rm_spanners(levels = "two") %>%
      render_as_html()
  )

  # Expect an error if the `spanners` vector contains ID values that
  # don't exist for any spanner column labels
  expect_snapshot(error = TRUE, {
    t_sp <- exibble %>%
      gt() %>%
      tab_spanner("span1", columns = c(char, fctr))

    rm_spanners(t_sp, "span2")
    rm_spanners(t_sp, c("span1", "span2", "span3"))
  })
})

test_that("Table footnotes can be removed using `rm_footnotes()`", {

  # Perform a snapshot test where an HTML table contains two footnotes
  exibble %>%
    gt() %>%
    tab_footnote(footnote = "Footnote 1", locations = cells_body(1, 1)) %>%
    tab_footnote(footnote = "Footnote 2", locations = cells_body(1, 2)) %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that we can remove both footnotes with `rm_footnotes()`
  exibble %>%
    gt() %>%
    tab_footnote(footnote = "Footnote 1", locations = cells_body(1, 1)) %>%
    tab_footnote(footnote = "Footnote 2", locations = cells_body(1, 2)) %>%
    rm_footnotes() %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that we can remove the first footnote with `rm_footnotes()`
  exibble %>%
    gt() %>%
    tab_footnote(footnote = "Footnote 1", locations = cells_body(1, 1)) %>%
    tab_footnote(footnote = "Footnote 2", locations = cells_body(1, 2)) %>%
    rm_footnotes(footnotes = 1) %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that we can remove the second footnote with `rm_footnotes()`
  exibble %>%
    gt() %>%
    tab_footnote(footnote = "Footnote 1", locations = cells_body(1, 1)) %>%
    tab_footnote(footnote = "Footnote 2", locations = cells_body(1, 2)) %>%
    rm_footnotes(footnotes = 2) %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that we can remove both footnotes with `rm_footnotes()`
  # in two different ways
  expect_equal(
    exibble %>%
      gt() %>%
      tab_footnote(footnote = "Footnote 1", locations = cells_body(1, 1)) %>%
      tab_footnote(footnote = "Footnote 2", locations = cells_body(1, 2)) %>%
      rm_footnotes() %>%
      render_as_html(),
    exibble %>%
      gt() %>%
      tab_footnote(footnote = "Footnote 1", locations = cells_body(1, 1)) %>%
      tab_footnote(footnote = "Footnote 2", locations = cells_body(1, 2)) %>%
      rm_footnotes(footnotes = 1:2) %>%
      render_as_html()
  )

  # Expect an error when providing any integer values that don't correspond
  # with the available footnotes ([1, 2])
  expect_snapshot(error = TRUE,
    exibble %>%
      gt() %>%
      tab_footnote(footnote = "Footnote 1", locations = cells_body(1, 1)) %>%
      rm_footnotes(footnotes = 2)
  )
  # Expect that a select expression that matches nothing will:
  # (1) not error, and
  # (2) return the data untouched (i.e., footnotes unaffected)
  expect_no_error(
    exibble %>%
      gt() %>%
      tab_footnote(footnote = "Footnote 1", locations = cells_body(1, 1)) %>%
      tab_footnote(footnote = "Footnote 2", locations = cells_body(1, 2)) %>%
      rm_footnotes(footnotes = matches("nothing"))
  )
  expect_equal(
    exibble %>%
      gt() %>%
      tab_footnote(footnote = "Footnote 1", locations = cells_body(1, 1)) %>%
      tab_footnote(footnote = "Footnote 2", locations = cells_body(1, 2)) %>%
      rm_footnotes(footnotes = matches("nothing")) %>%
      render_as_html(),
    exibble %>%
      gt() %>%
      tab_footnote(footnote = "Footnote 1", locations = cells_body(1, 1)) %>%
      tab_footnote(footnote = "Footnote 2", locations = cells_body(1, 2)) %>%
      render_as_html()
  )

  # If there are no footnotes the function should return the
  # data no matter what the input value for `footnotes` is
  expect_no_error(
    exibble %>%
      gt() %>%
      rm_footnotes(footnotes = 1:100)
  )
  expect_equal(
    exibble %>%
      gt() %>%
      rm_footnotes(footnotes = 1:100) %>%
      render_as_html(),
    exibble %>%
      gt() %>%
      render_as_html()
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
