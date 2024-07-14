# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
}

# tab_spanner() html ----------------------------------------------------------
test_that("A gt table contains the expected spanner column labels", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains the spanner heading `perimeter` over the
  # `peri` and `shape` column labels
  tbl_html <-
    gt(rock) %>%
    tab_spanner(
      label = "perimeter",
      columns = c("peri", "shape")) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the content is the column heading spanning 2 columns
  # is `perimeter`
  obj_colspan <- tbl_html %>% selection_text("[colspan='2']")
  expect_length(obj_colspan, 1)
  expect_match(obj_colspan, "perimeter")

  # Create a `gt_tbl` object with `gt()`; this table
  # contains the spanner heading `perimeter` over the
  # `peri` and `shape` column labels (this time, using
  # `c()` to define the columns)
  tbl_html <-
    gt(rock) %>%
    tab_spanner(
      label = "perimeter",
      columns = c(peri, shape)) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the content is the column heading spanning 2 columns
  # is `perimeter`
  obj_perimeter <- tbl_html %>%
    selection_text("[class='gt_center gt_columns_top_border gt_column_spanner_outer']")

  expect_length(obj_perimeter, 1)
  expect_match(obj_perimeter, "perimeter")

  # Create a `tbl_html` object with `gt()`; this table
  # contains the spanner heading `perimeter` that is formatted
  # with Markdown via `md()`
  tbl_html <-
    gt(rock) %>%
    tab_spanner(
      label = md("*perimeter*"),
      columns = c("peri", "shape")) %>%
    render_as_html()

  # Expect that the `perimeter` word is wrapped in `<em>` tags
  expect_length(tbl_html, 1)
  expect_match(tbl_html, "<em>perimeter</em>")

  # Create a `tbl_html` object with `gt()`; this table
  # contains the spanner heading `perimeter` that is formatted
  # with HTML via `html()`
  tbl_html <-
    gt(rock) %>%
    tab_spanner(
      label = html("<em>perimeter</em>"),
      columns = c("peri", "shape")) %>%
    render_as_html()

  # Expect that the `perimeter` word is wrapped in `<em>` tags
  expect_length(tbl_html, 1)
  expect_match(tbl_html, "<em>perimeter</em>")

  # Expect an error when using column labels
  # that don't exist
  expect_error(
    gt(rock) %>%
      tab_spanner(
        label = "perimeter",
        columns = c(peris, shapes))
  )

  # Expect an error when using an ID twice
  expect_error(
    gt(exibble) %>%
      tab_spanner(label = "a", columns = num) %>%
      tab_spanner(label = "b", id = "a", columns = char)
  )
})

