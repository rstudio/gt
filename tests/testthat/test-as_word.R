skip_on_ci()

#' @title Add gt table into a Word document
#' @description Add a gt into a Word document.
#' @param x `rdocx` object
#' @param value `gt` object
#' @param align left, center (default) or right.
#' @param caption_location top (default), bottom, or embed Indicating if the title and subtitle should be listed above, below, or be embedded in the table
#' @param caption_align left (default), center, or right. Alignment of caption (title and subtitle). Used when `caption_location` is not "embed".
#' @param split set to TRUE if you want to activate Word
#' option 'Allow row to break across pages'.
#' @param keep_with_next Word option 'keep rows together' can be
#' activated when TRUE. It avoids page break within tables.
#' @param pos where to add the gt table relative to the cursor,
#' one of "after" (default), "before", "on" (end of line).
#'
#' @seealso \link[flextable]{body_add_flextable}
#'
#' @examples
#'
#' library(officer)
#' library(gt)
#' gt_tbl <- gt( head( exibble ) )
#'
#' doc <- read_docx()
#' doc <- body_add_gt(doc, value = gt_tbl)
#' fileout <- tempfile(fileext = ".docx")
#' print(doc, target = fileout)
#' @noRd
body_add_gt <- function(
    x,
    value,
    align = "center",
    pos = c("after","before","on"),
    caption_location = c("top","bottom","embed"),
    caption_align = "left",
    split = FALSE,
    keep_with_next = TRUE
) {

  ## check that officer is available
  if (!rlang::is_installed("officer")) {
    stop("{officer} package is necessary to add gt tables to word documents.")
  }

  ## check that inputs are an officer rdocx and gt tbl
  stopifnot(inherits(x, "rdocx"))
  stopifnot(inherits(value, "gt_tbl"))

  pos <- rlang::arg_match(pos)
  caption_location <- rlang::arg_match(caption_location)

  # Build all table data objects through a common pipeline
  value <- build_data(data = value, context = "word")

  ## Create and add table caption if it is to come before the table
  if (caption_location %in% c("top")) {
    header_xml <- as_word_tbl_header_caption(data = value, align = caption_align, split = split, keep_with_next = keep_with_next)
    if (!identical(header_xml,c(""))) {
      for (header_component in header_xml) {
        x <- officer::body_add_xml(x, str = header_component, pos) %>%
          suppressWarnings()
      }
    }
  }

  ## Create and add the table to the docxr. If the
  tbl_xml <- as_word_tbl_body(data = value, align = align, split = split, keep_with_next = keep_with_next, embedded_heading = identical(caption_location, "embed"))
  x <- officer::body_add_xml(x, str = tbl_xml, pos) %>%
    suppressWarnings()

  ## Create and add table caption if it is to come after the table
  if (caption_location %in% c("bottom")) {
    ## set keep_with_next to false here to prevent it trying to keep with non-table content
    header_xml <- as_word_tbl_header_caption(data = value, align = caption_align, split = split, keep_with_next = FALSE)
    if (!identical(header_xml,c(""))) {
      for (header_component in header_xml) {
        x <- officer::body_add_xml(x, str = header_component, pos)%>%
          suppressWarnings()
      }
    }
  }

  x
}

# Function to skip tests if Suggested packages not available on system
check_suggests_xml <- function() {
  skip_if_not_installed("officer")
  skip_if_not_installed("xml2")
}

test_that("word ooxml can be generated from gt object", {

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

  ## Table with cell styling
  exibble[1:4,] %>%
    gt(rowname_col = "char") %>%
    tab_row_group("My Row Group 1",c(1:2)) %>%
    tab_row_group("My Row Group 2",c(3:4)) %>%
    tab_style(
      style = cell_fill(color = "orange"),
      locations = cells_body(
        columns = c(num,fctr,time,currency, group)
      )
    ) %>%
    tab_style(
      style = cell_fill(color = "orange"),
      locations = cells_body(
        columns = c(num,fctr,time,currency, group)
      )
    ) %>%
    tab_style(
      style = cell_text(
        color = "green",
        font = "Biome",
        style = "italic",
        weight = "bold"
      ),
      locations = cells_stub()
    ) %>%
    tab_style(
      style = cell_text(
        color = "blue"
      ),
      locations = cells_row_groups()
    ) %>%
    as_word(
      keep_with_next = FALSE
    ) %>%
    expect_snapshot()

  ## table with column and span styling
  gt_exibble_min <-
    exibble[1:4,] %>%
    gt(rowname_col = "char") %>%
    tab_row_group("My Row Group 1",c(1:2)) %>%
    tab_row_group("My Row Group 2",c(3:4)) %>%
    tab_spanner("My Span Label", columns = 1:5) %>%
    tab_spanner("My Span Label top", columns = 2:4, level = 2) %>%
    tab_style(
      style = cell_text(color = "purple"),
      locations = cells_column_labels()
    ) %>%
    tab_style(
      style = cell_fill(color = "green"),
      locations = cells_column_labels()
    ) %>%
    tab_style(
      style = cell_fill(color = "orange"),
      locations = cells_column_spanners("My Span Label")
    ) %>%
    tab_style(
      style = cell_fill(color = "red"),
      locations = cells_column_spanners("My Span Label top")
    ) %>%
    tab_style(
      style = cell_fill(color = "pink"),
      locations = cells_stubhead()
    ) %>%
    as_word()

  gt_exibble_min_sha1 <- digest::sha1(gt_exibble_min)
  expect_equal(gt_exibble_min_sha1, "02a08c1cd57afd63d1e8a670579b59a3fffda177")

})

