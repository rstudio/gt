local_edition(3)
skip_on_cran()

# Create a shortened version of `iris`
iris_short <- iris[1:5, ]

# Create a summarized version of `iris`
iris_summary <-
  iris %>%
  dplyr::group_by(Species) %>%
  dplyr::summarize(
    dplyr::across(dplyr::everything(), ~mean(.), .names = "M.{col}"),
    dplyr::across(dplyr::everything(), ~sd(.), .names = "SD.{col}"),
    .groups = "drop"
  )

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
  skip_if_not_installed("xml2")
}

test_that("the `tab_spanner_delim()` function works correctly", {

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
    expect_equal(c("Petal", "Sepal"))

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
  # ensuring that the non-default `split` option (`"first"`) has
  # no effect when there is only one delimiter to split on
  tbl_html <-
    gt(iris_short) %>%
    tab_spanner_delim(delim = ".", split = "first")

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
    expect_equal(c("Petal", "Sepal"))

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

  # Create a `tbl_html` object with `gt()`, this time with the
  # summarized version of `iris` that has column names with multiple
  # instances of the delimiter character `.`; split the column
  # names into spanner headings and column labels using the default
  # `split` option (`"last"`)
  tbl_html <-
    gt(iris_summary) %>%
    tab_spanner_delim(delim = ".", split = "last")

  # Expect a particular ordering of column labels in `_boxh`
  tbl_html %>%
    dt_boxhead_get() %>%
    .$column_label %>%
    unlist() %>%
    expect_equal(c("Species", rep(c("Length", "Width"), 6)))

  # Expect a particular ordering of spanner labels in `_spanners`
  # TODO: No longer working as before
  # tbl_html %>%
  #   dt_spanners_get() %>%
  #   .$spanner_label %>%
  #   unlist() %>%
  #   expect_equal(
  #     c(
  #       "Petal", "M.Sepal", "SD.M.Petal",
  #       "SD.M.Sepal", "SD.Petal", "SD.Sepal"
  #     )
  #   )

  # Expect that the columns with a colspan of `2` have the same
  # ordering in the rendered table
  # TODO: No longer working as before
  # tbl_html %>%
  #   render_as_html() %>%
  #   xml2::read_html() %>%
  #   rvest::html_nodes("[colspan='2']") %>%
  #   rvest::html_text() %>%
  #   gsub("(\n|\\s)+?", "", .) %>%
  #   expect_equal(
  #     c(
  #       "M.Sepal", "M.Petal", "SD.Sepal", "SD.Petal",
  #       "SD.M.Sepal", "SD.M.Petal"
  #     )
  #   )

  # Expect that the columns with a colspan of `1` have the same
  # ordering in the rendered table
  # TODO: No longer working as before
  # tbl_html %>%
  #   render_as_html() %>%
  #   xml2::read_html() %>%
  #   rvest::html_nodes("[colspan='1']") %>%
  #   rvest::html_text() %>%
  #   expect_equal(c("Species", rep(c("Length", "Width"), 6)))

  # Create a `tbl_html` object with `gt()`, this time with the
  # summarized version of `iris` that has column names with multiple
  # instances of the delimiter character `.`; split the column
  # names into spanner headings and column labels using the non-default
  # `split` option (`"first"`)
  tbl_html <-
    gt(iris_summary) %>%
    tab_spanner_delim(delim = ".", split = "first")

  # Expect a particular ordering of column labels in `_boxh`
  tbl_html %>%
    dt_boxhead_get() %>%
    .$column_label %>%
    unlist() %>%
    expect_equal(
      c(
        "Species", "Sepal.Length", "Sepal.Width", "Petal.Length",
        "Petal.Width", "Sepal.Length", "Sepal.Width",
        "Petal.Length", "Petal.Width", "M.Sepal.Length", "M.Sepal.Width",
        "M.Petal.Length", "M.Petal.Width"
      )
    )

  # Expect a particular ordering of spanner labels in `_spanners`
  tbl_html %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal(c("M", "SD"))

  # Expect that the columns with a colspan of `4` belongs to `"M"`
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='4']") %>%
    rvest::html_text() %>%
    gsub("(\n|\\s)+?", "", .) %>%
    expect_equal("M")

  # Expect that the columns with a colspan of `8` belongs to `"SD"`
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='8']") %>%
    rvest::html_text() %>%
    gsub("(\n|\\s)+?", "", .) %>%
    expect_equal("SD")

  # Expect that the columns with a colspan of `1` have the same
  # ordering in the rendered table
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='1']") %>%
    rvest::html_text() %>%
    expect_equal(
      c(
        "Species", "Sepal.Length", "Sepal.Width", "Petal.Length",
        "Petal.Width", "Sepal.Length", "Sepal.Width",
        "Petal.Length", "Petal.Width", "M.Sepal.Length", "M.Sepal.Width",
        "M.Petal.Length", "M.Petal.Width"
      )
    )
})

