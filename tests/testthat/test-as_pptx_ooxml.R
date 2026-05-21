skip_on_cran()

test_that("parse_to_ooxml(pptx) creates the correct nodes", {
  expect_xml_snapshot(parse_to_ooxml("hello", "pptx"))
})

test_that("process_text() handles ooxml/pptx", {
  expect_equal(process_text("simple", context = "ooxml/pptx"), "simple")

  # <br>
  xml <- read_xml_pptx_nodes(process_text(md("simple <br> markdown"), context = "ooxml/pptx"))
  expect_equal(length(xml_find_all(xml, ".//a:p")), 2)
  expect_equal(xml_text(xml_find_all(xml, ".//a:t")),
    c("simple", "markdown")
  )

  # strong
  xml <- read_xml_pptx_nodes(process_text(md("simple **strong** markdown"), context = "ooxml/pptx"))
  expect_equal(length(xml_find_all(xml, ".//a:r")), 3)
  expect_equal(xml_text(xml_find_all(xml, ".//a:t")),
    c("simple ", "strong", " markdown")
  )
  expect_equal(
    xml_attr(xml_find_all(xml, ".//a:r/a:rPr"), "b"),
    c(NA, "1", NA)
  )

  # emph
  xml <- read_xml_pptx_nodes(process_text(md("simple *emph* markdown"), context = "ooxml/pptx"))
  expect_equal(length(xml_find_all(xml, ".//a:r")), 3)
  expect_equal(xml_text(xml_find_all(xml, ".//a:t")),
    c("simple ", "emph", " markdown")
  )
  expect_equal(
    xml_attr(xml_find_all(xml, ".//a:r/a:rPr"), "i"),
    c(NA, "1", NA)
  )

  # emph
  xml <- read_xml_pptx_nodes(process_text(md("simple __*emph/strong*__ markdown"), context = "ooxml/pptx"))
  expect_equal(length(xml_find_all(xml, ".//a:r")), 3)
  expect_equal(xml_text(xml_find_all(xml, ".//a:t")),
    c("simple ", "emph/strong", " markdown")
  )
  expect_equal(
    xml_attr(xml_find_all(xml, ".//a:r/a:rPr"), "i"),
    c(NA, "1", NA)
  )
  expect_equal(
    xml_attr(xml_find_all(xml, ".//a:r/a:rPr"), "b"),
    c(NA, "1", NA)
  )

  # code
  xml <- read_xml_pptx_nodes(process_text(md("can `be found` at"), context = "ooxml/pptx"))
  expect_equal(length(xml_find_all(xml, ".//a:r")), 3)
  expect_equal(xml_text(xml_find_all(xml, ".//a:t")),
    c("can ", "be found", " at")
  )
  expect_equal(
    xml_attr(xml_find_all(xml, ".//a:r[2]/a:rPr/a:latin"), "typeface"),
    "Consolas"
  )

  # link
  txt <- "[a website](https://daringfireball.net/projects/markdown/)"
  xml <- read_xml_pptx_nodes(process_text(md(txt), context = "ooxml/pptx"))
  expect_equal(length(xml_find_all(xml, ".//a:r")), 1)
  expect_equal(xml_text(xml_find_all(xml, ".//a:t")),
    c("https://daringfireball.net/projects/markdown/")
  )
  expect_equal(length(xml_find_all(xml, ".//a:rPr/a:u")), 1)
  expect_equal(xml_attr(xml_find_all(xml, ".//a:rPr/a:solidFill/a:srgbClr"), "val"), "0563C1")

  # heading
  txt <- "### This is Markdown."
  xml <- read_xml_pptx_nodes(process_text(md(txt), context = "ooxml/pptx"))
  expect_equal(length(xml_find_all(xml, ".//a:p")), 1)
  expect_equal(xml_text(xml_find_all(xml, ".//a:t")), "This is Markdown.")
  expect_equal(xml_attr(xml_find_all(xml, ".//a:rPr"), "sz"), "1400")

  # list
  txt <- glue::glue('
  - one
  - two
    - indent three
    - indent four
')
  xml <- read_xml_pptx_nodes(process_text(md(txt), context = "ooxml/pptx"))
  expect_equal(length(xml_find_all(xml, ".//a:p")), 4)
  expect_equal(
    xml_attr(xml_find_all(xml, ".//a:pPr"), "lvl"),
    c("0", "0", "1", "1")
  )
  expect_equal(
    xml_attr(xml_find_all(xml, ".//a:pPr/a:buChar"), "char"),
    rep("-", 4)
  )

  txt <- glue::glue('
  1. one
  1. two
      1. three
')
  xml <- read_xml_pptx_nodes(process_text(md(txt), context = "ooxml/pptx"))
  expect_equal(length(xml_find_all(xml, ".//a:p")), 3)
  expect_equal(
    xml_attr(xml_find_all(xml, ".//a:pPr"), "lvl"),
    c("0", "0", "1")
  )
  expect_equal(
    xml_attr(xml_find_all(xml, ".//a:pPr/a:buAutoNum"), "type"),
    rep("arabicPeriod", 3)
  )

  # softbreak
  txt <- 'yada\nyada\nyada'
  xml <- read_xml_pptx_nodes(process_text(md(txt), context = "ooxml/pptx"))
  expect_equal(length(xml_find_all(xml, ".//a:r/a:t[text() = ' ']")), 2)
})

test_that("pptx ooxml can be generated from gt object", {

  # Create a one-row table for these tests
  exibble_min <- exibble[1, ]

  ## basic table
  xml <- read_xml_pptx_nodes(as_pptx_ooxml(gt(exibble_min)))
  expect_xml_snapshot(xml)

  expect_equal(length(xml), 1)
  expect_equal(xml_name(xml), "tbl")

  # make sure there is an expliti noFill
  expect_equal(
    length(xml_find_all(xml, "//a:tcPr/a:noFill")),
    length(xml_find_all(xml, "//a:tcPr"))
  )

  expect_equal(
    xml_attr(xml_find_all(xml, "(//a:tr)[1]//a:pPr"), "algn"),
    c("r", "l", "ctr", "r", "r", "r", "r", "l", "l")
  )

  expect_equal(
    xml_attr(xml_find_all(xml, "(//a:tr)[2]//a:pPr"), "algn"),
    c("r", "l", "ctr", "r", "r", "r", "r", "l", "l")
  )

  ## basic table with title
  gt_tbl_1 <-
    exibble_min |>
    gt() |>
    tab_header(
      title = "TABLE TITLE",
      subtitle = "table subtitle"
    )
  xml_top <- read_xml_pptx_nodes(as_pptx_ooxml(gt_tbl_1))
  expect_equal(length(xml_top), 3)
  expect_equal(xml_name(xml_top), c("p", "p", "tbl"))
  expect_xml_snapshot(xml_top[[1]])
  expect_xml_snapshot(xml_top[[2]])

  ## basic table with title added below table
  xml_bottom <- read_xml_pptx_nodes(as_pptx_ooxml(gt_tbl_1, caption_location = "bottom"))
  expect_equal(length(xml_bottom), 3)
  expect_equal(xml_name(xml_bottom), c("tbl", "p", "p"))
  expect_equal(xml_top[[3]], xml_bottom[[1]])
  expect_equal(length(xml_find_all(xml_bottom, "//a:tr")), 2)

  ## basic table with title embedded on the top of table
  xml_embed <- read_xml_pptx_nodes(as_pptx_ooxml(gt_tbl_1, caption_location = "embed"))
  expect_equal(length(xml_embed), 1)
  expect_equal(xml_name(xml_embed), c("tbl"))
  expect_equal(length(xml_find_all(xml_embed, "//a:tr")), 3)

  expect_equal(
    xml_find_all(xml_top, "(//a:tr)[1]")[[1]],
    xml_find_all(xml_embed, "(//a:tr)[2]")[[1]]
  )
  expect_equal(
    xml_find_all(xml_top, "(//a:tr)[2]")[[1]],
    xml_find_all(xml_embed, "(//a:tr)[3]")[[1]]
  )
})

test_that("pptx ooxml can be generated from gt object with cell styling", {
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
  xml <- read_xml_pptx_nodes(as_pptx_ooxml(gt_tbl_2))

  # row groups
  expect_equal(xml_attr(xml_find_all(xml, '//a:t[text() = "My Row Group 2"]/../..//a:defRPr/a:solidFill/a:srgbClr'), "val"), "0000FF")
  expect_equal(xml_attr(xml_find_all(xml, '//a:t[text() = "My Row Group 2"]/../a:rPr'), "sz"), "1000")
  expect_equal(xml_attr(xml_find_all(xml, '//a:t[text() = "My Row Group 1"]/../..//a:defRPr/a:solidFill/a:srgbClr'), "val"), "0000FF")
  expect_equal(xml_attr(xml_find_all(xml, '//a:t[text() = "My Row Group 1"]/../a:rPr'), "sz"), "1000")

  # body rows
  xml_body <- xml_find_all(xml, "//a:tr")[c(3, 4, 6, 7)]
  for (node in xml_body){
    expect_equal(xml_attr(xml_find_all(node, ".//a:latin"), "typeface"), rep(c("Biome", "Calibri"), c(1L, 8L)))
    expect_equal(xml_attr(xml_find_all(node, ".//a:rPr"), "sz"), rep("1000", 9))
    expect_equal(xml_attr(xml_find_all(node, ".//a:rPr"), "i"), c("1", rep(NA, 8)))
    expect_equal(xml_attr(xml_find_all(node, ".//a:defRPr/a:solidFill/a:srgbClr"), "val"), "00FF00")
    expect_equal(xml_attr(xml_find_all(node, ".//a:rPr"), "b"), c("1", rep(NA, 8)))
  }

  # orange cells
  for (i in c(2, 3, 5, 7, 9)) {
    expect_equal(
      xml_attr(xml_find_all(xml_body, paste0("(.//a:tc)[", i, "]/a:tcPr/a:solidFill/a:srgbClr")), "val"),
      rep("FFA500", 4)
    )
  }

  # regular cells
  for (i in c(4, 6, 8)) {
    expect_equal(length(xml_find_all(xml_body, paste0("(.//a:tc)[", i, "]/a:tcPr/a:solidFill/a:srgbClr"))), 0)
  }

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

  xml <- read_xml_pptx_nodes(as_pptx_ooxml(gt_exibble_min))

  # level 2 span

  for (j in c(3:4)) {
    expect_equal(xml_attr(xml_find_all(xml, paste0("//a:tr[1]//a:tc[", j, "]")), "hMerge"), "1")
  }
  for (j in c(1, 5:9)) {
    expect_equal(xml_text(xml_find_all(xml, paste0("//a:tr[1]/a:tc[", j, "]//a:t"))), "")
  }
  xml_top_span <- xml_find_all(xml, "//a:tr[1]/a:tc[2]")
  expect_equal(xml_attr(xml_top_span, "gridSpan"), "3")
  expect_equal(xml_attr(xml_find_all(xml_top_span, "./a:tcPr/a:solidFill/a:srgbClr"), "val"), "FF0000")
  expect_equal(xml_text(xml_find_all(xml_top_span, ".//a:t")), "My Span Label top")

  # level 1 span
  xml_bottom_span <- xml_find_all(xml, "//a:tr[2]/a:tc[1]")
  expect_equal(xml_attr(xml_bottom_span, "gridSpan"), "5")
  expect_equal(xml_attr(xml_find_all(xml_bottom_span, "./a:tcPr/a:solidFill/a:srgbClr"), "val"), "FFA500")
  expect_equal(xml_text(xml_find_all(xml_bottom_span, ".//a:t")), "My Span Label")

  for (j in c(3:5)) {
    expect_equal(xml_attr(xml_find_all(xml, paste0("//a:tr[2]//a:tc[", j, "]")), "hMerge"), "1")
  }
  for (j in c(6:9)) {
    expect_equal(xml_text(xml_find_all(xml, paste0("//a:tr[2]/a:tc[", j, "]//a:t"))), "")
  }

  # columns
  expect_equal(
    xml_attr(xml_find_all(xml_bottom_span, "//a:tr[3]/a:tc/a:tcPr/a:solidFill/a:srgbClr"), "val"),
    rep("00FF00", 9)
  )

})

test_that("pptx ooxml handles md() and html()", {

  # Create a one-row table for these tests
  exibble_min <- exibble[1, ]

  ## basic table with linebreak in title
  gt_tbl_linebreaks_md <-
    exibble_min |>
    gt() |>
    tab_header(
      title = md("TABLE <br> TITLE"),
      subtitle = md("table <br> subtitle")
    )
  xml <- read_xml_pptx_nodes(as_pptx_ooxml(gt_tbl_linebreaks_md))
  expect_equal(
    xml_text(xml_find_all(xml[[1]], "(.//a:r)[last()]//a:t")),
    "TABLE"
  )
  expect_equal(xml_text(xml_find_all(xml[[2]], ".//a:r//a:t")), "TITLE")
  expect_equal(xml_text(xml_find_all(xml[[3]], ".//a:r//a:t")), "table")
  expect_equal(xml_text(xml_find_all(xml[[4]], ".//a:r//a:t")), "subtitle")

  ## basic table with linebreak in title
  gt_tbl_linebreaks_html <-
    exibble_min |>
    gt() |>
    tab_header(
      title = html("TABLE <br> TITLE"),
      subtitle = html("table <br> subtitle")
    )

  xml <- read_xml_pptx_nodes(as_pptx_ooxml(gt_tbl_linebreaks_md))
  expect_equal(
    xml_text(xml_find_all(xml[[1]], "(.//a:r)[last()]//a:t")),
    "TABLE"
  )
  expect_equal(xml_text(xml_find_all(xml[[2]], ".//a:r//a:t")), "TITLE")
  expect_equal(xml_text(xml_find_all(xml[[3]], ".//a:r//a:t")), "table")
  expect_equal(xml_text(xml_find_all(xml[[4]], ".//a:r//a:t")), "subtitle")
})

test_that("pptx ooxml escapes special characters in gt object", {
  df <- data.frame(special_characters = "><&\n\r\"'", stringsAsFactors = FALSE)
  xml <- read_xml_pptx_nodes(as_pptx_ooxml(gt(df)))

  expect_equal(
    as.character(xml_find_all(xml, "(//a:t)[last()]/text()")),
    "&gt;&lt;&amp; \"'"
  )

})

test_that("word ooxml escapes special characters in gt object footer", {

  gt_tbl <- gt(data.frame(num = 1)) |>
    tab_footnote(footnote = "p < .05, ><&\n\r\"'")

  xml <- read_xml_pptx_nodes(as_pptx_ooxml(gt_tbl))
  expect_equal(
    as.character(xml_find_all(xml, "//a:tr[last()]//a:t/text()")),
    "p &lt; .05, &gt;&lt;&amp; \"'"
  )
})

test_that("multicolumn stub are supported", {
  test_data <- dplyr::tibble(
    mfr = c("Ford", "Ford", "BMW", "BMW", "Audi"),
    model = c("GT", "F-150", "X5", "X3", "A4"),
    trim = c("Base", "XLT", "xDrive35i", "sDrive28i", "Premium"),
    year = c(2017, 2018, 2019, 2020, 2021),
    hp = c(647, 450, 300, 228, 261),
    msrp = c(447000, 28000, 57000, 34000, 37000)
  )

  # Three-column stub
  triple_stub <- gt(test_data, rowname_col = c("mfr", "model", "trim"))

  # The merge cells on the first column
  xml <- read_xml_pptx_nodes(as_pptx_ooxml(triple_stub))
  nodes_Ford <- xml_find_all(xml, ".//a:t[. = 'Ford']")
  expect_equal(length(nodes_Ford), 1)
  expect_equal(xml_attr(xml_find_all(nodes_Ford, "../../../..//a:rowSpan"), "val"), "2")

  nodes_BMW <- xml_find_all(xml, ".//a:t[. = 'BMW']")
  expect_equal(xml_attr(xml_find_all(nodes_BMW, "../../../..//a:rowSpan"), "val"), "2")
  expect_equal(length(nodes_BMW), 1)

  nodes_Audi <- xml_find_all(xml, ".//a:t[. = 'Audi']")
  expect_equal(length(xml_find_all(nodes_Audi[[1]], "../../../..//a:rowSpan")), 0)

  # no other merge cells
  expect_equal(length(xml_find_all(xml, ".//a:rowSpan")), 2)

  # no stub head, i.e. empty text
  expect_equal(
    xml_text(xml_find_all(xml, "(.//a:tr)[1]//a:t")),
    c("", "year", "hp", "msrp")
  )

  tc <- xml_find_all(xml, "(.//a:tr)[1]/a:tc")
  expect_equal(xml_attr(tc[[1]], "gridSpan"), "3")

  # one label: merged
  xml <- test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead("one") |>
    as_pptx_ooxml() %>%
    read_xml_pptx_nodes()

  tc <- xml_find_all(xml, "(.//a:tr)[1]/a:tc")
  expect_equal(xml_attr(tc[[1]], "gridSpan"), "3")

  expect_equal(
    xml_text(xml_find_all(xml, "(.//a:tr)[1]//a:t")),
    c("one", "year", "hp", "msrp")
  )

  # 3 labels
  xml <- test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(c("one", "two", "three")) |>
    as_pptx_ooxml() %>%
    read_xml_pptx_nodes()

  expect_equal(
    xml_text(xml_find_all(xml, "(.//a:tr)[1]//a:t")),
    c("one", "two", "three", "year", "hp", "msrp")
  )

  # add spanner
  xml <- test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(c("one", "two", "three")) |>
    tab_spanner(label = "span", columns = c(hp, msrp)) |>
    as_pptx_ooxml() %>%
    read_xml_pptx_nodes()

  expect_equal(
    xml_text(xml_find_all(xml, "(.//a:tr)[1]//a:t")),
    c("one", "two", "three", "", "span")
  )

  tcPr <- xml_find_all(xml, "(.//a:tr)[1]/a:tc/a:tcPr")
  expect_equal(length(tcPr), 6)
  for (i in 1:3) {
    expect_equal(xml_attr(xml_find_all(tcPr[[i]], ".//a:rowSpan"), "val"), "2")
  }
  expect_equal(xml_attr(xml_find_all(xml, "(.//a:tr)[1]/a:tc[5]"), "gridSpan"), "2")

  # second row
  tcPr <- xml_find_all(xml, "(.//a:tr)[2]/a:tc/a:tcPr")
  expect_equal(length(tcPr), 3)
  expect_equal(length(xml_find_all(tcPr, ".//a:rowSpan")), 0)

  # spanner - one label
  xml <- test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(c("one")) |>
    tab_spanner(label = "span", columns = c(hp, msrp)) |>
    as_pptx_ooxml() %>%
    read_xml_pptx_nodes()

  expect_equal(
    xml_text(xml_find_all(xml, "(.//a:tr)[1]//a:t")),
    c("one", "", "span")
  )

  # first row
  tcPr <- xml_find_all(xml, "(.//a:tr)[1]/a:tc/a:tcPr")
  expect_equal(xml_attr(xml_find_all(tcPr[[1]], ".//a:rowSpan"), "val"), "2")
  expect_equal(xml_attr(xml_find_all(xml, "(.//a:tr)[1]/a:tc"), "gridSpan"), c("3", NA, "2", NA))

  # second row
  tcPr <- xml_find_all(xml, "(.//a:tr)[2]/a:tc/a:tcPr")
  expect_equal(length(xml_find_all(tcPr[[1]], ".//a:rowSpan")), 0)
})

test_that("tables can be added to a pptx doc", {
  ## simple table
  gt_exibble_min <-
    exibble[1:2, ] |>
    gt() |>
    tab_header(
      title = "table title",
      subtitle = "table subtitle"
    )

  slide <- gt_to_pptx_slide(gt_exibble_min)[[1]]

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:sp[1]//a:t")),
    "table title"
  )
  expect_equal(
    xml_text(xml_find_all(slide, ".//p:sp[2]//a:t")),
    "table subtitle"
  )
  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[1]//a:t")),
    c("num", "char", "fctr", "date", "time", "datetime", "currency", "row", "group")
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[2]//a:t")),
    c("0.1111", "apricot", "one", "2015-01-15", "13:35", "2018-01-01 02:22","49.95", "row_1", "grp_a")
  )
  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[3]//a:t")),
    c("2.2220", "banana", "two", "2015-02-15", "14:40", "2018-02-02 14:33", "17.95", "row_2", "grp_a")
  )
})

