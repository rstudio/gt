test_that("Extraction of the table body works well", {

  # Create a simple table
  tbl <-
    dplyr::tibble(
      labels = LETTERS[1:7],
      num_1 = c(-0.01, 74, NA, 0, 500, 0.001, 84.3),
      num_2 = c(2, 5, 2, 6, 2.6, 923, -23),
      int_1 = c(1L, -100000L, 800L, 5L, NA, 1L, -3202334L),
      int_2 = c(6, NA, NA, 2, 123, 23, -600252),
      sci_1 = c(1.62e-9, 23.2e-7, 9.2e-12, 7.252e-10, 2.5e-13, NA, NA),
      sci_2 = c(5.2e13, 1.4e7, NA, NA, 3.2e3, 6.26e9, NA),
      ltr_1 = letters[1:7],
      ltr_2 = letters[1:7],
      ltr_3 = letters[1:7],
      group = c("one", "one", "two", "two", "one", "two", "one")
    )

  # Create a gt table, applying functions that modify the table body
  gt_tbl_1 <-
    tbl %>%
    gt() %>%
    fmt_integer(columns = num_1, pattern = "int:{x}") %>%
    sub_values(
      columns = num_1,
      fn = function(x) x > 400,
      replacement = "big"
    ) %>%
    sub_missing(columns = sci_1, missing_text = "missing") %>%
    text_transform(
      fn = function(x) paste(x, "_84"),
      locations = cells_body(columns = num_1, rows = 7)
    ) %>%
    fmt_scientific(columns = starts_with("sci")) %>%
    fmt_number(columns = starts_with("int"), rows = 1:3) %>%
    cols_merge(columns = starts_with("ltr"), rows = 4:7) %>%
    tab_footnote(
      footnote = "A",
      locations = cells_body(columns = int_1, rows = 1),
      placement = "right"
    ) %>%
    tab_footnote(
      footnote = "A",
      locations = cells_body(columns = labels, rows = 2)
    ) %>%
    tab_footnote(
      footnote = "B",
      locations = cells_body(columns = num_2, rows = 3),
      placement = "right"
    )

  # Extract the table body at every stage of an HTML output build and
  # test each of the vectors within each extracted table body
  tbl_body_1_1 <- gt_tbl_1 %>% extract_body(build_stage = "init")
  expect_true(all(is.na(tbl_body_1_1 %>% unlist() %>% unname())))

  tbl_body_1_2 <- gt_tbl_1 %>% extract_body(build_stage = "fmt_applied")
  expect_true(all(is.na(tbl_body_1_2[["labels"]])))
  expect_true(all(is.na(tbl_body_1_2[["num_2"]])))
  expect_true(all(is.na(tbl_body_1_2[["ltr_1"]])))
  expect_true(all(is.na(tbl_body_1_2[["ltr_2"]])))
  expect_true(all(is.na(tbl_body_1_2[["ltr_3"]])))
  expect_true(all(is.na(tbl_body_1_2[["group"]])))
  expect_equal(
    tbl_body_1_2[["num_1"]],
    c("int:0", "int:74", NA, "int:0", "int:500", "int:0", "int:84")
  )
  expect_equal(
    tbl_body_1_2[["int_1"]],
    c("1.00", "−100,000.00", "800.00", NA, NA, NA, NA)
  )
  expect_equal(
    tbl_body_1_2[["int_2"]],
    c("6.00", NA, NA, NA, NA, NA, NA)
  )
  expect_equal(
    tbl_body_1_2[["sci_1"]],
    c(
      "1.62 × 10<sup style='font-size: 65%;'>−9</sup>",
      "2.32 × 10<sup style='font-size: 65%;'>−6</sup>",
      "9.20 × 10<sup style='font-size: 65%;'>−12</sup>",
      "7.25 × 10<sup style='font-size: 65%;'>−10</sup>",
      "2.50 × 10<sup style='font-size: 65%;'>−13</sup>",
      NA, NA
    )
  )
  expect_equal(
    tbl_body_1_2[["sci_2"]],
    c(
      "5.20 × 10<sup style='font-size: 65%;'>13</sup>",
      "1.40 × 10<sup style='font-size: 65%;'>7</sup>",
      NA, NA,
      "3.20 × 10<sup style='font-size: 65%;'>3</sup>",
      "6.26 × 10<sup style='font-size: 65%;'>9</sup>",
      NA
    )
  )

  tbl_body_1_3 <- gt_tbl_1 %>% extract_body(build_stage = "sub_applied")
  expect_true(all(is.na(tbl_body_1_3[["labels"]])))
  expect_true(all(is.na(tbl_body_1_3[["num_2"]])))
  expect_true(all(is.na(tbl_body_1_3[["ltr_1"]])))
  expect_true(all(is.na(tbl_body_1_3[["ltr_2"]])))
  expect_true(all(is.na(tbl_body_1_3[["ltr_3"]])))
  expect_true(all(is.na(tbl_body_1_3[["group"]])))
  expect_equal(
    tbl_body_1_3[["num_1"]],
    c("int:0", "int:74", NA, "int:0", "big", "int:0", "int:84")
  )
  expect_equal(
    tbl_body_1_3[["int_1"]],
    c("1.00", "−100,000.00", "800.00", NA, NA, NA, NA)
  )
  expect_equal(
    tbl_body_1_3[["int_2"]],
    c("6.00", NA, NA, NA, NA, NA, NA)
  )
  expect_equal(
    tbl_body_1_3[["sci_1"]],
    c(
      "1.62 × 10<sup style='font-size: 65%;'>−9</sup>",
      "2.32 × 10<sup style='font-size: 65%;'>−6</sup>",
      "9.20 × 10<sup style='font-size: 65%;'>−12</sup>",
      "7.25 × 10<sup style='font-size: 65%;'>−10</sup>",
      "2.50 × 10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )
  expect_equal(
    tbl_body_1_3[["sci_2"]],
    c(
      "5.20 × 10<sup style='font-size: 65%;'>13</sup>",
      "1.40 × 10<sup style='font-size: 65%;'>7</sup>",
      NA, NA,
      "3.20 × 10<sup style='font-size: 65%;'>3</sup>",
      "6.26 × 10<sup style='font-size: 65%;'>9</sup>",
      NA
    )
  )

  tbl_body_1_4 <- gt_tbl_1 %>% extract_body(build_stage = "unfmt_included")
  expect_equal(tbl_body_1_4[["labels"]], tbl[["labels"]])
  expect_equal(tbl_body_1_4[["ltr_1"]], tbl[["ltr_1"]])
  expect_equal(tbl_body_1_4[["ltr_2"]], tbl[["ltr_2"]])
  expect_equal(tbl_body_1_4[["ltr_3"]], tbl[["ltr_3"]])
  expect_equal(
    tbl_body_1_4[["num_1"]],
    c("int:0", "int:74", "NA", "int:0", "big", "int:0", "int:84")
  )
  expect_equal(
    tbl_body_1_4[["num_2"]],
    c("2.0", "5.0", "2.0", "6.0", "2.6", "923.0", "-23.0")
  )
  expect_equal(
    tbl_body_1_4[["int_1"]],
    c("1.00", "−100,000.00", "800.00", "5", "NA", "1", "-3202334")
  )
  expect_equal(
    tbl_body_1_4[["int_2"]],
    c("6.00", "NA", "NA", "2", "123", "23", "-600252")
  )
  expect_equal(
    tbl_body_1_4[["sci_1"]],
    c(
      "1.62 × 10<sup style='font-size: 65%;'>−9</sup>",
      "2.32 × 10<sup style='font-size: 65%;'>−6</sup>",
      "9.20 × 10<sup style='font-size: 65%;'>−12</sup>",
      "7.25 × 10<sup style='font-size: 65%;'>−10</sup>",
      "2.50 × 10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )
  expect_equal(
    tbl_body_1_4[["sci_2"]],
    c(
      "5.20 × 10<sup style='font-size: 65%;'>13</sup>",
      "1.40 × 10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20 × 10<sup style='font-size: 65%;'>3</sup>",
      "6.26 × 10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )

  tbl_body_1_5 <- gt_tbl_1 %>% extract_body(build_stage = "cols_merged")
  expect_equal(tbl_body_1_5[["labels"]], tbl[["labels"]])
  expect_equal(tbl_body_1_5[["ltr_2"]], tbl[["ltr_2"]])
  expect_equal(tbl_body_1_5[["ltr_3"]], tbl[["ltr_3"]])
  expect_equal(
    tbl_body_1_5[["num_1"]],
    c("int:0", "int:74", "NA", "int:0", "big", "int:0", "int:84")
  )
  expect_equal(
    tbl_body_1_5[["num_2"]],
    c("2.0", "5.0", "2.0", "6.0", "2.6", "923.0", "-23.0")
  )
  expect_equal(
    tbl_body_1_5[["int_1"]],
    c("1.00", "−100,000.00", "800.00", "5", "NA", "1", "-3202334")
  )
  expect_equal(
    tbl_body_1_5[["int_2"]],
    c("6.00", "NA", "NA", "2", "123", "23", "-600252")
  )
  expect_equal(
    tbl_body_1_5[["sci_1"]],
    c(
      "1.62 × 10<sup style='font-size: 65%;'>−9</sup>",
      "2.32 × 10<sup style='font-size: 65%;'>−6</sup>",
      "9.20 × 10<sup style='font-size: 65%;'>−12</sup>",
      "7.25 × 10<sup style='font-size: 65%;'>−10</sup>",
      "2.50 × 10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )
  expect_equal(
    tbl_body_1_5[["sci_2"]],
    c(
      "5.20 × 10<sup style='font-size: 65%;'>13</sup>",
      "1.40 × 10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20 × 10<sup style='font-size: 65%;'>3</sup>",
      "6.26 × 10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )
  expect_equal(
    tbl_body_1_5[["ltr_1"]],
    c("a", "b", "c", "d d d", "e e e", "f f f", "g g g")
  )

  tbl_body_1_6 <- gt_tbl_1 %>% extract_body(build_stage = "body_reassembled")
  expect_equal(tbl_body_1_6[["labels"]], tbl[["labels"]])
  expect_equal(tbl_body_1_6[["ltr_2"]], tbl[["ltr_2"]])
  expect_equal(tbl_body_1_6[["ltr_3"]], tbl[["ltr_3"]])
  expect_equal(
    tbl_body_1_6[["num_1"]],
    c("int:0", "int:74", "NA", "int:0", "big", "int:0", "int:84")
  )
  expect_equal(
    tbl_body_1_6[["num_2"]],
    c("2.0", "5.0", "2.0", "6.0", "2.6", "923.0", "-23.0")
  )
  expect_equal(
    tbl_body_1_6[["int_1"]],
    c("1.00", "−100,000.00", "800.00", "5", "NA", "1", "-3202334")
  )
  expect_equal(
    tbl_body_1_6[["int_2"]],
    c("6.00", "NA", "NA", "2", "123", "23", "-600252")
  )
  expect_equal(
    tbl_body_1_6[["sci_1"]],
    c(
      "1.62 × 10<sup style='font-size: 65%;'>−9</sup>",
      "2.32 × 10<sup style='font-size: 65%;'>−6</sup>",
      "9.20 × 10<sup style='font-size: 65%;'>−12</sup>",
      "7.25 × 10<sup style='font-size: 65%;'>−10</sup>",
      "2.50 × 10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )
  expect_equal(
    tbl_body_1_6[["sci_2"]],
    c(
      "5.20 × 10<sup style='font-size: 65%;'>13</sup>",
      "1.40 × 10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20 × 10<sup style='font-size: 65%;'>3</sup>",
      "6.26 × 10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )
  expect_equal(
    tbl_body_1_6[["ltr_1"]],
    c("a", "b", "c", "d d d", "e e e", "f f f", "g g g")
  )

  tbl_body_1_7 <- gt_tbl_1 %>% extract_body(build_stage = "text_transformed")
  expect_equal(tbl_body_1_7[["labels"]], tbl[["labels"]])
  expect_equal(tbl_body_1_7[["ltr_2"]], tbl[["ltr_2"]])
  expect_equal(tbl_body_1_7[["ltr_3"]], tbl[["ltr_3"]])
  expect_equal(
    tbl_body_1_7[["num_1"]],
    c("int:0", "int:74", "NA", "int:0", "big", "int:0", "int:84 _84")
  )
  expect_equal(
    tbl_body_1_7[["num_2"]],
    c("2.0", "5.0", "2.0", "6.0", "2.6", "923.0", "-23.0")
  )
  expect_equal(
    tbl_body_1_7[["int_1"]],
    c("1.00", "−100,000.00", "800.00", "5", "NA", "1", "-3202334")
  )
  expect_equal(
    tbl_body_1_7[["int_2"]],
    c("6.00", "NA", "NA", "2", "123", "23", "-600252")
  )
  expect_equal(
    tbl_body_1_7[["sci_1"]],
    c(
      "1.62 × 10<sup style='font-size: 65%;'>−9</sup>",
      "2.32 × 10<sup style='font-size: 65%;'>−6</sup>",
      "9.20 × 10<sup style='font-size: 65%;'>−12</sup>",
      "7.25 × 10<sup style='font-size: 65%;'>−10</sup>",
      "2.50 × 10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )
  expect_equal(
    tbl_body_1_7[["sci_2"]],
    c(
      "5.20 × 10<sup style='font-size: 65%;'>13</sup>",
      "1.40 × 10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20 × 10<sup style='font-size: 65%;'>3</sup>",
      "6.26 × 10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )
  expect_equal(
    tbl_body_1_7[["ltr_1"]],
    c("a", "b", "c", "d d d", "e e e", "f f f", "g g g")
  )

  tbl_body_1_8 <- gt_tbl_1 %>% extract_body(build_stage = "footnotes_attached")
  expect_equal(
    tbl_body_1_8[["labels"]],
    c(
      "A",
      "B<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;\"><sup>1</sup></span>",
      "C", "D", "E", "F", "G"
    )
  )
  expect_equal(tbl_body_1_8[["ltr_2"]], tbl[["ltr_2"]])
  expect_equal(tbl_body_1_8[["ltr_3"]], tbl[["ltr_3"]])
  expect_equal(
    tbl_body_1_8[["num_1"]],
    c("int:0", "int:74", "NA", "int:0", "big", "int:0", "int:84 _84")
  )
  expect_equal(
    tbl_body_1_8[["num_2"]],
    c(
      "2.0", "5.0",
      "2.0<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;\"><sup>2</sup></span>",
      "6.0", "2.6", "923.0", "-23.0"
    )
  )
  expect_equal(
    tbl_body_1_8[["int_1"]],
    c(
      "1.00<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;\"><sup>1</sup></span>",
      "−100,000.00", "800.00", "5", "NA", "1", "-3202334"
    )
  )
  expect_equal(
    tbl_body_1_8[["int_2"]],
    c("6.00", "NA", "NA", "2", "123", "23", "-600252")
  )
  expect_equal(
    tbl_body_1_8[["sci_1"]],
    c(
      "1.62 × 10<sup style='font-size: 65%;'>−9</sup>",
      "2.32 × 10<sup style='font-size: 65%;'>−6</sup>",
      "9.20 × 10<sup style='font-size: 65%;'>−12</sup>",
      "7.25 × 10<sup style='font-size: 65%;'>−10</sup>",
      "2.50 × 10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )
  expect_equal(
    tbl_body_1_8[["sci_2"]],
    c(
      "5.20 × 10<sup style='font-size: 65%;'>13</sup>",
      "1.40 × 10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20 × 10<sup style='font-size: 65%;'>3</sup>",
      "6.26 × 10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )
  expect_equal(
    tbl_body_1_8[["ltr_1"]],
    c("a", "b", "c", "d d d", "e e e", "f f f", "g g g")
  )
})
