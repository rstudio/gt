test_that("A gt table contains the expected column spanner labels", {

  skip_on_ci()

  # Create a `tbl_rtf` object with `gt()`; this table
  # contains the spanner heading `perimeter` over the
  # `peri` and `shape` column labels
  tbl_rtf <-
    gt(rock) %>%
    tab_spanner(
      label = "perimeter",
      columns = c("peri", "shape")
    )

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*.trowd.trrh0.trhdr.*",
      ".intbl \\{.f0 \\{.f0.fs20 \\}\\}.cell.*",
      ".intbl \\{.f0 \\{.f0.fs20 perimeter\\}\\}.cell.*",
      ".intbl \\{.f0 \\{.f0.fs20 }\\}.cell.*",
      ".intbl \\{.f0 \\{.f0.fs20 \\}\\}.cell.*",
      ".*area.*peri.*shape.*perm",
      ".*"
    ),
    tbl_rtf %>% as_rtf() %>% as.character()
  ) %>%
    expect_true()

  # Create a `tbl_rtf` object where the first column doesn't have a
  # spanner but the two pairs of columns after that have a spanner each
  tbl_rtf <-
    dplyr::tribble(
      ~v_1, ~v_2, ~v_3, ~v_4, ~v_5,
      20.4, 36.1, 34.2, 21.6, 23.1,
      25.8, 14.3, 13.7, 12.9, 75.9,
      16.3, 34.3, 15.1, 93.2, 12.1
    ) %>%
    gt() %>%
    tab_spanner(
      label = "v_1_2",
      columns =  c("v_1", "v_2")
    ) %>%
    tab_spanner(
      label = "v_4_5",
      columns = c("v_4", "v_5")
    ) %>%
    cols_move_to_start(columns = "v_3")

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*.trowd.trrh0.trhdr.*",
      ".intbl \\{.f0 \\{.f0.fs20 \\}\\}.cell.*",
      ".intbl \\{.f0 \\{.f0.fs20 v_1_2\\}\\}.cell.*",
      ".intbl \\{.f0 \\{.f0.fs20 \\}\\}.cell.*",
      ".intbl \\{.f0 \\{.f0.fs20 v_4_5\\}\\}.cell.*",
      ".intbl \\{.f0 \\{.f0.fs20 \\}\\}.cell.*",
      ".row.*",
      ".*v_3.*v_1.*v_2.*v_4.*v_5",
      ".*"
    ),
    tbl_rtf %>% as_rtf() %>% as.character()
  ) %>%
    expect_true()

  # Create a `tbl_rtf` object that doesn't gather columns under their
  # respective spanner column labels; also, while the labels are all the same
  # the footnote (1) gets attached to the label in the first and third
  # positions
  tbl_rtf <-
    gt(dplyr::tibble(A_X = c(1), B_X = c(2), A_Y = c(3), B_Y = c(4))) %>%
    tab_spanner(label = "A", id = "y", columns = starts_with("A"), gather = FALSE) %>%
    tab_spanner(label = "A", id = "z", columns = starts_with("B"), gather = FALSE) %>%
    tab_footnote(footnote = "note", locations = cells_column_spanners("y"))

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*.trowd.trrh0.trhdr.*",
      ".intbl \\{.f0 \\{.f0.fs20 A\\{.super .i 1\\}\\}\\}.cell.*",
      ".intbl \\{.f0 \\{.f0.fs20 A\\}\\}.cell.*",
      ".intbl \\{.f0 \\{.f0.fs20 A\\{.super .i 1\\}\\}\\}.cell.*",
      ".intbl \\{.f0 \\{.f0.fs20 A\\}\\}.cell.*",
      ".row.*",
      ".*A_X.*B_X.*A_Y.*B_Y",
      ".*"
    ),
    tbl_rtf %>% as_rtf() %>% as.character()
  ) %>%
    expect_true()

  # Create a `tbl_rtf` object with spanners with different IDs
  # but the same label; the spanner with ID `y` gathers columns beginning
  # with "A", and, that spanner gets a footnote as well
  tbl_rtf <-
    gt(dplyr::tibble(A_X = c(1), B_X = c(2), A_Y = c(3), B_Y = c(4))) %>%
    tab_spanner(label = "A", id = "y", columns = starts_with("A"), gather = TRUE) %>%
    tab_spanner(label = "A", id = "z", columns = starts_with("B")) %>%
    tab_footnote(footnote = "note", locations = cells_column_spanners("y"))

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*.trowd.trrh0.trhdr.*",
      ".intbl \\{.f0 \\{.f0.fs20 A\\{.super .i 1\\}\\}\\}.cell.*",
      ".intbl \\{.f0 \\{.f0.fs20 \\}\\}.cell.*",
      ".intbl \\{.f0 \\{.f0.fs20 A\\}\\}.cell.*",
      ".intbl \\{.f0 \\{.f0.fs20 }\\}.cell.*",
      ".row.*",
      ".*A_X.*A_Y.*B_X.*B_Y",
      ".*"
    ),
    tbl_rtf %>% as_rtf() %>% as.character()
  ) %>%
    expect_true()

  # Create a `tbl_rtf` object that uses `tab_spanner_delim()`
  # on a subset of columns; the single spanner column label is
  # associated to the first two columns, all others have no spanners
  tbl_rtf <-
    gt(iris[1, ]) %>%
    tab_spanner_delim(
      delim = ".",
      columns = c("Sepal.Length", "Sepal.Width")
    )

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*.trowd.trrh0.trhdr.*",
      ".intbl \\{.f0 \\{.f0.fs20 Sepal\\}\\}.cell.*",
      ".intbl \\{.f0 \\{.f0.fs20 \\}\\}.cell.*",
      ".intbl \\{.f0 \\{.f0.fs20 \\}\\}.cell.*",
      ".intbl \\{.f0 \\{.f0.fs20 \\}\\}.cell.*",
      ".intbl \\{.f0 \\{.f0.fs20 \\}\\}.cell.*",
      ".row.*",
      ".*Length.*Width.*Petal.*Length.*Petal.*Width.*Species",
      ".*"
    ),
    tbl_rtf %>% as_rtf() %>% as.character()
  ) %>%
    expect_true()
})
