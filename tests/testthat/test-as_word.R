# Function to skip tests if Suggested packages not available on system
check_suggests_xml <- function() {
  skip_if_not_installed("officer")
  skip_if_not_installed("xml2")
}

test_that("word ooxlm can be generated from gt object", {

  local_edition(3)

  # Create a one-row table for these tests
  exibble_min <- exibble[1, ]

  ## basic table
  exibble_min %>%
    gt() %>%
    as_word() %>%
    expect_snapshot()

  ## basic table with title
  exibble_min %>%
    gt() %>%
    tab_header(
      title = "TABLE TITLE",
      subtitle = "table subtitle"
    ) %>%
    as_word() %>%
    expect_snapshot()

  ## basic table with title added below table
  exibble_min %>%
    gt() %>%
    tab_header(
      title = "TABLE TITLE",
      subtitle = "table subtitle"
    ) %>%
    as_word(caption_location = "bottom") %>%
    expect_snapshot()

  ## basic table with title embedded on the top of table
  exibble_min %>%
    gt() %>%
    tab_header(
      title = "TABLE TITLE",
      subtitle = "table subtitle"
    ) %>%
    as_word(caption_location = "embed") %>%
    expect_snapshot()

  ## basic table with split enabled
  exibble_min %>%
    gt() %>%
    tab_header(
      title = "TABLE TITLE",
      subtitle = "table subtitle"
    ) %>%
    as_word(
      split = TRUE
    ) %>%
    expect_snapshot()

  ## basic table with keep_with_next disabled (should only appear in the column
  ## headers)
  exibble_min %>%
    gt() %>%
    tab_header(
      title = "TABLE TITLE",
      subtitle = "table subtitle"
    ) %>%
    as_word(
      keep_with_next = FALSE
    ) %>%
    expect_snapshot()

})