test_that("tab_spanner() exclusively uses IDs for arranging spanners", {

  tbl_html_1 <-
    dplyr::tibble(A_X = c(1), B_X = c(2), A_Y = c(3), B_Y = c(4)) %>%
    gt() %>%
    tab_spanner(label = "A", id = "a", columns = ends_with("X"), gather = FALSE) %>%
    tab_spanner(label = "A", id = "b", columns = ends_with("Y"), gather = FALSE) %>%
    tab_style(
      style = cell_fill("green"),
      locations = cells_column_spanners(spanners = "a")
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that there are two spanners and both have the
  # label `"A"`, span 2 columns each, with one background
  # color set to green
  tbl_html_1 %>%
    selection_text("[class='gt_column_spanner']") %>%
    expect_equal(c("A", "A"))

  tbl_html_1 %>%
    selection_value("colspan") %>%
    expect_equal(c("2", "2", "1", "1", "1", "1"))

  tbl_html_1 %>%
    selection_value("style") %>%
    expect_equal("background-color: #00FF00;")

  tbl_html_2 <-
    dplyr::tibble(A_X = c(1), B_X = c(2), A_Y = c(3), B_Y = c(4)) %>%
    gt() %>%
    tab_spanner(label = "Z", id = "a", columns = starts_with("A"), gather = FALSE) %>%
    tab_spanner(label = "Z", id = "b", columns = starts_with("B"), gather = FALSE) %>%
    tab_style(
      style = cell_fill("green"),
      locations = cells_column_spanners(spanners = "a")
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that there are four spanners (with two IDs, both
  # discontinguous) and both have the label `"Z"`, with one background
  # color set to green (in the odd cells)
  tbl_html_2 %>%
    selection_text("[class='gt_column_spanner']") %>%
    expect_equal(c("Z", "Z", "Z", "Z"))

  tbl_html_2 %>%
    selection_value("colspan") %>%
    expect_equal(rep("1", 8))

  tbl_html_2 %>%
    selection_value("style") %>%
    expect_equal(rep("background-color: #00FF00;", 2))

  tbl_html_3 <-
    dplyr::tibble(A_X = c(1), B_X = c(2), A_Y = c(3), B_Y = c(4)) %>%
    gt() %>%
    tab_spanner(label = "Z", id = "a", columns = starts_with("A"), gather = FALSE) %>%
    tab_spanner(label = "Z", id = "b", columns = starts_with("B"), gather = FALSE) %>%
    tab_style(
      style = cell_fill("green"),
      locations = cells_column_spanners(spanners = "b")
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that there are four spanners (with two IDs, both
  # discontinguous) and both have the label `"Z"`, with one background
  # color set to green (in the even cells)
  tbl_html_3 %>%
    selection_text("[class='gt_column_spanner']") %>%
    expect_equal(c("Z", "Z", "Z", "Z"))

  tbl_html_3 %>%
    selection_value("colspan") %>%
    expect_equal(rep("1", 8))

  tbl_html_3 %>%
    selection_value("style") %>%
    expect_equal(rep("background-color: #00FF00;", 2))
})

test_that("tab_spanner() doesn't adversely affect column alignment", {

  tbl_html <-
    gt(airquality) %>%
    cols_move_to_start(columns = c(Month, Day)) %>%
    cols_label(Solar.R = html("Solar<br>Radiation")) %>%
    tab_spanner(
      label = "Measurement Period",
      columns = c(Month, Day)
    ) %>%
    render_as_html()

  # Expect that all column labels (which are originally of the numeric
  # and integer classes) are aligned to the right (i.e., all have the
  # `gt_right` CSS class) even though a spanner is present above the
  # `Month` and `Day` columns
  tbl_html %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("Ozone", "SolarRadiation", "Wind", "Temp", "Month", "Day"))
})

test_that("tab_spanner() works even when columns are forcibly moved", {

  # Create a table with column spanners, moving the `carb` value
  # to the beginning of the column sequence (splitting the `group_d`
  # column spanner into two parts)
  tbl_html <-
    gt(mtcars[1, ]) %>%
    tab_spanner(
      label = md("*group_a*"),
      columns = c(cyl, hp)
    ) %>%
    tab_spanner(
      label = md("*group_b*"),
      columns = c(drat, wt)
    ) %>%
    tab_spanner(
      label = md("*group_c*"),
      columns = c(qsec, vs, am)
    ) %>%
    tab_spanner(
      label = md("*group_d*"),
      columns = c(gear, carb)
    ) %>%
    tab_spanner(
      label = md("*never*"),
      columns = ends_with("nothing")
    ) %>%
    cols_move_to_start(columns = carb) %>%
    render_as_html()


  # Expect the sequence of `colspan` values across both
  # <tr>s in <thead> is correct
  tbl_html %>%
    xml2::read_html() %>%
    selection_value("colspan") %>%
    expect_equal(
      c("1", "1", "2", "1", "2", "3", "1",           # first <tr>
        "1", "1", "1", "1", "1", "1", "1", "1", "1"  # second <tr>
      )
    )
})

test_that("tab_spanner() works with `md()`/`html()`", {
  tab <- gt(exibble, rowname_col = "row", groupname_col = "group")

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

# Test tab_spanner_delim() html ------------------------------------------------
test_that("tab_spanner_delim() works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; split the column
  # names into spanner headings and column labels
  tbl_html <-
    gt(iris_short) %>%
    tab_spanner_delim(delim = ".")

  # Expect a particular ordering of column labels in `_boxh`
  tbl_html %>%
    dt_boxhead_get() %>%
    .$column_label %>%
    unlist() %>%
    expect_equal(c("Length", "Width", "Length", "Width", "Species"))

  # Expect a particular ordering of spanner labels in `_spanners`
  tbl_html %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal(c("Sepal", "Petal"))

  # Expect that the columns with a colspan of `2` have the same
  # ordering in the rendered table
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='2']") %>%
    rvest::html_text() %>%
    expect_match("Sepal|Petal")

  # Expect that the columns with a colspan of `1` have the same
  # ordering in the rendered table
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='1']") %>%
    rvest::html_text() %>%
    expect_equal(c("Species", "Length", "Width", "Length", "Width"))

  # Create a `tbl_html` object with `gt()`; split the column
  # names into spanner headings and column labels, this time
  # ensuring that the non-default `split` option (`"first"`) will
  # result splitting spanner names from the LHS
  tbl_html_first <-
    gt(iris_short) %>%
    tab_spanner_delim(delim = ".", split = "first")

  # Expect the same table as with the `split = "last"` (default) option
  expect_equal(
    tbl_html_first %>% render_as_html(),
    tbl_html %>% render_as_html()
  )

  # Create a `tbl_html` object with `gt()`; split the column
  # names into spanner headings and column labels but constrain
  # the splitting only to the `Sepal.Length` and `Sepal.Width` columns
  tbl_html <-
    gt(iris_short) %>%
    tab_spanner_delim(
      columns = c("Sepal.Length", "Sepal.Width"),
      delim = "."
    )

  # Expect a particular ordering of spanner labels in `_spanners`
  tbl_html %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal("Sepal")

  # Expect that the columns with a colspan of `2` have the same
  # ordering in the rendered table
  colspan2 <- tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='2']") %>%
    rvest::html_text()

  expect_length(colspan2, 1)
  expect_match(colspan2, "Sepal")

  # Expect that the columns with a colspan of `1` have the same
  # ordering in the rendered table
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='1']") %>%
    rvest::html_text() %>%
    expect_equal(c("Petal.Length", "Petal.Width", "Species", "Length", "Width"))

  # Create a `tbl_html` object with `gt()`; split the column
  # names into spanner headings and column labels but constrain
  # the splitting only to the `Sepal.Length` and `Sepal.Width`
  # columns using `c()`
  tbl_html <-
    gt(iris_short) %>%
    tab_spanner_delim(
      delim = ".",
      columns = c(Sepal.Length, Sepal.Width)
    )

  # Expect a particular ordering of spanner labels in `_spanners`
  tbl_html %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal("Sepal")

  # Expect that the columns with a colspan of `2` have the same
  # ordering in the rendered table
  colspan2 <- tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='2']") %>%
    rvest::html_text()

  expect_length(colspan2, 1)
  expect_match(colspan2, "Sepal")


  # Expect that the columns with a colspan of `1` have the same
  # ordering in the rendered table
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='1']") %>%
    rvest::html_text() %>%
    expect_equal(
      c("Petal.Length", "Petal.Width", "Species", "Length", "Width")
    )

  tbl_a <- dplyr::tibble(A_X = 1, B_X = 2, A_Y = 3, B_Y = 4)
  tbl_b <- dplyr::tibble(A_X = 1, B_X = 2, A_Y = 3, B_Y = 4, Z = 5)
  tbl_c <- dplyr::tibble(Z = 0.5, A_X = 1, B_X = 2, A_Y = 3, B_Y = 4)

  tbl_html_1 <-
    gt(tbl_a) %>%
    tab_spanner_delim(delim = "_")

  tbl_html_1 %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal(c("A", "B", "A", "B"))

  tbl_html_1 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_column_spanner']") %>%
    rvest::html_text() %>%
    expect_equal(c("A", "B", "A", "B"))

  tbl_html_1 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("X", "X", "Y", "Y"))

  tbl_html_2 <-
    gt(tbl_b) %>%
    tab_spanner_delim(delim = "_")

  tbl_html_2 %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal(c("A", "B", "A", "B"))

  tbl_html_2 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_column_spanner']") %>%
    rvest::html_text() %>%
    expect_equal(c("A", "B", "A", "B"))

  tbl_html_2 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("Z", "X", "X", "Y", "Y"))

  tbl_html_2 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_row gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("1", "2", "3", "4", "5"))

  tbl_html_3 <-
    gt(tbl_c) %>%
    tab_spanner_delim(delim = "_")

  tbl_html_3 %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal(c("A", "B", "A", "B"))

  tbl_html_3 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_column_spanner']") %>%
    rvest::html_text() %>%
    expect_equal(c("A", "B", "A", "B"))

  tbl_html_3 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("Z", "X", "X", "Y", "Y"))

  tbl_html_3 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_row gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("0.5", "1", "2", "3", "4"))

  # Expect no change if the delimiter isn't present in any of the
  # targeted column names
  expect_equal(
    gt(iris_short) %>%
      tab_spanner_delim(delim = "_") %>%
      render_as_html(),
    gt(iris_short) %>%
      render_as_html()
  )

  # Expect an error if an invalid delimiter specification is used; here
  # we use strings that aren't at least a single character (and, in some cases,
  # vectors with lengths not equal to one)
  expect_error(
    gt(iris_short) %>%
      tab_spanner_delim(delim = "")
  )
  expect_error(
    gt(iris_short) %>%
      tab_spanner_delim(delim = c(".", "."))
  )
  expect_error(
    gt(iris_short) %>%
      tab_spanner_delim(delim = character(0L))
  )
  expect_no_error(
    gt(iris_short) %>%
      tab_spanner_delim(delim = ".")
  )

  # Expect an error if the `split` value isn't one of two keywords
  expect_error(
    gt(iris_short) %>%
      tab_spanner_delim(delim = "_", split = "yes")
  )
  expect_error(
    gt(iris_short) %>%
      tab_spanner_delim(delim = "_", split = NULL)
  )
  expect_no_error(
    gt(iris_short) %>%
      tab_spanner_delim(delim = "_", split = c("last", "first"))
  )
  expect_no_error(
    gt(iris_short) %>%
      tab_spanner_delim(delim = "_", split = "last")
  )
  expect_no_error(
    gt(iris_short) %>%
      tab_spanner_delim(delim = "_", split = "first")
  )

  # Expect an error if an invalid limit specification is used; here
  # we use values that aren't a single integer in the acceptable range
  expect_error(
    gt(iris_short) %>%
      tab_spanner_delim(delim = ".", limit = TRUE)
  )
  expect_error(
    gt(iris_short) %>%
      tab_spanner_delim(delim = ".", limit = "1")
  )
  expect_error(
    gt(iris_short) %>%
      tab_spanner_delim(delim = ".", limit = -1)
  )
  expect_error(
    gt(iris_short) %>%
      tab_spanner_delim(delim = ".", limit = 0)
  )
  expect_error(
    gt(iris_short) %>%
      tab_spanner_delim(delim = ".", limit = 1.5)
  )
  expect_no_error(
    gt(iris_short) %>%
      tab_spanner_delim(delim = ".", limit = 1.0)
  )
  expect_no_error(
    gt(iris_short) %>%
      tab_spanner_delim(delim = ".", limit = 2)
  )
  # Expect that `limit = Inf` causes a downstream error
  expect_error(
    gt(iris_short) %>%
      tab_spanner_delim(delim = ".", limit = Inf)
  )
})

