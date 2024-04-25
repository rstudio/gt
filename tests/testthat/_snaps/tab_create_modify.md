# tab_footnote produces helpful error messages (#475).

    Code
      tab_footnote(start_gt, footnote = "First data cell.", locations = cells_body(
        columns = "valuer", rows = 1))
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "First data cell."
      Caused by error in `cell_body()`:
      ! Can't select columns that don't exist.
      x Column `valuer` doesn't exist.
    Code
      tab_footnote(start_gt, footnote = "First data cell.", locations = cells_column_labels(
        columns = "valuer"))
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "First data cell."
      Caused by error in `cells_column_labels()`:
      ! Can't select columns that don't exist.
      x Column `valuer` doesn't exist.
    Code
      tab_footnote(start_gt, footnote = "First data cell.", locations = cells_column_spanners(
        "valuer"))
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "First data cell."
      Caused by error in `cells_column_spanners()`:
      ! Can't find spanner `valuer` in the data.
    Code
      tab_footnote(start_gt, footnote = "First data cell.", locations = cells_column_spanners(
        3))
    Condition
      Error in `tab_footnote()`:
      ! Can't add footnote "First data cell."
      Caused by error in `cells_column_spanners()`:
      ! The following spanner indices do not exist in the data: 3.

