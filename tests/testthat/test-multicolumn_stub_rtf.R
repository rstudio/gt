test_data <-
  dplyr::tibble(
    mfr = c("Ford", "Ford", "BMW", "BMW", "Audi"),
    model = c("GT", "F-150", "X5", "X3", "A4"),
    trim = c("Base", "XLT", "xDrive35i", "sDrive28i", "Premium"),
    year = c(2017, 2018, 2019, 2020, 2021),
    hp = c(647, 450, 300, 228, 261),
    msrp = c(447000, 28000, 57000, 34000, 37000)
  )

test_that("Basic multicolumn stub renders in RTF", {

  # Create table with multicolumn stub
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_header(title = "Three-Column Stub RTF")

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain all stub column data
  expect_true(grepl("Ford", rtf_output))
  expect_true(grepl("GT", rtf_output))
  expect_true(grepl("Base", rtf_output))
})

test_that("Two-column stub renders in RTF", {

  # Create table with two stub columns
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model")) |>
    tab_stubhead(label = c("Manufacturer", "Model")) |>
    tab_header(title = "Two-Column Stub RTF")

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain stub column data
  expect_true(grepl("Ford", rtf_output))
  expect_true(grepl("GT", rtf_output))
})

test_that("Single stub column renders in RTF (regression test)", {

  # Create table with single stub column
  gt_tbl <-
    test_data |>
    gt(rowname_col = "mfr") |>
    tab_stubhead(label = "Manufacturer") |>
    tab_header(title = "Single Stub Column RTF")

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain stub data
  expect_true(grepl("Ford", rtf_output))
})

test_that("Multicolumn stub with footnotes renders in RTF", {

  # Create table with multicolumn stub and footnotes
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_header(title = "Three-Column Stub with Footnotes") |>
    tab_footnote(
      footnote = "Target: GT",
      locations = cells_stub(rows = 1, columns = "model")
    ) |>
    tab_footnote(
      footnote = "Target: Ford",
      locations = cells_stub(rows = 1, columns = "mfr")
    )

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain footnote text
  expect_true(grepl("Target: Ford", rtf_output))
  expect_true(grepl("Target: GT", rtf_output))
})

test_that("Multiple rows with multicolumn stub footnotes in RTF", {

  # Create table with footnotes on multiple rows
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_header(title = "Multiple Rows with Footnotes") |>
    tab_footnote(
      footnote = "Ford manufacturer",
      locations = cells_stub(rows = 1, columns = "mfr")
    ) |>
    tab_footnote(
      footnote = "GT model",
      locations = cells_stub(rows = 1, columns = "model")
    ) |>
    tab_footnote(
      footnote = "BMW manufacturer",
      locations = cells_stub(rows = 3, columns = "mfr")
    ) |>
    tab_footnote(
      footnote = "X5 model",
      locations = cells_stub(rows = 3, columns = "model")
    )

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain all footnote text
  expect_true(grepl("Ford manufacturer", rtf_output))
  expect_true(grepl("GT model", rtf_output))
  expect_true(grepl("BMW manufacturer", rtf_output))
  expect_true(grepl("X5 model", rtf_output))
})

test_that("Multicolumn stub footnotes with row groups as conventional rows in RTF", {

  # Create grouped data
  grouped_data <-
    dplyr::mutate(
      test_data,
      group = ifelse(mfr %in% c("Ford", "BMW"), "American & German", "German Premium")
    )

  # Create table with row groups and footnotes
  gt_tbl <-
    grouped_data |>
    gt(
      rowname_col = c("mfr", "model", "trim"),
      groupname_col = "group"
    ) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_header(title = "Multicolumn Stub with Row Groups") |>
    tab_footnote(
      footnote = "Ford note",
      locations = cells_stub(rows = 1, columns = "mfr")
    ) |>
    tab_footnote(
      footnote = "GT note",
      locations = cells_stub(rows = 1, columns = "model")
    ) |>
    tab_footnote(
      footnote = "BMW note",
      locations = cells_stub(rows = 3, columns = "mfr")
    )

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain group names
  expect_true(
    grepl("American & German", rtf_output) ||
      grepl("American \\\\& German", rtf_output)
  )
})

