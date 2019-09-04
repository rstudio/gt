expect_tab_colnames <- function(tab,
                                df,
                                rowname = "NA",
                                groupname_is_na = TRUE) {

  if (rowname == "NA") {

    # Expect that the `rowname` column of the `stub_df`
    # object is entirely filled with NAs
    expect_true(
      all(is.na(dt_stub_get(data = tab)[["rowname"]])))

  } else if (rowname == "col"){

    # Expect that the `rowname` column of the `stub_df`
    # object is entirely filled with NAs
    expect_equal(
      dt_stub_get(data = tab)[["rowname"]],
      df$rowname)

  } else if (rowname == "tibble") {

    expect_equal(
      dt_stub_get(data = tab)[["rowname"]],
      row.names(df))
  }

  if (groupname_is_na) {

    # Expect that the `groupname` column of the `stub_df`
    # object is entirely filled with NAs
    expect_true(
      all(is.na(dt_stub_get(data = tab)[["groupname"]])))

  } else {

    # Expect that the values from the `groupname` column in
    # the original dataset populate the `groupname` column
    # of the `stub_df` object
    expect_equal(
      dt_stub_get(data = tab)[["groupname"]],
      df[["groupname"]])
  }
}

expect_tab <- function(tab,
                       df) {

  # Expect that the object has the correct classes
  expect_s3_class(tab, "gt_tbl")
  expect_s3_class(tab, "data.frame")

  # Expect certain named attributes
  expect_gt_attr_names(object = tab)

  # Expect that the attribute obejcts are of certain classes
  expect_s3_class(dt_boxhead_get(data = tab), "data.frame")
  expect_s3_class(dt_stub_get(data = tab), "data.frame")
  expect_s3_class(dt_footnotes_get(data = tab), "data.frame")
  expect_s3_class(dt_styles_get(data = tab), "data.frame")
  expect_s3_class(dt_options_get(data = tab), "data.frame")
  expect_type(dt_arrange_groups_get(data = tab), "list")
  expect_type(dt_formats_get(data = tab), "list")

  dt_boxhead_get(data = tab) %>%
    dim() %>%
    expect_equal(c(ncol(df), 6))

  dt_stub_get(data = tab) %>%
    dim() %>%
    expect_equal(c(nrow(df), 3))

  dt_footnotes_get(data = tab) %>%
    dim() %>%
    expect_equal(c(0, 7))

  dt_styles_get(data = tab) %>%
    dim() %>%
    expect_equal(c(0, 7))

  dt_options_get(data = tab) %>%
    dim() %>%
    expect_equal(c(73, 5))

  dt_formats_get(data = tab) %>%
    length() %>%
    expect_equal(0)

  dt_arrange_groups_get(data = tab) %>%
    length() %>%
    expect_equal(1)

  # Expect that extracted df has the same column
  # names as the original dataset
  expect_equal(
    tab %>% as.data.frame() %>% colnames(),
    colnames(df))

  # Expect that extracted df has the same column
  # classes as the original dataset
  expect_equal(
    tab %>% as.data.frame() %>% sapply(class) %>% as.character(),
    df %>% as.data.frame() %>% sapply(class) %>% as.character()
  )

  # Expect that extracted df has the same number of
  # rows as the original dataset
  expect_equal(
    tab %>% as.data.frame() %>% nrow(),
    nrow(df)
  )

  # Expect that the column names of the `stub_df` object
  # are `rownum_i`, `groupname`, and `rowname`
  expect_equal(
    colnames(dt_stub_get(data = tab)),
    c("rownum_i", "groupname", "rowname")
  )

  # Expect that the column names of the `boxh_df` object
  # are the same as those of the original dataset
  dt_boxhead_get(data = tab) %>%
    dplyr::pull(var) %>%
    expect_equal(colnames(df))
}

expect_attr_equal <- function(data, attr_val, y) {

  attr(data, attr_val, exact = TRUE) %>%
    unlist() %>%
    unname() %>%
    expect_equal(y)
}

gt_attr_names <- function() {

  c(
    "names", "class", "row.names", "_data", "_body", "_boxhead", "_stub",
    "_heading", "_spanners", "_stubhead", "_footnotes", "_source_notes",
    "_formats", "_styles", "_summary", "_options", "_arrange_groups"
  )
}

expect_gt_attr_names <- function(object) {

  expect_equal(
    sort(names(attributes(object)) %>% base::setdiff("groups")),
    sort(gt_attr_names())
  )
}
