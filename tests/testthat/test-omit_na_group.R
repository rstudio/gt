test_that("omit_na_group parameter works correctly", {
  
  # Test data with NA in groupname column
  test_data <-
    gtcars |>
    dplyr::filter(ctry_origin == "Germany") |>
    dplyr::select(1:5) |>
    dplyr::add_row(
      mfr = NA_character_,
      model = "Header row",
      .before = 1
    )
  
  # Test default behavior (omit_na_group = FALSE)
  # NA values should create an "NA" group
  gt_default <-
    test_data |>
    gt(
      rowname_col = "model",
      groupname_col = "mfr"
    )
  
  stub_df_default <- dt_stub_df_get(gt_default)
  
  # The first row should have group_id of "NA"
  expect_equal(stub_df_default$group_id[1], "NA")
  
  # Test with omit_na_group = TRUE
  # NA values should NOT create a group (group_id should be NA_character_)
  gt_omit <-
    test_data |>
    gt(
      rowname_col = "model",
      groupname_col = "mfr",
      omit_na_group = TRUE
    )
  
  stub_df_omit <- dt_stub_df_get(gt_omit)
  
  # The first row should have group_id of NA_character_
  expect_true(is.na(stub_df_omit$group_id[1]))
  
  # Other rows should still have proper group_ids
  expect_false(is.na(stub_df_omit$group_id[2]))
  expect_true(stub_df_omit$group_id[2] %in% c("BMW", "Audi", "Mercedes-Benz", "Porsche"))
})

test_that("omit_na_group works with multiple NA rows", {
  
  # Test data with multiple NA rows
  test_data <-
    gtcars |>
    dplyr::filter(ctry_origin == "Germany") |>
    dplyr::select(1:5) |>
    dplyr::add_row(
      mfr = NA_character_,
      model = "Header row",
      .before = 1
    ) |>
    dplyr::add_row(
      mfr = NA_character_,
      model = "Footer row",
      .after = Inf
    )
  
  gt_omit <-
    test_data |>
    gt(
      rowname_col = "model",
      groupname_col = "mfr",
      omit_na_group = TRUE
    )
  
  stub_df <- dt_stub_df_get(gt_omit)
  
  # First and last rows should have NA group_id
  expect_true(is.na(stub_df$group_id[1]))
  expect_true(is.na(stub_df$group_id[nrow(stub_df)]))
  
  # Middle rows should have proper group_ids
  expect_false(any(is.na(stub_df$group_id[2:(nrow(stub_df) - 1)])))
})

test_that("omit_na_group works with exibble dataset", {
  
  test_data <-
    exibble |>
    dplyr::add_row(
      group = NA_character_,
      row = "header_row",
      .before = 1
    )
  
  # With omit_na_group = FALSE (default)
  gt_default <-
    test_data |>
    gt(
      rowname_col = "row",
      groupname_col = "group"
    )
  
  stub_df_default <- dt_stub_df_get(gt_default)
  expect_equal(stub_df_default$group_id[1], "NA")
  
  # With omit_na_group = TRUE
  gt_omit <-
    test_data |>
    gt(
      rowname_col = "row",
      groupname_col = "group",
      omit_na_group = TRUE
    )
  
  stub_df_omit <- dt_stub_df_get(gt_omit)
  expect_true(is.na(stub_df_omit$group_id[1]))
})

test_that("omit_na_group doesn't affect non-NA groups", {
  
  # Test that setting omit_na_group = TRUE doesn't affect regular groups
  test_data <-
    exibble |>
    gt(
      rowname_col = "row",
      groupname_col = "group",
      omit_na_group = TRUE
    )
  
  stub_df <- dt_stub_df_get(test_data)
  
  # All rows should have proper group assignments (grp_a or grp_b)
  expect_true(all(stub_df$group_id %in% c("grp_a", "grp_b")))
})

test_that("omit_na_group works with process_md = TRUE", {
  
  test_data <-
    gtcars |>
    dplyr::filter(ctry_origin == "Germany") |>
    dplyr::select(1:5) |>
    dplyr::add_row(
      mfr = NA_character_,
      model = "**Bold Header**",
      .before = 1
    )
  
  gt_omit <-
    test_data |>
    gt(
      rowname_col = "model",
      groupname_col = "mfr",
      omit_na_group = TRUE,
      process_md = TRUE
    )
  
  stub_df <- dt_stub_df_get(gt_omit)
  
  # First row should have NA group_id
  expect_true(is.na(stub_df$group_id[1]))
  
  # First row should have NULL group_label (not processed as markdown)
  expect_null(stub_df$group_label[[1]])
})