test_that("tables with special characters can be added to a pptx doc", {
  skip_on_ci()

  ## simple table
  gt_exibble_min <-
    data.frame(special_characters = "><&\"'", stringsAsFactors = FALSE) |>
    gt() |>
    tab_header(
      title = "table title",
      subtitle = "table subtitle"
    )

  slide <- gt_to_pptx_slide(gt_exibble_min)[[1]]

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:sp[1]//a:t")),
    "table title"
  )
  expect_equal(
    xml_text(xml_find_all(slide, ".//p:sp[2]//a:t")),
    "table subtitle"
  )
  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[1]//a:t")),
    c("special_characters")
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[2]//a:t")),
    c("><&\"'")
  )
})

test_that("tables with embedded titles can be added to a pptx doc", {
  ## simple table
  gt_exibble_min <-
    exibble[1:2, ] |>
    gt() |>
    tab_header(
      title = "table title",
      subtitle = "table subtitle"
    )

  slide <- gt_to_pptx_slide(gt_exibble_min, caption_location = "embed")[[1]]

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[1]//a:t")),
    c("table title", "table subtitle")
  )
  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[2]//a:t")),
    c("num", "char", "fctr", "date", "time", "datetime", "currency", "row", "group")
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[3]//a:t")),
    c("0.1111", "apricot", "one", "2015-01-15", "13:35", "2018-01-01 02:22","49.95", "row_1", "grp_a")
  )
  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[4]//a:t")),
    c("2.2220", "banana", "two", "2015-02-15", "14:40", "2018-02-02 14:33", "17.95", "row_2", "grp_a")
  )
})

