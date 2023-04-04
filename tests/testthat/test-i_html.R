test_that("HTML tables have a specific class", {

  tbl_gt_i <-
    exibble %>%
    gt() %>%
    opt_interactive()

  capture_output(expect_s3_class(testthat::testthat_print(tbl_gt_i), "shiny.tag"))
  capture_output(expect_error(tbl_gt_i, regexp = NA))

  tbl_gt <-
    exibble %>%
    gt()

  capture_output(expect_s3_class(testthat::testthat_print(tbl_gt), "shiny.tag"))
  capture_output(expect_error(tbl_gt, regexp = NA))

  tbl_gt_not_interactive <-
    exibble %>%
    gt() %>%
    opt_interactive(active = FALSE)

  capture_output(expect_s3_class(testthat::testthat_print(tbl_gt_not_interactive), "shiny.tag"))
  capture_output(expect_error(tbl_gt_not_interactive, regexp = NA))

})

test_that("Interactive tables won't fail when using different options", {

  tbl_gt_i_01 <- gt(exibble) %>% opt_interactive(use_pagination = FALSE)
  tbl_gt_i_02 <- gt(exibble) %>% opt_interactive(use_pagination_info = FALSE)
  tbl_gt_i_03 <- gt(exibble) %>% opt_interactive(use_sorting = FALSE)
  tbl_gt_i_04 <- gt(exibble) %>% opt_interactive(use_search = TRUE)
  tbl_gt_i_05 <- gt(exibble) %>% opt_interactive(use_filters = TRUE)
  tbl_gt_i_06 <- gt(exibble) %>% opt_interactive(use_resizers = TRUE)
  tbl_gt_i_07 <- gt(exibble) %>% opt_interactive(use_highlight = TRUE)
  tbl_gt_i_08 <- gt(exibble) %>% opt_interactive(use_compact_mode = TRUE)
  tbl_gt_i_09 <- gt(exibble) %>% opt_interactive(use_text_wrapping = FALSE)
  tbl_gt_i_10 <- gt(exibble) %>% opt_interactive(use_page_size_select = TRUE)
  tbl_gt_i_11 <- gt(exibble) %>% opt_interactive(page_size_default = 20)
  tbl_gt_i_12 <- gt(exibble) %>% opt_interactive(page_size_values = c(5, 15, 30))
  tbl_gt_i_13 <- gt(exibble) %>% opt_interactive(pagination_type = "jump")
  tbl_gt_i_14 <- gt(exibble) %>% opt_interactive(pagination_type = "simple")
  tbl_gt_i_15 <- gt(exibble, locale = "de") %>% opt_interactive()
  tbl_gt_i_16 <- gt(exibble) %>% cols_width(everything() ~ px(200)) %>% opt_interactive()
  tbl_gt_i_17 <-
    gt(exibble) %>%
    tab_style(style = cell_fill(), locations = cells_body()) %>%
    opt_interactive()
  tbl_gt_i_18 <-
    gt(exibble) %>%
    tab_header(title = "Title") %>%
    opt_interactive()
  tbl_gt_i_19 <-
    gt(exibble) %>%
    tab_header(title = "Title", subtitle = "Subtitle") %>%
    opt_interactive()
  tbl_gt_i_20 <-
    gt(exibble) %>%
    tab_source_note(source_note = "Source Note.") %>%
    opt_interactive()
  tbl_gt_i_21 <-
    gt(exibble) %>%
    tab_footnote(footnote = "Footnote.") %>%
    opt_interactive()
  tbl_gt_i_22 <-
    gt(exibble) %>%
    tab_source_note(source_note = "Source Note.") %>%
    tab_footnote(footnote = "Footnote.") %>%
    opt_interactive()

  capture_output(expect_error(tbl_gt_i_01, regexp = NA))
  capture_output(expect_error(tbl_gt_i_02, regexp = NA))
  capture_output(expect_error(tbl_gt_i_03, regexp = NA))
  capture_output(expect_error(tbl_gt_i_04, regexp = NA))
  capture_output(expect_error(tbl_gt_i_05, regexp = NA))
  capture_output(expect_error(tbl_gt_i_06, regexp = NA))
  capture_output(expect_error(tbl_gt_i_07, regexp = NA))
  capture_output(expect_error(tbl_gt_i_08, regexp = NA))
  capture_output(expect_error(tbl_gt_i_09, regexp = NA))
  capture_output(expect_error(tbl_gt_i_10, regexp = NA))
  capture_output(expect_error(tbl_gt_i_11, regexp = NA))
  capture_output(expect_error(tbl_gt_i_12, regexp = NA))
  capture_output(expect_error(tbl_gt_i_13, regexp = NA))
  capture_output(expect_error(tbl_gt_i_14, regexp = NA))
  capture_output(expect_error(tbl_gt_i_15, regexp = NA))
  capture_output(expect_error(tbl_gt_i_16, regexp = NA))
  capture_output(expect_error(tbl_gt_i_17, regexp = NA))
  capture_output(expect_error(tbl_gt_i_18, regexp = NA))
  capture_output(expect_error(tbl_gt_i_19, regexp = NA))
  capture_output(expect_error(tbl_gt_i_20, regexp = NA))
  capture_output(expect_error(tbl_gt_i_21, regexp = NA))
  capture_output(expect_error(tbl_gt_i_22, regexp = NA))
})
