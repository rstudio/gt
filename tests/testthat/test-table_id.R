test_that("Table ID is used as prefix for element IDs", {
  # Create a table with a specified ID
  tbl <- exibble %>%
    gt(rowname_col = "row", id = "test-table") %>%
    tab_spanner(label = "Spanner", columns = c(datetime, date, time)) %>%
    tab_footnote(footnote = "A footnote", locations = cells_body(columns = num, rows = 1))
  
  # Generate HTML
  html_str <- as.character(as.tags(tbl))
  
  # Test that the table's div has the correct ID
  expect_true(grepl('id="test-table"', html_str, fixed = TRUE))
  
  # Test that element IDs use the table ID as prefix
  expect_true(grepl('id="test-table-', html_str, fixed = TRUE))
  
  # Test that column headers have the prefixed IDs
  expect_true(grepl('id="test-table-num"', html_str, fixed = TRUE))
  
  # Test that spanner has the prefixed ID
  expect_true(grepl('id="test-table-Spanner"', html_str, fixed = TRUE))
})

test_that("All IDs in headers exist", {
  tbl <- exibble %>%
    gt(id = "test-table") 

  html_str <- as.character(render_as_html(tbl))

  .nodes <- xml2::read_html(html_str)

  ids <- .nodes %>%
    xml_find_all(".//*[@id]") %>%
    xml_attr("id")

  all_headers_attrs <- .nodes %>%
    xml_find_all("//*[@headers]") %>%
    xml_attr("headers") %>%
    strsplit(" +") %>%
    unlist() %>%
    unique()

  expect_true(all(all_headers_attrs %in% ids))
})

test_that("Random IDs are consistently applied within a table", {
  # Create a table without specifying an ID
  tbl <- exibble %>%
    gt(rowname_col = "row") %>%
    tab_spanner(label = "Group", columns = c(datetime, date, time))
  
  # Render table to HTML
  html_str <- as.character(as.tags(tbl))
  
  # Extract the auto-generated ID from the outer div
  auto_id <- regmatches(html_str, regexpr('id="[^"]*"', html_str))
  auto_id <- sub('id="', '', sub('"$', '', auto_id))
  
  # Test that the auto_id is not empty
  expect_false(auto_id == "")
  
  # Test that element IDs within the table use the auto-generated ID as prefix
  expect_true(grepl(paste0('id="', auto_id, '-'), html_str, fixed = TRUE))
  
  # Test that the auto-generated ID is used for the spanner
  expect_true(grepl(paste0('id="', auto_id, '-Group"'), html_str, fixed = TRUE))
  
  # Test that one of the column IDs uses the auto-generated ID prefix
  expect_true(grepl(paste0('id="', auto_id, '-num"'), html_str, fixed = TRUE))
  
  # Ensure that multiple renderings of the same table produce the same prefix for stability
  html_str2 <- as.character(as.tags(tbl))
  auto_id2 <- regmatches(html_str2, regexpr('id="[^"]*"', html_str2))
  auto_id2 <- sub('id="', '', sub('"$', '', auto_id2))
  
  # The IDs should be different between renderings since they're randomly generated each time
  expect_false(auto_id == auto_id2)
  
  # But both renderings should have consistent internal prefixing
  expect_true(grepl(paste0('id="', auto_id2, '-Group"'), html_str2, fixed = TRUE))
})

test_that("Multiple tables have unique element IDs", {
  # Create two tables with the same structure but different IDs
  tbl1 <- exibble %>%
    gt(rowname_col = "row", id = "table1") %>%
    tab_spanner(label = "Group", columns = c(datetime, date, time))
  
  tbl2 <- exibble %>%
    gt(rowname_col = "row", id = "table2") %>%
    tab_spanner(label = "Group", columns = c(datetime, date, time))
  
  # Generate HTML for both tables
  html_str1 <- as.character(as.tags(tbl1))
  html_str2 <- as.character(as.tags(tbl2))
  
  # Test that each table uses its own ID as a prefix
  expect_true(grepl('id="table1-Group"', html_str1, fixed = TRUE))
  expect_true(grepl('id="table2-Group"', html_str2, fixed = TRUE))
  
  # This ensures that if multiple tables are on the same page, they won't have ID conflicts
  expect_false(grepl('id="table1-Group"', html_str2, fixed = TRUE))
  expect_false(grepl('id="table2-Group"', html_str1, fixed = TRUE))

  # Ensure no duplicate IDs
  ids1 <- regmatches(html_str1, regexpr('id="[^"]*"', html_str1))
  ids2 <- regmatches(html_str2, regexpr('id="[^"]*"', html_str2))
  expect_false(any(duplicated(c(ids1, ids2))))
})
