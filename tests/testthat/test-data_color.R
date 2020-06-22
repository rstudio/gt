context("Ensuring that coloring cells with `data_color()` is reliable")

# Create a table that can be used for all `data_color()` tests
test_tbl <-
  sza %>%
  dplyr::filter(
    latitude == 50 & !is.na(sza)
  ) %>%
  dplyr::group_by(month) %>%
  dplyr::summarize(min_sza = min(sza))

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
  skip_if_not_installed("xml2")
}

# Gets the HTML attr value from a single key
selection_value <- function(html, key) {

  selection <- paste0("[", key, "]")

  html %>%
    rvest::html_nodes(selection) %>%
    rvest::html_attr(key)
}

# Gets the inner HTML text from a single value
selection_text <- function(html, selection) {

  html %>%
    rvest::html_nodes(selection) %>%
    rvest::html_text()
}

test_that("the correct color values are obtained when defining a palette", {

  # Obtain a palette of 12 colors in #RRGGBB format
  pal_12 <-
    paletteer::paletteer_d(palette = "rcartocolor::Vivid") %>% as.character() %>%
    gsub("FF$", "", .)

  # Create a `tbl_html` object by using `data_color` with the #RRGGBB
  # colors on the month column (which is of the `character` class)
  tbl_html_1 <-
    test_tbl %>%
    dplyr::mutate(month = as.character(month)) %>%
    gt() %>%
    data_color(
      columns = vars(month),
      colors = pal_12,
      autocolor_text = TRUE
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the background colors are in the same form as
  # those supplied (`pal_12`) though not necessarily in the same
  # order as in the `pal_12` vector
  (
    (tbl_html_1 %>%
       selection_value("style") %>%
       gsub("(background-color: |; color: .*)", "", .)) %in%
      pal_12
  ) %>%
    all() %>%
    expect_true()

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  (
    (tbl_html_1 %>%
       selection_value("style") %>%
       gsub("(.*: |;$)", "", .)) %in%
      c("#000000", "#FFFFFF")
  ) %>%
    all() %>%
    expect_true()

  # When using `autocolor_text = FALSE` expect to not see the
  # `color` attribute in any of the colored cells of the `month` column
  test_tbl %>%
    dplyr::mutate(month = as.character(month)) %>%
    gt() %>%
    data_color(
      columns = vars(month),
      colors = pal_12,
      autocolor_text = FALSE
    ) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_value("style") %>%
    grepl("[^-]color:", .) %>%
    any() %>%
    expect_false()

  # Create a `tbl_html_2` object by using `data_color` with the #RRGGBB
  # colors on the month column (which is of the `factor` class)
  tbl_html_2 <-
    test_tbl %>%
    gt() %>%
    data_color(
      columns = vars(month),
      colors = pal_12,
      autocolor_text = TRUE
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the background colors are in the same form as
  # those supplied (`pal_12`) and the order is identical as well
  expect_equivalent(
    tbl_html_2 %>%
      selection_value("style") %>%
      gsub("(background-color: |; color: .*)", "", .),
    pal_12
  )

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  (
    (tbl_html_2 %>%
       selection_value("style") %>%
       gsub("(.*: |;$)", "", .)) %in%
      c("#000000", "#FFFFFF")
  ) %>%
    all() %>%
    expect_true()

  # When using `autocolor_text = FALSE` expect to not see the
  # `color` attribute in any of the colored cells of the `month`
  # column
  test_tbl %>%
    gt() %>%
    data_color(
      columns = vars(month),
      colors = pal_12,
      autocolor_text = FALSE
    ) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_value("style") %>%
    grepl("[^-]color:", .) %>%
    any() %>%
    expect_false()

  # Create a `tbl_html_3` object by using `data_color` with the color names
  # (arranged from 'hot' to 'cold' in the vector) on the `min_sza` column
  # (which is of the `numeric` class)
  tbl_html_3 <-
    test_tbl %>%
    gt() %>%
    data_color(
      columns = vars(min_sza),
      colors = c("red", "orange", "green", "blue"),
      autocolor_text = TRUE
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect 12 unique color values to have been generated and
  # used (because this relates to a numeric mapping)
  tbl_html_3 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    unique() %>%
    length() %>%
    expect_equal(12)

  # Expect all color values to be of the #RRGGBB form
  tbl_html_3 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    expect_match("^#[0-9A-F]{6}$")

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  (
    (tbl_html_3 %>%
       selection_value("style") %>%
       gsub("(.*: |;$)", "", .)) %in%
      c("#000000", "#FFFFFF")
  ) %>%
    all() %>%
    expect_true()

  # Create a `tbl_html_rrggbb` object by using `data_color` with color values
  # written in the #RRGGBB form (arranged in the same way as before);
  # again, applied to the `min_sza` column

  rgb_hex_colors <- c("#FF0000", "#FFA500", "#00FF00", "#0000FF")

  tbl_html_rrggbb <-
    test_tbl %>%
    gt() %>%
    data_color(
      columns = vars(min_sza),
      colors = rgb_hex_colors,
      autocolor_text = TRUE
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect 12 unique color values to have been generated and used
  tbl_html_rrggbb %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    unique() %>%
    length() %>%
    expect_equal(12)

  # Expect all color values to be of the #RRGGBB form
  tbl_html_rrggbb %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    expect_match("^#[0-9A-F]{6}$")

  # Expect all color values to be identical to those from
  # the table that was generated from color names
  expect_identical(
    tbl_html_3 %>%
      selection_value("style") %>%
      gsub("(background-color: |; color: .*)", "", .),
    tbl_html_rrggbb %>%
      selection_value("style") %>%
      gsub("(background-color: |; color: .*)", "", .)
  )

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  (
    (tbl_html_rrggbb %>%
       selection_value("style") %>%
       gsub("(.*: |;$)", "", .)) %in%
      c("#000000", "#FFFFFF")
  ) %>%
    all() %>%
    expect_true()

  # Create a `tbl_html_rrggbbaa` object by using `data_color` with color values
  # written in the #RRGGBBAA form (arranged in the same way as before,
  # having different alpha channel values)
  rgba_hex_colors <- c("#FF000060", "#FFA500FF", "#00FF0090", "#0000BB")

  tbl_html_rrggbbaa <-
    test_tbl %>%
    gt() %>%
    data_color(
      columns = vars(min_sza),
      colors = rgba_hex_colors,
      autocolor_text = TRUE
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect 12 unique color values to have been generated and used
  tbl_html_rrggbbaa %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    unique() %>%
    length() %>%
    expect_equal(12)

  # Expect color values to be of either the #RRGGBB or the
  # rgba() CSS value form
  tbl_html_rrggbbaa %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    expect_match("(?:^#[0-9A-F]{6}$|^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$)")

  # Expect the alpha values to have interpolation, yielding
  # several different values between 0 and 1
  (
    tbl_html_rrggbbaa %>%
      selection_value("style") %>%
      gsub("(background-color: |; color: .*)", "", .)
  )[-1] %>%
    rgba_to_hex() %>%
    substring(8, 9) %>%
    unique() %>%
    length() %>%
    expect_gt(6)

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  (
    (tbl_html_rrggbbaa %>%
       selection_value("style") %>%
       gsub("(.*: |;$)", "", .)) %in%
      c("#000000", "#FFFFFF")
  ) %>%
    all() %>%
    expect_true()

  # Create a `tbl_html_rrggbbaa_mixed` object by using `data_color` with
  # color values written with mixed #RRGGBB and #RRGGBBAA forms
  # (arranged in the same way)
  rgba_hex_colors_mixed <- c("#FF0000", "#FFA50060", "#00FF00", "#0000BB90")

  tbl_html_rrggbbaa_mixed <-
    test_tbl %>%
    gt() %>%
    data_color(
      columns = vars(min_sza),
      colors = rgba_hex_colors_mixed,
      autocolor_text = TRUE
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect 12 unique color values to have been generated and used
  tbl_html_rrggbbaa_mixed %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    unique() %>%
    length() %>%
    expect_equal(12)

  # Expect color values to be of either the #RRGGBB or the
  # rgba() CSS value form
  tbl_html_rrggbbaa_mixed %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    expect_match("(?:^#[0-9A-F]{6}$|^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$)")

  # Expect the alpha values to have interpolation, yielding
  # several different values between 0 and 1
  (
    tbl_html_rrggbbaa_mixed %>%
      selection_value("style") %>%
      gsub("(background-color: |; color: .*)", "", .)
  ) %>%
    sort() %>%
    .[3:length(.)] %>%
    rgba_to_hex() %>%
    substring(8, 9) %>%
    unique() %>%
    length() %>%
    expect_gt(6)

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  (
    (tbl_html_rrggbbaa_mixed %>%
       selection_value("style") %>%
       gsub("(.*: |;$)", "", .)) %in%
      c("#000000", "#FFFFFF")
  ) %>%
    all() %>%
    expect_true()

  # Create a `rgba_hex_colors_mixed_2` object by using `data_color` with
  # color values written with mixed #RRGGBB, #RRGGBBAA, and named forms
  rgba_hex_colors_mixed_2 <- c("red", "#FFA50060", "#00FF00", "#0000BB90")

  tbl_html_rrggbbaa_mixed_2 <-
    test_tbl %>%
    gt() %>%
    data_color(
      columns = vars(min_sza),
      colors = rgba_hex_colors_mixed_2,
      autocolor_text = TRUE
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect 12 unique color values to have been generated and used
  tbl_html_rrggbbaa_mixed_2 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    unique() %>%
    length() %>%
    expect_equal(12)

  # Expect color values to be of either the #RRGGBB or the
  # rgba() CSS value form
  tbl_html_rrggbbaa_mixed_2 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    expect_match("(?:^#[0-9A-F]{6}$|^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$)")

  # Expect all color values to be identical to those from
  # the previous table
  expect_identical(
    tbl_html_rrggbbaa_mixed %>%
      selection_value("style") %>%
      gsub("(background-color: |; color: .*)", "", .),
    tbl_html_rrggbbaa_mixed_2 %>%
      selection_value("style") %>%
      gsub("(background-color: |; color: .*)", "", .)
  )

  # Expect the alpha values to have interpolation, yielding
  # several different values between 0 and 1
  (
    tbl_html_rrggbbaa_mixed_2 %>%
      selection_value("style") %>%
      gsub("(background-color: |; color: .*)", "", .)
  ) %>%
    sort() %>%
    .[3:length(.)] %>%
    rgba_to_hex() %>%
    substring(8, 9) %>%
    unique() %>%
    length() %>%
    expect_gt(6)

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  (
    (tbl_html_rrggbbaa_mixed_2 %>%
       selection_value("style") %>%
       gsub("(.*: |;$)", "", .)) %in%
      c("#000000", "#FFFFFF")
  ) %>%
    all() %>%
    expect_true()

  # Create a `tbl_html_4` object by using `data_color` with the #RRGGBB
  # colors on the month column (which is of the `character` class);
  # this time, set `alpha` equal to 1
  tbl_html_4 <-
    test_tbl %>%
    dplyr::mutate(month = as.character(month)) %>%
    gt() %>%
    data_color(
      columns = vars(month),
      colors = pal_12,
      autocolor_text = TRUE,
      alpha = 1
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the background colors are in the same form as
  # those supplied (`pal_12`) though not necessarily in the same
  # order as in the `pal_12` vector
  (
    (tbl_html_4 %>%
       selection_value("style") %>%
       gsub("(background-color: |; color: .*)", "", .)) %in%
      pal_12
  ) %>%
    all() %>%
    expect_true()

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  (
    (tbl_html_4 %>%
       selection_value("style") %>%
       gsub("(.*: |;$)", "", .)) %in%
      c("#000000", "#FFFFFF")
  ) %>%
    all() %>%
    expect_true()

  # When using `autocolor_text = FALSE` expect to not see the
  # `color` attribute in any of the colored cells of the `month` column
  test_tbl %>%
    dplyr::mutate(month = as.character(month)) %>%
    gt() %>%
    data_color(
      columns = vars(month),
      colors = pal_12,
      autocolor_text = FALSE,
      alpha = 1
    ) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_value("style") %>%
    grepl("[^-]color:", .) %>%
    any() %>%
    expect_false()

  # Expect all color values to be identical to those from
  # `tbl_html_1`
  expect_identical(
    tbl_html_4 %>%
      selection_value("style") %>%
      gsub("(background-color: |; color: .*)", "", .),
    tbl_html_1 %>%
      selection_value("style") %>%
      gsub("(background-color: |; color: .*)", "", .)
  )

  # Create a `tbl_html_5` object by using `data_color` with the #RRGGBB
  # colors on the month column (which is of the `character` class);
  # this time, set `alpha` equal to 0.5
  tbl_html_5 <-
    test_tbl %>%
    dplyr::mutate(month = as.character(month)) %>%
    gt() %>%
    data_color(
      columns = vars(month),
      colors = pal_12,
      autocolor_text = TRUE,
      alpha = 0.5
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect color values to be entirely in the rgba() CSS value form
  tbl_html_5 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    expect_match("^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$")

  # Expect the same test result by using `is_rgba_col()`
  tbl_html_5 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    is_rgba_col() %>%
    all() %>%
    expect_true()

  # Expect that all alpha values are 0.5 (or "80" as a hex value)
  (
    tbl_html_5 %>%
      selection_value("style") %>%
      gsub("(background-color: |; color: .*)", "", .)
  ) %>%
    rgba_to_hex() %>%
    substring(8, 9) %>%
    unique() %>%
    expect_equal("80")

  # Converting the rgba() values back into hexadecimal form and
  # removing the alpha channel (by use of `html_color()`) is expected
  # to give us color values in the `pal_12` #RRGGBB color vector
  (
    (
      (
        tbl_html_5 %>%
          selection_value("style") %>%
          gsub("(background-color: |; color: .*)", "", .)
      ) %>%
        rgba_to_hex() %>%
        html_color(alpha = 1)
    ) %in% pal_12
  ) %>%
    all() %>%
    expect_true()


  # Expect that NAs in column values will result in default colors
  tbl <-
    countrypops %>%
    dplyr::filter(country_name == "Mongolia") %>%
    dplyr::select(-contains("code")) %>%
    tail(10)

  tbl[1, ] <- NA

  tbl %>%
    gt() %>%
    data_color(
      columns = vars(country_name),
      colors = c("red", "orange", "green", "blue")
    ) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    expect_equal(c("#808080", rep("#FF0000", 9)))

  tbl %>%
    gt() %>%
    data_color(
      columns = vars(year),
      colors = c("red", "orange", "green", "blue")
    ) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    expect_equal(
      c("#808080", "#FF0000", "#FF5E00", "#FF8B00", "#F0B300", "#BAD700",
        "#62F600", "#6FC972", "#7978BD", "#0000FF"))

  tbl %>%
    gt() %>%
    data_color(
      columns = vars(population),
      colors = c("red", "orange", "green", "blue")
    ) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    expect_equal(
      c("#808080", "#FF0000", "#FF5700", "#FF8400", "#F6AE00", "#BED500",
        "#5FF600", "#72C477", "#7773C1", "#0000FF"))

  # Expect an error when using an invalid color name in `colors`
  expect_error(
    test_tbl %>%
      gt() %>%
      data_color(
        columns = vars(min_sza),
        colors = c("red", "blau"),
        autocolor_text = TRUE
      )
  )

  # Expect an error when providing `NULL` to `colors`
  expect_error(
    test_tbl %>%
      gt() %>%
      data_color(
        columns = vars(min_sza),
        colors = NULL,
        autocolor_text = TRUE
      )
  )

  # Expect an error when providing an `NA` to `colors`
  expect_error(
    test_tbl %>%
      gt() %>%
      data_color(
        columns = vars(min_sza),
        colors = NA,
        autocolor_text = TRUE
      )
  )

  # Expect an error when providing a numeric vector
  # to `colors`
  expect_error(
    test_tbl %>%
      gt() %>%
      data_color(
        columns = vars(min_sza),
        colors = 1:6,
        autocolor_text = TRUE
      )
  )

  # Expect an error if there is a malformed
  # hexadecimal color value given to `colors`
  expect_error(
    test_tbl %>%
      gt() %>%
      data_color(
        columns = vars(min_sza),
        colors = c("#EEFFAA", "##45AA22"),
        autocolor_text = TRUE
      )
  )
})

test_that("the correct color values are obtained when using a color fn", {

  # Create a `tbl_html` object by using `data_color` with the
  # `scales::col_factor()` fn on the month column
  # (which is of the `character` class)
  tbl_html_1 <-
    test_tbl %>%
    dplyr::mutate(month = as.character(month)) %>%
    gt() %>%
    data_color(
      columns = vars(month),
      colors = scales::col_factor(
        palette = c(
          "red", "orange", "green", "blue"),
        domain = levels(test_tbl$month)
      ),
      autocolor_text = TRUE
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect 12 unique color values to have been generated and
  # used (because this relates to a numeric mapping)
  tbl_html_1 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    unique() %>%
    length() %>%
    expect_equal(12)

  # Expect all color values to be of the #RRGGBB form
  tbl_html_1 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    expect_match("^#[0-9A-F]{6}$")

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  (
    (tbl_html_1 %>%
       selection_value("style") %>%
       gsub("(.*: |;$)", "", .)) %in%
      c("#000000", "#FFFFFF")
  ) %>%
    all() %>%
    expect_true()

  # Create a `tbl_html` object by using `data_color` with the
  # `scales::col_factor()` fn on the month column
  # (which is of the `character` class); this time, set `alpha`
  # to `0.5`
  tbl_html_2 <-
    test_tbl %>%
    dplyr::mutate(month = as.character(month)) %>%
    gt() %>%
    data_color(
      columns = vars(month),
      colors = scales::col_factor(
        palette = c("red", "orange", "green", "blue"),
        domain = levels(test_tbl$month)
      ),
      autocolor_text = TRUE,
      alpha = 0.5
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect color values to be entirely in the rgba() CSS value form
  tbl_html_2 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    expect_match("^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$")

  # Expect the same test result by using `is_rgba_col()`
  tbl_html_2 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    is_rgba_col() %>%
    all() %>%
    expect_true()

  # Expect that all alpha values are 0.5 (or "80" as a hex value)
  (
    tbl_html_2 %>%
      selection_value("style") %>%
      gsub("(background-color: |; color: .*)", "", .)
  ) %>%
    rgba_to_hex() %>%
    substring(8, 9) %>%
    unique() %>%
    expect_equal("80")

  # Create a `tbl_html` object by using `data_color` with the
  # `scales::col_factor()` fn on the month column
  # (which is of the `character` class); this time, set `alpha`
  # to `1.0`
  tbl_html_3 <-
    test_tbl %>%
    dplyr::mutate(month = as.character(month)) %>%
    gt() %>%
    data_color(
      columns = vars(month),
      colors = scales::col_factor(
        palette = c("red", "orange", "green", "blue"),
        domain = levels(test_tbl$month)
      ),
      autocolor_text = TRUE,
      alpha = 1
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect 12 unique color values to have been generated and
  # used (because this relates to a numeric mapping)
  tbl_html_3 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    unique() %>%
    length() %>%
    expect_equal(12)

  # Expect all color values to be of the #RRGGBB form
  tbl_html_3 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    expect_match("^#[0-9A-F]{6}$")

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  (
    (tbl_html_3 %>%
       selection_value("style") %>%
       gsub("(.*: |;$)", "", .)) %in%
      c("#000000", "#FFFFFF")
  ) %>%
    all() %>%
    expect_true()

  # Expect all color values to be identical to those from
  # `tbl_html_1`
  expect_identical(
    tbl_html_3 %>%
      selection_value("style") %>%
      gsub("(background-color: |; color: .*)", "", .),
    tbl_html_1 %>%
      selection_value("style") %>%
      gsub("(background-color: |; color: .*)", "", .)
  )

  # Create a `tbl_html` object by using `data_color` with the
  # `scales::col_factor()` fn on the month column
  # (which is of the `factor` class)
  tbl_html_4 <-
    test_tbl %>%
    gt() %>%
    data_color(
      columns = vars(month),
      colors = scales::col_factor(
        palette = c("red", "orange", "green", "blue"),
        domain = levels(test_tbl$month)
      ),
      autocolor_text = TRUE,
      alpha = 1
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect 12 unique color values to have been generated and
  # used (because this relates to a numeric mapping)
  tbl_html_4 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    unique() %>%
    length() %>%
    expect_equal(12)

  # Expect all color values to be of the #RRGGBB form
  tbl_html_4 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    expect_match("^#[0-9A-F]{6}$")

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  (
    (tbl_html_4 %>%
       selection_value("style") %>%
       gsub("(.*: |;$)", "", .)) %in%
      c("#000000", "#FFFFFF")
  ) %>%
    all() %>%
    expect_true()

  # Expect all color values to be identical to those from
  # `tbl_html_1`
  expect_identical(
    tbl_html_4 %>%
      selection_value("style") %>%
      gsub("(background-color: |; color: .*)", "", .),
    tbl_html_1 %>%
      selection_value("style") %>%
      gsub("(background-color: |; color: .*)", "", .)
  )

  # Create a `tbl_html` object by using `data_color` with the
  # `scales::col_numeric()` fn on the `min_sza` column
  # (which is of the `numeric` class)
  tbl_html_5 <-
    test_tbl %>%
    gt() %>%
    data_color(
      columns = vars(min_sza),
      colors = scales::col_numeric(
        palette = c("red", "orange", "green", "blue"),
        domain = c(0, 90)
      ),
      autocolor_text = TRUE,
      alpha = 1
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect 12 unique color values to have been generated and
  # used (because this relates to a numeric mapping)
  tbl_html_5 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    unique() %>%
    length() %>%
    expect_equal(12)

  # Expect all color values to be of the #RRGGBB form
  tbl_html_5 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    expect_match("^#[0-9A-F]{6}$")

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  (
    (tbl_html_5 %>%
       selection_value("style") %>%
       gsub("(.*: |;$)", "", .)) %in%
      c("#000000", "#FFFFFF")
  ) %>%
    all() %>%
    expect_true()

  # Create a `tbl_html` object by using `data_color` with the
  # `scales::col_numeric()` fn on the `min_sza` column
  # (which is of the `numeric` class); this time, use an
  # alpha value of `0.5`
  tbl_html_6 <-
    test_tbl %>%
    gt() %>%
    data_color(
      columns = vars(min_sza),
      colors = scales::col_numeric(
        palette = c("red", "orange", "green", "blue"),
        domain = c(0, 90)
      ),
      autocolor_text = TRUE,
      alpha = 0.5
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect color values to be entirely in the rgba() CSS value form
  tbl_html_6 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    expect_match("^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$")

  # Expect the same test result by using `is_rgba_col()`
  tbl_html_6 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    is_rgba_col() %>%
    all() %>%
    expect_true()

  # Expect that all alpha values are 0.5 (or "80" as a hex value)
  (
    tbl_html_6 %>%
      selection_value("style") %>%
      gsub("(background-color: |; color: .*)", "", .)
  ) %>%
    rgba_to_hex() %>%
    substring(8, 9) %>%
    unique() %>%
    expect_equal("80")

  # Create a `tbl_html` object by using `data_color` with the
  # `scales::col_quantile()` fn on the `min_sza` column
  # (which is of the `numeric` class)
  tbl_html_7 <-
    test_tbl %>%
    gt() %>%
    data_color(
      columns = vars(min_sza),
      colors = scales::col_quantile(
        palette = c("red", "orange", "green", "blue"),
        domain = c(0, 90)
      ),
      autocolor_text = TRUE
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect 3 unique color values to have been generated and
  # used (because this relates to a numeric mapping on quantiles)
  tbl_html_7 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    unique() %>%
    length() %>%
    expect_equal(3)

  # Expect all color values to be of the #RRGGBB form
  tbl_html_7 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    expect_match("^#[0-9A-F]{6}$")

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  (
    (tbl_html_7 %>%
       selection_value("style") %>%
       gsub("(.*: |;$)", "", .)) %in%
      c("#000000", "#FFFFFF")
  ) %>%
    all() %>%
    expect_true()

  # Create a `tbl_html` object by using `data_color` with the
  # `scales::col_bin()` fn on the `min_sza` column
  # (which is of the `numeric` class)
  tbl_html_8 <-
    test_tbl %>%
    gt() %>%
    data_color(
      columns = vars(min_sza),
      colors = scales::col_bin(
        palette = c("red", "orange", "green", "blue"),
        domain = c(0, 90),
        bins = 4
      ),
      autocolor_text = TRUE
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect 3 unique color values to have been generated and
  # used (because this relates to a numeric mapping on quantiles)
  tbl_html_8 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    unique() %>%
    length() %>%
    expect_equal(3)

  # Expect all color values to be of the #RRGGBB form
  tbl_html_8 %>%
    selection_value("style") %>%
    gsub("(background-color: |; color: .*)", "", .) %>%
    expect_match("^#[0-9A-F]{6}$")

  # Expect that the text colors vary between #000000 and #FFFFFF
  # since the `autocolor_text` option is TRUE (the default case)
  (
    (tbl_html_8 %>%
       selection_value("style") %>%
       gsub("(.*: |;$)", "", .)) %in%
      c("#000000", "#FFFFFF")
  ) %>%
    all() %>%
    expect_true()
})

test_that("the various color utility functions work correctly", {

  # Assign various color vectors that are of different specifications
  c_name <- c("red", "tomato", "palevioletred3", "limegreen", "gray86", "blue")
  c_hex <- c("#FFAA00", "#FFBB34", "#AD552E", "#900019")
  c_hex_a <- c("#FF235D60", "#AA253A70", "#F3F300FF", "#D2D72110")
  c_rgba <- c("rgba(255,170,0,0.5)", "rgba(255,187,52,1)", "rgba(20,255,0,1.0)")

  # Expect that the `is_rgba_col()` function will identify valid
  # color strings in the rgba() CSS format
  is_rgba_col(
    colors = c(
      c_rgba,
      "rgba(255,170,0,0.5)", "rgba(255,187,52,1)", "rgba( 127, 46, 22, 0.523 )",
      "rgba(0,0,0,0)", "rgba(128,    20 , 94, 1.000)"
      )
  ) %>%
    all() %>%
    expect_true()

  # Expect that any other strings will return FALSE values
  is_rgba_col(
    colors = c(
      "rgba (255,170,0,0.5)", "rgbc(255,187,52,1)", "rgb( 127, 46, 22, 0.523 )",
      "#FFFFFF", "rgba(128,    20 , 94, a)"
    )
  ) %>%
    any() %>%
    expect_false()

  # Expect that the `rgba_to_hex()` function reliably returns
  # color strings in the hexadecimal format of #RRGGBBAA
  # when supplied rgba() format strings
  expect_equal(
    rgba_to_hex(colors = c_rgba),
    c("#FFAA0080", "#FFBB34FF", "#14FF00FF")
  )

  # Expect that the `rgba_to_hex()` utility function will pass through *any*
  # strings that don't conform to the rgba() string format
  expect_equal(
    rgba_to_hex(colors = c(c_rgba, c_hex, "test")),
    c("#FFAA0080", "#FFBB34FF", "#14FF00FF", c_hex, "test")
  )

  # Expect that the `html_color()` utility function will reliably return
  # color strings in either the hexadecimal format of #RRGGBB or as
  # rgba() format strings (when `alpha` is NULL, which is the default)
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

  # Expect that the `html_color()` utility function will reliably return
  # color strings entirely in the rgba() string format when `alpha` is non-NULL
  # and less than `1`
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

  # Furthermore, expect that all alpha values in the rgba() strings are of the
  # same value when `alpha` is non-NULL and less than `1`
  html_color(colors = c(c_name, c_hex, c_hex_a), alpha = 0.5) %>%
    gsub("(?:^.*,|\\))", "", .) %>%
    unique() %>%
    length() %>%
    expect_equal(1)

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
  expect_error(
    html_color(colors = c(c_name, c_hex, c_hex_a, "rgba(210,215,33,0.5)"))
  )

  # Expect that the `ideal_fgnd_color()` function returns a vector containing
  # either a light color ("#FFFFFF") or a dark color ("#000000") based on the
  # input colors; this should work with all of the color formats that
  # `html_color()` produces
  expect_equal(
    ideal_fgnd_color(bgnd_color = c(c_name, c_hex, c_hex_a, c_rgba)),
    c(
      "#FFFFFF", "#000000", "#000000", "#000000", "#000000", "#FFFFFF",
      "#000000", "#000000", "#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF",
      "#000000", "#000000", "#000000", "#000000", "#000000"
    )
  )

  # Expect that the vector of light and dark colors returned is not affected
  # by any of the colors' alpha values
  expect_equivalent(
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

test_that("the `cell_fill()` function accepts colors of various types", {

  # Create a `tbl_html` object by using `tab_style` with
  # the `cell_fill()` helper function and a color name
  tbl_html_1 <-
    test_tbl %>%
    gt() %>%
    tab_style(
      style = cell_fill(color = "tomato"),
      locations = cells_body(columns = vars(month))
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect a single color to have been generated and used
  tbl_html_1 %>%
    selection_value("style") %>%
    gsub("(?:background-color: |;)", "", .) %>%
    unique() %>%
    length() %>%
    expect_equal(1)

  # Expect all color values to be of the #RRGGBB form
  tbl_html_1 %>%
    selection_value("style") %>%
    gsub("(?:background-color: |;)", "", .) %>%
    expect_match("^#[0-9A-F]{6}$")

  # Create a `tbl_html` object by using `tab_style` with
  # the `cell_fill()` helper function and a hexadecimal color
  # value in the #RRGGBB format
  tbl_html_2 <-
    test_tbl %>%
    gt() %>%
    tab_style(
      style = cell_fill(color = "#FFAA00"),
      locations = cells_body(columns = vars(month))
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect a single color to have been generated and used
  tbl_html_2 %>%
    selection_value("style") %>%
    gsub("(?:background-color: |;)", "", .) %>%
    unique() %>%
    length() %>%
    expect_equal(1)

  # Expect all color values to be of the #RRGGBB form
  tbl_html_2 %>%
    selection_value("style") %>%
    gsub("(?:background-color: |;)", "", .) %>%
    expect_match("^#[0-9A-F]{6}$")

  # Create a `tbl_html` object by using `tab_style` with
  # the `cell_fill()` helper function and a hexadecimal color
  # value in the #RRGGBBAA format
  tbl_html_3 <-
    test_tbl %>%
    gt() %>%
    tab_style(
      style = cell_fill(color = "#FF235D60"),
      locations = cells_body(columns = vars(month))
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect a single color to have been generated and used
  tbl_html_3 %>%
    selection_value("style") %>%
    gsub("(?:background-color: |;)", "", .) %>%
    unique() %>%
    length() %>%
    expect_equal(1)

  # Expect all color values to be of the rgba() string format
  tbl_html_3 %>%
    selection_value("style") %>%
    gsub("(?:background-color: |;)", "", .) %>%
    expect_match("^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$")

  # Create a `tbl_html` object by using `tab_style` with
  # the `cell_fill()` helper function and a hexadecimal color
  # value in the #RRGGBB format, and, set `alpha` to `0.5`
  # inside `cell_fill()`
  tbl_html_4 <-
    test_tbl %>%
    gt() %>%
    tab_style(
      style = cell_fill(color = "#FF235D", alpha = 0.5),
      locations = cells_body(columns = vars(month))
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect a single color to have been generated and used
  tbl_html_4 %>%
    selection_value("style") %>%
    gsub("(?:background-color: |;)", "", .) %>%
    unique() %>%
    length() %>%
    expect_equal(1)

  # Expect all color values to be of the rgba() string format
  tbl_html_4 %>%
    selection_value("style") %>%
    gsub("(?:background-color: |;)", "", .) %>%
    expect_match("^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$")

  # Expect that all alpha values are 0.5 (or "80" as a hex value)
  (
    tbl_html_4 %>%
      selection_value("style") %>%
      gsub("(background-color: |; color: .*|;)", "", .)
  ) %>%
    rgba_to_hex() %>%
    substring(8, 9) %>%
    unique() %>%
    expect_equal("80")

  # Create a `tbl_html` object by using `tab_style` with
  # the `cell_fill()` helper function and a hexadecimal color
  # value in the #RRGGBBAA format, and, set `alpha` to `0.5`
  # inside `cell_fill()` (that is expected to override the
  # alpha value that is part of the supplied `color`)
  tbl_html_5 <-
    test_tbl %>%
    gt() %>%
    tab_style(
      style = cell_fill(color = "#F3F300EE", alpha = 0.5),
      locations = cells_body(columns = vars(month))
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect a single color to have been generated and used
  tbl_html_5 %>%
    selection_value("style") %>%
    gsub("(?:background-color: |;)", "", .) %>%
    unique() %>%
    length() %>%
    expect_equal(1)

  # Expect all color values to be of the rgba() string format
  tbl_html_5 %>%
    selection_value("style") %>%
    gsub("(?:background-color: |;)", "", .) %>%
    expect_match("^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$")

  # Expect that all alpha values are 0.5 (or "80" as a hex value and
  # *not* "EE")
  (
    tbl_html_5 %>%
      selection_value("style") %>%
      gsub("(background-color: |; color: .*|;)", "", .)
  ) %>%
    rgba_to_hex() %>%
    substring(8, 9) %>%
    unique() %>%
    expect_equal("80")
})
