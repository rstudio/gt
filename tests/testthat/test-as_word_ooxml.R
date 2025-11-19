skip_on_cran()

test_that("word ooxml can be generated from gt object", {

  # Create a one-row table for these tests
  exibble_min <- exibble[1, ]

  ## basic table
  xml <- read_xml_word_nodes(as_word_ooxml(gt(exibble_min)))
  expect_equal(length(xml), 1)
  expect_equal(xml_name(xml), "tbl")
  # TODO: explore xml more precisely than with a snapshot
  expect_xml_snapshot(xml)

  ## basic table with title
  gt_tbl_1 <-
    exibble_min |>
    gt() |>
    tab_header(
      title = "TABLE TITLE",
      subtitle = "table subtitle"
    )
  xml_top <- read_xml_word_nodes(as_word_ooxml(gt_tbl_1))
  expect_equal(length(xml_top), 3)
  expect_equal(xml_name(xml_top), c("p", "p", "tbl"))
  expect_xml_snapshot(xml_top[[1]])
  expect_xml_snapshot(xml_top[[2]])
  expect_equal(length(xml_find_all(xml_top, "//w:tr")), 2)
  # expect_snapshot_ooxml_word(gt_tbl_1)

  ## basic table with title added below table
  xml_bottom <- read_xml_word_nodes(as_word_ooxml(gt_tbl_1, caption_location = "bottom"))
  expect_equal(length(xml_bottom), 3)
  expect_equal(xml_name(xml_bottom), c("tbl", "p", "p"))
  expect_equal(xml_top[[1]], xml_bottom[[2]])
  expect_equal(xml_top[[2]], xml_bottom[[3]])
  expect_equal(xml_top[[3]], xml_bottom[[1]])
  expect_equal(length(xml_find_all(xml_bottom, "//w:tr")), 2)
  # expect_snapshot_ooxml_word(gt_tbl_1, caption_location = "bottom")

  ## basic table with title embedded on the top of table
  # expect_snapshot_ooxml_word(gt_tbl_1, caption_location = "embed")
  xml_embed <- read_xml_word_nodes(as_word_ooxml(gt_tbl_1, caption_location = "embed"))
  expect_equal(length(xml_embed), 1)
  expect_equal(xml_name(xml_embed), c("tbl"))
  expect_equal(length(xml_find_all(xml_embed, "//w:tr")), 3)

  title <- xml_find_all(xml_embed, "(//w:p)[1]")[[1]]
  expect_equal(title, xml_top[[1]])
  subtitle <- xml_find_all(xml_embed, "(//w:p)[2]")[[1]]
  expect_equal(subtitle, xml_top[[2]])

  expect_equal(
    xml_find_all(xml_top, "(//w:tr)[1]")[[1]],
    xml_find_all(xml_embed, "(//w:tr)[2]")[[1]]
  )
  expect_equal(
    xml_find_all(xml_top, "(//w:tr)[2]")[[1]],
    xml_find_all(xml_embed, "(//w:tr)[3]")[[1]]
  )

  ## basic table with split enabled
  ## # expect_snapshot_ooxml_word(gt_tbl_1, split = TRUE)
  xml <- read_xml_word_nodes(as_word_ooxml(gt_tbl_1, split = FALSE))
  expect_equal(
    purrr::map_lgl(xml_find_all(xml, "//w:trPr"), \(x) {
      length(xml_find_all(x, ".//w:cantSplit")) == 1
    }),
    c(TRUE, TRUE)
  )

  ## basic table with autonum disabled
  # expect_snapshot_ooxml_word(gt_tbl_1, autonum = FALSE)
  xml <- read_xml_word_nodes(as_word_ooxml(gt_tbl_1, autonum = FALSE))
  expect_equal(xml_name(xml), c("p", "p", "tbl"))
  expect_snapshot(writeLines(as.character(xml[[1]])))
  expect_snapshot(writeLines(as.character(xml[[2]])))
  expect_snapshot(writeLines(as.character(xml[[3]])))


  ## basic table with keep_with_next disabled (should only appear in the column
  ## headers)
  ## #expect_snapshot_ooxml_word(gt_tbl_1, keep_with_next = FALSE)
  #
  # ## Table with cell styling
  # gt_tbl_2 <-
  #   exibble[1:4, ] |>
  #   gt(rowname_col = "char") |>
  #   tab_row_group("My Row Group 1", c(1:2)) |>
  #   tab_row_group("My Row Group 2", c(3:4)) |>
  #   tab_style(
  #     style = cell_fill(color = "orange"),
  #     locations = cells_body(columns = c(num, fctr, time, currency, group))
  #   ) |>
  #   tab_style(
  #     style = cell_fill(color = "orange"),
  #     locations = cells_body(columns = c(num, fctr, time, currency, group))
  #   ) |>
  #   tab_style(
  #     style = cell_text(
  #       color = "green",
  #       font = "Biome",
  #       style = "italic",
  #       weight = "bold"
  #     ),
  #     locations = cells_stub()
  #   ) |>
  #   tab_style(
  #     style = cell_text(color = "blue"),
  #     locations = cells_row_groups()
  #   )
  #
  # expect_snapshot_ooxml_word(gt_tbl_2, keep_with_next = FALSE)
  #
  # ## table with column and span styling
  # gt_exibble_min <-
  #   exibble[1:4, ] |>
  #   gt(rowname_col = "char") |>
  #   tab_row_group("My Row Group 1", c(1:2)) |>
  #   tab_row_group("My Row Group 2", c(3:4)) |>
  #   tab_spanner("My Span Label", columns = 1:5) |>
  #   tab_spanner("My Span Label top", columns = 2:4, level = 2) |>
  #   tab_style(
  #     style = cell_text(color = "purple"),
  #     locations = cells_column_labels()
  #   ) |>
  #   tab_style(
  #     style = cell_fill(color = "green"),
  #     locations = cells_column_labels()
  #   ) |>
  #   tab_style(
  #     style = cell_fill(color = "orange"),
  #     locations = cells_column_spanners("My Span Label")
  #   ) |>
  #   tab_style(
  #     style = cell_fill(color = "red"),
  #     locations = cells_column_spanners("My Span Label top")
  #   ) |>
  #   tab_style(
  #     style = cell_fill(color = "pink"),
  #     locations = cells_stubhead()
  #   ) |>
  #   as_word()
  #
  # gt_exibble_min_sha1 <- rlang::hash(gt_exibble_min)
  #
  # expect_equal(gt_exibble_min_sha1, "be8267d755328ebf90527242ff60c54c")
  #
  # ## basic table with linebreak in title
  # gt_tbl_linebreaks_md <-
  #   exibble_min |>
  #   gt() |>
  #   tab_header(
  #     title = md("TABLE <br> TITLE"),
  #     subtitle = md("table <br> subtitle")
  #   )
  #
  # expect_snapshot_ooxml_word(gt_tbl_linebreaks_md)
  #
  # ## basic table with linebreak in title
  # gt_tbl_linebreaks_html <-
  #   exibble_min |>
  #   gt() |>
  #   tab_header(
  #     title = html("TABLE <br> TITLE"),
  #     subtitle = html("table <br> subtitle")
  #   )
  #
  # expect_snapshot_ooxml_word(gt_tbl_linebreaks_html)
})

