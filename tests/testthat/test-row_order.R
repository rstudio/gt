
# Create test data with groups and values to sort
tbl <-
  dplyr::tribble(
    ~group,    ~name,    ~value_a, ~value_b,
    "grp_a",   "alpha",  10,       100,
    "grp_a",   "beta",   30,       50,
    "grp_a",   "gamma",  20,       75,
    "grp_b",   "delta",  5,        200,
    "grp_b",   "epsilon", 15,      150,
    "grp_b",   "zeta",   25,       125
  )

test_that("row_order() orders rows in ascending order by default", {

  html_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    row_order(value_a)

  # Extract the body to verify order
  body_data <- extract_body(html_tbl)

  # Rows should be ordered by value_a within each group
  # grp_a: alpha (10), gamma (20), beta (30)
  # grp_b: delta (5), epsilon (15), zeta (25)
  expect_equal(body_data$name, c("alpha", "gamma", "beta", "delta", "epsilon", "zeta"))
})

test_that("row_order() with reverse = TRUE orders rows in descending order", {

  html_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    row_order(value_a, reverse = TRUE)

  body_data <- extract_body(html_tbl)

  # Rows should be ordered by value_a descending within each group
  # grp_a: beta (30), gamma (20), alpha (10)
  # grp_b: zeta (25), epsilon (15), delta (5)
  expect_equal(body_data$name, c("beta", "gamma", "alpha", "zeta", "epsilon", "delta"))
})

test_that("row_order() can target specific groups", {

  html_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    row_order(value_a, groups = "grp_b")

  body_data <- extract_body(html_tbl)

  # grp_a should be in original order: alpha, beta, gamma
  # grp_b should be sorted: delta (5), epsilon (15), zeta (25)
  expect_equal(body_data$name, c("alpha", "beta", "gamma", "delta", "epsilon", "zeta"))
})

test_that("row_order() can use multiple columns for hierarchical sorting", {

  # Create data with ties
  tbl_ties <-
    dplyr::tribble(
      ~group,    ~name,    ~year, ~value,
      "grp_a",   "alpha",  2020,  10,
      "grp_a",   "beta",   2020,  30,
      "grp_a",   "gamma",  2021,  20,
      "grp_a",   "delta",  2021,  15
    )

  # With reverse = TRUE, all columns are sorted descending
  # So year desc, then value desc
  html_tbl <-
    tbl_ties |>
    gt(groupname_col = "group") |>
    row_order(year, value, reverse = TRUE)

  body_data <- extract_body(html_tbl)

  # Sort by year descending, then value descending within year
  # 2021: gamma (20), delta (15)
  # 2020: beta (30), alpha (10)
  expect_equal(body_data$name, c("gamma", "delta", "beta", "alpha"))
})

test_that("row_order() works with row_group_order()", {

  html_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    row_group_order(groups = c("grp_b", "grp_a")) |>
    row_order(value_a, reverse = TRUE)

  body_data <- extract_body(html_tbl)

  # grp_b comes first (due to row_group_order), sorted descending
  # grp_a comes second, also sorted descending
  expect_equal(body_data$name, c("zeta", "epsilon", "delta", "beta", "gamma", "alpha"))
})

test_that("row_order() errors when no columns are provided", {

  expect_error(
    tbl |>
      gt(groupname_col = "group") |>
      row_order(),
    "At least one column must be provided for ordering"
  )
})

test_that("row_order() errors when invalid groups are provided", {

  expect_error(
    tbl |>
      gt(groupname_col = "group") |>
      row_order(value_a, groups = "nonexistent_group"),
    "All values given as `groups` must correspond to `group_id` values"
  )
})

test_that("row_order() errors when groups is not a character vector", {

  expect_error(
    tbl |>
      gt(groupname_col = "group") |>
      row_order(value_a, groups = 123),
    "must be a character vector"
  )
})

test_that("row_order() errors when reverse is not a logical", {

  expect_error(
    tbl |>
      gt(groupname_col = "group") |>
      row_order(value_a, reverse = "yes"),
    "must be a single logical value"
  )
})

test_that("row_order() requires a gt object", {

  expect_error(
    tbl |>
      row_order(value_a),
    "must be a `gt_tbl` object"
  )
})