test_that("tab_spanner_delim() works with different `limit` values", {

  # Create a `tbl_html` object with `gt()`; split the column
  # names into spanner headings and column labels, ensure that
  # the non-default `split` option (`"first"`) is used in conjunction
  # with `limit = 1`
  tbl_html_first_1 <-
    towny %>%
    dplyr::slice_max(population_2021, n = 5) %>%
    dplyr::select(name, ends_with("pct")) %>%
    gt() %>%
    tab_spanner_delim(delim = "_", split = "first", limit = 1)

  tbl_html_first_1 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='1']") %>%
    rvest::html_text() %>%
    expect_equal(
      c(
        "name",
        "change_1996_2001_pct",
        "change_2001_2006_pct",
        "change_2006_2011_pct",
        "change_2011_2016_pct",
        "change_2016_2021_pct"
      )
    )

  # Expect no difference if constraining to columns where the columns
  # have the expected delimiter
  expect_equal(
    towny %>%
      dplyr::slice_max(population_2021, n = 5) %>%
      dplyr::select(name, ends_with("pct")) %>%
      gt() %>%
      tab_spanner_delim(
        delim = "_",
        split = "first",
        limit = 1
      ) %>%
      render_as_html(),
    towny %>%
      dplyr::slice_max(population_2021, n = 5) %>%
      dplyr::select(name, ends_with("pct")) %>%
      gt() %>%
      tab_spanner_delim(
        columns = starts_with("pop"),
        delim = "_",
        split = "first",
        limit = 1
      ) %>%
      render_as_html()
  )

  # Use a `limit` value of `2`
  tbl_html_first_2 <-
    towny %>%
    dplyr::slice_max(population_2021, n = 5) %>%
    dplyr::select(name, ends_with("pct")) %>%
    gt() %>%
    tab_spanner_delim(delim = "_", split = "first", limit = 2)

  tbl_html_first_2 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='1']") %>%
    rvest::html_text() %>%
    expect_equal(
      c(
        "",
        "name",
        "1996_2001_pct",
        "2001_2006_pct",
        "2006_2011_pct",
        "2011_2016_pct",
        "2016_2021_pct"
      )
    )

  # Use a `limit` value of `3`
  tbl_html_first_3 <-
    towny %>%
    dplyr::slice_max(population_2021, n = 5) %>%
    dplyr::select(name, ends_with("pct")) %>%
    gt() %>%
    tab_spanner_delim(delim = "_", split = "first", limit = 3)

  tbl_html_first_3 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='1']") %>%
    rvest::html_text() %>%
    expect_equal(
      c(
        "",
        "",
        "name",
        "\n        1996\n      ",
        "\n        2001\n      ",
        "\n        2006\n      ",
        "\n        2011\n      ",
        "\n        2016\n      ",
        "2001_pct",
        "2006_pct",
        "2011_pct",
        "2016_pct",
        "2021_pct"
      )
    )

  # Use a `limit` value of `4`
  tbl_html_first_4 <-
    towny %>%
    dplyr::slice_max(population_2021, n = 5) %>%
    dplyr::select(name, ends_with("pct")) %>%
    gt() %>%
    tab_spanner_delim(delim = "_", split = "first", limit = 4)

  tbl_html_first_4 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='1']") %>%
    rvest::html_text() %>%
    expect_equal(
      c(
        "",
        "",
        "",
        "\n        1996\n      ",
        "\n        2001\n      ",
        "\n        2006\n      ",
        "\n        2011\n      ",
        "\n        2016\n      ",
        "name",
        "\n        2001\n      ",
        "\n        2006\n      ",
        "\n        2011\n      ",
        "\n        2016\n      ",
        "\n        2021\n      ",
        "pct",
        "pct",
        "pct",
        "pct",
        "pct"
      )
    )

  # Expect no difference if setting a limit higher than 4 for
  # these column names (i.e., going beyond the max number of splits)
  expect_equal(
    towny %>%
      dplyr::slice_max(population_2021, n = 5) %>%
      dplyr::select(name, ends_with("pct")) %>%
      gt() %>%
      tab_spanner_delim(
        delim = "_",
        split = "first",
        limit = 4
      ) %>%
      render_as_html(),
    towny %>%
      dplyr::slice_max(population_2021, n = 5) %>%
      dplyr::select(name, ends_with("pct")) %>%
      gt() %>%
      tab_spanner_delim(
        delim = "_",
        split = "first",
        limit = 5
      ) %>%
      render_as_html()
  )

  # Create a `tbl_html` object with `gt()`; split the column
  # names into spanner headings and column labels, use the
  # default `split` option (`"last"`) in conjunction with `limit = 1`
  tbl_html_last_1 <-
    towny %>%
    dplyr::slice_max(population_2021, n = 5) %>%
    dplyr::select(name, ends_with("pct")) %>%
    gt() %>%
    tab_spanner_delim(delim = "_", limit = 1)

  tbl_html_last_1 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='1']") %>%
    rvest::html_text() %>%
    expect_equal(
      c(
        "name",
        "\n        pop_change_1996_2001\n      ",
        "\n        pop_change_2001_2006\n      ",
        "\n        pop_change_2006_2011\n      ",
        "\n        pop_change_2011_2016\n      ",
        "\n        pop_change_2016_2021\n      ",
        "pct", "pct", "pct", "pct", "pct"
      )
    )

  # Expect no difference if constraining to columns where the columns
  # have the expected delimiter
  expect_equal(
    towny %>%
      dplyr::slice_max(population_2021, n = 5) %>%
      dplyr::select(name, ends_with("pct")) %>%
      gt() %>%
      tab_spanner_delim(
        delim = "_",
        limit = 1
      ) %>%
      render_as_html(),
    towny %>%
      dplyr::slice_max(population_2021, n = 5) %>%
      dplyr::select(name, ends_with("pct")) %>%
      gt() %>%
      tab_spanner_delim(
        columns = starts_with("pop"),
        delim = "_",
        limit = 1
      ) %>%
      render_as_html()
  )

  # Use a `limit` value of `2`
  tbl_html_last_2 <-
    towny %>%
    dplyr::slice_max(population_2021, n = 5) %>%
    dplyr::select(name, ends_with("pct")) %>%
    gt() %>%
    tab_spanner_delim(delim = "_", limit = 2)

  tbl_html_last_2 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='1']") %>%
    rvest::html_text() %>%
    expect_equal(
      c(
        "",
        "\n        pop_change_1996\n      ",
        "\n        pop_change_2001\n      ",
        "\n        pop_change_2006\n      ",
        "\n        pop_change_2011\n      ",
        "\n        pop_change_2016\n      ",
        "name",
        "\n        2001\n      ",
        "\n        2006\n      ",
        "\n        2011\n      ",
        "\n        2016\n      ",
        "\n        2021\n      ",
        "pct", "pct", "pct", "pct", "pct"
      )
    )

  # Use a `limit` value of `3`
  tbl_html_last_3 <-
    towny %>%
    dplyr::slice_max(population_2021, n = 5) %>%
    dplyr::select(name, ends_with("pct")) %>%
    gt() %>%
    tab_spanner_delim(delim = "_", limit = 3)

  tbl_html_last_3 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='1']") %>%
    rvest::html_text() %>%
    expect_equal(
      c(
        "",
        "",
        "\n        1996\n      ",
        "\n        2001\n      ",
        "\n        2006\n      ",
        "\n        2011\n      ",
        "\n        2016\n      ",
        "name",
        "\n        2001\n      ",
        "\n        2006\n      ",
        "\n        2011\n      ",
        "\n        2016\n      ",
        "\n        2021\n      ",
        "pct", "pct", "pct", "pct", "pct"
      )
    )

  # Use a `limit` value of `4`
  tbl_html_last_4 <-
    towny %>%
    dplyr::slice_max(population_2021, n = 5) %>%
    dplyr::select(name, ends_with("pct")) %>%
    gt() %>%
    tab_spanner_delim(delim = "_", limit = 4)

  tbl_html_last_4 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='1']") %>%
    rvest::html_text() %>%
    expect_equal(
      c(
        "",
        "",
        "",
        "\n        1996\n      ",
        "\n        2001\n      ",
        "\n        2006\n      ",
        "\n        2011\n      ",
        "\n        2016\n      ",
        "name",
        "\n        2001\n      ",
        "\n        2006\n      ",
        "\n        2011\n      ",
        "\n        2016\n      ",
        "\n        2021\n      ",
        "pct",
        "pct",
        "pct",
        "pct",
        "pct"
      )
    )

  # Expect no difference if setting a limit higher than 4 for
  # these column names (i.e., going beyond the max number of splits)
  expect_equal(
    towny %>%
      dplyr::slice_max(population_2021, n = 5) %>%
      dplyr::select(name, ends_with("pct")) %>%
      gt() %>%
      tab_spanner_delim(
        delim = "_",
        limit = 4
      ) %>%
      render_as_html(),
    towny %>%
      dplyr::slice_max(population_2021, n = 5) %>%
      dplyr::select(name, ends_with("pct")) %>%
      gt() %>%
      tab_spanner_delim(
        delim = "_",
        limit = 5
      ) %>%
      render_as_html()
  )
})