test_that("tables with spans can be added to a pptx doc", {
  ## simple table
  gt_exibble_min <-
    exibble[1:2, ] |>
    gt() |>
    tab_header(
      title = "table title",
      subtitle = "table subtitle"
    ) |>
    ## add spanner across columns 1:5
    tab_spanner(
      "My Column Span",
      columns = 3:5
    )

  slide <- gt_to_pptx_slide(gt_exibble_min)[[1]]

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:sp[1]//a:t")),
    "table title"
  )
  expect_equal(
    xml_text(xml_find_all(slide, ".//p:sp[2]//a:t")),
    "table subtitle"
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[1]//a:t")),
    rep(c("", "My Column Span", ""), c(2L, 1L, 4L))
  )
  expect_equal(
    xml_attr(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[1]//a:tc"), "gridSpan"),
    c(NA, NA, "3", NA, NA, NA, NA, NA, NA)
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[2]//a:t")),
    c("num", "char", "fctr", "date", "time", "datetime", "currency", "row", "group")
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[3]//a:t")),
    c("0.1111", "apricot", "one", "2015-01-15", "13:35", "2018-01-01 02:22","49.95", "row_1", "grp_a")
  )
  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[4]//a:t")),
    c("2.2220", "banana", "two", "2015-02-15", "14:40", "2018-02-02 14:33", "17.95", "row_2", "grp_a")
  )

})

test_that("tables with multi-level spans can be added to a pptx doc", {
  ## simple table
  gt_exibble_min <-
    exibble[1:2, ] |>
    gt() |>
    tab_header(
      title = "table title",
      subtitle = "table subtitle"
    ) |>
    ## add spanner across columns 1:5
    tab_spanner(
      "My 1st Column Span L1",
      columns = 1:5
    ) |>
    tab_spanner(
      "My Column Span L2",
      columns = 2:5,level = 2
    ) |>
    tab_spanner(
      "My 2nd Column Span L1",
      columns = 8:9
    )

  slide <- gt_to_pptx_slide(gt_exibble_min)[[1]]

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:sp[1]//a:t")),
    "table title"
  )
  expect_equal(
    xml_text(xml_find_all(slide, ".//p:sp[2]//a:t")),
    "table subtitle"
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[1]//a:t")),
    c("", "My Column Span L2", "", "", "", "")
  )
  expect_equal(
    xml_attr(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[1]//a:tc"), "gridSpan"),
    c(NA, "4", NA, NA, NA, NA, NA, NA, NA)
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[2]//a:t")),
    c("My 1st Column Span L1", "", "", "My 2nd Column Span L1")
  )
  expect_equal(
    xml_attr(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[2]//a:tc"), "gridSpan"),
    c("5", NA, NA, NA, NA, NA, NA, "2", NA)
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[3]//a:t")),
    c("num", "char", "fctr", "date", "time", "datetime", "currency", "row", "group")
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[4]//a:t")),
    c("0.1111", "apricot", "one", "2015-01-15", "13:35", "2018-01-01 02:22","49.95", "row_1", "grp_a")
  )
  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[5]//a:t")),
    c("2.2220", "banana", "two", "2015-02-15", "14:40", "2018-02-02 14:33", "17.95", "row_2", "grp_a")
  )

})

