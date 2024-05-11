# the `filter_table_to_value()` function works correctly

    Code
      locales %>% filter_table_to_value(lang_desc, lang_name == "en")
    Condition
      Error in `filter_table_to_value()`:
      ! Internal error in `gt:::filter_table_to_row()`.
      * The filtered table doesn't result in a table of exactly one row.
      * Found 106 rows.

# the `get_locale_sep_mark()` function works correctly

    Code
      get_locale_sep_mark(locale = "do_IT", default = ",", use_seps = TRUE)
    Condition
      Error in `filter_table_to_value()`:
      ! Internal error in `gt:::filter_table_to_row()`.
      * The filtered table doesn't result in a table of exactly one row.
      * Found 0 rows.

# the `get_locale_dec_mark()` function works correctly

    Code
      get_locale_dec_mark(locale = "do_IT", default = ".")
    Condition
      Error in `filter_table_to_value()`:
      ! Internal error in `gt:::filter_table_to_row()`.
      * The filtered table doesn't result in a table of exactly one row.
      * Found 0 rows.

# the `split_string_2()` function works correctly

    Code
      split_string_2(x = 23432, before = "34")
    Condition
      Error in `split_string_2()`:
      ! Internal error in `gt:::paste_within()`.
      * The `x` object must be of class `character`.

---

    Code
      split_string_2(x = c("345", "234"), before = "34")
    Condition
      Error in `split_string_2()`:
      ! Internal error in `gt:::paste_within()`.
      * The length of the `x` must be exactly 1.

---

    Code
      split_string_2(x = "23432")
    Condition
      Error in `split_string_2()`:
      ! Internal error in `gt:::split_string_2()`.
      * Both `before` and `after` cannot be `NULL`.

---

    Code
      split_string_2(x = "23432", before = "3", after = "2")
    Condition
      Error in `split_string_2()`:
      ! Internal error in `gt:::split_string_2()`.
      * A value must be provided to either `before` or `after`, not both.

---

    Code
      split_string_2(x = "23432", before = 10)
    Condition
      Error in `split_string_2()`:
      ! Internal error in `gt:::split_string_2()`.
      * The numeric value provided cannot be greater than 5.

# the `paste_between()` function works correctly

    Code
      paste_between(x_2 = 1:2, "-between-")
    Condition
      Error in `paste_between()`:
      ! Internal error in `gt:::paste_between()`.
      * The `x_2` object must be of class `character`.

---

    Code
      paste_between(x_2 = c("left", "right"), 1)
    Condition
      Error in `paste_between()`:
      ! Internal error in `gt:::paste_between()`.
      * The `x` object must be of class `character`.

---

    Code
      paste_between(x_2 = "left", "between")
    Condition
      Error in `paste_between()`:
      ! Internal error in `gt:::paste_between()`.
      * The length of the `x_2` must be exactly 2.

# the `paste_on_side()` function works correctly

    Code
      paste_on_side(x = "center", x_side = "c", direction = "center")
    Condition
      Error in `paste_on_side()`:
      ! Internal error in `gt:::paste_on_side()`.
      * The `direction` must be either `left` or `right`.

# the `paste_left()` function works correctly

    Code
      paste_left(x = 1, x_left = "left")
    Condition
      Error in `paste_on_side()`:
      ! Internal error in `gt:::paste_on_side()`.
      * The `x` and `x_side` objects must be of class `character`.

---

    Code
      paste_left(x = "center", x_left = 1)
    Condition
      Error in `paste_on_side()`:
      ! Internal error in `gt:::paste_on_side()`.
      * The `x` and `x_side` objects must be of class `character`.

---

    Code
      paste_left(x = "center", x_left = c("l1", "l2", "l3"))
    Condition
      Error in `paste_on_side()`:
      ! The length of the `x_side` vector must be 1 or the length of `x`.

---

    Code
      paste_left(x = c("c1", "c2", "c3"), x_left = c("l1", "l2"))
    Condition
      Error in `paste_on_side()`:
      ! The length of the `x_side` vector must be 1 or the length of `x`.

# the `paste_right()` function works correctly

    Code
      paste_right(x = 1, x_right = "right")
    Condition
      Error in `paste_on_side()`:
      ! Internal error in `gt:::paste_on_side()`.
      * The `x` and `x_side` objects must be of class `character`.

---

    Code
      paste_right(x = "center", x_right = 1)
    Condition
      Error in `paste_on_side()`:
      ! Internal error in `gt:::paste_on_side()`.
      * The `x` and `x_side` objects must be of class `character`.

---

    Code
      paste_left(x = "center", x_right = c("r1", "r2", "r3"))
    Condition
      Error in `paste_left()`:
      ! unused argument (x_right = c("r1", "r2", "r3"))

---

    Code
      paste_left(x = c("c1", "c2", "c3"), x_right = c("r1", "r2"))
    Condition
      Error in `paste_left()`:
      ! unused argument (x_right = c("r1", "r2"))

