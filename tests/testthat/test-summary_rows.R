# Create a table based on `sp500`, with group names, rownames,
# and four columns of values
tbl <-
  sp500 |>
  dplyr::filter(
    date >= "2015-01-05",
    date <= "2015-01-16"
  ) |>
  dplyr::arrange(date) |>
  dplyr::mutate(
    week = paste0(
      "W", strftime(date, format = "%V"))
  ) |>
  dplyr::select(-adj_close, -volume) |>
  gt(
    rowname_col = "date",
    groupname_col = "week"
  ) |>
  tab_options(latex.use_longtable = TRUE)

test_that("summary_rows() can make group-wise summaries", {

  # Create a table with summary rows for the `W02` group;
  # the 3 summary rows for this group represent the mean, sum,
  # and standard deviation of all numeric columns
  gt_tbl <-
    tbl |>
    summary_rows(
      groups = "W02",
      columns = c(open, high, low, close),
      fns = list(
        average = ~ mean(., na.rm = TRUE),
        total = ~ sum(., na.rm = TRUE),
        `std dev` = ~ sd(., na.rm = TRUE)
      )
    )

  # Extract the internal `summary` object
  summary <- dt_summary_get(data = gt_tbl)

  # Expect that the summary has the expected structure
  expect_summary(summary, length = 1, type = "summary")

  # Expect the `groups` provided in `summary[[1]]$groups`
  expect_equal(summary[[1]]$groups, "W02")

  # Expect the `columns` provided in `summary[[1]]$columns`
  expect_equal(summary[[1]]$columns, c("open", "high", "low", "close"))

  # Expect that the components of `summary[[1]]$fns` are lists
  expect_type(summary[[1]]$fns$average, "list")
  expect_type(summary[[1]]$fns$total, "list")
  expect_type(summary[[1]]$fns$`std dev`, "list")

  # Create a table with summary rows for the `W02` group;
  # the 3 summary rows for this group represent the mean, sum,
  # and standard deviation of only the `open` column
  gt_tbl <-
    tbl |>
    summary_rows(
      groups = "W02",
      columns = open,
      fns = list(
        average = ~ mean(., na.rm = TRUE),
        total = ~ sum(., na.rm = TRUE),
        `std dev` = ~ sd(., na.rm = TRUE)
      )
    )

  # Extract the internal `summary` object
  summary <- dt_summary_get(data = gt_tbl)

  # Expect that the summary has the expected structure
  expect_summary(summary, length = 1, type = "summary")

  # Expect the `groups` provided in `summary[[1]]$groups`
  expect_equal(summary[[1]]$groups, "W02")

  # Expect the `columns` provided in `summary[[1]]$columns`
  expect_equal(summary[[1]]$columns, "open")

  # Expect that `summary[[1]]$fns` is a `list` object
  expect_type(summary[[1]]$fns, "list")

  # Expect that the components of `summary[[1]]$fns` are lists
  expect_type(summary[[1]]$fns$average, "list")
  expect_type(summary[[1]]$fns$total, "list")
  expect_type(summary[[1]]$fns$`std dev`, "list")

  # Create a table with summary rows for the `W02` and `W03`
  # groups; the 3 summary rows for these groups represent the mean,
  # sum, and standard deviation of only the `open` column
  gt_tbl <-
    tbl |>
    summary_rows(
      groups = c("W02", "W03"),
      columns = open,
      fns = list(
        average = ~ mean(., na.rm = TRUE),
        total = ~ sum(., na.rm = TRUE),
        `std dev` = ~ sd(., na.rm = TRUE)
      )
    )

  # Extract the internal `summary` object
  summary <- dt_summary_get(data = gt_tbl)

  # Expect that the summary has the expected structure
  expect_summary(summary, length = 1, type = "summary")

  # Expect the `groups` provided in `summary[[1]]$groups`
  expect_equal(summary[[1]]$groups, c("W02", "W03"))

  # Expect the `columns` provided in `summary[[1]]$columns`
  expect_equal(summary[[1]]$columns, "open")

  # Expect that the components of `summary[[1]]$fns` are lists
  expect_type(summary[[1]]$fns$average , "list")
  expect_type(summary[[1]]$fns$total, "list")
  expect_type(summary[[1]]$fns$`std dev`, "list")

  # Create a table with summary rows for the `W02` and `W03`
  # groups; the 3 summary rows for these groups represent the mean,
  # sum, and standard deviation of only the `open` column
  gt_tbl <-
    tbl |>
    summary_rows(
      groups = everything(),
      columns = open,
      fns = list(
        average = ~ mean(., na.rm = TRUE),
        total = ~ sum(., na.rm = TRUE),
        `std dev` = ~ sd(., na.rm = TRUE)
      )
    )

  # Extract the internal `summary` object
  summary <- dt_summary_get(data = gt_tbl)
  # Expect that the summary has the expected structure
  expect_summary(summary, length = 1, type = "summary")

  # Expect the `groups` provided in `summary[[1]]$groups`
  # to resolve to both groups
  expect_equal(summary[[1]]$groups, c("W02", "W03"))

  # Expect the `columns` provided in `summary[[1]]$columns`
  expect_equal(summary[[1]]$columns, "open")

  # Expect that the components of `summary[[1]]$fns` are lists
  expect_type(summary[[1]]$fns$average, "list")
  expect_type(summary[[1]]$fns$total, "list")
  expect_type(summary[[1]]$fns$`std dev`, "list")

  # Create a table with two sets of summary rows for all groups
  # and all columns
  gt_tbl <-
    tbl |>
    summary_rows(
      groups = everything(),
      columns = c(open, high, low, close),
      fns = list(
        average = ~ mean(., na.rm = TRUE),
        total = ~ sum(., na.rm = TRUE),
        `std dev` = ~ sd(., na.rm = TRUE)
      )
    ) |>
    summary_rows(
      groups = everything(),
      columns = c(open, high, low, close),
      fns = list(
        max = ~ max(., na.rm = TRUE)
      )
    )

  # Extract the internal `summary` object
  summary <- dt_summary_get(data = gt_tbl)

  # Expect that the summary has the expected structure
  # Expect that the internal `summary` list
  # object has a length of `2` since there
  # were two calls of `summary_rows()`
  expect_summary(summary, length = 2, type = c("summary", "summary"))

  # Expect that `summary[[1|2]]$groups` has both resolved groups
  expect_equal(summary[[1]]$groups, c("W02", "W03"))
  expect_equal(summary[[2]]$groups, c("W02", "W03"))

  # Expect that `summary[[1|2]]$columns` has specific values
  expect_equal(summary[[1]]$columns, c("open", "high", "low", "close"))
  expect_equal(summary[[2]]$columns, c("open", "high", "low", "close"))

  # Expect that the components of `summary[[1|2]]$fns` are lists
  expect_type(summary[[1]]$fns$average, "list")
  expect_type(summary[[1]]$fns$total, "list")
  expect_type(summary[[1]]$fns$`std dev`, "list")
  expect_type(summary[[2]]$fns$max, "list")

  # Create a table with two sets of summary rows for all groups
  # and all columns
  gt_tbl <-
    tbl |>
    summary_rows(
      groups = everything(),
      columns = c(open, high),
      fns = list(
        average = ~ mean(., na.rm = TRUE),
        total = ~ sum(., na.rm = TRUE),
        `std dev` = ~ sd(., na.rm = TRUE)
      )
    ) |>
    summary_rows(
      groups = everything(),
      columns = c(low, close),
      fns = list(
        average = ~ mean(., na.rm = TRUE),
        total = ~ sum(., na.rm = TRUE),
        `std dev` = ~ sd(., na.rm = TRUE)
      )
    )

  # Extract the internal `summary` object
  summary <- dt_summary_get(data = gt_tbl)

  # Expect that the internal `summary` list
  # object has a length of `2` since there
  # were two calls of `summary_rows()`
  expect_summary(summary, length = 2, type = c("summary", "summary"))

  # Expect that `summary[[1|2]]$groups` have both groups resolved
  expect_equal(summary[[1]]$groups, c("W02", "W03"))
  expect_equal(summary[[2]]$groups, c("W02", "W03"))

  # Expect that `summary[[1|2]]$columns` has specific values
  expect_equal(summary[[1]]$columns, c("open", "high"))
  expect_equal(summary[[2]]$columns, c("low", "close"))

  # Expect that the components of `summary[[1|2]]$fns` are lists
  expect_type(summary[[1]]$fns$average, "list")
  expect_type(summary[[1]]$fns$total, "list")
  expect_type(summary[[1]]$fns$`std dev`, "list")
  expect_type(summary[[2]]$fns$average, "list")
  expect_type(summary[[2]]$fns$total, "list")
  expect_type(summary[[2]]$fns$`std dev`, "list")
})