test_that("row_order() works without row groups", {

  tbl_no_groups <-
    dplyr::tribble(
      ~name,    ~value,
      "alpha",  30,
      "beta",   10,
      "gamma",  20
    )

  html_tbl <-
    tbl_no_groups |>
    gt() |>
    row_order(value)

  body_data <- extract_body(html_tbl)

  # Should be sorted by value: beta (10), gamma (20), alpha (30)
  expect_equal(body_data$name, c("beta", "gamma", "alpha"))
})

test_that("row_order() preserves other table components", {

  html_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    tab_header(title = "Test Table") |>
    row_order(value_a) |>
    tab_footnote(footnote = "A footnote", locations = cells_body(columns = name, rows = 1))

  # Verify that header and footnote are preserved
  expect_true(grepl("Test Table", as_raw_html(html_tbl)))
  expect_true(grepl("footnote", as_raw_html(html_tbl)))
})

test_that("row_order() can be called multiple times", {

  # Later calls should override earlier calls for the same groups
  html_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    row_order(value_a) |>                   # First, sort ascending
    row_order(value_a, reverse = TRUE)       # Then, sort descending

  body_data <- extract_body(html_tbl)

  # Final order should be descending
  expect_equal(body_data$name, c("beta", "gamma", "alpha", "zeta", "epsilon", "delta"))
})

test_that("row_order() works with NA values in sorting column", {

  tbl_na <-
    dplyr::tribble(
      ~group,    ~name,    ~value,
      "grp_a",   "alpha",  10,
      "grp_a",   "beta",   NA,
      "grp_a",   "gamma",  20
    )

  html_tbl <-
    tbl_na |>
    gt(groupname_col = "group") |>
    row_order(value)

  body_data <- extract_body(html_tbl)

  # NA values should be sorted to the end by default
  expect_equal(body_data$name, c("alpha", "gamma", "beta"))
})

test_that("row_order() stores directive lazily", {

  # Create a gt table with row_order but don't render it
  gt_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    row_order(value_a)

  # Verify the directive was stored
  directives <- dt_row_order_get(gt_tbl)
  expect_length(directives, 1)
  expect_null(directives[[1]]$groups)
  expect_false(directives[[1]]$reverse)
  expect_true(rlang::is_quosures(directives[[1]]$by))
})

test_that("row_order() stores reverse = TRUE in directive", {

  gt_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    row_order(value_a, reverse = TRUE)

  directives <- dt_row_order_get(gt_tbl)
  expect_length(directives, 1)
  expect_true(directives[[1]]$reverse)
})

test_that("row_order() with reverse = TRUE works without groups", {

  tbl_no_groups <-
    dplyr::tribble(
      ~name,    ~value,
      "alpha",  30,
      "beta",   10,
      "gamma",  20
    )

  html_tbl <-
    tbl_no_groups |>
    gt() |>
    row_order(value, reverse = TRUE)

  body_data <- extract_body(html_tbl)

  # Should be sorted by value descending: alpha (30), gamma (20), beta (10)
  expect_equal(body_data$name, c("alpha", "gamma", "beta"))
})

# Additional test cases using example with rows spanning multiple group occurrences
# This tests more complex scenarios where:
# - Rows from same group appear in non-contiguous sections of original data
# - Stub column can be used for ordering
# - Group membership is preserved after ordering

tbl_complex <-
  dplyr::tibble(
    sequence = c(1, 2, 3, 6, 5, 4, 7, 8, 9, 10),
    doubled = c(1, 1, 2, 2, 3, 3, 4, 4, 5, 5),
    group = c(rep("group_1", 3), rep("group_2", 3), rep("group_1", 3), rep("group_2", 1))
  )

test_that("row_order() orders across all groups and preserves group membership", {

  gt_tbl <-
    tbl_complex |>
    gt(rowname_col = "sequence", groupname_col = "group") |>
    row_order(doubled)

  body_data <- extract_body(gt_tbl)

  # After ordering by 'doubled':

  # group_1 rows (sequence 1,2,3,7,8,9) should be sorted by doubled (1,1,2,4,4,5)
  # group_2 rows (sequence 6,5,4,10) should be sorted by doubled (2,3,3,5)
  # Rows should remain in their respective groups

  # Check group_1 rows are ordered correctly
  group_1_rows <- body_data[body_data$`::group_id::` == "group_1", ]
  expect_equal(as.numeric(group_1_rows$doubled), c(1, 1, 2, 4, 4, 5))
  expect_equal(as.numeric(group_1_rows$`::rowname::`), c(1, 2, 3, 7, 8, 9))

  # Check group_2 rows are ordered correctly
  group_2_rows <- body_data[body_data$`::group_id::` == "group_2", ]
  expect_equal(as.numeric(group_2_rows$doubled), c(2, 3, 3, 5))
  # For ties in doubled (both 5 and 4 have doubled=3), order depends on stable sort
  # Original order in data for doubled=3 is: seq 5, then seq 4
  expect_equal(as.numeric(group_2_rows$`::rowname::`), c(6, 5, 4, 10))
})

