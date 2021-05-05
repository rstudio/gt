test_that("page numbering directives can be added to RTF documents", {

  local_edition(3)

  # Create a one-row table for these tests
  exibble_min <- exibble[1, ]

  # Expect for there to be no directives for page numbering by default
  exibble_min %>%
    gt() %>%
    as_rtf() %>%
    expect_snapshot()

  # Expect for there to be page numbering code for the footer by default
  exibble_min %>%
    gt() %>%
    as_rtf(page_numbering.active = TRUE) %>%
    expect_snapshot()

  # Expect for there to be page numbering code for the header
  exibble_min %>%
    gt() %>%
    as_rtf(page_numbering.active = TRUE, page_numbering.location = "header") %>%
    expect_snapshot()
})
