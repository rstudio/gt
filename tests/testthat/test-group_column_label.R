test_that("Group labels as a column work well across many variations", {

  # 1: No row groups or row labels (no stub)
  tbl_1 <-
    exibble_test(
      row_group_as_column = FALSE,
      use_row_groups = FALSE,
      use_row_labels = FALSE,
      add_group_summaries = FALSE,
      add_grand_summary = FALSE,
      add_styles = FALSE,
      add_footnotes = FALSE
    )

  # Take snapshots of `tbl_1`
  tbl_1 %>% render_as_html() %>% expect_snapshot()
  tbl_1 %>% as_latex() %>% as.character() %>% expect_snapshot()
  tbl_1 %>% as_rtf() %>% expect_snapshot()

  # 2: No row groups or row labels (no stub); option for group column taken
  #    Note: Should be identical to #1
  tbl_2 <-
    exibble_test(
      row_group_as_column = TRUE,
      use_row_groups = FALSE,
      use_row_labels = FALSE,
      add_group_summaries = FALSE,
      add_grand_summary = FALSE,
      add_styles = FALSE,
      add_footnotes = FALSE
    )

  # Take snapshots of `tbl_2`
  tbl_2 %>% render_as_html() %>% expect_snapshot()
  tbl_2 %>% as_latex() %>% as.character() %>% expect_snapshot()
  tbl_2 %>% as_rtf() %>% expect_snapshot()

  # 3: Has row groups, no row labels (row group labels in standalone rows)
  tbl_3 <-
    exibble_test(
      row_group_as_column = FALSE,
      use_row_groups = TRUE,
      use_row_labels = FALSE,
      add_group_summaries = FALSE,
      add_grand_summary = FALSE,
      add_styles = FALSE,
      add_footnotes = FALSE
    )

  # Take snapshots of `tbl_3`
  tbl_3 %>% render_as_html() %>% expect_snapshot()
  tbl_3 %>% as_latex() %>% as.character() %>% expect_snapshot()
  tbl_3 %>% as_rtf() %>% expect_snapshot()

  # 4: Has row groups, no row labels (row group labels as column in 1-col stub)
  tbl_4 <-
    exibble_test(
      row_group_as_column = TRUE,
      use_row_groups = TRUE,
      use_row_labels = FALSE,
      add_group_summaries = FALSE,
      add_grand_summary = FALSE,
      add_styles = FALSE,
      add_footnotes = FALSE
    )

  # Take snapshots of `tbl_1`
  tbl_4 %>% render_as_html() %>% expect_snapshot()
  tbl_4 %>% as_latex() %>% as.character() %>% expect_snapshot()
  tbl_4 %>% as_rtf() %>% expect_snapshot()

  # 5: Has row labels, no row groups (makes 1-col stub with row labels)
  tbl_5 <-
    exibble_test(
      row_group_as_column = FALSE,
      use_row_groups = FALSE,
      use_row_labels = TRUE,
      add_group_summaries = FALSE,
      add_grand_summary = FALSE,
      add_styles = FALSE,
      add_footnotes = FALSE
    )

  # Take snapshots of `tbl_5`
  tbl_5 %>% render_as_html() %>% expect_snapshot()
  tbl_5 %>% as_latex() %>% as.character() %>% expect_snapshot()
  tbl_5 %>% as_rtf() %>% expect_snapshot()

  # 6: Has row labels, no row groups (makes 1-col stub with row labels);
  #    option for group column taken
  #    Note: Should be identical to #5
  tbl_6 <-
    exibble_test(
      row_group_as_column = TRUE,
      use_row_groups = FALSE,
      use_row_labels = TRUE,
      add_group_summaries = FALSE,
      add_grand_summary = FALSE,
      add_styles = FALSE,
      add_footnotes = FALSE
    )

  # Take snapshots of `tbl_6`
  tbl_6 %>% render_as_html() %>% expect_snapshot()
  tbl_6 %>% as_latex() %>% as.character() %>% expect_snapshot()
  tbl_6 %>% as_rtf() %>% expect_snapshot()

  # 7: Has row labels and row groups (makes 1-col stub with row labels,
  #    row group labels are in standalone rows)
  tbl_7 <-
    exibble_test(
      row_group_as_column = FALSE,
      use_row_groups = TRUE,
      use_row_labels = TRUE,
      add_group_summaries = FALSE,
      add_grand_summary = FALSE,
      add_styles = FALSE,
      add_footnotes = FALSE
    )

  # Take snapshots of `tbl_7`
  tbl_7 %>% render_as_html() %>% expect_snapshot()
  tbl_7 %>% as_latex() %>% as.character() %>% expect_snapshot()
  tbl_7 %>% as_rtf() %>% expect_snapshot()

  # 8: Has row labels and row groups (makes 2-col stub with row groups and row
  # labels since option for group column taken)
  tbl_8 <-
    exibble_test(
      row_group_as_column = TRUE,
      use_row_groups = TRUE,
      use_row_labels = TRUE,
      add_group_summaries = FALSE,
      add_grand_summary = FALSE,
      add_styles = FALSE,
      add_footnotes = FALSE
    )

  # Take snapshots of `tbl_8`
  tbl_8 %>% render_as_html() %>% expect_snapshot()
  tbl_8 %>% as_latex() %>% as.character() %>% expect_snapshot()
  tbl_8 %>% as_rtf() %>% expect_snapshot()

  # 9: No row groups or row labels; added grand summary (creates 1-col stub which
  # is empty for data rows but populated with the necessary summary row labels)
  tbl_9 <-
    exibble_test(
      row_group_as_column = FALSE,
      use_row_groups = FALSE,
      use_row_labels = FALSE,
      add_group_summaries = FALSE,
      add_grand_summary = TRUE,
      add_styles = FALSE,
      add_footnotes = FALSE
    )

  # Take snapshots of `tbl_9`
  tbl_9 %>% render_as_html() %>% expect_snapshot()
  tbl_9 %>% as_latex() %>% as.character() %>% expect_snapshot()
  tbl_9 %>% as_rtf() %>% expect_snapshot()

  # 10: No row groups or row labels; added grand summary (creates 1-col stub
  #     which is empty for data rows but populated with the necessary summary
  #     row labels); option for group column taken
  #     Note: Should be identical to #9
  tbl_10 <-
    exibble_test(
      row_group_as_column = TRUE,
      use_row_groups = FALSE,
      use_row_labels = FALSE,
      add_group_summaries = FALSE,
      add_grand_summary = TRUE,
      add_styles = FALSE,
      add_footnotes = FALSE
    )

  # Take snapshots of `tbl_10`
  tbl_10 %>% render_as_html() %>% expect_snapshot()
  tbl_10 %>% as_latex() %>% as.character() %>% expect_snapshot()
  tbl_10 %>% as_rtf() %>% expect_snapshot()

  # 11: Has row groups, no row labels (row group labels in standalone rows);
  #     added group and grand summaries (creates 1-col stub which is empty for
  #     data rows but populated with the necessary summary row labels)
  tbl_11 <-
    exibble_test(
      row_group_as_column = FALSE,
      use_row_groups = TRUE,
      use_row_labels = FALSE,
      add_group_summaries = TRUE,
      add_grand_summary = TRUE,
      add_styles = FALSE,
      add_footnotes = FALSE
    )

  # Take snapshots of `tbl_11`
  tbl_11 %>% render_as_html() %>% expect_snapshot()
  tbl_11 %>% as_latex() %>% as.character() %>% expect_snapshot()
  tbl_11 %>% as_rtf() %>% expect_snapshot()

  # 12: Has row groups, no row labels (row group labels as column in 1-col stub
  #     along with summary row labels)
  tbl_12 <-
    exibble_test(
      row_group_as_column = TRUE,
      use_row_groups = TRUE,
      use_row_labels = FALSE,
      add_group_summaries = TRUE,
      add_grand_summary = TRUE,
      add_styles = FALSE,
      add_footnotes = FALSE
    )

  # Take snapshots of `tbl_12`
  tbl_12 %>% render_as_html() %>% expect_snapshot()
  tbl_12 %>% as_latex() %>% as.character() %>% expect_snapshot()
  tbl_12 %>% as_rtf() %>% expect_snapshot()

  # 13: Has row labels, no row groups but a grand summary (ends up making a
  #     1-col stub with row labels and summary row labels)
  tbl_13 <-
    exibble_test(
      row_group_as_column = FALSE,
      use_row_groups = FALSE,
      use_row_labels = TRUE,
      add_group_summaries = FALSE,
      add_grand_summary = TRUE,
      add_styles = FALSE,
      add_footnotes = FALSE
    )

  # Take snapshots of `tbl_13`
  tbl_13 %>% render_as_html() %>% expect_snapshot()
  tbl_13 %>% as_latex() %>% as.character() %>% expect_snapshot()
  tbl_13 %>% as_rtf() %>% expect_snapshot()

  # 14: Has row labels, no row groups but a grand summary (ends up
  #     making a 1-col stub with row labels and summary row labels);
  #     option for group column taken
  #     Note: Should be identical to #13
  tbl_14 <-
    exibble_test(
      row_group_as_column = TRUE,
      use_row_groups = FALSE,
      use_row_labels = TRUE,
      add_group_summaries = FALSE,
      add_grand_summary = TRUE,
      add_styles = FALSE,
      add_footnotes = FALSE
    )

  # Take snapshots of `tbl_14`
  tbl_14 %>% render_as_html() %>% expect_snapshot()
  tbl_14 %>% as_latex() %>% as.character() %>% expect_snapshot()
  tbl_14 %>% as_rtf() %>% expect_snapshot()

  # 15: Has row labels, row groups, group summaries, and a grand summmary
  #     (makes a 1-col stub with row labels and summary row labels, row group
  #     labels are in standalone rows)
  tbl_15 <-
    exibble_test(
      row_group_as_column = FALSE,
      use_row_groups = TRUE,
      use_row_labels = TRUE,
      add_group_summaries = TRUE,
      add_grand_summary = TRUE,
      add_styles = FALSE,
      add_footnotes = FALSE
    )

  # Take snapshots of `tbl_15`
  tbl_15 %>% render_as_html() %>% expect_snapshot()
  tbl_15 %>% as_latex() %>% as.character() %>% expect_snapshot()
  tbl_15 %>% as_rtf() %>% expect_snapshot()

  # 16: Has row labels, row groups, group summaries, and a grand summmary
  #     (makes a hybrid 2-col stub with group/row labels and summary row labels)
  tbl_16 <-
    exibble_test(
      row_group_as_column = TRUE,
      use_row_groups = TRUE,
      use_row_labels = TRUE,
      add_group_summaries = TRUE,
      add_grand_summary = TRUE,
      add_styles = FALSE,
      add_footnotes = FALSE
    )

  # Take snapshots of `tbl_16`
  tbl_16 %>% render_as_html() %>% expect_snapshot()
  tbl_16 %>% as_latex() %>% as.character() %>% expect_snapshot()
  tbl_16 %>% as_rtf() %>% expect_snapshot()

  # S1: Styled version of table #1
  tbl_s1 <-
    exibble_test(
      row_group_as_column = FALSE,
      use_row_groups = FALSE,
      use_row_labels = FALSE,
      add_group_summaries = FALSE,
      add_grand_summary = FALSE,
      add_styles = TRUE,
      add_footnotes = FALSE
    )

  # Take a snapshot of `tbl_s1`
  tbl_s1 %>% render_as_html() %>% expect_snapshot()

  # S2: Styled version of table #2; same as #S1
  tbl_s2 <-
    exibble_test(
      row_group_as_column = TRUE,
      use_row_groups = FALSE,
      use_row_labels = FALSE,
      add_group_summaries = FALSE,
      add_grand_summary = FALSE,
      add_styles = TRUE,
      add_footnotes = FALSE
    )

  # Take a snapshot of `tbl_s2`
  tbl_s2 %>% render_as_html() %>% expect_snapshot()

  # S3: Styled version of table #3
  tbl_s3 <-
    exibble_test(
      row_group_as_column = FALSE,
      use_row_groups = TRUE,
      use_row_labels = FALSE,
      add_group_summaries = FALSE,
      add_grand_summary = FALSE,
      add_styles = TRUE,
      add_footnotes = FALSE
    )

  # Take a snapshot of `tbl_s3`
  tbl_s3 %>% render_as_html() %>% expect_snapshot()

  # S4: Styled version of table #4
  tbl_s4 <-
    exibble_test(
      row_group_as_column = TRUE,
      use_row_groups = TRUE,
      use_row_labels = FALSE,
      add_group_summaries = FALSE,
      add_grand_summary = FALSE,
      add_styles = TRUE,
      add_footnotes = FALSE
    )

  # Take a snapshot of `tbl_s4`
  tbl_s4 %>% render_as_html() %>% expect_snapshot()

  # S5: Styled version of table #5
  tbl_s5 <-
    exibble_test(
      row_group_as_column = FALSE,
      use_row_groups = FALSE,
      use_row_labels = TRUE,
      add_group_summaries = FALSE,
      add_grand_summary = FALSE,
      add_styles = TRUE,
      add_footnotes = FALSE
    )

  # Take a snapshot of `tbl_s5`
  tbl_s5 %>% render_as_html() %>% expect_snapshot()

  # S6: Styled version of table #6; same as #S5
  tbl_s6 <-
    exibble_test(
      row_group_as_column = TRUE,
      use_row_groups = FALSE,
      use_row_labels = TRUE,
      add_group_summaries = FALSE,
      add_grand_summary = FALSE,
      add_styles = TRUE,
      add_footnotes = FALSE
    )

  # Take a snapshot of `tbl_s6`
  tbl_s6 %>% render_as_html() %>% expect_snapshot()

  # S7: Styled version of table #7
  tbl_s7 <-
    exibble_test(
      row_group_as_column = FALSE,
      use_row_groups = TRUE,
      use_row_labels = TRUE,
      add_group_summaries = FALSE,
      add_grand_summary = FALSE,
      add_styles = TRUE,
      add_footnotes = FALSE
    )

  # Take a snapshot of `tbl_s7`
  tbl_s7 %>% render_as_html() %>% expect_snapshot()

  # S8: Styled version of table #8
  tbl_s8 <-
    exibble_test(
      row_group_as_column = TRUE,
      use_row_groups = TRUE,
      use_row_labels = TRUE,
      add_group_summaries = FALSE,
      add_grand_summary = FALSE,
      add_styles = TRUE,
      add_footnotes = FALSE
    )

  # Take a snapshot of `tbl_s8`
  tbl_s8 %>% render_as_html() %>% expect_snapshot()

  # S9: Styled version of table #9
  tbl_s9 <-
    exibble_test(
      row_group_as_column = FALSE,
      use_row_groups = FALSE,
      use_row_labels = FALSE,
      add_group_summaries = FALSE,
      add_grand_summary = TRUE,
      add_styles = TRUE,
      add_footnotes = FALSE
    )

  # Take a snapshot of `tbl_s9`
  tbl_s9 %>% render_as_html() %>% expect_snapshot()

  # S10: Styled version of table #10; same as #S9
  tbl_s10 <-
    exibble_test(
      row_group_as_column = TRUE,
      use_row_groups = FALSE,
      use_row_labels = FALSE,
      add_group_summaries = FALSE,
      add_grand_summary = TRUE,
      add_styles = TRUE,
      add_footnotes = FALSE
    )

  # Take a snapshot of `tbl_s10`
  tbl_s10 %>% render_as_html() %>% expect_snapshot()

  # S11: Styled version of table #11
  tbl_s11 <-
    exibble_test(
      row_group_as_column = FALSE,
      use_row_groups = TRUE,
      use_row_labels = FALSE,
      add_group_summaries = TRUE,
      add_grand_summary = TRUE,
      add_styles = TRUE,
      add_footnotes = FALSE
    )

  # Take a snapshot of `tbl_s11`
  tbl_s11 %>% render_as_html() %>% expect_snapshot()

  # S12: Styled version of table #12
  tbl_s12 <-
    exibble_test(
      row_group_as_column = TRUE,
      use_row_groups = TRUE,
      use_row_labels = FALSE,
      add_group_summaries = TRUE,
      add_grand_summary = TRUE,
      add_styles = TRUE,
      add_footnotes = FALSE
    )

  # Take a snapshot of `tbl_s12`
  tbl_s12 %>% render_as_html() %>% expect_snapshot()

  # S13: Styled version of table #13
  tbl_s13 <-
    exibble_test(
      row_group_as_column = FALSE,
      use_row_groups = FALSE,
      use_row_labels = TRUE,
      add_group_summaries = FALSE,
      add_grand_summary = TRUE,
      add_styles = TRUE,
      add_footnotes = FALSE
    )

  # Take a snapshot of `tbl_s13`
  tbl_s13 %>% render_as_html() %>% expect_snapshot()

  # S14: Styled version of table #14; same as #S13
  tbl_s14 <-
    exibble_test(
      row_group_as_column = TRUE,
      use_row_groups = FALSE,
      use_row_labels = TRUE,
      add_group_summaries = FALSE,
      add_grand_summary = TRUE,
      add_styles = TRUE,
      add_footnotes = FALSE
    )

  # Take a snapshot of `tbl_s14`
  tbl_s14 %>% render_as_html() %>% expect_snapshot()

  # S15: Styled version of table #15
  tbl_s15 <-
    exibble_test(
      row_group_as_column = FALSE,
      use_row_groups = TRUE,
      use_row_labels = TRUE,
      add_group_summaries = TRUE,
      add_grand_summary = TRUE,
      add_styles = TRUE,
      add_footnotes = FALSE
    )

  # Take a snapshot of `tbl_s15`
  tbl_s15 %>% render_as_html() %>% expect_snapshot()

  # S16: Styled version of table #16
  tbl_s16 <-
    exibble_test(
      row_group_as_column = TRUE,
      use_row_groups = TRUE,
      use_row_labels = TRUE,
      add_group_summaries = TRUE,
      add_grand_summary = TRUE,
      add_styles = TRUE,
      add_footnotes = FALSE
    )

  # Take a snapshot of `tbl_s16`
  tbl_s16 %>% render_as_html() %>% expect_snapshot()
})
