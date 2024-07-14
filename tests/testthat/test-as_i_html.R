test_that("HTML tables have a specific class", {

  tbl_gt_i <-
    exibble %>%
    gt() %>%
    opt_interactive()

  capture_output(expect_s3_class(testthat::testthat_print(tbl_gt_i), "shiny.tag"))
  capture_output(expect_no_error(tbl_gt_i))

  tbl_gt <-
    exibble %>%
    gt()

  capture_output(expect_s3_class(testthat::testthat_print(tbl_gt), "shiny.tag"))
  capture_output(expect_no_error(tbl_gt))

  tbl_gt_not_interactive <-
    exibble %>%
    gt() %>%
    opt_interactive(active = FALSE)

  capture_output(expect_s3_class(testthat::testthat_print(tbl_gt_not_interactive), "shiny.tag"))
  capture_output(expect_no_error(tbl_gt_not_interactive))

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
  # #1702
  tbl_gt_i_23 <-
    gt(exibble, rownames_to_stub = TRUE) %>%
    opt_interactive()
  tbl_gt_i_24 <-
    gt(mtcars_short, rowname_col = "vs") %>%
    opt_interactive()
  # #1705
  # FIXME the number of rows at the bottom is incorrect.
  tbl_gt_i_25 <-
    gt(mtcars_short, groupname_col = "vs") %>%
    opt_interactive()
  # #1758 tab_stubhead() respected (shown on top of group)
  tbl_gt_i_26 <-
    gt(mtcars_short, groupname_col = "vs", rownames_to_stub = T) %>%
    tab_stubhead("stub label on top of vs") %>%
    opt_interactive()
  # #1758 NA rows show correctly + stubhead shows on top of row
  tbl_gt_i_27 <-
    gt(exibble, rowname_col = "char") %>%
    tab_stubhead("stub label on top of rowname") %>%
    opt_interactive()
  capture_output(expect_no_error(tbl_gt_i_01))
  capture_output(expect_no_error(tbl_gt_i_02))
  capture_output(expect_no_error(tbl_gt_i_03))
  capture_output(expect_no_error(tbl_gt_i_04))
  capture_output(expect_no_error(tbl_gt_i_05))
  capture_output(expect_no_error(tbl_gt_i_06))
  capture_output(expect_no_error(tbl_gt_i_07))
  capture_output(expect_no_error(tbl_gt_i_08))
  capture_output(expect_no_error(tbl_gt_i_09))
  capture_output(expect_no_error(tbl_gt_i_10))
  capture_output(expect_no_error(tbl_gt_i_11))
  capture_output(expect_no_error(tbl_gt_i_12))
  capture_output(expect_no_error(tbl_gt_i_13))
  capture_output(expect_no_error(tbl_gt_i_14))
  capture_output(expect_no_error(tbl_gt_i_15))
  capture_output(expect_no_error(tbl_gt_i_16))
  capture_output(expect_no_error(tbl_gt_i_17))
  capture_output(expect_no_error(tbl_gt_i_18))
  capture_output(expect_no_error(tbl_gt_i_19))
  capture_output(expect_no_error(tbl_gt_i_20))
  capture_output(expect_no_error(tbl_gt_i_21))
  capture_output(expect_no_error(tbl_gt_i_22))
  capture_output(expect_no_error(tbl_gt_i_23))
  capture_output(expect_no_error(tbl_gt_i_24))
  capture_output(expect_no_error(tbl_gt_i_25))
  capture_output(expect_no_error(tbl_gt_i_26))
  capture_output(expect_no_error(tbl_gt_i_27))

})

# tab_spanner + opt_interactive() ----------------------------------------------

