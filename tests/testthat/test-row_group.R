
# Create a table with group names, rownames, and four columns of values
tbl <-
  dplyr::tribble(
    ~dates,        ~rows, ~col_1, ~col_2, ~col_3, ~col_4,
    "2018-02-10",  "1",   767.6,  928.1,  382.0,  674.5,
    "2018-02-10",  "2",   403.3,  461.5,   15.1,  242.8,
    "2018-02-10",  "3",   686.4,   54.1,  282.7,   56.3,
    "2018-02-10",  "4",   662.6,  148.8,  984.6,  928.1,
    "2018-02-11",  "5",   198.5,   65.1,  127.4,  219.3,
    "2018-02-11",  "6",   132.1,  118.1,   91.2,  874.3,
    "2018-02-11",  "7",   349.7,  307.1,  566.7,  542.9,
    "2018-02-11",  "8",    63.7,  504.3,  152.0,  724.5,
    "2018-02-11",  "9",   105.4,  729.8,  962.4,  336.4,
    "2018-02-11",  "10",  924.2,  424.6,  740.8,  104.2
  )

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
}
# row_group_order() ------------------------------------------------------------
test_that("row_group_order() works correctly", {

  # Create a `tbl_html` that arranges the groups by the
  # latter calendar date first
  html_tbl <-
    tbl %>%
    gt(rowname_col = "rows", groupname_col = "dates") %>%
    row_group_order(groups = c("2018-02-11", "2018-02-10"))

  # Expect that the internal vector `arrange_groups` has the
  # groups in the order specified
  dt_row_groups_get(data = html_tbl) %>%
    expect_equal(c("2018-02-11", "2018-02-10"))

  # Expect an error if input for `groups` is not a character vector
  expect_error(
    tbl %>%
      gt(rowname_col = "rows", groupname_col = "dates") %>%
      row_group_order(groups = c(TRUE, FALSE))
  )

  # Expect that any value in `groups` that doesn't correspond
  # to a group name will result in an error
  expect_error(
    tbl %>%
      gt(rowname_col = "rows", groupname_col = "dates") %>%
      row_group_order(groups = c("2018-02-13", "2018-02-10"))
  )
})

