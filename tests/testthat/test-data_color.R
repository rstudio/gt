# Create a table that can be used for testing
test_tbl <-
  sza |>
  dplyr::filter(latitude == 50, !is.na(sza)) |>
  dplyr::group_by(month) |>
  dplyr::summarize(min_sza = min(sza))

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
}

check_suggests()

test_that("The correct color values are obtained when defining a palette", {

  skip_if_not_installed("paletteer")
  skip_if_not_installed("farver") # For non-default `autocolor_light|dark`

  # Obtain a palette of 12 colors in #RRGGBB format
  pal_12 <-
    gsub(
      "FF$",
      "",
      as.character(paletteer::paletteer_d(palette = "rcartocolor::Vivid"))
    )

  # Create a `tbl_html` object by using `data_color` with the #RRGGBB
  # colors on the month column (which is of the `character` class)
  tbl_html_1 <-
    test_tbl |>
    dplyr::mutate(month = as.character(month)) |>
    gt() |>
    data_color(
      columns = "month",
      palette = pal_12,
      autocolor_text = TRUE
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the background colors are in the same form as
  # those supplied (`pal_12`) though not necessarily in the same
  # order as in the `pal_12` vector
  gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_1, "style")) |>
    expect_in(pal_12)

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  gsub("(.*: |;$)", "", selection_value(tbl_html_1, "style")) |>
    expect_in(c("#000000", "#FFFFFF"))

  # When using `autocolor_text = FALSE` expect to not see the
  # `color` attribute in any of the colored cells of the `month` column
  test_tbl |>
    dplyr::mutate(month = as.character(month)) |>
    gt() |>
    data_color(
      columns = month,
      palette = pal_12,
      autocolor_text = FALSE
    ) |>
    render_as_html() |>
    xml2::read_html() |>
    selection_value("style") |>
    expect_no_match("[^-]color:")

  # Create a `tbl_html_2` object by using `data_color` with the #RRGGBB
  # colors on the month column (which is of the `factor` class)
  tbl_html_2 <-
    test_tbl |>
    gt() |>
    data_color(
      columns = month,
      palette = pal_12,
      autocolor_text = TRUE
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the background colors are in the same form as
  # those supplied (`pal_12`) and the order is identical as well
  expect_equal(
    gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_2, "style")),
    pal_12
  )

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  gsub("(.*: |;$)", "", selection_value(tbl_html_2, "style")) |>
    expect_in(c("#000000", "#FFFFFF"))

  # When using `autocolor_text = FALSE` expect to not see the
  # `color` attribute in any of the colored cells of the `month`
  # column
  test_tbl |>
    gt() |>
    data_color(
      columns = month,
      palette = pal_12,
      autocolor_text = FALSE
    ) |>
    render_as_html() |>
    xml2::read_html() |>
    selection_value("style") |>
    expect_no_match("[^-]color:")

  # Create a `tbl_html_3` object by using `data_color` with the color names
  # (arranged from 'hot' to 'cold' in the vector) on the `min_sza` column
  # (which is of the `numeric` class)
  tbl_html_3 <-
    test_tbl |>
    gt() |>
    data_color(
      columns = min_sza,
      palette = c("red", "orange", "green", "blue"),
      autocolor_text = TRUE
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect 12 unique color values to have been generated and
  # used (because this relates to a numeric mapping)
  gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_3, "style")) |>
    unique() |>
    expect_length(12)

  # Expect all color values to be of the #RRGGBB form
  gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_3, "style")) |>
    expect_match("^#[0-9A-F]{6}$")

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  gsub("(.*: |;$)", "", selection_value(tbl_html_3, "style")) |>
    expect_in(c("#000000", "#FFFFFF"))

  # Create a `tbl_html_rrggbb` object by using `data_color` with color values
  # written in the #RRGGBB form (arranged in the same way as before);
  # again, applied to the `min_sza` column
  rgb_hex_colors <- c("#FF0000", "#FFA500", "#00FF00", "#0000FF")

  tbl_html_rrggbb <-
    test_tbl |>
    gt() |>
    data_color(
      columns = min_sza,
      palette = rgb_hex_colors,
      autocolor_text = TRUE
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect 12 unique color values to have been generated and used
  gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_rrggbb, "style")) |>
    unique() |>
    expect_length(12)

  # Expect all color values to be of the #RRGGBB form
  gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_rrggbb, "style")) |>
    expect_match("^#[0-9A-F]{6}$")

  # Expect all color values to be identical to those from
  # the table that was generated from color names
  expect_identical(
    gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_3, "style")),
    gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_rrggbb, "style"))
  )

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  gsub("(.*: |;$)", "", selection_value(tbl_html_rrggbb, "style")) |>
    expect_in(c("#000000", "#FFFFFF"))

  # Create a `tbl_html_rrggbbaa` object by using `data_color` with color values
  # written in the #RRGGBBAA form (arranged in the same way as before,
  # having different alpha channel values)
  rgba_hex_colors <- c("#FF000060", "#FFA500FF", "#00FF0090", "#0000BB")

  tbl_html_rrggbbaa <-
    test_tbl |>
    gt() |>
    data_color(
      columns = min_sza,
      palette = rgba_hex_colors,
      autocolor_text = TRUE
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect 12 unique color values to have been generated and used
  gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_rrggbbaa, "style")) |>
    unique() |>
    expect_length(12)

  # Expect color values to be of either the #RRGGBB or the
  # 'rgba()' CSS value form
  gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_rrggbbaa, "style")) |>
    expect_match("(?:^#[0-9A-F]{6}$|^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$)")

  # Expect the alpha values to have interpolation, yielding
  # several different values between 0 and 1
  gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_rrggbbaa, "style"))[-1] |>
    rgba_to_hex() |>
    substring(8, 9) |>
    unique() |>
    length() |>
    expect_gt(6)

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  gsub("(.*: |;$)", "", selection_value(tbl_html_rrggbbaa, "style")) |>
    expect_in(c("#000000", "#FFFFFF"))

  # Create a `tbl_html_rrggbbaa_mixed` object by using `data_color` with
  # color values written with mixed #RRGGBB and #RRGGBBAA forms
  # (arranged in the same way)
  rgba_hex_colors_mixed <- c("#FF0000", "#FFA50060", "#00FF00", "#0000BB90")

  tbl_html_rrggbbaa_mixed <-
    test_tbl |>
    gt() |>
    data_color(
      columns = min_sza,
      palette = rgba_hex_colors_mixed,
      autocolor_text = TRUE
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect 12 unique color values to have been generated and used
  gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_rrggbbaa_mixed, "style")) |>
    unique() |>
    expect_length(12)

  # Expect color values to be of either the #RRGGBB or the
  # 'rgba()' CSS value form
  gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_rrggbbaa_mixed, "style")) |>
    expect_match("(?:^#[0-9A-F]{6}$|^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$)")

  # Expect the alpha values to have interpolation, yielding
  # several different values between 0 and 1
  sorted <-
    sort(
      gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_rrggbbaa_mixed, "style"))
    )

  sorted_length <- length(sorted)

  sorted[3:sorted_length] |>
    rgba_to_hex() |>
    substring(8, 9) |>
    unique() |>
    length() |>
    expect_gt(6)

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  gsub("(.*: |;$)", "", selection_value(tbl_html_rrggbbaa_mixed, "style")) |>
    expect_in(c("#000000", "#FFFFFF"))

  # Create a `rgba_hex_colors_mixed_2` object by using `data_color` with
  # color values written with mixed #RRGGBB, #RRGGBBAA, and named forms
  rgba_hex_colors_mixed_2 <- c("red", "#FFA50060", "#00FF00", "#0000BB90")

  tbl_html_rrggbbaa_mixed_2 <-
    test_tbl |>
    gt() |>
    data_color(
      columns = min_sza,
      palette = rgba_hex_colors_mixed_2,
      autocolor_text = TRUE
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect 12 unique color values to have been generated and used
  gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_rrggbbaa_mixed_2, "style")) |>
    unique() |>
    expect_length(12)

  # Expect color values to be of either the #RRGGBB or the
  # 'rgba()' CSS value form
  gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_rrggbbaa_mixed_2, "style")) |>
    expect_match("(?:^#[0-9A-F]{6}$|^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$)")

  # Expect all color values to be identical to those from
  # the previous table
  expect_identical(
    gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_rrggbbaa_mixed, "style")),
    gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_rrggbbaa_mixed_2, "style"))
  )

  # Expect the alpha values to have interpolation, yielding
  # several different values between 0 and 1
  sorted <- sort(
    gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_rrggbbaa_mixed_2, "style"))
  )

  sorted_length <- length(sorted)

  sorted[3:sorted_length] |>
    rgba_to_hex() |>
    substring(8, 9) |>
    unique() |>
    length() |>
    expect_gt(6)

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  gsub("(.*: |;$)", "", selection_value(tbl_html_rrggbbaa_mixed_2, "style")) |>
    expect_in(c("#000000", "#FFFFFF"))

  # Create a `tbl_html_4` object by using `data_color` with the #RRGGBB
  # colors on the month column (which is of the `character` class);
  # this time, set `alpha` equal to 1
  tbl_html_4 <-
    test_tbl |>
    dplyr::mutate(month = as.character(month)) |>
    gt() |>
    data_color(
      columns = month,
      palette = pal_12,
      autocolor_text = TRUE,
      alpha = 1
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the background colors are in the same form as
  # those supplied (`pal_12`) though not necessarily in the same
  # order as in the `pal_12` vector
  gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_4, "style")) |>
    expect_in(pal_12)

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  gsub("(.*: |;$)", "", selection_value(tbl_html_4, "style")) |>
    expect_in(c("#000000", "#FFFFFF"))

  # When using `autocolor_text = FALSE` expect to not see the
  # `color` attribute in any of the colored cells of the `month` column
  test_tbl |>
    dplyr::mutate(month = as.character(month)) |>
    gt() |>
    data_color(
      columns = month,
      palette = pal_12,
      autocolor_text = FALSE,
      alpha = 1
    ) |>
    render_as_html() |>
    xml2::read_html() |>
    selection_value("style") |>
    expect_no_match("[^-]color:")

  # Expect all color values to be identical to those from
  # `tbl_html_1`
  expect_identical(
    gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_4, "style")),
    gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_1, "style"))
  )

  # Create a `tbl_html_5` object by using `data_color` with the #RRGGBB
  # colors on the month column (which is of the `character` class);
  # this time, set `alpha` equal to 0.5
  tbl_html_5 <-
    test_tbl |>
    dplyr::mutate(month = as.character(month)) |>
    gt() |>
    data_color(
      columns = month,
      palette = pal_12,
      autocolor_text = TRUE,
      alpha = 0.5
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect color values to be entirely in the 'rgba()' CSS value form
  gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_5, "style")) |>
    expect_match("^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$")

  # Expect the same test result by using `is_rgba_col()`
  tbl_html_5 |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    is_rgba_col() |>
    all() |>
    expect_true()

  # Expect that all alpha values are 0.5 (or "80" as a hex value)
  gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_5, "style")) |>
    rgba_to_hex() |>
    substring(8, 9) |>
    unique() |>
    expect_equal("80")

  # Converting the 'rgba()' values back into hexadecimal form and
  # removing the alpha channel (by use of `html_color()`) is expected
  # to give us color values in the `pal_12` #RRGGBB color vector
  gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_5, "style")) |>
    rgba_to_hex() |>
    html_color(alpha = 1) |>
    expect_in(pal_12)

  # Create a `tbl_html_6` object by using `data_color` with color names (random
  # selection) on the `min_sza` column (which is of the `numeric` class); this
  # time use non-default `autocolor_light` and `autocolor_dark` with #RRGGBB
  # format
  tbl_html_6 <-
    test_tbl |>
    gt() |>
    data_color(
      columns = min_sza,
      palette = c("red", "white", "blue"),
      autocolor_text = TRUE,
      autocolor_light = "#EEE9E9",
      autocolor_dark = "#0D0D0D"
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the text colors vary between #0D0D0D and #EEE9E9
  # since the `autocolor_text` option is TRUE and these colors are used
  gsub("(.*: |;$)", "", selection_value(tbl_html_6, "style")) |>
    expect_in(c("#0D0D0D", "#EEE9E9"))

  # Create a `tbl_html_7` object by using `data_color` with color names (random
  # selection) on the `min_sza` column (which is of the `numeric` class); this
  # time use non-default `autocolor_light` and `autocolor_dark` with color names
  tbl_html_7 <-
    test_tbl |>
    gt() |>
    data_color(
      columns = min_sza,
      palette = c("red", "white", "blue"),
      autocolor_text = TRUE,
      autocolor_light = "snow2",
      autocolor_dark = "gray5"
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the text colors vary between #0D0D0D and #EEE9E9
  # since the `autocolor_text` option is TRUE and these colors are used
  gsub("(.*: |;$)", "", selection_value(tbl_html_7, "style")) |>
    expect_in(c("#0D0D0D", "#EEE9E9"))

  # Expect that NAs in column values will result in default colors
  tbl <-
    countrypops |>
    dplyr::filter(country_name == "Mongolia") |>
    dplyr::filter(year >= 2013, year <= 2022) |>
    dplyr::select(-contains("code"))

  tbl[1, ] <- NA

  tbl |>
    gt() |>
    data_color(
      columns = country_name,
      palette = c("red", "orange", "green", "blue")
    ) |>
    render_as_html() |>
    xml2::read_html() |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    expect_equal(c("#808080", rep("#FF0000", 9)))

  tbl |>
    gt() |>
    data_color(
      columns = year,
      palette = c("red", "orange", "green", "blue")
    ) |>
    render_as_html() |>
    xml2::read_html() |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    expect_equal(
      c(
        "#808080", "#FF0000", "#FF5E00", "#FF8B00", "#F0B300", "#BAD700",
        "#62F600", "#6FC972", "#7978BD", "#0000FF"
      )
    )

  tbl |>
    gt() |>
    data_color(
      columns = population,
      palette = c("red", "orange", "green", "blue")
    ) |>
    render_as_html() |>
    xml2::read_html() |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    expect_equal(
      c(
        "#808080", "#FF0000", "#FF6200", "#FF9100", "#E8B900",
        "#AFDC00", "#43FB00", "#77BA82", "#746BC7", "#0000FF"
      )
    )
})

