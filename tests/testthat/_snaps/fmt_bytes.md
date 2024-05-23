# The `fmt_bytes()` function works correctly

    Code
      tab %>% fmt_bytes(columns = num_2, decimals = 2)
    Condition
      Error in `fmt_bytes()`:
      ! Can't select columns that don't exist.
      x Column `num_2` doesn't exist.

---

    Code
      tab %>% fmt_bytes(columns = num_2, decimals = 2, locale = "aa_bb")
    Condition
      Error in `validate_locale()`:
      ! The supplied `locale` is not available in the list of supported locales.
      * Use `info_locales()` (`?gt::info_locales()`) to see which locales can be used.

# fmt_bytes checks for n_sigfig input

    Code
      tab %>% fmt_bytes(columns = num, n_sigfig = c(1, 2))
    Condition
      Error in `fmt_bytes()`:
      ! `n_sigfig` must be a whole number, not a double vector.
    Code
      tab %>% fmt_bytes(columns = num, n_sigfig = NA)
    Condition
      Error in `fmt_bytes()`:
      ! `n_sigfig` must be a whole number, not `NA`.
    Code
      tab %>% fmt_bytes(columns = num, n_sigfig = TRUE)
    Condition
      Error in `fmt_bytes()`:
      ! `n_sigfig` must be a whole number, not `TRUE`.
    Code
      tab %>% fmt_bytes(columns = num, n_sigfig = "3")
    Condition
      Error in `fmt_bytes()`:
      ! `n_sigfig` must be a whole number, not the string "3".
    Code
      tab %>% fmt_bytes(columns = num, n_sigfig = factor(3))
    Condition
      Error in `fmt_bytes()`:
      ! `n_sigfig` must be a whole number, not a <factor> object.
    Code
      tab %>% fmt_bytes(columns = num, n_sigfig = 0L)
    Condition
      Error in `fmt_bytes()`:
      ! `n_sigfig` must be a whole number larger than or equal to 1, not the number 0.
    Code
      tab %>% fmt_bytes(columns = num, n_sigfig = -1L)
    Condition
      Error in `fmt_bytes()`:
      ! `n_sigfig` must be a whole number larger than or equal to 1, not the number -1.
    Code
      tab %>% fmt_bytes(columns = num, n_sigfig = 1.5)
    Condition
      Error in `fmt_bytes()`:
      ! `n_sigfig` must be a whole number, not the number 1.5.