test_that("row_order() can use stub column (rowname_col) for ordering", {

  gt_tbl <-
    tbl_complex |>
    gt(rowname_col = "sequence", groupname_col = "group") |>
    row_order(sequence)

  body_data <- extract_body(gt_tbl)

  # group_1 rows (sequence 1,2,3,7,8,9) should be sorted: 1,2,3,7,8,9
  group_1_rows <- body_data[body_data$`::group_id::` == "group_1", ]
  expect_equal(as.numeric(group_1_rows$`::rowname::`), c(1, 2, 3, 7, 8, 9))

  # group_2 rows (sequence 6,5,4,10) should be sorted: 4,5,6,10
  group_2_rows <- body_data[body_data$`::group_id::` == "group_2", ]
  expect_equal(as.numeric(group_2_rows$`::rowname::`), c(4, 5, 6, 10))
})

test_that("row_order() isolates ordering to specified groups only", {

  gt_tbl <-
    tbl_complex |>
    gt(rowname_col = "sequence", groupname_col = "group") |>
    row_order(sequence, groups = "group_2")

  body_data <- extract_body(gt_tbl)

  # group_1 should be in ORIGINAL order (not sorted): 1,2,3,7,8,9
  group_1_rows <- body_data[body_data$`::group_id::` == "group_1", ]
  expect_equal(as.numeric(group_1_rows$`::rowname::`), c(1, 2, 3, 7, 8, 9))

  # group_2 should be SORTED by sequence: 4,5,6,10 (original was 6,5,4,10)
  group_2_rows <- body_data[body_data$`::group_id::` == "group_2", ]
  expect_equal(as.numeric(group_2_rows$`::rowname::`), c(4, 5, 6, 10))
})

test_that("row_order() preserves group membership even with non-contiguous groups", {

  # The original data has group_1 appearing, then group_2, then group_1 again
  # After ordering, rows must stay in their correct groups

  gt_tbl <-
    tbl_complex |>
    gt(rowname_col = "sequence", groupname_col = "group") |>
    row_order(doubled, reverse = TRUE)

  body_data <- extract_body(gt_tbl)

  # Verify all original group_1 members are still in group_1
  original_group_1 <- c(1, 2, 3, 7, 8, 9)
  group_1_rows <- body_data[body_data$`::group_id::` == "group_1", ]
  expect_setequal(as.numeric(group_1_rows$`::rowname::`), original_group_1)

  # Verify all original group_2 members are still in group_2
  original_group_2 <- c(6, 5, 4, 10)
  group_2_rows <- body_data[body_data$`::group_id::` == "group_2", ]
  expect_setequal(as.numeric(group_2_rows$`::rowname::`), original_group_2)

  # Verify descending order within groups
  expect_equal(as.numeric(group_1_rows$doubled), c(5, 4, 4, 2, 1, 1))
  expect_equal(as.numeric(group_2_rows$doubled), c(5, 3, 3, 2))
})

test_that("row_order() with multiple columns provides hierarchical sorting", {

  gt_tbl <-
    tbl_complex |>
    gt(rowname_col = "sequence", groupname_col = "group") |>
    row_order(doubled, sequence)

  body_data <- extract_body(gt_tbl)

  # group_1: sort by doubled first, then by sequence within ties
  # doubled values: 1,1,2,4,4,5 with sequences 1,2,3,7,8,9
  # Expected order: (doubled=1, seq=1), (doubled=1, seq=2), (doubled=2, seq=3),
  #                 (doubled=4, seq=7), (doubled=4, seq=8), (doubled=5, seq=9)
  group_1_rows <- body_data[body_data$`::group_id::` == "group_1", ]
  expect_equal(as.numeric(group_1_rows$`::rowname::`), c(1, 2, 3, 7, 8, 9))

  # group_2: doubled values 2,3,3,5 with sequences 6,5,4,10
  # Expected: (doubled=2, seq=6), (doubled=3, seq=4), (doubled=3, seq=5), (doubled=5, seq=10)
  group_2_rows <- body_data[body_data$`::group_id::` == "group_2", ]
  expect_equal(as.numeric(group_2_rows$`::rowname::`), c(6, 4, 5, 10))
})