test_that("data_color() works with classed colors (#1155)", {

  # Create a `rgba_hex_colors_mixed_classed` object by using `data_color` with
  # classed color values written with mixed #RRGGBB, #RRGGBBAA, and named forms
  rgba_hex_colors_mixed_classed <- structure(
    c("red", "#FFA50060", "#00FF00", "#0000BB90"),
    class = "test_colour_class"
  )

  tbl_html_hex_colors_mixed_classed <-
    test_tbl |>
    gt() |>
    data_color(
      columns = min_sza,
      palette = rgba_hex_colors_mixed_classed,
      autocolor_text = TRUE
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect 12 unique color values to have been generated and used
  tbl_html_hex_colors_mixed_classed |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    unique() |>
    expect_length(12)

  # Expect color values to be of either the #RRGGBB or the
  # 'rgba()' CSS value form
  tbl_html_hex_colors_mixed_classed |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    expect_match("(?:^#[0-9A-F]{6}$|^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$)")

  # Expect all color values to be identical to those from
  # the previous table
  expect_identical(
    tbl_html_hex_colors_mixed_classed |>
      selection_value("style") |>
      gsub("(background-color: |; color: .*)", "", x = _),
    tbl_html_hex_colors_mixed_classed |>
      selection_value("style") |>
      gsub("(background-color: |; color: .*)", "", x = _)
  )

  # Expect the alpha values to have interpolation, yielding
  # several different values between 0 and 1
  sorted <-
    sort(
      gsub("(background-color: |; color: .*)", "", selection_value(tbl_html_hex_colors_mixed_classed, "style"))
    )

  sorted_length <- length(sorted)

  sorted[3:sorted_length] |>
    rgba_to_hex() |>
    substring(8, 9) |>
    unique() |>
    length() |>
    expect_gt(6)

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  (
    (tbl_html_hex_colors_mixed_classed |>
       selection_value("style") |>
       gsub("(.*: |;$)", "", x = _)) %in%
      c("#000000", "#FFFFFF")
  ) |>
    all() |>
    expect_true()
})

test_that("Color palettes can be obtained from the paletteer package", {

  skip_if_not_installed("paletteer")

  # Use `data_color()` with all defaults and a palette obtain from
  # the paletteer package
  tbl_gt_1 <-
    exibble |>
    gt() |>
    data_color(palette = "ggsci::red_material")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_1)
})