test_that("Grand summaries can be generated with `grand_summary_rows()`", {

  # Create a table with a grand summary; the 3 summary rows for represent
  # the mean, sum, and standard deviation of all numeric columns
  gt_tbl <-
    tbl |>
    grand_summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~ mean(., na.rm = TRUE),
        total = ~ sum(., na.rm = TRUE),
        `std dev` = ~ sd(., na.rm = TRUE)
      )
    )

  # Extract the internal `summary` object
  summary <- dt_summary_get(data = gt_tbl)

  # Expect that the internal `summary` list object has a length of `1`
  # since there was only one call of `summary_rows()`
  expect_summary(summary, length = 1, type = "grand_summary")

  # Expect the `columns` provided in `summary[[1]]$columns`
  # provide names for all columns
  expect_equal(summary[[1]]$columns, c("open", "high", "low", "close"))

  # Expect that the components of `summary[[1]]$fns` are lists
  expect_type(summary[[1]]$fns$average, "list")
  expect_type(summary[[1]]$fns$total, "list")
  expect_type(summary[[1]]$fns$`std dev`, "list")

  # Create a table with a grand summary; the 3 summary rows for represent
  # the mean, sum, and standard deviation of all numeric columns; split
  # into 2 calls that allow for different formatting options
  gt_tbl <-
    tbl |>
    grand_summary_rows(
      columns = c(open, high),
      fns = list(
        average = ~ mean(., na.rm = TRUE),
        total = ~ sum(., na.rm = TRUE),
        `std dev` = ~ sd(., na.rm = TRUE)
      ),
      fmt = list(~ fmt_number(., decimals = 3))
    ) |>
    grand_summary_rows(
      columns = c(low, close),
      fns = list(
        average = ~ mean(., na.rm = TRUE),
        total = ~ sum(., na.rm = TRUE),
        `std dev` = ~ sd(., na.rm = TRUE)
      ),
      fmt = list(~ fmt_number(., decimals = 5))
    )

  # Extract the internal `summary` object
  summary <- dt_summary_get(data = gt_tbl)

  # Expect that the internal `summary` list object has a length of `2`
  # since there were two calls of `summary_rows()`
  expect_summary(summary, length = 2, type = c("grand_summary", "grand_summary"))

  # Expect that `summary[[1|2]]$columns` has specific values
  expect_equal(summary[[1]]$columns, c("open", "high"))
  expect_equal(summary[[2]]$columns, c("low", "close"))

  # Expect that the functions used in each call
  # are the same
  expect_identical(summary[[1]]$fns, summary[[1]]$fns)

  # Expect that the components of `summary[[1|2]]$fns` are lists
  expect_type(summary[[1]]$fns$average, "list")
  expect_type(summary[[1]]$fns$total, "list")
  expect_type(summary[[1]]$fns$`std dev`, "list")
  expect_type(summary[[2]]$fns$average, "list")
  expect_type(summary[[2]]$fns$total, "list")
  expect_type(summary[[2]]$fns$`std dev`, "list")

  # Expect that `summary[[1|2]]$formatter_options` are both of length 0
  expect_length(summary[[1]]$formatter_options, 0)
  expect_length(summary[[2]]$formatter_options, 0)

  # Create a table with group-wise summaries and a grand summary; all
  # summary rows represent the mean, sum, and standard deviation of
  # all numeric columns
  gt_tbl <-
    tbl |>
    summary_rows(
      groups = everything(),
      columns = c(open, high, low, close),
      fns = list(
        average = ~ mean(., na.rm = TRUE),
        total = ~ sum(., na.rm = TRUE),
        `std dev` = ~ sd(., na.rm = TRUE)
      )
    ) |>
    grand_summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~ mean(., na.rm = TRUE),
        total = ~ sum(., na.rm = TRUE),
        `std dev` = ~ sd(., na.rm = TRUE)
      )
    )

  # Extract the internal `summary` object
  summary <- dt_summary_get(data = gt_tbl)

  # Expect that the internal `summary` list
  # object has a length of `2` since there
  # were two calls of `summary_rows()`
  expect_summary(summary, length = 2, type = c("summary", "grand_summary"))

  # Expect that `summary[[1]]$groups` is a character vector
  expect_equal(summary[[1]]$groups, c("W02", "W03"))

  # Expect that `summary[[1|2]]$columns` has specific values
  expect_equal(summary[[1]]$columns, c("open", "high", "low", "close"))
  expect_equal(summary[[2]]$columns, c("open", "high", "low", "close"))

  # Expect that the functions used in each call are the same
  expect_identical(summary[[1]]$fns, summary[[1]]$fns)

  # Expect that the components of `summary[[1|2]]$fns` are lists
  expect_type(summary[[1]]$fns$average, "list")
  expect_type(summary[[1]]$fns$total, "list")
  expect_type(summary[[1]]$fns$`std dev`, "list")
  expect_type(summary[[2]]$fns$average, "list")
  expect_type(summary[[2]]$fns$total, "list")
  expect_type(summary[[2]]$fns$`std dev`, "list")

})

test_that("Using `groups = FALSE` in `summary_rows()` returns data unchanged", {

  # Expect that using `groups = FALSE` with `summary_rows()`
  # creates no summary rows
  expect_equal_gt(
    tbl,
    tbl |>
      summary_rows(
        groups = FALSE,
        columns = c(open, high, low, close),
        fns = list(
          average = ~ mean(., na.rm = TRUE),
          total = ~ sum(., na.rm = TRUE),
          `std dev` = ~ sd(., na.rm = TRUE)
        )
      ),
    f = as_raw_html,
    ignore_id = TRUE
  )
})

test_that("summary_rows() informs to use grand_summary_rows() if no groups are present (#1292).", {

  expect_snapshot(error = TRUE,
    mtcars_short |>
      dplyr::select(gear) |>
      gt::gt(rownames_to_stub = TRUE) |>
      gt::summary_rows(fns = "sum")
  )
})


test_that("Using `groups = NULL` in `summary_rows()` is a deprecated option", {

  expect_warning(
    summary_tbl_1 <-
      tbl |>
      summary_rows(
        groups = NULL,
        columns = open,
        fns = list(
          average = ~ mean(., na.rm = TRUE),
          total = ~ sum(., na.rm = TRUE),
          `std dev` = ~ sd(., na.rm = TRUE)
        )
      )
  )

  # Take snapshots of `summary_tbl_1`
  expect_snapshot_html(summary_tbl_1)
  expect_snapshot_latex(summary_tbl_1)
  expect_snapshot_rtf(summary_tbl_1)

  # The equivalent of `summary_tbl_1` (and the non-deprecated way) is to
  # use `grand_summary_rows()` to make a grand summary
  summary_tbl_2 <-
    tbl |>
    grand_summary_rows(
      columns = open,
      fns = list(
        average = ~ mean(., na.rm = TRUE),
        total = ~ sum(., na.rm = TRUE),
        `std dev` = ~ sd(., na.rm = TRUE)
      )
    )

  expect_equal_gt(summary_tbl_1, summary_tbl_2)
})

test_that("Summary rows can be added to the top of any group", {

  # Create summary rows for the first group only and place the summary
  # at the top of the group
  summary_tbl_1 <-
    tbl |>
    summary_rows(
      groups = "W02",
      fns = list(
        "min",
        "max",
        list(label = "avg", fn = "mean")
      ),
      fmt = ~ fmt_number(., use_seps = FALSE),
      side = "top"
    )

  # Take snapshots of `summary_tbl_1`
  expect_snapshot_html(summary_tbl_1)
  expect_snapshot_latex(summary_tbl_1)

  # Create summary rows for the first group only, place the summary
  # at the top of the group, and place the group label into it's own
  # column in the LHS of stub
  summary_tbl_2 <-
    tbl |>
    summary_rows(
      groups = "W02",
      fns = list(
        "min",
        "max",
        list(label = "avg", fn = "mean")
      ),
      fmt = ~ fmt_number(., use_seps = FALSE),
      side = "top"
    ) |>
    tab_options(row_group.as_column = TRUE)

  # Take snapshots of `summary_tbl_2`
  expect_snapshot_html(summary_tbl_2)
  expect_snapshot_latex(summary_tbl_2)

  # Create summary rows for the first and second groups in separate calls such
  # that the placement is at the top in the first group and at the bottom in
  # the second
  summary_tbl_3 <-
    tbl |>
    summary_rows(
      groups = "W02",
      fns = list(
        "min",
        "max",
        list(label = "avg", fn = "mean")
      ),
      fmt = ~ fmt_number(., use_seps = FALSE),
      side = "top"
    ) |>
    summary_rows(
      groups = "W03",
      fns = list(
        "min",
        "max",
        list(label = "avg", fn = "mean")
      ),
      fmt = ~ fmt_number(., use_seps = FALSE),
      side = "bottom"
    )

  # Take snapshots of `summary_tbl_3`
  expect_snapshot_html(summary_tbl_3)
  expect_snapshot_latex(summary_tbl_3)

  # Create summary rows for the first and second groups in separate calls such
  # that the placement is at the top in the first group and at the bottom in
  # the second; place the group label into it's own column in the LHS of stub
  summary_tbl_4 <-
    tbl |>
    summary_rows(
      groups = "W02",
      fns = list(
        "min",
        "max",
        list(label = "avg", fn = "mean")
      ),
      fmt = ~ fmt_number(., use_seps = FALSE),
      side = "top"
    ) |>
    summary_rows(
      groups = "W03",
      fns = list(
        "min",
        "max",
        list(label = "avg", fn = "mean")
      ),
      fmt = ~ fmt_number(., use_seps = FALSE),
      side = "bottom"
    ) |>
    tab_options(row_group.as_column = TRUE)

  # Take snapshots of `summary_tbl_4`
  expect_snapshot_html(summary_tbl_4)
  expect_snapshot_latex(summary_tbl_4)
})

