# Resolve footnotes or styles
#' @importFrom dplyr filter bind_rows mutate inner_join select arrange select
#' @importFrom tibble rownames_to_column
#' @noRd
resolve_footnotes_styles <- function(output_df,
                                     boxh_df,
                                     groups_rows_df,
                                     arrange_groups,
                                     boxhead_spanners,
                                     title_defined,
                                     headnote_defined,
                                     footnotes_df = NULL,
                                     styles_df = NULL) {

  if (!is.null(styles_df) && is.null(footnotes_df)) {
    tbl <- styles_df
  } else if (is.null(styles_df) && !is.null(footnotes_df)) {
    tbl <- footnotes_df
  }

  # Pare down to the relevant records
  if (nrow(tbl) > 0) {

    # Filter `tbl` by elements preceeding the data rows (i.e., if element is not
    # present but a reference is, remove the footnote reference since it is not
    # relevant)

    # Filter by `title`
    if (title_defined == FALSE) {

      tbl <-
        tbl %>%
        dplyr::filter(locname != "title")
    }

    # Filter by `headnote`
    if (headnote_defined == FALSE) {

      tbl <-
        tbl %>%
        dplyr::filter(locname != "headnote")
    }

    # Filter by `grpname` in boxhead groups
    if ("boxhead_groups" %in% tbl[["locname"]]) { # remove conditional

      tbl <-
        tbl %>%
        dplyr::filter(locname != "boxhead_groups" | grpname %in% boxhead_spanners)
    }

    # Filter by `grpname` in stub groups
    if ("stub_groups" %in% tbl[["locname"]]) {

      tbl <-
        dplyr::bind_rows(
          tbl %>%
            dplyr::filter(locname != "stub_groups"),
          tbl %>%
            dplyr::filter(locname == "stub_groups") %>%
            dplyr::filter(grpname %in% arrange_groups$groups))
    }

    # Filter `tbl` by the remaining columns in `output_df`
    tbl <-
      tbl %>%
      dplyr::filter(colname %in% c(NA_character_, colnames(output_df)))
  }

  # Reorganize records that target the data rows
  if (5 %in% tbl[["locnum"]]) {

    tbl_not_data <-
      tbl %>%
      dplyr::filter(locnum != 5 | locname == "stub_groups")

    tbl_data <-
      tbl %>%
      dplyr::filter(locnum == 5 & locname != "stub_groups")

    if (nrow(tbl_data) > 0) {

      # Re-map the `rownum` to the new row numbers for the
      # data rows
      tbl_data <-
        tbl_data %>%
        dplyr::mutate(rownum = rownum_translation(
          output_df, rownum_start = rownum))

      # Add a `colnum` column that's required for arranging `tbl` in such a way
      # that the order of records moves from top-to-bottom, left-to-right
      tbl_data <-
        tbl_data %>%
        dplyr::mutate(colnum = colname_to_colnum(
          boxh_df = boxh_df, colname = colname)) %>%
        dplyr::mutate(colnum = ifelse(locname == "stub", 0, colnum))
    }

    # Re-combine `tbl_data` with `tbl`
    tbl <-
      dplyr::bind_rows(tbl_not_data, tbl_data)

  } else {
    tbl <-
      tbl %>%
      dplyr::mutate(colnum = NA_integer_)
  }

  # For the stub groups, insert a `rownum` based on groups_rows_df
  if ("stub_groups" %in% tbl[["locname"]]) {

    tbl_not_stub_groups <-
      tbl %>%
      dplyr::filter(locname != "stub_groups")

    tbl_stub_groups <-
      tbl %>%
      dplyr::filter(locname == "stub_groups") %>%
      dplyr::inner_join(
        groups_rows_df %>% dplyr::select(-group_label),
        by = c("grpname" = "group")) %>%
      dplyr::mutate(rownum = row - 0.1) %>%
      dplyr::select(-row, -row_end)

    # Re-combine `tbl_not_stub_groups`
    #   with `tbl_stub_groups`
    tbl <-
      dplyr::bind_rows(
        tbl_not_stub_groups, tbl_stub_groups)
  }

  # For the summary cells, insert a `rownum` based on groups_rows_df
  if ("summary_cells" %in% tbl[["locname"]]) {

    tbl_not_summary_cells <-
      tbl %>%
      dplyr::filter(locname != "summary_cells")

    tbl_summary_cells <-
      tbl %>%
      dplyr::filter(locname == "summary_cells") %>%
      dplyr::inner_join(
        groups_rows_df %>% dplyr::select(-group_label),
        by = c("grpname" = "group")) %>%
      dplyr::mutate(rownum = (rownum / 100) + row_end) %>%
      dplyr::select(-row, -row_end)

    # Re-combine `tbl_not_summary_cells`
    #   with `tbl_summary_cells`
    tbl <-
      dplyr::bind_rows(
        tbl_not_summary_cells, tbl_summary_cells)
  }

  if (!("colnum" %in% colnames(tbl))) {

    tbl <-
      tbl %>%
      dplyr::mutate(colnum = NA_integer_)
  }

  # Sort the table rows
  tbl <-
    tbl %>%
    dplyr::arrange(locnum, rownum, colnum)

  # Generate a lookup table with ID'd footnote
  # text elements (that are distinct)
  lookup_tbl <-
    tbl %>%
    dplyr::select(text) %>%
    dplyr::distinct() %>%
    tibble::rownames_to_column(var = "fs_id") %>%
    dplyr::mutate(fs_id = as.integer(fs_id))

  # Join the lookup table to `tbl`
  tbl <-
    tbl %>%
    dplyr::inner_join(lookup_tbl, by = "text")

  tbl
}
