skip_on_os("linux")

test_that("Page options can used for RTF output", {

  # Create a one-row table for these tests
  exibble_min <- exibble[1, 1:4]

  # Create a gt table object with a few table parts like column label
  # spanners, footnotes, and source notes
  tbl_gt <-
    exibble_min %>%
    gt() %>%
    tab_spanner(label = "label", columns = c(char, fctr)) %>%
    tab_source_note(
      source_note = "This is a source note that explains some of the content in the table."
    ) %>%
    tab_footnote(footnote = "The first footnote", locations = cells_body(columns = 1, rows = 1)) %>%
    tab_footnote(footnote = "The second footnote", locations = cells_body(columns = 2, rows = 1))

  #
  # Test RTF snapshots with varying degrees of header content and
  # different page options
  #

  tbl_gt %>% as_rtf() %>% expect_snapshot()

  tbl_gt %>%
    tab_header(
      title = "The Table Title",
      subtitle = "The Table Subtitle"
    ) %>% as_rtf() %>% expect_snapshot()

  tbl_gt %>%
    tab_header(
      title = "The Table Title",
      subtitle = "The Table Subtitle",
      preheader = "Protocol: Number #1"
    ) %>% as_rtf() %>% expect_snapshot()

  tbl_gt %>%
    tab_header(
      title = "The Table Title",
      subtitle = "The Table Subtitle",
      preheader = c("Protocol: Number #1", "Population: Subset #1")
    ) %>% as_rtf() %>% expect_snapshot()

  tbl_gt %>%
    tab_header(
      title = "The Table Title",
      subtitle = "The Table Subtitle",
      preheader = c("Protocol: Number #1", "Population: Subset #1")
    ) %>%
    tab_options(
      page.orientation = "portrait",
      page.numbering = FALSE,
      page.header.use_tbl_headings = TRUE,
      page.footer.use_tbl_notes = TRUE
    ) %>%
    as_rtf() %>% expect_snapshot()

  tbl_gt %>%
    tab_header(
      title = "The Table Title",
      subtitle = "The Table Subtitle",
      preheader = c("Protocol: Number #1", "Population: Subset #1")
    ) %>%
    tab_options(
      page.orientation = "portrait",
      page.numbering = TRUE,
      page.header.use_tbl_headings = TRUE,
      page.footer.use_tbl_notes = TRUE
    ) %>%
    as_rtf() %>% expect_snapshot()

  tbl_gt %>%
    tab_header(
      title = "The Table Title",
      subtitle = "The Table Subtitle",
      preheader = c("Protocol: Number #1", "Population: Subset #1")
    ) %>%
    tab_options(
      page.orientation = "portrait",
      page.numbering = TRUE,
      page.header.use_tbl_headings = FALSE,
      page.footer.use_tbl_notes = FALSE
    ) %>%
    as_rtf() %>% expect_snapshot()

  tbl_gt %>%
    tab_header(
      title = "The Table Title",
      subtitle = "The Table Subtitle"
    ) %>%
    tab_options(
      page.orientation = "portrait",
      page.numbering = TRUE,
      page.header.use_tbl_headings = TRUE,
      page.footer.use_tbl_notes = TRUE
    ) %>%
    as_rtf() %>% expect_snapshot()

  tbl_gt %>%
    tab_header(
      title = "The Table Title",
      subtitle = "The Table Subtitle",
      preheader = c("Protocol: Number #1", "Population: Subset #1")
    ) %>%
    tab_options(
      page.orientation = "landscape",
      page.numbering = FALSE,
      page.header.use_tbl_headings = TRUE,
      page.footer.use_tbl_notes = TRUE
    ) %>%
    as_rtf() %>% expect_snapshot()

  tbl_gt %>%
    tab_header(
      title = "The Table Title",
      subtitle = "The Table Subtitle",
      preheader = c("Protocol: Number #1", "Population: Subset #1")
    ) %>%
    tab_options(
      page.orientation = "landscape",
      page.numbering = TRUE,
      page.header.use_tbl_headings = TRUE,
      page.footer.use_tbl_notes = TRUE
    ) %>%
    as_rtf() %>% expect_snapshot()

  tbl_gt %>%
    tab_header(
      title = "The Table Title",
      subtitle = "The Table Subtitle",
      preheader = c("Protocol: Number #1", "Population: Subset #1")
    ) %>%
    tab_options(
      page.orientation = "landscape",
      page.numbering = TRUE,
      page.header.use_tbl_headings = FALSE,
      page.footer.use_tbl_notes = FALSE
    ) %>%
    as_rtf() %>% expect_snapshot()

  tbl_gt %>%
    tab_header(
      title = "The Table Title",
      subtitle = "The Table Subtitle"
    ) %>%
    tab_options(
      page.orientation = "landscape",
      page.numbering = TRUE,
      page.header.use_tbl_headings = TRUE,
      page.footer.use_tbl_notes = TRUE
    ) %>%
    as_rtf() %>% expect_snapshot()
})
