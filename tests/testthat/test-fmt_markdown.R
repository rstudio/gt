test_that("The `fmt_markdown()` function works correctly", {

  # Create a few Markdown-based text snippets
  text_1a <- "
This is Markdown *text*.

Markdown’s syntax is comprised entirely of
punctuation characters, which punctuation
characters have been carefully chosen so as
to look like what they mean...  assuming
you’ve ever used email.
"

  text_1b <- "
Info on Markdown syntax can be found
[here](https://daringfireball.net/projects/markdown/).
"

  text_2a <- "
The **gt** package has these datasets:

 - `countrypops`
 - `sza`
 - `gtcars`
 - `sp500`
 - `pizzaplace`
 - `exibble`
"

  text_2b <- "
There's a quick reference [here](https://commonmark.org/help/).
"
  # Create a `gt_tbl` object with `gt()`
  # and a tibble; format all columns with
  # `fmt_markdown()`
  tab <-
    dplyr::tribble(
      ~column_1, ~column_2,
      text_1a,   text_2a,
      text_1b,   text_2b,
    ) %>%
    gt() %>%
    fmt_markdown(columns = everything())

  # Expect that the object has the correct classes
  expect_s3_class(tab, c("gt_tbl", "data.frame"))

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(tab %>% fmt_markdown(columns = "column_3"))

  #
  # Compare output of each table cell to the expected
  # HTML output strings
  #
  expect_equal(
    (tab %>%
       render_formats_test(context = "html"))[["column_1"]][[1]],
    paste0(
      "<div class='gt_from_md'><p>This is Markdown <em>text</em>",
      ".</p>\n<p>Markdown’s syntax is comprised entirely of\npunctuation ",
      "characters, which punctuation\ncharacters have been carefully chosen ",
      "so as\nto look like what they mean…  assuming\nyou’ve ever ",
      "used email.</p>\n</div>"
    )
  )

  expect_equal(
    (tab %>%
       render_formats_test(context = "html"))[["column_1"]][[2]],
    paste0(
      "<div class='gt_from_md'><p>Info on Markdown syntax can be ",
      "found\n<a href=\"https://daringfireball.net/projects/markdown/\">",
      "here</a>.</p>\n</div>"
    )
  )

  expect_equal(
    (tab %>%
       render_formats_test(context = "html"))[["column_2"]][[1]],
    paste0(
      "<div class='gt_from_md'><p>The <strong>gt</strong> package has ",
      "these datasets:</p>\n<ul>\n<li><code>countrypops</code></li>\n<li>",
      "<code>sza</code></li>\n<li><code>gtcars</code></li>\n<li><code>sp500",
      "</code></li>\n<li><code>pizzaplace</code></li>\n<li><code>exibble",
      "</code></li>\n</ul>\n</div>"
    )
  )

  expect_equal(
    (tab %>%
       render_formats_test(context = "html"))[["column_2"]][[2]],
      "<div class='gt_from_md'><p>There’s a quick reference <a href=\"https://commonmark.org/help/\">here</a>.</p>\n</div>"
  )
})