test_that("All stub columns with footnotes in RTF", {

  # Create table with footnotes on all three stub columns
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_header(title = "All Stub Columns with Footnotes") |>
    tab_footnote(
      footnote = "Ford manufacturer",
      locations = cells_stub(rows = 1, columns = "mfr")
    ) |>
    tab_footnote(
      footnote = "GT model",
      locations = cells_stub(rows = 1, columns = "model")
    ) |>
    tab_footnote(
      footnote = "Base trim",
      locations = cells_stub(rows = 1, columns = "trim")
    )

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain all footnotes
  expect_true(grepl("Ford manufacturer", rtf_output))
  expect_true(grepl("GT model", rtf_output))
  expect_true(grepl("Base trim", rtf_output))
})

test_that("Footnotes on non-first row with multicolumn stub in RTF", {

  # Create table with footnotes on second row
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_header(title = "Footnotes on Second Row") |>
    tab_footnote(
      footnote = "Ford manufacturer",
      locations = cells_stub(rows = 2, columns = "mfr")
    ) |>
    tab_footnote(
      footnote = "F-150 model",
      locations = cells_stub(rows = 2, columns = "model")
    )

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain footnotes
  expect_true(grepl("Ford manufacturer", rtf_output))
  expect_true(grepl("F-150 model", rtf_output))
})

test_that("Mixed stub and data column footnotes in RTF", {

  # Create table with both stub and data column footnotes
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_header(title = "Mixed Stub and Data Footnotes") |>
    tab_footnote(
      footnote = "Ford manufacturer",
      locations = cells_stub(rows = 1, columns = "mfr")
    ) |>
    tab_footnote(
      footnote = "High HP",
      locations = cells_body(columns = "hp", rows = 1)
    )

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain all footnotes
  expect_true(grepl("Ford manufacturer", rtf_output))
  expect_true(grepl("High HP", rtf_output))
})

test_that("Hierarchical stub display in RTF", {

  # Create test data with repeated manufacturer values
  hierarchical_data <-
    dplyr::tibble(
      mfr = c("Ford", "Ford", "Ford", "BMW", "BMW"),
      model = c("GT", "F-150", "Mustang", "X5", "X3"),
      trim = c("Base", "XLT", "GT", "xDrive35i", "sDrive28i"),
      year = c(2017, 2018, 2019, 2020, 2021),
      hp = c(647, 450, 460, 300, 228)
    )

  gt_tbl <-
    hierarchical_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_header(title = "Hierarchical Stub Display")

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain the data
  expect_true(grepl("Ford", rtf_output))
  expect_true(grepl("BMW", rtf_output))
})


test_that("Multicolumn stub RTF with single stubhead label",{
  
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer/Model/Trim"))

  expect_no_error(rtf_output <- as_rtf(gt_tbl))

  rtfs <- as.character(rtf_output)

  ## extract table rows
  tbl_rows <- regmatches(rtfs, gregexpr("\\\\trowd.+?\\\\row", rtfs))[[1]]
  ## break row
  header_cells <- regmatches(tbl_rows[[1]], gregexpr("\\\\pard.+?}\\\\cell", tbl_rows[[1]]))[[1]]

  ## check that header labels are present in the RTF output
  expect_true(grepl("Manufacturer/Model/Trim", header_cells[[1]]))
  expect_false(grepl("Manufacturer/Model/Trim", header_cells[[2]])) ## should be filler blank cell
  expect_false(grepl("Manufacturer/Model/Trim", header_cells[[3]])) ## should be fillter blank cell
  expect_true(grepl("year", header_cells[[4]]))
  expect_true(grepl("hp", header_cells[[5]]))
  expect_true(grepl("msrp", header_cells[[6]]))

  ## check that the stubhead label cell widths are correct 
  expect_true(grepl("\\\\cellx1560", header_cells[[1]])) #1560 twips wide
  expect_true(grepl("\\\\cellx3120", header_cells[[2]])) #1560 twips wider
  expect_true(grepl("\\\\cellx4680", header_cells[[3]])) #1560 twips wider
  expect_true(grepl("\\\\cellx6240", header_cells[[4]])) #1560 twips wider 
  expect_true(grepl("\\\\cellx7800", header_cells[[5]])) #1560 twips wider 
  expect_true(grepl("\\\\cellx9360", header_cells[[6]])) #1560 twips wider 

  # check that hmerge is present for the first three cells and not the fourth cell
  expect_true(grepl("\\\\clmgf", header_cells[[1]])) # start horizontal merge for spanner cell
  expect_true(grepl("\\\\clmrg", header_cells[[2]])) # contiue horizontal merge for spanner cell
  expect_true(grepl("\\\\clmrg", header_cells[[3]])) # contiue horizontal merge for spanner cell
  expect_false(grepl("\\\\clmrg", header_cells[[4]])) # end horizontal merge for spanner cell, is separate cell from spanner cell

})