test_that("Some color palettes from the viridis package can be used", {

  # Use `data_color()` with all defaults and the "viridis" palette
  tbl_gt_1 <-
    exibble |>
    gt() |>
    data_color(palette = "viridis")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_1)

  # Use `data_color()` with all defaults and the "magma" palette
  tbl_gt_2 <-
    exibble |>
    gt() |>
    data_color(palette = "magma")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_2)

  # Use `data_color()` with all defaults and the "plasma" palette
  tbl_gt_3 <-
    exibble |>
    gt() |>
    data_color(palette = "plasma")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_3)

  # Use `data_color()` with all defaults and the "inferno" palette
  tbl_gt_4 <-
    exibble |>
    gt() |>
    data_color(palette = "inferno")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_4)
})

test_that("Some color palettes from the RColorBrewer package can be used", {

  skip_if_not_installed("RColorBrewer")

  # Get all palette names from the RColorBrewer package
  pal_names <- rownames(RColorBrewer::brewer.pal.info)

  # Use `data_color()` with all defaults and the different palette names
  # of the RColorBrewer package
  RColorBrewer_tests_out <-
    lapply(
      pal_names,
      FUN = function(x) {
        expect_no_error(
          exibble |>
            gt() |>
            data_color(palette = x)
        )
      }
    )
})

test_that("Different combinations of methods and column types work well", {

  # Use `data_color()` with all defaults
  tbl_gt_1 <-
    exibble |>
    gt() |>
    data_color()

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_1)

  # Use `data_color()` with a subset of rows targeted
  tbl_gt_2 <-
    test_tbl |>
    gt() |>
    data_color(rows = c(3:5, 8:10))

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_2)

  # Target the `num` column and use the `data_color()` "numeric" method
  tbl_gt_3 <-
    exibble |>
    gt() |>
    data_color(columns = num, method = "numeric")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_3)

  # Target the `num` column and use the `data_color()` "bin" method
  tbl_gt_4 <-
    exibble |>
    gt() |>
    data_color(columns = num, method = "bin")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_4)

  # Target the `num` column and use the `data_color()` "quantile" method
  tbl_gt_5 <-
    exibble |>
    gt() |>
    data_color(columns = num, method = "quantile")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_5)

  # Target the `num` column and use the `data_color()` "factor" method
  tbl_gt_6 <-
    exibble |>
    gt() |>
    data_color(columns = num, method = "factor")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_6)

  # Target the `char` column and use the `data_color()` "numeric" method
  tbl_gt_7 <-
    exibble |>
    gt() |>
    data_color(columns = char, method = "numeric")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_7)

  # Target the `char` column and use the `data_color()` "bin" method
  tbl_gt_8 <-
    exibble |>
    gt() |>
    data_color(columns = char, method = "bin")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_8)

  # Target the `char` column and use the `data_color()` "quantile" method
  tbl_gt_9 <-
    exibble |>
    gt() |>
    data_color(columns = char, method = "quantile")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_9)

  # Target the `char` column and use the `data_color()` "factor" method
  tbl_gt_10 <-
    exibble |>
    gt() |>
    data_color(columns = char, method = "factor")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_10)

  # Target the `fctr` column and use the `data_color()` "numeric" method
  tbl_gt_11 <-
    exibble |>
    gt() |>
    data_color(columns = fctr, method = "numeric")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_11)

  # Target the `fctr` column and use the `data_color()` "bin" method
  tbl_gt_12 <-
    exibble |>
    gt() |>
    data_color(columns = fctr, method = "bin")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_12)

  # Target the `fctr` column and use the `data_color()` "quantile" method
  tbl_gt_13 <-
    exibble |>
    gt() |>
    data_color(columns = fctr, method = "quantile")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_13)

  # Target the `fctr` column and use the `data_color()` "factor" method
  tbl_gt_14 <-
    exibble |>
    gt() |>
    data_color(columns = fctr, method = "factor")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_14)

  # With all columns, use the `data_color()` "numeric" method
  tbl_gt_15 <-
    exibble |>
    gt() |>
    data_color(method = "numeric")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_15)

  # With all columns, use the `data_color()` "bin" method
  tbl_gt_16 <-
    exibble |>
    gt() |>
    data_color(method = "bin")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_16)

  # With all columns, use the `data_color()` "quantile" method
  tbl_gt_17 <-
    exibble |>
    gt() |>
    data_color(method = "quantile")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_17)

  # With all columns, use the `data_color()` "factor" method
  tbl_gt_18 <-
    exibble |>
    gt() |>
    data_color(method = "factor")

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_18)

  #
  # Use different options of the "bin" method
  #

  # Using `bins = 4`
  tbl_gt_19 <-
    dplyr::tibble(a = 1:20) |>
    gt() |>
    data_color(
      columns = a,
      method = "bin",
      palette = "viridis",
      bins = 4
    )

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_19)

  # Using `bins = 5`
  tbl_gt_20 <-
    dplyr::tibble(a = 1:20) |>
    gt() |>
    data_color(
      columns = a,
      method = "bin",
      palette = "viridis",
      bins = 5
    )

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_20)

  #
  # Use different options of the "quantile" method
  #

  # Using `quantiles = 5`
  tbl_gt_21 <-
    dplyr::tibble(a = 1:20) |>
    gt() |>
    data_color(
      columns = a,
      method = "quantile",
      palette = "viridis",
      quantiles = 5
    )

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_21)

  # Using `quantiles = 10`
  tbl_gt_22 <-
    dplyr::tibble(a = 1:20) |>
    gt() |>
    data_color(
      columns = a,
      method = "quantile",
      palette = "viridis",
      quantiles = 10
    )

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_22)
})

test_that("The direction of coloring can be column-wise or row-wise", {

  # Generate a gt table based on the `sza` dataset
  sza_gt_tbl <-
    sza |>
    dplyr::filter(latitude == 20, tst <= "1200") |>
    dplyr::select(-latitude) |>
    dplyr::filter(!is.na(sza)) |>
    tidyr::pivot_wider(names_from = "tst", values_from = sza, names_sort = TRUE) |>
    gt(rowname_col = "month") |>
    sub_missing(missing_text = "")

  # Use `data_color()` with `direction = "column"` (the default) and
  # a palette of three colors
  tbl_gt_1 <-
    sza_gt_tbl |>
    data_color(
      direction = "column",
      method = "auto",
      palette = c("orange", "blue", "gray30"),
      na_color = "white"
    )

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_1)

  # Use `data_color()` with `direction = "row"`
  tbl_gt_2 <-
    sza_gt_tbl |>
    data_color(
      direction = "row",
      method = "auto",
      palette = c("orange", "blue", "gray30"),
      na_color = "white"
    )

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_2)

  # Using a fixed domain should not result in any difference
  # between coloring that is applied column-wise or row-wise
  expect_equal(
    sza_gt_tbl |>
      data_color(
        direction = "column",
        domain = c(0, 90),
        method = "auto",
        palette = c("orange", "blue", "gray30"),
        na_color = "white"
      ) |>
      render_as_html(),
    sza_gt_tbl |>
      data_color(
        direction = "row",
        domain = c(0, 90),
        method = "auto",
        palette = c("orange", "blue", "gray30"),
        na_color = "white"
      ) |>
      render_as_html()
  )

  # There should be no difference in output when using
  # either of the "auto" or "numeric" methods since all
  # columns are of the numeric class
  expect_equal(
    sza_gt_tbl |>
      data_color(
        direction = "row",
        method = "numeric",
        palette = c("orange", "blue", "gray30"),
        na_color = "white"
      ) |>
      render_as_html(),
    sza_gt_tbl |>
      data_color(
        direction = "row",
        method = "auto",
        palette = c("orange", "blue", "gray30"),
        na_color = "white"
      ) |>
      render_as_html()
  )

  # Use `data_color()` with `direction = "row"` and `method = "bin"`
  tbl_gt_3 <-
    sza_gt_tbl |>
    data_color(
      direction = "row",
      method = "bin",
      palette = c("orange", "blue", "gray30"),
      na_color = "white"
    )

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_3)

  # Use `data_color()` with `direction = "row"` and `method = "quantile"`
  tbl_gt_4 <-
    sza_gt_tbl |>
    data_color(
      direction = "row",
      method = "quantile",
      palette = c("orange", "blue", "gray30"),
      na_color = "white"
    )

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_4)

  # Use `data_color()` with `direction = "row"` and `method = "factor"`
  tbl_gt_5 <-
    sza_gt_tbl |>
    data_color(
      direction = "row",
      method = "factor",
      palette = c("orange", "blue", "gray30"),
      na_color = "white"
    )

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_5)
})