test_that("tables can be added to a word doc", {

  check_suggests_xml()

  local_edition(3)

  ## simple table
  gt_exibble_min <- exibble[1:2,] %>%
    gt() %>%
    tab_header(
      title = "table title",
      subtitle = "table subtitle"
    )

  ## Add table to empty word document
  word_doc <- officer::read_docx() %>%
    body_add_gt(
      gt_exibble_min,
      align = "center"
    )

  ## save word doc to temporary file
  temp_word_file <- tempfile(fileext = ".docx")
  print(word_doc,target = temp_word_file)

  ## Manual Review
  if(!testthat::is_testing() & interactive()){
    shell.exec(temp_word_file)
  }

  ## Programmatic Review
  docx <- officer::read_docx(temp_word_file)

  ## get docx table contents
  docx_contents <- docx$doc_obj$get() %>%
    xml2::xml_children() %>%
    xml2::xml_children()

  ## extract table caption
  docx_table_caption_text <- docx_contents[1:2] %>%
    xml2::xml_text()

  ## extract table contents
  docx_table_body_header <- docx_contents[3] %>%
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <- docx_contents[3] %>%
    xml2::xml_find_all(".//w:tr") %>%
    setdiff(docx_table_body_header)

  expect_equal(
    docx_table_caption_text,
    c("Table  SEQ Table \\* ARABIC 1: table title", "table subtitle")
  )

  expect_equal(
    docx_table_body_header %>%
      xml2::xml_find_all(".//w:p") %>%
      xml2::xml_text(),
    c("num", "char", "fctr",
      "date", "time","datetime",
      "currency",  "row", "group")
  )

  expect_equal(
    lapply(docx_table_body_contents, function(x)
      x %>% xml2::xml_find_all(".//w:p") %>% xml2::xml_text()),
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

  check_suggests_xml()

  local_edition(3)

  ## simple table
  gt_exibble_min <- exibble[1:2,] %>%
    gt() %>%
    tab_header(
      title = "table title",
      subtitle = "table subtitle"
    ) %>%
    ## add spanner across columns 1:5
    tab_spanner(
      "My Column Span",
      columns = 3:5
    )

  ## Add table to empty word document
  word_doc <- officer::read_docx() %>%
    body_add_gt(
      gt_exibble_min,
      align = "center"
    )

  ## save word doc to temporary file
  temp_word_file <- tempfile(fileext = ".docx")
  print(word_doc,target = temp_word_file)

  ## Manual Review
  if(!testthat::is_testing() & interactive()){
    shell.exec(temp_word_file)
  }

  ## Programmatic Review
  docx <- officer::read_docx(temp_word_file)

  ## get docx table contents
  docx_contents <- docx$doc_obj$get() %>%
    xml2::xml_children() %>%
    xml2::xml_children()

  ## extract table caption
  docx_table_caption_text <- docx_contents[1:2] %>%
    xml2::xml_text()

  ## extract table contents
  docx_table_body_header <- docx_contents[3] %>%
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <- docx_contents[3] %>%
    xml2::xml_find_all(".//w:tr") %>%
    setdiff(docx_table_body_header)

  expect_equal(
    docx_table_caption_text,
    c("Table  SEQ Table \\* ARABIC 1: table title", "table subtitle")
  )

  expect_equal(
    docx_table_body_header %>%
      xml2::xml_find_all(".//w:p") %>%
      xml2::xml_text(),
    c( "","","My Column Span", "","","","",
      "num", "char","fctr", "date", "time","datetime", "currency", "row","group")
  )

  expect_equal(
    lapply(docx_table_body_contents, function(x)
      x %>% xml2::xml_find_all(".//w:p") %>% xml2::xml_text()),
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

  check_suggests_xml()

  local_edition(3)

  ## simple table
  gt_exibble_min <- exibble[1:2,] %>%
    gt() %>%
    tab_header(
      title = "table title",
      subtitle = "table subtitle"
    ) %>%
    ## add spanner across columns 1:5
    tab_spanner(
      "My 1st Column Span L1",
      columns = 1:5
    ) %>%
    tab_spanner(
      "My Column Span L2",
      columns = 2:5,level = 2
    ) %>%
    tab_spanner(
      "My 2nd Column Span L1",
      columns = 8:9
    )

  ## Add table to empty word document
  word_doc <- officer::read_docx() %>%
    body_add_gt(
      gt_exibble_min,
      align = "center"
    )

  ## save word doc to temporary file
  temp_word_file <- tempfile(fileext = ".docx")
  print(word_doc,target = temp_word_file)

  ## Manual Review
  if(!testthat::is_testing() & interactive()){
    shell.exec(temp_word_file)
  }

  ## Programmatic Review
  docx <- officer::read_docx(temp_word_file)

  ## get docx table contents
  docx_contents <- docx$doc_obj$get() %>%
    xml2::xml_children() %>%
    xml2::xml_children()

  ## extract table caption
  docx_table_caption_text <- docx_contents[1:2] %>%
    xml2::xml_text()

  ## extract table contents
  docx_table_body_header <- docx_contents[3] %>%
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <- docx_contents[3] %>%
    xml2::xml_find_all(".//w:tr") %>%
    setdiff(docx_table_body_header)

  expect_equal(
    docx_table_caption_text,
    c("Table  SEQ Table \\* ARABIC 1: table title", "table subtitle")
  )

  expect_equal(
    docx_table_body_header %>%
      xml2::xml_find_all(".//w:p") %>%
      xml2::xml_text(),
    c("", "My Column Span L2", "","","","",
      "My 1st Column Span L1", "","", "My 2nd Column Span L1",
      "num", "char","fctr", "date", "time","datetime", "currency", "row","group")
  )

  expect_equal(
    lapply(docx_table_body_contents, function(x)
      x %>% xml2::xml_find_all(".//w:p") %>% xml2::xml_text()),
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

test_that("tables with summaries can be added to a word doc", {

  check_suggests_xml()

  local_edition(3)

  ## simple table
  gt_exibble_min <- exibble %>%
    dplyr::select(-c(fctr, date, time, datetime)) %>%
    gt(rowname_col = "row", groupname_col = "group") %>%
    summary_rows(
      groups = TRUE,
      columns = num,
      fns = list(
        avg = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        s.d. = ~sd(., na.rm = TRUE)
      )
    )

  ## Add table to empty word document
  word_doc <- officer::read_docx() %>%
    body_add_gt(
      gt_exibble_min,
      align = "center"
    )

  ## save word doc to temporary file
  temp_word_file <- tempfile(fileext = ".docx")
  print(word_doc,target = temp_word_file)

  ## Manual Review
  if(!testthat::is_testing() & interactive()){
    shell.exec(temp_word_file)
  }

  ## Programmatic Review
  docx <- officer::read_docx(temp_word_file)

  ## get docx table contents
  docx_contents <- docx$doc_obj$get() %>%
    xml2::xml_children() %>%
    xml2::xml_children()

  ## extract table contents
  docx_table_body_header <- docx_contents[1] %>%
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <- docx_contents[1] %>%
    xml2::xml_find_all(".//w:tr") %>%
    setdiff(docx_table_body_header)

  ## "" at beginning for stubheader
  expect_equal(
    docx_table_body_header %>%
      xml2::xml_find_all(".//w:p") %>%
      xml2::xml_text(),
    c( "", "num", "char", "currency")
  )

  expect_equal(
    lapply(docx_table_body_contents, function(x)
      x %>% xml2::xml_find_all(".//w:p") %>% xml2::xml_text()),
    list(
      "grp_a",
      c("row_1", "1.111e-01", "apricot", "49.950"),
      c("row_2", "2.222e+00",  "banana", "17.950"),
      c("row_3", "3.333e+01", "coconut", "1.390"),
      c("row_4", "4.444e+02",  "durian", "65100.000"),
      c("avg",    "120.02",       "—", "—"),
      c("total",    "480.06",       "—", "—"),
      c("s.d.",    "216.79",       "—", "—"),
      "grp_b",
      c("row_5",    "5.550e+03",         "NA", "1325.810"),
      c("row_6",           "NA",        "fig", "13.255"),
      c("row_7",    "7.770e+05", "grapefruit", "NA"),
      c("row_8",    "8.880e+06",   "honeydew", "0.440"),
      c("avg", "3,220,850.00",          "—", "—"),
      c("total", "9,662,550.00",          "—", "—"),
      c("s.d.", "4,916,123.25",          "—", "—")
    )
  )

})

test_that("tables with footnotes can be added to a word doc", {

  check_suggests_xml()

  local_edition(3)

  ## simple table
  gt_exibble_min <- exibble[1:2,] %>%
    gt() %>%
    tab_footnote(
      footnote = md("this is a footer example"),
      locations = cells_column_labels(columns = num )
    )%>%
    tab_footnote(
      footnote = md("this is a second footer example"),
      locations = cells_column_labels(columns = char )
    )

  ## Add table to empty word document
  word_doc <- officer::read_docx() %>%
    body_add_gt(
      gt_exibble_min,
      align = "center"
    )

  ## save word doc to temporary file
  temp_word_file <- tempfile(fileext = ".docx")
  print(word_doc,target = temp_word_file)

  ## Manual Review
  if(!testthat::is_testing() & interactive()){
    shell.exec(temp_word_file)
  }

  ## Programmatic Review
  docx <- officer::read_docx(temp_word_file)

  ## get docx table contents
  docx_contents <- docx$doc_obj$get() %>%
    xml2::xml_children() %>%
    xml2::xml_children()

  ## extract table contents
  docx_table_body_header <- docx_contents[1] %>%
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <- docx_contents[1] %>%
    xml2::xml_find_all(".//w:tr") %>%
    setdiff(docx_table_body_header)


  ## superscripts will display as "true#false" due to
  ## xml being:
  ## <w:vertAlign w:val="superscript"/><w:i>true</w:i><w:t xml:space="default">1</w:t><w:i>false</w:i>,
  ## and being converted to TRUE due to italic being true, then the superscript, then turning off italics
  expect_equal(
    docx_table_body_header %>%
      xml2::xml_find_all(".//w:p") %>%
      xml2::xml_text(),
    c("numtrue1false", "chartrue2false", "fctr",
      "date", "time","datetime",
      "currency",  "row", "group")
  )

  ## superscripts will display as "true##" due to
  ## xml being:
  ## <w:vertAlign w:val="superscript"/><w:i>true</w:i><w:t xml:space="default">1</w:t>,
  ## and being converted to TRUE due to italic being true, then the superscript,
  expect_equal(
    lapply(docx_table_body_contents, function(x)
      x %>% xml2::xml_find_all(".//w:p") %>% xml2::xml_text()),
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
      c("true1this is a footer example"),
      c("true2this is a second footer example")
    )
  )

})

test_that("tables with source notes can be added to a word doc", {

  check_suggests_xml()


  local_edition(3)

  ## simple table
  gt_exibble_min <- exibble[1:2, ] %>%
    gt() %>%
    tab_source_note(source_note = "this is a source note example")

  ## Add table to empty word document
  word_doc <- officer::read_docx() %>%
    body_add_gt(gt_exibble_min,
                align = "center")

  ## save word doc to temporary file
  temp_word_file <- tempfile(fileext = ".docx")
  print(word_doc, target = temp_word_file)

  ## Manual Review
  if (!testthat::is_testing() & interactive()) {
    shell.exec(temp_word_file)
  }

  ## Programmatic Review
  docx <- officer::read_docx(temp_word_file)

  ## get docx table contents
  docx_contents <- docx$doc_obj$get() %>%
    xml2::xml_children() %>%
    xml2::xml_children()

  ## extract table contents
  docx_table_body_header <- docx_contents[1] %>%
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <- docx_contents[1] %>%
    xml2::xml_find_all(".//w:tr") %>%
    setdiff(docx_table_body_header)

  expect_equal(
    docx_table_body_header %>%
      xml2::xml_find_all(".//w:p") %>%
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
    lapply(docx_table_body_contents, function(x)
      x %>% xml2::xml_find_all(".//w:p") %>% xml2::xml_text()),
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

  check_suggests_xml()

  local_edition(3)

  ## simple table
  gt_letters <- tibble::tibble(
    upper_case = c(LETTERS,LETTERS),
    lower_case = c(letters,letters)
    )%>%
    gt() %>%
    tab_header(
      title = "LETTERS"
    )

  ## Add table to empty word document
  word_doc <- officer::read_docx() %>%
    body_add_gt(
      gt_letters,
      align = "center"
    )

  ## save word doc to temporary file
  temp_word_file <- tempfile(fileext = ".docx")
  print(word_doc,target = temp_word_file)

  ## Manual Review
  if(!testthat::is_testing() & interactive()){
    shell.exec(temp_word_file)
  }

  ## Programmatic Review
  docx <- officer::read_docx(temp_word_file)

  ## get docx table contents
  docx_contents <- docx$doc_obj$get() %>%
    xml2::xml_children() %>%
    xml2::xml_children()

  ## extract table caption
  docx_table_caption_text <- docx_contents[1] %>%
    xml2::xml_text()

  ## extract table contents
  docx_table_body_header <- docx_contents[2] %>%
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <- docx_contents[2] %>%
    xml2::xml_find_all(".//w:tr") %>%
    setdiff(docx_table_body_header)

  expect_equal(
    docx_table_caption_text,
    c("Table  SEQ Table \\* ARABIC 1: LETTERS")
  )

  expect_equal(
    docx_table_body_header %>%
      xml2::xml_find_all(".//w:p") %>%
      xml2::xml_text(),
    c("upper_case", "lower_case")
  )

  expect_equal(
    lapply(docx_table_body_contents, function(x)
      x %>% xml2::xml_find_all(".//w:p") %>% xml2::xml_text()),
    lapply(c(1:26,1:26),function(i)c(LETTERS[i], letters[i]))
  )

})

test_that("long tables with spans can be added to a word doc", {

  check_suggests_xml()

  local_edition(3)

  ## simple table
  gt_letters <- tibble::tibble(
    upper_case = c(LETTERS,LETTERS),
    lower_case = c(letters,letters)
    )%>%
    gt() %>%
    tab_header(
      title = "LETTERS"
    ) %>%
    tab_spanner(
      "LETTERS",
      columns = 1:2
    )

  ## Add table to empty word document
  word_doc <- officer::read_docx() %>%
    body_add_gt(
      gt_letters,
      align = "center"
    )

  ## save word doc to temporary file
  temp_word_file <- tempfile(fileext = ".docx")
  print(word_doc,target = temp_word_file)

  ## Manual Review
  if(!testthat::is_testing() & interactive()){
    shell.exec(temp_word_file)
  }

  ## Programmatic Review
  docx <- officer::read_docx(temp_word_file)

  ## get docx table contents
  docx_contents <- docx$doc_obj$get() %>%
    xml2::xml_children() %>%
    xml2::xml_children()

  ## extract table caption
  docx_table_caption_text <- docx_contents[1] %>%
    xml2::xml_text()

  ## extract table contents
  docx_table_body_header <- docx_contents[2] %>%
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <- docx_contents[2] %>%
    xml2::xml_find_all(".//w:tr") %>%
    setdiff(docx_table_body_header)

  expect_equal(
    docx_table_caption_text,
    c("Table  SEQ Table \\* ARABIC 1: LETTERS")
  )

  expect_equal(
    docx_table_body_header %>%
      xml2::xml_find_all(".//w:p") %>%
      xml2::xml_text(),
    c("LETTERS", "upper_case", "lower_case")
  )

  expect_equal(
    lapply(docx_table_body_contents, function(x)
      x %>% xml2::xml_find_all(".//w:p") %>% xml2::xml_text()),
    lapply(c(1:26,1:26),function(i)c(LETTERS[i], letters[i]))
  )

})