test_that("tab_spanner_delim() works on higher-order spanning", {

  tbl_1 <-
    dplyr::tibble(
      span_1.A.X = 1,
      span_1.B.X = 2,
      span_2.A.Y = 3,
      span_2.B.Y = 4
    )

  gt_tbl_1 <-
    gt(tbl_1) %>%
    tab_spanner_delim(delim = ".")

  # Take snapshots of `gt_tbl_1`
  gt_tbl_1 %>% render_as_html() %>% expect_snapshot()

  tbl_2 <-
    dplyr::tibble(
      span_1.A.X = 1,
      span_1.B.X = 2,
      A.Y = 3,
      B.Y = 4
    )

  gt_tbl_2 <-
    gt(tbl_2) %>%
    tab_spanner_delim(delim = ".")

  # Take snapshots of `gt_tbl_2`
  gt_tbl_2 %>% render_as_html() %>% expect_snapshot()

  tbl_3 <-
    dplyr::tibble(
      span_1.A = 1,
      span_1.B.X = 2,
      A = 3,
      B.Y = 4
    )

  gt_tbl_3 <-
    gt(tbl_3) %>%
    tab_spanner_delim(delim = ".")

  # Take snapshots of `gt_tbl_3`
  gt_tbl_3 %>% render_as_html() %>% expect_snapshot()

  tbl_4 <-
    dplyr::tibble(
      all.A.W = 1,
      all.B.X = 2,
      all.A.Y = 3,
      all.B.Z = 4
    )

  gt_tbl_4 <-
    gt(tbl_4) %>%
    tab_spanner_delim(delim = ".")

  # Take snapshots of `gt_tbl_4`
  gt_tbl_4 %>% render_as_html() %>% expect_snapshot()

  tbl_5 <-
    dplyr::tibble(
      all.W.A = 1,
      all.X.B = 2,
      all.Y.A = 3,
      all.Z.B = 4
    )

  gt_tbl_5a <-
    gt(tbl_5) %>%
    tab_spanner_delim(delim = ".")

  # Take snapshot of `gt_tbl_5a`
  gt_tbl_5a %>% render_as_html() %>% expect_snapshot()

  gt_tbl_5b <-
    gt(tbl_5) %>%
    tab_spanner_delim(
      delim = ".",
      columns = c(all.W.A, all.X.B)
    )

  # Take snapshot of `gt_tbl_5b`
  gt_tbl_5b %>% render_as_html() %>% expect_snapshot()

  gt_tbl_5c <-
    gt(tbl_5) %>%
    tab_spanner_delim(
      delim = ".",
      columns = c(all.W.A, all.Z.B)
    )

  # Take snapshot of `gt_tbl_5c`
  gt_tbl_5c %>% render_as_html() %>% expect_snapshot()

  # Generate a table with delimiters that are composed of several characters
  # and are asymmetric with regard to the ordering of characters
  tbl_5m <-
    dplyr::tibble(
      all__1W__1A = 1,
      all__1X__1B = 2,
      all__1Y__1A = 3,
      all__1Z__1B = 4
    )

  gt_tbl_5m_a <-
    gt(tbl_5m) %>%
    tab_spanner_delim(delim = "__1", split = "last")

  # Take snapshot of `gt_tbl_5m_a`
  gt_tbl_5m_a %>% render_as_html() %>% expect_snapshot()

  gt_tbl_5m_b <-
    gt(tbl_5m) %>%
    tab_spanner_delim(delim = "__1", split = "first")

  # Take snapshot of `gt_tbl_5m_b`
  gt_tbl_5m_b %>% render_as_html() %>% expect_snapshot()

  gt_tbl_5m_c <-
    gt(tbl_5m) %>%
    tab_spanner_delim(delim = "__1", split = "first", limit = 1)

  # Take snapshot of `gt_tbl_5m_c`
  gt_tbl_5m_c %>% render_as_html() %>% expect_snapshot()

  gt_tbl_5m_d <-
    gt(tbl_5m) %>%
    tab_spanner_delim(delim = "__1", split = "first", limit = 2)

  # Take snapshot of `gt_tbl_5m_d`
  gt_tbl_5m_d %>% render_as_html() %>% expect_snapshot()

  gt_tbl_5m_e <-
    gt(tbl_5m) %>%
    tab_spanner_delim(delim = "__1", split = "last", limit = 1)

  # Take snapshot of `gt_tbl_5m_e`
  gt_tbl_5m_e %>% render_as_html() %>% expect_snapshot()

  gt_tbl_5m_f <-
    gt(tbl_5m) %>%
    tab_spanner_delim(delim = "__1", split = "last", limit = 2)

  # Take snapshot of `gt_tbl_5m_f`
  gt_tbl_5m_f %>% render_as_html() %>% expect_snapshot()

  gt_tbl_5m_g <-
    gt(tbl_5m) %>%
    tab_spanner_delim(delim = "__1", split = "last", limit = 2, reverse = TRUE)

  # Take snapshot of `gt_tbl_5m_g`
  gt_tbl_5m_g %>% render_as_html() %>% expect_snapshot()

  gt_tbl_5m_h <-
    gt(tbl_5m) %>%
    tab_spanner_delim(delim = "__1", split = "first", limit = 2, reverse = TRUE)

  # Take snapshot of `gt_tbl_5m_h`
  gt_tbl_5m_h %>% render_as_html() %>% expect_snapshot()

  gt_tbl_5m_i <-
    gt(tbl_5m) %>%
    tab_spanner_delim(delim = "__1", split = "last", limit = 1, reverse = TRUE)

  # Take snapshot of `gt_tbl_5m_i`
  gt_tbl_5m_i %>% render_as_html() %>% expect_snapshot()

  gt_tbl_5m_j <-
    gt(tbl_5m) %>%
    tab_spanner_delim(delim = "__1", split = "first", limit = 1, reverse = TRUE)

  # Take snapshot of `gt_tbl_5m_j`
  gt_tbl_5m_j %>% render_as_html() %>% expect_snapshot()


  #
  # Combinations of `tab_spanner_delim()` and `tab_spanner()` to
  # generate otherwise tricky spanner constructions
  #

  gt_tbl_spanner_1 <-
    gt_tbl_5c %>%
    tab_spanner(
      label = "ALL ABOVE",
      columns = everything(),
      spanners = everything()
    )

  # Take snapshots of `gt_tbl_spanner_1`
  gt_tbl_spanner_1 %>% render_as_html() %>% expect_snapshot()

  gt_tbl_spanner_2 <-
    gt_tbl_spanner_1 %>%
    tab_spanner(
      label = "SUSPENDED",
      columns = c(all.X.B, all.Y.A),
      level = 2
    )

  # Take snapshots of `gt_tbl_spanner_2`
  gt_tbl_spanner_2 %>% render_as_html() %>% expect_snapshot()

  gt_tbl_spanner_3 <-
    gt_tbl_spanner_2 %>%
    tab_spanner(
      label = "INFILL",
      columns = c(all.X.B, all.Y.A),
      level = 1
    )

  # Take snapshots of `gt_tbl_spanner_3`
  gt_tbl_spanner_3 %>% render_as_html() %>% expect_snapshot()

  # Expect that a replacement of a spanner won't work
  # because `replace = FALSE` by default
  expect_error(
    gt_tbl_spanner_3 %>%
      tab_spanner(
        label = md("**REPLACED**"),
        spanners = everything(),
        level = 3
      )
  )

  gt_tbl_spanner_4 <-
    gt_tbl_spanner_3 %>%
    tab_spanner(
      label = md("**REPLACED**"),
      spanners = everything(),
      level = 3,
      replace = TRUE
    )

  # Take snapshots of `gt_tbl_spanner_4`
  gt_tbl_spanner_4 %>% render_as_html() %>% expect_snapshot()

  gt_tbl_spanner_5 <-
    gt_tbl_spanner_4 %>%
    tab_spanner(
      label = md("**_Above It All_**"),
      spanners = everything()
    )

  # Take snapshots of `gt_tbl_spanner_5`
  gt_tbl_spanner_5 %>% render_as_html() %>% expect_snapshot()

  #
  # Equivalent ways to implicitly express the same spanner
  #

  gt_tbl_spanner_A_1 <-
    gt_tbl_1 %>%
    tab_spanner(
      label = "Data", columns = everything()
    )

  # Take snapshots of `gt_tbl_spanner_A_1`
  gt_tbl_spanner_A_1 %>% render_as_html() %>% expect_snapshot()

  gt_tbl_spanner_A_2 <-
    gt_tbl_1 %>%
    tab_spanner(
      label = "Data", spanners = everything()
    )

  # Take snapshots of `gt_tbl_spanner_A_1`
  gt_tbl_spanner_A_2 %>% render_as_html() %>% expect_snapshot()

  expect_equal(
    gt_tbl_spanner_A_1 %>% render_as_html(),
    gt_tbl_spanner_A_2 %>% render_as_html()
  )

  #
  # Highly specific placements of spanners
  #

  # These won't work because `replace = FALSE` by default
  expect_error(
    gt_tbl_spanner_A_1 %>%
      tab_spanner(
        label = "Cut In",
        columns = 1,
        level = 3
      )
  )
  expect_error(
    gt_tbl_spanner_A_1 %>%
      tab_spanner(
        label = "Cut In",
        columns = c(1, 2),
        level = 3
      )
  )
  expect_error(
    gt_tbl_spanner_A_1 %>%
      tab_spanner(
        label = "Cut In",
        columns = c(1, 2, 3),
        level = 3
      )
  )
  expect_error(
    gt_tbl_spanner_A_1 %>%
      tab_spanner(
        label = "Cut In",
        columns = c(1, 2, 3, 4),
        level = 3
      )
  )

  gt_tbl_spanner_B <-
    gt_tbl_spanner_A_1 %>%
    tab_spanner(
      label = "Cut In",
      columns = c(1, 2),
      level = 3,
      replace = TRUE
    )

  # Take snapshots of `gt_tbl_spanner_B`
  gt_tbl_spanner_B %>% render_as_html() %>% expect_snapshot()

  gt_tbl_spanner_C <-
    gt_tbl_spanner_B %>%
    tab_spanner(
      label = "Cut Across",
      columns = c(span_1.B.X, span_2.A.Y)
    ) %>%
    cols_width(everything() ~ px(80)) %>%
    cols_align(align = "center", columns = everything())

  # Take snapshots of `gt_tbl_spanner_C`
  gt_tbl_spanner_C %>% render_as_html() %>% expect_snapshot()

  gt_tbl_spanner_D <-
    gt_tbl_spanner_C %>%
    cols_move_to_start(columns = 3:4)

  # Take snapshots of `gt_tbl_spanner_D`
  gt_tbl_spanner_D %>% render_as_html() %>% expect_snapshot()

  #
  # Splitting direction
  #

  tbl_1 <-
    dplyr::tibble(
      span_1.A.X = 1,
      span_1.B.X = 2,
      span_2.A.Y = 3,
      span_2.B.Y = 4
    )

  gt_tbl_1 <-
    gt(tbl_1) %>%
    tab_spanner_delim(delim = ".", split = "last")

  # Take snapshots of `gt_tbl_1`
  gt_tbl_1 %>% render_as_html() %>% expect_snapshot()

  tbl_1_rev <-
    dplyr::tibble(
      X.A.span_1 = 1,
      X.B.span_1 = 2,
      Y.A.span_2 = 3,
      Y.B.span_2 = 4
    )

  gt_tbl_1_rev <-
    gt(tbl_1_rev) %>%
    tab_spanner_delim(delim = ".", split = "first")

  # Take snapshots of `gt_tbl_1_rev`
  gt_tbl_1_rev %>% render_as_html() %>% expect_snapshot()


  tbl_6 <-
    dplyr::tibble(
      A.B.C.D.E = 1,
      A.B.C.D = 2,
      A.B.C = 3,
      A.B = 4,
      A = 5
    )

  gt_tbl_6_first <-
    gt(tbl_6) %>%
    tab_spanner_delim(delim = ".", split = "first")

  # Take snapshot of `gt_tbl_6_first`
  gt_tbl_6_first %>% render_as_html() %>% expect_snapshot()

  gt_tbl_6_last <-
    gt(tbl_6) %>%
    tab_spanner_delim(delim = ".", split = "last")

  # Take snapshot of `gt_tbl_6_last`
  gt_tbl_6_last %>% render_as_html() %>% expect_snapshot()

  gt_tbl_6_first_rev <-
    gt(tbl_6) %>%
    tab_spanner_delim(delim = ".", split = "first", reverse = TRUE)

  # Take snapshot of `gt_tbl_6_first_rev`
  gt_tbl_6_first_rev %>% render_as_html() %>% expect_snapshot()

  # Expect an error should a `id` value be reused (here,
  # it's `"**Z**"` that's used twice)
  expect_error(
    gt_tbl_6_last %>%
      tab_spanner(label = md("**Z**"), columns = 5, level = 4) %>%
      tab_spanner(label = md("**Z**"), columns = 5, level = 3)
  )

  gt_tbl_6_z <-
    gt_tbl_6_last %>%
    tab_spanner(label = md("**Z**"), columns = 5, level = 4, id = "Z4") %>%
    tab_spanner(label = md("**Z**"), columns = 5, level = 3, id = "Z3") %>%
    tab_spanner(label = md("**Z**"), columns = 5, level = 2, id = "Z2") %>%
    tab_spanner(label = md("**Z**"), columns = 5, level = 1, id = "Z1")

  # Take snapshot of `gt_tbl_6_z`
  gt_tbl_6_z %>% render_as_html() %>% expect_snapshot()

  # A replacement of an spanner with the same `id` doesn't work (even
  # though the duplicated ID does not result in duplicate IDs afterward)
  expect_error(
    gt_tbl_6_z %>%
      tab_spanner(
        label = md("**Y**"),
        columns = 5,
        level = 4,
        id = "Z4",
        replace = TRUE
      )
  )

  # Moving to a unique ID works
  gt_tbl_6_yzzz <-
    gt_tbl_6_z %>%
    tab_spanner(
      label = md("**Y**"),
      columns = 5,
      level = 4,
      id = "Y4",
      replace = TRUE
    )

  # Take snapshot of `gt_tbl_6_yzzz`
  gt_tbl_6_yzzz %>% render_as_html() %>% expect_snapshot()


  tbl_7 <-
    dplyr::tibble(
      A..B..C..D..E = 1,
      A..B..C..D = 2,
      A..B..C = 3,
      A..B = 4,
      A = 5
    )

  gt_tbl_7a <-
    gt(tbl_7) %>%
    tab_spanner_delim(delim = ".", split = "first")

  gt_tbl_7b <-
    gt(tbl_7) %>%
    tab_spanner_delim(delim = ".", split = "last")

  gt_tbl_7c <-
    gt(tbl_7) %>%
    tab_spanner_delim(delim = ".", split = "first", limit = 20)

  gt_tbl_7d <-
    gt(tbl_7) %>%
    tab_spanner_delim(delim = ".", split = "last", limit = 20)

  # Take snapshot of `gt_tbl_7a`
  gt_tbl_7a %>% render_as_html() %>% expect_snapshot()

  # Expect all tables to be the same
  expect_equal(
    gt_tbl_7a %>% render_as_html(),
    gt_tbl_7b %>% render_as_html()
  )
  expect_equal(
    gt_tbl_7a %>% render_as_html(),
    gt_tbl_7c %>% render_as_html()
  )
  expect_equal(
    gt_tbl_7a %>% render_as_html(),
    gt_tbl_7d %>% render_as_html()
  )


  tbl_8 <-
    dplyr::tibble(
      .A..B..C..D..E. = 1,
      .A..B..C..D. = 2,
      .A..B..C. = 3,
      .A..B. = 4,
      .A. = 5
    )

  gt_tbl_8a <-
    gt(tbl_8) %>%
    tab_spanner_delim(delim = ".", split = "first")

  gt_tbl_8b <-
    gt(tbl_8) %>%
    tab_spanner_delim(delim = ".", split = "last")

  gt_tbl_8c <-
    gt(tbl_8) %>%
    tab_spanner_delim(delim = ".", split = "first", limit = 20)

  gt_tbl_8d <-
    gt(tbl_8) %>%
    tab_spanner_delim(delim = ".", split = "last", limit = 20)

  # Take snapshot of `gt_tbl_8a`
  gt_tbl_8a %>% render_as_html() %>% expect_snapshot()

  # Expect all tables to be the same
  expect_equal(
    gt_tbl_8a %>% render_as_html(),
    gt_tbl_8b %>% render_as_html()
  )
  expect_equal(
    gt_tbl_8a %>% render_as_html(),
    gt_tbl_8c %>% render_as_html()
  )
  expect_equal(
    gt_tbl_8a %>% render_as_html(),
    gt_tbl_8d %>% render_as_html()
  )


  tbl_9 <-
    dplyr::tibble(
      `__` = 1,
      A__B__C__D = 2,
      `__A__B__C__` = 3,
      `A__B__` = 4,
      `__A__` = 5
    )

  gt_tbl_9a <-
    gt(tbl_9) %>%
    tab_spanner_delim(delim = "_", split = "first")

  gt_tbl_9b <-
    gt(tbl_9) %>%
    tab_spanner_delim(delim = "_", split = "last")

  gt_tbl_9c <-
    gt(tbl_9) %>%
    tab_spanner_delim(delim = "_", split = "first", limit = 20)

  gt_tbl_9d <-
    gt(tbl_9) %>%
    tab_spanner_delim(delim = "_", split = "last", limit = 20)

  # Take snapshot of `gt_tbl_9a`
  gt_tbl_9a %>% render_as_html() %>% expect_snapshot()

  # Expect all tables to be the same
  expect_equal(
    gt_tbl_9a %>% render_as_html(),
    gt_tbl_9b %>% render_as_html()
  )
  expect_equal(
    gt_tbl_9a %>% render_as_html(),
    gt_tbl_9c %>% render_as_html()
  )
  expect_equal(
    gt_tbl_9a %>% render_as_html(),
    gt_tbl_9d %>% render_as_html()
  )
})