test_that("Grand summary rows can be added to the top of a table", {

  # Create grand summary rows and place them at the top of the table
  summary_tbl_1 <-
    tbl |>
    grand_summary_rows(
      fns = list(
        "min",
        "max",
        list(label = "avg", fn = "mean")
      ),
      fmt = ~ fmt_number(., use_seps = FALSE),
      side = "top"
    )

  # Take snapshots of `summary_tbl_1`
  expect_snapshot_html(summary_tbl_1)
  expect_snapshot_latex(summary_tbl_1)

  # Create grand summary rows and place them at the top of the table; put
  # the group label into it's own column in the LHS of stub
  summary_tbl_2 <-
    tbl |>
    grand_summary_rows(
      fns = list(
        "min",
        "max",
        list(label = "avg", fn = "mean")
      ),
      fmt = ~ fmt_number(., use_seps = FALSE),
      side = "top"
    ) |>
    tab_options(row_group.as_column = TRUE)

  # Take snapshots of `summary_tbl_2`
  expect_snapshot_html(summary_tbl_2)
  expect_snapshot_latex(summary_tbl_2)
})

test_that("The ordering of groups shouldn't affect group/grand summary calcs", {

  # Create tibbles with rows in different orders
  tbl_1 <-
    dplyr::tibble(
      id = c("1", "2", "3", "4", "5", "6"),
      value = c(1, 10, 1, 10, 99, 1),
      group = c("b", "a", "b", "a", "c", "b")
    )

  tbl_2 <-
    tbl_1 |>
    dplyr::slice(6, 3, 5, 1, 4, 2)

  tbl_3 <-
    tbl_2 |>
    dplyr::arrange(group, id)

  # Prepare a set gt tables with summary rows (using the same
  # `summary_rows()` call each time)
  gt_tbl_1 <-
    tbl_1 |>
    dplyr::group_by(group) |>
    gt(rowname_col = "id") |>
    summary_rows(groups = everything(), columns = value, fns = list("sum"))

  gt_tbl_1b <-
    tbl_1 |>
    gt(rowname_col = "id", groupname_col = "group") |>
    summary_rows(groups = everything(), columns = value, fns = list("sum"))

  gt_tbl_2 <-
    tbl_2 |>
    gt(rowname_col = "id", groupname_col = "group") |>
    summary_rows(groups = everything(), columns = value, fns = list("sum"))

  gt_tbl_3 <-
    tbl_3 |>
    gt(rowname_col = "id", groupname_col = "group") |>
    summary_rows(groups = everything(), columns = value, fns = list("sum"))

  # Expect the correct values in summary rows of `gt_tbl`
  gt_tbl_1 |> render_as_html() |> xml2::read_html() |>
    selection_text("[class='gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row']") |>
    expect_equal(c("3", "20", "99"))

  # Expect the HTML output tables of `gt_tbl_1` and `gt_tbl_1b` to be the same
  expect_equal_gt(gt_tbl_1, gt_tbl_1b)

  # Expect the correct values in summary rows of `gt_tbl_2`
  gt_tbl_2 |> render_as_html() |> xml2::read_html() |>
    selection_text("[class='gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row']") |>
    expect_equal(c("3", "99", "20"))

  # Expect the correct values in summary rows of `gt_tbl_3`
  gt_tbl_3 |> render_as_html() |> xml2::read_html() |>
    selection_text("[class='gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row']") |>
    expect_equal(c("20", "3", "99"))

  # Prepare a set gt tables with a grand summary (using the same
  # `grand_summary_rows()` call each time)
  gt_tbl_1_gs <-
    tbl_1 |>
    dplyr::group_by(group) |>
    gt(rowname_col = "id") |>
    grand_summary_rows(columns = value, fns = list("sum"))

  gt_tbl_1b_gs <-
    tbl_1 |>
    gt(rowname_col = "id", groupname_col = "group") |>
    grand_summary_rows(columns = value, fns = list("sum"))

  gt_tbl_2_gs <-
    tbl_2 |>
    gt(rowname_col = "id", groupname_col = "group") |>
    grand_summary_rows(columns = value, fns = list("sum"))

  gt_tbl_3_gs <-
    tbl_3 |>
    gt(rowname_col = "id", groupname_col = "group") |>
    grand_summary_rows(columns = value, fns = list("sum"))

  # Expect the correct value in the grand summary row of `gt_tbl_gs`
  gt_tbl_1_gs |> render_as_html() |> xml2::read_html() |>
    selection_text("[class='gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row']") |>
    expect_equal(c("122"))

  # Expect the HTML output tables of `gt_tbl_gs` and `gt_tbl_1b_gs` to be the same
  expect_equal_gt(gt_tbl_1_gs, gt_tbl_1b_gs)

  # Expect the correct value in the grand summary row of `gt_tbl_2_gs`
  gt_tbl_2_gs |> render_as_html() |> xml2::read_html() |>
    selection_text("[class='gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row']") |>
    expect_equal(c("122"))

  # Expect the correct value in the grand summary row of `gt_tbl_3_gs`
  gt_tbl_3_gs |> render_as_html() |> xml2::read_html() |>
    selection_text("[class='gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row']") |>
    expect_equal(c("122"))

  # Example where a columns is named `columns`
  tbl_4 <-
    dplyr::tibble(
      id = c("1", "2", "3", "4", "5", "6"),
      value = c(1, 10, 1, 10, 99, 1),
      columns = c(2, 20, 2, 20, 198, 2),
      group = c("b", "a", "b", "a", "c", "b")
    )

  gt_tbl_4 <-
    tbl_4 |>
    dplyr::group_by(group) |>
    gt(rowname_col = "id") |>
    summary_rows(groups = everything(), columns = c(value, columns), fns = list("sum")) |>
    grand_summary_rows(columns = c(value, columns), fns = list("sum"))

  # Expect the correct values in summary rows of `gt_tbl_4`
  gt_tbl_4 |> render_as_html() |> xml2::read_html() |>
    selection_text("[class='gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row']") |>
    expect_equal(c("3", "6", "20", "40", "99", "198"))

  # Expect the correct values in the grand summary row of `gt_tbl_4`
  gt_tbl_4 |> render_as_html() |> xml2::read_html() |>
    selection_text("[class='gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row']") |>
    expect_equal(c("122", "244"))

  gt_tbl_5 <-
    tbl_4 |>
    dplyr::rename(grand_summary_col = columns) |>
    dplyr::group_by(group) |>
    gt(rowname_col = "id") |>
    summary_rows(groups = everything(), columns = c(value, grand_summary_col), fns = list("sum")) |>
    grand_summary_rows(columns = c(value, grand_summary_col), fns = list("sum"))

  # Expect the correct values in summary rows of `gt_tbl_4`
  gt_tbl_5 |> render_as_html() |> xml2::read_html() |>
    selection_text("[class='gt_row gt_right gt_summary_row gt_first_summary_row thick gt_last_summary_row']") |>
    expect_equal(c("3", "6", "20", "40", "99", "198"))

  # Expect the correct values in the grand summary row of `gt_tbl_4`
  gt_tbl_5 |> render_as_html() |> xml2::read_html() |>
    selection_text("[class='gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row gt_last_summary_row']") |>
    expect_equal(c("122", "244"))
})

test_that("Summary cells can be created with NA/NaN-resulting values", {

  # Generate a tibble with two columns containing just NA values
  na_tbl <-
    dplyr::tibble(
      group = c(rep("one", 5), rep("two", 5)),
      na_1 = rep(NA_real_, 10),
      na_2 = rep(NA_integer_, 10)
    )

  # Create a gt table with summary rows
  gt_tbl_1 <-
    na_tbl |>
    gt(groupname_col = "group") |>
    summary_rows(
      groups = c("one", "two"),
      columns = c(na_1, na_2),
      fns = list(
        ~ sum(., na.rm = TRUE),
        ~ mean(., na.rm = TRUE)
      )
    )

  # Expect the correct values in all of the first and second
  # summary rows of `gt_tbl_1`
  gt_tbl_1 |> render_as_html() |> xml2::read_html() |>
    selection_text("[class='gt_row gt_right gt_summary_row gt_first_summary_row thick']") |>
    expect_equal(rep("0", 4))

  gt_tbl_1 |> render_as_html() |> xml2::read_html() |>
    selection_text("[class='gt_row gt_right gt_summary_row gt_last_summary_row']") |>
    expect_equal(rep("—", 4))

  # Create a gt table with grand summary rows
  gt_tbl_2 <-
    na_tbl |>
    gt(groupname_col = "group") |>
    grand_summary_rows(
      columns = c(na_1, na_2),
      fns = list(
        ~ sum(., na.rm = TRUE),
        ~ mean(., na.rm = TRUE)
      )
    )

  # Expect the correct values in all of the first and second
  # grand summary rows of `gt_tbl_2`
  gt_tbl_2 |> render_as_html() |> xml2::read_html() |>
    selection_text("[class='gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row']") |>
    expect_equal(rep("0", 2))

  gt_tbl_2 |> render_as_html() |> xml2::read_html() |>
    selection_text("[class='gt_row gt_right gt_grand_summary_row gt_last_summary_row']") |>
    expect_equal(rep("—", 2))

  # Create a gt table with grand summary rows, replacing missing
  # values with the word "nil"
  gt_tbl_3 <-
    na_tbl |>
    gt(groupname_col = "group") |>
    grand_summary_rows(
      columns = c(na_1, na_2),
      fns = list(
        ~ sum(., na.rm = TRUE),
        ~ mean(., na.rm = TRUE)
      ),
      missing_text = "nil"
    )

  # Expect to see the `missing_text` values in all of the second
  # grand summary rows of `gt_tbl_3`
  gt_tbl_3 |> render_as_html() |> xml2::read_html() |>
    selection_text("[class='gt_row gt_right gt_grand_summary_row gt_last_summary_row']") |>
    expect_equal(rep("nil", 2))
})