test_that("Multicolumn stub RTF without passing stubhead labels",{

  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) 

  expect_no_error(rtf_output <- as_rtf(gt_tbl))

  rtfs <- as.character(rtf_output)

  ## extract table rows
  tbl_rows <- regmatches(rtfs, gregexpr("\\\\trowd.+?\\\\row", rtfs))[[1]]
  ## break row
  header_cells <- regmatches(tbl_rows[[1]], gregexpr("\\\\pard.+?}\\\\cell", tbl_rows[[1]]))[[1]]

  ## check that header labels are present in the RTF output

  ## first cell should not contain any of the stub column labels since they should be blank when no stubhead labels are passed
  expect_false(grepl("mfr", header_cells[[1]]))
  expect_false(grepl("model", header_cells[[1]]))
  expect_false(grepl("trim", header_cells[[1]]))

  expect_true(grepl("year", header_cells[[4]]))
  expect_true(grepl("hp", header_cells[[5]]))
  expect_true(grepl("msrp", header_cells[[6]]))

  ## check that the stubhead label cell widths are correct 
  expect_true(grepl("\\\\cellx1560", header_cells[[1]])) # 1560 twips wide
  expect_true(grepl("\\\\cellx3120", header_cells[[2]])) # 1560 twips wide
  expect_true(grepl("\\\\cellx4680", header_cells[[3]])) # 1560 twips wide
  expect_true(grepl("\\\\cellx6240", header_cells[[4]])) #1560 twips wider
  expect_true(grepl("\\\\cellx7800", header_cells[[5]])) #1560 twips wider
  expect_true(grepl("\\\\cellx9360", header_cells[[6]])) #1560 twips wider 
})

test_that("Multicolumn stub RTF with spanning labels over 1 column",{

  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_spanner(
      label = "span",
      columns = "year"
    )  

  expect_no_error(rtf_output <- as_rtf(gt_tbl))

  rtfs <- as.character(rtf_output)

  ## extract table rows
  tbl_rows <- regmatches(rtfs, gregexpr("\\\\trowd.+?\\\\row\\n", rtfs))[[1]]
  ## break row
  header_row_1_cells <- regmatches(tbl_rows[[1]], gregexpr("\\\\pard.+?}\\\\cell", tbl_rows[[1]]))[[1]]
  header_row_2_cells <- regmatches(tbl_rows[[2]], gregexpr("\\\\pard.+?}\\\\cell", tbl_rows[[2]]))[[1]]

  ## Check that the first header row contains the spanner label
  expect_true(grepl("span", header_row_1_cells[[4]]))
  expect_false(grepl("span", header_row_1_cells[[3]]))
  expect_true(grepl("\\\\cellx1560", header_row_1_cells[[1]])) # 1560 twips wide
  expect_true(grepl("\\\\cellx3120", header_row_1_cells[[2]])) # 1560 twips wide
  expect_true(grepl("\\\\cellx4680", header_row_1_cells[[3]])) # 1560 twips wide
  expect_true(grepl("\\\\cellx6240", header_row_1_cells[[4]])) #1560 twips wider
  expect_true(grepl("\\\\cellx7800", header_row_1_cells[[5]])) #1560 twips wider
  expect_true(grepl("\\\\cellx9360", header_row_1_cells[[6]])) #1560 twips wider 

  ## check that second header row labels
  ### cells over stub should not contain any of the stub column labels since they should be blank when no stubhead labels are passed
  expect_false(grepl("mfr", header_row_2_cells[[1]]))
  expect_false(grepl("model", header_row_2_cells[[2]]))
  expect_false(grepl("trim", header_row_2_cells[[3]]))
  expect_true(grepl("year", header_row_2_cells[[4]]))
  expect_true(grepl("hp", header_row_2_cells[[5]]))
  expect_true(grepl("msrp", header_row_2_cells[[6]]))

  ## check that the cell widths are correct 
  expect_true(grepl("\\\\cellx1560", header_row_2_cells[[1]])) #1560 twips wide
  expect_true(grepl("\\\\cellx3120", header_row_2_cells[[2]])) #1560 twips wide
  expect_true(grepl("\\\\cellx4680", header_row_2_cells[[3]])) #1560 twips wide
  expect_true(grepl("\\\\cellx6240", header_row_2_cells[[4]])) #1560 twips wider
  expect_true(grepl("\\\\cellx7800", header_row_2_cells[[5]])) #1560 twips wider
  expect_true(grepl("\\\\cellx9360", header_row_2_cells[[6]])) #1560 twips wider 
  
  
})