test_that("tables with footnotes can be added to a pptx doc", {
  ## simple table
  gt_exibble_min <-
    exibble[1:2, ] |>
    gt() |>
    tab_footnote(
      footnote = md("this is a footer example"),
      locations = cells_column_labels(columns = num )
    ) |>
    tab_footnote(
      footnote = md("this is a second footer example"),
      locations = cells_column_labels(columns = char )
    )

  # check the xml
  xml <- read_xml_pptx_nodes(as_pptx_ooxml(gt_exibble_min))
  xml_note_num <- xml_find_all(xml, './/a:t[text() = "num"]/../../a:r[last()]')
  expect_true(as.numeric(xml_attr(xml_find_all(xml_note_num, ".//a:rPr"), "baseline")) > 0)
  expect_equal(xml_text(xml_find_all(xml_note_num, ".//a:t")), "1")

  xml_note_char <- xml_find_all(xml, './/a:t[text() = "char"]/../../a:r[last()]')
  expect_true(as.numeric(xml_attr(xml_find_all(xml_note_num, ".//a:rPr"), "baseline")) > 0)
  expect_equal(xml_text(xml_find_all(xml_note_char, ".//a:t")), "2")

  expect_equal(
    xml_text(xml_find_all(xml, './/a:tr[last()]//a:r/a:t')),
    c("2", "this is a second footer example")
  )
  expect_equal(
    xml_attr(xml_find_all(xml, './/a:tr[last()]//a:rPr'), "baseline"),
    c("30000", NA)
  )
  expect_equal(
    xml_text(xml_find_all(xml, './/a:tr[last() - 1]//a:r/a:t')),
    c("1", "this is a footer example")
  )
  expect_equal(
    xml_attr(xml_find_all(xml, './/a:tr[last() - 1]//a:rPr'), "baseline"),
    c("30000", NA)
  )

  slide <- gt_to_pptx_slide(gt_exibble_min)[[1]]

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[1]//a:t")),
    c("num", "1", "char", "2", "fctr", "date", "time", "datetime", "currency", "row", "group")
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[4]//a:t")),
    c("1", "this is a footer example")
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[5]//a:t")),
    c("2", "this is a second footer example")
  )
})

test_that("tables with source notes can be added to a pptx doc", {
  ## simple table
  gt_exibble_min <-
    exibble[1:2, ] |>
    gt() |>
    tab_source_note(source_note = "this is a source note example")

  # check the xml
  xml <- read_xml_pptx_nodes(as_pptx_ooxml(gt_exibble_min))
  expect_equal(
    xml_text(xml_find_all(xml, ".//a:tr[last()]")),
    "this is a source note example"
  )
  expect_equal(
    xml_attr(xml_find_all(xml, ".//a:tr[last()]//a:tc"), "gridSpan"),
    c("9", rep(NA, 8))
  )

  slide <- gt_to_pptx_slide(gt_exibble_min)[[1]]

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[1]//a:t")),
    c("num", "char", "fctr", "date", "time", "datetime", "currency", "row", "group")
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//p:graphicFrame//a:tbl/a:tr[4]//a:t")),
    c("this is a source note example")
  )

})

test_that("long tables can be added to a pptx doc", {
  ## simple table
  gt_letters <-
    dplyr::tibble(
      upper_case = c(LETTERS,LETTERS),
      lower_case = c(letters,letters)
    ) |>
    gt() |>
    tab_header(title = "LETTERS")

  slide <- gt_to_pptx_slide(gt_letters)[[1]]

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr//a:tc[1]//a:t")),
    c("upper_case", LETTERS, LETTERS)
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr//a:tc[2]//a:t")),
    c("lower_case", letters, letters)
  )
})

test_that("long tables with spans can be added to a word doc", {
  ## simple table
  gt_letters <-
    dplyr::tibble(
      upper_case = c(LETTERS,LETTERS),
      lower_case = c(letters,letters)
    ) |>
    gt() |>
    tab_header(title = "LETTERS") |>
    tab_spanner(
      "LETTERS",
      columns = 1:2
    )

  slide <- gt_to_pptx_slide(gt_letters)[[1]]

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[1]//a:t")),
    c("LETTERS")
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[position() > 1]//a:tc[1]//a:t")),
    c("upper_case", LETTERS, LETTERS)
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[position() > 1]//a:tc[2]//a:t")),
    c("lower_case", letters, letters)
  )
})

test_that("tables with cell & text coloring can be added to a pptx doc - no spanner", {

  ## simple table
  gt_exibble_min <-
    exibble[1:4, ] |>
    gt(rowname_col = "char") |>
    tab_row_group("My Row Group 1", c(1:2)) |>
    tab_row_group("My Row Group 2", c(3:4)) |>
    tab_style(
      style = cell_fill(color = "orange"),
      locations = cells_body(columns = c(num, fctr, time, currency, group))
    ) |>
    tab_style(
      style = cell_text(
        color = "green",
        font = "Biome"
      ),
      locations = cells_stub()
    ) |>
    tab_style(
      style = cell_text(size = 25, v_align = "middle"),
      locations = cells_body(columns = c(num, fctr, time, currency, group))
    ) |>
    tab_style(
      style = cell_text(
        color = "blue",
        stretch = "extra-expanded"
      ),
      locations = cells_row_groups()
    ) |>
    tab_style(
      style = cell_text(color = "teal"),
      locations = cells_column_labels()
    ) |>
    tab_style(
      style = cell_fill(color = "green"),
      locations = cells_column_labels()
    ) |>
    tab_style(
      style = cell_fill(color = "pink"),
      locations = cells_stubhead()
    )

  slide <- gt_to_pptx_slide(gt_exibble_min)[[1]]

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[1]//a:t")),
    c("", "num", "fctr", "date", "time", "datetime", "currency", "row", "group")
  )

  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[1]//a:tcPr/a:solidFill/a:srgbClr"), "val"),
    c("FFC0CB", "00FF00", "00FF00", "00FF00", "00FF00", "00FF00", "00FF00", "00FF00", "00FF00")
  )

  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[1]//a:defRPr/a:solidFill/a:srgbClr"), "val"),
    rep("008080", 8)
  )

  group_rows <- c(2, 5)
  for (i in group_rows) {
    expect_equal(
      xml_attr(xml_find_all(slide, glue::glue(".//a:tr[{i}]//a:tcPr/a:solidFill//a:srgbClr")), "val"),
      character(0)
    )

    expect_equal(
      xml_attr(xml_find_all(slide, glue::glue(".//a:tr[{i}]//a:tc[1]//a:defRPr/a:solidFill//a:srgbClr")), "val"),
      "0000FF"
    )
  }

  for (i in c(3, 4, 6, 7)) {
    col <- character(8)
    for (j in 1:9) {
      x <- xml_attr(xml_find_all(slide, glue::glue(".//a:tr[{i}]/a:tc[{j}]/a:tcPr/a:solidFill//a:srgbClr")), "val")
      col[j] <- if (length(x) == 0) "" else x
    }
    expect_equal(
      col,
      c("", "FFA500", "FFA500", "", "FFA500", "", "FFA500", "", "FFA500")
    )

    expect_equal(
      xml_attr(xml_find_all(slide, glue::glue(".//a:tr[{i}]//a:tc[1]//a:defRPr/a:solidFill//a:srgbClr")), "val"),
      "00FF00"
    )

    expect_equal(
      length(xml_find_all(slide, glue::glue(".//a:tr[{i}]//a:tc//a:defRPr/a:solidFill//a:srgbClr"))),
      1
    )
  }

  expected <- list(
    "My Row Group 2",
    c("coconut","33.3300","three","2015-03-15","15:45","2018-03-03 03:44","1.39","row_3","grp_a"),
    c("durian","444.4000","four","2015-04-15","16:50","2018-04-04 15:55","65100.00","row_4","grp_a"),
    "My Row Group 1",
    c("apricot","0.1111","one","2015-01-15","13:35","2018-01-01 02:22","49.95","row_1","grp_a"),
    c("banana","2.2220","two","2015-02-15","14:40","2018-02-02 14:33","17.95","row_2","grp_a")
  )

  for (i in 1:6) {
    expect_equal(expected[[i]], xml_text(xml_find_all(slide, glue::glue(".//a:tr[{i + 1}]//a:t"))))
  }

})

