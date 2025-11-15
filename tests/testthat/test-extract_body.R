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
    gt(tbl) |>
    fmt_integer(columns = num_1, pattern = "int:{x}") |>
    sub_values(
      columns = num_1,
      fn = function(x) x > 400,
      replacement = "big"
    ) |>
    sub_missing(columns = sci_1, missing_text = "missing") |>
    text_transform(
      fn = function(x) paste(x, "_84"),
      locations = cells_body(columns = num_1, rows = 7)
    ) |>
    fmt_scientific(columns = starts_with("sci")) |>
    fmt_number(columns = starts_with("int"), rows = 1:3) |>
    cols_merge(columns = starts_with("ltr"), rows = 4:7) |>
    tab_footnote(
      footnote = "A",
      locations = cells_body(columns = int_1, rows = 1),
      placement = "right"
    ) |>
    tab_footnote(
      footnote = "A",
      locations = cells_body(columns = labels, rows = 2)
    ) |>
    tab_footnote(
      footnote = "B",
      locations = cells_body(columns = num_2, rows = 3),
      placement = "right"
    ) |>
    cols_move_to_end(columns = sci_1)

  # Extract the table body at every stage of an HTML output build and
  # test each of the vectors within each extracted table body
  tbl_body_1_1 <- gt_tbl_1 |> extract_body(build_stage = "init")

  expect_true(all(is.na(tbl_body_1_1 |> unlist() |> unname())))

  expect_named(
    tbl_body_1_1,
    c(
      "labels", "num_1", "num_2", "int_1", "int_2",
      "sci_2", "ltr_1", "group", "sci_1"
    )
  )

  tbl_body_1_2 <- gt_tbl_1 |> extract_body(build_stage = "fmt_applied")

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
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      NA, NA
    )
  )

  expect_equal(
    tbl_body_1_2[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      NA, NA,
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      NA
    )
  )

  expect_named(
    tbl_body_1_2,
    c(
      "labels", "num_1", "num_2", "int_1", "int_2",
      "sci_2", "ltr_1", "group", "sci_1"
    )
  )

  tbl_body_1_3 <- gt_tbl_1 |> extract_body(build_stage = "sub_applied")

  expect_true(all(is.na(tbl_body_1_3[["labels"]])))

  expect_true(all(is.na(tbl_body_1_3[["num_2"]])))

  expect_true(all(is.na(tbl_body_1_3[["ltr_1"]])))

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
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )

  expect_equal(
    tbl_body_1_3[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      NA, NA,
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      NA
    )
  )

  expect_named(
    tbl_body_1_3,
    c(
      "labels", "num_1", "num_2", "int_1", "int_2",
      "sci_2", "ltr_1", "group", "sci_1"
    )
  )

  tbl_body_1_4 <- gt_tbl_1 |> extract_body(build_stage = "unfmt_included")

  expect_equal(tbl_body_1_4[["labels"]], tbl[["labels"]])

  expect_equal(tbl_body_1_4[["ltr_1"]], tbl[["ltr_1"]])

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
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )

  expect_equal(
    tbl_body_1_4[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )

  expect_named(
    tbl_body_1_4,
    c(
      "labels", "num_1", "num_2", "int_1", "int_2",
      "sci_2", "ltr_1", "group", "sci_1"
    )
  )

  tbl_body_1_5 <- gt_tbl_1 |> extract_body(build_stage = "cols_merged")

  expect_equal(tbl_body_1_5[["labels"]], tbl[["labels"]])

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
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )

  expect_equal(
    tbl_body_1_5[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )

  expect_equal(
    tbl_body_1_5[["ltr_1"]],
    c("a", "b", "c", "d d d", "e e e", "f f f", "g g g")
  )

  expect_named(
    tbl_body_1_5,
    c(
      "labels", "num_1", "num_2", "int_1", "int_2",
      "sci_2", "ltr_1", "group", "sci_1"
    )
  )

  tbl_body_1_6 <- gt_tbl_1 |> extract_body(build_stage = "body_reassembled")

  expect_equal(tbl_body_1_6[["labels"]], tbl[["labels"]])

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
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )

  expect_equal(
    tbl_body_1_6[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )

  expect_equal(
    tbl_body_1_6[["ltr_1"]],
    c("a", "b", "c", "d d d", "e e e", "f f f", "g g g")
  )

  expect_named(
    tbl_body_1_6,
    c(
      "labels", "num_1", "num_2", "int_1", "int_2",
      "sci_2", "ltr_1", "group", "sci_1"
    )
  )

  tbl_body_1_7 <- gt_tbl_1 |> extract_body(build_stage = "text_transformed")

  expect_equal(tbl_body_1_7[["labels"]], tbl[["labels"]])

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
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )

  expect_equal(
    tbl_body_1_7[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )

  expect_equal(
    tbl_body_1_7[["ltr_1"]],
    c("a", "b", "c", "d d d", "e e e", "f f f", "g g g")
  )

  expect_named(
    tbl_body_1_7,
    c(
      "labels", "num_1", "num_2", "int_1", "int_2",
      "sci_2", "ltr_1", "group", "sci_1"
    )
  )

  tbl_body_1_8 <- gt_tbl_1 |> extract_body(build_stage = "footnotes_attached")

  expect_equal(
    tbl_body_1_8[["labels"]],
    c(
      "A",
      "B<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;\"><sup>1</sup></span>",
      "C", "D", "E", "F", "G"
    )
  )

  expect_equal(
    tbl_body_1_8[["num_1"]],
    c("int:0", "int:74", "NA", "int:0", "big", "int:0", "int:84 _84")
  )

  expect_equal(
    tbl_body_1_8[["num_2"]],
    c(
      "2.0", "5.0",
      "2.0<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;\"><sup>2</sup></span>",
      "6.0", "2.6", "923.0", "-23.0"
    )
  )

  expect_equal(
    tbl_body_1_8[["int_1"]],
    c(
      "1.00<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;\"><sup>1</sup></span>",
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
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )

  expect_equal(
    tbl_body_1_8[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )

  expect_equal(
    tbl_body_1_8[["ltr_1"]],
    c("a", "b", "c", "d d d", "e e e", "f f f", "g g g")
  )

  expect_named(
    tbl_body_1_8,
    c(
      "labels", "num_1", "num_2", "int_1", "int_2",
      "sci_2", "ltr_1", "group", "sci_1"
    )
  )

  tbl_body_1_8_b <- gt_tbl_1 |> extract_body()

  expect_equal(
    tbl_body_1_8_b[["labels"]],
    c(
      "A",
      "B<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;\"><sup>1</sup></span>",
      "C", "D", "E", "F", "G"
    )
  )

  expect_equal(
    tbl_body_1_8_b[["num_1"]],
    c("int:0", "int:74", "NA", "int:0", "big", "int:0", "int:84 _84")
  )

  expect_equal(
    tbl_body_1_8_b[["num_2"]],
    c(
      "2.0", "5.0",
      "2.0<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;\"><sup>2</sup></span>",
      "6.0", "2.6", "923.0", "-23.0"
    )
  )

  expect_equal(
    tbl_body_1_8_b[["int_1"]],
    c(
      "1.00<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;\"><sup>1</sup></span>",
      "−100,000.00", "800.00", "5", "NA", "1", "-3202334"
    )
  )

  expect_equal(
    tbl_body_1_8_b[["int_2"]],
    c("6.00", "NA", "NA", "2", "123", "23", "-600252")
  )

  expect_equal(
    tbl_body_1_8_b[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )

  expect_equal(
    tbl_body_1_8_b[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )

  expect_equal(
    tbl_body_1_8_b[["ltr_1"]],
    c("a", "b", "c", "d d d", "e e e", "f f f", "g g g")
  )

  expect_named(
    tbl_body_1_8_b,
    c(
      "labels", "num_1", "num_2", "int_1", "int_2",
      "sci_2", "ltr_1", "group", "sci_1"
    )
  )

  # Create a similar gt table to the first, this time using
  # row groups and a stub
  gt_tbl_2 <-
    gt(tbl, rowname_col = "labels", groupname_col = "group") |>
    fmt_integer(columns = num_1, pattern = "int:{x}") |>
    sub_values(
      columns = num_1,
      fn = function(x) x > 400,
      replacement = "big"
    ) |>
    sub_missing(columns = sci_1, missing_text = "missing") |>
    text_transform(
      fn = function(x) paste(x, "_84"),
      locations = cells_body(columns = num_1, rows = 7)
    ) |>
    fmt_scientific(columns = starts_with("sci")) |>
    fmt_number(columns = starts_with("int"), rows = 1:3) |>
    cols_merge(columns = starts_with("ltr"), rows = 4:7) |>
    tab_footnote(
      footnote = "A",
      locations = cells_body(columns = int_1, rows = 1),
      placement = "right"
    ) |>
    tab_footnote(
      footnote = "A",
      locations = cells_body(columns = labels, rows = 2)
    ) |>
    tab_footnote(
      footnote = "B",
      locations = cells_body(columns = num_2, rows = 3),
      placement = "right"
    ) |>
    cols_move_to_end(columns = sci_1)

  # Extract the table body at every stage of an HTML output build and
  # test each of the vectors within each extracted table body
  tbl_body_2_1 <- gt_tbl_2 |> extract_body(build_stage = "init")

  expect_true(all(is.na(tbl_body_2_1 |> unlist() |> unname())))

  expect_named(
    tbl_body_2_1,
    c(
      "::group_id::", "::rowname::", "num_1", "num_2",
      "int_1", "int_2", "sci_2", "ltr_1", "sci_1"
    )
  )

  tbl_body_2_2 <- gt_tbl_2 |> extract_body(build_stage = "fmt_applied")

  expect_true(all(is.na(tbl_body_2_2[["num_2"]])))

  expect_true(all(is.na(tbl_body_2_2[["ltr_1"]])))

  expect_equal(
    tbl_body_2_2[["num_1"]],
    c("int:0", "int:74", NA, "int:0", "int:500", "int:0", "int:84")
  )

  expect_equal(
    tbl_body_2_2[["int_1"]],
    c("1.00", "−100,000.00", "800.00", NA, NA, NA, NA)
  )

  expect_equal(
    tbl_body_2_2[["int_2"]],
    c("6.00", NA, NA, NA, NA, NA, NA)
  )

  expect_equal(
    tbl_body_2_2[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      NA, NA
    )
  )

  expect_equal(
    tbl_body_2_2[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      NA, NA,
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      NA
    )
  )

  expect_named(
    tbl_body_2_2,
    c(
      "::group_id::", "::rowname::", "num_1", "num_2",
      "int_1", "int_2", "sci_2", "ltr_1", "sci_1"
    )
  )

  tbl_body_2_3 <- gt_tbl_2 |> extract_body(build_stage = "sub_applied")

  expect_true(all(is.na(tbl_body_2_3[["num_2"]])))

  expect_true(all(is.na(tbl_body_2_3[["ltr_1"]])))

  expect_equal(
    tbl_body_2_3[["num_1"]],
    c("int:0", "int:74", NA, "int:0", "big", "int:0", "int:84")
  )

  expect_equal(
    tbl_body_2_3[["int_1"]],
    c("1.00", "−100,000.00", "800.00", NA, NA, NA, NA)
  )

  expect_equal(
    tbl_body_2_3[["int_2"]],
    c("6.00", NA, NA, NA, NA, NA, NA)
  )

  expect_equal(
    tbl_body_2_3[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )

  expect_equal(
    tbl_body_2_3[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      NA, NA,
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      NA
    )
  )

  expect_named(
    tbl_body_2_3,
    c(
      "::group_id::", "::rowname::", "num_1", "num_2",
      "int_1", "int_2", "sci_2", "ltr_1", "sci_1"
    )
  )

  tbl_body_2_4 <- gt_tbl_2 |> extract_body(build_stage = "unfmt_included")

  expect_equal(tbl_body_2_4[["ltr_1"]], tbl[["ltr_1"]])

  expect_equal(
    tbl_body_2_4[["num_1"]],
    c("int:0", "int:74", "NA", "int:0", "big", "int:0", "int:84")
  )

  expect_equal(
    tbl_body_2_4[["num_2"]],
    c("2.0", "5.0", "2.0", "6.0", "2.6", "923.0", "-23.0")
  )

  expect_equal(
    tbl_body_2_4[["int_1"]],
    c("1.00", "−100,000.00", "800.00", "5", "NA", "1", "-3202334")
  )

  expect_equal(
    tbl_body_2_4[["int_2"]],
    c("6.00", "NA", "NA", "2", "123", "23", "-600252")
  )

  expect_equal(
    tbl_body_2_4[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )

  expect_equal(
    tbl_body_2_4[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )

  expect_named(
    tbl_body_2_4,
    c(
      "::group_id::", "::rowname::", "num_1", "num_2",
      "int_1", "int_2", "sci_2", "ltr_1", "sci_1"
    )
  )

  tbl_body_2_5 <- gt_tbl_2 |> extract_body(build_stage = "cols_merged")

  expect_equal(
    tbl_body_2_5[["num_1"]],
    c("int:0", "int:74", "NA", "int:0", "big", "int:0", "int:84")
  )

  expect_equal(
    tbl_body_2_5[["num_2"]],
    c("2.0", "5.0", "2.0", "6.0", "2.6", "923.0", "-23.0")
  )

  expect_equal(
    tbl_body_2_5[["int_1"]],
    c("1.00", "−100,000.00", "800.00", "5", "NA", "1", "-3202334")
  )

  expect_equal(
    tbl_body_2_5[["int_2"]],
    c("6.00", "NA", "NA", "2", "123", "23", "-600252")
  )

  expect_equal(
    tbl_body_2_5[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )

  expect_equal(
    tbl_body_2_5[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )

  expect_equal(
    tbl_body_2_5[["ltr_1"]],
    c("a", "b", "c", "d d d", "e e e", "f f f", "g g g")
  )

  expect_named(
    tbl_body_2_5,
    c(
      "::group_id::", "::rowname::", "num_1", "num_2",
      "int_1", "int_2", "sci_2", "ltr_1", "sci_1"
    )
  )

  tbl_body_2_6 <- gt_tbl_2 |> extract_body(build_stage = "body_reassembled")

  expect_equal(
    tbl_body_2_6[["num_1"]],
    c("int:0", "int:74", "big", "int:84", "NA", "int:0", "int:0")
  )

  expect_equal(
    tbl_body_2_6[["num_2"]],
    c("2.0", "5.0", "2.6", "-23.0", "2.0", "6.0", "923.0")
  )

  expect_equal(
    tbl_body_2_6[["int_1"]],
    c("1.00", "−100,000.00", "NA", "-3202334", "800.00", "5", "1")
  )

  expect_equal(
    tbl_body_2_6[["int_2"]],
    c("6.00", "NA", "123", "-600252", "NA", "2", "23")
  )

  expect_equal(
    tbl_body_2_6[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "missing"
    )
  )

  expect_equal(
    tbl_body_2_6[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "NA", "NA",
      "NA", "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>"
    )
  )

  expect_equal(
    tbl_body_2_6[["ltr_1"]],
    c("a", "b", "e e e", "g g g", "c", "d d d", "f f f")
  )

  expect_equal(
    colnames(tbl_body_2_6),
    c(
      "::group_id::", "::rowname::", "num_1", "num_2",
      "int_1", "int_2", "sci_2", "ltr_1", "sci_1"
    )
  )

  tbl_body_2_7 <- gt_tbl_2 |> extract_body(build_stage = "text_transformed")

  expect_equal(
    tbl_body_2_7[["num_1"]],
    c("int:0", "int:74", "big", "int:84 _84", "NA", "int:0", "int:0")
  )

  expect_equal(
    tbl_body_2_7[["num_2"]],
    c("2.0", "5.0", "2.6", "-23.0", "2.0", "6.0", "923.0")
  )

  expect_equal(
    tbl_body_2_7[["int_1"]],
    c("1.00", "−100,000.00", "NA", "-3202334", "800.00", "5", "1")
  )

  expect_equal(
    tbl_body_2_7[["int_2"]],
    c("6.00", "NA", "123", "-600252", "NA", "2", "23")
  )

  expect_equal(
    tbl_body_2_7[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "missing"
    )
  )

  expect_equal(
    tbl_body_2_7[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "NA", "NA",
      "NA", "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>"
    )
  )

  expect_equal(
    tbl_body_2_7[["ltr_1"]],
    c("a", "b", "e e e", "g g g", "c", "d d d", "f f f")
  )

  expect_named(
    tbl_body_2_7,
    c(
      "::group_id::", "::rowname::", "num_1", "num_2",
      "int_1", "int_2", "sci_2", "ltr_1", "sci_1"
    )
  )

  tbl_body_2_8 <- gt_tbl_2 |> extract_body(build_stage = "footnotes_attached")

  expect_equal(
    tbl_body_2_8[["num_1"]],
    c("int:0", "int:74", "big", "int:84 _84", "NA", "int:0", "int:0")
  )

  expect_equal(
    tbl_body_2_8[["num_2"]],
    c(
      "2.0", "5.0", "2.6", "-23.0",
      "2.0<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;\"><sup>2</sup></span>",
      "6.0", "923.0"
    )
  )

  expect_equal(
    tbl_body_2_8[["int_1"]],
    c(
      "1.00<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;\"><sup>1</sup></span>",
      "−100,000.00", "NA", "-3202334", "800.00", "5", "1"
    )
  )

  expect_equal(
    tbl_body_2_8[["int_2"]],
    c("6.00", "NA", "123", "-600252", "NA", "2", "23")
  )

  expect_equal(
    tbl_body_2_8[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "missing"
    )
  )

  expect_equal(
    tbl_body_2_8[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "NA", "NA",
      "NA", "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>"
    )
  )

  expect_equal(
    tbl_body_2_8[["ltr_1"]],
    c("a", "b", "e e e", "g g g", "c", "d d d", "f f f")
  )

  expect_named(
    tbl_body_2_8,
    c(
      "::group_id::", "::rowname::", "num_1", "num_2",
      "int_1", "int_2", "sci_2", "ltr_1", "sci_1"
    )
  )
})

test_that("Extraction of the table body works with variation in arguments", {

  #
  # Inclusion of stub, don't show hidden columns
  #

  # Extract body from simple table
  expect_snapshot(
    gt(exibble) |> extract_body()
  )

  # Extract body from table with row labels and row groups
  expect_snapshot(
    exibble |>
      gt(rowname_col = "row", groupname_col = "group") |>
      extract_body()
  )

  # Extract body from table with row labels
  expect_snapshot(
    exibble |>
      gt(rowname_col = "row") |>
      extract_body()
  )

  # Extract body from table with row groups
  expect_snapshot(
    exibble |>
      gt(groupname_col = "group") |>
      extract_body()
  )

  # w/ hidden columns: Extract body from simple table with hidden columns
  expect_snapshot(
    exibble |>
      gt() |>
      cols_hide(columns = matches("date")) |>
      extract_body()
  )

  # w/ hidden columns: Extract body from table with row labels and row groups
  expect_snapshot(
    exibble |>
      gt(rowname_col = "row", groupname_col = "group") |>
      cols_hide(columns = matches("date")) |>
      extract_body()
  )

  # w/ hidden columns: Extract body from table with row labels
  expect_snapshot(
    exibble |>
      gt(rowname_col = "row") |>
      cols_hide(columns = matches("date")) |>
      extract_body()
  )

  # w/ hidden columns: Extract body from table with row groups
  expect_snapshot(
    exibble |>
      gt(groupname_col = "group") |>
      cols_hide(columns = matches("date")) |>
      extract_body()
  )

  #
  # Exclude display of stub columns, don't show hidden columns
  #

  # Extract body from simple table
  expect_snapshot(
    exibble |>
      gt() |>
      extract_body(incl_stub_cols = FALSE)
  )

  # Extract body from table with row labels and row groups (don't include stub)
  expect_snapshot(
    exibble |>
      gt(rowname_col = "row", groupname_col = "group") |>
      extract_body(incl_stub_cols = FALSE)
  )

  # Extract body from table with row labels (don't include stub)
  expect_snapshot(
    exibble |>
      gt(rowname_col = "row") |>
      extract_body(incl_stub_cols = FALSE)
  )

  # Extract body from table with row groups (don't include stub)
  expect_snapshot(
    exibble |>
      gt(groupname_col = "group") |>
      extract_body(incl_stub_cols = FALSE)
  )

  # w/ hidden columns: Extract body from simple table with hidden columns
  expect_snapshot(
    exibble |>
      gt() |>
      cols_hide(columns = matches("date")) |>
      extract_body(incl_stub_cols = FALSE)
  )

  # w/ hidden columns: Extract body from table with row labels and row groups
  expect_snapshot(
    exibble |>
      gt(rowname_col = "row", groupname_col = "group") |>
      cols_hide(columns = matches("date")) |>
      extract_body(incl_stub_cols = FALSE)
  )

  # w/ hidden columns: Extract body from table with row labels
  expect_snapshot(
    exibble |>
      gt(rowname_col = "row") |>
      cols_hide(columns = matches("date")) |>
      extract_body(incl_stub_cols = FALSE)
  )

  # w/ hidden columns: Extract body from table with row groups
  expect_snapshot(
    exibble |>
      gt(groupname_col = "group") |>
      cols_hide(columns = matches("date")) |>
      extract_body(incl_stub_cols = FALSE)
  )

  #
  # Inclusion of stub, *show all* hidden columns
  #

  # Extract body from simple table
  expect_snapshot(
    exibble |>
      gt() |>
      extract_body(incl_hidden_cols = TRUE)
  )

  # Extract body from table with row labels and row groups
  expect_snapshot(
    exibble |>
      gt(rowname_col = "row", groupname_col = "group") |>
      extract_body(incl_hidden_cols = TRUE)
  )

  # Extract body from table with row labels
  expect_snapshot(
    exibble |>
      gt(rowname_col = "row") |>
      extract_body(incl_hidden_cols = TRUE)
  )

  # Extract body from table with row groups
  expect_snapshot(
    exibble |>
      gt(groupname_col = "group") |>
      extract_body(incl_hidden_cols = TRUE)
  )

  # w/ hidden columns: Extract body from simple table with hidden columns
  expect_snapshot(
    exibble |>
      gt() |>
      cols_hide(columns = matches("date")) |>
      extract_body(incl_hidden_cols = TRUE)
  )

  # w/ hidden columns: Extract body from table with row labels and row groups
  expect_snapshot(
    exibble |>
      gt(rowname_col = "row", groupname_col = "group") |>
      cols_hide(columns = matches("date")) |>
      extract_body(incl_hidden_cols = TRUE)
  )

  # w/ hidden columns: Extract body from table with row labels
  expect_snapshot(
    exibble |>
      gt(rowname_col = "row") |>
      cols_hide(columns = matches("date")) |>
      extract_body(incl_hidden_cols = TRUE)
  )

  # w/ hidden columns: Extract body from table with row groups
  expect_snapshot(
    exibble |>
      gt(groupname_col = "group") |>
      cols_hide(columns = matches("date")) |>
      extract_body(incl_hidden_cols = TRUE)
  )

  #
  # Exclude display of stub columns, *show all* hidden columns
  #

  # Extract body from simple table
  expect_snapshot(
    exibble |>
      gt() |>
      extract_body(incl_stub_cols = FALSE, incl_hidden_cols = TRUE)
  )

  # Extract body from table with row labels and row groups (don't include stub)
  expect_snapshot(
    exibble |>
      gt(rowname_col = "row", groupname_col = "group") |>
      extract_body(incl_stub_cols = FALSE, incl_hidden_cols = TRUE)
  )

  # Extract body from table with row labels (don't include stub)
  expect_snapshot(
    exibble |>
      gt(rowname_col = "row") |>
      extract_body(incl_stub_cols = FALSE, incl_hidden_cols = TRUE)
  )

  # Extract body from table with row groups (don't include stub)
  expect_snapshot(
    exibble |>
      gt(groupname_col = "group") |>
      extract_body(incl_stub_cols = FALSE, incl_hidden_cols = TRUE)
  )

  # w/ hidden columns: Extract body from simple table with hidden columns
  expect_snapshot(
    exibble |>
      gt() |>
      cols_hide(columns = matches("date")) |>
      extract_body(incl_stub_cols = FALSE, incl_hidden_cols = TRUE)
  )

  # w/ hidden columns: Extract body from table with row labels and row groups
  expect_snapshot(
    exibble |>
      gt(rowname_col = "row", groupname_col = "group") |>
      cols_hide(columns = matches("date")) |>
      extract_body(incl_stub_cols = FALSE, incl_hidden_cols = TRUE)
  )

  # w/ hidden columns: Extract body from table with row labels
  expect_snapshot(
    exibble |>
      gt(rowname_col = "row") |>
      cols_hide(columns = matches("date")) |>
      extract_body(incl_stub_cols = FALSE, incl_hidden_cols = TRUE)
  )

  # w/ hidden columns: Extract body from table with row groups
  expect_snapshot(
    exibble |>
      gt(groupname_col = "group") |>
      cols_hide(columns = matches("date")) |>
      extract_body(incl_stub_cols = FALSE, incl_hidden_cols = TRUE)
  )
})
