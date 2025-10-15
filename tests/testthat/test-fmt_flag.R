test_that("fmt_flag() works correctly", {

  # Create an input data frame with a single column of 2-letter country code
  data_tbl <-
    data.frame(
      a = c("DE", "de,at", "BE", "US,do", NA),
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
  expect_error(tab |> fmt_flag(columns = b))

  # Format the `a` column to have flag icons
  expect_equal(
    (tab |>
       fmt_flag(columns = a) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space:nowrap;\"><svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" role=\"img\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" style=\"vertical-align:-0.125em;image-rendering:optimizeQuality;height:1em;width:1em;\"><title>Germany</title><mask id=\"a\"><circle cx=\"256\" cy=\"256\" r=\"256\" fill=\"#fff\"/></mask><g mask=\"url(#a)\"><path fill=\"#ffda44\" d=\"m0 345 256.7-25.5L512 345v167H0z\"/><path fill=\"#d80027\" d=\"m0 167 255-23 257 23v178H0z\"/><path fill=\"#333\" d=\"M0 0h512v167H0z\"/></g></svg></span>",
      "<span style=\"white-space:nowrap;\"><svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" role=\"img\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" style=\"vertical-align:-0.125em;image-rendering:optimizeQuality;height:1em;width:1em;\"><title>Germany</title><mask id=\"a\"><circle cx=\"256\" cy=\"256\" r=\"256\" fill=\"#fff\"/></mask><g mask=\"url(#a)\"><path fill=\"#ffda44\" d=\"m0 345 256.7-25.5L512 345v167H0z\"/><path fill=\"#d80027\" d=\"m0 167 255-23 257 23v178H0z\"/><path fill=\"#333\" d=\"M0 0h512v167H0z\"/></g></svg> <svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" role=\"img\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" style=\"vertical-align:-0.125em;image-rendering:optimizeQuality;height:1em;width:1em;\"><title>Austria</title><mask id=\"a\"><circle cx=\"256\" cy=\"256\" r=\"256\" fill=\"#fff\"/></mask><g mask=\"url(#a)\"><path fill=\"#d80027\" d=\"M0 0h512v167l-23.2 89.7L512 345v167H0V345l29.4-89L0 167z\"/><path fill=\"#eee\" d=\"M0 167h512v178H0z\"/></g></svg></span>",
      "<span style=\"white-space:nowrap;\"><svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" role=\"img\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" style=\"vertical-align:-0.125em;image-rendering:optimizeQuality;height:1em;width:1em;\"><title>Belgium</title><mask id=\"a\"><circle cx=\"256\" cy=\"256\" r=\"256\" fill=\"#fff\"/></mask><g mask=\"url(#a)\"><path fill=\"#333\" d=\"M0 0h167l38.2 252.6L167 512H0z\"/><path fill=\"#d80027\" d=\"M345 0h167v512H345l-36.7-256z\"/><path fill=\"#ffda44\" d=\"M167 0h178v512H167z\"/></g></svg></span>",
      "<span style=\"white-space:nowrap;\"><svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" role=\"img\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" style=\"vertical-align:-0.125em;image-rendering:optimizeQuality;height:1em;width:1em;\"><title>United States</title><mask id=\"a\"><circle cx=\"256\" cy=\"256\" r=\"256\" fill=\"#fff\"/></mask><g mask=\"url(#a)\"><path fill=\"#eee\" d=\"M256 0h256v64l-32 32 32 32v64l-32 32 32 32v64l-32 32 32 32v64l-256 32L0 448v-64l32-32-32-32v-64z\"/><path fill=\"#d80027\" d=\"M224 64h288v64H224Zm0 128h288v64H256ZM0 320h512v64H0Zm0 128h512v64H0Z\"/><path fill=\"#0052b4\" d=\"M0 0h256v256H0Z\"/><path fill=\"#eee\" d=\"m187 243 57-41h-70l57 41-22-67zm-81 0 57-41H93l57 41-22-67zm-81 0 57-41H12l57 41-22-67zm162-81 57-41h-70l57 41-22-67zm-81 0 57-41H93l57 41-22-67zm-81 0 57-41H12l57 41-22-67Zm162-82 57-41h-70l57 41-22-67Zm-81 0 57-41H93l57 41-22-67zm-81 0 57-41H12l57 41-22-67Z\"/></g></svg> <svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" role=\"img\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" style=\"vertical-align:-0.125em;image-rendering:optimizeQuality;height:1em;width:1em;\"><title>Dominican Republic</title><mask id=\"a\"><circle cx=\"256\" cy=\"256\" r=\"256\" fill=\"#fff\"/></mask><g mask=\"url(#a)\"><path fill=\"#d80027\" d=\"M35.5 256h444l32.5-66.8V0H322.8L256 31.8v444.6L189.2 512H0V322.8z\"/><path fill=\"#0052b4\" d=\"M479.5 256h-444L0 189.2V0h189.2L256 31.8v444.6l66.8 35.6H512V322.8z\"/><path fill=\"#eee\" d=\"M189.2 0h133.6v189.2H512v133.6H322.8V512H189.2V322.8H0V189.2h189.2z\"/><path fill=\"#496e2d\" d=\"M322.8 256a66.8 66.8 0 1 1-133.6 0c0-36.9 66.8-66.8 66.8-66.8s66.8 30 66.8 66.8z\"/><path fill=\"#0052b4\" d=\"M189.2 256a66.8 66.8 0 1 1 133.6 0\"/><path fill=\"#d80027\" d=\"M218.4 222.6v41.7a37.6 37.6 0 1 0 75.2 0v-41.7z\"/></g></svg></span>",
      NA
    )
  )
  expect_equal(
    (tab |>
       fmt_flag(columns = a, height = "2em") |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space:nowrap;\"><svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" role=\"img\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" style=\"vertical-align:-0.125em;image-rendering:optimizeQuality;height:2em;width:2em;\"><title>Germany</title><mask id=\"a\"><circle cx=\"256\" cy=\"256\" r=\"256\" fill=\"#fff\"/></mask><g mask=\"url(#a)\"><path fill=\"#ffda44\" d=\"m0 345 256.7-25.5L512 345v167H0z\"/><path fill=\"#d80027\" d=\"m0 167 255-23 257 23v178H0z\"/><path fill=\"#333\" d=\"M0 0h512v167H0z\"/></g></svg></span>",
      "<span style=\"white-space:nowrap;\"><svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" role=\"img\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" style=\"vertical-align:-0.125em;image-rendering:optimizeQuality;height:2em;width:2em;\"><title>Germany</title><mask id=\"a\"><circle cx=\"256\" cy=\"256\" r=\"256\" fill=\"#fff\"/></mask><g mask=\"url(#a)\"><path fill=\"#ffda44\" d=\"m0 345 256.7-25.5L512 345v167H0z\"/><path fill=\"#d80027\" d=\"m0 167 255-23 257 23v178H0z\"/><path fill=\"#333\" d=\"M0 0h512v167H0z\"/></g></svg> <svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" role=\"img\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" style=\"vertical-align:-0.125em;image-rendering:optimizeQuality;height:2em;width:2em;\"><title>Austria</title><mask id=\"a\"><circle cx=\"256\" cy=\"256\" r=\"256\" fill=\"#fff\"/></mask><g mask=\"url(#a)\"><path fill=\"#d80027\" d=\"M0 0h512v167l-23.2 89.7L512 345v167H0V345l29.4-89L0 167z\"/><path fill=\"#eee\" d=\"M0 167h512v178H0z\"/></g></svg></span>",
      "<span style=\"white-space:nowrap;\"><svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" role=\"img\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" style=\"vertical-align:-0.125em;image-rendering:optimizeQuality;height:2em;width:2em;\"><title>Belgium</title><mask id=\"a\"><circle cx=\"256\" cy=\"256\" r=\"256\" fill=\"#fff\"/></mask><g mask=\"url(#a)\"><path fill=\"#333\" d=\"M0 0h167l38.2 252.6L167 512H0z\"/><path fill=\"#d80027\" d=\"M345 0h167v512H345l-36.7-256z\"/><path fill=\"#ffda44\" d=\"M167 0h178v512H167z\"/></g></svg></span>",
      "<span style=\"white-space:nowrap;\"><svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" role=\"img\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" style=\"vertical-align:-0.125em;image-rendering:optimizeQuality;height:2em;width:2em;\"><title>United States</title><mask id=\"a\"><circle cx=\"256\" cy=\"256\" r=\"256\" fill=\"#fff\"/></mask><g mask=\"url(#a)\"><path fill=\"#eee\" d=\"M256 0h256v64l-32 32 32 32v64l-32 32 32 32v64l-32 32 32 32v64l-256 32L0 448v-64l32-32-32-32v-64z\"/><path fill=\"#d80027\" d=\"M224 64h288v64H224Zm0 128h288v64H256ZM0 320h512v64H0Zm0 128h512v64H0Z\"/><path fill=\"#0052b4\" d=\"M0 0h256v256H0Z\"/><path fill=\"#eee\" d=\"m187 243 57-41h-70l57 41-22-67zm-81 0 57-41H93l57 41-22-67zm-81 0 57-41H12l57 41-22-67zm162-81 57-41h-70l57 41-22-67zm-81 0 57-41H93l57 41-22-67zm-81 0 57-41H12l57 41-22-67Zm162-82 57-41h-70l57 41-22-67Zm-81 0 57-41H93l57 41-22-67zm-81 0 57-41H12l57 41-22-67Z\"/></g></svg> <svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" role=\"img\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" style=\"vertical-align:-0.125em;image-rendering:optimizeQuality;height:2em;width:2em;\"><title>Dominican Republic</title><mask id=\"a\"><circle cx=\"256\" cy=\"256\" r=\"256\" fill=\"#fff\"/></mask><g mask=\"url(#a)\"><path fill=\"#d80027\" d=\"M35.5 256h444l32.5-66.8V0H322.8L256 31.8v444.6L189.2 512H0V322.8z\"/><path fill=\"#0052b4\" d=\"M479.5 256h-444L0 189.2V0h189.2L256 31.8v444.6l66.8 35.6H512V322.8z\"/><path fill=\"#eee\" d=\"M189.2 0h133.6v189.2H512v133.6H322.8V512H189.2V322.8H0V189.2h189.2z\"/><path fill=\"#496e2d\" d=\"M322.8 256a66.8 66.8 0 1 1-133.6 0c0-36.9 66.8-66.8 66.8-66.8s66.8 30 66.8 66.8z\"/><path fill=\"#0052b4\" d=\"M189.2 256a66.8 66.8 0 1 1 133.6 0\"/><path fill=\"#d80027\" d=\"M218.4 222.6v41.7a37.6 37.6 0 1 0 75.2 0v-41.7z\"/></g></svg></span>",
      NA
    )
  )
  expect_equal(
    (tab |>
       fmt_flag(columns = a, height = 40) |>
       render_formats_test(context = "html"))[["a"]],
    c(
      "<span style=\"white-space:nowrap;\"><svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" role=\"img\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" style=\"vertical-align:-0.125em;image-rendering:optimizeQuality;height:40px;width:40px;\"><title>Germany</title><mask id=\"a\"><circle cx=\"256\" cy=\"256\" r=\"256\" fill=\"#fff\"/></mask><g mask=\"url(#a)\"><path fill=\"#ffda44\" d=\"m0 345 256.7-25.5L512 345v167H0z\"/><path fill=\"#d80027\" d=\"m0 167 255-23 257 23v178H0z\"/><path fill=\"#333\" d=\"M0 0h512v167H0z\"/></g></svg></span>",
      "<span style=\"white-space:nowrap;\"><svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" role=\"img\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" style=\"vertical-align:-0.125em;image-rendering:optimizeQuality;height:40px;width:40px;\"><title>Germany</title><mask id=\"a\"><circle cx=\"256\" cy=\"256\" r=\"256\" fill=\"#fff\"/></mask><g mask=\"url(#a)\"><path fill=\"#ffda44\" d=\"m0 345 256.7-25.5L512 345v167H0z\"/><path fill=\"#d80027\" d=\"m0 167 255-23 257 23v178H0z\"/><path fill=\"#333\" d=\"M0 0h512v167H0z\"/></g></svg> <svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" role=\"img\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" style=\"vertical-align:-0.125em;image-rendering:optimizeQuality;height:40px;width:40px;\"><title>Austria</title><mask id=\"a\"><circle cx=\"256\" cy=\"256\" r=\"256\" fill=\"#fff\"/></mask><g mask=\"url(#a)\"><path fill=\"#d80027\" d=\"M0 0h512v167l-23.2 89.7L512 345v167H0V345l29.4-89L0 167z\"/><path fill=\"#eee\" d=\"M0 167h512v178H0z\"/></g></svg></span>",
      "<span style=\"white-space:nowrap;\"><svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" role=\"img\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" style=\"vertical-align:-0.125em;image-rendering:optimizeQuality;height:40px;width:40px;\"><title>Belgium</title><mask id=\"a\"><circle cx=\"256\" cy=\"256\" r=\"256\" fill=\"#fff\"/></mask><g mask=\"url(#a)\"><path fill=\"#333\" d=\"M0 0h167l38.2 252.6L167 512H0z\"/><path fill=\"#d80027\" d=\"M345 0h167v512H345l-36.7-256z\"/><path fill=\"#ffda44\" d=\"M167 0h178v512H167z\"/></g></svg></span>",
      "<span style=\"white-space:nowrap;\"><svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" role=\"img\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" style=\"vertical-align:-0.125em;image-rendering:optimizeQuality;height:40px;width:40px;\"><title>United States</title><mask id=\"a\"><circle cx=\"256\" cy=\"256\" r=\"256\" fill=\"#fff\"/></mask><g mask=\"url(#a)\"><path fill=\"#eee\" d=\"M256 0h256v64l-32 32 32 32v64l-32 32 32 32v64l-32 32 32 32v64l-256 32L0 448v-64l32-32-32-32v-64z\"/><path fill=\"#d80027\" d=\"M224 64h288v64H224Zm0 128h288v64H256ZM0 320h512v64H0Zm0 128h512v64H0Z\"/><path fill=\"#0052b4\" d=\"M0 0h256v256H0Z\"/><path fill=\"#eee\" d=\"m187 243 57-41h-70l57 41-22-67zm-81 0 57-41H93l57 41-22-67zm-81 0 57-41H12l57 41-22-67zm162-81 57-41h-70l57 41-22-67zm-81 0 57-41H93l57 41-22-67zm-81 0 57-41H12l57 41-22-67Zm162-82 57-41h-70l57 41-22-67Zm-81 0 57-41H93l57 41-22-67zm-81 0 57-41H12l57 41-22-67Z\"/></g></svg> <svg xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\" role=\"img\" width=\"512\" height=\"512\" viewBox=\"0 0 512 512\" style=\"vertical-align:-0.125em;image-rendering:optimizeQuality;height:40px;width:40px;\"><title>Dominican Republic</title><mask id=\"a\"><circle cx=\"256\" cy=\"256\" r=\"256\" fill=\"#fff\"/></mask><g mask=\"url(#a)\"><path fill=\"#d80027\" d=\"M35.5 256h444l32.5-66.8V0H322.8L256 31.8v444.6L189.2 512H0V322.8z\"/><path fill=\"#0052b4\" d=\"M479.5 256h-444L0 189.2V0h189.2L256 31.8v444.6l66.8 35.6H512V322.8z\"/><path fill=\"#eee\" d=\"M189.2 0h133.6v189.2H512v133.6H322.8V512H189.2V322.8H0V189.2h189.2z\"/><path fill=\"#496e2d\" d=\"M322.8 256a66.8 66.8 0 1 1-133.6 0c0-36.9 66.8-66.8 66.8-66.8s66.8 30 66.8 66.8z\"/><path fill=\"#0052b4\" d=\"M189.2 256a66.8 66.8 0 1 1 133.6 0\"/><path fill=\"#d80027\" d=\"M218.4 222.6v41.7a37.6 37.6 0 1 0 75.2 0v-41.7z\"/></g></svg></span>",
      NA
    )
  )

  # Expect that a column with NAs will work fine with `fmt_flag()`,
  # it'll just produce NA values
  na_col_tbl <- dplyr::tibble(a = rep(NA_real_, 10), b = 1:10) |> gt()

  # Expect a returned object of class `gt_tbl` with various
  # uses of `fmt_flag()`
  expect_no_error(
    na_col_tbl |> fmt_flag(columns = a) |> as_raw_html()
  )
  expect_no_error(
    na_col_tbl |>
      fmt_flag(columns = a, rows = 1:5) |> as_raw_html()
  )
})
