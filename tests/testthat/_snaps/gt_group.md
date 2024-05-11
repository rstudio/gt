# The `grp_add()` function can be used to add a table to a group

    Code
      gt_tbls_3 %>% grp_add(gt_tbl_4, .after = 2, .before = 3)
    Condition
      Error in `grp_add()`:
      ! Values cannot be supplied for both `.before` and `.after`.

---

    Code
      gt_tbls_3 %>% grp_add(gt_tbl_4, .after = 0)
    Condition
      Error in `grp_add()`:
      ! The value supplied for `.after` should be a valid index.

---

    Code
      gt_tbls_3 %>% grp_add(gt_tbl_4, .after = 4)
    Condition
      Error in `grp_add()`:
      ! The value supplied for `.after` should be a valid index.

---

    Code
      gt_tbls_3 %>% grp_add(gt_tbl_4, .after = -1)
    Condition
      Error in `grp_add()`:
      ! The value supplied for `.after` should be a valid index.

---

    Code
      gt_tbls_3 %>% grp_add(gt_tbl_4, .before = 0)
    Condition
      Error in `grp_add()`:
      ! The value supplied for `.before` should be a valid index.

---

    Code
      gt_tbls_3 %>% grp_add(gt_tbl_4, .before = 4)
    Condition
      Error in `grp_add()`:
      ! The value supplied for `.before` should be a valid index.

---

    Code
      gt_tbls_3 %>% grp_add(gt_tbl_4, .before = -1)
    Condition
      Error in `grp_add()`:
      ! The value supplied for `.before` should be a valid index.

---

    Code
      gt_tbls_3 %>% grp_add(gt_tbl_4, .after = 2.01)
    Condition
      Error in `grp_add()`:
      ! An integer value should be supplied for `.after`.

---

    Code
      gt_tbls_3 %>% grp_add(gt_tbl_4, .before = 2.99)
    Condition
      Error in `grp_add()`:
      ! An integer value should be supplied for `.before`.

# The `grp_replace()` function can be used to add a table to a group

    Code
      gt_tbls_5 %>% grp_replace()
    Condition
      Error in `grp_replace()`:
      ! At least one gt table must be provided.

---

    Code
      gt_tbls_5 %>% grp_replace(gt_tbl_1, .which = 4)
    Condition
      Error in `grp_replace()`:
      ! All values provided in `.which` must be valid indices.

---

    Code
      gt_tbls_5 %>% grp_replace(gt_tbl_2, .which = 1:2)
    Condition
      Error in `grp_replace()`:
      ! The number of indices in `.which` must match the number of `gt_tbl` objects.

---

    Code
      gt_tbls_5 %>% grp_replace(gt_tbl_3, .which = 2:3)
    Condition
      Error in `grp_replace()`:
      ! The number of indices in `.which` must match the number of `gt_tbl` objects.

---

    Code
      gt_tbls_5 %>% grp_replace(gt_tbl_1, gt_tbl_2, .which = 1)
    Condition
      Error in `grp_replace()`:
      ! The number of indices in `.which` must match the number of `gt_tbl` objects.

---

    Code
      gt_tbls_5 %>% grp_replace(gt_tbl_1, gt_tbl_1, .which = 1:3)
    Condition
      Error in `grp_replace()`:
      ! The number of indices in `.which` must match the number of `gt_tbl` objects.