test_that("Summary rows can be created when there is no stub", {

  # Create a table based on `sp500`, with
  # four columns of values
  tbl_2 <-
    sp500 |>
    dplyr::filter(date >= "2015-01-05", date <= "2015-01-09") |>
    dplyr::arrange(date) |>
    dplyr::select(-adj_close, -volume) |>
    gt()

  # Create a gt table with a grand summary;
  # the table doesn't have a stub (and there
  # are no row groups)
  gt_tbl <-
    tbl_2 |>
    grand_summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      )
    )

  # Expect that the grand summary row labels are
  # available in the rendered output table
  raw_gt <- as_raw_html(gt_tbl, inline_css = FALSE)
  expect_match(raw_gt, "<th id=\"grand_summary_stub_1\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row\">average</th>")
  expect_match(raw_gt, "<th id=\"grand_summary_stub_2\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_grand_summary_row\">total</th>")
  expect_match(raw_gt, "<th id=\"grand_summary_stub_3\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row\">std dev</th>")
})

test_that("Summary row labels are added in narrow and wide tables", {

  tbl <-
    dplyr::tibble(
      groups = c(rep("one", 5), rep("two", 5)),
      rows = 1:10 |> as.character(),
      a = 1:10,
      b = 11:20,
      c = 21:30,
      d = 31:40,
      e = 41:50,
      f = 51:60,
      g = 61:70,
      h = 71:80,
      i = 81:90,
      j = 91:100,
      k = 101:110,
      l = 111:120,
      m = 121:130,
      n = 131:140,
      o = 141:150,
      p = 151:160,
      q = 161:170,
      r = 171:180,
      s = 181:190,
      t = 191:200
    )

  # Generate a narrow gt table (4 columns)
  narrow_gt_tbl <-
    tbl |>
    dplyr::select(c("groups", "rows", letters[1:4])) |>
    gt(rowname_col = "rows", groupname_col = "groups") |>
    summary_rows(
      groups = "one",
      columns = letters[1:4],
      fns = list(
        the_sum = ~sum(.),
        mean = ~mean(.)
      )
    ) |>
    grand_summary_rows(
      columns = letters[1:4],
      fns = list(
        the_sum = ~sum(.),
        mean = ~mean(.)
      )
    ) |>
    tab_header(
      title = "The Table Title",
      subtitle = "The Table Subtitle"
    ) |>
    tab_style(
      style = cell_text(align = "left"),
      locations = cells_title(groups = "title")
    ) |>
    tab_style(
      style = cell_text(align = "left"),
      locations = cells_title(groups = "subtitle")
    )

  # Generate a wide gt table (20 columns)
  wide_gt_tbl <-
    tbl |>
    dplyr::select(c("groups", "rows", letters[1:(ncol(tbl) - 2)])) |>
    gt(rowname_col = "rows", groupname_col = "groups") |>
    summary_rows(
      groups = "one",
      columns = letters[1:(ncol(tbl) - 2)],
      fns = list(
        the_sum = ~sum(.),
        mean = ~mean(.)
      )
    ) |>
    grand_summary_rows(
      columns = letters[1:(ncol(tbl) - 2)],
      fns = list(
        the_sum = ~sum(.),
        mean = ~mean(.)
      )
    ) |>
    tab_header(
      title = "The Table Title",
      subtitle = "The Table Subtitle"
    ) |>
    tab_style(
      style = cell_text(align = "left"),
      locations = cells_title(groups = "title")
    ) |>
    tab_style(
      style = cell_text(align = "left"),
      locations = cells_title(groups = "subtitle")
    )

  # Expect that the row labels for the group-wise and grand summaries in
  # both tables have `"the_sum"` and `"mean"`
  expect_match(
    narrow_gt_tbl |>
      as_raw_html(inline_css = FALSE),
    paste0(
      "<th id=\"summary_stub_one_1\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick\">the_sum</th>.*?",
      "<th id=\"summary_stub_one_2\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_summary_row gt_last_summary_row\">mean</th>.*?",
      "<th id=\"grand_summary_stub_1\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row\">the_sum</th>.*?",
      "<th id=\"grand_summary_stub_2\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row\">mean</th>.*?"
    )
  )

  expect_match(
    wide_gt_tbl |>
      as_raw_html(inline_css = FALSE),
    paste0(
      "<th id=\"summary_stub_one_1\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick\">the_sum</th>.*?",
      "<th id=\"summary_stub_one_2\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_summary_row gt_last_summary_row\">mean</th>.*?",
      "<th id=\"grand_summary_stub_1\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row\">the_sum</th>.*?",
      "<th id=\"grand_summary_stub_2\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row\">mean</th>.*?"
    )
  )
})

test_that("Multiple ways of expressing formatting work equivalently", {

  local_options("rlib_warning_verbosity" = "verbose")

  expect_warning(
    gt_tbl_1 <-
      tbl |>
      summary_rows(
        groups = "W02",
        columns = c(open, high, low, close),
        fns = list(
          average = ~ mean(., na.rm = TRUE),
          total = ~ sum(., na.rm = TRUE),
          `std dev` = ~ sd(., na.rm = TRUE)
        ),
        formatter = fmt_number,
        decimals = 3
      )
  )

  gt_tbl_2 <-
    tbl |>
    summary_rows(
      groups = "W02",
      columns = c(open, high, low, close),
      fns = list(
        average = ~ mean(., na.rm = TRUE),
        total = ~ sum(., na.rm = TRUE),
        `std dev` = ~ sd(., na.rm = TRUE)
      ),
      fmt = list(~ fmt_number(., decimals = 3))
    )

  gt_tbl_3 <-
    tbl |>
    summary_rows(
      groups = "W02",
      columns = c(open, high, low, close),
      fns = list(
        average = ~ mean(., na.rm = TRUE),
        total = ~ sum(., na.rm = TRUE),
        `std dev` = ~ sd(., na.rm = TRUE)
      ),
      fmt = ~ fmt_number(., decimals = 3)
    )

  expect_equal_gt(gt_tbl_1, gt_tbl_2)
  expect_equal_gt(gt_tbl_2, gt_tbl_3)
})

test_that("Labels can be intrepreted from Markdown using `md()`", {

  summary_tbl_1 <-
    tbl |>
    summary_rows(
      groups = "W02",
      columns = c(open, high, low, close),
      fns = list(
        list(id = "mean", label = md("**Average**")) ~ mean(., na.rm = TRUE),
        list(id = "sum", label = "Sum") ~ sum(., na.rm = TRUE),
        list(label = md("*S.D.*"), id = "stdev") ~ sd(., na.rm = TRUE)
      )
    )

  # Take snapshots of `summary_tbl_1`
  expect_snapshot_html(summary_tbl_1)
  expect_snapshot_latex(summary_tbl_1)
  expect_snapshot_rtf(summary_tbl_1)

  summary_tbl_2 <-
    tbl |>
    grand_summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        list(id = "mean", label = md("**Average**")) ~ mean(., na.rm = TRUE),
        list(id = "sum", label = "Sum") ~ sum(., na.rm = TRUE),
        list(label = md("*S.D.*"), id = "stdev") ~ sd(., na.rm = TRUE)
      )
    )

  # Take snapshots of `summary_tbl_2`
  expect_snapshot_html(summary_tbl_2)
  expect_snapshot_latex(summary_tbl_2)
  expect_snapshot_rtf(summary_tbl_2)
})

test_that("Groups can be formatted selectively with a formatting group directive", {

  summary_tbl_1 <-
    tbl |>
    summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = "W02" ~ fmt_number(., decimals = 3)
    )

  # Take snapshots of `summary_tbl_1`
  expect_snapshot_html(summary_tbl_1)
  expect_snapshot_latex(summary_tbl_1)
  expect_snapshot_rtf(summary_tbl_1)

  summary_tbl_2 <-
    tbl |>
    summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = list(
        everything() ~ fmt_number(., decimals = 3),
        "W03" ~ fmt_currency(.)
      )
    )

  # Take snapshots of `summary_tbl_2`
  expect_snapshot_html(summary_tbl_2)
  expect_snapshot_latex(summary_tbl_2)
  expect_snapshot_rtf(summary_tbl_2)

  # These summary tables should all be the same (using different ways to
  # express the same formatting)
  summary_tbl_3 <-
    tbl |>
    summary_rows(
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = list(
        c("W02", "W03") ~ fmt_currency(.)  # specifying groups in a vector
      )
    )
  summary_tbl_4 <-
    tbl |>
    summary_rows(
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = list(                          # not using LHS group specification
        ~ fmt_currency(.)                  # and wrapping in a list
      )
    )
  summary_tbl_5 <-
    tbl |>
    summary_rows(
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = ~ fmt_currency(.)              # not using LHS group specification
    )
  summary_tbl_6 <-
    tbl |>
    summary_rows(
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = list(
        everything() ~ fmt_currency(.)     # specifying all groups with `everything()`
      )                                    # and wrapping in a list
    )
  summary_tbl_7 <-
    tbl |>
    summary_rows(
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = everything() ~ fmt_currency(.) # specifying all groups with `everything()`
    )
  summary_tbl_8 <-
    tbl |>
    summary_rows(
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = list(
        "W02" ~ fmt_currency(.), # specifying each group and applying the
        "W03" ~ fmt_currency(.)  # same formatting to each
      )
    )
  summary_tbl_9 <-
    tbl |>
    summary_rows(
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = list(
        "W02" ~ fmt_currency(.),
        "W03" ~ fmt_currency(.),
        "W99" ~ fmt_currency(.)   # Using an unmatched group
      )
    )

  # Take snapshots of `summary_tbl_3`
  expect_snapshot_html(summary_tbl_3)
  expect_snapshot_latex(summary_tbl_3)
  expect_snapshot_rtf(summary_tbl_3)

  # Equality checks of summary_tbl_[3-9]
  expect_equal_gt(summary_tbl_3, summary_tbl_4)
  expect_equal_gt(summary_tbl_3, summary_tbl_5)
  expect_equal_gt(summary_tbl_3, summary_tbl_6)
  expect_equal_gt(summary_tbl_3, summary_tbl_7)
  expect_equal_gt(summary_tbl_3, summary_tbl_8)
  expect_equal_gt(summary_tbl_3, summary_tbl_9)

  # These summary tables should all be the same (using different ways to
  # express the same formatting for grand summary rows); importantly, any
  # group directive given in the LHS of the formula expressions is ignored
  summary_tbl_10 <-
    tbl |>
    grand_summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = "group" ~ fmt_number(., decimals = 3)
    )

  summary_tbl_11 <-
    tbl |>
    grand_summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = ~ fmt_number(., decimals = 3)
    )

  summary_tbl_12 <-
    tbl |>
    grand_summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = "W03" ~ fmt_number(., decimals = 3)
    )

  summary_tbl_13 <-
    tbl |>
    grand_summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = list("W03" ~ fmt_number(., decimals = 3))
    )

  # Take snapshots of `summary_tbl_10`
  expect_snapshot_html(summary_tbl_10)
  expect_snapshot_latex(summary_tbl_10)
  expect_snapshot_rtf(summary_tbl_10)

  # Equality checks of summary_tbl_[10-13]
  expect_equal_gt(summary_tbl_10, summary_tbl_11)
  expect_equal_gt(summary_tbl_10, summary_tbl_12)
  expect_equal_gt(summary_tbl_10, summary_tbl_13)
})