test_that("tab_spanner_delim() works with complex splits", {

  # Create a gt table with two levels of spanners that repeat
  gt_tbl <-
    dplyr::tibble(
      a.i.x = "",
      b.i.x = "",
      a.j.x = "",
      b.j.x = "",
      a.i.y = "",
      b.i.y = "",
      a.j.y = "",
      b.j.y = "",
      a.i.z = "",
      b.i.z = "",
      a.j.z = "",
      b.j.z = ""
    ) %>%
    gt()

  # Ensure that `tab_spanner_delim()` doesn't fail with
  # either of the `split` options
  expect_no_error(
    gt_tbl %>%
      tab_spanner_delim(
        delim = ".",
        split = "first"
      )
  )
  expect_no_error(
    gt_tbl %>%
      tab_spanner_delim(
        delim = ".",
        split = "last"
      )
  )
  expect_no_error(
    gt_tbl %>%
      tab_spanner_delim(
        delim = ".",
        split = "first",
        reverse = TRUE
      )
  )
  expect_no_error(
    gt_tbl %>%
      tab_spanner_delim(
        delim = ".",
        split = "last",
        reverse = TRUE
      )
  )

  #
  # Ensure that the generated IDs correctly increments their index
  # values where appropriate
  #

  reverse_delim <-
    gt_tbl %>%
    tab_spanner_delim(
      delim = ".",
      reverse = TRUE
    )

  expect_equal(
    reverse_delim$`_spanners`$spanner_id,
    c(
      "spanner-i.a", "spanner-j.a", "spanner:1-i.a", "spanner:1-j.a",
      "spanner:2-i.a", "spanner:2-j.a", "spanner-x.i.a", "spanner-y.i.a",
      "spanner-z.i.a"
    )
  )

  last_delim <-
    gt_tbl %>%
    tab_spanner_delim(
      delim = ".",
      split = "last"
    )

  expect_equal(
    last_delim$`_spanners`$spanner_id,
    c(
      "spanner-i.x", "spanner-j.x", "spanner-i.y", "spanner-j.y",
      "spanner-i.z", "spanner-j.z", "spanner-a.i.x", "spanner-b.i.x",
      "spanner-a.j.x", "spanner-b.j.x", "spanner-a.i.y", "spanner-b.i.y",
      "spanner-a.j.y", "spanner-b.j.y", "spanner-a.i.z", "spanner-b.i.z",
      "spanner-a.j.z", "spanner-b.j.z"
    )
  )
})

