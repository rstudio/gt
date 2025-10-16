test_that("fmt_duration() works correctly with numerical inputs", {

  # Create an input tibble with a numeric column
  data_tbl_1 <-
    data.frame(
      num_1 = c(1.0030, 36323.005, 5.000003, -34.5, 31.6, 28.5, NA)
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl_1` dataset
  tab_1 <- gt(data_tbl_1)

  # Format the `num_1` column using the defaults for `fmt_duration()` and
  # ensuring the `input_units` are days
  expect_equal(
    (tab_1 |>
       fmt_duration(columns = "num_1", input_units = "days") |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1d 4m 19s", "5,189w 7m 12s", "5d", paste0("\U02212", "4w 6d 12h"),
      "4w 3d 14h 24m", "4w 12h", "NA"
    )
  )

  # Use the "wide" duration style
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days", duration_style = "wide"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1 day 4 minutes 19 seconds", "5,189 weeks 7 minutes 12 seconds",
      "5 days", paste0("\U02212", "4 weeks 6 days 12 hours"),
      "4 weeks 3 days 14 hours 24 minutes",
      "4 weeks 12 hours", "NA"
      )
  )

  # Use the "colon-sep" duration style
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days", duration_style = "colon-sep"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36,323/00:07:12", "5/00:00:00",
      paste0("\U02212", "34/12:00:00"),
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days", duration_style = "iso"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M12S", "P5DT", paste0("\U02212", "P34DT12H"),
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and don't trim any time units
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", trim_zero_units = FALSE
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "0w 1d 0h 4m 19s", "5,189w 0d 0h 7m 12s", "0w 5d 0h 0m 0s",
      paste0("\U02212", "4w 6d 12h 0m 0s"), "4w 3d 14h 24m 0s",
      "4w 0d 12h 0m 0s", "NA"
    )
  )

  # Use the "wide" duration style and don't trim any time units
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", trim_zero_units = FALSE
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "0 weeks 1 day 0 hours 4 minutes 19 seconds",
      "5,189 weeks 0 days 0 hours 7 minutes 12 seconds",
      "0 weeks 5 days 0 hours 0 minutes 0 seconds",
      paste0("\U02212", "4 weeks 6 days 12 hours 0 minutes 0 seconds"),
      "4 weeks 3 days 14 hours 24 minutes 0 seconds",
      "4 weeks 0 days 12 hours 0 minutes 0 seconds",
      "NA"
    )
  )

  # Use the "colon-sep" duration style and don't trim any time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", trim_zero_units = FALSE
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36,323/00:07:12", "5/00:00:00",
      paste0("\U02212", "34/12:00:00"),
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and don't trim any time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", trim_zero_units = FALSE
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M12S", "P5DT",
      paste0("\U02212", "P34DT12H"),
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and trim leading time units
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", trim_zero_units = "leading"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1d 0h 4m 19s", "5,189w 0d 0h 7m 12s", "5d 0h 0m 0s",
      paste0("\U02212", "4w 6d 12h 0m 0s"),
      "4w 3d 14h 24m 0s", "4w 0d 12h 0m 0s", "NA"
    )
  )

  # Use the "wide" duration style and trim leading time units
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", trim_zero_units = "leading"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1 day 0 hours 4 minutes 19 seconds",
      "5,189 weeks 0 days 0 hours 7 minutes 12 seconds",
      "5 days 0 hours 0 minutes 0 seconds",
      paste0("\U02212", "4 weeks 6 days 12 hours 0 minutes 0 seconds"),
      "4 weeks 3 days 14 hours 24 minutes 0 seconds",
      "4 weeks 0 days 12 hours 0 minutes 0 seconds",
      "NA"
    )
  )

  # Use the "colon-sep" duration style and trim leading time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", trim_zero_units = "leading"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36,323/00:07:12", "5/00:00:00",
      paste0("\U02212", "34/12:00:00"),
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and trim leading time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", trim_zero_units = "leading"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M12S", "P5DT",
      paste0("\U02212", "P34DT12H"),
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and trim trailing time units
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", trim_zero_units = "trailing"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "0w 1d 0h 4m 19s", "5,189w 0d 0h 7m 12s", "0w 5d",
      paste0("\U02212", "4w 6d 12h"),
      "4w 3d 14h 24m", "4w 0d 12h", "NA"
    )
  )

  # Use the "wide" duration style and trim trailing time units
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", trim_zero_units = "trailing"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "0 weeks 1 day 0 hours 4 minutes 19 seconds",
      "5,189 weeks 0 days 0 hours 7 minutes 12 seconds",
      "0 weeks 5 days", paste0("\U02212", "4 weeks 6 days 12 hours"),
      "4 weeks 3 days 14 hours 24 minutes",
      "4 weeks 0 days 12 hours", "NA"
    )
  )

  # Use the "colon-sep" duration style and trim trailing time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", trim_zero_units = "trailing"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36,323/00:07:12", "5/00:00:00",
      paste0("\U02212", "34/12:00:00"),
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and trim trailing time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", trim_zero_units = "trailing"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M12S", "P5DT",
      paste0("\U02212", "P34DT12H"),
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and trim internal time units
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", trim_zero_units = "internal"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "0w 1d 4m 19s", "5,189w 7m 12s", "0w 5d 0h 0m 0s",
      paste0("\U02212", "4w 6d 12h 0m 0s"),
      "4w 3d 14h 24m 0s", "4w 12h 0m 0s", "NA"
    )
  )

  # Use the "wide" duration style and trim internal time units
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", trim_zero_units = "internal"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "0 weeks 1 day 4 minutes 19 seconds", "5,189 weeks 7 minutes 12 seconds",
      "0 weeks 5 days 0 hours 0 minutes 0 seconds",
      paste0("\U02212", "4 weeks 6 days 12 hours 0 minutes 0 seconds"),
      "4 weeks 3 days 14 hours 24 minutes 0 seconds",
      "4 weeks 12 hours 0 minutes 0 seconds",
      "NA"
    )
  )

  # Use the "colon-sep" duration style and trim internal time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", trim_zero_units = "internal"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36,323/00:07:12", "5/00:00:00",
      paste0("\U02212", "34/12:00:00"),
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and trim internal time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", trim_zero_units = "internal"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M12S", "P5DT", paste0("\U02212", "P34DT12H"),
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and trim leading and trailing time units
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", trim_zero_units = c("leading", "trailing")
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1d 0h 4m 19s", "5,189w 0d 0h 7m 12s", "5d",
      paste0("\U02212", "4w 6d 12h"),
      "4w 3d 14h 24m", "4w 0d 12h", "NA"
    )
  )

  # Use the "wide" duration style and trim leading and trailing time units
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", trim_zero_units = c("leading", "trailing")
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1 day 0 hours 4 minutes 19 seconds",
      "5,189 weeks 0 days 0 hours 7 minutes 12 seconds",
      "5 days", paste0("\U02212", "4 weeks 6 days 12 hours"),
      "4 weeks 3 days 14 hours 24 minutes",
      "4 weeks 0 days 12 hours", "NA"
    )
  )

  # Use the "colon-sep" duration style and trim leading and trailing time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", trim_zero_units = c("leading", "trailing")
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36,323/00:07:12", "5/00:00:00",
      paste0("\U02212", "34/12:00:00"),
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and trim leading and trailing time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", trim_zero_units = c("leading", "trailing")
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M12S", "P5DT", paste0("\U02212", "P34DT12H"),
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and trim leading and internal time units
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", trim_zero_units = c("leading", "internal")
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1d 4m 19s", "5,189w 7m 12s", "5d 0h 0m 0s",
      paste0("\U02212", "4w 6d 12h 0m 0s"),
      "4w 3d 14h 24m 0s", "4w 12h 0m 0s", "NA"
    )
  )

  # Use the "wide" duration style and trim leading and internal time units
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", trim_zero_units = c("leading", "internal")
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1 day 4 minutes 19 seconds", "5,189 weeks 7 minutes 12 seconds",
      "5 days 0 hours 0 minutes 0 seconds",
      paste0("\U02212", "4 weeks 6 days 12 hours 0 minutes 0 seconds"),
      "4 weeks 3 days 14 hours 24 minutes 0 seconds",
      "4 weeks 12 hours 0 minutes 0 seconds", "NA"
    )
  )

  # Use the "colon-sep" duration style and trim leading and internal time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", trim_zero_units = c("leading", "internal")
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36,323/00:07:12", "5/00:00:00",
      paste0("\U02212", "34/12:00:00"),
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and trim leading and internal time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", trim_zero_units = c("leading", "internal")
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M12S", "P5DT", paste0("\U02212", "P34DT12H"),
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and trim trailing and internal time units
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", trim_zero_units = c("trailing", "internal")
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "0w 1d 4m 19s", "5,189w 7m 12s", "0w 5d", paste0("\U02212", "4w 6d 12h"),
      "4w 3d 14h 24m", "4w 12h", "NA"
    )
  )

  # Use the "wide" duration style and trim trailing and internal time units
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", trim_zero_units = c("trailing", "internal")
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "0 weeks 1 day 4 minutes 19 seconds", "5,189 weeks 7 minutes 12 seconds",
      "0 weeks 5 days", paste0("\U02212", "4 weeks 6 days 12 hours"),
      "4 weeks 3 days 14 hours 24 minutes", "4 weeks 12 hours", "NA"
    )
  )

  # Use the "colon-sep" duration style and trim trailing and internal time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", trim_zero_units = c("trailing", "internal")
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36,323/00:07:12", "5/00:00:00",
      paste0("\U02212", "34/12:00:00"),
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and trim trailing and internal time units
  # (`trim_zero_units` has no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", trim_zero_units = c("trailing", "internal")
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M12S", "P5DT", paste0("\U02212", "P34DT12H"),
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and keep a max of 2 time units
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", max_output_units = 2
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c("1d 4m", "5,189w 7m", "5d", paste0("\U02212", "4w 6d"), "4w 3d", "4w 12h", "NA")
  )

  # Use the "wide" duration style and keep a max of 2 time units
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", max_output_units = 2
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1 day 4 minutes", "5,189 weeks 7 minutes", "5 days",
      paste0("\U02212", "4 weeks 6 days"),
      "4 weeks 3 days", "4 weeks 12 hours", "NA"
    )
  )

  # Use the "colon-sep" duration style and keep a max of 2 time units
  # (`max_output_units` has no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", max_output_units = 2
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36,323/00:07:12", "5/00:00:00",
      paste0("\U02212", "34/12:00:00"),
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and keep a max of 2 time units
  # (`max_output_units` has no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", max_output_units = 2
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M12S", "P5DT", paste0("\U02212", "P34DT12H"),
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and keep a max of 1 time unit
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", max_output_units = 1
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c("1d", "5,189w", "5d", paste0("\U02212", "4w"), "4w", "4w", "NA")
  )

  # Use the "wide" duration style and keep a max of 1 time unit
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", max_output_units = 1) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1 day", "5,189 weeks", "5 days", paste0("\U02212", "4 weeks"),
      "4 weeks", "4 weeks", "NA"
    )
  )

  # Use the "colon-sep" duration style and keep a max of 1 time unit
  # (`max_output_units` has no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", max_output_units = 1
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36,323/00:07:12", "5/00:00:00",
      paste0("\U02212", "34/12:00:00"), "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and keep a max of 1 time unit
  # (`max_output_units` has no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", max_output_units = 1
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M12S", "P5DT", paste0("\U02212", "P34DT12H"),
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and a set of custom output time units
  # (hours and minutes)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("hours", "mins"),
         duration_style = "narrow"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "24h 4m", "871,752h 7m", "120h", paste0("\U02212", "828h"),
      "758h 24m", "684h", "NA"
    )
  )

  # Use the "wide" duration style and a set of custom output time units
  # (hours and minutes)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("hours", "mins"),
         duration_style = "wide"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "24 hours 4 minutes", "871,752 hours 7 minutes", "120 hours",
      paste0("\U02212", "828 hours"), "758 hours 24 minutes", "684 hours", "NA"
    )
  )

  # Use the "colon-sep" duration style and a set of custom output time units
  # (hours and minutes, has an effect on this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("hours", "mins"),
         duration_style = "colon-sep"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "00:04", "00:07", "00:00", paste0("\U02212", "12:00"),
      "14:24", "12:00", "NA"
    )
  )

  # Use the "iso" duration style and a set of custom output time units
  # (hours and minutes, no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("hours", "mins"),
         duration_style = "iso"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M12S", "P5DT", paste0("\U02212", "P34DT12H"),
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and a set of custom output time units
  # (minutes and seconds)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("mins", "secs"),
         duration_style = "narrow"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1,444m 19s", "52,305,127m 12s", "7,200m", paste0("\U02212", "49,680m"),
      "45,504m", "41,040m", "NA"
    )
  )

  # Use the "wide" duration style and a set of custom output time units
  # (minutes and seconds)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("mins", "secs"),
         duration_style = "wide"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1,444 minutes 19 seconds", "52,305,127 minutes 12 seconds",
      "7,200 minutes", paste0("\U02212", "49,680 minutes"),
      "45,504 minutes", "41,040 minutes", "NA"
    )
  )

  # Use the "colon-sep" duration style and a set of custom output time units
  # (minutes and seconds, has an effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("mins", "secs"),
         duration_style = "colon-sep"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c("04:19", "07:12", "00:00", paste0("\U02212", "00:00"), "24:00", "00:00", "NA")
  )

  # Use the "iso" duration style and a set of custom output time units
  # (minutes and seconds, no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("mins", "secs"),
         duration_style = "iso"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M12S", "P5DT", paste0("\U02212", "P34DT12H"),
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and a set of custom output time units
  # (minutes and seconds)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("hours", "mins", "secs"),
         duration_style = "narrow"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "24h 4m 19s", "871,752h 7m 12s", "120h",
      paste0("\U02212", "828h"), "758h 24m", "684h", "NA"
    )
  )

  # Use the "wide" duration style and a set of custom output time units
  # (minutes and seconds)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("hours", "mins", "secs"),
         duration_style = "wide"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "24 hours 4 minutes 19 seconds", "871,752 hours 7 minutes 12 seconds",
      "120 hours", paste0("\U02212", "828 hours"), "758 hours 24 minutes",
      "684 hours", "NA"
    )
  )

  # Use the "colon-sep" duration style and a set of custom output time units
  # (minutes and seconds, has an effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("hours", "mins", "secs"),
         duration_style = "colon-sep"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "00:04:19", "00:07:12", "00:00:00", paste0("\U02212", "12:00:00"),
      "14:24:00", "12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and a set of custom output time units
  # (minutes and seconds, no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("hours", "mins", "secs"),
         duration_style = "iso"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M12S", "P5DT", paste0("\U02212", "P34DT12H"),
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and a set of custom output time units
  # (weeks)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = "weeks",
         duration_style = "narrow"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c("<1w", "5,189w", "<1w", paste0("\U02212", "4w"), "4w", "4w", "NA")
  )

  # Use the "wide" duration style and a set of custom output time units
  # (weeks)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = "weeks",
         duration_style = "wide"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "<1 week", "5,189 weeks", "<1 week", paste0("\U02212", "4 weeks"),
      "4 weeks", "4 weeks", "NA"
    )
  )

  # Use the "colon-sep" duration style and a set of custom output time units
  # (weeks, no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = "weeks",
         duration_style = "colon-sep"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36,323/00:07:12", "5/00:00:00",
      paste0("\U02212", "34/12:00:00"), "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and a set of custom output time units
  # (weeks, no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = "weeks",
         duration_style = "iso"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M12S", "P5DT",
      paste0("\U02212", "P34DT12H"), "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and a set of custom output time units
  # (days and minutes)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("days", "mins"),
         duration_style = "narrow"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1d 4m", "36,323d 7m", "5d", paste0("\U02212", "34d 720m"),
      "31d 864m", "28d 720m", "NA"
    )
  )

  # Use the "wide" duration style and a set of custom output time units
  # (days and minutes)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("days", "mins"),
         duration_style = "wide"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1 day 4 minutes", "36,323 days 7 minutes", "5 days",
      paste0("\U02212", "34 days 720 minutes"),
      "31 days 864 minutes", "28 days 720 minutes", "NA"
    )
  )

  # Use the "colon-sep" duration style and a set of custom output time units
  # (days and minutes, no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("days", "mins"),
         duration_style = "colon-sep"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36,323/00:07:12", "5/00:00:00",
      paste0("\U02212", "34/12:00:00"), "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and a set of custom output time units
  # (days and minutes, no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("days", "mins"),
         duration_style = "iso"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M12S", "P5DT", paste0("\U02212", "P34DT12H"),
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Use the "narrow" duration style and a set of custom output time units
  # (weeks, hours, and seconds)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("weeks", "hours", "secs"),
         duration_style = "narrow"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "24h 259s", "5,189w 432s", "120h", paste0("\U02212", "4w 156h"),
      "4w 86h 1,440s", "4w 12h", "NA"
    )
  )

  # Use the "wide" duration style and a set of custom output time units
  # (weeks, hours, and seconds)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("weeks", "hours", "secs"),
         duration_style = "wide"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "24 hours 259 seconds", "5,189 weeks 432 seconds", "120 hours",
      paste0("\U02212", "4 weeks 156 hours"), "4 weeks 86 hours 1,440 seconds",
      "4 weeks 12 hours", "NA"
    )
  )

  # Use the "colon-sep" duration style and a set of custom output time units
  # (weeks, hours, and seconds; no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("weeks", "hours", "secs"),
         duration_style = "colon-sep"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36,323/00:07:12", "5/00:00:00",
      paste0("\U02212", "34/12:00:00"),
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Use the "iso" duration style and a set of custom output time units
  # (weeks, hours, and seconds; no effect with this duration style)
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         output_units = c("weeks", "hours", "secs"),
         duration_style = "iso"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "P1DT0H4M19S", "P36323DT0H7M12S", "P5DT", paste0("\U02212", "P34DT12H"),
      "P31DT14H24M", "P28DT12H", "NA"
    )
  )

  # Format the `num_1` column using the `use_seps = FALSE` option for
  # the "narrow" duration style
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", use_seps = FALSE
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1d 4m 19s", "5189w 7m 12s", "5d", paste0("\U02212", "4w 6d 12h"),
      "4w 3d 14h 24m", "4w 12h", "NA"
    )
  )

  # Format the `num_1` column using the `use_seps = FALSE` option for
  # the "wide" duration style
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", use_seps = FALSE
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1 day 4 minutes 19 seconds", "5189 weeks 7 minutes 12 seconds",
      "5 days", paste0("\U02212", "4 weeks 6 days 12 hours"),
      "4 weeks 3 days 14 hours 24 minutes", "4 weeks 12 hours", "NA"
    )
  )

  # Format the `num_1` column using the `use_seps = FALSE` option for
  # the "colon-sep" duration style
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", use_seps = FALSE
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36323/00:07:12", "5/00:00:00",
      paste0("\U02212", "34/12:00:00"),
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Format the `num_1` column using the `use_seps = FALSE` option for
  # the "iso" duration style and expect no change from `use_seps = TRUE`
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", use_seps = FALSE
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", use_seps = TRUE
       ) |>
       render_formats_test(context = "html"))[["num_1"]]
  )

  # Format the `num_1` column using the `sep_mark = "."` option for
  # the "narrow" duration style
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", sep_mark = "."
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1d 4m 19s", "5.189w 7m 12s", "5d", paste0("\U02212", "4w 6d 12h"),
      "4w 3d 14h 24m", "4w 12h", "NA"
    )
  )

  # Format the `num_1` column using the `sep_mark = "."` option for
  # the "wide" duration style
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", sep_mark = "."
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1 day 4 minutes 19 seconds", "5.189 weeks 7 minutes 12 seconds",
      "5 days", paste0("\U02212", "4 weeks 6 days 12 hours"),
      "4 weeks 3 days 14 hours 24 minutes", "4 weeks 12 hours", "NA"
    )
  )

  # Format the `num_1` column using the `sep_mark = "."` option for
  # the "colon-sep" duration style
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "colon-sep", sep_mark = "."
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1/00:04:19", "36.323/00:07:12", "5/00:00:00",
      paste0("\U02212", "34/12:00:00"),
      "31/14:24:00", "28/12:00:00", "NA"
    )
  )

  # Format the `num_1` column using the `sep_mark = "."` option for
  # the "iso" duration style and expect no change from `sep_mark = ","`
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", sep_mark = "."
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "iso", sep_mark = ","
       ) |>
       render_formats_test(context = "html"))[["num_1"]]
  )

  # Format the `num_1` column using the `force_sign = TRUE` option for
  # the "narrow" duration style
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", force_sign = TRUE
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "+1d 4m 19s", "+5,189w 7m 12s", "+5d", paste0("\U02212", "4w 6d 12h"),
      "+4w 3d 14h 24m", "+4w 12h", "NA"
    )
  )

  # Format the `num_1` column using the `force_sign = TRUE` option for
  # the "wide" duration style
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", force_sign = TRUE
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "+1 day 4 minutes 19 seconds",
      "+5,189 weeks 7 minutes 12 seconds",
      "+5 days", paste0("\U02212", "4 weeks 6 days 12 hours"),
      "+4 weeks 3 days 14 hours 24 minutes",
      "+4 weeks 12 hours", "NA"
    )
  )

  # Format the `num_1` column using the `force_sign = TRUE` option for
  # the "colon-sep" duration style
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "hours",
         duration_style = "colon-sep", force_sign = TRUE
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "+01:00:10", "+1,513/11:00:17", "+05:00:00",
      paste0("\U02212", "1/10:30:00"), "+1/07:36:00", "+1/04:30:00", "NA"
    )
  )

  # Format the `num_1` column using the `force_sign = TRUE` option for
  # the "colon-sep" duration style
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "hours",
         duration_style = "iso", force_sign = TRUE
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "+P1H0M10S", "+P1513DT11H0M17S", "+P5H",
      paste0("\U02212", "P1DT10H30M"),
      "+P1DT7H36M", "+P1DT4H30M", "NA"
    )
  )

  # Format the `num_1` column using the "narrow" duration style with
  # a `pattern`
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "narrow", pattern = "({x})"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "(1d 4m 19s)", "(5,189w 7m 12s)", "(5d)", paste0("(\U02212", "4w 6d 12h)"),
      "(4w 3d 14h 24m)", "(4w 12h)", "NA"
    )
  )

  # Format the `num_1` column using the "wide" duration style with
  # a `pattern`
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days",
         duration_style = "wide", pattern = "({x})"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "(1 day 4 minutes 19 seconds)", "(5,189 weeks 7 minutes 12 seconds)",
      "(5 days)", paste0("(\U02212", "4 weeks 6 days 12 hours)"),
      "(4 weeks 3 days 14 hours 24 minutes)", "(4 weeks 12 hours)", "NA"
    )
  )

  # Format the `num_1` column using the "colon-sep" duration style with
  # a `pattern`
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "hours",
         duration_style = "colon-sep", pattern = "({x})"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "(01:00:10)", "(1,513/11:00:17)", "(05:00:00)",
      paste0("(\U02212", "1/10:30:00)"),
      "(1/07:36:00)", "(1/04:30:00)", "NA"
    )
  )

  # Format the `num_1` column using the "iso" duration style with
  # a `pattern`
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "hours",
         duration_style = "iso", pattern = "({x})"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "(P1H0M10S)", "(P1513DT11H0M17S)", "(P5H)",
      paste0("(\U02212", "P1DT10H30M)"),
      "(P1DT7H36M)", "(P1DT4H30M)", "NA"
    )
  )

  # Create another input data frame with a numeric column
  data_tbl_2 <-
    data.frame(
      num_1 = c(5500, -3500, 0.03, -0.03, 0, 0.005, NA)
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl_2` dataset
  tab_2 <- gt(data_tbl_2)

  # Format the `num_1` column using the defaults for `fmt_duration()` and
  # ensuring the `input_units` are seconds
  expect_equal(
    (tab_2 |>
       fmt_duration(columns = "num_1", input_units = "seconds") |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1h 31m 40s", paste0("\U02212", "58m 20s"), "<1s",
      paste0("\U02212", "<1s"), "0s", "<1s", "NA"
    )
  )

  # Expect that using `input_units = "secs"' produces the same results
  expect_equal(
    (tab_2 |>
       fmt_duration(columns = "num_1", input_units = "secs") |>
       render_formats_test(context = "html"))[["num_1"]],
    (tab_2 |>
       fmt_duration(columns = "num_1", input_units = "seconds") |>
       render_formats_test(context = "html"))[["num_1"]]
  )

  # Format the `num_1` column using the defaults for `fmt_duration()` and
  # ensuring the `input_units` are minutes
  expect_equal(
    (tab_2 |>
       fmt_duration(columns = "num_1", input_units = "minutes") |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "3d 19h 40m", paste0("\U02212", "2d 10h 20m"), "1s",
      paste0("\U02212", "1s"), "0s", "<1s", "NA"
    )
  )

  # Expect that using `input_units = "mins"' produces the same results
  expect_equal(
    (tab_2 |>
       fmt_duration(columns = "num_1", input_units = "mins") |>
       render_formats_test(context = "html"))[["num_1"]],
    (tab_2 |>
       fmt_duration(columns = "num_1", input_units = "minutes") |>
       render_formats_test(context = "html"))[["num_1"]]
  )

  # Format the `num_1` column using the defaults for `fmt_duration()` and
  # ensuring the `input_units` are hours
  expect_equal(
    (tab_2 |>
       fmt_duration(columns = "num_1", input_units = "hours") |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "32w 5d 4h", paste0("\U02212", "20w 5d 20h"), "1m 48s",
      paste0("\U02212", "1m 48s"), "0s", "18s", "NA"
    )
  )

  # Format the `num_1` column using the defaults for `fmt_duration()` and
  # ensuring the `input_units` are days
  expect_equal(
    (tab_2 |>
       fmt_duration(columns = "num_1", input_units = "days") |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "785w 5d", paste0("\U02212", "500w"), "43m 12s",
      paste0("\U02212", "43m 12s"), "0s", "7m 12s", "NA"
    )
  )

  # Format the `num_1` column using the defaults for `fmt_duration()` and
  # ensuring the `input_units` are weeks
  expect_equal(
    (tab_2 |>
       fmt_duration(columns = "num_1", input_units = "weeks") |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "5,500w", paste0("\U02212", "3,500w"), "5h 2m 24s",
      paste0("\U02212", "5h 2m 24s"), "0s", "50m 24s", "NA"
    )
  )
})

test_that("fmt_duration() works correctly with integer inputs", {

  # Create an input data frame with an integer column
  data_tbl_1 <- data.frame(int_1 =  seq(90L, 93L))

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl_1` dataset
  tab_1 <- gt(data_tbl_1)

  # Format the `num_1` column using the defaults for `fmt_duration()` and
  # ensuring the `input_units` are weeks
  expect_equal(
    (tab_1 |>
       fmt_duration(columns = "int_1", input_units = "weeks") |>
       render_formats_test(context = "html"))[["int_1"]],
    c(
      "90w", "91w", "92w", "93w"
    )
  )

  # Format the `num_1` column using the defaults for `fmt_duration()` and
  # ensuring the `input_units` are days
  expect_equal(
    (tab_1 |>
       fmt_duration(columns = "int_1", input_units = "days") |>
       render_formats_test(context = "html"))[["int_1"]],
    c(
      "12w 6d", "13w", "13w 1d", "13w 2d"
    )
  )

  # Format the `num_1` column using the defaults for `fmt_duration()` and
  # ensuring the `input_units` are hours
  expect_equal(
    (tab_1 |>
       fmt_duration(columns = "int_1", input_units = "hours") |>
       render_formats_test(context = "html"))[["int_1"]],
    c(
      "3d 18h", "3d 19h", "3d 20h", "3d 21h"
    )
  )

  # Format the `num_1` column using the defaults for `fmt_duration()` and
  # ensuring the `input_units` are minutes
  expect_equal(
    (tab_1 |>
       fmt_duration(columns = "int_1", input_units = "minutes") |>
       render_formats_test(context = "html"))[["int_1"]],
    c(
      "1h 30m", "1h 31m", "1h 32m", "1h 33m"
    )
  )

  # Format the `num_1` column using the defaults for `fmt_duration()` and
  # ensuring the `input_units` are seconds
  expect_equal(
    (tab_1 |>
       fmt_duration(columns = "int_1", input_units = "seconds") |>
       render_formats_test(context = "html"))[["int_1"]],
    c(
      "1m 30s", "1m 31s", "1m 32s", "1m 33s"
    )
  )

  # Format the `num_1` column using the defaults for `fmt_duration()` and
  # ensuring the `input_units` are seconds and the output is in seconds
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "int_1",
         input_units = "seconds",
         output_units = "seconds"
       ) |>
       render_formats_test(context = "html"))[["int_1"]],
    c(
      "90s", "91s", "92s", "93s"
    )
  )

  # Format the `num_1` column using the defaults for `fmt_duration()` and
  # ensuring the `input_units` are seconds and the output is in minutes
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "int_1",
         input_units = "seconds",
         output_units = "minutes"
       ) |>
       render_formats_test(context = "html"))[["int_1"]],
    c(
      "1m", "1m", "1m", "1m"
    )
  )

  # Format the `num_1` column using the defaults for `fmt_duration()` and
  # ensuring the `input_units` are seconds and the output is in hours
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "int_1",
         input_units = "seconds",
         output_units = "hours"
       ) |>
       render_formats_test(context = "html"))[["int_1"]],
    c(
      "<1h", "<1h", "<1h", "<1h"
    )
  )

  # Format the `num_1` column using the defaults for `fmt_duration()` and
  # ensuring the `input_units` are seconds and the output is in days
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "int_1",
         input_units = "seconds",
         output_units = "days"
       ) |>
       render_formats_test(context = "html"))[["int_1"]],
    c(
      "<1d", "<1d", "<1d", "<1d"
    )
  )
})

test_that("Specialized handling of the `colon-sep` format works correctly", {

  # Create an input tibble with a numeric column
  data_tbl_1 <-
    dplyr::tibble(
      num_1 = c(1.0030, 36323.005, 5.000003, -34.5, 31.6, 28.5, NA)
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl_1` dataset
  tab_1 <- gt(data_tbl_1)

  # Using `output_units` of "minutes" and "seconds" will truncate duration
  # values to only display those units
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days", duration_style = "colon-sep",
         output_units = c("minutes", "seconds")
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "04:19", "07:12", "00:00", paste0("\U02212", "00:00"),
      "24:00", "00:00", "NA"
    )
  )

  # Using `output_units` of "hours" and "minutes" will truncate duration
  # values to only display those units
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days", duration_style = "colon-sep",
         output_units = c("hours", "minutes")
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "00:04", "00:07", "00:00", paste0("\U02212", "12:00"),
      "14:24", "12:00", "NA"
    )
  )

  # Using `output_units` of "hours",  "minutes", and "seconds" will truncate
  # duration values to only display those units
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days", duration_style = "colon-sep",
         output_units = c("hours", "minutes", "seconds")
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "00:04:19", "00:07:12", "00:00:00", paste0("\U02212", "12:00:00"),
      "14:24:00", "12:00:00", "NA"
    )
  )

  # Using `trim_zero_units = "leading"` with output units of "hours",
  # "minutes", and "seconds" will remove the "hours" unit only if that output
  # unit is zero
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days", duration_style = "colon-sep",
         output_units = c("hours", "minutes", "seconds"),
         trim_zero_units = "leading"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "04:19", "07:12", "00:00", paste0("\U02212", "12:00:00"),
      "14:24:00", "12:00:00", "NA"
    )
  )

  # Expect that any other valid variation of `trim_zero_units` won't remove
  # the zero-value "hours" unit
  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days", duration_style = "colon-sep",
         output_units = c("hours", "minutes", "seconds"),
         trim_zero_units = "trailing"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "00:04:19", "00:07:12", "00:00:00", paste0("\U02212", "12:00:00"),
      "14:24:00", "12:00:00", "NA"
    )
  )

  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days", duration_style = "colon-sep",
         output_units = c("hours", "minutes", "seconds"),
         trim_zero_units = "internal"
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "00:04:19", "00:07:12", "00:00:00", paste0("\U02212", "12:00:00"),
      "14:24:00", "12:00:00", "NA"
    )
  )

  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days", duration_style = "colon-sep",
         output_units = c("hours", "minutes", "seconds"),
         trim_zero_units = c("leading", "trailing")
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "00:04:19", "00:07:12", "00:00:00", paste0("\U02212", "12:00:00"),
      "14:24:00", "12:00:00", "NA"
    )
  )

  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days", duration_style = "colon-sep",
         output_units = c("hours", "minutes", "seconds"),
         trim_zero_units = c("leading", "internal")
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "00:04:19", "00:07:12", "00:00:00", paste0("\U02212", "12:00:00"),
      "14:24:00", "12:00:00", "NA"
    )
  )

  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days", duration_style = "colon-sep",
         output_units = c("hours", "minutes", "seconds"),
         trim_zero_units = c("internal", "trailing")
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "00:04:19", "00:07:12", "00:00:00", paste0("\U02212", "12:00:00"),
      "14:24:00", "12:00:00", "NA"
    )
  )

  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days", duration_style = "colon-sep",
         output_units = c("hours", "minutes", "seconds"),
         trim_zero_units = TRUE
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "00:04:19", "00:07:12", "00:00:00", paste0("\U02212", "12:00:00"),
      "14:24:00", "12:00:00", "NA"
    )
  )

  expect_equal(
    (tab_1 |>
       fmt_duration(
         columns = "num_1", input_units = "days", duration_style = "colon-sep",
         output_units = c("hours", "minutes", "seconds"),
         trim_zero_units = FALSE
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "00:04:19", "00:07:12", "00:00:00", paste0("\U02212", "12:00:00"),
      "14:24:00", "12:00:00", "NA"
    )
  )
})

