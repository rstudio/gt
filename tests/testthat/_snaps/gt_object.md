# The `gt()` `id` arg will only accept specific inputs

    Code
      exibble %>% gt(id = 23)
    Condition
      Error in `gt()`:
      ! `id` must be a single string or `NULL`, not the number 23.

---

    Code
      exibble %>% gt(id = c("one", "two"))
    Condition
      Error in `gt()`:
      ! `id` must be a single string or `NULL`, not a character vector.

---

    Code
      exibble %>% gt(id = NA)
    Condition
      Error in `gt()`:
      ! `id` must be a single string or `NULL`, not `NA`.

# Any shared names in `rowname_col` and `groupname_col` will be disallowed

    Code
      exibble %>% gt(rowname_col = "row", groupname_col = "row")
    Condition
      Error in `gt()`:
      ! The value "row" appears in both `rowname_col` and `groupname_col`.
      * These arguments must not have any values in common.

---

    Code
      exibble %>% gt(rowname_col = "group", groupname_col = "group")
    Condition
      Error in `gt()`:
      ! The value "group" appears in both `rowname_col` and `groupname_col`.
      * These arguments must not have any values in common.

---

    Code
      exibble %>% gt(rowname_col = "rowname", groupname_col = "rowname")
    Condition
      Error in `gt()`:
      ! The value "rowname" appears in both `rowname_col` and `groupname_col`.
      * These arguments must not have any values in common.

---

    Code
      exibble %>% dplyr::group_by(group) %>% gt(rowname_col = "group")
    Condition
      Error in `gt()`:
      ! The value "group" appears in both `rowname_col` and `groupname_col`.
      * These arguments must not have any values in common.

---

    Code
      exibble %>% dplyr::group_by(date, row) %>% gt(rowname_col = "row")
    Condition
      Error in `gt()`:
      ! The value "row" appears in both `rowname_col` and `groupname_col`.
      * These arguments must not have any values in common.