test_that("Formatting can be performed on summary cells in certain columns and rows", {

  # Perform formatting in selected columns
  summary_tbl_1 <-
    tbl |>
    summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = ~ fmt_number(., columns = c(open, high), pattern = "<{x}>")
    )

  # Take snapshots of `summary_tbl_1`
  expect_snapshot_html(summary_tbl_1)
  expect_snapshot_latex(summary_tbl_1)
  expect_snapshot_rtf(summary_tbl_1)

  # Perform formatting twice across two sets of distinct columns
  summary_tbl_2 <-
    tbl |>
    summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = list(
        ~ fmt_number(., columns = c(open, high), pattern = "<{x}>"),
        ~ fmt_number(., columns = c(low, close), pattern = "[{x}]")
      )
    )

  # Take snapshots of `summary_tbl_2`
  expect_snapshot_html(summary_tbl_2)
  expect_snapshot_latex(summary_tbl_2)
  expect_snapshot_rtf(summary_tbl_2)

  # Perform formatting across two sets of distinct columns and rows
  summary_tbl_3 <-
    tbl |>
    summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = list(
        ~ fmt_number(., columns = c(open, high), rows = "average", pattern = "<{x}>"),
        ~ fmt_number(., columns = c(low, close), rows = "total", pattern = "[{x}]")
      )
    )

  # Take snapshots of `summary_tbl_3`
  expect_snapshot_html(summary_tbl_3)
  expect_snapshot_latex(summary_tbl_3)
  expect_snapshot_rtf(summary_tbl_3)

  # Perform formatting at a single cell (targeting column, row, and group)
  summary_tbl_4 <-
    tbl |>
    summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = list(
        "W03" ~ fmt_number(., columns = open, rows = "average", pattern = "<{x}>")
      )
    )

  # Take snapshots of `summary_tbl_4`
  expect_snapshot_html(summary_tbl_4)
  expect_snapshot_latex(summary_tbl_4)
  expect_snapshot_rtf(summary_tbl_4)

  # Perform formatting at two cells (targeting a column, two rows, and a group)
  summary_tbl_5 <-
    tbl |>
    summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = list(
        "W03" ~ fmt_number(., columns = open, rows = c("average", "total"), pattern = "<{x}>")
      )
    )

  # Take snapshots of `summary_tbl_5`
  expect_snapshot_html(summary_tbl_5)
  expect_snapshot_latex(summary_tbl_5)
  expect_snapshot_rtf(summary_tbl_5)

  # Perform formatting at a single column of a single group
  summary_tbl_6 <-
    tbl |>
    summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = list(
        "W03" ~ fmt_number(., columns = open, pattern = "<{x}>")
      )
    )

  # Take snapshots of `summary_tbl_6`
  expect_snapshot_html(summary_tbl_6)
  expect_snapshot_latex(summary_tbl_6)
  expect_snapshot_rtf(summary_tbl_6)

  # Perform formatting at two columns of a single group
  summary_tbl_7 <-
    tbl |>
    summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = list(
        "W03" ~ fmt_number(., columns = c(open, close), pattern = "<{x}>")
      )
    )

  # Take snapshots of `summary_tbl_7`
  expect_snapshot_html(summary_tbl_7)
  expect_snapshot_latex(summary_tbl_7)
  expect_snapshot_rtf(summary_tbl_7)

  # Perform the same summarizing as in `summary_tbl_5` except place the
  # `rows` argument at the end of the expression
  summary_tbl_8 <-
    tbl |>
    summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = list(
        "W03" ~ fmt_number(., columns = open, pattern = "<{x}>", rows = c("average", "total"))
      )
    )

  expect_equal_gt(summary_tbl_5, summary_tbl_8)

  # Perform formatting at two columns of both groups
  summary_tbl_9 <-
    tbl |>
    summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = list(
        everything() ~ fmt_number(., columns = open, pattern = "<{x}>", rows = c("average", "total"))
      )
    )
  summary_tbl_10 <-
    tbl |>
    summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = list(
        c("W02", "W03") ~ fmt_number(., columns = open, pattern = "<{x}>", rows = c("average", "total"))
      )
    )
  summary_tbl_11 <-
    tbl |>
    summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      ),
      fmt = list(
        matches("2|3") ~ fmt_number(., columns = open, pattern = "<{x}>", rows = c("average", "total"))
      )
    )

  expect_equal_gt(summary_tbl_9, summary_tbl_10)
  expect_equal_gt(summary_tbl_9, summary_tbl_11)
})

test_that("Extracting a summary from a gt table is possible", {

  # Create a table with summary rows for
  # the `W02` and `W03` groups; the 3 summary
  # rows represent the mean, sum, and standard
  # deviation of all numeric columns; extract
  # the internal summary with `extract_summary()`
  gt_tbl_summary_groupwise <-
    tbl |>
    summary_rows(
      groups = c("W02", "W03"),
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      )
    ) |>
    extract_summary()

  # Expect that the summary object is a list
  expect_type(gt_tbl_summary_groupwise, "list")

  # Expect that the length of the list is `1`
  expect_length(gt_tbl_summary_groupwise, 1)

  # Expect specific names for the list components
  expect_named(
    gt_tbl_summary_groupwise$summary_df_data_list,
    c("W02", "W03")
  )

  # Expect that each component of the list inherits
  # from `tbl_df`
  expect_s3_class(gt_tbl_summary_groupwise$summary_df_data_list[[1]], "data.frame")
  expect_s3_class(gt_tbl_summary_groupwise$summary_df_data_list[[2]], "data.frame")

  # Expect specific column names for each of the
  # tibbles in `gt_tbl_summary_groupwise`
  expect_named(
    gt_tbl_summary_groupwise$summary_df_data_list[[1]],
    c("group_id", "row_id", "rowname", "date", "open", "high", "low", "close", "week")
  )

  expect_named(
    gt_tbl_summary_groupwise$summary_df_data_list[[2]],
    c("group_id", "row_id", "rowname", "date", "open", "high", "low", "close", "week")
  )

  # Expect specific values in each of the tibbles
  expect_equal(
    gt_tbl_summary_groupwise$summary_df_data_list[[1]]$open,
    c(2035.23998, 10176.19990, 23.65756), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_groupwise$summary_df_data_list[[1]]$high,
    c(2048.56198, 10242.80990, 17.47612), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_groupwise$summary_df_data_list[[1]]$low,
    c(2016.8540, 10084.2699, 18.5372), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_groupwise$summary_df_data_list[[1]]$close,
    c(2031.2080, 10156.0400, 22.9171), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_groupwise$summary_df_data_list[[2]]$open,
    c(2020.42200, 10102.11000, 20.17218), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_groupwise$summary_df_data_list[[2]]$high,
    c(2033.28798, 10166.43990, 18.33064), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_groupwise$summary_df_data_list[[2]]$low,
    c(1999.77198, 9998.85990, 15.20847), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_groupwise$summary_df_data_list[[2]]$close,
    c(2014.9300, 10074.6500, 13.8957), tolerance = .002
  )

  # Create a table with a grand summary; the 3
  # summary rows represent the mean, sum, and
  # standard deviation of all numeric columns;
  # extract the internal summary with `extract_summary()`
  gt_tbl_summary_grand <-
    tbl |>
    grand_summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      )
    ) |>
    extract_summary()

  # Expect that the summary object is a list
  expect_type(gt_tbl_summary_grand, "list")

  # Expect that the length of the list is `1`
  expect_length(gt_tbl_summary_grand, 1)

  # Expect a specific name for the one list component
  expect_named(gt_tbl_summary_grand, "summary_df_data_list")

  # Expect that the single component of the list inherits
  # from `list`
  expect_type(gt_tbl_summary_grand[[1]], "list")

  # Expect specific column names for the tibble in `gt_tbl_summary_grand`
  expect_named(
    gt_tbl_summary_grand$summary_df_data_list[[1]],
    c("group_id", "row_id", "rowname", "date", "open", "high", "low", "close", "week")
  )

  # Expect specific values in the tibble
  expect_equal(
    gt_tbl_summary_grand$summary_df_data_list[[1]]$open,
    c(2027.83099, 20278.30990, 22.14929), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_grand$summary_df_data_list[[1]]$high,
    c(2040.92498, 20409.24980, 18.70516), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_grand$summary_df_data_list[[1]]$low,
    c(2008.31298, 20083.12980, 18.34602), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_grand$summary_df_data_list[[1]]$close,
    c(2023.06900, 20230.69000, 19.82022), tolerance = .002
  )
})

