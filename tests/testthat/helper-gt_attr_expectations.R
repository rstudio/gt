expect_tab_colnames <- function(tab,
                                df,
                                rowname = "NA",
                                groupname_is_na = TRUE) {

  if (rowname == "NA") {

    # Expect that the `rowname` column of the `stub_df`
    # object is entirely filled with NAs
    expect_true(
      all(is.na(attr(tab, "stub_df")[["rowname"]])))

  } else if (rowname == "col"){

    # Expect that the `rowname` column of the `stub_df`
    # object is entirely filled with NAs
    expect_equal(
      attr(tab, "stub_df")[["rowname"]],
      df$rowname)

  } else if (rowname == "data_frame") {

    expect_equal(
      attr(tab, "stub_df")[["rowname"]],
      row.names(df))
  }

  if (groupname_is_na) {

    # Expect that the `groupname` column of the `stub_df`
    # object is entirely filled with NAs
    expect_true(
      all(is.na(attr(tab, "stub_df")[["groupname"]])))

  } else {

    # Expect that the values from the `groupname` column in
    # the original dataset populate the `groupname` column
    # of the `stub_df` object
    expect_equal(
      attr(tab, "stub_df")[["groupname"]],
      df[["groupname"]])
  }
}

expect_tab <- function(tab,
                       df,
                       has_rownames = FALSE,
                       has_groupnames = FALSE) {

  # Expect that the object has the correct classes
  expect_s3_class(tab, "gt_tbl")
  expect_s3_class(tab, "data.frame")

  # Expect certain named attributes
  expect_gt_attr_names(tab)

  # Expect that the attribute obejcts are of certain classes
  expect_s3_class(attr(tab, "boxh_df"), "data.frame")
  expect_s3_class(attr(tab, "stub_df"), "data.frame")
  expect_s3_class(attr(tab, "footnotes_df"), "data.frame")
  expect_s3_class(attr(tab, "styles_df"), "data.frame")
  expect_s3_class(attr(tab, "rows_df"), "data.frame")
  expect_s3_class(attr(tab, "cols_df"), "data.frame")
  expect_s3_class(attr(tab, "opts_df"), "data.frame")
  expect_type(attr(tab, "col_labels"), "list")
  expect_type(attr(tab, "grp_labels"), "list")
  expect_type(attr(tab, "arrange_groups"), "list")
  expect_type(attr(tab, "formats"), "list")

  # Expect that the attribute objects are of the
  # correct dimensions

  final_df <- df

  if (has_rownames) {
    final_df$rowname <- NULL
  }

  if (has_groupnames) {
    final_df$groupname <- NULL
  }

  expect_equal(dim(attr(tab, "boxh_df")), c(3, ncol(final_df)))
  expect_equal(dim(attr(tab, "stub_df")), c(nrow(df), 2))
  expect_equal(dim(attr(tab, "footnotes_df")), c(0, 6))
  expect_equal(dim(attr(tab, "styles_df")), c(0, 6))
  expect_equal(dim(attr(tab, "rows_df")), c(nrow(df), 1))
  expect_equal(dim(attr(tab, "cols_df")), c(ncol(final_df), 1))
  expect_equal(ncol(attr(tab, "opts_df")), 4)
  expect_equal(length(attr(tab, "formats")), 0)
  expect_equal(length(attr(tab, "arrange_groups")), 1)

  # Expect that extracted df has the same column
  # names as the original dataset
  expect_equal(
    tab %>% as.data.frame() %>% colnames(),
    colnames(final_df))

  # Expect that extracted df has the same column
  # classes as the original dataset
  expect_equal(
    tab %>% as.data.frame() %>% sapply(class) %>% as.character(),
    final_df %>% as.data.frame() %>% sapply(class) %>% as.character())

  # Expect that extracted df has the same number of
  # rows as the original dataset
  expect_equal(
    tab %>% as.data.frame() %>% nrow(),
    nrow(df))

  # Expect that the column names of the `stub_df` object
  # are `groupname` and `rowname`
  expect_equal(
    colnames(attr(tab, "stub_df")),
    c("groupname", "rowname"))

  # Expect that the column names of the `boxh_df` object
  # are the same as those of the original dataset
  expect_equal(
    colnames(attr(tab, "boxh_df")),
    colnames(final_df))
}

expect_attr_equal <- function(data, attr_val, y) {
  attr(data, attr_val, exact = TRUE) %>%
    unlist() %>%
    unname() %>%
    expect_equal(y)
}

gt_attr_names <- function() {

  c("names", "row.names", "class",
    "boxh_df", "stub_df", "footnotes_df", "styles_df",
    "rows_df", "cols_df", "col_labels", "grp_labels",
    "arrange_groups", "data_df", "opts_df",
    "formats", "transforms")
}

expect_gt_attr_names <- function(object) {

  expect_equal(
    sort(names(attributes(object))),
    sort(gt_attr_names())
  )
}
