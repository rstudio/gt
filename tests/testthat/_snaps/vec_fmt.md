# The `vec_fmt_number()` function works

    Code
      vec_fmt_number(letters)
    Condition
      Error in `vec_fmt_number()`:
      ! The `vec_fmt_number()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_number(TRUE)
    Condition
      Error in `vec_fmt_number()`:
      ! The `vec_fmt_number()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_number(list(1, 2, 3))
    Condition
      Error in `vec_fmt_number()`:
      ! The `vec_fmt_number()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_number(dplyr::tibble(a = c(1, 2, 3)))
    Condition
      Error in `vec_fmt_number()`:
      ! The `vec_fmt_number()` function can only be used with numeric vectors.

# The `vec_fmt_integer()` function works

    Code
      vec_fmt_integer(letters)
    Condition
      Error in `vec_fmt_integer()`:
      ! The `vec_fmt_integer()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_integer(TRUE)
    Condition
      Error in `vec_fmt_integer()`:
      ! The `vec_fmt_integer()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_integer(list(1, 2, 3))
    Condition
      Error in `vec_fmt_integer()`:
      ! The `vec_fmt_integer()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_integer(dplyr::tibble(a = c(1, 2, 3)))
    Condition
      Error in `vec_fmt_integer()`:
      ! The `vec_fmt_integer()` function can only be used with numeric vectors.

# The `vec_fmt_scientific()` function works

    Code
      vec_fmt_scientific(letters)
    Condition
      Error in `vec_fmt_scientific()`:
      ! The `vec_fmt_scientific()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_scientific(TRUE)
    Condition
      Error in `vec_fmt_scientific()`:
      ! The `vec_fmt_scientific()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_scientific(list(1, 2, 3))
    Condition
      Error in `vec_fmt_scientific()`:
      ! The `vec_fmt_scientific()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_scientific(dplyr::tibble(a = c(1, 2, 3)))
    Condition
      Error in `vec_fmt_scientific()`:
      ! The `vec_fmt_scientific()` function can only be used with numeric vectors.

# The `vec_fmt_engineering()` function works

    Code
      vec_fmt_engineering(letters)
    Condition
      Error in `vec_fmt_engineering()`:
      ! The `vec_fmt_engineering()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_engineering(TRUE)
    Condition
      Error in `vec_fmt_engineering()`:
      ! The `vec_fmt_engineering()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_engineering(list(1, 2, 3))
    Condition
      Error in `vec_fmt_engineering()`:
      ! The `vec_fmt_engineering()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_engineering(dplyr::tibble(a = c(1, 2, 3)))
    Condition
      Error in `vec_fmt_engineering()`:
      ! The `vec_fmt_engineering()` function can only be used with numeric vectors.

# The `vec_fmt_percent()` function works

    Code
      vec_fmt_percent(letters)
    Condition
      Error in `vec_fmt_percent()`:
      ! The `vec_fmt_percent()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_percent(TRUE)
    Condition
      Error in `vec_fmt_percent()`:
      ! The `vec_fmt_percent()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_percent(list(1, 2, 3))
    Condition
      Error in `vec_fmt_percent()`:
      ! The `vec_fmt_percent()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_percent(dplyr::tibble(a = c(1, 2, 3)))
    Condition
      Error in `vec_fmt_percent()`:
      ! The `vec_fmt_percent()` function can only be used with numeric vectors.

# The `vec_fmt_partsper()` function works

    Code
      vec_fmt_partsper(letters)
    Condition
      Error in `vec_fmt_partsper()`:
      ! The `vec_fmt_partsper()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_partsper(TRUE)
    Condition
      Error in `vec_fmt_partsper()`:
      ! The `vec_fmt_partsper()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_partsper(list(1, 2, 3))
    Condition
      Error in `vec_fmt_partsper()`:
      ! The `vec_fmt_partsper()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_partsper(dplyr::tibble(a = c(1, 2, 3)))
    Condition
      Error in `vec_fmt_partsper()`:
      ! The `vec_fmt_partsper()` function can only be used with numeric vectors.