test_that("Creating summary rows works for hidden columns", {

  # Create a table based on `sp500`, with
  # group names, rownames, and four
  # columns of values; hide the 'open and
  # 'low' columns
  tbl <-
    sp500 |>
    dplyr::filter(date >= "2015-01-05", date <= "2015-01-16") |>
    dplyr::arrange(date) |>
    dplyr::mutate(
      week = paste0(
        "W", strftime(date, format = "%V"))
    ) |>
    dplyr::select(-adj_close, -volume) |>
    gt(
      rowname_col = "date",
      groupname_col = "week"
    ) |>
    cols_hide(columns = c(open, low))

  # Extend the gt table with summary rows for
  # the `W02` group, and, don't expect an error
  # even though `summary_rows()` includes hidden
  # columns
  expect_no_error(
    gt_tbl <-
      tbl |>
      summary_rows(
        groups = "W02",
        columns = c(open, high, low, close),
        fns = list(
          average = ~mean(., na.rm = TRUE),
          total = ~sum(., na.rm = TRUE),
          `std dev` = ~sd(., na.rm = TRUE)
        )
      )
  )

  # Extract the internal `summary` object
  summary <- dt_summary_get(data = gt_tbl)

  # Expect that the internal `summary` list
  # object has a length of `1` since there was
  # only one call of `summary_rows()`
  expect_summary(summary, length = 1, type = "summary")

  # Expect the `groups` provided in `summary[[1]]$groups`
  expect_equal(summary[[1]]$groups, "W02")

  # Expect the `columns` provided in `summary[[1]]$columns`
  expect_equal(summary[[1]]$columns, c("open", "high", "low", "close"))

  # Expect that the components of `summary[[1]]$fns` are lists
  expect_type(summary[[1]]$fns$average, "list")
  expect_type(summary[[1]]$fns$total, "list")
  expect_type(summary[[1]]$fns$`std dev`, "list")

  # Extract the summary from `gt_tbl` and obtain the
  # tibble containing the summary for the `W02` group
  summary_extract <- extract_summary(gt_tbl)
  summary_w02 <- summary_extract$summary_df_data_list$W02

  # Expect that all columns are present in `summary_w02`
  expect_named(summary_w02, c("group_id", "row_id", "rowname", "date", "open", "high", "low", "close", "week"))

  # Expect non-NA values in all columns that had summaries computed
  expect_false(anyNA(summary_w02$open))
  expect_false(anyNA(summary_w02$high))
  expect_false(anyNA(summary_w02$low))
  expect_false(anyNA(summary_w02$close))

  # TODO: test gt table for values and expect that
  # when `cols_unhide()`ing 'open' and 'low' their summary
  # data will be displayed
})

test_that("Situtations where `rowname` is a column name don't interfere with internals", {

  # The most basic table where rowname exists as a column; by default
  # a `"rowname"` column is used as the stub
  summary_tbl_1 <-
    exibble |>
    dplyr::rename(rowname = row) |>
    gt() |>
    grand_summary_rows(
      columns = c(num, currency),
      fns = list(
        min = ~min(., na.rm = TRUE),
        max = ~max(., na.rm = TRUE),
        avg = ~mean(., na.rm = TRUE)
      ),
      fmt = list( ~ fmt_number(.))
    ) |>
    tab_options(latex.use_longtable = TRUE)

  # Take snapshots of `summary_tbl_1`
  expect_snapshot_html(summary_tbl_1)
  expect_snapshot_latex(summary_tbl_1)
  expect_snapshot_rtf(summary_tbl_1)

  # Here the default value of `rowname_col` is set to NULL set that the
  # `"rowname"` col won't be used as the stub; it exists as a visible column
  # and the stub is empty except for the grand summary labels
  summary_tbl_2 <-
    exibble |>
    dplyr::rename(rowname = row) |>
    gt(rowname_col = NULL) |>
    grand_summary_rows(
      columns = c(num, currency),
      fns = list(
        min = ~min(., na.rm = TRUE),
        max = ~max(., na.rm = TRUE),
        avg = ~mean(., na.rm = TRUE)
      ),
      fmt = list( ~ fmt_number(.))
    ) |>
    tab_options(latex.use_longtable = TRUE)

  # Take snapshots of `summary_tbl_2`
  expect_snapshot_html(summary_tbl_2)
  expect_snapshot_latex(summary_tbl_2)
  expect_snapshot_rtf(summary_tbl_2)

  # Here, the `"rowname"` column is prevented from being used in the stub
  # but the `"group"` column is used to generate row group labels; we have
  # a largely empty stub except for the summary row labels (we can use
  # `summary_rows()` here because of the groupings) and the grand summary
  # row labels
  summary_tbl_3 <-
    exibble |>
    dplyr::rename(rowname = row) |>
    gt(rowname_col = NULL, groupname_col = "group") |>
    summary_rows(
      columns = c(num, currency),
      groups = c("grp_a", "grp_b"),
      fns = list(
        median = ~median(., na.rm = TRUE)
      ),
      fmt = list( ~ fmt_number(.))
    ) |>
    grand_summary_rows(
      columns = c(num, currency),
      fns = list(
        min = ~min(., na.rm = TRUE),
        max = ~max(., na.rm = TRUE),
        avg = ~mean(., na.rm = TRUE)
      ),
      fmt = list( ~ fmt_number(.))
    ) |>
    tab_options(latex.use_longtable = TRUE)

  # Take snapshots of `summary_tbl_3`
  expect_snapshot_html(summary_tbl_3)
  expect_snapshot_latex(summary_tbl_3)
  expect_snapshot_rtf(summary_tbl_3)

  # This table has a stub with values but it is utilizing the `"char"`
  # column for its labels (`"rowname"` and `"group"` are visible columns)
  summary_tbl_4 <-
    exibble |>
    dplyr::rename(rowname = row) |>
    gt(rowname_col = "char") |>
    grand_summary_rows(
      columns = c(num, currency),
      fns = list(
        min = ~min(., na.rm = TRUE),
        max = ~max(., na.rm = TRUE),
        avg = ~mean(., na.rm = TRUE)
      ),
      fmt = list( ~ fmt_number(.))
    ) |>
    tab_options(latex.use_longtable = TRUE)

  # Take snapshots of `summary_tbl_4`
  expect_snapshot_html(summary_tbl_4)
  expect_snapshot_latex(summary_tbl_4)
  expect_snapshot_rtf(summary_tbl_4)

  # This table is a slight modification on `summary_tbl_4` in that the
  # `"group"` column is being used to generate row groups
  summary_tbl_5 <-
    exibble |>
    dplyr::rename(rowname = row) |>
    gt(rowname_col = "char", groupname_col = "group") |>
    summary_rows(
      columns = c(num, currency),
      groups = c("grp_a", "grp_b"),
      fns = list(
        median = ~median(., na.rm = TRUE)
      ),
      fmt = list( ~ fmt_number(.))
    ) |>
    grand_summary_rows(
      columns = c(num, currency),
      fns = list(
        min = ~min(., na.rm = TRUE),
        max = ~max(., na.rm = TRUE),
        avg = ~mean(., na.rm = TRUE)
      ),
      fmt = list( ~ fmt_number(.))
    ) |>
    tab_options(latex.use_longtable = TRUE)

  # Take snapshots of `summary_tbl_5`
  expect_snapshot_html(summary_tbl_5)
  expect_snapshot_latex(summary_tbl_5)
  expect_snapshot_rtf(summary_tbl_5)

  # This table uses the `"rowname"` column to generate rownames in the stub,
  # and, the `"group"` column is used to form row groups
  summary_tbl_6 <-
    exibble |>
    dplyr::rename(rowname = row) |>
    gt(rowname_col = "rowname", groupname_col = "group") |>
    summary_rows(
      columns = c(num, currency),
      groups = c("grp_a", "grp_b"),
      fns = list(
        median = ~median(., na.rm = TRUE)
      ),
      fmt = list( ~ fmt_number(.))
    ) |>
    grand_summary_rows(
      columns = c(num, currency),
      fns = list(
        min = ~min(., na.rm = TRUE),
        max = ~max(., na.rm = TRUE),
        avg = ~mean(., na.rm = TRUE)
      ),
      fmt = list( ~ fmt_number(.))
    ) |>
    tab_options(latex.use_longtable = TRUE)

  # Take snapshots of `summary_tbl_6`
  expect_snapshot_html(summary_tbl_6)
  expect_snapshot_latex(summary_tbl_6)
  expect_snapshot_rtf(summary_tbl_6)

  # This table has a single row group and the summary rows are to
  # be styled via `tab_style()`
  summary_tbl_7 <-
    countrypops |>
    dplyr::filter(country_name == "Japan", year < 1970) |>
    dplyr::select(-contains("country")) |>
    dplyr::mutate(decade = paste0(substr(year, 1, 3), "0s")) |>
    gt(
      rowname_col = "year",
      groupname_col = "decade"
    ) |>
    fmt_integer(columns = population) |>
    summary_rows(
      groups = "1960s",
      columns = population,
      fns = list("min", "max"),
      fmt = ~ fmt_integer(.)
    ) |>
    tab_style(
      style = list(
        cell_text(
          weight = "bold",
          transform = "capitalize"
        ),
        cell_fill(
          color = "lightblue",
          alpha = 0.5
        )
      ),
      locations = cells_stub_summary(
        groups = "1960s"
      )
    ) |>
    tab_options(latex.use_longtable = TRUE)

  # Take snapshots of `summary_tbl_7`
  expect_snapshot_html(summary_tbl_7)
  expect_snapshot_latex(summary_tbl_7)
  expect_snapshot_rtf(summary_tbl_7)

  # We should expect no errors or warnings when rendering each of these
  # tables to the different output formats
  expect_no_error(summary_tbl_1 |> render_as_html())
  expect_no_error(summary_tbl_1 |> as_latex())
  expect_no_error(summary_tbl_1 |> as_rtf())
  expect_no_warning(summary_tbl_1 |> render_as_html())
  expect_no_warning(summary_tbl_1 |> as_latex())
  expect_no_warning(summary_tbl_1 |> as_rtf())

  expect_no_error(summary_tbl_2 |> render_as_html())
  expect_no_error(summary_tbl_2 |> as_latex())
  expect_no_error(summary_tbl_2 |> as_rtf())
  expect_no_warning(summary_tbl_2 |> render_as_html())
  expect_no_warning(summary_tbl_2 |> as_latex())
  expect_no_warning(summary_tbl_2 |> as_rtf())

  expect_no_error(summary_tbl_3 |> render_as_html())
  expect_no_error(summary_tbl_3 |> as_latex())
  expect_no_error(summary_tbl_3 |> as_rtf())
  expect_no_warning(summary_tbl_3 |> render_as_html())
  expect_no_warning(summary_tbl_3 |> as_latex())
  expect_no_warning(summary_tbl_3 |> as_rtf())

  expect_no_error(summary_tbl_4 |> render_as_html())
  expect_no_error(summary_tbl_4 |> as_latex())
  expect_no_error(summary_tbl_4 |> as_rtf())
  expect_no_warning(summary_tbl_4 |> render_as_html())
  expect_no_warning(summary_tbl_4 |> as_latex())
  expect_no_warning(summary_tbl_4 |> as_rtf())

  expect_no_error(summary_tbl_5 |> render_as_html())
  expect_no_error(summary_tbl_5 |> as_latex())
  expect_no_error(summary_tbl_5 |> as_rtf())
  expect_no_warning(summary_tbl_5 |> render_as_html())
  expect_no_warning(summary_tbl_5 |> as_latex())
  expect_no_warning(summary_tbl_5 |> as_rtf())

  expect_no_error(summary_tbl_6 |> render_as_html())
  expect_no_error(summary_tbl_6 |> as_latex())
  expect_no_error(summary_tbl_6 |> as_rtf())
  expect_no_warning(summary_tbl_6 |> render_as_html())
  expect_no_warning(summary_tbl_6 |> as_latex())
  expect_no_warning(summary_tbl_6 |> as_rtf())
})

