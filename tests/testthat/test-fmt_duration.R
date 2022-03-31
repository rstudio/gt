test_that("the `fmt_duration()` function works correctly", {

  # Create an input tibble with a numeric column
  data_tbl_1 <-
    dplyr::tibble(
      num_1 = c(1.0030, 36323.005, 5.000003, -34.5, 31.6, 28.5, NA)
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl_1` dataset
  tab_1 <- gt(data_tbl_1)

  # Format the `num_1` column using the defaults for `fmt_duration()` and
  # ensuring the `input_units` are days
  expect_equal(
    (tab %>%
       fmt_duration(columns = "num_1", input_units = "days") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1d 4m 19s", "5189w 7m 11s", "5d", "&minus;4w 6d 12h", "4w 3d 14h 24m",
      "4w 12h", "NA"
    )
  )

  # Use the "wide" duration style
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days", duration_style = "wide") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1 day 4 mins 19 secs", "5189 weeks 7 mins 11 secs", "5 days",
      "&minus;4 weeks 6 days 12 hours", "4 weeks 3 days 14 hours 24 mins",
      "4 weeks 12 hours", "NA"
      )
  )

  # Use the "colon-sep" duration style
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days", duration_style = "colon-sep") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36323/00:07:11", "5/00:00:00", "&minus;34/12:00:00",
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days", duration_style = "iso") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M11S", "P5DT", "&minus;P34DT12H",
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and don't trim any time units
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", trim_zero_units = FALSE) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "0w 1d 0h 4m 19s", "5189w 0d 0h 7m 11s", "0w 5d 0h 0m 0s",
      "&minus;4w 6d 12h 0m 0s", "4w 3d 14h 24m 0s", "4w 0d 12h 0m 0s",
      "NA"
    )
  )

  # Use the "wide" duration style and don't trim any time units
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", trim_zero_units = FALSE) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "0 weeks 1 day 0 hours 4 mins 19 secs", "5189 weeks 0 days 0 hours 7 mins 11 secs",
      "0 weeks 5 days 0 hours 0 mins 0 secs", "&minus;4 weeks 6 days 12 hours 0 mins 0 secs",
      "4 weeks 3 days 14 hours 24 mins 0 secs", "4 weeks 0 days 12 hours 0 mins 0 secs",
      "NA"
    )
  )

  # Use the "colon-sep" duration style and don't trim any time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", trim_zero_units = FALSE) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36323/00:07:11", "5/00:00:00", "&minus;34/12:00:00",
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and don't trim any time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", trim_zero_units = FALSE) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M11S", "P5DT", "&minus;P34DT12H",
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and trim leading time units
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", trim_zero_units = "leading") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1d 0h 4m 19s", "5189w 0d 0h 7m 11s", "5d 0h 0m 0s", "&minus;4w 6d 12h 0m 0s",
      "4w 3d 14h 24m 0s", "4w 0d 12h 0m 0s", "NA"
    )
  )

  # Use the "wide" duration style and trim leading time units
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", trim_zero_units = "leading") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1 day 0 hours 4 mins 19 secs", "5189 weeks 0 days 0 hours 7 mins 11 secs",
      "5 days 0 hours 0 mins 0 secs", "&minus;4 weeks 6 days 12 hours 0 mins 0 secs",
      "4 weeks 3 days 14 hours 24 mins 0 secs", "4 weeks 0 days 12 hours 0 mins 0 secs",
      "NA"
    )
  )

  # Use the "colon-sep" duration style and trim leading time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", trim_zero_units = "leading") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36323/00:07:11", "5/00:00:00", "&minus;34/12:00:00",
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and trim leading time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", trim_zero_units = "leading") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M11S", "P5DT", "&minus;P34DT12H",
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and trim trailing time units
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", trim_zero_units = "trailing") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "0w 1d 0h 4m 19s", "5189w 0d 0h 7m 11s", "0w 5d", "&minus;4w 6d 12h",
      "4w 3d 14h 24m", "4w 0d 12h", "NA"
    )
  )

  # Use the "wide" duration style and trim trailing time units
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", trim_zero_units = "trailing") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "0 weeks 1 day 0 hours 4 mins 19 secs", "5189 weeks 0 days 0 hours 7 mins 11 secs",
      "0 weeks 5 days", "&minus;4 weeks 6 days 12 hours", "4 weeks 3 days 14 hours 24 mins",
      "4 weeks 0 days 12 hours", "NA"
    )
  )

  # Use the "colon-sep" duration style and trim trailing time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", trim_zero_units = "trailing") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36323/00:07:11", "5/00:00:00", "&minus;34/12:00:00",
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and trim trailing time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", trim_zero_units = "trailing") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M11S", "P5DT", "&minus;P34DT12H",
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and trim internal time units
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", trim_zero_units = "internal") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "0w 1d 4m 19s", "5189w 7m 11s", "0w 5d 0h 0m 0s", "&minus;4w 6d 12h 0m 0s",
      "4w 3d 14h 24m 0s", "4w 12h 0m 0s", "NA"
    )
  )

  # Use the "wide" duration style and trim internal time units
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", trim_zero_units = "internal") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "0 weeks 1 day 4 mins 19 secs", "5189 weeks 7 mins 11 secs",
      "0 weeks 5 days 0 hours 0 mins 0 secs", "&minus;4 weeks 6 days 12 hours 0 mins 0 secs",
      "4 weeks 3 days 14 hours 24 mins 0 secs", "4 weeks 12 hours 0 mins 0 secs",
      "NA"
    )
  )

  # Use the "colon-sep" duration style and trim internal time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", trim_zero_units = "internal") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36323/00:07:11", "5/00:00:00", "&minus;34/12:00:00",
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and trim internal time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", trim_zero_units = "internal") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M11S", "P5DT", "&minus;P34DT12H",
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and trim leading and trailing time units
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", trim_zero_units = c("leading", "trailing")) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1d 0h 4m 19s", "5189w 0d 0h 7m 11s", "5d", "&minus;4w 6d 12h",
      "4w 3d 14h 24m", "4w 0d 12h", "NA"
    )
  )

  # Use the "wide" duration style and trim leading and trailing time units
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", trim_zero_units = c("leading", "trailing")) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1 day 0 hours 4 mins 19 secs", "5189 weeks 0 days 0 hours 7 mins 11 secs",
      "5 days", "&minus;4 weeks 6 days 12 hours", "4 weeks 3 days 14 hours 24 mins",
      "4 weeks 0 days 12 hours", "NA"
    )
  )

  # Use the "colon-sep" duration style and trim leading and trailing time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", trim_zero_units = c("leading", "trailing")) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36323/00:07:11", "5/00:00:00", "&minus;34/12:00:00",
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and trim leading and trailing time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", trim_zero_units = c("leading", "trailing")) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M11S", "P5DT", "&minus;P34DT12H",
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and trim leading and internal time units
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", trim_zero_units = c("leading", "internal")) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1d 4m 19s", "5189w 7m 11s", "5d 0h 0m 0s", "&minus;4w 6d 12h 0m 0s",
      "4w 3d 14h 24m 0s", "4w 12h 0m 0s", "NA"
    )
  )

  # Use the "wide" duration style and trim leading and internal time units
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", trim_zero_units = c("leading", "internal")) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1 day 4 mins 19 secs", "5189 weeks 7 mins 11 secs", "5 days 0 hours 0 mins 0 secs",
      "&minus;4 weeks 6 days 12 hours 0 mins 0 secs", "4 weeks 3 days 14 hours 24 mins 0 secs",
      "4 weeks 12 hours 0 mins 0 secs", "NA"
    )
  )

  # Use the "colon-sep" duration style and trim leading and internal time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", trim_zero_units = c("leading", "internal")) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36323/00:07:11", "5/00:00:00", "&minus;34/12:00:00",
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and trim leading and internal time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", trim_zero_units = c("leading", "internal")) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M11S", "P5DT", "&minus;P34DT12H",
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and trim trailing and internal time units
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", trim_zero_units = c("trailing", "internal")) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "0w 1d 4m 19s", "5189w 7m 11s", "0w 5d", "&minus;4w 6d 12h",
      "4w 3d 14h 24m", "4w 12h", "NA"
    )
  )

  # Use the "wide" duration style and trim trailing and internal time units
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", trim_zero_units = c("trailing", "internal")) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "0 weeks 1 day 4 mins 19 secs", "5189 weeks 7 mins 11 secs",
      "0 weeks 5 days", "&minus;4 weeks 6 days 12 hours", "4 weeks 3 days 14 hours 24 mins",
      "4 weeks 12 hours", "NA"
    )
  )

  # Use the "colon-sep" duration style and trim trailing and internal time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", trim_zero_units = c("trailing", "internal")) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36323/00:07:11", "5/00:00:00", "&minus;34/12:00:00",
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and trim trailing and internal time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", trim_zero_units = c("trailing", "internal")) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M11S", "P5DT", "&minus;P34DT12H",
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )
})
