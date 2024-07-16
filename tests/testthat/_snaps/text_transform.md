# text_case_match() works on the tab_spanner()

    Code
      gt_tbl %>% text_case_match("boring " ~ "awesome ", .replace = "partial",
      .locations = cells_column_spanners(2))
    Condition
      Error in `text_case_match()`:
      ! Failed to resolve location.
      Caused by error in `cells_column_spanners()`:
      ! Spanner 2 does not exist in the data.

