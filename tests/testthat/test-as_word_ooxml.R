skip_on_cran()

test_that("word ooxml can be generated from gt object", {

  # Create a one-row table for these tests
  exibble_min <- exibble[1, ]

  ## basic table
  xml <- read_xml_word_nodes(as_word_ooxml(gt(exibble_min)))
  expect_equal(length(xml), 1)
  expect_equal(xml_name(xml), "tbl")
  expect_equal(length(xml_find_all(xml, "//w:keepNext")), 18)
  # TODO: explore xml more precisely than with a snapshot
  expect_xml_snapshot(xml)

  ## basic table with title
  # expect_snapshot_ooxml_word(gt_tbl_1)
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
  expect_equal(length(xml_find_all(xml_top, "//w:keepNext")), 20)
  # check autonum nodes
  expect_equal(length(xml_find_all(xml_top, "//w:tr")), 2)
  expect_equal(length(xml_find_all(xml_top, "//w:instrText")), 1)
  expect_equal(length(xml_find_all(xml_top, "//w:fldChar")), 3)

  ## basic table with title added below table
  xml_bottom <- read_xml_word_nodes(as_word_ooxml(gt_tbl_1, caption_location = "bottom"))
  expect_equal(length(xml_bottom), 3)
  expect_equal(xml_name(xml_bottom), c("tbl", "p", "p"))
  expect_equal(xml_top[[3]], xml_bottom[[1]])
  expect_equal(length(xml_find_all(xml_bottom, "//w:tr")), 2)
  expect_equal(length(xml_find_all(xml_bottom, "//w:keepNext")), 18)
  # expect_snapshot_ooxml_word(gt_tbl_1, caption_location = "bottom")

  ## basic table with title embedded on the top of table
  # expect_snapshot_ooxml_word(gt_tbl_1, caption_location = "embed")
  xml_embed <- read_xml_word_nodes(as_word_ooxml(gt_tbl_1, caption_location = "embed"))
  expect_equal(length(xml_embed), 1)
  expect_equal(xml_name(xml_embed), c("tbl"))
  expect_equal(length(xml_find_all(xml_embed, "//w:tr")), 3)
  expect_equal(length(xml_find_all(xml_embed, "//w:keepNext")), 20)

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
  ## expect_snapshot_ooxml_word(gt_tbl_1, split = TRUE)
  xml_split <- read_xml_word_nodes(as_word_ooxml(gt_tbl_1, split = FALSE))
  expect_equal(
    purrr::map_lgl(xml_find_all(xml_split, "//w:trPr"), \(x) {
      length(xml_find_all(x, ".//w:cantSplit")) == 1
    }),
    c(TRUE, TRUE)
  )
  expect_equal(length(xml_find_all(xml_split, "//w:keepNext")), 20)


  ## basic table with autonum disabled
  ## # expect_snapshot_ooxml_word(gt_tbl_1, autonum = FALSE)
  xml_autonum_false <- read_xml_word_nodes(as_word_ooxml(gt_tbl_1, autonum = FALSE))
  expect_equal(xml_name(xml_autonum_false), c("p", "p", "tbl"))
  expect_xml_snapshot(xml_autonum_false[[1]])
  expect_xml_snapshot(xml_autonum_false[[2]])
  expect_equal(length(xml_find_all(xml_autonum_false, "//w:instrText")), 0)
  expect_equal(length(xml_find_all(xml_autonum_false, "//w:fldChar")), 0)
  expect_equal(length(xml_find_all(xml_autonum_false, "//w:keepNext")), 20)

  ## basic table with keep_with_next disabled
  ## # expect_snapshot_ooxml_word(gt_tbl_1, keep_with_next = FALSE)
  xml_keep_next_false <- read_xml_word_nodes(as_word_ooxml(gt_tbl_1, keep_with_next = FALSE))
  expect_equal(length(xml_find_all(xml_keep_next_false, "//w:keepNext")), 0)
})

