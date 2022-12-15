# Create a shortened version of `iris`
iris_short <- iris[1:5, ]

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
  skip_if_not_installed("xml2")
}

test_that("The `tab_spanner_delim()` function works correctly", {

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
    grepl("Sepal|Petal", .) %>%
    all() %>%
    expect_true()

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

  # Expect a particular ordering of column labels in `_boxh`
  tbl_html_first %>%
    dt_boxhead_get() %>%
    .$column_label %>%
    unlist() %>%
    expect_equal(c("Sepal", "Sepal", "Petal", "Petal", "Species"))

  # Expect a particular ordering of spanner labels in `_spanners`
  tbl_html_first %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal(c("Length", "Width", "Length", "Width"))

  # Expect that no cells should have a colspan value of `2`
  tbl_html_first %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='2']") %>%
    rvest::html_text() %>%
    length() %>%
    expect_equal(0)

  # Create a `tbl_html` object with `gt()`; split the column
  # names into spanner headings and column labels but constrain
  # the splitting only to the `Sepal.Length` and `Sepal.Width` columns
  tbl_html <-
    gt(iris_short) %>%
    tab_spanner_delim(
      delim = ".",
      columns = c("Sepal.Length", "Sepal.Width")
    )

  # Expect a particular ordering of spanner labels in `_spanners`
  tbl_html %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal("Sepal")

  # Expect that the columns with a colspan of `2` have the same
  # ordering in the rendered table
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='2']") %>%
    rvest::html_text() %>%
    grepl("Sepal", .) %>%
    expect_true()

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
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='2']") %>%
    rvest::html_text() %>%
    grepl("Sepal", .) %>%
    expect_true()

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
})

test_that("`tab_spanner_delim()` works on higher-order spanning", {

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

  # Take snapshots of `gt_tbl_5a`
  gt_tbl_5a %>% render_as_html() %>% expect_snapshot()

  gt_tbl_5b <-
    gt(tbl_5) %>%
    tab_spanner_delim(
      delim = ".",
      columns = c(all.W.A, all.X.B)
    )

  # Take snapshots of `gt_tbl_5b`
  gt_tbl_5b %>% render_as_html() %>% expect_snapshot()

  gt_tbl_5c <-
    gt(tbl_5) %>%
    tab_spanner_delim(
      delim = ".",
      columns = c(all.W.A, all.Z.B)
    )

  # Take snapshots of `gt_tbl_5c`
  gt_tbl_5c %>% render_as_html() %>% expect_snapshot()

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

  # Take snapshots of `gt_tbl_6_first`
  gt_tbl_6_first %>% render_as_html() %>% expect_snapshot()

  gt_tbl_6_last <-
    gt(tbl_6) %>%
    tab_spanner_delim(delim = ".", split = "last")

  # Take snapshots of `gt_tbl_6_last`
  gt_tbl_6_last %>% render_as_html() %>% expect_snapshot()

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

  # Take snapshots of `gt_tbl_6_z`
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

  # Take snapshots of `gt_tbl_6_yzzz`
  gt_tbl_6_yzzz %>% render_as_html() %>% expect_snapshot()
})

test_that("`tab_spanner_delim()` works with complex splits", {

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
  expect_error(
    regexp = NA,
    gt_tbl %>%
      tab_spanner_delim(
        delim = ".",
        split = "first"
      )
  )
  expect_error(
    regexp = NA,
    gt_tbl %>%
      tab_spanner_delim(
        delim = ".",
        split = "last"
      )
  )

  #
  # Ensure that the generated IDs correctly increments their index
  # values where appropriate
  #

  first_delim <-
    gt_tbl %>%
    tab_spanner_delim(
      delim = ".",
      split = "first"
    )

  expect_equal(
    first_delim$`_spanners`$spanner_id,
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
