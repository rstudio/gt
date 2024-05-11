# The `row_group_order()` function works correctly

    Code
      tbl %>% gt(rowname_col = "rows", groupname_col = "dates") %>% row_group_order(
        groups = c(TRUE, FALSE))
    Condition
      Error in `row_group_order()`:
      ! The values provided for `groups` must be a character vector.

---

    Code
      tbl %>% gt(rowname_col = "rows", groupname_col = "dates") %>% row_group_order(
        groups = c("2018-02-13", "2018-02-10"))
    Condition
      Error in `row_group_order()`:
      ! All values given as `groups` must correspond to `group_id` values.
      * The following `group_id` values can be used `"2018-02-10"` and `"2018-02-11"`.