test_that("Multicolumn stub RTF with spanning labels over 2 columns",{

  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_spanner(
      label = "span",
      columns = c("year", "hp")
    )  

  expect_no_error(rtf_output <- as_rtf(gt_tbl))

  rtfs <- as.character(rtf_output)

  ## extract table rows
  tbl_rows <- regmatches(rtfs, gregexpr("\\\\trowd.+?\\\\row", rtfs))[[1]]
  ## break row
  header_row_1_cells <- regmatches(tbl_rows[[1]], gregexpr("\\\\pard.+?}\\\\cell", tbl_rows[[1]]))[[1]]
  header_row_2_cells <- regmatches(tbl_rows[[2]], gregexpr("\\\\pard.+?}\\\\cell", tbl_rows[[2]]))[[1]]

  ## Check that the first header row contains the spanner label
  expect_true(grepl("span", header_row_1_cells[[4]]))
  expect_true(grepl("\\\\cellx1560", header_row_1_cells[[1]])) #1560 twips wide
  expect_true(grepl("\\\\cellx3120", header_row_1_cells[[2]])) #1560 twips wide
  expect_true(grepl("\\\\cellx4680", header_row_1_cells[[3]])) #1560 twips wide
  expect_true(grepl("\\\\cellx6240", header_row_1_cells[[4]])) #1560 twips wider
  expect_true(grepl("\\\\cellx7800", header_row_1_cells[[5]])) #1560 twips wider
  expect_true(grepl("\\\\cellx9360", header_row_1_cells[[6]])) #1560 twips wider 

  expect_true(grepl("\\\\clmgf", header_row_1_cells[[4]])) # start horizontal merge for spanner cell
  expect_true(grepl("\\\\clmrg", header_row_1_cells[[5]])) # contiue horizontal merge for spanner cell
  expect_false(grepl("\\\\clmrg", header_row_1_cells[[6]])) # end horizontal merge for spanner cell, is separate cell from spanner cell

  ## check that second header row labels
  ### first cell should not contain any of the stub column labels since they should be blank when no stubhead labels are passed
  expect_false(grepl("mfr", header_row_2_cells[[1]]))
  expect_false(grepl("model", header_row_2_cells[[1]]))
  expect_false(grepl("trim", header_row_2_cells[[1]]))

  expect_true(grepl("year", header_row_2_cells[[4]]))
  expect_true(grepl("hp", header_row_2_cells[[5]]))
  expect_true(grepl("msrp", header_row_2_cells[[6]]))

  ## check that the cell widths are correct 
  expect_true(grepl("\\\\cellx1560", header_row_2_cells[[1]])) #1560 twips wide
  expect_true(grepl("\\\\cellx3120", header_row_2_cells[[2]])) #1560 twips wide
  expect_true(grepl("\\\\cellx4680", header_row_2_cells[[3]])) #1560 twips wide
  expect_true(grepl("\\\\cellx6240", header_row_2_cells[[4]])) #1560 twips wider
  expect_true(grepl("\\\\cellx7800", header_row_2_cells[[5]])) #1560 twips wider
  expect_true(grepl("\\\\cellx9360", header_row_2_cells[[6]])) #1560 twips wider 

})

