# Create a table with four columns of values
tbl <-
  data.frame(
    col_1 = c(767.6, 403.3, 686.4, 662.6, 198.5, 132.1, 349.7, 63.7, 105.4, 924.2),
    col_2 = c(928.1, 461.5, 54.1, 148.8, 65.1, 118.1, 307.1, 504.3, 729.8, 424.6),
    col_3 = c(382, 15.1, 282.7, 984.6, 127.4, 91.2, 566.7, 152, 962.4, 740.8),
    col_4 = c(674.5, 242.8, 56.3, 928.1, 219.3, 874.3, 542.9, 724.5, 336.4, 104.2)
  )

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
}

test_that("cols_label() works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()` and label all
  # of the columns
  tbl_html <-
    gt(tbl) %>%
    cols_label(
      col_1 = "col_a",
      col_2 = "col_b",
      col_3 = "col_c",
      col_4 = "col_d"
    )

  # Expect that the values for the column labels are set
  # correctly in `col_labels`
  expect_equal(
    unlist(tbl_html$`_boxhead`$column_label),
    c("col_a", "col_b", "col_c", "col_d")
  )

  # Expect that the column labels are set
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    expect_equal(c("col_a", "col_b", "col_c", "col_d"))
})

test_that("cols_labels() doesn't change anything if empty.", {

  check_suggests()
  # Create a `tbl_html` object with `gt()` and label none
  # of the columns
  tbl_html <-
    gt(tbl) %>%
    cols_label()

  # Expect the original column names for `tbl` as values for
  # the column keys and for the column labels
  expect_equal(
    unlist(tbl_html$`_boxhead`$var),
    colnames(tbl)
  )
  expect_equal(
    unlist(tbl_html$`_boxhead`$column_label),
    colnames(tbl)
  )

  # Expect that the column labels are set as the column names
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    expect_equal(c("col_1", "col_2", "col_3", "col_4"))
})

test_that("cols_label() works with `.list`", {

  check_suggests()
  # Create a `tbl_html` object with `gt()` and label all
  # of the columns using a named list passed to `.list`
  tbl_html <-
    gt(tbl) %>%
    cols_label(
      .list = list(
        col_1 = "col_a",
        col_2 = "col_b",
        col_3 = "col_c",
        col_4 = "col_d"
      )
    )

  # Expect that the values for the column labels are set
  # correctly in `col_labels`
  expect_equal(
    unlist(tbl_html$`_boxhead`$column_label),
    c("col_a", "col_b", "col_c", "col_d")
  )

  # Expect that the column labels are set
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    expect_equal(c("col_a", "col_b", "col_c", "col_d"))
})

test_that("cols_label() errors with bad input", {

  # Expect an error if any names are missing
  expect_error(gt(tbl) %>% cols_label("col_a"))

  # Expect an error if any columns are not part of the original dataset
  expect_error(gt(tbl) %>% cols_label(col_a = "col_1"))

})

