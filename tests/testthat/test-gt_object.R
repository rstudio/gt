context("Ensuring that the `gt()` function works as expected")

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
  skip_if_not_installed("xml2")
}

# Gets the inner HTML text from a single value
selection_text <- function(html, selection) {

  html %>%
    rvest::html_nodes(selection) %>%
    rvest::html_text()
}

test_that("a gt table object contains the correct components", {

  # Create a `gt_tbl` object with `gt()`
  tab <- iris %>% gt()

  # Expect that the `gt_tbl` object has all of the
  # usual components and that they have all of the
  # expected dimensions and features
  expect_tab(tab = tab, df = iris)

  # Expect that the `stub_df` data frame is correctly
  # formed given the input rownames and groupnames
  expect_tab_colnames(
    tab = tab,
    df = iris,
    rowname = "NA",
    groupname_is_na = TRUE
  )

  # Create a `gt_tbl` object with `gt()` and a
  # grouped version of the `iris` dataset
  tab <-
    iris %>% dplyr::group_by(Species) %>%
    gt()

  # Expect that the `gt_tbl` object has all of the
  # usual components and that they have all of the
  # expected dimensions and features
  #expect_tab(tab, df = iris %>% dplyr::group_by(Species))
})

test_that("a gt table can be made to use the rownames of a data frame", {

  # Create a `gt_tbl` object with `gt()` and use the
  # data frame's row names as row names in the stub
  tab <-
    mtcars %>%
    gt(rownames_to_stub = TRUE)

  # Expect that the `gt_tbl` object has all of the
  # usual components and that they have all of the
  # expected dimensions and features
  expect_tab(tab = tab, df = mtcars)

  # Expect that the `stub_df` data frame is correctly
  # formed given the input rownames and groupnames
  expect_tab_colnames(
    tab,
    df = mtcars,
    rowname = "tibble",
    groupname_is_na = TRUE
  )
})