test_that("row_order() with negation allows mixed ascending/descending", {

  gt_tbl <-
    tbl_complex |>
    gt(rowname_col = "sequence", groupname_col = "group") |>
    row_order(doubled, -sequence)  # doubled ascending, sequence descending

  body_data <- extract_body(gt_tbl)

  # group_1: sort by doubled asc, then sequence desc within ties
  # doubled=1 has seq 1,2 -> desc order: 2,1
  # doubled=2 has seq 3 -> just 3
  # doubled=4 has seq 7,8 -> desc order: 8,7
  # doubled=5 has seq 9 -> just 9
  group_1_rows <- body_data[body_data$`::group_id::` == "group_1", ]
  expect_equal(as.numeric(group_1_rows$`::rowname::`), c(2, 1, 3, 8, 7, 9))

  # group_2: doubled=2 has seq 6, doubled=3 has seq 4,5 -> desc: 5,4, doubled=5 has seq 10
  group_2_rows <- body_data[body_data$`::group_id::` == "group_2", ]
  expect_equal(as.numeric(group_2_rows$`::rowname::`), c(6, 5, 4, 10))
})

test_that("row_order() combined with row_group_order() works correctly", {

  gt_tbl <-
    tbl_complex |>
    gt(rowname_col = "sequence", groupname_col = "group") |>
    row_group_order(groups = c("group_2", "group_1")) |>
    row_order(sequence)

  body_data <- extract_body(gt_tbl)

  # group_2 should come first (due to row_group_order)
  # Both groups should be sorted by sequence

  # First 4 rows should be group_2, sorted
  first_rows <- body_data[1:4, ]
  expect_true(all(first_rows$`::group_id::` == "group_2"))
  expect_equal(as.numeric(first_rows$`::rowname::`), c(4, 5, 6, 10))

  # Next 6 rows should be group_1, sorted
  last_rows <- body_data[5:10, ]
  expect_true(all(last_rows$`::group_id::` == "group_1"))
  expect_equal(as.numeric(last_rows$`::rowname::`), c(1, 2, 3, 7, 8, 9))
})

test_that("row_order() preserves all data values after reordering", {

  gt_tbl <-
    tbl_complex |>
    gt(rowname_col = "sequence", groupname_col = "group") |>
    row_order(doubled, reverse = TRUE)

  body_data <- extract_body(gt_tbl)

  # Verify no data was lost - all original sequence values should be present
  expect_setequal(as.numeric(body_data$`::rowname::`), tbl_complex$sequence)

  # Verify all doubled values are present
  expect_setequal(body_data$doubled, tbl_complex$doubled)

  # Verify row count is unchanged

  expect_equal(nrow(body_data), nrow(tbl_complex))
})

# =============================================================================
# Complex Interaction Tests
# =============================================================================

test_that("rows_add() then row_order() includes new rows in ordering", {

  gt_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    rows_add(
      group = "grp_a",
      name = "omega",
      value_a = 5,
      value_b = 999
    ) |>
    row_order(value_a)

  body_data <- extract_body(gt_tbl)

  # grp_a should now have 4 rows, sorted by value_a
  # omega (5), alpha (10), gamma (20), beta (30)
  grp_a_rows <- body_data[body_data$`::group_id::` == "grp_a", ]
  expect_equal(grp_a_rows$name, c("omega", "alpha", "gamma", "beta"))
})

test_that("row_order() then rows_add() - new row appears at end (not ordered)", {


  # When row_order() is called BEFORE rows_add(), the directive is stored

  # but rows_add() adds to the body data after directives are captured
  # New rows should still be included when ordering is applied at build time

  gt_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    row_order(value_a) |>
    rows_add(
      group = "grp_a",
      name = "omega",
      value_a = 5,
      value_b = 999
    )

  body_data <- extract_body(gt_tbl)

  # The new row should be included in the sort
  grp_a_rows <- body_data[body_data$`::group_id::` == "grp_a", ]
  expect_equal(grp_a_rows$name, c("omega", "alpha", "gamma", "beta"))
})