# The `vec_fmt_fraction()` function works

    Code
      vec_fmt_fraction(letters)
    Condition
      Error in `vec_fmt_fraction()`:
      ! The `vec_fmt_fraction()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_fraction(c(1, 2, 3), accuracy = 0)
    Condition
      Error in `fmt_fraction()`:
      ! The numeric value supplied for `accuracy` is invalid.
      * Must be an integer value greater than zero.

---

    Code
      vec_fmt_fraction(c(1, 2, 3), accuracy = -1)
    Condition
      Error in `fmt_fraction()`:
      ! The numeric value supplied for `accuracy` is invalid.
      * Must be an integer value greater than zero.

---

    Code
      vec_fmt_fraction(TRUE)
    Condition
      Error in `vec_fmt_fraction()`:
      ! The `vec_fmt_fraction()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_fraction(list(1, 2, 3))
    Condition
      Error in `vec_fmt_fraction()`:
      ! The `vec_fmt_fraction()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_fraction(dplyr::tibble(a = c(1, 2, 3)))
    Condition
      Error in `vec_fmt_fraction()`:
      ! The `vec_fmt_fraction()` function can only be used with numeric vectors.

# The `vec_fmt_currency()` function works

    Code
      vec_fmt_currency(c(1, 2), currency = "NOTREAL")
    Condition
      Error in `validate_currency()`:
      ! The supplied `currency` is not available in the list of supported currencies.
      * Use the `info_currencies()` (`?gt::info_currencies()`) function to see which currencies can be used.
      * See `fmt_currency()` (`?gt::fmt_currency()`) to better understand which input types are valid.

---

    Code
      vec_fmt_currency(letters)
    Condition
      Error in `vec_fmt_currency()`:
      ! The `vec_fmt_currency()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_currency(TRUE)
    Condition
      Error in `vec_fmt_currency()`:
      ! The `vec_fmt_currency()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_currency(list(1, 2, 3))
    Condition
      Error in `vec_fmt_currency()`:
      ! The `vec_fmt_currency()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_currency(dplyr::tibble(a = c(1, 2, 3)))
    Condition
      Error in `vec_fmt_currency()`:
      ! The `vec_fmt_currency()` function can only be used with numeric vectors.

# The `vec_fmt_roman()` function works

    Code
      vec_fmt_roman(c(1, 2), case = "middle")
    Condition
      Error in `vec_fmt_roman()`:
      ! `case` must be one of "upper" or "lower", not "middle".

---

    Code
      vec_fmt_roman(letters)
    Condition
      Error in `vec_fmt_roman()`:
      ! The `vec_fmt_roman()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_roman(TRUE)
    Condition
      Error in `vec_fmt_roman()`:
      ! The `vec_fmt_roman()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_roman(list(1, 2, 3))
    Condition
      Error in `vec_fmt_roman()`:
      ! The `vec_fmt_roman()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_roman(dplyr::tibble(a = c(1, 2, 3)))
    Condition
      Error in `vec_fmt_roman()`:
      ! The `vec_fmt_roman()` function can only be used with numeric vectors.

# The `vec_fmt_index()` function works

    Code
      vec_fmt_index(c(1, 2), case = "middle")
    Condition
      Error in `vec_fmt_index()`:
      ! `case` must be one of "upper" or "lower", not "middle".

---

    Code
      vec_fmt_index(letters)
    Condition
      Error in `vec_fmt_index()`:
      ! The `vec_fmt_index()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_index(TRUE)
    Condition
      Error in `vec_fmt_index()`:
      ! The `vec_fmt_index()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_index(list(1, 2, 3))
    Condition
      Error in `vec_fmt_index()`:
      ! The `vec_fmt_index()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_index(dplyr::tibble(a = c(1, 2, 3)))
    Condition
      Error in `vec_fmt_index()`:
      ! The `vec_fmt_index()` function can only be used with numeric vectors.

# The `vec_fmt_spelled_num()` function works

    Code
      vec_fmt_spelled_num(letters)
    Condition
      Error in `vec_fmt_spelled_num()`:
      ! The `vec_fmt_spelled_num()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_spelled_num(TRUE)
    Condition
      Error in `vec_fmt_spelled_num()`:
      ! The `vec_fmt_spelled_num()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_spelled_num(list(1, 2, 3))
    Condition
      Error in `vec_fmt_spelled_num()`:
      ! The `vec_fmt_spelled_num()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_spelled_num(dplyr::tibble(a = c(1, 2, 3)))
    Condition
      Error in `vec_fmt_spelled_num()`:
      ! The `vec_fmt_spelled_num()` function can only be used with numeric vectors.

# The `vec_fmt_bytes()` function works

    Code
      vec_fmt_bytes(c(1, 2), standard = "NONE")
    Condition
      Error in `vec_fmt_bytes()`:
      ! `standard` must be one of "decimal" or "binary", not "NONE".

---

    Code
      vec_fmt_bytes(letters)
    Condition
      Error in `vec_fmt_bytes()`:
      ! The `vec_fmt_bytes()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_bytes(TRUE)
    Condition
      Error in `vec_fmt_bytes()`:
      ! The `vec_fmt_bytes()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_bytes(list(1, 2, 3))
    Condition
      Error in `vec_fmt_bytes()`:
      ! The `vec_fmt_bytes()` function can only be used with numeric vectors.

---

    Code
      vec_fmt_bytes(dplyr::tibble(a = c(1, 2, 3)))
    Condition
      Error in `vec_fmt_bytes()`:
      ! The `vec_fmt_bytes()` function can only be used with numeric vectors.

