# the `validate_currency()` function works correctly

    Code
      lapply(c("thaler", "tetarteron"), validate_currency)
    Condition
      Error in `FUN()`:
      ! The supplied `currency` is not available in the list of supported currencies.
      * Use the `info_currencies()` (`?gt::info_currencies()`) function to see which currencies can be used.
      * See `fmt_currency()` (`?gt::fmt_currency()`) to better understand which input types are valid.

---

    Code
      lapply(c("AAA", "ZZZ"), validate_currency)
    Condition
      Error in `FUN()`:
      ! The supplied `currency` is not available in the list of supported currencies.
      * Use the `info_currencies()` (`?gt::info_currencies()`) function to see which currencies can be used.
      * See `fmt_currency()` (`?gt::fmt_currency()`) to better understand which input types are valid.

---

    Code
      lapply(c(999, 998), validate_currency)
    Condition
      Error in `FUN()`:
      ! The supplied `currency` is not available in the list of supported currencies.
      * Use the `info_currencies()` (`?gt::info_currencies()`) function to see which currencies can be used.
      * See `fmt_currency()` (`?gt::fmt_currency()`) to better understand which input types are valid.

# the `as_locations()` function works correctly

    Code
      as_locations(locations)
    Condition
      Error in `as_locations()`:
      ! The `locations` object should be a list of `cells_*()` objects.

# the `glue_gt()` function works in a safe manner

    Code
      glue_gt(lst, "{a + b}")
    Condition
      Error in `.transformer()`:
      ! object 'a + b' not found

---

    Code
      glue_gt(lst, "{print(a)}")
    Condition
      Error in `.transformer()`:
      ! object 'print(a)' not found

---

    Code
      glue_gt(lst, "{ a }")
    Condition
      Error in `.transformer()`:
      ! object ' a ' not found

---

    Code
      glue_gt(lst, "{`a`}")
    Condition
      Error in `.transformer()`:
      ! object '`a`' not found

---

    Code
      glue_gt(list(), "{z}")
    Condition
      Error in `.transformer()`:
      ! object 'z' not found

---

    Code
      glue_gt(list(), "{.Random.seed}")
    Condition
      Error in `.transformer()`:
      ! object '.Random.seed' not found

---

    Code
      glue_gt(list(), "{letters}")
    Condition
      Error in `.transformer()`:
      ! object 'letters' not found

# The `check_spanner_id_unique()` function works properly

    Code
      check_spanner_id_unique(data = gt_tbl_2, spanner_id = "a")
    Condition
      Error in `check_spanner_id_unique()`:
      ! The spanner `id` provided ("a") is not unique.
      * The `id` must be unique across existing spanner and column IDs.
      * Provide a unique ID value for this spanner.

---

    Code
      check_spanner_id_unique(data = gt_tbl_1, spanner_id = "num")
    Condition
      Error in `check_spanner_id_unique()`:
      ! The spanner `id` provided ("num") is not unique.
      * The `id` must be unique across existing spanner and column IDs.
      * Provide a unique ID value for this spanner.

---

    Code
      check_spanner_id_unique(data = gt_tbl_2, spanner_id = "num")
    Condition
      Error in `check_spanner_id_unique()`:
      ! The spanner `id` provided ("num") is not unique.
      * The `id` must be unique across existing spanner and column IDs.
      * Provide a unique ID value for this spanner.

---

    Code
      check_spanner_id_unique(data = gt_tbl_2, spanner_id = "num")
    Condition
      Error in `check_spanner_id_unique()`:
      ! The spanner `id` provided ("num") is not unique.
      * The `id` must be unique across existing spanner and column IDs.
      * Provide a unique ID value for this spanner.

---

    Code
      check_spanner_id_unique(data = gt_tbl_3, spanner_id = "row")
    Condition
      Error in `check_spanner_id_unique()`:
      ! The spanner `id` provided ("row") is not unique.
      * The `id` must be unique across existing spanner and column IDs.
      * Provide a unique ID value for this spanner.

---

    Code
      check_spanner_id_unique(data = gt_tbl_3, spanner_id = "group")
    Condition
      Error in `check_spanner_id_unique()`:
      ! The spanner `id` provided ("group") is not unique.
      * The `id` must be unique across existing spanner and column IDs.
      * Provide a unique ID value for this spanner.