test_that("a gt table can be made with the stub partially or fully populated", {

  # Create an input data frame with a `rowname` column
  # and a `value` column
  data_r <-
    data.frame(
      rowname = letters[1:10],
      value = 1:10,
      stringsAsFactors = FALSE
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_r` dataset
  tab <- data_r %>% gt()

  # Expect that the `gt_tbl` object has all of the
  # usual components and that they have all of the
  # expected dimensions and features
  expect_tab(tab = tab, df = data_r)

  # Expect that the `stub_df` data frame is correctly
  # formed given the input rownames and groupnames
  expect_tab_colnames(
    tab, df = data_r,
    rowname = "col",
    groupname_is_na = TRUE
  )

  # Create an input data frame with a `rowname` column,
  # a `groupname` column, and a `value` column
  data_rg <-
    data.frame(
      rowname = letters[1:10],
      groupname = c("A", "A", "A", "B", "B", "B", "C", "C", "D", "D"),
      value = 1:10,
      stringsAsFactors = FALSE
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_rg` dataset
  tab <- data_rg %>% gt()

  # Expect that the `gt_tbl` object has all of the
  # usual components and that they have all of the
  # expected dimensions and features
  #expect_tab(tab, data_rg, has_groupnames = TRUE, has_rownames = TRUE)

  # Expect that the `stub_df` data frame is correctly
  # formed given the input rownames and groupnames
  expect_tab_colnames(
    tab, df = data_rg,
    rowname = "col",
    groupname_is_na = FALSE
  )
})

test_that("a gt table can be made from a table with no rows", {

  # Create an input data frame based on the exibble
  # dataset, except with no rows
  data_e <- exibble %>% head(0)

  # Create a `gt_tbl` object with `gt()` and the
  # `data_e` dataset
  tab <- data_e %>% gt()

  # Expect that the `gt_tbl` object has all of the
  # usual components and that they have all of the
  # expected dimensions and features
  expect_tab(tab = tab, df = data_e)

  # Expect that the `stub_df` data frame is empty
  dt_stub_df_get(data = tab) %>%
    nrow() %>%
    expect_equal(0)

  # Create a `gt_tbl` object with `gt()` and a
  # grouped version of the `data_e` dataset
  tab <-
    data_e %>%
    dplyr::group_by(group) %>%
    gt()

  # Expect that the `gt_tbl` object has all of the
  # usual components and that they have all of the
  # expected dimensions and features
  expect_tab(tab = tab, df = data_e %>% dplyr::group_by(group))
})

test_that("a gt table can use UTF-8 chars in any system locale", {

  # Check that specific suggested packages are available
  check_suggests()

  # Skip these tests if the platform is Windows or Solaris
  skip_on_os(os = c("windows", "solaris"))

  system_locales <-
    c("nl_NL.UTF-8", "pt_BR.UTF-8", "cs_CZ.UTF-8", "zh_CN.UTF-8",
      "en_US.UTF-8", "sk_SK.UTF-8", "de_DE.UTF-8", "am_ET.UTF-8", "be_BY.UTF-8",
      "af_ZA.UTF-8", "ro_RO.UTF-8", "en_NZ.UTF-8", "fi_FI.UTF-8", "hr_HR.UTF-8",
      "da_DK.UTF-8", "de_AT.UTF-8", "en_AU.UTF-8", "hu_HU.UTF-8", "et_EE.UTF-8",
      "he_IL.UTF-8", "fr_BE.UTF-8", "fr_CH.UTF-8", "sl_SI.UTF-8", "pl_PL.UTF-8",
      "sv_SE.UTF-8", "sr_YU.UTF-8", "de_CH.UTF-8", "pt_PT.UTF-8", "ca_ES.UTF-8",
      "en_GB.UTF-8", "ru_RU.UTF-8", "eu_ES.UTF-8", "it_CH.UTF-8", "nl_BE.UTF-8",
      "lt_LT.UTF-8", "is_IS.UTF-8", "zh_TW.UTF-8", "el_GR.UTF-8", "it_IT.UTF-8",
      "en_CA.UTF-8", "uk_UA.UTF-8", "zh_HK.UTF-8", "bg_BG.UTF-8", "ja_JP.UTF-8",
      "fr_FR.UTF-8", "ko_KR.UTF-8", "kk_KZ.UTF-8", "en_IE.UTF-8", "fr_CA.UTF-8",
      "hy_AM.UTF-8", "no_NO.UTF-8", "es_ES.UTF-8", "tr_TR.UTF-8",
      "en_NZ", "af_ZA", "bg_BG", "fi_FI", "eu_ES", "nl_BE", "fr_BE", "sk_SK",
      "de_CH", "zh_HK", "uk_UA", "en_US", "am_ET", "sv_SE", "be_BY", "kk_KZ",
      "it_CH", "pt_BR", "ko_KR", "it_IT", "zh_TW", "en_CA", "pt_PT", "hr_HR",
      "cs_CZ", "fr_CH", "he_IL", "fr_CA", "sl_SI", "ro_RO", "ja_JP", "zh_CN",
      "nl_NL", "hy_AM", "hu_HU", "en_AU", "en_GB", "et_EE", "ca_ES", "sr_YU",
      "ru_RU", "is_IS", "es_ES", "el_GR", "da_DK", "no_NO", "en_IE", "pl_PL",
      "fr_FR", "de_AT", "de_DE", "lt_LT", "tr_TR",
      "C", "POSIX"
    )

  names_df <-
    data.frame(
      first = c("\u6625", "Fred"),
      last = c("\u9ad8","B\u00e4ckhed"),
      stringsAsFactors = FALSE
    )

  # Function to check for identical vectors in a df processed by
  # gt and an expectation vector
  test_df_output_with_sys_locale <- function(df, locale, expected_vec) {

    old_ctype <- Sys.getlocale("LC_CTYPE")
    Sys.setlocale("LC_CTYPE", locale = locale)
    on.exit(Sys.setlocale("LC_CTYPE", old_ctype), add = TRUE)

    # Expect that UTF-8 characters are retained in the
    # gt object after rendering
    expect_identical(
      expected_vec %>% sort(),
      (df %>% gt() %>% render_formats_test("html")) %>%
        unlist() %>% unname() %>% sort()
    )

    # Expect that UTF-8 characters are retained in the
    # rendered HTML table
    expect_identical(
      expected_vec %>% sort(),
      df %>%
        gt() %>%
        tab_options(row.striping.include_table_body = FALSE) %>%
        render_as_html() %>%
        xml2::read_html() %>%
        selection_text("[class='gt_row gt_left']") %>%
        sort()
    )
  }

  # Run tests with `test_df_output_with_sys_locale()` for all locales
  # in the `system_locales` vector
  for (locale in system_locales) {
    test_df_output_with_sys_locale(
      df = names_df,
      locale = locale,
      expected_vec = c("B\u00e4ckhed", "Fred", "\u6625", "\u9ad8")
    )
  }
})