# tab_spanner() interactive ----------------------------------------------------
test_that("tab_spanner() is compatible with interactive tables (#1618)", {
  skip_if_not_installed("jsonlite")
  skip_if_not_installed("stringr")

  # returns the json-object of the reactable javascript-part
  reactive_table_to_json <- function(reactable_obj){
    tmp_html_tag <- reactable_obj %>%
      htmltools::as.tags()  %>%
      htmltools::doRenderTags()

    tmp_html_tag2 <- stringr::str_extract(
      tmp_html_tag,
      '<script type="application/json" data-for="[^>]+>(?<found>.+)</script>',
      group = 1
    )
    jsonlite::parse_json(tmp_html_tag2)
  }
  #
  # simple example with 1 spanner, 1 level
  #

  # reactable should have the expected spanners
  interactive_tbl <-
    exibble[, 1:4] %>%
    gt() %>%
    tab_spanner(label = "spanner_datechar", columns = c(date, char)) %>%
    opt_interactive() %>%
    reactive_table_to_json()

  interactive_tbl_colgroups <- do.call(rbind, interactive_tbl$x$tag$attribs$columnGroups) %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(across(c(-columns), ~ .x %>% sapply("[[", 1)))

  expect_equal(nrow(interactive_tbl_colgroups), 1)
  expect_equal(
    interactive_tbl_colgroups$name %>% sort(),
    c("spanner_datechar")
  )

  # expected spanners should contain the expected cols
  expect_equal(
    interactive_tbl_colgroups %>% dplyr::filter(name == "spanner_datechar") %>% .$columns %>% .[[1]] %>% sapply("[[", 1) %>% sort(),
    c("char", "date")
  )

  #
  # more complex example with multiple spanners, 1 level
  #

  interactive_tbl <-
    exibble[, 1:4] %>%
    gt() %>%
    tab_spanner(label = "spanner_numchar", columns = c(num, char)) %>%
    tab_spanner(label = "spanner_dat", columns = c(date)) %>%
    opt_interactive() %>%
    reactive_table_to_json()

  interactive_tbl_colgroups <- do.call(rbind, interactive_tbl$x$tag$attribs$columnGroups) %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(across(c(-columns), ~ .x %>% sapply("[[", 1)))

  testthat::expect_equal(nrow(interactive_tbl_colgroups), 2)
  testthat::expect_equal(
    interactive_tbl_colgroups$name %>% sort(),
    c("spanner_dat", "spanner_numchar")
  )

  # expected spanners should contain the expected cols
  testthat::expect_equal(
    interactive_tbl_colgroups %>% dplyr::filter(name == "spanner_numchar") %>% .$columns %>% .[[1]] %>% sapply("[[", 1) %>% sort(),
    c("char", "num")
  )

  testthat::expect_equal(
    interactive_tbl_colgroups %>% dplyr::filter(name == "spanner_dat") %>% .$columns %>% .[[1]] %>% sapply("[[", 1) %>% sort(),
    c("date")
  )

  #
  # MD, HTML should be rendered - raw text should be escaped
  #

  interactive_tbl <-
    exibble[, 1:4] %>%
    gt() %>%
    tab_spanner(label = md("*md spanner*"), columns = c(num)) %>%
    tab_spanner(label = html("<u>html spanner</u>"), columns = c(date)) %>%
    tab_spanner(label = "normal spanner with <u>tags</u> and *more*", columns = c(char)) %>%
    opt_interactive() %>%
    reactive_table_to_json()

  interactive_tbl_colgroups <- do.call(rbind, interactive_tbl$x$tag$attribs$columnGroups) %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(across(c(-columns), ~ .x %>% sapply("[[", 1)))

  testthat::expect_match(interactive_tbl_colgroups %>% dplyr::filter(name == "*md spanner*") %>% dplyr::select(header) %>% as.character(),
                         regexp = "<span.+md spanner.+"
  )

  testthat::expect_match(interactive_tbl_colgroups %>% dplyr::filter(name == "<u>html spanner</u>") %>% dplyr::select(header) %>% as.character(),
                         regexp = "<u>html spanner</u>"
  )

  testthat::expect_match(interactive_tbl_colgroups %>% dplyr::filter(name == "normal spanner with <u>tags</u> and *more*") %>% dplyr::select(header) %>% as.character(),
                         regexp = "normal spanner with &lt;u&gt;.+"
  )

  #
  # spanners with same name but different ID must not be a problem
  #

  interactive_tbl <-
    exibble[, 1:4] %>%
    gt() %>%
    tab_spanner(label = "spanner_label", columns = c(num), id = 1) %>%
    tab_spanner(label = "spanner_label", columns = c(date, fctr), id = 2) %>%
    tab_spanner(label = "another_label", columns = c(char), id = 3) %>%
    opt_interactive() %>%
    reactive_table_to_json()

  interactive_tbl_colgroups <- do.call(rbind, interactive_tbl$x$tag$attribs$columnGroups) %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(across(c(-columns), ~ .x %>% sapply("[[", 1))) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(size = length(columns)) %>%
    dplyr::arrange(size)

  expect_equal(
    interactive_tbl_colgroups %>% dplyr::filter(name == "spanner_label") %>% .$columns %>% .[[1]] %>% sapply("[[", 1) %>% sort(),
    "num"
  )

  expect_equal(
    interactive_tbl_colgroups %>% dplyr::filter(name == "spanner_label") %>% .$columns %>% .[[2]] %>% sapply("[[", 1) %>% sort(),
    c("date", "fctr")
  )
})