test_that("tables with cell & text coloring can be added to a word doc - with spanners", {
  ## simple table
  gt_exibble_min <-
    exibble[1:4, ] |>
    gt(rowname_col = "char") |>
    tab_row_group("My Row Group 1", c(1:2)) |>
    tab_row_group("My Row Group 2", c(3:4)) |>
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
    ) |>
    tab_style(
      style = cell_fill(color = "pink"),
      locations = cells_stubhead()
    )

  slide <- gt_to_pptx_slide(gt_exibble_min, align = "center")[[1]]

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[1]//a:t")),
    rep(c("", "My Span Label top", ""), c(2L, 1L, 5L))
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[2]//a:t")),
    rep(c("My Span Label", ""), c(1L, 4L))
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[3]//a:t")),
    c("num", "fctr", "date", "time", "datetime", "currency", "row", "group")
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[4]//a:t")),
    "My Row Group 2"
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[5]//a:t")),
    c("coconut", "33.3300", "three", "2015-03-15", "15:45", "2018-03-03 03:44","1.39", "row_3", "grp_a")
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[6]//a:t")),
    c("durian", "444.4000", "four", "2015-04-15", "16:50", "2018-04-04 15:55","65100.00", "row_4", "grp_a")
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[7]//a:t")),
    "My Row Group 1"
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[8]//a:t")),
    c("apricot", "0.1111", "one", "2015-01-15", "13:35", "2018-01-01 02:22","49.95", "row_1", "grp_a")
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[9]//a:t")),
    c("banana", "2.2220", "two", "2015-02-15", "14:40", "2018-02-02 14:33", "17.95","row_2", "grp_a")
  )

  # stub cell
  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[1]//a:tc[1]//a:tcPr/a:solidFill/a:srgbClr"), "val"),
    "FFC0CB"
  )

  # My Span Label top
  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[1]//a:tc[3]//a:tcPr/a:solidFill/a:srgbClr"), "val"),
    "FF0000"
  )

  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[2]//a:tc[1]//a:tcPr/a:solidFill/a:srgbClr"), "val"),
    "FFA500"
  )

  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[3]//a:tc//a:tcPr/a:solidFill/a:srgbClr"), "val"),
    rep("00FF00", 8L)
  )

  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[3]//a:tc//a:defRPr/a:solidFill/a:srgbClr"), "val"),
    rep("A020F0", 8L)
  )

})

test_that("tables with cell & text coloring can be added to a word doc - with source_notes and footnotes", {
  ## simple table
  gt_exibble_min <-
    exibble[1:2, ] |>
    gt() |>
    tab_source_note("My Source Note") |>
    tab_footnote("My Footnote") |>
    tab_footnote(
      "My Footnote 2",
      locations = cells_column_labels(1)
    ) |>
    tab_style(
      style = cell_text(color = "orange"),
      locations = cells_source_notes()
    ) |>
    tab_style(
      style = cell_text(color = "purple"),
      locations = cells_footnotes()
    )

  slide <- gt_to_pptx_slide(gt_exibble_min, align = "center")[[1]]

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[1]//a:t")),
    c("num", "1", "char", "fctr", "date", "time", "datetime", "currency", "row", "group")
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[2]//a:t")),
    c("0.1111", "apricot", "one", "2015-01-15", "13:35", "2018-01-01 02:22","49.95", "row_1", "grp_a")
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[3]//a:t")),
    c("2.2220", "banana", "two", "2015-02-15", "14:40", "2018-02-02 14:33", "17.95","row_2", "grp_a")
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[4]//a:t")),
    "My Footnote"
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[5]//a:t")),
    c("1", "My Footnote 2")
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[6]//a:t")),
    "My Source Note"
  )

  # note marks
  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[1]//a:tc[1]//a:r[2]//a:rPr"), "baseline"),
    "30000"
  )
  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[1]//a:tc[1]//a:r[2]//a:rPr"), "i"),
    "1"
  )

  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[5]//a:tc[1]//a:r[1]//a:rPr"), "baseline"),
    "30000"
  )
  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[5]//a:tc[1]//a:r[1]//a:rPr"), "i"),
    "1"
  )


  # footnote colors
  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[4]//a:tc//a:defRPr/a:solidFill/a:srgbClr"), "val"),
    "A020F0"
  )

  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[5]//a:tc//a:defRPr/a:solidFill/a:srgbClr"), "val"),
    "A020F0"
  )

  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[6]//a:tc//a:defRPr/a:solidFill/a:srgbClr"), "val"),
    "FFA500"
  )

})

test_that("footnotes styling gets applied to footer marks", {
  ## simple table
  gt_exibble_min <-
    exibble[1:2, ] |>
    gt() |>
    tab_footnote("My Footnote") |>
    tab_footnote("My Footnote 2", locations = cells_column_labels(1)) |>
    opt_footnote_spec(spec_ftr = "(b)")

  slide <- gt_to_pptx_slide(gt_exibble_min, align = "center")[[1]]

  # first note
  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[last()-1]//a:t")),
    "My Footnote"
  )
  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[last()-1]//a:rPr"), "b"),
    NA_character_
  )

  # second note
  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[last()]//a:t")),
    c("(1)", "My Footnote 2")
  )
  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[last()]//a:r[1]/a:rPr"), "b"), "1"
  )
  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[last()]//a:r[1]/a:rPr"), "baseline"),
    NA_character_
  )

})

test_that("tables preserves spaces in text & can be added to a pptx doc", {
  skip_on_ci()

  ## simple table
  gt_exibble <-
    exibble[1, 1] |>
    dplyr::mutate(
      `5 Spaces Before` = "     Preserve",
      `5 Spaces After` = "Preserve     ",
      `5 Spaces Before - preserve` = "     Preserve",
      `5 Spaces After - preserve` = "Preserve     ") |>
    gt() |>
    tab_style(
      style = cell_text(whitespace = "pre"),
      locations = cells_body(columns = contains("preserve"))
    )

  slide <- gt_to_pptx_slide(gt_exibble, align = "center")[[1]]

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[1]//a:t")),
    c("num","5 Spaces Before","5 Spaces After","5 Spaces Before - preserve","5 Spaces After - preserve")
  )
  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[2]//a:t")),
    c("0.1111", " Preserve", "Preserve ", "     Preserve", "Preserve     ")
  )
})

test_that("tables respects column and cell alignment and can be added to a word doc", {
  skip_on_ci()

  ## simple table
  gt_exibble <-
    exibble[1:2, 1:4] |>
    `colnames<-`(c(
      "wide column number 1",
      "wide column number 2",
      "wide column number 3",
      "tcn4" #thin column number 4
    )) |>
    gt() |>
    cols_align(
      "right", columns = `wide column number 1`
    ) |>
    cols_align(
      "left", columns = c(`wide column number 2`, `wide column number 3`)
    ) |>
    tab_style(
      style = cell_text(align = "right"),
      locations = cells_body(columns = c(`wide column number 2`, `wide column number 3`), rows = 2)
    ) |>
    tab_style(
      style = cell_text(align = "left"),
      locations = cells_body(columns = c(`wide column number 1`), rows = 2)
    ) |>
    tab_style(
      cell_text(align = "right"),
      locations = cells_column_labels(columns = c(tcn4))
    )

  slide <- gt_to_pptx_slide(gt_exibble, align = "center")[[1]]

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[1]//a:t")),
    c("wide column number 1", "wide column number 2", "wide column number 3","tcn4")
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[2]//a:t")),
    c("0.1111", "apricot", "one","2015-01-15")
  )

  expect_equal(
    xml_text(xml_find_all(slide, ".//a:tr[3]//a:t")),
    c("2.2220", "banana", "two","2015-02-15")
  )

  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[1]//a:pPr"), "algn"),
    c("r", "l", "l", "r")
  )

  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[2]//a:pPr"), "algn"),
    c("r", "l", "l", "r")
  )
  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tr[3]//a:pPr"), "algn"),
    c("l", "r", "r", "r")
  )

})