test_that("Multicolumn stub RTF with spanning labels over 2 columns with single stubhead label",{

  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer/Model/Trim")) |>
    tab_spanner(
      label = "span",
      columns = c("year", "hp")
    )  

  expect_no_error(rtf_output <- as_rtf(gt_tbl))

  rtfs <- as.character(rtf_output)

  ## extract table rows
  tbl_rows <- regmatches(rtfs, gregexpr("\\\\trowd.+?\\\\row", rtfs))[[1]]
  ## break row
  header_row_1_cells <- regmatches(tbl_rows[[1]], gregexpr("\\\\pard.+?}\\\\cell", tbl_rows[[1]]))[[1]]
  header_row_2_cells <- regmatches(tbl_rows[[2]], gregexpr("\\\\pard.+?}\\\\cell", tbl_rows[[2]]))[[1]]

  ## Check that the first header row contains the spanner label
  expect_true(grepl("span", header_row_1_cells[[4]]))
  expect_true(grepl("\\\\cellx1560", header_row_1_cells[[1]])) # 1560 twips wide
  expect_true(grepl("\\\\cellx3120", header_row_1_cells[[2]])) # 1560 twips wide
  expect_true(grepl("\\\\cellx4680", header_row_1_cells[[3]])) # 1560 twips wide
  expect_true(grepl("\\\\cellx6240", header_row_1_cells[[4]])) #1560 twips wider
  expect_true(grepl("\\\\cellx7800", header_row_1_cells[[5]])) #1560 twips wider
  expect_true(grepl("\\\\cellx9360", header_row_1_cells[[6]])) #1560 twips wider 
  expect_true(grepl("\\\\clmgf", header_row_1_cells[[4]])) # start horizontal merge for spanner cell
  expect_true(grepl("\\\\clmrg", header_row_1_cells[[5]])) # contiue horizontal merge for spanner cell
  expect_false(grepl("\\\\clmrg", header_row_1_cells[[6]])) # end horizontal merge for spanner cell, is separate cell from spanner cell

  ## check that second header row labels
  ### first cell should not contain any of the stub column labels since they should be blank when no stubhead labels are passed
  expect_true(grepl("Manufacturer/Model/Trim", header_row_2_cells[[1]]))
  expect_true(grepl("year", header_row_2_cells[[4]]))
  expect_true(grepl("hp", header_row_2_cells[[5]]))
  expect_true(grepl("msrp", header_row_2_cells[[6]]))

  ## check that the cell widths are correct 
  expect_true(grepl("\\\\cellx1560", header_row_2_cells[[1]])) #1560 twips wide
  expect_true(grepl("\\\\cellx3120", header_row_2_cells[[2]])) #1560 twips wide
  expect_true(grepl("\\\\cellx4680", header_row_2_cells[[3]])) #1560 twips wide
  expect_true(grepl("\\\\cellx6240", header_row_2_cells[[4]])) #1560 twips wider
  expect_true(grepl("\\\\cellx7800", header_row_2_cells[[5]])) #1560 twips wider
  expect_true(grepl("\\\\cellx9360", header_row_2_cells[[6]])) #1560 twips wider 

})
  
test_that("Multicolumn stub RTF with spanning labels over 2 columns with stubhead label for each column",{

  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_spanner(
      label = "span",
      columns = c("year", "hp")
    )  

  expect_no_error(rtf_output <- as_rtf(gt_tbl))

  rtfs <- as.character(rtf_output)

  ## extract table rows
  tbl_rows <- regmatches(rtfs, gregexpr("\\\\trowd.+?\\\\row", rtfs))[[1]]
  ## break row
  header_row_1_cells <- regmatches(tbl_rows[[1]], gregexpr("\\\\pard.+?}\\\\cell", tbl_rows[[1]]))[[1]]
  header_row_2_cells <- regmatches(tbl_rows[[2]], gregexpr("\\\\pard.+?}\\\\cell", tbl_rows[[2]]))[[1]]

  ## Check that the first header row contains the spanner label
  expect_true(grepl("span", header_row_1_cells[[4]]))
  expect_true(grepl("\\\\cellx1560", header_row_1_cells[[1]])) #1560 twips wide
  expect_true(grepl("\\\\cellx3120", header_row_1_cells[[2]])) #1560 twips wide
  expect_true(grepl("\\\\cellx4680", header_row_1_cells[[3]])) #1560 twips wide
  expect_true(grepl("\\\\cellx6240", header_row_1_cells[[4]])) #1560 twips wider
  expect_true(grepl("\\\\cellx7800", header_row_1_cells[[5]])) #1560 twips wider
  expect_true(grepl("\\\\cellx9360", header_row_1_cells[[6]])) #1560 twips wider 
  expect_true(grepl("\\\\clmgf", header_row_1_cells[[4]])) # start horizontal merge for spanner cell
  expect_true(grepl("\\\\clmrg", header_row_1_cells[[5]])) # contiue horizontal merge for spanner cell
  expect_false(grepl("\\\\clmrg", header_row_1_cells[[6]])) # end horizontal merge for spanner cell, is separate cell from spanner cell

  ## check that second header row labels
  ### first cell should not contain any of the stub column labels since they should be blank when no stubhead labels are passed
  expect_true(grepl("Manufacturer", header_row_2_cells[[1]]))
  expect_true(grepl("Model", header_row_2_cells[[2]]))
  expect_true(grepl("Trim", header_row_2_cells[[3]]))
  expect_true(grepl("year", header_row_2_cells[[4]]))
  expect_true(grepl("hp", header_row_2_cells[[5]]))
  expect_true(grepl("msrp", header_row_2_cells[[6]]))

  ## check that the cell widths are correct 
  expect_true(grepl("\\\\cellx1560", header_row_2_cells[[1]])) #1560 twips wide
  expect_true(grepl("\\\\cellx3120", header_row_2_cells[[2]])) #1560 twips wide
  expect_true(grepl("\\\\cellx4680", header_row_2_cells[[3]])) #1560 twips wide
  expect_true(grepl("\\\\cellx6240", header_row_2_cells[[4]])) #1560 twips wide
  expect_true(grepl("\\\\cellx7800", header_row_2_cells[[5]])) #1560 twips wider
  expect_true(grepl("\\\\cellx9360", header_row_2_cells[[6]])) #1560 twips wider

})
  