test_that("tab_spanner_delim() won't overwrite any set column labels", {

  tbl_1 <-
    iris_short %>%
    gt() %>%
    cols_label(Sepal.Width = md("Sepal.*W*idth")) %>%
    tab_spanner_delim(".")

  tbl_2 <-
    iris_short %>%
    gt() %>%
    tab_spanner_delim(".") %>%
    cols_label(Sepal.Width = md("Sepal.*W*idth"))

  expect_equal(
    tbl_1 %>% render_as_html(),
    tbl_2 %>% render_as_html()
  )

  tbl_3 <-
    iris_short %>%
    gt() %>%
    cols_label(Sepal.Width = html("<em>Sepal.Width</em>")) %>%
    tab_spanner_delim(".")

  tbl_4 <-
    iris_short %>%
    gt() %>%
    tab_spanner_delim(".") %>%
    cols_label(Sepal.Width = html("<em>Sepal.Width</em>"))

  expect_equal(
    tbl_3 %>% render_as_html(),
    tbl_4 %>% render_as_html()
  )

  data_tbl <-
    dplyr::tibble(
      A.B.C.D.E = 1,
      A.B.C.D = 2,
      A.B.C = 3,
      A.B = 4,
      A = 5
    )

  gt_tbl_reverse_1 <-
    gt(data_tbl) %>%
    cols_label(A.B.C.D.E = "ABCDE") %>%
    tab_spanner_delim(delim = ".", reverse = TRUE)

  gt_tbl_reverse_2 <-
    gt(data_tbl) %>%
    tab_spanner_delim(delim = ".", reverse = TRUE) %>%
    cols_label(A.B.C.D.E = "ABCDE")

  expect_equal(
    gt_tbl_reverse_1 %>% render_as_html(),
    gt_tbl_reverse_2 %>% render_as_html()
  )

  gt_tbl_last_1 <-
    gt(data_tbl) %>%
    cols_label(A.B.C.D.E = "ABCDE") %>%
    tab_spanner_delim(delim = ".", split = "last")

  gt_tbl_last_2 <-
    gt(data_tbl) %>%
    tab_spanner_delim(delim = ".", split = "last") %>%
    cols_label(A.B.C.D.E = "ABCDE")

  expect_equal(
    gt_tbl_last_1 %>% render_as_html(),
    gt_tbl_last_2 %>% render_as_html()
  )
})