test_that("word ooxml escapes special characters in gt object", {

  # Create a one-row table for these tests
  exibble_min <- exibble[1, ] %>%
    dplyr::mutate(special_characters = "><&\n\r\"'")

  ## basic table
  exibble_min %>%
    gt() %>%
    as_word() %>%
    expect_snapshot()

})

test_that("word ooxml escapes special characters in gt object footer", {

  # Create a one-row table for these tests
  exibble_min <- exibble[1, ]

  ## basic table with invalid footnote
  exibble_min %>%
    gt() %>%
    tab_footnote(footnote = "p < .05, ><&\n\r\"'") %>%
    as_word() %>%
    expect_snapshot()

})

test_that("tables can be added to a word doc", {

  check_suggests_xml()

  ## simple table
  gt_exibble_min <-
    exibble[1:2,] %>%
    gt() %>%
    tab_header(
      title = "table title",
      subtitle = "table subtitle"
    )

  ## Add table to empty word document
  word_doc <-
    officer::read_docx() %>%
    body_add_gt(
      gt_exibble_min,
      align = "center"
    )

  ## save word doc to temporary file
  temp_word_file <- tempfile(fileext = ".docx")
  print(word_doc,target = temp_word_file)

  ## Manual Review
  if (!testthat::is_testing() & interactive()) {
    shell.exec(temp_word_file)
  }

  ## Programmatic Review
  docx <- officer::read_docx(temp_word_file)

  ## get docx table contents
  docx_contents <- xml2::xml_children(xml2::xml_children(docx$doc_obj$get()))

  ## extract table caption
  docx_table_caption_text <- xml2::xml_text(docx_contents[1:2])

  ## extract table contents
  docx_table_body_header <-
    docx_contents[3] %>%
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <-
    docx_contents[3] %>%
    xml2::xml_find_all(".//w:tr") %>%
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
  check_suggests_xml()

  ## simple table
  gt_exibble_min <-
    exibble[1,] %>%
    dplyr::mutate(special_characters = "><&\"'") %>%
    gt() %>%
    tab_header(
      title = "table title",
      subtitle = "table subtitle"
    )

  ## Add table to empty word document
  word_doc <-
    officer::read_docx() %>%
    body_add_gt(
      gt_exibble_min,
      align = "center"
    )

  ## save word doc to temporary file
  temp_word_file <- tempfile(fileext = ".docx")
  print(word_doc,target = temp_word_file)

  ## Manual Review
  if (!testthat::is_testing() & interactive()) {
    shell.exec(temp_word_file)
  }

  ## Programmatic Review
  docx <- officer::read_docx(temp_word_file)

  ## get docx table contents
  docx_contents <- xml2::xml_children(xml2::xml_children(docx$doc_obj$get()))

  ## extract table caption
  docx_table_caption_text <- xml2::xml_text(docx_contents[1:2])

  ## extract table contents
  docx_table_body_header <-
    docx_contents[3] %>%
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <-
    docx_contents[3] %>%
    xml2::xml_find_all(".//w:tr") %>%
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

  check_suggests_xml()

  ## simple table
  gt_exibble_min <-
    exibble[1:2,] %>%
    gt() %>%
    tab_header(
      title = "table title",
      subtitle = "table subtitle"
    )

  ## Add table to empty word document
  word_doc <-
    officer::read_docx() %>%
    body_add_gt(
      gt_exibble_min,
      caption_location = "embed",
      align = "center"
    )

  ## save word doc to temporary file
  temp_word_file <- tempfile(fileext = ".docx")
  print(word_doc,target = temp_word_file)

  ## Manual Review
  if (!testthat::is_testing() & interactive()) {
    shell.exec(temp_word_file)
  }

  ## Programmatic Review
  docx <- officer::read_docx(temp_word_file)

  ## get docx table contents
  docx_contents <- xml2::xml_children(xml2::xml_children(docx$doc_obj$get()))

  ## extract table contents
  docx_table_body_header <-
    docx_contents[1] %>%
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <-
    docx_contents[1] %>%
    xml2::xml_find_all(".//w:tr") %>%
    setdiff(docx_table_body_header)

  expect_equal(
    docx_table_body_header %>%
      xml2::xml_find_all(".//w:t") %>%
      xml2::xml_text(),
    c(
      "table title", "table subtitle", "num", "char", "fctr",
      "date", "time","datetime", "currency", "row", "group"
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
      )
    )
  )
})