test_that("sub_small_vals() and sub_large_vals() are properly encoded", {

  data <- dplyr::tibble(x = c(0.001, 0.01, 150), y = c("<", "%", ">"))

  tbl <-
    data |>
    gt() |>
    sub_small_vals() |>
    sub_large_vals(threshold = 100)

  xml <- read_xml_pptx_nodes(as_pptx_ooxml(tbl))

  expect_equal(
    xml_text(xml_find_all(xml, ".//a:tc[1]//a:t")),
    c("x", "<0.01", "0.01", "\U{2265}100")
  )

  expect_equal(
    xml_text(xml_find_all(xml, ".//a:tc[2]//a:t")),
    c("y", "<", "%", ">")
  )

})

test_that("markdown in the tables works out", {
  skip_on_ci()

  text_1a <- "
### This is Markdown.

Markdown's syntax is comprised entirely of
punctuation characters, which punctuation
characters have been carefully chosen so as
to look like what they mean... assuming
you've ever used email.


this is a line break test

"

  text_1b <- "
Info on **Markdown** _syntax_ can `be found` at [a website](https://daringfireball.net/projects/markdown/).
"

  text_2a <- "
- `countrypops`
- `sza`
    - indented col


1. newval
2. another val
3. will this work
"

  text_2b <- "
There's a quick reference [here](https://commonmark.org/help/).
"

  markdown_gt <- dplyr::tribble(
    ~Markdown, ~md,
    text_1a,   text_2a,
    text_1b,   text_2b
  ) |>
    gt() |>
    fmt_markdown(columns = everything()) |>
    tab_footnote(
      "This is text",
      locations = cells_column_labels(columns = md)
    )

  slide <- gt_to_pptx_slide(markdown_gt, align = "center")[[1]]

  res <- lapply(xml_find_all(slide, ".//a:tc"), function(tc) {
    xml_text(xml_find_all(tc, ".//a:p"))
  })
  expected <- list(
      "Markdown",
      "md1",
      c("This is Markdown.",
        "Markdown's syntax is comprised entirely of punctuation characters, which punctuation characters have been carefully chosen so as to look like what they mean... assuming you've ever used email.",
        "this is a line break test"
      ),
      c("countrypops", "sza", "indented col", "newval", "another val", "will this work"),
      "Info on Markdown syntax can be found at https://daringfireball.net/projects/markdown/.",
      "There's a quick reference https://commonmark.org/help/.",
      "1This is text",
      ""
    )
  expect_equal(res, expected)

  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tc//a:rPr"), "i"),
    rep(c(NA, "1", NA, "1", NA, "1", NA), c(2L, 1L, 16L, 1L, 8L, 1L, 1L))
  )
  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tc//a:rPr"), "b"),
    rep(c(NA, "1", NA), c(17L, 1L, 12L))
  )

  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tc//a:rPr"), "sz"),
    rep(c("1000", "1400", "1000", NA, "1000"), c(3L, 1L, 24L, 1L, 1L))
  )

  expect_equal(
    xml_attr(xml_find_all(slide, ".//a:tc//a:rPr/a:latin"), "typeface"),
    rep(
      c("Calibri", "Consolas", "Calibri", "Consolas", "Calibri", "Consolas", "Calibri"),
      c(10L, 1L, 1L, 1L, 10L, 1L, 8L)
    )
  )
})

test_that("markdown with urls work", {
  skip_on_ci()

  text_sample <- "Hyperlink [here](https://commonmark.org/help/) and to [google](https://www.google.com)"

  markdown_gt <-
    dplyr::tribble(
      ~url,
      text_sample
    ) |>
    gt() |>
    fmt_markdown(columns = everything())

  slide <- gt_to_pptx_slide(markdown_gt, align = "center")[[1]]

  # For now hyperlink are just styled
  expect_equal(length(xml_find_all(xml_find_all(slide, ".//a:r")[c(3, 5)], ".//a:u")), 2)
  expect_equal(xml_attr(xml_find_all(slide, ".//a:r//a:srgbClr"), "val"), c("0563C1", "0563C1"))
})

test_that("markdown with img refs work", {
  skip_on_ci()

  ref_png <- system.file("graphics", "test_image.png", package = "gt")
  ref_svg <- system.file("graphics", "test_image.svg", package = "gt")

  temp_png <- file.path(tempdir(),"test_image.png")
  temp_svg <- file.path(tempdir(),"test_image.svg")

  file.copy(ref_png, temp_png)
  file.copy(ref_svg, temp_svg)

  markdown_gt <- dplyr::tribble(
    ~md,
    paste0(" ![test image from gt package](",temp_png,")"),
    paste0(" ![test image from gt package2](",temp_svg,")")
    ) |>
    gt() |>
    fmt_markdown(columns = everything())

  slide <- gt_to_pptx_slide(markdown_gt, align = "center")[[1]]

  expect_equal(
    gsub("(^image:)(.*)/(test_image[.].*)$", "\\1 \\3", xml_text(xml_find_all(slide, ".//a:t"))[2:3]),
    c("image: test_image.png","image: test_image.svg")
  )

})

test_that("table with image refs work - local only", {
  skip_on_ci()

  ref_png <- system.file("graphics", "test_image.png", package = "gt")
  ref_svg <- system.file("graphics", "test_image.svg", package = "gt")
  ref_wide_svg <- system.file("graphics", "gt_parts_of_a_table.svg", package = "gt")

  temp_png <- file.path(tempdir(),"test_image.png")
  temp_svg <- file.path(tempdir(),"test_image.svg")
  temp_wide_svg <- file.path(tempdir(),"gt_parts_of_a_table.svg")

  file.copy(ref_png, temp_png)
  file.copy(ref_svg, temp_svg)
  file.copy(ref_wide_svg, temp_wide_svg)

  image_gt <- dplyr::tribble(
    ~md,
    paste0(c(temp_png,temp_svg), collapse = ", "), ## two images next to each other
    temp_svg, # single image, square
    ref_wide_svg # a wide image is respected
  ) |>
    gt() |>
    fmt_image(columns = everything(), sep = ",", height = "2in")

  slide <- gt_to_pptx_slide(image_gt, align = "center")[[1]]

  expect_equal(
    gsub("(^image:)(.*)/.*/([^/]*)$", "\\1 \\3", xml_text(xml_find_all(slide, ".//a:t"))[2:5]),
    c("image: test_image.png", "image: test_image.svg", "image: test_image.svg","image: gt_parts_of_a_table.svg")
  )
})

test_that("table with image refs work - https", {
  skip_on_ci()

  https_image_gt <-
    dplyr::tribble(
      ~https_image,
      "https://gt.rstudio.com/reference/figures/logo.svg"
    ) |>
    gt() |>
    fmt_image(columns = everything(), sep = ",", height = "2in")

  slide <- gt_to_pptx_slide(https_image_gt, align = "center")[[1]]

  expect_equal(
    gsub("(^image:) (.*)$", "\\1 \\2", xml_text(xml_find_all(slide, ".//a:t")))[2],
    "image: https://gt.rstudio.com/reference/figures/logo.svg"
  )

})