# rm_spanners() ----------------------------------------------------------------

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
  expect_error(
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


# test spanner helpers ---------------------------------------------------------
test_that("dt_spanners_print_matrix() works correctly", {

  # Expect that a table with no spanners declared will generate
  # a spanner matrix that only has column names
  expect_equal(
    exibble %>%
      gt() %>%
      dt_spanners_print_matrix(),
    {
      mat <- matrix(colnames(exibble), nrow = 1)
      colnames(mat) <- colnames(exibble)
      mat
    }
  )

  # Expect that the `ids = TRUE` setting will have
  # no effect in this case
  expect_equal(
    exibble %>%
      gt() %>%
      dt_spanners_print_matrix(ids = TRUE),
    {
      mat <- matrix(colnames(exibble), nrow = 1)
      colnames(mat) <- colnames(exibble)
      mat
    }
  )

  # Hiding columns should have no effect on the spanner matrix (i.e., it
  # will show all vars regardless of visibility)
  expect_equal(
    exibble %>%
      gt() %>%
      cols_hide(columns = char) %>%
      dt_spanners_print_matrix(),
    {
      mat <- matrix(colnames(exibble), nrow = 1)
      colnames(mat) <- colnames(exibble)
      mat
    }
  )

  # Hidden columns will affect the spanner matrix if `include_hidden`
  # is FALSE
  expect_equal(
    exibble %>%
      gt() %>%
      cols_hide(columns = char) %>%
      dt_spanners_print_matrix(include_hidden = FALSE),
    {
      mat <- matrix(base::setdiff(colnames(exibble), "char"), nrow = 1)
      colnames(mat) <- base::setdiff(colnames(exibble), "char")
      mat
    }
  )

  # Using `omit_columns_rows = TRUE` on a table with no spanners
  # will return a 0-row matrix (with the correct number of columns)
  expect_equal(
    exibble %>% gt() %>% dt_spanners_print_matrix(omit_columns_row = TRUE),
    {
      mat <- matrix(colnames(exibble), nrow = 1)
      colnames(mat) <- colnames(exibble)
      mat[-1, ]
    }
  )

  # Using `omit_columns_rows = TRUE` on a table with no spanners
  # will return a 0-row matrix (with the correct number of columns);
  # here we hide a column and ask for `dt_spanners_print_matrix()` not
  # to show hidden columns
  expect_equal(
    exibble %>%
      gt() %>%
      cols_hide(columns = char) %>%
      dt_spanners_print_matrix(omit_columns_row = TRUE, include_hidden = FALSE),
    {
      mat <- matrix(base::setdiff(colnames(exibble), "char"), nrow = 1)
      colnames(mat) <- base::setdiff(colnames(exibble), "char")
      mat[-1, ]
    }
  )

  # With actual spanners, we must be sure to build the table with
  # `build_data()` (here, using `"html"` as the `context`)

  # Build a spanner matrix that has a spanner appearing immediately
  # over the `num`, `char`, and `fctr` columns
  #
  #      num       char      fctr      date   time   datetime   currency   row   group
  # [1,] "spanner" "spanner" "spanner" NA     NA     NA         NA         NA    NA
  # [2,] "num"     "char"    "fctr"    "date" "time" "datetime" "currency" "row" "group"

  expect_equal(
    exibble %>%
      gt() %>%
      tab_spanner(label = "spanner", columns = c(num, char, fctr)) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(),
    structure(
      c(
        "spanner", "num", "spanner", "char", "spanner", "fctr",
        NA, "date", NA, "time", NA, "datetime", NA, "currency", NA, "row",
        NA, "group"
      ),
      .Dim = c(2L, 9L),
      .Dimnames = list(
        NULL,
        c(
          "num", "char", "fctr", "date", "time", "datetime",
          "currency", "row", "group"
        )
      )
    )
  )

  # Build a spanner matrix that has a spanner appearing immediately
  # over the `num`, `char`, and `fctr` columns; use the `ids = TRUE` option
  #
  #      num          char         fctr         date   time   datetime   currency   row   group
  # [1,] "spanner-id" "spanner-id" "spanner-id" NA     NA     NA         NA         NA    NA
  # [2,] "num"        "char"       "fctr"       "date" "time" "datetime" "currency" "row" "group"

  expect_equal(
    exibble %>%
      gt() %>%
      tab_spanner(
        label = "spanner",
        columns = c(num, char, fctr),
        id = "spanner-id"
      ) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(ids = TRUE),
    structure(
      c(
        "spanner-id", "num", "spanner-id", "char", "spanner-id", "fctr",
        NA, "date", NA, "time", NA, "datetime", NA, "currency", NA, "row",
        NA, "group"
      ),
      .Dim = c(2L, 9L),
      .Dimnames = list(
        NULL,
        c(
          "num", "char", "fctr", "date", "time", "datetime",
          "currency", "row", "group"
        )
      )
    )
  )

  # Build a spanner matrix that has a spanner appearing immediately
  # over the `num`, `char`, and `fctr` columns, hide the `char` column
  # and only show the visible columns in the spanner matrix
  #
  #      num       fctr      date   time   datetime   currency   row   group
  # [1,] "spanner" "spanner" NA     NA     NA         NA         NA    NA
  # [2,] "num"     "fctr"    "date" "time" "datetime" "currency" "row" "group"

  expect_equal(
    exibble %>%
      gt() %>%
      tab_spanner(
        label = "spanner",
        columns = c(num, char, fctr),
        id = "spanner-id"
      ) %>%
      cols_hide(columns = char) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE),
    structure(
      c(
        "spanner", "num", "spanner", "fctr", NA, "date", NA, "time", NA,
        "datetime", NA, "currency", NA, "row", NA, "group"
      ),
      .Dim = c(2L, 8L),
      .Dimnames = list(
        NULL,
        c(
          "num", "fctr", "date", "time", "datetime",
          "currency", "row", "group"
        )
      )
    )
  )

  # Build a spanner matrix that has a spanner appearing immediately
  # over the `num`, `char`, and `fctr` columns, hide all of these columns
  # and only show the visible columns in the spanner matrix
  #
  #      date   time   datetime   currency   row   group
  # [1,] "date" "time" "datetime" "currency" "row" "group"

  expect_equal(
    exibble %>%
      gt() %>%
      tab_spanner(
        label = "spanner",
        columns = c(num, char, fctr),
        id = "spanner-id"
      ) %>%
      cols_hide(columns = c(num, char, fctr)) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE),
    structure(
      c("date", "time", "datetime", "currency", "row", "group"),
      .Dim = c(1L, 6L),
      .Dimnames = list(
        NULL,
        c("date", "time", "datetime", "currency", "row", "group")
      )
    )
  )

  # Build a spanner matrix that has spanner appearing immediately
  # over the `num`, `char`, and `fctr` columns; have another spanner
  # that goes over those columns plus `date` and `time`; hide the
  # `num`, `char`, and `fctr` columns and only expect a single spanner
  # (on level 1) to appear over `date` and `time` in the spanner matrix
  #
  #      date       time       datetime   currency   row   group
  # [1,] "spanner2" "spanner2" NA         NA         NA    NA
  # [2,] "date"     "time"     "datetime" "currency" "row" "group"

  expect_equal(
    exibble %>%
      gt() %>%
      tab_spanner(
        label = "spanner",
        columns = c(num, char, fctr),
        id = "spanner-id"
      ) %>%
      tab_spanner(
        label = "spanner2",
        columns = c(num, char, fctr, date, time),
        id = "spanner-id-2"
      ) %>%
      cols_hide(columns = c(num, char, fctr)) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE),
    structure(
      c(
        "spanner2", "date", "spanner2", "time", NA, "datetime",
        NA, "currency", NA, "row", NA, "group"
      ),
      .Dim = c(2L, 6L),
      .Dimnames = list(
        NULL,
        c("date", "time", "datetime", "currency", "row", "group")
      )
    )
  )

  # Expect that variations that use combinations of `columns`
  # and `spanners` should having matching spanner matrices
  expect_equal(
    exibble %>%
      gt() %>%
      tab_spanner(
        label = "spanner",
        columns = c(num, char, fctr),
        id = "spanner-id"
      ) %>%
      tab_spanner(
        label = "spanner2",
        columns = c(date, time), # this combination reolves to
        spanners = "spanner-id", # c(num, char, fctr, date, time)
        id = "spanner-id-2"
      ) %>%
      cols_hide(columns = c(num, char, fctr)) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE),
    exibble %>%
      gt() %>%
      tab_spanner(
        label = "spanner",
        columns = c(num, char, fctr),
        id = "spanner-id"
      ) %>%
      tab_spanner(
        label = "spanner2",
        columns = c(num, char, fctr, date, time),
        id = "spanner-id-2"
      ) %>%
      cols_hide(columns = c(num, char, fctr)) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE)
  )

  expect_equal(
    exibble %>%
      gt() %>%
      tab_spanner(
        label = "spanner",
        columns = c(num, char, fctr),
        id = "spanner-id"
      ) %>%
      tab_spanner(
        label = "spanner2",
        columns = c(date, time, num, char), # this combination reolves to
        spanners = "spanner-id",             # c(num, char, fctr, date, time)
        id = "spanner-id-2"
      ) %>%
      cols_hide(columns = c(num, char, fctr)) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE),
    exibble %>%
      gt() %>%
      tab_spanner(
        label = "spanner",
        columns = c(num, char, fctr),
        id = "spanner-id"
      ) %>%
      tab_spanner(
        label = "spanner2",
        columns = c(num, char, fctr, date, time),
        id = "spanner-id-2"
      ) %>%
      cols_hide(columns = c(num, char, fctr)) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE)
  )

  expect_equal(
    exibble %>%
      gt() %>%
      tab_spanner(
        label = "spanner",
        columns = c(num, char, fctr),
        id = "spanner-id"
      ) %>%
      tab_spanner(
        label = "spanner2",
        columns = c(date, time, num, char, fctr), # this combination reolves to
        spanners = "spanner-id",                  # c(num, char, fctr, date, time)
        id = "spanner-id-2"
      ) %>%
      cols_hide(columns = c(num, char, fctr)) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE),
    exibble %>%
      gt() %>%
      tab_spanner(
        label = "spanner",
        columns = c(num, char, fctr),
        id = "spanner-id"
      ) %>%
      tab_spanner(
        label = "spanner2",
        columns = c(num, char, fctr, date, time),
        id = "spanner-id-2"
      ) %>%
      cols_hide(columns = c(num, char, fctr)) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE)
  )

  # Specifying `level = 1` here is no different than not providing the level
  expect_equal(
    exibble %>%
      gt() %>%
      tab_spanner(
        label = "spanner",
        columns = c(num, char, fctr),
        level = 1,
        id = "spanner-id"
      ) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE),
    exibble %>%
      gt() %>%
      tab_spanner(
        label = "spanner",
        columns = c(num, char, fctr),
        id = "spanner-id"
      ) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE)
  )

  # Specifying `level = 10` here is no different than not providing the level
  # because intervening levels that are empty will be removed
  expect_equal(
    exibble %>%
      gt() %>%
      tab_spanner(
        label = "spanner",
        columns = c(num, char, fctr),
        level = 10,
        id = "spanner-id"
      ) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE),
    exibble %>%
      gt() %>%
      tab_spanner(
        label = "spanner",
        columns = c(num, char, fctr),
        id = "spanner-id"
      ) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE)
  )

  # Stacking spanners vertically on top of each other is possible
  # by just specifying the spanner ID values in `tab_spanner`
  #
  #      num         char        fctr        date
  # [1,] "spanner-3" "spanner-3" "spanner-3" "spanner-3"
  # [2,] "spanner-2" "spanner-2" "spanner-2" "spanner-2"
  # [3,] "spanner"   "spanner"   "spanner"   "spanner"
  # [4,] "num"       "char"      "fctr"      "date"

  expect_equal(
    exibble[, 1:4] %>%
      gt() %>%
      tab_spanner(
        label = "spanner",
        columns = everything(),
        id = "spanner-id"
      ) %>%
      tab_spanner(
        label = "spanner-2",
        spanners = "spanner-id",
        id = "spanner-id-2"
      ) %>%
      tab_spanner(
        label = "spanner-3",
        spanners = "spanner-id-2",
        id = "spanner-id-3"
      ) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE),
    structure(
      c(
        "spanner-3", "spanner-2", "spanner", "num", "spanner-3",
        "spanner-2", "spanner", "char", "spanner-3", "spanner-2", "spanner",
        "fctr", "spanner-3", "spanner-2", "spanner", "date"
      ),
      .Dim = c(4L, 4L),
      .Dimnames = list(NULL, c("num", "char", "fctr", "date"))
    )
  )

  # Expect the spanner stacking in this case can be equivalently
  # performed by specifying columns (`everything()`)
  expect_equal(
    exibble[, 1:4] %>%
      gt() %>%
      tab_spanner(
        label = "spanner",
        columns = everything(),
        id = "spanner-id"
      ) %>%
      tab_spanner(
        label = "spanner-2",
        columns = everything(),
        id = "spanner-id-2"
      ) %>%
      tab_spanner(
        label = "spanner-3",
        columns = everything(),
        id = "spanner-id-3"
      ) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE),
    structure(
      c(
        "spanner-3", "spanner-2", "spanner", "num", "spanner-3",
        "spanner-2", "spanner", "char", "spanner-3", "spanner-2", "spanner",
        "fctr", "spanner-3", "spanner-2", "spanner", "date"
      ),
      .Dim = c(4L, 4L),
      .Dimnames = list(NULL, c("num", "char", "fctr", "date"))
    )
  )

  # Expect partial replacement of a spanner by specifying the level
  # in a latter `tab_spanner()` call and using `replace = TRUE`
  #
  #      num         char        fctr        date
  # [1,] "spanner-3" "spanner-3" "spanner-3" "spanner-3"
  # [2,] "2-&gt;"    "2-&gt;"    "spanner-2" "spanner-2"
  # [3,] "spanner"   "spanner"   "spanner"   "spanner"
  # [4,] "num"       "char"      "fctr"      "date"

  expect_equal(
    exibble[, 1:4] %>%
      gt() %>%
      tab_spanner(
        label = "spanner",
        columns = everything(),
        id = "spanner-id"
      ) %>%
      tab_spanner(
        label = "spanner-2",
        columns = everything(),
        id = "spanner-id-2"
      ) %>%
      tab_spanner(
        label = "spanner-3",
        columns = everything(),
        id = "spanner-id-3"
      ) %>%
      tab_spanner(
        label = "2->",
        id = "spanner-id-2-b",
        columns = c(num, char),
        level = 2,
        replace = TRUE
      ) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE),
    structure(
      c(
        "spanner-3", "2-&gt;", "spanner", "num", "spanner-3",
        "2-&gt;", "spanner", "char", "spanner-3", "spanner-2", "spanner",
        "fctr", "spanner-3", "spanner-2", "spanner", "date"
      ),
      .Dim = c(4L, 4L),
      .Dimnames = list(NULL, c("num", "char", "fctr", "date"))
    )
  )

  # Expect a full replacement of a spanner by specifying the level
  # in a latter `tab_spanner()` call and using `replace = TRUE`
  #
  #      num           char          fctr          date
  # [1,] "spanner-3"   "spanner-3"   "spanner-3"   "spanner-3"
  # [2,] "&lt;-2-&gt;" "&lt;-2-&gt;" "&lt;-2-&gt;" "&lt;-2-&gt;"
  # [3,] "spanner"     "spanner"     "spanner"     "spanner"
  # [4,] "num"         "char"        "fctr"        "date"

  expect_equal(
    exibble[, 1:4] %>%
      gt() %>%
      tab_spanner(
        label = "spanner",
        columns = everything(),
        id = "spanner-id"
      ) %>%
      tab_spanner(
        label = "spanner-2",
        columns = everything(),
        id = "spanner-id-2"
      ) %>%
      tab_spanner(
        label = "spanner-3",
        columns = everything(),
        id = "spanner-id-3"
      ) %>%
      tab_spanner(
        label = "<-2->",
        id = "spanner-id-2-b",
        columns = everything(),
        level = 2,
        replace = TRUE
      ) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE),
    structure(
      c(
        "spanner-3", "&lt;-2-&gt;", "spanner", "num", "spanner-3",
        "&lt;-2-&gt;", "spanner", "char", "spanner-3", "&lt;-2-&gt;",
        "spanner", "fctr", "spanner-3", "&lt;-2-&gt;", "spanner", "date"
      ),
      .Dim = c(4L, 4L),
      .Dimnames = list(NULL, c("num", "char", "fctr", "date"))
    )
  )

  # Construct a diagonal of one-col-width spanners by specifying the
  # level when necessary
  #
  #      num   char   fctr   date
  # [1,] NA    NA     NA     "D"
  # [2,] NA    NA     "C"    NA
  # [3,] NA    "B"    NA     NA
  # [4,] "A"   NA     NA     NA
  # [5,] "num" "char" "fctr" "date"

  expect_equal(
    exibble[, 1:4] %>%
      gt() %>%
      tab_spanner(label = "A", columns = 1) %>%
      tab_spanner(label = "B", columns = 2, level = 2) %>%
      tab_spanner(label = "C", columns = 3, level = 3) %>%
      tab_spanner(label = "D", columns = 4, level = 4) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE),
    structure(
      c(
        NA, NA, NA, "A", "num", NA, NA, "B", NA, "char",
        NA, "C", NA, NA, "fctr", "D", NA, NA, NA, "date"
      ),
      .Dim = 5:4,
      .Dimnames = list(NULL, c("num", "char", "fctr", "date"))
    )
  )

  # Expect that this can be in a different order when being
  # completely explicit about the `level`
  expect_equal(
    exibble[, 1:4] %>%
      gt() %>%
      tab_spanner(label = "A", columns = 1) %>%
      tab_spanner(label = "B", columns = 2, level = 2) %>%
      tab_spanner(label = "C", columns = 3, level = 3) %>%
      tab_spanner(label = "D", columns = 4, level = 4) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE),
    exibble[, 1:4] %>%
      gt() %>%
      tab_spanner(label = "B", columns = 2, level = 2) %>%
      tab_spanner(label = "C", columns = 3, level = 3) %>%
      tab_spanner(label = "A", columns = 1, level = 1) %>%
      tab_spanner(label = "D", columns = 4, level = 4) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE)
  )

  # Expect that spanners with levels >= 2 won't ever gather
  # columns like spanners with level = 1 (no matter the `gather` value)
  #
  #      num        char        fctr   date
  # [1,] NA         "char_fctr" NA     "char_fctr"
  # [2,] "num_char" "num_char"  NA     NA
  # [3,] "num"      "char"      "fctr" "date"
  expect_equal(
    exibble[, 1:4] %>%
      gt() %>%
      tab_spanner(label = "num_char", columns = c(num, char)) %>%
      tab_spanner(label = "char_fctr", columns = c(char, date)) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE),
    structure(
      c(
        NA, "num_char", "num", "char_fctr", "num_char", "char",
        NA, NA, "fctr", "char_fctr", NA, "date"
      ),
      .Dim = 3:4,
      .Dimnames = list(NULL, c("num", "char", "fctr", "date"))
    )
  )
  expect_equal(
    exibble[, 1:4] %>%
      gt() %>%
      tab_spanner(label = "num_char", columns = c(num, char)) %>%
      tab_spanner(label = "char_fctr", columns = c(char, date), gather = TRUE) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE),
    exibble[, 1:4] %>%
      gt() %>%
      tab_spanner(label = "num_char", columns = c(num, char)) %>%
      tab_spanner(label = "char_fctr", columns = c(char, date), gather = FALSE) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE)
  )

  # ...moving columns will have to be done manually but the spanners
  # that are aloft can be unified
  #
  #      num        char        date        fctr
  # [1,] NA         "char_fctr" "char_fctr" NA
  # [2,] "num_char" "num_char"  NA          NA
  # [3,] "num"      "char"      "date"      "fctr"
  expect_equal(
    exibble[, 1:4] %>%
      gt() %>%
      tab_spanner(label = "num_char", columns = c(num, char)) %>%
      tab_spanner(label = "char_fctr", columns = c(char, date)) %>%
      cols_move(columns = date, after = char) %>%
      build_data(context = "html") %>%
      dt_spanners_print_matrix(include_hidden = FALSE),
    structure(
      c(
        NA, "num_char", "num", "char_fctr", "num_char", "char",
        "char_fctr", NA, "date", NA, NA, "fctr"
      ),
      .Dim = 3:4,
      .Dimnames = list(NULL, c("num", "char", "date", "fctr"))
    )
  )
})