test_that("word ooxml can be generated from gt object with cell styling", {
  ## Table with cell styling
  gt_tbl_2 <-
    exibble[1:4, ] |>
    gt(rowname_col = "char") |>
    tab_row_group("My Row Group 1", c(1:2)) |>
    tab_row_group("My Row Group 2", c(3:4)) |>
    tab_style(
      style = cell_fill(color = "orange"),
      locations = cells_body(columns = c(num, fctr, time, currency, group))
    ) |>
    tab_style(
      style = cell_fill(color = "orange"),
      locations = cells_body(columns = c(num, fctr, time, currency, group))
    ) |>
    tab_style(
      style = cell_text(
        color = "green",
        font = "Biome",
        style = "italic",
        weight = "bold"
      ),
      locations = cells_stub()
    ) |>
    tab_style(
      style = cell_text(color = "blue"),
      locations = cells_row_groups()
    )
  xml <- read_xml_word_nodes(as_word_ooxml(gt_tbl_2, keep_with_next = FALSE))

  # row groups
  expect_equal(xml_attr(xml_find_all(xml, '//w:t[text() = "My Row Group 2"]/../w:rPr/w:color'), "val"), "0000FF")
  expect_equal(xml_attr(xml_find_all(xml, '//w:t[text() = "My Row Group 2"]/../w:rPr/w:sz'), "val"), "20")
  expect_equal(xml_attr(xml_find_all(xml, '//w:t[text() = "My Row Group 1"]/../w:rPr/w:color'), "val"), "0000FF")
  expect_equal(xml_attr(xml_find_all(xml, '//w:t[text() = "My Row Group 1"]/../w:rPr/w:sz'), "val"), "20")

  # body rows
  xml_body <- xml_find_all(xml, "//w:tr")[c(3, 4, 6, 7)]
  purrr::walk(xml_find_all(xml_body, "(.//w:tc)[1]//w:rPr"), \(node) {
    expect_equal(xml_attr(xml_find_all(node, ".//w:rFonts"), "ascii"), "Biome")
    expect_equal(xml_attr(xml_find_all(node, ".//w:sz"), "val"), "20")
    expect_equal(length(xml_find_all(node, ".//w:i")), 1)
    expect_equal(xml_attr(xml_find_all(node, ".//w:color"), "val"), "00FF00")
    expect_equal(xml_attr(xml_find_all(node, ".//w:b"), "val"), "true")
  })

  # orange cells
  purrr::walk(c(2, 3, 5, 7, 9), \(i) {
    shd <- xml_find_all(xml_body, paste0("(.//w:tc)[", i, "]/w:tcPr/w:shd"))
    expect_equal(xml_attr(shd, "fill"), rep("FFA500", 4))
    expect_equal(xml_attr(shd, "val"), rep("clear", 4))
    expect_equal(xml_attr(shd, "color"), rep("auto", 4))
  })

  # regular cells
  purrr::walk(c(4, 6, 8), \(i) {
    expect_equal(length(xml_find_all(xml_body, paste0("(.//w:tc)[", i, "]/w:tcPr/w:shd"))), 0)
  })

  # ## table with column and span styling
  gt_exibble_min <-
    exibble[1, ] |>
    gt() |>
    tab_spanner("My Span Label", columns = 1:5) |>
    tab_spanner("My Span Label top", columns = 2:4, level = 2) |>
    tab_style(
      style = cell_text(color = "purple"),
      locations = cells_column_labels()
    ) |>
    tab_style(
      style = cell_fill(color = "green"),
      locations = cells_column_labels()
    ) |>
    tab_style(
      style = cell_fill(color = "orange"),
      locations = cells_column_spanners("My Span Label")
    ) |>
    tab_style(
      style = cell_fill(color = "red"),
      locations = cells_column_spanners("My Span Label top")
    )

  xml <- read_xml_word_nodes(as_word_ooxml(gt_exibble_min))

  # level 2 span
  for (j in c(1, 3:7)) {
    expect_equal(xml_text(xml_find_all(xml, paste0("//w:tr[1]/w:tc[", j, "]//w:t"))), "")
  }
  xml_top_span <- xml_find_all(xml, "//w:tr[1]/w:tc[2]")
  expect_equal(xml_attr(xml_find_all(xml_top_span, "./w:tcPr/w:gridSpan"), "val"), "3")
  expect_equal(xml_attr(xml_find_all(xml_top_span, "./w:tcPr/w:shd"), "fill"), "FF0000")
  expect_equal(xml_text(xml_find_all(xml_top_span, ".//w:t")), "My Span Label top")

  # level 1 span
  xml_bottom_span <- xml_find_all(xml, "//w:tr[2]/w:tc[1]")
  expect_equal(xml_attr(xml_find_all(xml_bottom_span, "./w:tcPr/w:gridSpan"), "val"), "5")
  expect_equal(xml_attr(xml_find_all(xml_bottom_span, "./w:tcPr/w:shd"), "fill"), "FFA500")
  expect_equal(xml_text(xml_find_all(xml_bottom_span, ".//w:t")), "My Span Label")
  for (j in c(2:5)) {
    expect_equal(xml_text(xml_find_all(xml, paste0("//w:tr[2]/w:tc[", j, "]//w:t"))), "")
  }

  # columns
  # xml_find_all(xml, "//w:tr[3]/w:tc")



  # columns



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

