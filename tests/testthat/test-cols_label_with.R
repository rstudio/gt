# Create a table with four columns of values
tbl <-
  dplyr::tribble(
    ~col_1, ~col_2, ~col_3, ~col_4,
    767.6,  928.1,  382.0,  674.5,
    403.3,  461.5,   15.1,  242.8,
    686.4,   54.1,  282.7,   56.3,
    662.6,  148.8,  984.6,  928.1,
    198.5,   65.1,  127.4,  219.3,
    132.1,  118.1,   91.2,  874.3,
    349.7,  307.1,  566.7,  542.9,
    63.7,   504.3,  152.0,  724.5,
    105.4,  729.8,  962.4,  336.4,
    924.2,  424.6,  740.8,  104.2
  )

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
}

test_that("cols_label_with() works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create the `tbl_html_1` object with `gt()` and label all of the columns
  tbl_html_1 <-
    gt(tbl) |>
    cols_label(
      col_1 = "col_a",
      col_2 = "col_b"
    ) |>
    cols_label_with(
      fn = ~ gsub(x = ., pattern = "3", replacement = "c")
    )  |>
    cols_label_with(
      fn = function(x) gsub(x = x, pattern = "4", replacement = "d")
    )

  # Expect that the values for the column labels are set
  # correctly in `col_labels`
  expect_equal(
    unlist(tbl_html_1$`_boxhead`$column_label),
    c("col_a", "col_b", "col_c", "col_d")
  )

  # Expect that the column labels are set
  tbl_html_1 |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']") |>
    expect_equal(c("col_a", "col_b", "col_c", "col_d"))

  # Create the `tbl_html_2` object with `gt()` and label all of the columns with
  # multiple instances of labeling
  tbl_html_2 <-
    gt(tbl) |>
    cols_label(
      col_1 = "col_a",
      col_2 = "col_b"
    ) |>
    cols_label_with(
      fn = ~ gsub(x = ., pattern = "3", replacement = "c")
    )  |>
    cols_label_with(
      fn = function(x) gsub(x = x, pattern = "4", replacement = "d")
    ) |>
    cols_label_with(
      fn = ~ gsub(x = ., pattern = "c", replacement = "3")
    )  |>
    cols_label_with(
      fn = function(x) gsub(x = x, pattern = "d", replacement = "4")
    ) |>
    cols_label_with(
      fn = ~ gsub(x = ., pattern = "3", replacement = "c")
    )  |>
    cols_label_with(
      fn = function(x) gsub(x = x, pattern = "4", replacement = "d")
    )

  # Expect that `tbl_html_2` has the same column labels as `tbl_html_1`
  expect_equal(
    render_as_html(tbl_html_1),
    render_as_html(tbl_html_2)
  )

  # Create the `tbl_html_3` object with `gt()` and label none
  # of the columns (return their labels)
  tbl_html_3 <-
    gt(tbl) |>
    cols_label_with(fn = function(x) x)

  # Expect the original column names for `tbl` as values for
  # the column keys and for the column labels
  box3 <- tbl_html_3$`_boxhead`

  expect_equal(
    unlist(box3$var),
    colnames(tbl)
  )

  expect_equal(
    unlist(box3$column_label),
    colnames(tbl)
  )

  # Expect that the column labels are set as the column names
  expect_equal(
    tbl_html_3 |>
      render_as_html() |>
      xml2::read_html() |>
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']"),
    c("col_1", "col_2", "col_3", "col_4")
  )

  # Create the `tbl_html_4` object and embolden a column label with a
  # double pass of:
  # (1) applying Markdown symbols through `paste0()`
  # (2) applying the `md()` helper function
  tbl_html_4 <-
    gt(tbl) |>
    cols_label_with(
      columns = col_1,
      fn = ~ paste0("**", ., "**")
    ) |>
    cols_label_with(
      columns = col_1,
      fn = md
    )

  # Expect to find that rendered column label for `col_1` has the <strong>
  # tag applied
  expect_match(
     render_as_html(tbl_html_4),
    "<strong>col_1</strong>"
  )

  # Create the `tbl_html_5` object and embolden a column label with a
  # single pass of:
  # (1) applying Markdown symbols through `paste0()`
  # (2) applying the `md()` helper function
  tbl_html_5 <-
    gt(tbl) |>
    cols_label_with(
      columns = col_1,
      fn = ~ md(paste0("**", ., "**"))
    )

  # Expect that `tbl_html_5` has the same column labels as `tbl_html_4`
  expect_equal(
    render_as_html(tbl_html_4),
    render_as_html(tbl_html_5)
  )

  #
  # Ensure that new labels are applied to columns correctly, no matter how
  # the column resolution occurs
  #

  towny_gt_tbl <-
    towny |>
    dplyr::slice_max(population_2021, n = 5) |>
    dplyr::select(name, latitude, longitude, ends_with("2016"), ends_with("2021")) |>
    gt() |>
    tab_spanner(columns = starts_with("pop"), label = "Population") |>
    tab_spanner(columns = starts_with("den"), label = "Density")

  expect_equal(
    towny_gt_tbl |>
      cols_label_with(
        fn = function(x) gsub(".*_(.*)", "\\1", x)
      ) |>
      render_as_html() |>
      xml2::read_html() |>
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']"),
    towny_gt_tbl |>
      cols_label_with(
        columns = c(population_2016, population_2021, density_2016, density_2021),
        fn = function(x) gsub(".*_(.*)", "\\1", x)
      ) |>
      render_as_html() |>
      xml2::read_html() |>
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']")
  )

  expect_equal(
    towny_gt_tbl |>
      cols_label_with(
        fn = function(x) gsub(".*_(.*)", "\\1", x)
      ) |>
      render_as_html() |>
      xml2::read_html() |>
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']"),
    towny_gt_tbl |>
      cols_label_with(
        columns =  c(population_2016, density_2016, population_2021, density_2021),
        fn = function(x) gsub(".*_(.*)", "\\1", x)
      ) |>
      render_as_html() |>
      xml2::read_html() |>
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']")
  )

  expect_equal(
    towny_gt_tbl |>
      cols_label_with(
        fn = function(x) gsub(".*_(.*)", "\\1", x)
      ) |>
      render_as_html() |>
      xml2::read_html() |>
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']"),
    towny_gt_tbl |>
      cols_label_with(
        columns = c(starts_with("pop"), starts_with("den")),
        fn = function(x) gsub(".*_(.*)", "\\1", x)
      ) |>
      render_as_html() |>
      xml2::read_html() |>
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']")
  )

  expect_equal(
    towny_gt_tbl |>
      cols_label_with(
        fn = function(x) gsub(".*_(.*)", "\\1", x)
      ) |>
      render_as_html() |>
      xml2::read_html() |>
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']"),
    towny_gt_tbl |>
      cols_label_with(
        columns = c(starts_with("den"), starts_with("pop")),
        fn = function(x) gsub(".*_(.*)", "\\1", x)
      ) |>
      render_as_html() |>
      xml2::read_html() |>
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']")
  )

  # Expect an error if `fn` is missing
  expect_error(gt(tbl) |> cols_label_with(fn = NULL))

  # Expect an error if any columns declared are not present
  expect_error(gt(tbl) |> cols_label_with(columns = col_a, fn = function(x) "col_1"))
})

test_that("check cols_label_with is applied gt_group", {

  # Create a `gt_group` object of two `gt_tbl`s
  # create gt group example
  gt_tbl <- gt(mtcars_short)
  gt_group <- gt_group(gt_tbl, gt_tbl)

  # apply label to table and group
  label_gt_tbl <-
    gt_tbl |>
    cols_label_with(
      fn = ~ gsub("a", "A", .)
    )

  label_gt_group <-
    gt_group |>
    cols_label_with(
      fn = ~ gsub("a", "A", .)
    )

  # Expect identical if function applied before or after group is constructed
  expect_identical(label_gt_group, gt_group(label_gt_tbl, label_gt_tbl))
})
