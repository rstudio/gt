# tab_footnote produces helpful error messages (#475).

    Code
      start_gt %>% tab_footnote(footnote = "First data cell.", locations = cells_body(
        columns = "valuer", rows = 1))
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "First data cell.".
      Caused by error in `cells_body()`:
      ! Can't select columns that don't exist.
      x Column `valuer` doesn't exist.
    Code
      start_gt %>% tab_footnote(footnote = "First data cell.", locations = cells_column_labels(
        columns = "valuer"))
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "First data cell.".
      Caused by error in `cells_column_labels()`:
      ! Can't select columns that don't exist.
      x Column `valuer` doesn't exist.
    Code
      start_gt %>% tab_footnote(footnote = "First data cell.", locations = cells_column_spanners(
        "valuer"))
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "First data cell.".
      Caused by error in `cells_column_spanners()`:
      ! Spanner `valuer` does not exist in the data.
    Code
      start_gt %>% tab_footnote(footnote = "First data cell.", locations = cells_column_spanners(
        3))
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "First data cell.".
      Caused by error in `cells_column_spanners()`:
      ! The following spanner indices do not exist in the data: 3.