test_that("Multicolumn stub RTF with multilayer spanning labels over 2 columns with single stubhead label",{

  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer/Model/Trim")) |>
    tab_spanner(
      label = "span",
      columns = c("year", "hp")
    )  |>
    tab_spanner(
      label = "span2",
      columns = c("year","msrp")
    )

  expect_no_error(rtf_output <- as_rtf(gt_tbl))

  rtfs <- as.character(rtf_output)

  ## extract table rows
  tbl_rows <- regmatches(rtfs, gregexpr("\\\\trowd.+?\\\\row", rtfs))[[1]]
  ## break row
  header_row_1_cells <- regmatches(tbl_rows[[1]], gregexpr("\\\\pard.+?}\\\\cell\\n", tbl_rows[[1]]))[[1]]
  header_row_2_cells <- regmatches(tbl_rows[[2]], gregexpr("\\\\pard.+?}\\\\cell\\n", tbl_rows[[2]]))[[1]]
  header_row_3_cells <- regmatches(tbl_rows[[3]], gregexpr("\\\\pard.+?}\\\\cell\\n", tbl_rows[[3]]))[[1]]

  ## check that the first header row contains the spanner label
  expect_true(grepl("span2", header_row_1_cells[[4]]))
  expect_false(grepl("span2", header_row_1_cells[[5]]))
  expect_true(grepl("span2", header_row_1_cells[[6]]))

  ## Check that the first header row contains the spanner label
  expect_true(grepl("span", header_row_2_cells[[4]]))
  expect_true(grepl("\\\\cellx1560", header_row_2_cells[[1]])) #1560 twips wide
  expect_true(grepl("\\\\cellx3120", header_row_2_cells[[2]])) #1560 twips wide
  expect_true(grepl("\\\\cellx4680", header_row_2_cells[[3]])) #1560 twips wide
  expect_true(grepl("\\\\cellx6240", header_row_2_cells[[4]])) #1560 twips wider
  expect_true(grepl("\\\\cellx7800", header_row_2_cells[[5]])) #1560 twips wider
  expect_true(grepl("\\\\cellx9360", header_row_2_cells[[6]])) #1560 twips wider 
  expect_true(grepl("\\\\clmgf", header_row_2_cells[[4]])) # start horizontal merge for spanner cell
  expect_true(grepl("\\\\clmrg", header_row_2_cells[[5]])) # contiue horizontal merge for spanner cell
  expect_false(grepl("\\\\clmrg", header_row_2_cells[[6]])) # end horizontal merge for spanner cell, is separate cell from spanner cell

  ## check that second header row labels
  ### first cell should not contain any of the stub column labels since they should be blank when no stubhead labels are passed
  expect_true(grepl("Manufacturer/Model/Trim", header_row_3_cells[[1]]))
  expect_true(grepl("year", header_row_3_cells[[4]]))
  expect_true(grepl("hp", header_row_3_cells[[5]]))
  expect_true(grepl("msrp", header_row_3_cells[[6]]))

  ## check that the cell widths are correct 
  expect_true(grepl("\\\\cellx1560", header_row_3_cells[[1]])) #1560 twips wide
  expect_true(grepl("\\\\cellx3120", header_row_3_cells[[2]])) #1560 twips wide
  expect_true(grepl("\\\\cellx4680", header_row_3_cells[[3]])) #1560 twips wide
  expect_true(grepl("\\\\cellx6240", header_row_3_cells[[4]])) #1560 twips wider
  expect_true(grepl("\\\\cellx7800", header_row_3_cells[[5]])) #1560 twips wider
  expect_true(grepl("\\\\cellx9360", header_row_3_cells[[6]])) #1560 twips wider 

})
  


