expect_tab_colnames <- function(
    tab,
    df,
    rowname = "NA",
    groupname_is_na = TRUE
) {

  if (rowname == "NA") {

    # Expect that the `row_id` column of the `stub_df`
    # object is entirely filled with NAs
    expect_true(
      all(is.na(dt_stub_df_get(data = tab)[["row_id"]]))
    )

  } else if (rowname == "col") {

    # Expect that the `row_id` column of the `stub_df`
    # object is entirely filled with NAs
    expect_equal(
      dt_stub_df_get(data = tab)[["row_id"]],
      df$rowname
    )

  } else if (rowname == "tibble") {

    expect_equal(
      dt_stub_df_get(data = tab)[["row_id"]],
      row.names(df)
    )
  }

  if (groupname_is_na) {

    # Expect that the `group_id` column of the `stub_df`
    # object is entirely filled with NAs
    expect_true(
      all(is.na(dt_stub_df_get(data = tab)[["group_id"]]))
    )
  }
}

expect_tab <- function(tab, df) {

  # Expect that the object has the correct classes
  expect_s3_class(tab, "gt_tbl")
  expect_type(tab, "list")

  # Expect certain named attributes
  expect_gt_attr_names(object = tab)

  # Validate attributes classes
  expect_s3_class(dt_boxhead_get(data = tab), "data.frame")
  expect_type(dt_stub_df_get(data = tab), "list")
  expect_type(dt_row_groups_get(data = tab), "character")
  expect_s3_class(dt_stub_df_get(data = tab), "data.frame")
  expect_type(dt_heading_get(data = tab), "list")
  expect_s3_class(dt_spanners_get(data = tab), "data.frame")
  expect_type(dt_stubhead_get(data = tab), "list")
  expect_s3_class(dt_footnotes_get(data = tab), "data.frame")
  expect_type(dt_source_notes_get(data = tab), "list")
  expect_type(dt_formats_get(data = tab), "list")
  expect_type(dt_substitutions_get(data = tab), "list")
  expect_s3_class(dt_styles_get(data = tab), "data.frame")
  expect_s3_class(dt_options_get(data = tab), "data.frame")
  expect_type(dt_transforms_get(data = tab), "list")

  # Validate attributes dimensions
  expect_equal(ncol(dt_boxhead_get(data = tab)), 8)
  expect_equal(dim(dt_stub_df_get(data = tab)), c(nrow(df), 6))
  expect_length(dt_heading_get(data = tab), 3)
  expect_equal(dim(dt_spanners_get(data = tab)), c(0, 8))
  expect_length(dt_stubhead_get(data = tab), 1)
  expect_equal(dim(dt_footnotes_get(data = tab)), c(0, 8))
  expect_length(dt_source_notes_get(data = tab), 0)
  expect_length(dt_formats_get(data = tab), 0)
  expect_length(dt_substitutions_get(data = tab), 0)
  expect_equal(dim(dt_styles_get(data = tab)), c(0, 7))
  # If adding a new option to tab_options(), update here
  expect_equal(dim(dt_options_get(data = tab)), c(199, 5))
  expect_length(dt_transforms_get(data = tab), 0)

  # Expect that extracted df has the same column
  # names as the original dataset (or a difference of 1)
  expect_in(
    ncol(dt_data_get(tab)) - ncol(df),
    c(0, 1)
  )

  # Expect that extracted df has the same number of
  # rows as the original dataset
  expect_equal(
    nrow(dt_data_get(tab)),
    nrow(df)
  )

  # Expect specific column names within the `stub_df` object
  expect_named(
    dt_stub_df_get(data = tab),
    c(
      "rownum_i", "row_id", "group_id", "group_label",
      "indent", "built_group_label"
    )
  )
}

expect_attr_equal <- function(data, attr_val, y) {

  obj <- dt__get(data = data, key = attr_val)

  expect_equal(unlist(obj), y, ignore_attr = "names")
}

gt_attr_names <- function() {

  c(
    "_data", "_boxhead",
    "_stub_df", "_row_groups", "_row_order",
    "_heading", "_spanners", "_stubhead",
    "_footnotes", "_source_notes", "_formats", "_substitutions", "_styles",
    "_summary", "_summary_cols", "_summary_cols_build",
    "_options", "_transforms", "_locale", "_has_built"
  )
}

expect_gt_attr_names <- function(object) {

  # The `groups` attribute appears when we call dplyr::group_by()
  # on the input table
  expect_setequal(
    names(object),
    gt_attr_names()
  )
}