test_that("`tab_spanner_delim()` gathers columns as necessary", {

  tbl_a <- dplyr::tibble(A_X = 1, B_X = 2, A_Y = 3, B_Y = 4)

  tbl_b <- dplyr::tibble(A_X = 1, B_X = 2, A_Y = 3, B_Y = 4, Z = 5)

  tbl_c <- dplyr::tibble(Z = 0.5, A_X = 1, B_X = 2, A_Y = 3, B_Y = 4)

  tbl_html_1 <-
    gt(tbl_a) %>%
    tab_spanner_delim(
      delim = "_",
      gather = TRUE
    )

  tbl_html_1 %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal(c("A", "B"))

  tbl_html_1 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_column_spanner']") %>%
    rvest::html_text() %>%
    expect_equal(c("A", "B"))

  tbl_html_1 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("X", "Y", "X", "Y"))

  tbl_html_2 <-
    gt(tbl_a) %>%
    tab_spanner_delim(
      delim = "_",
      gather = FALSE
    )

  tbl_html_2 %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal(c("A", "B"))

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
    expect_equal(c("X", "X", "Y", "Y"))

  tbl_html_3 <-
    gt(tbl_b) %>%
    tab_spanner_delim(
      delim = "_",
      gather = TRUE
    )

  tbl_html_3 %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal(c("A", "B"))

  tbl_html_3 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_column_spanner']") %>%
    rvest::html_text() %>%
    expect_equal(c("A", "B"))

  tbl_html_3 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("Z", "X", "Y", "X", "Y"))

  tbl_html_3 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_row gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("1", "3", "2", "4", "5"))

  tbl_html_4 <-
    gt(tbl_b) %>%
    tab_spanner_delim(
      delim = "_",
      gather = FALSE
    )

  tbl_html_4 %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal(c("A", "B"))

  tbl_html_4 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_column_spanner']") %>%
    rvest::html_text() %>%
    expect_equal(c("A", "B", "A", "B"))

  tbl_html_4 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("Z", "X", "X", "Y", "Y"))

  tbl_html_4 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_row gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("1", "2", "3", "4", "5"))

  tbl_html_5 <-
    gt(tbl_c) %>%
    tab_spanner_delim(
      delim = "_",
      gather = TRUE
    )

  tbl_html_5 %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal(c("A", "B"))

  tbl_html_5 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_column_spanner']") %>%
    rvest::html_text() %>%
    expect_equal(c("A", "B"))

  tbl_html_5 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("Z", "X", "Y", "X", "Y"))

  tbl_html_5 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_row gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("0.5", "1", "3", "2", "4"))

  tbl_html_6 <-
    gt(tbl_c) %>%
    tab_spanner_delim(
      delim = "_",
      gather = FALSE
    )

  tbl_html_6 %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal(c("A", "B"))

  tbl_html_6 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_column_spanner']") %>%
    rvest::html_text() %>%
    expect_equal(c("A", "B", "A", "B"))

  tbl_html_6 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("Z", "X", "X", "Y", "Y"))

  tbl_html_6 %>%
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
    tab_spanner_delim(
      delim = ".",
      gather = TRUE
    )

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
    tab_spanner_delim(
      delim = ".",
      gather = TRUE
    )

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
    tab_spanner_delim(
      delim = ".",
      gather = TRUE
    )

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
    tab_spanner_delim(
      delim = ".",
      gather = TRUE
    )

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
    tab_spanner_delim(
      delim = ".",
      gather = TRUE
    )

  # Take snapshots of `gt_tbl_5a`
  gt_tbl_5a %>% render_as_html() %>% expect_snapshot()

  gt_tbl_5b <-
    gt(tbl_5) %>%
    tab_spanner_delim(
      delim = ".",
      gather = TRUE,
      columns = c(all.W.A, all.X.B)
    )

  # Take snapshots of `gt_tbl_5b`
  gt_tbl_5b %>% render_as_html() %>% expect_snapshot()

  gt_tbl_5c <-
    gt(tbl_5) %>%
    tab_spanner_delim(
      delim = ".",
      gather = TRUE,
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

  gt_tbl_spanner_4 <-
    gt_tbl_spanner_3 %>%
    tab_spanner(
      label = md("**REPLACED**"),
      spanners = everything(),
      level = 3
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

  gt_tbl_spanner_A_2 <-
    gt_tbl_1 %>%
    tab_spanner(
      label = "Data", spanners = everything()
    )

  expect_equal(
    gt_tbl_spanner_A_1 %>% render_as_html(),
    gt_tbl_spanner_A_2 %>% render_as_html()
  )

  #
  # Highly specific placements of spanners
  #

  gt_tbl_spanner_B <-
    gt_tbl_spanner_A_1 %>%
    tab_spanner(
      label = "Cut In",
      columns = c(1, 2),
      level = 3
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
    tab_spanner_delim(
      delim = ".",
      gather = TRUE,
      split = "last"
    )

  tbl_1_rev <-
    dplyr::tibble(
      X.A.span_1 = 1,
      X.B.span_1 = 2,
      Y.A.span_2 = 3,
      Y.B.span_2 = 4
    )

  gt_tbl_1_rev <-
    gt(tbl_1_rev) %>%
    tab_spanner_delim(
      delim = ".",
      gather = TRUE,
      split = "first"
    )

  # TODO: This should pass but it doesn't currently
  # expect_equal(
  #   gt_tbl_1 %>% render_as_html(),
  #   gt_tbl_1_rev %>% render_as_html()
  # )
})