test_that("fmt_duration() works correctly with difftime inputs", {

  dt_1 <- ISOdatetime(year = 2015, month = 6, day = 3:5, hour = 3:5, min = 5:7, sec = 25:27, tz = "GMT")
  dt_2 <- ISOdatetime(year = 2015, month = 6, day = c(5, 8, 12), hour = 5:7, min = 30:32, sec = 0:2, tz = "GMT")

  data_tbl_3 <-
    dplyr::tibble(
      weeks = c(difftime(dt_1, dt_2, units = "weeks")),
      days = c(difftime(dt_1, dt_2, units = "days")),
      hours = c(difftime(dt_1, dt_2, units = "hours")),
      minutes = c(difftime(dt_1, dt_2, units = "mins")),
      seconds = c(difftime(dt_1, dt_2, units = "secs"))
    ) |>
    dplyr::add_row()

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl_3` dataset
  tab_3 <- gt(data_tbl_3)

  # Format the `weeks` column using the defaults for `fmt_duration()`
  expect_equal(
    (tab_3 |>
       fmt_duration(columns = "weeks") |>
       render_formats_test(context = "html"))[["weeks"]],
    c(
      paste0("\U02212", "2d 2h 24m 35s"),
      paste0("\U02212", "4d 2h 24m 35s"),
      paste0("\U02212", "1w 2h 24m 35s"),
      NA
    )
  )

  # Expect that every other column produces the same cell data since they
  # are the same duration values, just expressed with different units
  expect_equal(
    (tab_3 |>
       fmt_duration(columns = "weeks") |>
       render_formats_test(context = "html"))[["weeks"]],
    (tab_3 |>
       fmt_duration(columns = "days") |>
       render_formats_test(context = "html"))[["days"]]
  )

  expect_equal(
    (tab_3 |>
       fmt_duration(columns = "weeks") |>
       render_formats_test(context = "html"))[["weeks"]],
    (tab_3 |>
       fmt_duration(columns = "hours") |>
       render_formats_test(context = "html"))[["hours"]]
  )

  expect_equal(
    (tab_3 |>
       fmt_duration(columns = "hours") |>
       render_formats_test(context = "html"))[["hours"]],
    (tab_3 |>
       fmt_duration(columns = "seconds") |>
       render_formats_test(context = "html"))[["seconds"]]
  )

  expect_equal(
    (tab_3 |>
       fmt_duration(columns = "weeks") |>
       render_formats_test(context = "html"))[["weeks"]],
    (tab_3 |>
       fmt_duration(columns = "seconds") |>
       render_formats_test(context = "html"))[["seconds"]]
  )
})

test_that("fmt_duration() works well with mixed numeric/difftime inputs", {

  dt_1 <- ISOdatetime(year = 2015, month = 6, day = 3:5, hour = 3:5, min = 5:7, sec = 25:27, tz = "GMT")
  dt_2 <- ISOdatetime(year = 2015, month = 6, day = c(5, 8, 12), hour = 5:7, min = 30:32, sec = 0:2, tz = "GMT")

  data_tbl_4 <-
    dplyr::tibble(
      weeks = c(difftime(dt_1, dt_2, units = "weeks")),
      days = c(difftime(dt_1, dt_2, units = "days")),
      hours = c(difftime(dt_1, dt_2, units = "hours")),
      minutes = c(difftime(dt_1, dt_2, units = "mins")),
      seconds = c(difftime(dt_1, dt_2, units = "secs"))
    ) |>
    dplyr::mutate(
      duration_hours = c(2.34, 6.23, 75.249)
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl_3` dataset
  tab_4 <- gt(data_tbl_4)

  # Format the `weeks` and `duration_hours` columns using the defaults
  # for `fmt_duration()`; expect correct duration values for in the
  # `duration_hours` column
  expect_equal(
    (tab_4 |>
       fmt_duration(columns = c("weeks", "duration_hours"), input_units = "hours") |>
       render_formats_test(context = "html"))[["duration_hours"]],
    c("2h 20m 24s", "6h 13m 48s", "3d 3h 14m 56s")
  )

  # Expect that, for the same expression, that the formatting of the
  # `weeks` column isn't tainted by the necessary addition of `input_units`
  expect_equal(
    (tab_4 |>
       fmt_duration(columns = c("weeks", "duration_hours"), input_units = "hours") |>
       render_formats_test(context = "html"))[["weeks"]],
    (tab_4 |>
       fmt_duration(columns = "weeks") |>
       render_formats_test(context = "html"))[["weeks"]]
  )
})

