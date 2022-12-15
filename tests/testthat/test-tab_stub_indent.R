test_that("A gt table can contain indentation in the stub", {

  # Create a table with a stub that has rownames; indent the first
  # three row labels in the stub at level 1
  tbl_1 <-
    exibble %>%
    gt(rowname_col = "row") %>%
    tab_stub_indent(rows = c(1, 2, 3), indent = "increase")

  # Take snapshots of `tbl_1`
  tbl_1 %>% render_as_html() %>% expect_snapshot()
  tbl_1 %>% as_latex() %>% as.character() %>% expect_snapshot()

  # Do much the same as previously but perform the same indentation
  # operation twice, putting the three row labels at level 2
  tbl_2 <-
    exibble %>%
    gt(rowname_col = "row") %>%
    tab_stub_indent(rows = c(1, 2, 3), indent = "increase") %>%
    tab_stub_indent(rows = c(1, 2, 3), indent = "increase")

  # Perform the equivalent operation a previously, this time using
  # an explicit setting of the level (2)
  tbl_3 <-
    exibble %>%
    gt(rowname_col = "row") %>%
    tab_stub_indent(rows = c(1, 2, 3), indent = 2)

  # Expect that `tbl_2` and `tbl_3` are the same
  expect_equal(
    tbl_2 %>% render_as_html(),
    tbl_3 %>% render_as_html()
  )
  expect_equal(
    tbl_2 %>% as_latex() %>% as.character(),
    tbl_3 %>% as_latex() %>% as.character()
  )

  # Indent the three row labels by a level and then decrease by
  # the same amount; should be the same as no indentation at all
  tbl_4 <-
    exibble %>%
    gt(rowname_col = "row") %>%
    tab_stub_indent(rows = c(1, 2, 3), indent = "increase") %>%
    tab_stub_indent(rows = c(1, 2, 3), indent = "decrease")

  expect_equal(
    tbl_4 %>% render_as_html(),
    exibble %>% gt(rowname_col = "row") %>% render_as_html()
  )

  # Indent using a `matches()` expression; this matches rows
  # 3, 4, and 5
  tbl_5 <-
    exibble %>%
    gt(rowname_col = "row") %>%
    tab_stub_indent(rows = matches("3|4|5"), indent = 2)

  # Take snapshots of `tbl_5`
  tbl_5 %>% render_as_html() %>% expect_snapshot()
  tbl_5 %>% as_latex() %>% as.character() %>% expect_snapshot()
})
