test_that("fmt_email() works correctly", {

  # Create an input data frame with email addresses
  data_tbl <-
    data.frame(
      a = c(
        "example@example.com",
        "example_1@example.com,example_2@example_com",
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
  expect_error(tab |> fmt_email(columns = b))

  # Format the `a` column to have 'mailto:' emails
  expect_equal(
    (tab |>
       fmt_email(columns = a) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab |>
       fmt_email(columns = a, display_name = "static label") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">static label</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">static label</a></span>",
      NA
    )
  )
  expect_equal(
    (tab |>
       fmt_email(columns = a, as_button = TRUE) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab |>
       fmt_email(columns = a, color = "forestgreen") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#228B22;text-decoration:underline;text-underline-position: under;display: inline-block;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#228B22;text-decoration:underline;text-underline-position: under;display: inline-block;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab |>
       fmt_email(columns = a, show_underline = FALSE) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:none;display: inline-block;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:none;display: inline-block;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab |>
       fmt_email(columns = a, as_button = TRUE, show_underline = TRUE) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFFFF;text-decoration:underline;text-underline-position: under;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFFFF;text-decoration:underline;text-underline-position: under;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab |>
       fmt_email(columns = a, as_button = TRUE, button_fill = "red") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #FF0000;padding: 8px 12px;outline-style: none; outline-color: #DFDFDF; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #FF0000;padding: 8px 12px;outline-style: none; outline-color: #DFDFDF; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab |>
       fmt_email(columns = a, as_button = TRUE, button_fill = "red", color = "black") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab |>
       fmt_email(columns = a, as_button = TRUE, button_fill = "red", color = "black", button_width = px(500)) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 500px; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 500px; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab |>
       fmt_email(columns = a, as_button = TRUE, button_fill = "red", color = "black", button_width = pct(80)) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 80%; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 80%; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab |>
       fmt_email(columns = a, as_button = TRUE, button_fill = "auto", color = "black") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #ADD8E6;padding: 8px 12px;outline-style: none; outline-color: #BEBEBE; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #ADD8E6;padding: 8px 12px;outline-style: none; outline-color: #BEBEBE; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab |>
       fmt_email(columns = a, as_button = TRUE, button_fill = "auto", color = "#FFFADF") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFADF;text-decoration:none;display: inline-block;background-color: #00008B;padding: 8px 12px;outline-style: none; outline-color: #BEBEBE; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFADF;text-decoration:none;display: inline-block;background-color: #00008B;padding: 8px 12px;outline-style: none; outline-color: #BEBEBE; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab |>
       fmt_email(columns = a, as_button = TRUE, button_fill = "auto", color = "#FFFADF", button_outline = "pink") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFADF;text-decoration:none;display: inline-block;background-color: #00008B;padding: 8px 12px;outline-style: solid; outline-color: pink; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFADF;text-decoration:none;display: inline-block;background-color: #00008B;padding: 8px 12px;outline-style: solid; outline-color: pink; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab |>
       fmt_email(columns = a, as_button = TRUE, button_fill = "#FFFFFF", button_outline = "auto") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #FFFFFF;padding: 8px 12px;outline-style: solid; outline-color: #DFDFDF; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #FFFFFF;padding: 8px 12px;outline-style: solid; outline-color: #DFDFDF; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab |>
       fmt_email(columns = a, as_button = TRUE, button_fill = "#FAD5EF", button_outline = "auto") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #FAD5EF;padding: 8px 12px;outline-style: none; outline-color: #DFDFDF; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #FAD5EF;padding: 8px 12px;outline-style: none; outline-color: #DFDFDF; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )


  # Create an alternate data frame with email addresses and labels
  data_tbl <-
    data.frame(
      a = c(
        "example@example.com",
        "example_1@example.com,example_2@example_com",
        "example_3_solo@example.com example_4_solo@example_com",
        NA
      ),
      label = c(
        "Example 1",
        "Example Group",
        "<Three-Solo> <Four-Solo>",
        "missing"
      ),
      stringsAsFactors = FALSE
    )

  # Create a `gt_tbl` object with `gt()` and the `data_tbl` dataset
  tab <- gt(data = data_tbl)

  # Format the `a` column to have 'mailto:' emails
  expect_equal(
    (tab |>
       fmt_email(columns = a) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">example_1@example.com,example_2@example_com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_3_solo@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">example_3_solo@example.com</a></span> <span style=\"white-space: pre;\"><a href=\"mailto:example_4_solo@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">example_4_solo@example_com</a></span>",
      NA
    )
  )

  # Use a static display name (text)
  expect_equal(
    (tab |>
       fmt_email(columns = a, display_name = "Email") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">Email</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">Email</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_3_solo@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">Email</a></span> <span style=\"white-space: pre;\"><a href=\"mailto:example_4_solo@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">Email</a></span>",
      NA
    )
  )

  # Use a static display name (icon)
  expect_equal(
    (tab |>
       fmt_email(columns = a, display_name = fontawesome::fa("envelope"), color = "orange") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFA500;text-decoration:underline;text-underline-position: under;display: inline-block;\"><svg aria-hidden=\"true\" role=\"img\" viewBox=\"0 0 512 512\" style=\"height:1em;width:1em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:currentColor;overflow:visible;position:relative;\"><path d=\"M64 112c-8.8 0-16 7.2-16 16v22.1L220.5 291.7c20.7 17 50.4 17 71.1 0L464 150.1V128c0-8.8-7.2-16-16-16H64zM48 212.2V384c0 8.8 7.2 16 16 16H448c8.8 0 16-7.2 16-16V212.2L322 328.8c-38.4 31.5-93.7 31.5-132 0L48 212.2zM0 128C0 92.7 28.7 64 64 64H448c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128z\"/></svg></a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFA500;text-decoration:underline;text-underline-position: under;display: inline-block;\"><svg aria-hidden=\"true\" role=\"img\" viewBox=\"0 0 512 512\" style=\"height:1em;width:1em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:currentColor;overflow:visible;position:relative;\"><path d=\"M64 112c-8.8 0-16 7.2-16 16v22.1L220.5 291.7c20.7 17 50.4 17 71.1 0L464 150.1V128c0-8.8-7.2-16-16-16H64zM48 212.2V384c0 8.8 7.2 16 16 16H448c8.8 0 16-7.2 16-16V212.2L322 328.8c-38.4 31.5-93.7 31.5-132 0L48 212.2zM0 128C0 92.7 28.7 64 64 64H448c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128z\"/></svg></a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_3_solo@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFA500;text-decoration:underline;text-underline-position: under;display: inline-block;\"><svg aria-hidden=\"true\" role=\"img\" viewBox=\"0 0 512 512\" style=\"height:1em;width:1em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:currentColor;overflow:visible;position:relative;\"><path d=\"M64 112c-8.8 0-16 7.2-16 16v22.1L220.5 291.7c20.7 17 50.4 17 71.1 0L464 150.1V128c0-8.8-7.2-16-16-16H64zM48 212.2V384c0 8.8 7.2 16 16 16H448c8.8 0 16-7.2 16-16V212.2L322 328.8c-38.4 31.5-93.7 31.5-132 0L48 212.2zM0 128C0 92.7 28.7 64 64 64H448c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128z\"/></svg></a></span> <span style=\"white-space: pre;\"><a href=\"mailto:example_4_solo@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFA500;text-decoration:underline;text-underline-position: under;display: inline-block;\"><svg aria-hidden=\"true\" role=\"img\" viewBox=\"0 0 512 512\" style=\"height:1em;width:1em;vertical-align:-0.125em;margin-left:auto;margin-right:auto;font-size:inherit;fill:currentColor;overflow:visible;position:relative;\"><path d=\"M64 112c-8.8 0-16 7.2-16 16v22.1L220.5 291.7c20.7 17 50.4 17 71.1 0L464 150.1V128c0-8.8-7.2-16-16-16H64zM48 212.2V384c0 8.8 7.2 16 16 16H448c8.8 0 16-7.2 16-16V212.2L322 328.8c-38.4 31.5-93.7 31.5-132 0L48 212.2zM0 128C0 92.7 28.7 64 64 64H448c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128z\"/></svg></a></span>",
      NA
    )
  )

  # Use display names from an adjacent column
  expect_equal(
    (tab |>
       fmt_email(columns = a, display_name = from_column(column = "label")) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">Example 1</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">Example Group</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_3_solo@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">Three-Solo</a></span> <span style=\"white-space: pre;\"><a href=\"mailto:example_4_solo@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">Four-Solo</a></span>",
      NA
    )
  )

  # Expect that a column with NAs will work fine with `fmt_email()`,
  # it'll just produce NA values
  na_col_tbl <- dplyr::tibble(a = rep(NA_real_, 10), b = 1:10) |> gt()

  # Expect a returned object of class `gt_tbl` with various
  # uses of `fmt_email()`
  expect_no_error(
    na_col_tbl |> fmt_email(columns = a) |> as_raw_html()
  )
  expect_no_error(
    na_col_tbl |>
      fmt_email(columns = a, rows = 1:5) |> as_raw_html()
  )
})
