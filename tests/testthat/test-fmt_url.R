test_that("fmt_url() works correctly", {

  # Create an input data frame with URLs
  data_tbl <-
    data.frame(
      a = c(
        "http://www.example.com",
        "https://developer.mozilla.org/en-US/docs/Learn/",
        "https://developer.mozilla.org/en-US/search?q=URL",
        NA
      ),
      stringsAsFactors = FALSE
    )

  # Create a `gt_tbl` object with `gt()` and the `data_tbl` dataset
  tab <- gt(data = data_tbl)

  # Extract vectors from the table object for comparison
  # to the original dataset
  a <- dt_data_get(tab)[["a"]]

  # Expect the extracted values to match those of the original dataset
  expect_equal(data_tbl$a, a)

  # Expect an error when attempting to format a column that does not exist
  expect_error(tab |> fmt_url(columns = b))

  # Format the `a` column to have links
  expect_equal(
    (tab |>
       fmt_url(columns = a) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">http://www.example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">https://developer.mozilla.org/en-US/docs/Learn/</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">https://developer.mozilla.org/en-US/search?q=URL</a></span>",
      NA
    )
  )

  expect_equal(
    (tab |>
       fmt_url(columns = a, label = "static label") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">static label</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">static label</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">static label</a></span>",
      NA
    )
  )

  expect_equal(
    (tab |>
       fmt_url(columns = a, as_button = TRUE) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">http://www.example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">https://developer.mozilla.org/en-US/docs/Learn/</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">https://developer.mozilla.org/en-US/search?q=URL</a></span>",
      NA
    )
  )

  expect_equal(
    (tab |>
       fmt_url(columns = a, color = "forestgreen") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#228B22;text-decoration:underline;text-underline-position: under;display: inline-block;\">http://www.example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#228B22;text-decoration:underline;text-underline-position: under;display: inline-block;\">https://developer.mozilla.org/en-US/docs/Learn/</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#228B22;text-decoration:underline;text-underline-position: under;display: inline-block;\">https://developer.mozilla.org/en-US/search?q=URL</a></span>",
      NA
    )
  )

  expect_equal(
    (tab |>
       fmt_url(columns = a, show_underline = FALSE) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#008B8B;text-decoration:none;display: inline-block;\">http://www.example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#008B8B;text-decoration:none;display: inline-block;\">https://developer.mozilla.org/en-US/docs/Learn/</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#008B8B;text-decoration:none;display: inline-block;\">https://developer.mozilla.org/en-US/search?q=URL</a></span>",
      NA
    )
  )

  expect_equal(
    (tab |>
       fmt_url(columns = a, as_button = TRUE, show_underline = TRUE) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#FFFFFF;text-decoration:underline;text-underline-position: under;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">http://www.example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#FFFFFF;text-decoration:underline;text-underline-position: under;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">https://developer.mozilla.org/en-US/docs/Learn/</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#FFFFFF;text-decoration:underline;text-underline-position: under;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">https://developer.mozilla.org/en-US/search?q=URL</a></span>",
      NA
    )
  )

  expect_equal(
    (tab |>
       fmt_url(columns = a, as_button = TRUE, button_fill = "red") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #FF0000;padding: 8px 12px;outline-style: none; outline-color: #DFDFDF; outline-width: 2px;\">http://www.example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #FF0000;padding: 8px 12px;outline-style: none; outline-color: #DFDFDF; outline-width: 2px;\">https://developer.mozilla.org/en-US/docs/Learn/</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #FF0000;padding: 8px 12px;outline-style: none; outline-color: #DFDFDF; outline-width: 2px;\">https://developer.mozilla.org/en-US/search?q=URL</a></span>",
      NA
    )
  )

  expect_equal(
    (tab |>
       fmt_url(columns = a, as_button = TRUE, button_fill = "red", color = "black") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">http://www.example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">https://developer.mozilla.org/en-US/docs/Learn/</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">https://developer.mozilla.org/en-US/search?q=URL</a></span>",
      NA
    )
  )

  expect_equal(
    (tab |>
       fmt_url(columns = a, as_button = TRUE, button_fill = "red", color = "black", button_width = px(500)) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 500px; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">http://www.example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 500px; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">https://developer.mozilla.org/en-US/docs/Learn/</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 500px; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">https://developer.mozilla.org/en-US/search?q=URL</a></span>",
      NA
    )
  )

  expect_equal(
    (tab |>
       fmt_url(columns = a, as_button = TRUE, button_fill = "red", color = "black", button_width = pct(80)) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 80%; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">http://www.example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 80%; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">https://developer.mozilla.org/en-US/docs/Learn/</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 80%; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">https://developer.mozilla.org/en-US/search?q=URL</a></span>",
      NA
    )
  )

  expect_equal(
    (tab |>
       fmt_url(columns = a, as_button = TRUE, button_fill = "auto", color = "black") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #ADD8E6;padding: 8px 12px;outline-style: none; outline-color: #BEBEBE; outline-width: 2px;\">http://www.example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #ADD8E6;padding: 8px 12px;outline-style: none; outline-color: #BEBEBE; outline-width: 2px;\">https://developer.mozilla.org/en-US/docs/Learn/</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #ADD8E6;padding: 8px 12px;outline-style: none; outline-color: #BEBEBE; outline-width: 2px;\">https://developer.mozilla.org/en-US/search?q=URL</a></span>",
      NA
    )
  )

  expect_equal(
    (tab |>
       fmt_url(columns = a, as_button = TRUE, button_fill = "auto", color = "#FFFADF") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#FFFADF;text-decoration:none;display: inline-block;background-color: #00008B;padding: 8px 12px;outline-style: none; outline-color: #BEBEBE; outline-width: 2px;\">http://www.example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#FFFADF;text-decoration:none;display: inline-block;background-color: #00008B;padding: 8px 12px;outline-style: none; outline-color: #BEBEBE; outline-width: 2px;\">https://developer.mozilla.org/en-US/docs/Learn/</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#FFFADF;text-decoration:none;display: inline-block;background-color: #00008B;padding: 8px 12px;outline-style: none; outline-color: #BEBEBE; outline-width: 2px;\">https://developer.mozilla.org/en-US/search?q=URL</a></span>",
      NA
    )
  )

  expect_equal(
    (tab |>
       fmt_url(columns = a, as_button = TRUE, button_fill = "auto", color = "#FFFADF", button_outline = "pink") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#FFFADF;text-decoration:none;display: inline-block;background-color: #00008B;padding: 8px 12px;outline-style: solid; outline-color: pink; outline-width: 2px;\">http://www.example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#FFFADF;text-decoration:none;display: inline-block;background-color: #00008B;padding: 8px 12px;outline-style: solid; outline-color: pink; outline-width: 2px;\">https://developer.mozilla.org/en-US/docs/Learn/</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#FFFADF;text-decoration:none;display: inline-block;background-color: #00008B;padding: 8px 12px;outline-style: solid; outline-color: pink; outline-width: 2px;\">https://developer.mozilla.org/en-US/search?q=URL</a></span>",
      NA
    )
  )

  expect_equal(
    (tab |>
       fmt_url(columns = a, as_button = TRUE, button_fill = "#FFFFFF", button_outline = "auto") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #FFFFFF;padding: 8px 12px;outline-style: solid; outline-color: #DFDFDF; outline-width: 2px;\">http://www.example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #FFFFFF;padding: 8px 12px;outline-style: solid; outline-color: #DFDFDF; outline-width: 2px;\">https://developer.mozilla.org/en-US/docs/Learn/</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #FFFFFF;padding: 8px 12px;outline-style: solid; outline-color: #DFDFDF; outline-width: 2px;\">https://developer.mozilla.org/en-US/search?q=URL</a></span>",
      NA
    )
  )

  expect_equal(
    (tab |>
       fmt_url(columns = a, as_button = TRUE, button_fill = "#FAD5EF", button_outline = "auto") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #FAD5EF;padding: 8px 12px;outline-style: none; outline-color: #DFDFDF; outline-width: 2px;\">http://www.example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #FAD5EF;padding: 8px 12px;outline-style: none; outline-color: #DFDFDF; outline-width: 2px;\">https://developer.mozilla.org/en-US/docs/Learn/</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #FAD5EF;padding: 8px 12px;outline-style: none; outline-color: #DFDFDF; outline-width: 2px;\">https://developer.mozilla.org/en-US/search?q=URL</a></span>",
      NA
    )
  )

  # Create another input data frame with Markdown-formatted links
  data_tbl_alt <-
    data.frame(
      a = c(
        "[Example Site](http://www.example.com)",
        "[Learn at Mozilla](https://developer.mozilla.org/en-US/docs/Learn/)",
        "[Search Mozilla](https://developer.mozilla.org/en-US/search?q=URL)"
      ),
      stringsAsFactors = FALSE
    )

  # Create a `gt_tbl` object with `gt()` and the `data_tbl_alt` dataset
  tab_alt <- gt(data = data_tbl_alt)

  # Format the `a` column to have links
  expect_equal(
    (tab_alt |>
       fmt_url(columns = a) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">Example Site</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">Learn at Mozilla</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">Search Mozilla</a></span>"
    )
  )

  expect_equal(
    (tab_alt |>
       fmt_url(columns = a, label = "static label") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"[Example Site](http://www.example.com)\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">static label</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"[Learn at Mozilla](https://developer.mozilla.org/en-US/docs/Learn/)\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">static label</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"[Search Mozilla](https://developer.mozilla.org/en-US/search?q=URL)\" target=\"_blank\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">static label</a></span>"
    )
  )

  expect_equal(
    (tab_alt |>
       fmt_url(columns = a, as_button = TRUE) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">Example Site</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">Learn at Mozilla</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">Search Mozilla</a></span>"
    )
  )

  expect_equal(
    (tab_alt |>
       fmt_url(columns = a, color = "forestgreen") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#228B22;text-decoration:underline;text-underline-position: under;display: inline-block;\">Example Site</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#228B22;text-decoration:underline;text-underline-position: under;display: inline-block;\">Learn at Mozilla</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#228B22;text-decoration:underline;text-underline-position: under;display: inline-block;\">Search Mozilla</a></span>"
    )
  )

  expect_equal(
    (tab_alt |>
       fmt_url(columns = a, show_underline = FALSE) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#008B8B;text-decoration:none;display: inline-block;\">Example Site</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#008B8B;text-decoration:none;display: inline-block;\">Learn at Mozilla</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#008B8B;text-decoration:none;display: inline-block;\">Search Mozilla</a></span>"
    )
  )

  expect_equal(
    (tab_alt |>
       fmt_url(columns = a, as_button = TRUE, show_underline = TRUE) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#FFFFFF;text-decoration:underline;text-underline-position: under;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">Example Site</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#FFFFFF;text-decoration:underline;text-underline-position: under;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">Learn at Mozilla</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#FFFFFF;text-decoration:underline;text-underline-position: under;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">Search Mozilla</a></span>"
    )
  )

  expect_equal(
    (tab_alt |>
       fmt_url(columns = a, as_button = TRUE, button_fill = "red") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #FF0000;padding: 8px 12px;outline-style: none; outline-color: #DFDFDF; outline-width: 2px;\">Example Site</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #FF0000;padding: 8px 12px;outline-style: none; outline-color: #DFDFDF; outline-width: 2px;\">Learn at Mozilla</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #FF0000;padding: 8px 12px;outline-style: none; outline-color: #DFDFDF; outline-width: 2px;\">Search Mozilla</a></span>"
    )
  )

  expect_equal(
    (tab_alt |>
       fmt_url(columns = a, as_button = TRUE, button_fill = "red", color = "black") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">Example Site</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">Learn at Mozilla</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">Search Mozilla</a></span>"
    )
  )

  expect_equal(
    (tab_alt |>
       fmt_url(columns = a, as_button = TRUE, button_fill = "red", color = "black", button_width = px(500)) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 500px; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">Example Site</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 500px; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">Learn at Mozilla</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 500px; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">Search Mozilla</a></span>"
    )
  )

  expect_equal(
    (tab_alt |>
       fmt_url(columns = a, as_button = TRUE, button_fill = "red", color = "black", button_width = pct(80)) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 80%; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">Example Site</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 80%; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">Learn at Mozilla</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 80%; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">Search Mozilla</a></span>"
    )
  )

  expect_equal(
    (tab_alt |>
       fmt_url(columns = a, hreflang = "en-GB", target = "_blank", rel = "external", referrerpolicy = "no-referrer") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"http://www.example.com\" target=\"_blank\" rel=\"external\" referrerpolicy=\"no-referrer\" hreflang=\"en-GB\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">Example Site</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/docs/Learn/\" target=\"_blank\" rel=\"external\" referrerpolicy=\"no-referrer\" hreflang=\"en-GB\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">Learn at Mozilla</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"https://developer.mozilla.org/en-US/search?q=URL\" target=\"_blank\" rel=\"external\" referrerpolicy=\"no-referrer\" hreflang=\"en-GB\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">Search Mozilla</a></span>"
    )
  )

  # Expect that a column with NAs will work fine with `fmt_url()`,
  # it'll just produce NA values
  na_col_tbl <- dplyr::tibble(a = rep(NA_real_, 10), b = 1:10) |> gt()

  # Expect a returned object of class `gt_tbl` with various
  # uses of `fmt_url()`
  expect_no_error(
    na_col_tbl |> fmt_url(columns = a) |> as_raw_html()
  )

  expect_no_error(
    na_col_tbl |>
      fmt_url(columns = a, rows = 1:5) |> as_raw_html()
  )
})
