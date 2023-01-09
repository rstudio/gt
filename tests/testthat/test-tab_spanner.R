# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
  skip_if_not_installed("xml2")
}

# Gets the HTML attr value from a single key
selection_value <- function(html, key) {
  selection <- paste0("[", key, "]")
  rvest::html_attr(rvest::html_nodes(html, selection), key)
}

# Gets the inner HTML text from a single value
selection_text <- function(html, selection) {
  rvest::html_text(rvest::html_nodes(html, selection))
}

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
  tbl_html %>%
    selection_text("[colspan='2']") %>%
    grepl("perimeter", .) %>%
    expect_true()

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
  tbl_html %>%
    selection_text("[class='gt_center gt_columns_top_border gt_column_spanner_outer']") %>%
    grepl("perimeter", .) %>%
    expect_true()

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
  expect_true(
    grepl("<em>perimeter</em>", tbl_html)
  )

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
  expect_true(
    grepl("<em>perimeter</em>", tbl_html)
  )

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

test_that("`tab_spanner()` exclusively uses IDs for arranging spanners", {

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

test_that("`tab_spanner()` doesn't adversely affect column alignment", {

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

test_that("`tab_spanner()` works even when columns are forcibly moved", {

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

test_that("The `dt_spanners_print_matrix()` util function works well", {

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
  # the `build_data()` function (here, using `"html"` as the `context`)

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