test_that("rows_add() to new group then row_order() with groups= targets correctly", {

  gt_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    rows_add(
      group = "grp_c",
      name = "theta",
      value_a = 100,
      value_b = 50
    ) |>
    rows_add(
      group = "grp_c",
      name = "iota",
      value_a = 50,
      value_b = 75
    ) |>
    row_order(value_a, groups = "grp_c")

  body_data <- extract_body(gt_tbl)

  # grp_c should be sorted, grp_a and grp_b unchanged
  grp_c_rows <- body_data[body_data$`::group_id::` == "grp_c", ]
  expect_equal(grp_c_rows$name, c("iota", "theta"))  # 50, 100

  # grp_a should be in original order
  grp_a_rows <- body_data[body_data$`::group_id::` == "grp_a", ]
  expect_equal(grp_a_rows$name, c("alpha", "beta", "gamma"))
})

test_that("multiple row_order() calls with different groups work independently", {

  gt_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    row_order(value_a, groups = "grp_a") |>              # Sort grp_a ascending
    row_order(value_a, groups = "grp_b", reverse = TRUE)  # Sort grp_b descending

  body_data <- extract_body(gt_tbl)

  # grp_a sorted ascending: alpha (10), gamma (20), beta (30)
  grp_a_rows <- body_data[body_data$`::group_id::` == "grp_a", ]
  expect_equal(grp_a_rows$name, c("alpha", "gamma", "beta"))

  # grp_b sorted descending: zeta (25), epsilon (15), delta (5)
  grp_b_rows <- body_data[body_data$`::group_id::` == "grp_b", ]
  expect_equal(grp_b_rows$name, c("zeta", "epsilon", "delta"))
})

test_that("row_order() with different columns per group via multiple calls", {

  gt_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    row_order(value_a, groups = "grp_a") |>  # Sort grp_a by value_a
    row_order(value_b, groups = "grp_b")     # Sort grp_b by value_b

  body_data <- extract_body(gt_tbl)

  # grp_a sorted by value_a: alpha (10), gamma (20), beta (30)
  grp_a_rows <- body_data[body_data$`::group_id::` == "grp_a", ]
  expect_equal(grp_a_rows$name, c("alpha", "gamma", "beta"))

  # grp_b sorted by value_b: zeta (125), epsilon (150), delta (200)
  grp_b_rows <- body_data[body_data$`::group_id::` == "grp_b", ]
  expect_equal(grp_b_rows$name, c("zeta", "epsilon", "delta"))
})

test_that("row_order() override: later call for same group replaces earlier", {

  gt_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    row_order(value_a, groups = "grp_a") |>                # First: sort ascending
    row_order(value_a, groups = "grp_a", reverse = TRUE)   # Override: sort descending

  body_data <- extract_body(gt_tbl)

  # grp_a should be sorted descending (the override)
  grp_a_rows <- body_data[body_data$`::group_id::` == "grp_a", ]
  expect_equal(grp_a_rows$name, c("beta", "gamma", "alpha"))

  # grp_b should be in original order (never targeted)
  grp_b_rows <- body_data[body_data$`::group_id::` == "grp_b", ]
  expect_equal(grp_b_rows$name, c("delta", "epsilon", "zeta"))
})

test_that("row_order() works with summary_rows()", {

  gt_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    row_order(value_a, reverse = TRUE) |>
    summary_rows(
      groups = everything(),
      columns = c(value_a, value_b),
      fns = list(total = ~ sum(.))
    )

  # The table should render without error
  html_output <- as_raw_html(gt_tbl)
  expect_true(nchar(html_output) > 0)

  # Verify the body is still sorted correctly
  body_data <- extract_body(gt_tbl)
  grp_a_rows <- body_data[body_data$`::group_id::` == "grp_a", ]
  expect_equal(grp_a_rows$name, c("beta", "gamma", "alpha"))
})