test_that("Columns can indirectly apply coloring to other columns", {

  # Generate a gt table based on the `countrypops` dataset
  cp_gt_tbl <-
    countrypops |>
    dplyr::filter(country_name == "Mongolia") |>
    dplyr::select(-contains("code")) |>
    dplyr::filter(year >= 2013, year <= 2022) |>
    tidyr::pivot_wider(names_from = "year", values_from = "population") |>
    gt(rowname_col = "country_name")

  # Apply coloring from one column to another
  tbl_gt_1 <-
    cp_gt_tbl |>
    data_color(
      columns = `2013`,
      target_columns = `2022`,
      domain = c(2700000, 3400000),
      palette = c("green", "black")
    )

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_1)

  # Apply coloring from one column to several different columns
  tbl_gt_2 <-
    cp_gt_tbl |>
    data_color(
      columns = `2013`,
      target_columns = c(`2020`, `2021`, `2022`),
      domain = c(2700000, 3400000),
      palette = c("green", "black")
    )

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_2)

  # Apply coloring from multiple columns to several columns
  # of the same multiple
  tbl_gt_3 <-
    cp_gt_tbl |>
    data_color(
      columns = c(`2013`, `2014`, `2015`),
      target_columns = c(`2020`, `2021`, `2022`),
      domain = c(2700000, 3400000),
      palette = c("green", "black")
    )

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_3)

  # Apply coloring from multiple columns to several columns
  # of the same multiple, this time reversing the palette
  tbl_gt_4 <-
    cp_gt_tbl |>
    data_color(
      columns = c(`2013`, `2014`, `2015`),
      target_columns = c(`2020`, `2021`, `2022`),
      domain = c(2700000, 3400000),
      palette = c("green", "black"),
      reverse = TRUE
    )

  # Perform snapshot test
  expect_snapshot_html(tbl_gt_4)
})

test_that("data_color() validates its input related to color", {

  skip_if_not_installed("farver") # For non-default `autocolor_light|dark`

  # Expect an error when using an invalid color name in `palette`
  expect_error(
    test_tbl |>
      gt() |>
      data_color(
        columns = min_sza,
        palette = c("red", "blau"),
        autocolor_text = TRUE
      )
  )

  # Do not expect an error when providing `NULL` to `palette`
  expect_no_error(
    test_tbl |>
      gt() |>
      data_color(
        columns = min_sza,
        palette = NULL,
        autocolor_text = TRUE
      )
  )

  # Expect an error when providing an `NA` to `palette`
  expect_error(
    test_tbl |>
      gt() |>
      data_color(
        columns = min_sza,
        palette = NA,
        autocolor_text = TRUE
      )
  )

  # Expect an error when providing a numeric vector to `palette`
  expect_error(
    test_tbl |>
      gt() |>
      data_color(
        columns = min_sza,
        palette = 1:6,
        autocolor_text = TRUE
      )
  )

  # Expect an error if there is a malformed
  # hexadecimal color value given to `palette`
  expect_error(
    test_tbl |>
      gt() |>
      data_color(
        columns = min_sza,
        palette = c("#EEFFAA", "##45AA22"),
        autocolor_text = TRUE
      )
  )

  # Expect an error if using `direction = "row"` with a numeric method
  # when there are non-numeric cells
  expect_error(
    exibble |>
      gt() |>
      data_color(
        direction = "row",
        method = "numeric"
      )
  )

  # Expect an error if using `direction = "row"` when specifying
  # `target_columns`
  expect_error(
    exibble |>
      gt() |>
      data_color(
        columns = num,
        target_columns = row,
        direction = "row"
      )
  )

  # Expect an error with length of `target_columns` doesn't match that
  # of `columns` (when length of `columns` is greater than one)
  expect_error(
    exibble |>
      gt() |>
      data_color(
        columns = c(num, currency),
        target_columns = row
      )
  )

  # Don't expect an error if the greater-than-one lengths of
  # `target_columns` and `columns` match
  expect_no_error(
    exibble |>
      gt() |>
      data_color(
        columns = c(num, currency),
        target_columns = c(row, group)
      )
  )

  # Expect an error if there is a malformed hexadecimal color value given
  # to `autocolor_light`
  expect_error(
    test_tbl |>
      gt() |>
      data_color(
        columns = min_sza,
        palette = c("#EEFFAA", "#45AA22"),
        autocolor_text = TRUE,
        autocolor_light = "##EEE9E9"
      )
  )

  # Expect an error if there is a malformed hexadecimal color value given
  # to `autocolor_dark`
  expect_error(
    test_tbl |>
      gt() |>
      data_color(
        columns = min_sza,
        palette = c("#EEFFAA", "#45AA22"),
        autocolor_text = TRUE,
        autocolor_dark = "#0D0D0DF"
      )
  )

  # Expect an error if there is a invalid color name given to `autocolor_light`
  expect_error(
    test_tbl |>
      gt() |>
      data_color(
        columns = min_sza,
        palette = c("#EEFFAA", "#45AA22"),
        autocolor_text = TRUE,
        autocolor_light = "snoow2"
      )
  )

  # Expect an error if there is a invalid color name given to `autocolor_dark`
  expect_error(
    test_tbl |>
      gt() |>
      data_color(
        columns = min_sza,
        palette = c("#EEFFAA", "#45AA22"),
        autocolor_text = TRUE,
        autocolor_dark = "ggrreey5"
      )
  )
})

test_that("Certain warnings can be expected when using deprecated arguments", {

  local_options("rlib_warning_verbosity" = "verbose")

  # Expect a warning if a palette is provided to `colors`
  expect_warning(
    exibble |>
      gt() |>
      data_color(
        method = "numeric",
        colors = c("red", "green")
      )
  )

  # Expect a warning if a function is provided to `colors`
  expect_warning(
    exibble |>
      gt() |>
      data_color(
        columns = num,
        method = "numeric",
        colors = scales::col_numeric(palette = c("red", "green"), domain = c(0, 1E7))
      )
  )
})