test_that("Styling at various locations is kept when using `row_group_order()`", {

  # Generate a summary table from `tbl`
  summary_tbl <-
    tbl %>%
    gt(rowname_col = "rows", groupname_col = "dates") %>%
    summary_rows(
      groups = everything(),
      columns = everything(),
      fns = list("sum")
    ) %>%
    grand_summary_rows(
      columns = everything(),
      fns = list("sum")
    )

  # Apply text styling to all summary and grand summary cells
  # (plus their labels in the stub)
  summary_tbl_styled_1 <-
    summary_tbl %>%
    tab_style(
      style = cell_text(style = "italic", weight = "bold"),
      locations = list(
        cells_summary(), cells_stub_summary(),
        cells_grand_summary(), cells_stub_grand_summary()
      )
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Apply the same styling but additionally reverse the order of row groups
  expect_no_error(summary_tbl_styled_2 <-
    summary_tbl %>%
    tab_style(
      style = cell_text(style = "italic", weight = "bold"),
      locations = list(
        cells_summary(), cells_stub_summary(),
        cells_grand_summary(), cells_stub_grand_summary()
      )
    ) %>%
    row_group_order(groups = c("2018-02-11", "2018-02-10")) %>%
    render_as_html() %>%
    xml2::read_html())

  # Expect that all summary and grand summary cells (and their stub locations)
  # have the same styles applied regardless of the use of `row_group_order()`
  check_suggests()
  summary_tbl_styled_1 %>%
    selection_value("style") %>%
    expect_equal(rep("font-style: italic; font-weight: bold;", 15))

  summary_tbl_styled_2 %>%
    selection_value("style") %>%
    expect_equal(rep("font-style: italic; font-weight: bold;", 15))
})

# tab_row_group() --------------------------------------------------------------

test_that("tab_row_group() can generate row groups.", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains a row groups in a specified order using `tab_row_group()`
  tbl_html <-
    gt(mtcars, rownames_to_stub = TRUE) %>%
    tab_row_group(
      label = "Mazda",
      rows = c("Mazda RX4", "Mazda RX4 Wag")
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the inner HTML content for the two row groups
  # is 'Mazda' and then an empty string
  expect_equal(
    get_row_group_text(tbl_html),
    c("Mazda", "")
  )

  # Create a `tbl_html` object with `gt()`; this table
  # contains a three row groups and the use of `row_group_order()`
  # will specify a particular ordering
  tbl_html <-
    mtcars %>%
    gt(rownames_to_stub = TRUE) %>%
    tab_row_group(
      label = "Mercs",
      rows = contains("Merc")
    ) %>%
    tab_row_group(
      label = "Mazda",
      rows = c("Mazda RX4", "Mazda RX4 Wag")
    ) %>%
    row_group_order(groups = c(NA, "Mazda", "Mercs")) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the inner HTML content for the three row groups
  # is in the prescribed order
  expect_equal(
    get_row_group_text(tbl_html),
    c("", "Mazda", "Mercs")
  )

  # Create a `tbl_html` object with `gt()`; this table contains a single
  # row group that has a label with the `html()` helper
  tbl_html <-
    gtcars %>%
    dplyr::select(model, year, hp, trq) %>%
    dplyr::slice(1:8) %>%
    gt(rowname_col = "model") %>%
    tab_row_group(
      label = html("<div style=\"font-weight: bold;\">numbered</div>"),
      rows = matches("^[0-9]")
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the inner HTML content for the row group
  # has the expected text
  expect_equal(get_row_group_text(tbl_html), c("numbered", ""))

  # Create a `tbl_html` object with `gt()`; this table contains a single
  # row group that has a label with the `md()` helper
  tbl_html <-
    gtcars %>%
    dplyr::select(model, year, hp, trq) %>%
    dplyr::slice(1:8) %>%
    gt(rowname_col = "model") %>%
    tab_row_group(
      label = md("**cars** that are <em>numbered</em>"),
      rows = matches("^[0-9]")
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the inner HTML content for the row group
  # has the expected text
  expect_equal(get_row_group_text(tbl_html), c("cars that are numbered", ""))

  # Create a variation on the above table where `row_group_order()`
  # leaves out `NA` (it's put at the end)
  tbl_html <-
    mtcars %>%
    gt(rownames_to_stub = TRUE) %>%
    tab_row_group(
      label = "Mercs",
      rows = contains("Merc")
    ) %>%
    tab_row_group(
      label = "Mazda",
      rows = c("Mazda RX4", "Mazda RX4 Wag")
    ) %>%
    row_group_order(groups = c("Mazda", "Mercs")) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the inner HTML content for the three row groups
  # is in the prescribed order
  expect_equal(
    get_row_group_text(tbl_html),
    c("Mazda", "Mercs", "")
  )

})

test_that("tab_row_group() gives the correct output", {

  tbl_rows <-
    exibble %>%
    gt() %>%
    tab_row_group(
      label = md("__*void*__"),
      rows = group == "grp_a",
      id = "group_a"
    ) %>%
    tab_row_group(
      label = "void",
      rows = group != "grp_a",
      id = "group_void"
    ) %>%
    row_group_order(
      groups = c("group_a", "group_void")
    ) %>%
    tab_spanner(
      label = md("__*num_char*__"),
      columns = c(num, char),
      id = "num_char"
    ) %>%
    tab_footnote(
      footnote = "a footnote",
      locations = cells_row_groups("group_a")
    )

  # Expect to see the styled and unstyled variations of the `"void"`
  # row group labels
  expect_match_html(
    tbl_rows,
    regexp = c(
      "<span class='gt_from_md'><strong><em>void</em></strong></span><span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height: 0;\"><sup>1</sup></span>",
      "<th colspan=\"9\" class=\"gt_group_heading\" scope=\"colgroup\" id=\"void\">void</th>"
    ),
    fixed = TRUE
  )

  # Expect that the inner HTML content for the two row groups
  # is in the prescribed order
  tbl_html_text <- xml2::read_html(render_as_html(tbl_rows))
  expect_equal(
    get_row_group_text(tbl_html_text),
    c("void1", "void")
  )


  # When specifying a row group that captures no rows, expect that
  # the rendered table is essentially unaffected by this function call
  expect_equal(
    gt(exibble, rowname_col = "row") %>%
      tab_row_group(label = "group", rows = FALSE) %>%
      render_as_html(),
    gt(exibble, rowname_col = "row") %>%
      render_as_html()
  )
})

test_that("A default row group name created with tab_row_group() can be modified with `tab_options()`", {
  local_options("rlib_warning_verbosity" = "verbose")

  # Check that specific suggested packages are available
  check_suggests()

  tbl_html <- gt(exibble)

  # Having some rows associated to ids/labels means that the
  # non-associated rows will have an NA label
  expect_equal(
    tbl_html %>%
      tab_row_group(
        label = md("__*void*__"),
        rows = group == "grp_a",
        id = "group_a"
      ) %>%
      render_as_html() %>%
      xml2::read_html() %>%
      get_row_group_text(),
    c("void", "")
  )

  # Setting a default row group label will make that label
  # appear when rendered
  expect_equal(
    tbl_html %>%
      tab_options(row_group.default_label = "The Others") %>%
      tab_row_group(
        label = md("__*void*__"),
        rows = group == "grp_a",
        id = "group_a"
      ) %>%
      render_as_html() %>%
      xml2::read_html() %>%
      get_row_group_text(),
    c("void", "The Others")
  )

  # The order of the two groups (one defined, one the 'Others') can
  # be modified with `row_group_order()` by putting `NA` before `group_a`
  expect_equal(
    tbl_html %>%
      tab_options(row_group.default_label = "The Others") %>%
      tab_row_group(
        label = md("__*void*__"),
        rows = group == "grp_a",
        id = "group_a"
      ) %>%
      row_group_order(groups = c(NA, "group_a")) %>%
      render_as_html() %>%
      xml2::read_html() %>%
      get_row_group_text(),
    c("The Others", "void")
  )

  # The label for the 'Others' can be overwritten with a subsequent
  # call of `tab_row_group()`
  expect_equal(
    tbl_html %>%
      tab_row_group(
        label = md("__*void*__"),
        rows = group == "grp_a",
        id = "group_a"
      ) %>%
      tab_options(row_group.default_label = "The Others") %>%
      tab_options(row_group.default_label = "Other Group") %>%
      row_group_order(groups = c(NA, "group_a")) %>%
      render_as_html() %>%
      xml2::read_html() %>%
      get_row_group_text(),
    c("Other Group", "void")
  )

  # A previously defined label for the 'Others' can be reset to
  # nothing by using `tab_options(row_group.default_label = "")`
  expect_equal(
    tbl_html %>%
      tab_row_group(
        label = md("__*void*__"),
        rows = group == "grp_a",
        id = "group_a"
      ) %>%
      tab_options(row_group.default_label = "The Others") %>%
      tab_options(row_group.default_label = "") %>%
      render_as_html() %>%
      xml2::read_html() %>%
      get_row_group_text(),
    c("void", "")
  )
})

test_that("A gt table's row group labels are HTML escaped", {

  # Create a `tbl_html` object with `gt()`; this table
  # contains a row group with characters that require
  # escaping for HTML
  tbl_html <-
    data.frame(group = "x > 30", value = seq(1, 5)) %>%
    gt(groupname_col = "group") %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the row group label is `x > 30` (and not
  # `x`, which would result from not escaping the inner HTML)
  expect_equal(
    tbl_html %>%
      selection_text("[class='gt_group_heading']"),
    "x > 30"
  )

  # Create a `tbl_html` object with `gt()`; this table
  # has the row group label (with necessity to HTML-escape)
  # but, this time, there is a footnote mark attached to
  # that label (which shouldn't be escaped)
  tbl_html <-
    data.frame(group = "x > 30", value = seq(1, 5)) %>%
    gt(groupname_col = "group") %>%
    tab_footnote(
      footnote = "footnote",
      locations = cells_row_groups(groups = "x > 30")
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the row group label is `x > 30` +
  # the text for the footnote mark: `1`
  expect_equal(
    tbl_html %>%
      selection_text("[class='gt_group_heading']"),
    "x > 301"
  )
})

test_that("tab_row_group() warns for deprecated args, but respects output.", {
  local_options("rlib_warning_verbosity" = "verbose")

  # Expect a warning if using both the `label` and `group` argument
  expect_snapshot(
    gt_tbl <-
      gt(exibble, rowname_col = "row") %>%
      tab_row_group(
        label = "group_prioritized",
        group = "group",
        rows = 1:3
      )
  )

  # Expect that the label text specified in `label` was used over the
  # text given in `group`
  expect_equal(
    gt_tbl %>%
      render_as_html() %>%
      xml2::read_html() %>%
      get_row_group_text(),
    c("group_prioritized", "")
  )

  # Expect that `tab_options(row_group.default_label = <label>)`
  # is called internally if using the deprecated `others_label` argument
  expect_snapshot(
    gt_tbl <-
      (
        gt(exibble, rowname_col = "row") %>%
          tab_row_group(label = "one", rows = 1:3) %>%
          tab_row_group(others_label = "foo")
      )
  )
  expect_equal(
    dt_options_get_value(gt_tbl, "row_group_default_label"),
    "foo"
  )

  expect_equal(
    gt_tbl %>%
      render_as_html() %>%
      xml2::read_html() %>%
      get_row_group_text(),
    c("one", "foo")
  )

  # Expect an error upon repeat use of a row group `id` value
  expect_error(
    gt(exibble, rowname_col = "row") %>%
      tab_row_group(label = "a", rows = 1:2, id = "one") %>%
      tab_row_group(label = "b", rows = 3:4, id = "one")
  )
})

test_that("tab_row_group() errors with bad input", {
  # Expect an error if not providing a `label` for `tab_row_group()`
  # but there is a specification of rows
  expect_error(
    exibble %>%
      gt() %>%
      tab_row_group(
        rows = group == "grp_a"
      ),
    "label"
  )
})

test_that("tab_row_group() errors when named rows are supplied (#1535)", {

  # create a gt tbl with no rows
  gt_tbl <- mtcars_short %>% gt()
  # create a gt tbl with rows
  gt_tbl_rows <- mtcars_short %>% gt(rownames_to_stub = TRUE)

  expect_no_error(gt_tbl_rows %>% tab_row_group("Mazda", c("Mazda RX4", "Mazda RX4 Wag")))

  # expect a special error if the gt
  expect_snapshot(error = TRUE, {
    gt_tbl %>% tab_row_group("Mazda", c("Mazda RX4", "Mazda RX4 Wag"))
  })
  # regular resolver error if wrong row
  expect_error(
    gt_tbl_rows %>% tab_row_group("Mazda", c("Mazda RX4", "Mazda not present")),
    "Mazda not present"
  )
})
