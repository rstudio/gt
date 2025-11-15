expect_caption_eq <- function(caption, expected) {

  result <- create_caption_component_h(gt(exibble, caption = caption))

  expect_identical(
    result,
    htmltools::HTML(paste0(
      "<!--/html_preserve--><caption class='gt_caption'>",
      expected,
      "</caption><!--html_preserve-->"
    ))
  )
}

test_that("A caption can be added/removed with `tab_caption()`/`rm_caption()`", {

  # Create a table and add a caption
  tbl_1 <-
    exibble |>
    gt() |>
    tab_caption(caption = "A caption.")

  # Determine that the caption is internally present
  expect_equal(
    dt_options_get_value(data = tbl_1, option = "table_caption"),
    "A caption."
  )

  # Expect that the caption is rendered correctly
  expect_equal(
    as.character(create_caption_component_h(data = tbl_1)),
    "<!--/html_preserve--><caption class='gt_caption'>A caption.</caption><!--html_preserve-->"
  )

  # Create a table and add a caption using Markdown
  tbl_2 <-
    exibble |>
    gt() |>
    tab_caption(caption = md("A *caption*."))

  # Determine that the caption is internally present
  expect_equal(
    dt_options_get_value(data = tbl_2, option = "table_caption"),
    md("A *caption*.")
  )

  # Expect that the caption is rendered correctly
  expect_equal(
    as.character(create_caption_component_h(data = tbl_2)),
    "<!--/html_preserve--><caption class='gt_caption'><span class='gt_from_md'>A <em>caption</em>.</span></caption><!--html_preserve-->"
  )

  # Create a table, add a caption in `gt()`, overwrite with `tab_caption()`
  tbl_3 <-
    exibble |>
    gt(caption = "gt caption.") |>
    tab_caption(caption = "Final caption.")

  # Determine that the caption set through `tab_caption()` is present
  expect_equal(
    dt_options_get_value(data = tbl_3, option = "table_caption"),
    "Final caption."
  )

  # Create a table, add a caption in `gt()`, overwrite that
  # twice with `tab_caption()`
  tbl_4 <-
    exibble |>
    gt(caption = "gt caption.") |>
    tab_caption(caption = "Second caption.") |>
    tab_caption(caption = "Final caption.")

  # Determine that the caption set through `tab_caption()` is present
  expect_equal(
    dt_options_get_value(data = tbl_4, option = "table_caption"),
    "Final caption."
  )

  #
  # Expect any caption set can be removed with `rm_caption()`
  #

  exibble |>
    gt(caption = "gt caption.") |>
    rm_caption() |>
    dt_options_get_value(option = "table_caption") |>
    expect_equal(NA_character_)

  exibble |>
    gt(caption = "gt caption.") |>
    tab_caption(caption = "Final caption.") |>
    rm_caption() |>
    dt_options_get_value(option = "table_caption") |>
    expect_equal(NA_character_)

  exibble |>
    gt() |>
    tab_caption(caption = "A caption.") |>
    tab_caption(caption = "Another caption.") |>
    rm_caption() |>
    dt_options_get_value(option = "table_caption") |>
    expect_equal(NA_character_)

  exibble |>
    gt() |>
    tab_caption(caption = "A caption.") |>
    rm_caption() |>
    tab_caption(caption = "Another caption.") |>
    rm_caption() |>
    dt_options_get_value(option = "table_caption") |>
    expect_equal(NA_character_)

  #
  # Expect no issues from using `rm_caption()` unnecessarily or repeatedly
  #
  expect_no_warning(gt(exibble) |> rm_caption())
  expect_no_warning(gt(exibble) |> rm_caption() |> rm_caption())
  expect_no_warning(gt(exibble, caption = "cap") |> rm_caption() |> rm_caption())
  expect_no_warning(gt(exibble) |> tab_caption(caption = "cap") |> rm_caption() |> rm_caption())
  expect_no_warning(gt(exibble, caption = "cap") |> tab_caption(caption = "cap") |> rm_caption() |> rm_caption())

  #
  # Ensure that a caption element is not rendered when using `rm_caption()`
  #
  expect_equal(
    as.character(create_caption_component_h(data = gt(exibble, caption = "cap") |> rm_caption())),
    character(0L)
  )

  expect_equal(
    as.character(create_caption_component_h(data = gt(exibble) |> tab_caption(caption = "cap") |> rm_caption())),
    character(0L)
  )

  # Expect that a caption removal can also happen when using `tab_caption(caption = NA)`
  expect_equal(
    as.character(create_caption_component_h(data = gt(exibble) |> tab_caption(caption = "cap") |> tab_caption(caption = NA))),
    character(0L)
  )

  expect_equal(
    as.character(create_caption_component_h(data = gt(exibble) |> tab_caption(caption = "cap") |> tab_caption(caption = NA_character_))),
    character(0L)
  )

  expect_equal(
    as.character(create_caption_component_h(data = gt(exibble) |> tab_caption(caption = "cap") |> tab_caption(caption = NA_real_))),
    character(0L)
  )

  expect_equal(
    as.character(create_caption_component_h(data = gt(exibble) |> tab_caption(caption = "cap") |> tab_caption(caption = NA_integer_))),
    character(0L)
  )
})