test_that("tables with summaries can be added to a pptx doc", {
  ## simple table
  gt_exibble_min <-
    exibble |>
    dplyr::select(-c(fctr, date, time, datetime)) |>
    gt(rowname_col = "row", groupname_col = "group") |>
    summary_rows(
      groups = everything(),
      columns = num,
      fns = list(
        avg = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        s.d. = ~sd(., na.rm = TRUE)
      ),
      fmt = list(~ fmt_number(.))
    )

  xml <- read_xml_pptx_nodes(as_pptx_ooxml(gt_exibble_min))

  avg_row <- xml_find_all(xml, './/a:t[text() = "avg"]/../../../../..')
  expect_equal(
    xml_text(xml_find_all(avg_row, './/a:t')),
    c("avg", "120.02", "\U{2014}", "\U{2014}", "avg", "3,220,850.00", "\U{2014}","\U{2014}")
  )
  expect_equal(
    xml_attr(xml_find_all(avg_row, './/a:lnT'), "w"),
    rep("76200", 8)
  )
  expect_equal(
    xml_attr(xml_find_all(avg_row, './/a:lnB'), "w"),
    rep("9525", 8)
  )

  total_row <- xml_find_all(xml, './/a:t[text() = "total"]/../../../../..')
  expect_equal(
    xml_text(xml_find_all(total_row, './/a:t')),
    c("total", "480.06", "\U{2014}", "\U{2014}", "total", "9,662,550.00","\U{2014}", "\U{2014}")
  )
  expect_equal(
    xml_attr(xml_find_all(total_row, './/a:lnT'), "w"),
    rep("9525", 8)
  )
  expect_equal(
    xml_attr(xml_find_all(total_row, './/a:lnB'), "w"),
    rep("9525", 8)
  )

  sd_row <- xml_find_all(xml, './/a:t[text() = "s.d."]/../../../../..')
  expect_equal(
    xml_text(xml_find_all(sd_row, './/a:t')),
    c("s.d.", "216.79", "\U{2014}", "\U{2014}", "s.d.", "4,916,123.25", "\U{2014}","\U{2014}")
  )
  expect_equal(
    xml_attr(xml_find_all(sd_row, './/a:lnT'), "w"),
    rep("9525", 8)
  )
  expect_equal(
    xml_attr(xml_find_all(sd_row, './/a:lnB'), "w"),
    rep("76200", 8)
  )

  ## Now place the summary on the top
  gt_exibble_min_top <-
    exibble |>
    dplyr::select(-c(fctr, date, time, datetime)) |>
    gt(rowname_col = "row", groupname_col = "group") |>
    summary_rows(
      groups = everything(),
      columns = num,
      fns = list(
        avg = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        s.d. = ~sd(., na.rm = TRUE)
      ),
      fmt = list(~ fmt_number(.)),
      side = "top"
    )
  xml <- read_xml_pptx_nodes(as_pptx_ooxml(gt_exibble_min_top))

  avg_row <- xml_find_all(xml, './/a:t[text() = "avg"]/../../../../..')
  expect_equal(
    xml_text(xml_find_all(avg_row, './/a:t')),
    c("avg", "120.02", "\U{2014}", "\U{2014}", "avg", "3,220,850.00", "\U{2014}","\U{2014}")
  )
  expect_equal(
    xml_attr(xml_find_all(avg_row, './/a:lnT'), "w"),
    rep("76200", 8)
  )
  expect_equal(
    xml_attr(xml_find_all(avg_row, './/a:lnB'), "w"),
    rep("9525", 8)
  )

  total_row <- xml_find_all(xml, './/a:t[text() = "total"]/../../../../..')
  expect_equal(
    xml_text(xml_find_all(total_row, './/a:t')),
    c("total", "480.06", "\U{2014}", "\U{2014}", "total", "9,662,550.00","\U{2014}", "\U{2014}")
  )
  expect_equal(
    xml_attr(xml_find_all(total_row, './/a:lnT'), "w"),
    rep("9525", 8)
  )
  expect_equal(
    xml_attr(xml_find_all(total_row, './/a:lnB'), "w"),
    rep("9525", 8)
  )

  sd_row <- xml_find_all(xml, './/a:t[text() = "s.d."]/../../../../..')
  expect_equal(
    xml_text(xml_find_all(sd_row, './/a:t')),
    c("s.d.", "216.79", "\U{2014}", "\U{2014}", "s.d.", "4,916,123.25", "\U{2014}","\U{2014}")
  )
  expect_equal(
    xml_attr(xml_find_all(sd_row, './/a:lnT'), "w"),
    rep("9525", 8)
  )
  expect_equal(
    xml_attr(xml_find_all(sd_row, './/a:lnB'), "w"),
    rep("76200", 8)
  )

})

test_that("tables with cell & text coloring can be added to a word doc - with summaries (grand/group)", {
  ## simple table
  gt_exibble_min <-
    exibble |>
    dplyr::select(-c(fctr, date, time, datetime)) |>
    gt(rowname_col = "row", groupname_col = "group") |>
    summary_rows(
      groups = everything(),
      columns = num,
      fns = list(
        avg = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        s.d. = ~sd(., na.rm = TRUE)
      ),
      fmt = list(~ fmt_number(.))
    ) |>
    grand_summary_rows(
      columns = num,
      fns = list(
        avg = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        s.d. = ~sd(., na.rm = TRUE)
      ),
      fmt = list(~ fmt_number(.))
    ) |>
    tab_style(
      style = cell_text(color = "orange"),
      locations = cells_summary(groups = "grp_a", columns = char)
    ) |>
    tab_style(
      style = cell_text(color = "green"),
      locations = cells_stub_summary()
    ) |>
    tab_style(
      style = cell_text(color = "purple"),
      locations = cells_grand_summary(columns = num, rows = 3)
    ) |>
    tab_style(
      style = cell_fill(color = "yellow"),
      locations = cells_stub_grand_summary()
    )

  xml <- read_xml_pptx_nodes(as_pptx_ooxml(gt_exibble_min))

  avg_row <- xml_find_all(xml, './/a:t[text() = "avg"]/../../../../..')
  expect_equal(
    xml_attr(xml_find_all(avg_row[1:2], './/a:tc[1]//a:defRPr/a:solidFill/a:srgbClr'), "val"),
    c("00FF00", "00FF00")
  )
  expect_equal(
    xml_attr(xml_find_all(avg_row[3], './/a:tc[1]//a:defRPr/a:solidFill/a:srgbClr'), "val"),
    character()
  )

  expect_equal(
    xml_attr(xml_find_all(avg_row[1], './/a:tc[3]//a:defRPr/a:solidFill/a:srgbClr'), "val"),
    c("FFA500")
  )
  expect_equal(
    xml_attr(xml_find_all(avg_row[2], './/a:tc[3]//a:defRPr/a:solidFill/a:srgbClr'), "val"),
    character()
  )
  expect_equal(
    xml_attr(xml_find_all(avg_row[3], './/a:tc[1]//a:tcPr/a:solidFill/a:srgbClr'), "val"),
    "FFFF00"
  )

  total_row <- xml_find_all(xml, './/a:t[text() = "total"]/../../../../..')
  expect_equal(
    xml_attr(xml_find_all(total_row[1:2], './/a:tc[1]//a:defRPr/a:solidFill/a:srgbClr'), "val"),
    c("00FF00", "00FF00")
  )
  expect_equal(
    xml_attr(xml_find_all(total_row[3], './/a:tc[1]//a:rPr/a:solidFill/a:srgbClr'), "val"),
    character()
  )

  expect_equal(
    xml_attr(xml_find_all(total_row[1], './/a:tc[3]//a:defRPr/a:solidFill/a:srgbClr'), "val"),
    c("FFA500")
  )
  expect_equal(
    xml_attr(xml_find_all(total_row[2], './/a:tc[3]//a:defRPr/a:solidFill/a:srgbClr'), "val"),
    character()
  )
  expect_equal(
    xml_attr(xml_find_all(total_row[3], './/a:tc[1]//a:tcPr/a:solidFill/a:srgbClr'), "val"),
    "FFFF00"
  )


  sd_row <- xml_find_all(xml, './/a:t[text() = "s.d."]/../../../../..')
  expect_equal(
    xml_attr(xml_find_all(sd_row[1:2], './/a:tc[1]//a:defRPr/a:solidFill/a:srgbClr'), "val"),
    c("00FF00", "00FF00")
  )
  expect_equal(
    xml_attr(xml_find_all(sd_row[3], './/a:tc[1]//a:defRPr/a:solidFill/a:srgbClr'), "val"),
    character()
  )

  expect_equal(
    xml_attr(xml_find_all(sd_row[1], './/a:tc[3]//a:defRPr/a:solidFill/a:srgbClr'), "val"),
    c("FFA500")
  )
  expect_equal(
    xml_attr(xml_find_all(sd_row[2], './/a:tc[3]//a:defRPr/a:solidFill/a:srgbClr'), "val"),
    character()
  )
  expect_equal(
    xml_attr(xml_find_all(sd_row[3], './/a:tc[1]//a:tcPr/a:solidFill/a:srgbClr'), "val"),
    "FFFF00"
  )
  expect_equal(
    xml_attr(xml_find_all(sd_row[3], './/a:tc[2]//a:defRPr/a:solidFill/a:srgbClr'), "val"),
    "A020F0"
  )

})