test_that("cols_label() deals well with partial matching", {
  # Expect no partial matching issues with column names and arguments
  expect_no_error(
    dplyr::tribble(
      ~a , ~d,
      1, 4,
      5, 8
    ) %>%
      gt() %>%
      cols_label(
        a = "label a",
        d = "label d"
      )
  )
  expect_no_error(
    dplyr::tribble(
      ~a , ~dat,
      1, 4,
      5, 8
    ) %>%
      gt() %>%
      cols_label(
        a = "label a",
        dat = "label dat"
      )
  )

  # Do expect an error in the unlikely case that a column
  # name is close enough to `.data`
  expect_error(
    dplyr::tribble(
      ~a , ~.dat,
      1, 4,
      5, 8
    ) %>%
      gt() %>%
      cols_label(
        a = "label a",
        .dat = "label dat"
      )
  )
})
test_that("cols_label() works with `md()`/`html()`", {
  tab <- gt(exibble, rowname_col = "row", groupname_col = "group")

  # Expect the rendered column labels to be
  # exactly as provided
  tab2 <- tab %>%
    tab_spanner(
      label = "date/time",
      columns = c(date, time, datetime)
    ) %>%
    cols_label(
      num = "Number",
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
  tab3 <- tab %>%
    tab_spanner(
      label = "date/time",
      columns = c(date, time, datetime)
    ) %>%
    cols_label(
      num = md("**Number**"),
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
  tab4 <- tab %>%
    tab_spanner(
      label = "date/time",
      columns = c(date, time, datetime)
    ) %>%
    cols_label(
      num = html("<strong>Number</strong>"),
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

# cols_label_with() ------------------------------------------------------------

test_that("cols_label_with() works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create the `tbl_html_1` object with `gt()` and label all of the columns
  tbl_html_1 <-
    gt(tbl) %>%
    cols_label(
      col_1 = "col_a",
      col_2 = "col_b"
    ) %>%
    cols_label_with(
      fn = ~ gsub(x = ., pattern = "3", replacement = "c")
    )  %>%
    cols_label_with(
      fn = function(x) gsub(x = x, pattern = "4", replacement = "d")
    )

  # Expect that the values for the column labels are set
  # correctly in `col_labels`
  expect_equal(
    unlist(tbl_html_1$`_boxhead`$column_label),
    c("col_a", "col_b", "col_c", "col_d")
  )

  # Expect that the column labels are set
  tbl_html_1 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    expect_equal(c("col_a", "col_b", "col_c", "col_d"))

  # Create the `tbl_html_2` object with `gt()` and label all of the columns with
  # multiple instances of labeling
  tbl_html_2 <-
    gt(tbl) %>%
    cols_label(
      col_1 = "col_a",
      col_2 = "col_b"
    ) %>%
    cols_label_with(
      fn = ~ gsub(x = ., pattern = "3", replacement = "c")
    )  %>%
    cols_label_with(
      fn = function(x) gsub(x = x, pattern = "4", replacement = "d")
    ) %>%
    cols_label_with(
      fn = ~ gsub(x = ., pattern = "c", replacement = "3")
    )  %>%
    cols_label_with(
      fn = function(x) gsub(x = x, pattern = "d", replacement = "4")
    ) %>%
    cols_label_with(
      fn = ~ gsub(x = ., pattern = "3", replacement = "c")
    )  %>%
    cols_label_with(
      fn = function(x) gsub(x = x, pattern = "4", replacement = "d")
    )

  # Expect that `tbl_html_2` has the same column labels as `tbl_html_1`
  expect_equal(
    render_as_html(tbl_html_1),
    render_as_html(tbl_html_2)
  )
})

test_that("cols_label_with() works when not changing anything.", {

  check_suggests()
  # Create the `tbl_html_3` object with `gt()` and label none
  # of the columns (return their labels)
  tbl_html_3 <-
    gt(tbl) %>%
    cols_label_with(fn = function(x) x)

  # Expect the original column names for `tbl` as values for
  # the column keys and for the column labels
  expect_equal(
    unlist(tbl_html_3$`_boxhead`$var),
    colnames(tbl)
  )
  expect_equal(
    unlist(tbl_html_3$`_boxhead`$column_label),
    colnames(tbl)
  )

  # Expect that the column labels are set as the column names
  expect_selection_text_from_gt(
    tbl_html_3,
    selection = "[class='gt_col_heading gt_columns_bottom_border gt_right']",
    expected = c("col_1", "col_2", "col_3", "col_4")
  )

  # Create the `tbl_html_4` object and embolden a column label with a
  # double pass of:
  # (1) applying Markdown symbols through `paste0()`
  # (2) applying the `md()` helper function
  tbl_html_4 <-
    gt(tbl) %>%
    cols_label_with(
      columns = col_1,
      fn = ~ paste0("**", ., "**")
    ) %>%
    cols_label_with(
      columns = col_1,
      fn = md
    )

  # Expect to find that rendered column label for `col_1` has the <strong>
  # tag applied
  expect_match_html(
    tbl_html_4,
    "<strong>col_1</strong>"
  )

  # Create the `tbl_html_5` object and embolden a column label with a
  # single pass of:
  # (1) applying Markdown symbols through `paste0()`
  # (2) applying the `md()` helper function
  tbl_html_5 <-
    gt(tbl) %>%
    cols_label_with(
      columns = col_1,
      fn = ~ md(paste0("**", ., "**"))
    )

  # Expect that `tbl_html_5` has the same column labels as `tbl_html_4`
  expect_equal(
    render_as_html(tbl_html_4),
    render_as_html(tbl_html_5)
  )

  #
  # Ensure that new labels are applied to columns correctly, no matter how
  # the column resolution occurs
  #

  towny_gt_tbl <-
    towny %>%
    dplyr::slice_max(population_2021, n = 5) %>%
    dplyr::select(name, latitude, longitude, ends_with("2016"), ends_with("2021")) %>%
    gt() %>%
    tab_spanner(columns = starts_with("pop"), label = "Population") %>%
    tab_spanner(columns = starts_with("den"), label = "Density")

  expect_equal(
    towny_gt_tbl %>%
      cols_label_with(
        fn = function(x) gsub(".*_(.*)", "\\1", x)
      ) %>%
      render_as_html() %>%
      xml2::read_html() %>%
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']"),
    towny_gt_tbl %>%
      cols_label_with(
        columns = c(population_2016, population_2021, density_2016, density_2021),
        fn = function(x) gsub(".*_(.*)", "\\1", x)
      ) %>%
      render_as_html() %>%
      xml2::read_html() %>%
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']")
  )

  expect_equal(
    towny_gt_tbl %>%
      cols_label_with(
        fn = function(x) gsub(".*_(.*)", "\\1", x)
      ) %>%
      render_as_html() %>%
      xml2::read_html() %>%
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']"),
    towny_gt_tbl %>%
      cols_label_with(
        columns =  c(population_2016, density_2016, population_2021, density_2021),
        fn = function(x) gsub(".*_(.*)", "\\1", x)
      ) %>%
      render_as_html() %>%
      xml2::read_html() %>%
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']")
  )

  expect_equal(
    towny_gt_tbl %>%
      cols_label_with(
        fn = function(x) gsub(".*_(.*)", "\\1", x)
      ) %>%
      render_as_html() %>%
      xml2::read_html() %>%
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']"),
    towny_gt_tbl %>%
      cols_label_with(
        columns = c(starts_with("pop"), starts_with("den")),
        fn = function(x) gsub(".*_(.*)", "\\1", x)
      ) %>%
      render_as_html() %>%
      xml2::read_html() %>%
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']")
  )

  expect_equal(
    towny_gt_tbl %>%
      cols_label_with(
        fn = function(x) gsub(".*_(.*)", "\\1", x)
      ) %>%
      render_as_html() %>%
      xml2::read_html() %>%
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']"),
    towny_gt_tbl %>%
      cols_label_with(
        columns = c(starts_with("den"), starts_with("pop")),
        fn = function(x) gsub(".*_(.*)", "\\1", x)
      ) %>%
      render_as_html() %>%
      xml2::read_html() %>%
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']")
  )
})

test_that("cols_label_with() errors with wrong input.", {

  # Expect an error if `fn` is missing
  expect_error(gt(tbl) %>% cols_label_with(fn = NULL))

  # Expect an error if any columns declared are not present
  expect_error(gt(tbl) %>% cols_label_with(columns = col_a, fn = function(x) "col_1"))
})