# spanners with multiple levels result in a warning message
cli::test_that_cli("multiple levels of `tab_spanner()` are not compatible with interactive tables", configs = c("plain"), {
  skip_if_not_installed("jsonlite")
  skip_if_not_installed("stringr")

  # returns the json-object of the reactable javascript-part
  reactive_table_to_json <- function(reactable_obj){
    tmp_html_tag <- reactable_obj %>%
      htmltools::as.tags()  %>%
      htmltools::doRenderTags()

    tmp_html_tag2 <- stringr::str_extract(
      tmp_html_tag,
      '<script type="application/json" data-for="[^>]+>(?<found>.+)</script>',
      group = 1
    )
    jsonlite::parse_json(tmp_html_tag2)
  }

  expect_snapshot(local({
    tmp <- exibble[, 1:4] %>%
      gt() %>%
      tab_spanner(label = "spanner_numdat", columns = c(num, date)) %>%
      tab_spanner(label = "spanner_char", columns = c(char)) %>%
      tab_spanner(label = "spanner_numdatchar", columns = c(num, date, char)) %>%
      opt_interactive()
  }))
})


test_that("tab_spanner() can't render multiple spanners in interactive tables and only use 1st level", {
  skip_if_not_installed("jsonlite")
  skip_if_not_installed("stringr")

  # returns the json-object of the reactable javascript-part
  reactive_table_to_json <- function(reactable_obj){
    tmp_html_tag <- reactable_obj %>%
      htmltools::as.tags()  %>%
      htmltools::doRenderTags()
    tmp_html_tag2 <- stringr::str_extract(
      tmp_html_tag,
      '<script type="application/json" data-for="[^>]+>(?<found>.+)</script>',
      group = 1
    )
    jsonlite::parse_json(tmp_html_tag2)
  }
  suppressWarnings({
    interactive_tbl <-
      exibble[, 1:4] %>%
      gt() %>%
      tab_spanner(label = "spanner_numdat", columns = c(num, date)) %>%
      tab_spanner(label = "spanner_char", columns = c(char)) %>%
      tab_spanner(label = "spanner_numdatchar", columns = c(num, date, char)) %>%
      opt_interactive() %>%
      reactive_table_to_json()
  })


  interactive_tbl_colgroups <- do.call(rbind, interactive_tbl$x$tag$attribs$columnGroups) %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(across(c(-columns), ~ .x %>% sapply("[[", 1))) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(size = length(columns)) %>%
    dplyr::arrange(size)

  # expected spanners should contain the expected cols
  testthat::expect_equal(
    interactive_tbl_colgroups %>% dplyr::filter(name == "spanner_char") %>% .$columns %>% .[[1]] %>% sapply("[[", 1) %>% sort(),
    c("char")
  )

  testthat::expect_equal(
    interactive_tbl_colgroups %>% dplyr::filter(name == "spanner_numdat") %>% .$columns %>% .[[1]] %>% sapply("[[", 1) %>% sort(),
    c("date", "num")
  )
})