test_that("tables with grand summaries but no rownames can be added to a pptx doc", {
  ## simple table
  gt_exibble_min <-
    exibble |>
    dplyr::select(-c(fctr, date, time, datetime, row, group)) |>
    dplyr::slice(1:3) |>
    gt() |>
    grand_summary_rows(
      c(everything(), -char),
      fns = c("Total" = ~length(.))
    )

  xml <- read_xml_pptx_nodes(as_pptx_ooxml(gt_exibble_min))

  expect_equal(
    xml_text(xml_find_all(xml, ".//a:tr[1]//a:p")),
    c( "", "num", "char", "currency")
  )

  expect_equal(
    lapply(2: 5, function(i) {
      xml_text(xml_find_all(xml, glue::glue(".//a:tr[{i}]//a:p")))
    }),
    list(
      c("", "0.1111", "apricot", "49.95"),
      c("", "2.2220", "banana", "17.95"),
      c("", "33.3300", "coconut", "1.39"),
      c("Total", "3", "—", "3")
    )
  )

  ## simple table
  gt_exibble_min_top <-
    exibble |>
    dplyr::select(-c(fctr, date, time, datetime, row, group)) |>
    dplyr::slice(1:3) |>
    gt() |>
    grand_summary_rows(
      c(everything(), -char),
      fns = c("Total" = ~length(.)),
      side = "top"
    )
  xml <- read_xml_pptx_nodes(as_pptx_ooxml(gt_exibble_min_top))

  expect_equal(
    xml_text(xml_find_all(xml, ".//a:tr[1]//a:p")),
    c( "", "num", "char", "currency")
  )

  expect_equal(
    lapply(2: 5, function(i) {
      xml_text(xml_find_all(xml, glue::glue(".//a:tr[{i}]//a:p")))
    }),
    list(
      c("Total", "3", "—", "3"),
      c("", "0.1111", "apricot", "49.95"),
      c("", "2.2220", "banana", "17.95"),
      c("", "33.3300", "coconut", "1.39")
    )
  )
})

test_that("pptx ooxml can be generated from gt object with defined column widths", {

  # Create a one-row table for these tests
  gt_exibble_min <- gt(exibble[1, ])

  ## basic table
  gt_exibble_min_xml <- read_xml_pptx_nodes(as_pptx_ooxml(gt_exibble_min))

  # make sure there is an explit gridcols all of the same width, ~ 9144000/9 = 1016000
  expect_equal(
    xml_find_all(gt_exibble_min_xml, "//a:gridCol") %>% xml_attr("w"),
    c("1016000", "1016000", "1016000", "1016000", "1016000", "1016000",
      "1016000", "1016000", "1016000")
  )

  ## basic table with one defined column width of 60px
  gt_exibble_min_set_width <- gt_exibble_min |>
    cols_width(
      char ~ px(60)
    )

  gt_exibble_min_set_width_xml <- read_xml_pptx_nodes(as_pptx_ooxml(gt_exibble_min_set_width))

  # make sure the second gridwidth is 60px (571500 EMU) and remainder is  ~ (9144000-571500)/8 = 1071563
  expect_equal(
    xml_find_all(gt_exibble_min_set_width_xml, "//a:gridCol") %>% xml_attr("w"),
    c("1071562", "571500", "1071562", "1071562", "1071562", "1071562",
      "1071562", "1071562", "1071562")
  )

  ## basic table with one defined column width of 60px
  gt_exibble_min_pct_width <- gt_exibble_min |>
    cols_width(
      char ~ pct(50)
    )

  gt_exibble_min_pct_width_xml <- read_xml_pptx_nodes(as_pptx_ooxml(gt_exibble_min_pct_width))

  # make sure the second gridwidth is 50% (4572000 EMU) and remainder is  ~ (9144000-4572000)/8 = 571500
  expect_equal(
    xml_find_all(gt_exibble_min_pct_width_xml, "//a:gridCol") %>% xml_attr("w"),
    c("571500", "4572000", "571500", "571500", "571500", "571500",
      "571500", "571500", "571500")
  )

  ## basic table with two defined column widths, one of 60px, another 50%
  gt_exibble_min_set_and_pct_width <- gt_exibble_min |>
    cols_width(
      num ~ px(30),
      char ~ pct(50)
    )

  gt_exibble_min_set_and_pct_width_xml <- read_xml_pptx_nodes(as_pptx_ooxml(gt_exibble_min_set_and_pct_width))

  # make sure the first gridwidth is 30px (285750 EMU), second gridwidth is 50% (4572000 EMU) and remainder is  ~ (9144000-285750-4572000)/7 = 612321
  expect_equal(
    xml_find_all(gt_exibble_min_set_and_pct_width_xml, "//a:gridCol") %>% xml_attr("w"),
    c("285750", "4572000", "612321", "612321", "612321", "612321",
      "612321","612321","612321")
  )

  ## basic table with two defined column widths, both at 80%
  gt_exibble_min_too_wide_width <- gt_exibble_min |>
    cols_width(
      num ~ pct(80),
      char ~ pct(80)
    )


  ## should return warning if the set columns are wider than expected
  expect_warning(
    as_pptx_ooxml(gt_exibble_min_too_wide_width),
    "Defined column widths are wider than the defined table"
    )

  gt_exibble_min_too_wide_width_xml <- read_xml_pptx_nodes(as_pptx_ooxml(gt_exibble_min_too_wide_width))

  # make sure the first two gridwidths are 80% (285750 EMU), and remainder is  209550 - smallest allowable width is .23in, or 22px
  expect_equal(
    xml_find_all(gt_exibble_min_too_wide_width_xml, "//a:gridCol") %>% xml_attr("w"),
    c("7315200", "7315200", "209550", "209550", "209550", "209550",
      "209550","209550","209550")
  )


})

test_that("pptx_ooxml can be generated with defined cell borders",{

  gtcars_tbl <-
    gtcars |>
    dplyr::filter(ctry_origin == "United Kingdom") |>
    dplyr::select(mfr, model, year, hp) |>
    gt(rowname_col = c("mfr","model")) |>
    tab_style(style = list(cell_borders(color = "red")),
              locations = cells_body(columns = 4, rows = 1:2)) |>
    tab_style(style = list(cell_borders(color = "orange")),
              locations = cells_body(columns = 4, rows = 3:4)) |>
    tab_style(style = list(cell_borders(color = "green")),
            locations = cells_body(columns = 3, rows = 3:4)) |>
    tab_style(style = list(cell_borders(color = "blue")),
              locations = cells_column_labels(columns = 3)) |>
    tab_style(style = list(cell_borders(color = "pink")),
              locations = cells_stub(rows = 2, columns = 1))

  gt_exibble_min_xml <- read_xml_pptx_nodes(as_pptx_ooxml(gtcars_tbl))

  gtsave(gtcars_tbl, filename = "test.pptx")

  shell.exec("test.pptx")

  gtcars_tbl2 <-
    gtcars |>
    dplyr::filter(ctry_origin == "United Kingdom") |>
    dplyr::select(mfr, model, year, hp) |>
    gt() |>
    tab_spanner("Test span 1", columns = 1:3, level = 1, id = "span1")|>
    tab_spanner("Test span 2", columns = 2:4, level = 2, id = "span2")|>
    tab_style(style = list(cell_borders(color = "red")),
              locations = cells_column_spanners(spanners = "span1"))|>
    tab_style(style = list(cell_borders(color = "orange")),
              locations = cells_column_spanners(spanners = "span2"))


  gtsave(gtcars_tbl, filename = "test.pptx")





})