test_that("tables with spans can be added to a word doc", {

  check_suggests_xml()

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
  if (!testthat::is_testing() & interactive()) {
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
  if (!testthat::is_testing() & interactive()) {
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

  ## simple table
  gt_exibble_min <- exibble %>%
    dplyr::select(-c(fctr, date, time, datetime)) %>%
    gt(rowname_col = "row", groupname_col = "group") %>%
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
      c("row_2", "2.222e+00", "banana", "17.950"),
      c("row_3", "3.333e+01", "coconut", "1.390"),
      c("row_4", "4.444e+02", "durian", "65100.000"),
      c("avg", "120.02", "—", "—"),
      c("total", "480.06", "—", "—"),
      c("s.d.", "216.79", "—", "—"),
      "grp_b",
      c("row_5", "5.550e+03", "NA", "1325.810"),
      c("row_6", "NA", "fig", "13.255"),
      c("row_7", "7.770e+05", "grapefruit", "NA"),
      c("row_8", "8.880e+06", "honeydew", "0.440"),
      c("avg", "3,220,850.00", "—", "—"),
      c("total", "9,662,550.00", "—", "—"),
      c("s.d.", "4,916,123.25", "—", "—")
    )
  )


  ## Now place the summary on the top

  ## simple table
  gt_exibble_min_top <- exibble %>%
    dplyr::select(-c(fctr, date, time, datetime)) %>%
    gt(rowname_col = "row", groupname_col = "group") %>%
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

  ## Add table to empty word document
  word_doc_top <- officer::read_docx() %>%
    body_add_gt(
      gt_exibble_min_top,
      align = "center"
    )

  ## save word doc to temporary file
  temp_word_file_top <- tempfile(fileext = ".docx")
  print(word_doc_top,target = temp_word_file_top)

  ## Manual Review
  if (!testthat::is_testing() & interactive()) {
    shell.exec(temp_word_file_top)
  }

  ## Programmatic Review
  docx_top <- officer::read_docx(temp_word_file_top)

  ## get docx table contents
  docx_contents_top <- docx_top$doc_obj$get() %>%
    xml2::xml_children() %>%
    xml2::xml_children()

  ## extract table contents
  docx_table_body_header_top <- docx_contents_top[1] %>%
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents_top <- docx_contents_top[1] %>%
    xml2::xml_find_all(".//w:tr") %>%
    setdiff(docx_table_body_header_top)

  ## "" at beginning for stubheader
  expect_equal(
    docx_table_body_header_top  %>%
      xml2::xml_find_all(".//w:p") %>%
      xml2::xml_text(),
    c( "", "num", "char", "currency")
  )

  expect_equal(
    lapply(docx_table_body_contents_top, function(x)
      x %>% xml2::xml_find_all(".//w:p") %>% xml2::xml_text()),
    list(
      "grp_a",
      c("avg", "120.02", "—", "—"),
      c("total", "480.06", "—", "—"),
      c("s.d.", "216.79", "—", "—"),
      c("row_1", "1.111e-01", "apricot", "49.950"),
      c("row_2", "2.222e+00", "banana", "17.950"),
      c("row_3", "3.333e+01", "coconut", "1.390"),
      c("row_4", "4.444e+02", "durian", "65100.000"),
      "grp_b",
      c("avg", "3,220,850.00", "—", "—"),
      c("total", "9,662,550.00", "—", "—"),
      c("s.d.", "4,916,123.25", "—", "—"),
      c("row_5", "5.550e+03", "NA", "1325.810"),
      c("row_6", "NA", "fig", "13.255"),
      c("row_7", "7.770e+05", "grapefruit", "NA"),
      c("row_8", "8.880e+06", "honeydew", "0.440")
    )
  )

})

test_that("tables with grand summaries but no rownames can be added to a word doc", {

  check_suggests_xml()

  ## simple table
  gt_exibble_min <- exibble %>%
    dplyr::select(-c(fctr, date, time, datetime, row, group)) %>%
    dplyr::slice(1:3) %>%
    gt() %>%
    grand_summary_rows(
      c(everything(), -char),
      fns = c("Total" = ~length(.))
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
      c("", "0.1111", "apricot", "49.95"),
      c("", "2.2220", "banana","17.95"),
      c("", "33.3300", "coconut", "1.39"),
      c("Total", "3","—", "3")
    )
  )

  ## simple table
  gt_exibble_min_top <- exibble %>%
    dplyr::select(-c(fctr, date, time, datetime, row, group)) %>%
    dplyr::slice(1:3) %>%
    gt() %>%
    grand_summary_rows(
      c(everything(), -char),
      fns = c("Total" = ~length(.)),
      side = "top"
    )

  ## Add table to empty word document
  word_doc_top <- officer::read_docx() %>%
    body_add_gt(
      gt_exibble_min_top,
      align = "center"
    )

  ## save word doc to temporary file
  temp_word_file_top <- tempfile(fileext = ".docx")
  print(word_doc_top,target = temp_word_file_top)

  ## Manual Review
  if (!testthat::is_testing() & interactive()) {
    shell.exec(temp_word_file_top)
  }

  ## Programmatic Review
  docx_top <- officer::read_docx(temp_word_file_top)

  ## get docx table contents
  docx_contents_top <- docx_top$doc_obj$get() %>%
    xml2::xml_children() %>%
    xml2::xml_children()

  ## extract table contents
  docx_table_body_header_top <- docx_contents_top[1] %>%
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents_top <- docx_contents_top[1] %>%
    xml2::xml_find_all(".//w:tr") %>%
    setdiff(docx_table_body_header_top)

  ## "" at beginning for stubheader
  expect_equal(
    docx_table_body_header_top %>%
      xml2::xml_find_all(".//w:p") %>%
      xml2::xml_text(),
    c( "", "num", "char", "currency")
  )

  expect_equal(
    lapply(docx_table_body_contents_top, function(x)
      x %>% xml2::xml_find_all(".//w:p") %>% xml2::xml_text()),
    list(
      c("Total", "3","—", "3"),
      c("", "0.1111", "apricot", "49.95"),
      c("", "2.2220", "banana","17.95"),
      c("", "33.3300", "coconut", "1.39")
    )
  )


})



