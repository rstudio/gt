exibble_minitest <- function(
    row_group_column = FALSE,
    use_row_groups = FALSE,
    use_row_labels = FALSE,
    add_group_summaries = FALSE,
    add_grand_summary = FALSE,
    add_styles = FALSE,
    add_footnotes = FALSE
) {

  if (add_group_summaries) use_row_groups <- TRUE

  tbl <-
    exibble |>
    gt(
      rowname_col = if (use_row_labels) "row" else NULL,
      groupname_col = if (use_row_groups) "group" else NULL
    ) |>
    tab_options(row_group.as_column = row_group_column) |>
    tab_header(
      title = md("Data listing from **exibble**"),
      subtitle = md("`exibble` is an R dataset")
    ) |>
    tab_stubhead("S.L.") |>
    tab_spanner(label = "timing", columns = c(date, time, datetime)) |>
    tab_source_note("Source note #1") |>
    tab_source_note("Source note #2")

  if (add_group_summaries) {

    tbl <-
      tbl |>
      summary_rows(
        groups = everything(),
        columns = c(num, currency),
        fns = list(
          min = ~min(., na.rm = TRUE),
          max = ~max(., na.rm = TRUE),
          avg = ~mean(., na.rm = TRUE)
        ),
        fmt = list(~ fmt_number(., use_seps = FALSE))
      )
  }

  if (add_grand_summary) {

    tbl <-
      tbl |>
      grand_summary_rows(
        columns = c(num, currency),
        fns = list(
          min = ~min(., na.rm = TRUE),
          max = ~max(., na.rm = TRUE),
          avg = ~mean(., na.rm = TRUE)
        ),
        fmt = list(~ fmt_number(., use_seps = FALSE))
      )
  }

  tbl
}