test_that("Summary rows can be styled comprehensively", {

  # Generate a gt table with group and grand summary rows and style
  # every one of these cells in a single, comprehensive `tab_style()` stmt
  gt_tbl <-
    gtcars |>
    dplyr::select(mfr, model, hp, trq) |>
    dplyr::filter(mfr %in% c("Lamborghini", "Maserati", "Aston Martin")) |>
    gt(rowname_col = "model", groupname_col = "mfr") |>
    summary_rows(
      groups = everything(),
      fns = list(
        Minimum = ~min(.),
        Maximum = ~max(.)
      )
    ) |>
    grand_summary_rows(
      fns = list(
        Minimum = ~min(.),
        Maximum = ~max(.)
      )
    ) |>
    tab_style(
      style = list(
        cell_fill(color = "#DA291C"),
        cell_borders(color = "#FFC72C", weight = "4px"),
        cell_text(color = "white", weight = "bold")
      ),
      locations = list(
        cells_summary(), cells_stub_summary(),
        cells_grand_summary(), cells_stub_grand_summary()
      )
    )

  # Take a snapshot of `gt_tbl`
  expect_snapshot_html(gt_tbl)
})

test_that("Summary rows can use other columns' data", {

  gt_tbl <-
    sp500 |>
    dplyr::slice_head(n = 22) |>
    dplyr::select(date, close, volume) |>
    gt() |>
    grand_summary_rows(
      columns = 'close',
      fns = list('Average close' = ~ mean(.)),
      fmt = list(~ fmt_number(.))
    ) |>
    grand_summary_rows(
      columns = 'close',
      fns = list('Average volume weighted close' = ~ sum(. * volume) / sum(volume)),
      fmt = list(~ fmt_number(.))
    ) |>
    grand_summary_rows(
      columns = 'close',
      fns = list('Sum of `volume` in `close`' = ~ sum(volume)),
      fmt = list(~ fmt_number(.))
    )

  # Take a snapshot of `gt_tbl`
  expect_snapshot_html(gt_tbl)
})

