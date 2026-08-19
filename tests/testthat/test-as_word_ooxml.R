skip_on_cran()

test_that("parse_to_ooxml(word) creates the correct nodes", {
  expect_xml_snapshot(parse_to_ooxml("hello", "word"))
})

test_that("word ooxml can be generated from gt object", {

  # Create a one-row table for these tests
  exibble_min <- exibble[1, ]

  ## basic table
  xml <- read_xml_word_nodes(as_word_ooxml(gt(exibble_min)))
  expect_equal(length(xml), 1)
  expect_equal(xml_name(xml), "tbl")
  expect_equal(length(xml_find_all(xml, "//w:keepNext")), 18)

  expect_xml_snapshot(xml)
  expect_equal(
    xml_attr(xml_find_all(xml, "(//w:tr)[1]//w:pPr/w:jc"), "val"),
    c("end", "start", "center", "end", "end", "end", "end", "start", "start")
  )
  expect_equal(
    xml_attr(xml_find_all(xml, "(//w:tr)[2]//w:pPr/w:jc"), "val"),
    c("end", "start", "center", "end", "end", "end", "end", "start", "start")
  )

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
  xml_embed <- read_xml_word_nodes(as_word_ooxml(gt_tbl_1, caption_location = "embed"))
  expect_equal(length(xml_embed), 1)
  expect_equal(xml_name(xml_embed), c("tbl"))
  expect_equal(length(xml_find_all(xml_embed, "//w:tr")), 3)
  expect_equal(length(xml_find_all(xml_embed, "//w:keepNext")), 20)

  expect_equal(
    xml_find_all(xml_top, "(//w:tr)[1]")[[1]],
    xml_find_all(xml_embed, "(//w:tr)[2]")[[1]]
  )
  expect_equal(
    xml_find_all(xml_top, "(//w:tr)[2]")[[1]],
    xml_find_all(xml_embed, "(//w:tr)[3]")[[1]]
  )

  ## basic table with split enabled
  xml_split <- read_xml_word_nodes(as_word_ooxml(gt_tbl_1, split = FALSE))
  expect_equal(
    sapply(xml_find_all(xml_split, "//w:trPr"), \(x) {
      length(xml_find_all(x, ".//w:cantSplit")) == 1
    }),
    c(TRUE, TRUE)
  )
  expect_equal(length(xml_find_all(xml_split, "//w:keepNext")), 20)


  ## basic table with autonum disabled
  xml_autonum_false <- read_xml_word_nodes(as_word_ooxml(gt_tbl_1, autonum = FALSE))
  expect_equal(xml_name(xml_autonum_false), c("p", "p", "tbl"))
  expect_xml_snapshot(xml_autonum_false[[1]])
  expect_xml_snapshot(xml_autonum_false[[2]])
  expect_equal(length(xml_find_all(xml_autonum_false, "//w:instrText")), 0)
  expect_equal(length(xml_find_all(xml_autonum_false, "//w:fldChar")), 0)
  expect_equal(length(xml_find_all(xml_autonum_false, "//w:keepNext")), 20)

  ## basic table with keep_with_next disabled
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
  for (node in xml_find_all(xml_body, "(.//w:tc)[1]//w:rPr")){
    expect_equal(xml_attr(xml_find_all(node, ".//w:rFonts"), "ascii"), "Biome")
    expect_equal(xml_attr(xml_find_all(node, ".//w:sz"), "val"), "20")
    expect_equal(length(xml_find_all(node, ".//w:i")), 1)
    expect_equal(xml_attr(xml_find_all(node, ".//w:color"), "val"), "00FF00")
    expect_equal(length(xml_find_all(node, ".//w:b")), 1)
  }

  # orange cells
  for (i in c(2, 3, 5, 7, 9)) {
    shd <- xml_find_all(xml_body, paste0("(.//w:tc)[", i, "]/w:tcPr/w:shd"))
    expect_equal(xml_attr(shd, "fill"), rep("FFA500", 4))
    expect_equal(xml_attr(shd, "val"), rep("clear", 4))
    expect_equal(xml_attr(shd, "color"), rep("auto", 4))
  }

  # regular cells
  for (i in c(4, 6, 8)) {
    expect_equal(length(xml_find_all(xml_body, paste0("(.//w:tc)[", i, "]/w:tcPr/w:shd"))), 0)
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
  expect_equal(
    xml_attr(xml_find_all(xml, "//w:tr[3]/w:tc/w:tcPr/w:shd"), "fill"),
    rep("00FF00", 9)
  )
  expect_equal(
    xml_attr(xml_find_all(xml, "//w:tr[3]//w:color"), "val"),
    rep("A020F0", 9)
  )

})

test_that("process_text() handles ooxml/word", {
  expect_equal(process_text("simple", context = "ooxml/word"), "simple")
  expect_equal(
    process_text(md("simple <br> markdown"), context = "ooxml/word"),
    process_text(md("simple <br> markdown"), context = "word")
  )
  expect_equal(
    process_text(html("simple <br> html"), context = "ooxml/word"),
    process_text(html("simple <br> html"), context = "word")
  )
})

test_that("word ooxml handles md() and html()", {

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
  xml <- read_xml_word_nodes(as_word_ooxml(gt_tbl_linebreaks_md))
  expect_equal(
    xml_text(xml_find_all(xml[[1]], "(.//w:r)[last()]//w:t")),
    "TABLE"
  )
  expect_equal(xml_text(xml_find_all(xml[[2]], ".//w:r//w:t")), "TITLE")
  expect_equal(xml_text(xml_find_all(xml[[3]], ".//w:r//w:t")), "table")
  expect_equal(xml_text(xml_find_all(xml[[4]], ".//w:r//w:t")), "subtitle")

  ## basic table with linebreak in title
  gt_tbl_linebreaks_html <-
    exibble_min |>
    gt() |>
    tab_header(
      title = html("TABLE <br> TITLE"),
      subtitle = html("table <br> subtitle")
    )

  xml <- read_xml_word_nodes(as_word_ooxml(gt_tbl_linebreaks_md))
  expect_equal(
    xml_text(xml_find_all(xml[[1]], "(.//w:r)[last()]//w:t")),
    "TABLE"
  )
  expect_equal(xml_text(xml_find_all(xml[[2]], ".//w:r//w:t")), "TITLE")
  expect_equal(xml_text(xml_find_all(xml[[3]], ".//w:r//w:t")), "table")
  expect_equal(xml_text(xml_find_all(xml[[4]], ".//w:r//w:t")), "subtitle")
})

test_that("word ooxml escapes special characters in gt object", {
  df <- data.frame(special_characters = "><&\n\r\"'", stringsAsFactors = FALSE)
  xml <- read_xml_word_nodes(as_word_ooxml(gt(df)))

  expect_snapshot(
    xml_find_all(xml, "(//w:t)[last()]/text()")
  )
})

test_that("word ooxml escapes special characters in gt object footer", {

  gt_tbl <- gt(data.frame(num = 1)) |>
    tab_footnote(footnote = "p < .05, ><&\n\r\"'")

  xml <- read_xml_word_nodes(as_word_ooxml(gt_tbl))
  expect_snapshot(xml_find_all(xml, "//w:tr[last()]//w:t"))
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
  xml <- read_xml_word_nodes(as_word_ooxml(triple_stub))
  nodes_Ford <- xml_find_all(xml, ".//w:t[. = 'Ford']")
  expect_equal(xml_attr(xml_find_all(nodes_Ford[[1]], "../../..//w:vMerge"), "val"), "restart")
  expect_equal(xml_attr(xml_find_all(nodes_Ford[[2]], "../../..//w:vMerge"), "val"), "continue")

  nodes_BMW <- xml_find_all(xml, ".//w:t[. = 'BMW']")
  expect_equal(xml_attr(xml_find_all(nodes_BMW[[1]], "../../..//w:vMerge"), "val"), "restart")
  expect_equal(xml_attr(xml_find_all(nodes_BMW[[2]], "../../..//w:vMerge"), "val"), "continue")

  nodes_Audi <- xml_find_all(xml, ".//w:t[. = 'Audi']")
  expect_equal(xml_length(xml_find_all(nodes_Audi[[1]], "../../..//w:vMerge")), 0)

  # no other merge cells
  expect_equal(length(xml_find_all(xml, ".//w:vMerge")), 4)

  # no stub head, i.e. empty text
  expect_equal(
    xml_text(xml_find_all(xml, "(.//w:tr)[1]//w:t")),
    c("", "year", "hp", "msrp")
  )
  tcPr <- xml_find_all(xml, "(.//w:tr)[1]/w:tc/w:tcPr")
  expect_equal(xml_attr(xml_find_all(tcPr[[1]], ".//w:gridSpan"), "val"), "3")
  for (i in 2:4) {
    expect_equal(length(xml_find_all(tcPr[[i]], ".//w:gridSpan")), 0)
  }

  # one label: merged
  xml <- test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead("one") |>
    as_word() %>%
    read_xml()
  tcPr <- xml_find_all(xml, "(.//w:tr)[1]/w:tc/w:tcPr")
  expect_equal(xml_attr(xml_find_all(tcPr[[1]], ".//w:gridSpan"), "val"), "3")
  for (i in 2:4) {
    expect_equal(length(xml_find_all(tcPr[[i]], ".//w:gridSpan")), 0)
  }

  expect_equal(
    xml_text(xml_find_all(xml, "(.//w:tr)[1]//w:t")),
    c("one", "year", "hp", "msrp")
  )

  # 3 labels
  xml <- test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(c("one", "two", "three")) |>
    as_word() %>%
    read_xml()

  expect_equal(
    xml_text(xml_find_all(xml, "(.//w:tr)[1]//w:t")),
    c("one", "two", "three", "year", "hp", "msrp")
  )

  # add spanner
  xml <- test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(c("one", "two", "three")) |>
    tab_spanner(label = "span", columns = c(hp, msrp)) |>
    as_word() %>%
    read_xml()

  expect_equal(
    xml_text(xml_find_all(xml, "(.//w:tr)[1]//w:t")),
    c("one", "two", "three", "", "span")
  )
  # first row
  tcPr <- xml_find_all(xml, "(.//w:tr)[1]/w:tc/w:tcPr")
  for (i in 1:3) {
    expect_equal(xml_attr(xml_find_all(tcPr[[i]], ".//w:vMerge"), "val"), "restart")
  }
  expect_equal(xml_attr(xml_find_first(tcPr[[5]], ".//w:gridSpan"), "val"), "2")

  # second row
  tcPr <- xml_find_all(xml, "(.//w:tr)[2]/w:tc/w:tcPr")
  for (i in 1:3) {
    expect_equal(xml_attr(xml_find_all(tcPr[[i]], ".//w:vMerge"), "val"), "continue")
  }

  # spanner - one label
  xml <- test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(c("one")) |>
    tab_spanner(label = "span", columns = c(hp, msrp)) |>
    as_word() %>%
    read_xml()

  expect_equal(
    xml_text(xml_find_all(xml, "(.//w:tr)[1]//w:t")),
    c("one", "", "span")
  )

  # first row
  tcPr <- xml_find_all(xml, "(.//w:tr)[1]/w:tc/w:tcPr")
  expect_equal(xml_attr(xml_find_all(tcPr[[1]], ".//w:vMerge"), "val"), "restart")
  expect_equal(xml_attr(xml_find_all(tcPr[[1]], ".//w:gridSpan"), "val"), "3")
  expect_equal(xml_attr(xml_find_first(tcPr[[3]], ".//w:gridSpan"), "val"), "2")

  # second row
  tcPr <- xml_find_all(xml, "(.//w:tr)[2]/w:tc/w:tcPr")
  expect_equal(xml_attr(xml_find_all(tcPr[[1]], ".//w:vMerge"), "val"), "continue")
  expect_equal(xml_attr(xml_find_all(tcPr[[1]], ".//w:gridSpan"), "val"), "3")

})

test_that("tables can be added to a word doc", {
  ## simple table
  gt_exibble_min <-
    exibble[1:2, ] |>
    gt() |>
    tab_header(
      title = "table title",
      subtitle = "table subtitle"
    )

  docx_contents <- gt_to_word_contents(gt_exibble_min, align = "center")

  ## extract table caption
  docx_table_caption_text <- xml2::xml_text(docx_contents[1:2])

  ## extract table contents
  docx_table_body_header <-
    docx_contents[3] |>
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <-
    docx_contents[3] |>
    xml2::xml_find_all(".//w:tr") |>
    setdiff(docx_table_body_header)

  expect_equal(
    docx_table_caption_text,
    c("Table  SEQ Table \\* ARABIC 1: table title", "table subtitle")
  )

  expect_equal(
    xml2::xml_text(xml2::xml_find_all(docx_table_body_header, ".//w:p")),
    c(
      "num", "char", "fctr", "date", "time",
      "datetime", "currency", "row", "group"
    )
  )

  expect_equal(
    lapply(
      docx_table_body_contents,
      FUN = function(x) xml2::xml_text(xml2::xml_find_all(x, ".//w:p"))
    ),
    list(
      c(
        "0.1111",
        "apricot",
        "one",
        "2015-01-15",
        "13:35",
        "2018-01-01 02:22",
        "49.95",
        "row_1",
        "grp_a"
      ),
      c(
        "2.2220",
        "banana",
        "two",
        "2015-02-15",
        "14:40",
        "2018-02-02 14:33",
        "17.95",
        "row_2",
        "grp_a"
      )
    )
  )
})

test_that("tables with special characters can be added to a word doc", {
  skip_on_ci()

  ## simple table
  gt_exibble_min <-
    exibble[1, ] |>
    dplyr::mutate(special_characters = "><&\"'") |>
    gt() |>
    tab_header(
      title = "table title",
      subtitle = "table subtitle"
    )

  docx_contents <- gt_to_word_contents(gt_exibble_min, align = "center")

  ## extract table caption
  docx_table_caption_text <- xml2::xml_text(docx_contents[1:2])

  ## extract table contents
  docx_table_body_header <-
    docx_contents[3] |>
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <-
    docx_contents[3] |>
    xml2::xml_find_all(".//w:tr") |>
    setdiff(docx_table_body_header)

  expect_equal(
    docx_table_caption_text,
    c("Table  SEQ Table \\* ARABIC 1: table title", "table subtitle")
  )

  expect_equal(
    xml2::xml_text(xml2::xml_find_all(docx_table_body_header, ".//w:p")),
    c(
      "num", "char", "fctr", "date", "time",
      "datetime", "currency", "row", "group",
      "special_characters"
    )
  )

  expect_equal(
    lapply(
      docx_table_body_contents,
      FUN = function(x) xml2::xml_text(xml2::xml_find_all(x, ".//w:p"))
    ),
    list(
      c(
        "0.1111",
        "apricot",
        "one",
        "2015-01-15",
        "13:35",
        "2018-01-01 02:22",
        "49.95",
        "row_1",
        "grp_a",
        "><&\"'"
      )
    )
  )
})

test_that("tables with embedded titles can be added to a word doc", {

  ## simple table
  gt_exibble_min <-
    exibble[1:2, ] |>
    gt() |>
    tab_header(
      title = "table title",
      subtitle = "table subtitle"
    )

  docx_contents <- gt_to_word_contents(gt_exibble_min, align = "center", caption_location = "embed")

  ## extract table contents
  docx_table_body_header <-
    docx_contents[1] |>
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <-
    docx_contents[1] |>
    xml2::xml_find_all(".//w:tr") |>
    setdiff(docx_table_body_header)

  expect_equal(
    docx_table_body_header |>
      xml2::xml_find_all(".//w:t") |>
      xml2::xml_text(),
    c(
      "table title", "table subtitle", "num", "char", "fctr",
      "date", "time", "datetime", "currency", "row", "group"
    )
  )

  expect_equal(
    lapply(docx_table_body_contents, function(x)
      x |> xml2::xml_find_all(".//w:p") |> xml2::xml_text()),
    list(
      c(
        "0.1111",
        "apricot",
        "one",
        "2015-01-15",
        "13:35",
        "2018-01-01 02:22",
        "49.95",
        "row_1",
        "grp_a"
      ),
      c(
        "2.2220",
        "banana",
        "two",
        "2015-02-15",
        "14:40",
        "2018-02-02 14:33",
        "17.95",
        "row_2",
        "grp_a"
      )
    )
  )
})

test_that("tables with spans can be added to a word doc", {
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

  docx_contents <- gt_to_word_contents(gt_exibble_min, align = "center")

  ## extract table caption
  docx_table_caption_text <-
    docx_contents[1:2] |>
    xml2::xml_text()

  ## extract table contents
  docx_table_body_header <-
    docx_contents[3] |>
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <-
    docx_contents[3] |>
    xml2::xml_find_all(".//w:tr") |>
    setdiff(docx_table_body_header)

  expect_equal(
    docx_table_caption_text,
    c("Table  SEQ Table \\* ARABIC 1: table title", "table subtitle")
  )

  expect_equal(
    docx_table_body_header |>
      xml2::xml_find_all(".//w:p") |>
      xml2::xml_text(),
    c(
      "", "", "My Column Span", "", "", "", "", "num", "char", "fctr",
      "date", "time", "datetime", "currency", "row", "group"
    )
  )

  expect_equal(
    lapply(docx_table_body_contents, function(x)
      x |> xml2::xml_find_all(".//w:p") |> xml2::xml_text()),
    list(
      c(
        "0.1111",
        "apricot",
        "one",
        "2015-01-15",
        "13:35",
        "2018-01-01 02:22",
        "49.95",
        "row_1",
        "grp_a"
      ),
      c(
        "2.2220",
        "banana",
        "two",
        "2015-02-15",
        "14:40",
        "2018-02-02 14:33",
        "17.95",
        "row_2",
        "grp_a"
      )
    )
  )
})

test_that("tables with multi-level spans can be added to a word doc", {
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

  docx_contents <- gt_to_word_contents(gt_exibble_min, align = "center")

  ## extract table caption
  docx_table_caption_text <-
    docx_contents[1:2] |>
    xml2::xml_text()

  ## extract table contents
  docx_table_body_header <-
    docx_contents[3] |>
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <-
    docx_contents[3] |>
    xml2::xml_find_all(".//w:tr") |>
    setdiff(docx_table_body_header)

  expect_equal(
    docx_table_caption_text,
    c("Table  SEQ Table \\* ARABIC 1: table title", "table subtitle")
  )

  expect_equal(
    docx_table_body_header |>
      xml2::xml_find_all(".//w:p") |>
      xml2::xml_text(),
    c(
      "", "My Column Span L2", "", "", "", "", "My 1st Column Span L1", "", "",
      "My 2nd Column Span L1", "num", "char", "fctr", "date", "time",
      "datetime", "currency", "row", "group"
    )
  )

  expect_equal(
    lapply(
      docx_table_body_contents, function(x)
      x |> xml2::xml_find_all(".//w:p") |> xml2::xml_text()),
    list(
      c(
        "0.1111",
        "apricot",
        "one",
        "2015-01-15",
        "13:35",
        "2018-01-01 02:22",
        "49.95",
        "row_1",
        "grp_a"
      ),
      c(
        "2.2220",
        "banana",
        "two",
        "2015-02-15",
        "14:40",
        "2018-02-02 14:33",
        "17.95",
        "row_2",
        "grp_a"
      )
    )
  )
})

test_that("tables with footnotes can be added to a word doc", {
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
  xml <- read_xml_word_nodes(as_word_ooxml(gt_exibble_min))
  xml_note_num <- xml_find_all(xml, './/w:t[text() = "num"]/../../w:r[last()]')
  expect_equal(xml_attr(xml_find_all(xml_note_num, ".//w:rPr/w:vertAlign"), "val"), "superscript")
  expect_equal(xml_text(xml_find_all(xml_note_num, ".//w:t")), "1")

  xml_note_char <- xml_find_all(xml, './/w:t[text() = "char"]/../../w:r[last()]')
  expect_equal(xml_attr(xml_find_all(xml_note_char, ".//w:rPr/w:vertAlign"), "val"), "superscript")
  expect_equal(xml_text(xml_find_all(xml_note_char, ".//w:t")), "2")

  expect_equal(
    xml_text(xml_find_all(xml, './/w:tr[last()]//w:r/w:t')),
    c("2", "this is a second footer example")
  )
  expect_equal(
    xml_attr(xml_find_all(xml, './/w:tr[last()]//w:vertAlign'), "val"),
    "superscript"
  )
  expect_equal(
    xml_text(xml_find_all(xml, './/w:tr[last() - 1]//w:r/w:t')),
    c("1", "this is a footer example")
  )
  expect_equal(
    xml_attr(xml_find_all(xml, './/w:tr[last() - 1]//w:vertAlign'), "val"),
    "superscript"
  )

  docx_contents <- gt_to_word_contents(gt_exibble_min, align = "center")

  ## extract table contents
  docx_table_body_header <-
    docx_contents[1] |>
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <-
    docx_contents[1] |>
    xml2::xml_find_all(".//w:tr") |>
    setdiff(docx_table_body_header)

  ## superscripts will display as "true#false" due to
  ## xml being:
  ## <w:vertAlign w:val="superscript"/><w:i>true</w:i><w:t xml:space="default">1</w:t><w:i>false</w:i>,
  ## and being converted to TRUE due to italic being true, then the superscript, then turning off italics
  expect_equal(
    docx_table_body_header |>
      xml2::xml_find_all(".//w:p") |>
      xml2::xml_text(),
    c(
      "num1", "char2", "fctr", "date", "time",
      "datetime", "currency", "row", "group"
    )
  )

  ## superscripts will display as "true##" due to
  ## xml being:
  ## <w:vertAlign w:val="superscript"/><w:i>true</w:i><w:t xml:space="default">1</w:t>,
  ## and being converted to TRUE due to italic being true, then the superscript,
  expect_equal(
    lapply(
      docx_table_body_contents, function(x)
      x |> xml2::xml_find_all(".//w:p") |> xml2::xml_text()
    ),
    list(
      c(
        "0.1111",
        "apricot",
        "one",
        "2015-01-15",
        "13:35",
        "2018-01-01 02:22",
        "49.95",
        "row_1",
        "grp_a"
      ),
      c(
        "2.2220",
        "banana",
        "two",
        "2015-02-15",
        "14:40",
        "2018-02-02 14:33",
        "17.95",
        "row_2",
        "grp_a"
      ),
      c("1this is a footer example"),
      c("2this is a second footer example")
    )
  )
})

test_that("tables with source notes can be added to a word doc", {
  ## simple table
  gt_exibble_min <-
    exibble[1:2, ] |>
    gt() |>
    tab_source_note(source_note = "this is a source note example")

  # check the xml
  xml <- read_xml_word_nodes(as_word_ooxml(gt_exibble_min))
  expect_equal(
    xml_text(xml_find_all(xml, ".//w:tr[last()]//w:t")),
    "this is a source note example"
  )
  expect_equal(
    xml_attr(xml_find_all(xml, ".//w:tr[last()]//w:gridSpan"), "val"),
    "9"
  )

  docx_contents <- gt_to_word_contents(gt_exibble_min, align = "center")

  ## extract table contents
  docx_table_body_header <-
    docx_contents[1] |>
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <-
    docx_contents[1] |>
    xml2::xml_find_all(".//w:tr") |>
    setdiff(docx_table_body_header)

  expect_equal(
    docx_table_body_header |>
      xml2::xml_find_all(".//w:p") |>
      xml2::xml_text(),
    c(
      "num",
      "char",
      "fctr",
      "date",
      "time",
      "datetime",
      "currency",
      "row",
      "group"
    )
  )

  expect_equal(
    lapply(
      docx_table_body_contents, function(x)
      x |> xml2::xml_find_all(".//w:p") |> xml2::xml_text()
    ),
    list(
      c(
        "0.1111",
        "apricot",
        "one",
        "2015-01-15",
        "13:35",
        "2018-01-01 02:22",
        "49.95",
        "row_1",
        "grp_a"
      ),
      c(
        "2.2220",
        "banana",
        "two",
        "2015-02-15",
        "14:40",
        "2018-02-02 14:33",
        "17.95",
        "row_2",
        "grp_a"
      ),
      c("this is a source note example")
    )
  )
})

test_that("long tables can be added to a word doc", {
  ## simple table
  gt_letters <-
    dplyr::tibble(
      upper_case = c(LETTERS,LETTERS),
      lower_case = c(letters,letters)
    ) |>
    gt() |>
    tab_header(title = "LETTERS")

  docx_contents <- gt_to_word_contents(gt_letters, align = "center")

  ## extract table caption
  docx_table_caption_text <-
    docx_contents[1] |>
    xml2::xml_text()

  ## extract table contents
  docx_table_body_header <-
    docx_contents[2] |>
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <-
    docx_contents[2] |>
    xml2::xml_find_all(".//w:tr") |>
    setdiff(docx_table_body_header)

  expect_equal(
    docx_table_caption_text,
    c("Table  SEQ Table \\* ARABIC 1: LETTERS")
  )

  expect_equal(
    docx_table_body_header |>
      xml2::xml_find_all(".//w:p") |>
      xml2::xml_text(),
    c("upper_case", "lower_case")
  )

  expect_equal(
    lapply(
      docx_table_body_contents, function(x)
      x |> xml2::xml_find_all(".//w:p") |> xml2::xml_text()
    ),
    lapply(c(1:26,1:26), function(i) c(LETTERS[i], letters[i]))
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

  docx_contents <- gt_to_word_contents(gt_letters, align = "center")

  ## extract table caption
  docx_table_caption_text <-
    docx_contents[1] |>
    xml2::xml_text()

  ## extract table contents
  docx_table_body_header <-
    docx_contents[2] |>
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <-
    docx_contents[2] |>
    xml2::xml_find_all(".//w:tr") |>
    setdiff(docx_table_body_header)

  expect_equal(
    docx_table_caption_text,
    c("Table  SEQ Table \\* ARABIC 1: LETTERS")
  )

  expect_equal(
    docx_table_body_header |>
      xml2::xml_find_all(".//w:p") |>
      xml2::xml_text(),
    c("LETTERS", "upper_case", "lower_case")
  )

  expect_equal(
    lapply(
      docx_table_body_contents, function(x)
      x |> xml2::xml_find_all(".//w:p") |> xml2::xml_text()
    ),
    lapply(c(1:26,1:26), function(i) c(LETTERS[i], letters[i]))
  )
})

test_that("tables with cell & text coloring can be added to a word doc - no spanner", {

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

  docx_contents <- gt_to_word_contents(gt_exibble_min, align = "center")

  ## extract table contents
  docx_table_body_header <-
    docx_contents[1] |>
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <-
    docx_contents[1] |>
    xml2::xml_find_all(".//w:tr") |>
    setdiff(docx_table_body_header)

  ## header
  expect_equal(
    docx_table_body_header |>
      xml2::xml_find_all(".//w:p") |>
      xml2::xml_text(),
    c("", "num", "fctr", "date", "time", "datetime", "currency", "row", "group")
  )
  expect_equal(
    lapply(
      docx_table_body_header, function(x) x |> xml2::xml_find_all(".//w:shd") |> xml2::xml_attr(attr = "fill")
    ),
    list(c("FFC0CB", "00FF00", "00FF00", "00FF00", "00FF00", "00FF00", "00FF00", "00FF00", "00FF00"))
  )

  expect_equal(
    lapply(
      docx_table_body_header, function(x) x |> xml2::xml_find_all(".//w:color") |> xml2::xml_attr(attr = "val")
    ),
    list(c("008080", "008080", "008080", "008080", "008080", "008080", "008080", "008080"))
  )

  ## cell background styling
  expect_equal(
    lapply(
      docx_table_body_contents,
      function(x) {
        x |> xml2::xml_find_all(".//w:tc") |> lapply(function(y) {
          y |> xml2::xml_find_all(".//w:shd") |> xml2::xml_attr(attr = "fill")
        })
      }
    ),
    list(
      list(character()),
      list(character(), "FFA500", "FFA500", character(), "FFA500", character(), "FFA500", character(), "FFA500"),
      list(character(), "FFA500", "FFA500", character(), "FFA500", character(), "FFA500", character(), "FFA500"),
      list(character()),
      list(character(), "FFA500", "FFA500", character(), "FFA500", character(),"FFA500", character(), "FFA500"),
      list(character(), "FFA500", "FFA500", character(), "FFA500", character(),"FFA500", character(), "FFA500")
    )
  )

  ## cell text styling
  expect_equal(
    lapply(
      docx_table_body_contents,
      function(x) {
        x |> xml2::xml_find_all(".//w:tc") |> lapply(function(y) {
          y |> xml2::xml_find_all(".//w:color") |> xml2::xml_attr(attr = "val")
        })
      }
    ),
    list(
      list("0000FF"),
      list("00FF00",character(), character(), character(), character(), character(), character(), character(), character()),
      list("00FF00",character(), character(), character(), character(), character(), character(), character(), character()),
      list("0000FF"),
      list("00FF00", character(), character(), character(), character(), character(), character(), character(), character()),
      list("00FF00", character(), character(), character(), character(), character(), character(), character(), character())
    )
  )

  expect_equal(
    lapply(
      docx_table_body_contents, function(x)
      x |> xml2::xml_find_all(".//w:p") |> xml2::xml_text()
    ),
    list(
      "My Row Group 2",
      c(
        "coconut",
        "33.3300",
        "three",
        "2015-03-15",
        "15:45",
        "2018-03-03 03:44",
        "1.39",
        "row_3",
        "grp_a"
      ),
      c(
        "durian",
        "444.4000",
        "four",
        "2015-04-15",
        "16:50",
        "2018-04-04 15:55",
        "65100.00",
        "row_4",
        "grp_a"
      ),
      "My Row Group 1",
      c(
        "apricot",
        "0.1111",
        "one",
        "2015-01-15",
        "13:35",
        "2018-01-01 02:22",
        "49.95",
        "row_1",
        "grp_a"
      ),
      c(
        "banana",
        "2.2220",
        "two",
        "2015-02-15",
        "14:40",
        "2018-02-02 14:33",
        "17.95",
        "row_2",
        "grp_a"
      )
    )
  )
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

  docx_contents <- gt_to_word_contents(gt_exibble_min, align = "center")

  ## extract table contents
  docx_table_body_header <-
    docx_contents[1] |>
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  ## header
  expect_equal(
    docx_table_body_header |> xml2::xml_find_all(".//w:p") |> xml2::xml_text(),
    c("", "", "My Span Label top", "", "", "", "", "",
      "", "My Span Label", "", "", "", "",
      "", "num", "fctr", "date", "time", "datetime", "currency", "row", "group")
  )

  expect_equal(
    lapply(docx_table_body_header, function(x) {
      x |> xml2::xml_find_all(".//w:tc") |> lapply(function(y) {
        y |> xml2::xml_find_all(".//w:shd") |> xml2::xml_attr(attr = "fill")
      })}),
    list(
      list("FFC0CB", character(0L), "FF0000", character(0L), character(0L),  character(0L), character(0L), character(0L)),
      list("FFC0CB", "FFA500", character(0L), character(0), character(0), character(0)),
      list("FFC0CB", "00FF00", "00FF00", "00FF00", "00FF00", "00FF00",  "00FF00", "00FF00", "00FF00")
      )
  )

  expect_equal(
    lapply(docx_table_body_header, function(x) {
      x |> xml2::xml_find_all(".//w:tc") |> lapply(function(y) {
        y |> xml2::xml_find_all(".//w:color") |> xml2::xml_attr(attr = "val")
      })}),
    list(
      list(character(0L), character(0L), character(0L), character(0L),character(0L), character(0L), character(0L), character(0L)),
      list(character(0L), character(0L), character(0L), character(0L),character(0L), character(0L)),
      list(character(0L), "A020F0", "A020F0", "A020F0", "A020F0", "A020F0", "A020F0", "A020F0", "A020F0")
      )
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

  docx_contents <- gt_to_word_contents(gt_exibble_min, align = "center")

  docx_table_body_header <-
    docx_contents[1] |>
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_meta_info <-
    docx_contents[1] |>
    xml2::xml_find_all(".//w:tr") |>
    setdiff(docx_table_body_header) |>
    tail(3)

  ## header
  expect_equal(
    docx_table_meta_info |> lapply(function(x) x |> xml2::xml_find_all(".//w:t") |> xml2::xml_text()),
    list(
      c("My Footnote"),
      c("1", "My Footnote 2"),
      c("My Source Note")
    )
  )

  # TODO: fails due to PR#1268
  expect_equal(
    lapply(docx_table_meta_info, function(x) {
      x |> xml2::xml_find_all(".//w:tc") |> lapply(function(y) {
        y |> xml2::xml_find_all(".//w:color") |> xml2::xml_attr(attr = "val")
      })}),
    list(
      list("A020F0"),
      list(c("A020F0", "A020F0")),
      list("FFA500")
      )
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

  # check the xml
  xml <- read_xml_word_nodes(as_word_ooxml(gt_exibble_min))

  # first note
  expect_equal(
    xml_text(xml_find_all(xml, ".//w:tr[last()-1]//w:t")),
    "My Footnote"
  )
  expect_equal(length(xml_find_all(xml, ".//w:tr[last()-1]//w:b")), 0)

  # second note
  expect_equal(
    xml_text(xml_find_all(xml, ".//w:tr[last()]//w:t")),
    c("(1)", "My Footnote 2")
  )
  expect_equal(
    xml_attr(xml_find_all(xml, ".//w:tr[last()]//w:p//w:r[1]/w:rPr/w:vertAlign"), "val"),
    "baseline"
  )
  expect_equal(
    length(xml_find_all(xml, ".//w:tr[last()]//w:p//w:r[1]/w:rPr/w:b")),
    1
  )

  docx_contents <- gt_to_word_contents(gt_exibble_min, align = "center")

  docx_table_body_header <-
    docx_contents[1] |>
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_meta_info <-
    docx_contents[1] |>
    xml2::xml_find_all(".//w:tr") |>
    setdiff(docx_table_body_header) |>
    tail(2)

  ## footer
  expect_equal(
    docx_table_meta_info |> lapply(function(x) x |> xml2::xml_find_all(".//w:t") |> xml2::xml_text()),
    list(
      c("My Footnote"),
      c("(1)", "My Footnote 2")
    )
  )

  # Styling applied to bold text of footnote mark
  style_bold <-
    xml2::xml_find_all(
      docx_table_meta_info[[2]],
      ".//w:tc")[[1]]
  style_bold <- as.character(
    xml2::xml_find_all(style_bold, ".//w:rPr")[[1]]
  )

  expect_equal(
    style_bold,
    "<w:rPr>\n  <w:vertAlign w:val=\"baseline\"/>\n  <w:b/>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>"
  )
})

test_that("tables preserves spaces in text & can be added to a word doc", {
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

  docx_contents <- gt_to_word_contents(gt_exibble, align = "center")

  ## extract table contents
  docx_table_body_contents <-
    docx_contents[1] |>
    xml2::xml_find_all(".//w:tr")

  ## text is preserved
  expect_equal(
    lapply(
      docx_table_body_contents,
      FUN = function(x) xml2::xml_text(xml2::xml_find_all(x, ".//w:p"))
    ),
    list(
      c(
        "num",
        "5 Spaces Before",
        "5 Spaces After",
        "5 Spaces Before - preserve",
        "5 Spaces After - preserve"
      ),
      c("0.1111", " Preserve", "Preserve ", "     Preserve", "Preserve     ")
    )
  )

  ## text "space" is set to preserve only for last 2 body cols
  expect_equal(
    lapply(
      docx_table_body_contents,
      FUN = function(x) xml2::xml_attr((xml2::xml_find_all(x, ".//w:t")),"space")
    ),
    list(
      c("default", "default", "default", "default", "default"),
      c("default", "default", "default", "preserve","preserve")
    )
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

  docx_contents <- gt_to_word_contents(gt_exibble, align = "center")

  ## extract table contents
  docx_table_body_contents <-
    docx_contents[1] |>
    xml2::xml_find_all(".//w:tr")

  ## text is preserved
  expect_equal(
    lapply(
      docx_table_body_contents,
      FUN = function(x) xml2::xml_text(xml2::xml_find_all(x, ".//w:p"))
    ),
    list(
      c(
        "wide column number 1",
        "wide column number 2",
        "wide column number 3",
        "tcn4"
      ),
      c("0.1111", "apricot", "one","2015-01-15"),
      c("2.2220", "banana", "two","2015-02-15")
    )
  )

  ## text "space" is set to preserve only for last 2 body cols
  expect_equal(
    lapply(
      docx_table_body_contents,
      FUN = function(x)
        x |>
        xml2::xml_find_all(".//w:pPr") |>
        lapply(FUN = function(y) xml2::xml_attr(xml2::xml_find_all(y,".//w:jc"),"val"))
    ),
    list(
      ## styling only on 1st and 4th column of header (stub and 3rd column) is right aligned
      list("end", "start", "start", "end"),

      ## styling as applied or as default from gt
      list("end", "start", "start", "end"),
      list("start", "end", "end", "end"))
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

  docx_contents <- gt_to_word_contents(markdown_gt)

  ## extract table contents
  docx_table_body_contents <-
    docx_contents[1] |>
    xml2::xml_find_all(".//w:tr")

  ## text is preserved
  expect_equal(
    lapply(
      docx_table_body_contents,
      FUN = function(x) {xml2::xml_find_all(x, ".//w:tc") |>
        lapply(function(x) {xml2::xml_text(xml2::xml_find_all(x,".//w:p"))})
      }
    ),
    list(
      list("Markdown", "md1"),
      list(c("This is Markdown.",
             "Markdown's syntax is comprised entirely of punctuation characters, which punctuation characters have been carefully chosen so as to look like what they mean... assuming you've ever used email.",
             "this is a line break test"),
           c("- countrypops",
             "- sza",
             "  -   indented col",
             "1.    newval",
             "2.    another val",
             "3.    will this work")
           ),
      list(
        "Info on Markdown syntax can be found at a website.",
        "There's a quick reference here."),
      list(
        "1This is text"))
  )

  ## check styling in first row first column (Header)
  styling_cell_text <-
    (
      docx_table_body_contents[[2]] |>
      xml2::xml_find_all(".//w:tc")
    )[[1]] |>
    xml2::xml_find_all(".//w:rPr")

  expect_equal(
    as.character(styling_cell_text),
    c(
      "<w:rPr>\n  <w:sz w:val=\"28\"/>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n</w:rPr>",
      "<w:rPr>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>",
      "<w:rPr>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>",
      "<w:rPr>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>",
      "<w:rPr>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>",
      "<w:rPr>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>",
      "<w:rPr>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>",
      "<w:rPr>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>",
      "<w:rPr>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>",
      "<w:rPr>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>",
      "<w:rPr>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>"
    )
  )

  ## check styling in second row first column (bold, italics, code, and website url styling)
  styling_cell_text <-
    (
      docx_table_body_contents[[3]] |>
      xml2::xml_find_all(".//w:tc")
    )[[1]] |>
    xml2::xml_find_all(".//w:rPr")

  expect_equal(
    as.character(styling_cell_text),
    c(
      "<w:rPr>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>",
      "<w:rPr>\n  <w:b w:val=\"true\"/>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>",
      "<w:rPr>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>",
      "<w:rPr>\n  <w:i/>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>",
      "<w:rPr>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>",
      "<w:rPr>\n  <w:rStyle w:val=\"Macro Text\"/>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>",
      "<w:rPr>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>",
      "<w:rPr>\n  <w:rStyle w:val=\"Hyperlink\"/>\n  <w:color w:val=\"0563C1\"/>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>",
      "<w:rPr>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>"
    )
  )
})

test_that("markdown with urls work", {
  skip_on_ci()

  text_sample <- "
  Hyperlink [here](https://commonmark.org/help/) and to [google](https://www.google.com)
  "

  markdown_gt <-
    dplyr::tribble(
      ~url,
      text_sample
    ) |>
    gt() |>
    fmt_markdown(columns = everything())

  docx_contents <- gt_to_word_contents(markdown_gt)

  ## extract table hyperlinks
  docx_table_hyperlinks <-
    docx_contents[1] |>
    xml2::xml_find_all(".//w:hyperlink")

  ## hyperlinks are preserved and updated to be rId
  expect_length(docx_table_hyperlinks, 2)
  expect_match(xml_attr(docx_table_hyperlinks, "id"), "^rId\\d+$")

  rels <- attr(docx_contents, "rels")
  expect_equal(rels$Target[rels$Id == xml_attr(docx_table_hyperlinks[1], "id")], "https://commonmark.org/help/")
  expect_equal(rels$Target[rels$Id == xml_attr(docx_table_hyperlinks[2], "id")], "https://www.google.com")

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

  docx_contents <- gt_to_word_contents(markdown_gt)

  ## extract table hyperlinks
  docx_table_image <-
    docx_contents[1] |>
    xml2::xml_find_all(".//a:blip")

  ## hyperlinks are preserved and updated to be rId
  expect_length(docx_table_image, 2)
  expect_match(xml_attr(docx_table_image, "embed"), "^rId\\d+$")

  rels <- attr(docx_contents, "rels")
  expect_equal(rels$Target[rels$Id == xml_attr(docx_table_image[1], "embed")], "media/testimage.png")
  expect_equal(rels$Target[rels$Id == xml_attr(docx_table_image[2], "embed")], "media/testimage.svg")
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

  docx_contents <- gt_to_word_contents(image_gt)

  ## extract table hyperlinks
  docx_table_image <-
    docx_contents[1] |>
    xml2::xml_find_all(".//a:blip")

  ## hyperlinks are preserved and updated to be rId
  expect_length(docx_table_image, 4)

  # Expect match has all = TRUE as a default
  expect_match(xml_attr(docx_table_image, "embed"), "^rId\\d+$")

  rels <- attr(docx_contents, "rels")
  expect_equal(rels$Target[rels$Id == xml_attr(docx_table_image[1], "embed")], "media/testimage.png")
  expect_equal(rels$Target[rels$Id == xml_attr(docx_table_image[2], "embed")], "media/testimage.svg")
  expect_equal(rels$Target[rels$Id == xml_attr(docx_table_image[3], "embed")], "media/testimage.svg")
  expect_equal(rels$Target[rels$Id == xml_attr(docx_table_image[4], "embed")], "media/gtpartsofatable.svg")

  ## Check that the image h/w ratios are preserved
  docx_contents |>
    xml2::xml_find_all(".//wp:extent") |>
    xml2::xml_attrs() |>
    sapply(function(x) {as.numeric(x[["cy"]])/as.numeric(x[["cx"]])}) |>
    expect_equal(
      c(1,1,1,0.627451),
      tolerance = .0000001 ## check out to 6 decimals for the ratio
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

  docx_contents <- gt_to_word_contents(https_image_gt)

  ## extract table hyperlinks
  docx_table_image <-
    docx_contents[1] |>
    xml2::xml_find_all(".//a:blip")

  ## hyperlinks are preserved and updated to be rId
  expect_length(docx_table_image, 1)
  expect_match(xml_attr(docx_table_image, "embed"), "^rId\\d+$")

  # first should be the logo.svg with some random numbers ahead of it
  rels <- attr(docx_contents, "rels")
  expect_length(obj <- rels$Target[rels$Id == xml_attr(docx_table_image[1], "embed")], 1)
  expect_match(obj, "^media/.+?logo[.]svg$")
})

test_that("table with image refs work - local only - setting image widths and heights", {
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

  image_gt_height_and_width <-
    dplyr::tribble(
      ~md,
      paste0(c(temp_png,temp_svg), collapse = ", "), ## two images next to each other
      temp_svg, # single image, square
      ref_wide_svg # a wide image is respected
    ) |>
    gt() |>
    fmt_image(columns = everything(), sep = ",", height = "1in", width = "2in")

  image_gt_height <-
    dplyr::tribble(
      ~md,
      paste0(c(temp_png,temp_svg), collapse = ", "), ## two images next to each other
      temp_svg, # single image, square
      ref_wide_svg # a wide image is respected
    ) |>
    gt() |>
    fmt_image(columns = everything(), sep = ",", height = "2in")

  image_gt_width <-
    dplyr::tribble(
      ~md,
      paste0(c(temp_png,temp_svg), collapse = ", "), ## two images next to each other
      temp_svg, # single image, square
      ref_wide_svg # a wide image is respected
    ) |>
    gt() |>
    fmt_image(columns = everything(), sep = ",", width = "1in")

  docx_contents_1 <- gt_to_word_contents(image_gt_height_and_width)
  docx_contents_2 <- gt_to_word_contents(image_gt_height)
  docx_contents_3 <- gt_to_word_contents(image_gt_width)

  docx_contents_1 |>
    xml2::xml_find_all(".//wp:extent") |>
    xml2::xml_attrs() |>
    lapply(function(x) {list(height = x[["cy"]], width = x[["cx"]], ratio = as.numeric(x[["cy"]])/as.numeric(x[["cx"]]))}) |>
    expect_equal(
      list(
        list(height = "914400", width = "1828800", ratio = 0.5),
        list(height = "914400", width = "1828800", ratio = 0.5),
        list(height = "914400", width = "1828800", ratio = 0.5),
        list(height = "914400", width = "1828800", ratio = 0.5)
      ),
      tolerance = .0000001 ## check out to 6 decimals for the ratio
    )

  docx_contents_2 |>
    xml2::xml_find_all(".//wp:extent") |>
    xml2::xml_attrs() |>
    lapply(function(x) {list(height = x[["cy"]], width = x[["cx"]], ratio = as.numeric(x[["cy"]])/as.numeric(x[["cx"]]))}) |>
    expect_equal(
      list(
        list(height = "1828800", width = "1828800", ratio = 1),
        list(height = "1828800", width = "1828800", ratio = 1),
        list(height = "1828800", width = "1828800", ratio = 1),
        list(height = "1828800", width = "2914650", ratio = 0.627451)
      ),
      tolerance = .0000001 ## check out to 6 decimals for the ratio
    )

  ## Check that the image h/w ratios are preserved
  docx_contents_3 |>
    xml2::xml_find_all(".//wp:extent") |>
    xml2::xml_attrs() |>
    lapply(function(x) {list(height = x[["cy"]], width = x[["cx"]], ratio = as.numeric(x[["cy"]]) / as.numeric(x[["cx"]]))}) |>
    expect_equal(
      list(
        list(height = "914400", width = "914400", ratio = 1),
        list(height = "914400", width = "914400", ratio = 1),
        list(height = "914400", width = "914400", ratio = 1),
        list(height = "571500", width = "914400", ratio = 0.625)
      )
    )
})

test_that("sub_small_vals() and sub_large_vals() are properly encoded", {

  data <- dplyr::tibble(x = c(0.001, 0.01, 150), y = c("<", "%", ">"))

  tbl <-
    data |>
    gt() |>
    sub_small_vals() |>
    sub_large_vals(threshold = 100)

  xml <- read_xml_word_nodes(as_word_ooxml(tbl))

  expect_equal(
    xml_text(xml_find_all(xml, ".//w:tc[1]//w:t")),
    c("x", "<0.01", "0.01", "\U{2265}100")
  )

  expect_equal(
    xml_text(xml_find_all(xml, ".//w:tc[2]//w:t")),
    c("y", "<", "%", ">")
  )
})

test_that("tables with summaries can be added to a word doc", {

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

  xml <- read_xml_word_nodes(as_word_ooxml(gt_exibble_min))

  avg_row <- xml_find_all(xml, './/w:t[text() = "avg"]/../../../..')
  expect_equal(
    xml_text(xml_find_all(avg_row, './/w:t')),
    c("avg", "120.02", "\U{2014}", "\U{2014}", "avg", "3,220,850.00", "\U{2014}","\U{2014}")
  )
  expect_equal(
    xml_attr(xml_find_all(avg_row, './/w:tcBorders/w:top'), "sz"),
    rep("16", 8)
  )
  expect_equal(
    xml_attr(xml_find_all(avg_row, './/w:tcBorders/w:bottom'), "sz"),
    rep("2", 8)
  )

  total_row <- xml_find_all(xml, './/w:t[text() = "total"]/../../../..')
  expect_equal(
    xml_text(xml_find_all(total_row, './/w:t')),
    c("total", "480.06", "\U{2014}", "\U{2014}", "total", "9,662,550.00","\U{2014}", "\U{2014}")
  )
  expect_equal(
    xml_attr(xml_find_all(total_row, './/w:tcBorders/w:top'), "sz"),
    rep("2", 8)
  )
  expect_equal(
    xml_attr(xml_find_all(total_row, './/w:tcBorders/w:bottom'), "sz"),
    rep("2", 8)
  )

  sd_row <- xml_find_all(xml, './/w:t[text() = "s.d."]/../../../..')
  expect_equal(
    xml_text(xml_find_all(sd_row, './/w:t')),
    c("s.d.", "216.79", "\U{2014}", "\U{2014}", "s.d.", "4,916,123.25", "\U{2014}","\U{2014}")
  )
  expect_equal(
    xml_attr(xml_find_all(sd_row, './/w:tcBorders/w:top'), "sz"),
    rep("2", 8)
  )
  expect_equal(
    xml_attr(xml_find_all(sd_row, './/w:tcBorders/w:bottom'), "sz"),
    rep("16", 8)
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
  xml <- read_xml_word_nodes(as_word_ooxml(gt_exibble_min_top))

  avg_row <- xml_find_all(xml, './/w:t[text() = "avg"]/../../../..')
  expect_equal(
    xml_text(xml_find_all(avg_row, './/w:t')),
    c("avg", "120.02", "\U{2014}", "\U{2014}", "avg", "3,220,850.00", "\U{2014}","\U{2014}")
  )
  expect_equal(
    xml_attr(xml_find_all(avg_row, './/w:tcBorders/w:top'), "sz"),
    rep("16", 8)
  )
  expect_equal(
    xml_attr(xml_find_all(avg_row, './/w:tcBorders/w:bottom'), "sz"),
    rep("2", 8)
  )

  total_row <- xml_find_all(xml, './/w:t[text() = "total"]/../../../..')
  expect_equal(
    xml_text(xml_find_all(total_row, './/w:t')),
    c("total", "480.06", "\U{2014}", "\U{2014}", "total", "9,662,550.00","\U{2014}", "\U{2014}")
  )
  expect_equal(
    xml_attr(xml_find_all(total_row, './/w:tcBorders/w:top'), "sz"),
    rep("2", 8)
  )
  expect_equal(
    xml_attr(xml_find_all(total_row, './/w:tcBorders/w:bottom'), "sz"),
    rep("2", 8)
  )

  sd_row <- xml_find_all(xml, './/w:t[text() = "s.d."]/../../../..')
  expect_equal(
    xml_text(xml_find_all(sd_row, './/w:t')),
    c("s.d.", "216.79", "\U{2014}", "\U{2014}", "s.d.", "4,916,123.25", "\U{2014}","\U{2014}")
  )
  expect_equal(
    xml_attr(xml_find_all(sd_row, './/w:tcBorders/w:top'), "sz"),
    rep("2", 8)
  )
  expect_equal(
    xml_attr(xml_find_all(sd_row, './/w:tcBorders/w:bottom'), "sz"),
    rep("16", 8)
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

  xml <- read_xml_word_nodes(as_word_ooxml(gt_exibble_min))

  avg_row <- xml_find_all(xml, './/w:t[text() = "avg"]/../../../..')
  expect_equal(
    xml_attr(xml_find_all(avg_row[1:2], './/w:tc[1]//w:rPr/w:color'), "val"),
    c("00FF00", "00FF00")
  )
  expect_equal(
    xml_attr(xml_find_all(avg_row[3], './/w:tc[1]//w:rPr/w:color'), "val"),
    character()
  )

  expect_equal(
    xml_attr(xml_find_all(avg_row[1], './/w:tc[3]//w:rPr/w:color'), "val"),
    c("FFA500")
  )
  expect_equal(
    xml_attr(xml_find_all(avg_row[2], './/w:tc[3]//w:rPr/w:color'), "val"),
    character()
  )
  expect_equal(
    xml_attr(xml_find_all(avg_row[3], './/w:tc[1]//w:tcPr/w:shd'), "fill"),
    "FFFF00"
  )

  total_row <- xml_find_all(xml, './/w:t[text() = "total"]/../../../..')
  expect_equal(
    xml_attr(xml_find_all(total_row[1:2], './/w:tc[1]//w:rPr/w:color'), "val"),
    c("00FF00", "00FF00")
  )
  expect_equal(
    xml_attr(xml_find_all(total_row[3], './/w:tc[1]//w:rPr/w:color'), "val"),
    character()
  )

  expect_equal(
    xml_attr(xml_find_all(total_row[1], './/w:tc[3]//w:rPr/w:color'), "val"),
    c("FFA500")
  )
  expect_equal(
    xml_attr(xml_find_all(total_row[2], './/w:tc[3]//w:rPr/w:color'), "val"),
    character()
  )
  expect_equal(
    xml_attr(xml_find_all(total_row[3], './/w:tc[1]//w:tcPr/w:shd'), "fill"),
    "FFFF00"
  )


  sd_row <- xml_find_all(xml, './/w:t[text() = "s.d."]/../../../..')
  expect_equal(
    xml_attr(xml_find_all(sd_row[1:2], './/w:tc[1]//w:rPr/w:color'), "val"),
    c("00FF00", "00FF00")
  )
  expect_equal(
    xml_attr(xml_find_all(sd_row[3], './/w:tc[1]//w:rPr/w:color'), "val"),
    character()
  )

  expect_equal(
    xml_attr(xml_find_all(sd_row[1], './/w:tc[3]//w:rPr/w:color'), "val"),
    c("FFA500")
  )
  expect_equal(
    xml_attr(xml_find_all(sd_row[2], './/w:tc[3]//w:rPr/w:color'), "val"),
    character()
  )
  expect_equal(
    xml_attr(xml_find_all(sd_row[3], './/w:tc[1]//w:tcPr/w:shd'), "fill"),
    "FFFF00"
  )
  expect_equal(
    xml_attr(xml_find_all(sd_row[3], './/w:tc[2]//w:rPr/w:color'), "val"),
    "A020F0"
  )

})

test_that("tables with grand summaries but no rownames can be added to a word doc", {

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

  xml <- read_xml_word_nodes(as_word_ooxml(gt_exibble_min))

  expect_equal(
    xml_text(xml_find_all(xml, ".//w:tr[1]//w:p")),
    c( "", "num", "char", "currency")
  )

  expect_equal(
    lapply(2: 5, function(i) {
      xml_text(xml_find_all(xml, glue::glue(".//w:tr[{i}]//w:p")))
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
  xml <- read_xml_word_nodes(as_word_ooxml(gt_exibble_min_top))

  expect_equal(
    xml_text(xml_find_all(xml, ".//w:tr[1]//w:p")),
    c( "", "num", "char", "currency")
  )

  expect_equal(
    lapply(2: 5, function(i) {
      xml_text(xml_find_all(xml, glue::glue(".//w:tr[{i}]//w:p")))
    }),
    list(
      c("Total", "3", "—", "3"),
      c("", "0.1111", "apricot", "49.95"),
      c("", "2.2220", "banana", "17.95"),
      c("", "33.3300", "coconut", "1.39")
    )
  )
})
