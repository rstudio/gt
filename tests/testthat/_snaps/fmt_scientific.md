# The `fmt_scientific()` function works correctly

    Code
      tab %>% fmt_scientific(columns = "num_3", decimals = 2)
    Condition
      Error in `fmt_scientific()`:
      ! Can't select columns that don't exist.
      x Column `num_3` doesn't exist.

---

    Code
      tab %>% fmt_scientific(columns = "num_2", decimals = 2, locale = "aa_bb")
    Condition
      Error in `validate_locale()`:
      ! The supplied `locale` is not available in the list of supported locales.
      * Use `info_locales()` (`?gt::info_locales()`) to see which locales can be used.

