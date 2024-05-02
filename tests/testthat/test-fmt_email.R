test_that("The `fmt_email()` function works correctly", {

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
  a <- (tab %>% dt_data_get())[["a"]]

  # Expect the extracted values to match those of the original dataset
  expect_equal(data_tbl$a, a)

  # Expect an error when attempting to format a column that does not exist
  expect_error(tab %>% fmt_email(columns = b))

  # Format the `a` column to have 'mailto:' emails
  expect_equal(
    (tab %>%
       fmt_email(columns = a) %>%
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab %>%
       fmt_email(columns = a, label = "static label") %>%
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">static label</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:underline;text-underline-position: under;display: inline-block;\">static label</a></span>",
      NA
    )
  )
  expect_equal(
    (tab %>%
       fmt_email(columns = a, as_button = TRUE) %>%
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab %>%
       fmt_email(columns = a, color = "forestgreen") %>%
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#228B22;text-decoration:underline;text-underline-position: under;display: inline-block;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#228B22;text-decoration:underline;text-underline-position: under;display: inline-block;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab %>%
       fmt_email(columns = a, show_underline = FALSE) %>%
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:none;display: inline-block;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#008B8B;text-decoration:none;display: inline-block;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab %>%
       fmt_email(columns = a, as_button = TRUE, show_underline = TRUE) %>%
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFFFF;text-decoration:underline;text-underline-position: under;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFFFF;text-decoration:underline;text-underline-position: under;display: inline-block;background-color: #4682B4;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab %>%
       fmt_email(columns = a, as_button = TRUE, button_fill = "red") %>%
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #FF0000;padding: 8px 12px;outline-style: none; outline-color: #DFDFDF; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFFFF;text-decoration:none;display: inline-block;background-color: #FF0000;padding: 8px 12px;outline-style: none; outline-color: #DFDFDF; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab %>%
       fmt_email(columns = a, as_button = TRUE, button_fill = "red", color = "black") %>%
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;outline-style: solid; outline-color: auto; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab %>%
       fmt_email(columns = a, as_button = TRUE, button_fill = "red", color = "black", button_width = px(500)) %>%
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 500px; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 500px; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab %>%
       fmt_email(columns = a, as_button = TRUE, button_fill = "red", color = "black", button_width = pct(80)) %>%
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 80%; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: red;padding: 8px 12px;width: 80%; text-align: center;outline-style: solid; outline-color: auto; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab %>%
       fmt_email(columns = a, as_button = TRUE, button_fill = "auto", color = "black") %>%
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #ADD8E6;padding: 8px 12px;outline-style: none; outline-color: #BEBEBE; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #ADD8E6;padding: 8px 12px;outline-style: none; outline-color: #BEBEBE; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab %>%
       fmt_email(columns = a, as_button = TRUE, button_fill = "auto", color = "#FFFADF") %>%
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFADF;text-decoration:none;display: inline-block;background-color: #00008B;padding: 8px 12px;outline-style: none; outline-color: #BEBEBE; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFADF;text-decoration:none;display: inline-block;background-color: #00008B;padding: 8px 12px;outline-style: none; outline-color: #BEBEBE; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab %>%
       fmt_email(columns = a, as_button = TRUE, button_fill = "auto", color = "#FFFADF", button_outline = "pink") %>%
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFADF;text-decoration:none;display: inline-block;background-color: #00008B;padding: 8px 12px;outline-style: solid; outline-color: pink; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#FFFADF;text-decoration:none;display: inline-block;background-color: #00008B;padding: 8px 12px;outline-style: solid; outline-color: pink; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab %>%
       fmt_email(columns = a, as_button = TRUE, button_fill = "#FFFFFF", button_outline = "auto") %>%
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #FFFFFF;padding: 8px 12px;outline-style: solid; outline-color: #DFDFDF; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #FFFFFF;padding: 8px 12px;outline-style: solid; outline-color: #DFDFDF; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )
  expect_equal(
    (tab %>%
       fmt_email(columns = a, as_button = TRUE, button_fill = "#FAD5EF", button_outline = "auto") %>%
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space: pre;\"><a href=\"mailto:example@example.com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #FAD5EF;padding: 8px 12px;outline-style: none; outline-color: #DFDFDF; outline-width: 2px;\">example@example.com</a></span>",
      "<span style=\"white-space: pre;\"><a href=\"mailto:example_1@example.com,example_2@example_com\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"color:#000000;text-decoration:none;display: inline-block;background-color: #FAD5EF;padding: 8px 12px;outline-style: none; outline-color: #DFDFDF; outline-width: 2px;\">example_1@example.com,example_2@example_com</a></span>",
      NA
    )
  )

  # Expect that a column with NAs will work fine with `fmt_email()`,
  # it'll just produce NA values
  na_col_tbl <- dplyr::tibble(a = rep(NA_real_, 10), b = 1:10) %>% gt()

  # Expect a returned object of class `gt_tbl` with various
  # uses of `fmt_email()`
  expect_no_error(
    na_col_tbl %>% fmt_email(columns = a) %>% as_raw_html()
  )
  expect_no_error(
    na_col_tbl %>%
      fmt_email(columns = a, rows = 1:5) %>% as_raw_html()
  )
})