test_that("fmt_duration() can produce localized outputs", {

  # Create an input tibble with a numeric column
  data_tbl_5 <-
    dplyr::tibble(
      num_1 = c(1.0030, 36323.005, 5.000003, -34.5, 31.6, 28.5, NA)
    )

  # Get a vector of some of the supported locales
  sample_locales <-
    c(
      "af", "ak", "ar", "as", "asa", "ast", "az", "be", "bem", "bez", "bg",
      "bm", "bn", "bo", "bs", "ca", "ccp", "ce", "ceb", "cgg", "chr",
      "ckb", "cy", "da", "dav", "de", "dje", "dua", "dyo", "dz", "ebu",
      "ee", "el", "en", "eo", "es", "et", "eu", "ewo", "fa", "ff",
      "fi", "fil", "fo", "fr", "fur", "fy", "ga", "gd", "gl", "gsw",
      "guz", "gv", "haw", "he", "hi", "hr", "hsb", "hy", "id", "ig",
      "ii", "it", "ja", "jgo", "jmc", "jv", "ka", "kab", "kam", "kde",
      "kea", "kgp", "khq", "ki", "kk", "kkj", "kl", "kln", "km", "kn",
      "ko", "kok", "ks", "ksf", "ksh", "ky", "lag", "lb", "lkt", "ln",
      "lo", "lt", "lu", "luo", "luy", "lv", "mai", "mer", "mfe", "mg",
      "mgh", "mk", "ml", "mn", "mni", "mt", "mua", "my", "mzn", "naq",
      "nb", "nd", "ne", "nl", "nn", "nnh", "no", "nus", "om", "or",
      "os", "pa", "pcm", "pl", "pt", "rm", "rn", "ro", "rof", "rw",
      "rwk", "sa", "sah", "saq", "sat", "sbp", "sc", "sd", "se", "seh",
      "ses", "sg", "shi", "si", "sk", "sl", "smn", "sn", "so", "sq",
      "su", "sw", "ta", "te", "tg", "ti", "tk", "to", "tr", "tt", "twq",
      "tzm", "ug", "uk", "und", "ur", "uz", "vai", "vi", "vun", "wae",
      "wo", "xog", "yav", "yo", "yrl", "yue", "zgh", "zh", "zu"
    )

  # Replicate single column to match number of locales and rename columns
  suppressMessages(
    data_tbl_5 <-
      dplyr::bind_cols(data_tbl_5, rep(data_tbl_5[, 1], length(sample_locales) - 1))
  )
  colnames(data_tbl_5) <- sample_locales

  # Create two `gt_tbl` objects with `gt()` and the `data_tbl_5` dataset
  tab_narrow <- tab_wide <- gt(data_tbl_5)

  # Ensure outputs are correctly localized for the 'narrow'
  # and 'wide' duration styles
  for (i in seq_along(sample_locales)) {

    tab_narrow <-
      tab_narrow |>
      fmt_duration(
        columns = sample_locales[i], input_units = "days",
        duration_style = "narrow", locale = sample_locales[i]
      )

    tab_wide <-
      tab_wide |>
      fmt_duration(
        columns = sample_locales[i], input_units = "days",
        duration_style = "wide", locale = sample_locales[i]
      )
  }

  # Add basic styling for better legibility
  tab_narrow <-
    tab_narrow |>
    cols_width(everything() ~ px(175)) |>
    cols_align(align = "left", columns = everything()) |>
    tab_style(style = cell_text(size = "smaller"), locations = cells_body())

  tab_wide <-
    tab_wide |>
    cols_width(everything() ~ px(275)) |>
    cols_align(align = "left", columns = everything()) |>
    tab_style(style = cell_text(size = "smaller"), locations = cells_body())

  # Perform snapshot tests
  expect_snapshot_html(tab_narrow)

  expect_snapshot_html(tab_wide)
})

