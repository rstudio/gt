expect_tab_colnames <- function(tab,
                                df,
                                rowname = "NA",
                                groupname_is_na = TRUE) {

  if (rowname == "NA") {

    # Expect that the `rowname` column of the `stub_df`
    # object is entirely filled with NAs
    expect_true(
      all(is.na(dt_stub_df_get(data = tab)[["rowname"]]))
    )

  } else if (rowname == "col"){

    # Expect that the `rowname` column of the `stub_df`
    # object is entirely filled with NAs
    expect_equal(
      dt_stub_df_get(data = tab)[["rowname"]],
      df$rowname
    )

  } else if (rowname == "tibble") {

    expect_equal(
      dt_stub_df_get(data = tab)[["rowname"]],
      row.names(df)
    )
  }

  if (groupname_is_na) {

    # Expect that the `groupname` column of the `stub_df`
    # object is entirely filled with NAs
    expect_true(
      all(is.na(dt_stub_df_get(data = tab)[["groupname"]]))
    )
  }
}

expect_tab <- function(tab,
                       df) {

  # Expect that the object has the correct classes
  expect_s3_class(tab, "gt_tbl")
  expect_type(tab, "list")

  # Expect certain named attributes
  expect_gt_attr_names(object = tab)

  # Expect that the attribute obejcts are of certain classes
  expect_s3_class(dt_boxhead_get(data = tab), "data.frame")
  expect_type(dt_stub_df_get(data = tab), "list")
  expect_type(dt_row_groups_get(data = tab), "character")
  expect_type(dt_stub_others_get(data = tab), "character")
  expect_s3_class(dt_stub_df_get(data = tab), "data.frame")
  expect_type(dt_heading_get(data = tab), "list")
  expect_s3_class(dt_spanners_get(data = tab), "data.frame")
  expect_type(dt_stubhead_get(data = tab), "list")
  expect_s3_class(dt_footnotes_get(data = tab), "data.frame")
  expect_type(dt_source_notes_get(data = tab), "list")
  expect_type(dt_formats_get(data = tab), "list")
  expect_s3_class(dt_styles_get(data = tab), "data.frame")
  expect_s3_class(dt_options_get(data = tab), "data.frame")
  expect_type(dt_transforms_get(data = tab), "list")

  (dt_boxhead_get(data = tab) %>%
    dim())[2] %>%
    expect_equal(6)

  dt_stub_df_get(data = tab) %>%
    dim() %>%
    expect_equal(c(nrow(df), 3))

  dt_heading_get(data = tab) %>%
    length() %>%
    expect_equal(2)

  dt_spanners_get(data = tab) %>%
    dim() %>%
    expect_equal(c(0, 4))

  dt_stubhead_get(data = tab) %>%
    length() %>%
    expect_equal(1)

  dt_footnotes_get(data = tab) %>%
    dim() %>%
    expect_equal(c(0, 7))

  dt_source_notes_get(data = tab) %>%
    length() %>%
    expect_equal(0)

  dt_formats_get(data = tab) %>%
    length() %>%
    expect_equal(0)

  dt_styles_get(data = tab) %>%
    dim() %>%
    expect_equal(c(0, 7))

  dt_options_get(data = tab) %>%
    dim() %>%
    expect_equal(c(133, 5))

  dt_transforms_get(data = tab) %>%
    length() %>%
    expect_equal(0)

  # Expect that extracted df has the same column
  # names as the original dataset
  ((tab %>% dt_data_get() %>% colnames() %>% length()) -
      (colnames(df) %>% length())) %in% c(0, 1) %>%
    expect_true()

  # Expect that extracted df has the same number of
  # rows as the original dataset
  expect_equal(
    tab %>% dt_data_get() %>% nrow(),
    nrow(df)
  )

  # Expect that the column names of the `stub_df` object
  # are `rownum_i`, `groupname`, and `rowname`
  expect_equal(
    colnames(dt_stub_df_get(data = tab)),
    c("rownum_i", "groupname", "rowname")
  )
}

expect_attr_equal <- function(data, attr_val, y) {

  obj <- dt__get(data = data, key = attr_val)

  obj %>%
    unlist() %>%
    unname() %>%
    expect_equal(y)
}

gt_attr_names <- function() {

  c(
    "_data", "_boxhead",
    "_stub_df", "_row_groups", "_stub_others",
    "_heading", "_spanners", "_stubhead",
    "_footnotes", "_source_notes", "_formats", "_styles",
    "_summary", "_options", "_transforms", "_has_built"
  )
}

expect_gt_attr_names <- function(object) {

  # The `groups` attribute appears when we call dplyr::group_by()
  # on the input table
  expect_equal(
    sort(names(object)),
    sort(gt_attr_names())
  )
}
