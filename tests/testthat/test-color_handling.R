# Create a table that can be used for testing
test_tbl <-
  sza |>
  dplyr::filter(latitude == 50, !is.na(sza)) |>
  dplyr::group_by(month) |>
  dplyr::summarize(min_sza = min(sza))

test_that("The various color utility functions work correctly", {

  # Assign various color vectors that are of different specifications
  c_name <- c("red", "tomato", "palevioletred3", "limegreen", "gray86", "blue", "transparent")
  c_hex <- c("#FFAA00", "#FFBB34", "#AD552E", "#900019")
  c_hex_a <- c("#FF235D60", "#AA253A70", "#F3F300FF", "#D2D72110")
  c_s_hex <- c("#f0A", "#000", "#32b")
  c_s_hex_a <- c("#f0A1", "#000F", "#32ba")
  c_rgba <- c("rgba(255,170,0,0.5)", "rgba(255,187,52,1)", "rgba(20,255,0,1.0)")

  # Expect that `is_rgba_col()` will identify valid color strings
  # in the 'rgba()' CSS format
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

  # Expect that `expand_short_hex()` reliably transforms shorthand hexadecimal
  # colors (`#RGB` and `#RGBA`) to their expanded counterparts
  expect_equal(
    expand_short_hex(colors = c_s_hex),
    c("#FF00AA", "#000000", "#3322BB")
  )
  expect_equal(
    expand_short_hex(colors = c_s_hex_a),
    c("#FF00AA11", "#000000FF", "#3322BBAA")
  )

  # Expect that `rgba_to_hex()` reliably returns
  # color strings in the hexadecimal format of #RRGGBBAA
  # when supplied 'rgba()' format strings
  expect_equal(
    rgba_to_hex(colors = c_rgba),
    c("#FFAA0080", "#FFBB34FF", "#14FF00FF")
  )

  # Expect that the `rgba_to_hex()` utility function will pass through *any*
  # strings that don't conform to the 'rgba()' string format
  expect_equal(
    rgba_to_hex(colors = c(c_rgba, c_hex, c_hex_a, c_s_hex, c_s_hex_a, "test")),
    c("#FFAA0080", "#FFBB34FF", "#14FF00FF", c_hex, c_hex_a, c_s_hex, c_s_hex_a, "test")
  )

  # Expect that the `html_color()` utility function will reliably return
  # color strings in either the hexadecimal format of #RRGGBB or as
  # 'rgba()' format strings (when `alpha` is NULL, which is the default)
  expect_equal(
    html_color(colors = c(c_name, c_hex, c_hex_a, c_s_hex, c_s_hex_a)),
    c(
      "#FF0000", "#FF6347", "#CD6889", "#32CD32", "#DBDBDB", "#0000FF",
      "rgba(255,255,255,0)",
      c_hex,
      "rgba(255,35,93,0.38)", "rgba(170,37,58,0.44)", "#F3F300", "rgba(210,215,33,0.06)",
      "#FF00AA", "#000000", "#3322BB",
      "rgba(255,0,170,0.07)", "#000000", "rgba(51,34,187,0.67)"
    )
  )

  # Expect that the `html_color()` utility function will reliably return
  # color strings entirely in the hexadecimal format of #RRGGBB when `alpha` is
  # equal to `1`
  expect_equal(
    html_color(colors = c(c_name, c_hex, c_hex_a, c_s_hex, c_s_hex_a), alpha = 1),
    c(
      "#FF0000", "#FF6347", "#CD6889", "#32CD32", "#DBDBDB", "#0000FF",
      "#FFFFFF",
      c_hex,
      "#FF235D", "#AA253A", "#F3F300", "#D2D721",
      "#FF00AA", "#000000", "#3322BB",
      "#FF00AA", "#000000", "#3322BB"
    )
  )

  # Expect that `html_color()` will reliably return color strings entirely
  # in the 'rgba()' string format when `alpha` is non-NULL and less than `1`
  expect_equal(
    html_color(colors = c(c_name, c_hex, c_hex_a, c_s_hex, c_s_hex_a), alpha = 0.5),
    c(
      "rgba(255,0,0,0.5)", "rgba(255,99,71,0.5)", "rgba(205,104,137,0.5)",
      "rgba(50,205,50,0.5)", "rgba(219,219,219,0.5)", "rgba(0,0,255,0.5)",
      "rgba(255,255,255,0.5)",
      "rgba(255,170,0,0.5)", "rgba(255,187,52,0.5)", "rgba(173,85,46,0.5)",
      "rgba(144,0,25,0.5)", "rgba(255,35,93,0.5)", "rgba(170,37,58,0.5)",
      "rgba(243,243,0,0.5)", "rgba(210,215,33,0.5)",
      "rgba(255,0,170,0.5)", "rgba(0,0,0,0.5)", "rgba(51,34,187,0.5)",
      "rgba(255,0,170,0.5)", "rgba(0,0,0,0.5)", "rgba(51,34,187,0.5)"
    )
  )

  # Expect that `html_color()` won't alter any 'rgba()' strings passed to it
  expect_equal(
    html_color(
      colors = c(c_name, c_hex, c_hex_a, c_rgba, c_s_hex, c_s_hex_a),
      alpha = 1
    ),
    c(
      "#FF0000", "#FF6347", "#CD6889", "#32CD32", "#DBDBDB", "#0000FF",
      "#FFFFFF",
      c_hex,
      "#FF235D", "#AA253A", "#F3F300", "#D2D721",
      c_rgba,
      "#FF00AA", "#000000", "#3322BB",
      "#FF00AA", "#000000", "#3322BB"
    )
  )

  # Furthermore, expect that all alpha values in the 'rgba()' strings are of the
  # same value when `alpha` is non-NULL and less than `1`
  expect_length(
    unique(
      gsub(
        "(?:^.*,|\\))", "",
        html_color(
          colors = c(c_name, c_hex, c_hex_a, c_s_hex, c_s_hex_a),
          alpha = 0.5
        )
      )
    ),
    1
  )

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
    html_color(
      colors = c(c_name, c_hex, c_hex_a, c_s_hex, c_s_hex_a, "rebeccapurple", "lime")
    ),
    c(
      "#FF0000", "#FF6347", "#CD6889", "#32CD32", "#DBDBDB", "#0000FF",
      "rgba(255,255,255,0)",
      "#FFAA00", "#FFBB34", "#AD552E", "#900019", "rgba(255,35,93,0.38)",
      "rgba(170,37,58,0.44)", "#F3F300", "rgba(210,215,33,0.06)",
      "#FF00AA", "#000000", "#3322BB",
      "rgba(255,0,170,0.07)", "#000000", "rgba(51,34,187,0.67)",
      "#663399", "#00FF00"
    )
  )

  # Expect that the CSS exclusive names will still work if names have mixed case
  expect_equal(
    html_color(
      colors = c(c_name, c_hex, c_hex_a, c_s_hex, c_s_hex_a, "RebeccaPurple", "Lime")
      ),
    c(
      "#FF0000", "#FF6347", "#CD6889", "#32CD32", "#DBDBDB", "#0000FF",
      "rgba(255,255,255,0)",
      "#FFAA00", "#FFBB34", "#AD552E", "#900019", "rgba(255,35,93,0.38)",
      "rgba(170,37,58,0.44)", "#F3F300", "rgba(210,215,33,0.06)",
      "#FF00AA", "#000000", "#3322BB",
      "rgba(255,0,170,0.07)", "#000000", "rgba(51,34,187,0.67)",
      "#663399", "#00FF00"
    )
  )

  # Expect an error if an NA value is provided anywhere as input
  expect_error(
    html_color(colors = c(c_name, c_hex, c_hex_a, c_s_hex, c_s_hex_a, NA_character_))
  )

  # Expect an error if an invalid color name is provided
  expect_error(
    html_color(colors = c(c_name, c_hex, c_hex_a, c_s_hex, c_s_hex_a, "blau"))
  )

  # Expect an error if an invalid color format is provided
  expect_error(
    html_color(colors = c(c_name, c_hex, c_hex_a, c_s_hex, "#FF04JJ"))
  )
  expect_error(
    html_color(colors = c(c_name, c_hex, c_hex_a, c_s_hex, "#FF0033100"))
  )
  expect_error(
    html_color(colors = c(c_name, c_hex, c_hex_a, c_s_hex, "FF04E2"))
  )

  # Don't expect an error if 'rgba()'-format colors are passed to `html_color`
  expect_no_error(
    html_color(colors = c(c_name, c_hex, c_hex_a, c_s_hex, "rgba(210,215,33,0.5)"))
  )

  # Expect that the `normalize_colors()` utility function will reliably return
  # color strings in the hexadecimal format of #RRGGBB when `alpha` is 1
  # (which needs to be set)
  expect_equal(
    normalize_colors(colors = c(c_name, c_hex, c_hex_a), alpha = 1),
    c(
      "#FF0000", "#FF6347", "#CD6889", "#32CD32", "#DBDBDB", "#0000FF",
      "#FFFFFF",
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
      "rgba(255,255,255,0.5)",
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
      "rgba(255,255,255,0)",
      "#FFAA00", "#FFBB34", "#AD552E", "#900019", "rgba(255,35,93,0.38)",
      "rgba(170,37,58,0.44)", "#F3F300", "rgba(210,215,33,0.06)"
    )
  )

  # Expect an error if 'rgba()'-format colors are passed to `normalize_colors()`
  expect_error(
    normalize_colors(
      colors = c(c_name, c_hex, c_hex_a, "rgba(210,215,33,0.5)"),
      alpha = NULL
    )
  )

  # Expect that the `ideal_fgnd_color()` function returns a vector containing
  # either a light color ("#FFFFFF") or a dark color ("#000000") based on the
  # input colors; this should work with all of the color formats that
  # `html_color()` produces
  expect_equal(
    ideal_fgnd_color(bgnd_color = c(c_name, c_hex, c_hex_a, c_rgba)),
    c(
      "#FFFFFF", "#FFFFFF", "#FFFFFF", "#000000", "#000000", "#FFFFFF",
      "#000000", "#000000", "#000000", "#FFFFFF", "#FFFFFF", "#FFFFFF",
      "#FFFFFF", "#000000", "#000000", "#000000", "#000000", "#000000"
    )
  )

  # Expect that background colors expressed in shorthand hexadecimal values
  # will produce the same results in `ideal_fgnd_color()` as their expanded
  # counterparts
  s_hex_colors <-
    vapply(
      c(as.character(0:9), LETTERS[1:6]),
      FUN.VALUE = character(1L),
      USE.NAMES = FALSE,
      FUN = function(x) {
        paste0("#", paste(rep(x, 3), collapse = ""))
      }
    )

  hex_colors <-
    vapply(
      c(as.character(0:9), LETTERS[1:6]),
      FUN.VALUE = character(1L),
      USE.NAMES = FALSE,
      FUN = function(x) {
        paste0("#", paste(rep(x, 6), collapse = ""))
      }
    )

  expect_equal(
    ideal_fgnd_color(bgnd_color = s_hex_colors),
    ideal_fgnd_color(bgnd_color = hex_colors)
  )

  # Expect that the above equivalency should also hold if there are alpha
  # values in the shorthand and normal hexadecimal color forms
  expect_equal(
    ideal_fgnd_color(bgnd_color = paste0(s_hex_colors, "8")),
    ideal_fgnd_color(bgnd_color = paste0(hex_colors, "88"))
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
    ideal_fgnd_color(bgnd_color = c(c_hex, c_hex_a, c_s_hex, "#FF04JJ"))
  )
  expect_error(
    ideal_fgnd_color(bgnd_color = c(c_hex, c_hex_a, c_s_hex, "#FF0033100"))
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

test_that("cell_fill() accepts colors of various types", {

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
  tbl_html_4 |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*|;)", "", x = _) |>
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
  tbl_html_5 |>
    selection_value("style") |>
    gsub("(background-color: |; color: .*|;)", "", x = _) |>
    rgba_to_hex() |>
    substring(8, 9) |>
    unique() |>
    expect_equal("80")

  # Create a `tbl_html` object by using `tab_style` with
  # the `cell_fill()` helper function and the 'transparent' color
  tbl_html_6 <-
    test_tbl |>
    gt() |>
    tab_style(
      style = cell_text(color = "transparent"),
      locations = cells_body(columns = "month")
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect a single color to have been generated and used
  tbl_html_6 |>
    selection_value("style") |>
    gsub("(?:color: |;)", "", x = _) |>
    unique() |>
    expect_length(1)

  # Expect all color values to be of the 'rgba()' string format
  tbl_html_6 |>
    selection_value("style") |>
    gsub("(?:color: |;)", "", x = _) |>
    expect_match("^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$")

  # Expect all color values to be "rgba(255,255,255,0)"
  tbl_html_6 |>
    selection_value("style") |>
    gsub("(?:color: |;)", "", x = _) |>
    unique() |>
    expect_equal("rgba(255,255,255,0)")

  # Expect that using shorthand hexadecimal color values will result in the
  # same table output as with using standard hexadecimal colors
  expect_equal_gt(
    test_tbl |>
      gt() |>
      tab_style(
        style = cell_text(color = "#888"),
        locations = cells_body(columns = "month")
      ),
    test_tbl |>
      gt() |>
      tab_style(
        style = cell_text(color = "#888888"),
        locations = cells_body(columns = "month")
      )
  )

  expect_equal_gt(
    test_tbl |>
      gt() |>
      tab_style(
        style = cell_text(color = "#888A"),
        locations = cells_body(columns = "month")
      ),
    test_tbl |>
      gt() |>
      tab_style(
        style = cell_text(color = "#888888AA"),
        locations = cells_body(columns = "month")
      )
  )
})