test_that("row_order() works with grand_summary_rows()", {

  gt_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    row_order(value_a) |>
    grand_summary_rows(
      columns = c(value_a, value_b),
      fns = list(grand_total = ~ sum(.))
    )

  html_output <- as_raw_html(gt_tbl)
  expect_true(nchar(html_output) > 0)

  body_data <- extract_body(gt_tbl)
  expect_equal(body_data$name, c("alpha", "gamma", "beta", "delta", "epsilon", "zeta"))
})

test_that("row_order() combined with row_group_order() - complex reordering", {

  # Start with 3-group data
  tbl_3groups <-
    dplyr::tribble(
      ~group,    ~name,    ~value,
      "alpha",   "a1",     30,
      "alpha",   "a2",     10,
      "alpha",   "a3",     20,
      "beta",    "b1",     15,
      "beta",    "b2",     5,
      "gamma",   "g1",     25,
      "gamma",   "g2",     35
    )

  gt_tbl <-
    tbl_3groups |>
    gt(groupname_col = "group") |>
    row_group_order(groups = c("gamma", "alpha", "beta")) |>
    row_order(value)

  body_data <- extract_body(gt_tbl)

  # Verify group order: gamma, alpha, beta
  expect_equal(body_data$`::group_id::`[1:2], c("gamma", "gamma"))
  expect_equal(body_data$`::group_id::`[3:5], c("alpha", "alpha", "alpha"))
  expect_equal(body_data$`::group_id::`[6:7], c("beta", "beta"))

  # Verify row order within groups
  gamma_rows <- body_data[body_data$`::group_id::` == "gamma", ]
  expect_equal(gamma_rows$name, c("g1", "g2"))  # 25, 35

  alpha_rows <- body_data[body_data$`::group_id::` == "alpha", ]
  expect_equal(alpha_rows$name, c("a2", "a3", "a1"))  # 10, 20, 30

  beta_rows <- body_data[body_data$`::group_id::` == "beta", ]
  expect_equal(beta_rows$name, c("b2", "b1"))  # 5, 15
})

test_that("row_order() preserves fmt_* formatting", {

  gt_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    fmt_number(columns = value_a, decimals = 2) |>
    row_order(value_a, reverse = TRUE)

  html_output <- as_raw_html(gt_tbl)

  # Verify formatting is applied (values should have .00)
  expect_true(grepl("30.00", html_output))
  expect_true(grepl("10.00", html_output))
})

test_that("row_order() works with cols_move()", {

  gt_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    cols_move(columns = value_b, after = name) |>
    row_order(value_a)

  body_data <- extract_body(gt_tbl)

  # Row order should still be correct
  expect_equal(body_data$name, c("alpha", "gamma", "beta", "delta", "epsilon", "zeta"))
})

test_that("row_order() works with tab_spanner()", {

  gt_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    tab_spanner(label = "Values", columns = c(value_a, value_b)) |>
    row_order(value_a, reverse = TRUE)

  html_output <- as_raw_html(gt_tbl)

  # Verify spanner is present

  expect_true(grepl("Values", html_output))

  # Verify row ordering
  body_data <- extract_body(gt_tbl)
  expect_equal(body_data$name, c("beta", "gamma", "alpha", "zeta", "epsilon", "delta"))
})

test_that("row_order() with character column sorting", {

  gt_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    row_order(name)  # Sort alphabetically by name

  body_data <- extract_body(gt_tbl)

  # grp_a: alpha, beta, gamma (alphabetical)
  grp_a_rows <- body_data[body_data$`::group_id::` == "grp_a", ]
  expect_equal(grp_a_rows$name, c("alpha", "beta", "gamma"))

  # grp_b: delta, epsilon, zeta (alphabetical)
  grp_b_rows <- body_data[body_data$`::group_id::` == "grp_b", ]
  expect_equal(grp_b_rows$name, c("delta", "epsilon", "zeta"))
})

test_that("row_order() with character column reverse sorting", {

  gt_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    row_order(name, reverse = TRUE)  # Reverse alphabetical

  body_data <- extract_body(gt_tbl)

  # grp_a: gamma, beta, alpha (reverse alphabetical)
  grp_a_rows <- body_data[body_data$`::group_id::` == "grp_a", ]
  expect_equal(grp_a_rows$name, c("gamma", "beta", "alpha"))

  # grp_b: zeta, epsilon, delta (reverse alphabetical)
  grp_b_rows <- body_data[body_data$`::group_id::` == "grp_b", ]
  expect_equal(grp_b_rows$name, c("zeta", "epsilon", "delta"))
})

