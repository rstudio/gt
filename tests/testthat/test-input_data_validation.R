test_that("all exported functions validate the incoming `data` object", {

  regexp_stop <- "The object to `data` is not a `gt_tbl` object"

  # Test the `exibble` tibble with all exported functions;
  # don't provide values for any arguments and ensure that
  # the function stop message pertains to the input data
  # validation
  expect_error(exibble %>% tab_header(), regexp = regexp_stop)
  expect_error(exibble %>% tab_spanner(), regexp = regexp_stop)
  expect_error(exibble %>% tab_spanner_delim(), regexp = regexp_stop)
  expect_error(exibble %>% tab_row_group(), regexp = regexp_stop)
  expect_error(exibble %>% tab_stubhead(), regexp = regexp_stop)
  expect_error(exibble %>% tab_footnote(), regexp = regexp_stop)
  expect_error(exibble %>% tab_source_note(), regexp = regexp_stop)
  expect_error(exibble %>% tab_style(), regexp = regexp_stop)
  expect_error(exibble %>% tab_options(), regexp = regexp_stop)
  expect_error(exibble %>% opt_footnote_marks(), regexp = regexp_stop)
  expect_error(exibble %>% opt_row_striping(), regexp = regexp_stop)
  expect_error(exibble %>% opt_align_table_header(), regexp = regexp_stop)
  expect_error(exibble %>% opt_all_caps(), regexp = regexp_stop)
  expect_error(exibble %>% opt_table_lines(), regexp = regexp_stop)
  expect_error(exibble %>% opt_table_outline(), regexp = regexp_stop)
  expect_error(exibble %>% fmt_number(), regexp = regexp_stop)
  expect_error(exibble %>% fmt_scientific(), regexp = regexp_stop)
  expect_error(exibble %>% fmt_percent(), regexp = regexp_stop)
  expect_error(exibble %>% fmt_currency(), regexp = regexp_stop)
  expect_error(exibble %>% fmt_date(), regexp = regexp_stop)
  expect_error(exibble %>% fmt_time(), regexp = regexp_stop)
  expect_error(exibble %>% fmt_datetime(), regexp = regexp_stop)
  expect_error(exibble %>% fmt_markdown(), regexp = regexp_stop)
  expect_error(exibble %>% fmt_passthrough(), regexp = regexp_stop)
  expect_error(exibble %>% text_transform(), regexp = regexp_stop)
  expect_error(exibble %>% sub_missing(), regexp = regexp_stop)
  expect_error(exibble %>% sub_zero(), regexp = regexp_stop)
  expect_error(exibble %>% sub_small_vals(), regexp = regexp_stop)
  expect_error(exibble %>% sub_large_vals(), regexp = regexp_stop)
  expect_error(exibble %>% data_color(), regexp = regexp_stop)
  expect_error(exibble %>% cols_align(), regexp = regexp_stop)
  expect_error(exibble %>% cols_width(), regexp = regexp_stop)
  expect_error(exibble %>% cols_label(), regexp = regexp_stop)
  expect_error(exibble %>% cols_move_to_start(), regexp = regexp_stop)
  expect_error(exibble %>% cols_move_to_end(), regexp = regexp_stop)
  expect_error(exibble %>% cols_move(), regexp = regexp_stop)
  expect_error(exibble %>% cols_hide(), regexp = regexp_stop)
  expect_error(exibble %>% cols_merge_uncert(), regexp = regexp_stop)
  expect_error(exibble %>% cols_merge_range(), regexp = regexp_stop)
  expect_error(exibble %>% cols_merge(), regexp = regexp_stop)
  expect_error(exibble %>% row_group_order(), regexp = regexp_stop)
  expect_error(exibble %>% summary_rows(), regexp = regexp_stop)
  expect_error(exibble %>% grand_summary_rows(), regexp = regexp_stop)
  expect_error(exibble %>% gtsave(), regexp = regexp_stop)
  expect_error(exibble %>% as_raw_html(), regexp = regexp_stop)
  expect_error(exibble %>% as_latex(), regexp = regexp_stop)
  expect_error(exibble %>% as_rtf(), regexp = regexp_stop)
  expect_error(exibble %>% extract_summary(), regexp = regexp_stop)
})

test_that("certain `fmt_*()` functions stop if given incompatible column data", {

  gt_tbl <- exibble %>% gt()

  # Tests with `fmt_number()`
  gt_tbl %>% fmt_number(columns = num) %>% expect_is("gt_tbl")
  gt_tbl %>% fmt_number(columns = c()) %>% expect_is("gt_tbl")
  gt_tbl %>% fmt_number(columns = currency) %>% expect_is("gt_tbl")
  expect_error(gt_tbl %>% fmt_number(columns = c(num, fctr)))
  expect_error(gt_tbl %>% fmt_number(columns = char))

  # Tests with `fmt_scientific()`
  gt_tbl %>% fmt_scientific(columns = num) %>% expect_is("gt_tbl")
  gt_tbl %>% fmt_scientific(columns = c()) %>% expect_is("gt_tbl")
  expect_error(gt_tbl %>% fmt_scientific(columns = c(num, fctr)))
  expect_error(gt_tbl %>% fmt_scientific(columns = char))

  # Tests with `fmt_percent()`
  gt_tbl %>% fmt_percent(columns = num) %>% expect_is("gt_tbl")
  gt_tbl %>% fmt_percent(columns = c()) %>% expect_is("gt_tbl")
  expect_error(gt_tbl %>% fmt_percent(columns = c(num, fctr)))
  expect_error(gt_tbl %>% fmt_percent(columns = char))

  # Tests with `fmt_currency()`
  gt_tbl %>% fmt_currency(columns = num) %>% expect_is("gt_tbl")
  gt_tbl %>% fmt_currency(columns = c()) %>% expect_is("gt_tbl")
  expect_error(gt_tbl %>% fmt_currency(columns = c(num, fctr)))
  expect_error(gt_tbl %>% fmt_currency(columns = char))

  # Tests with `fmt_date()`
  gt_tbl %>% fmt_date(columns = date) %>% expect_is("gt_tbl")
  gt_tbl %>% fmt_date(columns = c()) %>% expect_is("gt_tbl")
  expect_error(gt_tbl %>% fmt_date(columns = c(date, num)))
  expect_error(gt_tbl %>% fmt_date(columns = fctr))

  # Tests with `fmt_time()`
  gt_tbl %>% fmt_time(columns = time) %>% expect_is("gt_tbl")
  gt_tbl %>% fmt_time(columns = c()) %>% expect_is("gt_tbl")
  expect_error(gt_tbl %>% fmt_time(columns = c(time, num)))
  expect_error(gt_tbl %>% fmt_time(columns = fctr))

  # Tests with `fmt_datetime()`
  gt_tbl %>% fmt_datetime(columns = datetime) %>% expect_is("gt_tbl")
  gt_tbl %>% fmt_datetime(columns = c()) %>% expect_is("gt_tbl")
  expect_error(gt_tbl %>% fmt_datetime(columns = c(datetime, num)))
  expect_error(gt_tbl %>% fmt_datetime(columns = fctr))
})
