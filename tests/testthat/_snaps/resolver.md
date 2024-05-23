# The `resolve_rows_l()` and `resolve_rows_i()` fns both work

    Code
      resolve_rows_l(rep(TRUE, 6), exibble_gt_1)
    Condition
      Error:
      ! The number of logical values must either be `1` or the number of rows.

---

    Code
      resolve_rows_l("not a row", exibble_gt_1)
    Condition
      Error:
      ! Row `not a row` does not exist in the data.

---

    Code
      resolve_rows_l(c(10, 10, 1), exibble_gt_1)
    Condition
      Error:
      ! The following row indices do not exist in the data: 10.

---

    Code
      resolve_rows_l(c("not", "present"), exibble_gt_1)
    Condition
      Error:
      ! Rows `not` and `present` do not exist in the data.

---

    Code
      resolve_rows_l(dplyr::tibble(a = 2), exibble_gt_1)
    Condition
      Error:
      ! Don't know how to select rows using a tibble.

---

    Code
      resolve_rows_i(rep(TRUE, 6), exibble_gt_1)
    Condition
      Error:
      ! The number of logical values must either be `1` or the number of rows.

---

    Code
      resolve_rows_i("not a row", exibble_gt_1)
    Condition
      Error:
      ! Row `not a row` does not exist in the data.

---

    Code
      resolve_rows_i(c(10, 10, 1), exibble_gt_1)
    Condition
      Error:
      ! The following row indices do not exist in the data: 10.

---

    Code
      resolve_rows_i(c("not", "present"), exibble_gt_1)
    Condition
      Error:
      ! Rows `not` and `present` do not exist in the data.

---

    Code
      resolve_rows_i(dplyr::tibble(a = 2), exibble_gt_1)
    Condition
      Error:
      ! Don't know how to select rows using a tibble.

# The `resolve_vector_l()` and `resolve_vector_i()` fns both work

    Code
      resolve_vector_l(rep(TRUE, 6), vector_x)
    Condition
      Error:
      ! The number of logical values must either be `1` or the number of items.

---

    Code
      resolve_vector_l("not valid", vector_x)
    Condition
      Error:
      ! Item `not valid` does not exist in the data.

---

    Code
      resolve_vector_l(c(90, 90, 1), vector_x)
    Condition
      Error:
      ! The following item indices do not exist in the data: 90.

---

    Code
      resolve_vector_l(c("not", "present"), vector_x)
    Condition
      Error:
      ! Items `not` and `present` do not exist in the data.

---

    Code
      resolve_vector_l(dplyr::tibble(a = 2), vector_x)
    Condition
      Error:
      ! Don't know how to select items using a tibble.

---

    Code
      resolve_vector_i(rep(TRUE, 6), vector_x)
    Condition
      Error:
      ! The number of logical values must either be `1` or the number of items.

---

    Code
      resolve_vector_i("not valid", vector_x)
    Condition
      Error:
      ! Item `not valid` does not exist in the data.

---

    Code
      resolve_vector_i(c(90, 90, 1), vector_x)
    Condition
      Error:
      ! The following item indices do not exist in the data: 90.

---

    Code
      resolve_vector_i(c("not", "present"), vector_x)
    Condition
      Error:
      ! Items `not` and `present` do not exist in the data.

---

    Code
      resolve_vector_i(dplyr::tibble(a = 2), vector_x)
    Condition
      Error:
      ! Don't know how to select items using a tibble.