test_that("tables with footnotes can be added to a word doc", {

  check_suggests_xml()

  ## simple table
  gt_exibble_min <-
    exibble[1:2,] %>%
    gt() %>%
    tab_footnote(
      footnote = md("this is a footer example"),
      locations = cells_column_labels(columns = num )
    ) %>%
    tab_footnote(
      footnote = md("this is a second footer example"),
      locations = cells_column_labels(columns = char )
    )

  ## Add table to empty word document
  word_doc <-
    officer::read_docx() %>%
    body_add_gt(
      gt_exibble_min,
      align = "center"
    )

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
  docx_contents <-
    docx$doc_obj$get() %>%
    xml2::xml_children() %>%
    xml2::xml_children()

  ## extract table contents
  docx_table_body_header <-
    docx_contents[1] %>%
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <-
    docx_contents[1] %>%
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
      c("1this is a footer example"),
      c("2this is a second footer example")
    )
  )
})

test_that("tables with source notes can be added to a word doc", {

  check_suggests_xml()

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

  ## simple table
  gt_letters <- tibble::tibble(
    upper_case = c(LETTERS,LETTERS),
    lower_case = c(letters,letters)
    ) %>%
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
  if (!testthat::is_testing() & interactive()) {
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

  ## simple table
  gt_letters <- tibble::tibble(
    upper_case = c(LETTERS,LETTERS),
    lower_case = c(letters,letters)
    ) %>%
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
  if (!testthat::is_testing() & interactive()) {
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

test_that("tables with cell & text coloring can be added to a word doc - no spanner", {

  check_suggests_xml()

  ## simple table
  gt_exibble_min <- exibble[1:4,] %>%
    gt(rowname_col = "char") %>%
    tab_row_group("My Row Group 1",c(1:2)) %>%
    tab_row_group("My Row Group 2",c(3:4)) %>%
    tab_style(
      style = cell_fill(color = "orange"),
      locations = cells_body(
        columns = c(num,fctr,time,currency, group)
      )
    ) %>%
    tab_style(
      style = cell_text(
        color = "green",
        font = "Biome"
      ),
      locations = cells_stub()
    ) %>%
    tab_style(
      style = cell_text(size = 25, v_align = "middle"),
      locations = cells_body(
        columns = c(num,fctr,time,currency, group)
      )
    ) %>%
    tab_style(
      style = cell_text(
        color = "blue",
        stretch = "extra-expanded"
      ),
      locations = cells_row_groups()
    ) %>%
    tab_style(
      style = cell_text(color = "teal"),
      locations = cells_column_labels()
    ) %>%
    tab_style(
      style = cell_fill(color = "green"),
      locations = cells_column_labels()
    ) %>%
    tab_style(
      style = cell_fill(color = "pink"),
      locations = cells_stubhead()
    )

  if (!testthat::is_testing() & interactive()) {
    print(gt_exibble_min)
  }

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

  ## header
  expect_equal(
    docx_table_body_header %>% xml2::xml_find_all(".//w:p") %>% xml2::xml_text(),
    c("","num", "fctr","date", "time","datetime","currency",  "row", "group")
  )
  expect_equal(
    lapply(docx_table_body_header, function(x) x %>% xml2::xml_find_all(".//w:shd") %>% xml2::xml_attr(attr = "fill")),
    list(c("FFC0CB","00FF00","00FF00","00FF00","00FF00","00FF00","00FF00","00FF00","00FF00"))
  )
  expect_equal(
    lapply(docx_table_body_header, function(x) x %>% xml2::xml_find_all(".//w:color") %>% xml2::xml_attr(attr = "val")),
    list(c("008080","008080","008080","008080","008080","008080","008080","008080"))
  )

  ## cell background styling
  expect_equal(
    lapply(docx_table_body_contents, function(x) {
      x %>% xml2::xml_find_all(".//w:tc") %>% lapply(function(y) {
        y %>% xml2::xml_find_all(".//w:shd") %>% xml2::xml_attr(attr = "fill")
    })}),
    list(
      list(character()),
      list(character(),"FFA500","FFA500",character(),"FFA500",character(),"FFA500",character(),"FFA500"),
      list(character(),"FFA500","FFA500",character(),"FFA500",character(),"FFA500",character(),"FFA500"),
      list(character()),
      list(character(),"FFA500","FFA500",character(),"FFA500",character(),"FFA500",character(),"FFA500"),
      list(character(),"FFA500","FFA500",character(),"FFA500",character(),"FFA500",character(),"FFA500")
    )
  )

  ## cell text styling
  expect_equal(
    lapply(docx_table_body_contents, function(x) {
      x %>% xml2::xml_find_all(".//w:tc") %>% lapply(function(y) {
        y %>% xml2::xml_find_all(".//w:color") %>% xml2::xml_attr(attr = "val")
      })}),
    list(
      list("0000FF"),
      list("00FF00",character(),character(),character(),character(),character(),character(),character(),character()),
      list("00FF00",character(),character(),character(),character(),character(),character(),character(),character()),
      list("0000FF"),
      list("00FF00",character(),character(),character(),character(),character(),character(),character(),character()),
      list("00FF00",character(),character(),character(),character(),character(),character(),character(),character())
    )
  )

  expect_equal(
    lapply(docx_table_body_contents, function(x)
      x %>% xml2::xml_find_all(".//w:p") %>% xml2::xml_text()),
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

  check_suggests_xml()

  ## simple table
  gt_exibble_min <- exibble[1:4,] %>%
    gt(rowname_col = "char") %>%
    tab_row_group("My Row Group 1",c(1:2)) %>%
    tab_row_group("My Row Group 2",c(3:4)) %>%
    tab_spanner("My Span Label", columns = 1:5) %>%
    tab_spanner("My Span Label top", columns = 2:4, level = 2) %>%
    tab_style(
      style = cell_text(color = "purple"),
      locations = cells_column_labels()
    ) %>%
    tab_style(
      style = cell_fill(color = "green"),
      locations = cells_column_labels()
    ) %>%
    tab_style(
      style = cell_fill(color = "orange"),
      locations = cells_column_spanners("My Span Label")
    ) %>%
    tab_style(
      style = cell_fill(color = "red"),
      locations = cells_column_spanners("My Span Label top")
    ) %>%
    tab_style(
      style = cell_fill(color = "pink"),
      locations = cells_stubhead()
    )

  if (!testthat::is_testing() & interactive()) {
    print(gt_exibble_min)
  }

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

  ## header
  expect_equal(
    docx_table_body_header %>% xml2::xml_find_all(".//w:p") %>% xml2::xml_text(),
    c("", "", "My Span Label top", "", "", "", "", "",
      "", "My Span Label", "", "", "", "",
      "", "num", "fctr", "date", "time", "datetime", "currency", "row", "group")
  )
  expect_equal(
    lapply(docx_table_body_header, function(x) {
      x %>% xml2::xml_find_all(".//w:tc") %>% lapply(function(y) {
        y %>% xml2::xml_find_all(".//w:shd") %>% xml2::xml_attr(attr = "fill")
      })}),
    list(
      list("FFC0CB", character(0), "FF0000", character(0), character(0), character(0), character(0), character(0)),
      list(character(0), "FFA500", character(0), character(0), character(0), character(0)),
      list(character(0), "00FF00", "00FF00", "00FF00", "00FF00", "00FF00", "00FF00", "00FF00", "00FF00")
      )
  )
  expect_equal(
    lapply(docx_table_body_header, function(x) {
      x %>% xml2::xml_find_all(".//w:tc") %>% lapply(function(y) {
        y %>% xml2::xml_find_all(".//w:color") %>% xml2::xml_attr(attr = "val")
      })}),
    list(
      list(character(0), character(0), character(0), character(0),character(0), character(0), character(0), character(0)),
      list(character(0), character(0), character(0), character(0),character(0), character(0)),
      list(character(0), "A020F0","A020F0", "A020F0", "A020F0", "A020F0", "A020F0", "A020F0","A020F0")
      )
  )
})

test_that("tables with cell & text coloring can be added to a word doc - with source_notes and footnotes", {

  check_suggests_xml()

  ## simple table
  gt_exibble_min <- exibble[1:2,] %>%
    gt() %>%
    tab_source_note("My Source Note") %>%
    tab_footnote("My Footnote") %>%
    tab_footnote("My Footnote 2", locations = cells_column_labels(1)) %>%
    tab_style(
      style = cell_text(color = "orange"),
      locations = cells_source_notes()
    ) %>%
    tab_style(
      style = cell_text(color = "purple"),
      locations = cells_footnotes()
    )

  if (!testthat::is_testing() & interactive()) {
    print(gt_exibble_min)
  }

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
  if (!testthat::is_testing() & interactive()) {
    shell.exec(temp_word_file)
  }

  ## Programmatic Review
  docx <- officer::read_docx(temp_word_file)

  ## get docx table contents
  docx_contents <- docx$doc_obj$get() %>%
    xml2::xml_children() %>%
    xml2::xml_children()

  docx_table_body_header <- docx_contents[1] %>%
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_meta_info <- docx_contents[1] %>%
    xml2::xml_find_all(".//w:tr") %>%
    setdiff(docx_table_body_header) %>%
    tail(3)

  ## header
  expect_equal(
    docx_table_meta_info %>% lapply(function(x) x %>% xml2::xml_find_all(".//w:t") %>% xml2::xml_text()),
    list(
      c("My Footnote"),
      c("1", "My Footnote 2"),
      c("My Source Note")
    )
  )

  # TODO: fails due to PR#1268
  expect_equal(
    lapply(docx_table_meta_info, function(x) {
      x %>% xml2::xml_find_all(".//w:tc") %>% lapply(function(y) {
        y %>% xml2::xml_find_all(".//w:color") %>% xml2::xml_attr(attr = "val")
      })}),
    list(
      list("A020F0"),
      list(c("A020F0", "A020F0")),
      list("FFA500")
      )
  )

})

test_that("footnotes styling gets applied to footer marks", {

  check_suggests_xml()

  ## simple table
  gt_exibble_min <- exibble[1:2,] %>%
    gt() %>%
    tab_footnote("My Footnote") %>%
    tab_footnote("My Footnote 2", locations = cells_column_labels(1)) %>%
    opt_footnote_spec(spec_ftr = "(b)")

  if (!testthat::is_testing() & interactive()) {
    print(gt_exibble_min)
  }

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
  if (!testthat::is_testing() & interactive()) {
    shell.exec(temp_word_file)
  }

  ## Programmatic Review
  docx <- officer::read_docx(temp_word_file)

  ## get docx table contents
  docx_contents <- docx$doc_obj$get() %>%
    xml2::xml_children() %>%
    xml2::xml_children()

  docx_table_body_header <- docx_contents[1] %>%
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_meta_info <- docx_contents[1] %>%
    xml2::xml_find_all(".//w:tr") %>%
    setdiff(docx_table_body_header) %>%
    tail(2)

  ## footer
  expect_equal(
    docx_table_meta_info %>% lapply(function(x) x %>% xml2::xml_find_all(".//w:t") %>% xml2::xml_text()),
    list(
      c("My Footnote"),
      c("(1)", "My Footnote 2")
    )
  )

  # Styling applied to bold text of footnote mark
  expect_equal(
    docx_table_meta_info[[2]] %>%
      xml2::xml_find_all(".//w:tc") %>%
      .[[1]] %>%
      xml2::xml_find_all(".//w:rPr") %>%
      .[[1]] %>%
      as.character()
    ,
    "<w:rPr>\n  <w:vertAlign w:val=\"baseline\"/>\n  <w:b w:val=\"true\"/>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>"
  )

})


test_that("tables with cell & text coloring can be added to a word doc - with summaries (grand/group)", {

  check_suggests_xml()

  ## simple table
  gt_exibble_min <- exibble %>%
    dplyr::select(-c(fctr, date, time, datetime)) %>%
    gt(rowname_col = "row", groupname_col = "group") %>%
    summary_rows(
      groups = everything(),
      columns = num,
      fns = list(
        avg = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        s.d. = ~sd(., na.rm = TRUE)
      ),
      fmt = list(~ fmt_number(.))
    ) %>%
    grand_summary_rows(
      columns = num,
      fns = list(
        avg = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        s.d. = ~sd(., na.rm = TRUE)
      ),
      fmt = list(~ fmt_number(.))
    ) %>%
    tab_style(
      style = cell_text(color = "orange"),
      locations = cells_summary(groups = "grp_a", columns = char)
    ) %>%
    tab_style(
      style = cell_text(color = "green"),
      locations = cells_stub_summary()
    ) %>%
    tab_style(
      style = cell_text(color = "purple"),
      locations = cells_grand_summary(columns = num, rows = 3)
    ) %>%
    tab_style(
      style = cell_fill(color = "yellow"),
      locations = cells_stub_grand_summary()
    )

  if (!testthat::is_testing() & interactive()) {
    print(gt_exibble_min)
  }

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
  if (!testthat::is_testing() & interactive()) {
    shell.exec(temp_word_file)
  }

  ## Programmatic Review
  docx <- officer::read_docx(temp_word_file)

  ## get docx table contents
  docx_contents <- docx$doc_obj$get() %>%
    xml2::xml_children() %>%
    xml2::xml_children()

  docx_table_body_header <- docx_contents[1] %>%
    xml2::xml_find_all(".//w:tblHeader/ancestor::w:tr")

  docx_table_body_contents <- docx_contents[1] %>%
    xml2::xml_find_all(".//w:tr") %>%
    setdiff(docx_table_body_header)

  ## body text
  expect_equal(
    docx_table_body_contents %>% lapply(function(x) x %>% xml2::xml_find_all(".//w:t") %>% xml2::xml_text()),
    list(
      "grp_a",
      c("row_1", "1.111e-01", "apricot", "49.950"),
      c("row_2","2.222e+00", "banana", "17.950"),
      c("row_3", "3.333e+01", "coconut","1.390"),
      c("row_4", "4.444e+02", "durian", "65100.000"),
      c("avg","120.02", "—", "—"),
      c("total", "480.06", "—", "—"),
      c("s.d.","216.79", "—", "—"),
      "grp_b",
      c("row_5", "5.550e+03", "NA", "1325.810"),
      c("row_6", "NA", "fig", "13.255"),
      c("row_7", "7.770e+05","grapefruit", "NA"),
      c("row_8", "8.880e+06", "honeydew", "0.440"),
      c("avg", "3,220,850.00", "—", "—"),
      c("total", "9,662,550.00","—", "—"),
      c("s.d.", "4,916,123.25", "—", "—"),
      c("avg", "1,380,432.87","—", "—"),
      c("total", "9,663,030.06", "—", "—"),
      c("s.d.", "3,319,613.32","—", "—")
    )
  )

  ## the summaries for group a and b are green,
  ## the 2nd column of the group a summary is orange,
  ## the 1st col, 3rd value in the grand total is purple
  expect_equal(
    lapply(docx_table_body_contents, function(x) {
      x %>% xml2::xml_find_all(".//w:tc") %>% sapply(function(y) {
        val <- y %>% xml2::xml_find_all(".//w:color") %>% xml2::xml_attr(attr = "val")
        if (identical(val, character())) {
          ""
        }else{
          val
        }
      })}),
    list("",
         c("", "", "", ""),
         c("", "", "", ""),
         c("", "", "",""),
         c("", "", "", ""),
         c("00FF00", "", "FFA500", ""),
         c("00FF00", "", "FFA500", ""),
         c("00FF00", "", "FFA500", ""),
         "",
         c("", "", "", ""),
         c("", "", "", ""),
         c("", "", "", ""),
         c("", "", "", ""),
         c("00FF00", "", "", ""),
         c("00FF00", "", "", ""),
         c("00FF00", "", "", ""),
         c("", "", "", ""),
         c("", "", "", ""),
         c("", "A020F0", "", "")
         )
  )

  ## the grand total row names fill is is yellow
  expect_equal(
    lapply(docx_table_body_contents, function(x) {
      x %>% xml2::xml_find_all(".//w:tc") %>% sapply(function(y) {
        val <- y %>% xml2::xml_find_all(".//w:shd") %>% xml2::xml_attr(attr = "fill")
        if (identical(val, character())) {
          ""
        }else{
          val
        }
      })}),
    list("",
         c("", "", "", ""),
         c("", "", "", ""),
         c("", "", "", ""),
         c("", "", "", ""),
         c("", "", "", ""),
         c("", "", "", ""),
         c("", "", "", ""),
         "",
         c("", "", "", ""),
         c("", "", "", ""),
         c("", "", "", ""),
         c("", "", "", ""),
         c("", "", "", ""),
         c("", "", "", ""),
         c("", "", "", ""),
         c("FFFF00", "", "", ""),
         c("FFFF00", "", "", ""),
         c("FFFF00", "", "", "")
         )
  )
})

test_that("tables preserves spaces in text & can be added to a word doc", {

  skip_on_ci()
  check_suggests_xml()

  ## simple table
  gt_exibble <-
    exibble[1,1] %>%
    dplyr::mutate(
      `5 Spaces Before` = "     Preserve",
      `5 Spaces After` = "Preserve     ",
      `5 Spaces Before - preserve` = "     Preserve",
      `5 Spaces After - preserve` = "Preserve     ") %>%
    gt() %>%
    tab_style(
      style = cell_text(whitespace = "pre"),
      location = cells_body(columns = contains("preserve"))
    )

  ## Add table to empty word document
  word_doc_normal <-
    officer::read_docx() %>%
    body_add_gt(
      gt_exibble,
      align = "center"
    )

  ## save word doc to temporary file
  temp_word_file <- tempfile(fileext = ".docx")
  print(word_doc_normal,target = temp_word_file)

  ## Manual Review
  if (!testthat::is_testing() & interactive()) {
    shell.exec(temp_word_file)
  }

  ## Programmatic Review
  docx <- officer::read_docx(temp_word_file)

  ## get docx table contents
  docx_contents <- xml2::xml_children(xml2::xml_children(docx$doc_obj$get()))

  ## extract table contents
  docx_table_body_contents <-
    docx_contents[1] %>%
    xml2::xml_find_all(".//w:tr")

  ## text is preserved
  expect_equal(
    lapply(
      docx_table_body_contents,
      FUN = function(x) xml2::xml_text(xml2::xml_find_all(x, ".//w:p"))
    ),
    list(
      c("num","5 Spaces Before","5 Spaces After","5 Spaces Before - preserve","5 Spaces After - preserve"),
      c("0.1111"," Preserve","Preserve ","     Preserve","Preserve     ")
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
  check_suggests_xml()

  ## simple table
  gt_exibble <-
    exibble[1:2,1:4] %>%
    `colnames<-`(c(
      "wide column number 1",
      "wide column number 2",
      "wide column number 3",
      "tcn4" #thin column number 4
    )) %>%
    gt() %>%
    cols_align(
      "right", columns = `wide column number 1`
    ) %>%
    cols_align(
      "left", columns = c(`wide column number 2`, `wide column number 3`)
    ) %>%
    tab_style(
      style = cell_text(align = "right"),
      location = cells_body(columns = c(`wide column number 2`, `wide column number 3`), rows = 2)
    ) %>%
    tab_style(
      style = cell_text(align = "left"),
      location = cells_body(columns = c(`wide column number 1`), rows = 2)
    ) %>%
    tab_style(
      cell_text(align = "right"),
      location = cells_column_labels(columns = c(tcn4))
    )

  ## Add table to empty word document
  word_doc <-
    officer::read_docx() %>%
    body_add_gt(
      gt_exibble,
      align = "center"
    )

  ## save word doc to temporary file
  temp_word_file <- tempfile(fileext = ".docx")
  print(word_doc,target = temp_word_file)

  ## Manual Review
  if (!testthat::is_testing() & interactive()) {
    shell.exec(temp_word_file)
  }

  ## Programmatic Review
  docx <- officer::read_docx(temp_word_file)

  ## get docx table contents
  docx_contents <- xml2::xml_children(xml2::xml_children(docx$doc_obj$get()))

  ## extract table contents
  docx_table_body_contents <-
    docx_contents[1] %>%
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
        x %>%
        xml2::xml_find_all(".//w:pPr") %>%
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

test_that("markdown in the tables works out",{

  skip_on_ci()
  check_suggests_xml()

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
  ) %>%
    gt() %>%
    fmt_markdown(columns = everything()) %>%
    tab_footnote(
      "This is text",
      locations = cells_column_labels(columns = md)
    )

  temp_docx <- tempfile(fileext = ".docx")

  gtsave(markdown_gt, filename = temp_docx)

  ## Programmatic Review
  docx <- officer::read_docx(temp_docx)

  ## get docx table contents
  docx_contents <- xml2::xml_children(xml2::xml_children(docx$doc_obj$get()))

  ## extract table contents
  docx_table_body_contents <-
    docx_contents[1] %>%
    xml2::xml_find_all(".//w:tr")

  ## text is preserved
  expect_equal(
    lapply(
      docx_table_body_contents,
      FUN = function(x) {xml2::xml_find_all(x, ".//w:tc") %>%
        lapply(function(x){ xml2::xml_text(xml2::xml_find_all(x,".//w:p"))})
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
  styling_cell_text <- docx_table_body_contents[[2]] %>%
    xml2::xml_find_all(".//w:tc") %>%
    .[[1]] %>%
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
  styling_cell_text <- docx_table_body_contents[[3]] %>%
    xml2::xml_find_all(".//w:tc") %>%
    .[[1]] %>%
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
      "<w:rPr>\n  <w:rStyle w:val=\"Hyperlink\"/>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>",
      "<w:rPr>\n  <w:rFonts w:ascii=\"Calibri\" w:hAnsi=\"Calibri\"/>\n  <w:sz w:val=\"20\"/>\n</w:rPr>"
    )
  )




})


test_that("markdown with urls work",{

  skip_on_ci()
  check_suggests_xml()

  text_sample <- "
  Hyperlink [here](https://commonmark.org/help/) and to [google](https://www.google.com)
  "

  markdown_gt <- dplyr::tribble(
     ~url,
     text_sample
    ) %>%
    gt() %>%
    fmt_markdown(columns = everything())

  temp_docx <- tempfile(fileext = ".docx")

  gtsave(markdown_gt, filename = temp_docx)

  ## Programmatic Review
  docx <- officer::read_docx(temp_docx)

  ## get docx table contents
  docx_contents <- xml2::xml_children(xml2::xml_children(docx$doc_obj$get()))

  ## extract table hyperlinks
  docx_table_hyperlinks <-
    docx_contents[1] %>%
    xml2::xml_find_all(".//w:hyperlink")

  ## hyperlinks are preserved and updated to be rId
  expect_equal(length(docx_table_hyperlinks), 2)
  expect_true(all(grepl("^rId\\d+$",xml_attr(docx_table_hyperlinks, "id"))))

  # first should be commonmark URL
  expect_equal(
    docx$doc_obj$rel_df()$target[ docx$doc_obj$rel_df()$id == xml_attr(docx_table_hyperlinks[1], "id")],
    "https://commonmark.org/help/"
  )

  # second should be google URL
  expect_equal(
    docx$doc_obj$rel_df()$target[ docx$doc_obj$rel_df()$id == xml_attr(docx_table_hyperlinks[2], "id")],
    "https://www.google.com"
  )


})