test_that("fmt_duration() will error in specific cases", {

  dt_1 <- ISOdatetime(year = 2015, month = 6, day = 3:5, hour = 3:5, min = 5:7, sec = 25:27, tz = "GMT")
  dt_2 <- ISOdatetime(year = 2015, month = 6, day = c(5, 8, 12), hour = 5:7, min = 30:32, sec = 0:2, tz = "GMT")

  # Create an input tibble with a numeric column
  data_tbl_6 <-
    dplyr::tibble(num_1 = c(1.0030, 36323.005, 0.343), dur_1 = c(difftime(dt_1, dt_2, units = "weeks")))

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl_6` dataset
  tab_6 <- gt(data_tbl_6)

  # Expect an error if `input_units` not provided when numeric columns are
  # to be formatted
  expect_error(tab_6 |> fmt_duration(columns = "num_1"))

  expect_error(tab_6 |> fmt_duration(columns = c("num_1", "dur_1")))

  expect_no_error(tab_6 |> fmt_duration(columns = "dur_1"))

  # Expect an error if `input_units` is invalid
  expect_error(tab_6 |> fmt_duration(columns = "num_1", input_units = "Stunden"))

  expect_error(tab_6 |> fmt_duration(columns = "num_1", input_units = c("hours", "minutes")))

  expect_error(tab_6 |> fmt_duration(columns = "num_1", input_units = character(0L)))

  expect_error(tab_6 |> fmt_duration(columns = "num_1", input_units = 1))

  # Expect an error if `output_units` is invalid
  expect_error(tab_6 |> fmt_duration(columns = "num_1", input_units = "hours", output_units = "Stunden"))

  expect_error(tab_6 |> fmt_duration(columns = "num_1", input_units = "hours", output_units = c("days", "weeks", "years")))

  expect_error(tab_6 |> fmt_duration(columns = "num_1", input_units = "hours", output_units = character(0L)))

  expect_error(tab_6 |> fmt_duration(columns = "num_1", input_units = "hours", output_units = 1))

  # Expect an error if `duration_style` is invalid
  expect_error(tab_6 |> fmt_duration(columns = "num_1", input_units = "hours", duration_style = "style"))

  # Expect an error if `trim_zero_units` is invalid
  expect_error(tab_6 |> fmt_duration(columns = "num_1", input_units = "hours", trim_zero_units = "infernal"))

  expect_error(tab_6 |> fmt_duration(columns = "num_1", input_units = "hours", trim_zero_units = 2))

  expect_error(tab_6 |> fmt_duration(columns = "num_1", input_units = "hours", trim_zero_units = NULL))

  expect_no_error(tab_6 |> fmt_duration(columns = "num_1", input_units = "hours", trim_zero_units = c("leading", "leading")))

  # Expect an error if `max_output_units` is invalid
  expect_error(tab_6 |> fmt_duration(columns = "num_1", input_units = "hours", max_output_units = "max"))

  expect_error(tab_6 |> fmt_duration(columns = "num_1", input_units = "hours", max_output_units = 0))

  expect_error(tab_6 |> fmt_duration(columns = "num_1", input_units = "hours", max_output_units = -1))

  expect_error(tab_6 |> fmt_duration(columns = "num_1", input_units = "hours", max_output_units = c(2, 3)))

  expect_no_error(tab_6 |> fmt_duration(columns = "num_1", input_units = "hours", max_output_units = NULL))

  expect_no_error(tab_6 |> fmt_duration(columns = "num_1", input_units = "hours", max_output_units = Inf))
})