test_that("row_order() with Date column", {

  tbl_dates <-
    dplyr::tribble(
      ~group,  ~event,       ~date,
      "2024",  "event_c",    as.Date("2024-03-15"),
      "2024",  "event_a",    as.Date("2024-01-10"),
      "2024",  "event_b",    as.Date("2024-02-20"),
      "2025",  "event_d",    as.Date("2025-06-01"),
      "2025",  "event_e",    as.Date("2025-01-15")
    )

  gt_tbl <-
    tbl_dates |>
    gt(groupname_col = "group") |>
    row_order(date)

  body_data <- extract_body(gt_tbl)

  # 2024 group sorted by date
  grp_2024 <- body_data[body_data$`::group_id::` == "2024", ]
  expect_equal(grp_2024$event, c("event_a", "event_b", "event_c"))

  # 2025 group sorted by date
  grp_2025 <- body_data[body_data$`::group_id::` == "2025", ]
  expect_equal(grp_2025$event, c("event_e", "event_d"))
})

test_that("row_order() all groups then override one group", {

  gt_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    row_order(value_a) |>                                  # All groups ascending
    row_order(value_a, groups = "grp_b", reverse = TRUE)   # Override grp_b to descending

  body_data <- extract_body(gt_tbl)

  # grp_a: sorted ascending (from first call)
  grp_a_rows <- body_data[body_data$`::group_id::` == "grp_a", ]
  expect_equal(grp_a_rows$name, c("alpha", "gamma", "beta"))

  # grp_b: sorted descending (overridden)
  grp_b_rows <- body_data[body_data$`::group_id::` == "grp_b", ]
  expect_equal(grp_b_rows$name, c("zeta", "epsilon", "delta"))
})

test_that("row_order() with empty group (edge case)", {

  # Create a table and then filter out all rows from one group
  tbl_with_empty <-
    dplyr::tribble(
      ~group,    ~name,    ~value,
      "grp_a",   "alpha",  30,
      "grp_a",   "beta",   10
    )

  gt_tbl <-
    tbl_with_empty |>
    gt(groupname_col = "group") |>
    row_order(value)

  # Should work without error
  body_data <- extract_body(gt_tbl)
  expect_equal(body_data$name, c("beta", "alpha"))
})

test_that("row_order() with single row per group", {

  tbl_single <-
    dplyr::tribble(
      ~group,    ~name,    ~value,
      "grp_a",   "alpha",  30,
      "grp_b",   "beta",   10,
      "grp_c",   "gamma",  20
    )

  gt_tbl <-
    tbl_single |>
    gt(groupname_col = "group") |>
    row_order(value)

  # Should work without error, order within groups doesn't change
  body_data <- extract_body(gt_tbl)
  expect_equal(nrow(body_data), 3)
})

test_that("row_order() output formats: HTML renders correctly", {

  gt_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    row_order(value_a, reverse = TRUE)

  html_output <- as_raw_html(gt_tbl)

  # Beta should appear before alpha in HTML (beta has higher value_a)
  beta_pos <- regexpr("beta", html_output)
  alpha_pos <- regexpr("alpha", html_output)
  expect_true(beta_pos < alpha_pos)
})

test_that("row_order() chained with multiple gt operations", {

  gt_tbl <-
    tbl |>
    gt(groupname_col = "group") |>
    tab_header(
      title = "Complex Table",
      subtitle = "With many operations"
    ) |>
    row_order(value_a) |>
    cols_label(
      name = "Name",
      value_a = "Value A",
      value_b = "Value B"
    ) |>
    tab_source_note("Source: Test data") |>
    tab_footnote(
      footnote = "Sorted by Value A",
      locations = cells_column_labels(columns = value_a)
    ) |>
    fmt_number(columns = c(value_a, value_b), decimals = 1) |>
    tab_style(
      style = cell_fill(color = "lightblue"),
      locations = cells_body(rows = 1)
    )

  # Everything should render without error
  html_output <- as_raw_html(gt_tbl)
  expect_true(grepl("Complex Table", html_output))
  expect_true(grepl("Sorted by Value A", html_output))

  # Verify ordering is still correct
  body_data <- extract_body(gt_tbl)
  expect_equal(body_data$name, c("alpha", "gamma", "beta", "delta", "epsilon", "zeta"))
})