test_that("Multicolumn stub RTF with multilayer spanning labels over 2 columns with stubhead label for each column",{

  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_spanner(
      label = "span",
      columns = c("year", "hp")
    )  |>
    tab_spanner(
      label = "span2",
      columns = c("year","msrp")
    )

  expect_no_error(rtf_output <- as_rtf(gt_tbl))

  rtfs <- as.character(rtf_output)

  ## extract table rows
  tbl_rows <- regmatches(rtfs, gregexpr("\\\\trowd.+?\\\\row", rtfs))[[1]]
  ## break row
  header_row_1_cells <- regmatches(tbl_rows[[1]], gregexpr("\\\\pard.+?}\\\\cell\\n", tbl_rows[[1]]))[[1]]
  header_row_2_cells <- regmatches(tbl_rows[[2]], gregexpr("\\\\pard.+?}\\\\cell\\n", tbl_rows[[2]]))[[1]]
  header_row_3_cells <- regmatches(tbl_rows[[3]], gregexpr("\\\\pard.+?}\\\\cell\\n", tbl_rows[[3]]))[[1]]

  ## check that the first header row contains the spanner label
  expect_true(grepl("span2", header_row_1_cells[[4]]))
  expect_false(grepl("span2", header_row_1_cells[[5]]))
  expect_true(grepl("span2", header_row_1_cells[[6]]))

  ## Check that the second header row contains the spanner label
  expect_true(grepl("span", header_row_2_cells[[4]]))
  expect_true(grepl("\\\\cellx1560", header_row_2_cells[[1]])) #1560 twips wide
  expect_true(grepl("\\\\cellx3120", header_row_2_cells[[2]])) #1560 twips wide
  expect_true(grepl("\\\\cellx4680", header_row_2_cells[[3]])) #1560 twips wide
  expect_true(grepl("\\\\cellx6240", header_row_2_cells[[4]])) #1560 twips wider
  expect_true(grepl("\\\\cellx7800", header_row_2_cells[[5]])) #1560 twips wider
  expect_true(grepl("\\\\cellx9360", header_row_2_cells[[6]])) #1560 twips wider 
  expect_true(grepl("\\\\clmgf", header_row_2_cells[[4]])) # start horizontal merge for spanner cell
  expect_true(grepl("\\\\clmrg", header_row_2_cells[[5]])) # contiue horizontal merge for spanner cell
  expect_false(grepl("\\\\clmrg", header_row_2_cells[[6]])) # end horizontal merge for spanner cell, is separate cell from spanner cell

  ## check that third header row labels
  ### first cell should not contain any of the stub column labels since they should be blank when no stubhead labels are passed
  expect_true(grepl("Manufacturer", header_row_3_cells[[1]]))
  expect_true(grepl("Model", header_row_3_cells[[2]]))
  expect_true(grepl("Trim", header_row_3_cells[[3]]))
  expect_true(grepl("year", header_row_3_cells[[4]]))
  expect_true(grepl("hp", header_row_3_cells[[5]]))
  expect_true(grepl("msrp", header_row_3_cells[[6]]))

  ## check that the cell widths are correct 
  expect_true(grepl("\\\\cellx1560", header_row_3_cells[[1]])) #1560 twips wide
  expect_true(grepl("\\\\cellx3120", header_row_3_cells[[2]])) #1560 twips wide
  expect_true(grepl("\\\\cellx4680", header_row_3_cells[[3]])) #1560 twips wide
  expect_true(grepl("\\\\cellx6240", header_row_3_cells[[4]])) #1560 twips wide
  expect_true(grepl("\\\\cellx7800", header_row_3_cells[[5]])) #1560 twips wider
  expect_true(grepl("\\\\cellx9360", header_row_3_cells[[6]])) #1560 twips wider

})
  