test_that("The correct color values are obtained when using a color fn", {

  # Create a `tbl_html` object by using `data_color` with the
  # `scales::col_factor()` fn on the month column
  # (which is of the `character` class)
  tbl_html_1 <-
    test_tbl |>
    dplyr::mutate(month = as.character(month)) |>
    gt() |>
    data_color(
      columns = month,
      fn = scales::col_factor(
        palette = c(
          "red", "orange", "green", "blue"),
        domain = levels(test_tbl$month)
      ),
      autocolor_text = TRUE
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect 12 unique color values to have been generated and
  # used (because this relates to a numeric mapping)
  tbl_html_1 |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    unique() |>
    expect_length(12)

  # Expect all color values to be of the #RRGGBB form
  tbl_html_1 |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    expect_match("^#[0-9A-F]{6}$")

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  expect_in(
    tbl_html_1 |>
      selection_value("style") |>
       gsub("(.*: |;$)", "", x = _),
    c("#000000", "#FFFFFF")
  )

  # Create a `tbl_html` object by using `data_color` with the
  # `scales::col_factor()` fn on the month column
  # (which is of the `character` class); this time, set `alpha`
  # to `0.5`
  tbl_html_2 <-
    test_tbl |>
    dplyr::mutate(month = as.character(month)) |>
    gt() |>
    data_color(
      columns = month,
      fn = scales::col_factor(
        palette = c("red", "orange", "green", "blue"),
        domain = levels(test_tbl$month)
      ),
      autocolor_text = TRUE,
      alpha = 0.5
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect color values to be entirely in the 'rgba()' CSS value form
  tbl_html_2 |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    expect_match("^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$")

  # Expect the same test result by using `is_rgba_col()`
  tbl_html_2 |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    is_rgba_col() |>
    all() |>
    expect_true()

  # Expect that all alpha values are 0.5 (or "80" as a hex value)
  (
    tbl_html_2 |>
      selection_value("style") |>
      gsub("(background-color: |; color: .*)", "", x = _)
  ) |>
    rgba_to_hex() |>
    substring(8, 9) |>
    unique() |>
    expect_equal("80")

  # Create a `tbl_html` object by using `data_color` with the
  # `scales::col_factor()` fn on the month column (which is of
  # the `character` class); this time, set `alpha` to `1.0`
  tbl_html_3 <-
    test_tbl |>
    dplyr::mutate(month = as.character(month)) |>
    gt() |>
    data_color(
      columns = month,
      fn = scales::col_factor(
        palette = c("red", "orange", "green", "blue"),
        domain = levels(test_tbl$month)
      ),
      autocolor_text = TRUE,
      alpha = 1
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect 12 unique color values to have been generated and
  # used (because this relates to a numeric mapping)
  tbl_html_3 |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    unique() |>
    expect_length(12)

  # Expect all color values to be of the #RRGGBB form
  tbl_html_3 |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    expect_match("^#[0-9A-F]{6}$")

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  tbl_html_3 |>
    selection_value("style") |>
    gsub("(.*: |;$)", "", x = _) |>
    expect_in(c("#000000", "#FFFFFF"))

  # Expect all color values to be identical to those from
  # `tbl_html_1`
  expect_identical(
    tbl_html_3 |>
      selection_value("style") |>
      gsub("(background-color: |; color: .*)", "", x = _),
    tbl_html_1 |>
      selection_value("style") |>
      gsub("(background-color: |; color: .*)", "", x = _)
  )

  # Create a `tbl_html` object by using `data_color` with the
  # `scales::col_factor()` fn on the month column
  # (which is of the `factor` class)
  tbl_html_4 <-
    test_tbl |>
    gt() |>
    data_color(
      columns = month,
      fn = scales::col_factor(
        palette = c("red", "orange", "green", "blue"),
        domain = levels(test_tbl$month)
      ),
      autocolor_text = TRUE,
      alpha = 1
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect 12 unique color values to have been generated and
  # used (because this relates to a numeric mapping)
  tbl_html_4 |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    unique() |>
    expect_length(12)

  # Expect all color values to be of the #RRGGBB form
  tbl_html_4 |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    expect_match("^#[0-9A-F]{6}$")

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  tbl_html_4 |>
    selection_value("style") |>
    gsub("(.*: |;$)", "", x = _) |>
    expect_in(c("#000000", "#FFFFFF"))

  # Expect all color values to be identical to those from
  # `tbl_html_1`
  expect_identical(
    tbl_html_4 |>
      selection_value("style") |>
      gsub("(background-color: |; color: .*)", "", x = _),
    tbl_html_1 |>
      selection_value("style") |>
      gsub("(background-color: |; color: .*)", "", x = _)
  )

  # Create a `tbl_html` object by using `data_color` with the
  # `scales::col_numeric()` fn on the `min_sza` column
  # (which is of the `numeric` class)
  tbl_html_5 <-
    test_tbl |>
    gt() |>
    data_color(
      columns = min_sza,
      fn = scales::col_numeric(
        palette = c("red", "orange", "green", "blue"),
        domain = c(0, 90)
      ),
      autocolor_text = TRUE,
      alpha = 1
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect 12 unique color values to have been generated and
  # used (because this relates to a numeric mapping)
  tbl_html_5 |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    unique() |>
    expect_length(12)

  # Expect all color values to be of the #RRGGBB form
  tbl_html_5 |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    expect_match("^#[0-9A-F]{6}$")

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  tbl_html_5 |>
    selection_value("style") |>
    gsub("(.*: |;$)", "", x = _) |>
    expect_in(c("#000000", "#FFFFFF"))

  # Create a `tbl_html` object by using `data_color` with the
  # `scales::col_numeric()` fn on the `min_sza` column
  # (which is of the `numeric` class); this time, use an
  # alpha value of `0.5`
  tbl_html_6 <-
    test_tbl |>
    gt() |>
    data_color(
      columns = min_sza,
      fn = scales::col_numeric(
        palette = c("red", "orange", "green", "blue"),
        domain = c(0, 90)
      ),
      autocolor_text = TRUE,
      alpha = 0.5
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect color values to be entirely in the 'rgba()' CSS value form
  tbl_html_6 |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    expect_match("^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$")

  # Expect the same test result by using `is_rgba_col()`
  tbl_html_6 |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    is_rgba_col() |>
    all() |>
    expect_true()

  # Expect that all alpha values are 0.5 (or "80" as a hex value)
  (
    tbl_html_6 |>
      selection_value("style") |>
      gsub("(background-color: |; color: .*)", "", x = _)
  ) |>
    rgba_to_hex() |>
    substring(8, 9) |>
    unique() |>
    expect_equal("80")

  # Create a `tbl_html` object by using `data_color` with the
  # `scales::col_quantile()` fn on the `min_sza` column
  # (which is of the `numeric` class)
  tbl_html_7 <-
    test_tbl |>
    gt() |>
    data_color(
      columns = min_sza,
      fn = scales::col_quantile(
        palette = c("red", "orange", "green", "blue"),
        domain = c(0, 90)
      ),
      autocolor_text = TRUE
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect 3 unique color values to have been generated and
  # used (because this relates to a numeric mapping on quantiles)
  tbl_html_7 |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    unique() |>
    expect_length(3)

  # Expect all color values to be of the #RRGGBB form
  tbl_html_7 |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    expect_match("^#[0-9A-F]{6}$")

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  tbl_html_7 |>
    selection_value("style") |>
    gsub("(.*: |;$)", "", x = _) |>
    expect_in(c("#000000", "#FFFFFF"))

  # Create a `tbl_html` object by using `data_color` with the
  # `scales::col_bin()` fn on the `min_sza` column
  # (which is of the `numeric` class)
  tbl_html_8 <-
    test_tbl |>
    gt() |>
    data_color(
      columns = min_sza,
      fn = scales::col_bin(
        palette = c("red", "orange", "green", "blue"),
        domain = c(0, 90),
        bins = 4
      ),
      autocolor_text = TRUE
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect 3 unique color values to have been generated and
  # used (because this relates to a numeric mapping on quantiles)
  tbl_html_8 |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    unique() |>
    expect_length(3)

  # Expect all color values to be of the #RRGGBB form
  tbl_html_8 |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*)", "", x = _) |>
    expect_match("^#[0-9A-F]{6}$")

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  tbl_html_8 |>
    selection_value("style") |>
    gsub("(.*: |;$)", "", x = _) |>
    expect_in(c("#000000", "#FFFFFF"))
})

test_that("The various color utility functions work correctly", {

  # Assign various color vectors that are of different specifications
  c_name <- c("red", "tomato", "palevioletred3", "limegreen", "gray86", "blue")
  c_hex <- c("#FFAA00", "#FFBB34", "#AD552E", "#900019")
  c_hex_a <- c("#FF235D60", "#AA253A70", "#F3F300FF", "#D2D72110")
  c_rgba <- c("rgba(255,170,0,0.5)", "rgba(255,187,52,1)", "rgba(20,255,0,1.0)")

  # Expect that the `is_rgba_col()` function will identify valid
  # color strings in the 'rgba()' CSS format
  is_rgba_col(
    colors = c(
      c_rgba,
      "rgba(255,170,0,0.5)", "rgba(255,187,52,1)", "rgba( 127, 46, 22, 0.523 )",
      "rgba(0,0,0,0)", "rgba(128,    20 , 94, 1.000)"
      )
    ) |>
    all() |>
    expect_true()

  # Expect that any other strings will return FALSE values
  is_rgba_col(
    colors = c(
      "rgba (255,170,0,0.5)", "rgbc(255,187,52,1)", "rgb( 127, 46, 22, 0.523 )",
      "#FFFFFF", "rgba(128,    20 , 94, a)"
    )
    ) |>
    any() |>
    expect_false()

  # Expect that the `rgba_to_hex()` function reliably returns
  # color strings in the hexadecimal format of #RRGGBBAA
  # when supplied 'rgba()' format strings
  expect_equal(
    rgba_to_hex(colors = c_rgba),
    c("#FFAA0080", "#FFBB34FF", "#14FF00FF")
  )

  # Expect that the `rgba_to_hex()` utility function will pass through *any*
  # strings that don't conform to the 'rgba()' string format
  expect_equal(
    rgba_to_hex(colors = c(c_rgba, c_hex, "test")),
    c("#FFAA0080", "#FFBB34FF", "#14FF00FF", c_hex, "test")
  )

  # Expect that the `html_color()` utility function will reliably return
  # color strings in either the hexadecimal format of #RRGGBB or as
  # 'rgba()' format strings (when `alpha` is NULL, which is the default)
  expect_equal(
    html_color(colors = c(c_name, c_hex, c_hex_a)),
    c(
      "#FF0000", "#FF6347", "#CD6889", "#32CD32", "#DBDBDB", "#0000FF",
      c_hex,
      "rgba(255,35,93,0.38)", "rgba(170,37,58,0.44)", "#F3F300", "rgba(210,215,33,0.06)"
    )
  )

  # Expect that the `html_color()` utility function will reliably return
  # color strings entirely in the hexadecimal format of #RRGGBB when `alpha` is
  # equal to `1`
  expect_equal(
    html_color(colors = c(c_name, c_hex, c_hex_a), alpha = 1),
    c(
      "#FF0000", "#FF6347", "#CD6889", "#32CD32", "#DBDBDB", "#0000FF",
      c_hex,
      "#FF235D", "#AA253A", "#F3F300", "#D2D721"
    )
  )

  # Expect that `html_color()` will reliably return color strings entirely
  # in the 'rgba()' string format when `alpha` is non-NULL and less than `1`
  expect_equal(
    html_color(colors = c(c_name, c_hex, c_hex_a), alpha = 0.5),
    c(
      "rgba(255,0,0,0.5)", "rgba(255,99,71,0.5)", "rgba(205,104,137,0.5)",
      "rgba(50,205,50,0.5)", "rgba(219,219,219,0.5)", "rgba(0,0,255,0.5)",
      "rgba(255,170,0,0.5)", "rgba(255,187,52,0.5)", "rgba(173,85,46,0.5)",
      "rgba(144,0,25,0.5)", "rgba(255,35,93,0.5)", "rgba(170,37,58,0.5)",
      "rgba(243,243,0,0.5)", "rgba(210,215,33,0.5)"
    )
  )

  # Expect that `html_color()` won't alter any 'rgba()' strings passed to it
  expect_equal(
    html_color(colors = c(c_name, c_hex, c_hex_a, c_rgba), alpha = 1),
    c(
      "#FF0000", "#FF6347", "#CD6889", "#32CD32", "#DBDBDB", "#0000FF",
      c_hex,
      "#FF235D", "#AA253A", "#F3F300", "#D2D721",
      c_rgba
    )
  )

  # Furthermore, expect that all alpha values in the 'rgba()' strings are of the
  # same value when `alpha` is non-NULL and less than `1`
  html_color(colors = c(c_name, c_hex, c_hex_a), alpha = 0.5) |>
    gsub("(?:^.*,|\\))", "", x = _) |>
    unique() |>
    expect_length(1)

  # Expect that CSS color names not present as an R/X11 color will still work
  expect_equal(
    html_color(colors = names(css_exclusive_colors())),
    c(
      "#DC143C", "#FF00FF", "#663399",
      "#4B0082", "#00FF00", "#808000",
      "#008080", "#00FFFF", "#C0C0C0"
    )
  )
  expect_equal(
    html_color(colors = rev(names(css_exclusive_colors()))),
    c(
      "#C0C0C0", "#00FFFF", "#008080",
      "#808000", "#00FF00", "#4B0082",
      "#663399", "#FF00FF", "#DC143C"
    )
  )

  # Expect that mixed names will work in `html_color()` (all the
  # previous types plus the CSS exclusive names here, which are
  # 'rebeccapurple' and 'lime')
  expect_equal(
    html_color(colors = c(c_name, c_hex, c_hex_a, "rebeccapurple", "lime")),
    c(
      "#FF0000", "#FF6347", "#CD6889", "#32CD32", "#DBDBDB", "#0000FF",
      "#FFAA00", "#FFBB34", "#AD552E", "#900019", "rgba(255,35,93,0.38)",
      "rgba(170,37,58,0.44)", "#F3F300", "rgba(210,215,33,0.06)",
      "#663399", "#00FF00"
    )
  )

  # Expect that the CSS exclusive names will still work if names have mixed case
  expect_equal(
    html_color(colors = c(c_name, c_hex, c_hex_a, "RebeccaPurple", "Lime")),
    c(
      "#FF0000", "#FF6347", "#CD6889", "#32CD32", "#DBDBDB", "#0000FF",
      "#FFAA00", "#FFBB34", "#AD552E", "#900019", "rgba(255,35,93,0.38)",
      "rgba(170,37,58,0.44)", "#F3F300", "rgba(210,215,33,0.06)",
      "#663399", "#00FF00"
    )
  )

  # Expect an error if an NA value is provided anywhere as input
  expect_error(
    html_color(colors = c(c_name, c_hex, c_hex_a, NA_character_))
  )

  # Expect an error if an invalid color name is provided
  expect_error(
    html_color(colors = c(c_name, "blau", c_hex, c_hex_a))
  )

  # Expect an error if an invalid color format is provided
  expect_error(
    html_color(colors = c(c_name, c_hex, "#FF04JJ", c_hex_a))
  )
  expect_error(
    html_color(colors = c(c_name, c_hex, c_hex_a, "#FF0033100"))
  )
  expect_error(
    html_color(colors = c(c_name, c_hex, "FF04E2", c_hex_a))
  )

  # Don't expect an error if 'rgba()'-format colors are passed to `html_color`
  expect_no_error(
    html_color(colors = c(c_name, c_hex, c_hex_a, "rgba(210,215,33,0.5)"))
  )

  # Expect that the `normalize_colors()` utility function will reliably return
  # color strings in the hexadecimal format of #RRGGBB when `alpha` is 1
  # (which needs to be set)
  expect_equal(
    normalize_colors(colors = c(c_name, c_hex, c_hex_a), alpha = 1),
    c(
      "#FF0000", "#FF6347", "#CD6889", "#32CD32", "#DBDBDB", "#0000FF",
      "#FFAA00", "#FFBB34", "#AD552E", "#900019", "#FF235D", "#AA253A",
      "#F3F300", "#D2D721"
    )
  )

  # Expect that the `normalize_colors()` utility function will reliably return
  # color strings entirely in the 'rgba()' format of #RRGGBB when `alpha` is
  # not `1`
  expect_equal(
    normalize_colors(colors = c(c_name, c_hex, c_hex_a), alpha = 0.5),
    c(
      "rgba(255,0,0,0.5)", "rgba(255,99,71,0.5)", "rgba(205,104,137,0.5)",
      "rgba(50,205,50,0.5)", "rgba(219,219,219,0.5)", "rgba(0,0,255,0.5)",
      "rgba(255,170,0,0.5)", "rgba(255,187,52,0.5)", "rgba(173,85,46,0.5)",
      "rgba(144,0,25,0.5)", "rgba(255,35,93,0.5)", "rgba(170,37,58,0.5)",
      "rgba(243,243,0,0.5)", "rgba(210,215,33,0.5)"
    )
  )

  # Expect that the `normalize_colors()` utility function will reliably return
  # color strings in either hexadecimal or in 'rgba()' when `alpha` is set
  # to NULL (any #RRGGBBAA colors will move to 'rgba()')
  expect_equal(
    normalize_colors(colors = c(c_name, c_hex, c_hex_a), alpha = NULL),
    c(
      "#FF0000", "#FF6347", "#CD6889", "#32CD32", "#DBDBDB", "#0000FF",
      "#FFAA00", "#FFBB34", "#AD552E", "#900019", "rgba(255,35,93,0.38)",
      "rgba(170,37,58,0.44)", "#F3F300", "rgba(210,215,33,0.06)"
    )
  )

  # Expect an error if 'rgba()'-format colors are passed to `normalize_colors()`
  expect_error(
    normalize_colors(
      colors = c(c_name, c_hex, c_hex_a, "rgba(210,215,33,0.5)"),
      alpha = 1.0
    )
  )

  # Expect that the `ideal_fgnd_color()` function returns a vector containing
  # either a light color ("#FFFFFF") or a dark color ("#000000") based on the
  # `bgnd_color` input colors; this should work with all of the color formats
  # that `html_color()` produces
  expect_equal(
    ideal_fgnd_color(bgnd_color = c(c_name, c_hex, c_hex_a, c_rgba)),
    c(
      "#FFFFFF", "#FFFFFF", "#FFFFFF", "#000000", "#000000", "#FFFFFF",
      "#000000", "#000000", "#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF",
      "#000000", "#000000", "#000000", "#000000", "#000000"
    )
  )

  # Expect that the `ideal_fgnd_color()` function returns a vector containing
  # either a light color or a dark color based on the `bgnd_color` input colors;
  # this should work with all of the color formats that `html_color()`
  # produces; this time using non-default `light` and `dark`
  expect_equal(
    ideal_fgnd_color(
      bgnd_color = c(c_name, c_hex, c_hex_a, c_rgba),
      light = "snow2",
      dark = "#0D0D0D"
      ),
    c(
      "#EEE9E9", "#0D0D0D", "#EEE9E9", "#0D0D0D", "#0D0D0D", "#EEE9E9",
      "#0D0D0D", "#0D0D0D", "#EEE9E9", "#EEE9E9", "#EEE9E9", "#EEE9E9",
      "#0D0D0D", "#0D0D0D", "#0D0D0D", "#0D0D0D", "#0D0D0D"
    )
  )

  # Expect that the vector of light and dark colors returned is not affected
  # by any of the colors' alpha values
  expect_equal(
    ideal_fgnd_color(
      bgnd_color = c(
        c(
          "rgba(255,0,0,1.0)", "rgba(255,99,71,0.7)", "rgba(205,104,137,0.2)",
          "rgba(50,205,50,0.3)", "rgba(219,219,219,1.0)", "rgba(0,0,255,0.3)",
          "rgba(255,170,0,0.2)", "rgba(255,187,52,0.23)", "rgba(173,85,46,0.1)",
          "rgba(144,0,25,0.84)", "rgba(255,35,93,0.96)", "rgba(170,37,58,0.39)",
          "rgba(243,243,0,0.36)", "rgba(210,215,33,0.8533)"
        )
      )
    ),
    ideal_fgnd_color(
      bgnd_color = c(
        c(
          "rgba(255,0,0,1.0)", "rgba(255,99,71,1.0)", "rgba(205,104,137,1.0)",
          "rgba(50,205,50,1.0)", "rgba(219,219,219,1.0)", "rgba(0,0,255,1.0)",
          "rgba(255,170,0,1.0)", "rgba(255,187,52,1.0)", "rgba(173,85,46,1.0)",
          "rgba(144,0,25,1.0)", "rgba(255,35,93,1.0)", "rgba(170,37,58,1.0)",
          "rgba(243,243,0,1.0)", "rgba(210,215,33,1.0)"
        )
      )
    )
  )

  # Expect an error if an invalid color format is provided
  expect_error(
    ideal_fgnd_color(bgnd_color = c(c_hex, "#FF04JJ", c_hex_a))
  )
  expect_error(
    ideal_fgnd_color(bgnd_color = c(c_hex, c_hex_a, "#FF0033100"))
  )
  expect_error(
    ideal_fgnd_color(
      bgnd_color = c(c_name, c_hex, c_hex_a, c_rgba), light = "##EEE9E9"
    )
  )
  expect_error(
    ideal_fgnd_color(
      bgnd_color = c(c_name, c_hex, c_hex_a, c_rgba), dark = "#0D0D0DF"
    )
  )
  expect_error(
    ideal_fgnd_color(
      bgnd_color = c(c_name, c_hex, c_hex_a, c_rgba), light = "snoow2"
    )
  )
  expect_error(
    ideal_fgnd_color(
      bgnd_color = c(c_name, c_hex, c_hex_a, c_rgba), dark = "ggrreey5"
    )
  )

  # Expect specific and reproducible output color values in the #RRGGBBAA
  # hexadecimal color format when adjusting color palettes with
  # `adjust_luminance()`; use the function with colors in the `c_hex`
  # vector and adjust the steps several times in either direction
  expect_equal(
    adjust_luminance(colors = c_hex, steps = 0),
    c("#FFAA04FF", "#FFBB35FF", "#AE552EFF", "#910019FF")
  )
  expect_equal(
    adjust_luminance(colors = c_hex, steps = -0.5),
    c("#E18F00FF", "#E5A200FF", "#8C3700FF", "#780000FF")
  )
  expect_equal(
    adjust_luminance(colors = c_hex, steps = -1.0),
    c("#BE7000FF", "#C48500FF", "#711B00FF", "#670000FF")
  )
  expect_equal(
    adjust_luminance(colors = c_hex, steps = -1.5),
    c("#9A5100FF", "#A16500FF", "#5D0000FF", "#5D0000FF")
  )
  expect_equal(
    adjust_luminance(colors = c_hex, steps = -2.0),
    c("#7A3600FF", "#804800FF", "#4F0000FF", "#560000FF")
  )
  expect_equal(
    adjust_luminance(colors = c_hex, steps = +0.5),
    c("#FFC042FF", "#FFCE54FF", "#D17555FF", "#B0313CFF")
  )
  expect_equal(
    adjust_luminance(colors = c_hex, steps = +1.0),
    c("#FFCF5AFF", "#FFDB66FF", "#F29375FF", "#D4555DFF")
  )
  expect_equal(
    adjust_luminance(colors = c_hex, steps = +1.5),
    c("#FFDA68FF", "#FFE471FF", "#FFAD90FF", "#F8767EFF")
  )
  expect_equal(
    adjust_luminance(colors = c_hex, steps = +2.0),
    c("#FFE171FF", "#FFE978FF", "#FFC0A4FF", "#FF939AFF")
  )

  # Expect specific and reproducible output color values in the #RRGGBBAA
  # hexadecimal color format when adjusting color palettes with
  # `adjust_luminance()`; use the function with colors in the `c_hex_a`
  # vector and adjust the steps several times in either direction
  expect_equal(
    adjust_luminance(colors = c_hex_a, steps = 0),
    c("#FF245D60", "#AB253A70", "#F3F307FF", "#D2D72310")
  )
  expect_equal(
    adjust_luminance(colors = c_hex_a, steps = -0.5),
    c("#D8003A60", "#8C001A70", "#E8E800FF", "#BCC00010")
  )
  expect_equal(
    adjust_luminance(colors = c_hex_a, steps = -1.0),
    c("#B4001260", "#75000070", "#D7D700FF", "#9FA40010")
  )
  expect_equal(
    adjust_luminance(colors = c_hex_a, steps = -1.5),
    c("#97000060", "#66000070", "#C0C000FF", "#80840010")
  )
  expect_equal(
    adjust_luminance(colors = c_hex_a, steps = -2.0),
    c("#83000060", "#5E000070", "#A4A400FF", "#61650010")
  )
  expect_equal(
    adjust_luminance(colors = c_hex_a, steps = +0.5),
    c("#FF537E60", "#CE4B5B70", "#FBFA2AFF", "#E3E84610")
  )
  expect_equal(
    adjust_luminance(colors = c_hex_a, steps = +1.0),
    c("#FF729960", "#F26D7B70", "#FFFF36FF", "#EEF35810")
  )
  expect_equal(
    adjust_luminance(colors = c_hex_a, steps = +1.5),
    c("#FF8AAE60", "#FF8B9970", "#FFFF3DFF", "#F6FB6210")
  )
  expect_equal(
    adjust_luminance(colors = c_hex_a, steps = +2.0),
    c("#FF9ABE60", "#FFA3B070", "#FFFF41FF", "#FBFF6910")
  )

  # Expect specific and reproducible output color values in the #RRGGBBAA
  # hexadecimal color format when adjusting color palettes with
  # `adjust_luminance()`; use the function with some colors in the
  # `c_name` vector and adjust the steps several times in either direction
  expect_equal(
    adjust_luminance(colors = c_name[1:4], steps = 0),
    c("#FF0202FF", "#FF6347FF", "#CE6889FF", "#2FCD33FF")
  )
  expect_equal(
    adjust_luminance(colors = c_name[1:4], steps = -0.5),
    c("#D60000FF", "#D94013FF", "#AC466AFF", "#00AF00FF")
  )
  expect_equal(
    adjust_luminance(colors = c_name[1:4], steps = -1.0),
    c("#B10000FF", "#B31500FF", "#8D224DFF", "#008E00FF")
  )
  expect_equal(
    adjust_luminance(colors = c_name[1:4], steps = -1.5),
    c("#920000FF", "#920000FF", "#750037FF", "#006E00FF")
  )
  expect_equal(
    adjust_luminance(colors = c_name[1:4], steps = -2.0),
    c("#7C0000FF", "#790000FF", "#660027FF", "#005400FF")
  )
  expect_equal(
    adjust_luminance(colors = c_name[1:4], steps = +0.5),
    c("#FF4445FF", "#FF826AFF", "#EF88A8FF", "#54E657FF")
  )
  expect_equal(
    adjust_luminance(colors = c_name[1:4], steps = +1.0),
    c("#FF6767FF", "#FF9A84FF", "#FFA3C2FF", "#6BF86DFF")
  )
  expect_equal(
    adjust_luminance(colors = c_name[1:4], steps = +1.5),
    c("#FF8080FF", "#FFAC96FF", "#FFB7D6FF", "#7AFF7CFF")
  )
  expect_equal(
    adjust_luminance(colors = c_name[1:4], steps = +2.0),
    c("#FF9191FF", "#FFB8A3FF", "#FFC6E5FF", "#83FF85FF")
  )

  # Expect an error if step values are greater than 2 or
  # less than -2
  expect_error(adjust_luminance(colors = c_hex, steps = -2.1))
  expect_error(adjust_luminance(colors = c_hex, steps = +2.1))
})

test_that("tab_style() + cell_fill() accepts colors of various types", {

  # Create a `tbl_html` object by using `tab_style` with
  # the `cell_fill()` helper function and a color name
  tbl_html_1 <-
    test_tbl |>
    gt() |>
    tab_style(
      style = cell_fill(color = "tomato"),
      locations = cells_body(columns = "month")
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect a single color to have been generated and used
  tbl_html_1 |>
    selection_value("style") |>
    gsub("(?:background-color: |;)", "", x = _) |>
    unique() |>
    expect_length(1)

  # Expect all color values to be of the #RRGGBB form
  tbl_html_1 |>
    selection_value("style") |>
    gsub("(?:background-color: |;)", "", x = _) |>
    expect_match("^#[0-9A-F]{6}$")

  # Create a `tbl_html` object by using `tab_style` with
  # the `cell_fill()` helper function and a hexadecimal color
  # value in the #RRGGBB format
  tbl_html_2 <-
    test_tbl |>
    gt() |>
    tab_style(
      style = cell_fill(color = "#FFAA00"),
      locations = cells_body(columns = "month")
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect a single color to have been generated and used
  tbl_html_2 |>
    selection_value("style") |>
    gsub("(?:background-color: |;)", "", x = _) |>
    unique() |>
    expect_length(1)

  # Expect all color values to be of the #RRGGBB form
  tbl_html_2 |>
    selection_value("style") |>
    gsub("(?:background-color: |;)", "", x = _) |>
    expect_match("^#[0-9A-F]{6}$")

  # Create a `tbl_html` object by using `tab_style` with
  # the `cell_fill()` helper function and a hexadecimal color
  # value in the #RRGGBBAA format
  tbl_html_3 <-
    test_tbl |>
    gt() |>
    tab_style(
      style = cell_fill(color = "#FF235D60"),
      locations = cells_body(columns = "month")
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect a single color to have been generated and used
  tbl_html_3 |>
    selection_value("style") |>
    gsub("(?:background-color: |;)", "", x = _) |>
    unique() |>
    expect_length(1)

  # Expect all color values to be of the 'rgba()' string format
  tbl_html_3 |>
    selection_value("style") |>
    gsub("(?:background-color: |;)", "", x = _) |>
    expect_match("^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$")

  # Create a `tbl_html` object by using `tab_style` with
  # the `cell_fill()` helper function and a hexadecimal color
  # value in the #RRGGBB format, and, set `alpha` to `0.5`
  # inside `cell_fill()`
  tbl_html_4 <-
    test_tbl |>
    gt() |>
    tab_style(
      style = cell_fill(color = "#FF235D", alpha = 0.5),
      locations = cells_body(columns = "month")
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect a single color to have been generated and used
  tbl_html_4 |>
    selection_value("style") |>
    gsub("(?:background-color: |;)", "", x = _) |>
    unique() |>
    expect_length(1)

  # Expect all color values to be of the 'rgba()' string format
  tbl_html_4 |>
    selection_value("style") |>
    gsub("(?:background-color: |;)", "", x = _) |>
    expect_match("^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$")

  # Expect that all alpha values are 0.5 (or "80" as a hex value)
  (
    tbl_html_4 |>
      selection_value("style") |>
      gsub("(background-color: |; color: .*|;)", "", x = _)
  ) |>
    rgba_to_hex() |>
    substring(8, 9) |>
    unique() |>
    expect_equal("80")

  # Create a `tbl_html` object by using `tab_style` with
  # the `cell_fill()` helper function and a hexadecimal color
  # value in the #RRGGBBAA format, and, set `alpha` to `0.5`
  # inside `cell_fill()` (that is expected to override the
  # alpha value that is part of the supplied `color`)
  tbl_html_5 <-
    test_tbl |>
    gt() |>
    tab_style(
      style = cell_fill(color = "#F3F300EE", alpha = 0.5),
      locations = cells_body(columns = "month")
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect a single color to have been generated and used
  tbl_html_5 |>
    selection_value("style") |>
    gsub("(?:background-color: |;)", "", x = _) |>
    unique() |>
    expect_length(1)

  # Expect all color values to be of the 'rgba()' string format
  tbl_html_5 |>
    selection_value("style") |>
    gsub("(?:background-color: |;)", "", x = _) |>
    expect_match("^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$")

  # Expect that all alpha values are 0.5 (or "80" as a hex value and
  # *not* "EE")
  (
    tbl_html_5 |>
      selection_value("style") |>
      gsub("(background-color: |; color: .*|;)", "", x = _)
  ) |>
    rgba_to_hex() |>
    substring(8, 9) |>
    unique() |>
    expect_equal("80")
})

test_that("data_color() errors gracefully with scales error (#1373)", {

  d <- data.frame(
    x = c(4, 1, 2, 3),
    y = c(1, 2, 3, Inf)
  )
  gt_inf <- gt(d)

  expect_snapshot(
    error = TRUE,
    data_color(gt_inf)
  )
})

test_that("data_color() resolves rows and columns like fmt_number() (#1665).", {

  gt_simple <- gt(mtcars_short)
  gt_rows <- gt(mtcars_short, rownames_to_stub = TRUE)
  # We want fmt_number() and data_color() to work consistently
  expect_no_error({
    # expect nothing happens (output tested elsewhere)
    fmt_number(gt_simple, rows = cyl == 5, decimals = 6)
    data_color(gt_simple, rows = cyl == 5)
  })
  # Expect nice nudge when referring to rows by names (without row names) #1770
  expect_snapshot(error = TRUE, {
    fmt_number(gt_simple, rows = "Datsun 710", decimals = 6)
    data_color(gt_simple, rows = "Datsun 710")
  })

  # expect styling and formatting at the correct place (The actual tests for output are in above)
  expect_no_error({
    fmt_number(gt_rows, rows = "Datsun 710", decimals = 6)
    data_color(gt_rows, rows = "Datsun 710")
  })

  # expect error for non-existing row (by name)
  expect_snapshot(error = TRUE, {
    fmt_number(gt_rows, rows = "Datsun 711", decimals = 6)
    data_color(gt_rows, rows = "Datsun 711")
  })

  # expect error for non-existing row (by position)
  expect_snapshot(error = TRUE, {
    fmt_number(gt_rows, rows = 33, decimals = 6)
    data_color(gt_rows, rows = 33)
  })

  # expect no error for non-existing row or (by tidyselect) #1665
  # early return for data_color
  expect_no_error({
    fmt_number(gt_rows, rows = contains("Datsun 711"), decimals = 6)
    data_color(gt_rows, rows = contains("Datsun 711"))
    fmt_number(gt_simple, columns = contains("Datsun 711"), decimals = 6)
    data_color(gt_simple, columns = contains("Datsun 711"))
  })

})