test_that("normalize_summary_fns() works with a variety of inputs", {

  check_summary_fn_output <- function(fns, id, label, formula) {

    out <- normalize_summary_fns(fns = fns)

    expect_length(out, 1)
    expect_type(out, "list")

    # Get id
    out_id <- names(out)

    # Get label
    out_label <- out[[1]]$label

    # Get formula
    out_formula <- out[[1]]$fn

    expect_equal(out_id, id)
    expect_equal(out_label, label)
    expect_equal(rlang::as_label(out_formula), formula)

    expect_true(rlang::is_formula(out_formula))
    expect_null(rlang::f_lhs(out_formula))
    expect_true(rlang::is_call(rlang::f_rhs(out_formula)))
  }

  # Checking vector of function names as strings; for common aggregations that
  # have an `na.rm` argument, this is written as having `na.rm = TRUE` (recourse
  # is providing a formula with full call)
  check_summary_fn_output(fns = "min", id = "min", label = "min", formula = "~min(., na.rm = TRUE)")
  check_summary_fn_output(fns = "max", id = "max", label = "max", formula = "~max(., na.rm = TRUE)")
  check_summary_fn_output(fns = "mean", id = "mean", label = "mean", formula = "~mean(., na.rm = TRUE)")
  check_summary_fn_output(fns = "median", id = "median", label = "median", formula = "~median(., na.rm = TRUE)")
  check_summary_fn_output(fns = "sd", id = "sd", label = "sd", formula = "~sd(., na.rm = TRUE)")
  check_summary_fn_output(fns = "sum", id = "sum", label = "sum", formula = "~sum(., na.rm = TRUE)")

  # Checking vector of function given as a string (not part of recognized
  # aggregation set in above tests)
  check_summary_fn_output(fns = "other", id = "other", label = "other", formula = "~other(.)")

  # Checking named vector of length one as input (name is id and value is function name)
  check_summary_fn_output(fns = c("minimum" = "min"), id = "minimum", label = "min", formula = "~min(., na.rm = TRUE)")

  # Checking named vector with value as RHS formula (name is id and label)
  check_summary_fn_output(fns = c(minimum = ~min(.)), id = "minimum", label = "minimum", formula = "~min(.)")
  check_summary_fn_output(fns = c(minimum = ~min(.)), id = "minimum", label = "minimum", formula = "~min(.)")

  # Checking named list with value as RHS formula (name is id and label)
  check_summary_fn_output(fns = list(minimum = ~min(.)), id = "minimum", label = "minimum", formula = "~min(.)")

  # Checking named list with fn value within the list (valid names are: `id`, `label`, and `fn`)
  check_summary_fn_output(fns = list(id = "mean_id", label = "average", fn = "mean"), id = "mean_id", label = "average", formula = "~mean(., na.rm = TRUE)")
  check_summary_fn_output(fns = list(label = "average", fn = "mean"), id = "mean", label = "average", formula = "~mean(., na.rm = TRUE)")
  check_summary_fn_output(fns = list(id = "mean_id", fn = "mean"), id = "mean_id", label = "mean", formula = "~mean(., na.rm = TRUE)")
  check_summary_fn_output(fns = list(list(id = "mean_id", label = "average", fn = "mean")), id = "mean_id", label = "average", formula = "~mean(., na.rm = TRUE)")
  check_summary_fn_output(fns = list(list(label = "average", fn = "mean")), id = "mean", label = "average", formula = "~mean(., na.rm = TRUE)")
  check_summary_fn_output(fns = list(list(id = "mean_id", fn = "mean")), id = "mean_id", label = "mean", formula = "~mean(., na.rm = TRUE)")

  # Checking RHS formula (fn name is used to generate id and label)
  check_summary_fn_output(fns = ~ min(.), id = "min", label = "min", formula = "~min(.)")
  check_summary_fn_output(fns = list(~ min(.)), id = "min", label = "min", formula = "~min(.)")

  # Checking two-sided formula inputs (LHS is id and label)
  check_summary_fn_output(fns = minimum ~ min(.), id = "minimum", label = "minimum", formula = "~min(.)")
  check_summary_fn_output(fns = list(minimum ~ min(.)), id = "minimum", label = "minimum", formula = "~min(.)")

  # Checking unnamed vector of length two in LHS `c()` (provides label and id in that order)
  check_summary_fn_output(fns = c("minimum", "min") ~ min(.), id = "min", label = "minimum", formula = "~min(.)")
  check_summary_fn_output(fns = list(c("minimum", "min") ~ min(.)), id = "min", label = "minimum", formula = "~min(.)")

  # Checking unnamed vector of length two in LHS `list()` (provides label and id in that order)
  check_summary_fn_output(fns = list("minimum", "min") ~ min(.), id = "min", label = "minimum", formula = "~min(.)")
  check_summary_fn_output(fns = list(list("minimum", "min") ~ min(.)), id = "min", label = "minimum", formula = "~min(.)")
  check_summary_fn_output(fns = list(md("**minimum**"), "min") ~ min(.), id = "min", label = md("**minimum**"), formula = "~min(.)")

  # Checking named components in LHS `list()`
  check_summary_fn_output(fns = list(id = "minimum", label = "min") ~ min(.), id = "minimum", label = "min", formula = "~min(.)")
  check_summary_fn_output(fns = list(label = "min", id = "minimum") ~ min(.), id = "minimum", label = "min", formula = "~min(.)")
  check_summary_fn_output(fns = list(id = "min", label = "minimum") ~ min(.), id = "min", label = "minimum", formula = "~min(.)")
  check_summary_fn_output(fns = list(label = "minimum", id = "min") ~ min(.), id = "min", label = "minimum", formula = "~min(.)")
  check_summary_fn_output(fns = list(list(id = "minimum", label = "min") ~ min(.)), id = "minimum", label = "min", formula = "~min(.)")
  check_summary_fn_output(fns = list(list(label = "min", id = "minimum") ~ min(.)), id = "minimum", label = "min", formula = "~min(.)")
  check_summary_fn_output(fns = list(list(id = "min", label = "minimum") ~ min(.)), id = "min", label = "minimum", formula = "~min(.)")
  check_summary_fn_output(fns = list(list(label = "minimum", id = "min") ~ min(.)), id = "min", label = "minimum", formula = "~min(.)")
  check_summary_fn_output(fns = list(list(id = "min", label = md("**minimum**")) ~ min(.)), id = "min", label = md("**minimum**"), formula = "~min(.)")
  check_summary_fn_output(fns = list(list(label = md("**minimum**"), id = "min") ~ min(.)), id = "min", label = md("**minimum**"), formula = "~min(.)")

  # Checking named components in LHS `c()`
  check_summary_fn_output(fns = c(id = "minimum", label = "min") ~ min(.), id = "minimum", label = "min", formula = "~min(.)")
  check_summary_fn_output(fns = c(label = "min", id = "minimum") ~ min(.), id = "minimum", label = "min", formula = "~min(.)")
  check_summary_fn_output(fns = c(id = "min", label = "minimum") ~ min(.), id = "min", label = "minimum", formula = "~min(.)")
  check_summary_fn_output(fns = c(label = "minimum", id = "min") ~ min(.), id = "min", label = "minimum", formula = "~min(.)")
  check_summary_fn_output(fns = list(c(id = "minimum", label = "min") ~ min(.)), id = "minimum", label = "min", formula = "~min(.)")
  check_summary_fn_output(fns = list(c(label = "min", id = "minimum") ~ min(.)), id = "minimum", label = "min", formula = "~min(.)")
  check_summary_fn_output(fns = list(c(id = "min", label = "minimum") ~ min(.)), id = "min", label = "minimum", formula = "~min(.)")
  check_summary_fn_output(fns = list(c(label = "minimum", id = "min") ~ min(.)), id = "min", label = "minimum", formula = "~min(.)")
  check_summary_fn_output(fns = c(id = "min", label = md("**minimum**")) ~ min(.), id = "min", label = "**minimum**", formula = "~min(.)")

  # Partially named components in `c()` work correctly
  check_summary_fn_output(fns = c(id = "minimum", "min") ~ min(.), id = "minimum", label = "min", formula = "~min(.)")
  check_summary_fn_output(fns = c("min", id = "minimum") ~ min(.), id = "minimum", label = "min", formula = "~min(.)")
  check_summary_fn_output(fns = c("minimum", label = "min") ~ min(.), id = "minimum", label = "min", formula = "~min(.)")
  check_summary_fn_output(fns = c(label = "min", "minimum") ~ min(.), id = "minimum", label = "min", formula = "~min(.)")
  check_summary_fn_output(fns = list(c(id = "minimum", "min") ~ min(.)), id = "minimum", label = "min", formula = "~min(.)")
  check_summary_fn_output(fns = list(c("min", id = "minimum") ~ min(.)), id = "minimum", label = "min", formula = "~min(.)")
  check_summary_fn_output(fns = list(c("minimum", label = "min") ~ min(.)), id = "minimum", label = "min", formula = "~min(.)")
  check_summary_fn_output(fns = list(c(label = "min", "minimum") ~ min(.)), id = "minimum", label = "min", formula = "~min(.)")
})

test_that("The deprecated `formatter` arg and `...` still function properly", {

  local_options("rlib_warning_verbosity" = "verbose")

  # Generate summary rows and use a formatting function in the deprecated
  # `formatter` arg; this yields a warning but works so long as `fmt = NULL`
  # (the default value)
  expect_warning(
    gt_tbl_1 <-
      tbl |>
      summary_rows(
        groups = "W02",
        columns = c(open, high, low, close),
        fns = list(
          average = ~mean(., na.rm = TRUE),
          total = ~sum(., na.rm = TRUE),
          `std dev` = ~sd(., na.rm = TRUE)
        ),
        formatter = fmt_number
      )
  )

  # Expect the correct values in summary rows of `gt_tbl_1`
  gt_tbl_1 |> render_as_html() |> xml2::read_html() |>
    selection_text("[class='gt_row gt_right gt_summary_row gt_first_summary_row thick']") |>
    expect_equal(c("2,035.24", "2,048.56", "2,016.85", "2,031.21"))

  # Generate summary rows and use a formatting function in the deprecated
  # `formatter` arg, and, supply arguments to that function in `...`; this
  # yields a warning but works so long as `fmt = NULL` (the default value)
  expect_warning(
    gt_tbl_2 <-
      tbl |>
      summary_rows(
        groups = "W02",
        columns = c(open, high, low, close),
        fns = list(
          average = ~mean(., na.rm = TRUE),
          total = ~sum(., na.rm = TRUE),
          `std dev` = ~sd(., na.rm = TRUE)
        ),
        formatter = fmt_number,
        decimals = 5,
        use_seps = FALSE
      )
  )

  # Expect the correct values in summary rows of `gt_tbl_2`
  gt_tbl_2 |> render_as_html() |> xml2::read_html() |>
    selection_text("[class='gt_row gt_right gt_summary_row gt_first_summary_row thick']") |>
    expect_equal(c("2035.23998", "2048.56198", "2016.85398", "2031.20800"))

  # Generate summary rows and use a formatting function in the deprecated
  # `formatter` arg, and, a formatting declaration in the `fmt` arg (which is
  # `NULL` by default); this *does not* yield a warning and the value given in
  # `formatter` is ignored
  expect_no_warning(
    gt_tbl_3 <-
      tbl |>
      summary_rows(
        groups = "W02",
        columns = c(open, high, low, close),
        fns = list(
          average = ~mean(., na.rm = TRUE),
          total = ~sum(., na.rm = TRUE),
          `std dev` = ~sd(., na.rm = TRUE)
        ),
        fmt = list(~ fmt_number(., decimals = 5)),
        formatter = fmt_number
      )
  )

  # Expect the correct values in summary rows of `gt_tbl_3`
  gt_tbl_3 |> render_as_html() |> xml2::read_html() |>
    selection_text("[class='gt_row gt_right gt_summary_row gt_first_summary_row thick']") |>
    expect_equal(c("2,035.23998", "2,048.56198", "2,016.85398", "2,031.20800"))

  # Generate summary rows and use a formatting function in the deprecated
  # `formatter` arg along with arg values for that formatting functions; in
  # addition, provide a formatting declaration in the `fmt` arg (which is
  # `NULL` by default)... all of this *does not* yield a warning and the
  # value given in `formatter` is ignored along with anything in `...`
  expect_no_warning(
    gt_tbl_4 <-
      tbl |>
      summary_rows(
        groups = "W02",
        columns = c(open, high, low, close),
        fns = list(
          average = ~mean(., na.rm = TRUE),
          total = ~sum(., na.rm = TRUE),
          `std dev` = ~sd(., na.rm = TRUE)
        ),
        fmt = list(~ fmt_number(., decimals = 1)),
        formatter = fmt_number,
        decimals = 5,
        use_seps = FALSE
      )
  )

  # Expect the correct values in summary rows of `gt_tbl_4`
  gt_tbl_4 |> render_as_html() |> xml2::read_html() |>
    selection_text("[class='gt_row gt_right gt_summary_row gt_first_summary_row thick']") |>
    expect_equal(c("2,035.2", "2,048.6", "2,016.9", "2,031.2"))
})

test_that("normalize_fmt_fns() works with a variety of inputs", {

  check_fmt_fns_output <- function(fmt, formula) {

    out <- normalize_fmt_fns(fmt = fmt)

    expect_length(out, 1)
    expect_type(out, "list")

    # Get formula
    out_formula <- out[[1]]

    expect_equal(rlang::as_label(out_formula), formula)

    expect_true(rlang::is_formula(out_formula))
    expect_null(rlang::f_lhs(out_formula))
    expect_true(rlang::is_call(rlang::f_rhs(out_formula)))
  }

  # Checking RHS formula
  check_fmt_fns_output(fmt = ~ fmt_currency(.), formula = "~fmt_currency(.)")
  check_fmt_fns_output(fmt = list(~ fmt_currency(.)), formula = "~fmt_currency(.)")
})
