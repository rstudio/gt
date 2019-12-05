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
pal_12 <- paletteer::paletteer_d(package = "rcartocolor", palette = "Vivid")

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

# Expect an error when providing an `NA` along
# with valid color names to `colors`
expect_error(
  test_tbl %>%
    gt() %>%
    data_color(
      columns = vars(min_sza),
      colors = c("green", "blue", NA),
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

