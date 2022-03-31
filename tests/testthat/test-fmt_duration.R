local_edition(3)
skip_on_cran()

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
    (tab_1 %>%
       fmt_duration(columns = "num_1", input_units = "days") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1d 4m 19s", "5189w 7m 11s", "5d", "&minus;4w 6d 12h", "4w 3d 14h 24m",
      "4w 12h", "NA"
    )
  )

  # Use the "wide" duration style
  expect_equal(
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
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
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", trim_zero_units = c("trailing", "internal")) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M11S", "P5DT", "&minus;P34DT12H",
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and keep a max of 2 time units
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", max_output_units = 2) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("1d 4m", "5189w 7m", "5d", "&minus;4w 6d", "4w 3d", "4w 12h", "NA")
  )

  # Use the "wide" duration style and keep a max of 2 time units
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", max_output_units = 2) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1 day 4 mins", "5189 weeks 7 mins", "5 days", "&minus;4 weeks 6 days",
      "4 weeks 3 days", "4 weeks 12 hours", "NA"
    )
  )

  # Use the "colon-sep" duration style and keep a max of 2 time units
  # (`max_output_units` has no effect with this duration style)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", max_output_units = 2) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36323/00:07:11", "5/00:00:00", "&minus;34/12:00:00",
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and keep a max of 2 time units
  # (`max_output_units` has no effect with this duration style)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", max_output_units = 2) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M11S", "P5DT", "&minus;P34DT12H",
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and keep a max of 1 time unit
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", max_output_units = 1) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("1d", "5189w", "5d", "&minus;4w", "4w", "4w", "NA")
  )

  # Use the "wide" duration style and keep a max of 1 time unit
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", max_output_units = 1) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1 day", "5189 weeks", "5 days", "&minus;4 weeks", "4 weeks",
      "4 weeks", "NA"
    )
  )

  # Use the "colon-sep" duration style and keep a max of 1 time unit
  # (`max_output_units` has no effect with this duration style)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", max_output_units = 1) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36323/00:07:11", "5/00:00:00", "&minus;34/12:00:00",
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and keep a max of 1 time unit
  # (`max_output_units` has no effect with this duration style)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", max_output_units = 1) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M11S", "P5DT", "&minus;P34DT12H",
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and a set of custom output time units
  # (hours and minutes)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("hours", "mins"),
         duration_style = "narrow") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("24h 4m", "871752h 7m", "120h", "&minus;828h", "758h 24m", "684h", "NA")
  )

  # Use the "wide" duration style and a set of custom output time units
  # (hours and minutes)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("hours", "mins"),
         duration_style = "wide") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "24 hours 4 mins", "871752 hours 7 mins", "120 hours", "&minus;828 hours",
      "758 hours 24 mins", "684 hours", "NA"
    )
  )

  # Use the "colon-sep" duration style and a set of custom output time units
  # (hours and minutes, no effect with this duration style)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("hours", "mins"),
         duration_style = "colon-sep") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36323/00:07:11", "5/00:00:00", "&minus;34/12:00:00",
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and a set of custom output time units
  # (hours and minutes, no effect with this duration style)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("hours", "mins"),
         duration_style = "iso") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M11S", "P5DT", "&minus;P34DT12H",
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and a set of custom output time units
  # (minutes and seconds)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("mins", "secs"),
         duration_style = "narrow") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("1444m 19s", "52305127m 11s", "7200m", "&minus;49680m", "45504m", "41040m", "NA")
  )

  # Use the "wide" duration style and a set of custom output time units
  # (minutes and seconds)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("mins", "secs"),
         duration_style = "wide") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1444 mins 19 secs", "52305127 mins 11 secs", "7200 mins",
      "&minus;49680 mins", "45504 mins", "41040 mins", "NA"
    )
  )

  # Use the "colon-sep" duration style and a set of custom output time units
  # (minutes and seconds, no effect with this duration style)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("mins", "secs"),
         duration_style = "colon-sep") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36323/00:07:11", "5/00:00:00", "&minus;34/12:00:00",
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and a set of custom output time units
  # (minutes and seconds, no effect with this duration style)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("mins", "secs"),
         duration_style = "iso") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M11S", "P5DT", "&minus;P34DT12H",
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and a set of custom output time units
  # (weeks)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = "weeks",
         duration_style = "narrow") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("<1w", "5189w", "<1w", "&minus;4w", "4w", "4w", "NA")
  )

  # Use the "wide" duration style and a set of custom output time units
  # (weeks)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = "weeks",
         duration_style = "wide") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "<1 week", "5189 weeks", "<1 week", "&minus;4 weeks", "4 weeks",
      "4 weeks", "NA"
    )
  )

  # Use the "colon-sep" duration style and a set of custom output time units
  # (weeks, no effect with this duration style)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = "weeks",
         duration_style = "colon-sep") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36323/00:07:11", "5/00:00:00", "&minus;34/12:00:00",
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and a set of custom output time units
  # (weeks, no effect with this duration style)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = "weeks",
         duration_style = "iso") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M11S", "P5DT", "&minus;P34DT12H",
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and a set of custom output time units
  # (days and minutes)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("days", "mins"),
         duration_style = "narrow") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("1d 4m", "36323d 7m", "5d", "&minus;34d 720m", "31d 864m", "28d 720m", "NA")
  )

  # Use the "wide" duration style and a set of custom output time units
  # (days and minutes)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("days", "mins"),
         duration_style = "wide") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1 day 4 mins", "36323 days 7 mins", "5 days", "&minus;34 days 720 mins",
      "31 days 864 mins", "28 days 720 mins", "NA"
    )
  )

  # Use the "colon-sep" duration style and a set of custom output time units
  # (days and minutes, no effect with this duration style)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("days", "mins"),
         duration_style = "colon-sep") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36323/00:07:11", "5/00:00:00", "&minus;34/12:00:00",
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and a set of custom output time units
  # (days and minutes, no effect with this duration style)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("days", "mins"),
         duration_style = "iso") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M11S", "P5DT", "&minus;P34DT12H",
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and a set of custom output time units
  # (weeks, hours, and seconds)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("weeks", "hours", "secs"),
         duration_style = "narrow") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("24h 259s", "5189w 431s", "120h", "&minus;4w 156h", "4w 86h 1440s", "4w 12h", "NA")
  )

  # Use the "wide" duration style and a set of custom output time units
  # (weeks, hours, and seconds)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("weeks", "hours", "secs"),
         duration_style = "wide") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "24 hours 259 secs", "5189 weeks 431 secs", "120 hours",
      "&minus;4 weeks 156 hours", "4 weeks 86 hours 1440 secs",
      "4 weeks 12 hours", "NA"
    )
  )

  # Use the "colon-sep" duration style and a set of custom output time units
  # (weeks, hours, and seconds; no effect with this duration style)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("weeks", "hours", "secs"),
         duration_style = "colon-sep") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36323/00:07:11", "5/00:00:00", "&minus;34/12:00:00",
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and a set of custom output time units
  # (weeks, hours, and seconds; no effect with this duration style)
  expect_equal(
    (tab_1 %>%
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("weeks", "hours", "secs"),
         duration_style = "iso") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M11S", "P5DT", "&minus;P34DT12H",
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )
})
