test_that("row_group_order() works correctly for LaTeX output tables", {

  # Create a table with group names, rownames, and four columns of values
  tbl <-
    dplyr::tribble(
      ~dates,        ~rowname, ~col_1, ~col_2, ~col_3, ~col_4,
      "2018-02-10",  "1",       767.6,  928.1,  382.0,  674.5,
      "2018-02-10",  "2",       403.3,  461.5,   15.1,  242.8,
      "2018-02-10",  "3",       686.4,   54.1,  282.7,   56.3,
      "2018-02-10",  "4",       662.6,  148.8,  984.6,  928.1,
      "2018-02-11",  "5",       198.5,   65.1,  127.4,  219.3,
      "2018-02-11",  "6",       132.1,  118.1,   91.2,  874.3,
      "2018-02-11",  "7",       349.7,  307.1,  566.7,  542.9,
      "2018-02-11",  "8",        63.7,  504.3,  152.0,  724.5,
      "2018-02-11",  "9",       105.4,  729.8,  962.4,  336.4,
      "2018-02-11",  "10",      924.2,  424.6,  740.8,  104.2
    )

  # Create a `tbl_latex` object that arranges the groups by the
  # latter calendar date first
  tbl_latex <-
    tbl |>
    gt(groupname_col = "dates") |>
    row_group_order(groups = c("2018-02-11", "2018-02-10"))

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    paste0(
      ".*multicolumn\\{5\\}\\{l\\}\\{2018-02-11\\}",
      ".*multicolumn\\{5\\}\\{l\\}\\{2018-02-10\\}.*"
    )
  )
})
